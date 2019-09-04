function TotalcandSS=checkMaxLik2(emissionProbTableAmongCandS,observationS,transitionMatrixS,candSS,phiS,TotalcandSS,iS,TotalobservationS,mppS)
 
a=0;

tempCandProb=[];

for i=1:size(emissionProbTableAmongCandS,2)
    totalNum=size(emissionProbTableAmongCandS{1,i},1);
    
    a=1/totalNum;
    tempCandProb=[tempCandProb;a];
    
end

% insertEphsilonLoc=size(candSS,2)+1;


ephiWithTran=mppS(size(mppS,1),8)*transitionMatrixS(mppS(size(mppS,1),7),:);


posNextState=[];

for ju=1:size(ephiWithTran,2)
    if ephiWithTran(1,ju)~=0
        posNextState=[posNextState;ju];
    end
end

candTempEtP=0;
candEtP=[];
tri=0;
TotalcandSS{1,iS}(1,8)=0;
for jc=1:size(posNextState,1)
        
    for jun=1:size(TotalcandSS{1,iS},1)



        if posNextState(jc)==TotalcandSS{1,iS}(jun,7)
            
            tri=1;
            
            emPro=tempCandProb;
            if TotalcandSS{1,iS}(jun,8)<ephiWithTran(posNextState(jc))*emPro(jun);
%                 TotalcandSS{1,iS}(jun,8)=ephiWithTran(posNextState(jc))*emPro(jun);
                candTempEtP=ephiWithTran(posNextState(jc))*emPro(jun);
                candEtP=[candEtP;posNextState(jc),candTempEtP,jun];
            end
        end

    end
     
    if tri ==1 && jc==size(posNextState,1)
        maxCandEtp=max(candEtP(:,2));

        for tch=1:size(candEtP,1)

            if candEtP(tch,2)==maxCandEtp
                TotalcandSS{1,iS}(candEtP(tch,3),8)=maxCandEtp;
            end

        end
    
    end
    
    
    %trigger ==0 means next places where I can go is not included in possbible Q
    if tri ==0
        TotalcandSS=0;
    
    end
        
        
        
end







  


return