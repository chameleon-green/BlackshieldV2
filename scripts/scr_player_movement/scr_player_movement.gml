function scr_player_movement() {

//++++++++++++++++++++++++++++++++++++++++++ VARIABLES ++++++++++++++++++++++++++++++++++++++++++++++++
	
	var anim_array2 = wpn_melee[wpn_melee.Animations]
	var anim_array = wpn_ranged[wpn_ranged.Animations]
	var sprint = anim_array[2]
	var walk = anim_array[1]
	var backwalk = anim_array[0]
	var face_left = mouse_x < x
	var face_right = mouse_x > x
	if(LegsCrippled = 1) {walk = "walk_crawl"}

	//skeleton_animation_mix("idle_air",anim_array[5],0.1)
	
	var D = keyboard_check(ord("D")) and !keyboard_check(ord("A"))
	var A = keyboard_check(ord("A")) and !keyboard_check(ord("D"))
	var S = keyboard_check(ord("S"))
	var Shift = keyboard_check(vk_shift)
	
	cSpeed = 30*D + -30*A //+ (30*swinging*image_xscale) //clamp hspeed for collision stuff, need a minimum
	
	var x1 = bbox_left - 10 + cSpeed - 30*swinging
	var x2 = bbox_right + 10 + cSpeed + 30*swinging
	var y1 = bbox_bottom - 5
	var y2 = bbox_bottom + abs(cSpeed) + 15
	col_slope = collision_rectangle(x1,y1,x2,y2,obj_slope,true,0) 
	
	col_right = place_meeting(bbox_right+hspeed,y,obj_platform) and !place_meeting(bbox_right + 10 + cSpeed,y+abs(cSpeed)+15,obj_slope)
	col_left =  place_meeting(bbox_left+hspeed,y,obj_platform) and !place_meeting(bbox_left - 10 + cSpeed,y+abs(cSpeed)+15,obj_slope)
	col_top = place_meeting(x,y-1+clamp(vsp,-1000,0),obj_platform)
	
//+++++++++++++++++++++++++++++++++++++++++++++++++++ gravity ++++++++++++++++++++++++++++++++++++++++++++++++

//moved to begin step event

//++++++++++++++++++++++++++++++++++++++++++++++++ SLOPES ++++++++++++++++++++++++++++++++++++++++++++++

//SEE BEGIN STEP EVENT FOR GRAVITY AND OTHER SLOPE STUFF



  if(col_slope) {
	
	var Grade = abs(col_slope.image_yscale)/abs(col_slope.image_xscale)//determines slope of slope
	Climb = ceil(abs(hspeed))*ceil(Grade*1.6) + grav*2 //calculates climb amount via slope*1.6 and gravity*2 and movespeed
	y -= Climb 

	//mask_index = 1
  } 
 
 //++++++++++++++++++++++++++++++++++++++++++++++++ JUMPING ++++++++++++++++++++++++++++++++


if(keyboard_check_pressed(ord("W")) ) {

if(col_bot and canmove and !rolling and canjump)
{
vsp -= (JumpHeight + 7*sprinting)
skeleton_animation_clear(9)
skeleton_animation_set_ext("jump_normal",9)
alarm[9] = skeleton_animation_get_frames("jump_normal")/1.2
}

}

if(col_top) {vsp = 0}

y += vsp;

//+++++++++++++++++++++++++++++++++++++++++ MOVEMENT CODE +++++++++++++++++++++++++++++++++++++++++++++++
	if(canmove > 0)
	{

	hspeed = 0
	walking = 0
	crouching = 0
	sprinting = 0
	crawling = 0
	image_angle = 0

	//move right
	if (D and !Shift and face_left and !col_right) {
		
			hspeed = MoveSpeed/3 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(backwalk,2)}
		}
		
		else if (D and !Shift and face_right and !col_right) {
			hspeed = MoveSpeed/2 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(walk,2)}		
		}		
	
	//move left
	if (A and !Shift and face_right and !col_left) {
			hspeed = -MoveSpeed/3 walking = 1 sprinting = 0
			if col_bot {skeleton_anim_set_step(backwalk,2)}
		}
				
		else if (A and !Shift and face_left and !col_left) {
			hspeed = -MoveSpeed/2 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(walk,2)}
		}
			
	//sprint right
	if (D and !A and Shift and face_left and !throwing and !col_right) {
			hspeed = MoveSpeed/3 walking = 1 sprinting = 0
			if col_bot {skeleton_anim_set_step(backwalk,2)}
		}
		
		else if (D and Shift and face_right and !col_right and stamina > 0 and cansprint and !LegsCrippled)
		{hspeed = MoveSpeed*1.1 sprinting = 1 walking = 0
			if (col_bot) {
			skeleton_animation_clear(8)
			skeleton_anim_set_step(sprint,2)
			}

		}
		else if (D and Shift and face_right and !col_right and stamina = 0) or (D and Shift and mouse_x > x and !col_right and cansprint = 0) {
			hspeed = MoveSpeed/2 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(walk,2)}
		}		

	//sprint left
	if !D and A and Shift and face_right and !throwing and !col_left
		{
			hspeed = -MoveSpeed/3 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(backwalk,2)}
		}
		
		else if A and Shift and face_left and !col_left and stamina > 0 and cansprint and !LegsCrippled
		{hspeed = -MoveSpeed*1.1 sprinting = 1 walking = 0
			if (col_bot) {
			skeleton_animation_clear(8)
			skeleton_anim_set_step(sprint,2)
			}
		}

	
		else if (A and Shift and face_left and !col_left and stamina = 0) or (A and Shift and mouse_x < x and !col_left and cansprint = 0) {
			hspeed = -MoveSpeed/2 walking = 1 sprinting = 0
			if (col_bot) {skeleton_anim_set_step(walk,2)}
		}

	//if we're still, reset to idle anim
	if (hspeed = 0 and col_bot and !stunned) {
		skeleton_animation_clear(2)
		}

	else if(hspeed = 0 and !col_bot or !col_bot and !stunned) {
			air_timer += 1 //adds a slight delay to the air idle animation transition, was causing weird stuff when climbing slopes
			if(air_timer >= 10) {
				skeleton_animation_clear(2)
				skeleton_anim_set_step("idle_air",2)
			}		
		}

	//initiate crouching anim when we press S
	if S {skeleton_animation_set_ext("crouch", 2) crouching = 1}


	//sets idles
	if (skeleton_animation_get_ext(1) != anim_array[5] and wpn_ranged[22] = "primary") {
		skeleton_animation_set_ext(anim_array[5],1)
		}

	//cripple stuff
	if(LegsCrippled and hspeed = 0) {skeleton_animation_set_ext("idle_crippled",5)}
	if(A or D) and (LegsCrippled) and (!col_left and !col_right) {crawling = 1 skeleton_animation_clear(5)}

	}

//+++++++++++++++++++++++++++++++++++++++++++++ MELEE IDLES +++++++++++++++++++++++++++++++++++++++++++

	if (
		skeleton_animation_get_ext(8) != anim_array2[8] and
		wpn_ranged[22] = "secondary" and
		!reloading and
		!swinging and
		!sprinting and
		!throwing and
		melee_power = 0
		)

		{
		skeleton_animation_set_ext(anim_array2[8],8)	
		skeleton_animation_set_ext(anim_array[5],1)
		skeleton_attachment_set("slot_melee_weapon", wpn_melee[wpn_melee.Weapon_Sprite])
		}
	
//+++++++++++++++++++++++++++++++++++++++++++++++ ROLLING +++++++++++++++++++++++++++++++++++++++++++++++++

	if (rolling = 1 and invulnerable = 1)
		{
		if(image_xscale = 1 and !col_right)
			{hspeed = (MoveSpeed*1.3+((MoveSpeed/2)*sprinting))*image_xscale}
		if(image_xscale = -1 and !col_left)
			{hspeed = (MoveSpeed*1.3+((MoveSpeed/2)*sprinting))*image_xscale}
		if(col_right and image_xscale = 1)
			{hspeed = 0}
		if(col_left and image_xscale = -1)
			{hspeed = 0}
		}
	if (rolling and invulnerable = 0)
		{
		if(image_xscale = 1 and !col_right)
			{hspeed = ((MoveSpeed*1.3+((MoveSpeed/2)*sprinting))*image_xscale)/2}
		if(image_xscale = -1 and !col_left)
			{hspeed = ((MoveSpeed*1.3+((MoveSpeed/2)*sprinting))*image_xscale)/2}
		if(col_right and image_xscale = 1)
			{hspeed = 0}
		if(col_left and image_xscale = -1)
			{hspeed = 0}
		}	
}


