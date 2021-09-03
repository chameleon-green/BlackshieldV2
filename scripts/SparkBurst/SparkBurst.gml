// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SparkBurst(entity,projectile){

var hsp = -entity.hspeed

var dmg = projectile.damage var xx = projectile.x var yy = projectile.y var dir = projectile.direction + 180

var spark = obj_vc.prt_spark1
var dmg_ratio = clamp(dmg/500,0,1)
var quant = irandom_range(2,6)


part_type_direction(spark,dir-30,dir+30,0,8)
part_type_speed(spark,20+hsp,30+hsp,0,0)
part_type_gravity(spark,1,270)
part_type_life(spark,5,15)
part_type_alpha3(spark,1,1,0)

part_system_depth(obj_vc.prt_sys_spark, entity.depth-1)

part_particles_create(obj_vc.prt_sys_spark, xx, yy, spark, quant)

}