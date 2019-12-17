function [] = main

inimage = '\Input-Images\*';
f = strcat(pwd,inimage);
[file,path] = uigetfile(f,'Select Image','MultiSelect','on');
imfile = strcat(path,file);
imfile = char(imfile);

for i=1:size(imfile,1)
    infile = imfile(i,:);
    I = imread(infile);
    all_he(I,infile);
end

end

function [] = all_he(I,infile)

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

end