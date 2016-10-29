
clc
clear all
close all

Rept=10;
load('db/bank-aditional-proccessed.mat');
punto=input('Ingrese 1 para VecinosCercanos 2 para Random Forest 3 para RNA CLASSIFICATION  : ');
if punto==1
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

    N=size(X1,1);
    porcentaje = N*0.7;
    rng('default');
    ind=randperm(N); %%% Se seleccionan los indices de forma aleatoria

    Xtrain=X1(ind(1:porcentaje),:);
    Xtest=X1(ind(porcentaje+1:end),:);
    Ytrain=Y1(ind(1:porcentaje),:);
    Ytest=Y1(ind(porcentaje+1:end),:);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Normalizaci?n %%%

    [Xtrain,mu,sigma]=zscore(Xtrain);
    Xtest=normalizar(Xtest,mu,sigma);

    %%%%%%%%%%%%%%%%%%%%%

    %%% Se aplica la clasificaci?n con KNN %%%

    k=7;
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

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% Fin Vecinos cercanos %%%

elseif punto==2

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         LAB 3                        %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         Random Forest                %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    %%RANDOM FOREST%%
    %%% punto Random Forest %%%

    NumClases=length(unique(Y)); %%% Se determina el n?mero de clases del problema.
    NumArboles=input('Ingrese Numero Arboles: ');
    disp(num2str(NumArboles));
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
            MatrizConfusion(Yest(i),Ytest(i)) = MatrizConfusion(Yest(i),Ytest(i)) + 1;
        end
        EficienciaTest(fold) = sum(diag(MatrizConfusion))/sum(sum(MatrizConfusion));

    end
    toc;
    Eficiencia = mean(EficienciaTest);
    IC = std(EficienciaTest);
    Texto=['La eficiencia obtenida fue = ', num2str(Eficiencia),' +- ',num2str(IC)];
    disp(Texto);

    %%% Fin punto Random Forest %%%
elseif punto==3
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         LAB 4                        %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%         RNA CLASSIFICATION           %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%                                      %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%% punto clasificaci?n %%% 
    %load('DatosClasificacion.mat');
    [~,YC]=max(Y1,[],2);
    NumClases=length(unique(YC)); %%% Se determina el n?mero de clases del problema.
    NumClases
    EficienciaTest=zeros(1,Rept);
    NumMuestras=size(X1,1);

    for fold=1:Rept

        %%% Se hace la partici?n de las muestras %%%
        %%%      de entrenamiento y prueba       %%%

        rng('default');
        particion=cvpartition(NumMuestras,'Kfold',Rept);
        indices=particion.training(fold);
        Xtrain=X1(particion.training(fold),:);
        Xtest=X1(particion.test(fold),:);
        Ytrain=Y1(particion.training(fold),:);
        [~,Ytest]=max(Y1(particion.test(fold),:),[],2);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%% Se normalizan los datos %%%

        [XtrainNormal,mu,sigma]=zscore(Xtrain);
        XtestNormal=(Xtest - repmat(mu,size(Xtest,1),1))./repmat(sigma,size(Xtest,1),1);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%% Entrenamiento de los modelos. Recuerde que es un modelo por cada clase. %%%

        NumeroNeuronas=80;
        Modelo=entrenarRNAClassication(Xtrain,Ytrain,NumeroNeuronas);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %%% Validaci?n de los modelos. %%%

        Yest=testRNA(Modelo,Xtest);
        [~,Yest]=max(Yest,[],2);

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        MatrizConfusion=zeros(NumClases,NumClases);
        for i=1:size(Xtest,1)
            MatrizConfusion(Yest(i),Ytest(i))=MatrizConfusion(Yest(i),Ytest(i)) + 1;
        end
        EficienciaTest(fold)=sum(diag(MatrizConfusion))/sum(sum(MatrizConfusion));

    end

    Eficiencia = mean(EficienciaTest);
    IC = std(EficienciaTest);
    Texto=['La eficiencia obtenida fue = ', num2str(Eficiencia),' +- ',num2str(IC)];
    disp(Texto);

    %%% Fin punto de clasificaci?n %%%
end
