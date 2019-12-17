%BASIC HE FUNCTION
%call main_he
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