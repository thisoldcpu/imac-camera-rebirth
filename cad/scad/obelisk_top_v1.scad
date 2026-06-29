// =============================================================================
// imac-camera-rebirth — obelisk_top.scad
// Top shell V1: uniform wall thickness, 4 posts
// https://github.com/thisoldcpu/imac-camera-rebirth
// =============================================================================

include <params.scad>

$fn = 64;

ow       = 127.00;
od       =  76.20;
oh       =  25.40;
wall_t   =   3.00;
screw_in =   8.00;

usbc_w   =   9.00;
usbc_h   =   3.50;

ped_w      =  14.50;
ped_d      =   9.00;
ped_bottom = oh/2 + usbc_h/2;
ped_h      = (oh - wall_t) - ped_bottom;

post_od  =   6.00;
post_h   =  oh - wall_t;

module obelisk_top() {
    difference() {
        union() {
            // Top face
            translate([0, 0, oh - wall_t])
                cube([ow, od, wall_t]);

            // Left wall (USB-C end)
            cube([wall_t, od, oh]);

            // Right wall / facia (lens end)
            translate([ow - wall_t, 0, 0])
                cube([wall_t, od, oh]);

            // Front wall
            cube([ow, wall_t, oh]);

            // Rear wall
            translate([0, od - wall_t, 0])
                cube([ow, wall_t, oh]);

            // 4 posts — corners, inset by screw_in
            translate([screw_in,    screw_in,    0]) cylinder(h=post_h, d=post_od);
            translate([ow-screw_in, screw_in,    0]) cylinder(h=post_h, d=post_od);
            translate([screw_in,    od-screw_in, 0]) cylinder(h=post_h, d=post_od);
            translate([ow-screw_in, od-screw_in, 0]) cylinder(h=post_h, d=post_od);

            // USB-C PCB pedestal hanging from top face
            translate([wall_t, od/2 - ped_d/2, ped_bottom])
                cube([ped_w, ped_d, ped_h]);
        }

        // Lens hole through facia
        translate([ow - wall_t - 1, od/2, oh/2])
            rotate([0, 90, 0])
                cylinder(h=wall_t+2, d=lens_dia + lens_clear*2);

        // USB-C rounded rect cutout through left wall
        translate([0, od/2, oh/2])
            rotate([0, 90, 0])
                translate([0, 0, -1])
                    hull() {
                        translate([ usbc_h/2 - 1,  usbc_w/2 - 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([-usbc_h/2 + 1,  usbc_w/2 - 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([ usbc_h/2 - 1, -usbc_w/2 + 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([-usbc_h/2 + 1, -usbc_w/2 + 1, 0]) cylinder(h=wall_t+2, r=1);
                    }

        // M2 through-holes in 4 posts
        translate([screw_in,    screw_in,    -1]) cylinder(h=post_h+2, d=2.2);
        translate([ow-screw_in, screw_in,    -1]) cylinder(h=post_h+2, d=2.2);
        translate([screw_in,    od-screw_in, -1]) cylinder(h=post_h+2, d=2.2);
        translate([ow-screw_in, od-screw_in, -1]) cylinder(h=post_h+2, d=2.2);
    }
}

obelisk_top();
