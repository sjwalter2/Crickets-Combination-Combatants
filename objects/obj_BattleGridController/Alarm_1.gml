/// @description Insert description here
// You can write your code in this editor

var readyToReturn = 1
with(obj_BattleCharacter) {
	if returningToHome == 1 {
		readyToReturn = 0
	}
}
if(readyToReturn) {
	room_goto(room_tavern)
	alarm_set(0,1)
} else {
	alarm_set(1,1)
}
