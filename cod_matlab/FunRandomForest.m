function [ModeloRet, YESTRET] = FunRandomForest(X,Y,NumArboles,Xname)
    Txt = strcat('Probando con la variable',Xname);
    disp(Txt);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         LAB 3                        %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         Random Forest                %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Rept=10;

    %%RANDOM FOREST%%
    %%% punto Random Forest %%%

    NumClases=length(unique(Y)); %%% Se determina el n?mero de clases del problema.
    NumMuestras=size(X,1);
    
    EficienciaTest=zeros(1,Rept);
    tic;
    for fold=1:Rept

        %%% Se hace la partici?n de las muestras %%%
        %%%      de entrenamiento y prueba       %%%

        rng('default');
        particion=cvpartition(NumMuestras,'Kfold',Rept);
        indices=particion.training(fold);
        Xtrain=X(particion.training(fold),:);
        Xtest=X(particion.test(fold),:);
        Ytrain=Y(particion.training(fold));
        Ytest=Y(particion.test(fold));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%% Entrenamiento de los modelos. Recuerde que es un modelo por cada clase. %%%

        Modelo=entrenarFOREST(NumArboles,Xtrain,Ytrain);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%% Validaci?n de los modelos. %%%

        Yest=testFOREST(Modelo,Xtest);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        MatrizConfusion = zeros(NumClases,NumClases);
        for i=1:size(Xtest,1)
            MatrizConfusion(Yest(i)+1,Ytest(i)+1) = MatrizConfusion(Yest(i)+1,Ytest(i)+1) + 1;
            %MatrizConfusion(Yest(i),Ytest(i)) = MatrizConfusion(Yest(i),Ytest(i)) + 1;
        end
        EficienciaTest(fold) = sum(diag(MatrizConfusion))/sum(sum(MatrizConfusion));

    end
    toc;
    Eficiencia = mean(EficienciaTest);
    IC = std(EficienciaTest);
    
    Texto=['La eficiencia obtenida fue = ', num2str(Eficiencia),' +- ',num2str(IC)];
    disp(Texto);
    ModeloRet = Modelo;
    YESTRET = Yest;
    %%% Fin punto Random Forest %%%

end

