function [mdr] = MDR(Bond, Delta, theta, men_height)
%MDR For a given Bond number, Delta, degree of immersion and vertical
%height of meniscus at boundary point, find the value of MDR that gives a
%stable configuration 

%Expression uses modified version of equation 2.21 from Dominic Vella's
%thesis and equation 7 in Vella et. al. 2006. Difference is presence of
%Delta quantity which accounts for presence of a thin fluid film between
%the sphere and the interface.

mdr = 3.0 * sqrt(Delta) / (4.0 * Bond) * (2.0 * sin(theta) * sin(theta) + Bond * Delta * (-men_height * sin(theta) * sin(theta) / sqrt(Bond * Delta) + 2.0 / 3.0 ...
    + cos(theta) - cos(theta) * cos(theta) * cos(theta) / 3.0));


%mdr=3.0 / (4.0 * Bond) * (-2.0 * sin(imm) * sin(imm + contact) + Bond *(-height * sin(imm) * sin(imm) / sqrt(Bond) + 2.0 / 3.0 - cos(imm) + ...
 %       cos(imm) * cos(imm) * cos(imm) / 3.0));

end

