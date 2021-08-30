
draw_self()


if(col) {
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	if(Cdist < 300) {
		draw_set_halign(fa_center)
		draw_text(x,bbox_top,cString)
		draw_text(x,bbox_top+20,"Press E to Access")
		draw_set_halign(fa_left)
		}
}

/*
draw_text(x,y-100,ds_grid_get(grd_inv_armor,0,0))
draw_text(x,y-120,ds_grid_get(grd_inv_ammo,1,0))
draw_text(x,y-140,ds_grid_get(grd_inv_ammo,2,0))
draw_text(x,y-160,ds_grid_get(grd_inv_ammo,3,0))
draw_text(x,y-180,ds_grid_get(grd_inv_ammo,4,0))

