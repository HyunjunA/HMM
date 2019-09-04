function coorS=makingMPPcoor(MPPCellNumberS,allInfS)

coorS=[];

for ah=1:size(MPPCellNumberS,2)
    MPPCellNumberS(1,ah)

    for ine=1:size(allInfS,1)
        if MPPCellNumberS(1,ah)==allInfS{ine,7}
            tempCo=allInfS{ine,1};
            coorS=[coorS;tempCo];
        end
    end

end


return