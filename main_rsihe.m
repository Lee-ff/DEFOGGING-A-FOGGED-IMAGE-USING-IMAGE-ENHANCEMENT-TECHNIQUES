function [out,tt] = main_rsihe(I,infile,r)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_rsihe(I,r);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_rsihe(I(:,:,1),r);
   [im(:,:,2),tt(:,2)] = code_rsihe(I(:,:,2),r);
   [im(:,:,3),tt(:,3)] = code_rsihe(I(:,:,3),r);
   out = uint8(im -1);
end

r1=int2str(r);
r1=strcat('_r=',r1);

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_rsihe');
p = strcat('\Output Images\',strcat(strcat(p2,r1),ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist');
outhist = strcat('\Output Images\',strcat(strcat(p2,r1),'.jpg'));
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

function [RSIHE,tI] = code_rsihe(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

%CDF
cI = cumsum(pI);

if r==1
   [RSIHE,tI] = code_dsihe(I); 
elseif r==2
    f(1) = 1;
    f(3) = round(cal_med(cI));
    f(2) = round(cal_med(cI(f(1):f(3))));
    f(4) = round(cal_med(cI(f(3):end)));
    f(5) = 256;
    for i=1:pow2(r)
        a = f(i);b = f(i+1);
        P = pI(a:b);
        cI = cumsum(P);
        tI(a:b) = (a)+ round((b-a)*cI);
    end
else
    disp('r value should be 1 or 2 only...');
end



%Transformation Function
tI = tI.';

%Output Image
RSIHE = tI(I+1);
RSIHE = uint8(RSIHE);

end