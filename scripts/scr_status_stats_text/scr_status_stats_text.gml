function scr_status_stats_text() {
	//draw screen
	draw_sprite_ext(spr_inventory_screen,7,x+69*scale,y+212*scale,image_xscale,image_yscale,0,c_white,1)

	draw_set_halign(fa_left)
	draw_set_color(c_yellow)
	var xshift = 14*image_xscale //x offset for all text
	var yshift = 12 //vertical spacing between lines
	var yspace = 39 //y offset for initial text
	var textscale = scale*0.61

	//draw strength
	if(obj_player.modSTR < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+0*yshift)*scale,"Strength: " + string(obj_player.baseSTR) + " (" + string(obj_player.modSTR) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modSTR > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+0*yshift)*scale,"Strength: " + string(obj_player.baseSTR) + " (" + "+" + string(obj_player.modSTR) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+0*yshift)*scale,"Strength: " + string(obj_player.baseSTR),1,99999,textscale,textscale,0)}

	//draw endurance
	if(obj_player.modEND < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+1*yshift)*scale,"Endurance: " + string(obj_player.baseEND) + " (" + string(obj_player.modEND) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modEND > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+1*yshift)*scale,"Endurance: " + string(obj_player.baseEND) + " (" + "+" + string(obj_player.modEND) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+1*yshift)*scale,"Endurance: " + string(obj_player.baseEND),1,99999,textscale,textscale,0)}

	//draw agility
	if(obj_player.modAGI < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+2*yshift)*scale,"Agility: " + string(obj_player.baseAGI) + " (" + string(obj_player.modAGI) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modAGI > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+2*yshift)*scale,"Agility: " + string(obj_player.baseAGI) + " (" + "+" + string(obj_player.modAGI) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+2*yshift)*scale,"Agility: " + string(obj_player.baseAGI),1,99999,textscale,textscale,0)}

	//draw intelligence
	if(obj_player.modINT < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+3*yshift)*scale,"Intelligence: " + string(obj_player.baseINT) + " (" + string(obj_player.modINT) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modINT > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+3*yshift)*scale,"Intelligence: " + string(obj_player.baseINT) + " (" + "+" + string(obj_player.modINT) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+3*yshift)*scale,"Intelligence: " + string(obj_player.baseINT),1,99999,textscale,textscale,0)}

	//draw charisma
	if(obj_player.modCHR < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+4*yshift)*scale,"Charisma: " + string(obj_player.baseCHR) + " (" + string(obj_player.modCHR) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modCHR > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+4*yshift)*scale,"Charisma: " + string(obj_player.baseCHR) + " (" + "+" + string(obj_player.modCHR) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+4*yshift)*scale,"Charisma: " + string(obj_player.baseCHR),1,99999,textscale,textscale,0)}

	//draw will
	if(obj_player.modWIL < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+5*yshift)*scale,"Will: " + string(obj_player.baseWIL) + " (" + string(obj_player.modWIL) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modWIL > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+5*yshift)*scale,"Will: " + string(obj_player.baseWIL) + " (" + "+" + string(obj_player.modWIL) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+5*yshift)*scale,"Will: " + string(obj_player.baseWIL),1,99999,textscale,textscale,0)}

	//draw perception
	if(obj_player.modPER < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+6*yshift)*scale,"Perception: " + string(obj_player.basePER) + " (" + string(obj_player.modPER) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modPER > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+6*yshift)*scale,"Perception: " + string(obj_player.basePER) + " (" + "+" + string(obj_player.modPER) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+6*yshift)*scale,"Perception: " + string(obj_player.basePER),1,99999,textscale,textscale,0)}

	//draw dexterity
	if(obj_player.modDEX < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+7*yshift)*scale,"Dexterity: " + string(obj_player.baseDEX) + " (" + string(obj_player.modDEX) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modDEX > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+7*yshift)*scale,"Dexterity: " + string(obj_player.baseDEX) + " (" + "+" + string(obj_player.modDEX) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+7*yshift)*scale,"Dexterity: " + string(obj_player.baseDEX),1,99999,textscale,textscale,0)}

	//draw luck
	if(obj_player.modLCK < 0) {draw_text_ext_transformed(x+xshift,y+(yspace+8*yshift)*scale,"Luck: " + string(obj_player.baseLCK) + " (" + string(obj_player.modLCK) + ")" ,1,99999,textscale,textscale,0)}
	else if(obj_player.modLCK > 0) {draw_text_ext_transformed(x+xshift,y+(yspace+8*yshift)*scale,"Luck: " + string(obj_player.baseLCK) + " (" + "+" + string(obj_player.modLCK) + ")" ,1,99999,textscale,textscale,0)}
	else{draw_text_ext_transformed(x+xshift,y+(yspace+8*yshift)*scale,"Luck: " + string(obj_player.baseLCK),1,99999,textscale,textscale,0)}

	//draw derived stats
	draw_text_ext_transformed(x+xshift,y+(yspace+9.75*yshift)*scale,"Max HP: " + string(round(obj_player.MaxHP)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+10.75*yshift)*scale,"Max Stamina: " + string(round(obj_player.MaxStamina)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+11.75*yshift)*scale,"Max Will: " + string(round(obj_player.MaxWill)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+12.75*yshift)*scale,"Movespeed: " + string(round(obj_player.MoveSpeed)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+13.75*yshift)*scale,"Max Carry Weight: " + string(round(obj_player.CarryWeight)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+14.75*yshift)*scale,"Poise: " + string(round(obj_player.poise)),1,99999,textscale,textscale,0)

	//draw resistances
	draw_text_ext_transformed(x+xshift,y+(yspace+16.5*yshift)*scale,"Total Physical Resist: " + string(round(obj_player.resist_phys)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+17.5*yshift)*scale,"Total Thermal Resist: " + string(round(obj_player.resist_ther)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+18.5*yshift)*scale,"Total Cryo Resist: " + string(round(obj_player.resist_cryo)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+19.5*yshift)*scale,"Total Corrosive Resist: " + string(round(obj_player.resist_corr)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+20.5*yshift)*scale,"Total Radiation Resist: " + string(round(obj_player.resist_radi)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+21.5*yshift)*scale,"Total Electrical Resist: " + string(round(obj_player.resist_elec)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+22.5*yshift)*scale,"Total Biohazard Resist: " + string(round(obj_player.resist_hazm)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+23.5*yshift)*scale,"Total Warp Resist: " + string(round(obj_player.resist_warp)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+24.5*yshift)*scale,"Bleed Resist: " + string(round(obj_player.baseBleed)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+25.5*yshift)*scale,"Poison Resist: " + string(round(obj_player.basePoison)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+26.5*yshift)*scale,"Chill Resist: " + string(round(obj_player.MaxHP)),1,99999,textscale,textscale,0)
	draw_text_ext_transformed(x+xshift,y+(yspace+27.5*yshift)*scale,"Irradiation Resist: " + string(round(obj_player.MaxHP)),1,99999,textscale,textscale,0)


	draw_sprite_ext(spr_inventory_screen,1,x+541*scale,y+290*scale,image_xscale,image_yscale,0,c_white,1)


}
