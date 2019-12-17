function val = cal_mmbe(X,Y)

mbe = abs(mean(X)-mean(Y));
val = min(mbe);

end
