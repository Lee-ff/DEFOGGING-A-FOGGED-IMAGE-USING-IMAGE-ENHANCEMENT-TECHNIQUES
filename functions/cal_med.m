function med_i = cal_med(cI)

least = 1;
sz = size(cI);
val = cI(sz(1))+cI(sz(2));
bin = abs(sz(1)-sz(2))+1;
for i=1:bin
    if(abs(cI(i)-val/2)<least)
        least = abs(cI(i)-val/2);
        med_i = i;
    end
end

end