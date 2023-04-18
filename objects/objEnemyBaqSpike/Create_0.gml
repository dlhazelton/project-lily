 /// @description Params
hSpeed = 1;
vSpeed = 0; 
jSpeed = -6;
grav = 0.25; // For gravity control (ex underwater)
jGrnd = 0; // Grounded?

hp = 3;
hitFlash = 0;

if(hp == 0)
{
	instance_destroy();
}