%% 2. Noise and filtering across different colorspaces
clc, clear
lena  =imread('lena.tiff');
lenahsi = rgb2hsi(lena);

% a)
figure(1);
subplot(2,3,1); imshow(lena(:,:,1),[]);
subplot(2,3,2); imshow(lena(:,:,2),[]);
subplot(2,3,3); imshow(lena(:,:,3),[]);
subplot(2,3,4); imshow(lenahsi(:,:,1),[]);
subplot(2,3,5); imshow(lenahsi(:,:,2),[]);
subplot(2,3,6); imshow(lenahsi(:,:,3),[]);

% b)
NoisedG=imnoise((lena(:,:,2)),'Gaussian');
InoiseG=cat(3,lena(:,:,1),NoisedG,lena(:,:,3))
lenahsiNoise = rgb2hsi(InoiseG);

lenahsi = rgb2hsi(lena);
subplot(2,3,1); imshow(NoisedG(:,:,1),[]);
subplot(2,3,2); imshow(InoiseG,[]);
subplot(2,3,3); imshow(lenahsiNoise,[]);

NoisedR=imnoise((lena(:,:,1)),'Gaussian');
NoisedB=imnoise((lena(:,:,3)),'Gaussian');
InoiseALL=cat(3,NoisedR,NoisedG,NoisedB)
lenahsiNoiseALL = rgb2hsi(InoiseALL);

subplot(2,3,4); imshow(InoiseALL,[]);
subplot(2,3,5); imshow(lenahsiNoiseALL,[]);
subplot(2,3,6); imshow(lenahsi(:,:,3),[]);

h = fspecial('average',3);
R=imfilter(NoisedR,h);G=imfilter(NoisedG,h);B=imfilter(NoisedB,h);

RGB=cat(3,R,G,B);
filterR=cat(3,R,NoisedG,NoisedB);
filterG=cat(3,NoisedR,G,NoisedB);
filterB=cat(3,NoisedR,NoisedG,B);

figure(2)
subplot(1,4,1); imshow(RGB,[]);
subplot(1,4,2); imshow(filterR,[]);
subplot(1,4,3); imshow(filterG,[]);
subplot(1,4,4); imshow(filterB,[]);







