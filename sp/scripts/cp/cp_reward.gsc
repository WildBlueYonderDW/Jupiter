#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_agent_utils.gsc;
#using script_3bcaa2cbaf54abdd;

#namespace namespace_dcfc2f5abb4fec90;

// Namespace namespace_dcfc2f5abb4fec90 / scripts\cp\cp_reward
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xef
// Size: 0x36b
function give_attacker_kill_rewards(attacker, shitloc) {
    if (self.team == "allies") {
        return;
    }
    if (istrue(self.died_poorly)) {
        return;
    }
    if (scripts\cp\cp_agent_utils::get_agent_type(self) == "elite" || scripts\cp\cp_agent_utils::get_agent_type(self) == "mammoth") {
        var_4ad66e8a50624bdb = get_reward_point_for_kill();
        foreach (player in level.players) {
            givekillreward(player, var_4ad66e8a50624bdb, "large");
        }
        return;
    }
    if (isdefined(self.attacker_damage) || isdefined(self.marked_by_hybrid)) {
        if (isdefined(self.marked_by_hybrid)) {
            foreach (player in level.players) {
                if (isdefined(self.player_who_tagged) && self.player_who_tagged == player && player != attacker) {
                    var_c514d611c295eb = getassistbonusamount();
                    givekillreward(player, var_c514d611c295eb * 2);
                    player namespace_6c67e93a4c487d83::eog_player_update_stat("assists", 1);
                    self.hybrid_assist = 1;
                }
            }
        }
        if (!isdefined(self.hybrid_assist)) {
            var_a9a6e8c32b90ca45 = 0.1;
            var_8bb17efd6eb74e3d = self.maxhealth * var_a9a6e8c32b90ca45;
            var_c514d611c295eb = getassistbonusamount();
            foreach (var_9ae6be01e200a866 in self.attacker_damage) {
                if (var_9ae6be01e200a866.player == attacker || isdefined(attacker.owner) && var_9ae6be01e200a866.player == attacker.owner) {
                    continue;
                }
                if (var_9ae6be01e200a866.damage >= var_8bb17efd6eb74e3d) {
                    if (isdefined(var_9ae6be01e200a866.player) && var_9ae6be01e200a866.player != attacker) {
                        assertex(isplayer(var_9ae6be01e200a866.player), "Tried to give non-player rewards");
                        var_9ae6be01e200a866.player namespace_6c67e93a4c487d83::eog_player_update_stat("assists", 1);
                        givekillreward(var_9ae6be01e200a866.player, var_c514d611c295eb);
                    }
                }
            }
        }
    }
    if (!isdefined(attacker)) {
        return;
    }
    if (!isplayer(attacker) && (!isdefined(attacker.owner) || !isplayer(attacker.owner))) {
        return;
    }
    var_33242ca76a448f6b = 0;
    if (isdefined(attacker.owner)) {
        attacker = attacker.owner;
        var_33242ca76a448f6b = 1;
    }
    var_4ad66e8a50624bdb = get_reward_point_for_kill();
    if (isdefined(shitloc) && shitloc == "soft" && !var_33242ca76a448f6b) {
        var_4ad66e8a50624bdb = int(var_4ad66e8a50624bdb * 1.5);
    }
    givekillreward(attacker, var_4ad66e8a50624bdb, "large", shitloc);
}

// Namespace namespace_dcfc2f5abb4fec90 / scripts\cp\cp_reward
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x462
// Size: 0x1f
function getassistbonusamount() {
    return level.agent_definition[scripts\cp\cp_agent_utils::get_agent_type(self)]["reward"] * 0.5;
}

// Namespace namespace_dcfc2f5abb4fec90 / scripts\cp\cp_reward
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48a
// Size: 0x19
function get_reward_point_for_kill() {
    return level.agent_definition[scripts\cp\cp_agent_utils::get_agent_type(self)]["reward"];
}

// Namespace namespace_dcfc2f5abb4fec90 / scripts\cp\cp_reward
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac
// Size: 0x8c
function givekillreward(attacker, amount, size, shitloc) {
    var_4024268b4fd10e68 = amount;
    attacker namespace_6c67e93a4c487d83::give_player_currency(var_4024268b4fd10e68, size, shitloc);
    if (isdefined(level.zombie_xp)) {
        attacker namespace_6c67e93a4c487d83::give_player_xp(int(var_4024268b4fd10e68));
    }
    if (scripts\engine\utility::flag_exist("cortex_started") && scripts\engine\utility::flag("cortex_started")) {
        if (isdefined(level.add_cortex_charge_func)) {
            [[ level.add_cortex_charge_func ]](amount);
        }
    }
}

