if(creator = undefined) {instance_destroy(self)}
	
depth = creator.depth-1
scale = creator.scale
y = creator.y+44*scale
image_xscale = scale
image_yscale = scale
	
draw_self()
	
var XDif = (x-creator.x)/scale
Percent = (XDif-XMin)/(XMax-XMin)
col = point_in_rectangle(obj_crosshair.x,obj_crosshair.y,x-14*scale,y-10*scale,x+14*scale,y+10*scale)
	
//draw_text(x,y,(x-creator.x)/scale)
//draw_text(x,y-100,Percent)
//draw_rectangle(x-14*scale,y-10*scale,x+14*scale,y+10*scale,1)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++ GRABBY CODE ++++++++++++++++++++++++++++++++++
LimitOffset1 = 29 //minimum offset, ie how far the bar can go up
LimitOffset2 = 185 //maximum offets, ie how far the bar can go down
LimitX1 = creator.x+LimitOffset1*scale //the highest y coord the bar can go to
LimitX2= creator.x+LimitOffset2*scale //the lowest y coord the bar can go to

//stops bar from going out of bounds, dynamic with size
if(x < LimitX1) {x = LimitX1}
if(x > LimitX2) {x = LimitX2}


if(col)
{	
	if(mouse_check_button_pressed(mb_left)) //grabby code
	{
	xx = (x - mouse_x)
	Dragging = 1
	}
}


if(Dragging)
{
	x = clamp(mouse_x + xx,LimitX1,LimitX2) //if dragging, grab the bar and make it follow the mouse, offset by where we grabbed it
	//var disp = -(obj_ic.y - y)/scale
	//offset = clamp(disp,LimitOffset1,LimitOffset2)
}

if(!mouse_check_button(mb_left)) {Dragging = 0} //we can not dragging if the mouse isn't clicked