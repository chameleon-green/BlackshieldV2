function scr_melee_heavy() {
	var anim_array = wpn_melee[21]
	if(melee_power > 2 and (skeleton_animation_get_ext(6) != anim_array[9]) and !swinging)
		{	
		skeleton_animation_set_ext(anim_array[9],6)
		alarm_windup = skeleton_animation_get_frames(anim_array[9])
		attack = 0
		melee_charged = 1
		canmove = 0
		canshoot = 0
		reloading = 0
		rolling = 0
		hspeed = 0
		skeleton_animation_clear(2)
		skeleton_animation_clear(4)
		skeleton_animation_clear(8)
		tick = 0
		}

	//start timer for windup anim, and start attack when done
	if(skeleton_animation_get_ext(6) = anim_array[9] and !swinging)
		{
		tick +=1
		}

	if(tick = alarm_windup or heavyswing) 
		{
		heavyswing = 0
		melee_power = 0
		swinging = 1
		skeleton_animation_clear(6)
		skeleton_animation_clear(1)
		skeleton_animation_clear(8)
		var i = irandom(4)
		var array = wpn_melee[wpn_melee.Swing_Sound]
		var sound = array[i]
		audio_play_sound(sound,1,0)
		skeleton_animation_set_ext(anim_array[4],6)
		alarm_attack = skeleton_animation_get_frames(anim_array[4])
		canattack = 0
		attack = 4
		
		scr_melee_projectile_heavy()
			
		tick = 0
		}
	
	//start timer if attack animation is playing. Once complete, end attack cycle
	if(skeleton_animation_get_ext(6) = anim_array[4])
		{
		tick +=1
		}

	if(tick = alarm_attack and swinging)
		{
		tick = 0
		swinging = 0
		melee_power = 0
		melee_charged = 0
		canattack = 0
		canmove = 1
		canshoot = 1
		skeleton_animation_clear(6)
		attack = 0
		}


}
