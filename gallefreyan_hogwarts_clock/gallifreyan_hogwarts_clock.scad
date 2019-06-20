use <../MCAD/gears.scad>
use <../MCAD/involute_gears.scad>
include <../MCAD/stepper.scad>
use <../MCAD/bitmap/bitmap.scad>


difference() {
clock();

involute_bevel_gear_tooth(25.5952, 19.8397, 22.1661, 31.1508, 113.889, 116.601, 9.76514);
    }

module cylinder_gear(h, d, wall_thickness) {
    fn = 25;
    difference() {
        cylinder(h, d=d, $fn=fn);
        translate([0,0,-0.5])
        cylinder(h+1, d=d-wall_thickness, $fn=fn);
    };
    
    
}

module hand(bar_length, bar_size, hand_label) {
    
    //translate([-first_bar_length+5, -2.5, height-bar_size])
    cube([bar_length, bar_size, bar_size]);
    
    
    //translate([-first_bar_length,0,height-bar_size])
    if (hand_label=="10") {
        color("Chartreuse",1)
        translate([-30,0,0])
        two_numbers("1","0");
    } else if (hand_label=="11") {
    color("Chartreuse",1)
        translate([-30,0,0])
        two_numbers("1","1");
    } else if (hand_label=="12") {
        color("Chartreuse",1)
        translate([-30,0,0])
        two_numbers("1","2");
    } else {
        color("Chartreuse",1)
        translate([-30,0,0])
        8bit_char(hand_label, 12, 6);
    }
    
    
}

module clock() {
    first_bar_length = 100+(12)*10;
    bar_size = 5;
    string_numbers = ["1","2","3","4","5","6","7","8","9","10","11","12"];
    for (size = [1:12]) {
        height = 300-size*10;
        diameter = 20*size;
        bar_length = 100+(12-size)*10;
        
        hand_label = string_numbers[size-1];        
        
        union() {
            cylinder_gear(height, diameter, 10);
            rotate((size-1)*360/12)
            translate([-first_bar_length, 0, height-bar_size])
            hand(bar_length, bar_size, hand_label);
        }
    }
}




module two_numbers(first, second) {
    translate([0,-36,0])
    union() {
        translate([31, 0 ,0])
        cube([5,80,5]);
        8bit_char(first, 12, 6);
        translate([0,72,0])
        8bit_char(second, 12, 6);
    };
}
//two_numbers("1","1")

//gear(36,
//    circular_pitch = True,
//    pressure_angle=1);

//test_gears();

//demo_3d_gears();

//polar_to_cartesian();
//rotate([180,0,0])
//translate([0,0,100])
//bevel_gear_pair(gear1_teeth=41, gear2_teeth=9, outside_circular_path=10);


translate([100,100,100])
motor(Nema08, NemaShort, dualAxis=true);