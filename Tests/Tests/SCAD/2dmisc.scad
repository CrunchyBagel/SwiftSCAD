let($fa=2.000000, $fn=0, $fs=0.150000) union() { offset(r=-0.350000) offset(delta=0.350000) offset(r=0.350000) offset(delta=-0.350000) difference() { translate(v=[0.000000, -5.000000]) square(size=[30.000000, 10.000000]); union() { scale(v=[2.000000, 1.000000]) circle(d=8.000000); translate(v=[15.000000, 0.000000]) polygon(points=[[0.000000, 0.000000], [3.758770, 1.368081], [3.704699, 1.508379], [3.645392, 1.646547], [3.580935, 1.782388], [3.511418, 1.915710], [3.436939, 2.046326], [3.357604, 2.174050], [3.273525, 2.298703], [3.184820, 2.420107], [3.091616, 2.538092], [2.994043, 2.652491], [2.892240, 2.763141], [2.786350, 2.869888], [2.676522, 2.972579], [2.562913, 3.071071], [2.445683, 3.165223], [2.324997, 3.254902], [2.201026, 3.339983], [2.073945, 3.420344], [1.943934, 3.495872], [1.811175, 3.566461], [1.675858, 3.632010], [1.538173, 3.692428], [1.398314, 3.747628], [1.256480, 3.797533], [1.112870, 3.842072], [0.967688, 3.881183], [0.821138, 3.914809], [0.673428, 3.942904], [0.524767, 3.965428], [0.375364, 3.982349], [0.225431, 3.993643], [0.075179, 3.999293], [-0.075179, 3.999293], [-0.225431, 3.993643], [-0.375364, 3.982349], [-0.524767, 3.965428], [-0.673428, 3.942904], [-0.821138, 3.914809], [-0.967688, 3.881183], [-1.112870, 3.842072], [-1.256480, 3.797533], [-1.398314, 3.747628], [-1.538173, 3.692428], [-1.675858, 3.632010], [-1.811175, 3.566461], [-1.943934, 3.495872], [-2.073945, 3.420344], [-2.201026, 3.339983], [-2.324997, 3.254902], [-2.445683, 3.165223], [-2.562913, 3.071071], [-2.676522, 2.972579], [-2.786350, 2.869888], [-2.892240, 2.763141], [-2.994043, 2.652491], [-3.091616, 2.538092], [-3.184820, 2.420107], [-3.273525, 2.298703], [-3.357604, 2.174050], [-3.436939, 2.046326], [-3.511418, 1.915710], [-3.580935, 1.782388], [-3.645392, 1.646547], [-3.704699, 1.508379], [-3.758770, 1.368081]]); translate(v=[22.000000, 0.000000]) union() { circle(d=5.000000); intersection() { translate(v=[-1.767767, 1.767767]) rotate(a=-45.000000) square(size=[7.071068, 7.071068]); translate(v=[1.767767, 1.767767]) rotate(a=135.000000) square(size=[7.071068, 7.071068]); } } translate(v=[27.000000, 0.000000]) intersection() { union() { circle(d=4.000000); intersection() { translate(v=[-1.732051, 1.000000]) rotate(a=-30.000000) square(size=[8.000000, 8.000000]); translate(v=[1.732051, 1.000000]) rotate(a=120.000000) square(size=[8.000000, 8.000000]); } } translate(v=[-2.000000, -2.000000]) square(size=[4.000000, 4.000000]); } } } translate(v=[-3.000000, 0.000000]) rotate(a=45.000000) translate(v=[-5.000000, 0.000000]) union() { translate(v=[0.000000, 10.000000]) ; translate(v=[8.000000, 8.000000]) rotate(a=0.000000) polygon(points=[[0.000000, 0.000000], [2.000000, 0.000000], [1.994408, 0.149460], [1.977662, 0.298085], [1.949856, 0.445042], [1.911146, 0.589510], [1.861747, 0.730682], [1.801938, 0.867767], [1.732051, 1.000000], [1.652478, 1.126640], [1.563663, 1.246980], [1.466104, 1.360345], [1.360345, 1.466104], [1.246980, 1.563663], [1.126640, 1.652478], [1.000000, 1.732051], [0.867767, 1.801938], [0.730682, 1.861747], [0.589510, 1.911146], [0.445042, 1.949856], [0.298085, 1.977662], [0.149460, 1.994408], [0.000000, 2.000000]]); translate(v=[5.000000, 5.000000]) rotate(a=180.000000) polygon(points=[[0.000000, 0.000000], [5.000000, 0.000000], [4.996954, 0.174497], [4.987820, 0.348782], [4.972609, 0.522642], [4.951340, 0.695866], [4.924039, 0.868241], [4.890738, 1.039558], [4.851479, 1.209609], [4.806308, 1.378187], [4.755283, 1.545085], [4.698463, 1.710101], [4.635919, 1.873033], [4.567727, 2.033683], [4.493970, 2.191856], [4.414738, 2.347358], [4.330127, 2.500000], [4.240240, 2.649596], [4.145188, 2.795965], [4.045085, 2.938926], [3.940054, 3.078307], [3.830222, 3.213938], [3.715724, 3.345653], [3.596699, 3.473292], [3.473292, 3.596699], [3.345653, 3.715724], [3.213938, 3.830222], [3.078307, 3.940054], [2.938926, 4.045085], [2.795965, 4.145188], [2.649596, 4.240240], [2.500000, 4.330127], [2.347358, 4.414738], [2.191856, 4.493970], [2.033683, 4.567727], [1.873033, 4.635919], [1.710101, 4.698463], [1.545085, 4.755283], [1.378187, 4.806308], [1.209609, 4.851479], [1.039558, 4.890738], [0.868241, 4.924039], [0.695866, 4.951340], [0.522642, 4.972609], [0.348782, 4.987820], [0.174497, 4.996954], [0.000000, 5.000000]]); translate(v=[7.000000, 3.000000]) rotate(a=270.000000) polygon(points=[[0.000000, 0.000000], [3.000000, 0.000000], [2.996386, 0.147203], [2.985554, 0.294051], [2.967530, 0.440191], [2.942356, 0.585271], [2.910094, 0.728941], [2.870821, 0.870854], [2.824632, 1.010670], [2.771639, 1.148050], [2.711968, 1.282665], [2.645764, 1.414190], [2.573186, 1.542308], [2.494409, 1.666711], [2.409623, 1.787098], [2.319031, 1.903180], [2.222853, 2.014677], [2.121320, 2.121320], [2.014677, 2.222853], [1.903180, 2.319031], [1.787098, 2.409623], [1.666711, 2.494409], [1.542308, 2.573186], [1.414190, 2.645764], [1.282665, 2.711968], [1.148050, 2.771639], [1.010670, 2.824632], [0.870854, 2.870821], [0.728941, 2.910094], [0.585271, 2.942356], [0.440191, 2.967530], [0.294051, 2.985554], [0.147203, 2.996386], [0.000000, 3.000000]]); polygon(points=[[0.000000, 10.000000], [8.000000, 10.000000], [10.000000, 8.000000], [10.000000, 3.000000], [7.000000, 0.000000], [5.000000, 0.000000], [0.000000, 5.000000], [0.000000, 10.000000]]); } multmatrix(m=[[1.000000, 0.363970, 0.000000, 0.000000], [0.000000, 1.000000, 0.000000, 0.000000], [0.000000, 0.000000, 1.000000, 0.000000], [0.000000, 0.000000, 0.000000, 1.000000]]) translate(v=[0.000000, 5.000000]) offset(delta=0.400000) text(font="Helvetica", halign="left", size=10.000000, spacing=1.000000, text="SwiftSCAD", valign="bottom"); translate(v=[50.000000, -10.000000]) union() { rotate(a=20.000000) translate(v=[15.000000, 0.000000]) difference() { circle(d=10.000000); union() { rotate(a=0.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=120.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=240.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); } } rotate(a=66.000000) translate(v=[15.000000, 0.000000]) difference() { circle(d=10.000000); union() { rotate(a=0.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=120.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=240.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); } } rotate(a=112.000000) translate(v=[15.000000, 0.000000]) difference() { circle(d=10.000000); union() { rotate(a=0.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=120.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=240.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); } } rotate(a=158.000000) translate(v=[15.000000, 0.000000]) difference() { circle(d=10.000000); union() { rotate(a=0.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=120.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=240.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); } } rotate(a=204.000000) translate(v=[15.000000, 0.000000]) difference() { circle(d=10.000000); union() { rotate(a=0.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=120.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); rotate(a=240.000000) translate(v=[3.000000, 0.000000]) translate(v=[0.000000, -5.000000]) square(size=[10.000000, 10.000000]); } } } }
