function SmaskRGBimage=sliceSphere(I,dist)
I=double(I);
Ir=I(:,:,1); Ig=I(:,:,2); Ib=I(:,:,3);
C=impixel(uint8(I));
Cr=C(1); Cg=C(2); Cb=C(3);
% sliceSphere % Euclidean distance:[m n]=size(I);
EuclDist=(Ir-Cr).^2+(Ig-Cg).^2+(Ib-Cb).^2;
Smask = EuclDist<=dist;
redSmask = Ir.*Smask;
greenSmask = Ig.*Smask;
blueSmask = Ib.*Smask;
SmaskRGBimage = cat(3,redSmask, greenSmask, blueSmask);
SmaskRGBimage=uint8(SmaskRGBimage);
end