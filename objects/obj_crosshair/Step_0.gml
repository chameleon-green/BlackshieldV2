

//if(place_meeting(x,y,obj_ic)) {global.GUI = 1} //also in obj_ic draw event

//sets variables for HUD to draw from
wpn_ranged = obj_player.wpn_ranged
Firemode = obj_player.Firemode
heat = obj_player.heat
heatcap = obj_player.wpn_ranged[0]

//sets firemode icon for draw event
if(Firemode = "Laser") {icon = 5}
if(Firemode = "Overcharge" or Firemode = "Supercharge") {icon = 3}
if(Firemode = "Auto") {icon = 1}
if(Firemode = "Semi" or Firemode = "Single") {icon = 0}


//sets firemode icon 
if(heat > heatcap and heatcap > 0) {icon = 4}








