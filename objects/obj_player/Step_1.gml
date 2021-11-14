
/// @description gravity and delta HP


//++++++++++++++++++++++++++++++++++++++++++++++++++++ GRAVITY +++++++++++++++++++++++++++++++++++++++++++
var D = keyboard_check(ord("D")) and !keyboard_check(ord("A"))
var A = keyboard_check(ord("A")) and !keyboard_check(ord("D"))
var cSpeed = 40*(D or A or swinging) //clamp hspeed for collision stuff, need a minimum

col_bot = place_meeting(x,y+abs(hspeed)+30+clamp(vsp,0,70),obj_platform) or place_meeting(x,y+10+3*cSpeed,obj_slope)
 
 if (vsp < 64 and !col_bot) {
	vsp += grav;
 }
 
 
if (col_bot and skeleton_animation_get_ext(9) != "jump_normal") {vsp = 0  air_timer = 0 move_contact_solid(270,-1)}


//+++++++++++++++++++++++++++++++++++++++++++++++++++ INJURIES AND DELTA HP ++++++++++++++++++++
hp_prev_head = hp_body_head
hp_prev_torso = hp_body_torso
hp_prev_larm = hp_body_llarm
hp_prev_rarm = hp_body_rarm
hp_prev_lleg = hp_body_lleg
hp_prev_rleg = hp_body_rleg
hp_prev = hp


scr_injury_states()
