
// Cycle through all enemies andsee if they were hit
with (instance_place(x, y, obj_player)) {
	process_enemy_attack(5, 2.5);
}

// Enable death at begin step
die = true;