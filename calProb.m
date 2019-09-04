function mpp=calProb(SallLine,StransitionMatrix,SemissionMatrix,ScandS,Sphi)

all=[];


for ros=1:size(SallLine,1)
    
    temp=1;
    
    for cos=1:size(SallLine,2)
        
%         emissionProbTableAmongCandS=allCase(ScandS{1,cos});
%         
%         tempCandProb=[];
%         for i=1:size(emissionProbTableAmongCandS,2)
%             totalNum=size(emissionProbTableAmongCandS{1,i},1);
%             a=1/totalNum;
%             tempCandProb=[tempCandProb;a];
%         end
%         
%         for lok=1:size(tempCandProb,1)
%             SemissionMatrix(ScandS{1,cos}(lok,7),cos)=tempCandProb(lok,1);
%         
%            
%         end
        
        
        
        
        %emission prob
        emiIT=SemissionMatrix(SallLine(ros,cos),cos);
        %transition prob
        if cos+1<=size(SallLine,2)
            trIJ=StransitionMatrix(SallLine(ros,cos),SallLine(ros,cos+1));
        end
        
        
        temp=temp*emiIT*trIJ;
        
        if cos==size(SallLine,2)-1
            
%             for lok=1:size(tempCandProb,1)
%                 SemissionMatrix(ScandS{1,cos+1}(lok,7),cos+1)=tempCandProb(lok,1);
%             end
            
            emiIT=SemissionMatrix(SallLine(ros,cos+1),cos+1);
            temp=Sphi*temp*emiIT; 
            all=[all;temp];
        end
        
    end

end


[M,I] = max(all(:));

mpp=SallLine(I,:);



return