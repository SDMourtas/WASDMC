function Z=Zmatrix(X,M,K,A)
% function for calculating the matrix Q

d=length(A);
Z=zeros(K,M*d); 
for i=1:d    
    r=X.^(A(i)-1); r(r<1)=0; % Maxout
    Z(:,M*(i-1)+1:M*i)=r;
end