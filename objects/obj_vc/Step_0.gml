

camera_xspd = camera_x - camera_xprev

//cancel zoom momentum if inventory is brought up
if(instance_exists(obj_ic))
{
	if(obj_ic.visible = 1) {view_momentum = 0}
}


if(abs(view_momentum) > 0) {view_momentum *= 0.95}
if(abs(view_momentum) < 0.2) {view_momentum = 0}

xx += view_momentum
yy += view_momentum/1.78

if(xx > 2732) {xx = 2732}
if(xx < 683) {xx = 683}
if(yy > 1536) {yy = 1536}
if(yy < 384) {yy = 384}

camera_set_view_size(view_camera[0],xx,yy)

view_multiplier = xx/1366

if(equalize = 1)

{ 
	if(xx > 1366) {view_momentum = -1*(abs(xx-1366)/4)}
	if(xx < 1366) {view_momentum = 1*(abs(xx-1366)/4)}
	
	if(yy > 768) {view_momentum = -(1*(abs(yy-768)/4))/1.78}
	if(yy < 768) {view_momentum = (1*(abs(yy-768)/4))/1.78}
	
	if(xx > 1361 and
	   xx < 1371 and
	   yy > 763 and
	   yy < 773
	  )
	{view_momentum = 0 equalize = 0}
}


//track xhair and player
if(instance_exists(obj_player) and instance_exists(obj_crosshair))
	{
	var cx = obj_crosshair.x - camera_get_view_x(view_camera[0])
	var cy = obj_crosshair.y - camera_get_view_y(view_camera[0])
	
	var pl_mult = 2
	var mouse_mult = 3
	var total_mult = pl_mult+mouse_mult
	
	x = (obj_player.x*pl_mult + mouse_x*mouse_mult)/total_mult
	y = (obj_player.y*pl_mult + mouse_y*mouse_mult)/total_mult
	camera_set_view_target(view_camera[0],obj_player.id)
	
	
	/*
	if(!edgeL and !edgeR) {x = (obj_player.x + mouse_x + mouse_x)/3}
	var Threshold = xx*0.25
	var edgeL = (window_mouse_get_x() >= (xx - Threshold))
	var edgeR = (window_mouse_get_x() <= Threshold)
	if(edgeL) {x+=Threshold/4}
	if(edgeR) {x-=Threshold/4}
	*/
	}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ PARALLAX SCROLLING
var cspd = camera_xspd/12
layer_hspeed("bg_layer1",cspd*1)
layer_hspeed("bg_layer2",cspd*3)
layer_hspeed("bg_clouds",cspd*5)
/*
layer_x( "bg_layer_foreground", camera_get_view_x(view_camera[0]) * 1 )
layer_x( "bg_layer1", camera_get_view_x(view_camera[0]) * 0.5 )
