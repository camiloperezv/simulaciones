function ErrorCrt=Criterio (Xtrain , Ytrain , Xtest , Ytest)

Modelo = TreeBagger(2,Xtrain,Ytrain); 
Yest =predict (Modelo , Xtest) ;
Yest = str2double(Yest);
ErrorCrt = sum(Ytest ~= Yest)/length(Yest);
