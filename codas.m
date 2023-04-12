% função
%fun = @(x) 0.25*x^3 - 5.876*x^2 + 5.306*x - 45.89;
%fun = @(x) -30/log(x) + 2*x + 10;
%fun = @(x) 2*log(3-cos(x)) - 3*x^x + 5*sin(x);
fun = @(x) -0.8*x^3 + 1.994*x^2 + 20.01*x - 9.86;

% limites
a = 6;
b = 6.5;

% tolerância
tol = 1e-5;

% Definir o número máximo de iterações
max_iter = 100;

% Inicializar a tabela com as iterações
iter_table = zeros(max_iter, 4);
iter = 1;

% Inicializar os valores de x0 e x1
x0 = a;
x1 = b;

% Calcular o valor da função em x0 e x1
f0 = fun(x0);
f1 = fun(x1);

% Calcular o erro absoluto
error = abs(x1 - x0);

% Enquanto o erro absoluto for maior do que a tolerância e o número de iterações for menor do que o máximo
while error > tol && iter <= max_iter
    % Calcular o próximo valor de x
    x2 = x1 - ((f1 * (x1 - x0)) / (f1 - f0));
    
    % Calcular o valor da função em x2
    f2 = fun(x2);
    
    % Atualizar o valor de x0, x1 e f0, f1
    x0 = x1;
    x1 = x2;
    f0 = f1;
    f1 = f2;
    
    % Calcular o erro absoluto
    error = abs(x1 - x0);
    
    % Atualizar a tabela com as iterações
    iter_table(iter,:) = [iter x0 x1 error];
    iter = iter + 1;
end

% Remover as linhas vazias da tabela
iter_table(iter:end,:) = [];

% Exibir a tabela com as iterações
disp('Iteração    x0          x1          Erro')
disp(iter_table)
