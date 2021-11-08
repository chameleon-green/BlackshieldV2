//++++++++++++++++++++++++++++++++++++++++++++++++++++ GRAVITY +++++++++++++++++++++++++++++++++++++++++++
var D = creator.Right*creator.canmove
var A = creator.Left*creator.canmove
var cSpeed = 40*(D or A) //clamp hspeed for collision stuff, need a minimum

col_bot = place_meeting(x,y+1+clamp(vsp,0,70),obj_platform) or place_meeting(x,y+10+3*cSpeed,obj_slope)
 
 if (vsp < 64 and !col_bot) {
	vsp += grav;
 }
 
 
if (col_bot) {vsp = 0 move_contact_solid(270,-1)}

