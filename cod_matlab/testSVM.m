function [Ytest,PYtest] = testSVM(Modelo,Xtest)
    [Ytest, PYtest] = simlssvm(Modelo, Xtest);
end
