%function Modelo = entrenarSVM(X,Y,tipo,boxConstraint,sigma,kernel)
function Modelo = entrenarSVM(X,Y,tipo,boxConstraint,sigma)
    Modelo = trainlssvm({X,Y,tipo,boxConstraint,sigma});
    %Modelo = trainlssvm({X,Y,tipo,boxConstraint,sigma,kernel});
end
