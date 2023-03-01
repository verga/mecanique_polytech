import settings;
render = 4;
prc = false;

import three;
import solids;
texpreamble("\usepackage{bm}");

size(250, 0);

currentprojection  =  orthographic(8, 3, 4);

real s = 1.7;
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

draw(O--(-X), dashed+gray(0.75));
draw(O--(-0.7*Y), dashed+gray(0.75));
draw(O--(-0.3*Z), dashed+gray(0.75));

// plaque
real a = 1.0;
real h = 1.0;
real theta = 40;
real t = theta*pi/180;
real phi = 30;
real q = phi*pi/180;
triple x = (cos(q),sin(q),0);
triple n = (-sin(q),cos(q),0);
triple y = (-sin(q),cos(t)*cos(q),sin(t)*cos(q));
triple z = (0,-sin(t),cos(t));
draw(Label("$x$", 1), O--h*x, pk, Arrow3);
draw(O--(-h*x), dashed+pk);
draw(Label("$y$", 1), O--s*a*y, pk, Arrow3);
draw(Label("$n$", 1), O--s*a*n, gray(0.6), Arrow3);
draw(Label("$z$", 1), O--s*z, pk, Arrow3);
draw(O--(-1.3*y), dashed+pg);
draw(O--(-0.8*z), dashed+pg);

draw((-1.6*a*sin(q),0,0)--(-1.6*a*sin(q),1.6*a*cos(q),0)--(0,1.6*a*cos(q),0), dashed+gray(0.75));

path3 plaque = a*y--(a*y + h*z)--(-a*y + h*z)--(-a*y)--cycle;
draw(surface(plaque), pr+opacity(0.3));
draw(plaque, pr);

label("$-a$", -a*y+(0,0,-0.1));
label("$a$", a*y+(0,0,-0.1));
label("$h$", h*z+(0,0.1,0));

// angles
draw("$\phi$", arc(O, 0.6*a, 90, 0, 90, phi),  pr, Arrow3);
draw(Label("$\theta$"), arc(O, (0,0,0.6*a), 0.6*a*z),  pr, Arrow3);
draw(Label("$\theta$"), arc(O, 0.6*a*n, 0.6*a*y),  pr, Arrow3);
