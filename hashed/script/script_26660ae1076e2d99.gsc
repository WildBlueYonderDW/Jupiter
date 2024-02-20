// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3ff084f114b7f6c9;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_7ec8cc09ee373b76;

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0x79
function init() {
    if (!function_217e5c3b8a4ca539()) {
        return;
    }
    level.var_a2a63a71bca53ea8 = getdvarint(@"hash_7074068242015a8a", 2000);
    level.var_d4e0758bcddaa616 = getdvarint(@"hash_42c837f8d33c4cd5", 10);
    level.var_c18a1304b5bac209 = getdvarint(@"hash_b3270a4d9d7c32d1", 0);
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::function_f3d757808130bac4(&function_3cd64058b039543d);
    }
    /#
        level thread function_85816e9363c64afc();
    #/
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0x32
function function_217e5c3b8a4ca539() {
    if (!isdefined(level.var_7481c0699a7c035c)) {
        level.var_fe9dbc325d2d5e3f = getdvarint(@"hash_702af82bfbfd306a", 1);
    }
    return level.var_fe9dbc325d2d5e3f;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0x258
function function_4647cbf23f54d6f6(player, overridesettings) {
    player.var_29c1a6fd6998cb44 = 1;
    var_cc75e0b74ee84d57 = function_563873982a6bc459(player, overridesettings);
    var_20f2949fd51737dd = function_55731d4969878ef(player);
    if (isdefined(var_20f2949fd51737dd)) {
        if (var_20f2949fd51737dd.priority >= var_cc75e0b74ee84d57.priority) {
            player.var_e2c78227fb084c4[player.var_e2c78227fb084c4.size] = var_cc75e0b74ee84d57;
            player.var_e2c78227fb084c4 = array_removeundefined(player.var_e2c78227fb084c4);
            if (player.var_e2c78227fb084c4.size > 1) {
                player.var_e2c78227fb084c4 = array_sort_with_func(player.var_e2c78227fb084c4, &function_cc061dfab17dd15b);
            }
            level thread function_38fbd8f15ede0c59(var_cc75e0b74ee84d57);
            level thread function_d718b6ff11577e22(var_cc75e0b74ee84d57);
            level thread [[ var_cc75e0b74ee84d57.var_7073a47db2f80848 ]](var_cc75e0b74ee84d57);
            return var_cc75e0b74ee84d57;
        } else {
            var_20f2949fd51737dd notify("hide_bounty");
            var_20f2949fd51737dd notify("moniter_bounty_prox");
        }
    }
    if (var_cc75e0b74ee84d57.var_d66266e27481ace9 == 2 || var_cc75e0b74ee84d57.var_40ca706da5962314 == 2) {
        var_cc75e0b74ee84d57.headicon = addheadicon(player, var_cc75e0b74ee84d57);
    }
    if (var_cc75e0b74ee84d57.var_d66266e27481ace9 == 1 || var_cc75e0b74ee84d57.var_40ca706da5962314 == 1) {
        var_cc75e0b74ee84d57.var_43873940161b7f28 = function_48da443b1b3fc62f(player, var_cc75e0b74ee84d57);
    }
    if (!isdefined(var_cc75e0b74ee84d57.var_43873940161b7f28) && !isdefined(var_cc75e0b74ee84d57.headicon)) {
        return;
    }
    if (!isdefined(player.var_e2c78227fb084c4)) {
        player.var_e2c78227fb084c4 = [];
    }
    player.var_e2c78227fb084c4[player.var_e2c78227fb084c4.size] = var_cc75e0b74ee84d57;
    player.var_e2c78227fb084c4 = array_removeundefined(player.var_e2c78227fb084c4);
    if (player.var_e2c78227fb084c4.size > 1) {
        player.var_e2c78227fb084c4 = array_sort_with_func(player.var_e2c78227fb084c4, &function_cc061dfab17dd15b);
    }
    level thread function_38fbd8f15ede0c59(var_cc75e0b74ee84d57);
    level thread function_d718b6ff11577e22(var_cc75e0b74ee84d57);
    level thread [[ var_cc75e0b74ee84d57.var_7073a47db2f80848 ]](var_cc75e0b74ee84d57);
    level thread [[ var_cc75e0b74ee84d57.var_9148147953f797e2 ]](var_cc75e0b74ee84d57);
    return var_cc75e0b74ee84d57;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a4
// Size: 0x1de
function function_a10c4276271c4ad7(var_cc75e0b74ee84d57, success, context) {
    var_cc75e0b74ee84d57.success = istrue(success);
    var_cc75e0b74ee84d57.context = context;
    [[ var_cc75e0b74ee84d57.var_88c5361db8dbceac ]](var_cc75e0b74ee84d57);
    if (isdefined(var_cc75e0b74ee84d57.player)) {
        if (var_cc75e0b74ee84d57.player.var_5d4efada59c61b13.size > 0) {
            foreach (player in var_cc75e0b74ee84d57.player.var_5d4efada59c61b13) {
                var_cc75e0b74ee84d57.player function_39fc3f494dfd7847(var_cc75e0b74ee84d57, player);
            }
        }
        var_b57efde15223f363 = undefined;
        foreach (index, bounty in var_cc75e0b74ee84d57.player.var_e2c78227fb084c4) {
            var_b57efde15223f363 = index;
            break;
        }
        var_cc75e0b74ee84d57.player.var_e2c78227fb084c4[var_b57efde15223f363] = undefined;
        var_cc75e0b74ee84d57.player.var_e2c78227fb084c4 = array_removeundefined(var_cc75e0b74ee84d57.player.var_e2c78227fb084c4);
        var_cc75e0b74ee84d57.player.var_29c1a6fd6998cb44 = var_cc75e0b74ee84d57.player.var_e2c78227fb084c4.size > 0;
        function_c5bd28487bd61e1f(var_cc75e0b74ee84d57.player);
    }
    var_cc75e0b74ee84d57 notify("bounty_end");
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x689
// Size: 0x46
function function_55731d4969878ef(player) {
    if (!function_bc09557189d65e55(player)) {
        return undefined;
    }
    if (!isdefined(player.var_e2c78227fb084c4)) {
        return undefined;
    }
    var_42b1385d8ff43c70 = array_get_first_item(player.var_e2c78227fb084c4);
    return var_42b1385d8ff43c70;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d7
// Size: 0x18
function function_bc09557189d65e55(player) {
    return istrue(player.var_29c1a6fd6998cb44);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7
// Size: 0x97
function function_d34ea2b5e8f5d93(team) {
    if (!function_57736963a928db85(team)) {
        return [];
    }
    var_6f1f92bf14b2443 = [];
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (function_bc09557189d65e55(player)) {
            var_6f1f92bf14b2443[var_6f1f92bf14b2443.size] = function_55731d4969878ef(player);
        }
    }
    return var_6f1f92bf14b2443;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x796
// Size: 0x82
function function_57736963a928db85(team) {
    if (!isdefined(team)) {
        return 0;
    }
    players = getteamdata(team, "players");
    foreach (player in players) {
        if (istrue(player.var_29c1a6fd6998cb44)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x820
// Size: 0x101
function private function_c5bd28487bd61e1f(player) {
    if (!isdefined(player.var_e2c78227fb084c4)) {
        return;
    }
    if (player.var_e2c78227fb084c4.size <= 0) {
        return;
    }
    player.var_e2c78227fb084c4 = array_removeundefined(player.var_e2c78227fb084c4);
    player.var_e2c78227fb084c4 = array_sort_with_func(player.var_e2c78227fb084c4, &function_cc061dfab17dd15b);
    var_cc75e0b74ee84d57 = array_get_first_item(player.var_e2c78227fb084c4);
    if (var_cc75e0b74ee84d57.var_d66266e27481ace9 == 2 || var_cc75e0b74ee84d57.var_40ca706da5962314 == 2) {
        var_cc75e0b74ee84d57.headicon = addheadicon(player, var_cc75e0b74ee84d57);
    }
    if (var_cc75e0b74ee84d57.var_d66266e27481ace9 == 1 || var_cc75e0b74ee84d57.var_40ca706da5962314 == 1) {
        var_cc75e0b74ee84d57.var_43873940161b7f28 = function_48da443b1b3fc62f(player, var_cc75e0b74ee84d57);
    }
    level thread function_38fbd8f15ede0c59(var_cc75e0b74ee84d57);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x928
// Size: 0x2b
function private function_cc061dfab17dd15b(left, right) {
    return left.priority >= right.priority;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x102
function private addheadicon(player, var_cc75e0b74ee84d57) {
    var_49766086665362b9 = function_3ad2024fafe07c36(player, var_cc75e0b74ee84d57, 2);
    var_2a980ff198001875 = var_cc75e0b74ee84d57.var_a0c9c946b5c00006 > 0;
    if (var_2a980ff198001875) {
        var_cc75e0b74ee84d57.var_7591ed99e87a77d3 = player.origin;
    }
    headicon = player namespace_7bdde15c3500a23f::setheadicon_multiimage(var_49766086665362b9, var_cc75e0b74ee84d57.var_652d26f30484afe1, var_cc75e0b74ee84d57.var_652d26f30484afe1, var_cc75e0b74ee84d57.var_55e8f77e34baa3c2, undefined, 1, var_cc75e0b74ee84d57.var_c5409ca7522182b3, var_cc75e0b74ee84d57.var_30516b4afd1763de, undefined, 1, var_cc75e0b74ee84d57.var_b3ea37733a1577e5, var_cc75e0b74ee84d57.var_7591ed99e87a77d3, var_cc75e0b74ee84d57.showonminimap);
    setheadiconteam(headicon, player.team);
    function_ce9d0299637c2c24(headicon, 1);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(headicon, player);
    if (var_2a980ff198001875) {
        level thread function_82c32d2cb649e5e3(var_cc75e0b74ee84d57, var_49766086665362b9, headicon);
    }
    return headicon;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa65
// Size: 0x100
function private function_82c32d2cb649e5e3(var_cc75e0b74ee84d57, var_49766086665362b9, headicon) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 endon("bounty_end");
    player = var_cc75e0b74ee84d57.player;
    updatetime = var_cc75e0b74ee84d57.var_a0c9c946b5c00006;
    while (1) {
        wait(updatetime);
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(headicon);
        neworigin = player.origin;
        headicon = player namespace_7bdde15c3500a23f::setheadicon_multiimage(var_49766086665362b9, var_cc75e0b74ee84d57.var_652d26f30484afe1, var_cc75e0b74ee84d57.var_652d26f30484afe1, var_cc75e0b74ee84d57.var_55e8f77e34baa3c2, undefined, 1, var_cc75e0b74ee84d57.var_c5409ca7522182b3, var_cc75e0b74ee84d57.var_30516b4afd1763de, undefined, 1, var_cc75e0b74ee84d57.var_b3ea37733a1577e5, neworigin, var_cc75e0b74ee84d57.showonminimap);
        setheadiconteam(headicon, player.team);
        function_ce9d0299637c2c24(headicon, 1);
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(headicon, player);
    }
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb6c
// Size: 0x16b
function private function_48da443b1b3fc62f(player, var_cc75e0b74ee84d57) {
    var_43873940161b7f28 = function_ecb8c86061989935(player.origin, var_cc75e0b74ee84d57);
    var_43873940161b7f28.player = player;
    var_43873940161b7f28 namespace_36f464722d326bbe::function_6b6b6273f8180522(var_cc75e0b74ee84d57.var_e6f187bcb4b1648e, function_1e42c880ad18489e(var_43873940161b7f28.player.origin, var_cc75e0b74ee84d57.circleradius), var_cc75e0b74ee84d57.circleradius, player);
    var_43873940161b7f28 namespace_36f464722d326bbe::function_4eaf685bc40a3b9();
    foreach (otherplayer in level.players) {
        if (otherplayer == player) {
            continue;
        }
        if (otherplayer.team == player.team && var_cc75e0b74ee84d57.var_d66266e27481ace9 == 1) {
            var_43873940161b7f28 namespace_36f464722d326bbe::function_cfd53c8f6878014f(otherplayer);
        } else if (otherplayer.team != player.team && var_cc75e0b74ee84d57.var_40ca706da5962314 == 1) {
            var_43873940161b7f28 namespace_36f464722d326bbe::function_cfd53c8f6878014f(otherplayer);
        }
    }
    var_43873940161b7f28 namespace_36f464722d326bbe::function_d7d113d56ef0ef5b(player);
    var_43873940161b7f28 notify("stop_tracking");
    level thread function_dfe0992113030bd0(var_43873940161b7f28, var_cc75e0b74ee84d57);
    return var_43873940161b7f28;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcdf
// Size: 0x30c
function private function_563873982a6bc459(player, overridesettings) {
    if (!isdefined(overridesettings)) {
        overridesettings = spawnstruct();
    }
    var_cc75e0b74ee84d57 = spawnstruct();
    var_cc75e0b74ee84d57.player = player;
    var_cc75e0b74ee84d57.priority = function_53c4c53197386572(overridesettings.priority, 0);
    var_cc75e0b74ee84d57.var_d66266e27481ace9 = function_53c4c53197386572(overridesettings.var_d66266e27481ace9, 2);
    var_cc75e0b74ee84d57.var_40ca706da5962314 = function_53c4c53197386572(overridesettings.var_40ca706da5962314, 1);
    var_cc75e0b74ee84d57.var_cfcffc70799935ee = function_53c4c53197386572(overridesettings.var_cfcffc70799935ee, 0);
    var_cc75e0b74ee84d57.var_e6f187bcb4b1648e = function_53c4c53197386572(overridesettings.var_e6f187bcb4b1648e, "Hostage_Dmz");
    var_cc75e0b74ee84d57.var_d77771d6bfb89518 = function_53c4c53197386572(overridesettings.var_d77771d6bfb89518, "icon_skull_large");
    var_cc75e0b74ee84d57.circleradius = function_53c4c53197386572(overridesettings.circleradius, level.var_a2a63a71bca53ea8);
    var_cc75e0b74ee84d57.var_212406c9408b2d05 = function_53c4c53197386572(overridesettings.var_212406c9408b2d05, level.var_d4e0758bcddaa616);
    var_cc75e0b74ee84d57.var_c5409ca7522182b3 = function_53c4c53197386572(overridesettings.var_c5409ca7522182b3, 0);
    var_cc75e0b74ee84d57.var_30516b4afd1763de = function_53c4c53197386572(overridesettings.var_30516b4afd1763de, 500);
    var_cc75e0b74ee84d57.var_b3ea37733a1577e5 = function_53c4c53197386572(overridesettings.var_b3ea37733a1577e5, 0);
    var_cc75e0b74ee84d57.var_7591ed99e87a77d3 = overridesettings.var_7591ed99e87a77d3;
    var_cc75e0b74ee84d57.showonminimap = function_53c4c53197386572(overridesettings.showonminimap, 1);
    var_cc75e0b74ee84d57.var_55e8f77e34baa3c2 = function_53c4c53197386572(overridesettings.var_55e8f77e34baa3c2, "hud_icon_new_marked");
    var_cc75e0b74ee84d57.var_652d26f30484afe1 = function_53c4c53197386572(overridesettings.var_652d26f30484afe1, "hud_icon_new_marked");
    var_cc75e0b74ee84d57.var_a0c9c946b5c00006 = function_53c4c53197386572(overridesettings.var_a0c9c946b5c00006, level.var_c18a1304b5bac209);
    var_cc75e0b74ee84d57.var_9148147953f797e2 = function_53c4c53197386572(overridesettings.var_9148147953f797e2, &function_9a0cb7b36cf2f5a3);
    var_cc75e0b74ee84d57.var_9fccd0c71039eff7 = function_53c4c53197386572(overridesettings.var_9fccd0c71039eff7, &function_d13d0f1fa5d13556);
    var_cc75e0b74ee84d57.var_981fda4f385c05d5 = function_53c4c53197386572(overridesettings.var_981fda4f385c05d5, &function_acd85be28950f9f8);
    var_cc75e0b74ee84d57.var_88c5361db8dbceac = function_53c4c53197386572(overridesettings.var_88c5361db8dbceac, &function_612c88cb58973b43);
    var_cc75e0b74ee84d57.var_7073a47db2f80848 = function_53c4c53197386572(overridesettings.var_7073a47db2f80848, &function_6588e43fdfbdd2ad);
    var_cc75e0b74ee84d57.var_1e7fe7292618d1c5 = function_53c4c53197386572(overridesettings.var_1e7fe7292618d1c5, 0);
    return var_cc75e0b74ee84d57;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xff3
// Size: 0x177
function private function_ecb8c86061989935(origin, var_cc75e0b74ee84d57) {
    var_43873940161b7f28 = spawnstruct();
    var_43873940161b7f28.curorigin = origin;
    var_43873940161b7f28.offset3d = (0, 0, 100);
    var_43873940161b7f28 namespace_19b4203b51d56488::requestid(1, var_cc75e0b74ee84d57.var_cfcffc70799935ee, undefined, 1, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(var_43873940161b7f28.objidnum, var_cc75e0b74ee84d57.var_d77771d6bfb89518);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(var_43873940161b7f28.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(var_43873940161b7f28.objidnum, 100);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(var_43873940161b7f28.objidnum, var_cc75e0b74ee84d57.player.team);
    namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(var_43873940161b7f28.objidnum);
    var_72b01890612ddd21 = function_3ad2024fafe07c36(var_cc75e0b74ee84d57.player, var_cc75e0b74ee84d57, 1);
    foreach (team in var_72b01890612ddd21) {
        namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(var_43873940161b7f28.objidnum, team);
    }
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_43873940161b7f28.objidnum, var_cc75e0b74ee84d57.player);
    return var_43873940161b7f28;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1172
// Size: 0x37
function private function_1e42c880ad18489e(origin, radius) {
    point = function_d553466cf817a4da();
    point = (point[0] * radius, point[1] * radius, 0);
    return point + origin;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11b1
// Size: 0x78
function private function_3aa3f81e3a787e9f(var_43873940161b7f28, player, var_cc75e0b74ee84d57) {
    origin = function_1e42c880ad18489e(player.origin, var_cc75e0b74ee84d57.circleradius);
    origin = origin + (0, 0, player.origin[2] + 750);
    namespace_5a22b6f3a56f7e9b::update_objective_position(var_43873940161b7f28.objidnum, origin);
    var_43873940161b7f28 namespace_36f464722d326bbe::function_6e148c8da2e4db13(origin);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1230
// Size: 0xb0
function private function_dfe0992113030bd0(var_43873940161b7f28, var_cc75e0b74ee84d57) {
    var_43873940161b7f28 endon("stop_tracking");
    var_43873940161b7f28.player endon("death_or_disconnect");
    var_43873940161b7f28.player endon("enter_live_ragdoll");
    var_cc75e0b74ee84d57 endon("bounty_end");
    level endon("game_ended");
    while (1) {
        if (isdefined(var_43873940161b7f28.player) && isdefined(var_43873940161b7f28.player.origin)) {
            function_3aa3f81e3a787e9f(var_43873940161b7f28, var_43873940161b7f28.player, var_cc75e0b74ee84d57);
        }
        if (var_cc75e0b74ee84d57.var_212406c9408b2d05 <= 0) {
            waitframe();
        } else {
            wait(var_cc75e0b74ee84d57.var_212406c9408b2d05);
        }
    }
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e7
// Size: 0xde
function private function_3ad2024fafe07c36(player, var_cc75e0b74ee84d57, var_ae45669996e6faa2) {
    var_8bb1cafdf95e6851 = var_cc75e0b74ee84d57.var_d66266e27481ace9 == var_ae45669996e6faa2;
    var_b54422ad7b4e5c2c = var_cc75e0b74ee84d57.var_40ca706da5962314 == var_ae45669996e6faa2;
    var_f5183c377b77eb83 = [];
    foreach (team in level.teamnamelist) {
        if (var_8bb1cafdf95e6851 && team == player.team) {
            var_f5183c377b77eb83[var_f5183c377b77eb83.size] = team;
        }
        if (var_b54422ad7b4e5c2c && team != player.team) {
            var_f5183c377b77eb83[var_f5183c377b77eb83.size] = team;
        }
    }
    return var_f5183c377b77eb83;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13cd
// Size: 0x226
function private function_9a0cb7b36cf2f5a3(var_cc75e0b74ee84d57) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 endon("bounty_end");
    var_cc75e0b74ee84d57 endon("moniter_bounty_prox");
    var_656fb6126134bf11 = var_cc75e0b74ee84d57.player;
    var_b758ec776888da7c = var_cc75e0b74ee84d57.circleradius;
    var_656fb6126134bf11.var_5d4efada59c61b13 = [];
    while (1) {
        var_3b87bf7a27309458 = var_656fb6126134bf11.origin;
        if (function_a794fcf9545f2062()) {
            var_38f56723a5f07a13 = function_b1eef70090b5b7b5(var_3b87bf7a27309458, var_b758ec776888da7c, function_869ccb4e3451b8c6([0:"etype_player"]));
        } else {
            partition = function_21a6a1c613b50a28(level.players, var_b758ec776888da7c);
            var_38f56723a5f07a13 = partition function_df633f460888a47(var_3b87bf7a27309458);
        }
        if (var_38f56723a5f07a13.size > 0) {
            if (var_656fb6126134bf11.var_5d4efada59c61b13.size > 0) {
                foreach (player in var_656fb6126134bf11.var_5d4efada59c61b13) {
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (!array_contains(var_38f56723a5f07a13, player)) {
                        var_656fb6126134bf11 function_39fc3f494dfd7847(var_cc75e0b74ee84d57, player);
                    }
                }
            }
            foreach (player in var_38f56723a5f07a13) {
                if (!isdefined(player)) {
                    continue;
                }
                if (player == var_656fb6126134bf11) {
                    continue;
                }
                var_656fb6126134bf11 function_9f2d2403c5359faf(var_cc75e0b74ee84d57, player);
            }
        } else if (var_656fb6126134bf11.var_5d4efada59c61b13.size > 0) {
            foreach (player in var_656fb6126134bf11.var_5d4efada59c61b13) {
                var_656fb6126134bf11 function_39fc3f494dfd7847(var_cc75e0b74ee84d57, player);
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15fa
// Size: 0x4f
function private function_9f2d2403c5359faf(var_cc75e0b74ee84d57, var_c17caed8c315b4a6) {
    if (array_contains(self.var_5d4efada59c61b13, var_c17caed8c315b4a6)) {
        return;
    }
    self [[ var_cc75e0b74ee84d57.var_9fccd0c71039eff7 ]](var_cc75e0b74ee84d57, var_c17caed8c315b4a6);
    self.var_5d4efada59c61b13[self.var_5d4efada59c61b13.size] = var_c17caed8c315b4a6;
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1650
// Size: 0x3e
function private function_d13d0f1fa5d13556(var_cc75e0b74ee84d57, var_c17caed8c315b4a6) {
    /#
        iprintlnbold("<unknown string>" + self.name + "<unknown string>" + var_c17caed8c315b4a6.name);
    #/
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1695
// Size: 0x3e
function private function_39fc3f494dfd7847(var_cc75e0b74ee84d57, var_81c4e06c9530f1cc) {
    self [[ var_cc75e0b74ee84d57.var_981fda4f385c05d5 ]](var_cc75e0b74ee84d57, var_81c4e06c9530f1cc);
    self.var_5d4efada59c61b13 = array_remove(self.var_5d4efada59c61b13, var_81c4e06c9530f1cc);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16da
// Size: 0x3e
function private function_acd85be28950f9f8(var_cc75e0b74ee84d57, var_81c4e06c9530f1cc) {
    /#
        iprintlnbold("<unknown string>" + self.name + "<unknown string>" + var_81c4e06c9530f1cc.name);
    #/
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x171f
// Size: 0x6d
function private function_612c88cb58973b43(var_cc75e0b74ee84d57) {
    /#
        var_cc75e0b74ee84d57.context = function_53c4c53197386572(var_cc75e0b74ee84d57.context, 0);
        if (istrue(var_cc75e0b74ee84d57.success)) {
            iprintlnbold("<unknown string>" + var_cc75e0b74ee84d57.context);
        } else {
            iprintlnbold("<unknown string>" + var_cc75e0b74ee84d57.context);
        }
    #/
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1793
// Size: 0x10d
function private function_6588e43fdfbdd2ad(var_cc75e0b74ee84d57) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 endon("bounty_end");
    var_cc75e0b74ee84d57.player waittill_any_5("death_or_disconnect", "enter_live_ragdoll", "successful_exfil", "map_to_map_warp");
    success = 0;
    if (!var_cc75e0b74ee84d57.player namespace_f8065cafc523dba5::_isalive()) {
        if (isdefined(var_cc75e0b74ee84d57.player.lastkilledby) && isdefined(var_cc75e0b74ee84d57.player.lastkilledby.team)) {
            var_cc75e0b74ee84d57.var_4eebf10183cb21f2 = var_cc75e0b74ee84d57.player.lastkilledby.team;
            var_cc75e0b74ee84d57.var_54920cbb1f92b9ea = var_cc75e0b74ee84d57.player.lastkilledby;
            success = 1;
        }
    }
    context = ter_op(success, 2, 3);
    function_a10c4276271c4ad7(var_cc75e0b74ee84d57, success, context);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18a7
// Size: 0x42
function private function_d718b6ff11577e22(var_cc75e0b74ee84d57) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 endon("bounty_end");
    if (var_cc75e0b74ee84d57.var_1e7fe7292618d1c5 <= 0) {
        return;
    }
    wait(var_cc75e0b74ee84d57.var_1e7fe7292618d1c5);
    function_a10c4276271c4ad7(var_cc75e0b74ee84d57, 0, 1);
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18f0
// Size: 0x96
function private function_38fbd8f15ede0c59(var_cc75e0b74ee84d57) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 waittill_any_2("bounty_end", "hide_bounty");
    if (isdefined(var_cc75e0b74ee84d57.headicon)) {
        var_cc75e0b74ee84d57.player namespace_7bdde15c3500a23f::setheadicon_deleteicon(var_cc75e0b74ee84d57.headicon);
    }
    if (isdefined(var_cc75e0b74ee84d57.var_43873940161b7f28)) {
        var_cc75e0b74ee84d57.var_43873940161b7f28 notify("stop_tracking");
        var_cc75e0b74ee84d57.var_43873940161b7f28 namespace_19b4203b51d56488::releaseid();
        var_cc75e0b74ee84d57.var_43873940161b7f28 namespace_36f464722d326bbe::function_af5604ce591768e1();
    }
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x198d
// Size: 0x23d
function private function_3cd64058b039543d(player, oldteam, newteam) {
    var_f24642b09a1fc3df = function_d34ea2b5e8f5d93(newteam);
    var_aee6c716b9d9abe4 = function_d34ea2b5e8f5d93(oldteam);
    if (var_f24642b09a1fc3df.size == 0 && var_aee6c716b9d9abe4.size == 0) {
        return;
    }
    foreach (bounty in var_f24642b09a1fc3df) {
        if (bounty.player == player) {
            continue;
        }
        headicon = bounty.headicon;
        if (isdefined(headicon)) {
            if (bounty.var_d66266e27481ace9 == 2) {
                namespace_7bdde15c3500a23f::setheadicon_addclienttomask(headicon, player);
            } else if (bounty.var_40ca706da5962314 == 2) {
                namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(headicon, player);
            }
        }
        circle = bounty.var_43873940161b7f28;
        if (isdefined(circle)) {
            if (bounty.var_d66266e27481ace9 == 1) {
                circle namespace_36f464722d326bbe::function_cfd53c8f6878014f(player);
            } else if (bounty.var_40ca706da5962314 == 1) {
                circle namespace_36f464722d326bbe::function_d7d113d56ef0ef5b(player);
            }
        }
    }
    foreach (bounty in var_aee6c716b9d9abe4) {
        if (bounty.player == player) {
            continue;
        }
        headicon = bounty.headicon;
        if (isdefined(headicon)) {
            if (bounty.var_40ca706da5962314 == 2) {
                namespace_7bdde15c3500a23f::setheadicon_addclienttomask(headicon, player);
            } else if (bounty.var_d66266e27481ace9 == 2) {
                namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(headicon, player);
            }
        }
        circle = bounty.var_43873940161b7f28;
        if (isdefined(circle)) {
            if (bounty.var_40ca706da5962314 == 1) {
                circle namespace_36f464722d326bbe::function_cfd53c8f6878014f(player);
            } else if (bounty.var_d66266e27481ace9 == 1) {
                circle namespace_36f464722d326bbe::function_d7d113d56ef0ef5b(player);
            }
        }
    }
}

// Namespace namespace_7ec8cc09ee373b76/namespace_8042e17e26cb2c7f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1bd1
// Size: 0x1de
function private function_85816e9363c64afc() {
    /#
        level endon("<unknown string>");
        level waittill("<unknown string>");
        while (1) {
            command = getdvar(@"hash_a42341ed9ee97770", "<unknown string>");
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (!isdefined(host)) {
                waitframe();
                continue;
            }
            var_b9f4f3092e5e6e9b = undefined;
            enemyplayer = undefined;
            foreach (player in level.players) {
                if (player.team == host.team && player != host && !isdefined(var_b9f4f3092e5e6e9b)) {
                    var_b9f4f3092e5e6e9b = player;
                } else if (player.team != host.team && !isdefined(enemyplayer)) {
                    enemyplayer = player;
                }
            }
            switch (command) {
            case #"hash_e4c599d868b9bce9":
                overridesettings = spawnstruct();
                overridesettings.priority = 999;
                function_4647cbf23f54d6f6(enemyplayer, overridesettings);
                break;
            case #"hash_523c10141e531855":
                overridesettings = spawnstruct();
                overridesettings.priority = 999;
                overridesettings.var_1e7fe7292618d1c5 = 10;
                function_4647cbf23f54d6f6(enemyplayer, overridesettings);
                break;
            case #"hash_7b505a051b5cf29c":
                var_20f2949fd51737dd = function_55731d4969878ef(enemyplayer);
                if (isdefined(var_20f2949fd51737dd)) {
                    function_a10c4276271c4ad7(var_20f2949fd51737dd, 0, 0);
                }
                break;
            default:
                break;
            }
            setdvar(@"hash_a42341ed9ee97770", "<unknown string>");
            waitframe();
        }
    #/
}

