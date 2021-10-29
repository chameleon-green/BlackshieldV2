

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
camera_set_view_border(view_camera[0],xx/2,yy/2)

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
	
	var pl_mult = 3
	var mouse_mult = 4
	var total_mult = pl_mult+mouse_mult
	var ply = obj_player.bbox_top - obj_player.bbox_bottom + obj_player.y
	
	
	x = (obj_player.x*pl_mult + mouse_x*mouse_mult)/total_mult
	y = (ply*pl_mult + mouse_y*mouse_mult)/total_mult
	
	//var track = obj_player.id
	var track = id
	
	if(!global.GUI) {camera_set_view_target(view_camera[0],track)}
	else{camera_set_view_target(view_camera[0],noone)}
	
	
	
	
	
	
	}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ PARALLAX SCROLLING
var cspd = camera_xspd/12
layer_hspeed("bg_layer1",cspd*1)
layer_hspeed("bg_layer2",cspd*3)
layer_hspeed("bg_clouds",cspd*5)
/*
layer_x( "bg_layer_foreground", camera_get_view_x(view_camera[0]) * 1 )
layer_x( "bg_layer1", camera_get_view_x(view_camera[0]) * 0.5 )
