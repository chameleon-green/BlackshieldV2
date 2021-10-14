gravity = 1 gravity_direction = 270 sound = 1



//collision stuff
dir = point_direction(x,y,x+hspeed,y+vspeed)
var colv = place_meeting(x,y+vspeed,obj_platform)//collision_line(x,y,x,y+vspeed,obj_platform,true,0)
var colh = place_meeting(x+hspeed,y,obj_platform)//collision_line(x,y,x+hspeed,y,obj_platform,true,0)
var col =  place_meeting(x+hspeed,y+vspeed,obj_platform)//collision_line(x,y,x+hspeed,y+vspeed,obj_platform,true,0)

if(colv) {
	if(sticky = 1) {speed = 0 gravity = 0 angular_speed = 0 grav = 0} else {
	gravity = 0
	vspeed = (-vspeed*0.5) - abs(hspeed*0.1)
	hspeed = hspeed * 0.35
	angular_speed = (angular_speed*0.5)
	}
}

if(colh) {
	if(sticky = 1) {speed = 0 gravity = 0 angular_speed = 0 grav = 0} else {
	gravity = 0
	hspeed = -hspeed * 0.35
	angular_speed = (angular_speed*0.5)
	}
}

if(col) {
	gravity = 0
	angular_speed = (angular_speed*0.5)
}

offset = 0

//++++++++++++++++++++++++++++++++++++++++++++++++++++ ANGLES +++++++++++++++++++++++++++++++++++

//cosmetic angular shit below, makes grenades fall flat on surfaces
//will have to update if slopes become a thing
if(speed < 1 and !sticky) 
{
	
	if(90 - angle < 90 + angle)
		{
			angular_speed = 10
			if(85 < angle < 95 and speed < 0.5)
			{angle = 90 offset = 9}
		}
		
		
	if(90 - angle > 90 + angle)
	    {
			angular_speed = -10
			if(265 < angle < 275 and speed < 0.5)
			{angle = -90 offset = 8}
			
		}
	
	
}


angle += angular_speed
if(abs(vspeed) < 1) {vspeed = 0} //stops "vibrating" grenades

if(place_meeting(x,y,obj_platform) and abs(speed) > 2) {move_outside_solid(point_direction(x,y,originx,originy),5)}