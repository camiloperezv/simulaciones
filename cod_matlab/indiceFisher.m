function indice = indiceFisher(X,Y)
    C = length(unique(Y));    
    X1 = X(find(Y==1),:);
    X0 = X(find(Y==0),:);
    stdArr = [std(X0);std(X1)];
    meanArr = [mean(X0);mean(X1)];
    indiceJ = zeros(1,18);
    for i = 1:C
            for j = 1:C
                if(j ~= i)
                    indiceJ = indiceJ+((power((meanArr(i,:)-meanArr(j,:)),2))./power(stdArr(i,:),2)+power(stdArr(j,:),2));
                    %indiceJ = indiceJ+(((meanArr(i,:)-meanArr(j,:)).*((meanArr(i,:)-meanArr(j,:))'))./power(stdArr(i,:),2)+power(stdArr(j,:),2));
                end
            end
    end
    indice = indiceJ;
end