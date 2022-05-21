var Me = array
var _scl = 1.01

if(!cells[array_length(cells)-1]) {draw_sprite_ext(Me[1],8,bbox_left+(192*array_length(cells)),y,_scl,_scl,0,c_white,1)} //draw the last pillar, if it's not already drawn 

var _midpoint = Me[9] + ( (Me[10]-Me[9])/2 )

for(var i=0; i<sizex; i++){	
	var _subimg = clamp(seed[i],Me[9],Me[10])
	var _xscl = _scl
	var _flip = 0
	if(i>0) {if(seed[i-1] >= 5) {_xscl = -_scl _flip = 1}}
	
	if (cells[i] != -1) { //check if this cell is supposed to support an upper level
		var pillar_check = clamp(i-1,0,array_length(cells))	
		draw_sprite_ext(Me[1],_subimg,bbox_left+48+(192*i)+(144*_flip),y+4,_xscl,_scl,0,c_white,1) //draw windows, offset for curb if applicable
		if(cells[pillar_check] = 0) {draw_sprite_ext(Me[1],8,bbox_left+(192*i),y,_scl,_scl,0,c_white,1)} //draw pillars, accounting for gaps
		} 
	else {
		var _subimg = 1
		if(seed[i] >= 5) {_subimg = 2}
		draw_sprite_ext(Me[1],_subimg,bbox_left+48+(192*i),y+4,_scl,_scl,0,c_white,1) //draw solid window
		draw_sprite_ext(Me[1],10,bbox_left+(192*i),y,_scl,_scl,0,c_white,1) //draw left cell pillar
		draw_sprite_ext(Me[1],10,bbox_left+(192*(i+1)),y,_scl,_scl,0,c_white,1) //draw right cell pillar
		}
	if (col_ground) {
		draw_sprite_ext(Me[1],0,bbox_left+(192*i),y+32,_scl,_scl,0,c_white,1) //draw curb
		draw_sprite_ext(Me[1],rubble[i],bbox_left+(192*i),y+32,_scl,_scl,0,c_white,1) //draw scatter rubble
		} 
}	

//draw_text(x,bbox_top,seed)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++ DEBUG BELOW ++++++++++++++++++++++++++++++++++++++++++

/*
var middle = (abs(bbox_top - bbox_bottom))/2

draw_set_halign(fa_center)
draw_text(x,y-middle,"XS: " + string(sizex) + "  YS: " +string(sizey))

draw_set_halign(fa_left)
if(col_bot = 1) {draw_text(x,y-middle+20,"BOT: " + string(bot_obj.image_xscale))}
if(col_top = 1) {draw_text(x+40,y-middle+20,"TOP: " + string(top_obj.image_xscale))}
draw_text(x+100,y-middle+20,"GRD: " +string(col_ground))

for(var i=0; i<array_length(cells); i++){
	draw_text(x,y-100+(15*i),cells[i])
	}
*/

//draw_self()


	
	