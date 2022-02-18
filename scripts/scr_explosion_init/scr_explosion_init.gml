function scr_explosion_init() {
		
	exp_bolt_small[3] = "no" //we are not scalable
	exp_bolt_small[2] = 0
	exp_bolt_small[1] = spr_explosion_small //impact vfx
	exp_bolt_small[0] = 0 //number of fragments

	exp_bolt_small_frag5[3] = "no" //we are not scalable
	exp_bolt_small_frag5[2] = 35 //frag lifetime
	exp_bolt_small_frag5[1] = spr_explosion_small//impact vfx
	exp_bolt_small_frag5[0] = 5 //number of fragments

	exp_bolt_small_frag20[3] = "no" //we are not scalable
	exp_bolt_small_frag20[2] = 20 //frag lifetime
	exp_bolt_small_frag20[1] = spr_explosion_small//impact vfx
	exp_bolt_small_frag20[0] = 20 //number of fragments

	//+++++++++++++++++++++++++++++++++++ SCALABLES +++++++++++++++++++++++++++++++++++++++
	
	
	exp_scalable_smoke_small[4] = snd_grenade_smoke_burst //sound
	exp_scalable_smoke_small[3] = 5 //explosion size
	exp_scalable_smoke_small[2] = 22 //frag lifetime, else smoke mass override
	exp_scalable_smoke_small[1] = c_white //smoke color
	exp_scalable_smoke_small[0] = 0 //number of frags
	
	exp_scalable_firey_med[5] = "firey" //specials?
	exp_scalable_firey_med[4] = snd_explode_small1
	exp_scalable_firey_med[3] = 13 //explosion size
	exp_scalable_firey_med[2] = 25 //frag lifetime
	exp_scalable_firey_med[1] = c_white //smoke color
	exp_scalable_firey_med[0] = 30 //frag count
	
	exp_scalable_frag_tiny[4] = snd_explode_small1
	exp_scalable_frag_tiny[3] = 4 //explosion size
	exp_scalable_frag_tiny[2] = 13 //frag lifetime
	exp_scalable_frag_tiny[1] = c_dkgray //smoke color
	exp_scalable_frag_tiny[0] = 30 //frag count
	
	exp_scalable_frag_small[4] = snd_explode_small1
	exp_scalable_frag_small[3] = 5 //explosion size
	exp_scalable_frag_small[2] = 9 //frag lifetime
	exp_scalable_frag_small[1] = c_gray //smoke color
	exp_scalable_frag_small[0] = 30 //frag count
	
	exp_scalable_frag_med[4] = snd_explode_small1
	exp_scalable_frag_med[3] = 10 //explosion size
	exp_scalable_frag_med[2] = 25 //frag lifetime
	exp_scalable_frag_med[1] = c_gray //smoke color
	exp_scalable_frag_med[0] = 30 //frag count
	
	exp_scalable_frag_large[4] = snd_explode_small1
	exp_scalable_frag_large[3] = 14 //explosion size
	exp_scalable_frag_large[2] = 35 //frag lifetime
	exp_scalable_frag_large[1] = c_gray //smoke color
	exp_scalable_frag_large[0] = 30 //frag count
	
	exp_scalable_frag_huge[4] = snd_explode_small1
	exp_scalable_frag_huge[3] = 20 //explosion size
	exp_scalable_frag_huge[2] = 40 //frag lifetime
	exp_scalable_frag_huge[1] = c_gray //smoke color
	exp_scalable_frag_huge[0] = 50 //frag count

}
