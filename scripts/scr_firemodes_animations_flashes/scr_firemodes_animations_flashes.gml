function scr_firemodes_animations_flashes() {
	//---------------------------------------- define melee weapon idle anims -------------------------------
	thunderedge_teeth[2] = "anim_teeth_th3"
	thunderedge_teeth[1] = "anim_teeth_th2"
	thunderedge_teeth[0] = "anim_teeth_th1"

	proteus_glow[4] = "anim_field_proteus1"
	proteus_glow[3] = "anim_field_proteus2"
	proteus_glow[2] = "anim_field_proteus3"
	proteus_glow[1] = "anim_field_proteus2"
	proteus_glow[0] = "anim_field_proteus1"



	//---------------------------------------- define flash arrays ------------------------------------
	flash_none[4] = make_colour_rgb(255, 230, 90)
	flash_none[3] = -1
	flash_none[2] = -1
	flash_none[1] = -1
	flash_none[0] = -1
	
	flash_standard_medium[4] = make_colour_rgb(255, 230, 90)
	flash_standard_medium[3] = "flash med 4"
	flash_standard_medium[2] = "flash med 3"
	flash_standard_medium[1] = "flash med 2"
	flash_standard_medium[0] = "flash med 1"

	flash_plasma_medium_blue[4] = c_aqua
	flash_plasma_medium_blue[3] = "flash med 4"
	flash_plasma_medium_blue[2] = "flash med 3"
	flash_plasma_medium_blue[1] = "flash med 2"
	flash_plasma_medium_blue[0] = "flash med 1"


	//----------------------------------------- define firemodes --------------------------------------

	firemode_rifle[1] = "Semi"
	firemode_rifle[0] = "Auto"

	firemode_plasma_semi[1] = "Supercharge"
	firemode_plasma_semi[0] = "Semi"

	firemode_plasma_auto[1] = "Supercharge"
	firemode_plasma_auto[0] = "Auto"

	firemode_combi_plasma[1] = "Plasma"
	firemode_combi_plasma[0] = "Auto"

	firemode_pistol[1] = "Semi"
	firemode_pistol[0] = "Semi"

	firemode_shotgun[1] = "Pump"
	firemode_shotgun[0] = "Pump"
	
	firemode_auto[1] = "Auto"
	firemode_auto[0] = "Auto"
	
	firemode_hilo[1] = "High"
	firemode_hilo[0] = "Low"
	
	firemode_missile_laser[1] = "Laser"
	firemode_missile_laser[0] = "Single"
	

	//--------------------------------------define animation arrays---------------------------------

	//bolters

	bolter_phobos_anim[5] = "idle_bolter_phobos"  
	bolter_phobos_anim[4] = "firing_bolter_phobos"
	bolter_phobos_anim[3] = "reload_rifle_phobos"
	bolter_phobos_anim[2] = "sprint_full_rifle"
	bolter_phobos_anim[1] = "walk_rifle"
	bolter_phobos_anim[0] = "backwalk_rifle"
	
	//flamers
	flamer_astartes_anim[7] = "spindown_flamer_astartes"  
	flamer_astartes_anim[6] = "spinup_flamer_astartes"
	flamer_astartes_anim[5] = "idle_flamer_astartes"  
	flamer_astartes_anim[4] = "firing_flamer_astartes"
	flamer_astartes_anim[3] = "reload_flamer_astartes"
	flamer_astartes_anim[2] = "sprint_full_rifle"
	flamer_astartes_anim[1] = "walk_rifle"
	flamer_astartes_anim[0] = "backwalk_rifle"


	//plasma guns
	plasmagun_thunderbolt_anim[5] = "idle_plasmagun_thunderbolt"
	plasmagun_thunderbolt_anim[4] = "firing_plasmagun_thunderbolt"
	plasmagun_thunderbolt_anim[3] = "reload_plasmagun_thunderbolt"
	plasmagun_thunderbolt_anim[2] = "sprint_full_rifle"
	plasmagun_thunderbolt_anim[1] = "walk_rifle"
	plasmagun_thunderbolt_anim[0] = "backwalk_rifle"


	//bolt pistols

	pistol_bolt_tigrus_anim[5] = "idle_pistol_tigrus"  
	pistol_bolt_tigrus_anim[4] = "firing_pistol_tigrus"
	pistol_bolt_tigrus_anim[3] = "reload_pistol_tigrus"
	pistol_bolt_tigrus_anim[2] = "sprint_full_melee"
	pistol_bolt_tigrus_anim[1] = "walk_rifle"
	pistol_bolt_tigrus_anim[0] = "backwalk_rifle"

	pistol_plasma_sunspite_anim[5] = "idle_pistol_sunspite"  
	pistol_plasma_sunspite_anim[4] = "firing_pistol_sunspite"
	pistol_plasma_sunspite_anim[3] = "reload_pistol_sunspite"
	pistol_plasma_sunspite_anim[2] = "sprint_full_melee"
	pistol_plasma_sunspite_anim[1] = "walk_rifle"
	pistol_plasma_sunspite_anim[0] = "backwalk_rifle"


	//heavy bolters

	bolter_heavy_voss_anim[5] = "idle_bolter_heavy_voss"  
	bolter_heavy_voss_anim[4] = "firing_bolter_heavy_voss"
	bolter_heavy_voss_anim[3] = "reload_bolter_heavy_voss"
	bolter_heavy_voss_anim[2] = "sprint_full_rifle"
	bolter_heavy_voss_anim[1] = "walk_rifle"
	bolter_heavy_voss_anim[0] = "backwalk_rifle"

	bolter_heavy_mars_anim[5] = "idle_bolter_heavy_mars"  
	bolter_heavy_mars_anim[4] = "firing_bolter_heavy_mars"
	bolter_heavy_mars_anim[3] = "sprint_full_rifle" //-1
	bolter_heavy_mars_anim[2] = "sprint_full_rifle"
	bolter_heavy_mars_anim[1] = "walk_rifle"
	bolter_heavy_mars_anim[0] = "backwalk_rifle"
	
	//rotor cannons
	
	rotorcannon_proteus_anim[7] = "spindown_rotorcannon_proteus"
	rotorcannon_proteus_anim[6] = "spinup_rotorcannon_proteus"
	rotorcannon_proteus_anim[5] = "idle_rotorcannon_proteus"
	rotorcannon_proteus_anim[4] = "firing_rotorcannon_proteus"
	rotorcannon_proteus_anim[3] = "reload_rotorcannon_proteus"
	rotorcannon_proteus_anim[2] = "sprint_full_rifle"
	rotorcannon_proteus_anim[1] = "walk_rifle"
	rotorcannon_proteus_anim[0] = "backwalk_rifle"

	//missiles
	missile_astartes_anim[5] = "idle_missile_astartes"
	missile_astartes_anim[4] = "firing_missile_astartes"
	missile_astartes_anim[3] = "reload_missile_astartes"
	missile_astartes_anim[2] = "sprint_full_rifle"
	missile_astartes_anim[1] = "walk_rifle"
	missile_astartes_anim[0] = "backwalk_rifle"
	
	//plasma cannons
	plasmacannon_sol_anim[5] = "idle_plasmacannon_sol"
	plasmacannon_sol_anim[4] = "firing_plasmacannon_sol"
	plasmacannon_sol_anim[3] = "sprint_full_rifle" //-1
	plasmacannon_sol_anim[2] = "sprint_full_rifle"
	plasmacannon_sol_anim[1] = "walk_rifle"
	plasmacannon_sol_anim[0] = "backwalk_rifle"
	
	

	//autocannons
	autocannon_kalibrax_anim[5] = "idle_autocannon_kalibrax"
	autocannon_kalibrax_anim[4] = "firing_autocannon_kalibrax"
	autocannon_kalibrax_anim[3] = "reload_autocannon_kalibrax"
	autocannon_kalibrax_anim[2] = "sprint_full_rifle"
	autocannon_kalibrax_anim[1] = "walk_rifle"
	autocannon_kalibrax_anim[0] = "backwalk_rifle"

	//chainswords
	sword_chain_thunderedge_anim[12] = 4 //idle play speed
	sword_chain_thunderedge_anim[11] = thunderedge_teeth //idle animations
	sword_chain_thunderedge_anim[10] = "attack_sword_chain_windup2"
	sword_chain_thunderedge_anim[9] = "attack_sword_chain_windup1"
	sword_chain_thunderedge_anim[8] = "idle_sword_thunderedge2"
	sword_chain_thunderedge_anim[7] = "attack_sword_chain_light1" 
	sword_chain_thunderedge_anim[6] = "attack_sword_chain_light2"
	sword_chain_thunderedge_anim[5] = "attack_sword_chain_light3"
	sword_chain_thunderedge_anim[4] = "attack_sword_chain_heavy1"
	sword_chain_thunderedge_anim[3] = "attack_sword_chain_heavy2"
	sword_chain_thunderedge_anim[2] = "sprint_full_melee"
	sword_chain_thunderedge_anim[1] = "walk_rifle"
	sword_chain_thunderedge_anim[0] = "backwalk_rifle"

	sword_power_proteus_anim[12] = 6 //idle play speed
	sword_power_proteus_anim[11] = proteus_glow //idle animations
	sword_power_proteus_anim[10] = "attack_sword_chain_windup2"
	sword_power_proteus_anim[9] = "attack_sword_chain_windup1"
	sword_power_proteus_anim[8] = "idle_sword_thunderedge2"
	sword_power_proteus_anim[7] = "attack_sword_chain_light1" 
	sword_power_proteus_anim[6] = "attack_sword_chain_light2"
	sword_power_proteus_anim[5] = "attack_sword_chain_light3"
	sword_power_proteus_anim[4] = "attack_sword_chain_heavy1"
	sword_power_proteus_anim[3] = "attack_sword_chain_heavy2"
	sword_power_proteus_anim[2] = "sprint_full_melee"
	sword_power_proteus_anim[1] = "walk_rifle"
	sword_power_proteus_anim[0] = "backwalk_rifle"

	//++++++++++++++++++++++++++++++++ contrails for rockets ++++++++++++++++++++++++++++++++++++++++
	
	ctrail_small1[5] = snd_rocketmotor_1 //reserved for rocket motor noises
	ctrail_small1[4] = spr_ctrail1 //sprite
	ctrail_small1[3] = 1 //yscale
	ctrail_small1[2] = 2 //xscale
	ctrail_small1[1] = 0 //y of trail
	ctrail_small1[0] = 50 //x of trail
}
