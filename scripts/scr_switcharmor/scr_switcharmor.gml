function scr_switcharmor() {
				
				var GSelected = global.Selected var GSID = GSelected.unique_id
	
				if(item_selected[22] = "armor_torso") 
					{
					obj_player.armor_torso_item = item_selected
					obj_player.torso_id = GSID
					skeleton_attachment_set("slot_torso" , obj_player.armor_torso_item[1])
					obj_player.reactor_output = 100
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.torso_id = -1 obj_player.armor_torso_item = -1}
					}
			
				if(item_selected[22] = "armor_head") 
					{
					obj_player.armor_head_item = item_selected
					obj_player.head_id = GSID
					skeleton_attachment_set("slot_head" , obj_player.armor_head_item[1])
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.head_id = -1 obj_player.armor_head_item = -1}
					}
				if(item_selected[22] = "armor_armL") 
					{
					obj_player.armor_armL_item = item_selected
					obj_player.armL_id = GSID
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.armL_id = -1 obj_player.armor_armL_item = -1}
					}
				
				if(item_selected[22] = "armor_armR") 
					{
					obj_player.armor_armR_item = item_selected
					obj_player.armR_id = GSID
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.armR_id = -1 obj_player.armor_armR_item = -1}
					}
				
				if(item_selected[22] = "armor_legL") 
					{
					obj_player.armor_legL_item = item_selected
					obj_player.legL_id = GSID
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.legL_id = -1 obj_player.armor_legL_item = -1}
					}
				if(item_selected[22] = "armor_legR") 
					{
					obj_player.armor_legR_item = item_selected
					obj_player.legR_id = GSID
				
					if(armor_equip_button_status = "Unequip")
						{obj_player.legR_id = -1 obj_player.armor_legR_item = -1}
					}
				
				


}
