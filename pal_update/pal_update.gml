///@arg image_speed
///@arg pal_ind
///@arg cur_ind
var image_spd = argument[0];
var pal_ind = global.palettes[| argument[1]];
if (pal_ind[| ds_list_size(pal_ind)]) {
	var ind = cur_ind;
	cur_ind += image_spd;
	if (cur_ind > pal_ind[| 1]) {
		cur_ind = 0;	
	}
	ind = floor(cur_ind);
}

return cur_ind;