function filtered = med_filter(I,kernel_size)
[m, n]=size(I);
k2=kernel_size-1;
filtered=uint8(zeros(m-k2,n-k2));

%k=(kernel_size+1)/2;

for i=1:m-k2
    for j=1:n-k2
        patch=I(i:i+k2,j:j+k2);        
        filtered(i,j)=median(patch(:));
    end
end
imshow(filtered);
end