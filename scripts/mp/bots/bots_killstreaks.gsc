// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_c46d1fa142cf800f;

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dc
// Size: 0xbd
function bot_killstreak_setup() {
    if (!isdefined(level.killstreak_botfunc)) {
        if (!isdefined(level.killstreak_botfunc)) {
            level.killstreak_botfunc = [];
        }
        if (!isdefined(level.killstreak_botcanuse)) {
            level.killstreak_botcanuse = [];
        }
        if (!isdefined(level.killstreak_botparm)) {
            level.killstreak_botparm = [];
        }
        if (!isdefined(level.bot_supported_killstreaks)) {
            level.bot_supported_killstreaks = [];
        }
        if (istrue(game["isLaunchChunk"])) {
            return;
        }
        bot_register_killstreak_func("uav", &bot_killstreak_simple_use);
        bot_register_killstreak_func("directional_uav", &bot_killstreak_simple_use);
        if (isdefined(level.mapcustombotkillstreakfunc)) {
            [[ level.mapcustombotkillstreakfunc ]]();
        }
        /#
            function_227b3e3c529f9d0();
        #/
    }
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a0
// Size: 0x91
function bot_register_killstreak_func(name, func, can_use, var_d153265565df63da) {
    if (!isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[name])) {
        /#
            println("allies" + name + "<unknown string>");
        #/
        return;
    }
    level.killstreak_botfunc[name] = func;
    level.killstreak_botcanuse[name] = can_use;
    level.killstreak_botparm[name] = var_d153265565df63da;
    level.bot_supported_killstreaks[level.bot_supported_killstreaks.size] = name;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x438
// Size: 0x2f
function function_41a8ca2dae1a1343(streak) {
    /#
        if (!function_d66de7b5a877b42c(streak)) {
            /#
                assertmsg("<unknown string>" + streak + "<unknown string>");
            #/
        }
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46e
// Size: 0x4a
function function_26244da889a0235a(streak, bot) {
    /#
        if (!function_49c1e963fb43ee47(streak, bot)) {
            /#
                assertmsg("<unknown string>" + bot.name + "<unknown string>" + streak + "<unknown string>");
            #/
        }
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf
// Size: 0x102
function function_227b3e3c529f9d0() {
    /#
        wait(1);
        var_84ac56621661adf2 = [];
        foreach (streakname in level.bot_supported_killstreaks) {
            if (!function_c8ae136cc2c20507(streakname)) {
                error("<unknown string>" + streakname);
                var_84ac56621661adf2[var_84ac56621661adf2.size] = streakname;
            }
            wait(0.05);
        }
        if (var_84ac56621661adf2.size) {
            temp = level.killstreaksetups;
            level.killstreaksetups = [];
            foreach (streakname in temp) {
                if (!array_contains(var_84ac56621661adf2, streakname)) {
                    level.killstreaksetups[streakname] = temp[streakname];
                }
            }
        }
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c8
// Size: 0x1c
function function_c8ae136cc2c20507(streakname) {
    /#
        return bot_killstreak_is_valid_internal(streakname, "<unknown string>");
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5eb
// Size: 0x1c
function function_d66de7b5a877b42c(streakname) {
    /#
        return bot_killstreak_is_valid_internal(streakname, "<unknown string>");
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x60e
// Size: 0x25
function function_49c1e963fb43ee47(streakname, bot) {
    /#
        return bot_killstreak_is_valid_internal(streakname, "<unknown string>", bot);
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x63a
// Size: 0x56
function bot_killstreak_valid_for_specific_streaktype(streakname, streaktype, var_cd3fcf4785236cda) {
    if (bot_killstreak_is_valid_internal(streakname, "bots", undefined, streaktype)) {
        return 1;
    } else if (var_cd3fcf4785236cda) {
        /#
            assertmsg("Bots with streakType <" + streaktype + "> do not support killstreak <" + streakname + ">");
        #/
    }
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698
// Size: 0xb5
function bot_killstreak_is_valid_internal(streakname, var_ca854a77f264bed6, var_44b62635a6fb50c7, var_1c9ca7dbe4790741) {
    var_c61cd683f3a90cc2 = undefined;
    if (streakname == "specialist") {
        return 1;
    }
    if (!bot_killstreak_is_valid_single(streakname, var_ca854a77f264bed6)) {
        return 0;
    }
    if (isdefined(var_1c9ca7dbe4790741)) {
        var_c61cd683f3a90cc2 = getsubstr(var_1c9ca7dbe4790741, 11);
        switch (var_c61cd683f3a90cc2) {
        case #"hash_d4f05e450448c3ec":
            if (!isassaultkillstreak(streakname)) {
                return 0;
            }
            break;
        case #"hash_605929bc0f7f95c8":
            if (!issupportkillstreak(streakname)) {
                return 0;
            }
            break;
        case #"hash_2bee0bf604b15c84":
            if (!isspecialistkillstreak(streakname)) {
                return 0;
            }
            break;
        }
    }
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x755
// Size: 0x61
function bot_killstreak_is_valid_single(streakname, var_ca854a77f264bed6) {
    if (var_ca854a77f264bed6 == "humans") {
        return (isdefined(level.killstreaksetups[streakname]) && namespace_9abe40d2af041eb2::getkillstreakindex(streakname) != -1);
    } else if (var_ca854a77f264bed6 == "bots") {
        return isdefined(level.killstreak_botfunc[streakname]);
    }
    /#
        assertmsg("Unreachable");
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bd
// Size: 0x3c
function bot_watch_for_killstreak_use() {
    self notify("bot_watch_for_killstreak_use");
    self endon("bot_watch_for_killstreak_use");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self waittill("killstreak_use_finished");
        _switchtoweapon("none");
    }
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x800
// Size: 0x26
function bot_is_killstreak_supported(name) {
    if (!isdefined(name)) {
        return 0;
    }
    if (!isdefined(level.killstreak_botfunc[name])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82e
// Size: 0x3a
function bot_can_use_killstreak(name) {
    var_f40f83e224a240f1 = level.killstreak_botcanuse[name];
    if (!isdefined(var_f40f83e224a240f1)) {
        return 0;
    }
    if (isdefined(var_f40f83e224a240f1) && !self [[ var_f40f83e224a240f1 ]]()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x870
// Size: 0x3
function bot_think_killstreak() {
    
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x87a
// Size: 0x4
function bot_can_use_aa_launcher() {
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x886
// Size: 0x3
function bot_start_aa_launcher_tracking() {
    
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x890
// Size: 0x11
function bot_killstreak_never_use() {
    /#
        assertmsg("bot_killstreak_never_use() was somehow called");
    #/
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a8
// Size: 0x4
function bot_can_use_air_superiority() {
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b4
// Size: 0x1b
function aerial_vehicle_allowed() {
    if (isairdenied()) {
        return 0;
    }
    if (vehicle_would_exceed_limit()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7
// Size: 0x27
function vehicle_would_exceed_limit() {
    return currentactivevehiclecount() >= maxvehiclesallowed() || level.fauxvehiclecount + 1 >= maxvehiclesallowed();
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x906
// Size: 0x9c
function bot_can_use_emp() {
    if (isdefined(level.empplayer)) {
        return 0;
    }
    var_b0c33d224b825287 = getenemyteams(self.owner.team);
    foreach (entry in var_b0c33d224b825287) {
        if (isdefined(level.teamemped) && !istrue(level.teamemped[entry])) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa
// Size: 0x4
function bot_can_use_ball_drone() {
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b6
// Size: 0x6d
function bot_killstreak_simple_use(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(randomintrange(3, 5));
    if (!bot_allowed_to_use_killstreaks()) {
        return 1;
    }
    if (isdefined(var_86af96fe008c96ee) && !self [[ var_86af96fe008c96ee ]]()) {
        return 0;
    }
    bot_switch_to_killstreak_weapon(killstreak_info, killstreaks_array, killstreak_info.weapon);
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x34
function bot_killstreak_drop_anywhere(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7) {
    bot_killstreak_drop(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7, "anywhere");
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa66
// Size: 0x34
function bot_killstreak_drop_outside(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7) {
    bot_killstreak_drop(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7, "outside");
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1
// Size: 0x34
function bot_killstreak_drop_hidden(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7) {
    bot_killstreak_drop(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7, "hidden");
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadc
// Size: 0x346
function bot_killstreak_drop(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7, var_f9ca2fddc6a91ad8) {
    wait(randomintrange(2, 4));
    if (!isdefined(var_f9ca2fddc6a91ad8)) {
        var_f9ca2fddc6a91ad8 = "anywhere";
    }
    if (!bot_allowed_to_use_killstreaks()) {
        return 1;
    }
    if (isdefined(var_86af96fe008c96ee) && !self [[ var_86af96fe008c96ee ]]()) {
        return 0;
    }
    ammo = self getweaponammoclip(killstreak_info.weapon) + self getweaponammostock(killstreak_info.weapon);
    if (ammo == 0) {
        foreach (streak in killstreaks_array) {
            if (isdefined(streak.streakname) && streak.streakname == killstreak_info.streakname) {
                streak.available = 0;
            }
        }
        return 1;
    }
    var_a10b280fbad02413 = undefined;
    if (var_f9ca2fddc6a91ad8 == "outside") {
        var_b6d5157fd8707722 = [];
        var_6f3d9ec6437c14f2 = bot_get_nodes_in_cone(0, 750, 0.6, 1);
        foreach (node in var_6f3d9ec6437c14f2) {
            if (nodeexposedtosky(node)) {
                var_b6d5157fd8707722 = array_add(var_b6d5157fd8707722, node);
            }
        }
        if (var_6f3d9ec6437c14f2.size > 5 && var_b6d5157fd8707722.size > var_6f3d9ec6437c14f2.size * 0.6) {
            var_3465221989e8dfce = get_array_of_closest(self.origin, var_b6d5157fd8707722, undefined, undefined, undefined, 150);
            if (var_3465221989e8dfce.size > 0) {
                var_a10b280fbad02413 = random(var_3465221989e8dfce);
            } else {
                var_a10b280fbad02413 = random(var_b6d5157fd8707722);
            }
        }
    } else if (var_f9ca2fddc6a91ad8 == "hidden") {
        var_3778710dc16cfeeb = getnodesinradius(self.origin, 256, 0, 40);
        var_170e87a3a1e8af42 = self getnearestnode();
        if (isdefined(var_170e87a3a1e8af42)) {
            var_dff426cfcddb03b2 = [];
            foreach (node in var_3778710dc16cfeeb) {
                if (nodesvisible(var_170e87a3a1e8af42, node, 1)) {
                    var_dff426cfcddb03b2 = array_add(var_dff426cfcddb03b2, node);
                }
            }
            var_a10b280fbad02413 = self botnodepick(var_dff426cfcddb03b2, 1, "node_hide");
        }
    }
    if (isdefined(var_a10b280fbad02413) || var_f9ca2fddc6a91ad8 == "anywhere") {
        self botsetflag("disable_movement", 1);
        if (isdefined(var_a10b280fbad02413)) {
            self botlookatpoint(var_a10b280fbad02413.origin, 2.45, "script_forced");
        }
        bot_switch_to_killstreak_weapon(killstreak_info, killstreaks_array, killstreak_info.weapon);
        wait(2);
        self botpressbutton("attack");
        wait(1.5);
        _switchtoweapon("none");
        self botsetflag("disable_movement", 0);
    }
    return 1;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2a
// Size: 0x25
function bot_switch_to_killstreak_weapon(killstreak_info, killstreaks_array, weapon_name) {
    bot_notify_streak_used(killstreak_info, killstreaks_array);
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe56
// Size: 0xa3
function bot_notify_streak_used(killstreak_info, killstreaks_array) {
    if (isdefined(killstreak_info.isgimme) && killstreak_info.isgimme) {
        self notify("ks_action_6");
        return;
    }
    for (index = 1; index < 4; index++) {
        if (isdefined(killstreaks_array[index])) {
            if (isdefined(killstreaks_array[index].streakname)) {
                if (killstreaks_array[index].streakname == killstreak_info.streakname) {
                    var_7cdaad0ccdb62848 = index + 2;
                    self notify("ks_action_" + var_7cdaad0ccdb62848);
                    return;
                }
            }
        }
    }
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf00
// Size: 0x1e5
function bot_killstreak_choose_loc_enemies(killstreak_info, killstreaks_array, var_86af96fe008c96ee, var_1ef9e61d95cbf8f7) {
    wait(randomintrange(3, 5));
    if (!bot_allowed_to_use_killstreaks()) {
        return;
    }
    var_cf12256f80ff2408 = getzonenearest(self.origin);
    if (!isdefined(var_cf12256f80ff2408)) {
        return;
    }
    self botsetflag("disable_movement", 1);
    bot_switch_to_killstreak_weapon(killstreak_info, killstreaks_array, killstreak_info.weapon);
    wait(2);
    zone_count = level.zonecount;
    var_2099fadbff6f1e22 = -1;
    var_406b87b58c6d47fe = 0;
    var_402c0a04744b46ad = [];
    var_a04286db27fdd0d4 = randomfloat(100) > 50;
    for (z = 0; z < zone_count; z++) {
        if (var_a04286db27fdd0d4) {
            zone = zone_count - 1 - z;
        } else {
            zone = z;
        }
        if (zone != var_cf12256f80ff2408 && botzonegetindoorpercent(zone) < 0.25) {
            var_58eea57628b0811e = botzonegetcount(zone, self.team, "enemy_predict");
            if (var_58eea57628b0811e > var_406b87b58c6d47fe) {
                var_2099fadbff6f1e22 = zone;
                var_406b87b58c6d47fe = var_58eea57628b0811e;
            }
            var_402c0a04744b46ad = array_add(var_402c0a04744b46ad, zone);
        }
    }
    if (var_2099fadbff6f1e22 >= 0) {
        var_891c8352f22d5dae = getzoneorigin(var_2099fadbff6f1e22);
    } else if (var_402c0a04744b46ad.size > 0) {
        var_891c8352f22d5dae = getzoneorigin(random(var_402c0a04744b46ad));
    } else {
        var_891c8352f22d5dae = getzoneorigin(randomint(level.zonecount));
    }
    var_f7b5065a48a75b79 = (randomfloatrange(-500, 500), randomfloatrange(-500, 500), 0);
    self notify("confirm_location", var_891c8352f22d5dae + var_f7b5065a48a75b79);
    wait(1);
    self botsetflag("disable_movement", 0);
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x2db
function bot_think_watch_aerial_killstreak() {
    self notify("bot_think_watch_aerial_killstreak");
    self endon("bot_think_watch_aerial_killstreak");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!isdefined(level.last_global_badplace_time)) {
        level.last_global_badplace_time = -10000;
    }
    level.killstreak_global_bp_exists_for["allies"] = [];
    level.killstreak_global_bp_exists_for["axis"] = [];
    var_d68763b6dc30a681 = 0;
    var_6de804c7fc796da8 = randomfloatrange(0.05, 4);
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait(var_6de804c7fc796da8);
        var_6de804c7fc796da8 = randomfloatrange(0.05, 4);
        /#
            assert(!isdefined(level.remote_mortar));
        #/
        if (bot_is_remote_or_linked()) {
            continue;
        }
        if (self botgetdifficultysetting("strategyLevel") == 0) {
            continue;
        }
        var_fe0228cd32ee3063 = 0;
        if (isdefined(level.chopper) && level.chopper.team != self.team) {
            var_fe0228cd32ee3063 = 1;
        }
        if (isdefined(level.lbsniper) && level.lbsniper.team != self.team) {
            var_fe0228cd32ee3063 = 1;
        }
        if (!namespace_36f464722d326bbe::function_ba5574c7f287c587() || level.mapname != "mp_don3_mobile") {
            if (enemy_mortar_strike_exists(self.team)) {
                var_fe0228cd32ee3063 = 1;
                try_place_global_badplace("mortar_strike", &enemy_mortar_strike_exists);
            }
            if (enemy_switchblade_exists(self.team)) {
                var_fe0228cd32ee3063 = 1;
                try_place_global_badplace("switchblade", &enemy_switchblade_exists);
            }
            if (enemy_odin_assault_exists(self.team)) {
                var_fe0228cd32ee3063 = 1;
                try_place_global_badplace("odin_assault", &enemy_odin_assault_exists);
            }
        }
        var_db7e44b4f0554fee = get_enemy_vanguard();
        if (isdefined(var_db7e44b4f0554fee)) {
            var_81fe00336fdc7313 = self geteye();
            if (within_fov(var_81fe00336fdc7313, self getplayerangles(), var_db7e44b4f0554fee.attackarrow.origin, self botgetfovdot())) {
                if (sighttracepassed(var_81fe00336fdc7313, var_db7e44b4f0554fee.attackarrow.origin, 0, self, var_db7e44b4f0554fee.attackarrow)) {
                    badplace_cylinder("vanguard_" + var_db7e44b4f0554fee getentitynumber(), var_6de804c7fc796da8 + 0.5, var_db7e44b4f0554fee.attackarrow.origin, 200, 100, self.team);
                }
            }
        }
        if (!var_d68763b6dc30a681 && var_fe0228cd32ee3063) {
            var_d68763b6dc30a681 = 1;
            self botsetflag("hide_indoors", 1);
        }
        if (var_d68763b6dc30a681 && !var_fe0228cd32ee3063) {
            var_d68763b6dc30a681 = 0;
            self botsetflag("hide_indoors", 0);
        }
    }
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ce
// Size: 0x88
function try_place_global_badplace(var_205d69eb70594bb7, var_c5a29305adbe9b8b) {
    if (!isdefined(level.killstreak_global_bp_exists_for[self.team][var_205d69eb70594bb7])) {
        level.killstreak_global_bp_exists_for[self.team][var_205d69eb70594bb7] = 0;
    }
    if (!level.killstreak_global_bp_exists_for[self.team][var_205d69eb70594bb7]) {
        level.killstreak_global_bp_exists_for[self.team][var_205d69eb70594bb7] = 1;
        level thread monitor_enemy_dangerous_killstreak(self.team, var_205d69eb70594bb7, var_c5a29305adbe9b8b);
    }
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145d
// Size: 0x8b
function monitor_enemy_dangerous_killstreak(var_2b4384d19a199121, var_205d69eb70594bb7, var_c5a29305adbe9b8b) {
    /#
        assert(5 > 4);
    #/
    wait_time = (5 - 4) * 0.5;
    while ([[ var_c5a29305adbe9b8b ]](var_2b4384d19a199121)) {
        if (gettime() > level.last_global_badplace_time + 4000) {
            level.last_global_badplace_time = gettime();
        }
        wait(wait_time);
    }
    level.killstreak_global_bp_exists_for[var_2b4384d19a199121][var_205d69eb70594bb7] = 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ef
// Size: 0x38
function enemy_mortar_strike_exists(var_2b4384d19a199121) {
    if (isdefined(level.air_raid_active) && level.air_raid_active) {
        if (var_2b4384d19a199121 != level.air_raid_team_called) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152f
// Size: 0x9f
function enemy_switchblade_exists(var_2b4384d19a199121) {
    if (isdefined(level.remotemissileinprogress)) {
        foreach (rocket in level.rockets) {
            if (isdefined(rocket.type) && rocket.type == "remote" && rocket.team != var_2b4384d19a199121) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d6
// Size: 0xdc
function enemy_odin_assault_exists(var_2b4384d19a199121) {
    foreach (player in level.players) {
        if (!level.teambased || isdefined(player.team) && var_2b4384d19a199121 != player.team) {
            if (isdefined(player.odin) && player.odin.odintype == "odin_assault" && gettime() - player.odin.birthtime > 3000) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_c46d1fa142cf800f/namespace_9c72a76de8d73837
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ba
// Size: 0xc1
function get_enemy_vanguard() {
    foreach (player in level.players) {
        if (!level.teambased || isdefined(player.team) && self.team != player.team) {
            if (isdefined(player.remoteuav) && player.remoteuav.helitype == "remote_uav") {
                return player.remoteuav;
            }
        }
    }
    return undefined;
}

