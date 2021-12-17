function scr_player_afflictions_monitor(){

	//++++++++++++++++++++++++++++++++++ DEFINE VARIABLES
	LegsCrippled = 0

	//REMEMBER TO UPDATE PTG COUNT WHEN MAKING NEW PERKS!!!!11111
	//PTG COUNT = 17 (200 max defined in obj_player create)
	var Minor_Head = ds_list_find_index(AfflictionsList, "head_injured") != -1
	var Major_Head = ds_list_find_index(AfflictionsList, "head_injured2") != -1
	var Severed_Head = ds_list_find_index(AfflictionsList, "head_severed") != -1

	var Minor_Torso = ds_list_find_index(AfflictionsList, "torso_injured") != -1
	var Major_Torso = ds_list_find_index(AfflictionsList, "torso_injured2") != -1
	var Severed_Torso = ds_list_find_index(AfflictionsList, "torso_severed") != -1

	var Minor_Larm = ds_list_find_index(AfflictionsList, "larm_injured") != -1
	var Major_Larm = ds_list_find_index(AfflictionsList, "larm_injured2") != -1
	var Severed_Larm = ds_list_find_index(AfflictionsList, "larm_severed") != -1
	var Minor_Rarm = ds_list_find_index(AfflictionsList, "rarm_injured") != -1
	var Major_Rarm = ds_list_find_index(AfflictionsList, "rarm_injured2") != -1
	var Severed_Rarm = ds_list_find_index(AfflictionsList, "rarm_severed") != -1

	var Minor_Lleg = ds_list_find_index(AfflictionsList, "lleg_injured") != -1
	var Major_Lleg = ds_list_find_index(AfflictionsList, "lleg_injured2") != -1
	var Severed_Lleg = ds_list_find_index(AfflictionsList, "lleg_severed") != -1
	var Minor_Rleg = ds_list_find_index(AfflictionsList, "rleg_injured") != -1
	var Major_Rleg = ds_list_find_index(AfflictionsList, "rleg_injured2") != -1
	var Severed_Rleg = ds_list_find_index(AfflictionsList, "rleg_severed") != -1

	//++++++++++++++++++++++++++++++++++ HEAD INJURIES +++++++++++++++++++++++++++++++++++++++++++++++++++

	if(!Minor_Head){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[15] = 0) {ptg[15] = 1 modPER += 10 modINT += 10 modWIL += 10} 
			//if the perk did not do damage, simply key the toggle
			ptg[15] = 1
		}
	if(Minor_Head) {if(ptg[15] = 1) {ptg[15] = 0 modPER -= 10 modINT -= 10 modWIL -= 10}}
	
	if(!Major_Head){
			if(ptg[16] = 0) {ptg[16] = 1 modPER += 20 modINT += 20 modWIL += 25}
			ptg[16] = 1
		}
	if(Major_Head) {if(ptg[16] = 1) {ptg[16] = 0 modPER -= 20 modINT -= 20 modWIL -= 25}}

	if(!Severed_Head){
			if(ptg[17] = 0) {ptg[17] = 1 modEND += baseEND}
			ptg[17] = 1
		}
	if(Severed_Head){	
			//skeleton stuff here
			//armsCrippled = 1
			if(ptg[17] = 1) {ptg[17] = 0 modEND -= baseEND}
		}

	//++++++++++++++++++++++++++++++++++ TORSO INJURIES +++++++++++++++++++++++++++++++++++++++++++++++++++

	if(!Minor_Torso){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[12] = 0) {ptg[12] = 1 modSTR += 10 modEND += 15} 
			//if the perk did not do damage, simply key the toggle
			ptg[12] = 1
		}
	if(Minor_Torso) {if(ptg[12] = 1) {ptg[12] = 0 modSTR -= 10 modEND -= 15}}
	
	if(!Major_Torso){
			if(ptg[13] = 0) {ptg[13] = 1 modSTR += 15 modEND += 30 modAGI += 15}
			ptg[13] = 1
		}
	if(Major_Torso) {if(ptg[13] = 1) {ptg[13] = 0 modSTR -= 15 modEND -= 30 modAGI -= 15}}

	if(!Severed_Torso){
			if(ptg[14] = 0) {ptg[14] = 1 modEND += baseEND}
			ptg[14] = 1
		}
	if(Severed_Torso){	
			//skeleton stuff here
			//armsCrippled = 1
			if(ptg[14] = 1) {ptg[14] = 0 modEND -= baseEND}
		}
	
	
	//++++++++++++++++++++++++++++++++++ ARM INJURIES +++++++++++++++++++++++++++++++++++++++++++++++++++

	//------------------- left arm

	if(!Minor_Larm){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[6] = 0) {ptg[6] = 1 modSTR += 10} 
			//if the perk did not do damage, simply key the toggle
			ptg[6] = 1
		}
	if(Minor_Larm) {if(ptg[6] = 1) {ptg[6] = 0 modSTR -= 10}}
	
	if(!Major_Larm){
			if(ptg[7] = 0) {ptg[7] = 1 modSTR += 15}
			ptg[7] = 1
		}
	if(Major_Larm) {if(ptg[7] = 1) {ptg[7] = 0 modSTR -= 15}}

	if(!Severed_Larm){
			if(ptg[8] = 0) {ptg[8] = 1 modSTR += baseSTR*0.25}
			ptg[8] = 1
		}
	if(Severed_Larm){	
			//skeleton stuff here
			//armsCrippled = 1
			if(ptg[8] = 1) {ptg[8] = 0 modSTR -= baseSTR*0.25}
		}

	//------------------- right arm

	if(!Minor_Rarm){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[9] = 0) {ptg[9] = 1 modSTR += 10} 
			//if the perk did not do damage, simply key the toggle
			ptg[9] = 1
		}
	if(Minor_Rarm) {if(ptg[9] = 1) {ptg[9] = 0 modSTR -= 10}}
	
	if(!Major_Rarm){
			if(ptg[10] = 0) {ptg[10] = 1 modSTR += 15}
			ptg[10] = 1
		}
	if(Major_Rarm) {if(ptg[10] = 1) {ptg[10] = 0 modSTR -= 15}}

	if(!Severed_Rarm){
			if(ptg[11] = 0) {ptg[11] = 1 modSTR += baseSTR*0.25}
			ptg[11] = 1
		}
	if(Severed_Rarm){	
			//skeleton stuff here
			//armsCrippled = 1
			if(ptg[11] = 1) {ptg[11] = 0 modSTR -= baseSTR*0.25}
		}

	//++++++++++++++++++++++++++++++++++++ LEG INJURIES ++++++++++++++++++++++++++++++++++++++++++++++

	//---------------- Left leg

	if(!Minor_Lleg){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[0] = 0) {ptg[0] = 1 modAGI += baseAGI*0.15} 
			//if the perk did not do damage, simply key the toggle
			ptg[0] = 1
		}
	if(Minor_Lleg) {if(ptg[0] = 1) {ptg[0] = 0 modAGI -= baseAGI*0.15}}
	
	if(!Major_Lleg){
			if(ptg[1] = 0) {ptg[1] = 1 modAGI += baseAGI*0.25 modEND +=10}
			ptg[1] = 1
		}
	if(Major_Lleg) {if(ptg[1] = 1) {ptg[1] = 0 modAGI -= baseAGI*0.25 modEND -=10}}

	if(!Severed_Lleg){
			if(ptg[2] = 0) {ptg[2] = 1 modAGI += baseAGI*0.40 modSTR += 10 modEND +=10}
			ptg[2] = 1
		}
	if(Severed_Lleg){	
			if(is_array(armor_legL_item)) {skeleton_attachment_set("slot_front thigh", "front thigh_amputated")}
			else{skeleton_attachment_set("slot_front thigh", "front thigh_amputated_0000")}
			skeleton_attachment_set("slot_front thigh_trim1", "front thigh_trim_bloody")
			skeleton_attachment_set("slot_front shin", -1)
			skeleton_attachment_set("slot_front knee", -1)
			skeleton_attachment_set("slot_front foot", -1)
			LegsCrippled = 1
			if(ptg[2] = 1) {ptg[2] = 0 modAGI -= baseAGI*0.40 modSTR -= 10 modEND -=10}
		}

	//------------ Right Leg

	if(!Minor_Rleg){
			//this detects if the perk already did damage, and if so removes it when the perk is removed
			if(ptg[3] = 0) {ptg[3] = 1 modAGI += baseAGI*0.15} 
			//if the perk did not do damage, simply key the toggle
			ptg[3] = 1
		}
	if(Minor_Rleg) {if(ptg[3] = 1) {ptg[3] = 0 modAGI -= baseAGI*0.15}}
	
	if(!Major_Rleg){
			if(ptg[4] = 0) {ptg[4] = 1 modAGI += baseAGI*0.25 modEND +=10}
			ptg[4] = 1
		}
	if(Major_Rleg) {if(ptg[4] = 1) {ptg[4] = 0 modAGI -= baseAGI*0.25 modEND -=10}}

	if(!Severed_Rleg){
			if(ptg[5] = 0) {ptg[5] = 1 modAGI += baseAGI*0.40 modSTR += 10 modEND +=10}
			ptg[5] = 1
		}
	if(Severed_Rleg){	
			if(is_array(armor_legR_item)) {skeleton_attachment_set("slot_rear thigh", "rear thigh_amputated")}
			else{skeleton_attachment_set("slot_rear thigh", "rear thigh_amputated_0000")}
			skeleton_attachment_set("slot_rear thigh_trim1", "rear thigh_trim_bloody")
			skeleton_attachment_set("slot_rear shin", -1)
			skeleton_attachment_set("slot_rear knee", -1)
			skeleton_attachment_set("slot_rear foot", -1)
			LegsCrippled = 1
			if(ptg[5] = 1) {ptg[5] = 0 modAGI -= baseAGI*0.40 modSTR -= 10 modEND -=10}
		}
}
