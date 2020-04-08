function filtered = thre_med_filter(I,kernel_size)
[m, n]=size(I);
filtered=uint8(zeros(m-2,n-2));
threshold=50;
k=(kernel_size+1)/2;
for i=1:m-k
    for j=1:n-k
        patch=I(i:i+k,j:j+k); 
            if abs(median(patch(:))-I(i,j))<threshold;
                filtered(i,j)=median(patch(:));
            else
                filtered(i,j)=I(i,j);
            end
    end
end
imshow(filtered);
end