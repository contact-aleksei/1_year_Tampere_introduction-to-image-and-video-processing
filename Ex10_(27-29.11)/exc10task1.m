%% 1. Histogram Equalization for Color Images
% a) Load the image fruits.jpg and apply MATLAB built-in histogram equalization independently on each
% of R, G, and B components. (histeq)
clc, clear
cheetah  =imread('cheetah.jpg');
chameleon=imread('chameleon.jpg');
dist=40;

I=cheetah;
SmaskRGBimage=sliceCube(I,dist);

I=chameleon;
CmaskRGBimage=sliceSphere(I,dist);

figure(1);
subplot(1,3,1);
imshow(I);
subplot(1,3,2);
imshow(SmaskRGBimage);
subplot(1,3,3);
imshow(CmaskRGBimage);