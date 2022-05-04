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



% Dados do tanque cilidrico

H = 70 % Altura
R = 18.00 % Raio
h0 = 30 % Altura a ser linearizado
g = 9.81 % gravidade

a = 9.0269 % Constante da valvula

b = a*sqrt(2*g)

k1 = 1/(pi*R^2)
k2 = b*k1
%%
% Modelo não linear

k1 = 1/(pi*(R/H)^2)
k2 = b/(pi*(R/H)^2)

dh_dt = Fin*k1 - k2*h^(-1/2)

%%



