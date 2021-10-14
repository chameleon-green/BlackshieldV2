

if(col) {
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	if(Cdist < 300) {
		//yellow outline
		var c_outline = c_yellow//make_colour_rgb(192,158,2)
		gpu_set_fog(1,c_outline,0,0)
		draw_sprite_ext(sprite_index,image_index,x+2,y+2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x-2,y-2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x-2,y+2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x+2,y-2,image_xscale,image_yscale,0,c_white,255)
		gpu_set_fog(0,c_white,0,0)
		}
}

draw_self()

if(col) {
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	if(Cdist < 300) {
		if(IDarray[10] = "container") {var text = "Press E to Access"}
		if(IDarray[10] = "shop") {var text = "Press E to Trade"}
		var Carray = sprite_get_uvs(sprite_index, image_index)	
		var height = abs(Carray[1] - Carray[3])*4096
		draw_set_halign(fa_center)
		draw_text_color(x,y-height-50,cString,c_outline,c_outline,c_outline,c_outline,1)
		draw_text_color(x,y-height-30,text,c_outline,c_outline,c_outline,c_outline,1)
		draw_set_halign(fa_left)
		}
		
}

/*
draw_text(x,y-100,ds_grid_get(grd_inv_armor,0,0))
draw_text(x,y-120,ds_grid_get(grd_inv_ammo,1,0))
draw_text(x,y-140,ds_grid_get(grd_inv_ammo,2,0))
draw_text(x,y-160,ds_grid_get(grd_inv_ammo,3,0))
draw_text(x,y-180,ds_grid_get(grd_inv_ammo,4,0))

