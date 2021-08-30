// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_spindown()
{//
	
var anim_array = wpn_ranged[wpn_ranged.Animations]
var Spinny = array_length_1d(anim_array) = 8

if(Spinny) 
{

if(global.ammo = 0 or mouse_check_button_released(mb_left) or !canshoot or sprinting or crawling or global.GUI = 1)
	{
	if(spindown_check)
		{
		spindown_frames = 0
		SpunUp = 0
		spindown_check = 0
		audio_stop_sound(aud_spin) aud_spin = 0 //stop firing loop
		audio_stop_sound(aud_spin2) aud_spin2 = 0//stop firing loop

		spinup = 0
		skeleton_animation_clear(3)
		skeleton_animation_set_ext(anim_array[7],3)
		spindown = 1
		}
	}

var frames = skeleton_animation_get_frames(anim_array[7]) 
if(spindown) {spindown_frames += 1}
if(spindown_frames >= frames) 
	{
		spindown = 0 spindown_frames = 0 
		if(skeleton_animation_get_ext(3) = anim_array[7])
		{
		skeleton_animation_clear(3)
		}
	}	
}

}//