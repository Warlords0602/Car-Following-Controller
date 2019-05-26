README

Initialising codes:

BaseTest = 10 car model with no controllers

FSTest10 = controller tests implemented in Car 1

- FS10 = 	Replication of Stern's controller
- lookup = 	Basic feedback controller with tanh extension
- mod = 	Basic PID model, PID block removed as setting is P=1
- U =		Mod model with internalised U components

Initial Setting Definitions

Universal:
FStime =	controller switch modelled as [0 1 1 0] stair signal generator, input = on and off time
Ut/U =		"external manual input" for FS controller using lookup table

FS10U:

diffscale = 	time scale for da/dt ("da" in code)
Uinit = 	Reset velocity for internalised U controller



TEST PROCEDURES

run initialising code > run Analysis10

Due to "to workspace" block output set up as timeseries, the gigantic block of "squeeze" functions used to return variables as 2D for plotting

Graphs plotted as follows:

1. Position (x)
2. Velocity (v)
3. Relative distance (dx)
4. Relative velocity (dv)
5. Acceleration (a)
6. U,v,a,da together
7. Mean velocity and velocity SD
