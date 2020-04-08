%% 1. Noise generation and restoration
clear all, close all
I = imread('lena.jpg');
[height width]=size(I);
[m n]=size(I);
figure (1);
subplot (2,2,1); imshow(I);
title('original');

subplot (2,2,2);
J1 = imnoise(I,'gaussian',0.1); % m=0.1 adds Gaussian white noise with mean m and variance of 0.01.
imshow(J1);title('gaussian');

D=0.005;% Density
% For 'salt & pepper' noise, D must be a real nonnegative scalar less than or equal to 1.
J2 = imnoise(I,'salt & pepper',D);
subplot (2,2,3); imshow(J2);
title('salt & pepper');

b=5000;
noise = sqrt(-b*log10((1-rand(height,width))));
J3 = double(I) + noise;
subplot (2,2,4); imshow(uint8(J3));
title('rayleigh');


% 2. Restoration of Noisy Images
m=5; n=5, eps =2;
% a) Arithmetic mean filter:
fA = imfilter(J1,fspecial('average',[m n]));
% b) Geometric mean filter:MATLAB:
fM = exp(imfilter(log(double(J1)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(J1) + eps), ones(m, n), 'replicate');
figure(2)
subplot (2,2,1); imshow(J1); title('gaussian');
subplot (2,2,2); imshow(uint8(fA)); title('arithmetic');
subplot (2,2,3); imshow(uint8(fM)); title('geometric');
subplot (2,2,4); imshow(uint8(fH)); title('harmonic');




% a) Arithmetic mean filter:
fA = imfilter(J2,fspecial('average',[m n]));
% b) Geometric mean filter:MATLAB:
fM = exp(imfilter(log(double(J2)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(J1) + eps), ones(m, n), 'replicate');
figure(3)
subplot (2,2,1); imshow(J2); title('salt & pepper');
subplot (2,2,2); imshow(uint8(fA)); title('arithmetic');
subplot (2,2,3); imshow(uint8(fM)); title('geometric');
subplot (2,2,4); imshow(uint8(fH)); title('harmonic');


% a) Arithmetic mean filter:
fA = imfilter(J3,fspecial('average',[m n]));
% b) Geometric mean filter:MATLAB:
fM = exp(imfilter(log(double(J3)),ones(m,n),'replicate')).^(1/(m*n));
% c) Harmonic mean filter:
fH = (m*n) ./ imfilter(1 ./ (double(J1) + eps), ones(m, n), 'replicate');
figure(4)
subplot (2,2,1); imshow(uint8(J3)); title('rayleigh');
subplot (2,2,2); imshow(uint8(fA)); title('arithmetic');
subplot (2,2,3); imshow(uint8(fM)); title('geometric');
subplot (2,2,4); imshow(uint8(fH)); title('harmonic');

%% 3. Noise cleaning with Weighted Median Filter
clear all, close all
I = imread('baboon.png');
[height width]=size(I);
D=0.02;% Density
% For 'salt & pepper' noise, D must be a real nonnegative scalar less than or equal to 1.
J2 = imnoise(I,'salt & pepper',D);
figure(1)
imshow(uint8(J2));

subplot (2,2,1);
imshow(uint8(I));
n=5;

FUN=@(x)  median(x(:));
% x is an input;

out=nlfilter(J2,[n n], FUN);
subplot (2,2,2);
imshow(uint8(out));
title('median filter');

W=ones(5);
W(3,3)=5;

FUN=@(x)  median(repelem(x(:),W(:)));
out=nlfilter(J2,[n n], FUN);
subplot (2,2,3);
imshow(out);
title('Weighted Median Filter');