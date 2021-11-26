//draw_self()
//InventoryGenerator("none",ListComAM,100,1)
/*
if !surface_exists(surf){
    surf = surface_create(1024, 1024);
    
    //view_surface_id[0] = surf;
    }

if(surface_exists(surf)){
	surface_resize(surf,xx,yy)
	var vx = camera_get_view_x(view_camera[0])
	var vy = camera_get_view_y(view_camera[0])
	surface_set_target(surf)
	draw_clear_alpha(c_black,0.75)
	surface_reset_target()
	
	with(obj_bullet){
	
	surface_set_target(obj_vc.surf)
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(spr_light,0,x-vx,y-vy,2,2,1,c_red,1)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
		
	}
	
	with(obj_groundfire){
	
	surface_set_target(obj_vc.surf)
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(spr_light,0,x-vx,y-vy,2,2,1,c_red,1)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
		
	}
	
	draw_surface(surf, vx, vy)	
}


/*
var cx = obj_crosshair.x - camera_get_view_x(view_camera[0])
var cy = obj_crosshair.y - camera_get_view_y(view_camera[0])

draw_text(x,y,cx)



