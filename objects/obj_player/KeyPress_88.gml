/// switch firemodes

var farray = wpn_ranged[wpn_ranged.Firemode]
var mode1 = farray[1]
var mode0 = farray[0]

if(Firemode = mode0) {Firemode = mode1}

else {
	
if(Firemode = mode1) {Firemode = mode0}

};

