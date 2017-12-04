///@ arg amount[PIXELS]
///@ arg duration[SECONDS]
var amount = argument0;
var duration = argument1;

with Camera
{
	shakeAmount = amount;
	shakeAmountOriginal = amount;
	shakeDuration = duration;
	shakeTimer = 0;
}