// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_4c770a9a4ad7659c;
#using script_3ff084f114b7f6c9;
#using script_2d9d24f7c63ac143;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\game.gsc;
#using script_b7a9ce0a2282b79;

#namespace namespace_b5b2cbfd27ff2a4e;

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c
// Size: 0x171
function function_d22b3026c3183ead() {
    level.var_ec3a072500042491 = [0:13448, 1:13445, 2:13447, 3:13446];
    level.var_a98214b4bdc952cd = [0:"brloot_dogtag_bronze", 1:"brloot_dogtag_silver", 2:"brloot_dogtag_gold", 3:"brloot_dogtag_damascus"];
    if (!isdefined(level.br_pickups)) {
        level waittill("br_pickups_init");
    }
    if (!getdvarint(@"hash_ec32cd72ead6b977", 1)) {
        return;
    }
    level.var_a3e1b091f11cd827 = spawnstruct();
    level.var_a3e1b091f11cd827.objectives = [];
    level.var_a3e1b091f11cd827.var_e8d3998184471eb4 = [];
    level.var_87b2a0265ac86fe0 = getdvarfloat(@"hash_5a1b0676e3c6c467", 10);
    level.var_37a9b5bbce714339 = getdvarint(@"hash_2f56d4a76dc729e4", 2000);
    namespace_cb965d2f71fefddc::registerpickupcreatedcallback("brloot_dogtag_bronze", &function_ab266ca8693e5618);
    namespace_cb965d2f71fefddc::registerpickupcreatedcallback("brloot_dogtag_silver", &function_ab266ca8693e5618);
    namespace_cb965d2f71fefddc::registerpickupcreatedcallback("brloot_dogtag_gold", &function_ab266ca8693e5618);
    namespace_cb965d2f71fefddc::registerpickupcreatedcallback("brloot_dogtag_damascus", &function_ab266ca8693e5618);
    namespace_7f0bcee5d45a1dea::add("player_connect", &onplayerconnect);
    namespace_3c37cb17ade254d::registersharedfunc("dogtag", "getDogTagVictimAndKiller", &getdogtagvictimandkiller);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&onteamchange);
    /#
        level thread function_28199382c2662c3f();
    #/
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x1f
function private onplayerconnect(params) {
    self setclientomnvar("ui_dmz_dog_tag", function_de2c669caf6fb1d(self));
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ca
// Size: 0x194
function private onteamchange(player, oldteam, newteam) {
    var_ad63323b4b7fde00 = function_55b287be60b2ae11(player);
    if (!isdefined(var_ad63323b4b7fde00)) {
        return;
    }
    var_ad63323b4b7fde00.team = newteam;
    foreach (teammember in getteamdata(newteam, "players")) {
        for (i = 0; i < namespace_aead94004cf4c147::function_b13e35608b336d65(teammember); i++) {
            if (!function_3c17a26ce6a4668(teammember namespace_aead94004cf4c147::function_6196d9ea9a30e609(i))) {
                continue;
            }
            quantity = teammember namespace_aead94004cf4c147::function_897b29adb37f06a7(i);
            if (!namespace_85cd45b4fe0d86fb::function_d9f5c5090de1241b(teammember, quantity)) {
                continue;
            }
            teammember namespace_aead94004cf4c147::function_db1dd76061352e5b(i, quantity);
            var_57acadc40b2f0a8 = getdogtagvictimandkiller(quantity);
            _ = var_57acadc40b2f0a8[1];
            victimindex = var_57acadc40b2f0a8[0];
            var_2ef0b79fd47052f1 = level.dogtaginfo[victimindex];
            if (isdefined(var_2ef0b79fd47052f1.player)) {
                function_8e643d6706defeea(var_2ef0b79fd47052f1.player, quantity);
            }
            if (!isdefined(var_2ef0b79fd47052f1.player) || var_2ef0b79fd47052f1.player != teammember) {
                namespace_d696adde758cbe79::showdmzsplash("dmz_recover_dog_tag", [0:teammember]);
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x665
// Size: 0xd
function function_2f6772930123576c() {
    return isdefined(level.var_a3e1b091f11cd827);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x7a
function function_8e643d6706defeea(player, var_123d6d777458b852) {
    function_bc03aa369196f2bf(player, 1);
    if (!istrue(level.var_2d15c14a954ff12f)) {
        namespace_d696adde758cbe79::showdmzsplash("dmz_recover_dog_tag", [0:player], undefined);
    }
    if (function_2f6772930123576c() && function_6cd8c4885cb6775c(var_123d6d777458b852)) {
        objstruct = level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852];
        function_e98b03b1ec8385fe(objstruct);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fb
// Size: 0x164
function function_b5fbe3cb4ed955f4(enemy, var_123d6d777458b852) {
    if (function_2f6772930123576c()) {
        if (function_6cd8c4885cb6775c(var_123d6d777458b852)) {
            objstruct = level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852];
            function_e98b03b1ec8385fe(objstruct);
        }
        if (function_1a21a83169ad19f9(enemy)) {
            function_8945131b7b8a89c8(enemy, var_123d6d777458b852);
        } else {
            function_433d4c5bc4da9ead(enemy, var_123d6d777458b852);
        }
        var_57acbdc40b2f2db = getdogtagvictimandkiller(var_123d6d777458b852);
        _ = var_57acbdc40b2f2db[1];
        victimindex = var_57acbdc40b2f2db[0];
        info = level.dogtaginfo[victimindex];
        if (isdefined(info) && isdefined(info.team)) {
            teammembers = getteamdata(info.team, "players");
            if (isdefined(info.player)) {
                teammembers = array_remove(teammembers, info.player);
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("dogtag_stolen_from_you", [0:info.player]);
            }
            namespace_446fc987a980892f::function_d87d5deb069bf8e5("dogtag_stolen_from_teammate", teammembers);
        }
        if (isdefined(enemy.team)) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("dogtag_stolen_from_enemy", enemy.team);
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x866
// Size: 0x9f
function function_ab266ca8693e5618() {
    if (function_2f6772930123576c()) {
        count = namespace_cb965d2f71fefddc::loot_getitemcount(self);
        countlefthand = namespace_cb965d2f71fefddc::loot_getitemcountlefthand(self);
        var_e97d731bedd44c63 = namespace_cb965d2f71fefddc::function_3a5f7703319142dd(self);
        var_123d6d777458b852 = function_b5d4fcc3fab92696(self);
        if (function_6cd8c4885cb6775c(var_123d6d777458b852)) {
            objstruct = level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852];
            if (isdefined(objstruct.carryingplayer)) {
                function_a9e95e007eb70709(objstruct, var_123d6d777458b852);
                function_42426b559596ae56(self, var_123d6d777458b852);
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0xab
function function_ea29bccf97cb1b9a(killer, var_123d6d777458b852) {
    var_57ad0dc40b2fdda = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_57ad0dc40b2fdda[1];
    victimindex = var_57ad0dc40b2fdda[0];
    if (isdefined(victimindex) && isdefined(level.dogtaginfo) && isdefined(level.dogtaginfo[victimindex]) && !istrue(level.dogtaginfo[victimindex].var_c9efb56fdfb33e52)) {
        level.dogtaginfo[victimindex].var_c9efb56fdfb33e52 = 1;
        namespace_d696adde758cbe79::showdmzsplash("dmz_kill_confirm_dog_tag", [0:killer]);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9be
// Size: 0x3f
function function_1a21a83169ad19f9(player) {
    if (isdefined(level.var_a3e1b091f11cd827)) {
        return isdefined(level.var_a3e1b091f11cd827.var_e8d3998184471eb4[player.guid]);
    } else {
        return 0;
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x35
function function_6cd8c4885cb6775c(var_123d6d777458b852) {
    if (isdefined(level.var_a3e1b091f11cd827)) {
        return isdefined(level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852]);
    } else {
        return 0;
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40
// Size: 0x99
function function_3bfe56fc3c2bb91e(origin, var_cfcffc70799935ee) {
    objstruct = spawnstruct();
    objstruct.curorigin = origin;
    objstruct.offset3d = (0, 0, 100);
    objstruct namespace_19b4203b51d56488::requestid(1, var_cfcffc70799935ee, undefined, 1, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(objstruct.objidnum, "hud_icon_objective_dog_tag");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objstruct.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objstruct.objidnum, 100);
    return objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0xf4
function function_42426b559596ae56(scriptable, var_123d6d777458b852) {
    var_57ad1dc40b3000d = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_57ad1dc40b3000d[1];
    victimindex = var_57ad1dc40b3000d[0];
    objstruct = function_3bfe56fc3c2bb91e(scriptable.origin, 1);
    objstruct.scriptable = scriptable;
    namespace_5a22b6f3a56f7e9b::update_objective_position(objstruct.objidnum, objstruct.scriptable.origin + (0, 0, 50));
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objstruct.objidnum, level.dogtaginfo[victimindex].team);
    objstruct.dogtags = [0:var_123d6d777458b852];
    level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852] = objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc
// Size: 0x71
function function_62b5f185de3ab25d(array, objstruct) {
    newarray = [];
    foreach (var_123d6d777458b852, obj in array) {
        if (obj != objstruct) {
            newarray[var_123d6d777458b852] = obj;
        }
    }
    return newarray;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc55
// Size: 0xdd
function function_e98b03b1ec8385fe(objstruct) {
    objstruct notify("stop_tracking");
    objstruct namespace_19b4203b51d56488::releaseid();
    objstruct namespace_36f464722d326bbe::function_af5604ce591768e1();
    foreach (obj in level.var_a3e1b091f11cd827.objectives) {
        if (obj == objstruct) {
        }
    }
    level.var_a3e1b091f11cd827.objectives = function_62b5f185de3ab25d(level.var_a3e1b091f11cd827.objectives, objstruct);
    level.var_a3e1b091f11cd827.var_e8d3998184471eb4 = function_62b5f185de3ab25d(level.var_a3e1b091f11cd827.var_e8d3998184471eb4, objstruct);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0x3f
function function_77060da87f0214f7(origin) {
    point = function_d553466cf817a4da();
    point = (point[0] * level.var_37a9b5bbce714339, point[1] * level.var_37a9b5bbce714339, 0);
    return point + origin;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd80
// Size: 0x65
function function_3de97c52c88c8a20(objstruct, player) {
    origin = function_77060da87f0214f7(player.origin);
    origin = origin + (0, 0, player.origin[2] + 750);
    namespace_5a22b6f3a56f7e9b::update_objective_position(objstruct.objidnum, origin);
    objstruct namespace_36f464722d326bbe::function_6e148c8da2e4db13(origin);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdec
// Size: 0x1c1
function function_433d4c5bc4da9ead(player, var_123d6d777458b852) {
    var_57ac4dc40b2e376 = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_57ac4dc40b2e376[1];
    victimindex = var_57ac4dc40b2e376[0];
    if (!isdefined(victimindex) || !isdefined(level.dogtaginfo[victimindex])) {
        return;
    }
    team = level.dogtaginfo[victimindex].team;
    objstruct = function_3bfe56fc3c2bb91e(player.origin, 0);
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objstruct.objidnum, team);
    objstruct.carryingplayer = player;
    objstruct.dogtags = [0:var_123d6d777458b852];
    objstruct namespace_36f464722d326bbe::function_6b6b6273f8180522("DogTagObj_Dmz", function_77060da87f0214f7(objstruct.carryingplayer.origin), level.var_37a9b5bbce714339);
    objstruct namespace_36f464722d326bbe::function_4eaf685bc40a3b9();
    teammates = getteamdata(team, "players");
    foreach (teammate in teammates) {
        objstruct namespace_36f464722d326bbe::function_cfd53c8f6878014f(teammate);
    }
    objstruct notify("stop_tracking");
    thread function_8a3a6225b2e11801(objstruct);
    thread function_dfe0992113030bd0(objstruct);
    level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852] = objstruct;
    level.var_a3e1b091f11cd827.var_e8d3998184471eb4[player.guid] = objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb4
// Size: 0x158
function function_8945131b7b8a89c8(player, var_123d6d777458b852) {
    var_c00a2b6249962b50 = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_c00a2b6249962b50[1];
    victimindex = var_c00a2b6249962b50[0];
    if (!isdefined(victimindex) || !isdefined(level.dogtaginfo[victimindex])) {
        return;
    }
    team = level.dogtaginfo[victimindex].team;
    objstruct = level.var_a3e1b091f11cd827.var_e8d3998184471eb4[player.guid];
    objstruct.dogtags = array_add(objstruct.dogtags, var_123d6d777458b852);
    level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852] = objstruct;
    teammates = getteamdata(team, "players");
    foreach (teammate in teammates) {
        objstruct namespace_36f464722d326bbe::function_cfd53c8f6878014f(teammate);
    }
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(objstruct.objidnum, team);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1113
// Size: 0x149
function function_a9e95e007eb70709(objstruct, var_123d6d777458b852) {
    var_c00a30624996364f = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_c00a30624996364f[1];
    victimindex = var_c00a30624996364f[0];
    if (!isdefined(victimindex) || !isdefined(level.dogtaginfo[victimindex])) {
        return;
    }
    team = level.dogtaginfo[victimindex].team;
    level.var_a3e1b091f11cd827.objectives[var_123d6d777458b852] = undefined;
    objstruct.dogtags = array_remove(objstruct.dogtags, var_123d6d777458b852);
    if (!function_2e13cc7d90ee5683(objstruct.carryingplayer, team)) {
        teammates = getteamdata(team, "players");
        foreach (teammate in teammates) {
            objstruct namespace_36f464722d326bbe::function_d7d113d56ef0ef5b(teammate);
        }
    }
    if (objstruct.dogtags.size == 0) {
        function_e98b03b1ec8385fe(objstruct);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263
// Size: 0xcf
function function_8a3a6225b2e11801(objstruct) {
    objstruct endon("stop_tracking");
    objstruct.carryingplayer endon("death_or_disconnect");
    objstruct.carryingplayer endon("enter_live_ragdoll");
    level endon("game_ended");
    while (1) {
        quantity = lootid = itemindex = itemtype = objstruct.carryingplayer waittill("item_added_to_cache");
        if (isdefined(objstruct) && isdefined(objstruct.carryingplayer) && isdefined(lootid) && isdefined(quantity) && isdefined(level.var_ec3a072500042491) && array_contains(level.var_ec3a072500042491, lootid)) {
            thread function_a9e95e007eb70709(objstruct, quantity);
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1339
// Size: 0x8a
function function_dfe0992113030bd0(objstruct) {
    objstruct endon("stop_tracking");
    objstruct.carryingplayer endon("death_or_disconnect");
    objstruct.carryingplayer endon("enter_live_ragdoll");
    level endon("game_ended");
    while (1) {
        if (isdefined(objstruct.carryingplayer) && isdefined(objstruct.carryingplayer.origin)) {
            function_3de97c52c88c8a20(objstruct, objstruct.carryingplayer);
        }
        wait(level.var_87b2a0265ac86fe0);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ca
// Size: 0x125
function function_2e13cc7d90ee5683(player, team) {
    if (isdefined(level.var_a3e1b091f11cd827) && function_1a21a83169ad19f9(player)) {
        objstruct = level.var_a3e1b091f11cd827.var_e8d3998184471eb4[player.guid];
        foreach (var_123d6d777458b852 in objstruct.dogtags) {
            var_c00a336249963ce8 = getdogtagvictimandkiller(var_123d6d777458b852);
            _ = var_c00a336249963ce8[1];
            victimindex = var_c00a336249963ce8[0];
            if (isdefined(victimindex) && isdefined(level.dogtaginfo[victimindex]) && isdefined(level.dogtaginfo[victimindex].team) && level.dogtaginfo[victimindex].team == team) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0x80
function function_c07675f2ce32fcb5(player) {
    if (!namespace_aead94004cf4c147::function_720d227d0e55a960()) {
        return 0;
    }
    if (player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return 0;
    }
    if (!isdefined(level.dogtaginfo)) {
        level.dogtaginfo = [];
    }
    if (!isdefined(level.var_9a595fc01ad18995)) {
        level.var_9a595fc01ad18995 = [];
    }
    var_567cd0e51048ff1f = function_fb2923d9d7eb7aac(player);
    return !isdefined(var_567cd0e51048ff1f) || !istrue(level.var_9a595fc01ad18995[player.guid]);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157f
// Size: 0x64
function function_59771b0cc100410a(player) {
    if (namespace_cd0b2d039510b38d::getsubgametype() != "dmz" && getdvarint(@"hash_7bea5a5cf88445dc", 0)) {
        return "brloot_dogtag";
    }
    tier = function_de2c669caf6fb1d(player);
    if (isdefined(level.var_a98214b4bdc952cd)) {
        return level.var_a98214b4bdc952cd[tier];
    }
    return "brloot_dogtag_bronze";
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15eb
// Size: 0x3a
function function_777013e79be19c16(player) {
    tier = function_de2c669caf6fb1d(player);
    if (isdefined(level.var_ec3a072500042491)) {
        return level.var_ec3a072500042491[tier];
    }
    return 13448;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162d
// Size: 0x5e
function function_2d2f7e8a6547ae42(lootid) {
    switch (lootid) {
    case 13448:
        return 0;
    case 13445:
        return 1;
    case 13447:
        return 2;
    case 13446:
        return 3;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0xcf
function private function_de2c669caf6fb1d(player) {
    if (!isdefined(level.var_a98214b4bdc952cd) && isdefined(level.var_ec3a072500042491)) {
        /#
            assertmsg("getDogTagScriptable: Called before initDogTagData");
        #/
        return 0;
    }
    if (!isdefined(player)) {
        /#
            assertmsg("getDogTagScriptable: Called before with an undefined player");
        #/
        return 0;
    }
    /#
        var_96e335eae30651e5 = getdvarint(@"hash_855a310cd1834a3e", -1);
        if (var_96e335eae30651e5 >= 0) {
            return var_96e335eae30651e5;
        }
    #/
    var_bffcba6249871e48 = namespace_a38a2e1fe7519183::function_1558f8fb859c492a(player);
    _ = var_bffcba6249871e48[1];
    streak = var_bffcba6249871e48[0];
    if (!isdefined(streak)) {
        return 0;
    }
    if (streak >= 10) {
        return 3;
    } else if (streak >= 5) {
        return 2;
    } else if (streak >= 2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769
// Size: 0x83
function function_bc03aa369196f2bf(player, hastag) {
    if (!isdefined(level.var_9a595fc01ad18995)) {
        level.var_9a595fc01ad18995 = [];
    }
    if (istrue(hastag)) {
        level.var_9a595fc01ad18995[player.guid] = undefined;
        var_5c9ddcf56d36f133 = function_de2c669caf6fb1d(player);
    } else {
        level.var_9a595fc01ad18995[player.guid] = 1;
        var_5c9ddcf56d36f133 = -1;
    }
    player setclientomnvar("ui_dmz_dog_tag", var_5c9ddcf56d36f133);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f3
// Size: 0x6d
function function_dd15435220e4207(player, var_123d6d777458b852) {
    if (!isdefined(var_123d6d777458b852)) {
        return 0;
    }
    var_f3c7c0cfc3e37302 = function_fb2923d9d7eb7aac(player);
    if (!isdefined(var_f3c7c0cfc3e37302)) {
        return 0;
    }
    var_bffcbb624987207b = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_bffcbb624987207b[1];
    victimindex = var_bffcbb624987207b[0];
    return isdefined(victimindex) && victimindex == var_f3c7c0cfc3e37302;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0x30
function function_3c17a26ce6a4668(lootid) {
    return isdefined(lootid) && isdefined(level.var_ec3a072500042491) && array_contains(level.var_ec3a072500042491, lootid);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a0
// Size: 0xb5
function function_d9f5c5090de1241b(player, var_123d6d777458b852) {
    if (!isdefined(player.team) || !isdefined(level.dogtaginfo)) {
        return 0;
    }
    var_bffcbc62498722ae = getdogtagvictimandkiller(var_123d6d777458b852);
    _ = var_bffcbc62498722ae[1];
    victimindex = var_bffcbc62498722ae[0];
    return isdefined(victimindex) && isdefined(level.dogtaginfo[victimindex]) && isdefined(level.dogtaginfo[victimindex].team) && level.dogtaginfo[victimindex].team == player.team;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195d
// Size: 0xbb
function function_1129ba5718d33025(killer, var_123d6d777458b852) {
    if (!isdefined(killer) || !isdefined(killer.guid) || !isdefined(level.dogtaginfo)) {
        return 0;
    }
    var_bffcbd62498724e1 = getdogtagvictimandkiller(var_123d6d777458b852);
    killerindex = var_bffcbd62498724e1[1];
    _ = var_bffcbd62498724e1[0];
    return isdefined(killerindex) && isdefined(level.dogtaginfo[killerindex]) && isdefined(level.dogtaginfo[killerindex].guid) && level.dogtaginfo[killerindex].guid == killer.guid;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a20
// Size: 0x7c
function function_57711583c5d26490(victim) {
    if (!isdefined(victim)) {
        return 0;
    }
    victimindex = function_fb2923d9d7eb7aac(victim);
    if (!isdefined(victimindex)) {
        return (61 | 61 << 6);
    }
    var_ad63323b4b7fde00 = function_55b287be60b2ae11(victim);
    killerindex = 61;
    if (isdefined(var_ad63323b4b7fde00) && isdefined(var_ad63323b4b7fde00.killer)) {
        killerindex = var_ad63323b4b7fde00.killer;
    }
    return function_99cbbc040233be98(victimindex, killerindex);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x3d
function function_379463a84adb07b4(count) {
    if (!isdefined(count)) {
        return [0:61, 1:61, 2:0];
    }
    return [0:count & 64 - 1, 1:count >> 6, 2:0];
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae9
// Size: 0xa0
function function_b5d4fcc3fab92696(pickup) {
    if (istrue(pickup.var_5754163e12f63fa7) || pickup.count > 61) {
        return pickup.count;
    }
    pickup.var_5754163e12f63fa7 = 1;
    result = 0;
    if (isdefined(pickup.count)) {
        result = result + pickup.count;
    }
    if (isdefined(pickup.countlefthand)) {
        result = result + (pickup.countlefthand << 6);
    }
    pickup.count = result;
    return result;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b91
// Size: 0x91
function function_f6d685cabfad2ce9(victim, killer, weapon) {
    if (!isdefined(level.dogtaginfo)) {
        level.dogtaginfo = [];
    }
    if (!isdefined(function_fb2923d9d7eb7aac(victim))) {
        function_ad150ee445d765a6(victim);
    }
    if (isdefined(killer) && isplayer(killer) && !isdefined(function_fb2923d9d7eb7aac(killer))) {
        function_ad150ee445d765a6(killer);
    }
    if (isdefined(victim) && isdefined(killer) && (victim == killer || !isplayer(killer))) {
        killer = undefined;
    }
    function_56995ecb525c7b1(victim, killer);
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c29
// Size: 0x108
function private function_ad150ee445d765a6(player) {
    if (level.dogtaginfo.size >= 60) {
        return;
    }
    info = spawnstruct();
    info.xuid = function_b362c4581e1071bb(player getxuid());
    info.team = player.team;
    info.guid = player.guid;
    info.player = player;
    foreach (player in level.players) {
        player setplayerdata(level.var_5d69837cf4db0407, "dogTagInfo", level.dogtaginfo.size, "deadPlayerXuid", info.xuid);
    }
    level.dogtaginfo[level.dogtaginfo.size] = info;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d38
// Size: 0x59
function getdogtagvictimandkiller(var_123d6d777458b852) {
    if (!isdefined(var_123d6d777458b852)) {
        return [0:undefined, 1:undefined];
    }
    var_123d6d777458b852 = var_123d6d777458b852 - 1;
    victimindex = var_123d6d777458b852 & 64 - 1;
    killerindex = var_123d6d777458b852 >> 6;
    if (killerindex > 60) {
        killerindex = undefined;
    }
    return [0:victimindex, 1:killerindex];
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d99
// Size: 0x2b
function private function_99cbbc040233be98(victimindex, killerindex) {
    if (!isdefined(victimindex) || !isdefined(killerindex)) {
        return undefined;
    }
    return (killerindex << 6 | victimindex) + 1;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcc
// Size: 0x88
function function_fb2923d9d7eb7aac(player) {
    if (isdefined(player) && isdefined(level.dogtaginfo)) {
        foreach (index, info in level.dogtaginfo) {
            if (info.guid == player.guid) {
                return index;
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e5b
// Size: 0x88
function private function_55b287be60b2ae11(player) {
    if (isdefined(player) && isdefined(level.dogtaginfo)) {
        foreach (info in level.dogtaginfo) {
            if (info.guid == player.guid) {
                return info;
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eea
// Size: 0xc7
function private function_56995ecb525c7b1(victim, killer) {
    if (isdefined(victim) && isdefined(level.dogtaginfo)) {
        foreach (info in level.dogtaginfo) {
            if (info.guid == victim.guid) {
                info.var_c9efb56fdfb33e52 = 0;
                if (isdefined(killer)) {
                    info.killer = function_fb2923d9d7eb7aac(killer);
                } else {
                    info.killer = 61;
                }
                break;
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb8
// Size: 0xa8
function function_941fe2b16d6fff9d(player) {
    if (!isdefined(level.dogtaginfo)) {
        level.dogtaginfo = [];
    }
    for (index = 0; index < 60; index++) {
        xuid = "0";
        if (isdefined(level.dogtaginfo[index]) && isdefined(level.dogtaginfo[index].xuid)) {
            xuid = level.dogtaginfo[index].xuid;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "dogTagInfo", index, "deadPlayerXuid", xuid);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2067
// Size: 0xb
function function_20d00accaa12c27f() {
    return 61 | 61 << 6;
}

// Namespace namespace_b5b2cbfd27ff2a4e/namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207a
// Size: 0x293
function function_28199382c2662c3f() {
    /#
        while (1) {
            if (getdvarint(@"hash_b044a50f64f8d1f4", 0)) {
                setdvar(@"hash_b044a50f64f8d1f4", 0);
                dogtags = getentitylessscriptablearray("0");
                if (dogtags.size) {
                    dogtag = dogtags[0];
                    bot = undefined;
                    foreach (player in level.players) {
                        if (isbot(player) && isalive(player) && player.team != level.players[0].team) {
                            bot = player;
                            break;
                        }
                    }
                    namespace_cb965d2f71fefddc::lootused(dogtag, "0", "<unknown string>", bot);
                }
            }
            if (getdvarint(@"hash_db9e3d9e8570dfb3", 0)) {
                setdvar(@"hash_db9e3d9e8570dfb3", 0);
                enemybot = undefined;
                foreach (player in level.players) {
                    if (isbot(player) && isalive(player) && player.team != level.players[0].team) {
                        enemybot = player;
                        break;
                    }
                }
                var_fcb40e5c1b5bb06b = undefined;
                foreach (player in level.players) {
                    if (isbot(player) && isalive(player) && player.health > 50 && player.team == level.players[0].team) {
                        var_fcb40e5c1b5bb06b = player;
                        break;
                    }
                }
                var_fcb40e5c1b5bb06b dodamage(10000, enemybot.origin, enemybot, enemybot);
                wait(3);
                var_fcb40e5c1b5bb06b dodamage(10000, enemybot.origin, enemybot, enemybot);
            }
            waitframe();
        }
    #/
}

