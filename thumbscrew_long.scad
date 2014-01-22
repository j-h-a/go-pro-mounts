//
// GoPro Mounting Thumb-Screw (Long)
//
// By Jay Abbott 2014
//

use <simple_objects.scad>;



// Constants
// --------------------------------

$fn = 32;

handleDiameter = 19.8;
handleLength = 10.6;

cutoutDiameter = 24;
cutoutOffset = 19;

shaftEndLength = 2;
shaftLength = 21;
shaftDiameterBot = 11.9;
shaftDiameterMid = 8.9;
shaftDiameterTop = 10.8;

totalLength = handleLength + shaftEndLength + shaftLength + shaftEndLength;

boltDepth = 18 + totalLength - 45;
boltDiameter = 10;
holeDiameter = 5.3;

// Modules
// --------------------------------

module handle()
{
	intersection()
	{
		// Elongated sphere
		scale([1, 1, 1.35])
			sphere(r = handleDiameter / 2);

		// Slice of the sphere
		difference()
		{
			// Main slice volume
			box([handleDiameter, handleDiameter, handleLength], cz = 0);

			// Cylindrical cutout sections around four edges
			for(t = [[	cutoutOffset,	0				],
					 [	0,				cutoutOffset	],
					 [	-cutoutOffset,	0				],
					 [	0,				-cutoutOffset	]])
			{
				translate([t[0], t[1], -0.1])
					cylinder(h = handleLength + 0.2, r = cutoutDiameter / 2);
			}
		}
	}
}

module shaft()
{
	shaftCurveRad = 72;

	union()
	{
		// Bottom cylinder
		translate([0, 0, handleLength - 0.02])
			cylinder(h = shaftEndLength + 0.02, r = shaftDiameterBot / 2);

		// Curved mid-section
		translate([0, 0, handleLength + shaftEndLength - 0.02])
		{
			rotate_extrude()
			{
				difference()
				{
					polygon(points =
						[	[0, 0],
							[shaftDiameterBot/2+1,	0],
							[shaftDiameterTop/2+1,	shaftLength + 0.02],
							[0,						shaftLength + 0.02]]);
					translate([shaftCurveRad + shaftDiameterMid / 2 + 0.42, shaftLength / 2 + 1.88])
						circle(r = shaftCurveRad, $fn=200);
				}
			}
		}

		// Top cylinder
		translate([0, 0, handleLength + shaftEndLength + shaftLength - 0.02])
			cylinder(h = shaftEndLength + 0.02, r = shaftDiameterTop / 2);
	}
}

module boltHole()
{
	translate([0, 0, -0.1])
		cylinder(h = boltDepth + 0.1, r = boltDiameter / 2, $fn = 6);
}

module hole()
{
	translate([0, 0, -0.1])
		cylinder(h = totalLength + 0.2, r = holeDiameter / 2);
}



// The Model
// --------------------------------

difference()
{
	union()
	{
		handle();
		shaft();
	}

	rotate([0, 0, 360/24])
		boltHole();
	hole();
}


