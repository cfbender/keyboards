feet_height = 15;
peg_radius = 1.925;
feet_width = 40;
chamfer_distance = feet_height / 3;

module cut_prism(l,w,h) {
    color("cyan"){
        polyhedron(
            points=[[0,0,0], [0,l,0], [0,l,h],[0,0,h], [w,0,h], [w,l,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );
        }
}

union(){
    difference() {
        cube([feet_height,feet_width,feet_height]);
        translate([0,0,ceil(feet_height / 3) ]){
                cut_prism(feet_width,feet_height - chamfer_distance,feet_height - chamfer_distance);
            }
    }
    
    translate([feet_height, feet_width / 2, feet_height / 2]){
        rotate([0,90,0]){
            cylinder(h= 5, r = 1.925, $fn=30);
        }
    }
}