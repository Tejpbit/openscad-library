
t = 5;

for (x = [1 : 100]) {
    for (y = [1 : 100]) {
        translate([x*t,y*t,0]) {
            cube(rands(1,30,3, x*y));
        };
    };
};
