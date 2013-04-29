function [ Y ] = yperceptron( XValidacao, W )
%YPERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

    numPadroes = size(XValidacao,2);
    
    %Polariza��o da matriz X (inser��o do bias)
    pol = -1 * ones(1,numPadroes);
    XValidacao = [pol; XValidacao ];
    
    %declara��o do vetor de sa�da para otimizar o c�digo
    Y = zeros(1,numPadroes);

    %la�o de repeti��o para executar os c�lculos
    for i = 1 : numPadroes
        
        %executa c�lculo para descobrir o valor de Y
        Y(i) = (W * XValidacao(:,i') >= 0);
        
    end

end

