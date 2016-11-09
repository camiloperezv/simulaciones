function [Modelo, YESTRET] = FunVecinosCercanos(X,Y,vec,Xname)
    Txt = strcat('Probando con la variable',Xname);
    disp(Txt);
    Rept=10;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         LAB 2                        %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         VecinosCercanos              %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%VECINOS CERCANOS


    %%load('DatosClasificacion.mat');
    %Xclas=Xclas(:,1:3);

    %%% Se hace la partici?n entre los conjuntos de entrenamiento y prueba.
    %%% Esta partici?n se hace forma aletoria %%%

    N=size(X,1);
    porcentaje = N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=X(ind(1:porcentaje),:);
    Xtest=X(ind(porcentaje+1:end),:);
    Ytrain=Y(ind(1:porcentaje),:);
    Ytest=Y(ind(porcentaje+1:end),:);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Normalizaci?n %%%

    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);

    %%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la clasificaci?n con KNN %%%

    k=vec;
    Yesti=vecinosCercanos(Xtest,Xtrain,Ytrain,k,'class'); 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Se encuentra la eficiencia y el error de clasificaci?n %%%

    %     a = 0;
    %     b = 0;
    %     c = 0;
    %     for i=1:size(Yclas)
    %         if(Yclas(i) == 1)
    %            a=a+1; 
    %         end
    %         if(Yclas(i) == 2)
    %            b=b+1; 
    %         end
    %         if(Yclas(i) == 3)
    %            c = c+1; 
    %         end
    %     end
    %     Texto=strcat('clase 1: ',{' '},num2str(a));
    %     disp(Texto);
    %     Texto=strcat('clase 2: ',{' '},num2str(b));
    %     disp(Texto);
    %     Texto=strcat('clase 3: ',{' '},num2str(c));
    %     disp(Texto);


    Eficiencia=(sum(Yesti==Ytest))/length(Ytest);
    Error=1-Eficiencia;
    
    Texto=strcat('La eficiencia en prueba es: ',{' '},num2str(Eficiencia));
    disp(Texto);
    Texto=strcat('El error de clasificaci?n en prueba es: ',{' '},num2str(Error));
    disp(Texto);
    Modelo = Yesti;
    YESTRET = Yesti;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Vecinos cercanos %%%

end

