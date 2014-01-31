//
// GoPro Quick Release Base Clip
//
// By Jay Abbott 2014
//

use <lib/simple_objects.scad>;
use <lib/quickrelease_base.scad>;



// Constants
// --------------------------------

$fn = 32;

baseThickness = 3;

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
		box([1000, 1000, 1000], cx = 1, cz = 0);
		quickReleaseBase(baseThickness);
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

module quickReleaseBaseClipHalf()
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

quickReleaseBaseClipHalf();
