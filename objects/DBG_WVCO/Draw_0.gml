
var c_outline = c_yellow//make_colour_rgb(192,158,2)

if(col) {
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	if(Cdist < 300) {

		gpu_set_fog(1,c_outline,0,0)
		draw_sprite_ext(sprite_index,image_index,x+2,y+2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x-2,y-2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x-2,y+2,image_xscale,image_yscale,0,c_white,255)
		draw_sprite_ext(sprite_index,image_index,x+2,y-2,image_xscale,image_yscale,0,c_white,255)
		gpu_set_fog(0,c_white,0,0)
		}
}

draw_self()

if(col and wavecount < 1) {
	var Cdist = abs(point_distance(obj_player.x,obj_player.y,x,y))
	if(Cdist < 300) {
		var text = "Press E to begin"
		var Carray = sprite_get_uvs(sprite_index, image_index)	
		var height = abs(Carray[1] - Carray[3])*4096
		draw_set_halign(fa_center)
		//draw_text_color(x,y-height-50,cString,c_outline,c_outline,c_outline,c_outline,1)
		draw_text_color(x,y-height-30,text,c_outline,c_outline,c_outline,c_outline,1)
		draw_set_halign(fa_left)
		}
		
}

draw_set_halign(fa_center)
var BreakLeft = "Time Until Next Wave: " + string(round(30-break_timer[0]/120))
if(wavecount > 0) {var WaveCount = "Wave: " + string(wavecount)} else {var WaveCount = ""}
if(break_timer[0] > 0){draw_text_color(x,bbox_top-30,BreakLeft,c_outline,c_outline,c_outline,c_outline,1)}
draw_text_color(x,bbox_top-50,WaveCount,c_outline,c_outline,c_outline,c_outline,1)