// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_equip_armor_initial()
{

//HEAD
var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_head")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_head")
	armor_head_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	head_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_head_item = undefined head_id = -1}

//TORSO
var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_torso")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_torso")
	armor_torso_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	torso_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_torso_item = undefined torso_id = -1}

//ARMS
var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_armL")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_armL")
	armor_armL_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	armL_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_armL_item = undefined armL_id = -1}

var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_armR")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_armR")
	armor_armR_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	armR_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_armR_item = undefined armR_id = -1}

//LEGS
var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_legL")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_legL")
	armor_legL_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	legL_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_legL_item = undefined legL_id = -1}

var Valid = ds_grid_value_exists(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_legR")
if(Valid) 
	{
	var xx = ds_grid_value_x(obj_ic.grd_inv_armor,0,0,obj_ic.inventory_size,11,"armor_legR")
	armor_legR_item = ds_grid_get(obj_ic.grd_inv_armor,xx,0)
	legR_id = ds_grid_get(obj_ic.grd_inv_armor,xx,9)
	}
else {armor_legR_item = undefined legR_id = -1}

}