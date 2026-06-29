# iSight Camera Module Variants

This document tracks known internal iMac iSight camera modules that can be reclaimed and reused as USB webcams.

Each module may use different connectors, harness colors, mounting hardware, or mechanical dimensions. Do not assume wire colors are universal across variants. Always confirm continuity and pinout before applying power.

## Known Variants

| Module PCB | Donor System        | Harness    | USB VID/PID         | Status          |
| ---------- | ------------------- | ---------- | ------------------- | --------------- |
| 820-2572-A | 27" iMac, Late 2009 | 593-1027 A | `VID_05AC&PID_8502` | Video confirmed |

---

# Apple 820-2572-A

<img width="3000" height="4000" alt="20260628_144630" src="https://github.com/user-attachments/assets/525cbc46-16ad-466b-9672-0529885d1c1c" />

## Summary

| Item                    | Value                             |
| ----------------------- | --------------------------------- |
| Donor system            | 27" Apple iMac, Late 2009         |
| PCB marking             | `820-2572-A`                      |
| Aluminum shim           | `806-02600`                       |
| Plastic frame           | `8T98PEEC2 77K3L00`               |
| Harness                 | `593-1027 A`                      |
| Harness colors observed | Black, brown, white, purple, grey |
| USB VID/PID             | `VID_05AC&PID_8502`               |
| Windows raw name        | `Built-in iSight`                 |
| Windows installed name  | `Apple Built-in iSight`           |
| Video capture           | Confirmed                         |

This module operates as a native USB 2.0 camera once wired to USB VBUS, GND, D+, and D-. No microcontroller, firmware bridge, or conversion logic is required.

## Status

| Test                     | Result    |
| ------------------------ | --------- |
| USB enumeration          | Confirmed |
| Windows device detection | Confirmed |
| Driver association       | Confirmed |
| Video capture            | Confirmed |

## Windows Notes

On Windows, this module initially appears as:

```text
Built-in iSight
```

Observed hardware ID:

```text
VID_05AC&PID_8502
```

After driver association, Device Manager identifies the camera as:

```text
Apple Built-in iSight
```

Testing used `AppleNullDriver64.exe` version `2.1.1.1`, extracted to a folder and installed manually through Device Manager.

We do not redistribute Apple driver packages in this repository.
Users are responsible for obtaining any Apple or Boot Camp driver files from their own legally obtained sources.

## Wiring

Observed harness: `593-1027 A`

Connector orientation note: Pin 1 is marked by the arrow near the connector, closest to the PCB edge.

| Pin | Wire color | Function                | USB connection            |
| --: | ---------- | ----------------------- | ------------------------- |
|   1 | Black      | Chassis / shield ground | USB GND / connector shell |
|   2 | Brown      | +5V                     | USB VBUS                  |
|   3 | Purple     | USB D-                  | USB D-                    |
|   4 | White      | USB D+                  | USB D+                    |
|   5 | Grey       | USB ground              | USB GND                   |

## Ground / Chassis Notes

On this module, chassis/shield ground and USB ground are bonded.

Both Pin 1 and Pin 5 should tone to the heatsink / thermal pad area.

For a simple USB-C breakout wiring harness, both Pin 1 and Pin 5 may be connected to USB ground. Pin 1 may also be bonded to the USB-C connector shell if the breakout exposes shell ground.

## USB-C Breakout Mapping

| iSight Pin | Signal                  | USB-C breakout |
| ---------: | ----------------------- | -------------- |
|          1 | Chassis / shield ground | GND / shield   |
|          2 | +5V                     | VBUS           |
|          3 | D-                      | D-             |
|          4 | D+                      | D+             |
|          5 | USB ground              | GND            |

## Mechanical Notes

The aluminum shim appears to function as a thermal spreader rather than a required structural mount.

The PCB includes a thermal pad area that originally mates thermally into the iMac chassis assembly. Enclosure designs should preserve a thermal path or provide a small heatsink / clearance channel above this region.

## Caution

Wire colors may differ between harness revisions, donor machines, or module variants.

Before applying power:

1. Confirm ground continuity.
2. Confirm chassis/shield behavior.
3. Verify VBUS is not shorted to ground.
4. Confirm D+ and D- orientation.
5. Test USB enumeration before final enclosure assembly.
