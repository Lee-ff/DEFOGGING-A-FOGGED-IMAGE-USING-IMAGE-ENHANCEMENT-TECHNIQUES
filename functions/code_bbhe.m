%BBHE FUNCTION
%call main_bbhe
function [BBHE,tI] = code_bbhe(I)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);

%PDF 
pI = H/sum(H);

%MEAN VALUE
meanval = round(cal_mean(pI));

%IMAGE DECOMPOSITION
im_l = H(1:meanval);
im_u = H(meanval+1:bin);

%PDF OF SUBIMAGES
p_l = im_l/sum(im_l);
p_u = im_u/sum(im_u);

%CDF OF SUBIMAGES
c_l = cumsum(p_l);
c_u = cumsum(p_u);

%Transformation Function
tI(1:meanval) = (1) + round((meanval-1)*c_l);
tI(meanval+1:bin) = (meanval+1) + round((bin-meanval+1)*c_u);
tI = tI.';

%Output Image
BBHE = tI(I+1);
BBHE = uint8(BBHE);

end