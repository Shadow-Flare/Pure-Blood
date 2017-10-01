/// @description Init Inherited Fields

// This class is the Parent class of all GameLoaders for any different game modes we have. 
// If we have a new game mode it should be initialized with a new GameLoader object in the 
// same way as the children of this object. For any Singleton Persistent Controller you want 
// to create, the game loader will have to add an index referencing that controller object in 
// its array such as controllers[i] = ManagerObject. Then call event_inherited(). This will do the rest

event_inherited(); // Call the singletons create event (Cant be more than 1 of me)

if (!layer_exists("Controllers"))
	layer_create(-1, "Controllers");

// Initiailize all of the controllers. Let us know if they are not setup
// correctly to be persistant through the rooms.
for (var i = 0; i < array_length_1d(controllers); i++)
{
	if (!instance_exists(controllers[i]))
	{
		obj = instance_create_layer(-1, -1, "Controllers", controllers[i]);	// Instance to create
		if (!variable_instance_exists(obj, "singleton"))
		{
			show_debug_message("Singletonnot initialized for " + object_get_name(obj) +
							", need to make sure we use event_inherited() in the create event.");
		}
	}
}

