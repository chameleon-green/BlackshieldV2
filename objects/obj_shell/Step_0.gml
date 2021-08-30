var ground = place_meeting(x,y,obj_platform)
if(ground)
{
var direc = point_direction(x,y,creator.x,creator.y)
move_outside_solid(direc,-1)
}

rotation += angspeed

if(!place_meeting(x,y+vspeed,obj_platform)) {vspeed+=1} 
if(place_meeting(x,y,obj_platform)) {col = 1}

if(place_meeting(x,y-vspeed,obj_platform)) {vspeed = -vspeed/2 hspeed = hspeed*0.6 angspeed = angspeed/2}
if(place_meeting(x,y+vspeed,obj_platform)) {vspeed = -vspeed/2 hspeed = hspeed*0.6 angspeed = angspeed/2}

if(bounce)
{
if(place_meeting(x-hspeed,y,obj_platform)) {hspeed = -hspeed/3 angspeed = angspeed/2}
if(place_meeting(x+hspeed,y,obj_platform)) {hspeed = -hspeed/3 angspeed = angspeed/2}
}

if(place_meeting(x,y+speed,obj_platform) and speed < 2) {speed = 0}


if(touching = 0 and place_meeting(x,y-vspeed*2,obj_platform) and sound = 1) 

	{
	if(mass < 1) {snd = audio_play_sound(snd_shell_fall_small, 1, false)}
	else{snd = audio_play_sound(snd_shell_fall_big, 1, false)}
	audio_sound_pitch(snd,pitch)
	touching = 1	
	}


if(speed < 2)
{
var amount = instance_number(obj_shell)
var time = 750
var Max = 10 //max amount of instances before timer starts to shorten

var timer = clamp((Max/amount)*time,0,time)

if(alarm_get(0) = -1)
{
alarm[0] = timer
}

}