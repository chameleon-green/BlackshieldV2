


if(hill = 1 and other.hill = 0) {instance_destroy(other)}
//if(other.hill = 1 and hill = 1 and id < other.id) {instance_destroy(self)}
if((id > other.id) and (hill = 1 and other.hill = 1)) {instance_destroy(other)}