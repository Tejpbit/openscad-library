part_x = 40;
part_y = 12;
part_z = 28;

epsilon = 0.01;

module base() {
    base_bar_x = part_x;
    base_bar_y = part_y;
    base_bar_z = 5;

    translate([0,0,2.5])
    cube([base_bar_x, base_bar_y, base_bar_z], true);
}



thin_bar_x = 11;
bar_y = 3.5;
bar_z = 23;

module thin_bar() {
    thin_bar_y = bar_y;
    thin_bar_z = bar_z;
    
    union() {
        translate([-thin_bar_x/2, -part_y/2, 5])
        cube([thin_bar_x, thin_bar_y, thin_bar_z-thin_bar_x/2]);
        
        translate([0, -part_y/2, part_z-thin_bar_x/2])
        rotate([-90,0,0])
        cylinder(bar_y, d=thin_bar_x, $fn=25);
    }
    
    
}



module thick_bar() {
    CubePoints = [
      [  0,  0,  0 ],           //0
      [ 22,  0,  0 ],           //1
      [ 22,  bar_y,  0 ],       //2
      [  0,  bar_y,  0 ],       //3
      [  5.5,  0,  23 ],        //4
      [ 16.5,  0,  23 ],        //5
      [ 16.5,  bar_y,  23 ],    //6
      [  5.5,  bar_y,  23 ]];   //7
  
    CubeFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
    
    thick_bar_x = 22;
    thick_bar_y = bar_y;
    thick_bar_z = bar_z;
    translate([-11,-bar_y/2, 0])
    polyhedron( CubePoints, CubeFaces );
    //cube([thick_bar_x, thick_bar_y, thick_bar_z], true);
    
}

module holder_hole() {
    rotate([90,0,0])
    cylinder(12+epsilon*2, 1, true, $fn=25);
}




module screw_hole() {
    union() {
        translate([0,0,-epsilon])
        cylinder(5+2*epsilon,d=3.5,$fn=25);
        translate([0,0,5+2*epsilon-1])
        cylinder(1,d=5,$fn=25);
    }
}







union() {
    difference() {
        base();
        translate([15,0,0])
        screw_hole();
        translate([-15,0,0])
        screw_hole();
    };



    difference() {
        thin_bar();
        translate([0,part_y/2+epsilon, 23])
        holder_hole();
    };

    difference() {
        translate([0,part_y/2-bar_y/2,5])
        thick_bar();
        translate([0,part_y/2+epsilon, 23])
        holder_hole();
    };
}