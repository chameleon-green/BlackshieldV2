function scr_injury_states() {

	var HPhead = hp_body_head/hp_body_head_max
	var HPtorso = hp_body_torso/hp_body_torso_max
	var HPlarm = hp_body_llarm/hp_body_llarm_max
	var HPrarm = hp_body_rarm/hp_body_rarm_max
	var HPlleg = hp_body_lleg/hp_body_lleg_max
	var HPrleg = hp_body_rleg/hp_body_rleg_max	

	var Head_Minor = (ds_list_find_index(AfflictionsList, "head_injured") != -1)
	var Head_Major = (ds_list_find_index(AfflictionsList, "head_injured2") != -1)
	var Head_Severed = (ds_list_find_index(AfflictionsList, "head_severed") != -1)
	var Torso_Minor = (ds_list_find_index(AfflictionsList, "torso_injured") != -1)
	var Torso_Major = (ds_list_find_index(AfflictionsList, "torso_injured2") != -1)
	var Torso_Severed = (ds_list_find_index(AfflictionsList, "torso_severed") != -1)
	var Larm_Minor = (ds_list_find_index(AfflictionsList, "larm_injured") != -1)
	var Larm_Major = (ds_list_find_index(AfflictionsList, "larm_injured2") != -1)
	var Larm_Severed = (ds_list_find_index(AfflictionsList, "larm_severed") != -1)
	var Rarm_Minor = (ds_list_find_index(AfflictionsList, "rarm_injured") != -1)
	var Rarm_Major = (ds_list_find_index(AfflictionsList, "rarm_injured2") != -1)
	var Rarm_Severed = (ds_list_find_index(AfflictionsList, "rarm_severed") != -1)
	var Lleg_Minor = (ds_list_find_index(AfflictionsList, "lleg_injured") != -1)
	var Lleg_Major = (ds_list_find_index(AfflictionsList, "lleg_injured2") != -1)
	var Lleg_Severed = (ds_list_find_index(AfflictionsList, "lleg_severed") != -1)
	var Rleg_Minor = (ds_list_find_index(AfflictionsList, "rleg_injured") != -1)
	var Rleg_Major = (ds_list_find_index(AfflictionsList, "rleg_injured2") != -1)
	var Rleg_Severed = (ds_list_find_index(AfflictionsList, "rleg_severed") != -1)

//++++++++++++++++++++++++++++++++++++++++++++++++++ INJURY STATES ++++++++++++++++++++++++++++++++++++++++

	//------------Head Injuries

	if(HPhead < 0.75 and !Head_Major and !Head_Severed)
		{
		if(!Head_Minor) {ds_list_add(AfflictionsList,"head_injured")}
		}
	if(HPhead < 0.25 and !Head_Severed) 
		{
		if(!Head_Major) {ds_list_add(AfflictionsList,"head_injured2")}
		if(Head_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured"))}
		}
	if(Head_Severed) 
		{
		if(Head_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured2"))}
		if(Head_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured"))}
		}

	//------------Torso Injuries

	if(HPtorso < 0.75 and !Torso_Major and !Torso_Severed)
		{
		if(!Torso_Minor) {ds_list_add(AfflictionsList,"torso_injured")}
		}

	if(HPtorso < 0.25 and !Torso_Severed) 
		{
		if(!Torso_Major) {ds_list_add(AfflictionsList,"torso_injured2")}
		if(Torso_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured"))}
		}
	if(Torso_Severed) 
		{
		if(Torso_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured2"))}
		if(Torso_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured"))}
		}

	//------------- Arm Injuries	

	if(HPlarm < 0.75 and !Larm_Major and !Larm_Severed)
		{
		if(!Larm_Minor) {ds_list_add(AfflictionsList,"larm_injured")}
		}
	if(HPlarm < 0.25 and !Larm_Severed) 
		{
		if(!Larm_Major) {ds_list_add(AfflictionsList,"larm_injured2")}
		if(Larm_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured"))}
		}
	if(Larm_Severed) 
		{
		if(Larm_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured2"))}
		if(Larm_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured"))}
		}

	if(HPrarm < 0.75 and !Rarm_Major and !Rarm_Severed)
		{
		if(!Rarm_Minor) {ds_list_add(AfflictionsList,"rarm_injured")}
		}
	if(HPrarm < 0.25 and !Rarm_Severed) 
		{
		if(!Rarm_Major) {ds_list_add(AfflictionsList,"rarm_injured2")}
		if(Rarm_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured"))}
		}
	if(Rarm_Severed) 
		{
		if(Rarm_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured2"))}
		if(Rarm_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured"))}
		}

	//------------- Leg Injuries	

	if(HPlleg < 0.75 and !Lleg_Major and !Lleg_Severed)
		{
		if(!Lleg_Minor) {ds_list_add(AfflictionsList,"lleg_injured")}
		}
	if(HPlleg < 0.25 and !Lleg_Severed) 
		{
		if(!Lleg_Major) {ds_list_add(AfflictionsList,"lleg_injured2")}
		if(Lleg_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured"))}
		}
	if(Lleg_Severed) 
		{
		if(Lleg_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured2"))}
		if(Lleg_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured"))}
		}
	
	if(HPrleg < 0.75 and !Rleg_Major and !Rleg_Severed)
		{
		if(!Rleg_Minor) {ds_list_add(AfflictionsList,"rleg_injured")}
		}
	if(HPrleg < 0.25 and !Rleg_Severed) 
		{
		if(!Rleg_Major) {ds_list_add(AfflictionsList,"rleg_injured2")}
		if(Rleg_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured"))}
		}
	if(Rleg_Severed) 
		{
		if(Rleg_Major) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured2"))}
		if(Rleg_Minor) 
		{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured"))}
		}



}
