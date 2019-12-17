function f = hist_wgh(pdf,pmax,pmin,beta)

denum=pmax-pmin;
pdfw = pdf;
alpha = sum(pdf);
for i=1:size(pdf,1)
    num=pdf(i)-pmin;
    pdfw(i)=pmax*((num/denum)^(alpha))+beta;
end

f = pdfw;