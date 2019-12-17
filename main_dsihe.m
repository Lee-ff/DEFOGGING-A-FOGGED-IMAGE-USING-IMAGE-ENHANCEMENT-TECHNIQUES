%main DSIHE function

function [out,tt] = main_dsihe(I,infile)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_dsihe(I);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_dsihe(I(:,:,1));
   [im(:,:,2),tt(:,2)] = code_dsihe(I(:,:,2));
   [im(:,:,3),tt(:,3)] = code_dsihe(I(:,:,3));
   out = uint8(im -1);
end

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_dsihe');
p = strcat('\Output Images\',strcat(p2,ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist');
outhist = strcat('\Output Images\',strcat(p2,'.jpg'));
outhist = strcat(pwd,outhist);
subplot(1,1,1),imhist(out),saveas(gcf,outhist);

end

function med_i = cal_med(cI)

least = 1;
sz = size(cI);
val = cI(sz(1))+cI(sz(2));
bin = abs(sz(1)-sz(2))+1;
for i=1:bin
    if(abs(cI(i)-val/2)<least)
        least = abs(cI(i)-val/2);
        med_i = i;
    end
end

end

function [DSIHE,tI] = code_dsihe(I)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

%CDF
cI = cumsum(pI);

%MEDIAN VALUE
medianval = cal_med(cI);

%IMAGE DECOMPOSITION
im_l = H(1:medianval);
im_u = H(medianval+1:bin);

%PDF OF SUBIMAGES
p_l = im_l/sum(im_l);
p_u = im_u/sum(im_u);

%CDF OF SUBIMAGES
c_l = cumsum(p_l);
c_u = cumsum(p_u);

%Transformation Function
tI(1:medianval) = (1) + round((medianval-1)*c_l);
tI(medianval+1:bin) = (medianval+1) + round((bin-medianval+1)*c_u);
tI = tI.';

%Output Image
DSIHE = tI(I+1);
DSIHE = uint8(DSIHE);

end