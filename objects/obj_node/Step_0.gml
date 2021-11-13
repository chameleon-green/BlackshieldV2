timer = timer_tick(checktimer,1)


if(creator != undefined and timer) {
	var plat = instance_place(x,y,obj_platform)
		if(plat) {
			if(plat.id != creator) {
			instance_destroy(self)
			}
		}
	var Cover = instance_place(x,y,obj_cover)
		if(Cover) {
			cover = 1
			cover_parent = Cover.id
			if(hill) {image_index = 3}
			else{image_index = 2}
		}
					
	timer_reset(checktimer,1)
}


