% pulisce lo schermo
clc

% pulisce la memoria delle variabili
clear

% chiude le finestre grafiche aperte
clear all

% assegnazione variabili (di default sono double)

% stampa a video l'assegnazione
x = 1/3;
% oppure la nasconde
y = 1/5;

% espressioni su più righe
c = 1 + ...
    3 * ...
    exp(x);

% assegnazione scalari
a = 10;
b = 3;
s = 'ciao';


% mette in pausa in attesa che l'utente preme il tasto
% waitforbuttonpress
a=[1 0 0; 0 1 0; 0 0 2];
a^2;

% di default dei numeri double vengono mostrate solo le prime 4 cifre
% significative, per vederle tutte
x = 1/3;
format LONG;
x
format default;

% funzioni matematiche elementari
help elfun
% funzioni matematiche più avanzate
help specfun

w = complex(1,1);
z = 1+ 2i;
ro = abs(w);
theta = angle(z);
theta = rad2deg(theta);

% vettore riga
v = [1 2 3];
% vettore colonna
w = [1;2;3];
% trasposizione
v_t = v';

length(v_t)
size(v_t)
v(1)
v(2)
v(end)

% operatore : con sintassi start:step:end
vet = [1 32 4 2 7 4 9 0 pi exp(1) log(300)];
% restituisce i primi 4 elementi del vettore con passo unitario
vet(1:4)
% nei primi 3 elementi metti pi
vet(1:3) = pi;

% nel seguente vettore w azzerare tutti gli indici pari
w = [1 1 1 1 1 1 1 1 1];
even = 2:2:length(w);
w(even) = 0;

% distruggere una componente di un vettore
w(1) = [];
% oppure per distruggere tutti gli indici dispari ad esempio
g = [1 2 3 4 5 6 7 8 9];
g
odd = 1:2:length(g);
g(odd) = [];
g

% operazioni fra vettori
v = [1 1 1 1 1];
w = [2 2 2 2 2];
lambda = 2.5;
mou = pi;

comb = lambda*v + mou*w;

% prodotto scalare
dot(v, w)


%{
in realtà, ogni comando (non eccessivamente complesso), come ad esempio
dot, è una function matlab, di cui possiamo visionare il sorgente con il
comando
edit dot
%}


% operazioni elemento a elemento (element-wise)
% ci permettono di effettura la stessa operazione su ogni componente di 
% un vettore, risparmiandoci cicli for inutili
v = [sqrt(2) sqrt(2) sqrt(3) sqrt(pi) pi/2];
v.^2
sin(v)
1./v




























