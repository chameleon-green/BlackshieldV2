 


if(hill = 1 and other.hill = 0) {instance_destroy(other)}
if((hill = 1 and other.hill = 1) and (id > other.id)) {instance_destroy(other)}

if(cover = 1 and other.cover = 0) {instance_destroy(other)}
if((cover = 1 and other.cover = 1) and (id > other.id)) {instance_destroy(other)}

if(cover = other.cover and hill = other.hill and id > other.id) {instance_destroy(other)}







