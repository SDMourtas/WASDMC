%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  A 3-layer feed-forward neuronet model, trained by a WASDMC       %
%  algorithm. (version 1.0 )                                        %
%                                                                   %
%  Developed in MATLAB R2021a                                       %
%                                                                   %
%  Author and programmer: Dimitris Lagios, S.D.Mourtas,             %
%                         Panagiotis Zervas, Giannis Tzimas         %
%                                                                   %
%   e-Mail: d.lagios@go.uop.gr, spirosmourtas@gmail.com             %
%           p.zervas@uop.gr, tzimas@uop.gr                          %
%                                                                   %
%   Main paper: D.Lagios, S.D.Mourtas, P.Zervas, G.Tzimas,          %
%               "A Weights Direct Determination Neural Network for  %
%               International Standard Classification of            %
%               Occupations," (submitted)                           %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

x=1; % Choose between Example 1 and 2
[Xtrain,Ytrain,Xtest,Ytest,docYtest,docYtrain]=problem(x);

%% Neuronet model Training
col=size(Xtrain,2);

Nmax=2; y_min=min(Ytrain); y_max=max(Ytrain); 
tic
[W,Em,A,E]=WASDMC(Xtrain,Ytrain,Nmax);   % WASDMC optimal hidden-layer structure
toc
tic
FTree_Model=FTree([Xtrain,Ytrain],col); % Fine Tree model 
toc
tic
FKNN_Model=FKNN([Xtrain,Ytrain],col);  % Fine KNN model 
toc
tic
EBT_Model=EBT([Xtrain,Ytrain],col);   % Ensemble Bagged Trees model 
toc
tic
NNN_Model=NNN([Xtrain,Ytrain],col);   % Narrow Neural Network model 
toc

%% Predict
[WASDMC_Ytr_pr,WASDMC_docYtr_pr]=predictN(Xtrain,W,A,y_min,y_max,docYtrain);   % WASDMC: train data prediction
[WASDMC_Yte_pr,WASDMC_docYte_pr]=predictN(Xtest,W,A,y_min,y_max,docYtrain);    % WASDMC: test data prediction
FTree_Ytr_pr = FTree_Model.predictFcn(Xtrain); % FTree: train data prediction
FTree_docYtr_pr=docYtrain(FTree_Ytr_pr)';
FTree_Yte_pr = FTree_Model.predictFcn(Xtest);  % FTree: train data prediction
FTree_docYt_pr=docYtrain(FTree_Yte_pr)';
FKNN_Ytr_pr = FKNN_Model.predictFcn(Xtrain);   % FKNN: train data prediction
FKNN_docYtr_pr=docYtrain(FKNN_Ytr_pr)';
FKNN_Yte_pr = FKNN_Model.predictFcn(Xtest);    % FKNN: train data prediction
FKNN_docYt_pr=docYtrain(FKNN_Yte_pr)';
EBT_Ytr_pr = EBT_Model.predictFcn(Xtrain);     % EBT: train data prediction
EBT_docYtr_pr=docYtrain(EBT_Ytr_pr)';
EBT_Yte_pr = EBT_Model.predictFcn(Xtest);      % EBT: train data prediction
EBT_docYt_pr=docYtrain(EBT_Yte_pr)';
NNN_Ytr_pr = NNN_Model.predictFcn(Xtrain);     % NNN: train data prediction
NNN_docYtr_pr=docYtrain(NNN_Ytr_pr)';
NNN_Yte_pr = NNN_Model.predictFcn(Xtest);      % NNN: train data prediction
NNN_docYt_pr=docYtrain(NNN_Yte_pr)';

% Models statistics on test data
fprintf('WASDMC statistics: \n'); error_pred(WASDMC_Yte_pr,Ytest); 
c_matrix= confusionmat(WASDMC_Yte_pr,Ytest); % confusion matrix
WASDMC_Result=confusion.getValues(c_matrix); WASDMC_k=kappa(c_matrix);
fprintf('FTree statistics: \n'); error_pred(FTree_Yte_pr,Ytest);
c_matrix= confusionmat(FTree_Yte_pr,Ytest);  % confusion matrix
FTree_Result=confusion.getValues(c_matrix); FTree_k=kappa(c_matrix);
fprintf('FKNN statistics: \n'); error_pred(FKNN_Yte_pr,Ytest);
c_matrix= confusionmat(FKNN_Yte_pr,Ytest);   % confusion matrix
FKNN_Result=confusion.getValues(c_matrix); FKNN_k=kappa(c_matrix);
fprintf('EBT statistics: \n'); error_pred(EBT_Yte_pr,Ytest);
c_matrix= confusionmat(EBT_Yte_pr,Ytest);    % confusion matrix
EBT_Result=confusion.getValues(c_matrix); EBT_k=kappa(c_matrix);
fprintf('NNN statistics: \n'); error_pred(NNN_Yte_pr,Ytest);
c_matrix= confusionmat(NNN_Yte_pr,Ytest);    % confusion matrix
NNN_Result=confusion.getValues(c_matrix); NNN_k=kappa(c_matrix);


%% Figures
Ytr_pr=[WASDMC_Ytr_pr,FTree_Ytr_pr,FKNN_Ytr_pr,EBT_Ytr_pr,NNN_Ytr_pr];
Yte_pr=[WASDMC_Yte_pr,FTree_Yte_pr,FKNN_Yte_pr,EBT_Yte_pr,NNN_Yte_pr];
Problem_figures(Ytr_pr,Ytrain,Yte_pr,Ytest,E,Em,A)
