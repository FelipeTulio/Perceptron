function [ Y ] = yperceptron( XValidacao, W )
%YPERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

    numPadroes = size(XValidacao,2);
    
    %Polarização da matriz X (inserção do bias)
    pol = -1 * ones(1,numPadroes);
    XValidacao = [pol; XValidacao ];
    
    %declaração do vetor de saída para otimizar o código
    Y = zeros(1,numPadroes);

    %laço de repetição para executar os cálculos
    for i = 1 : numPadroes
        
        %executa cálculo para descobrir o valor de Y
        Y(i) = (W * XValidacao(:,i') >= 0);
        
    end

end

