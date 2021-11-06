function scr_guardsman_event()
{

	var event = ds_map_find_value(event_data, "name")

	if (event = "rolled"){
		if(skeleton_animation_get() != "grav_air_idle")
		{skeleton_animation_set("grav_air_idle")}
		state = "floating"
		canshoot = 0
		canmove = 0
	}
	
	if (event = "dead"){
	state = "dead"
	skeleton_animation_clear(all)
	image_speed = 0
	hspeed = 0
	alarm[0] = 100
	}
	
	if (event = "jump_done"){
	skeleton_animation_clear(9)
	}
	
	if(event = "reloaded"){
		reloading = 0
		magazine = magazine_cap
		skeleton_animation_clear(4)
	}
	
	
	ds_map_destroy(event_data)

}
