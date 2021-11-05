kill = timer_tick(killtimer,1)
if(kill) {instance_destroy(self)}


if(place_meeting(x,y,obj_groundfire)){
	var Notme = instance_place(x,y,obj_groundfire)
	
	if(Notme.killtimer[0] > killtimer[0]){
		image_xscale+=0.5
		xoffset+=5
		killtimer[0] = 0
		instance_destroy(Notme)
	}
}