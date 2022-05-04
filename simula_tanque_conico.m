%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% Universidade Federal do Piau�                       %
% Campus Ministro Petronio Portela                    %
% Copyright 2022 -Jos� Borges do Carmo Neto-          %
% @author Jos� Borges do Carmo Neto                   %
% @email jose.borges90@hotmail.com                    %
%  Simulation conical tank                            %
%                                                     %
%  -- Version: 1.0  - 02/05/2022                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Passo 1, definir o vetor tempo:
    Ts = 10; % tempo de amostragem para processo de um tanque ( Landau,2006)
    nptos = 1000;
    ts = linspace(0,Ts,nptos+1);
    

%% Passo 2 - Defini��es:
nptos
SP = 1;
Level0 = 0.1;
c = 50.0;          % valve coefficient (kg/s / %open)
u = zeros(101,1); % u = valve % open


%%
 for i=1:nptos,
    if (i<=nptos/5)  ref(i)=30; end;
    if (i>nptos/5)   ref(i) = 50; end;
end ;


% simulate with ODEINT
for i=1:nptos
    
    % TO DO: put P-only controller here
    valve =  ref(i);
    
    % Limit valve to within 0 and 100
    valve = max(0,valve);
    valve = min(100,valve);

    u(i+1) = valve;   % store the valve position
   
    [~,y] = ode45(@(t,y) tank_conical(t,y,valve),[0 0.1],Level0);
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
