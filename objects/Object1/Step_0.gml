/// @description Insert description here
// You can write your code in this editor
switch(facing)
{
	case 0: 
		direction = 270
	break
	case 1: 
		direction = 180
	break
	case 2: 
		direction = 0
	break
	case 3: 
		direction = 90
	break
	
}

if(keyboard_check(vk_down) || keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up))
{
	speed = spd
}
else
	speed = 0
	
if(index == 0 || index == 2) || speed != 0
	frame++
	
if(frame >= rate || facing != lastFacing) || newChar
{
	frame = 0
	index++
	if(index >= images)
	{
		index = 0	
	}
	var currentIndex = index
	if(index == 3)
		currentIndex = 1
	
	image_index = set*chars*count*4 + character*count + chars*facing*count + currentIndex
}
lastFacing = facing
newChar = 0