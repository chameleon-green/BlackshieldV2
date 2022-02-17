function scr_weapon_arrays() {
	//-----------------------------------------bolt pistols--------------------------------------
	
	pistol_bolt_tigrus[27] = "150.common"
	pistol_bolt_tigrus[23] = "desc_blank.txt"
	pistol_bolt_tigrus[22] = "secondary" //what kind of weapon is this?
	pistol_bolt_tigrus[21] = firemode_pistol //firemode array (see script)
	pistol_bolt_tigrus[20] = 5 //weight
	pistol_bolt_tigrus[19] = pistol_bolt_tigrus_anim //animations array (see script)
	pistol_bolt_tigrus[18] = sndg_bolter_light1 //sound array
	pistol_bolt_tigrus[17] = "Tigrus Pattern Bolt Pistol" //name
	pistol_bolt_tigrus[16] = "pistol_bolt_tigrus" //weapon attachment sprite
	pistol_bolt_tigrus[15] = "mag_pistol_tigrus" //magazine attachment sprite
	pistol_bolt_tigrus[14] = "bolt_small" //ammo type
	pistol_bolt_tigrus[13] = 22 //angular offset
	pistol_bolt_tigrus[12] = flash_standard_medium //flash type
	pistol_bolt_tigrus[11] = 1 //subimage for item screen (spr_items)
	pistol_bolt_tigrus[10] = ammo_bolt_standard //default ammo type, for to brand new weapon
	pistol_bolt_tigrus[9] = -150 //Y offset for crosshair, used for low/high slung weapons
	pistol_bolt_tigrus[8] = 25 //DMG
	pistol_bolt_tigrus[7] = 8 //ROF
	pistol_bolt_tigrus[6] = 10 //magazine size
	pistol_bolt_tigrus[5] = 4 //spread	
	pistol_bolt_tigrus[4] = 55 //range
	pistol_bolt_tigrus[3] = 50 //muzzle velocity
	pistol_bolt_tigrus[2] = 1000 //durability max
	pistol_bolt_tigrus[1] = 0
	pistol_bolt_tigrus[0] = -1
	ds_list_add(ListComWP,pistol_bolt_tigrus[27]+".pistol_bolt_tigrus")
	
	//-----------------------------------------plasma pistols--------------------------------------
	pistol_plasma_sunspite[27] = "250.common"
	pistol_plasma_sunspite[23] = "desc_blank.txt"
	pistol_plasma_sunspite[22] = "secondary" //what kind of weapon is this?
	pistol_plasma_sunspite[21] = firemode_plasma_semi
	pistol_plasma_sunspite[20] = 5 //weight
	pistol_plasma_sunspite[19] = pistol_plasma_sunspite_anim //animations array (see script)
	pistol_plasma_sunspite[18] = sndg_plasma_small //sound array
	pistol_plasma_sunspite[17] = "Sunspite Pattern Plasma Pistol" //name
	pistol_plasma_sunspite[16] = "pistol_plasma_sunspite" //weapon attachment sprite
	pistol_plasma_sunspite[15] = "none" //magazine attachment sprite
	pistol_plasma_sunspite[14] = "plasma" //ammo type
	pistol_plasma_sunspite[13] = 22 //angular offset
	pistol_plasma_sunspite[12] = flash_plasma_medium_blue //flash type
	pistol_plasma_sunspite[11] = 3 //subimage for item screen (spr_items)
	pistol_plasma_sunspite[10] = ammo_plasma_standard //default ammo type, for to brand new weapon
	pistol_plasma_sunspite[9] = -150 //Y offset for crosshair, used for low/high slung weapons
	pistol_plasma_sunspite[8] = 80 //DMG
	pistol_plasma_sunspite[7] = 4 //ROF
	pistol_plasma_sunspite[6] = 8 //magazine size
	pistol_plasma_sunspite[5] = 4 //spread
	pistol_plasma_sunspite[4] = 45 //range
	pistol_plasma_sunspite[3] = 50 //muzzle velocity
	pistol_plasma_sunspite[2] = 1000 //durability max
	pistol_plasma_sunspite[1] = 4 //cooling rate
	pistol_plasma_sunspite[0] = 160 //heat cap
	ds_list_add(ListComWP,pistol_plasma_sunspite[27]+".pistol_plasma_sunspite")

	//-----------------------------------------boltguns--------------------------------------
	
	bolter_phobos[27] = "150.common"
	bolter_phobos[23] = "desc_blank.txt"
	bolter_phobos[22] = "primary" //what kind of weapon is this?
	bolter_phobos[21] = firemode_rifle //firemode array (see script)
	bolter_phobos[20] = 15 //weight
	bolter_phobos[19] = bolter_phobos_anim //animations array (see script)
	bolter_phobos[18] = sndg_bolter_med1 //sound array
	bolter_phobos[17] = "Phobos Pattern Boltgun" //name
	bolter_phobos[16] = "bolter_phobos" //weapon attachment sprite
	bolter_phobos[15] = "mag_sickle1" //magazine attachment sprite
	bolter_phobos[14] = "bolt_small" //ammo type
	bolter_phobos[13] =  90 //angular offset
	bolter_phobos[12] = flash_standard_medium //flash type
	bolter_phobos[11] = 0 //subimage for item screen (spr_items)
	bolter_phobos[10] = ammo_bolt_standard //default ammo type, for to brand new weapon
	bolter_phobos[9] = -125 //Y offset for crosshair, used for low/high slung weapons
	bolter_phobos[8] = 40//40 //dmg
	bolter_phobos[7] = 9 //ROF 9
	bolter_phobos[6] = 20 //magazine size
	bolter_phobos[5] = 1.2// //spread 1.2
	bolter_phobos[4] = 55 //range
	bolter_phobos[3] = 50 //muzzle velocity
	bolter_phobos[2] = 1000 //durability max
	bolter_phobos[1] = 0
	bolter_phobos[0] = -1
	ds_list_add(ListComWP,bolter_phobos[27]+".bolter_phobos")
	
	//-----------------------------------------flamers--------------------------------------
	
	flamer_astartes[27] = "150.common"
	flamer_astartes[23] = "desc_blank.txt"
	flamer_astartes[22] = "primary" //what kind of weapon is this?
	flamer_astartes[21] = firemode_auto //firemode array (see script)
	flamer_astartes[20] = 18 //weight
	flamer_astartes[19] = flamer_astartes_anim //animations array (see script)
	flamer_astartes[18] = sndg_flamer_med1 //sound array
	flamer_astartes[17] = "Astartes Pattern Flamer" //name
	flamer_astartes[16] = "flamer_astartes" //weapon attachment sprite
	flamer_astartes[15] = "mag_flamer_1" //magazine attachment sprite
	flamer_astartes[14] = "flamer fuel" //ammo type
	flamer_astartes[13] =  90 //angular offset
	flamer_astartes[12] = flash_none //flash type
	flamer_astartes[11] = 0 //subimage for item screen (spr_items)
	flamer_astartes[10] = ammo_flamer_standard //default ammo type, for to brand new weapon
	flamer_astartes[9] = -125 //Y offset for crosshair, used for low/high slung weapons
	flamer_astartes[8] = 10  //dmg
	flamer_astartes[7] = 3 //ROF 9
	flamer_astartes[6] = 75 //magazine size
	flamer_astartes[5] = 0.45// //spread 1.2
	flamer_astartes[4] = 55 //range
	flamer_astartes[3] = 24 //muzzle velocity
	flamer_astartes[2] = 1000 //durability max
	flamer_astartes[1] = 0
	flamer_astartes[0] = -1
	ds_list_add(ListComWP,flamer_astartes[27]+".flamer_astartes")

	//-----------------------------------------plasma guns--------------------------------------
	
	plasmagun_thunderbolt[27] = "250.common"
	plasmagun_thunderbolt[23] = "desc_blank.txt"
	plasmagun_thunderbolt[22] = "primary" //what kind of weapon is this?
	plasmagun_thunderbolt[21] = firemode_plasma_auto //firemode array (see script)
	plasmagun_thunderbolt[20] = 15 //weight
	plasmagun_thunderbolt[19] = plasmagun_thunderbolt_anim //animations array (see script)
	plasmagun_thunderbolt[18] = sndg_plasma_small //sound array
	plasmagun_thunderbolt[17] = "Thunderbolt Pattern Plasma Gun" //name
	plasmagun_thunderbolt[16] = "plasmagun_thunderbolt" //weapon attachment sprite
	plasmagun_thunderbolt[15] = "mag_plasma_thunderbolt" //magazine attachment sprite
	plasmagun_thunderbolt[14] = "plasma" //ammo type
	plasmagun_thunderbolt[13] = 90 //angular offset
	plasmagun_thunderbolt[12] = flash_plasma_medium_blue //flash type
	plasmagun_thunderbolt[11] = 2 //subimage for item screen (spr_items)
	plasmagun_thunderbolt[10] = ammo_plasma_standard  //default ammo type, for to brand new weapon 
	plasmagun_thunderbolt[9] = -125 //Y offset for crosshair, used for low/high slung weapons
	plasmagun_thunderbolt[8] = 90 //DMG
	plasmagun_thunderbolt[7] = 8 //ROF
	plasmagun_thunderbolt[6] = 20  //magazine size
	plasmagun_thunderbolt[5] = 1.4 //spread
	plasmagun_thunderbolt[4] = 55 //range
	plasmagun_thunderbolt[3] = 50 //muzzle velocity
	plasmagun_thunderbolt[2] = 1000 //durability max
	plasmagun_thunderbolt[1] = 8 //cooling rate
	plasmagun_thunderbolt[0] = 360 //heat cap
	ds_list_add(ListComWP,plasmagun_thunderbolt[27]+".plasmagun_thunderbolt")



	//-----------------------------------------heavy bolters--------------------------------------
	
	bolter_heavy_voss[27] = "165.common"
	bolter_heavy_voss[23] = "desc_blank.txt"
	bolter_heavy_voss[22] = "primary" //what kind of weapon is this?
	bolter_heavy_voss[21] = firemode_rifle //firemode array (see script)
	bolter_heavy_voss[20] = 45 //weight
	bolter_heavy_voss[19] = bolter_heavy_voss_anim //animations array (see script)
	bolter_heavy_voss[18] = sndg_bolter_heavy1 //sound array
	bolter_heavy_voss[17] = "Voss Pattern Heavy Bolter" //name
	bolter_heavy_voss[16] = "bolter_heavy_voss" //weapon attachment sprite
	bolter_heavy_voss[15] = "magazine_bolter_heavy1" //magazine attachment sprite
	bolter_heavy_voss[14] = "bolt_large" //ammo type
	bolter_heavy_voss[13] = 90 //angular offset
	bolter_heavy_voss[12] = flash_standard_medium //flash type
	bolter_heavy_voss[11] = 4 //subimage for item screen (spr_items)
	bolter_heavy_voss[10] = ammo_bolt_heavy_standard //default ammo type, for to brand new weapon 
	bolter_heavy_voss[9] = -90 //Y offset for crosshair, used for low/high slung weapons
	bolter_heavy_voss[8] = 65 //DMG
	bolter_heavy_voss[7] = 7 //ROF 8
	bolter_heavy_voss[6] = 40 //magazine size 40
	bolter_heavy_voss[5] = 1.4 //spread
	bolter_heavy_voss[4] = 75 //range
	bolter_heavy_voss[3] = 50 //muzzle velocity 50
	bolter_heavy_voss[2] = 1000 //durability max
	bolter_heavy_voss[1] = 0
	bolter_heavy_voss[0] = -1
	ds_list_add(ListComWP,bolter_heavy_voss[27]+".bolter_heavy_voss")
	

	bolter_heavy_mars[27] = "175.common"
	bolter_heavy_mars[23] = "desc_blank.txt"
	bolter_heavy_mars[22] = "primary" //what kind of weapon is this?
	bolter_heavy_mars[21] = firemode_rifle //firemode array (see script)
	bolter_heavy_mars[20] = 60 //weight
	bolter_heavy_mars[19] = bolter_heavy_mars_anim //animations array (see script)
	bolter_heavy_mars[18] = sndg_bolter_heavy1 //sound array
	bolter_heavy_mars[17] = "Mars Pattern Heavy Bolter" //name
	bolter_heavy_mars[16] = "bolter_heavy_mars" //weapon attachment sprite
	bolter_heavy_mars[15] = "magazine_bolter_heavy2" //magazine attachment sprite
	bolter_heavy_mars[14] = "bolt_large" //ammo type
	bolter_heavy_mars[13] = 90 //angular offset
	bolter_heavy_mars[12] = flash_standard_medium //flash type
	bolter_heavy_mars[11] = 5 //subimage for item screen (spr_items)
	bolter_heavy_mars[10] = ammo_bolt_heavy_standard //default ammo type, for to brand new weapon 
	bolter_heavy_mars[9] = -90 //Y offset for crosshair, used for low/high slung weapons
	bolter_heavy_mars[8] = 60 //DMG
	bolter_heavy_mars[7] = 6 //ROF
	bolter_heavy_mars[6] = 400 //magazine size
	bolter_heavy_mars[5] = 1.2 //spread
	bolter_heavy_mars[4] = 85 //range
	bolter_heavy_mars[3] = 50 //muzzle velocity
	bolter_heavy_mars[2] = 1000 //durability max
	bolter_heavy_mars[1] = 0
	bolter_heavy_mars[0] = -1
	ds_list_add(ListComWP,bolter_heavy_mars[27]+".bolter_heavy_mars")
	
	//-----------------------------------------missile launchers--------------------------------------
	
	missile_astartes[27] = "175.common"
	missile_astartes[23] = "desc_blank.txt"
	missile_astartes[22] = "primary" //what kind of weapon is this?
	missile_astartes[21] = firemode_missile_laser //firemode array (see script)
	missile_astartes[20] = 60 //weight
	missile_astartes[19] = missile_astartes_anim //animations array (see script)
	missile_astartes[18] = sndg_missile_small1 //sound array
	missile_astartes[17] = "Astartes Pattern Missile Launcher" //name
	missile_astartes[16] = "missile_astartes" //weapon attachment sprite
	missile_astartes[15] = -1 //magazine attachment sprite
	missile_astartes[14] = "missile_small" //ammo type
	missile_astartes[13] = 40 //angular offset
	missile_astartes[12] = flash_standard_medium //flash
	missile_astartes[11] = 1 //subimage for item screen (spr_items)
	missile_astartes[10] =  ammo_missile_krak //default ammo type, for to brand new weapon
	missile_astartes[9] = 30 //Y offset for crosshair, used for low/high slung weapons
	missile_astartes[8] = 6000//800 //DMG
	missile_astartes[7] = 100 //ROF
	missile_astartes[6] = 1 //magazine size
	missile_astartes[5] = 0.5 //spread
	missile_astartes[4] = 1000 //range
	missile_astartes[3] = 35 //muzzle velocity
	missile_astartes[2] = 1000 //durability max
	missile_astartes[1] = 0
	missile_astartes[0] = -1
	ds_list_add(ListComWP,missile_astartes[27]+".missile_astartes")
	

	//-----------------------------------------plasma cannons--------------------------------------
	
	plasmacannon_sol[27] = "275.common"
	plasmacannon_sol[23] = "desc_blank.txt"
	plasmacannon_sol[22] = "primary" //what kind of weapon is this?
	plasmacannon_sol[21] = firemode_plasma_semi //firemode array (see script)
	plasmacannon_sol[20] = 60 //weight
	plasmacannon_sol[19] = plasmacannon_sol_anim //animations array (see script)
	plasmacannon_sol[18] = sndg_plasma_small //sound array
	plasmacannon_sol[17] = "Sol Militaris Pattern Plasma Cannon" //name
	plasmacannon_sol[16] = "plasmacannon_sol" //weapon attachment sprite
	plasmacannon_sol[15] = "mag_plasmacannon_sol" //magazine attachment sprite
	plasmacannon_sol[14] = "plasma" //ammo type
	plasmacannon_sol[13] = 130 //angular offset
	plasmacannon_sol[12] = flash_plasma_medium_blue //flash type
	plasmacannon_sol[11] = 1 //subimage for item screen (spr_items)
	plasmacannon_sol[10] =  ammo_bolt_heavy_standard //default ammo type, for to brand new weapon
	plasmacannon_sol[9] = 30 //Y offset for crosshair, used for low/high slung weapons
	plasmacannon_sol[8] = 350 //DMG
	plasmacannon_sol[7] = 10 //ROF
	plasmacannon_sol[6] = 500 //magazine size
	plasmacannon_sol[5] = 1.2 //spread
	plasmacannon_sol[4] = 85 //range
	plasmacannon_sol[3] = 50 //muzzle velocity
	plasmacannon_sol[2] = 1000 //durability max
	plasmacannon_sol[1] = 15
	plasmacannon_sol[0] = 15.1
	ds_list_add(ListComWP,plasmacannon_sol[27]+".plasmacannon_sol")
	

	//-----------------------------------------autocannons--------------------------------------

	autocannon_kalibrax[27] = "75.common"
	autocannon_kalibrax[23] = "desc_blank.txt"
	autocannon_kalibrax[22] = "primary" //what kind of weapon is this?
	autocannon_kalibrax[21] = firemode_rifle //firemode array (see script)
	autocannon_kalibrax[20] = 65 //weight
	autocannon_kalibrax[19] = autocannon_kalibrax_anim //animations array (see script)
	autocannon_kalibrax[18] = sndg_autocannon1 //sound array
	autocannon_kalibrax[17] = "Kalibrax Pattern Autocannon" //name
	autocannon_kalibrax[16] = "autocannon_kalibrax" //weapon attachment sprite
	autocannon_kalibrax[15] = "mag_kalibrax_1" //magazine attachment sprite
	autocannon_kalibrax[14] = "autocannon" //ammo type
	autocannon_kalibrax[13] = 90 //angular offset
	autocannon_kalibrax[12] = flash_standard_medium //flash type
	autocannon_kalibrax[11] = 7 //subimage for item screen (spr_items)
	autocannon_kalibrax[10] = ammo_autocannon_standard //default ammo type, for to brand new weapon
	autocannon_kalibrax[9] = 30 //Y offset for crosshair, used for low/high slung weapons
	autocannon_kalibrax[8] = 250 //DMG
	autocannon_kalibrax[7] = 25 //ROF
	autocannon_kalibrax[6] = 18 //magazine size
	autocannon_kalibrax[5] = 0.75 //spread
	autocannon_kalibrax[4] = 160 //range
	autocannon_kalibrax[3] = 90 //muzzle velocity
	autocannon_kalibrax[2] = 1000 //durability max
	autocannon_kalibrax[1] = 0
	autocannon_kalibrax[0] = -1
	ds_list_add(ListComWP,autocannon_kalibrax[27]+".autocannon_kalibrax")
	
	//-----------------------------------------rotor cannons--------------------------------------
	
	rotorcannon_proteus[27] = "90.common"
	rotorcannon_proteus[23] = "desc_blank.txt"
	rotorcannon_proteus[22] = "primary" //what kind of weapon is this?
	rotorcannon_proteus[21] = firemode_hilo //firemode array (see script)
	rotorcannon_proteus[20] = 60 //weight
	rotorcannon_proteus[19] = rotorcannon_proteus_anim //animations array (see script)
	rotorcannon_proteus[18] = sndg_rotorcannon //sound array
	rotorcannon_proteus[17] = "Proteus Pattern Rotorcannon" //name
	rotorcannon_proteus[16] = "rotorcannon_proteus" //weapon attachment sprite
	rotorcannon_proteus[15] = "mag_belt_rotor" //magazine attachment sprite
	rotorcannon_proteus[14] = "autogun" //ammo type
	rotorcannon_proteus[13] = 90 //angular offset
	rotorcannon_proteus[12] = flash_standard_medium //flash type
	rotorcannon_proteus[11] = 8 //subimage for item screen (spr_items)
	rotorcannon_proteus[10] = ammo_auto_ball //default ammo type, for to brand new weapon
	rotorcannon_proteus[9] = -400 //Y offset for crosshair, used for low/high slung weapons
	rotorcannon_proteus[8] = 14 //DMG
	rotorcannon_proteus[7] = 1 //ROF
	rotorcannon_proteus[6] = 1000 //magazine size
	rotorcannon_proteus[5] = 0.75 //spread
	rotorcannon_proteus[4] = 160 //range
	rotorcannon_proteus[3] = 150//55 //muzzle velocity
	rotorcannon_proteus[2] = 1000 //durability max
	rotorcannon_proteus[1] = 8
	rotorcannon_proteus[0] = 1800
	ds_list_add(ListComWP,rotorcannon_proteus[27]+".rotorcannon_proteus")
	//-----------------------------------------chainswords--------------------------------------
	
	sword_chain_thunderedge[27] = "150.common"
	sword_chain_thunderedge[25] = "Weapon Descriptions/Chain Weapons/desc_sword_chain_thunderedge.txt"
	sword_chain_thunderedge[24] = 0 //subimage for display
	sword_chain_thunderedge[23] = 20 //weight
	sword_chain_thunderedge[22] = "melee" //what kind of weapon is this?
	sword_chain_thunderedge[21] = sword_chain_thunderedge_anim //animations
	sword_chain_thunderedge[20] = "sword_chain_thunderedge" //attachment sprite
	sword_chain_thunderedge[19] = sndg_sword_chain1 //sounds
	sword_chain_thunderedge[18] = 0.2 //armor shred, as percent of damage
	sword_chain_thunderedge[17] = 45 //damage
	sword_chain_thunderedge[16] = 18 //force
	sword_chain_thunderedge[15] = 900 //durability
	sword_chain_thunderedge[14] = "Thunderedge Pattern Chainsword"
	sword_chain_thunderedge[13] = "sword" //weapon type
	sword_chain_thunderedge[12] = "chain" //subtype
	sword_chain_thunderedge[11] = "STR(D).030" //scaling type one
	sword_chain_thunderedge[10] = "DEX(E).020" //scaling type two
	sword_chain_thunderedge[9] = "none" //scaling type three
	sword_chain_thunderedge[8] = "none" //scaling type four
	sword_chain_thunderedge[7] = "physical.100" //damage type one and percent of total
	sword_chain_thunderedge[6] = "none" //damage type two and percent of total
	sword_chain_thunderedge[5] = "none" //damage type three and percent of total
	ds_list_add(ListComWP,sword_chain_thunderedge[27]+".sword_chain_thunderedge")

	sword_power_proteus[27] = "250.common"
	sword_power_proteus[25] = "Weapon Descriptions/Power Weapons/desc_sword_power_proteus.txt"
	sword_power_proteus[24] = 1 //subimage for display
	sword_power_proteus[23] = 16 //weight
	sword_power_proteus[22] = "melee" //what kind of weapon is this?
	sword_power_proteus[21] = sword_power_proteus_anim //animations
	sword_power_proteus[20] = "sword_power_proteus" //attachment sprite
	sword_power_proteus[19] = sndg_sword_chain1 //sounds
	sword_power_proteus[18] = 1 //armor shred, as percent of damage
	sword_power_proteus[17] = 30 //damage
	sword_power_proteus[16] = 10 //force
	sword_power_proteus[15] = 1000 //durability
	sword_power_proteus[14] = "Proteus Pattern Power Sword"
	sword_power_proteus[13] = "sword" //type
	sword_power_proteus[12] = "power" //subtype
	sword_power_proteus[11] = "STR(F).010" //scaling type one
	sword_power_proteus[10] = "DEX(D).030" //scaling type two
	sword_power_proteus[9] = "none" //scaling type three
	sword_power_proteus[8] = "none" //scaling type four
	sword_power_proteus[7] = "physical.80" //damage type one and percent of total
	sword_power_proteus[6] = "electric.20" //damage type two and percent of total
	sword_power_proteus[5] = "none" //damage type three and percent of total
	ds_list_add(ListComWP,sword_power_proteus[27]+".sword_power_proteus")



	//----------------------------------------Grenades-------------------------------------------
	
	grenade_frag_astartes[27] = "150.common"
	grenade_frag_astartes[23] = "desc_blank.txt"
	grenade_frag_astartes[22] = "grenade"
	grenade_frag_astartes[21] = "grenade" 
	grenade_frag_astartes[20] = 1 //mass
	grenade_frag_astartes[19] = "grenade" 
	grenade_frag_astartes[18] = "grenade" 
	grenade_frag_astartes[17] = "grenade" 
	grenade_frag_astartes[16] = "grenade" 
	grenade_frag_astartes[15] = "grenade" 
	grenade_frag_astartes[14] = "grenade" 
	grenade_frag_astartes[13] = "grenade" 
	grenade_frag_astartes[12] = 0 
	grenade_frag_astartes[11] = "High power frag grenade" 
	grenade_frag_astartes[10] = "PHYS" 
	grenade_frag_astartes[9] = 5 //subimage for pin
	grenade_frag_astartes[8] = 0 //subimage for grenade
	grenade_frag_astartes[7] = snd_explode_small1 //boom noise
	grenade_frag_astartes[6] = "Astartes Frag Grenade" //name
	grenade_frag_astartes[5] = 2 //weight
	grenade_frag_astartes[4] = "none" //special traits? Sticky?
	grenade_frag_astartes[3] = 250 //fuse time
	grenade_frag_astartes[2] = exp_scalable_frag_med //explosion type
	grenade_frag_astartes[1] = "physical" //damage type
	grenade_frag_astartes[0] = 700 //damage
	ds_list_add(ListComWP,grenade_frag_astartes[27]+".grenade_frag_astartes")
	
	grenade_smoke_astartes[27] = "150.common"
	grenade_smoke_astartes[23] = "desc_blank.txt"
	grenade_smoke_astartes[22] = "grenade" //what kind of weapon is this?
	grenade_smoke_astartes[21] = "grenade" 
	grenade_smoke_astartes[20] = 1 //mass
	grenade_smoke_astartes[19] = "grenade" 
	grenade_smoke_astartes[18] = "grenade" 
	grenade_smoke_astartes[17] = "grenade" 
	grenade_smoke_astartes[16] = "grenade" 
	grenade_smoke_astartes[15] = "grenade" 
	grenade_smoke_astartes[14] = "grenade" 
	grenade_smoke_astartes[13] = "grenade" 
	grenade_smoke_astartes[12] = 0
	grenade_smoke_astartes[11] = "Creates clouds of smoke" 
	grenade_smoke_astartes[10] = "PHYS" //damage type abbreviation for stats screen
	grenade_smoke_astartes[9] = 5 //subimage for pin
	grenade_smoke_astartes[8] = 3 //subimage for grenade
	grenade_smoke_astartes[7] = snd_grenade_smoke_burst //boom noise
	grenade_smoke_astartes[6] = "Astartes Smoke Grenade" //name
	grenade_smoke_astartes[5] = 2 //weight
	grenade_smoke_astartes[4] = "none" //special traits? Sticky?
	grenade_smoke_astartes[3] = 250 //fuse time
	grenade_smoke_astartes[2] = exp_scalable_smoke_small //explosion type
	grenade_smoke_astartes[1] = "physical" //damage type
	grenade_smoke_astartes[0] = 0
	ds_list_add(ListComWP,grenade_smoke_astartes[27]+".grenade_smoke_astartes")


}
