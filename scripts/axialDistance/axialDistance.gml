// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function axialDistance(aX,aY,bX,bY)
{
    return (abs(aX - bX) + abs(aX + aY - bX - bY) + abs(aX - bY)) / 2
}