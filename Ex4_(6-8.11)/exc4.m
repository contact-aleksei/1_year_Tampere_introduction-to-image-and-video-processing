%% 1. Image Enhancement Intensity Transformations
% The focus of this part is to experiment with intensity transformations to enhance an image. Download
% the image university.png and enhance it using:
clear all, close all
I = imread('university.png');
subplot (3,1,1); imshow(I);
I = double(I);

% (a) The log transformation
c=50;
I1 = uint8(c*log(1+I));
subplot (3,1,2); imshow(I1);

%(b) a power-law transformation
c=7, gamma=0.9;
I2 = uint8(c*I.^gamma);
subplot (3,1,3); imshow(I2);

%% 2. Histogram Equalization
% Implement your own histogram equalization function in a file histequal.m. Perform histogram
% equalization on the images (moon.png, house.png, spine.jpg, church.png) by your OWN method.
% Compare the histograms and images before and after processing. (for loops are allowed. !Do not
% use MATLAB histeq function!). Compare outputs to the ContrastStretch results (Matlab
% code for ContrastStretch is provided).
clear all, close all
moon= imread('moon.png') ; house =imread('house.png') ;
spine=imread('spine.jpg'); church=imread('church.png');
moon=double(moon);         house=double(house); 
spine=double(spine);       church=double(church);

%  ContrastStretch(moon,  1, 255)
%  ContrastStretch(house, 33, 250)
%  ContrastStretch(spine, 50, 255)
%  ContrastStretch(church, 0, 250)

% Histequal(moon)
% Histequal(moon)
% Histequal(moon)

Histequal(moon)
Histequal(house)
Histequal(spine)
Histequal(church)

%% 3. Histogram Matching
% Implement a function that will apply histogram matching from image A to image B. You can use
% simple interpolation, if necessary. (see http://en.wikipedia.org/wiki/Histogram_matching)
% Use corel.png as A and (spine.jpg or church.png) as image B. What can you observe?
 
clear all, close all
corel=imread('corel.png'); spine=imread('spine.jpg');
Aimage=corel; Bimage=spine; 
Matchingfunction (Aimage,Bimage); 



