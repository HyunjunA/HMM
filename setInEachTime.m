function setAllMInEachTimeS=setInEachTime(allMS)

uni=[];
for hk=1:size(allMS,2)

    tem=unique(allMS(:,hk));
    uni=[uni,{tem}];
end

setAllMInEachTimeS=uni;
return