%-----------------------------------------------------------------------------
%
% Autor: Renato Dourado Maia - �ltima Altera��o em agosto de 2011
%
% function [Classe] = Gaussclass(NumeroPadroes, Medias, DesvioPadrao)
%
% Fun��o para gerar classes gaussianas n-dimensionais, considerando correla��o
% nula
%
% Argumentos de entrada: 
%
%   NumeroPadroes ==> n�mero de padr�es a serem gerados na classe
%
%   Medias        ==> vetor com m�dias para cada vari�vel (linha)
%
%   DesvioPadrao  ==> desvio padr�o da classe (igual para todas as vari�veis)
%
%
% Argumentos de saida:
%
%   Classe ==> matriz com a classe gerada (padr�es por coluna)
%
%-----------------------------------------------------------------------------

function [Classe] = Gaussclass(NumeroPadroes, Medias, DesvioPadrao)

%-----------------------------------------------------------------------------

% Computa o n�mero de vari�veis da classe
Dimensao = length(Medias);

% Gera matriz de dados aleat�rios (m�dia zero e desvio padr�o um)
x = randn(Dimensao, NumeroPadroes);

% Matriz para deslocamento das m�dias
m = repmat(Medias', 1, NumeroPadroes);

% Deslocando (inserindo as m�dias) e ajustando o desvio padr�o
Classe = m + DesvioPadrao*x; 
%-----------------------------------------------------------------------------
