sphere(1);

module translated_sphere(radius, x, y) {
    translate([x, y, 0]) {
        sphere(radius);
    }
}

for (index = [2:1:10]) {
    translated_sphere(1/index, index, index);
    translated_sphere(1/index, -index, index);
    translated_sphere(1/index, index, -index);
    translated_sphere(1/index, -index, -index);
        
}