# Lenovo Legion Go Controller Connector
## Overview
This project provides a 3D printable controller connector for the Lenovo Legion Go.

This project is GPLv3 open-source.

<img src="/images/1.jpg" width="800">

The connector is designed to hold the controllers in a configuration similar to the Xbox Series X wireless controller.

<img src="/images/4.jpg" width="800">

## Printing instructions
The model has been printed and tested on the Prusa MK3S/MMU2S printer using Prusament PETG filament. All parts fit the standard print bed.

You will need:

* 4x M3x5.7 threaded inserts (heat-set)
* 4x M3x10mm screws

Use of a heat-set insert tool is recommended to ensure the inserts are aligned correctly.

### Recommended print settings

Print settings (for Prusa Slicer) for the centre part are as follows:

* Material: PETG
* Layer: 0.20mm (Quality)
* Infill: 15%
* No supports required

Print settings (for Prusa Slicer) for the two clip parts are as follows:

* Material: PETG
* Layer: 0.20mm (Quality)
* Infill: 15%
* Support enforcers only

Note that the included support enforcers file is the same for both the left and the right clip.

## Assembly

Start with the left and right clips which should have support material under the compression fits:

<img src="/images/5.jpg" width="800">

Remove the support material by pulling it towards the base of the clips:

<img src="/images/6.jpg" width="800">

Removing the support material in the correct direction is important to ensure that the compression fits aren't damaged:

<img src="/images/7.jpg" width="800">

Using a heat-insert tool, insert the threaded inserts into the centre part:

<img src="/images/9.jpg" width="800">

Note that the left clip is marked with one arrow and the right clip is marked with two arrows:

<img src="/images/8.jpg" width="800">

Using 4 M3x10 round-head screws, screw the clips and centre part together to finish the connector:

<img src="/images/3.jpg" width="800">

## Author
This project is designed and maintained by Simon Inns.

## Cloning notes
This repo contains the BOSL OpenSCAD library as a sub-module, after you clone this repo use the following command to initialise the sub-modules:

git submodule update --init

# Licensing
## OpenSCAD source files - software license (GPLv3)

    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Non-source-code media - Creative Commons license (Creative Commons BY-SA 4.0)
Please see the following link for details: https://creativecommons.org/licenses/by-sa/4.0/

You are free to:

Share - copy and redistribute the material in any medium or format
Adapt - remix, transform, and build upon the material
for any purpose, even commercially.

This license is acceptable for Free Cultural Works.

The licensor cannot revoke these freedoms as long as you follow the license terms.

Under the following terms:

Attribution - You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.

ShareAlike - If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions - You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.