function scr_melee_idle_anim() {
	if(is_array(wpn_melee) and wpn_ranged = obj_vc.wpn_sidearm and !reloading and !throwing) or
	(is_array(wpn_melee) and attack != 0) or
	(is_array(wpn_melee) and melee_power > 2)

	{
	var anim_frame;
	var array = wpn_melee[21]
	var array2 = array[11]

	var anim_speed = array[12]
	var size = array_length_1d(array2)-1
	var timer_length = size*anim_speed 


	melee_idle_anim_tick += 1
	if(melee_idle_anim_tick > timer_length) {melee_idle_anim_tick = 0}
	anim_frame = round(melee_idle_anim_tick/anim_speed)

	skeleton_attachment_set("melee_anim", array2[anim_frame])
	}


}
