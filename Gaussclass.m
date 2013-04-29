%-----------------------------------------------------------------------------
%
% Autor: Renato Dourado Maia - Última Alteração em agosto de 2011
%
% function [Classe] = Gaussclass(NumeroPadroes, Medias, DesvioPadrao)
%
% Função para gerar classes gaussianas n-dimensionais, considerando correlação
% nula
%
% Argumentos de entrada: 
%
%   NumeroPadroes ==> número de padrões a serem gerados na classe
%
%   Medias        ==> vetor com médias para cada variável (linha)
%
%   DesvioPadrao  ==> desvio padrão da classe (igual para todas as variáveis)
%
%
% Argumentos de saida:
%
%   Classe ==> matriz com a classe gerada (padrões por coluna)
%
%-----------------------------------------------------------------------------

function [Classe] = Gaussclass(NumeroPadroes, Medias, DesvioPadrao)

%-----------------------------------------------------------------------------

% Computa o número de variáveis da classe
Dimensao = length(Medias);

% Gera matriz de dados aleatórios (média zero e desvio padrão um)
x = randn(Dimensao, NumeroPadroes);

% Matriz para deslocamento das médias
m = repmat(Medias', 1, NumeroPadroes);

% Deslocando (inserindo as médias) e ajustando o desvio padrão
Classe = m + DesvioPadrao*x; 
%-----------------------------------------------------------------------------
