function [W vetordeErros] = treino( maxEpocas, taxaAprendizado, X, Yd, E )

%Inicializa��o dos dados

%numPadroes � uma vari�vel que guarda o n�mero de colunas da matriz de
%entrada. Neste caso, cada coluna representa um padr�o.
numPadroes = size(X,2);

%dimensao � uma vari�vel que armazena a quantidade de linhas neste caso.
%Ela representa o valor de dimens�es que os padr�es possuem.
dimensao = size(X,1);


%Polariza��o da matriz X (inser��o do bias)
pol = -1 * ones(1,numPadroes);
X = [pol; X ];

%Declara��o rand�mica do vetor de pesos (W) e inser��o do bias
Wlimite = 0.5;
W = 2*Wlimite*rand(1, dimensao)-Wlimite;
bias = rand(1,1);
%jun��o dos valores obtidos acima
W = [bias W];

%Declara��o de vari�veis de controle
epoca = 0;
vetordeErros = zeros(1,maxEpocas);

%la�o de treino
while(true)
    
    erroEpoca = 0;
    
    %A vari�vel indice � um vetor gerado randomicamente de tamanho igual a quantidade de
    %padr�es de entrada, usado para apresentar � rede os padr�es de forma
    %aleat�ria.
    indice = randperm(numPadroes);
    
    %la�o que faz o treinamento supervisionado
    for i = 1 : numPadroes
        
        %executa c�lculo para descobrir o valor de Y
        Y = (W * X(:,indice(i)') >= 0);
        
        %calcula o erro
        erro = Yd(indice(i)) - Y;
        
        %calcula e atualiza o novo vetor de W
        W = W + (taxaAprendizado * erro * X(:,indice(i))');
        
        %atualiza o erro quadr�tico da �poca
        erroEpoca = erroEpoca + (erro^2);
        
    end
    
    %guarda o erro da �poca no vetor de erros
    vetordeErros(1,epoca+1) = erroEpoca/numPadroes;
    epoca = epoca + 1;

    if (erroEpoca < E || epoca == maxEpocas) 
        break;
    end
    
end

end

