//+++++++++++++++++++++++++++++++++++++++++++++ grenade throwing meter ++++++++++++++++++++++++++++++++
//draw_circle(active_ab1[5],active_ab1[4],30,false)
draw_text(x,y-200,ammo_type)
//draw_sprite_ext(mask_index,0,x,y,1,1,0,c_aqua,0.5)

draw_hbox = 0

var rot = point_direction(x,y,obj_crosshair.x,obj_crosshair.y)
draw_self()

if(keyboard_check(ord("G")))
{
draw_sprite_ext(spr_icon_grenade_throw,throw_power,x+30*image_xscale,y-140,1,1,rot,c_white,255)
}



//+++++++++++++++++++++++++++++++++++++++++ debug stuff below ++++++++++++++++++++++++++++++++++

/*
draw_text(x,y-220,"col_slope: " + string(col_slope))
draw_text(x,y-240,"col_right: " + string(col_right))
if(col_slope) {draw_text(x,y-260,"climb value: " + string(Climb))}
if(col_slope) {draw_text(x,y-280,"vsp: " + string(vsp))}




	var x1 = bbox_left + cSpeed
	var x2 = bbox_right + cSpeed
	var y1 = bbox_bottom - 5
	var y2 = bbox_bottom + abs(cSpeed)

draw_rectangle(x1,y1,x2,y2,1)
*/
//var size = ds_list_size(col_list)
//var timer_max = clamp((100/size)*5,10,500)
//draw_text(x,y-200,ds_list_find_value(col_list,clamp(size-1,0,900000000000000000000)))
//draw_text(x,y-200,timer_max)


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	



if(draw_hbox = 1)
{
draw_rectangle(bbox_left-hbox_width_mod,hbox_head_top,bbox_right+hbox_width_mod,hbox_head_bottom,1)
draw_rectangle(bbox_left-hbox_width_mod,hbox_torso_top,bbox_right+hbox_width_mod,hbox_torso_bottom,1)
draw_rectangle(bbox_left-hbox_width_mod,hbox_legs_top,bbox_right+hbox_width_mod,hbox_legs_bottom,1)
}


/*
draw_text(x,y-100,attack)
draw_text(x,y-100,ds_list_find_value(AfflictionsList,0))
draw_text(x,y-125,ds_list_find_value(AfflictionsList,1))
draw_text(x,y-150,ds_list_find_value(AfflictionsList,2))
draw_text(x,y-175,ds_list_find_value(AfflictionsList,3))
draw_text(x,y-200,ds_list_find_value(AfflictionsList,4))
draw_text(x,y-225,ds_list_find_value(AfflictionsList,5))



//+++++++++++++++++++++++++++++++++++++++++ DEBUG SECTION ++++++++++++++++++++++++++++++++++++++++++
/*
draw_set_alpha(0.5);
var Crouch = 25*crouching

draw_rectangle_colour(bbox_left - 40+ hspeed,y+vspeed,bbox_right + 40+ hspeed,y-85+Crouch+vspeed,c_red,c_red,c_red,c_red,false) //legs
draw_rectangle_colour(bbox_left - 40+ hspeed,y+vspeed-90+Crouch,bbox_right + 40+ hspeed,y-145+Crouch*2+vspeed,c_blue,c_blue,c_blue,c_blue,false) //torso
draw_rectangle_colour(bbox_left - 40+ hspeed,y+vspeed-148+Crouch*2,bbox_right + 40+ hspeed,y-166+Crouch*2+vspeed,c_green,c_green,c_green,c_green,false)

draw_text(x,y-100,hp_body_torso)


/*
