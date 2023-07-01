extends "res://main.gd"

const MYMODNAME_LOG = "Crimson-ReloadWeapon"
const MYMODNAME_MOD_DIR = "Crimson-ReloadWeapon/"
export (Array, Resource) var reload_weapon_sounds:Array
export var reload_weapon_icon: Resource
var resource_dir = ""
var log_file: File = null 

func _init():
	resource_dir = ModLoaderMod.get_unpacked_dir() + MYMODNAME_MOD_DIR + "resources/"
	var default_sound = load(resource_dir + "reload-weapon.mp3")
	reload_weapon_icon = load(resource_dir + "icon-reload.png")
	reload_weapon_sounds = [default_sound]

		
# play sound and display text
func on_reload_weapon():
	var pos = _floating_text_manager.player.global_position - Vector2(0, 50)
	var db_mod = 0.0
	_floating_text_manager.display("", pos, Color.green, reload_weapon_icon, 0.5, false)
	SoundManager.play(Utils.get_rand_element(reload_weapon_sounds), - 3 + db_mod, 0.2, true)
	

func _input(event):
	if event is InputEventKey && event.pressed && event.scancode == KEY_R:
		_player.reset_weapons_cd()
		on_reload_weapon()
		# ModLoaderLog.info(now_scene.name, MYMODNAME_LOG)
		# RunData.add_stat("stat_attack_speed", 1)
		# emit_signal("tracked_value_updated")
	else:
		._input(event)
	

