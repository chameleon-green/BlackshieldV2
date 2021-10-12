if(active = 1)
{
visible = 1
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
x = vx + (285 + 150*obj_player.powered)*obj_vc.view_multiplier
y = vy + 125*obj_vc.view_multiplier
}

else{visible = 0 x = 0 y = 0}

scale = 1.5*obj_vc.view_multiplier
image_xscale = scale
image_yscale = scale


draw_set_halign(fa_center);

var HPLength = clamp(obj_player.hp/obj_player.MaxHP,0,1)
var HPText = string(round(obj_player.hp)) + "/" + string(obj_player.MaxHP)
var StamLength = obj_player.stamina/obj_player.MaxStamina
var StaminaText = string(round(obj_player.stamina)) + "/" + string(round(obj_player.MaxStamina))
var WillLength = obj_player.will/obj_player.MaxWill
var WillText = string(round(obj_player.will)) + "/" + string(obj_player.MaxWill)


//draw stamina bar
draw_sprite_ext(spr_bars,0,x-75*scale,y-30*scale,scale*StamLength,scale,0,c_white,255)

//draw HP bar
draw_sprite_ext(spr_bars,1,x-75*scale,y-51*scale,scale*HPLength,scale,0,c_white,255)

//draw will bar
draw_sprite_ext(spr_bars,2,x-75*scale,y-14*scale,scale*WillLength,scale,0,c_white,255)



//++++++++++++++++++++++++++++++++++++++++ DRAW REACTOR GAGUE+++++++++++++++++++++++++++++++++++++++++++++++

if(obj_player.powered = 1)
{

var rot = clamp(-(obj_player.armor_heat/obj_player.armor_maxheat)*180,0-180,0)

draw_sprite_ext(spr_health_icon,1,x-232*scale,y,scale,scale,0,c_white,1) //undergage
draw_sprite_ext(spr_health_icon,3,x-237.75*scale,y-12*scale,scale,scale,rot,c_white,1) //needle
draw_sprite_ext(spr_health_icon,2,x-232*scale,y,scale,scale,0,c_white,1) //overgage
draw_set_color(c_black)

if(obj_player.reactor_output >= 100) 
{
var Hundreds = string_char_at(obj_player.reactor_output, 1)
var Tens = string_char_at(obj_player.reactor_output, 2)
var Ones = string_char_at(obj_player.reactor_output, 3)
draw_text_ext_transformed(x-225*scale,y-23*scale,Hundreds,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-211*scale,y-23*scale,Tens,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-197*scale,y-23*scale,Ones,30*scale,250*scale,scale,scale,0) //output level
}
if(obj_player.reactor_output <= 99 and obj_player.reactor_output >= 10) 
{
var Tens = string_char_at(obj_player.reactor_output, 1)
var Ones = string_char_at(obj_player.reactor_output, 2)
draw_text_ext_transformed(x-225*scale,y-23*scale,0,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-211*scale,y-23*scale,Tens,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-197*scale,y-23*scale,Ones,30*scale,250*scale,scale,scale,0) //output level
}
if(obj_player.reactor_output < 10)
{
var Ones = string_char_at(obj_player.reactor_output, 1)
draw_text_ext_transformed(x-225*scale,y-23*scale,0,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-211*scale,y-23*scale,0,30*scale,250*scale,scale,scale,0) //output level
draw_text_ext_transformed(x-197*scale,y-23*scale,Ones,30*scale,250*scale,scale,scale,0) //output level
}

}

//++++++++++++++++++++++++++++++++++++++ COOLDOWNS ++++++++++++++++++++++++++++++++++++


//------------------------------------------ cooldown 1 -------------------------------------
var array = obj_player.pl_ability1
var timer = obj_player.active_ab1[6]
var ratio = 1-timer[0]/timer[1]
var uses = obj_player.active_ab1[12]

draw_sprite_ext(spr_abilities_firesupport,array[13],x-51*scale,y+65*scale,scale,scale,0,c_white,1) //icon
draw_sprite_ext(spr_abilities_firesupport,0,x-51*scale,y+64*scale,scale,scale*ratio,0,c_white,0.75) //CD black

if(ratio > 0 and ratio < 1){
	draw_set_halign(fa_center)
	var timer_text = ratio*(timer[1]/120)
	draw_text_ext_transformed_color(x-51*scale,y+15*scale,round(timer_text),129,129,scale*1.5,scale*1.5,0,c_white,c_white,c_white,c_white,255)
}

draw_text_ext_transformed_color(x-31*scale,y+45*scale,uses,129,129,scale*0.8,scale*0.8,0,c_white,c_white,c_white,c_white,255) //uses left

//------------------------------------------ cooldown 2 -------------------------------------

draw_sprite_ext(spr_abilities_firesupport,1,x+17*scale,y+65*scale,scale,scale,0,c_white,1)
draw_sprite_ext(spr_abilities_firesupport,1,x+85*scale,y+65*scale,scale,scale,0,c_white,1)
draw_sprite_ext(spr_abilities_firesupport,1,x+153*scale,y+65*scale,scale,scale,0,c_white,1)



//+++++++++++++++++++++++++++++++++++++ DRAW SELF AND BAR TEXT +++++++++++++++++++++++++++++++++++++

draw_self()
//draw text for bars
draw_set_color(c_white)
draw_text_ext_transformed(x+45*scale,y-50*scale,HPText,0,100,0.8*scale,0.8*scale,0)
draw_text_ext_transformed(x+45*scale,y-25.75*scale,StaminaText,0,100,0.5*scale,0.5*scale,0)
draw_text_ext_transformed(x+45*scale,y-10*scale,WillText,0,100,0.5*scale,0.5*scale,0)

//++++++++++++++++++++++++++++++++++++ DRAW MINI STATUS BODY+++++++++++++++++++++++++++++++++++++++++++++++

//reference coordinates based on torso center
var xx = x-136*scale
var yy = y-20*scale
//colors
Yellow = make_color_rgb(247,191,2)
Orange = make_color_rgb(255,121,0)
Red = make_color_rgb(255,60,40)
Screen = make_color_rgb(40,25,0)
c_outline = make_colour_rgb(192,158,2)


draw_sprite_ext(spr_status_body,19,xx,yy-25*scale,scale,scale,0,obj_ic.CARHead,obj_ic.OAR_Head*3) //draw head armor
draw_sprite_ext(spr_status_body,20,xx,yy-25*scale,scale,scale,0,obj_ic.CHead,255) //draw head
draw_sprite_ext(spr_status_body,21,xx,yy,scale,scale,0,obj_ic.CARTorso,obj_ic.OAR_Torso*3) //draw torso armor
draw_sprite_ext(spr_status_body,22,xx,yy,scale,scale,0,obj_ic.CTorso,255) //draw torso
draw_sprite_ext(spr_status_body,23,xx-25*scale,yy,scale,scale,0,obj_ic.CARLArm,obj_ic.OAR_LArm*3) //draw left arm armor
draw_sprite_ext(spr_status_body,24,xx-26.5*scale,yy+0.5*scale,scale,scale,0,obj_ic.CLArm,255) //draw left arm
draw_sprite_ext(spr_status_body,25,xx+24*scale,yy,scale,scale,0,obj_ic.CARRArm,obj_ic.OAR_RArm*3) //draw right arm armor
draw_sprite_ext(spr_status_body,26,xx+25.5*scale,yy+0.5*scale,scale,scale,0,obj_ic.CRArm,255) //draw right arm

draw_sprite_ext(spr_status_body,27,xx-18*scale,yy+41*scale,scale,scale,0,obj_ic.CARLLeg,obj_ic.OAR_LLeg*3) //draw left leg armor
draw_sprite_ext(spr_status_body,28,xx-18*scale,yy+41*scale,scale,scale,0,obj_ic.CLLeg,255) //draw left leg
draw_sprite_ext(spr_status_body,29,xx+17*scale,yy+41*scale,scale,scale,0,obj_ic.CARRLeg,obj_ic.OAR_RLeg*3) //draw right leg armor
draw_sprite_ext(spr_status_body,30,xx+17*scale,yy+41*scale,scale,scale,0,obj_ic.CRLeg,255) //draw right leg


if(blink and overheat)
{
draw_sprite_ext(spr_blink,0,x-267*scale,y-39.5*scale,scale,scale,0,c_white,255)
}

override = obj_player.armor_override
if(override)
{
draw_sprite_ext(spr_blink,0,x-244*scale,y+37*scale,scale,scale,0,c_white,255)
}


//++++++++++++++++++++++++++++++++++++ DEBUG TEXT +++++++++++++++++++++++++++++++++
draw_set_halign(fa_left)

fpstimer += 1

if(fpstimer >= 30) {
	FPS = string(round(fps_real))
	fpstimer = 0
}

var cnt_e = string(instance_number(obj_enemy))
var blt_e = string(instance_number(obj_bullet)) //this counts enemy ones and frags since they are children
var elt_e = string(instance_number(obj_inventory_item))


if(variable_instance_exists(id,"FPS")) {draw_text_transformed(x-255*scale,y-85*scale,"FPS: " + FPS,scale/1.5,scale/1.5,0)}
draw_text_transformed(x-255*scale,y-73*scale,"Enemies: " + cnt_e,scale/1.5,scale/1.5,0)
draw_text_transformed(x-255*scale,y-61*scale,"Projectiles: " + blt_e,scale/1.5,scale/1.5,0)
draw_text_transformed(x-255*scale,y-49*scale,"Items: " + elt_e,scale/1.5,scale/1.5,0)






