if(creator != undefined) {
	var plat = instance_place(x,y,obj_platform)
	if(plat) {
	if(plat.id != creator) {
		instance_destroy(self)
	}
	}
}
		