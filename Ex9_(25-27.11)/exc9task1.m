%% 1. Histogram Equalization for Color Images
% a) Load the image fruits.jpg and apply MATLAB built-in histogram equalization independently on each
% of R, G, and B components. (histeq)
% clc, clear
% I = imread('fruits.jpg');
% Ired=I(:,:,1);
% Igreen=I(:,:,2);
% 
% figure(1)
% Iblue=I(:,:,3); 
% subplot(3,1,1); % histeq(Ired);
% subplot(3,1,2); % histeq(Igreen);
% subplot(3,1,3); % histeq(Iblue);
% Icat=cat(3,histeq(Ired),histeq(Igreen),histeq(Iblue));
% 
% figure(2)
% subplot(311); imshow(I);
% subplot(312); imshow(Icat);
% % Ihsv=rgb2hsv(I);
% Ihsv(:,:,3)=histeq(Ihsv(:,:,3));
% % Ihsv=hsv2rgb(Ihsv);
% subplot(313); imshow(Ihsv);

clc, clear
I = imread('fruits.jpg');
Y = imread('festia.jpg');
intensityeq(I,Y)