/************************************************************************

    main.scad
    
    Lenovo Legion Go Controller Connector
    Copyright (C) 2024 Simon Inns
    
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
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

// Local includes
include <clip.scad>
include <centre.scad>

// Rendering resolution
$fn=50;

/* [Rendering Parameters] */
for_printing = "Display"; // [Display, Printing]

/* [Printable Parts] */
display_clip_left = "Yes"; // [Yes, No]
display_clip_right = "Yes"; // [Yes, No]
display_clip_support_enforcer = "Yes"; // [Yes, No]
display_centre = "No"; // [Yes, No]

module main()
{
    toPrint = (for_printing == "Printing") ? true:false;

    d_clip_left = (display_clip_left == "Yes") ? true:false;
    d_clip_right = (display_clip_right == "Yes") ? true:false;
    d_clip_support_enforcer = (display_clip_support_enforcer == "Yes") ? true:false;
    d_centre = (display_centre == "Yes") ? true:false;

    if (d_clip_left) render_clip_left(toPrint);
    if (d_clip_right) render_clip_right(toPrint);
    if (d_clip_support_enforcer) render_clip_support_enforcer(toPrint);
    if (d_centre) render_centre(toPrint);
}

main();