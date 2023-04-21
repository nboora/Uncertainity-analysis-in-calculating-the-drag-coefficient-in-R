rm(list = ls())

g <- 9.806608 # the most accurate value

#measured from the different data sets where velocities become fairly constant, units-m/s
#means of all expreiments
v_t <- c(4.29, 4.52, 4.43, 4.45, 4.53, 4.48, 4.45, 4.60, 4.43, 4.48, 4.35, 4.34, 4.35, 4.39, 4.36, 
         4.39, 4.45, 4.42, 4.34, 4.35, 4.40, 4.37, 4.42, 4.32, 4.40, 4.34, 4.32, 4.47, 4.48, 4.43)
a <- length(v_t)

#measured 30 times
net_mg <- c(3,4,3,3,3,4,3,3,3,4,4,3,3,4,3,3,4,3,4,4,3,3,4,3,4,3,4,3,4,3)
net_m <- net_mg*g/(1000)
b <- length(net_m)

## mean & standard deviations of mass(net) & terminal velocities
mean(v_t)
mean(net_m)
sd(v_t)
sd(net_m)

#constants for the experiments/All units are in SI units
dia <- c(0.0488, 0.0493, 0.049, 0.0492, 0.0489, 0.0492, 0.0488, 0.0489, 0.0489, 0.049)
sd(dia)
temp <- 19+273.15
pr <- 101015.97
R_air <- 287

M <- 1*1e6

## Standardizing all the errors collected from various sources mentioned in the report
## for mass
# 0.2-(-0.2)/(2*1000) --> in Kgs
beta_net_m <- 0.0004/2

# for temp
# 0.1-(-0.1)/2 
beta_temp <- 0.2/2

# for pressure
# 50-(-50)/2
beta_pr <- 100/2

#for diameter for calculation of projected Area
#calliper resolution & accuracy
beta_d_res <- 0.01/2000
# 0.02-(-0.02)/(2*1000) in meters
beta_d_acc <- 0.04/2000

#for terminal velocity 
#as suggested by the software to be 10% of the measured values
beta_v_t_acc <- (0.05*mean(v_t)*2)/2

#for MONTE CARLO APPROACH
Dr_coeff_sample <- numeric(M)
m_sample <- numeric(M)
v_t_sample <- numeric(M)
pr_sample <- numeric(M)
dia_sample <- numeric(M)
temp_sample <- numeric(M)
for (i in 1:M)
  
{
  betam <- rnorm(n=1,mean=0,sd=beta_net_m)
  m_sample[i] <- mean(sample(net_m,size=b,replace=T))+betam
  betav <- rnorm(n=1,mean=0,sd=beta_v_t_acc)
  v_t_sample[i] <- mean(sample(v_t,size=a,replace=T))+betav
  betapr <- rnorm(n=1,mean=0,sd=beta_pr)
  pr_sample[i] <- pr+betapr
  betad_1 <- rnorm(n=1,mean=0,sd=beta_d_res)
  betad_2 <- rnorm(n=1,mean=0,sd=beta_d_acc)
  dia_sample[i] <- mean(sample(dia,size=length(dia),replace=T))+betad_2+betad_1
  betatemp <- rnorm(n=1,mean=0,sd=beta_temp)
  temp_sample[i] <- temp+betatemp
  Dr_coeff_sample[i] <- (8*R_air/pi)*(m_sample[i]*temp_sample[i])/(pr_sample[i]*(dia_sample[i]^2)*(v_t_sample[i]^2))
}

P<-0.95
windows()
hist(Dr_coeff_sample)
#for parametric Bootstrapping
upper <- quantile(Dr_coeff_sample, probs = c((1-P)/2,(1+P)/2))[[2]]
upper
lower <- quantile(Dr_coeff_sample, probs = c((1-P)/2,(1+P)/2))[[1]]
lower
U <- (upper-lower)/2 # expanded uncertainity in mean of drag coefficient
U
Cd <- mean(Dr_coeff_sample) # mean drag coefficient
Cd
U/Cd*100 # relative uncertainity

