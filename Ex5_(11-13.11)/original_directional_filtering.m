% b. Create a function called “directional_filtering” in matlab.

%- The function takes two input arguments: a grayscale image and the filter size
I = imread('cameraman.tif');

k=5;
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

for i=[1:kernel_size]
    for j=[1:kernel_size]
        if ne(i,j)
            kernel_4(i,j)=1/kernel_size;
            if i>j
                kernel_4(i,j)=-1*kernel_4(i,j)
            end
        end
    end
end

kernel_2=rot90(kernel_4);

figure(1)
subplot (2,2,1); imshow(imfilter(I,kernel_1));
title('0   degree');
subplot (2,2,2); imshow(imfilter(I,kernel_2));
title('45  degrees');
subplot (2,2,3); imshow(imfilter(I,kernel_3));
title('90  degrees');
subplot (2,2,4); imshow(imfilter(I,kernel_4));
title('135 degrees');



