function emProS=makeEmProS(emissionProbTableAmongCandSS,observationSS)
tempCandProb=[];
for ci=1:size(emissionProbTableAmongCandSS,2)
    ctable=emissionProbTableAmongCandSS{1,ci}(:,3:6);
    cLia = ismember(ctable,observationSS,'rows');
    ccheck=sum(cLia);
    a=ccheck/size(ctable,1);
    tempCandProb=[tempCandProb;a];
    
end
emProS=tempCandProb;
return