
if(mouse_check_button_pressed(mb_left)) {
	if (selectedCharacter == noone) {
		selectedCharacter = instance_position(mouse_x, mouse_y, obj_Character);
		if(selectedCharacter != noone)
		{
			selectedCharacter.followMouse = 1
			selectedCharacter.returnX = selectedCharacter.x	
			selectedCharacter.returnY = selectedCharacter.y
			leftClickCounter = 0
		}
	} else if (selectedCharacter != noone)
	{   //Place character
		placeCharacter()
	}
} else if(mouse_check_button(mb_left) && selectedCharacter != noone) {
	leftClickCounter += 1
}
if(mouse_check_button_pressed(mb_right) && selectedCharacter != noone && selectedCharacter.gridX != -1){
	selectedCharacter.x = selectedCharacter.returnX
	selectedCharacter.y = selectedCharacter.returnY
	selectedCharacter.followMouse = 0
	selectedCharacter = noone
}
if(mouse_check_button_released(mb_left) && leftClickCounter > leftClickThreshold && selectedCharacter != noone) {
	//Place character
	placeCharacter()
}


