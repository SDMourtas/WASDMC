function [W,Em,A,E]=WASDMC_PAF(X,Y,Nmax)
% function for finding the optimal hidden-layer neurons weights of the
% neuronet

% Initialization
A=[]; % the neurons number of the hidden layer (i.e., hidneurons)
Em=inf; E=zeros(Nmax,1); K=length(Y);

for r=1:Nmax
% WDD Method
Z=Zmatrix_PAF(X,K,K,[A;r]);
W=pinv(Z)*Y; 
E(r)=1/K*sum(abs(round(Z*W)-Y)); % MAE
if E(r)<Em
    Em=E(r);A=[A;r];
end
end

% output
Z=Zmatrix_PAF(X,K,K,A);
W=pinv(Z)*Y; 