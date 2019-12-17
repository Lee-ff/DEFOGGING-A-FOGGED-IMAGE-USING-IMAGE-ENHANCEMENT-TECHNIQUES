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