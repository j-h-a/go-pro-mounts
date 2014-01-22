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
plateLength = 20;
prongThicknesses = [3, 3, 3.6, 3, 3];

nutHeight = 3.5;
nutDiameter = 10;
holeDiameter = 5.3;



// Modules
// --------------------------------

module prongBody(depth = 1)
{
	union()
	{
		// Mount plate (box and cylinder)
		box([plateLength, plateWidth, depth], cx = 1, cz = 0);
		cylinder(r = ringDiameter / 2, h = depth, $fn = detail);
	}
}

module prongSeparator(elevation = 1, depth = 1, clearance = 1.5)
{
	height = elevation + depth;

	intersection()
	{
		difference()
		{
			// Over-sized mount plate
			box([plateLength, plateWidth, height], cx = 1, cz = 0);
			// Cut-out section
			translate([0, 0, -0.1])
				cylinder(r = (ringDiameter / 2) + clearance, h = height + 0.2, $fn = detail);

			// Notches - for extra strength when attaching using sugru
			translate([-ringDiameter, plateWidth * 0.6, -0.1])
				cylinder(r = plateWidth / 3, h = height + 0.2, $fn = 6);
			translate([-ringDiameter, -plateWidth * 0.6, -0.1])
				cylinder(r = plateWidth / 3, h = height + 0.2, $fn = 6);
		}

		translate([-ringDiameter, 0, -0.1])
			cylinder(r = ringDiameter / 2, h = height + 0.2, $fn = detail);
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

module prongLayer(depth = 1, separatorHeight = 0, nutHousing = false)
{
	difference()
	{
		union()
		{
			// Main prong body
			prongBody(depth);

			// Nut housing
			if(nutHousing)
			{
				nutHousing(depth, nutHeight);
			}

			// Separator
			prongSeparator(depth, separatorHeight);
		}

		// Central hole
		translate([0, 0, -0.1])
			cylinder(r = holeDiameter / 2, h = depth + 0.2, $fn = detail);
	}
}

module prong(layer = 0)
{
	if(layer == 1)
	{
		prongLayer(prongThicknesses[0], prongThicknesses[1]);
	}
	if(layer == 2)
	{
		prongLayer(prongThicknesses[1], prongThicknesses[2]);
	}
	if(layer == 3)
	{
		prongLayer(prongThicknesses[2], prongThicknesses[3]);
	}
	if(layer == 4)
	{
		prongLayer(prongThicknesses[3], 0);
	}
	if(layer == 5)
	{
		prongLayer(prongThicknesses[4], 0, true);
	}
}
