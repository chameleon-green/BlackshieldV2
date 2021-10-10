  ///@description itemselected code, buff timers 



//if we have selected something, what is it? Used in equip code
if(global.Selected != undefined){
	var GSelected = global.Selected var GSID = GSelected.unique_id

	if(subscreen_items = "weapons") {item_selected = ds_grid_get(obj_ic.inventory,ds_grid_value_x(obj_ic.inventory,0,0,100,100,GSID),0)}
	else if (subscreen_items = "ammo") {item_selected = ds_grid_get(obj_ic.grd_inv_ammo,ds_grid_value_x(obj_ic.grd_inv_ammo,0,0,100,100,GSID),0)}
	else if (subscreen_items = "armor") {item_selected = ds_grid_get(obj_ic.grd_inv_armor,ds_grid_value_x(obj_ic.grd_inv_armor,0,0,100,100,GSID),0)}
	else if (subscreen_items = "aid") {item_selected = ds_grid_get(obj_ic.grd_inv_aid,ds_grid_value_x(obj_ic.grd_inv_aid,0,0,100,100,GSID),0)}
}
else{item_selected = undefined}

//
CarryWeight = obj_player.CarryWeight

//activate inventory
if(keyboard_check_pressed(vk_tab)) 
	{
	if(!visible) {visible = 1 refresh = 1}
	active +=1 
	draw_items = active //for some reason this doesn't work with the create event
	}
if(active > 1) {active = 0}


//+++++++++++++++++++++++++++++++++++++++++++++ STATUS BODY COLOR STUFF +++++++++++++++++++++++++++++++++

//this is here to allow the mini status body in the hp icon to color itself, as it based on the larger one


if(instance_exists(obj_player))

{
//define colors
Yellow = make_color_rgb(247,191,2)
Orange = make_color_rgb(255,121,0)
Red = make_color_rgb(255,60,40)
Screen = make_color_rgb(40,25,0)
c_outline = make_colour_rgb(192,158,2)
//opacities for various armor parts
OAR_Head = 1
OAR_Torso = 1
OAR_LArm = 1
OAR_RArm = 1
OAR_LLeg = 1
OAR_RLeg = 1
//define player variables locally
HP_Head = obj_player.hp_body_head / obj_player.hp_body_head_max
HP_Torso = obj_player.hp_body_torso / obj_player.hp_body_torso_max
HP_RArm = obj_player.hp_body_rarm / obj_player.hp_body_rarm_max
HP_LArm = obj_player.hp_body_llarm / obj_player.hp_body_llarm_max
HP_RLeg = obj_player.hp_body_rleg / obj_player.hp_body_rleg_max
HP_LLeg = obj_player.hp_body_lleg / obj_player.hp_body_lleg_max
//define player armor variable locally. change to ds_grid values later
AR_Head = obj_player.ar_body_head
AR_Torso = obj_player.ar_body_torso
AR_RArm = obj_player.ar_body_rarm
AR_LArm = obj_player.ar_body_larm
AR_RLeg = obj_player.ar_body_rleg
AR_LLeg = obj_player.ar_body_lleg

//this script draws outlines for armor, and controls colors of parts based on their remaining HP
scr_statusbody_colorcontrol()
}

//+++++++++++++++++++++++++++++++++++++++++++++++ BUFF TIMERS AND CONTROLS ++++++++++++++++++++++++++
scr_ic_buff_timers()


 