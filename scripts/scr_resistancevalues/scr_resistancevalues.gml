function scr_resistancevalues() {

	//HEAD RESISTANCES
	if(is_array(obj_player.armor_head_item)) 
		{
		 HeadPhys = clamp(obj_player.armor_head_item[3] * ar_body_head, obj_player.armor_head_item[3]*0.1, 9999) + basePhys
		 HeadTher = clamp(obj_player.armor_head_item[4] * ar_body_head, obj_player.armor_head_item[4]*0.1, 9999) + baseTher
		 HeadCryo = clamp(obj_player.armor_head_item[5] * ar_body_head, obj_player.armor_head_item[5]*0.1, 9999) + baseCryo
		 HeadCorr = clamp(obj_player.armor_head_item[6] * ar_body_head, obj_player.armor_head_item[6]*0.1, 9999) + baseCorr
		 HeadRadi = clamp(obj_player.armor_head_item[7] * ar_body_head, obj_player.armor_head_item[7]*0.1, 9999) + baseRadi
		 HeadElec = clamp(obj_player.armor_head_item[8] * ar_body_head, obj_player.armor_head_item[8]*0.1, 9999) + baseElec
		 HeadHazm = clamp(obj_player.armor_head_item[9] * ar_body_head, obj_player.armor_head_item[9]*0.1, 9999) + baseHazm
		 HeadWarp = clamp(obj_player.armor_head_item[10] * ar_body_head, obj_player.armor_head_item[10]*0.1, 9999) + baseWarp
		 HeadPoise = obj_player.armor_head_item[15]
		} 
		else {
			  HeadPhys = basePhys
			  HeadTher = baseTher
			  HeadCryo = baseCryo
			  HeadCorr = baseCorr
			  HeadRadi = baseRadi
			  HeadElec = baseElec
			  HeadHazm = baseHazm
			  HeadWarp = baseWarp
			  HeadPoise = 0
			 }
		 
	//TORSO RESISTANCES
	if(is_array(obj_player.armor_torso_item)) 
		{
		 TorsoPhys = clamp(obj_player.armor_torso_item[3] * ar_body_torso, obj_player.armor_torso_item[3]*0.1, 9999) + basePhys
		 TorsoTher = clamp(obj_player.armor_torso_item[4] * ar_body_torso, obj_player.armor_torso_item[4]*0.1, 9999) + baseTher
		 TorsoCryo = clamp(obj_player.armor_torso_item[5] * ar_body_torso, obj_player.armor_torso_item[5]*0.1, 9999) + baseCryo
		 TorsoCorr = clamp(obj_player.armor_torso_item[6] * ar_body_torso, obj_player.armor_torso_item[6]*0.1, 9999) + baseCorr
		 TorsoRadi = clamp(obj_player.armor_torso_item[7] * ar_body_torso, obj_player.armor_torso_item[7]*0.1, 9999) + baseRadi
		 TorsoElec = clamp(obj_player.armor_torso_item[8] * ar_body_torso, obj_player.armor_torso_item[8]*0.1, 9999) + baseElec
		 TorsoHazm = clamp(obj_player.armor_torso_item[9] * ar_body_torso, obj_player.armor_torso_item[9]*0.1, 9999) + baseHazm
		 TorsoWarp = clamp(obj_player.armor_torso_item[10] * ar_body_torso, obj_player.armor_torso_item[10]*0.1, 9999) + baseWarp
		 TorsoPoise = obj_player.armor_torso_item[15]
		} 
		else {
			  TorsoPhys = basePhys
			  TorsoTher = baseTher
			  TorsoCryo = baseCryo
			  TorsoCorr = baseCorr
			  TorsoRadi = baseRadi
			  TorsoElec = baseElec
			  TorsoHazm = baseHazm
			  TorsoWarp = baseWarp
			  TorsoPoise = 0
			 }
		
	//LEFT ARM RESISTANCES
	if(is_array(obj_player.armor_armL_item)) 
		{
		 ArmLPhys = clamp(obj_player.armor_armL_item[3] * ar_body_larm, obj_player.armor_armL_item[3]*0.1, 9999) + basePhys
		 ArmLTher = clamp(obj_player.armor_armL_item[4] * ar_body_larm, obj_player.armor_armL_item[4]*0.1, 9999) + baseTher
		 ArmLCryo = clamp(obj_player.armor_armL_item[5] * ar_body_larm, obj_player.armor_armL_item[5]*0.1, 9999) + baseCryo
		 ArmLCorr = clamp(obj_player.armor_armL_item[6] * ar_body_larm, obj_player.armor_armL_item[6]*0.1, 9999) + baseCorr
		 ArmLRadi = clamp(obj_player.armor_armL_item[7] * ar_body_larm, obj_player.armor_armL_item[7]*0.1, 9999) + baseRadi
		 ArmLElec = clamp(obj_player.armor_armL_item[8] * ar_body_larm, obj_player.armor_armL_item[8]*0.1, 9999) + baseElec
		 ArmLHazm = clamp(obj_player.armor_armL_item[9] * ar_body_larm, obj_player.armor_armL_item[9]*0.1, 9999) + baseHazm
		 ArmLWarp = clamp(obj_player.armor_armL_item[10] * ar_body_larm, obj_player.armor_armL_item[10]*0.1, 9999) + baseWarp
		 ArmLPoise = obj_player.armor_armL_item[15]
		} 
		else {
			  ArmLPhys = basePhys
			  ArmLTher = baseTher
			  ArmLCryo = baseCryo
			  ArmLCorr = baseCorr
			  ArmLRadi = baseRadi
			  ArmLElec = baseElec
			  ArmLHazm = baseHazm
			  ArmLWarp = baseWarp
			  ArmLPoise = 0
			 }

	//RIGHT ARM RESISTANCES
	if(is_array(obj_player.armor_armR_item)) 
		{
		 ArmRPhys = clamp(obj_player.armor_armR_item[3] * ar_body_rarm, obj_player.armor_armR_item[3]*0.1, 9999) + basePhys
		 ArmRTher = clamp(obj_player.armor_armR_item[4] * ar_body_rarm, obj_player.armor_armR_item[4]*0.1, 9999) + baseTher
		 ArmRCryo = clamp(obj_player.armor_armR_item[5] * ar_body_rarm, obj_player.armor_armR_item[5]*0.1, 9999) + baseCryo
		 ArmRCorr = clamp(obj_player.armor_armR_item[6] * ar_body_rarm, obj_player.armor_armR_item[6]*0.1, 9999) + baseCorr
		 ArmRRadi = clamp(obj_player.armor_armR_item[7] * ar_body_rarm, obj_player.armor_armR_item[7]*0.1, 9999) + baseRadi
		 ArmRElec = clamp(obj_player.armor_armR_item[8] * ar_body_rarm, obj_player.armor_armR_item[8]*0.1, 9999) + baseElec
		 ArmRHazm = clamp(obj_player.armor_armR_item[9] * ar_body_rarm, obj_player.armor_armR_item[9]*0.1, 9999) + baseHazm
		 ArmRWarp = clamp(obj_player.armor_armR_item[10] * ar_body_rarm, obj_player.armor_armR_item[10]*0.1, 9999) + baseWarp
		 ArmRPoise = obj_player.armor_armR_item[15]
		} 
		else {
			  ArmRPhys = basePhys
			  ArmRTher = baseTher
			  ArmRCryo = baseCryo
			  ArmRCorr = baseCorr
			  ArmRRadi = baseRadi
			  ArmRElec = baseElec
			  ArmRHazm = baseHazm
			  ArmRWarp = baseWarp
			  ArmRPoise = 0 
			 }

	//LEFT LEG RESISTANCES
	if(is_array(obj_player.armor_legL_item)) 
		{
		 LegLPhys = clamp(obj_player.armor_legL_item[3] * ar_body_lleg, obj_player.armor_legL_item[3]*0.1, 9999) + basePhys
		 LegLTher = clamp(obj_player.armor_legL_item[4] * ar_body_lleg, obj_player.armor_legL_item[4]*0.1, 9999) + baseTher
		 LegLCryo = clamp(obj_player.armor_legL_item[5] * ar_body_lleg, obj_player.armor_legL_item[5]*0.1, 9999) + baseCryo
		 LegLCorr = clamp(obj_player.armor_legL_item[6] * ar_body_lleg, obj_player.armor_legL_item[6]*0.1, 9999) + baseCorr
		 LegLRadi = clamp(obj_player.armor_legL_item[7] * ar_body_lleg, obj_player.armor_legL_item[7]*0.1, 9999) + baseRadi
		 LegLElec = clamp(obj_player.armor_legL_item[8] * ar_body_lleg, obj_player.armor_legL_item[8]*0.1, 9999) + baseElec
		 LegLHazm = clamp(obj_player.armor_legL_item[9] * ar_body_lleg, obj_player.armor_legL_item[9]*0.1, 9999) + baseHazm
		 LegLWarp = clamp(obj_player.armor_legL_item[10] * ar_body_lleg, obj_player.armor_legL_item[10]*0.1, 9999) + baseWarp
		 LegLPoise = obj_player.armor_legL_item[15]
		} 
		else {
			  LegLPhys = basePhys
			  LegLTher = baseTher
			  LegLCryo = baseCryo
			  LegLCorr = baseCorr
			  LegLRadi = baseRadi
			  LegLElec = baseElec
			  LegLHazm = baseHazm
			  LegLWarp = baseWarp
			  LegLPoise = 0 
			 }

	//RIGHT LEG RESISTANCES
	if(is_array(obj_player.armor_legR_item)) 
		{
		 LegRPhys = clamp(obj_player.armor_legR_item[3] * ar_body_rleg, obj_player.armor_legR_item[3]*0.1, 9999) + basePhys
		 LegRTher = clamp(obj_player.armor_legR_item[4] * ar_body_rleg, obj_player.armor_legR_item[4]*0.1, 9999) + baseTher
		 LegRCryo = clamp(obj_player.armor_legR_item[5] * ar_body_rleg, obj_player.armor_legR_item[5]*0.1, 9999) + baseCryo
		 LegRCorr = clamp(obj_player.armor_legR_item[6] * ar_body_rleg, obj_player.armor_legR_item[6]*0.1, 9999) + baseCorr
		 LegRRadi = clamp(obj_player.armor_legR_item[7] * ar_body_rleg, obj_player.armor_legR_item[7]*0.1, 9999) + baseRadi
		 LegRElec = clamp(obj_player.armor_legR_item[8] * ar_body_rleg, obj_player.armor_legR_item[8]*0.1, 9999) + baseElec
		 LegRHazm = clamp(obj_player.armor_legR_item[9] * ar_body_rleg, obj_player.armor_legR_item[9]*0.1, 9999) + baseHazm
		 LegRWarp = clamp(obj_player.armor_legR_item[10] * ar_body_rleg, obj_player.armor_legR_item[10]*0.1, 9999) + baseWarp
		 LegRPoise = obj_player.armor_legR_item[15]
		} 
		else {
			  LegRPhys = basePhys
			  LegRTher = baseTher
			  LegRCryo = baseCryo
			  LegRCorr = baseCorr
			  LegRRadi = baseRadi
			  LegRElec = baseElec
			  LegRHazm = baseHazm
			  LegRWarp = baseWarp
			  LegRPoise = 0 
			 }


	//calculate total resistances 
	resist_phys = (HeadPhys + TorsoPhys + ArmLPhys + ArmRPhys + LegRPhys + LegLPhys -(5*basePhys) )
	resist_ther = (HeadTher + TorsoTher + ArmLTher + ArmRTher + LegRTher + LegLTher -(5*baseTher) )
	resist_cryo = (HeadCryo + TorsoCryo + ArmLCryo + ArmRCryo + LegRCryo + LegLCryo -(5*baseCryo) )
	resist_corr = (HeadCorr + TorsoCorr + ArmLCorr + ArmRCorr + LegRCorr + LegLCorr -(5*baseCorr) )
	resist_radi = (HeadRadi + TorsoRadi + ArmLRadi + ArmRRadi + LegRRadi + LegLRadi -(5*baseRadi) )
	resist_elec = (HeadElec + TorsoElec + ArmLElec + ArmRElec + LegRElec + LegLElec -(5*baseElec) )
	resist_hazm = (HeadHazm + TorsoHazm + ArmLHazm + ArmRHazm + LegRHazm + LegLHazm -(5*baseHazm) )
	resist_warp = (HeadWarp + TorsoWarp + ArmLWarp + ArmRWarp + LegRWarp + LegLWarp -(5*baseWarp) )

	resist_bleed = baseBleed
	resist_poison = basePoison
	//resist_chill = baseChill
	//resist_iradd = baseIradd

	poise = basePoise + HeadPoise + TorsoPoise + ArmLPoise + ArmRPoise + LegLPoise + LegRPoise



}
