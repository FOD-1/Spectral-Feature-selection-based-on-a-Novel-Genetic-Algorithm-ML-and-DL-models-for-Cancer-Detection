function Xnew = reshapeData(X)

for i= 1:size(X,1)
    Xnew(:,:,:,i)=X(i,1:end);
end