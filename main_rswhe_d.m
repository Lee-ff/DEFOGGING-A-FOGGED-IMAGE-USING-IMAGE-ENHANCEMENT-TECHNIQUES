function [out,tt] = main_rswhe_d(I,infile,r)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_rswhe_d(I,r);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_rswhe_d(I(:,:,1),r);
   [im(:,:,2),tt(:,2)] = code_rswhe_d(I(:,:,2),r);
   [im(:,:,3),tt(:,3)] = code_rswhe_d(I(:,:,3),r);
   out = uint8(im);
end

r1=int2str(r);
r1=strcat('_r=',r1);

%writing output to Output Images folder
[~,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_rswhe_d_');
p = strcat('\Output Images\',strcat(strcat(p2,r1),ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist_');
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

function [RSWHE,tI] = code_rswhe_d(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);
P = H/sum(H);
f = [1,256];
C = cumsum(P);
if r==1
    f(1) = 1;
    f(2) = round(cal_med(C));
    f(3) = 256;
elseif r==2
    f(1) = 1;
    f(3) = round(cal_med(C));
    f(2) = round(cal_med(C(f(1):f(3))));
    f(4) = round(cal_med(C(f(3):end)));
    f(5) = 256;
else
    disp('value of r should be 1 or 2');
end

if size(f,2)>2
    for i=1:pow2(r)
        a = f(i);b = f(i+1);
        P1 = P(a:b);
        wP = hist_wgh(P1,max(P1),min(P1),0.001);
        cI = cumsum(wP);
        tI(a:b) = (a)+ round((b-a)*cI);
    end
    
    %Transformation function
    tI = tI.';
    
    %Output Image
    RSWHE = tI(I+1);
    RSWHE = uint8(RSWHE);
end

end