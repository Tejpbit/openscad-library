cylinder(h=20, d1=20, d2=2);


translate([0,0,25]){
    sphere(r=5);
}

translate([0,0,12]) {
    rotate([0,70,0]){
        cylinder(12,2,2);
    }
}

translate([0,0,12]) {
    rotate([0,-70,0]){
        cylinder(12,2,2);
    }
}