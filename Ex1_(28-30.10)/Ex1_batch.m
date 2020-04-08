function [I]= Ex1_batch()
for i=1:6
    I=imread(strcat("c_",num2str(i),".jpg"));
    I = Process(I);
    imwrite(I,strcat("c_",num2str(i),".bmp"));
end
end
function [I] = Process(I)
%imresize and imrotate
%   Detailed explanation goes here
I=imresize(I,0.75);
I=I(:,round(size(I,2)/2):end,:); %take the right half of the image
I=fliplr(I); %mirror an image along the center 
I=imrotate(I,90);
end


    
