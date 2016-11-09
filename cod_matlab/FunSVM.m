function [Modelo, YESTRET] = FunSVM(X,Y,boxConstraint,Xname)
    Txt = strcat('Probando con la variable',Xname);
    disp(Txt);
    for gamma=[0.01 0.1 1 10 100];

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%         LAB 5                        %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%         SVM CLASSIFICATION           %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%% punto clasificaci???n %%%
        Rept=10;
        NumClases=length(unique(Y)); %%% Se determina el n???mero de clases del problema.
        EficienciaTest=zeros(1,Rept);
        NumMuestras=size(X,1);
        rng('default');
        particion=cvpartition(NumMuestras,'Kfold',Rept);
        for fold=1:Rept

            %%% Se hace la partici???n de las muestras %%%
            %%%      de entrenamiento y prueba       %%%


            Xtrain=X(particion.training(fold),:);
            Xtest=X(particion.test(fold),:);
            Ytrain=Y(particion.training(fold),:);
            Ytest=Y(particion.test(fold));

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %%% Se normalizan los datos %%%

            [Xtrain,mu,sigma]=zscore(Xtrain);
            Xtest=(Xtest - repmat(mu,size(Xtest,1),1))./repmat(sigma,size(Xtest,1),1);
            size(Xtest,1)
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            %%% Entrenamiento de los modelos. Se usa la metodologia One vs All. %%%

            %%% Complete el codigo implimentando la estrategia One vs All.
            %%% Recuerde que debe de entrenar un modelo SVM para cada clase.
            %%% Solo debe de evaluar las muestras con conflicto.

            Ytrain1 = Ytrain;
            Ytrain1(Ytrain ~= 1) = -1;
            %Modelo1=entrenarSVM(Xtrain,Ytrain1,'classification',boxConstraint,gamma,'lin_kernel');
            Modelo1=entrenarSVM(Xtrain,Ytrain1,'classification',boxConstraint,gamma);
            Ytrain2 = Ytrain;
            Ytrain2(Ytrain ~= 2) = -1;
            Ytrain2(Ytrain == 2) = 1;
            %Modelo2=entrenarSVM(Xtrain,Ytrain2,'classification',boxConstraint,gamma,'lin_kernel');
            Modelo2=entrenarSVM(Xtrain,Ytrain2,'classification',boxConstraint,gamma);
            Ytrain3 = Ytrain;
            Ytrain3(Ytrain ~= 3) = -1;
            Ytrain3(Ytrain == 3) = 1;
            %Modelo3=entrenarSVM(Xtrain,Ytrain3,'classification',boxConstraint,gamma,'lin_kernel');
            Modelo3=entrenarSVM(Xtrain,Ytrain3,'classification',boxConstraint,gamma); 

            [~,Yest1]=testSVM(Modelo1,Xtest);
            [~,Yest2]=testSVM(Modelo2,Xtest);
            [~,Yest3]=testSVM(Modelo3,Xtest);
            [~,Yest] = max([Yest1,Yest2,Yest3],[],2); 
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            MatrizConfusion=zeros(NumClases,NumClases);
            for i=1:size(Xtest,1)
                Yest(i)
                MatrizConfusion(Yest(i)+1,Ytest(i)+1)=MatrizConfusion(Yest(i)+1,Ytest(i)+1) + 1;
            end
            EficienciaTest(fold)=sum(diag(MatrizConfusion))/sum(sum(MatrizConfusion));

        end

        Eficiencia = mean(EficienciaTest);
        IC = std(EficienciaTest);
        txtGama=['Con un gama de  ', num2str(gamma)];
        disp(txtGama);
        Texto=['La eficiencia obtenida fue = ', num2str(Eficiencia),' +- ',num2str(IC)];
        disp(Texto);
        Modelo = Modelo1;
        YESTRET = Yest;
        %%% Fin punto de clasificaci???n %%%
    end

end

