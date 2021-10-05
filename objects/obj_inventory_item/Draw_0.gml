scale = obj_ic.scale
image_xscale = scale
image_yscale = scale


//+++++++++++++++++++++++++++++++++++++++ SCROLLBAR STUFF, MOVE AND HIDE SELF ++++++++++++++++++++++++++

x = obj_ic.x+x_offset*scale
y = obj_ic.y+((70+(38*item_order))*scale) + ( -(obj_scrollbar.offset - 85)*scale )*obj_scrollbar.DisplacementMod

displacement = (y - obj_ic.y)/scale
var Disp_Diff = 68 - displacement
var Disp_Diff2 = 338 - displacement
draw_full = 0
Draw_Text = 1
if(displacement >= 68 and displacement <= 338) {draw_full = 1}
if(draw_full and visible) {draw_self()}
if(!draw_full and visible) 
	{
		if(displacement < 68)
		{
		draw_sprite_part_ext(spr_inventory_item,-1,0,Disp_Diff,313,36,bbox_left,y+Disp_Diff*scale,scale,scale,c_white,1)
			if(Disp_Diff > 14) {Draw_Text = 0}
		}
		if(displacement > 338)
		{
		draw_sprite_part_ext(spr_inventory_item,-1,0,Disp_Diff2,313,36,bbox_left,y+Disp_Diff2*scale,scale,scale,c_white,1)
			if(abs(Disp_Diff2) > 16) {Draw_Text = 0}
		}
	}

if(place_meeting(x,y,obj_crosshair)) {global.GUI = 1 col = 1}

//++++++++++++++++++++++++++++++++++ STUFF ++++++++++++++++++++++++++++++++++++++++++++++++++++

xx = obj_ic.x
yy = obj_ic.y

if(name != undefined and Draw_Text) //checks if the IC has properly set item array, thus making name definable

{
	//are we a weapon? if so, are we equipped?
	if(type = "primary" or type = "secondary" or type = "melee")
	{
		if(type = "primary" and obj_player.primary_id = unique_id)
		  or
		  (type = "secondary" and obj_player.secondary_id = unique_id)
		  or
		 (type = "melee" and obj_player.melee_id = unique_id)
		{var title = string(name + " (Equipped)")}
		else {var title = name}
	}

	//are we ammo? if so, how much do we have left?
	if(type = "ammo")
	{
		if(obj_player.ammo_type_primary = item_id or obj_player.ammo_type_secondary = item_id)
		{var title = string(name + " (" + string(amount) + ")" + " (Equipped)")}
		else
		{var title = name + " (" + string(amount) + ")"}
	}
	
	//are we armor? if so, are we equippped?
	if(type = "armor_torso" or type = "armor_head" or type = "armor_armL" or type = "armor_armR" or type = "armor_legL"  or type = "armor_legR")
	{
		if(obj_player.head_id = unique_id or 
		   obj_player.torso_id = unique_id or
		   obj_player.armL_id = unique_id or
		   obj_player.armR_id = unique_id or
		   obj_player.legL_id = unique_id or
		   obj_player.legR_id = unique_id
		   
		  )
		  
		{var title = string(name + " (Equipped)")}
		else
		{var title = name}
	}
	
	if(type = "med" or type = "food" or type = "drug")
	{
		if(amount > 1) {var title = name + " (" + string(amount) + ")"}
		else{var title = name}
	}
	
	if(type = "grenade")
	{
		var eqped = ""
		var quant = ""
		if(obj_player.grenade_id = unique_id) {eqped = " (Equipped)"} 
		if(amount > 1) {var quant = " (" + string(amount) + ")"}
		
		var title = name + quant + eqped
	}
	
	//draw final string result (var title) in the center of ourselves
	draw_set_font(fnt_caslon)
	draw_set_halign(fa_center)
	draw_text_transformed_colour(x,y+5*scale,title,scale*0.85,scale*0.9,0,color,color,color,color,255)
	
	
}



//if the item is selected, draw stat text in over inventory controller and item image
if  
  (
	(selected)
	and name != undefined 
	and (global.Selected = id or global.Selected = undefined)
  ) 

{
	draw_set_font(fnt_caslon)
	draw_set_halign(fa_left)
		
		//are we a weapon? then draw numbers in the little icon window in the lower right on weapons screen and image in screen
		if(type = "primary" or type = "secondary") 
		{
			//define color for fog outline
			var c_outline = make_colour_rgb(192,158,2)
			
			//figure out width and height of subimages for scaling, 4096 = texture page size
			var Carray = sprite_get_uvs(spr_items_guns, image)
			width = abs(Carray[0] - Carray[2])*4096
			height = abs(Carray[1] - Carray[3])*4096
			
			var Dura_Percent = round( (durability/max_durability)*100 )
			var Dura_Color = c_yellow
			//var Dura_String = string(string(Dura_Percent) + "%") 
			var Dura_String = durability
			if(Dura_Percent < 26) {Dura_Color = c_red}
			
			//if weapon image is tiny, scale it up
			if(width < 200 or height < 200) {iscale = 300/clamp(width,75,120)/2*scale} 
			if(width > 200 or height > 200) {iscale = (200/width)*scale}
			//else{iscale = scale}
			
			draw_text_transformed_colour(xx+382*scale,yy+260*scale,dmg,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+382*scale,yy+299*scale,ROFText,scale*0.77,scale*0.95,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+382*scale,yy+330*scale,accuracy,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+382*scale,yy+365*scale,velocity,scale*1.125,scale*1.25,0,color,color,color,color,255)
		
			draw_text_transformed_colour(xx+470*scale,yy+260*scale,capacity,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+295*scale,value,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+330*scale,weight,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+365*scale,Dura_String,scale*1.125,scale*1.25,0,Dura_Color,Dura_Color,Dura_Color,Dura_Color,255)
			
			//draw 4 offset sprites solid color (using fog) to make glowing outline
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(spr_items_guns,image,xx+477*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_guns,image,xx+473*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_guns,image,xx+477*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_guns,image,xx+473*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			//finally, draw the weapon image itself
			draw_sprite_ext(spr_items_guns,image,xx+475*scale,yy+146*scale,iscale,iscale,0,c_white,255)
		
			//debug shit below
			//draw_text(x,y, string(width))
			//draw_text(x+90,y, string(height))
			
			
		}
		//are we a melee weapon? draw little numbers n shit
		if(type = "melee") 
		{
			//define color for fog outline
			var c_outline = make_colour_rgb(192,158,2)
			
			//figure out width and height of subimages for scaling, 4096 = texture page size
			var Carray = sprite_get_uvs(spr_items_melee, image)
			width = abs(Carray[0] - Carray[2])*4096
			height = abs(Carray[1] - Carray[3])*4096
			
			var Dura_Percent = round( (durability/max_durability)*100 )
			var Dura_Color = c_yellow
			//var Dura_String = string(string(Dura_Percent) + "%") 
			var Dura_String = durability
			if(Dura_Percent < 26) {Dura_Color = c_red}
			
			//if weapon image is tiny, scale it up
			if(width < 200 or height < 200) {iscale = 300/clamp(width,75,120)/2*scale} 
			if(width > 200 or height > 200) {iscale = (200/width)*scale}
			//else{iscale = scale}
			
			draw_sprite_ext(spr_inventory_wep_stats,4,obj_ic.x+473*scale,obj_ic.y+307*scale,scale,scale,0,c_white,255)
			
			scr_melee_wep_stats() //draw scalings and damage divisions			
			//draw damage, armor pen and force
			draw_text_transformed_colour(xx+385*scale,yy+260*scale,damage,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+260*scale,penetration,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+555*scale,yy+260*scale,force,scale*1.125,scale*1.25,0,color,color,color,color,255)
			//draw durability, weight and cost
			draw_text_transformed_colour(xx+385*scale,yy+365*scale,Dura_String,scale*1.125,scale*1.25,0,Dura_Color,Dura_Color,Dura_Color,Dura_Color,255)
			draw_text_transformed_colour(xx+470*scale,yy+365*scale,mass,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+555*scale,yy+365*scale,value,scale*1.125,scale*1.25,0,color,color,color,color,255)
			
			//draw 4 offset sprites solid color (using fog) to make glowing outline
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(spr_items_melee,image,xx+477*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_melee,image,xx+473*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_melee,image,xx+477*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_melee,image,xx+473*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			//finally, draw the weapon image itself
			draw_sprite_ext(spr_items_melee,image,xx+475*scale,yy+146*scale,iscale,iscale,0,c_white,255)
		
			
			
		}
		//are we ammo? then draw stats string and picture of rounds
		if(type = "ammo")
		{
			//see weapon image draw above for explanation of following code.
			var c_outline = make_colour_rgb(192,158,2)
			var xxx = 471*scale
			var yyy = 142*scale
			
			draw_text_transformed_colour(xx+368*scale,yy+276*scale,stats,scale*0.7,scale*0.7,0,color,color,color,color,255)
			
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(spr_items_ammo,icon,xx+xxx+2*scale,yy+yyy+2*scale,scale*2,scale*2,0,c_white,255)
			draw_sprite_ext(spr_items_ammo,icon,xx+xxx-2*scale,yy+yyy-2*scale,scale*2,scale*2,0,c_white,255)
			draw_sprite_ext(spr_items_ammo,icon,xx+xxx+2*scale,yy+yyy-2*scale,scale*2,scale*2,0,c_white,255)
			draw_sprite_ext(spr_items_ammo,icon,xx+xxx-2*scale,yy+yyy+2*scale,scale*2,scale*2,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			draw_sprite_ext(spr_items_ammo,icon,xx+xxx,yy+yyy,scale*2,scale*2,0,c_white,255)
		}
		
		if(type = "armor_torso" or type = "armor_head" or type = "armor_armL" or type = "armor_armR" or type = "armor_legL" or type = "armor_legR") 
		{
			//define color for fog outline
			var c_outline = make_colour_rgb(192,158,2)
			
			//figure out width and height of subimages for scaling, 4096 = texture page size
			var Carray = sprite_get_uvs(spr_items_armor, image)
			width = abs(Carray[0] - Carray[2])*4096
			height = abs(Carray[1] - Carray[3])*4096
			
			//if weapon image is tiny, scale it up
			if(height < 60) {iscale = 2*scale}
			else {iscale = (height/(height+(height/2)))*2*scale}
			
			var Dura_Factor = durability/max_durability
			var Dura_Percent = round( (durability/max_durability)*100 )
			var Dura_Color = c_yellow
			var Dura_String = string(string(Dura_Percent) + "%") 
			if(Dura_Percent < 26) {Dura_Color = c_red}
			
			draw_text_transformed_colour(xx+385*scale,yy+260*scale,clamp(round(resist_phys*Dura_Factor),resist_phys*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+385*scale,yy+295*scale,clamp(round(resist_heat*Dura_Factor),resist_heat*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+385*scale,yy+330*scale,clamp(round(resist_cold*Dura_Factor),resist_cold*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+385*scale,yy+365*scale,clamp(round(resist_shok*Dura_Factor),resist_shok*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
		
			draw_text_transformed_colour(xx+470*scale,yy+260*scale,clamp(round(resist_corr*Dura_Factor),resist_corr*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+295*scale,clamp(round(resist_hzmt*Dura_Factor),resist_hzmt*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+330*scale,clamp(round(resist_rads*Dura_Factor),resist_rads*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+365*scale,clamp(round(resist_warp*Dura_Factor),resist_warp*0.25,9999),scale*1.125,scale*1.25,0,color,color,color,color,255)
			
			draw_text_transformed_colour(xx+555*scale,yy+260*scale,poise,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+555*scale,yy+295*scale,Dura_String,scale*1.125,scale*1.25,0,Dura_Color,Dura_Color,Dura_Color,Dura_Color,255)
			draw_text_transformed_colour(xx+555*scale,yy+330*scale,weight,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+555*scale,yy+365*scale,value,scale*1.125,scale*1.25,0,color,color,color,color,255)
			
			//draw 4 offset sprites solid color (using fog) to make glowing outline
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(spr_items_armor,image,xx+477*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_armor,image,xx+473*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_armor,image,xx+477*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_items_armor,image,xx+473*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			//finally, draw the weapon image itself
			draw_sprite_ext(spr_items_armor,image,xx+475*scale,yy+146*scale,iscale,iscale,0,c_white,255)
			
		}
		
	if(type = "med" or type = "food" or type = "drug")
		{
			//see weapon image draw above for explanation of following code.
			var c_outline = make_colour_rgb(192,158,2)
			var xxx = 470*scale
			var yyy = 142*scale
			var scalefactor = 1.33
			
			//draw_text_transformed_colour(xx+368*scale,yy+276*scale,stats,scale*0.7,scale*0.7,0,color,color,color,color,255)
			
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(sprite,sublarge,xx+471*scale,yy+141*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+471*scale,yy+143*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+469*scale,yy+141*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+469*scale,yy+143*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			
			draw_sprite_ext(sprite,sublarge,xx+472*scale,yy+140*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+472*scale,yy+144*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+468*scale,yy+140*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			draw_sprite_ext(sprite,sublarge,xx+468*scale,yy+144*scale,scale*scalefactor,scale*scalefactor,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			draw_sprite_ext(sprite,sublarge,xx+xxx,yy+yyy,scale*scalefactor,scale*scalefactor,0,c_white,255)
		}


		if(type = "grenade") { //grenade stats and stuff
			//define color for fog outline
			var c_outline = make_colour_rgb(192,158,2)
			iscale = 1
			
			//draw stats screen for grenades, different from weps/melee
			draw_sprite_ext(spr_inventory_wep_stats,5,obj_ic.x+473*scale,obj_ic.y+307*scale,scale,scale,0,c_white,255)
					
			//draw damage, armor pen and force
			draw_text_transformed_colour(xx+385*scale,yy+260*scale,damage,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+262*scale,damage_type,scale*1,scale*1.125,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+555*scale,yy+260*scale,penetration,scale*1.125,scale*1.25,0,color,color,color,color,255)
			//draw durability, weight and cost
			draw_text_transformed_colour(xx+385*scale,yy+295*scale,mass,scale*1.125,scale*1.25,0,color,color,color,color,255)
			draw_text_transformed_colour(xx+470*scale,yy+295*scale,value,scale*1.125,scale*1.25,0,color,color,color,color,255)
			
			draw_text_transformed_colour(xx+370*scale,yy+333*scale,blurb,scale*0.75,scale*0.75,0,color,color,color,color,255)
			
			//draw 4 offset sprites solid color (using fog) to make glowing outline
			gpu_set_fog(1,c_outline,0,0)
			draw_sprite_ext(spr_grenade,image,xx+477*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_grenade,image,xx+473*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_grenade,image,xx+477*scale,yy+144*scale,iscale,iscale,0,c_white,255)
			draw_sprite_ext(spr_grenade,image,xx+473*scale,yy+148*scale,iscale,iscale,0,c_white,255)
			gpu_set_fog(0,c_white,0,0)
			
			//finally, draw the weapon image itself
			draw_sprite_ext(spr_grenade,image,xx+475*scale,yy+146*scale,iscale,iscale,0,c_white,255)
		
			
			
		}
}


