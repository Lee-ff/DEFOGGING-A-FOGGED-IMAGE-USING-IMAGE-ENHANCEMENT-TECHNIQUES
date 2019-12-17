%writing output to Output Images folder
function outfile = writeI(out,infile)

[p1,p2,ext] = fileparts(strcat(infile));
outfolder = strcat(pwd,'\Output Images\');
file = strcat('out_',strcat(p2,ext));
outfile = strcat(outfolder,file);
imwrite(out,outfile);

end