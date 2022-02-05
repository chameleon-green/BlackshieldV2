draw_self()


if(draw_tiles_top = 1 and draw_tiles_top2){
	
var rounded = floor(tile_count)
var diff = tile_count - rounded

for(var i = 0; i < rounded; i++){
draw_sprite(spr_platform_tile,0,bbox_left+(70*i),bbox_top)
}

draw_sprite_part(spr_platform_tile,0,0,0,ceil(diff*70)+1,42,bbox_left+70*rounded,bbox_top)
}