# CAD

This folder contains the CAD source files and printable exports for the iMac Camera Rebirth enclosure designs.

The project uses OpenSCAD for editable source geometry and exports STL / 3MF files for printing.

## Folder Layout

| Folder        | Purpose                                                          |
| ------------- | ---------------------------------------------------------------- |
| `/cad/scad`   | Editable OpenSCAD source files. This is the CAD source of truth. |
| `/cad/export` | Generated printable files exported from the OpenSCAD source.     |

## Source Files

The OpenSCAD files live in:

```text
/cad/scad
```

These files define the enclosure geometry, shared parameters, module-specific dimensions, and printable part variants.

Use these files when you want to:

* modify the design
* create a new enclosure variant
* adjust tolerances
* add a new camera module carrier
* regenerate STL or 3MF exports

## Exported Print Files

Printable exports live in:

```text
/cad/export
```

The export folder contains generated mesh and print-project files intended for slicers and printers.

Current export formats include:

| Format | Folder            | Notes                                                  |
| ------ | ----------------- | ------------------------------------------------------ |
| STL    | `/cad/export/stl` | Universal mesh exports for broad slicer compatibility. |
| 3MF    | `/cad/export/3mf` | Modern print exports and Bambu Studio project files.   |

For most users, the recommended print files are the prepared `.3mf` projects because they preserve more print intent than STL files.

## Enclosure Families

Current enclosure work includes:

| Enclosure | Description                                                                             |
| --------- | --------------------------------------------------------------------------------------- |
| Obelisk   | Rectangular monolith-style enclosure with interchangeable bottom / mount variants.      |
| Cylinder  | Cylindrical desktop enclosure using original internal geometry and modern USB-C layout. |

Both enclosure styles may support either direct USB camera modules or builds that require an internal MCU / bridge board.

The enclosure shape does not define the electronics path.

## Design Model

The CAD is organized around four separate concerns:

```text
Enclosure style  = visible outer shell
Camera module    = reclaimed iMac camera variant
Electronics path = direct USB or bridge / MCU
Mounting style   = wedge, plate, monitor, M6+, VESA, etc.
```

The goal is to keep the visible enclosure designs reusable while allowing module-specific carriers, wiring approaches, and mounting bases to evolve independently.

## Source of Truth

The editable source of truth is always:

```text
/cad/scad
```

The files in `/cad/export` are generated build artifacts.

When the OpenSCAD source changes, regenerate the matching STL / 3MF exports so the repository stays in sync.

## Notes

STL files contain only mesh geometry.

3MF files may preserve additional print setup information, depending on how they were exported. Bambu Studio `.3mf` files may include plate layout, filament assignments, and support-material configuration.

For the current Obelisk print, the Bambu Studio project uses PLA support material for support interfaces. This setting matters and may not survive conversion to other formats.
