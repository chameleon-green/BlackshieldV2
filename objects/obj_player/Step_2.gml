///@description limb HP delta and injuries
//+++++++++++++++++++++++++++++++++++++++++ Shorthand for long ass perk recognition +++++++++++


var HPhead = hp_body_head/hp_body_head_max
var HPtorso = hp_body_torso/hp_body_torso_max
var HPlarm = hp_body_llarm/hp_body_llarm_max
var HPrarm = hp_body_rarm/hp_body_rarm_max
var HPlleg = hp_body_lleg/hp_body_lleg_max
var HPrleg = hp_body_rleg/hp_body_rleg_max	

var Head_Minor = (ds_list_find_index(AfflictionsList, "head_injured") != -1)
var Head_Major = (ds_list_find_index(AfflictionsList, "head_injured2") != -1)
var Head_Severed = (ds_list_find_index(AfflictionsList, "head_severed") != -1)
var Torso_Minor = (ds_list_find_index(AfflictionsList, "torso_injured") != -1)
var Torso_Major = (ds_list_find_index(AfflictionsList, "torso_injured2") != -1)
var Torso_Severed = (ds_list_find_index(AfflictionsList, "torso_severed") != -1)
var Larm_Minor = (ds_list_find_index(AfflictionsList, "larm_injured") != -1)
var Larm_Major = (ds_list_find_index(AfflictionsList, "larm_injured2") != -1)
var Larm_Severed = (ds_list_find_index(AfflictionsList, "larm_severed") != -1)
var Rarm_Minor = (ds_list_find_index(AfflictionsList, "rarm_injured") != -1)
var Rarm_Major = (ds_list_find_index(AfflictionsList, "rarm_injured2") != -1)
var Rarm_Severed = (ds_list_find_index(AfflictionsList, "rarm_severed") != -1)
var Lleg_Minor = (ds_list_find_index(AfflictionsList, "lleg_injured") != -1)
var Lleg_Major = (ds_list_find_index(AfflictionsList, "lleg_injured2") != -1)
var Lleg_Severed = (ds_list_find_index(AfflictionsList, "lleg_severed") != -1)
var Rleg_Minor = (ds_list_find_index(AfflictionsList, "rleg_injured") != -1)
var Rleg_Major = (ds_list_find_index(AfflictionsList, "rleg_injured2") != -1)
var Rleg_Severed = (ds_list_find_index(AfflictionsList, "rleg_severed") != -1)

//++++++++++++++++++++++++++++++++++++++++++++++ LIMB HP DELTA CALCS AND AMPUTATIONS ++++++++++++++++++++++++++++++++++++++++++++++++++++++
var threshold = 0.5

hp_end_head = hp_body_head
hp_end_torso = hp_body_torso
hp_end_larm = hp_body_llarm
hp_end_rarm = hp_body_rarm
hp_end_lleg = hp_body_lleg
hp_end_rleg = hp_body_rleg
hp_end = hp

//calculate HP at death. high negative hp means less likely to survive
if(hp <= 0 and death_delta_toggle) {
	death_delta_toggle = 0
	HPDelta = abs(0 + hp)
}

if(hp_end_head != hp_prev_head) {var HeadChange = abs(hp_end_head - hp_prev_head)} else{HeadChange = 0}
if(hp_end_torso != hp_prev_torso) {var TorsoChange = abs(hp_end_torso - hp_prev_torso)} else{TorsoChange = 0}
if(hp_end_larm != hp_prev_larm) {var LarmChange = abs(hp_end_larm - hp_prev_larm)} else{LarmChange = 0}
if(hp_end_rarm != hp_prev_rarm) {var RarmChange = abs(hp_end_rarm - hp_prev_rarm)} else{RarmChange = 0}
if(hp_end_lleg != hp_prev_lleg) {var LlegChange = abs(hp_end_lleg - hp_prev_lleg)} else{LlegChange = 0}
if(hp_end_rleg != hp_prev_rleg) {var RlegChange = abs(hp_end_rleg - hp_prev_rleg)} else{RlegChange = 0}

if(HeadChange > hp_body_head_max*threshold and hp_body_head <= 0) {if(!Head_Severed) {ds_list_add(AfflictionsList,"head_severed")}}
if(TorsoChange > hp_body_torso_max*threshold and hp_body_torso <= 0) {if(!Torso_Severed) {ds_list_add(AfflictionsList,"torso_severed")}}
if(LarmChange > hp_body_llarm_max*threshold and hp_body_llarm <= 0) {if(!Larm_Severed) {ds_list_add(AfflictionsList,"larm_severed")}}
if(RarmChange > hp_body_rarm_max*threshold and hp_body_rarm <= 0) {if(!Rarm_Severed) {ds_list_add(AfflictionsList,"rarm_severed")}}
if(LlegChange > hp_body_lleg_max*threshold and hp_body_lleg <= 0) {if(!Lleg_Severed) {ds_list_add(AfflictionsList,"lleg_severed")}}
if(RlegChange > hp_body_rleg_max*threshold and hp_body_rleg <= 0) {if(!Rleg_Severed) {ds_list_add(AfflictionsList,"rleg_severed")}}

HeadChange = 0
TorsoChange = 0
LarmChange = 0
RarmChange = 0
LlegChange = 0
RlegChange = 0


//++++++++++++++++++++++++++++++++++++++++++++++++++ INJURY STATES ++++++++++++++++++++++++++++++++++++++++

//------------Head Injuries

if(HPhead < 0.75 and !Head_Major and !Head_Severed)
	{
	if(!Head_Minor) {ds_list_add(AfflictionsList,"head_injured")}
	}
if(HPhead < 0.25 and !Head_Severed) 
	{
	if(!Head_Major) {ds_list_add(AfflictionsList,"head_injured2")}
	if(Head_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured"))}
	}
if(Head_Severed) 
	{
	if(Head_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured2"))}
	if(Head_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "head_injured"))}
	}

//------------Torso Injuries

if(HPtorso < 0.75 and !Torso_Major and !Torso_Severed)
	{
	if(!Torso_Minor) {ds_list_add(AfflictionsList,"torso_injured")}
	}

if(HPtorso < 0.25 and !Torso_Severed) 
	{
	if(!Torso_Major) {ds_list_add(AfflictionsList,"torso_injured2")}
	if(Torso_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured"))}
	}
if(Torso_Severed) 
	{
	if(Torso_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured2"))}
	if(Torso_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "torso_injured"))}
	}

//------------- Arm Injuries	

if(HPlarm < 0.75 and !Larm_Major and !Larm_Severed)
	{
	if(!Larm_Minor) {ds_list_add(AfflictionsList,"larm_injured")}
	}
if(HPlarm < 0.25 and !Larm_Severed) 
	{
	if(!Larm_Major) {ds_list_add(AfflictionsList,"larm_injured2")}
	if(Larm_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured"))}
	}
if(Larm_Severed) 
	{
	if(Larm_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured2"))}
	if(Larm_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "larm_injured"))}
	}

if(HPrarm < 0.75 and !Rarm_Major and !Rarm_Severed)
	{
	if(!Rarm_Minor) {ds_list_add(AfflictionsList,"rarm_injured")}
	}
if(HPrarm < 0.25 and !Rarm_Severed) 
	{
	if(!Rarm_Major) {ds_list_add(AfflictionsList,"rarm_injured2")}
	if(Rarm_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured"))}
	}
if(Rarm_Severed) 
	{
	if(Rarm_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured2"))}
	if(Rarm_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rarm_injured"))}
	}

//------------- Leg Injuries	

if(HPlleg < 0.75 and !Lleg_Major and !Lleg_Severed)
	{
	if(!Lleg_Minor) {ds_list_add(AfflictionsList,"lleg_injured")}
	}
if(HPlleg < 0.25 and !Lleg_Severed) 
	{
	if(!Lleg_Major) {ds_list_add(AfflictionsList,"lleg_injured2")}
	if(Lleg_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured"))}
	}
if(Lleg_Severed) 
	{
	if(Lleg_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured2"))}
	if(Lleg_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "lleg_injured"))}
	}
	
if(HPrleg < 0.75 and !Rleg_Major and !Rleg_Severed)
	{
	if(!Rleg_Minor) {ds_list_add(AfflictionsList,"rleg_injured")}
	}
if(HPrleg < 0.25 and !Rleg_Severed) 
	{
	if(!Rleg_Major) {ds_list_add(AfflictionsList,"rleg_injured2")}
	if(Rleg_Minor) {ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured"))}
	}
if(Rleg_Severed) 
	{
	if(Rleg_Major) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured2"))}
	if(Rleg_Minor) 
	{ds_list_delete(AfflictionsList,ds_list_find_index(AfflictionsList, "rleg_injured"))}
	}
