%rmshe for r=2
function [out,tt] = main_rmshe(I,infile,r)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_rmshe(I,r);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_rmshe(I(:,:,1),r);
   [im(:,:,2),tt(:,2)] = code_rmshe(I(:,:,2),r);
   [im(:,:,3),tt(:,3)] = code_rmshe(I(:,:,3),r);
   out = uint8(im -1);
end

r1=int2str(r);
r1=strcat('_r=',r1);

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_rmshe');
p = strcat('\Output Images\',strcat(strcat(p2,r1),ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist');
outhist = strcat('\Output Images\',strcat(strcat(p2,r1),'.jpg'));
outhist = strcat(pwd,outhist);
subplot(1,1,1),imhist(out),saveas(gcf,outhist);

end

function val = cal_mean(pI)

num = 0;
sz = size(pI);
bin = abs(sz(1)-sz(2))+1;
for i=1:bin
    num = num + i*pI(i);
end

val = num/sum(pI);

end

function [RMSHE,tI] = code_rmshe(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

if r==1
   [RMSHE,tI] = code_bbhe(I); 
elseif r==2
    f(1) = 1;
    f(3) = round(cal_mean(pI));
    f(2) = round(cal_mean(pI(f(1):f(3))));
    f(4) = round(cal_mean(pI(f(3):end)));
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
RMSHE = tI(I+1);
RMSHE = uint8(RMSHE);

end