/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_maroon)
draw_roundrect(start_x-paddingX, start_y-paddingY*1.5, end_x+paddingX, end_y+paddingY,0)

draw_set_color(c_dkgray)
draw_roundrect(start_x, start_y, end_x, end_y-paddingY/2,0)
rowCost = [0,0,0]

draw_set_halign(fa_middle)
draw_set_valign(fa_top)

for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)	
	{
		var currentSprite = ds_grid_get(slotSpriteGrid,i,j)
		var currentIndex = ds_grid_get(slotIndexGrid,i,j)
		
		if(currentSprite != -1)
		{
			
			var rollOff  = currentRoll[i]
			if(rowBought < j && rowBought != -1 ) || (grabbedTilePlaced && i == grabbedColumn && j > grabbedRow)
			{
				rollOff = gridSizeH + paddingY/2	
			}
			
			var currentTier = int64((string_char_at(sprite_get_name(currentSprite),string_length(sprite_get_name(currentSprite)))))
			var currentName = getIconInfo(rowSprites[i],currentIndex,currentTier)
		
			if(j < gridH)
				rowCost[j] += currentTier + 1
			
			switch(currentTier)
			{
				case 0:
					var bg_color = c_green
				break
				case 1:
					var bg_color = c_navy
				break
				case 2:
					var bg_color = c_olive
				break
				case 3:
					var bg_color = c_silver
				break
			}
			draw_set_color(bg_color)
		
			var currentX = paddingX/2 + start_x + i*gridSizeW +i*paddingX

			if !(j == 0 || j == gridH)
			{
				draw_roundrect(currentX,paddingY/2 + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff,currentX+gridSizeW,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff+gridSizeH,0)
				draw_sprite(currentSprite,currentIndex,currentX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff)
				draw_set_color(c_white)
				draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff + 90, currentName)
			}
			else if (j == 0)
			{
				if((gridSizeH - rollOff) > 0)
					draw_roundrect(currentX,start_y-paddingY/2,currentX+gridSizeW,start_y + rollOff,0)
				else
					draw_roundrect(currentX,start_y-paddingY/2 - (gridSizeH - rollOff),currentX+gridSizeW,start_y + rollOff,0)
				draw_sprite_part(currentSprite,currentIndex,0,gridSizeH-rollOff,gridSizeW,rollOff+1,currentX,start_y + j*gridSizeH + j*paddingY )
				draw_set_color(c_white)
				draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff + 90, currentName)
			}
			else if (j == gridH)
			{
				draw_roundrect(currentX,paddingY/2 + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff,currentX+gridSizeW,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff + (gridSizeH - rollOff),0)
				draw_sprite_part(currentSprite,currentIndex,0,0,gridSizeW,gridSizeH-rollOff+1,currentX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff )
				draw_set_color(c_white)
				if(gridSizeH-rollOff+1 > 90)
					draw_text(currentX+gridSizeW/2,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + rollOff + 90, currentName)
			
			}
		}
	}	
}


draw_set_color(c_maroon)
draw_roundrect(start_x-paddingX, start_y-paddingY, end_x+paddingX, start_y,0)
draw_roundrect(start_x-paddingX, end_y-paddingY/2, end_x+paddingX, end_y+paddingY,0)



