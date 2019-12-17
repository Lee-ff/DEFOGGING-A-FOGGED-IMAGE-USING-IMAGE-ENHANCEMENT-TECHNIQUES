%RSWHE FUNCTION
%call main_rswhe
function [RSWHE,tI] = code_rswhe(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);
P = H/sum(H);

if r<0
    disp('error... r must be a non-negative integer\n');
else
    for i=1:pow2(r)
        a = 1+(i-1)*(bin/pow2(r));
        b = i*(bin/pow2(r));
        wP = hist_wgh(P(a:b),max(P),min(P),0.001);
        cI = cumsum(wP);
        tI(a:b) = (1)+ round((bin-1)*cI);
    end
    
    %Transformation function
    tI = tI.';
    
    %Output Image
    RSWHE = tI(I+1);
    RSWHE = uint8(RSWHE);
end

end

