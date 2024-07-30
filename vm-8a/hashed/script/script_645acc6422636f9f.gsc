#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_41387eecc35b88bf;
#using script_2707474774db34b;
#using script_7b2517368c79e5bc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\poi.gsc;
#using script_482376d10f69832c;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using script_57d3850a12cf1d8f;
#using script_1174abedbefe9ada;
#using script_4948cdf739393d2d;
#using script_54f6d121e91434f8;
#using script_7e4d332e911e1b90;
#using script_6c4e8cea70bf4b6d;

#namespace namespace_848c7a35c6f1e038;

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24f
// Size: 0xa6
function function_4c10c992dc615a41() {
    function_900f562c61c6a5d6("activitystarter", &function_de0335fbc04f4627, &function_ace26cc769bb2893, &function_2ecbced517e86330, &function_6297546c34dcb084, &function_f8d26b52b2f1c4e);
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("nexus_activity_joiner_phone", &function_1936902486bfb1a1);
    if (isdefined(level.var_5b7c4eafd38d35c) && !isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
        level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38 = [];
        level.var_5b7c4eafd38d35c.var_d6d000f64c923fd6 = 1;
        level thread function_c2bc2321e8cb9c49();
        /#
            level thread function_5123ce2f281ba0da();
            level thread function_3e3b22a6655663b2();
        #/
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd
// Size: 0x92
function function_47e23924dd56365(relevant_parameters) {
    activity_instance = relevant_parameters[0];
    var_860c4b444bc9f11d = relevant_parameters[1];
    foreach (activity_starter in var_860c4b444bc9f11d) {
        if (istrue(activity_instance.var_e726c726c6fb7dec)) {
            thread function_5f8609748985f5b0(activity_instance, activity_starter);
            continue;
        }
        activate_activity_starter(activity_instance, activity_starter);
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397
// Size: 0x24
function function_5f8609748985f5b0(activity_instance, var_b189a678c1c3489a) {
    activity_instance waittill("activate_activity_starter");
    activate_activity_starter(activity_instance, var_b189a678c1c3489a);
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3
// Size: 0x13b
function activate_activity_starter(activity_instance, var_b189a678c1c3489a) {
    if (isdefined(var_b189a678c1c3489a)) {
        activity_origin = var_b189a678c1c3489a.origin;
        var_b189a678c1c3489a.activity_origin = activity_origin;
        var_b189a678c1c3489a.activity_instance = activity_instance;
        activity_instance.var_b189a678c1c3489a = var_b189a678c1c3489a;
        var_b189a678c1c3489a function_80cb315b3807f968();
        activitytype = function_de53ed8e35d0ed7a(activity_instance);
        var_b189a678c1c3489a.poiindex = scripts\mp\poi::function_80cdaea4bd3ecf70(scripts\mp\poi::function_55cf921efa4cbd09(activity_origin, 0, 0));
        var_84fe3185d80d053b = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(activity_instance));
        scoreevent = namespace_e8853d3344e33cf6::function_9d71b982e1eb2f81(var_84fe3185d80d053b);
        var_b189a678c1c3489a.currencyreward = scripts\mp\rank::getscoreinfovalue(scoreevent);
        if (!isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
            level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38 = [var_b189a678c1c3489a];
        } else {
            level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38[level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38.size] = var_b189a678c1c3489a;
        }
        function_8b5b2a3392fc7e2a("InstanceEnd", &function_6a5979dbe84a584a);
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x506
// Size: 0x2ca
function function_b4c8d27633108d43(suffix, activity_origin, var_8310af2bd45efa3, var_d068613f5e3cc8a8) {
    assert(isdefined(suffix) && isdefined(activity_origin));
    activity_instance = self;
    var_509e1fb858cfabbc = ter_op(isdefined(var_8310af2bd45efa3), squared(var_8310af2bd45efa3), 0);
    var_8951bcb97ca82a19 = ter_op(isdefined(var_d068613f5e3cc8a8), squared(var_d068613f5e3cc8a8), 0);
    var_1b395a12bbf3f5ec = [];
    var_9c21b36afb275651 = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "nexus_activity_joiner_phone");
    var_9c21b36afb275651 = function_f1df6aa7601a5411(var_9c21b36afb275651);
    foreach (starter in var_9c21b36afb275651) {
        if (suffix == getsubstr(starter.type, 24)) {
            var_1b395a12bbf3f5ec[var_1b395a12bbf3f5ec.size] = starter;
        }
    }
    activity_starter = undefined;
    best_difference = 999999999;
    foreach (starter in var_1b395a12bbf3f5ec) {
        dist = distancesquared(starter.origin, activity_origin);
        diff = abs(dist - var_8951bcb97ca82a19);
        if (diff < best_difference && dist >= var_509e1fb858cfabbc) {
            if (diff < 150) {
                activity_starter = starter;
                break;
            }
            activity_starter = starter;
            best_difference = diff;
        }
    }
    if (isdefined(activity_starter)) {
        activity_starter.activity_origin = activity_origin;
        activity_starter.activity_instance = activity_instance;
        activity_instance.activity_starter = activity_starter;
        activity_starter function_80cb315b3807f968();
        activitytype = function_de53ed8e35d0ed7a(activity_instance);
        var_84fe3185d80d053b = [[ level.var_fac39a693f085779 ]](namespace_68dc261109a9503f::function_8988a4c89289d7f4(activity_instance));
        scoreevent = namespace_e8853d3344e33cf6::function_9d71b982e1eb2f81(var_84fe3185d80d053b);
        activity_starter.currencyreward = scripts\mp\rank::getscoreinfovalue(scoreevent);
        activity_starter.poiindex = scripts\mp\poi::function_80cdaea4bd3ecf70(scripts\mp\poi::function_55cf921efa4cbd09(activity_origin, 0, 0));
        if (!isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
            level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38 = [activity_starter];
        } else {
            level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38[level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38.size] = activity_starter;
        }
    }
    return activity_starter;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d9
// Size: 0x49
function function_80cb315b3807f968() {
    if (istrue(level.var_5b7c4eafd38d35c.var_d6d000f64c923fd6)) {
        self setscriptablepartstate("nexus_activity_joiner_phone", "visible");
    } else {
        self setscriptablepartstate("nexus_activity_joiner_phone", "visible_no_icon");
    }
    self.visible = 1;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82a
// Size: 0x2f
function function_9c2b62cf9d5bcdeb() {
    level notify("tablethide_kill_callout_" + self.origin);
    self setscriptablepartstate("nexus_activity_joiner_phone", "hidden");
    self.visible = 0;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x861
// Size: 0x6c
function function_445346f57d5ef3ac(team, enabled) {
    foreach (player in getteamdata(team, "players")) {
        function_a410e3348511f9c0(player, enabled);
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d5
// Size: 0xad
function function_a410e3348511f9c0(player, enabled) {
    if (isdefined(player) && isdefined(level.var_5b7c4eafd38d35c) && isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
        foreach (starter in level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38) {
            if (istrue(enabled)) {
                starter enablescriptableplayeruse(player);
                continue;
            }
            starter disablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98a
// Size: 0x1c
function function_de0335fbc04f4627(item_bundle, item, auto_use) {
    return false;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9af
// Size: 0x24
function function_ace26cc769bb2893(item_bundle, item, auto_use, allow_swap) {
    return false;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dc
// Size: 0x24
function function_2ecbced517e86330(tem_bundle, item, auto_use, allow_swap) {
    return false;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa09
// Size: 0xd
function function_6297546c34dcb084() {
    return [undefined, 0];
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1f
// Size: 0xc
function function_f8d26b52b2f1c4e(quantity) {
    return false;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa34
// Size: 0x139
function function_c2bc2321e8cb9c49() {
    level endon("game_ended");
    while (true) {
        wait 1;
        if (level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38.size == 0) {
            continue;
        }
        foreach (player in level.players) {
            var_3900d8bea91376b4 = function_5cc2fd3d10cbab56(player);
            if (isdefined(player) && isdefined(player.origin) && isdefined(player.team) && isalive(player) && function_6152021549f1836b(player) && !isdefined(var_3900d8bea91376b4.var_6346961d07f668fe)) {
                closest = sortbydistance(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38, player.origin)[0];
                player scripts\cp_mp\utility\omnvar_utility::setcachedclientomnvar("ui_ob_activity_starter_currency_rewards", closest.currencyreward);
                player scripts\cp_mp\utility\omnvar_utility::setcachedclientomnvar("ui_dmz_activity_starter_poi_name", closest.poiindex);
            }
        }
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb75
// Size: 0x18a
function function_f1df6aa7601a5411(locations) {
    namespace_58dcf42cf567f34f::function_1a037d5cd64dc892();
    validlocations = [];
    var_229dd59111a2fa54 = getdvarint(@"hash_b54c660e3e9515b2", 1000);
    var_aa5a3885f8d284dc = var_229dd59111a2fa54 * var_229dd59111a2fa54;
    foreach (location in locations) {
        if (!isdefined(location.visible) && !namespace_7789f919216d38a2::function_cdcab1374db7f007(location.origin) && (!isdefined(level.poi_names) || scripts\mp\poi::function_9c93e67f90980177(location.origin)) && (!isdefined(level.uniquedoors) || level.uniquedoors.size == 0 || distance(sortbydistance(level.uniquedoors, location.origin)[0].origin, location.origin) > 350) && (validlocations.size == 0 || distancesquared(sortbydistance(validlocations, location.origin)[0].origin, location.origin) > var_aa5a3885f8d284dc) && !namespace_9823ee6035594d67::function_f0201365c368cf88(location.origin)) {
            validlocations[validlocations.size] = location;
        }
    }
    return validlocations;
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd08
// Size: 0x3e
function function_1936902486bfb1a1(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread function_32b0fe545794719a(instance, player);
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4e
// Size: 0xb4
function function_32b0fe545794719a(instance, player) {
    activity_instance = instance.activity_instance;
    var_81fccd8b5f2b5309 = function_e931f3b80616c348(activity_instance);
    var_392b5fcd722198dd = namespace_8d0d5743d0799922::function_93587d5ba6247f36(var_81fccd8b5f2b5309, player);
    if (!var_392b5fcd722198dd) {
        return;
    }
    function_4e7f17d64122dd46(instance);
    player playlocalsound("mp_dmz_phone_pickup");
    player notify("ob_activity_starter_used", activity_instance);
    if (getdvarint(@"hash_7661484c77058395", 0)) {
        player namespace_f87a4b6569ce73b2::function_b5216a6d7bd17210("jup_ges_mrpeeks_pickup", 1);
    } else {
        player namespace_f2c68794a1018c9d::function_9be29ad72a155ee1();
    }
    function_bbdcd857d0c2a65e(instance.activity_instance, player, "PlayerJoinedInteract");
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x38
function private function_6a5979dbe84a584a(var_6f8af5eb76deac21) {
    activity_instance = self;
    if (isdefined(activity_instance.var_b189a678c1c3489a)) {
        function_4e7f17d64122dd46(activity_instance.var_b189a678c1c3489a);
    }
}

// Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4a
// Size: 0x64
function private function_4e7f17d64122dd46(activity_starter) {
    if (isdefined(activity_starter) && !istrue(activity_starter.var_4740350ce557fc99)) {
        level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38 = array_remove(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38, activity_starter);
        activity_starter function_9c2b62cf9d5bcdeb();
        activity_starter.var_4740350ce557fc99 = 1;
    }
}

/#

    // Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xeb6
    // Size: 0x4b
    function private function_5123ce2f281ba0da() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_df648211d66cd3dd("<dev string:x41>", "<dev string:x4b>");
        function_df648211d66cd3dd("<dev string:x6d>", "<dev string:x7e>");
        function_df648211d66cd3dd("<dev string:xa7>", "<dev string:xbb>");
        function_fe953f000498048f();
    }

    // Namespace namespace_848c7a35c6f1e038 / namespace_f0d9097b252e530b
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xf09
    // Size: 0x25c
    function private function_3e3b22a6655663b2() {
        timer = 0;
        var_fd5a08e385a75f6c = 360;
        while (true) {
            if (getdvarint(@"hash_d0316f72a21f836e", 0) && timer == 0) {
                foreach (starter in level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38) {
                    print3d(starter.origin + (0, 0, 300), "<dev string:xe7>" + function_de53ed8e35d0ed7a(starter.activity_instance) + "<dev string:xee>" + function_a4748b32a824c79c(starter.activity_instance) + "<dev string:xf9>" + function_f0f498aed6f8fa5d(starter.activity_instance), (1, 1, 1), 1, 2, var_fd5a08e385a75f6c, 1);
                    line(starter.origin, starter.activity_origin, (0, 0, 1), 1, 0, var_fd5a08e385a75f6c);
                    line(starter.origin, starter.origin + (0, 0, 3000), (1, 0, 1), 1, 0, var_fd5a08e385a75f6c);
                }
            }
            if (getdvarint(@"hash_7ab902fb378bcf96", 0)) {
                setdvar(@"hash_7ab902fb378bcf96", 0);
                level.players[0] namespace_f2c68794a1018c9d::function_9be29ad72a155ee1();
            }
            if (getdvarint(@"hash_a1e9c5a43f9fc548", 0)) {
                setdvar(@"hash_a1e9c5a43f9fc548", 0);
                if (isdefined(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38)) {
                    closest = sortbydistance(level.var_5b7c4eafd38d35c.var_915f0d3c3a61e38, level.players[0].origin);
                    if (isdefined(closest)) {
                        level.players[0] setorigin(closest[0].origin + (64, 64, 64));
                    }
                }
            }
            waitframe();
            timer++;
            if (timer >= var_fd5a08e385a75f6c) {
                timer = 0;
            }
        }
    }

#/
