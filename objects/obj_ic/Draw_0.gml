//reset collision check for mouse (crosshair)


global.GUI = active
col = active



//makes inventory visible and sets location on screen
var ShopOffset = (shopping or containering)

if(active = 1) {
	visible = 1
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	x = vx + (300-(280*ShopOffset))*obj_vc.view_multiplier  
	y = vy + 105*obj_vc.view_multiplier
}

else {	
	visible = 0 
	x = -1000
	y = -1000
	shopping = 0
	containering = 0
	cID = -1
	cString = ""
	global.Selected = undefined
}

//variable for global.selected, so we can access the entity's variables
var GSelected = global.Selected
if(GSelected != undefined) {var GSID = GSelected.unique_id} else{var GSID = -1}


if(cID != -1) { //walk away from a container and it closes
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,cID.x,cID.y))
	if(Cdist > 300) {active = 0}
}

scale = (1.5-(0.1*ShopOffset))*obj_vc.view_multiplier //1.5
image_xscale = scale
image_yscale = scale
draw_self()



//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ BUTTONS DEFINED ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//define button positions, used in left pressed event. Detects where mouse is to simulate buttons
var cx = obj_crosshair.x
var cy = obj_crosshair.y

button_items = point_in_rectangle(cx, cy, x-1*scale, y-1*scale, x+96*scale, y+29*scale)
button_status = point_in_rectangle(cx, cy, x+96*scale, y-1*scale, x+193*scale, y+29*scale)
button_skills = point_in_rectangle(cx, cy, x+193*scale, y-1*scale, x+289*scale, y+29*scale)
button_log = point_in_rectangle(cx, cy, x+290*scale, y-1*scale, x+386*scale, y+29*scale)

sub_button_weapons = cx > (x+7*scale) and 
					 cx < (x+34*scale) and
					 cy > (y+37*scale) and
					 cy < (y+64*scale) and
					 screen = "items" and
					 col
					 
sub_button_armor = cx > (x+45*scale) and 
				   cx < (x+75*scale) and
				   cy > (y+34*scale) and
				   cy < (y+64*scale) and
				   screen = "items" and
					 col
				   
sub_button_aid  =  cx > (x+83*scale) and 
				   cx < (x+113*scale) and
				   cy > (y+34*scale) and
				   cy < (y+64*scale) and
				   screen = "items" and
					 col
				   
sub_button_ammo =  cx > (x+121*scale) and 
				   cx < (x+151*scale) and
				   cy > (y+34*scale) and
				   cy < (y+64*scale) and
				   screen = "items" and
					 col
sub_button_mats =  point_in_rectangle(cx, cy, x+159*scale, y+34*scale, x+189*scale, y+64*scale)
					and screen = "items"
					and col

equip_button_items = cx > (x+353*scale) and  //345,218
				   cx < (x+431*scale) and
				   cy > (y+226*scale) and
				   cy < (y+260*scale) and
				   screen = "items" and subscreen_items = "weapons" and
					 col

desc_button_items = cx > (x+440*scale) and  //345,218
				   cx < (x+537*scale) and
				   cy > (y+226*scale) and
				   cy < (y+260*scale) and
				   screen = "items" and subscreen_items = "weapons" and
					 col
				   
drop_button_items = cx > (x+543*scale) and  //345,218
				   cx < (x+598*scale) and
				   cy > (y+226*scale) and
				   cy < (y+260*scale) and
				   screen = "items" and subscreen_items = "weapons"	and
					 col		   
				   
equip_button_ammo = point_in_rectangle(cx, cy, x+360*scale, y+235*scale, x+430*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "ammo" and
					 col

desc_button_ammo = point_in_rectangle(cx, cy, x+449*scale, y+235*scale, x+537*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "ammo" and
					 col
					
drop_button_ammo = point_in_rectangle(cx, cy, x+543*scale, y+235*scale, x+598*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "ammo" and
					 col
					
equip_button_armor = point_in_rectangle(cx, cy, x+360*scale, y+235*scale, x+430*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "armor" and
					 col

desc_button_armor = point_in_rectangle(cx, cy, x+449*scale, y+235*scale, x+537*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "armor" and
					 col
					
drop_button_armor = point_in_rectangle(cx, cy, x+543*scale, y+235*scale, x+598*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "armor" and
					 col

equip_button_aid = point_in_rectangle(cx, cy, x+360*scale, y+235*scale, x+430*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "aid" and
					 col

desc_button_aid = point_in_rectangle(cx, cy, x+449*scale, y+235*scale, x+537*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "aid" and
					 col
					
drop_button_aid = point_in_rectangle(cx, cy, x+543*scale, y+235*scale, x+598*scale, y+265*scale)
					and screen = "items"
					and subscreen_items = "aid" and
					 col
					 
repair_button = point_in_rectangle(cx, cy, x+567*scale,y+191*scale,x+595*scale,y+211*scale)
					and screen = "items"
					and (subscreen_items = "armor" or subscreen_items = "weapons") and
					 col
weight_info_button = point_in_circle(cx,cy,x+503*scale,y+43*scale,15*scale)
					and screen = "items"
					and (subscreen_items != "currency")
					and col
					

//+++++++++++++++++++++++++++++++++++++++++++ DEFINE EQUIP BUTTON TEXT+++++++++ ++++++++++++++++++++++++++++++

var Shop = 0
var equip = "Equip"
if(screen = "items" and subscreen_items = "aid") {equip = "Use"}
if(containering and GSelected != undefined) {
	var Shop = (cID.IDarray[10] = "shop")
	var Container = (cID.IDarray[10] = "container")
	if(GSelected.creator != id and Container) {equip = "Take"}
	if(GSelected.creator != id and Shop) {equip = "Buy"}
	if(GSelected.creator = id and Container) {equip = "Store"}
	if(GSelected.creator = id and Shop) {equip = "Sell"}
}



//++++++++++++++++++++++++++++++++++++++++++++++ DRAW WEAPONS SCREEN RIGHT SIDE UI +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if(screen = "items" and subscreen_items = "weapons" and visible) 

{
if(scrollbar = undefined) {scrollbar = instance_create_depth(x+11*scale,y+70*scale,depth-1,obj_scrollbar)}
if(scrollbar != undefined) {scrollbar.visible = 1}

var frame = 0 var frame2 = 2 var frame3 = 4
var color = c_dkgray var color1 = c_dkgray var color2 = c_dkgray
draw_set_halign(fa_center)

if(equip_button_items) {color = c_yellow frame = 1}
if(desc_button_items) {color1 = c_yellow frame2 = 3}
if(drop_button_items) {color2 = c_yellow frame3 = 5}

if((GSID = obj_player.primary_id or GSID = obj_player.secondary_id or GSID = obj_player.melee_id or GSID = obj_player.grenade_id) and !ShopOffset) {equip = "Equipped" color = c_yellow frame = 1}

draw_sprite_ext(spr_inventory_screen,0,x+470*image_xscale,y+143*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_inventory_wep_stats,0,x+473*image_xscale,y+307*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_scrollbar,0,x+11*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)
//draw equip button
draw_sprite_ext(spr_button,frame,x+389*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+389*image_xscale,y+226*image_yscale,equip,image_xscale,image_yscale*0.9,0,color,color,color,color,255)
//draw description button
draw_sprite_ext(spr_button,frame2,x+480*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+480*image_xscale,y+226*image_yscale,"Description",image_xscale,image_yscale*0.9,0,color1,color1,color1,color1,255)
//draw drop button
draw_sprite_ext(spr_button,frame3,x+564*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+564*image_xscale,y+226*image_yscale,"Drop",image_xscale,image_yscale*0.9,0,color2,color2,color2,color2,255)


}


//++++++++++++++++++++++++++++++++++++++++++++++ DRAW AMMO SCREEN RIGHT SIDE UI +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(screen = "items" and subscreen_items = "ammo" and visible) 

{
if(scrollbar = undefined) {scrollbar = instance_create_depth(x+11*scale,y+70*scale,depth-1,obj_scrollbar)}
scrollbar.visible = 1

var frame = 0
var frame2 = 2
var frame3 = 4
draw_set_halign(fa_center)
var color = c_dkgray
var color1 = c_dkgray
var color2 = c_dkgray
if(equip_button_ammo) {color = c_yellow frame = 1}
if(desc_button_ammo) {color1 = c_yellow frame2 = 3}
if(drop_button_ammo) {color2 = c_yellow frame3 = 5}

if(item_selected = obj_player.ammo_type and !containering) {equip = "Equipped" color = c_yellow frame = 1}

draw_sprite_ext(spr_inventory_screen,0,x+470*image_xscale,y+143*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_inventory_wep_stats,5,x+472*image_xscale,y+313*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_scrollbar,0,x+11*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)
//draw equip button
draw_sprite_ext(spr_button,frame,x+388*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+389*image_xscale,y+232*image_yscale,equip,image_xscale,image_yscale*0.9,0,color,color,color,color,255)
//draw description button
draw_sprite_ext(spr_button,frame2,x+480*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+480*image_xscale,y+232*image_yscale,"Description",image_xscale,image_yscale*0.9,0,color1,color1,color1,color1,255)
//draw drop button
draw_sprite_ext(spr_button,frame3,x+563*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+564*image_xscale,y+232*image_yscale,"Drop",image_xscale,image_yscale*0.9,0,color2,color2,color2,color2,255)
}

//++++++++++++++++++++++++++++++++++++++++++++++ DRAW ARMOR SCREEN RIGHT SIDE UI ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(screen = "items" and subscreen_items = "armor" and visible) 
{
if(scrollbar = undefined) {scrollbar = instance_create_depth(x+11*scale,y+70*scale,depth-1,obj_scrollbar)}
scrollbar.visible = 1

var frame = 0
var frame2 = 2
var frame3 = 4
armor_equip_button_status = "Equip"
draw_set_halign(fa_center)
var color = c_dkgray
var color1 = c_dkgray
var color2 = c_dkgray
if(equip_button_armor) {color = c_yellow frame = 1}
if(desc_button_armor) {color1 = c_yellow frame2 = 3}
if(drop_button_armor) {color2 = c_yellow frame3 = 5}

if(containering and GSelected != undefined) {
	if(GSelected.creator != id and cID.IDarray[10] = "container") {armor_equip_button_status = "Take"}
	if(GSelected.creator != id and cID.IDarray[10] = "shop") {armor_equip_button_status = "Buy"}
	if(GSelected.creator = id and cID.IDarray[10] = "container") {armor_equip_button_status = "Store"}
	if(GSelected.creator = id and cID.IDarray[10] = "shop") {armor_equip_button_status = "Sell"}
	}

if(	GSID = obj_player.head_id or 
	GSID = obj_player.torso_id or
	GSID = obj_player.armL_id or
	GSID = obj_player.armR_id or
	GSID = obj_player.legL_id or
	GSID = obj_player.legR_id
  ) 
  {armor_equip_button_status = "Unequip"} // color = c_yellow  frame = 1



draw_sprite_ext(spr_inventory_screen,0,x+470*image_xscale,y+143*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_inventory_wep_stats,3,x+473*image_xscale,y+307*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_scrollbar,0,x+11*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)
//draw equip button
draw_sprite_ext(spr_button,frame,x+389*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+389*image_xscale,y+226*image_yscale,armor_equip_button_status,image_xscale,image_yscale*0.9,0,color,color,color,color,255)
//draw description button
draw_sprite_ext(spr_button,frame2,x+480*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+480*image_xscale,y+226*image_yscale,"Description",image_xscale,image_yscale*0.9,0,color1,color1,color1,color1,255)
//draw drop button
draw_sprite_ext(spr_button,frame3,x+564*image_xscale,y+239*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+564*image_xscale,y+226*image_yscale,"Drop",image_xscale,image_yscale*0.9,0,color2,color2,color2,color2,255)
}


//++++++++++++++++++++++++++++++++++++++++++++++++++ DRAW STATUS BODY ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(screen != "status" and EKG != undefined) {instance_destroy(EKG) EKG = undefined}

if(screen = "status")
{

//if(EKG = undefined)
//{EKG = instance_create_depth(x+70*scale,y+145*scale,-100,obj_gui_ekg,)}

scr_status_body_warnings()

//start drawing body
draw_sprite_ext(spr_status_body,18,x+305*scale,y+210*scale,scale,scale,0,c_white,255) //draw screen

//this script draws outlines for armor, and controls colors of parts based on their remaining HP
scr_statusbody_colorcontrol()

draw_sprite_ext(spr_status_body,12,x+307*scale,y+163*scale,scale,scale,0,CTorso,255)	//draw ribs
draw_sprite_ext(spr_status_body,14,x+247*scale,y+159*scale,scale,scale,0,CLArm,255)	//draw LArm bones
draw_sprite_ext(spr_status_body,15,x+367*scale,y+159*scale,scale,scale,0,CRArm,255)	//draw RArm bones
draw_sprite_ext(spr_status_body,16,x+265*scale,y+273.5*scale,scale,scale,0,CLLeg,255)	//draw LLeg bones
draw_sprite_ext(spr_status_body,17,x+349*scale,y+273.5*scale,scale,scale,0,CRLeg,255)	//draw RLeg  bones

draw_sprite_ext(spr_status_body,0,x+307*scale,y+153*scale,scale,scale,0,CARTorso,OAR_Torso)	//draw torso armor
draw_sprite_ext(spr_status_body,13,x+307*scale,y+105*scale,scale,scale,0,CHead,255)	//draw skull
draw_sprite_ext(spr_status_body,1,x+307*scale,y+103*scale,scale,scale,0,CARHead,OAR_Head)	//draw head	armor
draw_sprite_ext(spr_status_body,2,x+247*scale,y+166*scale,scale,scale,0,CARLArm,OAR_LArm)	//draw LArm armor
draw_sprite_ext(spr_status_body,3,x+367*scale,y+166*scale,scale,scale,0,CARRArm,OAR_RArm)	//draw RArm armor
draw_sprite_ext(spr_status_body,4,x+265*scale,y+275.5*scale,scale,scale,0,CARLLeg,OAR_LLeg)	//draw LLeg armor
draw_sprite_ext(spr_status_body,5,x+349*scale,y+275.5*scale,scale,scale,0,CARRLeg,OAR_RLeg)	//draw RLeg armor

//this script draw the lefthand stats textbox
scr_status_stats_text()

}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ REPAIR BUTTON +++++++++++++++++++++++++++++++++++++

if(screen = "items" and (subscreen_items = "weapons" or subscreen_items = "armor") and GSelected != undefined) {
	var IsMine = (GSelected.creator = id)
	var Sum = IsMine+Shop+containering-Shop*2
	var CanRepair = (Sum > 0)
	
	if(GSelected.type != "grenade" and CanRepair){	
		var KitColor = c_dkgray
		if(repair_button) {KitColor = c_yellow}
		draw_set_halign(fa_center)
		draw_sprite_ext(spr_inventory_screen,9+repair_button,x+470*image_xscale,y+143*image_yscale,scale,scale,0,c_white,1)
		draw_text_ext_transformed_color(x+588*scale,y+190.5*scale,clamp(KitCount,0,9),1,400,scale*0.9,scale*0.9,0,KitColor,KitColor,KitColor,KitColor,1)
		//draw_rectangle(x+567*scale,y+191*scale,x+595*scale,y+211*scale,1)
	}
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ DRAW AID SCREEN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(screen = "items" and subscreen_items = "aid" and visible) 

{
if(scrollbar = undefined) {scrollbar = instance_create_depth(x+11*scale,y+70*scale,depth-1,obj_scrollbar)}
scrollbar.visible = 1

var frame = 0
var frame2 = 2
var frame3 = 4
draw_set_halign(fa_center)
var color = c_dkgray
var color1 = c_dkgray
var color2 = c_dkgray
if(equip_button_aid) {color = c_yellow frame = 1}
if(desc_button_aid) {color1 = c_yellow frame2 = 3}
if(drop_button_aid) {color2 = c_yellow frame3 = 5}

draw_sprite_ext(spr_inventory_screen,0,x+470*image_xscale,y+143*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_inventory_wep_stats,2,x+472*image_xscale,y+300*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_sprite_ext(spr_scrollbar,0,x+11*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)
//draw equip button
draw_sprite_ext(spr_button,frame,x+388*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+389*image_xscale,y+232*image_yscale,equip,image_xscale,image_yscale*0.9,0,color,color,color,color,255)
//draw description button
draw_sprite_ext(spr_button,frame2,x+480*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+480*image_xscale,y+232*image_yscale,"Description",image_xscale,image_yscale*0.9,0,color1,color1,color1,color1,255)
//draw drop button
draw_sprite_ext(spr_button,frame3,x+563*image_xscale,y+245*image_yscale,image_xscale,image_yscale,0,c_white,255)
draw_text_transformed_color(x+564*image_xscale,y+232*image_yscale,"Drop",image_xscale,image_yscale*0.9,0,color2,color2,color2,color2,255)

}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ DRAW MATERIALS SCREEN ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(screen = "items" and subscreen_items = "mats" and visible){ 

draw_sprite_ext(spr_scrollbar,0,x+11*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)

if(scrollbar = undefined) {scrollbar = instance_create_depth(x+11*scale,y+70*scale,depth-1,obj_scrollbar)}
scrollbar.visible = 1
}

//+++++++++++++++++++++++++++++++++++++++++++++++++ CONTAINERS AND SHOPPING +++++++++++++++++++++++++++++++++++++++++++++

if(shopping or containering) {
	var Shop = (cID.IDarray[10] = "shop")
	draw_sprite_ext(spr_inventory_bg,9,x+613*image_xscale,y,image_xscale,image_yscale,0,c_white,255)
	draw_set_halign(fa_center)
	draw_text_transformed_color(x+775*scale,y+35*scale,cString,scale,scale,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
	draw_set_halign(fa_left)
	draw_sprite_ext(spr_scrollbar,0,x+936*image_xscale,y+70*image_yscale,image_xscale,image_yscale,0,c_white,255)

	if(Shop and screen = "items") {
		var Cash = variable_instance_get(obj_player,cID.IDarray[4])
		var Text = Cash //"You Have: " + string(Cash)
		draw_set_halign(fa_left)
		draw_sprite_ext(spr_inventory_screen,8,x+470*image_xscale,y+143*image_yscale,scale,scale,0,c_white,1)
		draw_text_ext_transformed_color(x+350*scale,y+76*scale,Text,1,12000,scale*0.75,scale*0.75,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
	}
}


//++++++++++++++++++++++++++++++++++++++++++++ WEIGHT BAR AND DISPLAY ++++++++++++++++++++++++++++++++++++


if(screen = "items" and subscreen_items != "currency") {
	var Weight = InvWeight
	var Capacity = obj_player.CarryWeight
	var String = string(Weight) + "/" + string(Capacity)
	var WindowScale = scale*1.33
	var Wx = 500 var Wy = -35

	draw_set_halign(fa_center)
	draw_text_ext_transformed_color(x+547*scale,y+33.5*scale,String,1,12000,scale*1,scale*1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
	//info button
	draw_sprite_ext(spr_button,9+weight_info_button,x+503*scale,y+43*scale,scale*1.1,scale*1.1,0,c_white,1)
}
//------------------------------------------- draw bars and window ------------------------------------------
if(weight_info_button){

	if(Weight <= Capacity){
	var ArmorWeight = Weight-InvWeightAdder[0]-InvWeightAdder[2]-InvWeightAdder[3]
	var WpBarScale = (InvWeightAdder[0]/Capacity) //weapons bar scale
	var ArBarScale = (ArmorWeight/Capacity) //armor bar scale
	var AmBarScale = (InvWeightAdder[2]/Capacity) //ammo bar scale
	var AiBarScale = (InvWeightAdder[3]/Capacity) //aid bar scale
	var CrBarScale = (0/Capacity) //crafting bar scale
	}

	if(Weight > Capacity){
	var ArmorWeight = Weight-InvWeightAdder[0]-InvWeightAdder[2]-InvWeightAdder[3]
	var WpBarScale = (InvWeightAdder[0]/Weight) //weapons bar scale
	var ArBarScale = (ArmorWeight/Weight) //armor bar scale
	var AmBarScale = (InvWeightAdder[2]/Weight)
	var AiBarScale = (InvWeightAdder[3]/Weight)
	var CrBarScale = (0/Weight) //crafting bar scale
	}

	draw_sprite_ext(spr_inventory_wep_stats,6,x+Wx*scale,y+Wy*scale,WindowScale,WindowScale,0,c_white,1)

	var BarX = x+(Wx-191)*WindowScale
	var ArX = BarX+(134*WpBarScale)*WindowScale //armor bar x offset
	var AmX = BarX+(134*WpBarScale+134*ArBarScale)*WindowScale //ammo bar x offset
	var AiX = BarX+(134*WpBarScale+134*ArBarScale+134*AmBarScale)*WindowScale //aid bar x offset
	var CrX = BarX+(134*WpBarScale+134*ArBarScale+134*AmBarScale+134*AiBarScale)*WindowScale //crafting bar x offset
	var WpCol = c_yellow var ArCol = c_red 
	var AmCol = c_lime var AiCol = c_aqua var CrCol = c_purple

	draw_sprite_ext(spr_bars,7,BarX,y+((Wy-1.5)*WindowScale),WpBarScale*WindowScale,WindowScale,0,WpCol,1)
	draw_sprite_ext(spr_bars,7,ArX,y+((Wy-1.5)*WindowScale),ArBarScale*WindowScale,WindowScale,0,ArCol,1)
	draw_sprite_ext(spr_bars,7,AmX,y+((Wy-1.5)*WindowScale),AmBarScale*WindowScale,WindowScale,0,AmCol,1)
	draw_sprite_ext(spr_bars,7,AiX,y+((Wy-1.5)*WindowScale),AiBarScale*WindowScale,WindowScale,0,AiCol,1)
	draw_sprite_ext(spr_bars,7,CrX,y+((Wy-1.5)*WindowScale),CrBarScale*WindowScale,WindowScale,0,CrCol,1)

	var WpT = string(InvWeightAdder[0])+" ("+string(round(WpBarScale*100))+"%"+")"
	var ArT = string(ArmorWeight)+" ("+string(round(ArBarScale*100))+"%"+")"
	var AmT = string(InvWeightAdder[2])+" ("+string(round(AmBarScale*100))+"%"+")"
	var AiT = string(InvWeightAdder[3])+" ("+string(round(AiBarScale*100))+"%"+")"
	var CrT = string(0)+" ("+string(round(CrBarScale*100))+"%"+")"

	draw_text_ext_transformed_color(x+375*WindowScale,y-50*WindowScale,"Weight Breakdown",1,12000,WindowScale*0.5,WindowScale*0.45,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
	draw_text_ext_transformed_color(x+338*WindowScale,y-25*WindowScale,"Arms: "+WpT,1,12000,WindowScale*0.4,WindowScale*0.45,0,WpCol,WpCol,WpCol,WpCol,1)
	draw_text_ext_transformed_color(x+413*WindowScale,y-25*WindowScale,"Armor: "+ArT,1,12000,WindowScale*0.4,WindowScale*0.45,0,ArCol,ArCol,ArCol,ArCol,1)
	draw_text_ext_transformed_color(x+338*WindowScale,y-13*WindowScale,"Ammo: "+AmT,1,12000,WindowScale*0.4,WindowScale*0.45,0,AmCol,AmCol,AmCol,AmCol,1)
	draw_text_ext_transformed_color(x+413*WindowScale,y-13*WindowScale,"Aid: "+AiT,1,12000,WindowScale*0.4,WindowScale*0.45,0,AiCol,AiCol,AiCol,AiCol,1)
	draw_text_ext_transformed_color(x+338*WindowScale,y-1*WindowScale,"Crafting: "+CrT,1,12000,WindowScale*0.4,WindowScale*0.45,0,CrCol,CrCol,CrCol,CrCol,1)
	draw_text_ext_transformed_color(x+413*WindowScale,y-1*WindowScale,"Speed Penalty: "+SpeedPenalty,1,12000,WindowScale*0.4,WindowScale*0.45,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
}

