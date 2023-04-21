rm(list = ls())

g<-9.806608 # the most accurate value

#measured from the different data sets where velocities become fairly constant, units-m/s
v_t <- c(4.29, 4.52, 4.43, 4.45, 4.53, 4.48, 4.45, 4.60, 4.43, 4.48, 4.35, 4.34, 4.35, 4.39, 4.36, 
         4.39, 4.45, 4.42, 4.34, 4.35, 4.40, 4.37, 4.42, 4.32, 4.40, 4.34, 4.32, 4.47, 4.48, 4.43)

a <-length(v_t)

#measured 30 times
net_mg <- c(3,4,3,3,3,4,3,3,3,4,4,3,3,4,3,3,4,3,4,4,3,3,4,3,4,3,4,3,4,3)
net_m <- net_mg*g/(1000)
b <- length(net_mg)

#mean & standard deviation of mass(net) & terminal velocity sets
mean(v_t)
mean(net_m)
sd(v_t)
sd(net_m)

#constants for the experiments/All units are in SI units
dia <- c(0.0488, 0.0493, 0.049, 0.0492, 0.0489, 0.0492, 0.0488, 0.0489, 0.0489, 0.049)
d <- length(dia)
mean_dia <- mean(dia)
sd_dia <- sd(dia)
temp <- 19+273.15
pr <- 101015.97
R_air <- 287

#Standardizing all the errors collected from various sources mentioned in the report
#for mass
# 0.2-(-0.2)/(2*1000) --> in Kgs
beta_net_m<-0.0004/2

#for temp
# 0.1-(-0.1)/2 
beta_temp<-0.2/2

#for pressure
# 50-(-50)/2
beta_pr<- 100/2

#for diameter for calculation of projected Area
beta_d_res <- 0.01/2000
# 0.02-(-0.02)/(2*1000) in meters
beta_d_acc <- 0.04/2000

#for terminal velocity 
#as suggested by the software to be 10% of the measured values
beta_v_t_acc <- (0.05*mean(v_t)*2)/2

#For taylor series approach
#the definition of the sensitivity coefficients
theta_m <- (8*R_air/pi)*temp/(pr*(mean_dia^2)*(mean(v_t)^2))
theta_T <- (8*R_air/pi)*(mean(net_m))/(pr*(mean_dia^2)*(mean(v_t)^2))
theta_pr <- (8*R_air/pi)*(mean(net_m)*temp)/((pr^2)*(mean_dia^2)*(mean(v_t)^2))*(-1)
theta_dia <- (16*R_air/pi)*(mean(net_m)*temp)/((pr)*(mean_dia^3)*(mean(v_t)^2))*(-1)
theta_v_t <- (16*R_air/pi)*(mean(net_m)*temp)/((pr)*(mean_dia^2)*(mean(v_t)^3))*(-1)

#the value of mean drag coefficient
dr_coeff_mean <- (8*R_air/pi)*(mean(net_m)*temp)/((pr)*(mean_dia^2)*(mean(v_t)^2))

b11 <- beta_net_m^2
s11 <- sd(net_m)^2/length(net_mg)
u11sq <- b11+s11

b22 <- beta_temp^2
s22 <- 0
u22sq <- b22+s22

b33 <- beta_pr^2
s33 <- 0
u33sq <- b33+s33

b44 <- beta_d_res^2 + beta_d_acc^2
s44 <- sd_dia^2/length(dia)
u44sq <- b44+s44

b55 <- beta_v_t_acc^2
s55 <- sd(v_t)^2/length(v_t)
u55sq <- b55+s55

#to calculate the uncertainty interval using the Kline-Mclintok Equation
Dr_coeff_uncertainty <- sqrt((u11sq*(theta_m^2))+(u22sq*(theta_T^2))+(u33sq*(theta_pr^2))+(u44sq*(theta_dia^2))+(u55sq*(theta_v_t^2)))


#As a result, it is reasonable to just use k = 2 for P = 95% as long as degree of freedom > 10 (roughly). 
#This criterion is typically satisfied in experiments, and unless otherwise stated, we assume it applies.
k <- 2
exp_unc_int <- k*Dr_coeff_uncertainty
cd_min <- dr_coeff_mean-exp_unc_int
cd_max <- dr_coeff_mean+exp_unc_int

#print the min value of drag coefficient
print(cd_min)
#print the max value of drag coefficient
print(cd_max)
U <- exp_unc_int  # expanded uncertainity in mean of drag coefficient
U
Cd <- dr_coeff_mean # mean drag coefficient
Cd
U/Cd*100 # relative uncertainity

