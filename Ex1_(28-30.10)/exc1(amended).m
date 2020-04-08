%% first task
clear all, close all;
I = imread('peppers.png');
figure
imshow(I)
%aaa
I1 = rgb2gray(I);
figure
imshow(I1)
%bbb
figure
redChannel = I(:,:,1);
imshow(redChannel);
%ccc
I2=I;
figure
I2(:,:,2) = I2(:,:,2)+50;
imshow(I2);
%ddd
R = I(:,:,1); G = I(:,:,2); B = I(:,:,3);
I3=cat(3,R,G,B);
imshow(I3);
%eee
figure
subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(I1);
subplot(2,2,3);imshow(I2);
subplot(2,2,4);imshow(I3);

%% second task
clear all, close all;
Ex1_batch
%% third task
clear all, close all;
S=[     0,0,0,0,0,0,0,1,1,0         ;
        1,0,0,1,0,0,1,0,0,1         ;
        1,0,0,1,0,1,1,0,0,0         ;
        0,0,1,1,1,0,0,0,0,0         ;
        0,0,1,1,1,0,0,1,1,1         ];

[a,b] = Sfunction(S);
 
load S.mat;
[a,b] = Sfunction(S);


function [a,b] = Sfunction(S)
figure;
imshow(S,'InitialMagnification','fit');
S1=S(1:end-1, 2:(size(S,2)/2)); 
S2=S(1:end-1, size(S,2)/2 +1 : end-1);
%a = nnz(S1);
%b = nnz(S2);
a= sum (S1(:)~=0);
b= sum (S2(:)~=0);
fprintf("The total number of non-zero values in matrix S1 is %d\n", a);
fprintf("The total number of non-zero values in matrix S2 is %d\n", b);
end

 