
if(reloading = 0 and rolling = 0 and is_array(wpn_grenade))
{
skeleton_animation_clear(3)
skeleton_animation_clear(8)
skeleton_animation_set_ext("grenade_throw",3)
reloading = 0
canshoot = 0
throwing = 1
throw_power += 0.1
	if(throw_power > 5) {throw_power = 5}
	if(throw_power < 0) {throw_power = 0}
}
