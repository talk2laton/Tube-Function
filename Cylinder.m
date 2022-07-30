function [X,Y,Z] = Cylinder(R, N)
X = []; Y = []; Z = [];
z = linspace(0,1,numel(R));
t = linspace(0,1,N+1)*2*pi;
for n = 1:numel(R)
    X = [X;R(n)*cos(t)];
    Y = [Y;R(n)*sin(t)];
    Z = [Z;z(n) + 0*t];
end