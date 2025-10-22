c = new controls_create()
c.add("jump", keyboard_check(ord("Q")))
move = pf_move_ext(c, 5, 1, 14, obj_colision,true)

x+=hspd
y+=vspd