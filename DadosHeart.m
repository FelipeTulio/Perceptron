%-----------------------------------------------------------------------------
%
% Autor: Renato Dourado Maia - Última Alteração em agosto de 2011
%
% function [XTreino,YTreino, XValidacao, YValidacao] = DadosHeart
%
% Função para organizar dados do arquivo heart.txt em conjuntos de treinamento 
% e validaçao
%
% Dependência: heart.txt
%
% Argumentos de entrada: não há
%
% Argumentos de saída:
%
%   XTreino    ==> matriz com padrões de treinamento (padrões por coluna)
%
%   YTreino    ==> vetor com saídas desejadas para padrões de treinamento
%
%   XValidacao ==> matriz com padrões de validação (padrões por coluna)
%
%   YValidacao ==> vetor com saidas desejadas para padrões de validação
%
%      A saída desejada para o padrão da coluna i das matrizes XTreino e
%      XValidacao é o elemento da posição i dos vetores YTreino e YValidacao,
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

% Número de padrões para treinamento: serão separados 100 pacientes doentes e 
% 100 saudáveis no conjunto de treinamento, ficando o restante no conjunto de 
% validaçao
PadroesTrei = 100;

% Ordena o vetor de dados pela coluna 14 (saudaveis/doentes). Cria uma
% matriz ordenada pela coluna 14 que refere-se a ausencia ou presenca da
% doenca de coraçao
hordenado = sortrows(heart,14);

% Escolha aleatória de 100 pacientes saudáveis para treinamento
h1 = randperm(150); 
x1_treinamento   = hordenado(h1(1:PadroesTrei),:);

% Escolha aleatória de 100 pacientes doentes para treinamento
h2 = randperm(120);
x2_treinamento   = hordenado(150 + h2(1:PadroesTrei), :);   

% Montando matrizes de dados de maneira adequada:
% padrões por coluna na matriz de entrada e saidas
% por linha na matriz de saídas
XTreino  = [x1_treinamento(:,1:13)' x2_treinamento(:,1:13)'];		
% Subtrai-se um para que se tenha classes 0 e 1, ao invés de 1 e 2
YTreino  = [x1_treinamento(:,14)' x2_treinamento(:,14)'] - 1;   		
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
% Organizando dados em conjunto de validação

% Seleciona dados para validação e monta matrizes de dados tal como foi feito 
% para os dados de treinamento
x1_validacao  = hordenado(h1(PadroesTrei + 1:150),:); 		
x2_validacao  = hordenado(150 + h2(PadroesTrei + 1:120), :); 
XValidacao = [x1_validacao(:,1:13)' x2_validacao(:,1:13)'];	
YValidacao = [x1_validacao(:,14)' x2_validacao(:,14)']-1;   	
%-----------------------------------------------------------------------------