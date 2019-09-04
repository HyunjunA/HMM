function RESULTobservation=makingOb(observationS)

tempC=0;
tempV=[];
tempM=[]
    for i=1:size(observationS,1)
        tempV=[];
        for j=1:size(observationS,2)
            
            if observationS(i,j)~=0
                tempC=observationS(i,j);
                tempV=[tempV,tempC];
                
            end
            
            if j==5
                tempM=[tempM;tempV];
            end
            
        end
        
    end
RESULTobservation=tempM;
return