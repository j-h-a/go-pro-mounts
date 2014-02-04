//
// GoPro Three Prong Connector
//
// By Jay Abbott 2014
//

use <lib/mounting_prongs.scad>



// Adjustable values
// --------------------------------

plateLength = 23;



// Constants
// --------------------------------

transy = [-20, 10, 0, -10, 20];



// The model
// --------------------------------

for(i = [1:5])
{
	rotate([0, 0, 180 * i])
		translate([plateLength + 3, transy[i - 1], 0])
			prong(layer = i, separator = true, separatorEndStop = true, length = plateLength);
}

