%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Universidade Federal do Piauí                       %
% Campus Ministro Petronio Portela                    %
% Copyright 2022 -José Borges do Carmo Neto-          %
% @author José Borges do Carmo Neto                   %
% @email jose.borges90@hotmail.com                    %
%  Simulation cilindrical tank                        %
%                                                     %
%  -- Version: 1.0  - 02/05/2022                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Passo 1, definir o vetor tempo:
    Ts = 10; % tempo de amostragem para processo de um tanque ( Landau,2006)
    nptos = 1000;
    ts = linspace(0,Ts,nptos+1);
    

%% Passo 2 - Definições:
nptos
SP = 1;
Level0 = 0.1;
c = 50.0;          % valve coefficient (kg/s / %open)
u = zeros(101,1); % u = valve % open

Cv = 0.97 %velocity coefficient (water 0.97)
Cc = 0.97 %contraction coefficient (sharp edge aperture 0.62, well rounded aperture 0.97)

Cd = Cc Cv % discharge coefficient

A = 9.269; % Constante da valvula

%%
 for i=1:nptos,
    if (i<=nptos/5)  ref(i)=30; end;
    if (i>nptos/5)   ref(i) = 50; end;
end ;


% Simulation with ode45;
for i=1:nptos
    
    u(i+1) = ref(i);   % store the valve position
   
    [~,y] = ode45(@(t,y) tank_cilindrical(t,y,u(i)),[0 0.1],Level0);
    Level0 = y(end); % take the last point
    z(i+1) = Level0; % store the level for plotting
    sps(i+1) = ref(i);
end


% plot results
subplot(3,1,1)
plot(ts,z,'-r','LineWidth', 3,'DisplayName','level PV'); hold on
plot(ts,sps,'k:','LineWidth', 3,'DisplayName','level SP'); hold off
ylabel('Tank Level');
legend();




