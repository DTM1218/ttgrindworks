extends "res://mods-unpacked/dtm-MoreCharacters/extensions/objects/globals/globals.gd"

func load_custom_toons() -> void:
	super()
	Globals.CUSTOM_TOONS.append(preload('res://objects/player/characters/loopy_jake_mcpow.tres'))
