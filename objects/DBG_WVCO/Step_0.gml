col = place_meeting(x,y,obj_crosshair)
var E = keyboard_check_pressed(ord("E"))
if(col and E) {start = 1}

//----------------------------------------- start up game --------------------------

if(start and start_toggle) {wavestart = 1 start_toggle = 0}

//---------------------------------------- wave logic check -----------------------------

//if waves are enabled and we have 0 enemies, wavestart relies on break timer
if(wave_toggle = 1 and instance_number(obj_enemy ) = 0 and wavecount > 0){
	
	wavestart = timer_tick(break_timer,1)	
}

//if wavestart is triggered, toggle it off and spawn dudes, plus reset timer
if(wavestart) {
	wavecount += 1
	wavestart = 0
	timer_reset(break_timer,0)
	
	repeat (9) {with(instance_create_depth(112,3700,1,obj_enemy)) {MyType = scr_guardsman_init}}
	
	var Leader = instance_create_depth(112,3700,1,obj_enemy)
	with(Leader) {MyType = scr_guardsman_init leader = 1 weapon = "bolter"}
	
	/*
	repeat (9) {with(instance_create_depth(11900,3700,1,obj_enemy)) {MyType = scr_guardsman_init}}
	
	var Leader = instance_create_depth(11900,3700,1,obj_enemy)
	with(Leader) {MyType = scr_guardsman_init leader = 1 weapon = "bolter"}

	*/
	
	
}