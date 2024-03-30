// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gametypes\arena.gsc;
#using scripts\mp\bots\bots_gametype_dom.gsc;
#using scripts\mp\bots\bots_gametype_gun.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\gametypes\dom.gsc;

#namespace namespace_2414384b63d56d85;

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e8
// Size: 0x34
function main() {
    level.var_e6628286205f2ea7 = 1;
    level.bot_ignore_precalc_paths = 0;
    level.arenaloadouts = 1;
    setup_callbacks();
    setup_bot_arena();
    /#
    #/
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x523
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x530
// Size: 0x4b
function setup_callbacks() {
    if (scripts/mp/gametypes/arena::ispickuploadouts()) {
        level.bot_funcs["dropped_weapon_think"] = &arena_bot_think_seek_dropped_weapons;
        level.bot_funcs["dropped_weapon_cancel"] = &arena_should_stop_seeking_weapon;
    }
    level.bot_funcs["gametype_think"] = &bot_arena_think;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x582
// Size: 0x99
function setup_bot_arena() {
    if (!scripts/mp/gametypes/arena::isnormalloadouts()) {
        level.bots_gametype_handles_class_choice = 1;
    }
    while (!isdefined(level.arenaflag) || !isdefined(level.arenaflag.nodes)) {
        waitframe();
    }
    bot_fixup_pathnode_issues();
    if (istrue(game["isLaunchChunk"])) {
        if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
            return;
        }
    }
    numflags = ter_op(level.objmodifier == 1, 3, 1);
    scripts/mp/bots/bots_gametype_dom::setup_bot_dom(numflags, 3);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x622
// Size: 0x1a3
function bot_arena_think() {
    self notify("bot_arena_think");
    self endon("bot_arena_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(self.pers["bot_original_personality"])) {
        self.pers["bot_original_personality"] = self.personality;
    }
    wait(0.1);
    if (!scripts/mp/gametypes/arena::isnormalloadouts()) {
        if (self botgetdifficultysetting("advancedPersonality") && self botgetdifficultysetting("strategyLevel") > 0) {
            scripts/mp/bots/bots_gametype_gun::bot_gun_pick_personality_from_weapon(self getcurrentweapon().basename, self.pers["bot_original_personality"]);
        }
    }
    self.var_51e08ee04ef3bdbc = 0;
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        if (isdefined(level.arenaflag) && level.arenaflag.visibleteam == "any" && isdefined(level.arenaflag.nodes)) {
            self notify("bot_dom_think");
            if (!bot_is_capturing() || !self.var_51e08ee04ef3bdbc) {
                bot_capture_zone(level.arenaflag.trigger.origin, level.arenaflag.nodes, level.arenaflag.trigger);
            }
            self.var_51e08ee04ef3bdbc = 1;
        } else {
            self [[ self.personality_update_function ]]();
            thread bot_dom_think();
        }
        wait(0.05);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cc
// Size: 0x28a
function arena_bot_think_seek_dropped_weapons() {
    self notify("bot_think_seek_dropped_weapons");
    self endon("bot_think_seek_dropped_weapons");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_7ba262cc7ab5e283 = "throwingknife_mp";
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        var_6fe7e4707cd33327 = 0;
        if (arena_bot_out_of_ammo() || bot_get_low_on_all_ammo(0.33)) {
            if (self [[ level.bot_funcs["should_pickup_weapons"] ]]() && !bot_is_remote_or_linked()) {
                dropped_weapons = getentarray("dropped_weapon", "targetname");
                var_6ac6ee221e4d7361 = get_array_of_closest(self.origin, dropped_weapons);
                if (var_6ac6ee221e4d7361.size > 0) {
                    dropped_weapon = var_6ac6ee221e4d7361[0];
                    level.dropped_weapon = dropped_weapon;
                    arena_bot_seek_dropped_weapon(dropped_weapon);
                }
            }
        }
        if (!bot_in_combat() && !bot_is_remote_or_linked() && self botgetdifficultysetting("strategyLevel") > 0) {
            var_4b40839ad49e4f31 = self hasweapon(var_7ba262cc7ab5e283);
            knife_thrown = var_4b40839ad49e4f31 && self getammocount(var_7ba262cc7ab5e283) == 0;
            if (knife_thrown) {
                if (isdefined(self.going_for_knife)) {
                    wait(5);
                    continue;
                }
                dropped_knives = getentarray("dropped_knife", "targetname");
                var_d22a29017f63ae78 = get_array_of_closest(self.origin, dropped_knives);
                foreach (knife in var_d22a29017f63ae78) {
                    if (!isdefined(knife)) {
                        continue;
                    }
                    if (!isdefined(knife.calculated_closest_point)) {
                        result = bot_queued_process("BotGetClosestNavigablePoint", &func_bot_get_closest_navigable_point, knife.origin, 32, self);
                        if (isdefined(knife)) {
                            knife.closest_point_on_grid = result;
                            knife.calculated_closest_point = 1;
                        } else {
                            continue;
                        }
                    }
                    if (isdefined(knife.closest_point_on_grid)) {
                        self.going_for_knife = 1;
                        arena_bot_seek_dropped_weapon(knife);
                    }
                }
            } else if (var_4b40839ad49e4f31) {
                self.going_for_knife = undefined;
            }
        }
        wait(randomfloatrange(0.25, 0.75));
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5d
// Size: 0x24b
function arena_bot_seek_dropped_weapon(dropped_weapon) {
    if (bot_has_tactical_goal("seek_dropped_weapon", dropped_weapon) == 0) {
        if (istrue(level.snowballfight)) {
            bot_lethal = self botfirstavailablegrenade("lethal");
            bot_tactical = self botfirstavailablegrenade("tactical");
            if (isdefined(bot_lethal) && bot_lethal.basename == "snowball_mp") {
                eq = scripts/mp/equipment::getcurrentequipment("primary");
                var_bd0ead7ae63d86d = scripts/mp/equipment::getequipmentammo(eq);
                if (bot_lethal.basename == "snowball_mp" && var_bd0ead7ae63d86d > 3) {
                    return;
                }
            }
            if (isdefined(bot_tactical) && bot_tactical.basename == "pball_mp") {
                eq = scripts/mp/equipment::getcurrentequipment("secondary");
                var_bd0ead7ae63d86d = scripts/mp/equipment::getequipmentammo(eq);
                if (bot_tactical.basename == "pball_mp") {
                    return;
                }
            }
        }
        action_thread = undefined;
        if (dropped_weapon.targetname == "dropped_weapon") {
            var_661c34ec270a10 = 1;
            heldweapons = self getweaponslistprimaries();
            foreach (held_weapon in heldweapons) {
                if (dropped_weapon.model == getweaponmodel(held_weapon)) {
                    var_661c34ec270a10 = 0;
                }
            }
            if (var_661c34ec270a10) {
                action_thread = &arena_bot_pickup_weapon;
            }
        }
        extra_params = spawnstruct();
        extra_params.object = dropped_weapon;
        extra_params.script_goal_radius = 12;
        extra_params.should_abort = level.bot_funcs["dropped_weapon_cancel"];
        extra_params.action_thread = action_thread;
        result = undefined;
        nearestnode = dropped_weapon.origin;
        if (isdefined(dropped_weapon.bot_pickup_origin)) {
            nearestnode = dropped_weapon.bot_pickup_origin;
        }
        bot_new_tactical_goal("seek_dropped_weapon", nearestnode, 100, extra_params);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcaf
// Size: 0x25
function arena_bot_pickup_weapon(goal) {
    self botpressbutton("use", 0.5);
    thread updatebotpersonalitybasedonweapon();
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0x5a
function updatebotpersonalitybasedonweapon() {
    self notify("updateBotWeaponBehavior");
    self endon("updateBotWeaponBehavior");
    wait(2);
    if (self botgetdifficultysetting("advancedPersonality") && self botgetdifficultysetting("strategyLevel") > 0) {
        scripts/mp/bots/bots_gametype_gun::bot_gun_pick_personality_from_weapon(self getcurrentweapon().basename, self.pers["bot_original_personality"]);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd3c
// Size: 0x16f
function arena_should_stop_seeking_weapon(goal) {
    if (arena_bot_get_total_gun_ammo() > 0) {
        var_2da1aa903372d531 = scripts/mp/utility/weapon::getweapongroup(self getcurrentweapon());
        if (isdefined(goal.object)) {
            var_462b87bdb6f81db4 = goal.object.classname;
            if (string_starts_with(var_462b87bdb6f81db4, "weapon_")) {
                var_462b87bdb6f81db4 = getsubstr(var_462b87bdb6f81db4, 7);
            }
            weapgroup = scripts/mp/utility/weapon::getweapongroup(var_462b87bdb6f81db4);
            if (!bot_weapon_is_better_class(var_2da1aa903372d531, weapgroup)) {
                return true;
            }
        }
    }
    if (!isdefined(goal.object)) {
        return true;
    }
    if (goal.object.targetname == "dropped_weapon") {
        foreach (weapon in self.weaponlist) {
            if (weapon.basename == "iw9_me_fists_mp") {
                return false;
            }
        }
        if (arena_bot_get_total_gun_ammo() > 0) {
            return true;
        }
    } else if (goal.object.targetname == "dropped_knife") {
        if (bot_in_combat()) {
            self.going_for_knife = undefined;
            return true;
        }
    }
    return false;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeb3
// Size: 0xcc
function arena_bot_get_total_gun_ammo() {
    total_ammo = 0;
    weapon_list = undefined;
    if (isdefined(self.weaponlist) && self.weaponlist.size > 0) {
        weapon_list = self.weaponlist;
    } else {
        weapon_list = self getweaponslistprimaries();
    }
    foreach (weapon in weapon_list) {
        total_ammo = total_ammo + self getweaponammoclip(weapon);
        total_ammo = total_ammo + self getweaponammostock(weapon);
    }
    if (weapon_list.size == 1 && weapon_list[0].basename == "iw9_me_fists_mp") {
        total_ammo = 0;
    }
    return total_ammo;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf87
// Size: 0xc7
function arena_bot_out_of_ammo() {
    weapon_list = undefined;
    if (isdefined(self.weaponlist) && self.weaponlist.size > 0) {
        weapon_list = self.weaponlist;
    } else {
        weapon_list = self getweaponslistprimaries();
    }
    if (weapon_list.size == 1 && weapon_list[0].basename == "iw9_me_fists_mp") {
        return true;
    }
    foreach (weapon in weapon_list) {
        if (self getweaponammoclip(weapon) > 0) {
            return false;
        }
        if (self getweaponammostock(weapon) > 0) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1056
// Size: 0xca
function bot_rank_weapon_class(weapgroup) {
    weaprank = 0;
    switch (weapgroup) {
    case #"hash_2a94fec6c49569e9":
    case #"hash_94b6083b667776c8":
    case #"hash_9d18adab1b65a661":
    case #"hash_f52e65764345d6c0":
        break;
    case #"hash_34340d457a63e7f1":
        weaprank = 1;
        break;
    case #"hash_47368bc0d2ef1565":
    case #"hash_c095d67337b1f5a1":
        weaprank = 2;
        break;
    case #"hash_bef5ec0b3e197ae":
    case #"hash_16cf6289ab06bd30":
    case #"hash_8af0086b038622b5":
    case #"hash_ab10f9c080fe4faf":
    case #"hash_dd616da0b395a0b0":
        weaprank = 3;
        break;
    }
    return weaprank;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1128
// Size: 0x3b
function bot_weapon_is_better_class(oldweapclass, newweapclass) {
    var_6340e02c42637715 = bot_rank_weapon_class(oldweapclass);
    var_e197aebbb030a0e = bot_rank_weapon_class(newweapclass);
    return var_e197aebbb030a0e > var_6340e02c42637715;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116b
// Size: 0xf1
function iw8_ship_hack_add_flag_node(origin) {
    hacknode = spawncovernode(origin, (0, randomint(360), 0), "Cover Stand");
    if (!isdefined(level.arenaflag.nodes)) {
        level.arenaflag.nodes = [];
    }
    level.arenaflag.nodes[level.arenaflag.nodes.size] = hacknode;
    if (!isdefined(level.objectives["_a"].bottargets)) {
        level.objectives["_a"].bottargets = [];
    }
    level.objectives["_a"].bottargets[level.objectives["_a"].bottargets.size] = hacknode;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1263
// Size: 0x7e
function bot_fixup_pathnode_issues() {
    if (level.mapname == "mp_m_pine") {
        origin = (22, 12, 0);
        thread iw8_ship_hack_add_flag_node(origin);
        origin = (-4, 1, 0);
        thread iw8_ship_hack_add_flag_node(origin);
        origin = (0, -33, 0);
        thread iw8_ship_hack_add_flag_node(origin);
        origin = (35, -23, 0);
        thread iw8_ship_hack_add_flag_node(origin);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e8
// Size: 0x155
function bot_dom_think() {
    self notify("bot_dom_think");
    self endon("bot_dom_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self.force_new_goal = 0;
    self.new_goal_time = 0;
    self.next_strat_level_check = 0;
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    self botsetflag("use_obj_path_style", 1);
    for (;;) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        bot_update_camp_assassin();
        cur_time = gettime();
        if (cur_time > self.next_strat_level_check) {
            self.next_strat_level_check = gettime() + 10000;
            self.strategy_level = self botgetdifficultysetting("strategyLevel");
        }
        if (cur_time > self.new_goal_time || self.force_new_goal) {
            if (should_delay_flag_decision()) {
                self.new_goal_time = cur_time + 5000;
            } else {
                self.force_new_goal = 0;
                bot_choose_flag();
                self.new_goal_time = cur_time + randomintrange(30000, 45000);
            }
        }
        waittill_notify_or_timeout("needs_new_flag_goal", 1);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1444
// Size: 0xe1
function should_delay_flag_decision() {
    if (self.force_new_goal) {
        return false;
    }
    if (!bot_is_capturing()) {
        return false;
    }
    if (self.current_flag scripts/mp/gametypes/dom::getflagteam() == self.team) {
        return false;
    }
    var_3498229c5a4f8731 = get_flag_capture_radius();
    if (isdefined(self.current_flag.trigger) && distancesquared(self.origin, self.current_flag.trigger.origin) < var_3498229c5a4f8731 * 2 * var_3498229c5a4f8731 * 2) {
        ally_flags = get_ally_flags(self.team);
        if (ally_flags.size == 2 && !array_contains(ally_flags, self.current_flag) && !bot_allowed_to_3_cap()) {
            return false;
        }
        return true;
    }
    return false;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152d
// Size: 0x16
function get_override_flag_targets() {
    return level.bot_dom_override_flag_targets[self.team];
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154b
// Size: 0x18
function has_override_flag_targets() {
    override_targets = get_override_flag_targets();
    return override_targets.size > 0;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156b
// Size: 0x14
function flag_has_been_captured_before(flag) {
    return !flag_has_never_been_captured(flag);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1587
// Size: 0x17
function flag_has_never_been_captured(flag) {
    return flag.firstcapture;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a6
// Size: 0x1fe
function bot_choose_flag() {
    flag = undefined;
    var_7ba2208479205cf2 = [];
    var_23b9e499d084cad = [];
    override_targets = get_override_flag_targets();
    if (override_targets.size > 0) {
        var_a9ddbdf62ea00196 = override_targets;
    } else {
        var_a9ddbdf62ea00196 = level.objectives;
    }
    foreach (flag in var_a9ddbdf62ea00196) {
        if (flag.objectivekey == "_a") {
            continue;
        }
        team = flag scripts/mp/gametypes/dom::getflagteam();
        if (flag_has_been_captured_before(flag)) {
            var_39c262926ffa6a00 = 0;
        }
        if (team != self.team) {
            var_7ba2208479205cf2[var_7ba2208479205cf2.size] = flag;
            continue;
        }
        var_23b9e499d084cad[var_23b9e499d084cad.size] = flag;
    }
    attacking = undefined;
    if (var_23b9e499d084cad.size == 1) {
        if (!bot_should_defend_flag(var_23b9e499d084cad[0], 1)) {
            attacking = 1;
        } else {
            attacking = !bot_should_defend(0.34);
        }
    } else {
        return;
    }
    /#
        assert(isdefined(attacking));
    #/
    if (attacking) {
        /#
            assert(var_7ba2208479205cf2.size == 1);
        #/
        var_7727a8a4f4a2e7fe = var_7ba2208479205cf2;
        if (var_7727a8a4f4a2e7fe.size == 1) {
            flag = var_7727a8a4f4a2e7fe[0];
        }
    } else {
        /#
            assert(var_23b9e499d084cad.size > 0);
        #/
        var_f9e86f3c87ab9f97 = var_23b9e499d084cad;
        foreach (test_flag in var_f9e86f3c87ab9f97) {
            if (bot_should_defend_flag(test_flag, var_23b9e499d084cad.size)) {
                flag = test_flag;
                break;
            }
        }
    }
    if (attacking) {
        capture_flag(flag);
        return;
    }
    defend_flag(flag);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ab
// Size: 0x5
function bot_allowed_to_3_cap() {
    return true;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17b8
// Size: 0x77
function bot_should_defend(var_e8d030a9fa5114ee) {
    /#
        assert(var_e8d030a9fa5114ee >= 0 && var_e8d030a9fa5114ee <= 1);
    #/
    if (randomfloat(1) < var_e8d030a9fa5114ee) {
        return 1;
    }
    personality_type = level.bot_personality_type[self.personality];
    if (personality_type == "stationary") {
        return 1;
    } else if (personality_type == "active") {
        return 0;
    }
    /#
        assertmsg("unreachable");
    #/
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1836
// Size: 0xef
function capture_flag(var_f0b1a2262b2f7dfc, override_goal_type, var_119041cda5e9adf2) {
    /#
        assert(isdefined(var_f0b1a2262b2f7dfc));
    #/
    self.current_flag = var_f0b1a2262b2f7dfc;
    if (isdefined(var_f0b1a2262b2f7dfc.trigger)) {
        if (bot_dom_debug_should_protect_all()) {
            optional_params["override_goal_type"] = override_goal_type;
            optional_params["entrance_points_index"] = get_flag_label(var_f0b1a2262b2f7dfc);
            bot_protect_point(var_f0b1a2262b2f7dfc.trigger.origin, get_flag_protect_radius(), optional_params);
        } else {
            optional_params["override_goal_type"] = override_goal_type;
            optional_params["entrance_points_index"] = get_flag_label(var_f0b1a2262b2f7dfc);
            bot_capture_zone(var_f0b1a2262b2f7dfc.trigger.origin, var_f0b1a2262b2f7dfc.nodes, var_f0b1a2262b2f7dfc.trigger, optional_params);
        }
        if (!isdefined(var_119041cda5e9adf2) || !var_119041cda5e9adf2) {
            thread monitor_flag_status(var_f0b1a2262b2f7dfc);
        }
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x192c
// Size: 0xd5
function defend_flag(var_3e376080e8dc9e3a) {
    /#
        assert(isdefined(var_3e376080e8dc9e3a));
    #/
    self.current_flag = var_3e376080e8dc9e3a;
    if (isdefined(var_3e376080e8dc9e3a.trigger)) {
        if (bot_dom_debug_should_capture_all()) {
            optional_params["entrance_points_index"] = get_flag_label(var_3e376080e8dc9e3a);
            bot_capture_zone(var_3e376080e8dc9e3a.trigger.origin, var_3e376080e8dc9e3a.nodes, var_3e376080e8dc9e3a.trigger, optional_params);
        } else {
            optional_params["entrance_points_index"] = get_flag_label(var_3e376080e8dc9e3a);
            optional_params["nearest_node_to_center"] = var_3e376080e8dc9e3a.nearest_node;
            bot_protect_point(var_3e376080e8dc9e3a.trigger.origin, get_flag_protect_radius(), optional_params);
        }
        thread monitor_flag_status(var_3e376080e8dc9e3a);
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a08
// Size: 0x24
function get_flag_capture_radius() {
    if (!isdefined(level.capture_radius)) {
        level.capture_radius = 158;
    }
    return level.capture_radius;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a34
// Size: 0x58
function get_flag_protect_radius() {
    if (!isdefined(level.protect_radius)) {
        worldbounds = self botgetworldsize();
        average_side = (worldbounds[0] + worldbounds[1]) / 2;
        level.protect_radius = min(1000, average_side / 3.5);
    }
    return level.protect_radius;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a94
// Size: 0x1b2
function bot_dom_leader_dialog(dialog, location) {
    if (issubstr(dialog, "losing") && dialog != "losing_score" && dialog != "losing_time" && dialog != "gamestate_domlosing") {
        var_f666be4a2abc34f6 = getsubstr(dialog, dialog.size - 2);
        flag_losing = get_specific_flag_by_label(var_f666be4a2abc34f6);
        /#
            assertex(isdefined(flag_losing), "Flag not found for string '" + dialog + "'");
        #/
        if (isdefined(flag_losing) && bot_allow_to_capture_flag(flag_losing)) {
            self botmemoryevent("known_enemy", undefined, flag_losing.trigger.origin);
            if (!isdefined(self.last_losing_flag_react) || gettime() - self.last_losing_flag_react > 10000) {
                if (bot_is_protecting()) {
                    var_d493bd9f5a8adf45 = distancesquared(self.origin, flag_losing.trigger.origin) < 490000;
                    var_cba76c2fa6170699 = bot_is_protecting_flag(flag_losing);
                    if (var_d493bd9f5a8adf45 || var_cba76c2fa6170699) {
                        capture_flag(flag_losing);
                        self.last_losing_flag_react = gettime();
                    }
                }
            }
        }
    } else if (issubstr(dialog, "secured")) {
        var_f666be4a2abc34f6 = getsubstr(dialog, dialog.size - 2);
        flag_taken = get_specific_flag_by_label(var_f666be4a2abc34f6);
        /#
            assert(isdefined(flag_taken));
        #/
        flag_taken.last_time_secured[self.team] = gettime();
    }
    bot_leader_dialog(dialog, location);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4d
// Size: 0x36
function bot_allow_to_capture_flag(flag) {
    override_targets = get_override_flag_targets();
    if (override_targets.size == 0) {
        return true;
    }
    if (array_contains(override_targets, flag)) {
        return true;
    }
    return false;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8b
// Size: 0x422
function monitor_flag_status(flag) {
    self notify("monitor_flag_status");
    self endon("monitor_flag_status");
    self endon("bot_dom_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_f2b47e412166c272 = get_num_ally_flags(self.team);
    var_82fe1c44f0e59dd5 = get_flag_capture_radius() * get_flag_capture_radius();
    var_9a86288b6e984514 = get_flag_capture_radius() * 3 * get_flag_capture_radius() * 3;
    var_278595174c3b888b = 1;
    while (var_278595174c3b888b) {
        needs_new_goal = 0;
        var_a78b2b0ebf2f977f = flag scripts/mp/gametypes/dom::getflagteam();
        var_877f0c734271995 = get_num_ally_flags(self.team);
        enemy_flags = get_enemy_flags(self.team);
        if (bot_is_capturing()) {
            if (var_a78b2b0ebf2f977f == self.team && flag.claimteam == "none") {
                if (!bot_dom_debug_should_capture_all()) {
                    needs_new_goal = 1;
                }
            }
            if (var_877f0c734271995 == 2 && var_a78b2b0ebf2f977f != self.team && !bot_allowed_to_3_cap()) {
                if (isdefined(flag.trigger) && distancesquared(self.origin, flag.trigger.origin) > var_82fe1c44f0e59dd5) {
                    needs_new_goal = 1;
                }
            }
            foreach (enemy_flag in enemy_flags) {
                if (isdefined(enemy_flag.trigger) && enemy_flag != flag && bot_allow_to_capture_flag(enemy_flag)) {
                    if (distancesquared(self.origin, enemy_flag.trigger.origin) < var_9a86288b6e984514) {
                        needs_new_goal = 1;
                    }
                }
            }
            if (isdefined(flag.trigger) && self istouching(flag.trigger) && flag.userate <= 0) {
                if (self bothasscriptgoal()) {
                    script_goal = self botgetscriptgoal();
                    script_goal_radius = self botgetscriptgoalradius();
                    if (distancesquared(self.origin, script_goal) < squared(script_goal_radius)) {
                        var_b6f1deb8e946e67c = self getnearestnode();
                        if (isdefined(var_b6f1deb8e946e67c)) {
                            var_1aaf2917e47371a3 = undefined;
                            foreach (defend_node in flag.nodes) {
                                if (!nodesvisible(defend_node, var_b6f1deb8e946e67c, 1)) {
                                    var_1aaf2917e47371a3 = defend_node.origin;
                                    break;
                                }
                            }
                            if (isdefined(var_1aaf2917e47371a3)) {
                                self.defense_investigate_specific_point = var_1aaf2917e47371a3;
                                self notify("defend_force_node_recalculation");
                            }
                        }
                    }
                }
            }
        }
        if (bot_is_protecting()) {
            if (var_a78b2b0ebf2f977f != self.team) {
                if (!bot_dom_debug_should_protect_all()) {
                    needs_new_goal = 1;
                }
            } else if (var_877f0c734271995 == 1 && var_f2b47e412166c272 > 1) {
                needs_new_goal = 1;
            }
        }
        var_f2b47e412166c272 = var_877f0c734271995;
        if (needs_new_goal) {
            self.force_new_goal = 1;
            var_278595174c3b888b = 0;
            self notify("needs_new_flag_goal");
            continue;
        }
        result = level waittill_notify_or_timeout_return("flag_changed_ownership", 1 + randomfloatrange(0, 2));
        var_a862627b64e75a21 = isdefined(result) && result == "timeout";
        if (!var_a862627b64e75a21) {
            /#
                assert(self.strategy_level <= 3);
            #/
            wait_time = max((3 - self.strategy_level) * 1 + randomfloatrange(-0.5, 0.5), 0);
            wait(wait_time);
        }
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20b4
// Size: 0x141
function bot_dom_get_node_chance(node) {
    if (node == self.node_closest_to_defend_center) {
        return 1;
    }
    if (!isdefined(self.current_flag)) {
        return 1;
    }
    var_f43fb0e14ccfb9e1 = 0;
    var_a7ff1fe77b4291e1 = get_flag_label(self.current_flag);
    ally_flags = get_ally_flags(self.team);
    foreach (ally_flag in ally_flags) {
        if (ally_flag != self.current_flag) {
            var_f43fb0e14ccfb9e1 = node node_is_on_path_from_labels(var_a7ff1fe77b4291e1, get_flag_label(ally_flag));
            if (var_f43fb0e14ccfb9e1) {
                third_flag = get_other_flag(self.current_flag, ally_flag);
                var_8eb11236ac48ce3 = third_flag scripts/mp/gametypes/dom::getflagteam();
                if (var_8eb11236ac48ce3 != self.team) {
                    if (node node_is_on_path_from_labels(var_a7ff1fe77b4291e1, get_flag_label(third_flag))) {
                        var_f43fb0e14ccfb9e1 = 0;
                    }
                }
            }
        }
    }
    if (var_f43fb0e14ccfb9e1) {
        return 0.2;
    }
    return 1;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21fd
// Size: 0x56
function get_flag_label(flag) {
    flag_label = "";
    if (isdefined(flag.teleport_zone)) {
        flag_label = flag_label + flag.teleport_zone + "_";
    }
    flag_label = flag_label + "flag" + flag.objectivekey;
    return flag_label;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x225b
// Size: 0x86
function get_other_flag(flag1, flag2) {
    /#
        assert(level.objectives.size == 3);
    #/
    foreach (objective in level.objectives) {
        if (objective != flag1 && objective != flag2) {
            return objective;
        }
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22e8
// Size: 0x50
function get_specific_flag_by_letter(flag_letter) {
    /#
        assert(flag_letter == "A" || flag_letter == "B" || flag_letter == "C");
    #/
    flag_label = "_" + tolower(flag_letter);
    return get_specific_flag_by_label(flag_label);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2340
// Size: 0x6b
function get_specific_flag_by_label(flag_label) {
    foreach (objective in level.objectives) {
        if (objective.objectivekey == flag_label) {
            return objective;
        }
    }
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23b2
// Size: 0xac
function get_closest_flag(origin) {
    closest_flag = undefined;
    var_d7e79a673c0d8d21 = undefined;
    foreach (objective in level.objectives) {
        var_4ea84b05d2e463a4 = distancesquared(objective.trigger.origin, origin);
        if (!isdefined(var_d7e79a673c0d8d21) || var_4ea84b05d2e463a4 < var_d7e79a673c0d8d21) {
            closest_flag = objective;
            var_d7e79a673c0d8d21 = var_4ea84b05d2e463a4;
        }
    }
    return closest_flag;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2466
// Size: 0xef
function get_num_allies_capturing_flag(flag, ignore_humans) {
    var_6fd52c0a557b6a40 = 0;
    var_3498229c5a4f8731 = get_flag_capture_radius();
    foreach (other_player in level.participants) {
        if (!isdefined(other_player.team)) {
            continue;
        }
        if (other_player.team == self.team && other_player != self && isteamparticipant(other_player)) {
            if (isai(other_player)) {
                if (other_player bot_is_capturing_flag(flag)) {
                    var_6fd52c0a557b6a40++;
                }
                continue;
            }
            if (!isdefined(ignore_humans) || !ignore_humans) {
                if (other_player istouching(flag)) {
                    var_6fd52c0a557b6a40++;
                }
            }
        }
    }
    return var_6fd52c0a557b6a40;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x255d
// Size: 0x1e
function bot_is_capturing_flag(flag) {
    if (!bot_is_capturing()) {
        return 0;
    }
    return bot_target_is_flag(flag);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2583
// Size: 0x1e
function bot_is_protecting_flag(flag) {
    if (!bot_is_protecting()) {
        return 0;
    }
    return bot_target_is_flag(flag);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25a9
// Size: 0x17
function bot_target_is_flag(flag) {
    return self.current_flag == flag;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25c8
// Size: 0x81
function get_num_ally_flags(team) {
    count = 0;
    foreach (objective in level.objectives) {
        flag_team = objective scripts/mp/gametypes/dom::getflagteam();
        if (flag_team == team) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2651
// Size: 0x8e
function get_enemy_flags(team) {
    flags = [];
    foreach (objective in level.objectives) {
        flag_team = objective scripts/mp/gametypes/dom::getflagteam();
        if (flag_team == get_enemy_team(team)) {
            flags = array_add(flags, objective);
        }
    }
    return flags;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26e7
// Size: 0x88
function get_ally_flags(team) {
    flags = [];
    foreach (objective in level.objectives) {
        flag_team = objective scripts/mp/gametypes/dom::getflagteam();
        if (flag_team == team) {
            flags = array_add(flags, objective);
        }
    }
    return flags;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2777
// Size: 0x3c
function bot_should_defend_flag(potential_flag, var_2d7337cdf8f706c0) {
    var_26d0fe30296086c4 = get_max_num_defenders_wanted_per_flag(var_2d7337cdf8f706c0);
    var_89d5717bf18a21ed = get_players_defending_flag(potential_flag);
    return var_89d5717bf18a21ed.size < var_26d0fe30296086c4;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27bb
// Size: 0x44
function get_max_num_defenders_wanted_per_flag(var_2d7337cdf8f706c0) {
    team_limit = bot_get_max_players_on_team(self.team);
    if (var_2d7337cdf8f706c0 == 1) {
        return ceil(team_limit / 6);
    }
    return ceil(team_limit / 3);
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2806
// Size: 0x165
function get_players_defending_flag(potential_flag) {
    var_20b890e2dd5949fa = get_flag_protect_radius();
    bots_defending = [];
    foreach (other_player in level.participants) {
        if (!isdefined(other_player.team)) {
            continue;
        }
        if (other_player.team == self.team && other_player != self && isteamparticipant(other_player)) {
            if (isai(other_player)) {
                if (other_player bot_is_protecting_flag(potential_flag)) {
                    bots_defending = array_add(bots_defending, other_player);
                }
                continue;
            }
            var_c3d8550ca7e24e40 = gettime() - potential_flag.last_time_secured[self.team];
            if (var_c3d8550ca7e24e40 < 10000) {
                continue;
            }
            /#
                if (other_player isufo() || other_player isnoclip()) {
                    continue;
                }
            #/
            if (isdefined(potential_flag.trigger) && distancesquared(potential_flag.trigger.origin, other_player.origin) < var_20b890e2dd5949fa * var_20b890e2dd5949fa) {
                bots_defending = array_add(bots_defending, other_player);
            }
        }
    }
    return bots_defending;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2973
// Size: 0x21
function bot_dom_debug_should_capture_all() {
    /#
        if (getdvar(@"hash_d19b61818b442235") == "updateBotWeaponBehavior") {
            return true;
        }
    #/
    return false;
}

// Namespace namespace_2414384b63d56d85 / namespace_18892daeb470271d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299c
// Size: 0x21
function bot_dom_debug_should_protect_all() {
    /#
        if (getdvar(@"hash_e1e41766847222dc") == "updateBotWeaponBehavior") {
            return true;
        }
    #/
    return false;
}

