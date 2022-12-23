function [Xtrain,Ytrain,Xtest,Ytest,docXtrain,docYtrain]=problem(x)
% Input and preparation of the training and testing data for the WASDMC model
warning off

if x==1
    
filename='ILO-ISCO.xlsx';
data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,false,'TreatAsEmpty' ,'-');

% train set
docYtrain=data.Category;
Ytrain = (1:length(data.Category))'; 
[Xtrain,docXtrain] = preprocessText(string(data.Description),Ytrain);

% test set
Ytest=[Ytrain;Ytrain]; 
n=length(data.Description)*2; docXtest=cell(n,1);
for i=1:n/2
    s=split(data.Description{i},',  ');
    docXtest(i) = s(1);
    docXtest(n/2+i) = s(end);
end
Xtest = preprocessText(docXtest,Ytest,docXtrain);

elseif x==2

filename='OS-ISCO.xlsx';
data=readtable(filename,'ReadVariableNames',true,'ReadRowNames' ,false,'TreatAsEmpty' ,'-');

% train set
n=length(data.Category);s=zeros(n,1);
for i=1:n
    s(i)=str2double(data.Category{i});
end
u=unique(s); k=length(u); 
docYtrain=string(u); Ytrain = (1:k)'; Description=cell(k,1);
for i=1:k
    a=data.Description(s==u(i)); Description{i}=a(1);
    for j=2:length(a)
        Description{i}=strcat(Description{i},', ',a(j));
    end
end
[Xtrain,docXtrain] = preprocessText(string(Description),Ytrain);

% test set
Ytest=zeros(n,1);
for i=1:k
    Ytest(s==u(i))=i; 
end
docXtest=data.Description;
Xtest = preprocessText(docXtest,Ytest,docXtrain);

end

