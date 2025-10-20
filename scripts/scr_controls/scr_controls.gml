///@desc cria controles padrões para movimentar para 4 direções
function controls_create() constructor {
	up = keyboard_check(vk_up)
	left = keyboard_check(vk_left)
	down = keyboard_check(vk_down)
	right = keyboard_check(vk_right)
	
	add_control = function(key, value){
		struct_set(self, key, value)
	}
}

function td_move(controls, spd, colide=false, object=noone){
	hspd = (controls.right-controls.left)*spd
	vspd = (controls.down-controls.up)*spd
	var length = point_distance(0, 0, hspd, vspd);
	if (length > 0) {
	    hspd /= length;
	    vspd /= length;
	}
	hspd = round(hspd * spd);
	vspd = round(vspd * spd);
	if colide{
		if place_meeting(x+hspd,y,object){
			while !place_meeting(x+sign(hspd),y,object){
				x+=sign(hspd)
			}
			hspd=0
		}
		if place_meeting(x,y+vspd,object){
			while !place_meeting(x,y+sign(vspd),object){
				y+=sign(vspd)
			}
			vspd=0
		}
	}	
	return {
		hspd: hspd,
		vspd: vspd
	}
}