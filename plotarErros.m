function plotarErros( vetordeErros )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Gráfico do erro quadrático por época
figure
plot(vetordeErros, '^-')
grid on
xlabel('Época')
ylabel('Erro Quadrático')
title('Erro Quadrático por época de treinamento')
end

