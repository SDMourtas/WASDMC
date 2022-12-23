function [rm,r] = preprocessText(textData,Y,r)

% Tokenize the text.
documents = tokenizedDocument(textData);

% Convert to lowercase.
documents = lower(documents);

% Erase punctuation.
documents = erasePunctuation(documents);

% Convert the text into numbers
m=length(documents);

if nargin==2
    n=max(Y); r{n,1}={};
    for i=1:n
        r{i,1}=documents(Y==i,1).Vocabulary;
    end
else
    n=length(r);
end

rm=zeros(m,n);
for i=1:m
    a=documents(i,1).Vocabulary; lena=length(a);
    for j=1:n        
        b=r{j,1}; lenb=length(b);
        for q=1:lena
           rm(i,j)=rm(i,j)+sum(strcmp(b,a(q)));
        end
        rm(i,j)=(rm(i,j)/lena+rm(i,j)/lenb)/2; 
    end
end