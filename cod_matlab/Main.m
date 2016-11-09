
clc
clear all
close all
Rept=10;

load('db/bank-aditional-proccessed.mat');
punto=input('Ingrese 1 para VecinosCercanos 2 para Random Forest 3 para RNA CLASSIFICATION, 4 SVM, 5 REDUCCION SFS: ');
if punto==1
    Txt = strcat(' ********************* VECINOS CERCANOS **********************');
    disp(Txt);
    Txt = strcat(' ----------------------- CON 10 VECINOS');
    disp(Txt);
    numVecinos = 10;
    [ModVecinosX1_10,YESTVecinosX1_10] = FunVecinosCercanos(X1,Y1,numVecinos,'X1');
    [ModVecinosX2_10,YESTVecinosX2_10] = FunVecinosCercanos(X2,Y2,numVecinos,'X2');
    [ModVecinosX3_10,YESTVecinosX3_10] = FunVecinosCercanos(X3,Y3,numVecinos,'X3');
    [ModVecinosX4_10,YESTVecinosX4_10] = FunVecinosCercanos(X4,Y4,numVecinos,'X4');
    [ModVecinosX5_10,YESTVecinosX5_10] = FunVecinosCercanos(X5,Y5,numVecinos,'X5');
    [ModVecinosX6_10,YESTVecinosX6_10] = FunVecinosCercanos(X6,Y6,numVecinos,'X6');
    [ModVecinosX7_10,YESTVecinosX7_10] = FunVecinosCercanos(X7,Y7,numVecinos,'X7');
    
    Txt = strcat('----------------------- CON 20 VECINOS');
    disp(Txt);
    numVecinos = 20;
    [ModVecinosX1_20,YESTVecinosX1_20] = FunVecinosCercanos(X1,Y1,numVecinos,'X1');
    [ModVecinosX2_20,YESTVecinosX2_20] = FunVecinosCercanos(X2,Y2,numVecinos,'X2');
    [ModVecinosX3_20,YESTVecinosX3_20] = FunVecinosCercanos(X3,Y3,numVecinos,'X3');
    [ModVecinosX4_20,YESTVecinosX4_20] = FunVecinosCercanos(X4,Y4,numVecinos,'X4');
    [ModVecinosX5_20,YESTVecinosX5_20] = FunVecinosCercanos(X5,Y5,numVecinos,'X5');
    [ModVecinosX6_20,YESTVecinosX6_20] = FunVecinosCercanos(X6,Y6,numVecinos,'X6');
    [ModVecinosX7_20,YESTVecinosX7_20] = FunVecinosCercanos(X7,Y7,numVecinos,'X7');
    
    Txt = strcat('----------------------------- CON 50 VECINOS');
    disp(Txt);
    numVecinos = 50;
    [ModVecinosX1_50,YESTVecinosX1_50] = FunVecinosCercanos(X1,Y1,numVecinos,'X1');
    [ModVecinosX2_50,YESTVecinosX2_50] = FunVecinosCercanos(X2,Y2,numVecinos,'X2');
    [ModVecinosX3_50,YESTVecinosX3_50] = FunVecinosCercanos(X3,Y3,numVecinos,'X3');
    [ModVecinosX4_50,YESTVecinosX4_50] = FunVecinosCercanos(X4,Y4,numVecinos,'X4');
    [ModVecinosX5_50,YESTVecinosX5_50] = FunVecinosCercanos(X5,Y5,numVecinos,'X5');
    [ModVecinosX6_50,YESTVecinosX6_50] = FunVecinosCercanos(X6,Y6,numVecinos,'X6');
    [ModVecinosX7_50,YESTVecinosX7_50] = FunVecinosCercanos(X7,Y7,numVecinos,'X7');
    save('ModVecinos.m','ModVecinosX1_10','YESTVecinosX1_10','ModVecinosX2_10','YESTVecinosX2_10','ModVecinosX3_10','YESTVecinosX3_10','ModVecinosX4_10','YESTVecinosX4_10','ModVecinosX5_10','YESTVecinosX5_10','ModVecinosX6_10','YESTVecinosX6_10','ModVecinosX7_10','YESTVecinosX7_10','ModVecinosX1_20','YESTVecinosX1_20','ModVecinosX2_20','YESTVecinosX2_20','ModVecinosX3_20','YESTVecinosX3_20','ModVecinosX4_20','YESTVecinosX4_20','ModVecinosX5_20','YESTVecinosX5_20','ModVecinosX6_20','YESTVecinosX6_20','ModVecinosX7_20','YESTVecinosX7_20','ModVecinosX1_50','YESTVecinosX1_50','ModVecinosX2_50','YESTVecinosX2_50','ModVecinosX3_50','YESTVecinosX3_50','ModVecinosX4_50','YESTVecinosX4_50','ModVecinosX5_50','YESTVecinosX5_50','ModVecinosX6_50','YESTVecinosX6_50','ModVecinosX7_50','YESTVecinosX7_50');
%elseif punto==2
    Txt = strcat(' ********************* RANDOM FOREST **********************');
    disp(Txt);
    Txt = strcat('----------------------------- CON 5 ARBOLES');
    disp(Txt);
    NumArboles = 5;
    [ModArbolesX1_5,YESTArbolesX1_5] = FunRandomForest(X1,Y1,NumArboles,'X1');
    [ModArbolesX2_5,YESTArbolesX2_5] = FunRandomForest(X2,Y2,NumArboles,'X2');
    [ModArbolesX3_5,YESTArbolesX3_5] = FunRandomForest(X3,Y3,NumArboles,'X3');
    [ModArbolesX4_5,YESTArbolesX4_5] = FunRandomForest(X4,Y4,NumArboles,'X4');
    [ModArbolesX5_5,YESTArbolesX5_5] = FunRandomForest(X5,Y5,NumArboles,'X5');
    [ModArbolesX6_5,YESTArbolesX6_5] = FunRandomForest(X6,Y6,NumArboles,'X6');
    [ModArbolesX7_5,YESTArbolesX7_5] = FunRandomForest(X7,Y7,NumArboles,'X7');
    
    Txt = strcat('----------------------------- CON 10 ARBOLES');
    disp(Txt);
    NumArboles = 10;
    [ModArbolesX1_10,YESTArbolesX1_10] = FunRandomForest(X1,Y1,NumArboles,'X1');
    [ModArbolesX2_10,YESTArbolesX2_10] = FunRandomForest(X2,Y2,NumArboles,'X2');
    [ModArbolesX3_10,YESTArbolesX3_10] = FunRandomForest(X3,Y3,NumArboles,'X3');
    [ModArbolesX4_10,YESTArbolesX4_10] = FunRandomForest(X4,Y4,NumArboles,'X4');
    [ModArbolesX5_10,YESTArbolesX5_10] = FunRandomForest(X5,Y5,NumArboles,'X5');
    [ModArbolesX6_10,YESTArbolesX6_10] = FunRandomForest(X6,Y6,NumArboles,'X6');
    [ModArbolesX7_10,YESTArbolesX7_10] = FunRandomForest(X7,Y7,NumArboles,'X7');
    
    
    
    Txt = strcat('----------------------------- CON 20 ARBOLES');
    disp(Txt);
    NumArboles = 20;
    [ModArbolesX1_20,YESTArbolesX1_20] = FunRandomForest(X1,Y1,NumArboles,'X1');
    [ModArbolesX2_20,YESTArbolesX2_20] = FunRandomForest(X2,Y2,NumArboles,'X2');
    [ModArbolesX3_20,YESTArbolesX3_20] = FunRandomForest(X3,Y3,NumArboles,'X3');
    [ModArbolesX4_20,YESTArbolesX4_20] = FunRandomForest(X4,Y4,NumArboles,'X4');
    [ModArbolesX5_20,YESTArbolesX5_20] = FunRandomForest(X5,Y5,NumArboles,'X5');
    [ModArbolesX6_20,YESTArbolesX6_20] = FunRandomForest(X6,Y6,NumArboles,'X6');
    [ModArbolesX7_20,YESTArbolesX7_20] = FunRandomForest(X7,Y7,NumArboles,'X7');
    
    
    
    Txt = strcat('----------------------------- CON 50 ARBOLES');
    disp(Txt);
    NumArboles = 50;
    [ModArbolesX1_50,YESTArbolesX1_50] = FunRandomForest(X1,Y1,NumArboles,'X1');
    [ModArbolesX2_50,YESTArbolesX2_50] = FunRandomForest(X2,Y2,NumArboles,'X2');
    [ModArbolesX3_50,YESTArbolesX3_50] = FunRandomForest(X3,Y3,NumArboles,'X3');
    [ModArbolesX4_50,YESTArbolesX4_50] = FunRandomForest(X4,Y4,NumArboles,'X4');
    [ModArbolesX5_50,YESTArbolesX5_50] = FunRandomForest(X5,Y5,NumArboles,'X5');
    [ModArbolesX6_50,YESTArbolesX6_50] = FunRandomForest(X6,Y6,NumArboles,'X6');
    [ModArbolesX7_50,YESTArbolesX7_50] = FunRandomForest(X7,Y7,NumArboles,'X7');

    save('ModRandomForest.m','ModArbolesX1_5','YESTArbolesX1_5','ModArbolesX2_5','YESTArbolesX2_5','ModArbolesX3_5','YESTArbolesX3_5','ModArbolesX4_5','YESTArbolesX4_5','ModArbolesX5_5','YESTArbolesX5_5','ModArbolesX6_5','YESTArbolesX6_5','ModArbolesX7_5','YESTArbolesX7_5','ModArbolesX1_10','YESTArbolesX1_10','ModArbolesX2_10','YESTArbolesX2_10','ModArbolesX3_10','YESTArbolesX3_10','ModArbolesX4_10','YESTArbolesX4_10','ModArbolesX5_10','YESTArbolesX5_10','ModArbolesX6_10','YESTArbolesX6_10','ModArbolesX7_10','YESTArbolesX7_10','ModArbolesX1_20','YESTArbolesX1_20','ModArbolesX2_20','YESTArbolesX2_20','ModArbolesX3_20','YESTArbolesX3_20','ModArbolesX4_20','YESTArbolesX4_20','ModArbolesX5_20','YESTArbolesX5_20','ModArbolesX6_20','YESTArbolesX6_20','ModArbolesX7_20','YESTArbolesX7_20','ModArbolesX1_50','YESTArbolesX1_50','ModArbolesX2_50','YESTArbolesX2_50','ModArbolesX3_50','YESTArbolesX3_50','ModArbolesX4_50','YESTArbolesX4_50','ModArbolesX5_50','YESTArbolesX5_50','ModArbolesX6_50','YESTArbolesX6_50','ModArbolesX7_50','YESTArbolesX7_50');
%elseif punto==5
    %%Punto lab 6 reduccion sfs
    Txt = strcat(' ********************* SFS **********************');
    disp(Txt);
    f=@ErrorCrt;
    Txt = strcat('Probando con la variable x1');
    ModSFSX1 = sequentialfs(f,X1,Y1);
    Txt = strcat('Probando con la variable x2');
    ModSFSX2 = sequentialfs(f,X2,Y2);
    Txt = strcat('Probando con la variable x3');
    ModSFSX3 = sequentialfs(f,X3,Y3);
    Txt = strcat('Probando con la variable x4');
    ModSFSX4 = sequentialfs(f,X4,Y4);
    Txt = strcat('Probando con la variable x5');
    ModSFSX5 = sequentialfs(f,X5,Y5);
    Txt = strcat('Probando con la variable x6');
    ModSFSX6 = sequentialfs(f,X6,Y6);
    Txt = strcat('Probando con la variable x7');
    ModSFSX7 = sequentialfs(f,X7,Y7); 
    save('ModRandomSFS.m','ModSFSX1','ModSFSX2','ModSFSX3','ModSFSX4','ModSFSX5','ModSFSX6','ModSFSX7');
%elseif punto==3
    Txt = strcat(' ********************* RNA **********************');
    disp(Txt);
    [ModRNAX1,YESTRNAX1] = FunRNA(X1,Y1,'X1');
    [ModRNAX2,YESTRNAX2] = FunRNA(X2,Y2,'X2');
    [ModRNAX3,YESTRNAX3] = FunRNA(X3,Y3,'X3');
    [ModRNAX4,YESTRNAX4] = FunRNA(X4,Y4,'X4');
    [ModRNAX5,YESTRNAX5] = FunRNA(X5,Y5,'X5');
    [ModRNAX6,YESTRNAX6] = FunRNA(X6,Y6,'X6');
    [ModRNAX7,YESTRNAX7] = FunRNA(X7,Y7,'X7');
    save('ModRNA.m','ModRNAX1','YESTRNAX1','ModRNAX2','YESTRNAX2','ModRNAX3','YESTRNAX3','ModRNAX4','YESTRNAX4','ModRNAX5','YESTRNAX5','ModRNAX6','YESTRNAX6','ModRNAX7','YESTRNAX7');
elseif punto == 4
    Txt = strcat(' ********************* SVM **********************');
    disp(Txt);
    boxConstraint = 100;
    %Txt = strcat('Probando con la variable x1');
    %disp(Txt);
    %[ModSVMX1_100,YESTSVMX1_100] = FunSVM(X1,Y1,boxConstraint,'X1');
    %Txt = strcat('Probando con la variable x2');
    %disp(Txt);
    %[ModSVMX2_100,YESTSVMX2_100] = FunSVM(X2,Y2,boxConstraint,'X2');
    %Txt = strcat('Probando con la variable x3');
    %disp(Txt);
    %[ModSVMX3_100,YESTSVMX3_100] = FunSVM(X3,Y3,boxConstraint,'X3');
    Txt = strcat('Probando con la variable x4');
    disp(Txt);
    [ModSVMX4_100,YESTSVMX4_100] = FunSVM(X4,Y4,boxConstraint,'X4');
    Txt = strcat('Probando con la variable x5');
    disp(Txt);
    [ModSVMX5_100,YESTSVMX5_100] = FunSVM(X5,Y5,boxConstraint,'X5');
    Txt = strcat('Probando con la variable x6');
    disp(Txt);
    [ModSVMX6_100,YESTSVMX6_100] = FunSVM(X6,Y6,boxConstraint,'X6');
    Txt = strcat('Probando con la variable x7');
    disp(Txt);
    [ModSVMX7_100,YESTSVMX7_100] = FunSVM(X7,Y7,boxConstraint,'X7');
    save('ModSVM.m','ModSVMX1_100','YESTSVMX1_100','ModSVMX2_100','YESTSVMX2_100','ModSVMX3_100','YESTSVMX3_100','ModSVMX4_100','YESTSVMX4_100','ModSVMX5_100','YESTSVMX5_100','ModSVMX6_100','YESTSVMX6_100','ModSVMX7_100','YESTSVMX7_100');

elseif punto==6

    %FISHER
end

