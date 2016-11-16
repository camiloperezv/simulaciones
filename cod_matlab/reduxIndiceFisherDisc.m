function indice = reduxIndiceFisherDisc(X,Y)
    C = length(unique(Y));    
    X1 = X(find(Y==1),:);
    X0 = X(find(Y==0),:);
    meanArr = [mean(X0);mean(X1)];
    C0 = cov(X0);
    C1 = cov(X1);
    S0 = (size(X0,1)- 1)*C0;
    S1 = (size(X1,1)- 1)*C1;
    SW = S0+S1;
    SWinv = inv(SW);
    indice = SWinv*((mean(X0)- mean(X1))');
end