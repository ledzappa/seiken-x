/// @description Insert description here
// You can write your code in this editor
if (outofview){
  instance_deactivate_layer("enemies");
} else {
  instance_activate_layer("enemies");
}

vsp = vsp + grv;

// vertical collision
if (place_meeting(x, y + vsp, oWall)) {
	while(!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = 90;