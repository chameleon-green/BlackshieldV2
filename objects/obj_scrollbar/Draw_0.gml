scale = obj_ic.scale

if(obj_ic.subscreen_items = "weapons") {Counter = obj_ic.CountGun}
if(obj_ic.subscreen_items = "armor") {Counter = obj_ic.CountArmor}
if(obj_ic.subscreen_items = "ammo") {Counter = obj_ic.CountAmmo}
if(obj_ic.subscreen_items = "aid") {Counter = obj_ic.CountAid}

DisplacementMod = clamp(Counter/8,1,999999999999999) //how far should the items move relative to the scroll? allows for very long item lists
BarLength = 280 - ( clamp(Counter-8,0,99999999999999) * (38/DisplacementMod) )  //  40/4, 4 being the multiplier found in obj_inventory_item
ScaleMod = 280/BarLength

image_xscale = scale
image_yscale = scale/ScaleMod

LimitOffset1 = 85 //minimum offset, ie how far the bar can go up
LimitOffset2 = (280 - 280/ScaleMod) + 85 //maximum offets, ie how far the bar can go down
LimitY1 = obj_ic.y+LimitOffset1*scale //the highest y coord the bar can go to
LimitY2= obj_ic.y+LimitOffset2*scale //the lowest y coord the bar can go to

//stops bar from going out of bounds, dynamic with size
if(y < LimitY1) {y = LimitY1}
if(y > LimitY2) {y = LimitY2}

//++++++++++++++++++++++++++++++++++++++++++++ SCROLLY STUFF ++++++++++++++++++++++++++++++++++++++++

x = obj_ic.x+11*scale
if(!Dragging and !Scrolling) {y = obj_ic.y + offset*scale} //if we are not dragging, set the bar position (offset by wherever it lies vertically) modified by zoom


draw_self()

if(place_meeting(x,y,obj_crosshair))
{	
	if(mouse_check_button_pressed(mb_left)) //grabby code
	{
	yy = (y - mouse_y)
	Dragging = 1
	}
}


if(Dragging)
{
	y = clamp(mouse_y + yy,LimitY1,LimitY2) //if dragging, grab the bar and make it follow the mouse, offset by where we grabbed it
	var disp = -(obj_ic.y - y)/scale
	offset = clamp(disp,LimitOffset1,LimitOffset2)
}

if(!mouse_check_button(mb_left)) {Dragging = 0} //we can not dragging if the mouse isn't clicked




// debug text below
//draw_text(x-80,y+90,"DispMod:" + string(DisplacementMod))
//draw_text(x-80,y+90,"Bar Y Value:" + string(round(y)))
//draw_text(x-80,y+120,"Y Difference:" + string(obj_ic.y - y))
//draw_text(x-80,y+150,"offset:" + string(offset) + " (" + string(offset*scale) + ")")



