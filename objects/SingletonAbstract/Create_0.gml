// Ensure only 1 Of my type can exist at a time
if (instance_number(object_index) > 1)
	instance_destroy(self,false);

singleton = true;