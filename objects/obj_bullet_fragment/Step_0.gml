 
if(hp <= 0) {instance_destroy(self)}

var xx = x+lengthdir_x(hspeed,direction)
var yy = y+lengthdir_y(vspeed,direction)
var colv = collision_line(x,y,x,yy,obj_platform,true,0)
var colh = collision_line(x,y,xx,y,obj_platform,true,0)





if(colv) {
	vspeed = -vspeed*random_range(0.6,0.9)
}

if(colh) {
	hspeed = -hspeed*random_range(0.5,0.8)
}

if(speed < 3) {
	instance_destroy()
}

/*
if(place_meeting(x+hspeed,y,obj_platform))
{
	hspeed = -hspeed*random_range(0.5,0.8)
}

if(place_meeting(x,y+vspeed,obj_platform))
{
	vspeed = -vspeed*random_range(0.6,0.9)
}
*/
image_angle = direction
