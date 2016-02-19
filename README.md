# static_models
A repository for models of static descriptions of spheres at an interface

Directories:

Vella_scripts - Contains original scripts written by Dominic Vella

findmax.m - For a given contact angle and Bond number, find the maximum value of a the modified density ratio (MDR) for which a sphere an attain a stable equilibrium position at the interface.

sphere1.m - Called by findmax.m to calculate the value of the MDR for a given Bond number, contact angle and degree of immersion. Solves the Laplace-Young equation for interface shape using Matlab routine bvp4c. The interface is described with a function that gives the dependence of the height on radius so only valid when the interface doesn't curve back on itself.

OuterMeniscus.m - Can be used as an alternative to sphere1.m. The interface is parameterised in terms of arc-length so allows for an interface that doubles back on itself. Must be used when a contact angle of pi is considered singularity in the boundary condition on the sphere.

---------------------------------------------------------------------------------------------------------------------------------------

static_film - A model where a film of upper phase fluid is present between the sphere and the interface and cannot drain away.