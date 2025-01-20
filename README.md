# Dynamic Feedback Linearizability of Ingenuity
Project developed for the Elective in Robotics (EiR) course, A.Y. 2024-2025

## Table of Contents

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

The purpose of this project is the development of a model in Simulink in order to control an UAV with coaxial helicopter dynamics (approximated to a quadrotor dynamics) through Dynamic Feedback Linearization, and so complete a trajectory tracking task. The output state is also sent to a CoppeliaSim scene (by means of some integration blocks) developed to simulate the motion of Ingenuity (helicopter drone built by NASA) in an ideal environment. The repository is structured in two subfolders, each with specific sw components:

- **coppeliasim** -> It contains the scene developed in CoppeliaSim with a model of Ingenuity taken from NASA website;
- **matlab** -> It contains a set of scripts developed in MATLAB to initialize, produce and plot data for the Simulink model, together with an auxiliary script used to interface Simulink and CoppeliaSim via remote APIs.

## Requirements

List the software and hardware requirements to run the MATLAB code.

### Software

- MATLAB version: R2022b or later
- Required toolboxes: 
  - Robotics Toolbox by Peter Corke (https://petercorke.com/toolboxes/robotics-toolbox/)
- CoppeliaSIM version: 4.7.0 or later 


### Hardware

- Minimum 8 GB RAM
- At least 2 GHz processor

## Installation

Step-by-step instructions to set up the environment:

1. Clone the project repository:
    ```bash
    git clone https://github.com/tonydorek/eir-part_1.git
    ```

2. Clone the support repository (for Simulink-CoppeliaSim integration):
    ```bash
    git clone https://github.com/sunshineharry/VrepSimulink.git
    ```
    And copy the auxiliary file '*matlab/aux/SetObjectPosition.m*' inside it from the project repository;

3. Move the support repository inside one of the MATLAB search paths (or simply add its absolute path in the MATLAB list of paths).

## Usage

Instructions on how to execute the code:

1. Open the CoppeliaSim file '*ingenuity.ttt*' in folder **coppeliasim** and also the **matlab** folder in MATLAB;

2. Run the programs in the following order:
    - *dfl_params.m*
    - *ingenuity.ttt* (start the simulation)
    - *dfl_model.slx*
    - *ingenuity.ttt* (stop the simulation)
    - dfl_plotting.m

A couple of graphs and plots about the robot trajectory can be appreciated both in the scene simulated in CoppeliaSim and in MATLAB.