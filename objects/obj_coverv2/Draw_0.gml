

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
var cntcell = array_length(cells)
var cntpillar = array_length(pillars)

for(var i=0; i<cntpillar; i++){	
	
	//draw pillars, accounting for gaps
	draw_sprite(Me[1],8,bbox_left+(176*i),y-32*col_ground+4*!col_ground)	
	
	if(i<cntcell) {
			if (col_ground) {draw_sprite(Me[1],0,bbox_left+(176*i),y)} //draw curb
			if (!cells[i]) {
				draw_sprite(Me[1],3,bbox_left+48+(176*i),y-28*col_ground+4*!col_ground) //draw windows, offset for curb if applicable
				}
				else {
					draw_sprite(Me[1],1,bbox_left+48+(176*i),y-28*col_ground+4*!col_ground) //draw solid window, plus solid pillars
					draw_sprite(Me[1],10,bbox_left+(176*i),y-32*col_ground+4*!col_ground)
					draw_sprite(Me[1],10,bbox_left+(176*(i+1)),y-32*col_ground+4*!col_ground)
				}
	}	
	
}


for(var i=0; i<array_length(cells); i++){
draw_text(x,y-100+(15*i),cells[i])
}