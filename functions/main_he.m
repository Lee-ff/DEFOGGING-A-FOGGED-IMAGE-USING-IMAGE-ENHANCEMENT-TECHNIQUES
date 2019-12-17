%main HE function

function [out,tt] = main_he(I,infile)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_he(I);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_he(I(:,:,1));
   [im(:,:,2),tt(:,2)] = code_he(I(:,:,2));
   [im(:,:,3),tt(:,3)] = code_he(I(:,:,3));
   out = uint8(im);
end

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_he');
p = strcat('\Output Images\',strcat(p2,ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist');
outhist = strcat('\Output Images\',strcat(p2,'.jpg'));
outhist = strcat(pwd,outhist);
subplot(1,1,1),imhist(out),saveas(gcf,outhist);

end

function [HE,tI] = code_he(I)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF of histogram H
pI = H/sum(H);

%CDF of histogram H
cI = cumsum(pI);

%Transformation function
tI = (1)+ round((bin-1)*cI);

%Output Image
HE = tI(I+1);
HE = uint8(HE);

end