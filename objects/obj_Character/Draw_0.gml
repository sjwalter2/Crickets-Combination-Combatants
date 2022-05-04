/// @description Insert description here
// You can write your code in this editor
var otherSelected = 0
with(obj_TavernGridController)
{
	if(selectedCharacter != noone && selectedCharacter != other)
		otherSelected = 1
}
var otherHovered = 0
with(obj_Character)
	if(isHovered && id != other.id)
		otherHovered = 1


//Draw an outline when hovered
if((!otherHovered && !otherSelected && mouseInside(bbox_left,bbox_top,bbox_right,bbox_bottom)) || followMouse)
{
	///draw event
	shader_set(Shader_Outline)
	var tex=sprite_get_texture(sprite_index,image_index)
	var tex_w=texture_get_texel_width(tex)
	var tex_h=texture_get_texel_height(tex)
	shader_set_uniform_f(handler,tex_w,tex_h)
	shader_set_uniform_f(handler_1,5)//line thickness
	shader_set_uniform_f(handler_2,1,1,1,1.0)//b
	draw_self()
	shader_reset()
	
	isHovered = 1
}
else
	isHovered = 0
draw_self()
