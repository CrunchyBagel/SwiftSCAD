let($fa=2.000000, $fn=0, $fs=0.150000) union() { union() { color(c=[1.000000, 0.000000, 0.000000, 1.000000]) linear_extrude(height=3.000000, scale=[1.000000, 1.000000], twist=0.000000) union() { translate(v=[2.000000, 0.000000]) color(c=[1.000000, 0.000000, 0.000000, 1.000000]) square(size=[10.000000, 10.000000]); color(c=[0.000000, 0.000000, 1.000000, 1.000000]) circle(d=6.000000); } union() { difference() { scale(v=[0.800000, 0.800000, 0.800000]) color(c=[1.000000, 0.000000, 0.000000, 1.000000]) cylinder(d=2.000000, h=20.000000); color(c=[1.000000, 0.000000, 0.000000, 1.000000]) cylinder(d=3.000000, h=4.000000); } translate(v=[0.000000, 0.000000, 16.000000]) color(c=[0.000000, 0.502000, 0.000000, 1.000000]) sphere(d=4.000000); } } sphere(d=3.000000); }