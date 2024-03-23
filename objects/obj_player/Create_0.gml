/// @description 
// Speeds
h_speed = 0;
v_speed = 0;
max_h_speed = 2;
walk_speed = 1.5;
h_speed_decimal = 0;
v_speed_decimal = 0;
jump_speed = -5;
jump_dampner = 2.5;
jumps_initial = 2;
jumps = jumps_initial;

// Friction
drag = .12;
//stretching
scale_x = 1;
scale_y = 1;
scale_min = 0.5;
scale_max = 1.25;
scale_decay = 0.2;

//gems
gems = 0;
gems_value = 50;

//set rm_00 start position
room_start_pos_x = 130;
room_start_pos_y = 126;
room_start_facing = 1;
x = room_start_pos_x;
y = room_start_pos_y;
// Facing direction
facing = room_start_facing;

//hurt
flash_counter = 0;
hurt = false;
hurt_time = room_speed;
hp = 5;
max_hp = hp;
//how long enemies get knocked back for when hit
knockback_time = room_speed / 2;
knockback_dis = 1.5;

//lives
lives_initial = 3;
lives = lives_initial;
lives_value = 1000;

// Movement
left = 0;
right = 0;
up = 0;
down = 0;
attack = 0;
jump = 0;
block = 0;
jump_held = 0;

// Camera
obj_camera.follow = obj_player;

// States
enum STATES {
	IDLE,
	WALK,
	JUMP,
	ATTACK,
	BLOCK,
	CROUCH,
	CROUCH_BLOCK,
	HURTING,
	KNOCKBACK,
	DIE,
	GAME_END
}

state = STATES.IDLE;

// Create states array
states_array[STATES.IDLE]				= player_idle_state;
states_array[STATES.WALK]				= player_walk_state;
states_array[STATES.JUMP]				= player_jump_state;
states_array[STATES.ATTACK]				= player_attack_state;
states_array[STATES.BLOCK]				= player_block_state;
states_array[STATES.CROUCH]				= player_crouch_state;
states_array[STATES.CROUCH_BLOCK]		= player_crouch_block_state;
states_array[STATES.HURTING]			= player_hurting_state;
states_array[STATES.KNOCKBACK]			= player_knockback_state;
states_array[STATES.DIE]				= player_die_state;
states_array[STATES.GAME_END]			= player_game_end_state;

// Create sprites array
sprites_array[STATES.IDLE]				= spr_player_idle;
sprites_array[STATES.WALK]				= spr_player_walk;
sprites_array[STATES.JUMP]				= spr_player_jump;
sprites_array[STATES.ATTACK]			= spr_player_attack;
sprites_array[STATES.BLOCK]				= spr_player_block;
sprites_array[STATES.CROUCH]			= spr_player_crouch;
sprites_array[STATES.CROUCH_BLOCK]		= spr_player_crouch_block;
sprites_array[STATES.HURTING]			= spr_player_hurting;
sprites_array[STATES.KNOCKBACK]			= spr_player_knockback;
sprites_array[STATES.DIE]				= spr_player_die;
sprites_array[STATES.GAME_END]			= spr_player_die;

// Create mask array
mask_array[STATES.IDLE]				= spr_player_idle;
mask_array[STATES.WALK]				= spr_player_idle;
mask_array[STATES.JUMP]				= spr_player_idle;
mask_array[STATES.ATTACK]			= spr_player_idle;
mask_array[STATES.BLOCK]			= spr_player_idle;
mask_array[STATES.CROUCH]			= spr_player_crouch;
mask_array[STATES.CROUCH_BLOCK]		= spr_player_crouch;
mask_array[STATES.HURTING]			= spr_player_idle;
mask_array[STATES.KNOCKBACK]		= spr_player_idle;
mask_array[STATES.DIE]				= spr_player_die;
mask_array[STATES.GAME_END]			= spr_player_die;