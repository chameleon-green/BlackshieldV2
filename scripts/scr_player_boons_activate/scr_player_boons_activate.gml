function scr_player_boons_activate(argument0, argument1, argument2, argument3) {
	var type = argument0
	var strength = argument1
	var index = argument2
	var timeleft = argument3



	if(type = "HPHeal")
	{
		obj_player.hp += strength/60
	}

	if(type = "STAHeal")
	{
		obj_player.stamina += strength/60
	}

	if(type = "WILHeal")
	{
		obj_player.will += strength/60
	}

	if(type = "BURN")
	{
		/*
		var ID = obj_player.id
		var Limb = choose("hp_body_head","hp_body_torso","hp_body_llarm","hp_body_rarm","hp_body_lleg","hp_body_rleg")
		var CurrentLimbHp = variable_instance_get(ID,Limb)
		variable_instance_set(ID,Limb,CurrentLimbHp-strength)
		*/
		var AdjustedStrength = clamp( (strength - obj_player.resist_ther)/60,0,40000) //make sure burn can't go negative and give hp
		obj_player.hp -= AdjustedStrength 
	
	}

	if(type = "ENDInc")
	{
		if(btoggle[index] = 0 and timeleft > 0) {obj_player.modEND += strength btoggle[index] = 1}
		if(timeleft <= 0 and btoggle[index] = 1) {obj_player.modEND -= strength btoggle[index] = 0}
	}

	if(type = "STRInc")
	{
		if(btoggle[index] = 0 and timeleft > 0) {obj_player.modSTR += strength btoggle[index] = 1}
		if(timeleft <= 0 and btoggle[index] = 1) {obj_player.modSTR -= strength btoggle[index] = 0}
	}

	if(type = "AGIInc")
	{
		if(btoggle[index] = 0 and timeleft > 0) {obj_player.modAGI += strength btoggle[index] = 1}
		if(timeleft <= 0 and btoggle[index] = 1) {obj_player.modAGI -= strength btoggle[index] = 0}
	}


	if(type = "HPDrain")
	{
		obj_player.hp -= strength/60
	}

	if(type = "Frenzied")
	{
		obj_player.hp -= strength/60
		obj_player.stamina += (strength/2)/60
		if(btoggle[index] = 0 and timeleft > 0) {obj_player.modAGI += strength*5 obj_player.modSTR += strength*5 obj_player.modEND += strength*5 btoggle[index] = 1}
		if(timeleft <= 0 and btoggle[index] = 1) {obj_player.modAGI -= strength*5 obj_player.modSTR -= strength*5 obj_player.modEND -= strength*5 btoggle[index] = 0}
	}




	if(timeleft <= 0) {ds_grid_set_region(BuffsGrid,index,0,index,5,0) btime[index] = 0 btoggle[index] = 0}


}
