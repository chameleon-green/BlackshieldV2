var shop = (obj_ic.containering or obj_ic.shopping)
scale = obj_ic.scale
x = obj_ic.x+50*scale + 200*shop*scale
y = obj_ic.y-20*scale
if(obj_ic.visible != 1) {instance_destroy(self)}

scale = obj_ic.scale
SubImg = 6

draw_sprite_ext(spr_inventory_screen,6,x+238*scale,y+91*scale,scale,scale,0,c_white,1) //bg screen

var Exit_X = x-10*scale
var Exit_Y = y-21*scale
var T_Scale = 0.75
draw_set_halign(fa_left)
draw_set_color(c_yellow)
draw_text_ext_transformed(x-10*scale,y,desc,20,750,scale*T_Scale,scale*T_Scale,0)
draw_set_color(c_white)

if(point_in_circle(obj_crosshair.x,obj_crosshair.y,Exit_X,Exit_Y,20*scale)) {SubImg = 7}
draw_sprite_ext(spr_button,SubImg,Exit_X,Exit_Y,scale,scale,0,c_white,1)
