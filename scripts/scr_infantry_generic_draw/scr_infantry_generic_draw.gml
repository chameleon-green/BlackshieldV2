// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_infantry_generic_draw()
{
	
	
	if(target_node != 0){
		draw_sprite(spr_console,0,target_node.x,target_node.y)
	}
		
	/*
	
	var left = bbox_left
	var right = bbox_right
	var top = bbox_top
	var bot = bbox_bottom
	draw_rectangle(left,top,right,bot,1)
*/
draw_self()

ds_list_draw(PathList,x,bbox_top)
//draw_text(x,bbox_top,seeking_cover)
draw_text(x,bbox_top,NewPath)

if(hp < MaxHP and hp > 0)
	{
	var xx = x-30
	var top = bbox_top-40
	var length = clamp(hp/MaxHP,0,1)

	draw_sprite(spr_bars,3,xx,top)
	draw_sprite_ext(spr_bars,4,xx,top,length,1,0,c_white,1)
	}
	

if(morale < max_morale and morale > 0 and !dead)
	{
	var xx = x-30
	var top = bbox_top-20
	var length = clamp(morale/max_morale,0,1)

	draw_sprite(spr_bars,5,xx,top)
	draw_sprite_ext(spr_bars,6,xx,top,length,1,0,c_white,1)
	}

	//draw_text(x-50,y-200,"right " +string(Right))
	//draw_text(x,y-200,"up " + string(Up))
	//draw_text(x+50,y-200,Right)
	
	//if(ds_exists(PathList,ds_type_list)) {ds_list_draw(PathList,x,y-200)}
	//(bbox_left - 10 + cSpeed,y+abs(cSpeed)+15,obj_slope) and vsp >= 0
	
	
	//draw_rectangle(bbox_left-10+cSpeed, bbox_right+10+cSpeed,y+abs(cSpeed)+15,y-10,1)
	//node dedubg
	/*
	if(target_node != 0){
	draw_text(target_node.x,target_node.y,"TARGET")
	}

	if(fleeing and !dead) {draw_text(x,bbox_top-50,"BROKEN")}
	
	*/
	
	//draw_ellipse(x+search_radius*2.5,y-search_radius,x-search_radius*2.5,y+search_radius*3,1)
	
	//draw_text(x,bbox_top-40,id)
	
	//draw hitboxes, copy pasted from collision code
	/*
	var x1 = bbox_left - 10 + hspeed
	var x2 = bbox_right + 10 + hspeed
	var y_leg_top = y-65+Crouch+vspeed
	var y_torso_bot = y+vspeed-70+Crouch
	var y_torso_top = y-105+Crouch*2+vspeed 
	var y_head_bot = y+vspeed-108+Crouch*2
	var y_head_top = y-120+Crouch*2+vspeed
	
	draw_rectangle(x1,y_head_top,x2,y_head_bot,1)
	draw_rectangle(x1,y_torso_top,x2,y_torso_bot,1)
	draw_rectangle(x1,y_leg_top,x2,y+vspeed,1)
	*/
}