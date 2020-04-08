%% 1. Laplacian filter with high-boost filtering
clear all, close all
I = zeros(128);

I1=I+0.5;
subplot (3,2,1); imshow(I1);

I2=I;
I2(54:74,54:74)=1;
subplot (3,2,2); imshow(I2);

I3=((repmat([0:1:255]',1,256)))'/256;
subplot (3,2,3); imshow(I3);

I4=I;
I4(64,64)=1;
subplot (3,2,4); imshow(I4);

I5=I;
x=0:1:127;
f=cos((2*pi*x)/32);
[fe1,fe2]=meshgrid(f,f);
I5=(fe1+fe2)/2;
subplot (3,2,5); imshow(I5);

% 2. DFT

dft1=DFT(I1);dft2=DFT(I2);dft3=DFT(I3);dft4=DFT(I4);dft5=DFT(I5);
figure(2)
subplot (3,2,1);
imshow(dft1);
subplot (3,2,2); imshow(dft2);
subplot (3,2,3);imshow(dft3);
subplot (3,2,4);imshow(dft4);
subplot (3,2,5);imshow(dft5);




%%
% 3.
clc, clear
I = imread('cameraman.tif');
D0 = 20,n  = 2;
figure(1)
f1 = BWLPfilter(I, D0, n);
subplot (3,2,1);
imshow(I);
subplot (3,2,2);
imshow(f1)
f2=1-f1;
subplot (3,2,3);
imshow(f2);


F=fft2(I);
Fc=fftshift(F);
G1 = f1.*Fc;
G2 = f2.*Fc;
% 6- Do inverse shifting and inverse transform
gi1 = ifft2(ifftshift(G1));
gi2 = ifft2(ifftshift(G2));
% 7- Take the real part
g1 = real(gi1); g2 = real(gi2);

figure(2)
subplot(2,1,1)
imshow(uint8(g1)); 
subplot(2,1,2)
imshow(uint8(g2));
