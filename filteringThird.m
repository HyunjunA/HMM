function totalCandS=filteringThird(ScandS,SsetAllMInEachTime)

eachInter=[];
totalCandS=[];

for tr=1:size(SsetAllMInEachTime,2)
    
    eachInter=[];
    
    for te=1:size(SsetAllMInEachTime{1,tr},1)
        
        SsetAllMInEachTime{1,tr}(te,1);
        
        
        for tq=1:size(ScandS{1,tr},1)

            if SsetAllMInEachTime{1,tr}(te,1)==ScandS{1,tr}(tq,7)
                tempTrLine=ScandS{1,tr}(tq,:);
                eachInter=[eachInter;tempTrLine];
                
            end
        end
        
        
    end
    totalCandS=[totalCandS,{eachInter}];
    
    
end
    

return