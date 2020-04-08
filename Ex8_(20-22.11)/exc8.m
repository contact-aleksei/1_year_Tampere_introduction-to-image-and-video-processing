%% 1. Image Blurring
clc, clear
I = double(imread('DIP.jpg')); [row, col]=size(I); T=1; a=0.1; b=0.1;

[u, v] = meshgrid(-row/2:row/2-1, -col/2:col/2-1);
F = fft2(I);
Fc = fftshift(F);
H=T./(pi*(u*a+v*b)+eps).*sin(pi*(u*a+v*b)).*exp(-1i*pi*(u*a+v*b));

G = H.*Fc;
gi = ifft2(ifftshift(G));
g = real(gi);% 'blurred'

Fc_2 = fftshift(fft2(g));
invH = Fc_2./(H+0.001);
gi_back = ifft2(ifftshift(invH));
g_back = real(gi_back); % 'restored'

figure(1)
subplot(1,3,1); imshow(I,[]);title('original')
subplot(1,3,2); imshow(g,[]);title('blurred')
subplot(1,3,3); imshow(g_back,[]);title('restored')

err = immse(double(G), double(I));
fprintf('\n The mean-squared error is %0.4f\n', err);
err = immse(double(g), double(I));
fprintf('\n The mean-squared error is %0.4f\n', err);


% 2. Image Restoration via Wiener Filtering
noise = sqrt(50)*randn(row,col);
I_degr=double(g)+noise; 
% b. Apply simple inverse filtering to the degraded image (2a)
% Move the zero-frequency component to the center of the matrix

Fc = fftshift(fft2(I_degr));
InvF  = Fc./(H+0.001);
g = ifftshift(ifft2(InvF));
gi=real(g);

G = fftshift(fft2(I_degr));

% c. Apply the Wiener filter:
Sn = abs(fftshift(fft2(noise))).^2 ;
Sf = abs(fftshift(fft2(I))).^2 ;
k= Sn./Sf;
absH = conj(H).*H;
W=(1./(H+eps)).*(absH)./(absH+k).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);


figure(2)
subplot(1,3,1);
imshow(I_degr,[]); title('blurred');
subplot(1,3,2);
imshow(gi,[]); title('inverse filtering');  
subplot(1,3,3);
imshow(W_image,[]); title('Wiener filtering');


figure(3)
W=(1./(H+eps)).*(absH)./(absH+0.001).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,1);
imshow(W_image,[]); title('k=0.001');
W=(1./(H+eps)).*(absH)./(absH+0.005).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,2);
imshow(W_image,[]); title('k=0.005');
W=(1./(H+eps)).*(absH)./(absH+0.05).*G;
GWie = ifft2(ifftshift(W));
W_image = real(GWie);
subplot(1,3,3);
imshow(W_image,[]); title('k=0.05');