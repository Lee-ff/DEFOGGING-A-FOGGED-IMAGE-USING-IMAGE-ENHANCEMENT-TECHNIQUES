function ambe = cal_ambe(X,Y)

s = size(Y);
sz = size(s);
if sz(2)==3
    X = rgb2gray(X);
    Y = rgb2gray(Y);
end
ambe = mean(mean(X))-mean(mean(Y));
ambe = abs(ambe);

end
