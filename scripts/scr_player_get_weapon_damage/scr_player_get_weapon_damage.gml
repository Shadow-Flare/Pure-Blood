///@arg wepID
///@arg returnCache
///@arg strength
///@arg dexterity
///@arg cunning
///@arg intelligence
var wepID = argument0;
var returnCache = argument1;
var strength = argument2;
var dexterity = argument3;
var cunning = argument4;
var intelligence = argument5;

/*
	So far this only has basic weapon and player stats calculation.
	it does not factor in effects, world effect or abilities.
	those will need to be added in time.
*/

	//initials
var strMod = weapon_get_stat(wepID,weaponStats.strMod);
var dexMod = weapon_get_stat(wepID,weaponStats.dexMod);
var intMod = weapon_get_stat(wepID,weaponStats.intMod);
var cunMod = weapon_get_stat(wepID,weaponStats.cunMod);
if strMod == undefined strMod = 0;
if dexMod == undefined dexMod = 0;
if intMod == undefined intMod = 0;
if cunMod == undefined cunMod = 0;

	//stagger + phys
var stagger = weapon_get_stat(wepID,weaponStats.weight);

var physMod = 1+strMod*strength+dexMod*dexterity;
var physical = weapon_get_stat(wepID,weaponStats.physicalDam);

	//elementals
var eleMod = 1+intMod*intelligence;
var fir = weapon_get_stat(wepID,weaponStats.fireDam);
var ice = weapon_get_stat(wepID,weaponStats.iceDam);
var lgn = weapon_get_stat(wepID,weaponStats.lightningDam);
var arc = weapon_get_stat(wepID,weaponStats.arcaneDam);
var lgt = weapon_get_stat(wepID,weaponStats.lightDam);
var drk = weapon_get_stat(wepID,weaponStats.darkDam);

	//pure damage, for weapons is (almost?) allways 0.
var pur = 0;
	
	//specials
var statMod = 1+cunMod*cunning;
var bld = weapon_get_stat(wepID,weaponStats.bleedDam);
var psn = weapon_get_stat(wepID,weaponStats.poisonDam);

if stagger == undefined stagger = 0;
if physical == undefined physical = 0;

if fir == undefined fir = 0;
if ice == undefined ice = 0;
if lgn == undefined lgn = 0;
if arc == undefined arc = 0;
if lgt == undefined lgt = 0;
if drk == undefined drk = 0;

if bld == undefined bld = 0;
if psn == undefined psn = 0;

ds_map_clear(returnCache);
returnCache[? weaponDamageDetails.stagger] = stagger;
returnCache[? weaponDamageDetails.physical] = physical*physMod;

returnCache[? weaponDamageDetails.fire] = fir*eleMod;
returnCache[? weaponDamageDetails.ice] = ice*eleMod;
returnCache[? weaponDamageDetails.lightning] = lgn*eleMod;
returnCache[? weaponDamageDetails.arcane] = arc*eleMod;
returnCache[? weaponDamageDetails.light] = lgt*eleMod;
returnCache[? weaponDamageDetails.dark] = drk*eleMod;

returnCache[? weaponDamageDetails.pure] = pur;

returnCache[? weaponDamageDetails.bleed] = bld*statMod;
returnCache[? weaponDamageDetails.poison] = psn*statMod;