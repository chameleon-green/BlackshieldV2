function scr_player_impact() {

	//+++++++++++++++++++++++++++++++++++++++++++ IMPACT VARIABLES +++++++++++++++++++++++++++++++++++++++++
	var head_list = ds_list_create()
	var torso_list = ds_list_create()
	var leg_list = ds_list_create()

	var Crouch = 25*crouching

	
 
	hbox_width_mod = -10 + hspeed
	hbox_head_top = y + vspeed - 166 + Crouch*2 + LegsCrippled*65
	hbox_head_bottom = y + vspeed - 148 + Crouch*2 + LegsCrippled*65
	hbox_torso_top = y + vspeed - 145 + Crouch*2 + LegsCrippled*65
	hbox_torso_bottom = y + vspeed - 90 + Crouch + LegsCrippled*65
	hbox_legs_top = y - 87 + vspeed + Crouch + LegsCrippled*65
	hbox_legs_bottom = y + vspeed

	var head_impact = collision_rectangle_list( bbox_left-hbox_width_mod, hbox_head_top, bbox_right+hbox_width_mod, hbox_head_bottom, obj_bullet, false, false, head_list, true )
	var torso_impact = collision_rectangle_list( bbox_left-hbox_width_mod, hbox_torso_top, bbox_right+hbox_width_mod, hbox_torso_bottom, obj_bullet, false, false, torso_list, true )
	var leg_impact = collision_rectangle_list( bbox_left-hbox_width_mod, hbox_legs_top, bbox_right+hbox_width_mod, hbox_legs_bottom, obj_bullet, false, false, leg_list, true )

	//modify this section for NPCs, should generally set all variables to "1" as they cannot equip/unequip armor dynamically
	var head_armored = is_array(armor_head_item)
	var torso_armored = is_array(armor_torso_item)
	var armL_armored = is_array(armor_armL_item)
	var armR_armored = is_array(armor_armR_item)
	var legL_armored = is_array(armor_legL_item)
	var legR_armored = is_array(armor_legR_item)

	//++++++++++++++++++++++++++++++++++++++++++++ HEAD IMPACTS ++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(head_impact > 0 and !invulnerable) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < head_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = head_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			if(inst.IFF != IFF and inst.damage > 0)
			{
			var Damage = inst.damage //damage is based on the projectile
						
			if(inst.damage_type = "physical") {var resist = clamp(HeadPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
			else if(inst.damage_type = "thermal") {var resist = clamp(HeadTher-inst.penetration,1,9999999)}
			else if(inst.damage_type = "cryo") {var resist = clamp(HeadCryo-inst.penetration,1,9999999)}
			else if(inst.damage_type = "corrosive") {var resist = clamp(HeadCorr-inst.penetration,1,9999999)}
			else if(inst.damage_type = "radiation") {var resist = clamp(HeadRadi-inst.penetration,1,9999999)}
			else if(inst.damage_type = "electric") {var resist = clamp(HeadElec-inst.penetration,1,9999999)}
			else if(inst.damage_type = "biohazard") {var resist = clamp(HeadHazm-inst.penetration,1,9999999)}
			else if(inst.damage_type = "warp") {var resist = clamp(HeadWarp-inst.penetration,1,9999999)}
			else {exit}
		
			if(head_armored) //if our head is armored, hurt the armor and kill the projectile
				{
				var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,head_id)
				var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
			
				if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1) 
					{	
					ds_list_add(col_list,inst.id)
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0	
								hp_body_head -= clamp((Damage - resist),0,999999)
								hp -= clamp((Damage - resist),0,999999)
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)
								}
					}
				if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
					{
					ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
					hp_body_head -= clamp((Damage - resist),1,999999)
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)  
					ds_list_add(col_list,inst.id) //add this projectile to our "already hit" list so it doesn't constant proc impact as it passes through
					inst.hp -= resist
					}
				}
	
			if(!head_armored and ds_list_find_index(col_list,inst.id) = -1) //if our head is not armored, hurt the exposed squishy bits and reaccelerate projectile
				{
				hp_body_head -= clamp((Damage - resist),1,999999) 	
				hp -= clamp((Damage - resist),1,999999)
				audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
				ds_list_add(col_list,inst.id) //add this projectile to our "already hit" list so it doesn't constant proc impact as it passes through
				inst.hp -= resist
				}
			}
	        }
	}

	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ LEG IMPACTS ++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(leg_impact > 0 and !invulnerable) 
	{
	    for (var i2 = 0; i2 < leg_impact; ++i2;)
	        {
			var pick2 = irandom(1)
			var inst = leg_list[| i2]
			if(inst.IFF != IFF and inst.damage > 0)
			{
				if(pick2 = 0) 			
				{
				var Damage = inst.damage //damage is based on the projectile
						
				if(inst.damage_type = "physical") {var resist = clamp(LegLPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
				else if(inst.damage_type = "thermal") {var resist = clamp(LegLTher-inst.penetration,1,9999999)}
				else if(inst.damage_type = "cryo") {var resist = clamp(LegLCryo-inst.penetration,1,9999999)}
				else if(inst.damage_type = "corrosive") {var resist = clamp(LegLCorr-inst.penetration,1,9999999)}
				else if(inst.damage_type = "radiation") {var resist = clamp(LegLRadi-inst.penetration,1,9999999)}
				else if(inst.damage_type = "electric") {var resist = clamp(LegLElec-inst.penetration,1,9999999)}
				else if(inst.damage_type = "biohazard") {var resist = clamp(LegLHazm-inst.penetration,1,9999999)}
				else if(inst.damage_type = "warp") {var resist = clamp(LegLWarp-inst.penetration,1,9999999)}
				else {exit}
			
					if(legL_armored) //if our head is armored, hurt the armor and kill the projectile
					{
					var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,legL_id)
					var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
				
					if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1)
						{	
						ds_list_add(col_list,inst.id)
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0
								hp_body_lleg -= clamp((Damage - resist),0,999999)
								hp -= clamp((Damage - resist),0,999999) 
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist 							
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0					
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)	
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)
								}
						}
					
					if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_list_add(col_list,inst.id)
						ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
						hp_body_lleg -= clamp((Damage - resist),1,999999)
						hp -= clamp((Damage - resist),1,999999)
						audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)		
						inst.hp -= resist
						}
					}
			
					if(!legL_armored and ds_list_find_index(col_list,inst.id) = -1) //if our head is not armored, hurt the exposed squishy bits and kill the projectile
					{
					ds_list_add(col_list,inst.id)
					hp_body_lleg -= clamp((Damage - resist),1,999999)
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)		
					inst.hp -= resist
					}	
				}
			
				if(pick2 = 1) 
				{
				var Damage = inst.damage //damage is based on the projectile
						
				if(inst.damage_type = "physical") {var resist = clamp(LegRPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
				else if(inst.damage_type = "thermal") {var resist = clamp(LegRTher-inst.penetration,1,9999999)}
				else if(inst.damage_type = "cryo") {var resist = clamp(LegRCryo-inst.penetration,1,9999999)}
				else if(inst.damage_type = "corrosive") {var resist = clamp(LegRCorr-inst.penetration,1,9999999)}
				else if(inst.damage_type = "radiation") {var resist = clamp(LegRRadi-inst.penetration,1,9999999)}
				else if(inst.damage_type = "electric") {var resist = clamp(LegRElec-inst.penetration,1,9999999)}
				else if(inst.damage_type = "biohazard") {var resist = clamp(LegRHazm-inst.penetration,1,9999999)}
				else if(inst.damage_type = "warp") {var resist = clamp(LegRWarp-inst.penetration,1,9999999)}
				else {exit}
						
					if(legR_armored) //if our head is armored, hurt the armor and kill the projectile
					{
					var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,legR_id)
					var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
				
					if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1) 
						{						
						ds_list_add(col_list,inst.id)
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								hp_body_rleg -= clamp((Damage - resist),0,999999) 
								hp -= clamp((Damage - resist),0,999999)
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist						
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)
								}
						}
				
					if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_list_add(col_list,inst.id)
						ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
						hp_body_rleg -= clamp((Damage - resist),1,999999)
						hp -= clamp((Damage - resist),1,999999) 
						audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)		
						inst.hp -= resist
						}

					}
				
					if(!legR_armored and ds_list_find_index(col_list,inst.id) = -1) //if our head is not armored, hurt the exposed squishy bits and kill the projectile
					{
					ds_list_add(col_list,inst.id)
					hp_body_rleg -= clamp((Damage - resist),1,999999)
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)		
					inst.hp -= resist
					}	
				}
			}
			}
	}

	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ TORSO AND ARM IMPACTS ++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(torso_impact > 0 and !invulnerable) 
	{
	    for (var i = 0; i < torso_impact; ++i;)
	        {
			var pick1 = irandom(3)
			var inst = torso_list[| i]
			if(inst.IFF != IFF and inst.damage > 0)
			{
				if(pick1 = 0) 
				{
				var Damage = inst.damage //damage is based on the projectile
						
				if(inst.damage_type = "physical") {var resist = clamp(ArmLPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
				else if(inst.damage_type = "thermal") {var resist = clamp(ArmLTher-inst.penetration,1,9999999)}
				else if(inst.damage_type = "cryo") {var resist = clamp(ArmLCryo-inst.penetration,1,9999999)}
				else if(inst.damage_type = "corrosive") {var resist = clamp(ArmLCorr-inst.penetration,1,9999999)}
				else if(inst.damage_type = "radiation") {var resist = clamp(ArmLRadi-inst.penetration,1,9999999)}
				else if(inst.damage_type = "electric") {var resist = clamp(ArmLElec-inst.penetration,1,9999999)}
				else if(inst.damage_type = "biohazard") {var resist = clamp(ArmLHazm-inst.penetration,1,9999999)}
				else if(inst.damage_type = "warp") {var resist = clamp(ArmLWarp-inst.penetration,1,9999999)}
				else {exit}
			
					if(armL_armored) //if our head is armored, hurt the armor and kill the projectile
					{
					var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,armL_id)
					var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
				
					if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1)
						{		
						ds_list_add(col_list,inst.id)
						if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								hp_body_llarm -= clamp((Damage - resist),0,999999)
								hp -= clamp((Damage - resist),0,999999)
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)
								}
						}
					
					if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
						hp_body_llarm -= clamp((Damage - resist),1,999999)
						hp -= clamp((Damage - resist),1,999999)
						audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)		  
						ds_list_add(col_list,inst.id)
						inst.hp -= resist
						}
		
					}
			
					if(!armL_armored and ds_list_find_index(col_list,inst.id) = -1) //if our head is not armored, hurt the exposed squishy bits and kill the projectile
					{
					hp_body_llarm -= clamp((Damage - resist),1,999999)
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)  
					ds_list_add(col_list,inst.id)
					inst.hp -= resist
					}	

				}
			
				if(pick1 = 1)
				{
				var Damage = inst.damage //damage is based on the projectile
						
				if(inst.damage_type = "physical") {var resist = clamp(ArmRPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
				else if(inst.damage_type = "thermal") {var resist = clamp(ArmRTher-inst.penetration,1,9999999)}
				else if(inst.damage_type = "cryo") {var resist = clamp(ArmRCryo-inst.penetration,1,9999999)}
				else if(inst.damage_type = "corrosive") {var resist = clamp(ArmRCorr-inst.penetration,1,9999999)}
				else if(inst.damage_type = "radiation") {var resist = clamp(ArmRRadi-inst.penetration,1,9999999)}
				else if(inst.damage_type = "electric") {var resist = clamp(ArmRElec-inst.penetration,1,9999999)}
				else if(inst.damage_type = "biohazard") {var resist = clamp(ArmRHazm-inst.penetration,1,9999999)}
				else if(inst.damage_type = "warp") {var resist = clamp(ArmRWarp-inst.penetration,1,9999999)}
				else {exit}
					
					if(armR_armored) //if our head is armored, hurt the armor and kill the projectile
					{
					var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,armR_id)
					var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
				
					if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1)
						{		
						ds_list_add(col_list,inst.id)
						if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								hp_body_rarm -= clamp((Damage - resist),0,999999)
								hp -= clamp((Damage - resist),0,999999)
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist				  
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0						
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)					
								}
						}
					
					if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_list_add(col_list,inst.id)
						ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
						hp_body_rarm -= clamp((Damage - resist),1,999999)
						hp -= clamp((Damage - resist),1,999999)
						audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)	
						inst.hp -= resist
						}
				
					}
			
					if(!armR_armored and ds_list_find_index(col_list,inst.id) = -1) //if our head is not armored, hurt the exposed squishy bits and kill the projectile
					{
					ds_list_add(col_list,inst.id)
					hp_body_rarm -= clamp((Damage - resist),1,999999) 	
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0) 
					inst.hp -= resist
					}	

				}
			
				if(pick1 = 2 or pick1 = 3) 
				{
				var Damage = inst.damage //damage is based on the projectile
						
				if(inst.damage_type = "physical") {var resist = clamp(TorsoPhys-inst.penetration,1,9999999)} //determine what we will use to resist the incoming damage
				else if(inst.damage_type = "thermal") {var resist = clamp(TorsoTher-inst.penetration,1,9999999)}
				else if(inst.damage_type = "cryo") {var resist = clamp(TorsoCryo-inst.penetration,1,9999999)}
				else if(inst.damage_type = "corrosive") {var resist = clamp(TorsoCorr-inst.penetration,1,9999999)}
				else if(inst.damage_type = "radiation") {var resist = clamp(TorsoRadi-inst.penetration,1,9999999)}
				else if(inst.damage_type = "electric") {var resist = clamp(TorsoElec-inst.penetration,1,9999999)}
				else if(inst.damage_type = "biohazard") {var resist = clamp(TorsoHazm-inst.penetration,1,9999999)}
				else if(inst.damage_type = "warp") {var resist = clamp(TorsoWarp-inst.penetration,1,9999999)}
				else {exit}
			
					if(torso_armored) //if our head is armored, hurt the armor and kill the projectile
					{
					var ArmorID_X = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,14,torso_id)
					var Durability_Item = ds_grid_get(obj_ic.grd_inv_armor,ArmorID_X,8)
			
					if(Durability_Item > 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_list_add(col_list,inst.id)
						if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp(Durability_Item-inst.damage,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								hp_body_torso -= clamp((Damage - resist),0,999999) 
								hp -= clamp((Damage - resist),0,999999)
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								inst.hp -= resist
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,clamp( Durability_Item-Reduced_DMG,0,9999)) //hurt our armor, mkaing sure it doesn't fall below 0							
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								
								SparkBurst(id,inst)
								
								instance_destroy(inst)
								}
						}
					
					if(Durability_Item <= 0 and ds_list_find_index(col_list,inst.id) = -1)
						{
						ds_list_add(col_list,inst.id)
						ds_grid_set(obj_ic.grd_inv_armor,ArmorID_X,8,0) 
						hp_body_torso -= clamp((Damage - resist),1,999999)
						hp -= clamp((Damage - resist),1,999999)
						audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)	
						inst.hp -= resist
						}
		
					}
			
					if(!torso_armored and ds_list_find_index(col_list,inst.id) = -1)//if our head is not armored, hurt the exposed squishy bits and kill the projectile
					{
					ds_list_add(col_list,inst.id)
					hp_body_torso -= clamp((Damage - resist),1,999999) 	
					hp -= clamp((Damage - resist),1,999999)
					audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)  
					inst.hp -= resist
					}	
				
				}
		
			}
	        }
	}




	ds_list_destroy(head_list);
	ds_list_destroy(torso_list);
	ds_list_destroy(leg_list);


}
