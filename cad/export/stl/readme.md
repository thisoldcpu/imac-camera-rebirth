# Obelisk STL Exports

This folder contains exported `.stl` mesh files for the Obelisk enclosure.

These files are generated from the OpenSCAD source files in:

```text
/cad/scad
```

STL files are provided for broad slicer and printer compatibility. They are useful for users who want to slice the parts manually, inspect the geometry, or use printers that do not handle `.3mf` files well.

For the known-good Bambu Studio print setup, use the `.3mf` exports instead:

```text
/cad/export/3mf
```

## Files

| File                    | Source   | Description                                |
| ----------------------- | -------- | ------------------------------------------ |
| `obelisk_top.stl`       | OpenSCAD | v0 top shell mesh export.                  |
| `obelisk_bottom.stl`    | OpenSCAD | v0 bottom shell / mount plate mesh export. |
| `obelisk_top_v1.stl`    | OpenSCAD | v1 top shell mesh export.                  |
| `obelisk_bottom_v1.stl` | OpenSCAD | v1 bottom shell / mount plate mesh export. |

## Recommended STL Files

Use the latest matching top and bottom pair:

<img width="2560" height="1396" alt="obelisk_bottom_v1" src="https://github.com/user-attachments/assets/78d9df0f-b3a6-4c7d-b625-b4da0462e982" />
<img width="2560" height="1396" alt="obelisk_top_v1" src="https://github.com/user-attachments/assets/2073b307-8de8-4243-9406-f4026e71d60c" />

```text
obelisk_top_v1.stl
obelisk_bottom_v1.stl
```

These two parts form the current Obelisk v1 enclosure.

The top shell contains the primary enclosure walls, USB-C opening, camera module clearance, and internal support posts.

The bottom part is not just a lid. It is also the mount interface. The recessed area in the bottom part is intentional and defines how the enclosure attaches to future bases or mounting plates.

## STL Limitations

STL files contain only mesh geometry.

They do not preserve:

```text
filament assignments
support material settings
support interface material
print orientation intent
slicer modifiers
printer profile settings
plate layout
```

This matters for Obelisk because the prepared Bambu Studio `.3mf` project uses PLA support material for support interfaces.

When printing from STL, manually confirm your slicer settings before printing.

## Support Material Warning

The Obelisk enclosure includes internal features and supported surfaces that benefit from clean support separation.

The prepared `.3mf` project uses:

```text
Model material: selected body material
Support interface: PLA support material
```

STL exports do not preserve this setup.

When slicing the STL files manually, review:

```text
support enablement
support interface material
top Z distance
bottom Z distance
support/object XY distance
overhang handling
internal support removal access
```

For the intended Bambu Studio setup, use:

```text
/cad/export/3mf/obelisk_v1.3mf
```

## Bottom / Mount Plate Design

The Obelisk bottom is intentionally exported as a singular model.

The recessed area is the mounting interface. This allows the visible top shell to remain shared while different bottom variants provide different installation options.

Planned bottom / mount variants include:

```text
M6+ mount
Wedge base
Bottom plates
Monitor clip base
VESA / arm mount
```

Future mount-specific STL exports should use descriptive filenames:

```text
obelisk_bottom_m6_v1.stl
obelisk_bottom_wedge_v1.stl
obelisk_bottom_plate_v1.stl
obelisk_bottom_monitor_clip_v1.stl
obelisk_bottom_vesa_v1.stl
```

## Version Notes

`v0` files represent the first printable OpenSCAD mesh exports.

`v1` files represent the first revised Obelisk shell geometry intended for practical test printing.

Future versions should use the same naming pattern:

```text
obelisk_top_v2.stl
obelisk_bottom_v2.stl
obelisk_bottom_m6_v2.stl
obelisk_bottom_wedge_v2.stl
```

## Source of Truth

The STL files are generated build artifacts.

The editable source of truth remains the OpenSCAD source in:

```text
/cad/scad
```

If the OpenSCAD geometry changes, regenerate the matching STL exports so the printable mesh files remain in sync with the CAD source.
