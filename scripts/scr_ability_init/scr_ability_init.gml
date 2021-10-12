// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_init(){

//++++++++++++++++++++++++++++++++++ FIRE SUPPORT ABILITIES ++++++++++++++++++++++++++++++++++++++++


ab_thawk_run[14] = spr_abilities_firesupport //sprite for icon
ab_thawk_run[13] = 2 //frame for icon
ab_thawk_run[12] = 3 //number of uses
ab_thawk_run[11] = 500 //timer 1 (bomb delay)
ab_thawk_run[10] = 2 //timer 2 (sound trigger)
ab_thawk_run[9] = 2 //timer 3 (coordinate trigger)
ab_thawk_run[8] = 0 //timer 4
ab_thawk_run[7] = 0 //timer 5
ab_thawk_run[6] = 50*120 //cooldown timer
ab_thawk_run[5] = 0 //misc val 1
ab_thawk_run[4] = 0 //misc val 2
ab_thawk_run[3] = 0 //misc val 3
ab_thawk_run[2] = 0 //misc val 4
ab_thawk_run[1] = 0 //misc val 5
ab_thawk_run[0] = scr_thawk_cluster //function to call

}