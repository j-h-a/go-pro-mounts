//
// GoPro Quick Release Base
//
// By Jay Abbott 2014
//

use <simple_objects.scad>;



// Constants
// --------------------------------

baseWidth = 37.5;
baseLength = 49.5;
baseOuterCurveRadius = 58;
minkowskiRadius = 7;



// Modules
// --------------------------------

module quickReleaseBase(thickness = 3)
{
		minkowski()
		{
			intersection()
			{
				box([baseLength - (2 * minkowskiRadius), baseWidth - (2 * minkowskiRadius), thickness / 2], cz = 0);
				translate([0, (baseWidth / 2) - baseOuterCurveRadius - minkowskiRadius, 0])
					cylinder(r = baseOuterCurveRadius, h = thickness, $fn=100);
				translate([0, -(baseWidth / 2) + baseOuterCurveRadius + minkowskiRadius, 0])
					cylinder(r = baseOuterCurveRadius, h = thickness, $fn = 100);
			}
			cylinder(r = minkowskiRadius, h = thickness / 2);
		}
}
