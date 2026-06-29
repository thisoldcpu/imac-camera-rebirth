// =============================================================================
// imac-camera-rebirth — obelisk_top.scad
// Top shell: 5"x3"x1" tray, open bottom, prints face-down
// https://github.com/thisoldcpu/imac-camera-rebirth
// =============================================================================

include <params.scad>

$fn = 64;

ow       = 127.00;  // 5"
od       =  76.20;  // 3"
oh       =  25.40;  // 1"
wall_t   =   3.00;
facia_t  =  14.50;
screw_in =   8.00;

usbc_w   =   9.00;
usbc_h   =   3.50;

ped_w    =  14.50;  // JRC-B008 PCB width
ped_d    =   9.00;  // JRC-B008 PCB depth
// Pedestal drops from top face down to top of USB-C opening
// USB-C opening center is at oh/2, top edge at oh/2 + usbc_h/2
// Pedestal bottom = oh/2 + usbc_h/2, top = oh - wall_t (underside of top face)
ped_bottom = oh/2 + usbc_h/2;
ped_top    = oh - wall_t;
ped_h      = ped_top - ped_bottom;

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
            translate([ow - facia_t, 0, 0])
                cube([facia_t, od, oh]);

            // Front wall
            cube([ow, wall_t, oh]);

            // Rear wall
            translate([0, od - wall_t, 0])
                cube([ow, wall_t, oh]);

            // 4 corner posts
            translate([screw_in,    screw_in,    0]) cylinder(h=post_h, d=post_od);
            translate([ow-screw_in, screw_in,    0]) cylinder(h=post_h, d=post_od);
            translate([screw_in,    od-screw_in, 0]) cylinder(h=post_h, d=post_od);
            translate([ow-screw_in, od-screw_in, 0]) cylinder(h=post_h, d=post_od);

            // USB-C PCB pedestal: hangs from top face down to top of USB-C opening
            translate([wall_t, od/2 - ped_d/2, ped_bottom])
                cube([ped_w, ped_d, ped_h]);
        }

        // Lens hole through right facia — centered Y and Z
        translate([ow - facia_t - 1, od/2, oh/2])
            rotate([0, 90, 0])
                cylinder(h=facia_t+2, d=lens_dia + lens_clear*2);

        // USB-C cutout through left wall — rounded rect, centered Y and Z
        // Build as hull of 4 cylinders lying on X axis
        translate([0, od/2, oh/2])
            rotate([0, 90, 0])
                translate([0, 0, -1])
                    hull() {
                        translate([ usbc_h/2 - 1,  usbc_w/2 - 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([-usbc_h/2 + 1,  usbc_w/2 - 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([ usbc_h/2 - 1, -usbc_w/2 + 1, 0]) cylinder(h=wall_t+2, r=1);
                        translate([-usbc_h/2 + 1, -usbc_w/2 + 1, 0]) cylinder(h=wall_t+2, r=1);
                    }

        // M2 through-holes in posts
        translate([screw_in,    screw_in,    -1]) cylinder(h=post_h+2, d=2.2);
        translate([ow-screw_in, screw_in,    -1]) cylinder(h=post_h+2, d=2.2);
        translate([screw_in,    od-screw_in, -1]) cylinder(h=post_h+2, d=2.2);
        translate([ow-screw_in, od-screw_in, -1]) cylinder(h=post_h+2, d=2.2);
    }
}

obelisk_top();
