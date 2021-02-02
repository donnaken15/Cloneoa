
xprevious2 = xprevious
yprevious2 = yprevious

touching_ent = collision_rectangle(x-(5*1),y-(3*2),x+(5*1),y+(2*2),enemy,false,true)
if touching_ent != noone && touching_ent.grabby = noone
{
  touching_ent.grabby = player
  touching_ent.char_index = 5+(touching_ent.subtype*1000)
  player.grab = touching_ent
  player.fired = 0
  instance_destroy()
}

if time > timemax / 3
{
  if x > player.x
    x -= 2.7
  if x <= player.x
    x += 2.7
  if y >= player.y - 15
    y -= 2.7
  if y < player.y - 15
    y += 2.7
}
else
  x += 4-(flip*8)
if time > timemax
{
  instance_destroy()
  player.fired = 0
}
time += 1
