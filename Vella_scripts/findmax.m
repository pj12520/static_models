function [maxval]=findmax(lowlim,uplim,B,theta)

% The optimum density lies in the interval (lowlim,uplim)
% The Bond number of the sphere is B
% The contact angle of the sphere is theta

NPoints=100;
ang=zeros(NPoints,1);
ans=zeros(NPoints,1);
% Do first step separately
ang(1)=lowlim;
[vforce,sol]=sphere1(ang(1),B,theta);
ans(1)=vforce;

% Now use crude continuation on subsequent steps to get the solutions for
% the other values
for i=2:NPoints
    ang(i)=lowlim+(uplim-lowlim)*(i-1)/(NPoints-1);
    [vforce,sol]=sphere1(ang(i),B,theta,sol);
    ans(i)=vforce;
end

estmax=0;
for i=1:NPoints
    if (ans(i)>estmax)
        estmax=ans(i);
    end
end

maxval=estmax;

figure(1)
plot(ang,ans,'ro');
