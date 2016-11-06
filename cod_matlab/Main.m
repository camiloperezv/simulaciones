
clc
clear all
close all
Rept=10;

load('db/bank-aditional-proccessed.mat');
punto=input('Ingrese 1 para VecinosCercanos 2 para Random Forest 3 para RNA CLASSIFICATION, 4 SVM, 5 REDUCCION SFS: ');
if punto==1
    numVecinos = 5;
    FunVecinosCercanos(X1,Y1,numVecinos,'X1');
    FunVecinosCercanos(X2,Y2,numVecinos,'X2');
    FunVecinosCercanos(X3,Y3,numVecinos,'X3');
    FunVecinosCercanos(X4,Y4,numVecinos,'X4');
    FunVecinosCercanos(X5,Y5,numVecinos,'X5');
    FunVecinosCercanos(X6,Y6,numVecinos,'X6');
    FunVecinosCercanos(X7,Y7,numVecinos,'X7');

elseif punto==2
    NumArboles = 10;
    FunRandomForest(X1,Y1,NumArboles,'X1');
    FunRandomForest(X2,Y2,NumArboles,'X2');
    FunRandomForest(X3,Y3,NumArboles,'X3');
    FunRandomForest(X4,Y4,NumArboles,'X4');
    FunRandomForest(X5,Y5,NumArboles,'X5');
    FunRandomForest(X6,Y6,NumArboles,'X6');
    FunRandomForest(X7,Y7,NumArboles,'X7');
    
elseif punto==3
    FunRNA(X1,Y1,'X1');
    FunRNA(X1,Y1,'X1');
    FunRNA(X2,Y2,'X2');
    FunRNA(X3,Y3,'X3');
    FunRNA(X4,Y4,'X4');
    FunRNA(X5,Y5,'X5');
    FunRNA(X6,Y6,'X6');
    FunRNA(X7,Y7,'X7');
elseif punto == 4
    boxConstraint = 100;
    FunSVM(X1,Y1,boxConstraint,'X1');
    FunSVM(X2,Y2,boxConstraint,'X2');
    FunSVM(X3,Y3,boxConstraint,'X3');
    FunSVM(X4,Y4,boxConstraint,'X4');
    FunSVM(X5,Y5,boxConstraint,'X5');
    FunSVM(X6,Y6,boxConstraint,'X6');
    FunSVM(X7,Y7,boxConstraint,'X7');
elseif punto==5
    %%Punto lab 6 reduccion sfs
    %%% Fin punto Random Forest %%%
    f=@ErrorCrt;
    Txt = strcat('Probando con la variable x1');
    sequentialfs(f,X1,Y1)
    Txt = strcat('Probando con la variable x2');
    sequentialfs(f,X2,Y2)
    Txt = strcat('Probando con la variable x3');
    sequentialfs(f,X3,Y3)
    Txt = strcat('Probando con la variable x4');
    sequentialfs(f,X4,Y4)
    Txt = strcat('Probando con la variable x5');
    sequentialfs(f,X5,Y5)
    Txt = strcat('Probando con la variable x6');
    sequentialfs(f,X6,Y6)
    Txt = strcat('Probando con la variable x7');
    sequentialfs(f,X7,Y7)
elseif punto==6

    %FISHER
end

