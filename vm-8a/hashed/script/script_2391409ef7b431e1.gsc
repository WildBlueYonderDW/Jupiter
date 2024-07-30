#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\common\callbacks.gsc;
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

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c
// Size: 0x170
function function_d22b3026c3183ead() {
    level.var_ec3a072500042491 = [13448, 13445, 13447, 13446];
    level.var_a98214b4bdc952cd = ["brloot_dogtag_bronze", "brloot_dogtag_silver", "brloot_dogtag_gold", "brloot_dogtag_damascus"];
    if (!isdefined(level.br_pickups)) {
        level waittill("br_pickups_init");
    }
    if (!getdvarint(@"hash_ec32cd72ead6b977", 1)) {
        return;
    }
    level.dogtagobjectives = spawnstruct();
    level.dogtagobjectives.objectives = [];
    level.dogtagobjectives.playerobjectives = [];
    level.dogtagupdaterate = getdvarfloat(@"hash_5a1b0676e3c6c467", 10);
    level.dogtagcircleradius = getdvarint(@"hash_2f56d4a76dc729e4", 2000);
    scripts\mp\gametypes\br_pickups::registerpickupcreatedcallback("brloot_dogtag_bronze", &function_ab266ca8693e5618);
    scripts\mp\gametypes\br_pickups::registerpickupcreatedcallback("brloot_dogtag_silver", &function_ab266ca8693e5618);
    scripts\mp\gametypes\br_pickups::registerpickupcreatedcallback("brloot_dogtag_gold", &function_ab266ca8693e5618);
    scripts\mp\gametypes\br_pickups::registerpickupcreatedcallback("brloot_dogtag_damascus", &function_ab266ca8693e5618);
    scripts\common\callbacks::add("player_connect", &onplayerconnect);
    scripts\engine\utility::registersharedfunc("dogtag", "getDogTagVictimAndKiller", &getDogTagVictimAndKiller);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&onteamchange);
    /#
        level thread debugdogtags();
    #/
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x1e
function private onplayerconnect(params) {
    self setclientomnvar("ui_dmz_dog_tag", function_de2c669caf6fb1d(self));
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ca
// Size: 0x193
function private onteamchange(player, oldteam, newteam) {
    playerinfo = function_55b287be60b2ae11(player);
    if (!isdefined(playerinfo)) {
        return;
    }
    playerinfo.team = newteam;
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
            var_57acadc40b2f0a8 = getDogTagVictimAndKiller(quantity);
            _ = var_57acadc40b2f0a8[1];
            victimindex = var_57acadc40b2f0a8[0];
            victiminfo = level.dogTagInfo[victimindex];
            if (isdefined(victiminfo.player)) {
                function_8e643d6706defeea(victiminfo.player, quantity);
            }
            if (!isdefined(victiminfo.player) || victiminfo.player != teammember) {
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_recover_dog_tag", [teammember]);
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x665
// Size: 0xc
function function_2f6772930123576c() {
    return isdefined(level.dogtagobjectives);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67a
// Size: 0x79
function function_8e643d6706defeea(player, dogtagcount) {
    function_bc03aa369196f2bf(player, 1);
    if (!istrue(level.var_2d15c14a954ff12f)) {
        scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_recover_dog_tag", [player], undefined);
    }
    if (function_2f6772930123576c() && function_6cd8c4885cb6775c(dogtagcount)) {
        objstruct = level.dogtagobjectives.objectives[dogtagcount];
        function_e98b03b1ec8385fe(objstruct);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fb
// Size: 0x163
function function_b5fbe3cb4ed955f4(enemy, dogtagcount) {
    if (function_2f6772930123576c()) {
        if (function_6cd8c4885cb6775c(dogtagcount)) {
            objstruct = level.dogtagobjectives.objectives[dogtagcount];
            function_e98b03b1ec8385fe(objstruct);
        }
        if (function_1a21a83169ad19f9(enemy)) {
            function_8945131b7b8a89c8(enemy, dogtagcount);
        } else {
            function_433d4c5bc4da9ead(enemy, dogtagcount);
        }
        var_57acbdc40b2f2db = getDogTagVictimAndKiller(dogtagcount);
        _ = var_57acbdc40b2f2db[1];
        victimindex = var_57acbdc40b2f2db[0];
        info = level.dogTagInfo[victimindex];
        if (isdefined(info) && isdefined(info.team)) {
            teammembers = getteamdata(info.team, "players");
            if (isdefined(info.player)) {
                teammembers = array_remove(teammembers, info.player);
                namespace_446fc987a980892f::playevent("dogtag_stolen_from_you", [info.player]);
            }
            namespace_446fc987a980892f::playevent("dogtag_stolen_from_teammate", teammembers);
        }
        if (isdefined(enemy.team)) {
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("dogtag_stolen_from_enemy", enemy.team);
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x866
// Size: 0x9e
function function_ab266ca8693e5618() {
    if (function_2f6772930123576c()) {
        count = scripts\mp\gametypes\br_pickups::loot_getitemcount(self);
        countlefthand = scripts\mp\gametypes\br_pickups::loot_getitemcountlefthand(self);
        var_e97d731bedd44c63 = scripts\mp\gametypes\br_pickups::function_3a5f7703319142dd(self);
        dogtagcount = function_b5d4fcc3fab92696(self);
        if (function_6cd8c4885cb6775c(dogtagcount)) {
            objstruct = level.dogtagobjectives.objectives[dogtagcount];
            if (isdefined(objstruct.carryingplayer)) {
                function_a9e95e007eb70709(objstruct, dogtagcount);
                function_42426b559596ae56(self, dogtagcount);
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0xaa
function function_ea29bccf97cb1b9a(killer, dogtagcount) {
    var_57ad0dc40b2fdda = getDogTagVictimAndKiller(dogtagcount);
    _ = var_57ad0dc40b2fdda[1];
    victimindex = var_57ad0dc40b2fdda[0];
    if (isdefined(victimindex) && isdefined(level.dogTagInfo) && isdefined(level.dogTagInfo[victimindex]) && !istrue(level.dogTagInfo[victimindex].var_c9efb56fdfb33e52)) {
        level.dogTagInfo[victimindex].var_c9efb56fdfb33e52 = 1;
        scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_kill_confirm_dog_tag", [killer]);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9be
// Size: 0x3e
function function_1a21a83169ad19f9(player) {
    if (isdefined(level.dogtagobjectives)) {
        return isdefined(level.dogtagobjectives.playerobjectives[player.guid]);
    }
    return 0;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa04
// Size: 0x34
function function_6cd8c4885cb6775c(dogtagcount) {
    if (isdefined(level.dogtagobjectives)) {
        return isdefined(level.dogtagobjectives.objectives[dogtagcount]);
    }
    return 0;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40
// Size: 0x98
function function_3bfe56fc3c2bb91e(origin, inworld) {
    objstruct = spawnstruct();
    objstruct.curorigin = origin;
    objstruct.offset3d = (0, 0, 100);
    objstruct scripts\mp\gameobjects::requestid(1, inworld, undefined, 1, 0);
    scripts\mp\objidpoolmanager::update_objective_icon(objstruct.objidnum, "hud_icon_objective_dog_tag");
    scripts\mp\objidpoolmanager::update_objective_setbackground(objstruct.objidnum, 1);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(objstruct.objidnum, 100);
    return objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae1
// Size: 0xf3
function function_42426b559596ae56(scriptable, dogtagcount) {
    var_57ad1dc40b3000d = getDogTagVictimAndKiller(dogtagcount);
    _ = var_57ad1dc40b3000d[1];
    victimindex = var_57ad1dc40b3000d[0];
    objstruct = function_3bfe56fc3c2bb91e(scriptable.origin, 1);
    objstruct.scriptable = scriptable;
    scripts\mp\objidpoolmanager::update_objective_position(objstruct.objidnum, objstruct.scriptable.origin + (0, 0, 50));
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(objstruct.objidnum, level.dogTagInfo[victimindex].team);
    objstruct.dogtags = [dogtagcount];
    level.dogtagobjectives.objectives[dogtagcount] = objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc
// Size: 0x70
function function_62b5f185de3ab25d(array, objstruct) {
    newarray = [];
    foreach (dogtagcount, obj in array) {
        if (obj != objstruct) {
            newarray[dogtagcount] = obj;
        }
    }
    return newarray;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc55
// Size: 0xdc
function function_e98b03b1ec8385fe(objstruct) {
    objstruct notify("stop_tracking");
    objstruct scripts\mp\gameobjects::releaseid();
    objstruct scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
    foreach (obj in level.dogtagobjectives.objectives) {
        if (obj == objstruct) {
        }
    }
    level.dogtagobjectives.objectives = function_62b5f185de3ab25d(level.dogtagobjectives.objectives, objstruct);
    level.dogtagobjectives.playerobjectives = function_62b5f185de3ab25d(level.dogtagobjectives.playerobjectives, objstruct);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd39
// Size: 0x3e
function function_77060da87f0214f7(origin) {
    point = function_d553466cf817a4da();
    point = (point[0] * level.dogtagcircleradius, point[1] * level.dogtagcircleradius, 0);
    return point + origin;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd80
// Size: 0x64
function function_3de97c52c88c8a20(objstruct, player) {
    origin = function_77060da87f0214f7(player.origin);
    origin += (0, 0, player.origin[2] + 750);
    scripts\mp\objidpoolmanager::update_objective_position(objstruct.objidnum, origin);
    objstruct scripts\cp_mp\utility\game_utility::function_6e148c8da2e4db13(origin);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdec
// Size: 0x1c0
function function_433d4c5bc4da9ead(player, dogtagcount) {
    var_57ac4dc40b2e376 = getDogTagVictimAndKiller(dogtagcount);
    _ = var_57ac4dc40b2e376[1];
    victimindex = var_57ac4dc40b2e376[0];
    if (!isdefined(victimindex) || !isdefined(level.dogTagInfo[victimindex])) {
        return;
    }
    team = level.dogTagInfo[victimindex].team;
    objstruct = function_3bfe56fc3c2bb91e(player.origin, 0);
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(objstruct.objidnum, team);
    objstruct.carryingplayer = player;
    objstruct.dogtags = [dogtagcount];
    objstruct scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("DogTagObj_Dmz", function_77060da87f0214f7(objstruct.carryingplayer.origin), level.dogtagcircleradius);
    objstruct scripts\cp_mp\utility\game_utility::function_4eaf685bc40a3b9();
    teammates = getteamdata(team, "players");
    foreach (teammate in teammates) {
        objstruct scripts\cp_mp\utility\game_utility::function_cfd53c8f6878014f(teammate);
    }
    objstruct notify("stop_tracking");
    thread function_8a3a6225b2e11801(objstruct);
    thread function_dfe0992113030bd0(objstruct);
    level.dogtagobjectives.objectives[dogtagcount] = objstruct;
    level.dogtagobjectives.playerobjectives[player.guid] = objstruct;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb4
// Size: 0x157
function function_8945131b7b8a89c8(player, dogtagcount) {
    var_c00a2b6249962b50 = getDogTagVictimAndKiller(dogtagcount);
    _ = var_c00a2b6249962b50[1];
    victimindex = var_c00a2b6249962b50[0];
    if (!isdefined(victimindex) || !isdefined(level.dogTagInfo[victimindex])) {
        return;
    }
    team = level.dogTagInfo[victimindex].team;
    objstruct = level.dogtagobjectives.playerobjectives[player.guid];
    objstruct.dogtags = array_add(objstruct.dogtags, dogtagcount);
    level.dogtagobjectives.objectives[dogtagcount] = objstruct;
    teammates = getteamdata(team, "players");
    foreach (teammate in teammates) {
        objstruct scripts\cp_mp\utility\game_utility::function_cfd53c8f6878014f(teammate);
    }
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(objstruct.objidnum, team);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1113
// Size: 0x148
function function_a9e95e007eb70709(objstruct, dogtagcount) {
    var_c00a30624996364f = getDogTagVictimAndKiller(dogtagcount);
    _ = var_c00a30624996364f[1];
    victimindex = var_c00a30624996364f[0];
    if (!isdefined(victimindex) || !isdefined(level.dogTagInfo[victimindex])) {
        return;
    }
    team = level.dogTagInfo[victimindex].team;
    level.dogtagobjectives.objectives[dogtagcount] = undefined;
    objstruct.dogtags = array_remove(objstruct.dogtags, dogtagcount);
    if (!function_2e13cc7d90ee5683(objstruct.carryingplayer, team)) {
        teammates = getteamdata(team, "players");
        foreach (teammate in teammates) {
            objstruct scripts\cp_mp\utility\game_utility::function_d7d113d56ef0ef5b(teammate);
        }
    }
    if (objstruct.dogtags.size == 0) {
        function_e98b03b1ec8385fe(objstruct);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1263
// Size: 0xce
function function_8a3a6225b2e11801(objstruct) {
    objstruct endon("stop_tracking");
    objstruct.carryingplayer endon("death_or_disconnect");
    objstruct.carryingplayer endon("enter_live_ragdoll");
    level endon("game_ended");
    while (true) {
        itemtype, itemindex, lootid, quantity = objstruct.carryingplayer waittill("item_added_to_cache");
        if (isdefined(objstruct) && isdefined(objstruct.carryingplayer) && isdefined(lootid) && isdefined(quantity) && isdefined(level.var_ec3a072500042491) && array_contains(level.var_ec3a072500042491, lootid)) {
            thread function_a9e95e007eb70709(objstruct, quantity);
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1339
// Size: 0x89
function function_dfe0992113030bd0(objstruct) {
    objstruct endon("stop_tracking");
    objstruct.carryingplayer endon("death_or_disconnect");
    objstruct.carryingplayer endon("enter_live_ragdoll");
    level endon("game_ended");
    while (true) {
        if (isdefined(objstruct.carryingplayer) && isdefined(objstruct.carryingplayer.origin)) {
            function_3de97c52c88c8a20(objstruct, objstruct.carryingplayer);
        }
        wait level.dogtagupdaterate;
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ca
// Size: 0x124
function function_2e13cc7d90ee5683(player, team) {
    if (isdefined(level.dogtagobjectives) && function_1a21a83169ad19f9(player)) {
        objstruct = level.dogtagobjectives.playerobjectives[player.guid];
        foreach (dogtagcount in objstruct.dogtags) {
            var_c00a336249963ce8 = getDogTagVictimAndKiller(dogtagcount);
            _ = var_c00a336249963ce8[1];
            victimindex = var_c00a336249963ce8[0];
            if (isdefined(victimindex) && isdefined(level.dogTagInfo[victimindex]) && isdefined(level.dogTagInfo[victimindex].team) && level.dogTagInfo[victimindex].team == team) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0x7f
function hasdogtag(player) {
    if (!namespace_aead94004cf4c147::function_720d227d0e55a960()) {
        return false;
    }
    if (player scripts\mp\gametypes\br_public::isplayeringulag()) {
        return false;
    }
    if (!isdefined(level.dogTagInfo)) {
        level.dogTagInfo = [];
    }
    if (!isdefined(level.var_9a595fc01ad18995)) {
        level.var_9a595fc01ad18995 = [];
    }
    deathindex = function_fb2923d9d7eb7aac(player);
    return !isdefined(deathindex) || !istrue(level.var_9a595fc01ad18995[player.guid]);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157f
// Size: 0x63
function function_59771b0cc100410a(player) {
    if (scripts\mp\utility\game::getsubgametype() != "dmz" && getdvarint(@"hash_7bea5a5cf88445dc", 0)) {
        return "brloot_dogtag";
    }
    tier = function_de2c669caf6fb1d(player);
    if (isdefined(level.var_a98214b4bdc952cd)) {
        return level.var_a98214b4bdc952cd[tier];
    }
    return "brloot_dogtag_bronze";
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15eb
// Size: 0x39
function function_777013e79be19c16(player) {
    tier = function_de2c669caf6fb1d(player);
    if (isdefined(level.var_ec3a072500042491)) {
        return level.var_ec3a072500042491[tier];
    }
    return 13448;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162d
// Size: 0x5d
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
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1692
// Size: 0xce
function private function_de2c669caf6fb1d(player) {
    if (!isdefined(level.var_a98214b4bdc952cd) && isdefined(level.var_ec3a072500042491)) {
        assertmsg("getDogTagScriptable: Called before initDogTagData");
        return 0;
    }
    if (!isdefined(player)) {
        assertmsg("getDogTagScriptable: Called before with an undefined player");
        return 0;
    }
    /#
        overridetier = getdvarint(@"hash_855a310cd1834a3e", -1);
        if (overridetier >= 0) {
            return overridetier;
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

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769
// Size: 0x82
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

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f3
// Size: 0x6c
function function_dd15435220e4207(player, dogtagcount) {
    if (!isdefined(dogtagcount)) {
        return false;
    }
    var_f3c7c0cfc3e37302 = function_fb2923d9d7eb7aac(player);
    if (!isdefined(var_f3c7c0cfc3e37302)) {
        return false;
    }
    var_bffcbb624987207b = getDogTagVictimAndKiller(dogtagcount);
    _ = var_bffcbb624987207b[1];
    victimindex = var_bffcbb624987207b[0];
    return isdefined(victimindex) && victimindex == var_f3c7c0cfc3e37302;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0x2f
function function_3c17a26ce6a4668(lootid) {
    return isdefined(lootid) && isdefined(level.var_ec3a072500042491) && array_contains(level.var_ec3a072500042491, lootid);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a0
// Size: 0xb4
function function_d9f5c5090de1241b(player, dogtagcount) {
    if (!isdefined(player.team) || !isdefined(level.dogTagInfo)) {
        return false;
    }
    var_bffcbc62498722ae = getDogTagVictimAndKiller(dogtagcount);
    _ = var_bffcbc62498722ae[1];
    victimindex = var_bffcbc62498722ae[0];
    return isdefined(victimindex) && isdefined(level.dogTagInfo[victimindex]) && isdefined(level.dogTagInfo[victimindex].team) && level.dogTagInfo[victimindex].team == player.team;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195d
// Size: 0xba
function function_1129ba5718d33025(killer, dogtagcount) {
    if (!isdefined(killer) || !isdefined(killer.guid) || !isdefined(level.dogTagInfo)) {
        return false;
    }
    var_bffcbd62498724e1 = getDogTagVictimAndKiller(dogtagcount);
    killerindex = var_bffcbd62498724e1[1];
    _ = var_bffcbd62498724e1[0];
    return isdefined(killerindex) && isdefined(level.dogTagInfo[killerindex]) && isdefined(level.dogTagInfo[killerindex].guid) && level.dogTagInfo[killerindex].guid == killer.guid;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a20
// Size: 0x7b
function function_57711583c5d26490(victim) {
    if (!isdefined(victim)) {
        return 0;
    }
    victimindex = function_fb2923d9d7eb7aac(victim);
    if (!isdefined(victimindex)) {
        return (61 | 61 << 6);
    }
    playerinfo = function_55b287be60b2ae11(victim);
    killerindex = 61;
    if (isdefined(playerinfo) && isdefined(playerinfo.killer)) {
        killerindex = playerinfo.killer;
    }
    return function_99cbbc040233be98(victimindex, killerindex);
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x3c
function function_379463a84adb07b4(count) {
    if (!isdefined(count)) {
        return [61, 61, 0];
    }
    return [count & 64 - 1, count >> 6, 0];
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae9
// Size: 0x9f
function function_b5d4fcc3fab92696(pickup) {
    if (istrue(pickup.var_5754163e12f63fa7) || pickup.count > 61) {
        return pickup.count;
    }
    pickup.var_5754163e12f63fa7 = 1;
    result = 0;
    if (isdefined(pickup.count)) {
        result += pickup.count;
    }
    if (isdefined(pickup.countlefthand)) {
        result += pickup.countlefthand << 6;
    }
    pickup.count = result;
    return result;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b91
// Size: 0x90
function function_f6d685cabfad2ce9(victim, killer, weapon) {
    if (!isdefined(level.dogTagInfo)) {
        level.dogTagInfo = [];
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

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c29
// Size: 0x107
function private function_ad150ee445d765a6(player) {
    if (level.dogTagInfo.size >= 60) {
        return;
    }
    info = spawnstruct();
    info.xuid = function_b362c4581e1071bb(player getxuid());
    info.team = player.team;
    info.guid = player.guid;
    info.player = player;
    foreach (player in level.players) {
        player setplayerdata(level.var_5d69837cf4db0407, "dogTagInfo", level.dogTagInfo.size, "deadPlayerXuid", info.xuid);
    }
    level.dogTagInfo[level.dogTagInfo.size] = info;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d38
// Size: 0x58
function getDogTagVictimAndKiller(dogtagcount) {
    if (!isdefined(dogtagcount)) {
        return [undefined, undefined];
    }
    dogtagcount -= 1;
    victimindex = dogtagcount & 64 - 1;
    killerindex = dogtagcount >> 6;
    if (killerindex > 60) {
        killerindex = undefined;
    }
    return [victimindex, killerindex];
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d99
// Size: 0x2a
function private function_99cbbc040233be98(victimindex, killerindex) {
    if (!isdefined(victimindex) || !isdefined(killerindex)) {
        return undefined;
    }
    return (killerindex << 6 | victimindex) + 1;
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dcc
// Size: 0x87
function function_fb2923d9d7eb7aac(player) {
    if (isdefined(player) && isdefined(level.dogTagInfo)) {
        foreach (index, info in level.dogTagInfo) {
            if (info.guid == player.guid) {
                return index;
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e5b
// Size: 0x87
function private function_55b287be60b2ae11(player) {
    if (isdefined(player) && isdefined(level.dogTagInfo)) {
        foreach (info in level.dogTagInfo) {
            if (info.guid == player.guid) {
                return info;
            }
        }
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1eea
// Size: 0xc6
function private function_56995ecb525c7b1(victim, killer) {
    if (isdefined(victim) && isdefined(level.dogTagInfo)) {
        foreach (info in level.dogTagInfo) {
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

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb8
// Size: 0xa7
function function_941fe2b16d6fff9d(player) {
    if (!isdefined(level.dogTagInfo)) {
        level.dogTagInfo = [];
    }
    for (index = 0; index < 60; index++) {
        xuid = "0";
        if (isdefined(level.dogTagInfo[index]) && isdefined(level.dogTagInfo[index].xuid)) {
            xuid = level.dogTagInfo[index].xuid;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "dogTagInfo", index, "deadPlayerXuid", xuid);
    }
}

// Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2067
// Size: 0xa
function function_20d00accaa12c27f() {
    return 61 | 61 << 6;
}

/#

    // Namespace namespace_b5b2cbfd27ff2a4e / namespace_85cd45b4fe0d86fb
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x207a
    // Size: 0x292
    function debugdogtags() {
        while (true) {
            if (getdvarint(@"hash_b044a50f64f8d1f4", 0)) {
                setdvar(@"hash_b044a50f64f8d1f4", 0);
                dogtags = getentitylessscriptablearray("<dev string:x1c>");
                if (dogtags.size) {
                    dogtag = dogtags[0];
                    bot = undefined;
                    foreach (player in level.players) {
                        if (isbot(player) && isalive(player) && player.team != level.players[0].team) {
                            bot = player;
                            break;
                        }
                    }
                    scripts\mp\gametypes\br_pickups::lootused(dogtag, "<dev string:x1c>", "<dev string:x31>", bot);
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
                friendlybot = undefined;
                foreach (player in level.players) {
                    if (isbot(player) && isalive(player) && player.health > 50 && player.team == level.players[0].team) {
                        friendlybot = player;
                        break;
                    }
                }
                friendlybot dodamage(10000, enemybot.origin, enemybot, enemybot);
                wait 3;
                friendlybot dodamage(10000, enemybot.origin, enemybot, enemybot);
            }
            waitframe();
        }
    }

#/
