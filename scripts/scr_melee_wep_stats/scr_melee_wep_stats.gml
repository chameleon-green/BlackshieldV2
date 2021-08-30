// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_melee_wep_stats()
{

if(scaling1 != "none")
	{
	var _Self = scaling1
	var _Letters = string_char_at(_Self,1)+string_char_at(_Self,2)+string_char_at(_Self,3)+string_char_at(_Self,4)+string_char_at(_Self,5)+string_char_at(_Self,6)
	var _String = _Letters
	draw_text_transformed_colour(xx+383*scale,yy+300*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(scaling2 != "none")
	{
	var _Self = scaling2
	var _Letters = string_char_at(_Self,1)+string_char_at(_Self,2)+string_char_at(_Self,3)+string_char_at(_Self,4)+string_char_at(_Self,5)+string_char_at(_Self,6)
	var _String = _Letters
	draw_text_transformed_colour(xx+431*scale,yy+300*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(scaling3 != "none")
	{
	var _Self = scaling3
	var _Letters = string_char_at(_Self,1)+string_char_at(_Self,2)+string_char_at(_Self,3)+string_char_at(_Self,4)+string_char_at(_Self,5)+string_char_at(_Self,6)
	var _String = _Letters
	draw_text_transformed_colour(xx+479*scale,yy+300*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(scaling4 != "none")
	{
	var _Self = scaling4
	var _Letters = string_char_at(_Self,1)+string_char_at(_Self,2)+string_char_at(_Self,3)+string_char_at(_Self,4)+string_char_at(_Self,5)+string_char_at(_Self,6)
	var _String = _Letters
	draw_text_transformed_colour(xx+527*scale,yy+300*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(dmgtype1 != "none")
	{
	var _Letters = string_letters(dmgtype1)
	var _Numbers = string(real(string_digits(dmgtype1))*1)
	if(_Letters = "physical") {var Letters2 = "PHYS"}
	if(_Letters = "thermal") {var Letters2 = "THER"}
	if(_Letters = "cryo") {var Letters2 = "CRYO"}
	if(_Letters = "corrosive") {var Letters2 = "CORR"}
	if(_Letters = "radiation") {var Letters2 = "RADI"}
	if(_Letters = "electric") {var Letters2 = "ELEC"}
	if(_Letters = "biohazard") {var Letters2 = "BIHZ"}
	if(_Letters = "warp") {var Letters2 = "WARP"}
	var _String = Letters2 + " " + _Numbers + "%"
	draw_text_transformed_colour(xx+383*scale,yy+333*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(dmgtype2 != "none")
	{
	var _Letters = string_letters(dmgtype2)
	var _Numbers = string(real(string_digits(dmgtype2))*1)
	if(_Letters = "physical") {var Letters2 = "PHYS"}
	if(_Letters = "thermal") {var Letters2 = "THER"}
	if(_Letters = "cryo") {var Letters2 = "CRYO"}
	if(_Letters = "corrosive") {var Letters2 = "CORR"}
	if(_Letters = "radiation") {var Letters2 = "RADI"}
	if(_Letters = "electric") {var Letters2 = "ELEC"}
	if(_Letters = "biohazard") {var Letters2 = "BIHZ"}
	if(_Letters = "warp") {var Letters2 = "WARP"}
	var _String = Letters2 + " " + _Numbers + "%"
	draw_text_transformed_colour(xx+456*scale,yy+333*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

if(dmgtype3 != "none")
	{
	var _Letters = string_letters(dmgtype3)
	var _Numbers = string(real(string_digits(dmgtype3))*1)
	if(_Letters = "physical") {var Letters2 = "PHYS"}
	if(_Letters = "thermal") {var Letters2 = "THER"}
	if(_Letters = "cryo") {var Letters2 = "CRYO"}
	if(_Letters = "corrosive") {var Letters2 = "CORR"}
	if(_Letters = "radiation") {var Letters2 = "RADI"}
	if(_Letters = "electric") {var Letters2 = "ELEC"}
	if(_Letters = "biohazard") {var Letters2 = "BIHZ"}
	if(_Letters = "warp") {var Letters2 = "WARP"}
	var _String = Letters2 + " " + _Numbers + "%"
	draw_text_transformed_colour(xx+529*scale,yy+333*scale,_String,scale*0.8,scale*1,0,color,color,color,color,255)
	}

}