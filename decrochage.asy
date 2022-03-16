import settings;
render = 4;

size(250);

pen pr = rgb(0.5, 0.3, 0.3);

// Axes fixes
draw((0,0)--(0,2), Arrow);
label("$X$", (0,2), N);
draw((0,0)--(-2,0), Arrow);
label("$Y$", (-2,0), W);
dot((0,0), 5bp+black);
label("$Z$", (0.15,0.15));
draw(scale(0.1)*unitcircle);
label("$O$", (-0.15,-0.15));

// Axes mobiles
real d = 0.35;
pair o = (-1,1);
pair x = d*(-1,1);
pair y = d*(-1,-1);
draw(o--(o+x), Arrow);
label("$x$", o+x, NW);
draw(o--(o+y), Arrow);
label("$y$", o+y, SW);

// echelle
real a = 0.1;
real b = 2;
fill((-a,-a)--(a,a)--(-b+a,b+a)--(-b-a,b-a)--cycle,gray(0.5)+opacity(0.5));

// centre de masse
dot(o, 5bp+black);
label("$G$", o+(0.1,0.1));

// angle
draw("$\theta(t)$", arc((0,0), 0.5, 90, 135), Arrow);

// forces
draw(o--(-1, 0.5), pr, Arrow);
label("$mg$", (-1, 0.5), S, pr);
draw("$N$", (0,0)--(0,0.7), pr, Arrow);
draw("$f$", (0,0)--(-0.7,0), pr, Arrow);
