%% 2. Object Extraction
% Load image lake.jpg and extract the biggest lake.
RGB =  imread('lake.jpg');
HSV = rgb2hsv(RGB);


hueValue = HSV(:,:,1);
T  = graythresh(hueValue);
BW = im2bw(hueValue,T);
L =  bwlabel(BW);


figure(1)
imshow(BW);
imshow(L);
impixelinfo


in=repmat(L,[1,1,3])==35;
%ind=cat(double(in),double(in),double(in));
%ind =[in,in,in];
NeImage=zeros(size(HSV));
NeImage(in)=RGB(in);imshow(BW);
figure(2)
subplot(231); imshow(RGB);
subplot(232); imshow(HSV);
subplot(233); imshow(BW);
subplot(234); imshow(L);
subplot(235); imshow(uint8(NeImage));
subplot(236); imshow(BW);