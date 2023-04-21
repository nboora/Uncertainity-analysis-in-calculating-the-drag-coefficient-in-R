# Uncertainity-analysis-in-calculating-the-drag-coefficient-in-R
Performed experimental uncertainty analysis to calculate 95% uncertainty interval for drag coefficient using Taylor Series approximation and Monte Carlo approaches.



Experiment Setup:

The experiment was performed in the home setup, with the object being a small empty plastic cup dropped from a height of around 180 centimeters (1.8 meters). The experiment is repeated roughly 40 times, and the video was shot at 60 frames per second high-resolution smartphone camera.
The video was then examined using Tracker-Video Analysis software, which is a free online video analysis software that allows you to track a dropped object and generate data sheets with velocity and distance over time.
When the experiment was performed on the test run, it was revealed that the object falling attained a near-constant velocity as it approached the end of the scale in its fall/trajectory. It was discovered after multiple repetitions of this experiment that the object velocity profile attained a nearly constant value in each drop.


Calculating object parameters:

  Analysis of Object Mass
  
    The mass of the object obtained via the electronic and since this was the direct measure in presence of air, so it also captures the Buoyancy forces in the mass
    calculation. But we will ignore buoyancy in our calculation and assume the calculated mass to be the actual mass of the object. Thus, after the rejection of acceleration
    term. The equation for drag force becomes: 𝐷=𝑚𝑜𝑏𝑗(𝑔)−𝐵 
    𝐵= 𝜌𝑎𝑖𝑟𝑉𝑜𝑏𝑗𝑔
    𝜌𝑎𝑖𝑟𝑉𝑜𝑏𝑗= 𝑀𝑎𝑠𝑠 𝑜𝑓 𝑎𝑖𝑟 𝑑𝑖𝑠𝑝𝑎𝑐𝑒𝑑 𝑏𝑦 𝑡ℎ𝑒 𝑜𝑏𝑗𝑒𝑐𝑡
  
  Analysis of Density of Air
  
    𝝆𝒂𝒊𝒓= 𝑷/𝑹𝑻
  
  Analysis of Projected Area
  
    𝑨=𝝅𝒅𝟐∕𝟒
  
  Analysis For Velocity
  
    - The experimental setup for calculating the velocity of the object accurately. The measuring tape is used to fix the points (50, 100, 150 cm).
    – Using the velocity tracker software and calibration command the length is calibrated. And the coordinate axis is set up to a point which is considered as the starting
    point of fall.
    – With the inbuilt track command, the velocity of the object at different time intervals is calculated.
    
Uncertainty Analysis:

TYPES OF ERROR AND SYSTEMATIC ERROR ESTIMATIONS:

  Measurement of density
  
  Measurement of mass
  
  Projected area
  
  Terminal velocity

The results from both the approaches:

  Taylor Series Method

    UCD [95%] - 0.3133 
    Mean (CD) - 1.508 
    cd_min - 1.194 
    cd_max - 1.821 
    Relative Uncertainty [95%] - 20.7%

  Monte Carlo Method

    UCD [95%] - 0.3128
    Mean (CD) - 1.519
    cd_min - 1.239
    cd_max - 1.865
    Relative Uncertainty [95%] - 20.7%
    
