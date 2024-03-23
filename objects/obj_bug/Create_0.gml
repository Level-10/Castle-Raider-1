event_inherited();
// Movement
h_speed = 0;
max_h_speed_initial = .5;
max_h_speed = max_h_speed_initial;
v_speed = 0;
_speed = .5;
jump_speed = -6
h_speed_decimal = 0;
v_speed_decimal = 0;
facing = choose(-1, 1);
drag = 0.04;
hp = 3;
death_gem_value = 5;

//patrol
//how far the bug moves in one direction
patrol_distance = 96;
//patrol start position
start_x = x;
start_y = y;
//how long to wait before patrolling
wait_time_initial = random_range(room_speed * 2, room_speed * 4);
wait_time = wait_time_initial;

//chase
//target to move to
target_x = 0;
target_y = 0;
chase_speed = 1;

//minimum to start chasing
chase_distance = 100;

//hurt
hurt_time = room_speed / 2;
// States
enum BUG_STATES {
	IDLE,
	PATROL,
	CHASE

}

state = BUG_STATES.IDLE;

states_array[BUG_STATES.IDLE]			= bug_idle_state;
states_array[BUG_STATES.PATROL]			= bug_patrol_state;
states_array[BUG_STATES.CHASE]			= bug_chase_state;

sprites_array[BUG_STATES.IDLE]			= spr_bug_idle;
sprites_array[BUG_STATES.PATROL]		= spr_bug_idle;
sprites_array[BUG_STATES.CHASE]		= spr_bug_chase;
