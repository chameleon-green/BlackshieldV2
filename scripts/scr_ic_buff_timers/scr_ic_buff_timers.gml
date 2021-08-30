function scr_ic_buff_timers() {

	//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 1-5 +++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(ds_grid_get(BuffsGrid,0,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 0 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,1,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 1 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,2,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 2 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,3,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 3 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,4,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 4 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	//++++++++++++++++++++++++++++++++++++++++++++++++++ 6-10 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(ds_grid_get(BuffsGrid,5,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 5 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,6,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 6 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,7,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 7 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,8,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 8 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,9,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 9 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	//+++++++++++++++++++++++++++++++++++++++++++++++++++ 11-15 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(ds_grid_get(BuffsGrid,10,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 10 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,11,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 11 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,12,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 12 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,13,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 13 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,14,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 14 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	//+++++++++++++++++++++++++++++++++++++++++++++++++++ 16-20 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	if(ds_grid_get(BuffsGrid,15,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 15 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,16,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 16 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,17,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 17 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,18,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 18 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}

	if(ds_grid_get(BuffsGrid,19,0) != 0)  //change index var and buffsgrid X (in if statement) to add another slot, up to 100
	{
	var index = 19 var curr_time = btime[index] var max_time = ds_grid_get(BuffsGrid,index,2)*room_speed
	scr_player_boons_activate(ds_grid_get(BuffsGrid,index,0),ds_grid_get(BuffsGrid,index,1),index,(max_time-curr_time))
	btime[index] = btime[index]+1
	}


}
