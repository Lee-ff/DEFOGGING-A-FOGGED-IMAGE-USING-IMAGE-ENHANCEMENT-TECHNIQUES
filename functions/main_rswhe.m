function [out,tt] = main_rswhe(I,infile,r)

%checking if image is color or grayscale
s = size(I);
sz = size(s);

if sz(2)==2
    [out,tt] = code_rswhe(I,r);
    out = uint8(out);
elseif sz(2)==3
   im = zeros(s(1),s(2),3);
   [im(:,:,1),tt(:,1)] = code_rswhe(I(:,:,1),r);
   [im(:,:,2),tt(:,2)] = code_rswhe(I(:,:,2),r);
   [im(:,:,3),tt(:,3)] = code_rswhe(I(:,:,3),r);
   out = uint8(im);
end

%writing output to Output Images folder
[p1,p2,ext] = fileparts(strcat(infile));
p2 = strcat(p2,'_rswhe_');
p2 = strcat(p2,int2str(r));
p = strcat('\Output Images\',strcat(p2,ext));
outfile = strcat(pwd,p);
imwrite(out,outfile);

p2 = strcat(p2,'_hist_');
p2 = strcat(p2,int2str(r));
outhist = strcat('\Output Images\',strcat(p2,'.jpg'));
outhist = strcat(pwd,outhist);
subplot(1,1,1),imhist(out),saveas(gcf,outhist);

end

function [RSWHE,tI] = code_rswhe(I,r)

%Histogram of Input Image (I)
H = imhist(I);
bin = size(H,1);
P = H/sum(H);

if r<0
    disp('error... r must be a non-negative integer\n');
else
    for i=1:pow2(r)
        a = 1+(i-1)*(bin/pow2(r));
        b = i*(bin/pow2(r));
        wP = hist_wgh(P(a:b),max(P),min(P),0.001);
        cI = cumsum(wP);
        tI(a:b) = (1)+ round((bin-1)*cI);
    end
    
    %Transformation function
    tI = tI.';
    
    %Output Image
    RSWHE = tI(I+1);
    RSWHE = uint8(RSWHE);
end

end