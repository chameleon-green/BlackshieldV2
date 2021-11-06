xoffset = 30
yoffset = 10

prt_sys = obj_vc.prt_sys
prt_flame = obj_vc.prt_flame_dirty_norm
emitter = part_emitter_create(prt_sys)


killtimer = timer_create(500)
kill = 0

part_emitter_stream(prt_sys,emitter,prt_flame,1)
part_emitter_region(prt_sys,emitter,x-xoffset,x+xoffset,y+yoffset,y-yoffset,ps_shape_ellipse,ps_distr_gaussian)

vertical = 0

damage = 11