close all
[X,Y,Z] = tubeN(@(t) t/3, 30, @(t)[ t.*sin(t), t.*cos(t), 20-t],[0,20],120);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'1.png')

[X,Y,Z] = tubeN(@(t) sin(t),20,@(t)[ t, 0*t,0*t],[0,10],40);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'2.png')

[X,Y,Z] = tubeN(@(t)sqrt(1-t.^2),20,@(t)[sin(pi*t),t,t+1],[-1,1],50);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'3.png')

[X,Y,Z] = tubeN(@(t)sqrt(1-t.^2),20,@(t)[sin(pi*t),cos(pi*t),t+1],[-1,1],50);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'4.png')

[X,Y,Z] = tubeN(@(t)0.1+0*t,20,@(t)[(4 + sin(20*t)).*cos(t),(4 + sin(20*t)).*sin(t),cos(20*t)],[0,2*pi],1000);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'5.png')

[X,Y,Z] = tubeN(@(t)0.1+0*t,20,@(t)[(2 + cos(1.5*t)).*cos(t),(2 + cos(1.5*t)).*sin(t),sin(1.5*t)],[0,4*pi],500);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'6.png')

[X,Y,Z] = tubeN(@(t)1+0*t,20,@(t)[3.*cos(t),3.*sin(t),0*t],[0,2*pi],100);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'7.png')

xfun = @(t)sign(sin(t)).*(abs(sin(t))).^0.75;
yfun = @(t)sign(cos(t)).*(abs(cos(t))).^0.75;
zfun = @(t)abs(sin(t)).^2;
[X,Y,Z] = tubeN(@(t)0.1+0*t,20,@(t)[xfun(t), yfun(t), zfun(t)],[0,2*pi],500);
figure; s = surf(X,Y,Z); s.FaceColor = 'r'; s.EdgeAlpha = 0.3; axis equal
camlight; lighting gouraud
f = getframe(gcf); F = f.cdata; imwrite(F,'8.png')