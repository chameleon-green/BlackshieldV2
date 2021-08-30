function scr_armor_init() {
	//++++++++++++++++++++++++++++++++++++++++++++ MKII POWER ARMOR ++++++++++++++++++++++++++++++++++++++++++++

	armor_torso_2000[26] = "2000_pelvis" //backpack trim slot
	armor_torso_2000[25] = "2000_backpack trim" //backpack trim slot
	armor_torso_2000[24] = "2000_backpack" //backpack slot
	armor_torso_2000[23] = "2000_collar" //collar slot
	armor_torso_2000[22] = "armor_torso" //what is this?
	armor_torso_2000[21] = "Armor Descriptions/desc_armor_mk2cuirass.txt"
	armor_torso_2000[20] = 30 //weight of item
	armor_torso_2000[19] = 15 //heat dissipation, max
	armor_torso_2000[18] = 15 //power/heat generation, max at 100% output (also heat generation)
	armor_torso_2000[17] = "SPECIAL"
	armor_torso_2000[16] = "SPECIAL"
	armor_torso_2000[15] = 10 //poise
	armor_torso_2000[14] = 1000 //maximum durability
	armor_torso_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_torso_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_torso_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_torso_2000[10] = 0 //warp resistance
	armor_torso_2000[9] = 75 //hazmat resistance (NBC, chemicals and diseases)
	armor_torso_2000[8] = 25 //electrical resistance 
	armor_torso_2000[7] = 25 //radioactive resistance
	armor_torso_2000[6] = 50 //corrosive resistance (acid)
	armor_torso_2000[5] = 10 //cryo resistance
	armor_torso_2000[4] = 55 //thermal resistance
	armor_torso_2000[3] = 45 //physical resistance
	armor_torso_2000[2] =  1 //inventory sprite subimage
	armor_torso_2000[1] = "2000_torso" //attachment name for skeleton 
	armor_torso_2000[0] = "MKII 'Crusade' Pattern Cuirass" //name

	armor_head_2000[23] = "2000_eyes" //eye slot
	armor_head_2000[22] = "armor_head" //what is this?
	armor_head_2000[21] = "Armor Descriptions/desc_armor_mk2helm.txt"
	armor_head_2000[20] = 5 //weight of item
	armor_head_2000[19] = 1 //heat dissipation, max
	armor_head_2000[18] = 1 //power/heat generation, max at 100% output (also heat generation)
	armor_head_2000[17] = 500 //sensor range +++++++++++++++++++++++++++++++
	armor_head_2000[16] = 30 //autosense cone ++++++++++++++++++++++++++++++
	armor_head_2000[15] = 2 //poise
	armor_head_2000[14] = 400 //maximum durability
	armor_head_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_head_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_head_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_head_2000[10] = 0 //warp resistance
	armor_head_2000[9] = 10 //hazmat resistance (NBC, chemicals and diseases)
	armor_head_2000[8] = 3 //electrical resistance 
	armor_head_2000[7] = 3 //radioactive resistance
	armor_head_2000[6] = 7 //corrosive resistance (acid)
	armor_head_2000[5] = 2 //cryo resistance
	armor_head_2000[4] = 35 //thermal resistance
	armor_head_2000[3] = 20 //physical resistance
	armor_head_2000[2] = 0 //inventory sprite subimage
	armor_head_2000[1] = "2000_head" //attachment name for skeleton 
	armor_head_2000[0] = "MKII 'Crusade' Pattern Helm" //name

	armor_armL_2000[24] = "front hand" //hand sprite
	armor_armL_2000[23] = "2000_front forearm" //forearm sprite
	armor_armL_2000[22] = "armor_armL" //what is this?
	armor_armL_2000[21] = "Armor Descriptions/desc_armor_mk2vambrace.txt"
	armor_armL_2000[20] = 10 //weight of item
	armor_armL_2000[19] = 2 //heat dissipation, max
	armor_armL_2000[18] = 2 //power/heat generation, max at 100% output (also heat generation)
	armor_armL_2000[17] = "SPECIAL"
	armor_armL_2000[16] = "SPECIAL"
	armor_armL_2000[15] = 5 //poise
	armor_armL_2000[14] = 500 //maximum durability
	armor_armL_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_armL_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_armL_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_armL_2000[10] = 0 //warp resistance
	armor_armL_2000[9] = 30 //hazmat resistance (NBC, chemicals and diseases)
	armor_armL_2000[8] = 12 //electrical resistance 
	armor_armL_2000[7] = 12 //radioactive resistance
	armor_armL_2000[6] = 25 //corrosive resistance (acid)
	armor_armL_2000[5] = 5 //cryo resistance
	armor_armL_2000[4] = 40 //thermal resistance
	armor_armL_2000[3] = 25 //physical resistance
	armor_armL_2000[2] = 2//inventory sprite subimage
	armor_armL_2000[1] = "2000_pauldron trim" //attachment name for skeleton 
	armor_armL_2000[0] = "MKII 'Crusade' Pattern Left Vambrace" //name

	armor_armR_2000[24] = "holding hand" //hand sprite
	armor_armR_2000[23] = "rear forearm" //forearm sprite
	armor_armR_2000[22] = "armor_armR" //what is this?
	armor_armR_2000[21] = "Armor Descriptions/desc_armor_mk2vambrace.txt"
	armor_armR_2000[20] = 10 //weight of item
	armor_armR_2000[19] = 2 //heat dissipation, max
	armor_armR_2000[18] = 2 //power/heat generation, max at 100% output (also heat generation)
	armor_armR_2000[17] = "SPECIAL"
	armor_armR_2000[16] = "SPECIAL"
	armor_armR_2000[15] = 5 //poise
	armor_armR_2000[14] = 500 //maximum durability
	armor_armR_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_armR_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_armR_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_armR_2000[10] = 0 //warp resistance
	armor_armR_2000[9] = 30 //hazmat resistance (NBC, chemicals and diseases)
	armor_armR_2000[8] = 12 //electrical resistance 
	armor_armR_2000[7] = 12 //radioactive resistance
	armor_armR_2000[6] = 25 //corrosive resistance (acid)
	armor_armR_2000[5] = 5 //cryo resistance
	armor_armR_2000[4] = 40 //thermal resistance
	armor_armR_2000[3] = 25 //physical resistance
	armor_armR_2000[2] = 2 //inventory sprite subimage
	armor_armR_2000[1] = "" //attachment name for skeleton 
	armor_armR_2000[0] = "MKII 'Crusade' Pattern Right Vambrace" //name
	armor_legL_2000[22] = "armor_legL" //what is this?


	armor_legL_2000[27] = "2000_thigh_trim"
	armor_legL_2000[26] = "2000_thigh"
	armor_legL_2000[25] = "2000_knee"
	armor_legL_2000[24] = "2000_shin"
	armor_legL_2000[23] = "2000_foot"
	armor_legL_2000[22] = "armor_legL" //what is this?
	armor_legL_2000[21] = "Armor Descriptions/desc_armor_mk2greave.txt"
	armor_legL_2000[20] = 15 //weight of item
	armor_legL_2000[19] = 4 //heat dissipation, max
	armor_legL_2000[18] = 4 //power/heat generation, max at 100% output (also heat generation)
	armor_legL_2000[17] = "SPECIAL"
	armor_legL_2000[16] = "SPECIAL"
	armor_legL_2000[15] = 8 //poise
	armor_legL_2000[14] = 750 //maximum durability
	armor_legL_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_legL_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_legL_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_legL_2000[10] = 0 //warp resistance
	armor_legL_2000[9] = 40 //hazmat resistance (NBC, chemicals and diseases)
	armor_legL_2000[8] = 15 //electrical resistance 
	armor_legL_2000[7] = 15 //radioactive resistance
	armor_legL_2000[6] = 30 //corrosive resistance (acid)
	armor_legL_2000[5] = 10 //cryo resistance
	armor_legL_2000[4] = 40 //thermal resistance
	armor_legL_2000[3] = 30 //physical resistance
	armor_legL_2000[2] = 3 //inventory sprite subimage
	armor_legL_2000[1] = "" //attachment name for skeleton 
	armor_legL_2000[0] = "MKII 'Crusade' Pattern Left Greave" //name

	armor_legR_2000[26] = "2000_thigh"
	armor_legR_2000[25] = "2000_knee"
	armor_legR_2000[24] = "2000_shin"
	armor_legR_2000[23] = "2000_foot"
	armor_legR_2000[22] = "armor_legR" //what is this?
	armor_legR_2000[21] = "Armor Descriptions/desc_armor_mk2greave.txt"
	armor_legR_2000[20] = 15 //weight of item
	armor_legR_2000[19] = 4 //heat dissipation, max
	armor_legR_2000[18] = 4 //power/heat generation, max at 100% output (also heat generation)
	armor_legR_2000[17] = "SPECIAL"
	armor_legR_2000[16] = "SPECIAL"
	armor_legR_2000[15] = 8 //poise
	armor_legR_2000[14] = 750 //maximum durability
	armor_legR_2000[13] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_legR_2000[12] = "" //+++++++++++++++++++++++++++++ UNUSED
	armor_legR_2000[11] = "power" // type of armor (carapace, flak, power, etc)
	armor_legR_2000[10] = 0 //warp resistance
	armor_legR_2000[9] = 40 //hazmat resistance (NBC, chemicals and diseases)
	armor_legR_2000[8] = 15 //electrical resistance 
	armor_legR_2000[7] = 15 //radioactive resistance
	armor_legR_2000[6] = 30 //corrosive resistance (acid)
	armor_legR_2000[5] = 10 //cryo resistance
	armor_legR_2000[4] = 40 //thermal resistance
	armor_legR_2000[3] = 30 //physical resistance
	armor_legR_2000[2] = 3 //inventory sprite subimage
	armor_legR_2000[1] = "" //attachment name for skeleton 
	armor_legR_2000[0] = "MKII 'Crusade' Pattern Right Greave" //name






}
