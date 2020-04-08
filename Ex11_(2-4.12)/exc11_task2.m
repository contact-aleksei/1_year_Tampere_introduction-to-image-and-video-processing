%% 2. Chrominance subsampling
clear, clc
I = imread('lena.tiff');
Iycbcr = rgb2ycbcr(I);
% Display Y, Cb and Cr in a 1x3 subplot.
figure(1)
subplot(1,3,1); imshow(Iycbcr(:,:,1));
subplot(1,3,2); imshow(Iycbcr(:,:,2));
subplot(1,3,3); imshow(Iycbcr(:,:,3));
% b) Perform subsampling of the chrominance components:
% 4:2:2, 4:1:1, 4:2:0. Separately also perform subsampling on the luminance
% component, following the format 4:2:0.
y=Iycbcr(:,:,1); cb=Iycbcr(:,:,2); cr=Iycbcr(:,:,3);
% 4:2:2
cb=cb(:,1:2:end);            cb=repelem(cb,1,2);
cr=cr(:,1:2:end);            cr=repelem(cr,1,2);
Iycbcr422=cat(3,y,cb,cr);    RGB422=ycbcr2rgb(Iycbcr422);
% 4:1:1
cb=cb(:,1:4:end);            cb=repelem(cb,1,4);
cr=cr(:,1:4:end);            cr=repelem(cr,1,4);
Iycbcr411=cat(3,y,cb,cr);    RGB411=ycbcr2rgb(Iycbcr411);
% 4:2:0
cb=cb(1:2:end,1:2:end);      cb=repelem(cb,2,2);
cr=cr(1:2:end,1:2:end);      cr=repelem(cr,2,2);
Iycbcr420=cat(3,y,cb,cr);    RGB420=ycbcr2rgb(Iycbcr420);

% 4:2:0 Y-component
y=y(1:4:end,1:4:end);        y=repelem(y,4,4);
Iycbcr420Y=cat(3,y,cb,cr);   RGB420Y=ycbcr2rgb(Iycbcr420Y);

figure(2)
subplot(1,4,1); imshow(RGB422);  immse(I,RGB422)
subplot(1,4,2); imshow(RGB411);  immse(I,RGB411)
subplot(1,4,3); imshow(RGB420);  immse(I,RGB420)
subplot(1,4,4); imshow(RGB420Y); immse(I,RGB420Y)




% % c) Upsample the same components back to the original resolution (imresize), recombine them
% % and convert the images back to RGB (ycbcr2rgb). Show the five RGB images (the original
% % and 4 subsampled ones) together on a subplot. Is there a perceptible difference?
% % d) Calculate the mean squared error values of the subsampled images with respect to the original
% % (immse). Does the result support you previous conclusion?



