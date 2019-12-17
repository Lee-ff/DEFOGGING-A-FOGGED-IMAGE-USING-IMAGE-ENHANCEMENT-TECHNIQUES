function [] = main_1
[I,infile] = getI();
r = input('Enter value of recurion level(r) ::: ');
out_rswhe = main_rswhe(I,infile,r);

[inpath,file,ext] = fileparts(infile);
file = strcat(file,'.jpg');
outpath = 'Output Images\';

s1 = I; s2 = out_rswhe; s3 = strcat('zRSWHE_',strcat("(r=",strcat(int2str(r),")"))); 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

end