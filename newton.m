% Definir a função que desejamos encontrar a raiz
%fun = @(x) 0.25*x^4 + 2.1*x^3 - 7.3*x^2 + 3.04;
%fun = @(x) exp(x) + power(log(x),-1) - 10;
fun = @(x) 0.25*x^3 - 5.876*x^2 + 5.306*x - 45.89;

% Definir a derivada da função
dfun = @(x) x^3 + 6.3*x^2 - 14.6*x;

% Definir o valor inicial de x
x0 = 22.5;

% Definir a tolerância desejada
tol = 1e-5;

% Definir o número máximo de iterações
max_iter = 100;

% Inicializar a tabela com as iterações
iter_table = zeros(max_iter, 3);
iter = 1;

% Inicializar o valor de x e o erro absoluto
x = x0;
error = inf;

% Enquanto o erro absoluto for maior do que a tolerância e o número de iterações for menor do que o máximo
while error > tol && iter <= max_iter
    % Calcular o próximo valor de x
    x_next = x - fun(x)/dfun(x);
    
    % Calcular o erro absoluto
    error = abs(x_next - x);
    
    % Atualizar o valor de x
    x = x_next;
    
    % Atualizar a tabela com as iterações
    iter_table(iter,:) = [iter x error];
    iter = iter + 1;
end

% Remover as linhas vazias da tabela
iter_table(iter:end,:) = [];

% Exibir a tabela com as iterações
disp('Iteração    x           Erro')
disp(iter_table)
