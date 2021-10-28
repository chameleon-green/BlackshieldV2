function scr_ammo_init() {

	//-----------------------------------------boltguns--------------------------------------
	
	ammo_bolt_standard[27] = "150.common"
	ammo_bolt_standard[22] = "ammo" //this is ammo
	ammo_bolt_standard[21] = "dumb" //guidance type
	ammo_bolt_standard[20] = 0.25 //weight per round
	ammo_bolt_standard[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_bolt_standard[18] = rounds.Yellow_Small //projectile skin
	ammo_bolt_standard[17] = "Boltgun Rounds" //Name
	ammo_bolt_standard[16] = 0 //icon sprite subimage
	ammo_bolt_standard[15] = 0 //casing skin
	ammo_bolt_standard[14] = 1 //durability cost per shot
	ammo_bolt_standard[13] = 1.00 //damage mod
	ammo_bolt_standard[12] = 0.1 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_bolt_standard[11] = 1 //Velocity Mod
	ammo_bolt_standard[10] = 1.00 //ROF mod
	ammo_bolt_standard[9] = 1.00  //range mod
	ammo_bolt_standard[8] = exp_bolt_small //explosion array
	ammo_bolt_standard[7] = "Ammo Descriptions/desc_ammo_bolt_round_standard.txt"
	ammo_bolt_standard[6] = "none" //special effects, burning etc
	ammo_bolt_standard[5] = "bolt_small" //ammo type
	ammo_bolt_standard[4] = "physical" //damage type
	ammo_bolt_standard[3] = "Standard bolt rounds. 1x physical damage."
	ammo_bolt_standard[2] = "none" //contrail
	ammo_bolt_standard[1] = 0 //fuse sensitivity
	ds_list_add(ListComAM,ammo_bolt_standard[27]+".ammo_bolt_standard")

	ammo_bolt_kraken[27] = "175.common"
	ammo_bolt_kraken[22] = "ammo" //this is ammo
	ammo_bolt_kraken[21] = "dumb" //guidance type
	ammo_bolt_kraken[20] = 0.28 //weight per round
	ammo_bolt_kraken[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_bolt_kraken[18] = rounds.Red_Small //projectile skin
	ammo_bolt_kraken[17] = "Boltgun Kraken Rounds" //Name
	ammo_bolt_kraken[16] = 1 //icon sprite subimage
	ammo_bolt_kraken[15] = 1 //casing skin
	ammo_bolt_kraken[14] = 1 //durability cost per shot
	ammo_bolt_kraken[13] = 1.25 //damage mod
	ammo_bolt_kraken[12] = 0.33 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_bolt_kraken[11] = 1.6 //Velocity Mod
	ammo_bolt_kraken[10] = 0.8 //ROF mod
	ammo_bolt_kraken[9] = 1.1  //range mod
	ammo_bolt_kraken[8] = exp_bolt_small //explosion array
	ammo_bolt_kraken[7] = "Ammo Descriptions/desc_ammo_bolt_round_kraken.txt"
	ammo_bolt_kraken[6] = "none" //special effects, burning etc
	ammo_bolt_kraken[5] = "bolt_small"
	ammo_bolt_kraken[4] = "physical" //damage type
	ammo_bolt_kraken[3] = "Armor-piercing kraken rounds"
	ammo_bolt_kraken[2] = "none" //contrail
	ammo_bolt_kraken[1] = 0 //fuse sensitivity
	ds_list_add(ListComAM,ammo_bolt_kraken[27]+".ammo_bolt_kraken")

	ammo_bolt_metalstorm[27] = "175.common"
	ammo_bolt_metalstorm[20] = 0.27 //weight per round
	ammo_bolt_metalstorm[19] = "prox100" //fuse type, can be used to define scatterguns
	ammo_bolt_metalstorm[18] = rounds.Orange_Small //projectile skin
	ammo_bolt_metalstorm[17] = "Boltgun Metalstorm Rounds" //Name
	ammo_bolt_metalstorm[16] = 6 //icon sprite subimage
	ammo_bolt_metalstorm[15] = 0 //casing skin
	ammo_bolt_metalstorm[14] = 1 //durability cost per shot
	ammo_bolt_metalstorm[13] = 2 //damage mod
	ammo_bolt_metalstorm[12] = 0 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_bolt_metalstorm[11] = 0.8 //Velocity Mod
	ammo_bolt_metalstorm[10] = 0.7 //ROF mod
	ammo_bolt_metalstorm[9] = 1  //range mod
	ammo_bolt_metalstorm[8] = exp_bolt_small_frag5 //explosion array
	ammo_bolt_metalstorm[7] = "Ammo Descriptions/desc_ammo_bolt_round_metalstorm.txt"
	ammo_bolt_metalstorm[6] = "none" //special effects, burning etc
	ammo_bolt_metalstorm[5] = "bolt_small"
	ammo_bolt_metalstorm[4] = "physical" //damage type
	ammo_bolt_metalstorm[3] = "Proximity-fused fragmentation warheads."
	ammo_bolt_metalstorm[2] = "none" //contrail
	ammo_bolt_metalstorm[1] = 0.5 //fuse sensitivity. detonates when 50% damage has been resisted in this case
	ds_list_add(ListComAM,ammo_bolt_metalstorm[27]+".ammo_bolt_metalstorm")
	
	ammo_bolt_hellfire[27] = "175.common"
	ammo_bolt_hellfire[22] = "ammo" //this is ammo
	ammo_bolt_hellfire[21] = "dumb" //guidance type
	ammo_bolt_hellfire[20] = 0.23 //weight per round
	ammo_bolt_hellfire[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_bolt_hellfire[18] = rounds.Green_Small //projectile skin
	ammo_bolt_hellfire[17] = "Boltgun Hellfire Rounds" //Name
	ammo_bolt_hellfire[16] = 2 //icon sprite subimage
	ammo_bolt_hellfire[15] = 1 //casing skin
	ammo_bolt_hellfire[14] = 1 //durability cost per shot
	ammo_bolt_hellfire[13] = 2.5 //damage mod
	ammo_bolt_hellfire[12] = 0 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_bolt_hellfire[11] = 0.8 //Velocity Mod
	ammo_bolt_hellfire[10] = 1 //ROF mod
	ammo_bolt_hellfire[9] = 1  //range mod
	ammo_bolt_hellfire[8] = exp_bolt_small//explosion array
	ammo_bolt_hellfire[7] = "Ammo Descriptions/desc_ammo_bolt_round_hellfire.txt"
	ammo_bolt_hellfire[6] = "none" //special effects, burning etc
	ammo_bolt_hellfire[5] = "bolt_small"
	ammo_bolt_hellfire[4] = "biohazard" //damage type
	ammo_bolt_hellfire[3] = "Radically increased biohazard damage."
	ammo_bolt_hellfire[2] = "none" //contrail
	ammo_bolt_hellfire[1] = 0.95 //fuse sensitivity
	ds_list_add(ListComAM,ammo_bolt_hellfire[27]+".ammo_bolt_hellfire")

	/*
	ammo_bolt_dragonfire[12]

	ammo_bolt_vengeance[12]

	ammo_bolt_stalker[12]

	ammo_bolt_psybolt[12]

	ammo_bolt_daemon[12]

	ammo_bolt_tempest[12]

	ammo_bolt_scorpius[12]

	ammo_bolt_banestrike[12]
	*/

	//-----------------------------------------heavy bolters--------------------------------------
	
	ammo_bolt_heavy_standard[27] = "150.common"
	ammo_bolt_heavy_standard[22] = "ammo" //this is ammo
	ammo_bolt_heavy_standard[21] = "dumb" //guidance type
	ammo_bolt_heavy_standard[20] = 0.75 //weight per round
	ammo_bolt_heavy_standard[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_bolt_heavy_standard[18] = rounds.Yellow_Small //projectile skin
	ammo_bolt_heavy_standard[17] = "Heavy Bolter Shells" //Name
	ammo_bolt_heavy_standard[16] = 12 //icon sprite subimage
	ammo_bolt_heavy_standard[15] = 2 //casing skin
	ammo_bolt_heavy_standard[14] = 1 //durability cost per shot
	ammo_bolt_heavy_standard[13] = 1.00 //Damage Mod
	ammo_bolt_heavy_standard[12] = 0.1 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_bolt_heavy_standard[11] = 1 //Velocity Mod
	ammo_bolt_heavy_standard[10] = 1.00 //ROF mod
	ammo_bolt_heavy_standard[9] = 1.00  //range mod
	ammo_bolt_heavy_standard[8] = exp_bolt_small //explosion array
	ammo_bolt_heavy_standard[7] = "Ammo Descriptions/desc_ammo_bolt_shell_standard.txt"
	ammo_bolt_heavy_standard[6] = "none" //special effects, burning etc
	ammo_bolt_heavy_standard[5] = "bolt_large"
	ammo_bolt_heavy_standard[4] =  "physical" //damage type
	ammo_bolt_heavy_standard[3] = "Standard heavy bolt shells"
	ammo_bolt_heavy_standard[2] =  "none" //contrail
	ammo_bolt_heavy_standard[1] = 0 //fuse sensitivity
	ds_list_add(ListComAM,ammo_bolt_heavy_standard[27]+".ammo_bolt_heavy_standard")
	
	//-----------------------------------------missile weapons--------------------------------------
	
	ammo_missile_krak[27] = "175.common" //this is ammo
	ammo_missile_krak[22] = "ammo" //this is ammo
	ammo_missile_krak[21] = "laser" //guidance type
	ammo_missile_krak[20] = 6 //weight per round
	ammo_missile_krak[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_missile_krak[18] = 10 //projectile skin
	ammo_missile_krak[17] = "Missile, Krak Warhead" //Name
	ammo_missile_krak[16] = 14 //icon sprite subimage
	ammo_missile_krak[15] = "none"
	ammo_missile_krak[14] = 5 //durability cost per shot
	ammo_missile_krak[13] = 1 //dmg mod
	ammo_missile_krak[12] = 0.75 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_missile_krak[11] = 1 //Velocity Mod
	ammo_missile_krak[10] = 1.00 //ROF mod
	ammo_missile_krak[9] = 1.00  //range mod
	ammo_missile_krak[8] = exp_scalable_frag_small //explosion array
	ammo_missile_krak[7] = "Ammo Descriptions/desc_ammo_missile_krak.txt"
	ammo_missile_krak[6] = "none" //special effects, burning etc
	ammo_missile_krak[5] = "missile_small"
	ammo_missile_krak[4] = "physical"
	ammo_missile_krak[3] = "Shaped charge anti-tank missiles"
	ammo_missile_krak[2] = ctrail_small1 //contrail, if we have one
	ammo_missile_krak[1] = 0.999 //fuse setting, hp percent to trigger kaboom (0 = no fuse, destroyed when outta HP)
	ds_list_add(ListComAM,ammo_missile_krak[27]+".ammo_missile_krak")
	
	//-----------------------------------------plasma weapons--------------------------------------
	
	ammo_plasma_standard[27] = "250.common"
	ammo_plasma_standard[22] = "ammo" //this is ammo
	ammo_plasma_standard[21] = "dumb" //guidance type
	ammo_plasma_standard[20] = 0.05 //weight per round
	ammo_plasma_standard[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_plasma_standard[18] = rounds.Blue_Small //projectile skin
	ammo_plasma_standard[17] = "Plasma Fuel" //Name
	ammo_plasma_standard[16] = 14 //icon sprite subimage
	ammo_plasma_standard[15] = "none"
	ammo_plasma_standard[14] = 4 //durability cost per shot
	ammo_plasma_standard[13] = 1.00 //Damage Mod
	ammo_plasma_standard[12] = 2 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_plasma_standard[11] = 1 //Velocity Mod
	ammo_plasma_standard[10] = 1.00 //ROF mod
	ammo_plasma_standard[9] = 1.00  //range mod
	ammo_plasma_standard[8] = exp_bolt_small //explosion array
	ammo_plasma_standard[7] = "Ammo Descriptions/desc_ammo_plasma_standard.txt"
	ammo_plasma_standard[6] = "none" //special effects, burning etc
	ammo_plasma_standard[5] = "plasma_small"
	ammo_plasma_standard[4] = "thermal"
	ammo_plasma_standard[3] = "Standard flasks of plasma fuel"
	ammo_plasma_standard[2] = "none" //contrails
	ammo_plasma_standard[1] = 0 //fuse setting
	ds_list_add(ListComAM,ammo_plasma_standard[27]+".ammo_plasma_standard")

	//+++++++++++++++++++++++++++++++++++++++++++++++ Auto/Stub Weapons ++++++++++++++++++++++++++++++++++++++++++++
	
	ammo_autocannon_standard[27] = "75.common" //this is ammo
	ammo_autocannon_standard[22] = "ammo" //this is ammo
	ammo_autocannon_standard[21] = "dumb" //guidance type
	ammo_autocannon_standard[20] = 2.5 //weight per round
	ammo_autocannon_standard[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_autocannon_standard[18] = rounds.Yellow_Small //projectile skin
	ammo_autocannon_standard[17] = "Autocannon Shells" //Name
	ammo_autocannon_standard[16] = 15 //icon sprite subimage
	ammo_autocannon_standard[15] = 3//casing skin
	ammo_autocannon_standard[14] = 1 //durability cost per shot
	ammo_autocannon_standard[13] = 1.00 //damage mod
	ammo_autocannon_standard[12] = 0.1 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_autocannon_standard[11] = 1 //Velocity Mod
	ammo_autocannon_standard[10] = 1.00 //ROF mod
	ammo_autocannon_standard[9] = 1.00  //range mod
	ammo_autocannon_standard[8] = exp_bolt_small //explosion array
	ammo_autocannon_standard[7] = "Ammo Descriptions/desc_ammo_autocannon_standard.txt"
	ammo_autocannon_standard[6] = "none" //special effects, burning etc
	ammo_autocannon_standard[5] = "autocannon" //ammo type
	ammo_autocannon_standard[4] = "physical" //damage type
	ammo_autocannon_standard[3] = "Standard autocannon slugs"
	ammo_autocannon_standard[2] = "none" //contrails
	ammo_autocannon_standard[1] = 0 //fuse setting
	ds_list_add(ListComAM,ammo_autocannon_standard[27]+".ammo_autocannon_standard")
	
	ammo_autocannon_hvap[27] = "100.common" //this is ammo
	ammo_autocannon_hvap[22] = "ammo" //this is ammo
	ammo_autocannon_hvap[21] = "dumb" //guidance type
	ammo_autocannon_hvap[20] = 2.5 //weight per round
	ammo_autocannon_hvap[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_autocannon_hvap[18] = rounds.Yellow_Small //projectile skin
	ammo_autocannon_hvap[17] = "Autocannon HVAP Shells" //Name
	ammo_autocannon_hvap[16] = 18 //icon sprite subimage
	ammo_autocannon_hvap[15] = 3//casing skin
	ammo_autocannon_hvap[14] = 1 //durability cost per shot
	ammo_autocannon_hvap[13] = 1.00 //damage mod
	ammo_autocannon_hvap[12] = 0.6 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_autocannon_hvap[11] = 1.1 //Velocity Mod
	ammo_autocannon_hvap[10] = 1.00 //ROF mod
	ammo_autocannon_hvap[9] = 1.00  //range mod
	ammo_autocannon_hvap[8] = exp_bolt_small //explosion array
	ammo_autocannon_hvap[7] = "Ammo Descriptions/desc_ammo_autocannon_hvap.txt"
	ammo_autocannon_hvap[6] = "none" //special effects, burning etc
	ammo_autocannon_hvap[5] = "autocannon" //ammo type
	ammo_autocannon_hvap[4] = "physical" //damage type
	ammo_autocannon_hvap[3] = "Hypervelocity armor-piercing rounds"
	ammo_autocannon_hvap[2] = "none" //contrails
	ammo_autocannon_hvap[1] = 0 //fuse setting
	ds_list_add(ListComAM,ammo_autocannon_hvap[27]+".ammo_autocannon_hvap")
	
	ammo_autocannon_sabot[27] = "100.common" //this is ammo
	ammo_autocannon_sabot[20] = 2.25 //weight per round
	ammo_autocannon_sabot[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_autocannon_sabot[18] = rounds.Yellow_Small //projectile skin
	ammo_autocannon_sabot[17] = "Autocannon APFSDS Shells" //Name
	ammo_autocannon_sabot[16] = 19 //icon sprite subimage
	ammo_autocannon_sabot[15] = 3//casing skin
	ammo_autocannon_sabot[14] = 1 //durability cost per shot
	ammo_autocannon_sabot[13] = 1.1 //damage mod
	ammo_autocannon_sabot[12] = 1 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_autocannon_sabot[11] = 1.2 //Velocity Mod
	ammo_autocannon_sabot[10] = 0.9 //ROF mod
	ammo_autocannon_sabot[9] = 1.00  //range mod
	ammo_autocannon_sabot[8] = exp_bolt_small //explosion array
	ammo_autocannon_sabot[7] = "Ammo Descriptions/desc_ammo_autocannon_sabot.txt"
	ammo_autocannon_sabot[6] = "none" //special effects, burning etc
	ammo_autocannon_sabot[5] = "autocannon" //ammo type
	ammo_autocannon_sabot[4] = "physical" //damage type
	ammo_autocannon_sabot[3] = "Sabot-discarding autocannon rounds"
	ammo_autocannon_sabot[2] = "none" //contrails
	ammo_autocannon_sabot[1] = 0 //fuse setting
	ds_list_add(ListComAM,ammo_autocannon_sabot[27]+".ammo_autocannon_sabot")

	ammo_autocannon_flak[27] = "100.common" //this is ammo
	ammo_autocannon_flak[20] = 2.75 //weight per round
	ammo_autocannon_flak[19] = "prox130" //fuse type, can be used to define scatterguns
	ammo_autocannon_flak[18] = rounds.Yellow_Small //projectile skin
	ammo_autocannon_flak[17] = "Autocannon Flak Shells" //Name
	ammo_autocannon_flak[16] = 16 //icon sprite subimage
	ammo_autocannon_flak[15] = 3//casing skin
	ammo_autocannon_flak[14] = 1 //durability cost per shot
	ammo_autocannon_flak[13] = 3 //damage mod
	ammo_autocannon_flak[12] = 0 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_autocannon_flak[11] = 1 //Velocity Mod
	ammo_autocannon_flak[10] = 1.00 //ROF mod
	ammo_autocannon_flak[9] = 1.00  //range mod
	ammo_autocannon_flak[8] = exp_scalable_frag_tiny//exp_bolt_small_frag20//explosion array
	ammo_autocannon_flak[7] = "Ammo Descriptions/desc_ammo_autocannon_flak.txt"
	ammo_autocannon_flak[6] = "none" //special effects, burning etc
	ammo_autocannon_flak[5] = "autocannon" //ammo type
	ammo_autocannon_flak[4] = "physical" //damage type
	ammo_autocannon_flak[3] = "Airbursts when near enemies"
	ammo_autocannon_flak[2] = "none"
	ammo_autocannon_flak[1] = 0.999 //fuse setting
	ds_list_add(ListComAM,ammo_autocannon_flak[27]+".ammo_autocannon_flak")
	
	ammo_autocannon_highex[27] = "100.common" //this is ammo
	ammo_autocannon_highex[22] = "ammo" //this is ammo
	ammo_autocannon_highex[21] = "dumb" //guidance type
	ammo_autocannon_highex[20] = 2.3 //weight per round
	ammo_autocannon_highex[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_autocannon_highex[18] = rounds.Yellow_Small //projectile skin
	ammo_autocannon_highex[17] = "Autocannon HE Shells" //Name
	ammo_autocannon_highex[16] = 20 //icon sprite subimage
	ammo_autocannon_highex[15] = 3//casing skin
	ammo_autocannon_highex[14] = 1 //durability cost per shot
	ammo_autocannon_highex[13] = 2 //damage mod
	ammo_autocannon_highex[12] = -2.5 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_autocannon_highex[11] = 1 //Velocity Mod
	ammo_autocannon_highex[10] = 1.00 //ROF mod
	ammo_autocannon_highex[9] = 1.00  //range mod
	ammo_autocannon_highex[8] = exp_scalable_frag_tiny //explosion array
	ammo_autocannon_highex[7] = "Ammo Descriptions/desc_ammo_autocannon_highex.txt"
	ammo_autocannon_highex[6] = "none" //special effects, burning etc
	ammo_autocannon_highex[5] = "autocannon" //ammo type
	ammo_autocannon_highex[4] = "physical" //damage type
	ammo_autocannon_highex[3] = "High-explosive autocannon rounds"
	ammo_autocannon_highex[2] = "none"
	ammo_autocannon_highex[1] = 0.999 //fuse setting
	ds_list_add(ListComAM,ammo_autocannon_highex[27]+".ammo_autocannon_highex")

	ammo_auto_ball[27] = "000.common" //this is ammo
	ammo_auto_ball[22] = "ammo" //this is ammo
	ammo_auto_ball[21] = "dumb" //guidance type
	ammo_auto_ball[20] = 0.04 //weight per round
	ammo_auto_ball[19] = "impact" //fuse type, can be used to define scatterguns
	ammo_auto_ball[18] = rounds.Yellow_Small //projectile skin
	ammo_auto_ball[17] = "Autogun Ball Rounds" //Name
	ammo_auto_ball[16] = 17 //icon sprite subimage
	ammo_auto_ball[15] = 4//casing skin
	ammo_auto_ball[14] = 0.25 //durability cost per shot
	ammo_auto_ball[13] = 1 //damage mod
	ammo_auto_ball[12] = 0 //penetration factor, as percent of damage dealt (50 dmg * 0.2 pen = 10 resist ignored)
	ammo_auto_ball[11] = 1 //Velocity Mod
	ammo_auto_ball[10] = 1.00 //ROF mod
	ammo_auto_ball[9] = 1.00  //range mod
	ammo_auto_ball[8] = exp_bolt_small//explosion array
	ammo_auto_ball[7] = "Ammo Descriptions/desc_ammo_auto_ball.txt"
	ammo_auto_ball[6] = "none" //special effects, burning etc
	ammo_auto_ball[5] = "autogun" //ammo type
	ammo_auto_ball[4] = "physical" //damage type
	ammo_auto_ball[3] = "Standard autogun ball rounds"
	ammo_auto_ball[2] = "none"
	ammo_auto_ball[1] = 0 //fuse setting
	ds_list_add(ListComAM,ammo_auto_ball[27]+".ammo_auto_ball")
	
	ammo_auto_ball1 = 
	{
		ROF : 20
	}
	
}
