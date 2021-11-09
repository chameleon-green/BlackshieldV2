
	
//++++++++++++++++++++++++++++++++++++++++++++ Variables +++++++++++++++++++++++++++++++

	var D = creator.Right*creator.canmove //keyboard_check(ord("D"))//
	var A = creator.Left*creator.canmove //keyboard_check(ord("A"))//
	//var S = keyboard_check(ord("S"))
	//var Shift = keyboard_check(vk_shift)
	
	cSpeed = 30*D + -30*A //clamp hspeed for collision stuff, need a minimum
	
	var x1 = bbox_left - 10 + hspeed
	var x2 = bbox_right + 10 + hspeed
	var y1 = bbox_bottom - 10
	var y2 = bbox_bottom + abs(cSpeed) + 15
	col_slope = collision_rectangle(x1,y1,x2,y2,obj_slope,true,0) 
	
	col_right = place_meeting(bbox_right+hspeed,y,obj_platform) and !place_meeting(bbox_right + 10 + cSpeed,y+abs(cSpeed)+15,obj_slope)
	col_left =  place_meeting(bbox_left+hspeed,y,obj_platform) and !place_meeting(bbox_left - 10 + cSpeed,y+abs(cSpeed)+15,obj_slope)
	col_top = place_meeting(x,y-1+clamp(vsp,-1000,0),obj_platform)
	
//+++++++++++++++++++++++++++++++++++++++++++++++++++ gravity ++++++++++++++++++++++++++++++++++++++++++++++++

//moved to begin step event

//++++++++++++++++++++++++++++++++++++++++++++++++ SLOPES ++++++++++++++++++++++++++++++++++++++++++++++

//SEE BEGIN STEP EVENT FOR GRAVITY AND OTHER SLOPE STUFF

  if(col_slope) {
	
	var Grade = abs(col_slope.image_yscale)/abs(col_slope.image_xscale)//determines slope of slope
	if(Grade = 1) {Grade = 1.2} if(Grade = -1) {Grade = -1.2}
	Climb = ceil(abs(hspeed))*ceil(Grade)
	y -= Climb  //multiplies our vertical increase by slope, rounding up
  } 
  
 //+++++++++++++++++++++++++++++++++++++++++++++++ Movin'+++++++++++++++++++++++++++++++++++++++++++++++
/* 
 hspeed = 0
if D and !col_right {hspeed = 12}
if A and !col_left {hspeed = -12}
if D{hspeed = 12}
if A{hspeed = -12}
*/
hspeed = creator.hspeed

if(col_top) {vsp = 0}

y += vsp;