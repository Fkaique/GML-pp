///@desc cria controles padrões para movimentar para 4 direções


function controls_create() constructor {
	up = keyboard_check(vk_up)
	left = keyboard_check(vk_left)
	down = keyboard_check(vk_down)
	right = keyboard_check(vk_right)
	///Adiciona um novo atalho pro controle
	///c.add(key {nome do atalho em string}, value {função ou valor bool})
	///O parametro 'key' tem alguns padrões para ser usado de forma rápida, fazendo o value ter um valor padrão.
	///			---------------------------------------
	///->"jump" define 'keyboard_check_pressed(vk_space||ord("K")) em value
	///->"squat" define 'keyboard_check(vk_shift) em value



	add = function(key, value=noone){
		if value==noone{
			switch (key){
				case "jump":
					value=keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("K"))
					break;
				case "squat":
					value=keyboard_check_pressed(vk_shift)
					break;
			}	
		}
		struct_set(self, key, value)
	}
	
}
