// =============================================================================
// imac-camera-rebirth — params.scad
// Shared parameters for all enclosure variants
// https://github.com/thisoldcpu/imac-camera-rebirth
// =============================================================================
// Module: Apple 820-2572-A (2009 iMac 27")
// =============================================================================

// -----------------------------------------------------------------------------
// PCB
// -----------------------------------------------------------------------------
pcb_l        = 50.00;   // length (X)
pcb_w        =  7.92;   // width (Y)
pcb_d        = 10.00;   // depth lens face to rear connector (Z)

// -----------------------------------------------------------------------------
// Lens barrel
// -----------------------------------------------------------------------------
lens_dia     =  7.50;   // barrel outer diameter
lens_x       = 25.00;   // center offset from PCB left edge (dead center)
lens_y       =  3.96;   // center offset from PCB bottom edge (PCB centerline)

// -----------------------------------------------------------------------------
// USB-C port cutout (rear, dead center)
// -----------------------------------------------------------------------------
usbc_w       =  9.00;   // USB-C receptacle width
usbc_h       =  3.26;   // USB-C receptacle height
usbc_x       = pcb_l / 2; // dead center on PCB length axis

// -----------------------------------------------------------------------------
// Wall and clearance
// -----------------------------------------------------------------------------
wall         =  2.00;   // minimum shell wall thickness
clearance    =  0.20;   // PCB pocket fit clearance (per side)
lens_clear   =  0.30;   // lens aperture clearance (radial)

// -----------------------------------------------------------------------------
// Derived — PCB pocket (do not edit)
// -----------------------------------------------------------------------------
pocket_l     = pcb_l + (clearance * 2);
pocket_w     = pcb_w + (clearance * 2);
pocket_d     = pcb_d + clearance;

// -----------------------------------------------------------------------------
// Obelisk body (top shell)
// -----------------------------------------------------------------------------
body_l       = pocket_l + (wall * 2);
body_w       = pocket_w + (wall * 2);
body_d       = pocket_d + wall;

// -----------------------------------------------------------------------------
// Top/bottom shell split
// -----------------------------------------------------------------------------
split_z      = body_d / 2;  // Z height of shell split plane

// -----------------------------------------------------------------------------
// Heatsink channel
// -----------------------------------------------------------------------------
hs_channel_w =  6.00;   // width of slim channel over HS pad
hs_channel_d =  1.00;   // depth of channel recess into top shell

