using System;
// System.Numerics has Vector2 type which is like FLOAT32x2
using Vector2 = System.Numerics.Vector2;
// System.Numerics.Vector2 has static functions like Dot, Normalize, +, -, etc.
using static System.Numerics.Vector2;

/// <summary>
/// Everything static goes into one happy class Script
/// </summary>
public partial class Script
{

    // define τ and π
    // PI is built into Manifold 9
    public const float π = (float)Math.PI;
    public const float PI = (float)Math.PI;
    public const float τ = π * 2;
    public const float TAU = PI * 2;
    public const float TAU_OVER_4 = PI / 2;
    public const float TAU_OVER_8 = PI / 4;

    public static float Deg2Rad(float d) => d / 180 * π;
    public static float Rad2Deg(float r) => r / π * 180;



    // Shorter aliases for creating Vectors
    public static Vector2 v2(float x, float y) => new Vector2(x, y);


    // Short setters of vector components
    public static Vector2 setx2(Vector2 v, float x) => v2(x, v.Y);
    public static Vector2 sety2(Vector2 v, float y) => v2(v.X, y);

    // flip(negate) vectors
    // use -v (unary minus)

    // Perpicular in 2D (rotate τ/4)
    public static Vector2 perp2(Vector2 v) => v2(-v.Y, v.X);

    // 2D vector angle from "north" clockwise
    public static float AzimuthAngleCW2(Vector2 v) => (float)Math.Atan2(v.X, v.Y);

    // 2D vector angle from "east" counter-clockwise
    public static float AzimuthAngleCCW2(Vector2 v) => (float)Math.Atan2(v.Y, v.X);

    // Epsilon equality
    public static bool EqualsEpsilon2(Vector2 v, Vector2 u, float epsilon) =>
        Math.Abs(v.X - u.X) <= epsilon
        &&
        Math.Abs(v.Y - u.Y) <= epsilon
    ;

    // Makes Vector ab === Subtracts @a from @b
    public static Vector2 ab2(Vector2 a, Vector2 b) => b - a;

    // Scale vectors
    // use α*v - multiply with scalar

    // Scale vector components by another vector
    // use v1*v2 - multiply with another vector

    // MostOrthogonalAxis
    public static Vector2 MostOrthogonalAxis2(Vector2 v) =>
        Math.Abs(v.X) < Math.Abs(v.Y) ? v2(1, 0) : v2(0, 1)
    ;

    public static Vector2 FlipX(Vector2 v) => v2(-v.X, v.Y);
    public static Vector2 FlipY(Vector2 v) => v2(v.X, -v.Y);


    public static float MinimumComponent2(Vector2 v) =>
        v.X <= v.Y ? v.X : v.Y
    ;

    public static float MaximumComponent2(Vector2 v) =>
        v.X >= v.Y ? v.X : v.Y
    ;

    // Unitvector in the same direction  a - "hat" operator
    // use Normalize from System.Numerics.Vector2


    // Interpolate or mix vectors a and b by q
    // Lerp(v1, v2, q)

    // How much of (b-hat is in a, and how much b-hat perp is in a)
    public static Vector2 AlongAcross(Vector2 a, Vector2 b) =>
          v2(
            Dot(a, Normalize(b)),
            Dot(a, perp2(Normalize(b)))
            )
    ;


    public static float AngleBetweenAbs2(Vector2 a, Vector2 b) =>
        (float)Math.Acos(Dot(Normalize(a), Normalize(b)))
    ;

    public static float AngleBetween2(Vector2 a, Vector2 b) =>
            (float)Math.Acos(Dot(Normalize(a), Normalize(b))) * Math.Sign(Dot(perp2(a), b))
    ;

    public static Vector2 LinearTransform2(Vector2 v, Vector2 igt, Vector2 jgt) =>
        v2(
            igt.X * v.X + jgt.X * v.Y,
            igt.Y * v.X + jgt.Y * v.Y
        )
    ;

    // given two points with(unit)vectors, return the coefficents where those vectors will meet.
    // first component< -1  -->
    public static Vector2 αβOfIntersection(Vector2 point1, Vector2 vec1, Vector2 point2, Vector2 vec2) =>
        v2(
            //	Dot(Normalize(perp2(vec2)),  ab2(point1, point2) ) / Dot(vec1, Normalize(perp2(vec2)) ) // no need for expensive Normalize
            //  Normalize of perp'd vec is both in numerator and in denominator and therefore cancels out :)	
            Dot(perp2(vec2), ab2(point1, point2) ) / Dot(vec1, perp2(vec2) )
		    ,
	    //  Dot(perp2(vec1), ab2(point2, point1) ) / Dot(vec2, perp2(vec1) )  // symmetric, but can be rewritten
	    //  To have more common subexpressions but lose symmetry, switch baseline direction and swich perp in the denominator, both change the sign of Dot
            Dot(perp2(vec1), ab2(point1, point2) ) / Dot(vec1, perp2(vec2) )
	    )
    ;


}