function [vforce,sol] = sphere1(ang,Bo,phi,sol)

global theta
theta=phi;

global beta
beta=ang;

% L is the infinity that we are shooting to

L=20;

%theta+beta-pi

R=sqrt(Bo); % R is the square root of the Bond number - the dimensionless radius

options.Vectorized = 'on';
if nargin==3
    solinit =bvpinit(linspace(R*sin(beta), L, 50),[-1 0]) ;
else
    solinit =sol;
end

%first find the solution for the meniscus around the sphere

sol = bvp4c(@intode,@intbc,solinit);

ys=sol.y(1,1);

vforce=(2*pi*R*sin(beta)*sin(theta+beta-pi)+pi*R^3*(-ys/R*sin(beta)^2+2/3-cos(beta)+(cos(beta))^3/3))*(3/(4*pi*R^3));

%plot(sol.x(1,:),sol.y(1,:),'b');

% ode for the shape of the exterior meniscus

function dydx = intode(x,y)

dydx = [y(2)
    ((1+y(2).^2).*(y(1).*(1+(y(2)).^2).^(1/2)-y(2)./x))];

function res = intbc(ya,yb)

global theta
%=2*pi/3;
global beta
%=1.4;


res = [ya(2)-tan(theta+beta)
        yb(1)];
