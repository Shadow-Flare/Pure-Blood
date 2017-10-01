if (phase=="neutral")&&(place_meeting(x,y-1,objPlayer)&&!place_meeting(x,y+sprite_get_bbox_bottom(sprite_index),objPlayer))&&objPlayer.ySpd>=0
{
	phase= "shakey";
	shakeTimer = -1;
}

switch phase
{
	case "neutral": ySpd = 0; break;
	case "returning":
		ySpd = 0;
		returnTimer++
		retNum = returnTimer/room_speed*1
		image_xscale = 1;
		image_yscale = 1;
		x = initialX + (sprite_width/2)*(1-retNum);
		y = initialY + (sprite_get_bbox_bottom(sprite_index)-sprite_get_bbox_top(sprite_index)/2)*(1-retNum);
		image_xscale = retNum;
		image_yscale = retNum;
		image_alpha = retNum;
		if returnTimer == room_speed*1
		{
			phase = "neutral";
			x = initialX;
			y = initialY;
			image_xscale = 1;
			image_yscale = 1;
			image_alpha = 1;
			image_index = 0;
		}
		break;
	case "shakey":
		ySpd = 0;
		yMod = irandom_range(0,2);
		y = initialY + yMod;
		shakeTimer++
		if shakeTimer == room_speed*1
		{
			phase = "down";
			downTimer = -1;
			y = initialY
		}
		break;
	case "down": 
		if ySpd < 5 ySpd += global.g;
		if ySpd > 5 ySpd = 5;
		downTimer++;
		if downTimer == room_speed*4
		{
			phase = "returning";
			returnTimer = -1;
		}
		break;
}

y+=ySpd;

if phase != "returning" scr_move_player_above();