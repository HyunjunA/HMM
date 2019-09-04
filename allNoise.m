function allPS=allNoise(dS)


first=0.7*dS;
last=1.3*dS;


ini=[0.7*dS , 1.3*dS];
%ini=round(ini, 1);

allPS=[first:0.1:last];
%allPS=round(allPS, 1);

allPS=union(ini,allPS);
allPS=round(allPS, 1);
end