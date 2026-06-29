# Obelisk 3MF Exports

This folder contains exported `.3mf` files for the Obelisk enclosure.

These files are generated from the OpenSCAD source files in:

```text
/cad/openscad
```

Some files are direct OpenSCAD exports of individual parts. Others are Bambu Studio project exports prepared as complete print layouts.

## Files

| File                     | Source       | Description                                                            |
| ------------------------ | ------------ | ---------------------------------------------------------------------- |
| `obelisk.3mf`            | Bambu Studio | Complete Obelisk print layout exported as a single print job.          |
| `obelisk_v1.3mf`         | Bambu Studio | Complete Obelisk v1 print layout with PLA support material configured. |
| `obelisk_v1_preview.png` | Bambu Studio | Screenshot preview of the v1 layout with PLA support material.         |
| `obelisk_top.3mf`        | OpenSCAD     | v0 top shell export.                                                   |
| `obelisk_bottom.3mf`     | OpenSCAD     | v0 bottom shell / mount plate export.                                  |
| `obelisk_top_v1.3mf`     | OpenSCAD     | v1 top shell export.                                                   |
| `obelisk_bottom_v1.3mf`  | OpenSCAD     | v1 bottom shell / mount plate export.                                  |

## Recommended Print

Use the latest complete Bambu Studio project unless you specifically need individual parts:

```text
obelisk_v1.3mf
```

This file contains the v1 top and bottom components arranged as a single print job.

<img width="2560" height="1392" alt="obelisk_v1_preview" src="https://github.com/user-attachments/assets/416b6fa4-de5e-4551-954d-5493a9b09b24" />

The v1 project is configured to use **PLA support material** for support interfaces. This matters. The support-material assignments are part of the intended print setup and may be lost if the file is imported into another slicer or reconfigured manually.

## Support Material

The Obelisk print uses support material where needed for clean internal features and removable support contact surfaces.

Current Bambu Studio setup:

```text
Model material: PLA / PETG / selected body material
Support interface: PLA support material
```

Before printing, confirm that the slicer has preserved the intended support-material assignments.

## Bottom / Mount Plate Design

The Obelisk bottom is intentionally a single printable model.

The recessed area in the bottom part is the mount interface. Future bottom variants will use this same design pattern for alternate mounting styles.

Planned bottom / mount variants include:

```text
M6+ mount
Wedge base
Bottom plates
Monitor clip base
VESA / arm mount
```

The top shell is shared across variants. The bottom part defines the mounting behavior.

This keeps the visible enclosure consistent while allowing different installation styles.

## Individual Part Exports

The individual top and bottom `.3mf` files are provided for users who want to:

* slice the parts manually
* modify orientation
* use a different printer profile
* print only one half of the enclosure
* compare v0 and v1 geometry
* develop alternate bottom / mount variants

## Version Notes

`v0` files represent the first printable OpenSCAD export.

`v1` files include the first revised Obelisk shell geometry intended for practical test printing.

Future versions should use the same naming pattern:

```text
obelisk_top_v2.3mf
obelisk_bottom_v2.3mf
obelisk_v2.3mf
obelisk_v2_preview.png
```

Mount-specific bottom variants should use descriptive names:

```text
obelisk_bottom_m6_v1.3mf
obelisk_bottom_wedge_v1.3mf
obelisk_bottom_plate_v1.3mf
obelisk_bottom_vesa_v1.3mf
```

## Notes

The `.3mf` files are exported build artifacts. The editable source of truth remains the OpenSCAD files in `/cad/openscad`.

If you modify the CAD, regenerate the matching export files so the source and printable outputs stay in sync.
