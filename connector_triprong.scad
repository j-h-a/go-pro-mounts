//
// GoPro Three Prong Connector
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
translate([0, -20, 0])
	prong(layer = 1, separator = true, length = plateLength);

// Middle prong
translate([0, 0, 0])
	prong(layer = 3, separator = true, length = plateLength);

// Top prong
translate([0, 20, 0])
	prong(layer = 5, length = plateLength);


