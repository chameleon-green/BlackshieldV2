

//moves xhair to mouse coordinates, minus weapon offset
if(!global.GUI)
{y = mouse_y - round(obj_player.GunY) x = mouse_x - round(obj_player.GunX)}
else {y = mouse_y x = mouse_x}




//sets size of crosshair based on spread
if (global.GUI = 0)
{
image_xscale = 1 * obj_ic.scale //* (1/obj_vc.view_multiplier)
image_yscale = 1 * obj_ic.scale // * (1/obj_vc.view_multiplier)
//image_xscale = clamp(2*global.spread/5, 1, 10) * obj_ic.scale
//image_yscale = clamp(2*global.spread/5, 1, 10) * obj_ic.scale
}

//reset scale if touching GUI elements
if (global.GUI = 1)
{	image_xscale = 1*obj_vc.view_multiplier
	image_yscale = 1*obj_vc.view_multiplier
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


if(global.GUI = 0)

{
	
var scale = obj_ic.scale //* obj_vc.view_multiplier


//draw the actual crosshair
draw_set_font(fnt_caslon)
sprite_index = spr_crosshair
image_speed = 0
image_index = 0

var displacement = clamp(2*global.spread/5, 1, 10)
var xhair_const = 6*displacement + 6


draw_sprite_ext(spr_crosshair,1,x-0*scale,y+xhair_const*scale,scale,scale,0,c_white,1)
draw_sprite_ext(spr_crosshair,1,x-0*scale,y-xhair_const*scale,scale,scale,0,c_white,1)
draw_sprite_ext(spr_crosshair,2,x+xhair_const*scale,y,scale,scale,0,c_white,1)
draw_sprite_ext(spr_crosshair,2,x-xhair_const*scale,y,scale,scale,0,c_white,1)


//draws ammo/mags text under crosshair
draw_self()
draw_set_halign(fa_center)
var xdisp = xhair_const + 40 //40 units
draw_text_transformed(x+xdisp*scale,y-10*scale, string(global.ammo) + "/" + string(global.mags),scale,scale,0)

//if overheating color bar red and say "overheating", else show firemode and color bar white

if(heat < heatcap) or (wpn_ranged[0] < 0) //we have low heat, or else don't generate any

	{
	var ydisp = xdisp - 29
	draw_set_halign(fa_left) 
	draw_text_transformed(x+1*scale,y+ydisp*scale, string(obj_player.Firemode),scale,scale,0) 
	color = c_white
	}
if(heat >= heatcap and (wpn_ranged[wpn_ranged.Heat_Capacity] > 0)) //we have overheat and we actually use it
	{
	var HeatPerc = round((heat/heatcap)*100)
	var ydisp = xdisp - 26
	draw_set_halign(fa_center) 
	draw_text_transformed(x+20*scale, y+ydisp*scale, string("OVERHEATING!"),scale*0.8,scale*0.8,0) 
	draw_text_transformed_color(x+20*scale, y+(xdisp + 5)*scale, string(HeatPerc) + "%",scale*0.8,scale*0.8,0,c_red,c_red,c_red,c_red,1) 
	color = c_red
	}

//draw firemode icon
draw_sprite_ext(spr_icon_firemode,icon,x-10*scale,y+ydisp*scale,scale,scale,0,c_white,1)


//if weapon has heat, then draw bar
if(wpn_ranged[wpn_ranged.Heat_Capacity] > 1)
{
var ydisp = xdisp - 23
draw_sprite_ext(spr_heatbar,0,x-10*scale,y+ydisp*scale,scale,scale,0,c_white,1)
draw_sprite_ext(spr_heatbar,1,x-10*scale,y+ydisp*scale,clamp(heat/heatcap,0,1)*scale,scale,0,color,255)
}

}


else 
	{
	sprite_index = spr_pointer 
	draw_self()
	}


