function dh_dt = tank_cilindrical(t,y,A,Qin)
    % calculate derivative of the Level
    
    g = 9.81;
    H = 0.70; % Altura em metros
    R = 0.042; % Raio em metros
    Cd=0.97*0.97;
    b = A*Cd*sqrt(2*g);
    b
    k1 = 1/(pi*(R)^2);
    k2 = b/(pi*(R)^2);

    dh_dt = Qin*k1 - k2*y^(-1/2);
end