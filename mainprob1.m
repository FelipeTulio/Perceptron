fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                         INTELIGÊNCIA COMPUTACIONAL                     |\n');
fprintf('|                              REDE PERCEPTRON                           |\n');
fprintf('|                         (Prof. Renato Dourado Maia)                    |\n');
fprintf('|                     Acadêmico: Felipe Túlio de Castro                  |\n');
fprintf('|                                  FACIT                                 |\n');
fprintf('+------------------------------------------------------------------------+\n');

disp(' ');
disp(' ');
disp('PROBLEMA DE SEPARAÇÃO DE DUAS CLASSES');
disp(' ');
disp(' ');
disp('Pressione qualquer tecla para o processamento inicie..');
disp(' ')
pause

%variáveis que recebem a quantidade de padrões
pa = 50;
pb = 50;

disp('Esta é a primeira execução da rede. O perceptron será treinado...');
%atribuições de valores (inicialização)
[ClasseA] = Gaussclass(pa, [1 1], 0.5);
[ClasseB] = Gaussclass(pb, [4 4], 0.5);
entradas = [ClasseA ClasseB];
Yd = [zeros(1,pa) ones(1,pb)];

%chamada da função treino
[W vetordeErros] = treino(50, 0.5, entradas, Yd, 0.001);

% Impressão na tela dos resultados obtidos no treinamento
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

%interação co usuário
op = input('Deseja plotar o gráfico dos erros quadráticos? (1) Sim e (2) Não: ');

%se quiser imprimir o gráfico de erros faça..
if(op == 1)
    plotarErros(vetordeErros);
    opcaoplot = input('Deseja plotar o gráfico da reta de separação? (3) Sim e (4) Não: ');
        if(opcaoplot == 3)
             %plotar gráfico da reta
             plotarReta(ClasseA, ClasseB, W, entradas);
        end
    opcao = input('Deseja executar o perceptron(validação da rede)? (5) Sim e (6) Não: ');
    
        %caso o usuário deseje executar a validação faça...
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
        %caso o usuário não deseje executar a validação..
        if(opcao == 6)
            disp('');
            disp('Objetivos concluídos. Até mais!');
        end
end

%se o usuário não quiser imprimir gráficos faça..
if(op == 2)
    opcao = input('Deseja executar o perceptron(validação da rede)? (3) Sim e (4) Não: ');
    
    %verifica se quer executar a validação..
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
    
    %se não quiser executar a validação faça..
    if(opcao == 4)
        disp('');
        disp('Objetivos concluídos. Até mais!');
    end
end

    