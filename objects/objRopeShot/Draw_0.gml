image_angle = point_direction(x,y,caster.x,caster.y)+90;

var playerDist = point_distance(caster.x,caster.y,x,y);
totalSprites = playerDist/sprite_get_height(spr_hook_chain);

var prevX = x;
var prevY = y;
var relImageAngle = point_direction(x,y,caster.x,caster.y);

var moveX = sprite_get_height(spr_hook_chain)*dcos(relImageAngle);
var moveY = -sprite_get_height(spr_hook_chain)*dsin(relImageAngle);
x-=moveX/2;
y-=moveY/2;
for (var i = 0; i < ceil(totalSprites); i++)
{
	var px = x;
	var py = y;
	x+=moveX;
	y+=moveY;
	if i == ceil(totalSprites)-1
	{
		var c = c_white;
		var r = totalSprites-i;
		x = (caster.x+((px+x)/2))/2;
		y = (caster.y+((py+y)/2))/2;
		draw_sprite_ext(spr_hook_chain,0,x,y,1,r,relImageAngle-90,c_white,1);
	}
	else draw_sprite_ext(spr_hook_chain,0,x,y,1,1,relImageAngle-90,c_white,1);
}

x = prevX;
y = prevY;

draw_self();