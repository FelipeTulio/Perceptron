fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                         INTELIG�NCIA COMPUTACIONAL                     |\n');
fprintf('|                              REDE PERCEPTRON                           |\n');
fprintf('|                         (Prof. Renato Dourado Maia)                    |\n');
fprintf('|                     Acad�mico: Felipe T�lio de Castro                  |\n');
fprintf('|                                  FACIT                                 |\n');
fprintf('+------------------------------------------------------------------------+\n');

disp(' ');
disp(' ');
disp('PROBLEMA DE SEPARA��O DE DUAS CLASSES');
disp(' ');
disp(' ');
disp('Pressione qualquer tecla para o processamento inicie..');
disp(' ')
pause

%vari�veis que recebem a quantidade de padr�es
pa = 50;
pb = 50;

disp('Esta � a primeira execu��o da rede. O perceptron ser� treinado...');
%atribui��es de valores (inicializa��o)
[ClasseA] = Gaussclass(pa, [1 1], 0.5);
[ClasseB] = Gaussclass(pb, [4 4], 0.5);
entradas = [ClasseA ClasseB];
Yd = [zeros(1,pa) ones(1,pb)];

%chamada da fun��o treino
[W vetordeErros] = treino(50, 0.5, entradas, Yd, 0.001);

% Impress�o na tela dos resultados obtidos no treinamento
disp('__________________________________________________________________ ')
disp(' Resultados do treinamento:')
disp(' ')
fprintf('   >>> O valor obtido para o bias foi  : %f\n', W(1))
fprintf('   >>> O valor obtido para o peso 1 foi: %f\n', W(2))
fprintf('   >>> O valor obtido para o peso 2 foi: %f\n', W(3))

disp('__________________________________________________________________ ')
disp(' ');
disp('');

disp('Pressione qualquer tecla para continuar...');
pause

%intera��o co usu�rio
op = input('Deseja plotar o gr�fico dos erros quadr�ticos? (1) Sim e (2) N�o: ');

%se quiser imprimir o gr�fico de erros fa�a..
if(op == 1)
    plotarErros(vetordeErros);
    opcaoplot = input('Deseja plotar o gr�fico da reta de separa��o? (3) Sim e (4) N�o: ');
        if(opcaoplot == 3)
             %plotar gr�fico da reta
             plotarReta(ClasseA, ClasseB, W, entradas);
        end
    opcao = input('Deseja executar o perceptron(valida��o da rede)? (5) Sim e (6) N�o: ');
    
        %caso o usu�rio deseje executar a valida��o fa�a...
        if(opcao == 5)
            cont = 0;
            [ClasseA] = Gaussclass(pa, [1 1], 0.5);
            [ClasseB] = Gaussclass(pb, [4 4], 0.5);
            XValidacao = [ClasseA ClasseB];
            numPadroes = size(XValidacao,2);
            Yd = [zeros(1,pa) ones(1,pb)];
            Y = yperceptron(XValidacao, W);
            for i = 1 : 70
                if(Y(i) == Yd(i))
                  cont = cont + 1;
                end
            end
        
            perc = (cont * 100)/numPadroes;
            disp('');
            disp('');
            fprintf('A rede acertou: %6.2f%%\n', perc);
        end
        %caso o usu�rio n�o deseje executar a valida��o..
        if(opcao == 6)
            disp('');
            disp('Objetivos conclu�dos. At� mais!');
        end
end

%se o usu�rio n�o quiser imprimir gr�ficos fa�a..
if(op == 2)
    opcao = input('Deseja executar o perceptron(valida��o da rede)? (3) Sim e (4) N�o: ');
    
    %verifica se quer executar a valida��o..
    if(opcao == 3)
        cont = 0;
        [ClasseA] = Gaussclass(pa, [1 1], 0.5);
        [ClasseB] = Gaussclass(pb, [4 4], 0.5);
        XValidacao = [ClasseA ClasseB];
        numPadroes = size(XValidacao,2);
        Yd = [zeros(1,pa) ones(1,pb)];
        Y = yperceptron(XValidacao, W);
        for i = 1 : 70
            if(Y(i) == Yd(i))
                cont = cont + 1;
            end
        end
        
        perc = (cont * 100)/numPadroes;
        disp('');
        disp('');
        fprintf('A rede acertou: %6.2f%%\n\n', perc);
    end
    
    %se n�o quiser executar a valida��o fa�a..
    if(opcao == 4)
        disp('');
        disp('Objetivos conclu�dos. At� mais!');
    end
end

    