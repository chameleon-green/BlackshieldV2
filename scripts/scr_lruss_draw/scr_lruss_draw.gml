// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lruss_draw(){


if(particle_timer >= particle_max_timer*2 and layer =-1) {layer_destroy(mylayer)}

draw_self()


//draw_text(x,y-600,depth)
draw_text(x,y-600,HullPhys)
draw_text(x,y-650,layer_get_name(layer))
	
	/*
	var xL = bbox_left var xR = bbox_right
	var yT = bbox_top var yB = bbox_bottom 
	var yHT = bbox_bottom-240 //hull top Y
	var yTB = bbox_bottom-220 //turret bot y
	var XTRT1 = 50 var XTRT2 = 160 //x offsets for turret, changes with image xscale (see below)
	
	if(image_xscale = -1) {draw_rectangle(xL+XTRT1,yT,xR-XTRT2,yTB,1)}
	else{draw_rectangle(xL+XTRT2,yT,xR-XTRT1,yTB,1)}
	draw_ellipse(xL,yHT,xR,yB,1)
	*/
}