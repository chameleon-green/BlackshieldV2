function scr_armor_durability_heat() {

	if(is_array(armor_head_item))
		{
		var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,head_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
		var Durability_Max = armor_head_item[14]
		var Head_Heat = armor_head_item[18]
		var Head_Dissipation = armor_head_item[19]
		
		ar_body_head = Durability_Item/Durability_Max
		}
	else{
		Head_Heat = 0 
		Head_Dissipation = 0 
		skeleton_attachment_set("slot_head" , "0000_head") 
		skeleton_attachment_set("slot_eyes" , "blank")
		ar_body_head = 0
		} 

	//++++++++++++++++++++++++++++++++++++++++++++++ TORSO STUFF +++++++++++++++++++++++++++++++++++++++++++++++++

	if(is_array(armor_torso_item))
		{
		var TorsoID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,torso_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,TorsoID_X,8)
		var Durability_Max = armor_torso_item[14]
	
		var Torso_Heat = armor_torso_item[18]
		var Torso_Dissipation = armor_torso_item[19]
	
		ar_body_torso = Durability_Item/Durability_Max
	
		if(armor_torso_item[11] = "power" and reactor_output > 0) {powered = 1} else{powered = 0}
	
		if(ar_body_torso < 0.25 and ar_body_torso > 0) {reactor_output = 50}
		if(ar_body_torso = 0 or ar_body_torso < 0) {reactor_output = 0}
	
		}
	else{ //If no torso armor is equipped, remove armor sprites, set heat generation and reactor power to 0
		Torso_Heat = 0 
		Torso_Dissipation = 0 
		powered = 0 
		skeleton_attachment_set("slot_torso" , "0000_torso") 
		skeleton_attachment_set("slot_collar" , "blank")
		skeleton_attachment_set("slot_backpack" , "blank")
		skeleton_attachment_set("slot_backpack trim" , "blank")
		skeleton_attachment_set("slot_pelvis" , "0000_pelvis")
		ar_body_torso = 0
		reactor_output = 0
		} 
	
	//++++++++++++++++++++++++++++++++++++++++++++++ LEFT ARM STUFF +++++++++++++++++++++++++++++++++++++++++++++++++

	if(is_array(armor_armL_item))
		{
		var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,armL_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
		var Durability_Max = armor_armL_item[14]
	
		var ArmL_Heat = armor_armL_item[18]
		var ArmL_Dissipation = armor_armL_item[19]
	
		ar_body_larm = Durability_Item/Durability_Max
		}
	else{ //If no torso armor is equipped, remove armor sprites, set heat generation and reactor power to 0
		ArmL_Heat = 0 
		ArmL_Dissipation = 0  
		skeleton_attachment_set("slot_front bicep" , "0000_bicep")  
		skeleton_attachment_set("slot_front forearm" , "0000_forearm")
		skeleton_attachment_set("slot_pauldron" , "blank")  
		skeleton_attachment_set("slot_pauldron trim" , "blank") 
		skeleton_attachment_set("slot_front hand", "0000_hand")
		ar_body_larm = 0
		} 

	//++++++++++++++++++++++++++++++++++++++++++++++ RIGHT ARM STUFF +++++++++++++++++++++++++++++++++++++++++++++++++

	if(is_array(armor_armR_item))
		{
		var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,armR_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
		var Durability_Max = armor_armR_item[14]
	
		var ArmR_Heat = armor_armR_item[18]
		var ArmR_Dissipation = armor_armR_item[19]
	
		ar_body_rarm = Durability_Item/Durability_Max
		}
	else{ //If no torso armor is equipped, remove armor sprites, set heat generation and reactor power to 0
		var ArmR_Heat = 0 
		var ArmR_Dissipation = 0  
	
 
		skeleton_attachment_set("slot_rear bicep" , "0000_bicep") 
		skeleton_attachment_set("slot_rear forearm" , "0000_forearm")
		skeleton_attachment_set("slot_rear pauldron" , "blank") 
		skeleton_attachment_set("slot_holding hand", "0000_holding hand")
	
		ar_body_rarm = 0
		} 

	//++++++++++++++++++++++++++++++++++++++++++++++ LEFT LEG STUFF +++++++++++++++++++++++++++++++++++++++++++++++++

	if(is_array(armor_legL_item))
		{
		var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,legL_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
		var Durability_Max = armor_legL_item[14]
	
		var LegL_Heat = armor_legL_item[18]
		var LegL_Dissipation = armor_legL_item[19]

		ar_body_lleg = Durability_Item/Durability_Max
		}
	else{ //If no torso armor is equipped, remove armor sprites, set heat generation and reactor power to 0
		var LegL_Heat = 0 
		var LegL_Dissipation = 0  
		skeleton_attachment_set("slot_front thigh" , "0000_thigh")  
		skeleton_attachment_set("slot_front thigh_trim1" , -1) 
		skeleton_attachment_set("slot_front knee" , "blank")  
		skeleton_attachment_set("slot_front shin" , "0000_shin")  
		skeleton_attachment_set("slot_front foot" , "0000_foot")  
		ar_body_lleg = 0
		}

	//++++++++++++++++++++++++++++++++++++++++++++++ RIGHT LEG STUFF +++++++++++++++++++++++++++++++++++++++++++++++++

	if(is_array(armor_legR_item))
		{
		var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,legR_id)
		var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
		var Durability_Max = armor_legR_item[14]
	
		var LegR_Heat = armor_legR_item[18]
		var LegR_Dissipation = armor_legR_item[19]
	
		ar_body_rleg = Durability_Item/Durability_Max
		}
	else{ //If no torso armor is equipped, remove armor sprites, set heat generation and reactor power to 0
		var LegR_Heat = 0 
		var LegR_Dissipation = 0  
		skeleton_attachment_set("slot_rear thigh" , "0000_thigh")  
		skeleton_attachment_set("slot_rear knee" , "blank") 
		skeleton_attachment_set("slot_rear shin" , "0000_shin")  
		skeleton_attachment_set("slot_rear foot" , "0000_foot")  
		ar_body_rleg = 0
		} 

	//+++++++++++++++++++++++++++++++++++++++++++++++++++ DEFINE HEAT ++++++++++++++++++++++++++++++++++++++++++++
	armor_baseheat = ((Head_Heat + Torso_Heat + ArmL_Heat + ArmR_Heat + LegL_Heat)*(reactor_output/100))*powered //
	armor_dissipation = (Head_Dissipation + Torso_Dissipation + ArmL_Dissipation + ArmR_Dissipation + LegL_Dissipation)


	armor_addedheat -= armor_dissipation
	if(armor_addedheat < 0) {armor_addedheat = 0}
	if(sprinting and legL_Power_Armored and legR_Power_Armored) {armor_addedheat += armor_baseheat}
	if(walking and legL_Power_Armored and legR_Power_Armored) {armor_addedheat += armor_baseheat/1.5}

	armor_heat = armor_baseheat + armor_addedheat

	armor_overheat = 0
	if(armor_heat > armor_maxheat*0.8) {armor_overheat = 1}
	if(!armor_override and armor_heat > armor_maxheat*0.92 and reactor_output > 50) {reactor_output = round(reactor_output*0.94)}


	//check to see if torso armor is equipped, and then break it if we're overheating
	if(is_array(armor_torso_item))
	{
	var Burning = (armor_heat > armor_maxheat)
	var Torso_Dura = ds_grid_get(obj_ic.grd_inv_armor,TorsoID_X,8)
	if(Burning and Torso_Dura > 0) {ds_grid_set(obj_ic.grd_inv_armor,TorsoID_X,8,clamp(Torso_Dura-1,0,99999999999999999))}
	}




}
