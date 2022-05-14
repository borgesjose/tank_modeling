#-----------------------------------------------------#  
# Universidade Federal do Piauí                       #
# Campus Ministro Petronio Portela                    #
# Copyright 2022 -José Borges do Carmo Neto-          #
# @author José Borges do Carmo Neto                   #
# @email jose.borges90@hotmail.com                    #
#  modeling tanks                                     #
#                                                     #
#  -- Version: 1.0  - 02/05/2022                      #
#-----------------------------------------------------#


def cilindrical_tank_nl(t,y,A,Qin,Cd):
    import math
    # calculate derivative of the Level
    
    g = 9.81;
    R = 0.042; % Radio meters
    
    b = A*Cd*math.sqrt(2*g);
    
    k1 = 1/(math.pi*(R)**2);
    k2 = b/(math.pi*(R)**2);


    dh_dt = Qin*k1 - k2*y**(1/2);

    return dh_dt


def conical_tank_nl(t,y,A,Qin,Cd):
    import math
    # calculate derivative of the Level
    
    g = 9.81;
    R = 0.042; # Radio meters
    H = 0.70
    R1 = 0.042; # Raio em metros
    R2 = 0.01; # Raio da base do cilindro
    
    b = A*Cd*math.sqrt(2*g);
    
    dh_dt = (Qin - b*y**(1/2))/(R2 + ((R1-R2)/H)*y)**(2);

    return dh_dt


