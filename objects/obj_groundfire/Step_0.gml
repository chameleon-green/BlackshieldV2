kill = timer_tick(killtimer,1)
if(kill) {instance_destroy(self)}

var maxxsize = 4.5
if(vertical) {
	var maxxsize = 1.4
	var maxysize = 4
	image_yscale = clamp(image_yscale+0.02,0,maxysize)	
}
else{
part_emitter_region(prt_sys,emitter,x-xoffset,x+xoffset,bbox_bottom+yoffset,bbox_bottom,ps_shape_ellipse,ps_distr_gaussian)
}
image_xscale = clamp(image_xscale+0.01,0,maxxsize)

if(place_meeting(x,y,obj_groundfire)){
	var Notme = instance_place(x,y,obj_groundfire)
	if(Notme.image_xscale < image_xscale){
		if(!vertical){
		image_xscale+=0.5
		xoffset = clamp(xoffset+5,0,33*maxxsize)
		killtimer[0] = 0
		instance_destroy(Notme)
		}
		else{
		image_yscale+=0.5
		yoffset = clamp(yoffset+10,0,30*maxysize)
		killtimer[0] = 0
		part_emitter_region(prt_sys,emitter,x-xoffset,x+xoffset,y+yoffset,y-yoffset,ps_shape_ellipse,ps_distr_gaussian)
		instance_destroy(Notme)
		}
	}
}