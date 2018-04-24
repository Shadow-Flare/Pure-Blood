///@arg instance
///@arg amount
var instance = argument0;
var amount = argument1;

with instance.statCache hp = clamp(hp+amount,0,hpMax);