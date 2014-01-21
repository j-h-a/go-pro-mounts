
use <simple_objects.scad>;



// Constants
// --------------------------------

detail = 32;

clipDiameter = 14.9;
plateWidth = 12;
plateLength = 20;
plateDepth = 3.4;

nutHeight = 3.5;
nutDiameter = 10;

holeDiameter = 5.3;
notchSize = 3;



// Modules
// --------------------------------

module clipPlate(withNut = false)
{
	offset = -(plateLength - (2 * notchSize));

	difference()
	{
		union()
		{
			// Clip plate (box and cylinder)
			box([plateLength, plateWidth, plateDepth], cx = 1, cz = 0);
			cylinder(r = clipDiameter / 2, h = plateDepth, $fn = detail);

			// Nut housing
			if(withNut)
			{
				intersection()
				{
					translate([0, 0, plateDepth])
						sphere(r = clipDiameter / 2, $fn = detail);
					cylinder(r = clipDiameter / 2, h = plateDepth + nutHeight, $fn = detail);
				}
			}
		}

		// Central hole
		translate([0, 0, -plateDepth * 0.05 / 2])
			cylinder(r = holeDiameter/2, h = plateDepth * 1.1, $fn = detail);

		// Nut hole
		if(withNut)
		{
			translate([0, 0, plateDepth + 0.01])
				cylinder(r = nutDiameter/2, h = nutHeight, $fn = 6);
		}

		// Notches
		translate([offset,  plateWidth / 2, -plateDepth * 0.1])
			box([notchSize, notchSize * 2, (plateDepth * 1.2)], cz = 0, cx = 1);
		translate([offset, -plateWidth / 2, -plateDepth * 0.1])
			box([notchSize, notchSize * 2, (plateDepth * 1.2)], cz = 0, cx = 1);
	}
}

module connector()
{
	union()
	{
		// Stem
		box([notchSize, plateDepth * 5, notchSize], cz = 0, cx = 1);

		// Separator 1
		translate([0, plateDepth, 0])
			box([plateWidth / 2, plateDepth, notchSize * 2], cz = 0, cx = 1);

		// Separator 2
		translate([0, -plateDepth, 0])
			box([plateWidth / 2, plateDepth, notchSize * 2], cz = 0, cx = 1);
	}
}



// The model
// --------------------------------

// Two connectors
translate([18,12,0])
	connector();

translate([18,-12,0])
	connector();

// Bottom/middle plate
translate([0,0,0])
	clipPlate(false);

// Bottom/middle plate
translate([0,-20,0])
	clipPlate(false);

// Top plate
translate([0,20,0])
	clipPlate(true);


