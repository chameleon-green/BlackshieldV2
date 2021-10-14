if(Exit or Cancel) {instance_destroy(self)}

//+++++++++++++++++++++++++++++++++++++++ TAKING ITEMS ++++++++++++++++++++++++++++++++

var GSelected = global.Selected 
if(global.Selected != undefined) {
		
		var GSID = GSelected.unique_id
		var Grid = GSelected.grid
		var Item = GSelected.item_id
		var Creator = GSelected.creator
		var inv_sze = Creator.inventory_size
		
		var gx = ds_grid_value_x(Grid,0,0,inv_sze,12,GSID)
		
		var cID = creator.cID
		
		var IsAmmo = (Item[22] = "ammo")
		var IsAid = (Item[22] = "med") or (Item[22] = "food")
		var IsGrenade = (Item[22] = "grenade")
		var IGrid, CGrid //variables for grid to be used below
		
		if(IsAmmo) {IGrid = creator.grd_inv_ammo CGrid = cID.grd_inv_ammo}
		if(IsAid) {IGrid = creator.grd_inv_aid CGrid = cID.grd_inv_aid}
		if(IsGrenade) {IGrid = creator.inventory CGrid = cID.grd_inv_weps}
		
		if(shop) {
		var ShopCurrency = cID.IDarray[4]  
		var Cash = variable_instance_get(obj_player,ShopCurrency)
		var ItemCost = GSelected.value * Quantity
		}
		
		if(Take and Quantity > 0) {
			
			var Boxing = (Creator != creator) //this item is not in our inventory
			
			if(Boxing and Quantity > 0){
				if(!shop or (shop and Cash > ItemCost)){		
					scr_add_item(Item,Quantity,0,IGrid,inv_sze)
					if(Quantity = GSelected.amount) {scr_remove_item(GSID,Grid,inv_sze)}
					else{ds_grid_set(Grid,gx,2,GSelected.amount-Quantity)}
					global.Selected = undefined 
					cID.refresh = 1 creator.refresh = 1	
					if(shop) {variable_instance_set(obj_player,ShopCurrency,Cash-ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}
			
			if(!Boxing and Quantity > 0){
				if(!shop or (shop and Cash > -1)){
					scr_add_item(Item,Quantity,1,CGrid,inv_sze)	
					if(Quantity = GSelected.amount) {scr_remove_item(GSID,Grid,inv_sze)}
					else{ds_grid_set(Grid,gx,2,GSelected.amount-Quantity)}
					if(Item = obj_player.ammo_type) {global.mags -= Quantity}
					global.Selected = undefined 
					cID.refresh = 1 creator.refresh = 1	
					if(shop) {variable_instance_set(obj_player,ShopCurrency,Cash+ItemCost) audio_play_sound(snd_kaching,1,0)}
					else{audio_play_sound(snd_rackslide,1,0)}
				}
			}
		}
		
		if(Take and Quantity <= 0) {Scroller.x =(x+185*scale)}
}


