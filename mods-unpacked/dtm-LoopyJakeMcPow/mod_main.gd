extends Node


const MOD_DIR := "dtm-LoopyJakeMcPow"
const MOD_LOG_NAME := "dtm-LoopyJakeMcPow:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().path_join(MOD_DIR)
	install_script_extensions()
	install_script_hook_files()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	# ModLoaderMod.install_script_extension(extensions_dir_path.path_join("objects/player/character.gd"))

func install_script_hook_files() -> void:
	extensions_dir_path = mod_dir_path.path_join("extensions")
	ModLoaderMod.install_script_hooks("res://objects/player/character.gd", extensions_dir_path.path_join("objects/player/character.hooks.gd"))

func _ready() -> void:
	ModLoaderLog.info("Ready!", MOD_LOG_NAME)
	# NOTE: preloading causes issues, call normal load here
	CustomToonRegistry.CUSTOM_TOONS.append(load("res://mods-unpacked/dtm-LoopyJakeMcPow/loopy_jake_mcpow.tres"))
	print("Appended Loopy Jake McPow")
