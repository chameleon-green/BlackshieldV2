

/*
var middle = (abs(bbox_top - bbox_bottom))/2

draw_set_halign(fa_center)
draw_text(x,y-middle,"XS: " + string(sizex) + "  YS: " +string(sizey))

draw_set_halign(fa_left)
if(col_bot = 1) {draw_text(x,y-middle+20,"BOT: " + string(bot_obj.image_xscale))}
if(col_top = 1) {draw_text(x+40,y-middle+20,"TOP: " + string(top_obj.image_xscale))}
draw_text(x+100,y-middle+20,"GRD: " +string(col_ground))
*/

//draw_self()

var Me = array

for(var i=0; i<sizex; i++){	
	
	if (col_ground) {draw_sprite(Me[1],0,bbox_left+(176*i),y)} //draw curb
	if (!cells[i]) {	
		var pillar_check = clamp(i-1,0,array_length(cells))	
		draw_sprite(Me[1],3,bbox_left+48+(176*i),y-28*col_ground+4*!col_ground) //draw windows, offset for curb if applicable
		if(cells[pillar_check] = 0) {draw_sprite(Me[1],8,bbox_left+(176*i),y-32*col_ground+4*!col_ground)} //draw pillars, accounting for gaps
		} 
	else {
		draw_sprite(Me[1],1,bbox_left+48+(176*i),y-28*col_ground+4*!col_ground) //draw solid window
		draw_sprite(Me[1],10,bbox_left+(176*i),y-32*col_ground+4*!col_ground) //draw left cell pillar
		draw_sprite(Me[1],10,bbox_left+(176*(i+1)),y-32*col_ground+4*!col_ground) //draw right cell pillar
		}
}	
if(!cells[array_length(cells)-1]) {draw_sprite(Me[1],8,bbox_left+(176*i),y-32*col_ground+4*!col_ground)}



for(var i=0; i<array_length(cells); i++){
	draw_text(x,y-100+(15*i),cells[i])
	}