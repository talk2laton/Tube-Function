function [X,Y,Z] = tubeN(Rfxn,Nr,Paramtricfxn,tbound,Nt)
% This function is the numerial analogy to the tube function in maple. It
% generates the X,Y and Z coordinates to be used by the surf function to
% generate the intended tube figure
% Rfxn is the parametric function of Radius as a function of t
% Paramtricfxn is a 1 by 3 array of path parametric functions
% tbound range is the range of values of t
% Nr is the number of steps in r
% Nt is the number of steps in t
T = linspace(tbound(1),tbound(2),Nt + 1)'; Trans = Paramtricfxn(T);
R = Rfxn(T); [X,Y,Z] = cylinder(R,Nr); Z = 0*Z;

pthdir = PathDir(Paramtricfxn,T); 
axldir = AxialDir(pthdir);
angle  = Angle(pthdir);

for n = 1:Nt + 1
    mat = Mxyz(axldir(n,:),angle(n))*[X(n,:);Y(n,:);Z(n,:)];
    X(n,:) = Trans(n,1) + mat(1,:);
    Y(n,:) = Trans(n,2) + mat(2,:);
    Z(n,:) = Trans(n,3) + mat(3,:);
end

% This function computes the unit vector in the direction of the path
function dir = PathDir(Paramtricfxn,T)
Tpdt = T + 1e-6;
del  = diff(cat(3, Paramtricfxn(T), Paramtricfxn(Tpdt)),1,3);
v    = vecnorm(del, 2, 2); v(v == 0)=1; 
dir  = del./(v*ones(1,3));

% This function computes the unit vector in axis of rotation for each cross
% section. 
function dir = AxialDir(V)
del = [- V(:,2), V(:,1), zeros(size(V,1),1)];
v    = vecnorm(del, 2, 2); v(v == 0)=1; 
dir  = del./(v*ones(1,3));

% This function computes the angle of rotation in radian for each of the
% cross section
function ang = Angle(V)
ang = acos(V(:,3));

% This function computes the 3D rotation matrix for each cross section
% about its corresponding axis and angle of rotation
function M = Mxyz(U,theta)
c = cos(theta); s = sin(theta); ux = U(1); uy = U(2); uz = U(3);
M = [ux*ux*(1 - c) +    c  uy*ux*(1 - c) - uz*s  uz*ux*(1 - c) + uy*s
     uy*ux*(1 - c) + uz*s  uy*uy*(1 - c) +    c  uz*uy*(1 - c) - ux*s
     uz*ux*(1 - c) - uy*s  uy*uz*(1 - c) + ux*s  uz*uz*(1 - c) +    c];  