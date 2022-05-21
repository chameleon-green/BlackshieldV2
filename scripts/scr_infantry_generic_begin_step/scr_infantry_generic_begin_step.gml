// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_infantry_generic_begin_step(){

//clamp hspeed for collision stuff, need a minimum
var cSpeed = 40*(Left or Right) 

Col_Bot = (place_meeting(x,y+1+clamp(vsp,0,1000),obj_platform) and vsp >= 0) or 
		   place_meeting(x,y+10+3*cSpeed,obj_slope) 
 
 
//gravity must be limited to 24, or enemies can fall through floor for some reason
 if (vsp < 24 and !Col_Bot) {
	vsp += grav;
 }
 
 
if(Col_Bot and skeleton_animation_get_ext(9) != "jump_normal") {vsp = 0 move_contact_solid(270,-1)}


}