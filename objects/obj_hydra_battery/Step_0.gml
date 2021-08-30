dtime+=1  


if(dtime >= dtime_max) {
	dtime = 0
	dtime_max = irandom_range(300,900)
	skeleton_animation_clear(2)
	skeleton_animation_set_ext("anim_fire",2)
	ftime_max = irandom_range(60,300)
}

if(skeleton_animation_get_ext(2) = "anim_fire") {
	ftime += 1
	if(ftime >= ftime_max) {
	ftime = 0
	skeleton_animation_clear(2)
	skeleton_animation_set_ext("anim_clear",2)
	}
}