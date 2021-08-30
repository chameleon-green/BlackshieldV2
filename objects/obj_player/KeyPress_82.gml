var anim_array = wpn_ranged[wpn_ranged.Animations]

if
(
	reloading != 1 and 
	!throwing and
	!rolling and
	global.mags > 0 and
	swinging = 0 and
	anim_array[3] != -1 and
	!crawling and
	canreload
)




{
   
	reloading = 1
	skeleton_animation_clear(4)
	skeleton_animation_clear(8)
	skeleton_animation_clear(2)
	skeleton_animation_clear(6)
	if(wpn_ranged[22] = "primary") {global.ammo_primary = 0}
	if(wpn_ranged[22] = "secondary") {global.ammo_secondary = 0}
	
	skeleton_animation_set_ext(anim_array[3],4)
	
}


    