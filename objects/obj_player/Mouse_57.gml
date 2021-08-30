/// @description Melee Strike


if(melee_charged and canattack and !swinging) {heavyswing = 1}

else if (swinging = 0 and attack = 0 and throwing = 0 and !global.GUI and time_melee = 0 and canattack = 1)
{ 
attack = 1 //set attack sequence to +1 to qeue next animation

var i = irandom(4)
var array = wpn_melee[wpn_melee.Swing_Sound]
var anim_array = wpn_melee[21]
var sound = array[i]
audio_play_sound(sound,1,0)

hspeed = 0
reloading = 0
canshoot = 0
canmove = 0
swinging = 1
skeleton_animation_clear(8)
skeleton_animation_clear(8)
skeleton_animation_clear(4)
skeleton_animation_clear(3)
skeleton_animation_clear(2)
skeleton_animation_clear(6)

skeleton_animation_set_ext(anim_array[7], 6)

alarm[5] = skeleton_animation_get_frames(skeleton_animation_get_ext(6))

scr_melee_projectile()

melee_power = 0

}


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TIMERS +++++++++++++++++++++++++++++++++++++++++++++++++++++++

if time_melee > 0 and attack = 1

{
	alarm[3] = skeleton_animation_get_frames(skeleton_animation_get_ext(6))-time_melee
	
}

if time_melee > 0 and attack = 2

{
	alarm[4] = skeleton_animation_get_frames(skeleton_animation_get_ext(6))-time_melee
	alarm[5] = 900
}

