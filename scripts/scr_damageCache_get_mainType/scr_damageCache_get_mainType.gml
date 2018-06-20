///@arg hitData
var hitData = argument0;

var highest = 0;
var mainType = damageType.slash;

if hitData[? damageData.slash] > highest {mainType = damageType.slash; highest = hitData[? damageData.slash];};
if hitData[? damageData.pierce] > highest {mainType = damageType.pierce; highest = hitData[? damageData.pierce];};
if hitData[? damageData.blunt] > highest {mainType = damageType.blunt; highest = hitData[? damageData.blunt];};
if hitData[? damageData.fire] > highest {mainType = damageType.fire; highest = hitData[? damageData.fire];};
if hitData[? damageData.ice] > highest {mainType = damageType.ice; highest = hitData[? damageData.ice];};
if hitData[? damageData.lightning] > highest {mainType = damageType.lightning; highest = hitData[? damageData.lightning];};
if hitData[? damageData.arcane] > highest {mainType = damageType.arcane; highest = hitData[? damageData.arcane];};
if hitData[? damageData.light] > highest {mainType = damageType.light; highest = hitData[? damageData.light];};
if hitData[? damageData.dark] > highest {mainType = damageType.dark; highest = hitData[? damageData.dark];};
if hitData[? damageData.pure] > highest {mainType = damageType.pure; highest = hitData[? damageData.pure];};

return mainType;