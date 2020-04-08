function dft =  DFT(I)
% 1- Obtain the Fourier transform
F = fft2(I);
% 2- Move the zero-frequency component to the center of the matrix
Fc = fftshift(F);
% 3- Fc has complex values. If you want to display the transform, you
% should take the absolute value. Also apply logarithm.
dft=log(abs(Fc) + 0.0001);
end

