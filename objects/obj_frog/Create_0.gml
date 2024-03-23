event_inherited();
// Movement
h_speed = 0;
max_h_speed_initial = 2;
max_h_speed = max_h_speed_initial;
v_speed = 0;
_speed = 2;
jump_speed = -6
h_speed_decimal = 0;
v_speed_decimal = 0;
facing = choose(-1, 1);

// Actions
can_attack = true;
attack_delay = room_speed;

// Inhale
attack = false;
inhale = false;
inhale_timer = room_speed * .3;

// Breathing
breath_timer_initial = random_range(room_speed * 1.75, room_speed * 2.25);
breath_timer = breath_timer_initial;
image_speed = 0;

// Jump
// Will be jump this chance
jump_chance = 0.5;
// How often to check for a jump chance
jump_timer_initial = random_range(room_speed, room_speed * 1.5);
jump_timer = jump_timer_initial;

// States
enum FROG_STATES {
	IDLE,
	JUMP_START,
	JUMP,
	JUMP_LAND,
	ATTACK
}

state = FROG_STATES.IDLE;

states_array[FROG_STATES.IDLE]			= frog_idle_state;
states_array[FROG_STATES.JUMP_START]	= frog_jump_start_state;
states_array[FROG_STATES.JUMP]			= frog_jump_state;
states_array[FROG_STATES.JUMP_LAND]		= frog_jump_land_state;
states_array[FROG_STATES.ATTACK]		= frog_attack_state;

sprites_array[FROG_STATES.IDLE]			= spr_frog_idle;
sprites_array[FROG_STATES.JUMP_START]	= spr_frog_jump_start;
sprites_array[FROG_STATES.JUMP]			= spr_frog_jump;
sprites_array[FROG_STATES.JUMP_LAND]	= spr_frog_jump_land;
sprites_array[FROG_STATES.ATTACK]		= spr_frog_attack;