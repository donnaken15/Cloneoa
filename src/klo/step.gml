player_speed = 1.5
view_hspeed[0] = 1.5

if keyboard_check(vk_right) && !keyboard_check(vk_left) { flip = 0 x += player_speed moving = 1 }
if keyboard_check(vk_left) { flip = 1 x -= player_speed moving = 1 }

if !keyboard_check(vk_right) && !keyboard_check(vk_left) moving = 0

char_index += char_speed

if  keyboard_check_pressed(vk_left) ||
    keyboard_check_pressed(vk_right) char_index = 10
if (keyboard_check_released(vk_left) ||
    keyboard_check_released(vk_right)) && !moving char_index = 0

if keyboard_check_pressed(vk_tab) room_speed = 1000000
else if keyboard_check_released(vk_tab) room_speed = 60

//y=30vspeed=0
gravity=0.4

//if vspeed=0.4 char_index

if y > 128 { vspeed = 0 gravity = 0 y = 30 }

if vspeed >= 4 gravity = 0
