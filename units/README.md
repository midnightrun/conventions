# Unit conventions

This document states conventions for the use of units at Einride. We
strive towards following these conventions to facilitate any integration
of partner solutions and to avoid bugs when developing our software.

## SI-Units

Unless explicitly stated, all variables and constants using physical
units, are according to SI. For a list of all SI-units, see
[Wikipedia: International System Of Units](https://en.wikipedia.org/wiki/International_System_of_Units).

## In Code

When we write code we strive to facilitate for the reader. That means we
explicitly state the SI-unit by adding the corresponding unit when a
variable is sent from its function.

##### Example

```
func pointAngle(p1 r2.Point, p2 r2.Point) unit.Angle {
	deltaX := p2.X - p1.X
	deltaY := p2.Y - p1.Y
	angleRadians := math.Atan2(deltaY, deltaX)
	if angleRadians < 0 {
		angleRadians += 2 * math.Pi
	}
	return unit.Angle(angleRadians) * unit.Radian
}
```
