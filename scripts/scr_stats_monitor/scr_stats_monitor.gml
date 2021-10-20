function scr_stats_monitor() {
	Legion = "none"

	baseEND = ds_map_find_value(global.stats, "Endurance") 
	baseSTR = ds_map_find_value(global.stats, "Strength")
	baseAGI = ds_map_find_value(global.stats, "Agility") 
	baseINT = ds_map_find_value(global.stats, "Intelligence")
	baseCHR = ds_map_find_value(global.stats, "Charisma")
	baseWIL = ds_map_find_value(global.stats, "Will")
	baseLCK = ds_map_find_value(global.stats, "Luck")
	basePER = ds_map_find_value(global.stats, "Perception")
	baseDEX = ds_map_find_value(global.stats, "Dexterity")

	END = baseEND + modEND
	STR = baseSTR + modSTR
	AGI = clamp(baseAGI + modAGI,1,9999)
	INT = baseINT + modINT
	CHR = baseCHR + modCHR
	WIL = baseWIL + modWIL
	PER = basePER + modPER
	DEX = baseDEX + modDEX
	LCK = baseLCK + modLCK


	CarryWeight = round(STR*4 + END*0.5 + WIL*0.25) //475 max carryweight
	MaxWill = WIL*2 //200 max will
	baseMaxHP = clamp( round( (baseEND*7) + (baseLCK/4) + (baseWIL/2) ), 1, 100000)//775 max HP needed to calculate limb health
	MaxHP = clamp( round( (END*7) + (LCK/4) + (WIL/2) ), 1, 100000)//775 max HP

	JumpHeight = clamp(25*(AGI/100), 20, 25)
	MaxStamina = END*1.5 + (AGI/4) + (WIL/4) //200 max stamina

	CritChance = clamp(round(LCK/5),0.5,25) //100 luck = 25% crit
	CritMod = ( (100+PER) + (LCK/2) ) / 100 //250% max crit mod


	//++++++++++++++++++++++++++++++ MOVESPEED CALCS (complicated) +++++++++++++++++++++++++

	var reactor_power = ((reactor_output/100)/2) + 0.5 //what is our reactor output?
	var AGI_Mod = power(AGI,(1/3))*4 //derive main component of movespeed from agility

	//check if our legs are power armored
	if(is_array(armor_legL_item)) //is our left leg power armored?
		{
		if(armor_legL_item[11] = "power") {legL_Power_Armored = 1}
		else{legL_Power_Armored = 0}
		}
	else{legL_Power_Armored = 0}

	if(is_array(armor_legR_item)) //is our right leg power armored?
		{
		if(armor_legR_item[11] = "power") {legR_Power_Armored = 1}
		else{legR_Power_Armored = 0}
		}
	else{legR_Power_Armored = 0}

	//modify reactor modifier
	if(powered = 0) {reactor_power = 1} //if we are not powered, set multiplier to 1 (modifies nothing as there is no power)
	if(!legR_Power_Armored and legL_Power_Armored and powered) {reactor_power = reactor_power/1.25} //if we have only one powered leg and power, reactor modifies speed less
	if(legR_Power_Armored and !legL_Power_Armored and powered) {reactor_power = reactor_power/1.25} //if we have only one powered leg and power, reactor modifies speed less
	if(!legR_Power_Armored and !legL_Power_Armored and powered) {reactor_power = 1} //if we have no powered legs but power, reactor doesn't affect movespeed

	var BaseSpeed = AGI_Mod 
	var legL_Mod = BaseSpeed*0.2*legL_Power_Armored*!powered //subtract 20% of speed if one leg is armored but no power
	var legR_Mod = BaseSpeed*0.2*legR_Power_Armored*!powered //subtract an additional 20% of speed if one leg is armored but no power
	var AdjustedSpeed = (BaseSpeed - legL_Mod - legR_Mod) * reactor_power //adjust final speed with reactor modifier

	var WeightlessMoveSpeed = clamp(AdjustedSpeed,0,38) / (LegsCrippled + 1) //clamp movespeed to min and max

	//+++++++++++++++++++++++++++++++++++++++++++++++++++ HP STUFF +++++++++++++++++++++++++++++++++++++++++++
	hp_body_head_max = baseMaxHP*0.11
	hp_body_torso_max = baseMaxHP*0.23
	hp_body_llarm_max = baseMaxHP*0.13
	hp_body_rarm_max = baseMaxHP*0.13
	hp_body_lleg_max = baseMaxHP*0.2
	hp_body_rleg_max = baseMaxHP*0.2

	//+++++++++++++++++++++++++++++++++++++++++++++++ BASE RESISTANCES ++++++++++++++++++++++++++++++++++++++++

	//bolt pistol hits for 20 dmg
	basePhys = ceil(END/20) //max 5 physical resist
	baseTher = ceil(END/10) //max 10 thermal resist
	baseCryo = ceil(END/10) //max 10 cold resist
	baseCorr = ceil(END/30) //max 4 corrosive resist
	baseRadi = ceil(END/30) //max 4 radiation resist
	baseElec = ceil(END/30) //max 4 shock resist
	baseHazm = ceil(END/30) //max 4 hazmat/poison resist
	baseWarp = ceil(INT/10) + ceil(WIL/10) //max 20 warp resist (DENY THE WITCH!)
	basePoise = ceil(STR/5) + ceil(END/10) + ceil(WIL/10) //max 40 poise

	baseBleed = END*3 + ceil(LCK/3)
	basePoison = END*3 + ceil(LCK/3)
	
	//++++++++++++++++++++++++++++++++++++++++++++++ CARRY WEIGHT STUFF +++++++++++++++++++++++++++++++++++++++
	if(instance_exists(obj_ic)){
		var Weight = obj_ic.InvWeight
		var Capacity = CarryWeight
		var Ratio = (Weight/Capacity)*100
		var ExponentDenom = power(2,(Ratio/30))
		var Modifier = 1-(1/ExponentDenom)
		var FinalMod = 1-(Modifier/2)
		obj_ic.SpeedPenalty = string(100*(Modifier/2)) + "%"
		
		MoveSpeed = WeightlessMoveSpeed*FinalMod
		if(Weight > Capacity) {cansprint = 0} else{cansprint = 1}
	}



}
