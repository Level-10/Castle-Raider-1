v_speed_initial = random_range(-6, -3);
v_speed = v_speed_initial;
h_speed_initial = random_range(2, 5) * choose(-1, 1);
h_speed = h_speed_initial;
h_speed_decimal = 0;
v_speed_decimal = 0;
drag = .05;
die = false;

//pick colour
image_index = irandom(image_number - 1);

//has bouce happened yet ?
bounce = false;

//can player pickup this yet ?
can_pickup = false;

//enable light
inst = instance_create_layer(x, y, "Light", obj_light);
light_id = inst.id;
inst.type = 4;
//get gem color
inst.col_index = image_index;