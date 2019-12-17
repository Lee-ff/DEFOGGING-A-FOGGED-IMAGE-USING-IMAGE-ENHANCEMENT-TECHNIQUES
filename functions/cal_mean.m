function val = cal_mean(pI)

num = 0;
sz = size(pI);
bin = abs(sz(1)-sz(2))+1;
for i=1:bin
    num = num + i*pI(i);
end

val = num/sum(pI);

end
