#-----------------------------------------------------#  
# Universidade Federal do Piauí                       #
# Campus Ministro Petronio Portela                    #
# Copyright 2022 -José Borges do Carmo Neto-          #
# @author José Borges do Carmo Neto                   #
# @email jose.borges90@hotmail.com                    #
#  Simulation cilindrical tank                        #
#                                                     #
#  -- Version: 1.0  - 02/05/2022                      #
#-----------------------------------------------------#


def cilindrical_tank_nl(t,y,A,Qin,Cd):
    import math
    # calculate derivative of the Level
    
    g = 9.81;
    R = 0.042; % Radio meters
    
    b = A*Cd*math.sqrt(2*g);
    
    k1 = 1/(math.pi*(R)^2);
    k2 = b/(math.pi*(R)^2);


    dh_dt = Qin*k1 - k2*y**(1/2);

    return dh_dt


