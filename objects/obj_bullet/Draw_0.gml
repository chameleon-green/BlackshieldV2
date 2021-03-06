

if(flames) {
	var xoffset = lengthdir_x(2*image_xscale,direction)
	var yoffset = lengthdir_y(2*image_xscale,direction)
	draw_sprite_ext(sprite_index,image_index,x+xoffset,y+yoffset,image_xscale,image_yscale,image_angle,c_white,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x-xoffset,y-yoffset,image_xscale,image_yscale,image_angle,c_white,image_alpha)
}

if(!flames) {draw_self()}

if(is_array(ammo))
{
	
if(is_array(ammo[2])){
	
	var array = ammo[2]
	var xx = x+lengthdir_x(-array[0],direction)
	var yy = y+lengthdir_y(-array[0],direction)
	var frames = sprite_get_number(array[4])
	frame += 0.5
	if(frame > frames) {frame = 0}
	
	draw_sprite_ext(array[4],frame,xx,yy,array[2],array[3],direction,c_white,1)
	
	
	with(instance_create_depth(x,y,depth+1,oprt_smoke_trail)){
		image_index = other.smoke_first_toggle
		image_angle = other.direction
		image_yscale = 2
		image_xscale = sign(other.image_xscale)*(other.base_speed/20)*1.02
		sclvelocity = 2/10
	}
	if(smoke_first_toggle) {smoke_first_toggle = 0}
	
	if(rocket_toggle and array[5] != "none") {
		rocket_sound = audio_play_sound_on(s_emit,array[5],1,1) 
		rocket_toggle = 0
	}
}

}