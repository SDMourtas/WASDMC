function E=error_pred(X,Y)

R=X-Y; T=length(Y);
E=sum(abs(R))/T; % MAE
fprintf('The test data MAE is: %f \n',E)
