if(instance_exists(obj_ic)) {
	scale = obj_ic.scale
	depth = obj_ic.depth-10
	x = obj_ic.x+363*scale
	y = obj_ic.y+100*scale
	}
	
draw_self()
	
image_xscale = scale
image_yscale = scale

draw_set_font(fnt_caslon)
draw_set_halign(fa_center)
draw_text_ext_transformed_color(x+100*scale,y+10*scale,"Quantity: ",0,900000,scale,scale,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
draw_set_halign(fa_left)
draw_text_ext_transformed_color(x+133*scale,y+10*scale,Quantity,0,900000,scale,scale,0,c_yellow,c_yellow,c_yellow,c_yellow,1)

//------------------------------------------------------ BUTTONS ----------------------------------------------------------

var TakeFrame = 4
var CancelFrame = 0
var TakeColor = c_dkgray
var CancelColor = c_dkgray
var TakeString = "Store"

var GSelected = global.Selected 
if(global.Selected != undefined) {
	var Creator = GSelected.creator
	var Boxing = (Creator != creator)//this item is not in our inventory
	if(Boxing) {TakeString = "Take"}
}

if(Exit) {image_index = 1} else{image_index = 0}
if(Take) {TakeFrame = 5 TakeColor = c_yellow}
if(Cancel) {CancelFrame = 1 CancelColor = c_yellow}

draw_set_halign(fa_center)
draw_sprite_ext(spr_button,TakeFrame,x+38*scale,y+80*scale,scale,scale,0,c_white,1) //cancel button
draw_sprite_ext(spr_button,CancelFrame,x+165*scale,y+80*scale,scale,scale,0,c_white,1) //take button
draw_text_ext_transformed_color(x+38*scale,y+68*scale,TakeString,0,900000,scale,scale,0,TakeColor,TakeColor,TakeColor,TakeColor,1)
draw_text_ext_transformed_color(x+165*scale,y+68*scale,"Cancel",0,900000,scale,scale,0,CancelColor,CancelColor,CancelColor,CancelColor,1)

/*
draw_rectangle(x+185*scale,y+5*scale,x+207*scale,y+25*scale,1) //exit button hitbox
draw_rectangle(x+10*scale,y+65*scale,x+67*scale,y+95*scale,1) //take button hitbox
draw_rectangle(x+130*scale,y+65*scale,x+200*scale,y+95*scale,1) //cancel button hitbox
*/

