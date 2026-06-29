// =============================================================================
// imac-camera-rebirth — obelisk_bottom.scad
// Bottom plate V1: slimmed, M3 button head recess, 4 corner holes
// https://github.com/thisoldcpu/imac-camera-rebirth
// =============================================================================

include <params.scad>

$fn = 64;

ow         = 127.00;
od         =  76.20;
screw_in   =   8.00;

m3_shaft   =   3.30;
m3_head_d  =   5.70;
m3_head_h  =   1.80;

recess_w   =  25.40;
recess_d   =  25.40;
recess_h   =   3.00;
wall_t     =   3.00;
plate_h    =  recess_h + wall_t;

module m3_recess(total_h) {
    cylinder(h=total_h, d=m3_shaft);
    translate([0, 0, total_h - m3_head_h])
        cylinder(h=m3_head_h+0.01, d=m3_head_d);
}

module obelisk_bottom() {
    difference() {
        cube([ow, od, plate_h]);

        // Docking recess from top face
        translate([ow/2 - recess_w/2, od/2 - recess_d/2, plate_h - recess_h])
            cube([recess_w, recess_d, recess_h + 0.01]);

        // M3 button head recesses — 4 corners only
        translate([screw_in,    screw_in,    0]) m3_recess(plate_h);
        translate([ow-screw_in, screw_in,    0]) m3_recess(plate_h);
        translate([screw_in,    od-screw_in, 0]) m3_recess(plate_h);
        translate([ow-screw_in, od-screw_in, 0]) m3_recess(plate_h);
    }
}

obelisk_bottom();
