
function td_move(controls, spd){
	hspd = (controls.right-controls.left)*spd
	vspd = (controls.down-controls.up)*spd
	var length = point_distance(0, 0, hspd, vspd);
	if (length > 0) {
	    hspd /= length;
	    vspd /= length;
	}
	hspd = round(hspd * spd);
	vspd = round(vspd * spd);
	return {
		hspd: hspd,
		vspd: vspd
	}
}

function td_move_and_colide(controls, spd, object=object_index){
	hspd = (controls.right-controls.left)*spd
	vspd = (controls.down-controls.up)*spd
	var length = point_distance(0, 0, hspd, vspd);
	if (length > 0) {
	    hspd /= length;
	    vspd /= length;
	}
	hspd = round(hspd * spd);
	vspd = round(vspd * spd);
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
	return {
		hspd: hspd,
		vspd: vspd
	}
}


