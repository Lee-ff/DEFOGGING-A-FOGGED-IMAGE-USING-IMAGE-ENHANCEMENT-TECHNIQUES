%DSIHE FUNCTION
%call main_dsihe
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