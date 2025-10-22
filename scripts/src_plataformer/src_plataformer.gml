///Adiciona Movimentação no estilo plataforma a um objeto
///move = pf_move(c, spd, grav, jump_force, obj_colision)
///retorna hspd e vspd
///use x += move.hspd y += move.vspd para ativar a movimentação e gravidade
///			---------------------------------------
///c = new controls()
///move = pf_move(c, 5, 1, 14, obj_colision)
///x+=move.hspd
///y+=move.vspd
function pf_move(controls = new controls_create(), spd, grav, jump_force, object){
	hspd = (controls.right-controls.left)*spd
	if !variable_instance_exists(self,"vspd"){
		vspd=0	
	}
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
	if !variable_struct_exists(controls,"jump"){
		controls.add("jump")
	}
	if !place_meeting(x,y+1,object){
		vspd+=grav
	}else{
		if controls.jump{
			vspd=-jump_force
		}
	}
	return {
		hspd: hspd,
		vspd: vspd,
	}
}



function pf_move_ext(controls = new controls_create(), spd, grav, jump_force, object, coyote=true){
	hspd = (controls.right-controls.left)*spd
	if !variable_instance_exists(self,"vspd"){
		vspd=0	
	}
	
	if coyote{
		if !variable_instance_exists(self, "jumpping"){
			jumpping=false
		}
		if !variable_instance_exists(self, "alarmc"){
			alarmc=40
		}
		if alarmc>0{
			alarmc--	
		}
		
		if !place_meeting(x,y+1,object){
			vspd+=grav
			if alarmc>0{
				if controls.jump && !jumpping{
					vspd=-jump_force
					jumpping=true
				}
			}
		}else{
			if controls.jump{
				vspd=-jump_force
				jumpping=true
			}
			jumpping=false
			alarmc=40
		}
	}else{
		if !place_meeting(x,y+1,object){
			vspd+=grav
		}else{
			if controls.jump{
				vspd=-jump_force
			}
		}
	}
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
	if !variable_struct_exists(controls,"jump"){
		controls.add("jump")
	}
	
	return {
		hspd: hspd,
		vspd: vspd,
	}
}