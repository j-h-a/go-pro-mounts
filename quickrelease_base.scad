//
// GoPro Quick Release Base
//
// By Jay Abbott 2014
//

use <simple_objects.scad>;


// Constants
// --------------------------------

$fn = 32;

baseWidth = 37.5;
baseLength = 49.5;
baseThickness = 3;
baseOuterCurveRadius = 58;
minkowskiRadius = 7;

clipInteriorWidth = 28.6;
clipInteriorHeight = 4.9;
clipLength = 25.6;
clipWallThicknessMin = 3.3;
clipWallThicknessMax = 3.95;
clipRoofTopHeight = 7.3;
clipRoofOverhang = 3.0;
clipHookBacklash = 1.4;
clipEaseInDistance = 3.8;

centreGuideWidth = 3.5;
centreGuideHeight = 2;
centreGuideLength = 34;



// Modules
// --------------------------------

module baseHalf()
{
	intersection()
	{
		box([baseLength / 2, baseWidth, baseThickness], cx = 1, cz = 0);
		minkowski()
		{
			intersection()
			{
				box([(baseLength / 2) - minkowskiRadius, baseWidth - (2 * minkowskiRadius), baseThickness], cx = 1, cz = 0);
				translate([0, (baseWidth / 2) - baseOuterCurveRadius - minkowskiRadius, 0])
					cylinder(r = baseOuterCurveRadius, h = baseThickness, $fn=100);
				translate([0, -(baseWidth / 2) + baseOuterCurveRadius + minkowskiRadius, 0])
					cylinder(r = baseOuterCurveRadius, h = baseThickness, $fn = 100);
			}
			cylinder(r = minkowskiRadius, h = baseThickness);
		}
	}
}

module centreGuide()
{
	box([centreGuideLength / 2, centreGuideWidth, baseThickness + centreGuideHeight], cx = 1, cz = 0);
}

module clipRight()
{
	translate([0, (clipInteriorWidth / 2) - clipRoofOverhang, 0])
		difference()
		{
			linear_extrude(height = baseThickness + clipRoofTopHeight)
			{
				polygon
				([
					[0,											0],
					[0,											clipRoofOverhang + clipWallThicknessMax],
					[-((clipLength / 2) - clipHookBacklash),	clipRoofOverhang + clipWallThicknessMin],
					[-(clipLength / 2),							clipRoofOverhang],
					[-((clipLength / 2) - clipEaseInDistance),	0],
				]);
			}
			translate([0.5, -0.5, -0.5])
				box([(clipLength / 2) + 1, clipRoofOverhang + 0.5, baseThickness + clipInteriorHeight + 0.5], cx = 1, cy = 0, cz = 0);
		}
}

module clipLeft()
{
	mirror([0, 1, 0])
		clipRight();
}

module quickReleaseBaseHalf()
{
	rotate([0, 90, 0])
	union()
	{
		baseHalf();
		centreGuide();
		clipLeft();
		clipRight();
	}
}


// The Model
// --------------------------------

quickReleaseBaseHalf();
