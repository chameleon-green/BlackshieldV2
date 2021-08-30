/// @description Melee attack 2


attack = 2 //set attack sequence to 2 to qeue next anim


var i = irandom(4)
var array = wpn_melee[wpn_melee.Swing_Sound]
var anim_array = wpn_melee[21]

var sound = array[i]
audio_play_sound(sound,1,0)

time_melee -= time_melee //what the fuck, subtract its own instantaneous value to get to 0, essentially a reset
skeleton_animation_clear(6)

skeleton_animation_set_ext(anim_array[6],  6)

//+++++++++++++++++++++++++++++++++++++++ SWING PROJECTILE CREATION ++++++++++++++++++++++++++++

alarm[5] = skeleton_animation_get_frames(skeleton_animation_get_ext(6))
scr_melee_projectile()
