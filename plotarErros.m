function plotarErros( vetordeErros )
%PLOTARERROS Summary of this function goes here
%   Detailed explanation goes here

% Gr�fico do erro quadr�tico por �poca
figure
plot(vetordeErros, '^-')
grid on
xlabel('�poca')
ylabel('Erro Quadr�tico')
title('Erro Quadr�tico por �poca de treinamento')
end

