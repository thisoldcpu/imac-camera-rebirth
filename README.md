# imac-camera-rebirth

**Open hardware project for repurposing 2009–2013 iMac camera modules into modern USB-C webcams.**

![Open Hardware](https://img.shields.io/badge/Open-Hardware-blue)
![USB 2.0](https://img.shields.io/badge/USB-2.0-green)
![USB-C](https://img.shields.io/badge/USB--C-Compatible-blue)
![3D Printable](https://img.shields.io/badge/3D-Printable-orange)

Every year, thousands of otherwise functional iMacs are scrapped due to broken displays, failed logic boards, or obsolete hardware. Their camera modules are often still fully functional, compact, factory-calibrated USB devices destined for e-waste.

**imac-camera-rebirth** documents everything needed to give these cameras a second life.

Whether you want to build your own, integrate one into a robotics project, or simply purchase a ready-to-use webcam, this repository contains the documentation, CAD files, wiring information, and compatibility notes to make it possible.



## Features

* Reuses genuine OEM iMac camera modules
* Native USB 2.0 operation
* USB-C compatible
* No microcontroller required
* Open CAD designs
* Open documentation and pinouts
* Compact desktop and embedded enclosure designs

## Planned Hardware

* **Studio** — Cylindrical desktop webcam inspired by classic desktop camera designs.
* **Wedge** — Ultra-compact enclosure for robotics, photogrammetry, machine vision, kiosks, and custom installations.

## Compatibility

| iMac |  Camera  | USB |  Tested | Notes                      |
| ---- | :------: | :-: | :-----: | -------------------------- |
| 2009 | Module A |  ✔  |    ✔    | Native UVC                 |
| 2010 | Module B |  ✔  |    ✔    | Dual microphone            |
| 2011 | Module C |  ✔  |    ✔    | Different mounting holes   |
| 2012 | Module D |  ✔  | Pending | Alternate bracket required |
| 2013 | Module E |  ✔  | Pending | Alternate bracket required |

## Repository Contents

```
/cad            CAD models and printable enclosures
/docs           Pinouts, teardown notes, compatibility
/photos         Reference images and assembly photos
/reference      Apple part numbers and donor identification
```

## Project Goals

* Reduce electronic waste through hardware reuse.
* Document every known compatible camera module.
* Create high-quality, printable enclosures.
* Keep the project entirely firmware-free whenever possible.
* Make professional-quality USB webcams from discarded hardware.

## Disclaimer

Apple and iMac are trademarks of Apple Inc. This is an independent open hardware project and is not affiliated with, sponsored by, or endorsed by Apple. All camera modules referenced by this project are reclaimed from donor hardware.
