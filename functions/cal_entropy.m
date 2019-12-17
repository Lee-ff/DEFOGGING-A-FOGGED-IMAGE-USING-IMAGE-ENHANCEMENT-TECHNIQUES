function e_val = cal_entropy(Y)

s = size(Y);
sz = size(s);
if sz(2)==3
    Y = rgb2gray(Y);
end

e_val = entropy(Y);

end