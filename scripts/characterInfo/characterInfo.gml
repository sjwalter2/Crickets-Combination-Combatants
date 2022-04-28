// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function characterInfo(){
	
classList = ds_list_create()

class1 = ["Warrior", "Priest", "Sorceror", "Scout", "Thief", "Bard"]
class2 = ["Fighter", "Cleric", "Barbarian", "Wizard", "Ranger", "Rogue", "Mercenary", "Monk"]
class3 = ["Champion", "Arcanist", "Gladiator", "Shaman", "Assassin", "Knight", "Elementalist", "Caravaneer"]
class4 = ["Warlock", "Ninja", "Paladin", "Guildmaster", "Hero", "Archmage", "Prophet", "Druid"]

ds_list_add(classList,class1,class2,class3,class4)

raceList = ds_list_create()

race1 = ["Human", "Elf", "Dwarf", "Goblin", "Halfling", "Orc"]
race2 = ["Fiend", "Kobold", "Fairie", "Elemental","Dryad","Centaur"]
race3 = ["Ogre", "Gnome", "Ratmen", "Lizardman","Hobgoblin"]
race4 = ["Minotaur", "Dragonfolk", "Giant"]

ds_list_add(raceList,race1,race2,race3,race4)

abilityList = ds_list_create()


ability1 = ["Blast", "Cleave", "Thrust", "Cone", "Boon/Bane"]
ability2 = ["Missile", "Wave", "DOT", "Chain"]
ability3 = ["Pierce", "Beam", "Grab", "Hook"]
ability4 = ["Meteor", "Bolt", "Magnet", "Slam"]

ds_list_add(abilityList,ability1,ability2,ability3,ability4)
}