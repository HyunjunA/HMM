function iniEmiMatrixS=makingRealEmissionP(emissionProbTableAmongCandS,setAllMInEachTimeS,interNum,iniEmiMatrixS)


tempCandProb=[];
for i=1:size(emissionProbTableAmongCandS,2)
    totalNum=size(emissionProbTableAmongCandS{1,i},1);
    
    a=1/totalNum;
    tempCandProb=[tempCandProb;a];
    
end


for fq=1:size(setAllMInEachTimeS{1,interNum},1)

    row=setAllMInEachTimeS{1,interNum}(fq,1);
    col=interNum;

    iniEmiMatrixS(row,col)=tempCandProb(fq,1);

end




return