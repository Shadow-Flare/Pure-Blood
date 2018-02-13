event_inherited();

//circular movement
x = xInitial + dcos(angle)*radius;
y = yInitial + dsin(angle)*radius;

angle = (angle+angleDelta/room_speed)%360;