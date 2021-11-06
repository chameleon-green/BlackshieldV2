if(init_check = 1 and MyType != undefined){
		init_check = 0
		if(weapon != undefined){script_execute(MyType,weapon)}
		else{script_execute(MyType)}
}

if(variable_instance_exists(id,"BeginStepScript")){
	
	if(BeginStepScript != 0){
	script_execute(BeginStepScript)
	}
}