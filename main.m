function [] = main

r = input('Enter recursion level value(either 1 or 2)::: ');
inimage = '\Input-Images\*';
f = strcat(pwd,inimage);
[file,path] = uigetfile(f,'Select Image','MultiSelect','on');
imfile = strcat(path,file);
imfile = char(imfile);

for i=1:size(imfile,1)
    infile = imfile(i,:);
    I = imread(infile);
    all_he(I,infile,r);
end

end

function [] = all_he(I,infile,r)

[~,file,~] = fileparts(infile);
file = strcat(file,'.jpg');
outpath = 'Output Images\';

%HE image
out_he = main_he(I,infile);
s1 = I; s2 = out_he; s3 = 'zHE_'; 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%BBHE image
out_bbhe = main_bbhe(I,infile);
s1 = I; s2 = out_bbhe; s3 = 'zBBHE_'; 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%MMBEBHE image
out_mmbebhe = main_mmbebhe(I,infile);
s1 = I; s2 = out_mmbebhe; s3 = 'zMMBEBHE_'; 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%DSIHE image
out_dsihe = main_dsihe(I,infile);
s1 = I; s2 = out_dsihe; s3 = 'zDSIHE_'; 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

r1=int2str(r);
r1=strcat('r=',r1);
r1=strcat(r1,'_');

%RMSHE
out_rmshe = main_rmshe(I,infile,r);
s1 = I; s2 = out_rmshe; s3 = strcat('zRMSHE_',r1); 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%RSIHE
out_rsihe = main_rsihe(I,infile,r);
s1 = I; s2 = out_rsihe; s3 = strcat('zRSIHE_',r1); 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%RSWHE-MEAN
out_rswhe_m = main_rswhe_m(I,infile,r);
s1 = I; s2 = out_rswhe_m; s3 = strcat('zRSWHE_M_',r1); 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

%RSWHE-MEDIAN
out_rswhe_d = main_rswhe_d(I,infile,r);
s1 = I; s2 = out_rswhe_d; s3 = strcat('zRSWHE_D_',r1); 
f1 = showI(s1,s2,s3);
saveas(f1,strcat(outpath,strcat(s3,file)));

end