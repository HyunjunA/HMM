function TotalcandSS=checkMaxLik(emissionProbTableAmongCandS,observationS,transitionMatrixS,candSS,phiS,TotalcandSS,iS,TotalobservationS)
 
a=0;

tempCandProb=[];

% for i=1:size(emissionProbTableAmongCandS,2)
%     table=emissionProbTableAmongCandS{1,i}(:,3:6);
%     Lia = ismember(table,observationS,'rows');
%     check=sum(Lia);
%     a=check/size(table,1);
%     tempCandProb=[tempCandProb;a];
%     
% end

for i=1:size(emissionProbTableAmongCandS,2)
    totalNum=size(emissionProbTableAmongCandS{1,i},1);
    
    a=1/totalNum;
    tempCandProb=[tempCandProb;a];
    
end


insertEphsilonLoc=size(candSS,2)+1;

for i=1:size(tempCandProb,1)
    if iS==1
        tempCandProb(i)=phiS*tempCandProb(i);
    end
    
    
    candSS(i,insertEphsilonLoc)=tempCandProb(i);
    
    ephiWithTran=candSS(i,insertEphsilonLoc)*transitionMatrixS(candSS(i,7),:);
    
    
    posNextState=[];
    for ju=1:size(ephiWithTran,2)
        if ephiWithTran(1,ju)~=0
            posNextState=[posNextState;ju];
        end
    end
    
    candTempEtP=0;
    candEtP=[];
    tri=0;
    
    for jc=1:size(posNextState,1)
        posNextState(1);
        for jun=1:size(TotalcandSS{1,iS+1},1)
            
            
            
            
            if posNextState(jc)==TotalcandSS{1,iS+1}(jun,7)
                nextemissionProbTableAmongCandS=allCase(TotalcandSS{1,iS+1});
                tri=1;
                
                emPro=makeEmProS(nextemissionProbTableAmongCandS,TotalobservationS(iS+1,:));
                %TotalcandSS{1,iS}(i,8)=ephiWithTran(posNextState(jc))*emPro(jun);
                candTempEtP=ephiWithTran(posNextState(jc))*emPro(jun);
                candEtP=[candEtP;posNextState(jc),candTempEtP];
                
            end
            
        end
        
        
        
        
    end
    
    if tri ==1
        maxCandEtp=max(candEtP(:,2));

        for tch=1:size(candEtP,1)

            if candEtP(tch,2)==maxCandEtp
                TotalcandSS{1,iS}(i,8)=maxCandEtp;
            end

        end
    
    end
    
    
    
end


  


return