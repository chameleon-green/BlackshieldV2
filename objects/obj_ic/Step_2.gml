
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

if(WeightCount = inventory_size-1) {InvWeight = InvWeightAdder timer_reset(WeightTimer,0)}