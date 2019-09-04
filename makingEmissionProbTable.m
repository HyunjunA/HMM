function emissionProbTableS=makingEmissionProbTable(location)

xCordSize=size(location,1);
yCordSize=size(location,2);

temp=[];
%each | coordinate | trueDistance | noise measure min max from each tower
coordTrueDistanceS=[];
%%%%%
% for i=1:xCordSize
%     temp=distanceFromTower(location(i,1),location(i,2));
%     coordTrueDistanceS=[coordTrueDistanceS;{[i,j]} {temp} {[temp(1)*0.7,temp(1)*1.3]} {[temp(2)*0.7,temp(2)*1.3]} {[temp(3)*0.7,temp(3)*1.3]} {[temp(4)*0.7,temp(4)*1.3]}];
%         
%     
% end
%%%%%%
emissionProbTableS=allCase(location)

return