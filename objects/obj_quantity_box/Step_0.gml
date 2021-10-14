Percent = Scroller.Percent
Quantity = round(MaxQuantity*Percent)


//Button coordinate checks
var LMB = mouse_check_button(mb_left)
Exit = point_in_rectangle(obj_crosshair.x,obj_crosshair.y,x+185*scale,y+5*scale,x+207*scale,y+25*scale) and !LMB
Take = point_in_rectangle(obj_crosshair.x,obj_crosshair.y,x+10*scale,y+65*scale,x+67*scale,y+95*scale) and !LMB
Cancel = point_in_rectangle(obj_crosshair.x,obj_crosshair.y,x+130*scale,y+65*scale,x+200*scale,y+95*scale) and !LMB



var GSelected = global.Selected 
if(global.Selected != undefined) {
		var GSID = GSelected.unique_id
		var Grid = GSelected.grid
		var Item = GSelected.item_id
		var Creator = GSelected.creator
		var inv_sze = Creator.inventory_size
		
		MaxQuantity = GSelected.amount
		
		Cost = Quantity*GSelected.value
}


if(global.Selected = undefined) {instance_destroy(self)}

