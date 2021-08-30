function scr_aid_init() {
	AID_DEBUG[23] = "Medical Descriptions/desc_med_somatogen.txt"
	AID_DEBUG[22] = "med" //type of aid
	AID_DEBUG[21] = "sets you on fire" //name of item
	AID_DEBUG[20] = 0.5 //mass of aid
	AID_DEBUG[19] = 0 //subimage for UI use (upscaled)
	AID_DEBUG[18] = 1 //subimage for non-UI use (tiny)
	AID_DEBUG[17] = spr_items_med//sprite index to use
	AID_DEBUG[16] = "BURN.020.001" //MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	AID_DEBUG[15] = "none" //buff #2 type, strength and duration encoded as string
	AID_DEBUG[14] = "none" //buff #3 type, strength and duration encoded as string
	AID_DEBUG[13] = "none" //buff #4 type, strength and duration encoded as string
	AID_DEBUG[12] = ""
	AID_DEBUG[11] = ""
	AID_DEBUG[10] = ""
	AID_DEBUG[9] = 900 //base cost

	med_shot_hp[23] = "Medical Descriptions/desc_med_somatogen.txt"
	med_shot_hp[22] = "med" //type of aid
	med_shot_hp[21] = "Somatogen" //name of item
	med_shot_hp[20] = 0.5 //mass of aid
	med_shot_hp[19] = 0 //subimage for UI use (upscaled)
	med_shot_hp[18] = 1 //subimage for non-UI use (tiny)
	med_shot_hp[17] = spr_items_med//sprite index to use
	med_shot_hp[16] = "HPHeal.010.060" //60 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	med_shot_hp[15] = "ENDInc.010.060" //buff #2 type, strength and duration encoded as string
	med_shot_hp[14] = "none" //buff #3 type, strength and duration encoded as string
	med_shot_hp[13] = "none" //buff #4 type, strength and duration encoded as string
	med_shot_hp[12] = ""
	med_shot_hp[11] = ""
	med_shot_hp[10] = ""
	med_shot_hp[9] = 1000 //base cost

	med_shot_stam[23] = "Medical Descriptions/desc_med_satrophine.txt"
	med_shot_stam[22] = "med" //type of aid
	med_shot_stam[21] = "Satrophine" //name of item
	med_shot_stam[20] = 0.5 //mass of aid
	med_shot_stam[19] = 2 //subimage for UI use (upscaled)
	med_shot_stam[18] = 3 //subimage for non-UI use (tiny)
	med_shot_stam[17] = spr_items_med//sprite index to use
	med_shot_stam[16] = "STAHeal.005.030" //30 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	med_shot_stam[15] = "none"//buff #2 type, strength and duration encoded as string
	med_shot_stam[14] = "none" //buff #3 type, strength and duration encoded as string
	med_shot_stam[13] = "none" //buff #4 type, strength and duration encoded as string
	med_shot_stam[12] = ""
	med_shot_stam[11] = ""
	med_shot_stam[10] = ""
	med_shot_stam[9] = 1200 //base cost

	med_shot_will[23] = "Medical Descriptions/desc_med_amylladox.txt"
	med_shot_will[22] = "med" //type of aid
	med_shot_will[21] = "Amylladox" //name of item
	med_shot_will[20] = 0.5 //mass of aid
	med_shot_will[19] = 4 //subimage for UI use (upscaled)
	med_shot_will[18] = 5 //subimage for non-UI use (tiny)
	med_shot_will[17] = spr_items_med//sprite index to use
	med_shot_will[16] = "WILHeal.003.030" //30 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	med_shot_will[15] = "none"//buff #2 type, strength and duration encoded as string
	med_shot_will[14] = "none" //buff #3 type, strength and duration encoded as string
	med_shot_will[13] = "none" //buff #4 type, strength and duration encoded as string
	med_shot_will[12] = ""
	med_shot_will[11] = ""
	med_shot_will[10] = ""
	med_shot_will[9] = 900 //base cost

	med_kit_1[23] = "Medical Descriptions/desc_med_kit_1.txt"
	med_kit_1[22] = "med" //type of aid
	med_kit_1[21] = "Medikit" //name of item
	med_kit_1[20] = 5 //mass of aid
	med_kit_1[19] = 6 //subimage for UI use (upscaled)
	med_kit_1[18] = 7 //subimage for non-UI use (tiny)
	med_kit_1[17] = spr_items_med//sprite index to use
	med_kit_1[16] = "HPHeal.050.001" //30 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	med_kit_1[15] = "none"//buff #2 type, strength and duration encoded as string
	med_kit_1[14] = "none" //buff #3 type, strength and duration encoded as string
	med_kit_1[13] = "none" //buff #4 type, strength and duration encoded as string
	med_kit_1[12] = ""
	med_kit_1[11] = ""
	med_kit_1[10] = ""
	med_kit_1[9] = 900 //base cost

	frenzon_pure[23] = "Medical Descriptions/desc_med_frenzon.txt"
	frenzon_pure[22] = "med" //type of aid
	frenzon_pure[21] = "Frenzon" //name of item
	frenzon_pure[20] = 5 //mass of aid
	frenzon_pure[19] = 8 //subimage for UI use (upscaled)
	frenzon_pure[18] = 8 //subimage for non-UI use (tiny)
	frenzon_pure[17] = spr_items_med//sprite index to use
	frenzon_pure[16] = "Frenzied.010.060" //30 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	frenzon_pure[15] = "none"
	frenzon_pure[14] = "none"
	frenzon_pure[13] = "none"
	frenzon_pure[12] = ""
	frenzon_pure[11] = ""
	frenzon_pure[10] = ""
	frenzon_pure[9] = 900 //base cost

	rep_kit_1[23] = "Medical Descriptions/desc_rep_kit_1.txt"
	rep_kit_1[22] = "med" //type of aid
	rep_kit_1[21] = "Repair Kit" //name of item
	rep_kit_1[20] = 10 //mass of aid
	rep_kit_1[19] = 9 //subimage for UI use (upscaled)
	rep_kit_1[18] = 9 //subimage for non-UI use (tiny)
	rep_kit_1[17] = spr_items_med//sprite index to use
	rep_kit_1[16] = "none" //30 MAKE SURE THESE ARE UNIQUE BETWEEN ITEMS, ACTS AS ID buff #1 type, strength and duration encoded as string
	rep_kit_1[15] = "none"
	rep_kit_1[14] = "none"
	rep_kit_1[13] = "none"
	rep_kit_1[12] = ""
	rep_kit_1[11] = ""
	rep_kit_1[10] = ""
	rep_kit_1[9] = 1200 //base cost

}
