function TEMPLATE_resistances() {
	hp = TorsoHp + HeadHp + LegsHp

	var Dura_Head = HeadDurability/HeadDurabilityMax
	HeadPhys = round(3 * Dura_Head) //5
	HeadTher = round(10 * Dura_Head)
	HeadCryo = round(5 * Dura_Head)
	HeadCorr = round(5 * Dura_Head)
	HeadRadi = round(5 * Dura_Head)
	HeadElec = round(5 * Dura_Head)
	HeadHazm = round(5 * Dura_Head)
	HeadWarp = round(0 * Dura_Head)

	var Dura_Torso = TorsoDurability/TorsoDurabilityMax //commented values are for mkii power armor (check to make sure)
	TorsoPhys = round(15 * Dura_Torso) //35
	TorsoTher = round(30 * Dura_Torso) //45
	TorsoCryo = round(10 * Dura_Torso) //10
	TorsoCorr = round(5 * Dura_Torso) //50
	TorsoRadi = round(5 * Dura_Torso) //25
	TorsoElec = round(5 * Dura_Torso) //25
	TorsoHazm = round(5 * Dura_Torso) //75
	TorsoWarp = round(0 * Dura_Torso) //0

	var Dura_Legs = LegsDurability/LegsDurabilityMax
	LegsPhys = round(10 * Dura_Legs) //10
	LegsTher = round(20 * Dura_Legs)
	LegsCryo = round(5 * Dura_Legs)
	LegsCorr = round(5 * Dura_Legs)
	LegsRadi = round(5 * Dura_Legs)
	LegsElec = round(5 * Dura_Legs)
	LegsHazm = round(5 * Dura_Legs)
	LegsWarp = round(0 * Dura_Legs)



}
