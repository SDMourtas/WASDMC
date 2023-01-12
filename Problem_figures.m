function Problem_figures(Y1_pred,Y1,Y2_pred,Y2,E,Em,A)

figure
plot(1:length(E),E,'Color',[0.4660 0.6740 0.1880],...
    'DisplayName','Training Error')
hold on
plot(A,E(A),'.','Color',[0.4940 0.1840 0.5560],...
    'MarkerSize',20,'DisplayName','Optimal Powers')
plot(find(E==Em),Em,'h','Color',[0.8500 0.3250 0.0980],...
    'MarkerSize',12,'DisplayName','Minimum Point')
xlabel('r');
ylabel('MAE')
legend
hold off

figure
n=size(Y1_pred,2); cor=zeros(n,1); incor=cor;
for i=1:n
test_results=Y1_pred(:,i)==Y1; 
len=length(test_results); cor(i)=sum(test_results); incor(i)=len-cor(i);
end

b=[cor,incor];
Bar=bar(1:n,b);
ctr=zeros(2,n);ydt=ctr;
for i = 1:2
    ctr(i,:)=bsxfun(@plus, Bar(i).XData, Bar(i).XOffset'); 
    ydt(i,:)=Bar(i).YData;                                  
end
for i=1:n
    text(ctr(:,i),ydt(:,i),sprintfc('%d',ydt(:,i)),...
        'horiz','center', 'vert','bottom')
end
set(Bar(1),'FaceColor',[0.4940 0.1840 0.5560]) ;
set(Bar(2),'FaceColor',[0.4660 0.6740 0.1880]) ;
box on
ylabel('Training Set Samples')
xlabel('ISCO-08 Classification Results')
row1 = {'WASD','WASD','FTree','FKNN','EBT','NNN'};
row2 = {'MC','MC-PAF','','','',''};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));
ax = gca(); 
ax.XTick = 1:6; 
ax.XTickLabel = tickLabels; 
legend('Correct Classifications','Incorrect Classifications')

figure
n=size(Y1_pred,2); cor=zeros(n,1); incor=cor;
for i=1:n
test_results=Y2_pred(:,i)==Y2; 
len=length(test_results); cor(i)=sum(test_results); incor(i)=len-cor(i);
end

b=[cor,incor];
Bar=bar(1:n,b);
ctr=zeros(2,n);ydt=ctr;
for i = 1:2
    ctr(i,:)=bsxfun(@plus, Bar(i).XData, Bar(i).XOffset'); 
    ydt(i,:)=Bar(i).YData;                                  
end
for i=1:n
    text(ctr(:,i),ydt(:,i),sprintfc('%d',ydt(:,i)),...
        'horiz','center', 'vert','bottom')
end
set(Bar(1),'FaceColor',[0.4940 0.1840 0.5560]) ;
set(Bar(2),'FaceColor',[0.4660 0.6740 0.1880]) ;
box on
ylabel('Testing Set Samples')
xlabel('ISCO-08 Classification Results')
row1 = {'WASD','WASD','FTree','FKNN','EBT','NNN'};
row2 = {'MC','MC-PAF','','','',''};
labelArray = [row1; row2]; 
tickLabels = strtrim(sprintf('%s\\newline%s\n', labelArray{:}));
ax = gca(); 
ax.XTick = 1:6; 
ax.XTickLabel = tickLabels; 
legend('Correct Classifications','Incorrect Classifications')
