draw_self()
//InventoryGenerator("none",ListComAM,100,1)
/*
if !surface_exists(surf){
    surf = surface_create(1024, 1024);
    
    //view_surface_id[0] = surf;
    }

if(surface_exists(surf)){
	surface_set_target(surf)
	draw_clear_alpha(c_black,1.0)
    surface_reset_target()
	var _vx = camera_get_view_x(view_camera[0])
	var _vy = camera_get_view_y(view_camera[0])
	draw_surface(surf, _vx, _vy)
}

/*
var cx = obj_crosshair.x - camera_get_view_x(view_camera[0])
var cy = obj_crosshair.y - camera_get_view_y(view_camera[0])

draw_text(x,y,cx)



