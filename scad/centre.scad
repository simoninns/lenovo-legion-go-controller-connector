/************************************************************************

    centre.scad
    
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

module centre()
{
    difference() {
        union() {
            hull() {
                move([15,0,0]) yrot(90) xrot(-6) {
                    move([0,-1,.5]) cuboid([15,131,1], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM-EDGES_TOP);
                }

                move([-15,0,0]) yrot(-90) xrot(-6) {
                    move([0,-1,0.5]) cuboid([15,131,1], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM-EDGES_TOP);
                }
            }
        }

        move([15,0,0]) yrot(90) xrot(-6) {
            move([0,-1,2.5]) cuboid([16,134,5.1], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM);
        }

        move([-15,0,0]) yrot(-90) xrot(-6) {
            move([0,-1,2.5]) cuboid([16,134,5.1], chamfer=1, edges=EDGES_ALL-EDGES_BOTTOM);
        }

        // Screw holes
        move([15,0,0]) yrot(90) xrot(-6) {
            move([0,55,-4]) zcyl(h=8,d=3.5);
            move([0,-55,-4]) zcyl(h=8,d=3.5);
        }

        move([-15,0,0]) yrot(-90) xrot(-6) {
            move([0,55,-4]) zcyl(h=8,d=3.5);
            move([0,-55,-4]) zcyl(h=8,d=3.5);
        }

        // Threaded inserts
        move([15,0,0]) yrot(90) xrot(-6) {
            move([0,55,-2.5]) zcyl(h=7,d=4);
            move([0,-55,-2.5]) zcyl(h=7,d=4);
        }

        move([-15,0,0]) yrot(-90) xrot(-6) {
            move([0,55,-2.5]) zcyl(h=7,d=4);
            move([0,-55,-2.5]) zcyl(h=7,d=4);
        }

        // Remove centre material
        hull() {
            move([-0,45,0]) zcyl(h=16,d=10);
            move([-8,-45,0]) zcyl(h=16,d=10);
            move([+8,-45,0]) zcyl(h=16,d=10);
        }

        move([0,0,-2]) hull() {
            move([-0,45,8]) zcyl(h=4,d1=8, d2=12);
            move([-8,-45,8]) zcyl(h=4,d1=8, d2=12);
            move([+8,-45,8]) zcyl(h=4,d1=8, d2=12);
        }

        move([0,0,-2 - 12]) hull() {
            move([-0,45,8]) zcyl(h=4,d2=8, d1=12);
            move([-8,-45,8]) zcyl(h=4,d2=8, d1=12);
            move([+8,-45,8]) zcyl(h=4,d2=8, d1=12);
        }

        // // Lower cut-out
        hull() {
            move([-9,-64,0]) zcyl(h=20,d=10);
            move([+9,-64,0]) zcyl(h=20,d=10);

            move([-10,-70,0]) zcyl(h=20,d=10);
            move([+10,-70,0]) zcyl(h=20,d=10);
        }

        move([0,0,-2]) hull() {
            move([-9,-64,8]) zcyl(h=4,d1=8, d2=12);
            move([+9,-64,8]) zcyl(h=4,d1=8, d2=12);

            move([-10,-70,8]) zcyl(h=4,d1=8, d2=12);
            move([+10,-70,8]) zcyl(h=4,d1=8, d2=12);
        }

        move([0,0,-2 - 12]) hull() {
            move([-9,-64,8]) zcyl(h=4,d2=8, d1=12);
            move([+9,-64,8]) zcyl(h=4,d2=8, d1=12);

            move([-10,-70,8]) zcyl(h=4,d2=8, d1=12);
            move([+10,-70,8]) zcyl(h=4,d2=8, d1=12);
        }


        // Upper cut-out
        hull() {
            move([-0,63,0]) zcyl(h=16,d=10);
            move([-0,69,0]) zcyl(h=16,d=10);
        }

        move([0,0,-2]) hull() {
            move([0,63,8]) zcyl(h=4,d1=8, d2=12);
            move([0,69,8]) zcyl(h=4,d1=8, d2=12);
        }

        move([0,0,-2 - 12]) hull() {
            move([0,63,8]) zcyl(h=4,d2=8, d1=12);
            move([0,69,8]) zcyl(h=4,d2=8, d1=12);
        }

        // Marker for orientation
        //move([0,0,12]) ycyl(h=130,d=1 0);
        move([0,-55,5]) cuboid([10,20,10], chamfer=1);
        move([0,-68,5]) cuboid([10+2,20+2,10+2], chamfer=2);
        move([0,-68+27,5]) cuboid([10+2,20+2,10+2], chamfer=2);
        move([0,-55,11.5]) cuboid([10+2,20+2,10+2], chamfer=2);
    }
}

module render_centre(toPrint)
{
    if (toPrint) {
        move([0,0,7.5]) centre();
    } else {
        centre();
    }
}