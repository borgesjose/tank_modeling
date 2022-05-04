%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Universidade Federal do Piauí                       %
% Campus Ministro Petronio Portela                    %
% Copyright 2022 -José Borges do Carmo Neto-          %
% @author José Borges do Carmo Neto                   %
% @email jose.borges90@hotmail.com                    %
%  PID controllers for the Phase                      %
%  and Gain Margins of the System                     % 
%                                                     %
%  -- Version: 1.0  - 30/04/2022                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dados do tanque conico

H = 70 % Altura
R = 18.00 % Raio
h0 = 30 % Altura a ser linearizado
g = 9.81 % gravidade

a = 9.0269 % Constante da valvula

b = a*sqrt(2*g)

k1 = H^2 /(pi*R^2)
k2 = b*k1
%%
% Modelo não linear

k1 = 1/(pi*(R/H)^2)
k2 = b/(pi*(R/H)^2)

dh_dt = Fin*k1*h^-2 - k2*h^(-3/2)



%%
% Linearização do Modelo:
% 
% Hs_planta =
%  
%     Ge^-sL
% -------------------
%    1 + Ts  

G = 2*(k1/k2)*h0^(1/2)

T = (2/k2)*h0^(5/2)

L = 2 % Atraso de Transporte Caracteristico da planta

s = tf('s')

fts = (G*exp(-s*L))/(1+T*s)

%%
% Discretização do Modelo:
% 
% Hz_planta =
%  
%     b1 z^-1 + b2 z^-2
% ------------------------
%       1 - a1 z^-1  

Ts = 10 % tempo de amostragem ( Landau,2006)

b1 = G*( 1 - exp((L - Ts)/T))

b2 = G*exp(-Ts/T)*(exp(L/T)-1)

a1 = -exp(-Ts/T)

z = tf('z', Ts )

ftz = (b1*(z^-1)+ b2*(z^-2))/(1 + a1*(z^-1))

%%
hold on
step(fts)
step(ftz)

