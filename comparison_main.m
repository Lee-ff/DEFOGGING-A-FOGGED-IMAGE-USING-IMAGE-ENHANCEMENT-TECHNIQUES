function [file1,t_ambe,t_psnr,t_ssi,t_entropy] = comparison_main

inimage = '\Input-Images\*';
f = strcat(pwd,inimage);
[file1,path] = uigetfile(f,'Select Image','MultiSelect','on');
imfile = strcat(path,file1);
imfile = char(imfile);
t_ambe=[];
t_psnr=[];
t_ssi=[];
t_entropy=[];

for i=1:size(imfile,1)
    infile = imfile(i,:);
    [t1,t2,t3,t4]=comparison_all(infile);
    t_ambe=[t_ambe;t1];
    t_psnr=[t_psnr;t2];
    t_ssi=[t_ssi;t3];
    t_entropy=[t_entropy;t4]; 
end

file1=[file1,{'AVERAGE'}];

if size(file1,2)>2
    t_ambe=[t_ambe;mean(t_ambe)];
    t_psnr=[t_psnr;mean(t_psnr)];
    t_ssi=[t_ssi;mean(t_ssi)];
    t_entropy=[t_entropy;mean(t_entropy)];
else
    t_ambe=[t_ambe;t_ambe];
    t_psnr=[t_psnr;t_psnr];
    t_ssi=[t_ssi;t_ssi];
    t_entropy=[t_entropy;t_entropy];
end
end

function [t_ambe,t_psnr,t_ssi,t_entropy] = comparison_all(infile)

t_ambe = comparison_ambe(infile);
t_psnr = comparison_psnr(infile);
t_ssi = comparison_ssi(infile);
t_entropy = comparison_entropy(infile);

end

function [t] = comparison_ambe(infile)

X = imread(infile);
[~,p2,ext] = fileparts(strcat(infile));
outfolder = strcat(pwd,'\Output Images\');
t=[];
%HE image
file2 = strcat(outfolder,strcat(p2,'_he'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t =[t,cal_ambe(X,Y)];

%BBHE image
file2 = strcat(outfolder,strcat(p2,'_bbhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%MMBEBHE image
file2 = strcat(outfolder,strcat(p2,'_mmbebhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%DSIHE image
file2 = strcat(outfolder,strcat(p2,'_dsihe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%RMSHE
file2 = strcat(outfolder,strcat(p2,'_rmshe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%RSIHE
file2 = strcat(outfolder,strcat(p2,'_rsihe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%RSWHE-MEAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_m__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

%RSWHE-MEDIAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_d__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ambe(X,Y)];

end

function [t] = comparison_psnr(infile)

X = imread(infile);
[~,p2,ext] = fileparts(strcat(infile));
outfolder = strcat(pwd,'\Output Images\');
t=[];
%HE image
file2 = strcat(outfolder,strcat(p2,'_he'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t =[t,cal_psnr(X,Y)];

%BBHE image
file2 = strcat(outfolder,strcat(p2,'_bbhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%MMBEBHE image
file2 = strcat(outfolder,strcat(p2,'_mmbebhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%DSIHE image
file2 = strcat(outfolder,strcat(p2,'_dsihe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%RMSHE
file2 = strcat(outfolder,strcat(p2,'_rmshe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%RSIHE
file2 = strcat(outfolder,strcat(p2,'_rsihe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%RSWHE-MEAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_m__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

%RSWHE-MEDIAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_d__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_psnr(X,Y)];

end

function [t] = comparison_ssi(infile)

X = imread(infile);
[~,p2,ext] = fileparts(strcat(infile));
outfolder = strcat(pwd,'\Output Images\');
t=[];
%HE image
file2 = strcat(outfolder,strcat(p2,'_he'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t =[t,cal_ssi(X,Y)];

%BBHE image
file2 = strcat(outfolder,strcat(p2,'_bbhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%MMBEBHE image
file2 = strcat(outfolder,strcat(p2,'_mmbebhe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%DSIHE image
file2 = strcat(outfolder,strcat(p2,'_dsihe'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%RMSHE
file2 = strcat(outfolder,strcat(p2,'_rmshe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%RSIHE
file2 = strcat(outfolder,strcat(p2,'_rsihe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%RSWHE-MEAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_m__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

%RSWHE-MEDIAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_d__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_ssi(X,Y)];

end

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

%RMSHE
file2 = strcat(outfolder,strcat(p2,'_rmshe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

%RSIHE
file2 = strcat(outfolder,strcat(p2,'_rsihe_r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

%RSWHE-MEAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_m__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

%RSWHE-MEDIAN
file2 = strcat(outfolder,strcat(p2,'_rswhe_d__r=2'));
outfile = strcat(file2,ext);
Y = imread(outfile);
t=[t,cal_entropy(Y)];

end

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

function e_val = cal_entropy(Y)

s = size(Y);
sz = size(s);
if sz(2)==3
    Y = rgb2gray(Y);
end

e_val = entropy(Y);

end

function peaksnr = cal_psnr(X,Y)

peaksnr = psnr(Y,X);

end

function ssi = cal_ssi(X,Y)

ssi = ssim(Y,X);

end