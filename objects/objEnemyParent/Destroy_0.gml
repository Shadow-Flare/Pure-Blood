instance_destroy(statCache);
ds_list_destroy(lastHitTypes);

if ds_exists(actionDataHolder,ds_type_list) ds_list_destroy(actionDataHolder);	//cascaded destroy