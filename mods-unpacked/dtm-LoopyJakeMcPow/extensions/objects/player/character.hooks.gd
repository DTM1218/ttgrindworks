extends Object

# currently not functional
func character_setup(chain: ModLoaderHookChain, player: Player):
	chain.reference_object.character_setup(player)
	if player.name == "Loopy Jake McPow":
		player.stats.gags_unlocked['Drop'] = 1
		player.stats.gags_unlocked['Squirt'] = 1
