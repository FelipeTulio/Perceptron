function [W vetordeErros] = treino( maxEpocas, taxaAprendizado, X, Yd, E )

%Inicialização dos dados

%numPadroes é uma variável que guarda o número de colunas da matriz de
%entrada. Neste caso, cada coluna representa um padrão.
numPadroes = size(X,2);

%dimensao é uma variável que armazena a quantidade de linhas neste caso.
%Ela representa o valor de dimensões que os padrões possuem.
dimensao = size(X,1);


%Polarização da matriz X (inserção do bias)
pol = -1 * ones(1,numPadroes);
X = [pol; X ];

%Declaração randômica do vetor de pesos (W) e inserção do bias
Wlimite = 0.5;
W = 2*Wlimite*rand(1, dimensao)-Wlimite;
bias = rand(1,1);
%junção dos valores obtidos acima
W = [bias W];

%Declaração de variáveis de controle
epoca = 0;
vetordeErros = zeros(1,maxEpocas);

%laço de treino
while(true)
    
    erroEpoca = 0;
    
    %A variável indice é um vetor gerado randomicamente de tamanho igual a quantidade de
    %padrões de entrada, usado para apresentar à rede os padrões de forma
    %aleatória.
    indice = randperm(numPadroes);
    
    %laço que faz o treinamento supervisionado
    for i = 1 : numPadroes
        
        %executa cálculo para descobrir o valor de Y
        Y = (W * X(:,indice(i)') >= 0);
        
        %calcula o erro
        erro = Yd(indice(i)) - Y;
        
        %calcula e atualiza o novo vetor de W
        W = W + (taxaAprendizado * erro * X(:,indice(i))');
        
        %atualiza o erro quadrático da época
        erroEpoca = erroEpoca + (erro^2);
        
    end
    
    %guarda o erro da época no vetor de erros
    vetordeErros(1,epoca+1) = erroEpoca/numPadroes;
    epoca = epoca + 1;

    if (erroEpoca < E || epoca == maxEpocas) 
        break;
    end
    
end

end

