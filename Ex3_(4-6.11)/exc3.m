%% first task
% 1. Pixel operation
% a) Load the ‘wom1.png’ image. Construct your own histogram with 256 bins and display it in a
% figure. Avoid using imhist, hist or other built-in Matlab functions dealing with image
% histograms. You are allowed to use for loop. (Hint: consider equality operation A == b,
% where A is a matrix and b is a single number).
clear all, close all;   
I = imread('wom1.png');
x= zeros(1,256);            c = zeros(1,256);
 for b=0:255
     nupixels=sum(sum(I == b));
     x(b+1)=nupixels;
 end
 I = I+200
 subplot (2,1,1); imhist(I); subplot (2,1,2); bar(0:255,x);
% b) Create a new function called ContrastStretch to perform contrast stretching on the input
% image, so as to expand its range to [0 255]. Avoid using imshow(I, [0 255]). (Hint: Find the
% minimum and maximum values of the input image and stretch the intensity
% as shown below) 

% see contrast stretch function
%%

% c) Now open ‘man8.png’ and 'wom1.png' and use the new ContrastStretch function to enhance
% the images. Show the resultant images and corresponding histograms. Discuss the difference
% with the original ones.
man8=imread('man8.png'); wom1=imread('wom1.png');
man8=double(man8); wom1=double(wom1);

MAN= ContrastStretch(man8)
WOM= ContrastStretch(wom1)
subplot (8,2,1); imshow(uint8(man8));
subplot (8,2,2); imhist(uint8(man8));
subplot (8,2,3); imshow(uint8(MAN));
subplot (8,2,4); imhist(uint8(MAN));

subplot (8,2,5); imshow(uint8(wom1));
subplot (8,2,6); imhist(uint8(wom1));
subplot (8,2,7); imshow(uint8(WOM));
subplot (8,2,8); imhist(uint8(WOM));

%% second task
% a) Divide the image mbaboon.bmp into blocks of 4×4 pixels. Replace each block by the intensity
% of the (2, 2) pixel within the block. The resulting image will have the size four times smaller
% than the original one. Display the down sampled image. Hint (Use blockproc and
% anonymous function @ in matlab)
 
 
clear all, close all;
I = imread('mbaboon.bmp');
I = double(I);


subplot(221)
imshow(uint8(I));
fun = @(block_struct) block_struct.data(2,2);
B = blockproc(I,[4 4],fun);

subplot(222)
imshow(uint8(B));
 
% b) Repeat (a) but replace with the pixel (1, 1) instead.
fun = @(block_struct) block_struct.data(1,1);
B = blockproc(I,[4 4],fun);
subplot(223)
imshow(uint8(B));
% c) Repeat (a) but replace with the average intensity over the original block.
fun = @(block_struct) mean(block_struct.data(:));
B = blockproc(I,[4 4],fun);
subplot(224)
imshow(uint8(B));
 
 