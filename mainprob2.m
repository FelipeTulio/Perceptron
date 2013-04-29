fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                         INTELIG�NCIA COMPUTACIONAL                     |\n');
fprintf('|                              REDE PERCEPTRON                           |\n');
fprintf('|                         (Prof. Renato Dourado Maia)                    |\n');
fprintf('|                     Acad�mico: Felipe T�lio de Castro                  |\n');
fprintf('|                                  FACIT                                 |\n');
fprintf('+------------------------------------------------------------------------+\n');

disp(' ');
disp(' ');
disp('PROBLEMA DE DIAGN�STICO DE DOEN�A CARD�ACA');
disp(' ');
disp(' ');
disp('Pressione qualquer tecla para o processamento inicie..');
disp(' ')
pause

disp('Esta � a primeira execu��o da rede. O perceptron ser� treinado...');
[XTreino,YTreino, XValidacao, YValidacao] = DadosHeart;

%chamada da fun��o treino
[W vetordeErros] = treino(40, 0.005, XTreino, YTreino, 0.001);

% Impress�o na tela dos resultados obtidos no treinamento
disp('__________________________________________________________________ ')
disp(' Resultados do treinamento:')
disp(' ')
fprintf('   >>> O valor obtido para o bias foi  : %f\n', W(1))
fprintf('   >>> O valor obtido para o peso 1 foi: %f\n', W(2))
fprintf('   >>> O valor obtido para o peso 2 foi: %f\n', W(3))
fprintf('   >>> O valor obtido para o peso 3 foi: %f\n', W(4))
fprintf('   >>> O valor obtido para o peso 4 foi: %f\n', W(5))
fprintf('   >>> O valor obtido para o peso 5 foi: %f\n', W(6))
fprintf('   >>> O valor obtido para o peso 6 foi: %f\n', W(7))
fprintf('   >>> O valor obtido para o peso 7 foi: %f\n', W(8))
fprintf('   >>> O valor obtido para o peso 8 foi: %f\n', W(9))
fprintf('   >>> O valor obtido para o peso 9 foi: %f\n', W(10))
fprintf('   >>> O valor obtido para o peso 10 foi: %f\n', W(11))
fprintf('   >>> O valor obtido para o peso 11 foi: %f\n', W(12))
fprintf('   >>> O valor obtido para o peso 12 foi: %f\n', W(13))
fprintf('   >>> O valor obtido para o peso 13 foi: %f\n', W(14))

disp('__________________________________________________________________ ')
disp(' ')

disp('Pressione qualquer tecla para continuar...');
pause

op = input('Deseja plotar o gr�fico dos erros quadr�ticos? (1) Sim e (2) N�o: ');

%verifica se deseja imprimir o gr�fico de erros..
if(op == 1)
    plotarErros(vetordeErros);
    
    %verifica se deseja executar a valida��o da rede..
    opcao = input('Deseja executar o perceptron(valida��o da rede)? (3) Sim e (4) N�o: ');
    if(opcao == 3)
        cont = 0;
        numPadroes = size(XValidacao,2);

        Y = yperceptron(XValidacao, W);
        for i = 1 : numPadroes
            if(Y(i) == YValidacao(i))
                cont = cont + 1;
            end
        end
        
        perc = (cont * 100)/numPadroes;
        disp('');
        disp('');
        fprintf('A rede acertou: %6.2f%%\n', perc);
    end
    if(opcao == 4)
        disp('');
        disp('Objetivos conclu�dos. At� mais!');
    end
end

%caso o usu�rio n�o deseje imprimir o gr�fico, fa�a..
if(op == 2)
    opcao = input('Deseja executar o perceptron(valida��o da rede)? (3) Sim e (4) N�o: ');
    if(opcao == 3)
        cont = 0;
        numPadroes = size(XValidacao,2);

        Y = yperceptron(XValidacao, W);
        for i = 1 : numPadroes
            if(Y(i) == YValidacao(i))
                cont = cont + 1;
            end
        end
        
        perc = (cont * 100)/numPadroes;
        disp('');
        disp('');
        fprintf('A rede acertou: %6.2f%%\n', perc);
    end
    
    %se o usu�rio n�o quiser executar a valida��o..
    if(opcao == 4)
        disp('');
        disp('Objetivos conclu�dos. At� mais!');
    end
end
    