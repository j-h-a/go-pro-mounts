//
// GoPro Three Prong Connector
//
// By Jay Abbott 2014
//

use <lib/mounting_prongs.scad>



// The model
// --------------------------------

// Bottom prong
translate([0,-20,0])
	prong(1);

// Middle prong
translate([0,0,0])
	prong(3);

// Top prong
translate([0,20,0])
	prong(5);


