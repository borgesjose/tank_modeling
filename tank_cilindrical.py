
def dh_dt(t,y,A,Qin,Cd):
    import math
    # calculate derivative of the Level
    
    g = 9.81;
    R = 0.042; % Radio meters
    
    b = A*Cd*math.sqrt(2*g);
    
    k1 = 1/(math.pi*(R)^2);
    k2 = b/(math.pi*(R)^2);


    dh_dt = Qin*k1 - k2*y**(1/2);

    return dh_dt