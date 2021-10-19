
//++++++++++++++++++++++++++++++++++++++ WEIGHT CALCULATION +++++++++++++++++++++++++++++++++++++++++++

var CheckWeight = WeightCount = 0 //or timer_tick(WeightTimer,false) 
if(CheckWeight) {WeightCount = 0  InvWeightAdder = 0}

while(WeightCount < inventory_size-1) {
	InvWeightAdder += ds_grid_get(inventory,WeightCount,1)*ds_grid_get(inventory,WeightCount,2)
	InvWeightAdder += ds_grid_get(grd_inv_ammo,WeightCount,1)*ds_grid_get(grd_inv_ammo,WeightCount,2)
	InvWeightAdder += ds_grid_get(grd_inv_armor,WeightCount,1)
	InvWeightAdder += ds_grid_get(grd_inv_aid,WeightCount,1)*ds_grid_get(grd_inv_aid,WeightCount,2)
	WeightCount += 1
}

	var Powered = obj_player.powered
	if(is_array(obj_player.armor_head_item)) {var Head = obj_player.armor_head_item[20]*Powered} else{var Head = 0}
	if(is_array(obj_player.armor_torso_item)) {var Torso = obj_player.armor_torso_item[20]*Powered} else{var Torso = 0}
	if(is_array(obj_player.armor_armL_item)) {var ArmL = obj_player.armor_armL_item[20]*Powered} else{var ArmL = 0}
	if(is_array(obj_player.armor_armR_item)) {var ArmR = obj_player.armor_armR_item[20]*Powered} else{var ArmR = 0}
	if(is_array(obj_player.armor_legL_item)) {var LegL = obj_player.armor_legL_item[20]*Powered} else{var LegL = 0}
	if(is_array(obj_player.armor_legR_item)) {var LegR = obj_player.armor_legR_item[20]*Powered} else{var LegR = 0}


if(WeightCount = inventory_size-1) {
	InvWeight = InvWeightAdder - Head - Torso - ArmL - ArmR - LegL - LegR
	timer_reset(WeightTimer,0)
	}