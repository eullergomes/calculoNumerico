% Definição da função a ser analisada
%f = @(x) x^2 - 2;
%f = @(x) 0.25*x^4 + 2.1*x^3 - 7.3*x^2 + 3.04;
%f = @(x) -30/log(x) + 2*x + 10;
%f = @(x) exp(x) + power(log(x),-1) - 10;
f = @(x) 2*log(3-cos(x)) - 3*x^x + 5*sin(x);
%f = @(x) -0.8*x^3 + 1.994*x^2 + 20.01*x - 9.86;
% Intervalo inicial [a,b] e tolerância desejada
a = 1.6;
b = 1.8;
tol = 1e-5j ;

% Inicialização das variáveis
iter = 0;
max_iter = ceil(log2((b-a)/tol));
a_old = a;
b_old = b;

% Cabeçalho da tabela
fprintf('Iteração\t a\t\t b\t\t x\t\t f(x)\n');

while iter < max_iter
    % Encontra o ponto médio
    x = (a + b)/2;
    fx = f(x);
    
    % Atualiza os limites do intervalo
    if fx == 0 || (b-a)/2 < tol
        break;
    elseif sign(fx) == sign(f(a))
        a = x;
    else
        b = x;
    end
    
    % Imprime os resultados
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\n', iter+1, a_old, b_old, x, fx);
    
    % Atualiza as variáveis
    iter = iter + 1;
    a_old = a;
    b_old = b;
end

% Imprime a raiz encontrada
fprintf('\nA raiz da equação é: %.6f\n', x);
