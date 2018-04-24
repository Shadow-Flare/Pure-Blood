//checks
var absHInput = abs(InputManager.moveInputH);
var absVInput = abs(InputManager.moveInputV);
var horInputMoreThanVert = absHInput >= absVInput;
var sXPrev = sX;
var sYPrev = sY;
var sExpXPrev = sExpX;

#region Determine movement
var vInput = 0, hInput = 0;
if  (moveTimer == 0) || 
	(moveTimer >= ceil(0.3 * room_speed) && moveTimer < ceil(1.0 * room_speed) && floor(moveTimer % (ceil(0.35 * room_speed))) == 0) ||
	(moveTimer >= ceil(1.0 * room_speed) && floor(moveTimer%(ceil((1 / 10) * room_speed))) == 0)
{
	if (absHInput > 0.5 && horInputMoreThanVert) hInput = sign(InputManager.moveInputH);
	else 
	{
		if InputManager.dRInput hInput++;
		if InputManager.dLInput hInput--;
	}

	if (absVInput > 0.5 && !horInputMoreThanVert) vInput = sign(InputManager.moveInputV);
	else
	{
		if InputManager.dDInput vInput++;
		if InputManager.dUInput vInput--;
	}
}

if (absHInput > 0.5 || absVInput > 0.5 || InputManager.dLInput || InputManager.dRInput || InputManager.dUInput || InputManager.dDInput)
{
	moveTimer++;
}
else moveTimer = 0;
#endregion
#region Apply Movement
if !slotExpanded
{
	//sX = clamp(sX+hInput,0,array_height_2d(current_menu_options));
	sY = clamp(sY+vInput,0,array_length_2d(current_menu_options,sX));
}
else
{
	sExpX = clamp(sExpX+hInput,0,array_length_1d(slotOptions));
}
#endregion

selection = current_menu_options[sX,sY];

#region (A)			Select
if InputManager.aInput == 1
{
	switch current_menu
	{
		case "main menu":
			if !slotExpanded 
			{
				switch selection
				{
					case "Enemy: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions = ArenaController.enemyList;
						break;
					case "Enemy Number: ":
						slotExpanded = true;
						slotOptions = [];				
						for (var i = 0; i < maxEnemies+1; i++)
						{
							slotOptions[i] = i;
						}
						break;
					case "Enemy Maximum Hp: ":
						slotExpanded = true;
						slotOptions = [];	
						for (var i = 0; i < maxEnemyHp+1; i++)
						{
							slotOptions[i] = i;
						}
						break;
					case "Enemy Physical Strength: ":
						slotExpanded = true;
						slotOptions = [];
						for (var i = 0; i < maxEnemyPhysicalStrength+1; i++)
						{
							slotOptions[i] = i;
						}
						break;
					case "Enemy Invulnerability: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions[0] = false;
						slotOptions[1] = true;
						break;
					case "Player Invulnerability: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions[0] = false;
						slotOptions[1] = true;
						break;
					case "Change Arena: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions[0] = "Manor: Small";
						slotOptions[1] = "Dungeon: Large";
						slotOptions[2] = "Forest: Large with pitfalls";
						slotOptions[3] = "Town: Small, Flat and borderless";
						break;
					case "Platforms Enabled: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions[0] = false;
						slotOptions[1] = true;
						break;
					case "Hook Points Enabled: ":
						slotExpanded = true;
						slotOptions = [];	
						slotOptions[0] = false;
						slotOptions[1] = true;
						break;
					case "Heal all entities":
						with PlayerStats
						{
							hp = hpMax;
							mp = mpMax;
						}
						with ActorStats
						{
							hp = hpMax;
							mp = mpMax;						
						}
						break;
					case "Remove all enemies":
						instance_activate_object(ArenaController.enemy)
						with ArenaController.enemy instance_destroy();
						break;
					case "Exit":
						instance_activate_all();
						instance_destroy();
						surface_free(global.pauseSplash);
						break;
				}
				if slotExpanded for (var i = 0; i < array_length_1d(slotOptions); i++)
				{
					if slotOptions[i] == ArenaController.arenaStats[sY]
					{
						sExpX = i;
						break;
					}
				}
			}
			else
			{
				var newValue = slotOptions[sExpX]
				ArenaController.arenaStats[sY] = newValue;
				if sY == 0
				{
					with ArenaController
					{
						instance_activate_object(enemy);
						with enemy instance_destroy();
						instance_activate_object(objMeleeAttackEffect);
						with objMeleeAttackEffect instance_destroy();
						var s = other.slotOptions[other.sExpX]
						for(var i = 0; i < ArenaController.numberOfEnemies; i++)
						{
							if s = enemyValues[i,0]
							{
								enemyID = i;
								break;
							}
							enemyID = 0;
						}
						arenaStats[0] = enemyValues[enemyID,0];			//Enemy Name
						arenaStats[1] = 1;								//Enemy Number
						arenaStats[2] = enemyValues[enemyID,1];			//Enemy Maximum Hp
						arenaStats[3] = enemyValues[enemyID,2];			//Enemy Physical Strength
						arenaStats[4] = enemyValues[enemyID,3];			//Enemy Invulnerability
					}
				}
				slotExpanded = false;
			}
			break;
	}
}
#endregion
#region (B)			Cancel
if InputManager.bInput == 1
{
	switch current_menu
	{
		case "main menu":
			if slotExpanded
			{
				slotExpanded = false;
			}
			else
			{
				unpause = true;
			}
			break;
	}
}
#endregion
#region (Start)		Un-pause
if InputManager.startInput
{
	unpause = 1;
}
#endregion

#region execute unpause
if unpause
{
	instance_activate_all();
	instance_destroy();
}
#endregion