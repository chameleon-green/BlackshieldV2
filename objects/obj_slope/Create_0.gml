depth = -3901
//+++++++++++++++++++++++++++++++++++++++++ ESTABLISH VARIABLES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var NodeObject = obj_node
var SolidObject = obj_platform

var resolution = clamp(5 * (image_xscale/2),275,450) //scales node spacing based on size of platform
var y_offset = 50
var x_offset = -20

var left = bbox_left
var right = bbox_right
var width = abs(right-left)
var height = abs(bbox_top - bbox_bottom)

x_nodes = round(width/resolution)-1 //horizontal node count
Ncount = 0 //nodecount

angle = arctan(height/width)*sign(image_xscale)
hypotenuse = sqrt(sqr(height)+sqr(width))
tile_count = hypotenuse/70

sprite = spr_platform_tile


//++++++++++++++++++++++++++++++++++++++++++++ CORNER NODE GENERATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++

//corner nodes, always make these. note that bottom node is pushed up 1 pixel to match platforms, so npcs don't jump to the initial bottom slope node (check y value vs a platform node)

if(image_xscale > 0) {
var Node1 = instance_create_depth(left+x_offset,bbox_bottom-y_offset+1,depth+1,NodeObject) with Node1{image_index = 1 hill = 1 creator = other.id}
var Node2 = instance_create_depth(right-x_offset,bbox_top-y_offset,depth+1,NodeObject) with Node2{image_index = 1 hill = 1 creator = other.id}
}

if(image_xscale < 0) {
var Node1 = instance_create_depth(left+x_offset,bbox_top-y_offset,depth+1,NodeObject) with Node1{image_index = 1 hill = 1 creator = other.id}
var Node2 = instance_create_depth(right-x_offset,bbox_bottom-y_offset+1,depth+1,NodeObject) with Node2{image_index = 1 hill = 1 creator = other.id}
}


//++++++++++++++++++++++++++++++++++++++++++++ MIDDLE NODES GENERATION +++++++++++++++++++++++++++++++++++++++++++++++++++++++

if(x_nodes > 0)
{	
	var hy_offset = height/(x_nodes+1) //get vertical difference for nodes on slope
	var i;
	for(i=0; i < x_nodes; i++)
	{
		if(image_xscale > 0) {var yyy = (hy_offset*(i+1))+y_offset+y_offset*(image_yscale/image_xscale)}
		if(image_xscale < 0) {var yyy = (hy_offset*(x_nodes+0-i))+y_offset+y_offset*(image_yscale/image_xscale)}
		
		with(instance_create_depth(left+resolution*(i+1),bbox_bottom-yyy, depth+1,NodeObject)) {image_index = 1 hill = 1 creator = other.id}
		Ncount += 1
	}
}