function candS=filteringSecond(ScandS,SallInf,SobstacleLocation)

tempposPointCellNum=0;
posPointCellNum=[];

for iu=1:size(ScandS,2)-1
    for jun=1:size(ScandS{1,iu},1)
        
        coordi=ScandS{1,iu}(jun,1:2);
        p1=[coordi(1,1)+1 coordi(1,2)];
        p2=[coordi(1,1) coordi(1,2)+1];
        p3=[coordi(1,1)-1 coordi(1,2)];
        p4=[coordi(1,1) coordi(1,2)-1];
        
        
        posSet=[p1;p2;p3;p4];
        
        for pt=1:size(posSet,1)
            for pw=1:size(SobstacleLocation,1)
                
                te=(posSet(pt,1:2)==SobstacleLocation(pw,:));
                
                te=te(1,1)*te(1,2);
                if te==1
                    posSet(pt,3)=1;
                end
            end
        end
        
        
        
        
        posPointCellNum=[];
        for pt=1:size(posSet,1)
            
            for pw=1:size(SallInf,1)
                
                temp=(posSet(pt,1:2)== SallInf{pw,1});
                
                temp=temp(1,1)*temp(1,2);
                if temp==1
                    tempposPointCellNum=SallInf{pw,7};
                    
                    posPointCellNum=[posPointCellNum;tempposPointCellNum];
                end
            end
            
        end
        
      
        c=intersect(posPointCellNum,ScandS{1,iu+1}(:,7));
        
        if size(c,1)==0
            ScandS{1,iu}(jun,:)=0;
        end
        
    end

end


tempLine=0;
each=[];
total=[];
for sci=1:size(ScandS,2)
    each=[];
    for on=1:size(ScandS{1,sci},1)
        if sum(ScandS{1,sci}(on,:))~=0
            
            tempLine=ScandS{1,sci}(on,:);
            
            each=[each;tempLine];
        end
    
    end
    total=[total,{each}];
end

candS=total;
return