//console initializer
tmp = "";
consoleEnabled = false;
commandStr = "";
commandRes = "";
selectIndex = 0;
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
for (var i=0; i<7; i++)
{
	history[i] = "";
	historyM[i] = "";
}
historyM[0] = "enter '?' or 'help' for options"

//LIST OF COMMANDS
	//GOTO
	//SET ROOM SPEED
	//CLICK HACK
	//SHUTDOWN
	//HELP
helpText[0] = "Commands:"
helpText[1] = "goto <room Name>"
helpText[2] = "setroomspeed <integer > 0>"
helpText[3] = "clickhack"
helpText[4] = "shutdown"
helpText[5] = "purefps"
helpText[6] = "lightTester"
helpText[7] = "ambienceTester"
helpText[8] = "help   /   ?"
//Messages
helpTextM[0] = "Information:"
helpTextM[1] = "Transfers you to <room Name>, likely will cause progression related bugs."
helpTextM[2] = "Changes room speed to <integer > 0>, likely will cause many timing related bugs, dont do this."
helpTextM[3] = "Enables/disables the ability to move character to the clicked location, likely will cause progression/collision related bugs."
helpTextM[4] = "Hard shutdown of the game, will not save, will not do anything"
helpTextM[5] = "Limit console text to only show the current fps, gives a more accurate impression since it disables other console background behaviours."
helpTextM[6] = "Toggle Light Tester object and interface"
helpTextM[7] = "Toggle Ambience Tester interface"
helpTextM[8] = "Enable/disable help menu"