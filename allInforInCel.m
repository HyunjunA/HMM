function allInfS=allInforInCell(spaceDataS,obstacleLocationS)

xCordSize=size(spaceDataS,1);
yCordSize=size(spaceDataS,2);

temp=[];
%each | coordinate | trueDistance | noise measure min max from each tower
allInfS=[];

cellNumber=0;

for i=0:xCordSize-1
    for j=0:xCordSize-1
        obT = ismember(obstacleLocationS,[i j],'rows');
        if sum(obT)~=1
           cellNumber=cellNumber+1; 
           temp=distanceFromTower(i,j);
           
           %allInfS=[allInfS;{[i,j]} {round(temp,1)} {[round(temp(1)*0.7,1),round(temp(1)*1.3,1)]} {[round(temp(2)*0.7,1),round(temp(2)*1.3,1)]} {[round(temp(3)*0.7,1),round(temp(3)*1.3,1)]} {[round(temp(4)*0.7,1),round(temp(4)*1.3,1)]} {[cellNumber]} ];
            allInfS=[allInfS;{[i,j]} {(temp)} {[temp(1)*0.7,temp(1)*1.3]} {[temp(2)*0.7,temp(2)*1.3,]} {[temp(3)*0.7,temp(3)*1.3]} {[temp(4)*0.7,temp(4)*1.3]} {[cellNumber]} ];
        
        end
    end
end
%emissionProbTableS=allCase(coordTrueDistanceS)

return