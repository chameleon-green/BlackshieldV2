function scr_status_body_warnings() {




	//+++++++++++++++++++++++++++++++++++++++++ DEFINE VARIABLES ++++++++++++++++++++++++++++++++++++++++++++
	var aList = obj_player.AfflictionsList

	var HeadMinor = ( ds_list_find_index(aList,"head_injured") != -1 )
	var TorsoMinor = ( ds_list_find_index(aList,"torso_injured") != -1 )
	var LarmMinor = ( ds_list_find_index(aList,"larm_injured") != -1 )
	var RarmMinor = ( ds_list_find_index(aList,"rarm_injured") != -1 )
	var LlegMinor = ( ds_list_find_index(aList,"lleg_injured") != -1 )
	var RlegMinor = ( ds_list_find_index(aList,"rleg_injured") != -1 )

	var HeadMajor = ( ds_list_find_index(aList,"head_injured2") != -1 )
	var TorsoMajor = ( ds_list_find_index(aList,"torso_injured2") != -1 )
	var LarmMajor = ( ds_list_find_index(aList,"larm_injured2") != -1 )
	var RarmMajor = ( ds_list_find_index(aList,"rarm_injured2") != -1 )
	var LlegMajor = ( ds_list_find_index(aList,"lleg_injured2") != -1 )
	var RlegMajor = ( ds_list_find_index(aList,"rleg_injured2") != -1 )

	var HeadSever = ( ds_list_find_index(aList,"head_severed") != -1 )
	var TorsoSever = ( ds_list_find_index(aList,"torso_severed") != -1 )
	var LarmSever = ( ds_list_find_index(aList,"larm_severed") != -1 )
	var RarmSever = ( ds_list_find_index(aList,"rarm_severed") != -1 )
	var LlegSever = ( ds_list_find_index(aList,"lleg_severed") != -1 )
	var RlegSever = ( ds_list_find_index(aList,"rleg_severed") != -1 )

	var NoHeadArmor = !is_array(obj_player.armor_head_item)
	var NoTorsoArmor = !is_array(obj_player.armor_torso_item)
	var NoLarmArmor = !is_array(obj_player.armor_armL_item)
	var NoRarmArmor = !is_array(obj_player.armor_armR_item)
	var NoLlegArmor = !is_array(obj_player.armor_legL_item)
	var NoRlegArmor = !is_array(obj_player.armor_legR_item)
	
	var DmgHeadArmor = obj_player.ar_body_head < 0.9 and !NoHeadArmor
	var DmgTorsoArmor = obj_player.ar_body_torso < 0.9 and !NoTorsoArmor
	var DmgLarmArmor = obj_player.ar_body_larm < 0.9 and !NoLarmArmor
	var DmgRarmArmor = obj_player.ar_body_rarm < 0.9 and !NoRarmArmor
	var DmgLlegArmor = obj_player.ar_body_lleg < 0.9 and !NoLlegArmor
	var DmgRlegArmor = obj_player.ar_body_rleg < 0.9 and !NoRlegArmor

	//+++++++++++++++++++++++++++++++++++++++++ HEAD WARNINGS ++++++++++++++++++++++++++++++++++++
	
	if(NoHeadArmor)
	{
		if(HeadWarning2 = undefined) 
		{
			HeadWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with HeadWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 345
								ymod = 60
								variable = "HeadWarning2"
								creator = other.id
								priority = 0
								text2 = "NO HELMET \nEQUIPPED"
							}
		}
	}
	
	if(DmgHeadArmor)
	{
		if(HeadWarning3 = undefined) 
		{
			HeadWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with HeadWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 345
								ymod = 60
								variable = "HeadWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}	
	
	if(HeadMinor and !HeadSever and !HeadMajor)
	{
		if(HeadWarning = undefined) 
		{
			HeadWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with HeadWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 245
								ymod = 60
								variable = "HeadWarning"
								creator = other.id
								priority = 3
								text2 = "-10 PER -10 INT\n-10 WIL"
							}
		}
	}

	if(HeadMajor and !HeadSever)
	{
		if(HeadWarning = undefined) 
		{
			HeadWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with HeadWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 245
								ymod = 60
								variable = "HeadWarning"
								creator = other.id
								priority = 2
								text2 = "-20 PER -20 INT\n-25 WIL"
							}
		}
		else if(HeadWarning.priority > 2) {instance_destroy(HeadWarning)}
	}

	if(HeadSever)
	{
		if(HeadWarning = undefined) 
		{
			HeadWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with HeadWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 245
								ymod = 60
								variable = "HeadWarning"
								creator = other.id
								priority = 1
								text2 = "TERMINAL"
							}
		}
		else if(HeadWarning.priority > 1) {instance_destroy(HeadWarning)}
	}
	
	
	//+++++++++++++++++++++++++++++++++++++++++ TORSO WARNINGS ++++++++++++++++++++++++++++++++++++
	if(NoTorsoArmor)
	{
		if(TorsoWarning2 = undefined) 
		{
			TorsoWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with TorsoWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 425
								ymod = 168
								variable = "TorsoWarning2"
								creator = other.id
								priority = 0
								text2 = "NO CUIRASS \nEQUIPPED"
							}
		}
	}
	
	if(DmgTorsoArmor)
	{
		if(TorsoWarning3 = undefined) 
		{
			TorsoWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with TorsoWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 425
								ymod = 168
								variable = "TorsoWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}

	if(TorsoMinor and !TorsoSever and !TorsoMajor)
	{
		if(TorsoWarning = undefined) 
		{
			TorsoWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with TorsoWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 185
								ymod = 168
								variable = "TorsoWarning"
								creator = other.id
								priority = 3
								text2 = "-10 STR\n-15 END"
							}
		}
	}

	if(TorsoMajor and !TorsoSever)
	{
		if(TorsoWarning = undefined) 
		{
			TorsoWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with TorsoWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 185
								ymod = 168
								variable = "TorsoWarning"
								creator = other.id
								priority = 2
								text2 = "-15 STR -15 AGI\n-30 END"
							}
		}
		else if(TorsoWarning.priority > 2) {instance_destroy(TorsoWarning)}
	}

	if(TorsoSever)
	{
		if(TorsoWarning = undefined) 
		{
			TorsoWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with TorsoWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 185
								ymod = 168
								variable = "TorsoWarning"
								creator = other.id
								priority = 1
								text2 = "TERMINAL"
							}
		}
		else if(TorsoWarning.priority > 1) {instance_destroy(TorsoWarning)}
	}


	//+++++++++++++++++++++++++++++++++++++++++ ARM WARNINGS ++++++++++++++++++++++++++++++++++++
	if(NoLarmArmor)
	{
		if(LarmWarning2 = undefined) 
		{
			LarmWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LarmWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 185
								ymod = 130
								variable = "LarmWarning2"
								creator = other.id
								priority = 0
								text2 = "NO VAMBRACE\nEQUIPPED"
							}
		}
	}
	
	if(DmgLarmArmor)
	{
		if(LarmWarning3 = undefined) 
		{
			LarmWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LarmWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 185
								ymod = 130
								variable = "LarmWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}

	if(LarmMinor and !LarmSever and !LarmMajor)
	{
		if(LarmWarning = undefined) 
		{
			LarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LarmWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 185
								ymod = 215
								variable = "LarmWarning"
								creator = other.id
								priority = 3
								text2 = "-10 STR"
							}
		}
	}

	if(LarmMajor and !LarmSever)
	{
		if(LarmWarning = undefined) 
		{
			LarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LarmWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 185
								ymod = 215
								variable = "LarmWarning"
								creator = other.id
								priority = 2
								text2 = "-15 STR"
							}
		}
		else if(LarmWarning.priority > 2) {instance_destroy(LarmWarning)}
	}

	if(LarmSever)
	{
		if(LarmWarning = undefined) 
		{
			LarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LarmWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 185
								ymod = 215
								variable = "LarmWarning"
								creator = other.id
								priority = 1
								text2 = "-25% STR"
							}
		}
		else if(LarmWarning.priority > 1) {instance_destroy(LarmWarning)}
	}

	//right arm injuries
	if(NoRarmArmor)
	{
		if(RarmWarning2 = undefined) 
		{
			RarmWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RarmWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 425
								ymod = 130
								variable = "RarmWarning2"
								creator = other.id
								priority = 0
								text2 = "NO VAMBRACE\nEQUIPPED"
							}
		}
	}
	
	if(DmgRarmArmor)
	{
		if(RarmWarning3 = undefined) 
		{
			RarmWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RarmWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 425
								ymod = 130
								variable = "RarmWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}


	if(RarmMinor and !RarmSever and !RarmMajor)
	{
		if(RarmWarning = undefined) 
		{
			RarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RarmWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 427
								ymod = 215
								variable = "RarmWarning"
								creator = other.id
								priority = 3
								text2 = "-10 STR"
							}
		}
	}

	if(RarmMajor and !RarmSever)
	{
		if(RarmWarning = undefined) 
		{
			RarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RarmWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 427
								ymod = 215
								variable = "RarmWarning"
								creator = other.id
								priority = 2
								text2 = "-15 STR"
							}
		}
		else if(RarmWarning.priority > 2) {instance_destroy(RarmWarning)}
	}

	if(RarmSever)
	{
		if(RarmWarning = undefined) 
		{
			RarmWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RarmWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 427
								ymod = 215
								variable = "RarmWarning"
								creator = other.id
								priority = 1
								text2 = "-25% STR"
							}
		}
		else if(RarmWarning.priority > 1) {instance_destroy(RarmWarning)}
	}


	//+++++++++++++++++++++++++++++++++++++++++ LEG WARNINGS ++++++++++++++++++++++++++++++++++++
	if(NoLlegArmor)
	{
		if(LlegWarning2 = undefined) 
		{
			LlegWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LlegWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 185
								ymod = 270
								variable = "LlegWarning2"
								creator = other.id
								priority = 0
								text2 = "NO GREAVE\nEQUIPPED"
							}
		}
	}

	if(DmgLlegArmor)
	{
		if(LlegWarning3 = undefined) 
		{
			LlegWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LlegWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 185
								ymod = 270
								variable = "LlegWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}

	if(LlegMinor and !LlegSever and !LlegMajor)
	{
		if(LlegWarning = undefined) 
		{
			LlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LlegWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 185
								ymod = 322
								variable = "LlegWarning"
								creator = other.id
								priority = 3
								text2 = "-15% AGI"
							}
		}
	}

	if(LlegMajor and !LlegSever)
	{
		if(LlegWarning = undefined) 
		{
			LlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LlegWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 185
								ymod = 322
								variable = "LlegWarning"
								creator = other.id
								priority = 2
								text2 = "-25% AGI\n-10 END"
							}
		}
		else if(LlegWarning.priority > 2) {instance_destroy(LlegWarning)}
	}

	if(LlegSever)
	{
		if(LlegWarning = undefined) 
		{
			LlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with LlegWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 185
								ymod = 322
								variable = "LlegWarning"
								creator = other.id
								priority = 1
								text2 = "-40% AGI\n-10 STR -10 END"
							}
		}
		else if(LlegWarning.priority > 1) {instance_destroy(LlegWarning)}
	}

	//right leg injuries
	if(NoRlegArmor)
	{
		if(RlegWarning2 = undefined) 
		{
			RlegWarning2 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RlegWarning2{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "UNARMORED"
								xmod = 425
								ymod = 270
								variable = "RlegWarning2"
								creator = other.id
								priority = 0
								text2 = "NO GREAVE\nEQUIPPED"
							}
		}
	}
	
	if(DmgRlegArmor)
	{
		if(RlegWarning3 = undefined) 
		{
			RlegWarning3 = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RlegWarning3{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "ARMOR DAMAGE"
								xmod = 425
								ymod = 270
								variable = "RlegWarning3"
								creator = other.id
								priority = 0
								text2 = ""
							}
		}
	}

	if(RlegMinor and !RlegSever and !RlegMajor)
	{
		if(RlegWarning = undefined) 
		{
			RlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RlegWarning{
								color = other.Yellow
								tcolor = c_maroon
								image_index = 0
								text = "MINOR INJURY"
								xmod = 425
								ymod = 322
								variable = "RlegWarning"
								creator = other.id
								priority = 3
								text2 = "-15% AGI"
							}
		}
	}

	if(RlegMajor and !RlegSever)
	{
		if(RlegWarning = undefined) 
		{
			RlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RlegWarning{
								color = other.Orange
								tcolor = c_maroon
								image_index = 1
								text = "MAJOR INJURY"
								xmod = 425
								ymod = 322
								variable = "RlegWarning"
								creator = other.id
								priority = 2
								text2 = "-25% AGI\n-10 END"
							}
		}
		else if(RlegWarning.priority > 2) {instance_destroy(RlegWarning)}
	}

	if(RlegSever)
	{
		if(RlegWarning = undefined) 
		{
			RlegWarning = instance_create_depth(x,y,depth-1,obj_status_body_warning)
			with RlegWarning{
								color = other.Red
								tcolor = c_maroon
								image_index = 2
								text = "AMPUTATION"
								xmod = 425
								ymod = 322
								variable = "RlegWarning"
								creator = other.id
								priority = 1
								text2 = "-40% AGI\n-10 STR -10 END"
							}
		}
		else if(RlegWarning.priority > 1) {instance_destroy(RlegWarning)}
	}




}
