//
// Simple objects
//
// By Jay Abbott 2013
//



/**
 * Box
 *
 * Draws a simple box with dimensions provided in the sz vector.
 *
 * The origin (transformation centre) of the box is controlled by the
 * cx, cy, and cz parameters. 0 for any axis means that the lower-extent
 * of the box is at the origin, and the box extends entirely in the
 * positive direction along that axis. 1 means the upper-edge of the
 * box is at the origin, and the box extends entirely in the negative
 * direction along that axis.
 *
 * The default centre-value is 0.5 for all axes so that the
 * origin of the box is in the centre of the box shape.
 *
 * @param sz	A vector with the [x, y, z] dimensions.
 * @param cx	The x-center
 * @param cy	The y-center
 * @param cz	The z-center
 */

module box(
	sz	= [1, 1, 1],
	cx	= 0.5,
	cy	= 0.5,
	cz	= 0.5)
{
	translate([-sz[0] * cx, -sz[1] * cy, -sz[2] * cz])
		cube(sz);
}

