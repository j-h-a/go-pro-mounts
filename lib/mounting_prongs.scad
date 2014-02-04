//
// GoPro Mounting Prongs
//
// By Jay Abbott 2014
//

use <simple_objects.scad>;



// Constants
// --------------------------------

detail = 32;

ringDiameter = 14.9;
plateWidth = 12;
defaultPlateLength = 20;
minPlateLength = 20;
prongThicknesses = [3, 3, 3.6, 3, 3];

nutHeight = 3.5;
nutDiameter = 10;
holeDiameter = 5.3;



// Modules
// --------------------------------

module prongBody(depth = 1, length = 1)
{
	union()
	{
		// Mount plate (box and cylinder)
		box([length, plateWidth, depth], cx = 1, cz = 0);
		cylinder(r = ringDiameter / 2, h = depth, $fn = detail);
	}
}

module prongSeparator(elevation = 1, depth = 1, clearance = 1.5, length = 1)
{
	height = elevation + depth;
	notchRadius = plateWidth / 3;

	intersection()
	{
		difference()
		{
			// Over-sized mount plate
			box([length, plateWidth, height], cx = 1, cz = 0);

			// Circular cut-out section with clearance for the pivot
			translate([0, 0, -0.1])
				cylinder(r = (ringDiameter / 2) + clearance, h = height + 0.2, $fn = detail);

			if(length >= minPlateLength)
			{
				// Notches - for extra strength when attaching using sugru
				translate([-length + notchRadius + 1, plateWidth * 0.6, -0.1])
					cylinder(r = notchRadius, h = height + 0.2, $fn = 6);
				translate([-length + notchRadius + 1, -plateWidth * 0.6, -0.1])
					cylinder(r = notchRadius, h = height + 0.2, $fn = 6);
			}
		}

		// Allowable separator volume, to round the corners near the pivot
		translate([-ringDiameter, 0, -0.1])
		{
			union()
			{
				cylinder(r = ringDiameter / 2, h = height + 0.2, $fn = detail);
				box([length, ringDiameter, height + 0.2], cx = 1, cz = 0);
			}
		}
	}
}

module nutHousing(elevation = 1, depth = 1)
{
	height = elevation + depth;

	difference()
	{
		// Housing
		intersection()
		{
			translate([0, 0, elevation])
				sphere(r = ringDiameter / 2, $fn = detail);
			cylinder(r = ringDiameter / 2, h = height, $fn = detail);
		}

		// Nut hole
		translate([0, 0, -0.1])
			cylinder(r = nutDiameter / 2, h = height + 0.2, $fn = 6);
	}
}

module prongLayer(depth = 1, separatorHeight = 0, nutHousing = false, length = 1, separatorEndStop = false)
{
	difference()
	{
		union()
		{
			// Main prong body
			prongBody(depth, length);

			// Nut housing
			if(nutHousing)
			{
				nutHousing(depth, nutHeight);
			}

			// Separator
			if(separatorHeight > 0)
			{
				prongSeparator(elevation = depth,
							   depth = separatorHeight,
							   length = separatorEndStop ? 11 : length);
			}
		}

		// Central hole
		translate([0, 0, -0.1])
			cylinder(r = holeDiameter / 2, h = depth + 0.2, $fn = detail);
	}
}

module prong(layer = 0, separator = false, separatorEndStop = false, length = defaultPlateLength)
{
	if(layer == 1)
	{
		prongLayer(depth = prongThicknesses[0],
				   separatorHeight = separator ? prongThicknesses[1] : 0,
				   separatorEndStop = separatorEndStop,
				   length = length);
	}
	if(layer == 2)
	{
		prongLayer(depth = prongThicknesses[1],
				   separatorHeight = separator ? prongThicknesses[2] : 0,
				   separatorEndStop = separatorEndStop,
				   length = length);
	}
	if(layer == 3)
	{
		prongLayer(depth = prongThicknesses[2],
				   separatorHeight = separator ? prongThicknesses[3] : 0,
				   separatorEndStop = separatorEndStop,
				   length = length);
	}
	if(layer == 4)
	{
		prongLayer(depth = prongThicknesses[3],
				   length = length);
	}
	if(layer == 5)
	{
		prongLayer(depth = prongThicknesses[4],
				   nutHousing = true,
				   length = length);
	}
}



// Test Objects
// --------------------------------

for(layer = [1:5])
{
	rotate([0, 0, 180 * layer])
		translate([18, 0, (layer - 1) * 5])
			prong(layer, separator = true, separatorEndStop = true, length = 23);
}
