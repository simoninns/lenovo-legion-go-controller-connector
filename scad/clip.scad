/************************************************************************

    clip.scad
    
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

module clip_centre_cutout()
{
    union() {
        move([0,-0.5,1]) cuboid([3,70.5,5]);

        move([0,-31,1]) cuboid([6,9,5], fillet=0.5, edges=EDGES_Z_ALL);
        move([0,-31 + 9 + 5.5,1]) cuboid([6,10,5], fillet=0.5, edges=EDGES_Z_ALL);
        move([0,-31 + 9 + 5.5 + 20 + 5,1]) cuboid([6,30,5], fillet=0.5, edges=EDGES_Z_ALL);
        move([0,-31 + 9 + 5.5 + 20 + 5 + 18.5 + 5,1]) cuboid([6,7,5], fillet=0.5, edges=EDGES_Z_ALL);

        move([0,-25,-0.25]) cuboid([6,5, 2.5]);
        move([0,-10,-0.25]) cuboid([6,5, 2.5]);
        move([0,25,-0.25]) cuboid([6,5, 2.5]);
    }
}

module clip_centre_top_recess()
{
    // Right-side only
    move([0,0,3]) hull() {
        move([2.25,34.75,1]) zcyl(h=5,d=1.5);
        move([2.25,35.25,1]) zcyl(h=5,d=1.5);
    }

    // Left-side only
    move([0,0,3]) hull() {
        move([-2.25,34.75,1]) zcyl(h=5,d=1.5);
        move([-2.25,35.25,1]) zcyl(h=5,d=1.5);
    }
}

module clip_body()
{
    move([0,0,3]) {
        difference() {
            // Main body
            move([0,0,-0.5]) cuboid([11,76,5]);

            // Centre cut-out
            clip_centre_cutout();

            // Bottom horizontal cutout
            move([0,-35.5 + 6,3.5 - 1.5]) cuboid([9, 2.8, 4]);

            // Electrical connector recess
            hull() {
                move([0,(63/2) - 14,0]) zcyl(h=10, d=3.8);
                move([0,(63/2) - 14 - 13,0]) zcyl(h=10, d=3.8);
            }
        }

        // Add pressure grips
        move([-2.5,-24.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);
        move([+2.5,-24.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);

        move([-2.5,-9.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);
        move([+2.5,-9.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);

        move([-2.5,25.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);
        move([+2.5,25.5,0.5-0.125]) zrot(90) yrot(180) right_triangle([4, 2, 1.25], center=true);
    }
}

module clip()
{
    difference() {
        clip_body();
        clip_centre_top_recess();
    }
}

module clip_body_main(offset)
{
    difference() {
        union() {
            move([0,0,2.5]) {
                difference() {
                    move([0,-1,0]) cuboid([15,131,5], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM);
                    move([offset,0,1]) cuboid([11,76,6]);
                }
            }
            move([offset,0,0]) clip();
        }

        // Screw holes
        move([0,55,0]) zcyl(h=15,d=3.5);
        move([0,-55,0]) zcyl(h=15,d=3.5);

        // Screw head recess
        move([0,55,7 - 3]) zcyl(h=4,d=6);
        move([0,-55,7 - 3]) zcyl(h=4,d=6);

        // This way up marker
        move([0,48,6]) xrot(90) yrot(-45) right_triangle([3,3,3], center=true);
    }
}

// Left clip has one direction arrow marker
module render_clip_left(toPrint)
{
    if (toPrint) move([0,0,0]) clip_body_main(0.5);
    else {
        move([15,0,0]) yrot(90) xrot(-6) {
            clip_body_main(0.5);
        }
    }
}

// Right clip has two direction arrow markers
module render_clip_right(toPrint)
{
    if (toPrint) move([0,0,0]) {
        difference() {
            clip_body_main(-0.5);
            
            // Side marking
            move([0,45,6]) xrot(90) yrot(-45) right_triangle([3,3,3], center=true);
        }
    } else {
        move([-15,0,0]) yrot(-90) xrot(-6) {
            difference() {
                clip_body_main(-0.5);
                
                // Side marking
                move([0,45,6]) xrot(90) yrot(-45) right_triangle([3,3,3], center=true);
            }
        }
    }
}

module render_clip_support_enforcer(toPrint)
{
    if (toPrint) {
        move([0,-25.5,3]) cuboid([8,5, 6]);
        move([0,-10.5,3]) cuboid([8,5, 6]);
        move([0,24,3]) cuboid([8,5, 6]);
    }
}