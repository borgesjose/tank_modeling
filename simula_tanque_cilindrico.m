%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Universidade Federal do Piau�                       %
% Campus Ministro Petronio Portela                    %
% Copyright 2022 -Jos� Borges do Carmo Neto-          %
% @author Jos� Borges do Carmo Neto                   %
% @email jose.borges90@hotmail.com                    %
%  Simulation cilindrical tank                        %
%                                                     %
%  -- Version: 1.0  - 02/05/2022                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Passo 1, definir o vetor tempo:
    Ts = .010; % periodo de amostragem para processo de um tanque ( Landau,2006)
    Tsim = 30 
    nptos = Tsim/Ts;
    ts = linspace(0,Tsim,nptos+1);
    
%% Passo 2 - Defini��es:

%Dados do probelma:

h0 = 0.7; % ponto inicial

u = zeros(nptos+1,1); % variavel de entrada
h = zeros(nptos+1,1); % variavel de saida

Cv = 0.97 %velocity coefficient (water 0.97)
Cc = 0.97 %contraction coefficient (sharp edge aperture 0.62, well rounded aperture 0.97)

Cd = Cc*Cv % discharge coefficient

r = 0.01;% raio do orificio de saida em metros

A = pi*r^2;% Area do orificio de saida

%%
% definindo a referencia de controle 
for i=1:nptos+1,
    if (i<=nptos/5)  ref(i)=.5; end;
    if (i>nptos/5)   ref(i) = .5; end;
end ;

% Calculando o input
 for i=1:nptos, 
    %if (i<=nptos/5)  u(i)=.0005; end;
    %if (i>nptos/5)   u(i) = .0005; end;
    u(i)=.0015;
end ;
[0 0.1]
% Simulation with ode45;
for i=1:nptos
    
    %u(i+1) = ref(i);   % store the Qin value
   
    [~,y] = ode45(@(t,y) tank_cilindrical(t,y,A,u(i)),[0,0.1],h0);
    %if (y<=0) y=0;end;
    %if (y>=.7) y=.7; end;
    %[~,rr] = y;
    h0 = y(end); % take the last point
    h(i+1) = h0; % store the height for plotting
    if (y<=0) h(i+1)=0;end;
    if (y>=.7) h(i+1)=.7; end;

end
%%
% plot results
figure;
plot(ts,h,'-r','LineWidth', 3,'DisplayName','height'); hold on
plot(ts,ref,'k:','LineWidth', 3,'DisplayName','input'); hold off
ylabel('Tank Height');
legend();