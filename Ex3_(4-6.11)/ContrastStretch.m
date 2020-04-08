function Y = ContrastStretch(I)
minV=min(min(I));  maxV=max(max(I));
k=255/(maxV-minV); b=-minV;
Y=k * (I +b);
end