% Approssimiamo l'oscilatore armonico x''=-k x, con tutti i metodi a un
% passo (fe, be, cn, heun) e grafichiamo le curve di fase e i livelli
% energetici stimati

close all
clc
clear

k = 1;
A = [0, 1;-k, 0];
T=4*pi;
h=.1;
N = floor(T/h) +1;
t = linspace(0, T, N);
u = zeros(2, N);
v = zeros(2, N);
z = zeros(2, N);
w = zeros(2, N);
Eu = zeros(1, N);
Ev = zeros(1, N);
Ez = zeros(1, N);
Ew = zeros(1, N);

%inseriamo dati iniziali e stimiamo energia al tempo 0
u(:, 1) = [1, 0]; 
v(:, 1) = [1, 0];
z(:, 1) = [1, 0];
w(:, 1) = [1, 0];

for n=1:N-1
    % fe
    u(:,n+1)= u(:, n) + h*A*u(:, n);
    % heun 
    v(:, n+1) = v(:, n) + (h/2)*(A*v(:, n) + A*(u(:, n) + h*A*u(:, n)));
    % crank-nicholson
    z(:, n+1) = linsolve(eye(2)- (h/2)*A, z(:, n) + (h/2)*A*z(:, n));
    % be
    w(:, n+1) = linsolve(eye(2) - h*A, w(:, n));
end

% calcoliamo i livelli di energia ricorgando E = 1/2 v^2 + 1/2 kx^2
for n=1:N
    Eu(n) = .5 * u(2, n)^2 + .5 * k * u(1, n)^2;
    Ev(n) = .5 * v(2, n)^2 + .5 * k * v(1, n)^2;
    Ez(n) = .5 * z(2, n)^2 + .5 * k * z(1, n)^2;
    Ew(n) = .5 * w(2, n)^2 + .5 * k * w(1, n)^2;
end

% rappresentiamo le due curve di fase approssimate e l'energia del sistema
tiledlayout(1, 2)

nexttile
plot( u(1, :), u(2, :), "r", ...
    v(1, :), v(2, :), "b", ...
    z(1, :), z(2, :), "g", ...
    w(1, :), w(2, :), "c");
title("Phase space")

nexttile
plot(t, Eu, "r",  t, Ev, "b", t, Ez, "g", t, Ew, "c");
title("Energy")

