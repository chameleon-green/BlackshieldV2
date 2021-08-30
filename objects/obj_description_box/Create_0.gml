var GSelected = global.Selected 
var Type = GSelected.item_id[22]
item = GSelected.item_id
desc = ""
var index;

var IsArmor = Type = "armor_head" or Type = "armor_torso" or Type = "armor_armL" or Type = "armor_armR" or Type = "armor_legL" or Type = "armor_legR"
var IsWeapon = Type = "primary" or Type = "secondary" or Type = "grenade"
var IsAid = Type = "med" or Type = "food" or Type = "drug"
var IsAmmo = Type = "ammo"
var IsMelee = Type = "melee"

if(IsArmor) {index = 21}
if(IsWeapon) {index = 23}
if(IsAid) {index = 23}
if(IsAmmo) {index = 7}
if(IsMelee) {index = 25}


var file = file_text_open_read(item[index])
while (!file_text_eof(file))
		{
		desc += file_text_readln(file)
		}
		file_text_close(file)

