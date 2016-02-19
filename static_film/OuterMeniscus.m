function [sol,zc] = OuterMeniscus(Rc,qm,sol)

%% Here we are solving the Laplace--Young equation in intrinsic coordinates
%Function written by Dominic Vella

% Key quantity of interest is the vertical height of the meniscus for a
% given interface inclination angle and contact line radius

% y(1,:)=theta
% y(2,:)=x
% y(3,:)=zeta

B=Rc^2; % The Bond number of the contact line radius
% L is the infinity that we are shooting to
L=20;

options.Vectorized = 'on';
if  nargin==2
  solinit =bvpinit(linspace(0, L, 500),@shapeguess) ;
else
  solinit = bvpinit(sol,[0 L]);
end

%first find the solution for the meniscus around the sphere

sol = bvp4c(@intode,@intbc,solinit);

z=sol.y(3,:);
x=sol.y(2,:);
s=sol.x;

zc=z(1);


% ode for the shape of the exterior meniscus

        
    function dydx = intode(s,y)

        q=y(1);
        x=y(2);
        z=y(3);
        
        dydx = [z-sin(q)./(x);
            cos(q);
            sin(q)];
    end

    function res = intbc(ya,yb)

    res = [ya(1)-qm % theta(0)=qm
            ya(2)-Rc
            yb(3)];
    end
    
    
    function guess=shapeguess(s)

    guess = [0;s+Rc;0];

    end

end
