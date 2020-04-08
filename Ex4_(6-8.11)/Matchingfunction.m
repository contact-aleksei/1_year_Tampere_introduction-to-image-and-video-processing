function Matchingfunction(Aimage,Bimage)
im=Aimage;

[rows columns] = size(im);
rowsA=rows, columnsA=columns;
num_pixels=rows*columns;
imageresult=uint8(zeros(rows,columns));
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
    CDF_A=cdf;

figure;
subplot(421), imshow(uint8(im)), title('Original Image A');
subplot(422), imhist(uint8(im), gray(256)), title('Histogram from image A');

 im=Bimage;
[rows columns] = size(im);
num_pixels=rows*columns;
imageresult=uint8(zeros(rows,columns));
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
    CDF_B=cdf;

subplot(423), imshow(uint8(im)), title('Original Image B');
subplot(424), imhist(uint8(im), gray(256)), title('Histogram from image B');

% TASK 3. Histogram Matching TASK 3. Histogram Matching TASK 3

for k = 1 : int_val
    [min_value,index] = min(abs(CDF_A(k) - CDF_B));
    % index of CDF_B with minimal distance
    
    % obtaining overall mapping
    mapping(k) = index-1;
end
% converting image pixels to a mapping values
resulting_imageA = mapping(Aimage+1);

for k = 1 : int_val
    [min_value,index] = min(abs(CDF_B(k) - CDF_A));
    % index of 
    mapping(k) = index-1;
end
% converting image pixels to a mapping values
resulting_imageB = mapping(Bimage+1);


subplot(425), imshow(uint8(resulting_imageA)), title('Histogram Matching Image A (to B)');
subplot(426), imhist(uint8(resulting_imageA), gray(256)), title('Histogram of Histogram Matching Image A (to B)');
subplot(427), imshow(uint8(resulting_imageB)), title('Histogram Matching Image B (to A)');
subplot(428), imhist(uint8(resulting_imageB), gray(256)), title('Histogram of Histogram Matching Image B (to A)');
end


