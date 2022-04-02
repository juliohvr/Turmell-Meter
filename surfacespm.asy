settings.outformat="pdf";
settings.prc= false;
settings.render = 0;
import three;
import graph3;
size(200, 0);
currentprojection=orthographic(30,30,30);
xaxis3("$x$",0,100,red,OutTicks(2,2));
yaxis3("$y$",0,100,red,OutTicks(2,2));
zaxis3("$z$",-300,0,red,OutTicks(2,2));

//range of motion
real tcmin=-180, tcmax = 180, stmin = -180, stmax = 180;
//actual position
real theta1 = 0, theta2 = 0;


//initial points
triple po = (0, 0, 0);
triple a0 = (64.1666666666667, 0.000000000000000, -283.500000000000);
triple b0 = (-32.0833333333333, 55.5699634095015, -283.500000000000);
triple c0 = (-32.0833333333333, -55.5699634095015, -283.500000000000);
triple pm0 = (0.000000000000000, 0.000000000000000,
-283.500000000000);
triple r1 = (0.000000000000000, 0.000000000000000, -215.250000000000);
triple r2 = (-3.77354790111386, 0.000000000000000, -218.530295144953);
triple n1 = (56.0996689565118, 25.4146727215185, -275.072086499470);
triple n2 = (-33.7101563299267, -12.7073363607592, -190.259399467694);
triple m1 = (3.79386995439788, 36.0962614380663, -221.649803587915);
triple m2 = (-3.23181514633894, -30.7486671509453, -209.798315462147);

//parametric functions
triple pm(pair t) {
return (-16.48474746562729*cos(1/180*pi*t.x + 1/180*pi*t.y) - 10.166838471101048*cos(-1/180*pi*t.x + 1/180*pi*t.y) + 25.431588522123675*cos(1/180*pi*t.x) - 1.0075390222555773*cos(1/180*pi*t.y) - 30.07656063465307*sin(1/180*pi*t.x + 1/180*pi*t.y) + 6.799869652374312*sin(-1/180*pi*t.x + 1/180*pi*t.y) - 29.968498301984226*sin(1/180*pi*t.x) + 4.11787048538047*sin(1/180*pi*t.y) + 2.227536436860234, -3.5988642455907733*cos(1/180*pi*t.x + 1/180*pi*t.y) - 0.1574203300851842*cos(-1/180*pi*t.x + 1/180*pi*t.y) - 7.851215460082017*cos(1/180*pi*t.x) - 9.586093459590682*cos(1/180*pi*t.y) + 5.9580368183586465*sin(1/180*pi*t.x + 1/180*pi*t.y) - 2.4772749693983664*sin(-1/180*pi*t.x + 1/180*pi*t.y) - 1.4096266870201895*sin(1/180*pi*t.x) + 39.17892057319622*sin(1/180*pi*t.y) + 21.193593495348665, -30.070693601917178*cos(1/180*pi*t.x + 1/180*pi*t.y) - 6.914891650849512*cos(-1/180*pi*t.x + 1/180*pi*t.y) - 29.206425431552418*cos(1/180*pi*t.x) + 1.6995974893975312*cos(1/180*pi*t.y) + 15.774905204951304*sin(1/180*pi*t.x + 1/180*pi*t.y) - 9.941327559108188*sin(-1/180*pi*t.x + 1/180*pi*t.y) - 25.716232764059498*sin(1/180*pi*t.x) - 6.946353624049991*sin(1/180*pi*t.y) - 219.00758680507846) ;
}




//initial position

path3 iplatform = (a0--b0--c0--cycle);
draw(po--r1^^po--r2^^n1--n2^^m1--m2);
draw(surface(iplatform),green+opacity(0.3));
dot(po--a0--b0--c0--pm0--r1--r2--n1--n2--m1--m2, 3+red);
label("$\rm{P_O}$",po,NE);
label("$\rm{A_0}$",a0,2SW);
label("$\rm{B_0}$",b0,3SE);
label("$\rm{C_0}$",c0,NW);
label("$\rm{P_{M0}}$",pm0,NE);
label("$\rm{N_1}$",n1,NE);
label("$\rm{N_2}$",n2,NE);
label("$\rm{M_1}$",m1,NE);
label("$\rm{M_2}$",m2,NE);
label("$\rm{r_1}$",r1,NW);
label("$\rm{r_2}$",r2,SE);

//compute surface
pen p=rgb(0.2,0.5,0.7)+opacity(0.2);
surface spm=surface(pm,(tcmin,stmin),(tcmax,stmax),36,36,Spline);

// surface & mesh
draw(spm,lightgray+opacity(0.1),meshpen=p,render(merge=true));

