draw_self();

if usable
{
	pedestalHoverTimer++;
	
	var image = item_get_data(itemHeldCat,itemHeldID,itemStats.icon);
	var imageW = sprite_get_width(image);
	var imageH = sprite_get_height(image);
	var gap = pedestalImageGap+pedestalHoverVariance+sprite_get_yoffset(sprite_index);
	var hover = pedestalHoverVariance*sin(pedestalHoverTimer/(4*pi));
	draw_sprite_ext(image,0,x-imageW/2+1,y-imageH-gap+hover,1,1,0,c_white,1.0);
}