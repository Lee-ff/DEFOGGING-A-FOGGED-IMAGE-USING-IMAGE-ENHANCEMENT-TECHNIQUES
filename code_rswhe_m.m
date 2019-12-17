function [RSWHE,tI] = code_rswhe_m(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);
P = H/sum(H);
f = [1,256];

if r==1
    f(1) = 1;
    f(2) = round(cal_mean(P));
    f(3) = 256;
elseif r==2
    f(1) = 1;
    f(3) = round(cal_mean(P));
    f(2) = round(cal_mean(P(f(1):f(3))));
    f(4) = round(cal_mean(P(f(3):end)));
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