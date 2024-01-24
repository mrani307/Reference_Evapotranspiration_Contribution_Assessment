
#partial derivation using R 

#variables 

  #' t  : Mean Temperature
  #' Rs : Solar Radiation 
  #' ea : Vapor Pressure
  #' u2 : Wind Speed (@2m height)
  

  #' psy.constant : psychometric constant
  #' Rso          : clear sky solar radiation 

#expression-----------------

ETo      <- expression( 
                        ( #numerator starts 
                          (0.408* # radiative
                             ( 4098*( 0.6108 * exp(17.27*t/(t+237.3)) )/ ((t+237.3)^2) )* # radiative
                             ( (1-0.23)*Rs - 4.903*10^(-9)*((t+237.3)^4)*(0.34-0.14*sqrt(ea))*(1.35*Rs/Rso-0.35))                                                      
                          )+ # radiative
                            (psy.constant * (900/(t+273)) *u2* ( ( 0.6108 * exp(17.27*t/(t+237.3)) ) - ea )) # aerodynamic
                        ) #numerator ends 
                        /
                          ( #denominator starts 
                            ( 4098*( 0.6108 * exp(17.27*t/(t+237.3)) )/ ((t+237.3)^2) ) + psy.constant*(1+0.34*u2) 
                          ) #denominator ends
                      )

# symbolic expression of partial derivative of ETo to vapor pressure 
  (D(ETo,"ea"))

# symbolic expression of partial derivative of ETo to solar radiation 
  (D(ETo,"Rs"))
  
# symbolic expression of partial derivative of ETo to wind speed
  (D(ETo,"u2"))
  
# symbolic expression of partial derivative of ETo to temperature 
  (D(ETo,"t")) 
  
# symbolic expression of second order partial derivative of ETo to temperature 
  D(D(ETo,"t"),"t")
