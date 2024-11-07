#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\system.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_749ff6f56673a813;
#using script_638d701d263ee1ed;
#using script_7b2517368c79e5bc;
#using script_41387eecc35b88bf;
#using script_3ff084f114b7f6c9;
#using script_1f97a44d1761c919;
#using script_62a4f7a62643fe8;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\game.gsc;
#using script_3a13b8032b62a5e6;
#using scripts\mp\objidpoolmanager.gsc;
#using script_3e2f8cc477d57433;
#using script_40b5006483288fd3;
#using scripts\mp\utility\teams.gsc;

#namespace namespace_e50a4d88616acbab;

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x586
// Size: 0x19
function private autoexec __init__system__() {
    system::register(#"hash_f8adebf9c9a8f24f", undefined, undefined, &function_683ee3819a7ed43d);
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a7
// Size: 0xb3
function function_683ee3819a7ed43d() {
    if (getdvarint(@"hash_e2a155fe8afdc54b", 0) != 1) {
        return;
    }
    level.var_f9bff0af71d1f9f4 = 1;
    level.var_1298c4d4107c7ae7 = undefined;
    level.lootcase = undefined;
    level.var_47836aaadb2f1a42 = undefined;
    level.var_e929f2bdd0f896ed = ["scriptable_br_loot_cache", "loot_spawn_larger", "loot_spawn_medium"];
    level.var_9790a6a9ef017f5c = &function_33ea4e78dfeb232a;
    level thread function_ae88c75bd5b24729();
    level thread function_28440f81ec22e0ea();
    level thread function_c9829b50da991aa7();
    level.var_9e9fc546d0341a28 = getdvarint(@"hash_2d859aad6adfc6d7", 0);
    /#
        level thread function_6a7b9641a3a20e1f();
    #/
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x662
// Size: 0x9a
function private function_c9829b50da991aa7() {
    level endon("game_ended");
    level waittill("init_lootcase_point_completed");
    namespace_70aa82e7f409bc33::function_8b5b2a3392fc7e2a("ActivitySuccess", &function_e07daf5fb2a4ecd3);
    namespace_76a219af07c28c13::registerteamassimilatecallback(&function_6bdc6f56944dc3aa);
    level callback::add("player_death", &onplayerdeath);
    level callback::add("player_bleedout", &function_c9df4b28bedf5ec1);
    level callback::add("player_item_pickup", &function_8f0a47e1cf524712);
    level callback::add("player_item_drop", &function_4f1adf081c36fa5e);
    level callback::add("ob_exfil_success", &function_ac298c756f30aea6);
    level callback::add("player_disconnect", &onplayerdisconnect);
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x704
// Size: 0x1ef
function private function_8f0a47e1cf524712(params) {
    if (params.itembundlename != "ob_jup_item_lootcase") {
        return;
    }
    level.var_47836aaadb2f1a42 = self;
    level.lootcase = undefined;
    function_39b0f5685623cc2d();
    thread function_5dba5727a1d524c2();
    teammates = [];
    enemies = [];
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (player.team == self.team) {
                teammates = array_add(teammates, player);
                continue;
            }
            enemies = array_add(enemies, player);
        }
    }
    if (teammates.size > 0) {
        level thread namespace_446fc987a980892f::playevent("loot_case_acquired", teammates);
    }
    if (enemies.size > 0) {
        level thread namespace_446fc987a980892f::playevent("loot_case_acquired_enemy", enemies);
    }
    if (!namespace_6776e8e74ed64842::expansion_started()) {
        foreach (player in teammates) {
            player scripts\mp\hud_message::showsplash("lootcase_obtained_friendly", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        }
        foreach (player in enemies) {
            player scripts\mp\hud_message::showsplash("lootcase_obtained_enemy", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        }
        var_6f814cb33af8351a = hashcat(@"scr_", scripts\mp\utility\game::getgametype(), "_timelimit");
        setdvar(var_6f814cb33af8351a, scripts\cp_mp\utility\game_utility::gettimepassed() / 1000);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8fb
// Size: 0x50
function private function_5dba5727a1d524c2() {
    var_15ec0591e2caa999 = namespace_871f41e67db0bf7a::function_40062e64625f8b19("jup_ob_objectivemarker_lootcase");
    scripts\mp\objidpoolmanager::update_objective_onentity(var_15ec0591e2caa999, self);
    scripts\mp\objidpoolmanager::function_df6a3e032fa07d22(var_15ec0591e2caa999);
    waittill_any_3("drop_lootcase", "exfil_lootcase", "disconnect");
    scripts\mp\objidpoolmanager::function_f5862ad1ad967602(var_15ec0591e2caa999);
    scripts\mp\objidpoolmanager::returnobjectiveid(var_15ec0591e2caa999);
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x953
// Size: 0x32
function private function_4f1adf081c36fa5e(params) {
    if (params.itembundlename != "ob_jup_item_lootcase") {
        return;
    }
    level.var_47836aaadb2f1a42 = undefined;
    self notify("drop_lootcase");
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x98d
// Size: 0x15c
function private function_ac298c756f30aea6(var_751df20fceaee5) {
    if (!is_equal(level.var_47836aaadb2f1a42, self)) {
        return;
    }
    self notify("exfil_lootcase");
    level.var_47836aaadb2f1a42 = undefined;
    enemies = [];
    foreach (player in level.players) {
        if (isdefined(player)) {
            if (is_equal(player.team, self.team)) {
                player scripts\mp\hud_message::showsplash("lootcase_exfil_friendly", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
                continue;
            }
            enemies = array_add(enemies, player);
            player scripts\mp\hud_message::showsplash("lootcase_exfil_enemy", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
        }
    }
    if (enemies.size > 0) {
        level thread namespace_446fc987a980892f::playevent("loot_case_extracted_enemy", enemies);
    }
    backpacksize = namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        itembundle = namespace_dc38f0ea48cd4743::function_fb077d5402810e85(i);
        if (!isdefined(itembundle) || itembundle.subtype != "lootcase") {
            continue;
        }
        namespace_feea61bc660e9e0f::function_ca3bbb1070436540(i, 0, 0);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xaf1
// Size: 0xb6
function private onplayerdisconnect(params) {
    if (!is_equal(level.var_47836aaadb2f1a42, self)) {
        return;
    }
    level.var_47836aaadb2f1a42 = undefined;
    function_33ea4e78dfeb232a(self.origin, self.angles, 1, 0);
    backpacksize = namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        itembundle = namespace_dc38f0ea48cd4743::function_fb077d5402810e85(i);
        if (!isdefined(itembundle) || itembundle.subtype != "lootcase") {
            continue;
        }
        dropstruct = function_3fa6e9da3fd741f2();
        function_4433fa5f0f02ffd8(dropstruct, i);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbaf
// Size: 0xd7
function private function_125fda7c194275b(lootspawnpoint) {
    if (!array_contains(level.var_e929f2bdd0f896ed, lootspawnpoint.typename)) {
        return false;
    }
    minradius = getdvarint(@"hash_1e187d619ba60c10", 2500);
    var_d8e1bf16f9f787da = minradius * minradius;
    var_30706430d8caaeb7 = function_8e6454dd6d0cedd3();
    foreach (var_751df20fceaee5 in var_30706430d8caaeb7) {
        dist2dsquared = distance2dsquared(var_751df20fceaee5.origin, lootspawnpoint.origin);
        if (dist2dsquared < var_d8e1bf16f9f787da) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc8f
// Size: 0x6d
function private function_19db0b70eba2a749(lootspawnpoint) {
    if (isdefined(level.var_fac39a693f085779)) {
        var_631a505dbf23e03d = [[ level.var_fac39a693f085779 ]](lootspawnpoint.origin);
        switch (var_631a505dbf23e03d) {
        case #"hash_5343b465e56ec9a4":
        case #"hash_651f76c0ad6741ec":
            return true;
        default:
            return false;
        }
    }
    return false;
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd05
// Size: 0xd6
function private function_a2ea63b7a629421a() {
    var_449f98c54b27f6dc = getlootspawnpointcount();
    var_cc42fec2c0d2f282 = [];
    var_af6940dd9da83694 = [];
    for (pointindex = 0; pointindex < var_449f98c54b27f6dc; pointindex++) {
        if (function_a59e04a186feda43(pointindex)) {
            lootspawnpoint = getlootspawnpoint(pointindex);
            if (function_19db0b70eba2a749(lootspawnpoint)) {
                var_af6940dd9da83694[var_af6940dd9da83694.size] = pointindex;
            }
            if (!function_125fda7c194275b(lootspawnpoint)) {
                continue;
            }
            var_cc42fec2c0d2f282[var_cc42fec2c0d2f282.size] = pointindex;
        }
    }
    if (var_cc42fec2c0d2f282.size > 0) {
        randompointindex = var_cc42fec2c0d2f282[randomintrange(0, var_cc42fec2c0d2f282.size)];
        logstring("[ob_lootcase] lootcase pointIndex " + randompointindex);
        return getlootspawnpoint(randompointindex);
    } else if (var_af6940dd9da83694.size > 0) {
        randompointindex = var_af6940dd9da83694[randomintrange(0, var_af6940dd9da83694.size)];
        logstring("[ob_lootcase] lootcase fallback pointIndex " + randompointindex);
        return getlootspawnpoint(randompointindex);
    }
    return undefined;
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0xde4
// Size: 0x24f
function private function_33ea4e78dfeb232a(origin, angles, nodrop, noobjective, payload1) {
    level.var_1298c4d4107c7ae7.origin = origin;
    level.var_1298c4d4107c7ae7.angles = angles;
    if (nodrop) {
        level.lootcase = spawnscriptable("obloot_lootcase", level.var_1298c4d4107c7ae7.origin, level.var_1298c4d4107c7ae7.angles, undefined, payload1);
    } else {
        assert(isplayer(self));
        dropstruct = function_3fa6e9da3fd741f2();
        dropinfo = function_49b86047c8a8b228(dropstruct, origin, angles, self);
        payload2 = dropinfo.payload;
        level.lootcase = spawnscriptable("obloot_lootcase", dropinfo.origin, dropinfo.angles, undefined, payload1, payload2);
        level.lootcase thread function_4837e73f5e8c9129();
    }
    level.lootcase.count = 1;
    bundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_lootcase");
    if (!nodrop) {
        level.lootcase setscriptablepartstate(level.lootcase.type, "dropped");
        function_43272b9595268864(bundle, dropinfo.origin);
    }
    if (!noobjective || istrue(level.var_9e9fc546d0341a28)) {
        level.lootcase setscriptablepartstate(level.lootcase.type + "_objective", "Show");
    }
    level.lootcase callback::callback("scriptable_item_spawned", {#angles:level.var_1298c4d4107c7ae7.angles, #origin:level.var_1298c4d4107c7ae7.origin, #itembundle:bundle, #item:level.lootcase});
    return [level.lootcase, bundle];
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x103c
// Size: 0xcc
function private function_ae88c75bd5b24729() {
    if (isdefined(level.var_1298c4d4107c7ae7)) {
        return;
    }
    level notify("init_lootcase_point");
    level endon("init_lootcase_point");
    level endon("game_ended");
    level flag_wait("common_items_init");
    level flag_wait("exfil_initialized");
    level.var_1298c4d4107c7ae7 = function_a2ea63b7a629421a();
    if (isdefined(level.var_1298c4d4107c7ae7)) {
        function_33ea4e78dfeb232a(level.var_1298c4d4107c7ae7.origin, level.var_1298c4d4107c7ae7.angles, 1, 1);
        logstring("[ob_lootcase] lootcase spawned at " + level.var_1298c4d4107c7ae7.origin);
    }
    if (!isdefined(level.lootcase)) {
        logstring("[ob_lootcase] lootcase failed to spawn, LOOT SPAWN POINT NOT FOUND ! ");
    }
    level notify("init_lootcase_point_completed");
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1110
// Size: 0x3ed
function function_28440f81ec22e0ea() {
    level endon("game_ended");
    level waittill("init_lootcase_point_completed");
    if (!isdefined(level.var_1298c4d4107c7ae7)) {
        return;
    }
    level.var_cc52ce7c03341fc0 = spawnstruct();
    level.var_cc52ce7c03341fc0.var_9005b102820c0d0 = getdvarint(@"hash_afd462f8bc806622", 5);
    level.var_cc52ce7c03341fc0.stageduration = getdvarint(@"hash_7ffe17a5b4457f57", 20);
    level.var_cc52ce7c03341fc0.var_b8e42d65c59079d6 = getdvarint(@"hash_3ccbd5bd940ff02d", 20);
    level.var_cc52ce7c03341fc0.var_b49ed4809625442c = getdvarint(@"hash_1ce5f3c4223443d", 600);
    level.var_cc52ce7c03341fc0.initialradius = getdvarint(@"hash_c1c0b9933e04e248", 1000);
    level.var_cc52ce7c03341fc0.finalRadius = getdvarint(@"hash_c62d7fe2b76c7cf0", 35000);
    level.var_cc52ce7c03341fc0.var_f885f3bbcb0575c8 = getdvarint(@"hash_da93b783daeba745", 20000);
    level.var_cc52ce7c03341fc0.var_458764057331896a = getdvarint(@"hash_29805bc032d83dcb", 1);
    level.var_cc52ce7c03341fc0.currentcircle = level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1;
    level.var_cc52ce7c03341fc0.circles = [];
    level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50 = [];
    for (i = 0; i < level.var_cc52ce7c03341fc0.var_9005b102820c0d0; i++) {
        level.var_cc52ce7c03341fc0.circles[i] = spawnstruct();
        if (i == 0) {
            level.var_cc52ce7c03341fc0.circles[i].maxoffset = level.var_cc52ce7c03341fc0.var_b49ed4809625442c;
            level.var_cc52ce7c03341fc0.circles[i].radius = level.var_cc52ce7c03341fc0.initialradius;
        } else if (i == level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1) {
            level.var_cc52ce7c03341fc0.circles[i].maxoffset = level.var_cc52ce7c03341fc0.var_f885f3bbcb0575c8;
            level.var_cc52ce7c03341fc0.circles[i].radius = level.var_cc52ce7c03341fc0.finalRadius;
        } else {
            level.var_cc52ce7c03341fc0.circles[i].maxoffset = level.var_cc52ce7c03341fc0.var_f885f3bbcb0575c8 / (level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1) * i;
            level.var_cc52ce7c03341fc0.circles[i].radius = (level.var_cc52ce7c03341fc0.finalRadius - level.var_cc52ce7c03341fc0.initialradius) / (level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1) * i;
        }
        level.var_cc52ce7c03341fc0.circles[i].origin = level.var_1298c4d4107c7ae7.origin + function_d553466cf817a4da() * level.var_cc52ce7c03341fc0.circles[i].maxoffset;
    }
    level thread function_a0aa79a4e4dcfee9();
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1505
// Size: 0x1d2
function function_6ea1d9d856da2fd(team) {
    if (!isdefined(level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team])) {
        level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team] = level.var_cc52ce7c03341fc0.currentcircle - 1;
    } else {
        level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team] = int(min(level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team] - 1, level.var_cc52ce7c03341fc0.currentcircle - 1));
    }
    mincircleindex = int(max(0, level.var_cc52ce7c03341fc0.currentcircle - level.var_cc52ce7c03341fc0.var_458764057331896a));
    level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team] = int(clamp(level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team], mincircleindex, level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1));
    index = level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[team];
    if (level.var_cc52ce7c03341fc0.circles[index] function_acaa75ca8754452e()) {
        foreach (player in scripts\mp\utility\teams::getteamdata(team, "players")) {
            level.var_cc52ce7c03341fc0.circles[index] function_cfd53c8f6878014f(player);
        }
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16df
// Size: 0x70
function function_e07daf5fb2a4ecd3(params) {
    activity = self;
    playerlist = params.playerlist;
    if (isdefined(playerlist) && isdefined(activity) && isdefined(activity.category) && activity.category == "Contract") {
        function_6ea1d9d856da2fd(playerlist[0].team);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1757
// Size: 0xba
function function_6bdc6f56944dc3aa(player, oldteam, newteam) {
    for (i = level.var_cc52ce7c03341fc0.currentcircle - 1; i >= 0; i--) {
        if (isdefined(level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[newteam]) && i >= level.var_cc52ce7c03341fc0.var_7e24b4d94dc92e50[newteam]) {
            level.var_cc52ce7c03341fc0.circles[i] function_cfd53c8f6878014f(player);
            continue;
        }
        level.var_cc52ce7c03341fc0.circles[i] function_d7d113d56ef0ef5b(player);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1819
// Size: 0xc
function function_51d188c6831d55e6() {
    return randomint(100) >= 50;
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182e
// Size: 0x40
function function_c9df4b28bedf5ec1(params) {
    if (isplayer(self.laststandattacker) && function_51d188c6831d55e6()) {
        function_6ea1d9d856da2fd(self.laststandattacker.team);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1876
// Size: 0x44
function onplayerdeath(params) {
    if (isplayer(params.attacker) && function_51d188c6831d55e6()) {
        function_6ea1d9d856da2fd(params.attacker.team);
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c2
// Size: 0x6c
function function_39b0f5685623cc2d() {
    if (!istrue(level.var_9a38550ff75ec240)) {
        for (i = level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1; i >= 0; i--) {
            level.var_cc52ce7c03341fc0.circles[i] function_af5604ce591768e1();
        }
        level.var_9a38550ff75ec240 = 1;
        level notify("destroy_reveal_circle");
    }
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1936
// Size: 0x14c
function function_a0aa79a4e4dcfee9() {
    level endon("game_ended");
    level endon("destroy_reveal_circle");
    var_c16d261221d6a48d = level.var_cc52ce7c03341fc0.var_9005b102820c0d0 - 1;
    for (i = var_c16d261221d6a48d; i >= 0; i--) {
        questcircle = undefined;
        if (i == var_c16d261221d6a48d) {
            questcircle = "LootCase_Ob_Current";
        } else {
            questcircle = "LootCase_Ob";
        }
        level.var_cc52ce7c03341fc0.circles[i] function_6b6b6273f8180522(questcircle, level.var_cc52ce7c03341fc0.circles[i].origin, level.var_cc52ce7c03341fc0.circles[i].radius);
    }
    level.var_cc52ce7c03341fc0.circles[var_c16d261221d6a48d] function_6988310081de7b45();
    for (i = var_c16d261221d6a48d; i >= 1; i--) {
        level.var_cc52ce7c03341fc0.currentcircle = i;
        wait level.var_cc52ce7c03341fc0.stageduration;
        level.var_cc52ce7c03341fc0.circles[var_c16d261221d6a48d] function_363626dce45afb67();
    }
    level.var_cc52ce7c03341fc0.currentcircle = 0;
}

// Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x16c
function function_363626dce45afb67() {
    nextcircleindex = level.var_cc52ce7c03341fc0.currentcircle - 1;
    nextorigin = level.var_cc52ce7c03341fc0.circles[nextcircleindex].origin;
    nextradius = level.var_cc52ce7c03341fc0.circles[nextcircleindex].radius;
    starttime = gettime();
    endtime = starttime + level.var_cc52ce7c03341fc0.var_b8e42d65c59079d6 * 1000;
    startpos = self.mapcircle.origin;
    while (gettime() <= endtime && function_acaa75ca8754452e()) {
        ratio = (gettime() - starttime) / level.var_cc52ce7c03341fc0.var_b8e42d65c59079d6 * 1000;
        origin = (nextorigin - startpos) * ratio + startpos;
        radius = startpos[2] - (startpos[2] - nextradius) * ratio;
        self.mapcircle.origin = (origin[0], origin[1], radius);
        waitframe();
    }
    level.var_cc52ce7c03341fc0.circles[nextcircleindex] function_af5604ce591768e1();
}

/#

    // Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x1bfe
    // Size: 0x75
    function private function_6a7b9641a3a20e1f() {
        while (true) {
            if (!isdefined(level.players) || level.players.size <= 0) {
                waitframe();
                continue;
            }
            lootcase = getdvar(@"hash_7e92d2b1ebc5e8a6", "<dev string:x1c>");
            if (lootcase != "<dev string:x1c>") {
                setdvar(@"hash_7e92d2b1ebc5e8a6", "<dev string:x1c>");
                function_5fd72820a4dda765(lootcase);
            }
            waitframe();
        }
    }

    // Namespace namespace_e50a4d88616acbab / namespace_86a8fb37a1de0532
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x1c7b
    // Size: 0x58
    function private function_5fd72820a4dda765(lootcase) {
        mdl = spawnscriptable(lootcase, level.players[0].origin, level.players[0].angles);
        mdl.count = 1;
    }

#/
