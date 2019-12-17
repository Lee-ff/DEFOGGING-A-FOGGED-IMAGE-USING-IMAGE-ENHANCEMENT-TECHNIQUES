function f = showI(I,out,mainTitle)

f = figure('Name',mainTitle,'NumberTitle','off');
subplot(2,2,1),imshow(I),title('Input Image')
subplot(2,2,2),imhist(I),title('Input Histogram')
subplot(2,2,3),imshow(out),title('Output Image')
subplot(2,2,4),imhist(out),title('Output Histogram')

end