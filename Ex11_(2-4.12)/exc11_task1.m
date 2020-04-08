% 1. YUV to RGB transformation
data=load('yuvdata.mat');
YuvToRgb=[1    0        1.402;
          1   -0.34413 -0.71414;
          1    1.772    0];
      
yy = data.yy;
uu = data.uu;
vv = data.vv;

uu=repelem(uu,4);
vv=repelem(vv,4);

yy = reshape(yy,640,360);
uu = reshape(uu,640,360);
vv = reshape(vv,640,360);

figure(1);
subplot(1,3,1); imshow(uint8(yy));
subplot(1,3,2); imshow(uint8(uu));
subplot(1,3,3); imshow(uint8(vv));

center=zeros(640,360);
center=center+127;

Y=yy;
U=uu-center;
V=vv-center;

YUV=cat(2,Y(:),U(:),V(:));
RGB=YuvToRgb*(transpose(YUV));

R=transpose(reshape(RGB(1,:),640,360));
G=transpose(reshape(RGB(2,:),640,360));
B=transpose(reshape(RGB(3,:),640,360));
RGB=cat(3,R,G,B);

figure(2);
imshow(uint8(RGB));