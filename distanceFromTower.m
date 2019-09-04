function trueDistanceS=distanceFromTower(i,j)

d1=sqrt(i^2+j^2);
d2=sqrt(i^2+(j-9)^2);
d3=sqrt((i-9)^2+j^2);
d4=sqrt((i-9)^2+(j-9)^2);


trueDistanceS=[round(d1,1),round(d2,1),round(d3,1),round(d4,1)];

return 