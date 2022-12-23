function [Y,YY]=predictN(X,W,A,y_min,y_max,docTarget)
% function for predicting

[N,M]=size(X);
X(X==max(X,[],2))=1;
X(X<1)=0;

Q=Zmatrix(X,M,N,A);
Y=Q*W; 

Y=round(Y); Y(Y<y_min)=y_min; Y(Y>y_max)=y_max;

YY=docTarget(Y)';