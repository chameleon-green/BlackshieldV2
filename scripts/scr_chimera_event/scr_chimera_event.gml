// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_chimera_event(){

var event = ds_map_find_value(event_data, "name")

	
	if (event = "ramp_activate"){
		audio_play_sound_on(r_emit,snd_hydraulic_open,0,1)
		sound_ramp = audio_play_sound_at(snd_hydraulic_loop,x,y,0,300,3000,1,1,2)
	}
	
	
	if (event = "ramp_deployed"){
		audio_play_sound_on(r_emit,snd_hydraulic_close,0,1)
		audio_stop_sound(sound_ramp)
		skeleton_animation_clear(5)
	}
	
	if (event = "ramp_retracted"){
		audio_play_sound_on(r_emit,snd_hydraulic_close,0,1)
		audio_stop_sound(sound_ramp)
		skeleton_animation_clear(5)
		ramp_deployed = 0
		canmove = 1
	}
	
	ds_map_destroy(event_data)
}