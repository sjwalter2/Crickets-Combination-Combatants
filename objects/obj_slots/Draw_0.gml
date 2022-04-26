/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_red)
draw_roundrect(start_x-paddingX, start_y-paddingY, end_x+paddingX, end_y+paddingY,0)

draw_set_color(c_navy)
draw_roundrect(start_x, start_y, end_x, end_y,0)
for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)	
	{
		draw_set_halign(fa_middle)
		draw_set_valign(fa_top)
		draw_set_color(c_white)
		var currentSprite = ds_grid_get(slotSpriteGrid,i,j)
		var currentIndex = ds_grid_get(slotIndexGrid,i,j)
		
		var currentTier = int64((string_char_at(sprite_get_name(currentSprite),string_length(sprite_get_name(currentSprite)))))
		var currentName = getIconInfo(rowSprites[i],currentIndex,currentTier)
		
		
		var currentX = paddingX/2 + start_x + i*gridSizeW +i*paddingX

		if !(j == 0 || j == gridH)
		{
			draw_sprite(currentSprite,currentIndex,currentX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i])
			draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i] + 90, currentName)
		}
		else if (j == 0)
		{
			draw_sprite_part(currentSprite,currentIndex,0,gridSizeH-currentRoll[i],gridSizeW,currentRoll[i]+1,currentX,start_y + j*gridSizeH + j*paddingY )
			draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i] + 90, currentName)
		}
		else if (j == gridH)
		{
			draw_sprite_part(currentSprite,currentIndex,0,0,gridSizeW,gridSizeH-currentRoll[i]+1,currentX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i] )
			if(gridSizeH-currentRoll[i]+1 > 90)
				draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll[i] + 90, currentName)
			
		}
	}	
}

draw_set_color(c_red)
draw_roundrect(start_x-paddingX, end_y, end_x+paddingX, end_y+paddingY,0)

