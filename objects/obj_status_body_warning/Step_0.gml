col = 0
visible = 1

HasMedKit = (ds_grid_value_exists(obj_ic.grd_inv_aid,0,0,obj_ic.inventory_size,11,obj_vc.med_kit_1)) 
if(HasMedKit) 
{
	xxx = ds_grid_value_x(obj_ic.grd_inv_aid,0,0,obj_ic.inventory_size,11,obj_vc.med_kit_1)
	med_amount = ds_grid_get(obj_ic.grd_inv_aid,xxx,2)
} 

HasRepKit = (ds_grid_value_exists(obj_ic.grd_inv_aid,0,0,obj_ic.inventory_size,11,obj_vc.rep_kit_1)) 
if(HasRepKit) 
{
	rxxx = ds_grid_value_x(obj_ic.grd_inv_aid,0,0,obj_ic.inventory_size,11,obj_vc.rep_kit_1)
	rep_amount = ds_grid_get(obj_ic.grd_inv_aid,rxxx,2)
} 


if(obj_ic.visible = 0 or obj_ic.screen != "status") 
	{
		instance_destroy(self)	
	}