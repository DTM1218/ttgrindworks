extends ItemScript

var _manager : BattleManager = null

func on_collect(_item: Item, _model: Node3D) -> void:
	setup()
 
func on_load(_item: Item) -> void:
	setup()

func setup() -> void:
	BattleService.s_battle_started.connect(on_battle_start)

func on_battle_start(manager: BattleManager) -> void:
	manager.s_action_finished.connect(action_finished)

func action_finished(action : BattleAction):
	if action is ToonAttack and action is not GagDrop and action.damage > 0:
		for target in action.targets:
			for effect: StatusEffect in BattleService.ongoing_battle.get_statuses_for_target(target):
				if effect is not StatEffectAftershock:
					continue
				var shock : StatEffectAftershock = effect
				await shock.renew()
				if shock.rounds == 0:
					await BattleService.ongoing_battle.expire_status_effect(shock)
				elif shock.rounds > 0:
					shock.rounds -= 1
