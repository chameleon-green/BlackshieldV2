
//+++++++++++++++++++++++++++++++++++++++++++++ draw self offset by 2px so tiles don't have an outline of black ++++++++++++++++++

draw_sprite_ext(spr_slope,0,x,y+5,image_xscale,image_yscale,0,c_white,1)

//++++++++++++++++++++++++++++++++++++++++++++++++++++ tiling variables +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var rounded = floor(tile_count) //count of tiles
var diff = tile_count - rounded //fractional tile at end

var deg = radtodeg(angle) //angle of slope in degree
var xoff = (cos(angle)*70)*sign(image_xscale) //xoffset for tiles
var yoff = (tan(angle)*xoff) //yoffset for tiles

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ uphill, left to right ++++++++++++++++++++++++++++++++++++++++++++++

if(sign(image_xscale) = 1){

var yscl = 42/(cos(angle)*42)

var ydisp = cos(angle)*42*yscl //how far our short edge corner projects downward. desired projection: 42
var xdisp = tan(angle) //ratio of vertical to horizontal displacement. shallow angles means less px down for every px across
var fdispf = xdisp*ydisp //displacement for final intersection
draw_sprite_general(sprite,0,0,0,ceil(35)+1,42,bbox_left+fdispf-35,y,1,1,0,c_white,c_white,c_white,c_white,1) //draw flat intersection


for(var i = 0; i < rounded; i++){
draw_sprite_ext(sprite,0,bbox_left+(xoff*i),y-(yoff*i),1,yscl,deg,c_white,1)
}
var xoff2 = (cos(angle)*(diff*70))
var yoff2 = (tan(angle)*xoff2)

draw_sprite_general(sprite,0,0,0,ceil(diff*70)+1,42,bbox_left+xoff*rounded,y-yoff*rounded,1,yscl,deg,c_white,c_white,c_white,c_white,1)
}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ downhill, left to right ++++++++++++++++++++++++++++++++++++++++++

if(sign(image_xscale) = -1){

var yscl = 42/(cos(angle)*42)

var ydisp = cos(angle)*42*yscl //how far our short edge corner projects downward. desired projection: 42
var xdisp = tan(angle) //ratio of vertical to horizontal displacement. shallow angles means less px down for every px across
var fdispf = xdisp*ydisp //displacement for final intersection
draw_sprite_general(sprite,0,0,0,ceil(35)+1,42,bbox_right+fdispf,y,1,1,0,c_white,c_white,c_white,c_white,1) //draw flat intersection


for(var i = 1; i < rounded+1; i++){
draw_sprite_ext(sprite,0,bbox_right+(xoff*i),y-(yoff*i),1,yscl,deg,c_white,1)
}

var xoff2 = -(cos(angle)*(diff*70))
var yoff2 = (tan(angle)*xoff2)

draw_sprite_general(sprite,0,0,0,ceil(diff*70)+1,42,bbox_right+xoff*(rounded)+xoff2,y-yoff*(rounded)-yoff2,1,yscl,deg,c_white,c_white,c_white,c_white,1)
}


