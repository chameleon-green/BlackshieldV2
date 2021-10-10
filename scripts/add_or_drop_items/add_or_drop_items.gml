
//last two arguments, prevgrid and uniqueID, are optional and used for tracking ammo in guns


function scr_add_item(item,quantity,durability,grid,inventory_size,prev_grid=undefined,uniqueID=undefined){

//crashproofing: end if the item input or grid is invalid
if(!is_array(item) or !ds_exists(grid,ds_type_grid)) {exit}

var i = 0 //counter var
var SlotFree = (ds_grid_get(grid,i,0) = 0) //is this slot free to add a new item?

while(!SlotFree and i < inventory_size) {i+=1 SlotFree = (ds_grid_get(grid,i,0) = 0)} //if this slot is not free, increment counter by 1 to look at next, up to our max inventory size
if(i > inventory_size-1) {exit} //if we have exceeded our practical inventory size, exit as there is no room

var IsGun = (item[22] = "primary") or (item[22] = "secondary")
var IsMelee = (item[22] = "melee")
var IsGrenade = (item[22] = "grenade")
var IsArmor = (string_count("armor",item[22]))
var IsAmmo = (item[22] = "ammo")
var IsAid = (item[22] = "med") or (item[22] = "food")

if(IsGun) {

if(prev_grid != undefined) {
var xx = ds_grid_value_x(prev_grid,0,0,inventory_size,12,uniqueID)
var roundsLeft = ds_grid_get(prev_grid,xx,6)
var ammoLoaded = ds_grid_get(prev_grid,xx,7)
}
else{
var roundsLeft = 0
var ammoLoaded = item[10]
}

ds_grid_set(grid,i,0,item) //item
ds_grid_set(grid,i,1,item[20]) //mass
ds_grid_set(grid,i,2,1) //quantity (should always be 1 for weapons except grenades)
ds_grid_set(grid,i,3,item[23]) //stack mass
ds_grid_set(grid,i,4,item[22]) //type, prim/secondary, melee, ammo, etc
ds_grid_set(grid,i,6,roundsLeft) //rounds left in magazine
ds_grid_set(grid,i,7,ammoLoaded) //currently loaded ammo, brand new gun uses default
ds_grid_set(grid,i,8,clamp(durability,0,item[2])) //remaining durability, making sure it cannot exceed item's max
ds_grid_set(grid,i,9,scr_item_id_gen()) //unique ID identifier
}

if(IsGrenade) {
	
var ExistingAmmo = ds_grid_value_exists(grid,0,0,inventory_size,4,item)
	
	//if we have two entries of same ammo, add to existing entry and exit script
	if(ExistingAmmo){
				var ExistingX = ds_grid_value_x(grid,0,0,inventory_size,10,item)
				var EQ = ds_grid_get(grid,ExistingX,2)
				ds_grid_set(grid,ExistingX,2,quantity+EQ)
	}	
	
	else{
	ds_grid_set(grid,i,0,item) //item
	ds_grid_set(grid,i,1,item[20]) //mass
	ds_grid_set(grid,i,2,quantity) //quantity (should always be 1 for weapons except grenades)
	ds_grid_set(grid,i,3,item[23]) //stack mass
	ds_grid_set(grid,i,4,item[22]) //type, prim/secondary, melee, ammo, etc
	ds_grid_set(grid,i,6,0) //rounds left in magazine
	ds_grid_set(grid,i,7,item[10]) //currently loaded ammo, brand new gun uses default
	ds_grid_set(grid,i,8,1) //remaining durability, grenades do not have this, so 1
	ds_grid_set(grid,i,9,scr_item_id_gen()) //unique ID identifier
	}
}

if(IsArmor) {
ds_grid_set(grid,i,0,item) //item
ds_grid_set(grid,i,1,item[20]) //mass
ds_grid_set(grid,i,2,0) //FAIL STATE 1 unused
ds_grid_set(grid,i,3,0) //FAIL STATE 2 unused
ds_grid_set(grid,i,4,item[22]) //type, prim/secondary, melee, ammo, etc
ds_grid_set(grid,i,6,0) //FAIL STATE 3 unused
ds_grid_set(grid,i,7,item[10]) //UNUSED
ds_grid_set(grid,i,8,clamp(durability,0,item[14])) //remaining durability, making sure it cannot exceed item's max
ds_grid_set(grid,i,9,scr_item_id_gen()) //unique ID identifier
}

if(IsAmmo) {
	
var ExistingAmmo = ds_grid_value_exists(grid,0,0,inventory_size,4,item)
	
	//if we have two entries of same ammo, add to existing entry and exit script
	if(ExistingAmmo){
				var ExistingX = ds_grid_value_x(grid,0,0,inventory_size,4,item)
				var EQ = ds_grid_get(grid,ExistingX,2)
				ds_grid_set(grid,ExistingX,2,quantity+EQ)
	}	
	
	else{
	ds_grid_set(grid,i,0,item) //item
	ds_grid_set(grid,i,1,item[20]) //mass of one round
	ds_grid_set(grid,i,2,quantity) //quantity of rounds
	ds_grid_set(grid,i,3,item[20]*quantity) //stack mass
	ds_grid_set(grid,i,4,scr_item_id_gen()) //unique ID identifier
	}
}

if(IsAid) {
	
var ExistingAid = ds_grid_value_exists(grid,0,0,inventory_size,12,item)
	
	//if we have two entries of same ammo, add to existing entry and exit script
	if(ExistingAid){
				var ExistingX = ds_grid_value_x(grid,0,0,inventory_size,12,item)
				var EQ = ds_grid_get(grid,ExistingX,2)
				ds_grid_set(grid,ExistingX,2,quantity+EQ)
	}	
	
	else{
	ds_grid_set(grid,i,0,item) //item
	ds_grid_set(grid,i,1,item[20]) //mass of one round
	ds_grid_set(grid,i,2,quantity) //quantity of rounds
	ds_grid_set(grid,i,3,item[20]*quantity) //stack mass
	ds_grid_set(grid,i,9,scr_item_id_gen()) //unique ID identifier
	}
}

}//func end

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ REMOVE ITEMS +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function scr_remove_item(unique_id,grid,inventory_size,instance = undefined){

if(instance != undefined) {instance_destroy(instance)}

var i = 0 //incrementor
var size_y = ds_grid_height(grid)-1 //gets max size of ds_grid width
var id_exists = ds_grid_value_exists(grid,0,0,inventory_size-1,size_y,unique_id) //does the ID even exist in our grid?
if(id_exists) {var column = ds_grid_value_x(grid,0,0,inventory_size-1,size_y,unique_id)} else{exit} //if it exists, find column it is in. if not, exit

repeat(size_y) { //loops through setting value to 0, based on max width of ds_grid and given column to delete
ds_grid_set(grid,column,i,0) 
i+=1
}




}//func end