function [t] = comparison_entropy(infile)

[~,p2,ext] = fileparts(strcat(infile));
outfolder = strcat(pwd,'\Output Images\');
t=[];
%HE image
file2 = strcat(outfolder,strcat(p2,'_he'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t =[t,cal_entropy(Y)];

%BBHE image
file2 = strcat(outfolder,strcat(p2,'_bbhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

%MMBEBHE image
file2 = strcat(outfolder,strcat(p2,'_mmbebhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

%DSIHE image
file2 = strcat(outfolder,strcat(p2,'_dsihe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

end