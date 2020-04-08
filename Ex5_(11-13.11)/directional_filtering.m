function directional_filtering(I,k)
% b. Create a function called “directional_filtering” in matlab.

%- The function takes two input arguments: a grayscale image and the filter size

kernel_size=k;
kernel=zeros(k);

kernel_1=kernel;% 0
kernel_2=kernel;% 45
kernel_3=kernel;% 90
kernel_4=kernel;% 135
for i=[1:kernel_size]
    kernel_1(round(kernel_size/2),i)=1/kernel_size;
end
kernel_3=rot90(kernel_1);
kernel_4=eye(kernel_size)/kernel_size;
kernel_2=rot90(kernel_4);
figure(3)
title(['DIRECTIONAL FILTERING']);
subplot (2,2,1); imshow(imfilter(I,kernel_1));
title('0   degree');
subplot (2,2,2); imshow(imfilter(I,kernel_2));
title('45  degrees');
subplot (2,2,3); imshow(imfilter(I,kernel_3));
title('90  degrees');
subplot (2,2,4); imshow(imfilter(I,kernel_4));
title('135 degrees');
end



