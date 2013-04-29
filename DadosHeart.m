%-----------------------------------------------------------------------------
%
% Autor: Renato Dourado Maia - �ltima Altera��o em agosto de 2011
%
% function [XTreino,YTreino, XValidacao, YValidacao] = DadosHeart
%
% Fun��o para organizar dados do arquivo heart.txt em conjuntos de treinamento 
% e valida�ao
%
% Depend�ncia: heart.txt
%
% Argumentos de entrada: n�o h�
%
% Argumentos de sa�da:
%
%   XTreino    ==> matriz com padr�es de treinamento (padr�es por coluna)
%
%   YTreino    ==> vetor com sa�das desejadas para padr�es de treinamento
%
%   XValidacao ==> matriz com padr�es de valida��o (padr�es por coluna)
%
%   YValidacao ==> vetor com saidas desejadas para padr�es de valida��o
%
%      A sa�da desejada para o padr�o da coluna i das matrizes XTreino e
%      XValidacao � o elemento da posi��o i dos vetores YTreino e YValidacao,
%      respectivamente.
%
%   Testado no Matlab R2010a e no Octave 3.2.4
%
%-----------------------------------------------------------------------------

function [XTreino,YTreino, XValidacao, YValidacao] = DadosHeart

%-----------------------------------------------------------------------------
% Carrega arquivo com dados de pacientes reais 

load heart.txt
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% Organizando dados em conjunto de treinamento 

% N�mero de padr�es para treinamento: ser�o separados 100 pacientes doentes e 
% 100 saud�veis no conjunto de treinamento, ficando o restante no conjunto de 
% valida�ao
PadroesTrei = 100;

% Ordena o vetor de dados pela coluna 14 (saudaveis/doentes). Cria uma
% matriz ordenada pela coluna 14 que refere-se a ausencia ou presenca da
% doenca de cora�ao
hordenado = sortrows(heart,14);

% Escolha aleat�ria de 100 pacientes saud�veis para treinamento
h1 = randperm(150); 
x1_treinamento   = hordenado(h1(1:PadroesTrei),:);

% Escolha aleat�ria de 100 pacientes doentes para treinamento
h2 = randperm(120);
x2_treinamento   = hordenado(150 + h2(1:PadroesTrei), :);   

% Montando matrizes de dados de maneira adequada:
% padr�es por coluna na matriz de entrada e saidas
% por linha na matriz de sa�das
XTreino  = [x1_treinamento(:,1:13)' x2_treinamento(:,1:13)'];		
% Subtrai-se um para que se tenha classes 0 e 1, ao inv�s de 1 e 2
YTreino  = [x1_treinamento(:,14)' x2_treinamento(:,14)'] - 1;   		
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% Organizando dados em conjunto de valida��o

% Seleciona dados para valida��o e monta matrizes de dados tal como foi feito 
% para os dados de treinamento
x1_validacao  = hordenado(h1(PadroesTrei + 1:150),:); 		
x2_validacao  = hordenado(150 + h2(PadroesTrei + 1:120), :); 
XValidacao = [x1_validacao(:,1:13)' x2_validacao(:,1:13)'];	
YValidacao = [x1_validacao(:,14)' x2_validacao(:,14)']-1;   	
%-----------------------------------------------------------------------------