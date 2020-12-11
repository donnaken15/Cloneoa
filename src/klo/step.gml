
player_speed = 1.5
view_hspeed[0] = 1.5

if ground = 0 && gravity = 0 { gravity = 0.25 }

if vspeed >= 4 gravity = 0

if keyboard_check(vk_right) /*&& place_free(x-player_speed,y)*/ && !keyboard_check(vk_left) { flip = 0 x += player_speed moving = 1 }
if keyboard_check(vk_left) /*&& place_free(x-player_speed,y)*/ { flip = 1 if x > 0 x -= player_speed moving = 1 }

if !keyboard_check(vk_right) && !keyboard_check(vk_left) moving = 0

char_index += char_speed

if (keyboard_check_pressed(vk_left) ||
    keyboard_check_pressed(vk_right)) && ground char_index = 10
if ((keyboard_check_released(vk_left) ||
    keyboard_check_released(vk_right)) && ground && !moving) char_index = 0

if keyboard_check_pressed(vk_tab) room_speed = 1000000
else if keyboard_check_released(vk_tab) room_speed = 60

if vspeed != 0 { ground = 0 }

if vspeed = 0 && gravity = 0 && ground && keyboard_check_pressed(vk_space) { jump = 1 ground = 0 last_char_index = char_index char_index = 20 vspeed = -6 }

if vspeed >= 0 && jump { char_index = 25 jump = 0 }

//if vspeed>0 char_index
