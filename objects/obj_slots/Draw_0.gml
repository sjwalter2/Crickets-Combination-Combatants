/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_red)
draw_roundrect(start_x-paddingX, start_y-paddingY, end_x+paddingX, end_y+paddingY,0)

draw_set_color(c_white)
draw_roundrect(start_x, start_y, end_x, end_y,0)
for(var i = 0; i < gridW; i++)
{
	for(var j = 0; j <= gridH; j++)	
	{
		if !(j == 0 || j == gridH)
			draw_sprite(rowSprites[i],j+nextImage,paddingX/2 + start_x + i*gridSizeW +i*paddingX,paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll)
		else if (j == 0)
			draw_sprite_part(rowSprites[i],j+nextImage,0,gridSizeH-currentRoll,gridSizeW,currentRoll,paddingX/2 + start_x + i*gridSizeW +i*paddingX,start_y + j*gridSizeH + j*paddingY )
		else if (j == gridH)
			draw_sprite_part(rowSprites[i],j+nextImage,0,0,gridSizeW,gridSizeH-currentRoll,paddingX/2 + start_x + i*gridSizeW +i*paddingX,2*paddingY + start_y + (j-1)*gridSizeH + (j-1)*paddingY + currentRoll )
	}	
}
currentRoll++
if(currentRoll > gridSizeH + paddingY)
{
	currentRoll = 0
	nextImage-=1	
}
