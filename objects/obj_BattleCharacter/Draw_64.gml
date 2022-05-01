/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_color(c_maroon)
draw_set_alpha(.8)
var pad = 3

var classStr = class + " " + string(classLvl)
var raceStr = race + " " + string(raceLvl)
var abilityStr = ability + " " + string(abilityLvl)

var maxStr = max(string_width(classStr), string_width(raceStr), string_width(abilityStr))
draw_roundrect(x+sprite_width/4-pad-1,y-45-pad,x+sprite_width/4 + maxStr + pad, y-15+pad + string_height(abilityStr),0)

draw_set_alpha(1)
draw_set_color(c_white)
draw_text(x+sprite_width/4,y-45,classStr)
draw_text(x+sprite_width/4,y-30,raceStr)
draw_text(x+sprite_width/4,y-15,abilityStr)
