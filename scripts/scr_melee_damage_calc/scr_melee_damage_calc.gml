//calculates damage based on scalings for melee weapons


function scr_melee_damage_calc(player,weapon)
{

if(is_array(weapon))
{
var ScalingCount = 0
var BaseDMG = weapon[17]
var DamageMod = 0
var Scaling = 0
Scaling[0] = weapon[11];
Scaling[1] = weapon[10];
Scaling[2] = weapon[9];
Scaling[3] = weapon[8];

	//total up how many scalings to examine
	if(Scaling[3] != "none") {ScalingCount += 1} if(Scaling[2] != "none") {ScalingCount += 1} 
	if(Scaling[1] != "none") {ScalingCount += 1} if(Scaling[0] != "none") {ScalingCount += 1}

	for (var i=0; i<ScalingCount; i++)
	{ 
	var Letters = string_char_at(Scaling[i],1) + string_char_at(Scaling[i],2) + string_char_at(Scaling[i],3)
	var Numbers = real(string_digits(Scaling[i]))/100
	var Stat = variable_instance_get(player,Letters)
	DamageMod += clamp(Stat*Numbers,0,BaseDMG*1.25)
	}

return(BaseDMG+DamageMod)
}
else{return 0} //we don't have a valid weapon equipped, so the damage is 0

}