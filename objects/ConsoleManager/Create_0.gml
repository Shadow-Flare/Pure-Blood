event_inherited();

//console initializer
gamePhase = noone;

tmp = "";
consoleEnabled = false;
commandStr = "";
commandRes = "";
selectIndex = 0;

conAltStartMaxNum = 3;	//0 = New Game//1 = Arena//2 = Horde Mode//3 = New Game var 2//
conAltStartIndex = noone;

conPureFps = false;
conClickHack = false;
conHelpMenu = false;
conLockOnTarget = noone;
conLockOnType = "No Lock"
fpsList = ds_list_create();

lightTester = noone;
LTBoxWidth = 1200;
LTBoxHeight = 200;

ambienceTester = false;
ATBoxWidth = 1000;
ATBoxHeight = 200;

selectedVariable = 0;

defaultRoomSpeed = room_speed;
maxHistory = 14;
for (var i=0; i<maxHistory; i++)
{
	history[i] = "";
	historyM[i] = "";
}
historyM[0] = "enter '?' or 'help' for options";

ini_open("settings");
	for(var i = 0; i < maxHistory; i++)
	{
		history[i] = ini_read_string("consoleHistory","commandHistory"+string(i),"");
		historyM[i] = ini_read_string("consoleHistory","messageHistory"+string(i),"");
	}
ini_close();