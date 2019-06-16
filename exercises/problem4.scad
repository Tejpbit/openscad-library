screw_body_height = 100;

difference(){
    translate([0,0,screw_body_height]) {
        sphere(50);
    };
    translate([0,0,screw_body_height-50]) {
        cube(100, true);
    };
    translate([0,0,screw_body_height+40]) {
        cube([20,100,20], true);
    }
}


difference() {
    cylinder(screw_body_height , 20, 20);
    linear_extrude(
        height = screw_body_height ,
        center = false,
        convexity = 10,
        twist = screw_body_height/10*360
    )
    translate([20,0,screw_body_height ])
    circle(r=10);
}