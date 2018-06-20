var boss = instance_find(objServantGuard,0);
var transformedBossObject = objBloodHound;

with instance_create_layer(boss.x,boss.y,"lay_entities",transformedBossObject)
{
	facing = boss.facing;
}

instance_destroy(boss);