

//calculates a path using A* and returns a path of sequential nodes in a ds_list 
//make sure to define wall and node objects properly or this will not work
//parameters: start node, target node, search radius (How far each node can search for others. This is usually defined by maximum jump height)
//max_search_size dictates max size of openlist data structure. The larger it is, the longer an AI
//will search for a path before giving up. Higher values are more performance intensive, but may be
//required for very complex level geometry/large levels with lots of nodes

function nodes_calculate_cost_array(start_node,search_radius,target_node,max_search_size)
{
//++++++++++++++++++++++++++++++++++++++++++++++++ DEFINE YOUR RELEVANT OBJECTS HERE+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var oSolid = obj_platform //define wall object
var oNode = obj_node //define navigation point object

//++++++++++++++++++++++++++++++++++++++++++ TOUCH SHIT BELOW THIS LINE AT YOUR OWN PERIL +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var toggle = 1 //our return toggle, so we can delete our path data structure but still return it

var OpenList = ds_priority_create(); //establish data structures
var ClosedList = ds_list_create(); //establish data structures
var ClosedParentList = ds_list_create(); //a list of closedlist's parents
var StartNode; 
	StartNode[4] = start_node; //what node is this
	StartNode[3] = start_node; //parent of node
	StartNode[2] = 0; //g cost, not relevant for start node
	StartNode[1] = 0; //h cost, not relevant for start node
	StartNode[0] = 0; //f cost (g+h)
	
ds_priority_add(OpenList,StartNode,0); //add our start position to closed list

var PathComplete = (ds_list_find_index(ClosedList,target_node) != -1); //we found our target

//+++++++++++++++++++++++++++++++++++++++++++++++++++++ PATHFINDING LOOP ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

while (!PathComplete and ds_priority_size(OpenList) < max_search_size) //while our target is not found and we still have nodes unsearched, continue 
{
	
	if(target_node = 0 or start_node = 0) {break}
	
	var Node = ds_priority_find_min(OpenList);//find cheapest node array 
	ds_priority_delete_value(OpenList,Node); //remove our node from the openlist	
	
	if(is_array(Node)){
		if(ds_list_find_index(ClosedList,Node[4]) = -1) {ds_list_add(ClosedList,Node[4]) ds_list_add(ClosedParentList,Node[3])}; //add to the closed list
		if(Node[4] = target_node) {break}; //if we have added target to closed list, break the loop and stop expanding nodes
	
	//if(ds_list_size(ClosedList) > 15) {return -1}
	
	//Find adjacent nodes and add them to our open list
		var LOSList = ds_list_create();
		ds_list_read(LOSList,nodes_in_los(search_radius,oSolid,oNode,Node[4].x,Node[4].y,-1));
		var LOSListSize = ds_list_size(LOSList);
		var i;
	
		for(i = 0; i < LOSListSize; i++)
		{
		//find the cost of each node
			var NodeArray = 0;
			var NodeID = LOSList[| i];
			var CostG = abs(point_distance(start_node.x,start_node.y,NodeID.x,NodeID.y)) + abs(point_distance(start_node.x,start_node.y,Node[4].x,Node[4].y))
			var CostH = abs(point_distance(target_node.x,target_node.y,NodeID.x,NodeID.y));
			var CostF = ( (1*CostG) + (3*CostH) )/4
		
			NodeArray[4] = NodeID; //set node itself
			NodeArray[3] = Node[4]; //set parent
			NodeArray[2] = CostG;
			NodeArray[1] = CostH;
			NodeArray[0] = CostF;
		
			var ClosedNode = (ds_list_find_index(ClosedList,NodeArray[4]) != -1);
			if(!ClosedNode) {ds_priority_add(OpenList,NodeArray,CostF)} ;
		
		}
		ds_list_destroy(LOSList)
	}else{break} //is Node an array?
	
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ GENERATE A PATH ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var PathComplete = (ds_list_find_index(ClosedList,target_node) != -1); //we found our target
if(PathComplete)
{
	var i2;
	var PathList = ds_list_create();
	var ClosedListSize = ds_list_size(ClosedList);
	var InitialNode = ds_list_find_value(ClosedList,ClosedListSize-1); //gets our end node to backtrack from
	var InitialParent = ds_list_find_value(ClosedParentList,ClosedListSize-1);
	
	var PathFound = 0
	
	for(var Current = InitialNode, CurrentParent = InitialParent; !PathFound; i2++)
	{
		i2 = 0

		ds_list_add(PathList,Current) //add node to path
		ds_list_add(PathList,CurrentParent) //add node parent to path
		var Index = ds_list_find_index(ClosedList,CurrentParent) //finds index of node's parent on ClosedList
		
		Current = ds_list_find_value(ClosedList,Index)
		CurrentParent = ds_list_find_value(ClosedParentList,Index)
		
		var PathFound = (ds_list_find_index(PathList,start_node) != -1) //have we reached our initial node?
	};

};

//++++++++++++++++++++++++++++++++++++++++ RETURN THE PATH IN A DS_LIST ++++++++++++++++++++++++++++++++++++++++++++++++++++

if(PathComplete)  //we got a path! return it in a list, inverting the pathlist. remember to clean it up in the object event. 
	{
	ds_list_destroy(ClosedList)
	ds_list_destroy(ClosedParentList)
	ds_priority_destroy(OpenList)
	
	
	var FinalPath = ds_list_create() 
	var PathListSize = ds_list_size(PathList)-1
	for(var j = PathListSize; j > -1; j--)
		{
		var NodeToAdd = ds_list_find_value(PathList,j)
		if(NodeToAdd != StartNode) {ds_list_add(FinalPath,NodeToAdd)}
		}
		
	ds_list_destroy(PathList)
	//draw_text(x+100,y-30,"PATH ACQUIRED")
	//ds_list_draw(FinalPath,x,y-300)
	var PathText;
	if(toggle = 1) {PathText = ds_list_write(FinalPath) toggle = 0};
	ds_list_destroy(FinalPath);
	return PathText;
	};


if(!PathComplete)  //we didn't get a path, return -1
	{	
	ds_list_destroy(ClosedList)
	ds_list_destroy(ClosedParentList)
	ds_priority_destroy(OpenList)
	//draw_text(x,y,"NO PATH FOUND")
	return -1
	};	 
}