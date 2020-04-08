function intensityeq(I,Y)
Ired=I(:,:,1); Igreen=I(:,:,2); Iblue=I(:,:,3);
Icat=cat(3,histeq(Ired),histeq(Igreen),histeq(Iblue));
Ihsv=rgb2hsv(I);
Ihsv(:,:,3)=histeq(Ihsv(:,:,3));
Ihsv=hsv2rgb(Ihsv);

Yred=Y(:,:,1); Ygreen=Y(:,:,2); Yblue=Y(:,:,3);
Ycat=cat(3,histeq(Yred),histeq(Ygreen),histeq(Yblue));
Yhsv=rgb2hsv(Y);
Yhsv(:,:,3)=histeq(Yhsv(:,:,3));
Yhsv=hsv2rgb(Yhsv);


figure(4)
subplot(231); imshow(I);
subplot(232); imshow(Icat);
subplot(233); imshow(Ihsv);
subplot(234); imshow(Y);
subplot(235); imshow(Ycat);
subplot(236); imshow(Yhsv);


