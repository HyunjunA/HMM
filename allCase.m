function emissionProbTableSS=allCase(coordTrueDistanceSS)
emissionProb=[];
proTemp=[];
for i=1:size(coordTrueDistanceSS,1)
    
    if sum(coordTrueDistanceSS(i,:))~=0
        tempDis=coordTrueDistanceSS(i,3:6);

        for j=1:size(tempDis,2)
            d=tempDis(1,j);

            allP{j}=allNoise(d);

        end

        if j==4

            tempF=combvec(allP{1,1},allP{1,2},allP{1,3},allP{1,4});

            temp=combvec(coordTrueDistanceSS(i,1:2)',allP{1,1},allP{1,2},allP{1,3},allP{1,4});
            proTemp{i}=temp';
            %emissionProb=[emissionProb;proTemp];
        end
    end
end



temp={};
emissionProbTableSS=[];
for yy=1:size(proTemp,2)
    sumTemp=sum(proTemp{1,yy})~=0;
    sumTempTemp=sum(sumTemp);
    if sumTempTemp~=0
        temp=proTemp{1,yy};
        emissionProbTableSS=[emissionProbTableSS,{temp}];
    end
end

return