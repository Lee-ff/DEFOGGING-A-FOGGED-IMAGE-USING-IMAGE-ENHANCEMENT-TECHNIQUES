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