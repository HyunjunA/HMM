function transitionMatrixs=makingTransitionMatrix(spaceDataS,allInfS,obstacleLocationS)

tranProSize=size(spaceDataS,1)*size(spaceDataS,1)-size(obstacleLocationS,1);

transitionMatrixs=zeros(tranProSize,tranProSize);

pos=0;

tempPosLoc=[];
posLoc=[];

for i=0:size(spaceDataS,1)-1
    for j=0:size(spaceDataS,2)-1
        %4 direction check
        
        pos=0;
        posLoc=[];
        
        for k=1:4
            if k==1
                checkX=i-1;
                checkY=j;
                
                if checkX>=0 && checkY>=0
                    
                    %obstacle check
                    
                    for m=1:size(allInfS,1)
                        if(allInfS{m,1}==[checkX checkY])
                        
                            nonObs=2;
                        
                            if nonObs==2

                                tempPosLoc=allInfS{m,1};
                                posLoc=[posLoc;tempPosLoc];

                                pos=pos+1;
                            end
                        end
                    end
                end
                
            end
            
            if k==2
                checkX=i;
                checkY=j-1;
                
                if checkX>=0 && checkY>=0
                    
                    %obstacle check
                    
                    for m=1:size(allInfS,1)
                        if(allInfS{m,1}==[checkX checkY])
                        
                            nonObs=2;
                        
                            if nonObs==2

                                tempPosLoc=allInfS{m,1};
                                posLoc=[posLoc;tempPosLoc];

                                pos=pos+1;
                            end
                        end
                    end
                end
            end
            
            
            if k==3
                checkX=i;
                checkY=j+1;
                
                if checkX>=0 && checkY>=0
                    
                    %obstacle check
                    
                    for m=1:size(allInfS,1)
                        if(allInfS{m,1}==[checkX checkY])
                        
                            nonObs=2;
                        
                            if nonObs==2

                                tempPosLoc=allInfS{m,1};
                                posLoc=[posLoc;tempPosLoc];

                                pos=pos+1;
                            end
                        end
                    end
                end
            end
            
            if k==4
                checkX=i+1;
                checkY=j;
                
                if checkX>=0 && checkY>=0
                    
                    %obstacle check
                    
                    for m=1:size(allInfS,1)
                        if(allInfS{m,1}==[checkX checkY])
                        
                            nonObs=2;
                        
                            if nonObs==2

                                tempPosLoc=allInfS{m,1};
                                posLoc=[posLoc;tempPosLoc];

                                pos=pos+1;
                            end
                        end
                    end
                end
            end
            
            if k==4
                
                %posLoc
                eachProb=1/pos;
                posLoc;
                
                %
                for o=1:size(allInfS,1)
                    if (allInfS{o,1}==[i j])
                        row=allInfS{o,7};
                        
                        for p=1:size(posLoc,1)
                            
                            for q=1:size(allInfS,1)
                                
                                if (posLoc(p,:)==allInfS{q,1})
                                    col=allInfS{q,7};
                                    transitionMatrixs(row,col)=eachProb;
                                end
                            end
                        end
                        
                        
                    end
                    
                end
                
                
                
            end
            
            
        end
        

    end


end



return