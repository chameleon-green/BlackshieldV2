/// @description end melee
canmove = 1
canshoot = 1
hspeed = 0
swinging = 0
attack = 0 //set attack sequence back to zero
skeleton_animation_clear(6)


var array = wpn_ranged[wpn_ranged.Animations]
skeleton_animation_set_ext(array[5], 1)

if(wpn_ranged = obj_vc.wpn_sidearm)
{
	var anim_array2 = wpn_melee[wpn_melee.Animations]
	skeleton_animation_set_ext(anim_array2[8],8)
} 

