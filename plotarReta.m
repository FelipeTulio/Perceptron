function plotarReta(ClasseA, ClasseB, W, X)
%PLOTARRETA Summary of this function goes here
%   Detailed explanation goes here

    %plotagem dos padr�es das classes
    clf
    plot(ClasseA(1,:), ClasseA(2,:),'or')
    legend('Classe 1')
    hold on
    grid on
    plot (ClasseB(1,:), ClasseB(2,:), 'ob')
    legend('Classe 2')
    legend('Classe1','Classe 2')
    
    % Plotagem da reta de separa��o
    Reta = -(W(2)/W(3))*X(:,:) + W(1)/W(3);
    plot(X,Reta,'k--')
    xlabel('X_1')
    ylabel('X_2')
    title('Evolu��o da Reta de Separa��o a Cada �poca - AND L�gico')
    legend('Classe 1 = bolinha vermelha', 'Classe 2 = bolinha azul', 'Reta de Separa��o', 'Location', 'NorthWest')

end

