///@arg sourceCache
///@arg wepID
var sourceCache = argument0;
var wepID = argument1;

with PauseController
{
	ds_list_clear(_weaponDataList);
	ds_list_clear(_weaponDataListValues);
	
	ds_list_add(_weaponDataList,"Stagger:");
	ds_list_add(_weaponDataListValuesBase,"");
	ds_list_add(_weaponDataListValues,sourceCache[? weaponDamageDetails.stagger]);
	
	ds_list_add(_weaponDataList,"Speed:");
	ds_list_add(_weaponDataListValuesBase,"");
	ds_list_add(_weaponDataListValues,"###"/*sourceCache[? weaponDamageDetails.stagger]*/);
	
		//Physical
	if sourceCache[? weaponDamageDetails.physical] != 0
	{
		ds_list_add(_weaponDataList,"Physical:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.physicalDam)*10)/10);
		var valueAdd = sourceCache[? weaponDamageDetails.physical]-weapon_get_stat(wepID,weaponStats.physicalDam);
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
		//Elementals
	if sourceCache[? weaponDamageDetails.fire] != 0
	{
		ds_list_add(_weaponDataList,"Fire:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.fireDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.fire]-weapon_get_stat(wepID,weaponStats.fireDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
	if sourceCache[? weaponDamageDetails.ice] != 0
	{
		ds_list_add(_weaponDataList,"Ice:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.iceDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.ice]-weapon_get_stat(wepID,weaponStats.iceDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
	if sourceCache[? weaponDamageDetails.lightning] != 0
	{
		ds_list_add(_weaponDataList,"Lightning:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.lightningDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.lightning]-weapon_get_stat(wepID,weaponStats.lightningDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
		//Higher Magics
	if sourceCache[? weaponDamageDetails.arcane] != 0
	{
		ds_list_add(_weaponDataList,"Arcane:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.arcaneDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.arcane]-weapon_get_stat(wepID,weaponStats.arcaneDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
	if sourceCache[? weaponDamageDetails.light] != 0
	{
		ds_list_add(_weaponDataList,"Light:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.lightDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.light]-weapon_get_stat(wepID,weaponStats.lightDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
	if sourceCache[? weaponDamageDetails.dark] != 0
	{
		ds_list_add(_weaponDataList,"Dark:");
		ds_list_add(_weaponDataListValuesBase,round(weapon_get_stat(wepID,weaponStats.darkDam)*10)/10);
		var valueAdd = round(sourceCache[? weaponDamageDetails.dark]-weapon_get_stat(wepID,weaponStats.darkDam));
		valueAdd = round(valueAdd*10)/10;
		var modStr = sign(valueAdd) != -1 ? "+":"-";
		var addStr = modStr+string(valueAdd);
		ds_list_add(_weaponDataListValues,addStr);
	}
}