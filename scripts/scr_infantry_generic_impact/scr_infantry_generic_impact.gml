// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_infantry_generic_impact(){



if(!dead and !invulnerable)
{	
	
	var head_list = ds_list_create()
	var torso_list = ds_list_create()
	var leg_list = ds_list_create()

	var Crouch = CrouchOffset*crouching

	var x1 = bbox_left - hitbox_offset + hspeed
	var x2 = bbox_right + hitbox_offset + hspeed
	var y_leg_top = y-65+Crouch+vspeed
	var y_torso_bot = y+vspeed-70+Crouch
	var y_torso_top = y-105+Crouch*2+vspeed 
	var y_head_bot = y+vspeed-108+Crouch*2
	var y_head_top = y-120+Crouch*2+vspeed

	var head_impact = collision_rectangle_list( x1, y_head_bot, x2, y_head_top, obj_bullet, false, false, head_list, true )
	var torso_impact = collision_rectangle_list( x1, y_torso_top, x2, y_torso_bot, obj_bullet, false, false, torso_list, true )
	var leg_impact = collision_rectangle_list( x1, y+vspeed, x2, y_leg_top, obj_bullet, false, false, leg_list, true )

	if(head_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < head_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = head_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
			if(instance_exists(inst)){
			
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(HeadPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(HeadTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(HeadCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(HeadCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(HeadRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(HeadElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(HeadHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(HeadWarp-inst.penetration,1,40000)}
							else {exit}
						
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								HeadDurability =  clamp(HeadDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								HeadHp -= (Damage - resist) 
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								}
								
								var Ratio = ((resist+inst.penetration)/Damage)*1.5
								var reduction = 1-Ratio
								var moddedhp = clamp(inst.hp*reduction,0,inst.hp)
								if(moddedhp < inst.hp) {inst.hp = moddedhp} else{inst.hp -= resist*1.5}		
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								HeadDurability =  clamp(HeadDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								}
								inst.hp = 0
								}
					}
				}
			}
	}

	if(torso_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < torso_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = torso_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
			
				if(instance_exists(inst)){
				
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(TorsoPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(TorsoTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(TorsoCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(TorsoCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(TorsoRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(TorsoElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(TorsoHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(TorsoWarp-inst.penetration,1,40000)}
							else {exit}
						
						
							
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								TorsoDurability =  clamp(TorsoDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								TorsoHp -= (Damage - resist) 
								//hp -= (Damage - resist) 
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								}
								
								var Ratio = ((resist+inst.penetration)/Damage)*1.5
								var reduction = 1-Ratio
								var moddedhp = clamp(inst.hp*reduction,0,inst.hp)
								if(moddedhp < inst.hp) {inst.hp = moddedhp} else{inst.hp -= resist*1.5}
								
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								TorsoDurability =  clamp(TorsoDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								}
								
								inst.hp = 0
								}
					}
				
				}
			}
	}

	if(leg_impact > 0) //if we have any impacts on the head, execute below
	{
	 for (var i3 = 0; i3 < leg_impact; ++i3;) //start off i3 (counter) at 0. While i3 is less than head impacts, increase by 1
	        {
			var inst = leg_list[| i3] //inst equals the instance stored in the head impact ds list referenced in head_impact
				
				if(instance_exists(inst)){
				
				if(ds_list_find_index(col_list,inst.id) = -1 and inst.IFF != IFF) 
					{
							ds_list_add(col_list,inst.id)
							var Damage = inst.damage //damage is based on the projectile
						
							if(inst.damage_type = "physical") {var resist = clamp(LegsPhys-inst.penetration,1,40000)} //determine what we will use to resist the incoming damage
							else if(inst.damage_type = "thermal") {var resist = clamp(LegsTher-inst.penetration,1,40000)}
							else if(inst.damage_type = "cryo") {var resist = clamp(LegsCryo-inst.penetration,1,40000)}
							else if(inst.damage_type = "corrosive") {var resist = clamp(LegsCorr-inst.penetration,1,40000)}
							else if(inst.damage_type = "radiation") {var resist = clamp(LegsRadi-inst.penetration,1,40000)}
							else if(inst.damage_type = "electric") {var resist = clamp(LegsElec-inst.penetration,1,40000)}
							else if(inst.damage_type = "biohazard") {var resist = clamp(LegsHazm-inst.penetration,1,40000)}
							else if(inst.damage_type = "warp") {var resist = clamp(LegsWarp-inst.penetration,1,40000)}
							else {exit}
						
						
							
							if(Damage > resist) //if incoming damage defeats our armor, hurt the limb and play a squishy noise. reduce projectile hp
								{
								LegsDurability =  clamp(LegsDurability - Damage,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								LegsHp -= (Damage - resist) 
								//hp -= (Damage - resist) 
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								audio_play_sound(choose(snd_impact_flesh1,snd_impact_flesh2,snd_impact_flesh3),1,0)
								}
								
								var Ratio = ((resist+inst.penetration)/Damage)*1.5
								var reduction = 1-Ratio
								var moddedhp = clamp(inst.hp*reduction,0,inst.hp)
								if(moddedhp < inst.hp) {inst.hp = moddedhp} else{inst.hp -= resist*1.5}
							
								}
							if(Damage <= resist) //if our armor defeats the damage, play a clank noise, and delete the projectile
								{
								var Reduced_DMG = (Damage/resist)*Damage
								LegsDurability =  clamp(LegsDurability - Reduced_DMG,0,99999) //hurt our armor, mkaing sure it doesn't fall below 0
								
								if(inst.impact_sound){
								audio_play_sound(choose(snd_impact_metal1,snd_impact_metal2,snd_impact_metal3),1,0)
								}
								inst.hp = 0
								}
					}
			
				}
			}
	}

ds_list_destroy(head_list)
ds_list_destroy(torso_list)
ds_list_destroy(leg_list)	




}


}