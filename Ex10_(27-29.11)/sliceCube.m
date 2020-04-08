function CmaskRGBimage=sliceCube(I,dist)
I=double(I);
Ir=I(:,:,1); Ig=I(:,:,2); Ib=I(:,:,3);
C=impixel(uint8(I));
Cr=C(1); Cg=C(2); Cb=C(3);
% sliceCube % Manhattan distance:
ManhDist=abs(Ir-Cr)+abs(Ig-Cg)+abs(Ib-Cb);
Cmask = ManhDist<=dist;
redCmask = Ir.*Cmask;
greenCmask = Ig.*Cmask;
blueCmask = Ib.*Cmask;
CmaskRGBimage = cat(3,redCmask, greenCmask, blueCmask);
CmaskRGBimage=uint8(CmaskRGBimage);
end