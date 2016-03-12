function [ max_mdr ] = Max_MDR( Bond, Delta )
%Max_MDR Find the maximum value of the mdr at which a sphere can be in
%equilibrium at an interface for a given Bond number and value of Delta

%Function modified from Dominic Vella's findmax.m

NPoints=101; %Number of different values for the degree of immersion 
ang=zeros(NPoints,1); %Array to hold values for degree of immersion
mdr=zeros(NPoints,1); %Maximum value of MDR for stable configuration at corresponding degree of immersion

% Do first step separately
ang(1)=0.0;

[sol,men_height(1)] = OuterMeniscus(sqrt(Bond), ang(1));

mdr(1) = MDR(Bond, Delta, ang(1), men_height);
% Now use crude continuation on subsequent steps to get the solutions for
% the other values
for i=2:NPoints
    ang(i)=pi*(i-1)/(NPoints-1);
%    i 
    [sol,men_height] = OuterMeniscus(sqrt(Bond), ang(i), sol);
    
    men_height(i) = men_height / sqrt(Bond); %This converts from Dominic's dimensionless scheme to Paul's
    
    mdr(i) = MDR(Bond, Delta, ang(i), men_height(i));

end
%ans(NPoints)

estmax=0;
for i=1:NPoints
    if (mdr(i)>estmax)
        estmax=mdr(i); %Find the maximum value of the MDR that gives a stable configuration for this Bond number and contact angle
        equilib_pos = men_height(i) - cos(ang(i));
        equilib_imm = ang(i);
        
    end
end

max_mdr=estmax;
equilib_imm
equilib_pos
end

