extends Node

const MYMODNAME_MOD_DIR = "Crimson-ReloadWeapon/"
const MYMODNAME_LOG = "Crimson-ReloadWeapon"

var dir = ""


func _init(modLoader = ModLoader):
	name = "ReloadWeapon"
	ModLoaderLog.info("Init", MYMODNAME_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + MYMODNAME_MOD_DIR

	# Add extensions
	ModLoaderMod.install_script_extension(dir + "extensions/main.gd")


func _ready():
	ModLoaderLog.info("Mod ReloadWeapon ready", MYMODNAME_LOG)
#	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
#	var content_dir = dir + "resources/"
#	ContentLoader.load_data(content_dir + "modname_characters.tres", MYMODNAME_LOG)
