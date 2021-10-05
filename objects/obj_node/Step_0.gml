timer = timer_tick(checktimer,1)


if(creator != undefined and timer) {
	var plat = instance_place(x,y,obj_platform)
	if(plat) {
	if(plat.id != creator) {
		instance_destroy(self)
	}
	}
	timer_reset(checktimer,1)
}
		