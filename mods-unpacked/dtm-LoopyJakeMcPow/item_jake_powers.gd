extends ItemScript

var player: Player


func on_collect(_item: Item, _object: Node3D) -> void:
	var _player: Player
	if not Util.get_player():
		_player = await Util.s_player_assigned
	else:
		_player = Util.get_player()
	setup(_player)

func on_load(item: Item) -> void:
	on_collect(item, null)

func setup(_player: Player) -> void:
	player = _player
	BattleService.s_battle_started.connect(check_traps)
	BattleService.s_round_ended.connect(check_traps)

func check_traps(manager: BattleManager) -> void:
	for cog in manager.cogs:
		for trap: StatusTrapped in BattleService.ongoing_battle.get_statuses_for_target(cog):
			if trap.gag.damage >= cog.stats.hp:
				pass
