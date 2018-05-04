///@arg destinationCache
///@arg stagger
///@arg knockback
///@arg slash
///@arg pierce
///@arg blunt
///@arg fire
///@arg ice
///@arg lightning
///@arg arcane
///@arg light
///@arg dark
var cache = argument0;
var stagger = argument1;
var knockback = argument2;
var slash = argument3;
var pierce = argument4;
var blunt = argument5;
var fire = argument6;
var ice = argument7;
var lightning = argument8;
var arcane = argument9;
var light = argument10;
var dark = argument11;

cache[? damageData.stagger] = stagger;
cache[? damageData.knockback] = knockback;
cache[? damageData.slash] = slash;
cache[? damageData.pierce] = pierce;
cache[? damageData.blunt] = blunt;
cache[? damageData.fire] = fire;
cache[? damageData.ice] = ice;
cache[? damageData.lightning] = lightning;
cache[? damageData.arcane] = arcane;
cache[? damageData.light] = light;
cache[? damageData.dark] = dark;
cache[? damageData.pure] = 0;	//define outside since notable

cache[? damageData.bleed] = 0;
cache[? damageData.poison] = 0;
