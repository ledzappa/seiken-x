///Approach(a, b, amount)
///@arg0 from_a
///@arg1 to_b
///@arg2 by amount
///
function Approach(argument0, argument1, argument2) {

	// Moves "a" towards "b" by "amount" and returns the result

	// Nice because it will not overshoot "b", and works in both directions

	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);

	if (argument0 < argument1)
	{
	    argument0 += argument2;
	    if (argument0 > argument1)
	        return argument1;
	}
	else
	{
	    argument0 -= argument2;
	    if (argument0 < argument1)
	        return argument1;
	}
	return argument0;


}
