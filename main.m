spaceData =importdata('hmm-data.txt');
spaceData=spaceData.data;


obstacleLocation=[[2,2];[2,3];[2,4];[2,5];[2,6];[3,2];[3,6];[4,2];[4,6];[5,2];[5,6];[6,2];[6,6]];


%%file=uiimport('hmm-data.txt');
observation=readtable('hmm-data.txt');
%file=textscan('hmm-data.txt');
observation = table2array(observation);

observation(isnan(observation)) = 0;

observation=makingOb(observation);

%transition prob
%emission prob
%emissionProbTable=makingEmissionProbTable(spaceData,obstacleLocation)
allInf=allInforInCel(spaceData,obstacleLocation);


candS=filtering(allInf,observation);

candS=filteringSecond(candS,allInf,obstacleLocation);





%viterbi algorithm main part

%%%%%%%%%transitionMatrix making!!!!!!!
transitionMatrix=makingTransitionMatrix(spaceData,allInf,obstacleLocation);




%%%%%%%%%emission table amking!!!!!!!
% for i=1:size(observation,1)
%    emissionProbTableAmongCand=allCase(candS{1,i});
%     
% end


allLine=posiAllcand(candS,transitionMatrix);

setAllMInEachTime=setInEachTime(allLine);

candS=filteringThird(candS,setAllMInEachTime);

iniEmiMatrix=zeros(87,11);

for had=1:size(candS,2)
        %%%%%%%%%emission table amking!!!!!!!
        emissionProbTableAmongCand=allCase(candS{1,had});
        
        emissionMatrix=makingRealEmissionP(emissionProbTableAmongCand,setAllMInEachTime,had,iniEmiMatrix);
        iniEmiMatrix=emissionMatrix;
%         candSwithSelection=checkMaxLik(emissionProbTableAmongCand,observation(i,:),transitionMatrix,candS{1,i},phi,candS,i,observation);
end


phi=1/(size(spaceData,1)*size(spaceData,2)-size(obstacleLocation,1));

MPPCellNumber=calProb(allLine,transitionMatrix,emissionMatrix,candS,phi);

MPPCellCoordi=makingMPPcoor(MPPCellNumber,allInf)






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% tempMpp=0;
% mpp=[];


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% for i=1:size(observation,1)
%    
%     if i==1
%         %%%%%%%%%emission table amking!!!!!!!
%         emissionProbTableAmongCand=allCase(candS{1,i});
%         
%         candSwithSelection=checkMaxLik(emissionProbTableAmongCand,observation(i,:),transitionMatrix,candS{1,i},phi,candS,i,observation);
% 
%     end
%     
%     if i~=1
%         
%         emissionProbTableAmongCand=allCase(candS{1,i});
%         
%         candSwithSelection=checkMaxLik2(emissionProbTableAmongCand,observation(i,:),transitionMatrix,candS{1,i},phi,candS,i,observation,mpp);
% 
% 
%     end
%     
%     
%     %%When I got prob==0 with the path
%     if candSwithSelection==0
%         
%     end
%     
%     
%     if candSwithSelection ~=0
%         
%         
%         maxPr=max(candSwithSelection{1,i}(:,8));
% 
%         triM=0;
%         for chk=1:size(candSwithSelection{1,i},1)
% 
%             if (candSwithSelection{1,i}(chk,8)==maxPr) && triM ==0
%                 triM=1;
%                 tempMpp=[candSwithSelection{1,i}(chk,:)];
%                 ans=(tempMpp(1,1:2) - [4 3])
%                 ans=ans(1,1)^2+ans(1,2)^2;
%     %             if ans ~=0 
%     %                 mpp=[mpp;tempMpp];
%     %             end
%                 mpp=[mpp;tempMpp];
%             end
% 
%         end
%     end
%     
% end
% %best
