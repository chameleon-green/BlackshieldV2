if
	(rolling = 0 and
	!swinging and
	canmove = 1 and
	stamina >= 25 and
	!crouching and
	canroll and
	col_bot
	)

{
skeleton_animation_clear(4)
if(reloading) {skeleton_attachment_set("slot_gun magazine" ,wpn_ranged[15])} //if rolling out of a reload cancel, replace magazine in gun
canmove = 0
rolling = 1
canshoot = 0
reloading = 0
canattack = 0
stamina = (stamina-30)
//skeleton_animation_clear(1)
//skeleton_animation_clear(2)
skeleton_animation_clear(3)
skeleton_animation_clear(5)
skeleton_animation_clear(6)
skeleton_animation_clear(7)
skeleton_animation_clear(8)
skeleton_animation_set_ext("roll_fast2", 5)
vsp = -10

if(powered)
{
var snd_step = audio_play_sound(choose(snd_servo1,snd_servo2,snd_servo3), 1, 0)
audio_sound_pitch(snd_step, clamp(reactor_output/100,0.66,1.33))
}

}
