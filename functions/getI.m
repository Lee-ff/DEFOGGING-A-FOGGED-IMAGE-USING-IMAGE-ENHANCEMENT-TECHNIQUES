%get image matrix and its absolute path from image file
%necessary to run for any method in this folder
function [I,infile] = getI

inimage = '\Input-Images\*';
f = strcat(pwd,inimage);
[file,path] = uigetfile(f,'Select Image');
infile = strcat(path,file);
I = imread(infile);

end