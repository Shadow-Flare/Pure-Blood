event_inherited();

enum cameraState {idle, player};
enum fadeType {none, in, out};

xTo = x;
yTo = y;
xPos = 0;
yPos = 0;

	//Screen Shake
shakeAmount = 0;
shakeAmountOriginal = 0;
shakeDuration = 0;
shakeTimer = 0;

	//Brute Force
forceX = 0;
forceY = 0;

	//real time fade
fadeTypeState = fadeType.none;
fadeColour = c_black;
fadeDuration = 0;
fadeTimer = 0;