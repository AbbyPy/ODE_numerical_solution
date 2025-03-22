% approssimiamo il pendolo non lineare ossia l'ODE theta'' = sin(theta) 
% che portata al prim'ordine diventa (z, w)' = (w, sin z)
% usiamo il metodo di eulero all'indietro e il metodo del punto fisso per
% risolvere i sistemi di equazioni non lineari

% parametri di discretizzazione
T=5*pi;
h=0.1;
N=floor(T/h)*1;
toll = 10^-8;

%dato iniziale 
start_pt = [0.5*pi;1];
U = zeros(2, N);
U(:, 1) = start_pt;

% metodo di eulero all'indietro U_n+1 = U_n + h f(U_n+1)
for n=1:N-1
    % Sia P il punto fisso della mappa F(X):=U_n + h*f(X)
    % definiamo la successione Y_0 = U_n, Y_k+1 = F(Y_k)
    % Y_k convrge a P
    Yold = U(:, n);
    Ynew = U(:, n) + h*transpose(f(Yold(1), Yold(2)));
    while (norm(Ynew - Yold) > toll)
        Yold = Ynew;
        Ynew = U(:, n) + h*transpose(f(Yold(1), Yold(2)));
    end
    U(:, n+1) = Ynew;
end

plot(U(1, :), U(2, :));

function out=f(z,w)
out=[w, -sin(z)];
end 