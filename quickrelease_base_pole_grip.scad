//
// GoPro Quick Release Base Pole Grip
//
// By Jay Abbott 2014
//

use <simple_objects.scad>;
use <quickrelease_base.scad>;



// Constants
// --------------------------------

$fn = 32;

baseThickness = 2;

poleDiameter = 14.2;
poleClearance = 1.1;
gripLength = 49.3;
gripWallThickness = 1.8;
gripDiameter = poleDiameter + (2 * poleClearance) + (2 * gripWallThickness);
wrapProportion = 0.8;
tieWidth = 5.6;
tieHeight = 2;




// Modules
// --------------------------------

module pole(radius = poleDiameter / 2, length = gripLength)
{
	translate([0, 0, baseThickness + (poleDiameter / 2) + poleClearance])
		rotate([0, 90, 0])
			translate([0, 0, -length / 2])
				cylinder(h = length, r = radius);
}

module poleGrip()
{
	// Tube around the pole with clearance
	difference()
	{
		union()
		{
			pole(radius = gripDiameter / 2);
			box([gripLength, gripDiameter, baseThickness + (gripDiameter / 2) - gripWallThickness], cz = 0);
		}
		pole(radius = (poleDiameter / 2) + poleClearance, length = gripLength * 1.1);
		translate([0, 0, baseThickness + poleClearance + (poleDiameter * wrapProportion)])
			box([gripLength * 1.2, gripDiameter * 1.2, gripDiameter], cz = 0);
	}
}

module quickReleaseBasePoleGrip()
{
	difference()
	{
		union()
		{
			quickReleaseBase(baseThickness);
			poleGrip();
		}

		// Holes for wire-ties
		translate([gripLength / 4, 0, baseThickness])
			box([tieWidth, gripDiameter * 1.2, tieHeight]);
		translate([-gripLength / 4, 0, baseThickness])
			box([tieWidth, gripDiameter * 1.2, tieHeight]);
	}
}



// The Model
// --------------------------------

quickReleaseBasePoleGrip();
