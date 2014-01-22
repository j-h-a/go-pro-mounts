//
// GoPro Two Prong Connector
//
// By Jay Abbott 2014
//

use <mounting_prongs.scad>



// The model
// --------------------------------

// Bottom prong
translate([0,-10,0])
	prong(2);

// Top prong
translate([0,10,0])
	prong(4);


