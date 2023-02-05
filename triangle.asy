import settings;
render = 4;
prc = false;

import three;
import solids;
texpreamble("\usepackage{bm}");

size(250, 0);

currentprojection  =  orthographic(8, 3, 4);

real s = 1.2;
pen pk = rgb(0, 0, 0);
pen pr = rgb(0.5, 0.3, 0.3);
pen pg = rgb(0.3, 0.3, 0.3);

// fixed axes
triple O = (0,0,0);
real u = 2;
triple X = (u,0,0);
triple Y = (0,u,0);
triple Z = (0,0,u);
draw(Label("$X$", 1), O--X, pk, Arrow3);
draw(Label("$Y$", 1), O--Y, pk, Arrow3);
draw(Label("$Z$", 1), O--Z, pk, Arrow3);
label("$O$", O, (0.5,-1.7,-1.0));

draw(O--(-X), dashed+pg);
draw(O--(-0.7*Y), dashed+pg);
draw(O--(-0.3*Z), dashed+pg);

// triangle
real a = 1.2;
real h = 1.7;
real theta = 40;
real t = theta*pi/180;
real phi = 60;
real q = phi*pi/180;
triple x = (cos(q),sin(q),0);
triple n = (-sin(q),cos(q),0);
triple y = (-sin(q),cos(t)*cos(q),sin(t)*cos(q));
triple z = (0,-sin(t),cos(t));
draw(Label("$x$", 1), O--h*x, pk, Arrow3);
draw(O--(-h*x), dashed+pk);
draw(Label("$y$", 1), O--s*h*y, pk, Arrow3);
draw(Label("$n$", 1), O--s*h*n, gray(0.6), Arrow3);
draw(Label("$z$", 1), O--s*z, pk, Arrow3);

draw((-1.6*a*sin(q),0,0)--(-1.6*a*sin(q),1.6*a*cos(q),0)--(0,1.6*a*cos(q),0), dashed+gray(0.75));

path3 triangle = a*x--h*y--(-a*x)--cycle;
draw(surface(triangle), pr+opacity(0.3));
draw(triangle, pr);

label("$-a$", -a*x+(0,0,-0.1));
label("$a$", a*x+(0,0,-0.1));
label("$h$", h*y+(0,-0.1,0));

// angles
draw("$\phi$", arc(O, 0.6*a, 90, 0, 90, phi),  pr, Arrow3);
draw(Label("$\theta$"), arc(O, (0,0,0.6*a), 0.6*a*z),  pr, Arrow3);
draw(Label("$\theta$"), arc(O, 0.6*a*n, 0.6*a*y),  pr, Arrow3);
