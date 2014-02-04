//
// GoPro Two Prong Connector
//
// By Jay Abbott 2014
//

use <lib/mounting_prongs.scad>



// Adjustable values
// --------------------------------

plateLength = 20;



// The model
// --------------------------------

// Bottom prong
translate([0, -10, 0])
	prong(layer = 2, separator = true, length = plateLength);

// Top prong
translate([0, 10, 0])
	prong(layer = 4, length = plateLength);


