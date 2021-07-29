// Movement variables
charge_speed = 3;

// Charge variables
prepare_time = 3; // In seconds
charge_duration = 5; // In seconds
// Leave charge duration as -1 and the charge will only stop after the Charger hit a wall
face_to_target_while_charging = false;

hit_sound = snd_placeholderPop;

// This is the cooldown that the Charger will need to wait after hitting the player.
// The cooldown isn't applied if the player parried the attack
charge_cooldown = 3; // In seconds
charge_damage = 1;

// Parried variables
parry_cooldown = 3; // In seconds

// Getting hit variables
hp = 3;
hurt_sound = snd_minotaurGetHit;

// Target variable
target = obj_player;
detection_radius = 100;

//Sprites
idleSprite = spr_chargerIdle;
prepareSprite = spr_chargerPrepare;
chargeSprite = spr_chargerCharge;
attackSprite = spr_chargerParried;
parriedSprite = spr_chargerParried;
deathSprite = spr_chargerDead;

// Don't change these

prepare_time *= room_speed;
if (charge_duration != -1)
{
	charge_duration *= room_speed;
}
charge_cooldown *= room_speed;

enum Charger
{
	idle,
	prepare,
	charge,
	parried,
	attacked,
}

attacked = false;

charge_tick = 0;
prepare_tick = 0;
parry_tick = 0;

hspd = 0;
vspd = 0;
grv = 0.3;

grounded = true;

attack_tick = 0;

attack_cooldown = 0;

state = Charger.idle;