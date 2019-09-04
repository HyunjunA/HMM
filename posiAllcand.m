function reFa=posiAllcand(candS,transitionMatrixS)


temp=combvec(candS{1,1}(:,7)',candS{1,2}(:,7)',candS{1,3}(:,7)',candS{1,4}(:,7)',candS{1,5}(:,7)',candS{1,6}(:,7)',candS{1,7}(:,7)',candS{1,8}(:,7)',candS{1,9}(:,7)',candS{1,10}(:,7)',candS{1,11}(:,7)');

temp=temp';

teU=0;
cl=[];
for uu=1:size(temp,1)
    for tr=1:size(temp,2)-1
        
        t=temp(uu,tr);
        tP=temp(uu,tr+1);
        
        if transitionMatrixS(t,tP)==0
            teU=uu;
            cl=[cl;teU];
            break;
        end
    
        
    end

end

tempCol=0;
Col=[];

A=[1:1:size(temp,1)];


allLine= setdiff(A,cl);
allLine=allLine';


reFa=[];

for yi=1:size(allLine,1)

    reBef=temp(allLine(yi,1),:);
    reFa=[reFa;reBef];

end

% for rea=1:size(temp,1)
%     if ismember(rea,cl)==0
%         tempCol=temp(rea,:);
%         Col=[Col;tempCol];
%     end
% end

temp;

return