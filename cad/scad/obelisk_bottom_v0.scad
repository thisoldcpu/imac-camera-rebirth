// =============================================================================
// imac-camera-rebirth — obelisk_bottom.scad
// Bottom plate: 5"x3", blind center recess, chamfered M2 corner holes
// https://github.com/thisoldcpu/imac-camera-rebirth
// =============================================================================

include <params.scad>

$fn = 64;

ow         = 127.00;
od         =  76.20;
screw_in   =   8.00;

recess_w   =  25.40;  // 1"
recess_d   =  25.40;  // 1"
recess_h   =   6.35;  // 1/2" blind recess
wall_t     =   3.00;
plate_h    =  recess_h + wall_t;  // 9.35mm — recess + floor

chamfer_d  =   4.50;
chamfer_h  =   1.50;

module chamfered_hole(total_h) {
    cylinder(h=total_h, d=2.2);
    translate([0, 0, total_h - chamfer_h])
        cylinder(h=chamfer_h+0.01, d1=2.2, d2=chamfer_d);
}

module obelisk_bottom() {
    difference() {
        cube([ow, od, plate_h]);

        // Blind snap-in recess from top face down
        translate([ow/2 - recess_w/2, od/2 - recess_d/2, plate_h - recess_h])
            cube([recess_w, recess_d, recess_h + 0.01]);

        // Chamfered M2 holes
        translate([screw_in,    screw_in,    0]) chamfered_hole(plate_h);
        translate([ow-screw_in, screw_in,    0]) chamfered_hole(plate_h);
        translate([screw_in,    od-screw_in, 0]) chamfered_hole(plate_h);
        translate([ow-screw_in, od-screw_in, 0]) chamfered_hole(plate_h);
    }
}

obelisk_bottom();
