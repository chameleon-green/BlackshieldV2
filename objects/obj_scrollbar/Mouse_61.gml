if(y <= LimitY2 and obj_ic.visible = 1 and obj_ic.screen = "items") 
{
	Scrolling = 1
	var ShiftAmount = 10*scale
	var ShiftDifference = abs(y-LimitY2)
	var disp = -(obj_ic.y - y)/scale
	
	if(ShiftDifference < ShiftAmount) {ShiftAmount = ShiftDifference}
	
	y +=ShiftAmount
	
	offset = clamp(disp,LimitOffset1,LimitOffset2)
}