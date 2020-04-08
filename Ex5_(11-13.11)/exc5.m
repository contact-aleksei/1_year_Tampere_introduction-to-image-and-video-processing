%% 1. Laplacian filter with high-boost filtering
clear all, close all
I = imread('cameraman.tif');
[m n]=size(I)
figure(1)
subplot (2,2,1); imshow(I);
title('Original, here we use CONVOLUTION');
% Create a Laplacian kernel of size 3x3 with the center values A = {8, 9, 9.7}. 
kernel_1 = -1 * ones(3);
kernel_1(2,2) = 8; 
% Now kernel_1 = [-1 -1 -1 
%                 -1  8 -1
%                 -1 -1 -1]

output1 = conv2(I, kernel_1, 'same');
subplot (2,2,2); imshow(uint8(output1));
title('8');

kernel_2 = -1 * ones(3);
% kernel_2 =  zeros(3);
% kernel_2(1,1)=-9/4; kernel_2(1,3)=-9/4;
% kernel_2(3,1)=-9/4; kernel_2(3,3)=-9/4;
kernel_2(2,2) = 9;
% Now kernel_1 = [-1 -1 -1  
%                  0    9  0 
%                 -1 -1 -1  ]
output2 = conv2(double(I), kernel_2, 'same');
subplot (2,2,3); imshow(uint8(output2));
title('9');

kernel_3 = -1*ones(3);
% kernel_3(1,1)=-1.7/4; kernel_3(1,3)=-1.7/4;
% kernel_3(3,1)=-1.7/4; kernel_3(3,3)=-1.7/4;
kernel_3(2,2) = 9.7;
% Now kernel_1 = [-1.7/4  -2   -1.7/4 
%                 -2      9.7  -2
%                 -1.7/4  -2   -1.7/4]
output3 = conv2(double(I), kernel_3, 'same');
subplot (2,2,4); imshow(uint8(output3));
title('9.7');

figure(2)
subplot (2,2,1); imshow(I);
title('Original, here we use IMFILTER');
subplot (2,2,2); imshow(imfilter(I,kernel_1));
title('8');
subplot (2,2,3); imshow(imfilter(I,kernel_2));
title('9');
subplot (2,2,4); imshow(imfilter(I,kernel_3));
title('9.7');


%% 2. Directional filtering
% a. Load “cameraman.tif” and add random white noise with maximum intensity of 10. Display the
% original and the noisy images in the same figure.
clear all, close all
I = imread('cameraman.tif');
figure(1)
subplot (2,2,1); imshow(I);

[m n]= size(I);
noisy = uint8( (randi([0 10], m,n) )  );
Inoisy=I+noisy;
Inoisy=uint8(Inoisy);
subplot (2,2,2); imshow(Inoisy);
subplot (2,2,3); imshow(uint8(noisy));
title('noise');
subplot (2,2,4); imhist(noisy);

% st_dev = 30;
% mean = 100;
% NDnoise = uint8(st_dev.*rand(m,n) + mean);
% stats = [mean(NDnoise) std(NDnoise) var(NDnoise)
figure(2)
subplot (2,2,1); imshow(I);
subplot (2,2,2); imhist(I);
subplot (2,2,3); imshow( imnoise(I,'gaussian'));
subplot (2,2,4); imhist( imnoise(I,'gaussian'));

% directional filtering
I = imread('cameraman.tif');
k=7;
directional_filtering(I,k);

%% 3. Threshold Median Filtering
clear;clc;
I = imread('miranda1.tif');
kernel_size=5;
Inoisy=I;
for i=[150:250]
    for j=[150:250]
        noise=randi([0 33]);
        Inoisy(i,j)=I(i,j)+noise;
    end
end

filtered = med_filter(Inoisy,kernel_size);

figure(1);
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(Inoisy);
subplot(1,3,3); imshow(filtered);

figure(2);
thrfiltered = thre_med_filter(Inoisy,kernel_size);
subplot(1,3,1); imshow(I);
subplot(1,3,2); imshow(Inoisy);
subplot(1,3,3); imshow(thrfiltered);



