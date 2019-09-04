function candS=filtering(allInfS,observationS)

test=0;
oneCand=[]
tempCand=[];
for i=1:size(observationS,1)
    for j=1:size(allInfS,1)
        test=0;
        
        if j==87
            ko=0;
        end
        
        
        for k=1:size(observationS,2)
            if observationS(i,k)~=0
                if (observationS(i,k)>=allInfS{j,3+k-1}(1)) && (observationS(i,k)<=allInfS{j,3+k-1}(2))
                    test=test+1;
                end
            end
            
            if test==4
                tempCand=[tempCand; allInfS{j,1} allInfS{j,2} allInfS{j,7}];
            end
            
        end
    end
    
    candS{i}=tempCand;
    tempCand=[];
end

return