
//README README: need to declare all this stuff in the object's create event

/*
grav = 1.5 //essential to pathing and gravity
vsp = 0 ///essential to pathing and gravity
jump_force = 18 //essential to pathing
max_jump_height = (jump_force*jump_force) / (2*grav) //essential to pathing
move_speed = 9

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ PATHFINDING VARIABLES +++++++++++++++++++++++++++++++++++++++++++++++++++++++

PathList = ds_list_create() //list of nodes for pathfinding
closed_list = ds_list_create()
search_radius = max_jump_height
search_radius = max_jump_height
target_node = 0
NodeNext = 0
NodeObject = obj_node
SolidObject = obj_platform

TargetNodeTimer = 0 //refresh target node, allows time for nodes to generate before checking. 15 ticks
StartNodeTimer = 0 //update start node, allows time for nodes to generate before checking. 30 ticks
NewPathTimer = 0 //autopathing timer, for test purposes. 100 ticks
NewPath = 0

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++ GENERATE A STARTER NODE ++++++++++++++++++++++++++++++++++++++++++++++++++++++

var NodeList = nodes_in_los(search_radius,SolidObject,NodeObject,x,y,closed_list) //gets valid nodes
StartNode = ds_list_nearest(NodeList,x,y) //selects closest node as starting node
ds_list_add(closed_list,StartNode)
ds_list_destroy(NodeList)
*/

//actual function
function scr_astar_movement()
{

//+++++++++++++++++++++++++++++++++++++++++ Debug Node Labelling ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if(!dead)
{
var NewPathTick = 80
if(fleeing) {NewPathTick = 500}
TargetNodeTimer += 1
StartNodeTimer += 1
NewPathTimer += 1
NewPath = 0
if(fleeing and flee_path_toggle) {TargetNodeTimer = 51 NewPath = 1 flee_path_toggle = 0}  //instant new path when we are fleeing
if(!fleeing) {target = obj_player} else{target = instance_nearest(x,y,obj_exfil)}

//this is the vertical center of the object. allows us to use objects with origins in other places.
var _height = abs(bbox_top-bbox_bottom)
var mid_y = bbox_bottom - _height/2

if(TargetNodeTimer >= 50) //refresh target node
	{
	TargetNodeTimer = 0
	
	//some variety for ranged foes. some are more elusive
	if(Tactics = "ranged1" and !fleeing){
	var TargetNodeList = ds_list_create()
	ds_list_read(TargetNodeList,nodes_in_los(max_range*0.8,SolidObject,NodeObject,target.x,target.y-15,-1))
	target_node = ds_list_farthest(TargetNodeList,target.x,target.y,true,4)
	ds_list_destroy(TargetNodeList)
	}
	
	if(Tactics = "ranged2" or Tactics = "melee" or fleeing){
	var TargetNodeList = ds_list_create()
	ds_list_read(TargetNodeList,nodes_in_los((max_range/2.5)*1.5,SolidObject,NodeObject,target.x,target.y-15,-1))
	target_node = ds_list_nearest(TargetNodeList,target.x,target.y,false)
	ds_list_destroy(TargetNodeList)
	}
	
	
	}

if(StartNodeTimer >= NewPathTick) 
	{
	StartNodeTimer = 0
	var NodeList = ds_list_create();
	ds_list_read(NodeList,nodes_in_los(search_radius,SolidObject,NodeObject,x,mid_y,-1)) //gets valid nodes
	StartNode = ds_list_nearest(NodeList,x,mid_y,false) //selects closest node as starting node
	ds_list_destroy(NodeList)
	}
	
if(NewPathTimer >= NewPathTick) 
	{
	NewPathTimer = 0
	NewPath = 1
	}
}

//++++++++++++++++++++++++++++++++++++++++ Inputs and Collisions +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


var Down = 0
var Ledge = 0
var Move = canmove//(canmove and NewPathTimer >= 0)

var Mult = clamp((sprinting*2),2,99) //tell if we are sprinting
var MoveSpeed = move_speed
var JumpForce = jump_force
var Grav = grav
var Width = abs(bbox_left-bbox_right)
var Height = abs(bbox_top - bbox_bottom)

cSpeed = 30*Right + -30*Left //clamp hspeed for collision stuff, need a minimum
	
	var x1 = bbox_left - 10 + cSpeed
	var x2 = bbox_right + 10 + cSpeed
	var y1 = bbox_bottom - 5
	var y2 = bbox_bottom + abs(cSpeed) + 15
	col_slope = collision_rectangle(x1,y1,x2,y2,obj_slope,true,0) 
	
Col_Right = place_meeting(bbox_right+hspeed,y,obj_platform) and !place_meeting(bbox_right + 10 + cSpeed,y+abs(cSpeed)+15,obj_slope) and vsp >= 0
Col_Left =  place_meeting(bbox_left+hspeed,y,obj_platform) and !place_meeting(bbox_left - 10 + cSpeed,y+abs(cSpeed)+15,obj_slope) and vsp >= 0
Col_Top =   place_meeting(x,y-1+clamp(vsp,-1000,0),obj_platform)

/*
var Col_Bot = place_meeting(x,y+2+clamp(vsp,0,9999),SolidObject) and vsp >= 0
var Col_Top = place_meeting(x,y-1+clamp(vsp,-9999,0),SolidObject) and vsp >= 0
var Col_Left = place_meeting(x-MoveSpeed*Mult-1,y,SolidObject) and vsp >= 0
var Col_Right = place_meeting(x+MoveSpeed*Mult+1,y,SolidObject) and vsp >= 0
*/

if(place_meeting(x,y,SolidObject) and vsp >= 0 and !col_slope){
	var col = instance_place(x,y,SolidObject)
	if(col.y > y) {move_outside_solid(270,-1)}
	if(col.y < y) {move_outside_solid(90,-1)}	
	}


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Pathfinding +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if(!dead)
{
if(NewPath and target_node != 0) //find pathing nodelist
{
	ds_list_clear(PathList)
	
	var NodeList = ds_list_create()
	ds_list_read(NodeList,nodes_in_los(search_radius,SolidObject,NodeObject,x,mid_y,-1)) //gets valid nodes
	StartNode = ds_list_nearest(NodeList,x,y,false) //selects closest node as starting node
	ds_list_destroy(NodeList)
	
	var Path = nodes_calculate_cost_array(StartNode,max_jump_height,target_node,175)
	if (Path != -1) {ds_list_read(PathList,nodes_calculate_cost_array(StartNode,max_jump_height,target_node,175))} else{ds_list_clear(PathList)}
	var StartNodeIndex = ds_list_find_index(PathList,StartNode)//eliminate startnode from path so we don't have jumpy starts

	if(StartNodeIndex != -1)  {
	last_parent = -1
	if(StartNodeIndex != -1 and sprinting) {ds_list_delete(PathList,StartNodeIndex)} //eliminate startnode from path so we don't have jumpy starts
	}
}


if(ds_exists(PathList,ds_type_list) and !dead) 
	{
		if(ds_list_size(PathList) > 0)  //do we actually have nodes?
		{
		NodeNext = ds_list_find_value(PathList,0)
		var Above = (NodeNext.y < mid_y) and (NodeNext.creator != last_parent) and NodeNext.hill = 0
		var Dist_X = abs(NodeNext.x - x)
		var Dist_Y = abs(NodeNext.y - y)// mid_y)
		
		if(Above and Dist_X < 5*MoveSpeed*MoveSpeed) //jump when we are approaching a node above us. modify dist_X inequality to jump earlier
			{
			Up = 1
			var Beans = 1.9*(sqrt(Dist_Y)) //jumping beans, get it?
			JumpForceMod = clamp(Beans,0,JumpForce)
			}
		
		if(NodeNext.x > x) 
			{
			if(!Col_Bot) {if(!Above) {Right = 1}}
			if(Col_Bot) {Right = 1}
			//Right = 1
			}
		if(NodeNext.x < x)
			{
			if(!Col_Bot) {if(!Above) {Left = 1}}
			if(Col_Bot) {Left = 1}
			//Left = 1
			}
		}	
	}
 
var Node_Col = instance_place(x,y,NodeObject)//removes nodes from our list as we come across them. Need to update for high velocity
if(Node_Col != noone and ds_exists(PathList,ds_type_list) and Col_Bot)
{
var ID_Index = ds_list_find_index(PathList,Node_Col)

	if(ID_Index != -1) 
	{
	var last_node = ds_list_find_value(PathList,ID_Index)
	last_parent = last_node.creator
	ds_list_delete(PathList,ID_Index)
	}
}
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Movement +++++++++++++++++++++++++++++++++++++++++++++++++++++

hspeed = 0
walking = 0
sprinting = 0


if(Col_Bot) {vsp = 0 move_outside_solid(90,-1)}
if(Col_Left) {move_outside_solid(0,-1)}
if(Col_Right) {move_outside_solid(180,-1)}
//if(Col_Top) {vsp = Grav}
if(variable_instance_exists(self,"deploying")) {var DPL = deploying} else{var DPL = 0}

if(!dead and Move and NodeNext != 0) or (!dead and Move and DPL) 
{	
	var Speed2 = MoveSpeed*2
	if(!DPL){
	var Dist_X = abs(NodeNext.x - x) //horizontal distance to next node
	var DFactor = Dist_X/Speed2 //multiplier for distance, the closer we are the small it is
	var AdjSpeed = clamp(Speed2*DFactor,1,MoveSpeed*2)
	}
	else{AdjSpeed = Speed2}
	
	if(Left and !Col_Left) {
		
		hspeed = -AdjSpeed sprinting = 1 image_xscale = 1
	}
	
	if(Right and !Col_Right) {
		
		hspeed = AdjSpeed sprinting = 1 image_xscale = -1
	}
	
	if(Up and Col_Bot) {
		vsp = -JumpForceMod
		skeleton_animation_clear(9)
		skeleton_anim_set_step("jump_normal",9)
	}
}

//++++++++++++++++++++++++++++++++++++++++++++++++++ COLLISIONS FOR STOPPING STACKING ++++++++++++++++++++++

//if(hspeed != 0 and !dead and !fleeing) {
if(!dead and !fleeing) {

	
	var clist = ds_list_create()
	collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_enemy,false,true,clist,true)
	var _count = ds_list_size(clist)
	var _max = 3
	
	if(target_node != 0 and instance_exists(target_node)){
	if(target_node.cover = 1 and !place_meeting(x,y,obj_cover)) { _max = 1}
	}
	
	if(_count > _max and !seeking_cover) {
		var npc = ds_list_find_value(clist,0)
		var still_me = (hspeed = 0)
		var same_target = (target_node = npc.target_node)
		if(npc.hspeed = 0 and !npc.dead and npc.Col_Bot and same_target) {  
			var facing = x < npc.x
			if(facing = 1) {//enemy is to our right
				npc.x+=MoveSpeed*1.5
				x-=MoveSpeed*1.5*still_me
			}
			else{
				npc.x-=MoveSpeed*1.5
				x+=MoveSpeed*1.5*still_me
			}
			
		}
	}
	
	ds_list_destroy(clist)
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++ SLOPES + Y GRAV ADDITION +++++++++++++++++++++++++++++++++++++++++++++++++++
 if(col_slope) {
	
	move_outside_solid(90,-1)
	var Grade = abs(col_slope.image_yscale)/abs(col_slope.image_xscale)//determines slope of slope
	Climb = ceil(abs(hspeed))*ceil(Grade*1.6) + 1.5
	y -= Climb  //multiplies our vertical increase by slope, rounding up
  } 

y += vsp
//+++++++++++++++++++++++++++++++++++++++++++++++++++ AI Specific Stuff +++++++++++++++++++++++++++++++++++++++++

//cancel pathing once we have LOS on target, and are no longer seeking cover
if(!dead and !fleeing) {

	if(LOSandRange = 1 && Col_Bot && !seeking_cover) { 
		if(ds_exists(PathList,ds_type_list)) {
			ds_list_clear(PathList)} 
			
		NewPathTimer = -2
		StartNodeTimer = -2
		//TargetNodeTimer = -2
	}

}	
	
	
}

