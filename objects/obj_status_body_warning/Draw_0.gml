//+++++++++++++++++++++++++++++++++++++ DEFINE CONSTANTS ++++++++++++++++++
scale = obj_ic.scale
image_xscale = scale
image_yscale = scale

x = obj_ic.x + xmod*scale
y = obj_ic.y + ymod*scale

//+++++++++++++++++++++++++++++++++++ MOUSE OVER HIGHLIGHT ++++++++++++++++++++++++++++++++++++++++
var Letters = string_letters(variable)
var Numbers = string_digits(variable)
var Injury = (Letters = "HeadWarning") or (Letters = "TorsoWarning") or (Letters = "LarmWarning") or (Letters = "RarmWarning") or (Letters = "LlegWarning") or (Letters = "RlegWarning") 

if((Injury and Numbers = "" and col) or (text = "ARMOR DAMAGE" and col)) {draw_sprite_ext(spr_status_body_warning,3,x,y,scale,scale,0,color,1)}

draw_self()

//++++++++++++++++++++++++++++++++++++++++++++++++ SET POINTER SUBIMAGE BASED ON EFFECT ++++++++++++++++++++++++++++++
if(variable = "HeadWarning") {draw_sprite_ext(spr_warning_pointer,3,x+15*scale,y+17*scale,scale,scale,0,color,1)}
if(variable = "HeadWarning2") {draw_sprite_ext(spr_warning_pointer,3,x+15*scale,y+17*scale,-scale,scale,0,color,1)}
if(variable = "TorsoWarning") {draw_sprite_ext(spr_warning_pointer,1,x+36*scale,y-10*scale,scale,scale,0,color,1)}
if(variable = "TorsoWarning2") {draw_sprite_ext(spr_warning_pointer,1,x-16*scale,y-10*scale,-scale,scale,0,color,1)}
if(variable = "LlegWarning") {draw_sprite_ext(spr_warning_pointer,0,x+36*scale,y-10*scale,scale,scale,0,color,1)}
if(variable = "LlegWarning2") {draw_sprite_ext(spr_warning_pointer,1,x+0*scale,y-10*scale,scale,scale,0,color,1)}
if(variable = "RlegWarning") {draw_sprite_ext(spr_warning_pointer,0,x-36*scale,y-10*scale,-scale,scale,0,color,1)}
if(variable = "RlegWarning2") {draw_sprite_ext(spr_warning_pointer,1,x-0*scale,y-10*scale,-scale,scale,0,color,1)}
if(variable = "LarmWarning") {draw_sprite_ext(spr_warning_pointer,2,x+36*scale,y-10*scale,scale,scale,0,color,1)}
if(variable = "RarmWarning") {draw_sprite_ext(spr_warning_pointer,2,x-36*scale,y-10*scale,-scale,scale,0,color,1)}
if(variable = "LarmWarning2") {draw_sprite_ext(spr_warning_pointer,1,x-10*scale,y-5*scale,scale,scale,0,color,1)}
if(variable = "RarmWarning2") {draw_sprite_ext(spr_warning_pointer,1,x+10*scale,y-5*scale,-scale,scale,0,color,1)}

//++++++++++++++++++++++++++++++++++++++++++++++++ SET POINTER AND LIVE TEXT FOR ARMOR DAMAGE WARNINGS ++++++++++++++++++++++++
if(variable = "HeadWarning3") {draw_sprite_ext(spr_warning_pointer,3,x+15*scale,y+17*scale,-scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_head*100)) + "% INTEGRITY"}
if(variable = "TorsoWarning3") {draw_sprite_ext(spr_warning_pointer,1,x-16*scale,y-10*scale,-scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_torso*100)) + "% INTEGRITY"}
if(variable = "LlegWarning3") {draw_sprite_ext(spr_warning_pointer,1,x+0*scale,y-10*scale,scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_lleg*100)) + "% INTEGRITY"}
if(variable = "RlegWarning3") {draw_sprite_ext(spr_warning_pointer,1,x-0*scale,y-10*scale,-scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_rleg*100)) + "% INTEGRITY"}
if(variable = "LarmWarning3") {draw_sprite_ext(spr_warning_pointer,1,x-10*scale,y-5*scale,scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_larm*100)) + "% INTEGRITY"}
if(variable = "RarmWarning3") {draw_sprite_ext(spr_warning_pointer,1,x+10*scale,y-5*scale,-scale,scale,0,color,1) text2 = string(round(obj_player.ar_body_rarm*100)) + "% INTEGRITY"}

draw_sprite_ext(spr_status_body_warning,image_index,x-0*scale,y,scale,scale,0,color,1)

var tscale = scale*0.5
var tscale2 = scale*0.43

if(text = "ARMOR DAMAGE")
{
var percent = string_digits(text2)

if(percent >= 75) {color = obj_ic.Yellow image_index = 0}
if(percent > 25 and percent < 75) {color = obj_ic.Orange image_index = 1}
if(percent < 25) {color = obj_ic.Red image_index = 2}

if(variable = "TorsoWarning3" and percent < 25 and percent > 0) {text2 = text2 + "\n -50% POWER"}
if(variable = "TorsoWarning3" and percent = 0) {text2 = text2 + "\n -100% POWER"}
}

draw_set_halign(fa_left)
draw_text_ext_transformed_color(x-36*scale,y-17.5*scale,text,1,999999,tscale,tscale,0,tcolor,tcolor,tcolor,tcolor,1)
draw_text_ext_transformed_color(x-23*scale,y-3*scale,text2,18,999999,tscale2,tscale,0,tcolor,tcolor,tcolor,tcolor,1)

