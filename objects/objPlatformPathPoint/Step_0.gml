if !hasInitialized
{
	if pathID != noone
	{
		with PathManager
		{
			if pathMap[? other.pathID] == undefined
			{
				pathMap[? other.pathID] = path_add();
				path_set_kind(pathMap[? other.pathID],other.curved)
				path_set_closed(pathMap[? other.pathID],other.closed);
			}
			path_add_point(pathMap[? other.pathID],other.x,other.y,100);
		}
	}
	else show_debug_message(string(id)+": 'pathID' not set on Path point object")
	
	hasInitialized = true;
}