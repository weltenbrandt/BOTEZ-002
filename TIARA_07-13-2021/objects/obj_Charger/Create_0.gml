// Movement variables
charge_speed = 7;

// Trail varaibles
spawn_trail_cooldown = 0.02; // in seconds
starting_opacity = 0.4; // The opacity that the trail will have on spawn
trail_color = c_red;  // The color of the trail
trail_fade_speed = 0.03; // The fade time per frame

// Charge variables
prepare_time = 1.5; // In seconds
charge_duration = 0.8; // In seconds
// Leave charge duration as -1 and the charge will only stop after the Charger hit a wall
face_to_target_while_charging = false;
charge_friction = 0.05;

build_up_speed = true; // Defines if the Charger needs to add up speed to each the charge_speed
//value or if he just gets that speed at once. This variable does not affect the slow down at the end of
//a charge
build_up_rate = 0.1;

charge_sound = snd_minotaurAlarm;

hit_sound = snd_placeholderPop;
hit_wall_sound = snd_placeholderPop;

// The amount of time (in seconds) to wait for playing another step sound
step_cooldown = 0.1; // in seconds
step_sound = snd_playerFootstepA

hitwall_shake = 3; // The force of the shake when hitting a wall

// This is the cooldown that the Charger will need to wait after hitting the player or after getting hit.
charge_cooldown = 3; // In seconds
charge_damage = 3;

// Parried variables
parry_cooldown = 5; // In seconds
parried_sound = snd_minotaurGetHit;

// Getting hit variables
hp = 1;
hurt_sound = snd_minotaurGetHit;
x_knockback = 6;

// Sword sound when successful
sword_hit_sound = snd_playerSwordHitA;


amount_of_coins_to_spawn = 10;

// Target variable
target = obj_player;
detection_radius = 100;

//Sprites
idleSprite = spr_chargerIdle;

prepareSprite = spr_chargerPrepare;
chargeSprite = spr_chargerCharge;
attackSprite = spr_chargerAttack;

damagedSprite = spr_chargerDamaged;
recoveredSprite = spr_chargerRecovered; // Enemy recovering from getting stunned

parriedSprite = spr_chargerParried;
stunnedSprite = spr_chargerStunned;
deathSprite = spr_chargerDead;

// Don't change these

prepare_time *= room_speed;
if (charge_duration != -1)
{
	charge_duration *= room_speed;
}
charge_cooldown *= room_speed;
parry_cooldown *= room_speed;

step_cooldown *= room_speed;

spawn_trail_cooldown *= room_speed;

enum Charger
{
	idle,
	hit,
	prepare,
	charge,
	parried,
	stunned,
	recovered,
	attacked,
	die,
	dead,
}

step_tick = 0;

trail_tick = 0;

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

flash_alpha = 0;
flash_speed = 0.1;

actual_speed = 0;