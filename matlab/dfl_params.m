clear;
clc;

%% Ingenuity parameters

% mass (kg)
m = 1.80;

% Mars gravity (m/s^2)
g = 3.71;

% Inertia matrix (kg*m^2)- diagonal terms
% Estimation provided by paper "Flight Dynamics of a Mars Helicopter" by NASA, 2017
I_x = 0.024; 
I_y = 0.024;
I_z = 0.024;


%% Control parameters

% Hurwitz polynomial coefficients (for stability)
c0 = 1764;
c1 = 1092;
c2 = 253;
c3 = 26;

% Initial state
x0 = 0;
y0 = 0;
z0 = 0;
v_x0 = 0;
v_y0 = 0;
v_z0 = 0;
phi0 = 0;
th0 = 0;
psi0 = 0;
w_x0 = 0;
w_y0 = 0;
w_z0 = 0;


%% Vectorizing parameters

p = [m, g, I_x, I_y, I_z, c0, c1, c2, c3]';
disp("Defining physical and control parameters in vector 'p' -> Done!")

state0 = [x0 y0 z0 v_x0 v_y0 v_z0 phi0 th0 psi0 w_x0 w_y0 w_z0]';
disp("Defining initial state vector 'state0' -> Done!")

disp("Initialization completed! Ready to run the Simulink file 'dfl_model.slx'")
disp("Note: if there is an integration with a CoppeliaSIM scene, run it first, then run the Simulink model")