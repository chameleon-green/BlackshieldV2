function scr_statusbody_colorcontrol() {



	//+++++++++++++++++++++++++++++++++++++++++++++++++ BODY PART COLORS +++++++++++++++++++++++++++++++++++++++++++++++++
	var aList = obj_player.AfflictionsList

	var HeadSever = ( ds_list_find_index(aList,"head_severed") != -1 )
	var TorsoSever = ( ds_list_find_index(aList,"torso_severed") != -1 )
	var LarmSever = ( ds_list_find_index(aList,"larm_severed") != -1 )
	var RarmSever = ( ds_list_find_index(aList,"rarm_severed") != -1 )
	var LlegSever = ( ds_list_find_index(aList,"lleg_severed") != -1 )
	var RlegSever = ( ds_list_find_index(aList,"rleg_severed") != -1 )

	var InjuredTorso = (ds_list_find_index(aList,"torso_injured") != -1) or (ds_list_find_index(aList,"torso_injured2") != -1)
	var InjuredHead = (ds_list_find_index(aList,"head_injured") != -1) or (ds_list_find_index(aList,"head_injured2") != -1)
	var InjuredLarm = (ds_list_find_index(aList,"larm_injured") != -1) or (ds_list_find_index(aList,"larm_injured2") != -1)
	var InjuredRarm = (ds_list_find_index(aList,"rarm_injured") != -1) or (ds_list_find_index(aList,"rarm_injured2") != -1)
	var InjuredLleg = (ds_list_find_index(aList,"lleg_injured") != -1) or (ds_list_find_index(aList,"lleg_injured2") != -1)
	var InjuredRleg = (ds_list_find_index(aList,"rleg_injured") != -1) or (ds_list_find_index(aList,"rleg_injured2") != -1)

	OAR_Head = 1
	OAR_Torso = 1
	OAR_LArm = 1
	OAR_RArm = 1
	OAR_LLeg = 1
	OAR_RLeg = 1

	if(InjuredHead or HeadSever) {OAR_Head = 0.45} 
	if(InjuredTorso or TorsoSever) {OAR_Torso = 0.45} 
	if(InjuredLarm or LarmSever) {OAR_LArm = 0.45} 
	if(InjuredRarm or RarmSever) {OAR_RArm = 0.45} 
	if(InjuredLleg or LlegSever) {OAR_LLeg = 0.45} 
	if(InjuredRleg or RlegSever) {OAR_RLeg = 0.45} 



	if(HP_Head >= 0.75) {CHead = Yellow}
	if(HP_Head > 0.25 and HP_Head < 0.75) {CHead = Orange}
	if(HP_Head <= 0.25 and !HeadSever) {CHead = Red}
	if(HP_Head <= 0.0 and HeadSever) {CHead = Screen}

	if(HP_Torso >= 0.75) {CTorso = Yellow}
	if(HP_Torso > 0.25 and HP_Torso < 0.75) {CTorso = Orange}
	if(HP_Torso <= 0.25 and !TorsoSever) {CTorso = Red}
	if(HP_Torso <= 0.0 and TorsoSever) {CTorso = Screen}

	if(HP_LArm >= 0.75) {CLArm = Yellow}
	if(HP_LArm > 0.25 and HP_LArm < 0.75) {CLArm = Orange}
	if(HP_LArm <= 0.25 and !LarmSever) {CLArm = Red}
	if(HP_LArm <= 0.0 and LarmSever) {CLArm = Screen}

	if(HP_RArm >= 0.75) {CRArm = Yellow}
	if(HP_RArm > 0.25 and HP_RArm < 0.75) {CRArm = Orange}
	if(HP_RArm <= 0.25 and !RarmSever) {CRArm = Red}
	if(HP_RArm <= 0.0 and RarmSever) {CRArm = Screen}

	if(HP_LLeg >= 0.75) {CLLeg = Yellow}
	if(HP_LLeg > 0.25 and HP_LLeg < 0.75) {CLLeg = Orange}
	if(HP_LLeg <= 0.25 and !LlegSever) {CLLeg = Red}
	if(HP_LLeg <= 0.0 and LlegSever) {CLLeg = Screen}

	if(HP_RLeg >= 0.75) {CRLeg = Yellow}
	if(HP_RLeg > 0.25 and HP_RLeg < 0.75) {CRLeg = Orange}
	if(HP_RLeg <= 0.25 and !RlegSever) {CRLeg = Red}
	if(HP_RLeg <= 0.0 and RlegSever) {CRLeg = Screen}

	//++++++++++++++++++++++++++++++++++++++++++ ARMOR COLORS +++++++++++++++++++++++++++++++++++++++++++++++

	if(AR_Head >= 0.5) {CARHead = Yellow}
	if(AR_Head > 0.25 and AR_Head < 0.5) {CARHead = Orange}
	if(AR_Head > 0 and AR_Head <= 0.25) {CARHead = Red}
	if(AR_Head <= 0) {CARHead = Red OAR_Head = 0}

	if(AR_Torso >= 0.5) {CARTorso = Yellow}
	if(AR_Torso > 0.25 and AR_Torso < 0.5) {CARTorso = Orange}
	if(AR_Torso > 0 and AR_Torso <= 0.25) {CARTorso = Red}
	if(AR_Torso <= 0) {CARTorso = Red OAR_Torso = 0}

	if(AR_LArm >= 0.5) {CARLArm = Yellow}
	if(AR_LArm > 0.25 and AR_LArm < 0.5) {CARLArm = Orange}
	if(AR_LArm > 0 and AR_LArm <= 0.25) {CARLArm = Red}
	if(AR_LArm <= 0) {CARLArm = Red OAR_LArm = 0}

	if(AR_RArm >= 0.5) {CARRArm = Yellow}
	if(AR_RArm > 0.25 and AR_RArm < 0.5) {CARRArm = Orange}
	if(AR_RArm > 0 and AR_RArm <= 0.25) {CARRArm = Red}
	if(AR_RArm <= 0) {CARRArm = Red OAR_RArm = 0}

	if(AR_LLeg >= 0.5) {CARLLeg = Yellow}
	if(AR_LLeg > 0.25 and AR_LLeg < 0.5) {CARLLeg = Orange}
	if(AR_LLeg > 0 and AR_LLeg <= 0.25) {CARLLeg = Red}
	if(AR_LLeg <= 0) {CARLLeg = Red OAR_LLeg = 0}

	if(AR_RLeg >= 0.5) {CARRLeg = Yellow}
	if(AR_RLeg > 0.25 and AR_RLeg < 0.5) {CARRLeg = Orange}
	if(AR_RLeg > 0 and AR_RLeg <= 0.25) {CARRLeg = Red}
	if(AR_RLeg <= 0) {CARRLeg = Red OAR_RLeg = 0}

	//++++++++++++++++++++++++++++++++++++++++++++++++ SHADOW/OUTLINE COLORS ++++++++++++++++++++++++++++++++++++++++++++++++++++

	gpu_set_fog(1,CARTorso,0,0)
	draw_sprite_ext(spr_status_body,0,x+307*scale,y+153*scale,scale,scale,0,CARTorso,255)
	draw_sprite_ext(spr_status_body,0,x+307*scale,y+151*scale,scale,scale,0,CARTorso,255)
	draw_sprite_ext(spr_status_body,0,x+309*scale,y+153*scale,scale,scale,0,CARTorso,255)
	draw_sprite_ext(spr_status_body,0,x+305*scale,y+153*scale,scale,scale,0,CARTorso,255)
	gpu_set_fog(0,c_white,0,0)

	gpu_set_fog(1,CARHead,0,0)
	draw_sprite_ext(spr_status_body,1,x+307*scale,y+106*scale,scale,scale,0,CARHead,255)
	draw_sprite_ext(spr_status_body,1,x+307*scale,y+102*scale,scale,scale,0,CARHead,255)
	draw_sprite_ext(spr_status_body,1,x+309*scale,y+104*scale,scale,scale,0,CARHead,255)
	draw_sprite_ext(spr_status_body,1,x+305*scale,y+104*scale,scale,scale,0,CARHead,255)
	gpu_set_fog(0,c_white,0,0)

	gpu_set_fog(1,CARLArm,0,0)
	draw_sprite_ext(spr_status_body,2,x+247*scale,y+168*scale,scale,scale,0,CARLArm,255)
	draw_sprite_ext(spr_status_body,2,x+247*scale,y+164*scale,scale,scale,0,CARLArm,255)
	draw_sprite_ext(spr_status_body,2,x+249*scale,y+166*scale,scale,scale,0,CARLArm,255)
	draw_sprite_ext(spr_status_body,2,x+245*scale,y+166*scale,scale,scale,0,CARLArm,255)
	gpu_set_fog(0,c_white,0,0)

	gpu_set_fog(1,CARRArm,0,0)
	draw_sprite_ext(spr_status_body,3,x+367*scale,y+168*scale,scale,scale,0,CARRArm,255)
	draw_sprite_ext(spr_status_body,3,x+367*scale,y+164*scale,scale,scale,0,CARRArm,255)
	draw_sprite_ext(spr_status_body,3,x+369*scale,y+166*scale,scale,scale,0,CARRArm,255)
	draw_sprite_ext(spr_status_body,3,x+365*scale,y+166*scale,scale,scale,0,CARRArm,255)
	gpu_set_fog(0,c_white,0,0)

	gpu_set_fog(1,CARLLeg,0,0)
	draw_sprite_ext(spr_status_body,4,x+265*scale,y+277.5*scale,scale,scale,0,CARLLeg,255)
	draw_sprite_ext(spr_status_body,4,x+265*scale,y+273.5*scale,scale,scale,0,CARLLeg,255)
	draw_sprite_ext(spr_status_body,4,x+263*scale,y+275.5*scale,scale,scale,0,CARLLeg,255)
	draw_sprite_ext(spr_status_body,4,x+267*scale,y+275.5*scale,scale,scale,0,CARLLeg,255)
	gpu_set_fog(0,c_white,0,0)

	gpu_set_fog(1,CARRLeg,0,0)
	draw_sprite_ext(spr_status_body,5,x+349*scale,y+277.5*scale,scale,scale,0,CARRLeg,255)	
	draw_sprite_ext(spr_status_body,5,x+349*scale,y+273.5*scale,scale,scale,0,CARRLeg,255)	
	draw_sprite_ext(spr_status_body,5,x+351*scale,y+275.5*scale,scale,scale,0,CARRLeg,255)	
	draw_sprite_ext(spr_status_body,5,x+347*scale,y+275.5*scale,scale,scale,0,CARRLeg,255)	
	gpu_set_fog(0,c_white,0,0)

	//++++++++++++++++++++++++++++++++++++++++++++++++ DRAW DARK BACKGROUND FOR PARTS ++++++++++++++++++++++++++++++++++++++++++++++++++++++

	draw_sprite_ext(spr_status_body,6,x+307*scale,y+153*scale,scale,scale,0,Screen,255)	//draw torso bg
	draw_sprite_ext(spr_status_body,7,x+307*scale,y+104*scale,scale,scale,0,Screen,255)	//draw head	 bg
	draw_sprite_ext(spr_status_body,8,x+247*scale,y+166*scale,scale,scale,0,Screen,255)	//draw LArm bg
	draw_sprite_ext(spr_status_body,9,x+367*scale,y+166*scale,scale,scale,0,Screen,255)	//draw RArm bg
	draw_sprite_ext(spr_status_body,10,x+265*scale,y+275.5*scale,scale,scale,0,Screen,255)	//draw LLeg bg
	draw_sprite_ext(spr_status_body,11,x+349*scale,y+275.5*scale,scale,scale,0,Screen,255)	//draw RLeg bg


}
