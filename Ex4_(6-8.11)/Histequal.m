function Histequal(im)
[rows columns] = size(im);
num_pixels=rows*columns;
imageresult=uint8(zeros(rows,columns))
sum=0;L=255;
int_val=L+1;
n_small = zeros(int_val,1); pdf = zeros(int_val,1); cdf = zeros(int_val,1);
cum_n_small = zeros(int_val,1);
r = zeros(int_val,1);

% First three columns of Histogram Equalization.
% Page 3.41 from the lecture presentation
for i=1:rows;
    for j=1:columns;
        pixel_value=im(i,j);
        % 0..255
        
        n_small(pixel_value+1)=n_small(pixel_value+1)+1;
        %           1..256
        %number of a given intensity colour 1..256
        
        pdf(pixel_value+1)=n_small(pixel_value+1)/num_pixels;
    end;
end;

% Cumulative distribution function
% Output values of intensity values based on CDF

for i=1:int_val;
    sum=sum+n_small(i);
    % sum of number of intensity values
    
    cum_n_small(i)=sum;
    cdf(i)=cum_n_small(i)/num_pixels;
    % cdf for n_small
    
    Y(i)=round(cdf(i)*L);
    % values of pixels in the output
    % 1..256
    end;

% Applying CDF against PDF
for i=1:rows;
    for j=1:columns;
          %  PDF         =     CDF       
        % the end result      (1..256) 
        imageresult(i,j) = Y (im(i,j)+1);
    end;
end;

figure;
subplot(221), imshow(uint8(im)), title('Original Image');
subplot(222), imhist(uint8(im), gray(256)), title('Histogram');
subplot(223), imshow(uint8(imageresult)), title('Histogram Equalized Image');
subplot(224), imhist(uint8(imageresult), gray(256)), title('Equalized Histogram');
end