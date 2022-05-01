/// @description Get Stats
// You can write your code in this editor
raceMap = getJsonMap("raceInfo.json", race)
classMap = getJsonMap("classInfo.json", class)
var stats = getStats()

statMap = findStats(raceMap,classMap, stats)
Tag1 = ds_map_find_value(classMap, "Tag1")
Tag2 = ds_map_find_value(classMap, "Tag2")
