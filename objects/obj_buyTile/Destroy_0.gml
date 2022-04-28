/// @description Insert description here
// You can write your code in this editor
var currentMoney = 0
with(obj_moneyController)
	currentMoney = money
	
var currentHovered = noone
with(obj_Character)
{
	if(isHovered)	
	{
		switch(other.tileType)
		{
			case("class"):
				if class == other.tileName && classLvl < 3
					currentHovered = id
			break
			case("race"):
				if race == other.tileName && raceLvl < 3
					currentHovered = id
			break
			case("ability"):
				if ability == other.tileName && abilityLvl < 3
					currentHovered = id
			break
		}
	}
}
	
if(currentMoney >= tileTier + 1 && currentHovered != noone)
{
	with(obj_moneyController)
		money -= (other.tileTier + 1)
	
	switch(tileType)
	{
		case("class"):
			currentHovered.classLvl++
		break
		case("race"):
			currentHovered.raceLvl++
		break
		case("ability"):
			currentHovered.abilityLvl++
		break
	}
	
	with(obj_slots)
		grabbedTilePlaced = 1
}
