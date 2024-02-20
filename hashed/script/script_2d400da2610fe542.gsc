// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\scriptable_door.gsc;
#using script_3e2f8cc477d57433;
#using script_600b944a95c3a7bf;
#using script_3314add7998ab13;
#using script_744cad313ed0a87e;
#using scripts\mp\utility\points.gsc;
#using script_2d9d24f7c63ac143;
#using script_57d3850a12cf1d8f;
#using scripts\mp\utility\debug.gsc;
#using script_4c770a9a4ad7659c;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_9e69d66f68c38a10;

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e2
// Size: 0x212
function init() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    precachestring("MP_DMZ_LOCKS/LOCKED_FORTRESS");
    precachestring("MP_DMZ_LOCKS/STUCK");
    precachestring("MP_DMZ_LOCKS/LOCKED_TESTUNIQUEDOOR");
    precachestring("MP_DMZ_LOCKS/LOCKED");
    precachestring("MP_DMZ_LOCKS/LOCKED_FORT_BARRACK1");
    precachestring("MP_DMZ_LOCKS/LOCKED_ANTIQUITIES_OFFICE");
    precachestring("MP_DMZ_LOCKS/LOCKED_MUNITIONS_STORAGE");
    precachestring("MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS1");
    precachestring("MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS2");
    precachestring("MP_DMZ_LOCKS/LOCKED_QUIET_BEDROOM");
    precachestring("JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_ALLFORONE");
    precachestring("JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_CHEMIST");
    precachestring("JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_MAESTRO");
    precachestring("JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_RAINMAKER");
    precachestring("JUP_OB_ITEM_GENERICS/HUMAN_STRONGHOLD_LOCKED");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FORTRESS");
    precachestring("MP_DMZ_LOCKS/UNLOCK_TESTUNIQUEDOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DOOR");
    precachestring("MP_DMZ_LOCKS/UNLOCK_DEADBOLT");
    precachestring("MP_DMZ_MISSIONS/TRAP_DOOR_UNLOCK");
    precachestring("MP_DMZ_LOCKS/UNLOCK_FORT_BARRACK1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_ANTIQUITIES_OFFICE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_MUNITIONS_STORAGE");
    precachestring("MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS1");
    precachestring("MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS2");
    precachestring("MP_DMZ_LOCKS/UNLOCK_QUIET_BEDROOM");
    precachestring("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_ALLFORONE");
    precachestring("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_CHEMIST");
    precachestring("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_MAESTRO");
    precachestring("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_RAINMAKER");
    precachestring("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_STRONGHOLD");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_lock", &function_2166c547b0d38235);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("maphint_lock_interior", &function_ee4e77bc15da5eae);
    namespace_7ee767bbb40971f1::function_29ba88e5ce21f3fd(&function_6416fb9a24d278b4);
    namespace_7ee767bbb40971f1::function_e37078f3d00ef312(&function_504f19b32802cb8d);
    namespace_7ee767bbb40971f1::function_87d7be37d61cbae3(&function_20381c7b081c3f54);
    function_20466dfc92ecf1a9();
    function_fad5181703a528ee();
    function_b35796a7c0a71079();
    if (getdvarint(@"hash_3260888995a11bf7", 0) != 1) {
        function_3e0f1ceeb525c408();
    }
    function_e6df49dda3f9a00e();
    function_af0108718cddff00();
    level.var_ab18903aa481fff2 = function_f159c10d5cf8f0b4("locked_space_volume", "script_noteworthy");
    /#
        level thread function_af458cfdaf8d86e4();
    #/
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2afb
// Size: 0x51
function function_fad5181703a528ee() {
    level.var_b33c035c483c2893 = [];
    level.var_b33c035c483c2893["onPickup"] = [];
    level.var_b33c035c483c2893["onDrop"] = [];
    level.var_b33c035c483c2893["onMatchStart"] = [];
    level.var_b33c035c483c2893["onExtract"] = [];
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b53
// Size: 0x51
function function_36b1968bfe78916b(var_b7e583d90618fed3) {
    var_342175a1b9f9067e = namespace_feea61bc660e9e0f::function_1b35b10884bd8d67();
    for (i = 0; i < var_342175a1b9f9067e; i++) {
        var_eeeae9defa0c1e95 = namespace_feea61bc660e9e0f::function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == var_b7e583d90618fed3) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bac
// Size: 0x195
function function_6416fb9a24d278b4(scriptable, player) {
    if (isdefined(scriptable.var_9bcdd0a1013cc2cb) && isdefined(scriptable.node)) {
        if (distance2dsquared(scriptable.var_9bcdd0a1013cc2cb, player.origin) < distance2dsquared(scriptable.node.origin, player.origin) && !isdefined(scriptable.var_707cd84a8924ef55)) {
            return "MP_DMZ_LOCKS/UNLOCK_DEADBOLT";
        }
    }
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        if (isdefined(level.var_a9e2544b9283299b)) {
            return "MP_DMZ_LOCKS/LOCKED";
        }
        var_ece2647396f544df = namespace_38b993c4618e76cd::function_a50b607d2500dda5("loot_key_" + scriptable.keyname);
        if (isdefined(scriptable.var_65513ad5397a67ef) && isdefined(player.var_65513ad5397a67ef) && scriptable.var_65513ad5397a67ef == player.var_65513ad5397a67ef) {
            if (isdefined(scriptable.var_af0662d6485d5d58)) {
                return function_54f0ba9ac5666aba(scriptable.var_af0662d6485d5d58);
            } else {
                return function_54f0ba9ac5666aba(scriptable.keyname);
            }
        } else if (isdefined(var_ece2647396f544df) && player function_36b1968bfe78916b(var_ece2647396f544df)) {
            return function_54f0ba9ac5666aba(scriptable.keyname);
        } else {
            return function_94f5e3929619c3d1(scriptable.keyname);
        }
    }
    return "MP_DMZ_LOCKS/LOCKED";
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d49
// Size: 0xdb
function function_e0e50ef00477deeb(scriptablename, player) {
    var_530052914d6c4a41 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename);
    if (isdefined(var_530052914d6c4a41) && player function_36b1968bfe78916b(var_530052914d6c4a41) && var_530052914d6c4a41 != 0) {
        return 1;
    }
    var_ad765bd3479a01a3 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename + "_used");
    if (isdefined(var_ad765bd3479a01a3) && player function_36b1968bfe78916b(var_ad765bd3479a01a3) && var_ad765bd3479a01a3 != 0) {
        return 1;
    }
    var_50d0db530b4b97d8 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename + "_worn");
    if (isdefined(var_50d0db530b4b97d8) && player function_36b1968bfe78916b(var_50d0db530b4b97d8) && var_50d0db530b4b97d8 != 0) {
        return 1;
    }
    var_86d89d15a9c45615 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename + "_worn_jup");
    if (isdefined(var_86d89d15a9c45615) && player function_36b1968bfe78916b(var_86d89d15a9c45615) && var_86d89d15a9c45615 != 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2c
// Size: 0x36c
function function_504f19b32802cb8d(scriptable, player, var_85e3240d30e184e7) {
    success = 0;
    deadbolt = 0;
    var_e25b47370653ded5 = isdefined(scriptable) && isdefined(scriptable.node);
    if (!istrue(var_e25b47370653ded5)) {
        return 0;
    }
    if (distance2dsquared(scriptable.var_9bcdd0a1013cc2cb, player.origin) < distance2dsquared(scriptable.node.origin, player.origin)) {
        success = 1;
        deadbolt = 1;
    }
    if (isdefined(scriptable.var_707cd84a8924ef55)) {
        success = 0;
        deadbolt = 0;
    }
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        if (scriptable.keyname == "TESTUNIQUEDOOR") {
            success = 1;
        }
        keyname = scriptable.keyname;
        var_6f3309b71ae22d94 = isdefined(scriptable.node.script_noteworthy) && (scriptable.node.script_noteworthy == "lockMe_interior" || scriptable.node.script_noteworthy == "lockme_interior");
        if (istrue(var_6f3309b71ae22d94)) {
            keyname = scriptable.keyname + "_interior";
        }
        if (function_e0e50ef00477deeb("loot_key_" + keyname, player)) {
            success = 1;
        } else if (isdefined(scriptable.fortress) && namespace_244fdc99ed0f5d2b::function_a2dcdcd112310e33(player.team, scriptable.fortress) && scriptable.keyname == "fortress") {
            success = 1;
        }
        var_6dd4fa9f46b16ce = isdefined(scriptable.fortress) && isdefined(scriptable.fortress.name) && istrue(level.var_be265257b0c58303);
        if (!istrue(deadbolt) && !istrue(var_6f3309b71ae22d94) && var_6dd4fa9f46b16ce) {
            tier = scriptable.fortress namespace_bd614c3c2275579a::function_b7a9796c95aa8e8d();
            if (isdefined(tier) && tier == "black") {
                success = function_ed2cf116dda82611(player, scriptable.fortress.var_63a517e15c8177bd, "loot_multi_key_fortress", level.var_ccbb1eb445b88cc0);
            }
        }
    }
    if (isdefined(scriptable.var_65513ad5397a67ef) && isdefined(player.var_65513ad5397a67ef) && scriptable.var_65513ad5397a67ef == player.var_65513ad5397a67ef) {
        success = 1;
    }
    if (istrue(var_85e3240d30e184e7)) {
        if (!success) {
            playsoundatpos(scriptable.node.origin, "mp_door_locked");
        } else if (istrue(deadbolt)) {
            playsoundatpos(scriptable.node.origin, "mp_door_unlock_deadbolt");
        } else {
            var_4b6e19255050c624 = "mp_door_unlock_key";
            if (isdefined(scriptable.var_1166203281bb91a5)) {
                var_4b6e19255050c624 = scriptable.var_1166203281bb91a5;
            }
            playsoundatpos(scriptable.node.origin, var_4b6e19255050c624);
        }
    }
    return success;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a0
// Size: 0x2aa
function function_87997fcee4a6e14c(scriptable, var_7be8aa86a10b27ea) {
    var_7ecbd4f07f6882d0 = getdvarint(@"hash_291ad74097993a0a", 1) == 1;
    var_ba03253452037335 = 0;
    var_124c1597fa6ff697 = 0;
    var_f2075bd612ae5ab7 = 0;
    players = [];
    players[players.size] = var_7be8aa86a10b27ea;
    if (issharedfuncdefined("squad_utility", "getSquadMembers")) {
        players = var_7be8aa86a10b27ea [[ getsharedfunc("squad_utility", "getSquadMembers") ]]();
    }
    if (isdefined(scriptable.fortress)) {
        var_124c1597fa6ff697 = !istrue(scriptable.fortress.var_732df8db084ab0c5);
        var_f2075bd612ae5ab7 = istrue(scriptable.fortress.var_732df8db084ab0c5);
        if (isdefined(scriptable.fortress.var_a1f47d5c26653165)) {
            if (!var_7ecbd4f07f6882d0) {
                var_243d9ea347100ef1 = 0;
                foreach (player in players) {
                    if (array_contains(scriptable.fortress.var_a1f47d5c26653165, player)) {
                        var_243d9ea347100ef1 = 1;
                        break;
                    }
                }
                if (!var_243d9ea347100ef1) {
                    scriptable.fortress.var_a1f47d5c26653165 = array_combine_unique(scriptable.fortress.var_a1f47d5c26653165, players);
                    var_ba03253452037335 = 1;
                }
            }
        } else {
            scriptable.fortress.var_a1f47d5c26653165 = [];
            scriptable.fortress.var_a1f47d5c26653165 = array_combine_unique(scriptable.fortress.var_a1f47d5c26653165, players);
            var_ba03253452037335 = 1;
        }
    } else {
        var_ba03253452037335 = 1;
    }
    if (!var_ba03253452037335) {
        return;
    }
    foreach (player in players) {
        if (!isdefined(player.var_bd3fcbfdeda97e97)) {
            player.var_bd3fcbfdeda97e97 = 0;
        }
        player.var_bd3fcbfdeda97e97++;
        if (var_f2075bd612ae5ab7) {
            player namespace_48a08c5037514e04::doScoreEvent(#"hash_f3613beae4483db1");
        } else if (var_124c1597fa6ff697) {
            player namespace_48a08c5037514e04::doScoreEvent(#"hash_584786512b068a29");
        } else {
            player namespace_48a08c5037514e04::doScoreEvent(#"hash_6c63c18261a7af97");
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3451
// Size: 0x11e
function function_7d321a63bc56c65c(var_b835958ce1825933, player) {
    var_86d89d15a9c45615 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_b835958ce1825933 + "_worn_jup");
    if (isdefined(var_86d89d15a9c45615) && player function_36b1968bfe78916b(var_86d89d15a9c45615) && var_86d89d15a9c45615 != 0) {
        return [0:var_b835958ce1825933 + "_worn_jup", 1:2];
    }
    var_50d0db530b4b97d8 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_b835958ce1825933 + "_worn");
    if (isdefined(var_50d0db530b4b97d8) && player function_36b1968bfe78916b(var_50d0db530b4b97d8) && var_50d0db530b4b97d8 != 0) {
        return [0:var_b835958ce1825933 + "_worn", 1:2];
    }
    var_ad765bd3479a01a3 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_b835958ce1825933 + "_used");
    if (isdefined(var_ad765bd3479a01a3) && player function_36b1968bfe78916b(var_ad765bd3479a01a3) && var_ad765bd3479a01a3 != 0) {
        return [0:var_b835958ce1825933 + "_used", 1:1];
    }
    var_530052914d6c4a41 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(var_b835958ce1825933);
    if (isdefined(var_530052914d6c4a41) && player function_36b1968bfe78916b(var_530052914d6c4a41) && var_530052914d6c4a41 != 0) {
        return [0:var_b835958ce1825933, 1:0];
    }
    return [0:undefined, 1:undefined];
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3577
// Size: 0xb5
function function_20381c7b081c3f54(scriptable, player) {
    if (isdefined(scriptable.var_5c493302b016b154)) {
        scriptable.var_5c493302b016b154 scriptabledoorfreeze(0);
    }
    if (isdefined(scriptable.var_def557e8fd5c6763)) {
        scriptable thread [[ scriptable.var_def557e8fd5c6763 ]](scriptable, player);
    }
    if (distance2dsquared(scriptable.var_9bcdd0a1013cc2cb, player.origin) > distance2dsquared(scriptable.node.origin, player.origin) || isdefined(scriptable.var_707cd84a8924ef55)) {
        player thread function_83f5cdc3d883507e(scriptable, player);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3633
// Size: 0x124
function function_83f5cdc3d883507e(scriptable, player) {
    player endon("death_or_disconnect");
    if (function_9ad38344b87727f4(scriptable)) {
        var_57ad0dc40b2fdda = function_7d321a63bc56c65c("loot_key_" + scriptable.keyname, player);
        var_2053e168b46caa6e = var_57ad0dc40b2fdda[1];
        scriptablename = var_57ad0dc40b2fdda[0];
        if (isdefined(scriptablename) && isdefined(var_2053e168b46caa6e)) {
            var_ece2647396f544df = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename);
            var_cf5bc3d609317cc3 = function_ed1aea6648bcdc28("loot_key_" + scriptable.keyname, var_2053e168b46caa6e);
            if (!isdefined(var_cf5bc3d609317cc3)) {
                soundorigin = scriptable.origin;
                wait(1);
                playsoundatpos(soundorigin, "mp_door_key_break");
                player namespace_feea61bc660e9e0f::function_181a584e4a68d5d6(var_ece2647396f544df);
            } else {
                index = player namespace_feea61bc660e9e0f::function_4776284a348ebb6a(var_ece2647396f544df);
                player namespace_feea61bc660e9e0f::function_ca3bbb1070436540(index, var_cf5bc3d609317cc3, 1);
            }
            function_87997fcee4a6e14c(scriptable, player);
        }
    }
    if (!function_9ad38344b87727f4(scriptable)) {
        function_87997fcee4a6e14c(scriptable, player);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x375e
// Size: 0x60
function private function_9ad38344b87727f4(scriptable) {
    if (isdefined(scriptable.keyname) && isstring(scriptable.keyname)) {
        return (!issubstr(scriptable.keyname, "fortress") && !issubstr(scriptable.keyname, "human_stronghold"));
    }
    return 0;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c6
// Size: 0x76
function function_ed2cf116dda82611(player, var_4e5a0b81aefb772f, keyname, teamkeys) {
    var_ece2647396f544df = namespace_38b993c4618e76cd::function_a50b607d2500dda5(keyname);
    keycount = 0;
    if (!isdefined(var_4e5a0b81aefb772f)) {
        return 0;
    }
    if (istrue(teamkeys)) {
        keycount = player namespace_aead94004cf4c147::function_ef5c7ec55e0e20ee(var_ece2647396f544df);
    } else {
        keycount = player namespace_aead94004cf4c147::function_93f02514431a1f5d(var_ece2647396f544df);
    }
    if (!isdefined(keycount)) {
        return 0;
    }
    if (keycount >= var_4e5a0b81aefb772f) {
        return 1;
    }
    return 0;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3844
// Size: 0x2b
function function_830809e6920e8bed(category, keyname, callback) {
    level.var_b33c035c483c2893[category][keyname] = callback;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3876
// Size: 0x10b
function function_1a037d5cd64dc892() {
    if (isdefined(level.var_f64c6ef6f688a407)) {
        return;
    }
    level.var_f64c6ef6f688a407 = [];
    keys = getarraykeys(level.struct_class_names["script_noteworthy"]);
    foreach (key in keys) {
        if (issubstr(tolower(key), "uniquedoor")) {
            foreach (node in level.struct_class_names["script_noteworthy"][key]) {
                level.var_f64c6ef6f688a407 = namespace_58dcf42cf567f34f::function_ad1b6accbaab404e(node, level.var_f64c6ef6f688a407, getsubstr(key, 11), 1);
            }
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3988
// Size: 0x7a
function private function_3e0f1ceeb525c408() {
    function_1a037d5cd64dc892();
    foreach (door in level.var_f64c6ef6f688a407) {
        if (istrue(door.var_3d9512b73bdc1514)) {
            door scriptabledoorfreeze(1);
        } else {
            function_fbbfe6f05eda5eb1(door);
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a09
// Size: 0x15
function function_fbbfe6f05eda5eb1(door) {
    door function_9af4c9b2cc1bf989(1);
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a25
// Size: 0x33
function function_b092780f9ec4496e(door) {
    door function_80902296b05be00a();
    if (isdefined(door.var_5c493302b016b154)) {
        door.var_5c493302b016b154 function_80902296b05be00a();
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a5f
// Size: 0x3d
function function_4327a2c68eef5db9(struct) {
    if (isdefined(struct.target)) {
        doors = getentitylessscriptablearray(struct.target, "targetname");
        return doors;
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa3
// Size: 0x42
function function_2166c547b0d38235(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread function_a95d35e420c6a968(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aec
// Size: 0x11b
function function_a95d35e420c6a968(instance, part, state, player, var_a5b2c541413aa895) {
    instance setscriptablepartstate("maphint_lock", "off");
    playsoundatpos(instance.origin, "emt_bunk_red_button_press");
    if (getdvarint(@"hash_5556498dffa596fb", 0) == 1 || player function_36b1968bfe78916b(instance.var_ece2647396f544df)) {
        playsoundatpos(instance.origin, "br_keypad_confirm");
        function_b092780f9ec4496e(instance.door);
        instance.var_624d966650b9ebcc setscriptablepartstate("maphint_lock_interior", "off");
        if (isdefined(instance.door.var_def557e8fd5c6763)) {
            [[ instance.door.var_def557e8fd5c6763 ]](instance.door, player);
        }
    } else {
        wait(1);
        instance setscriptablepartstate("maphint_lock", instance.keyname);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0e
// Size: 0x42
function function_ee4e77bc15da5eae(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread function_44017cc8b84b87ad(instance, part, state, player, var_a5b2c541413aa895);
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c57
// Size: 0xd6
function function_44017cc8b84b87ad(instance, part, state, player, var_a5b2c541413aa895) {
    instance setscriptablepartstate("maphint_lock_interior", "off");
    playsoundatpos(instance.origin, "emt_bunk_red_button_press");
    wait(1);
    playsoundatpos(instance.origin, "br_keypad_confirm");
    function_b092780f9ec4496e(instance.door);
    instance.var_d144ab8ac8538c8e setscriptablepartstate("maphint_lock", "off");
    if (isdefined(instance.door.var_def557e8fd5c6763)) {
        [[ instance.door.var_def557e8fd5c6763 ]](instance.door, player);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d34
// Size: 0x4bc
function function_ad1b6accbaab404e(node, var_fa9e859ca98dcdbf, keyname, var_ae2c4ed794036495, var_f1277f2577a53beb, var_d23fa479e1b4cae, var_6b76a7fbd80bc49b, var_46f10c379a78132a) {
    index = var_fa9e859ca98dcdbf.size;
    var_aa298d1ea65e8d98 = 75;
    var_6656dfa185b09b6f = 75;
    if (isdefined(var_6b76a7fbd80bc49b)) {
        var_aa298d1ea65e8d98 = var_6b76a7fbd80bc49b;
    }
    if (isdefined(var_46f10c379a78132a)) {
        var_6656dfa185b09b6f = var_46f10c379a78132a;
    }
    doors = function_c8805ad506766965(node.origin, var_aa298d1ea65e8d98, var_6656dfa185b09b6f, var_d23fa479e1b4cae);
    var_ce94cc5fd99b7443 = 0;
    foreach (door in doors) {
        if (isdefined(door.type) && issubstr(door.type, "invisible")) {
            var_ce94cc5fd99b7443 = 1;
            break;
        }
    }
    if (var_ce94cc5fd99b7443) {
        var_be7b958fdbf091c0 = [];
        foreach (door in doors) {
            if (isdefined(door.type) && issubstr(door.type, "invisible")) {
                if (istrue(var_f1277f2577a53beb)) {
                    continue;
                } else {
                    door setscriptablepartstate("door", "closed");
                    var_be7b958fdbf091c0[var_be7b958fdbf091c0.size] = door;
                }
            } else if (istrue(var_f1277f2577a53beb)) {
                var_be7b958fdbf091c0[var_be7b958fdbf091c0.size] = door;
            } else {
                door setscriptablepartstate("door", "invisible");
            }
        }
        doors = var_be7b958fdbf091c0;
    }
    if (doors.size == 2) {
        doors[0].var_5c493302b016b154 = doors[1];
        doors[1].var_3d9512b73bdc1514 = 1;
        /#
            if (getdvarint(@"hash_9c3d7b7ac76a359c", 0) == 1) {
                thread namespace_d028276791d9cff6::drawsphere(node.origin, var_aa298d1ea65e8d98, 900, (0, 1, 0));
                thread namespace_d028276791d9cff6::drawline(node.origin, doors[0].origin, 900, (0, 1, 0));
                thread namespace_d028276791d9cff6::drawline(node.origin, doors[1].origin, 900, (0, 0, 1));
            }
        #/
    }
    /#
        if (doors.size > 2) {
            println("JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_MAESTRO" + node.origin + "MP_DMZ_LOCKS/LOCKED_GRAVEYARD_HOUSE" + doors.size + "MP_DMZ_LOCKS/LOCKED_CELL_PHONE_SHOP" + var_aa298d1ea65e8d98 + "south_guard_shack" + var_6656dfa185b09b6f);
        }
    #/
    if (isdefined(doors)) {
        foreach (door in doors) {
            if (isdefined(door)) {
                /#
                    if (getdvarint(@"hash_9c3d7b7ac76a359c", 0) == 1) {
                        thread namespace_d028276791d9cff6::drawsphere(door.origin, 2.5, 900, (0, 0, 0));
                    }
                #/
                if (istrue(door.var_67535222a761bdc5) && !istrue(var_ae2c4ed794036495)) {
                    /#
                        println("MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM2" + door.origin);
                    #/
                    continue;
                }
                var_fa9e859ca98dcdbf[index] = door;
                var_fa9e859ca98dcdbf[index].keyname = keyname;
                var_fa9e859ca98dcdbf[index].var_9ccea499f9e1b693 = node.origin;
                var_fa9e859ca98dcdbf[index].node = node;
                if (istrue(var_ae2c4ed794036495)) {
                    var_fa9e859ca98dcdbf[index].var_67535222a761bdc5 = 1;
                }
                forward = anglestoforward(function_53c4c53197386572(node.angles, (0, 0, 0)));
                var_fa9e859ca98dcdbf[index].var_9bcdd0a1013cc2cb = door.var_9ccea499f9e1b693 - forward * 25;
                var_fa9e859ca98dcdbf[index].var_f87ce576cbf4518a = door.var_9ccea499f9e1b693 + forward * 60;
                if (getdvarint(@"hash_9c3d7b7ac76a359c", 0) == 1) {
                    thread namespace_d028276791d9cff6::drawline(node.origin, var_fa9e859ca98dcdbf[index].var_9bcdd0a1013cc2cb, 300, (1, 0, 0));
                }
            }
            index++;
        }
    }
    return var_fa9e859ca98dcdbf;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41f8
// Size: 0xf3
function function_c8805ad506766965(position, radius, var_88e380f714003a9, doors) {
    if (!isdefined(doors)) {
        doors = getentitylessscriptablearray(undefined, undefined, position, radius, "door");
    }
    var_e4850e5ef9d70a37 = [];
    foreach (door in doors) {
        if (!door scriptableisdoor()) {
            continue;
        }
        if (distance2dsquared(door.origin, position) < radius * radius) {
            if (isdefined(var_88e380f714003a9)) {
                heightdiff = abs(door.origin[2] - position[2]);
                if (heightdiff <= var_88e380f714003a9) {
                    var_e4850e5ef9d70a37[var_e4850e5ef9d70a37.size] = door;
                }
            } else {
                var_e4850e5ef9d70a37[var_e4850e5ef9d70a37.size] = door;
            }
        }
    }
    return var_e4850e5ef9d70a37;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f3
// Size: 0xfa
function function_e6df49dda3f9a00e() {
    level.var_7517e35a3da8aa2d = [];
    keys = getarraykeys(level.struct_class_names["targetname"]);
    foreach (key in keys) {
        if (issubstr(key, "uniqueBlocker")) {
            foreach (node in level.struct_class_names["targetname"][key]) {
                if (isdefined(node.script_noteworthy)) {
                    level.var_7517e35a3da8aa2d[level.var_7517e35a3da8aa2d.size] = node;
                }
            }
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f4
// Size: 0x92
function function_af0108718cddff00() {
    foreach (node in level.var_7517e35a3da8aa2d) {
        scriptable = spawnscriptable("fortress_scriptable_props", node.origin, node.angles);
        scriptable setscriptablepartstate("scriptable_prop", node.script_noteworthy);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448d
// Size: 0x1465
function function_20466dfc92ecf1a9() {
    level.var_24ce016bdb558839 = [];
    level.var_24ce016bdb558839["locked_no_key"] = [];
    level.var_24ce016bdb558839["locked_has_key"] = [];
    level.var_24ce016bdb558839["open"] = [];
    level.var_24ce016bdb558839["locked_no_key"]["fortress"] = "MP_DMZ_LOCKS/LOCKED_FORTRESS";
    level.var_24ce016bdb558839["locked_no_key"]["stuck"] = "MP_DMZ_LOCKS/STUCK";
    level.var_24ce016bdb558839["locked_no_key"]["testuniquedoor"] = "MP_DMZ_LOCKS/LOCKED_TESTUNIQUEDOOR";
    level.var_24ce016bdb558839["locked_no_key"]["quarry_storage"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_STORAGE";
    level.var_24ce016bdb558839["locked_no_key"]["quarry_control"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_CONTROL";
    level.var_24ce016bdb558839["locked_no_key"]["quarry_office"] = "MP_DMZ_LOCKS/LOCKED_QUARRY_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["hydro_storage"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_STORAGE";
    level.var_24ce016bdb558839["locked_no_key"]["hydro_apt"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_APT";
    level.var_24ce016bdb558839["locked_no_key"]["hydro_weapondrop"] = "MP_DMZ_LOCKS/LOCKED_HYDRO_WEAPONDROP";
    level.var_24ce016bdb558839["locked_no_key"]["hostage_door"] = "MP_DMZ_MISSIONS/LOCKED_HOSTAGE_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["trap"] = "MP_DMZ_LOCKS/LOCKED_FORTRESS";
    level.var_24ce016bdb558839["locked_no_key"]["trapper_door"] = "MP_DMZ_LOCKS/LOCKED_TRAPPER_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["resort_entrance"] = "MP_DMZ_LOCKS/LOCKED_RESORT_ENTRANCE";
    level.var_24ce016bdb558839["locked_no_key"]["firefighttest01"] = "MP_DMZ_LOCKS/LOCKED_FIREFIGHTTEST01";
    level.var_24ce016bdb558839["locked_no_key"]["biolab_door"] = "MP_DMZ_LOCKS/LOCKED";
    level.var_24ce016bdb558839["locked_no_key"]["high_security"] = "MP_BIO_LAB/CACHE_LOCKED_SECURITY_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["third_floor"] = "MP_BIO_LAB/CACHE_LOCKED_SECURITY_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["red_door"] = "MP_BIO_LAB/CACHE_LOCKED_RED_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["blue_door"] = "MP_BIO_LAB/CACHE_LOCKED_BLUE_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["green_door"] = "MP_BIO_LAB/CACHE_LOCKED_GREEN_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["black_door"] = "MP_BIO_LAB/CACHE_LOCKED_BLACK_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["gold_door"] = "MP_BIO_LAB/CACHE_LOCKED_GOLD_DOOR";
    level.var_24ce016bdb558839["locked_no_key"]["armory_room"] = "MP_BIO_LAB/CACHE_LOCKED_ARMORY_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["conference_room"] = "MP_DMZ_LOCKS/LOCKED_CONFERENCE_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["maintenance"] = "MP_DMZ_LOCKS/LOCKED_AIRPORT_MAINTENANCE";
    level.var_24ce016bdb558839["locked_no_key"]["undershack"] = "MP_DMZ_LOCKS/LOCKED_UNDERGROUND_SHACK";
    level.var_24ce016bdb558839["locked_no_key"]["cliffroom"] = "MP_DMZ_LOCKS/LOCKED_CLIFF_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["gravehouse"] = "MP_DMZ_LOCKS/LOCKED_GRAVEYARD_HOUSE";
    level.var_24ce016bdb558839["locked_no_key"]["poppyhome"] = "MP_DMZ_LOCKS/LOCKED_POPPY_HOME";
    level.var_24ce016bdb558839["locked_no_key"]["western_storage"] = "MP_DMZ_LOCKS/LOCKED_WESTERN_STORAGE";
    level.var_24ce016bdb558839["locked_no_key"]["mobile_office"] = "MP_DMZ_LOCKS/LOCKED_MOBILE_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["crane_building"] = "MP_DMZ_LOCKS/LOCKED_CRANE_BUILDING";
    level.var_24ce016bdb558839["locked_no_key"]["policestation"] = "MP_DMZ_LOCKS/LOCKED_POLICE_LOCKERROOM";
    level.var_24ce016bdb558839["locked_no_key"]["smugglers_warehouse"] = "MP_DMZ_LOCKS/LOCKED_SMUGGLERS_WAREHOUSE";
    level.var_24ce016bdb558839["locked_no_key"]["power_substation"] = "MP_DMZ_LOCKS/LOCKED_POWER_SUBSTATION";
    level.var_24ce016bdb558839["locked_no_key"]["cell_phone_shop"] = "MP_DMZ_LOCKS/LOCKED_CELL_PHONE_SHOP";
    level.var_24ce016bdb558839["locked_no_key"]["police_academy_barracks"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_BARRACKS";
    level.var_24ce016bdb558839["locked_no_key"]["police_lockerroom"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY_LOCKERROOM";
    level.var_24ce016bdb558839["locked_no_key"]["post_office"] = "MP_DMZ_LOCKS/LOCKED_POST_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["tv_station"] = "MP_DMZ_LOCKS/LOCKED_TV_STATION";
    level.var_24ce016bdb558839["locked_no_key"]["shopping_booth"] = "MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH";
    level.var_24ce016bdb558839["locked_no_key"]["apartment_closet"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET";
    level.var_24ce016bdb558839["locked_no_key"]["north_guard_shack"] = "MP_DMZ_LOCKS/LOCKED_NORTH_GUARD_SHACK";
    level.var_24ce016bdb558839["locked_no_key"]["south_guard_shack"] = "MP_DMZ_LOCKS/LOCKED_SOUTH_GUARD_SHACK";
    level.var_24ce016bdb558839["locked_no_key"]["fortbarrack1_rr"] = "MP_DMZ_LOCKS/LOCKED_FORT_BARRACK1";
    level.var_24ce016bdb558839["locked_no_key"]["antiquities_office_rr"] = "MP_DMZ_LOCKS/LOCKED_ANTIQUITIES_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["munitions_storage_rr"] = "MP_DMZ_LOCKS/LOCKED_MUNITIONS_STORAGE";
    level.var_24ce016bdb558839["locked_no_key"]["office_quarters1_rr"] = "MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS1";
    level.var_24ce016bdb558839["locked_no_key"]["office_quarters2"] = "MP_DMZ_LOCKS/LOCKED_OFFICEQUARTERS2";
    level.var_24ce016bdb558839["locked_no_key"]["quiet_bedroom_rr"] = "MP_DMZ_LOCKS/LOCKED_QUIET_BEDROOM";
    level.var_24ce016bdb558839["locked_no_key"]["car_shop"] = "MP_DMZ_LOCKS/LOCKED_AUTO_SHOP_SUNKEN";
    level.var_24ce016bdb558839["locked_no_key"]["server_room"] = "MP_DMZ_LOCKS/LOCKED_SERVER_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["sunken_top_office"] = "MP_DMZ_LOCKS/LOCKED_SUNKEN_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["sunken_2nd_office"] = "MP_DMZ_LOCKS/LOCKED_SUNKEN_SECOND_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["hotel_room1"] = "MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM1";
    level.var_24ce016bdb558839["locked_no_key"]["hotel_room2"] = "MP_DMZ_LOCKS/LOCKED_HOTEL_ROOM2";
    level.var_24ce016bdb558839["locked_no_key"]["dressing_room"] = "MP_DMZ_LOCKS/LOCKED_DRESSING_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["sec_camera_room"] = "MP_DMZ_LOCKS/LOCKED_SEC_CAMERA_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["gaming_room"] = "MP_DMZ_LOCKS/LOCKED_GAMING_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["fishing_shack"] = "MP_DMZ_LOCKS/LOCKED_FISH_SHACK";
    level.var_24ce016bdb558839["locked_no_key"]["mountain_top"] = "MP_DMZ_LOCKS/LOCKED_MOUNTAIN_TOP_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["spotters_view"] = "MP_DMZ_LOCKS/LOCKED_SPOTTERS_VIEW";
    level.var_24ce016bdb558839["locked_no_key"]["grocery_office"] = "MP_DMZ_LOCKS/LOCKED_GROCERY_OFFICE";
    level.var_24ce016bdb558839["locked_no_key"]["neigh_storage_room"] = "MP_DMZ_LOCKS/LOCKED_NEIGH_STORAGE_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["apartment_closet"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_CLOSET";
    level.var_24ce016bdb558839["locked_no_key"]["apartment_snipernest"] = "MP_DMZ_LOCKS/LOCKED_APARTMENT_SNIPERNEST";
    level.var_24ce016bdb558839["locked_no_key"]["destroyed_telescope"] = "MP_DMZ_LOCKS/LOCKED_DESTROYED_TELESCOPE";
    level.var_24ce016bdb558839["locked_no_key"]["groundskeepers"] = "MP_DMZ_LOCKS/LOCKED_GROUNDSKEEPERS";
    level.var_24ce016bdb558839["locked_no_key"]["lighthouse_room"] = "MP_DMZ_LOCKS/LOCKED_LIGHTHOUSE_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["safe_house"] = "MP_DMZ_LOCKS/LOCKED_SAFE_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["scientist_apartment"] = "MP_DMZ_LOCKS/LOCKED_SCIENTIST_APARTMENT";
    level.var_24ce016bdb558839["locked_no_key"]["secret_comms"] = "MP_DMZ_LOCKS/LOCKED_SECRET_COMMS";
    level.var_24ce016bdb558839["locked_no_key"]["shopping_booth"] = "MP_DMZ_LOCKS/LOCKED_SHOPPING_BOOTH";
    level.var_24ce016bdb558839["locked_no_key"]["sira_apartment"] = "MP_DMZ_LOCKS/LOCKED_SIRA_APARTMENT";
    level.var_24ce016bdb558839["locked_no_key"]["small_confer_room"] = "MP_DMZ_LOCKS/LOCKED_SMALL_CONFER_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["supply_rooms"] = "MP_DMZ_LOCKS/LOCKED_SUPPLY_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["tv_computer_room"] = "MP_DMZ_LOCKS/LOCKED_TV_COMPUTER_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["yumyum_burger"] = "MP_DMZ_LOCKS/LOCKED_YUM_BURGER";
    level.var_24ce016bdb558839["locked_no_key"]["interrogation_room"] = "MP_DMZ_LOCKS/LOCKED_INTERROGATION_ROOM";
    level.var_24ce016bdb558839["locked_no_key"]["control_tower"] = "MP_DMZ_LOCKS/LOCKED_CONTROL_TOWER";
    level.var_24ce016bdb558839["locked_no_key"]["civic_center"] = "MP_DMZ_LOCKS/LOCKED_CIVIC_CENTER";
    level.var_24ce016bdb558839["locked_no_key"]["sira_mall"] = "MP_DMZ_LOCKS/LOCKED_SIRA_MALL";
    level.var_24ce016bdb558839["locked_no_key"]["fort"] = "MP_DMZ_LOCKS/LOCKED_FORT";
    level.var_24ce016bdb558839["locked_no_key"]["exhume_warehouse"] = "MP_DMZ_LOCKS/LOCKED_EXHUME_WAREHOUSE";
    level.var_24ce016bdb558839["locked_no_key"]["post_office_stronghold"] = "MP_DMZ_LOCKS/LOCKED_POST_OFFICE_STRONGHOLD";
    level.var_24ce016bdb558839["locked_no_key"]["police_academy"] = "MP_DMZ_LOCKS/LOCKED_POLICE_ACADEMY";
    level.var_24ce016bdb558839["locked_no_key"]["embassy"] = "MP_DMZ_LOCKS/LOCKED_EMBASSY";
    level.var_24ce016bdb558839["locked_no_key"]["blacksite"] = "MP_DMZ_LOCKS/LOCKED_BLACKSITE";
    level.var_24ce016bdb558839["locked_no_key"]["br_fortress"] = "MP_DMZ_LOCKS/LOCKED_BR_FORTRESS";
    level.var_24ce016bdb558839["locked_no_key"]["human_fortress_rainmaker"] = "JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_RAINMAKER";
    level.var_24ce016bdb558839["locked_no_key"]["human_fortress_maestro"] = "JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_MAESTRO";
    level.var_24ce016bdb558839["locked_no_key"]["human_fortress_chemist"] = "JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_CHEMIST";
    level.var_24ce016bdb558839["locked_no_key"]["human_fortress_allforone"] = "JUP_OB_ITEM_GENERICS/HUMAN_FORTRESS_LOCKED_ALLFORONE";
    level.var_24ce016bdb558839["locked_no_key"]["human_stronghold"] = "JUP_OB_ITEM_GENERICS/HUMAN_STRONGHOLD_LOCKED";
    level.var_24ce016bdb558839["locked_no_key"]["vault"] = "JUP_OB_OBJECTIVES/VAULT_LOCKED";
    level.var_24ce016bdb558839["locked_no_key"]["military_fob"] = "MP_JUP_BIGMAP_LOCKS/MILITARY_FOB_LOCKED";
    level.var_24ce016bdb558839["locked_has_key"]["stuck"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["fortress"] = "MP_DMZ_LOCKS/UNLOCK_FORTRESS";
    level.var_24ce016bdb558839["locked_has_key"]["testuniquedoor"] = "MP_DMZ_LOCKS/UNLOCK_TESTUNIQUEDOOR";
    level.var_24ce016bdb558839["locked_has_key"]["quarry_storage"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_STORAGE";
    level.var_24ce016bdb558839["locked_has_key"]["quarry_control"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_CONTROL";
    level.var_24ce016bdb558839["locked_has_key"]["quarry_office"] = "MP_DMZ_LOCKS/UNLOCK_QUARRY_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["hydro_storage"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_STORAGE";
    level.var_24ce016bdb558839["locked_has_key"]["hydro_apt"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_APT";
    level.var_24ce016bdb558839["locked_has_key"]["hydro_weapondrop"] = "MP_DMZ_LOCKS/UNLOCK_HYDRO_WEAPONDROP";
    level.var_24ce016bdb558839["locked_has_key"]["hostage_door"] = "MP_DMZ_MISSIONS/UNLOCK_HOSTAGE_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["trap"] = "MP_DMZ_MISSIONS/TRAP_DOOR_UNLOCK";
    level.var_24ce016bdb558839["locked_has_key"]["trapper_door"] = "MP_DMZ_LOCKS/UNLOCK_TRAPPER_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["resort_entrance"] = "MP_DMZ_LOCKS/UNLOCK_RESORT_ENTRANCE";
    level.var_24ce016bdb558839["locked_has_key"]["firefighttest01"] = "MP_DMZ_LOCKS/UNLOCK_FIREFIGHTTEST01";
    level.var_24ce016bdb558839["locked_has_key"]["biolab_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["red_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["blue_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["green_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["black_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["gold_door"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["armory_room"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["third_floor"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["high_security"] = "MP_DMZ_LOCKS/UNLOCK_DOOR";
    level.var_24ce016bdb558839["locked_has_key"]["conference_room"] = "MP_DMZ_LOCKS/UNLOCK_CONFERENCE_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["maintenance"] = "MP_DMZ_LOCKS/UNLOCK_AIRPORT_MAINTENANCE";
    level.var_24ce016bdb558839["locked_has_key"]["undershack"] = "MP_DMZ_LOCKS/UNLOCK_UNDERGROUND_SHACK";
    level.var_24ce016bdb558839["locked_has_key"]["cliffroom"] = "MP_DMZ_LOCKS/UNLOCK_CLIFF_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["gravehouse"] = "MP_DMZ_LOCKS/UNLOCK_GRAVEYARD_HOUSE";
    level.var_24ce016bdb558839["locked_has_key"]["poppyhome"] = "MP_DMZ_LOCKS/UNLOCK_POPPY_HOME";
    level.var_24ce016bdb558839["locked_has_key"]["western_storage"] = "MP_DMZ_LOCKS/UNLOCK_WESTERN_STORAGE";
    level.var_24ce016bdb558839["locked_has_key"]["mobile_office"] = "MP_DMZ_LOCKS/UNLOCK_MOBILE_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["crane_building"] = "MP_DMZ_LOCKS/UNLOCK_CRANE_BUILDING";
    level.var_24ce016bdb558839["locked_has_key"]["policestation"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_LOCKERROOM";
    level.var_24ce016bdb558839["locked_has_key"]["smugglers_warehouse"] = "MP_DMZ_LOCKS/UNLOCK_SMUGGLERS_WAREHOUSE";
    level.var_24ce016bdb558839["locked_has_key"]["power_substation"] = "MP_DMZ_LOCKS/UNLOCK_POWER_SUBSTATION";
    level.var_24ce016bdb558839["locked_has_key"]["cell_phone_shop"] = "MP_DMZ_LOCKS/UNLOCK_CELL_PHONE_SHOP";
    level.var_24ce016bdb558839["locked_has_key"]["police_academy_barracks"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_BARRACKS";
    level.var_24ce016bdb558839["locked_has_key"]["police_lockerroom"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY_LOCKERROOM";
    level.var_24ce016bdb558839["locked_has_key"]["post_office"] = "MP_DMZ_LOCKS/UNLOCK_POST_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["tv_station"] = "MP_DMZ_LOCKS/UNLOCK_TV_STATION";
    level.var_24ce016bdb558839["locked_has_key"]["shopping_booth"] = "MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH";
    level.var_24ce016bdb558839["locked_has_key"]["apartment_closet"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET";
    level.var_24ce016bdb558839["locked_has_key"]["control_room"] = "MP_DMZ_LOCKS/UNLOCK_CONTROL_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["north_guard_shack"] = "MP_DMZ_LOCKS/UNLOCK_NORTH_GUARD_SHACK";
    level.var_24ce016bdb558839["locked_has_key"]["south_guard_shack"] = "MP_DMZ_LOCKS/UNLOCK_SOUTH_GUARD_SHACK1";
    level.var_24ce016bdb558839["locked_has_key"]["fortbarrack1_rr"] = "MP_DMZ_LOCKS/UNLOCK_FORT_BARRACK1";
    level.var_24ce016bdb558839["locked_has_key"]["antiquities_office_rr"] = "MP_DMZ_LOCKS/UNLOCK_ANTIQUITIES_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["munitions_storage_rr"] = "MP_DMZ_LOCKS/UNLOCK_MUNITIONS_STORAGE";
    level.var_24ce016bdb558839["locked_has_key"]["office_quarters1_rr"] = "MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS1";
    level.var_24ce016bdb558839["locked_has_key"]["office_quarters2"] = "MP_DMZ_LOCKS/UNLOCK_OFFICE_QUARTERS2";
    level.var_24ce016bdb558839["locked_has_key"]["quiet_bedroom_rr"] = "MP_DMZ_LOCKS/UNLOCK_QUIET_BEDROOM";
    level.var_24ce016bdb558839["locked_has_key"]["car_shop"] = "MP_DMZ_LOCKS/UNLOCK_AUTO_SHOP_SUNKEN";
    level.var_24ce016bdb558839["locked_has_key"]["server_room"] = "MP_DMZ_LOCKS/UNLOCK_SERVER_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["sunken_top_office"] = "MP_DMZ_LOCKS/UNLOCK_SUNKEN_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["sunken_2nd_office"] = "MP_DMZ_LOCKS/UNLOCK_SUNKEN_SECOND_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["hotel_room1"] = "MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM1";
    level.var_24ce016bdb558839["locked_has_key"]["hotel_room2"] = "MP_DMZ_LOCKS/UNLOCK_HOTEL_ROOM2";
    level.var_24ce016bdb558839["locked_has_key"]["dressing_room"] = "MP_DMZ_LOCKS/UNLOCK_DRESSING_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["sec_camera_room"] = "MP_DMZ_LOCKS/UNLOCK_SEC_CAMERA_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["gaming_room"] = "MP_DMZ_LOCKS/UNLOCK_GAMING_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["fishing_shack"] = "MP_DMZ_LOCKS/UNLOCK_FISH_SHACK";
    level.var_24ce016bdb558839["locked_has_key"]["mountain_top"] = "MP_DMZ_LOCKS/UNLOCK_MOUNTAIN_TOP_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["spotters_view"] = "MP_DMZ_LOCKS/UNLOCK_SPOTTERS_VIEW";
    level.var_24ce016bdb558839["locked_has_key"]["grocery_office"] = "MP_DMZ_LOCKS/UNLOCK_GROCERY_OFFICE";
    level.var_24ce016bdb558839["locked_has_key"]["neigh_storage_room"] = "MP_DMZ_LOCKS/UNLOCK_NEIGH_STORAGE_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["apartment_closet"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_CLOSET";
    level.var_24ce016bdb558839["locked_has_key"]["apartment_snipernest"] = "MP_DMZ_LOCKS/UNLOCK_APARTMENT_SNIPERNEST";
    level.var_24ce016bdb558839["locked_has_key"]["destroyed_telescope"] = "MP_DMZ_LOCKS/UNLOCK_DESTROYED_TELESCOPE";
    level.var_24ce016bdb558839["locked_has_key"]["groundskeepers"] = "MP_DMZ_LOCKS/UNLOCK_GROUNDSKEEPERS";
    level.var_24ce016bdb558839["locked_has_key"]["lighthouse_room"] = "MP_DMZ_LOCKS/UNLOCK_LIGHTHOUSE_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["safe_house"] = "MP_DMZ_LOCKS/UNLOCK_SAFE_HOUSE";
    level.var_24ce016bdb558839["locked_has_key"]["scientist_apartment"] = "MP_DMZ_LOCKS/UNLOCK_SCIENTIST_APARTMENT";
    level.var_24ce016bdb558839["locked_has_key"]["secret_comms"] = "MP_DMZ_LOCKS/UNLOCK_SECRET_COMMS";
    level.var_24ce016bdb558839["locked_has_key"]["shopping_booth"] = "MP_DMZ_LOCKS/UNLOCK_SHOPPING_BOOTH";
    level.var_24ce016bdb558839["locked_has_key"]["sira_apartment"] = "MP_DMZ_LOCKS/UNLOCK_SIRA_APARTMENT";
    level.var_24ce016bdb558839["locked_has_key"]["small_confer_room"] = "MP_DMZ_LOCKS/UNLOCK_SMALL_CONFER_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["supply_rooms"] = "MP_DMZ_LOCKS/UNLOCK_SUPPLY_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["tv_computer_room"] = "MP_DMZ_LOCKS/UNLOCK_TV_COMPUTER_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["yumyum_burger"] = "MP_DMZ_LOCKS/UNLOCK_YUM_BURGER";
    level.var_24ce016bdb558839["locked_has_key"]["interrogation_room"] = "MP_DMZ_LOCKS/UNLOCK_INTERROGATION_ROOM";
    level.var_24ce016bdb558839["locked_has_key"]["control_tower"] = "MP_DMZ_LOCKS/UNLOCK_CONTROL_TOWER";
    level.var_24ce016bdb558839["locked_has_key"]["civic_center"] = "MP_DMZ_LOCKS/UNLOCK_CIVIC_CENTER";
    level.var_24ce016bdb558839["locked_has_key"]["sira_mall"] = "MP_DMZ_LOCKS/UNLOCK_SIRA_MALL";
    level.var_24ce016bdb558839["locked_has_key"]["fort"] = "MP_DMZ_LOCKS/UNLOCK_FORT";
    level.var_24ce016bdb558839["locked_has_key"]["exhume_warehouse"] = "MP_DMZ_LOCKS/UNLOCK_EXHUME_WAREHOUSE";
    level.var_24ce016bdb558839["locked_has_key"]["post_office_stronghold"] = "MP_DMZ_LOCKS/UNLOCK_POST_OFFICE_STRONGHOLD";
    level.var_24ce016bdb558839["locked_has_key"]["police_academy"] = "MP_DMZ_LOCKS/UNLOCK_POLICE_ACADEMY";
    level.var_24ce016bdb558839["locked_has_key"]["embassy"] = "MP_DMZ_LOCKS/UNLOCK_EMBASSY";
    level.var_24ce016bdb558839["locked_has_key"]["blacksite"] = "MP_DMZ_LOCKS/UNLOCK_BLACKSITE";
    level.var_24ce016bdb558839["locked_has_key"]["human_fortress_rainmaker"] = "JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_RAINMAKER";
    level.var_24ce016bdb558839["locked_has_key"]["human_fortress_maestro"] = "JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_MAESTRO";
    level.var_24ce016bdb558839["locked_has_key"]["human_fortress_chemist"] = "JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_CHEMIST";
    level.var_24ce016bdb558839["locked_has_key"]["human_fortress_allforone"] = "JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_FORTRESS_ALLFORONE";
    level.var_24ce016bdb558839["locked_has_key"]["human_stronghold"] = "JUP_OB_ITEM_GENERICS/UNLOCK_HUMAN_STRONGHOLD";
    level.var_24ce016bdb558839["locked_has_key"]["vault"] = "JUP_OB_OBJECTIVES/VAULT_LOCKED";
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58f9
// Size: 0x4a
function function_94f5e3929619c3d1(var_6ec5749c5ce7657e) {
    string = level.var_24ce016bdb558839["locked_no_key"][tolower(var_6ec5749c5ce7657e)];
    if (!isdefined(string)) {
        string = level.var_24ce016bdb558839["locked_no_key"]["stuck"];
    }
    return string;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x594b
// Size: 0x4a
function function_54f0ba9ac5666aba(var_6ec5749c5ce7657e) {
    string = level.var_24ce016bdb558839["locked_has_key"][tolower(var_6ec5749c5ce7657e)];
    if (!isdefined(string)) {
        string = level.var_24ce016bdb558839["locked_has_key"]["stuck"];
    }
    return string;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x599d
// Size: 0x3f
function function_2a56c656879dbf63() {
    if (getdvarint(@"hash_5cb759b2fdb8657a", 1) == 0) {
        return;
    }
    utility::flag_wait("lockedspaces_create_script_initialized");
    function_8e1cbe18678d7fff();
    function_29e046251bdc472c();
    /#
        level thread function_ed06a4c85b7994a0();
    #/
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59e3
// Size: 0x9e
function function_29e046251bdc472c() {
    level.var_7ed6190e252d4ec8 = [];
    var_4c7bfe49f37e4faf = level.struct_class_names["script_noteworthy"]["lockedSpace"];
    if (!isdefined(var_4c7bfe49f37e4faf)) {
        return;
    }
    foreach (var_11f568bbcedebcf0 in var_4c7bfe49f37e4faf) {
        function_2039418022567d47(var_11f568bbcedebcf0);
        function_dcec5158a800e39d(var_11f568bbcedebcf0);
        level.var_7ed6190e252d4ec8[level.var_7ed6190e252d4ec8.size] = var_11f568bbcedebcf0;
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a88
// Size: 0x21c
function function_2039418022567d47(var_809fdff7726141bb) {
    nodes = array_combine(getstructarray(var_809fdff7726141bb.target, "targetname"), getentarray(var_809fdff7726141bb.target, "targetname"));
    var_809fdff7726141bb.var_e2cd8aa8b46d18ac = [];
    var_809fdff7726141bb.var_84b0ef6bddd2907a = [];
    var_809fdff7726141bb.var_3da7559f232a2ca9 = [];
    foreach (node in nodes) {
        if (!isdefined(node.angles)) {
            node.angles = (0, 0, 0);
        }
        if (!isdefined(node.script_noteworthy)) {
            continue;
        }
        switch (tolower(node.script_noteworthy)) {
        case #"hash_cd0ffa281c8e3a8":
            var_809fdff7726141bb.var_e2cd8aa8b46d18ac = function_ad1b6accbaab404e(node, var_809fdff7726141bb.var_e2cd8aa8b46d18ac, tolower(var_809fdff7726141bb.targetname), 0);
            break;
        case #"hash_a0a74a8a22d1d16":
            var_809fdff7726141bb.var_84b0ef6bddd2907a = function_ad1b6accbaab404e(node, var_809fdff7726141bb.var_84b0ef6bddd2907a, "stuck", 0);
            break;
        case #"hash_df8921e339df1f80":
            node.var_86740fa764ee2fdc = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        case #"hash_db521e4972a48a9d":
            node.var_4f94796425d65f79 = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        case #"hash_55425b6c36803a4c":
            node.var_82d45592d750d388 = 1;
            var_809fdff7726141bb.var_3da7559f232a2ca9[var_809fdff7726141bb.var_3da7559f232a2ca9.size] = node;
            break;
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cab
// Size: 0x1f2
function function_dcec5158a800e39d(var_7be3a4ca79d6d8e6, var_14dcea3d745e5b2b) {
    foreach (door in var_7be3a4ca79d6d8e6.var_e2cd8aa8b46d18ac) {
        function_fbbfe6f05eda5eb1(door);
        if (isdefined(var_14dcea3d745e5b2b)) {
            door.var_def557e8fd5c6763 = var_14dcea3d745e5b2b;
        } else {
            door.var_def557e8fd5c6763 = &function_bf5ad2061b782c3c;
        }
    }
    foreach (door in var_7be3a4ca79d6d8e6.var_84b0ef6bddd2907a) {
        function_fbbfe6f05eda5eb1(door);
    }
    scriptables = getentitylessscriptablearray(var_7be3a4ca79d6d8e6.target, "targetname", var_7be3a4ca79d6d8e6.origin, 3000);
    foreach (scriptable in scriptables) {
        if (isdefined(scriptable.classname) && issubstr(scriptable.classname, "scriptable_blocker")) {
            scriptable setscriptablepartstate("state", "visible");
        }
    }
    foreach (node in var_7be3a4ca79d6d8e6.var_3da7559f232a2ca9) {
        function_4c877fc54e2e6854(node, var_7be3a4ca79d6d8e6.targetname);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ea4
// Size: 0x67
function function_64332f29e2409e55(origin) {
    foreach (volume in level.var_ab18903aa481fff2) {
        if (ispointinvolume(origin, volume)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f13
// Size: 0x48
function function_bf5ad2061b782c3c(scriptable, player) {
    params = spawnstruct();
    params.scriptable = scriptable;
    player namespace_7f0bcee5d45a1dea::callback("ob_locked_space_unlocked", params);
    namespace_8361bad7391de074::function_1d1df26df05a6c8(scriptable, player);
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f62
// Size: 0xe2
function function_ed1aea6648bcdc28(scriptablename, var_2053e168b46caa6e) {
    /#
        assertex(isdefined(var_2053e168b46caa6e), "Key Level is undefined in scriptsmplocksandkeys::getLowerQualityKey");
    #/
    /#
        assertex(isdefined(scriptablename), "Scriptable name is undefined in scriptsmplocksandkeys::getLowerQualityKey");
    #/
    if (!isdefined(scriptablename) || !isdefined(var_2053e168b46caa6e)) {
        return undefined;
    }
    switch (var_2053e168b46caa6e) {
    case 0:
        var_f48a1fa8eddf2b4a = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename + "_used");
        /#
            assertex(isdefined(var_f48a1fa8eddf2b4a), "Lower quality key is not defined for: " + scriptablename);
        #/
        if (!isdefined(var_f48a1fa8eddf2b4a)) {
            return undefined;
        }
        return var_f48a1fa8eddf2b4a;
    case 1:
        var_f48a1fa8eddf2b4a = namespace_38b993c4618e76cd::function_a50b607d2500dda5(scriptablename + "_worn");
        /#
            assertex(isdefined(var_f48a1fa8eddf2b4a), "Lower quality key is not defined for: " + scriptablename + "_worn");
        #/
        if (!isdefined(var_f48a1fa8eddf2b4a)) {
            return undefined;
        }
        return var_f48a1fa8eddf2b4a;
    case 2:
        return undefined;
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x604b
// Size: 0xd5
function function_ed06a4c85b7994a0() {
    /#
        level endon("MP_DMZ_LOCKS/UNLOCK_SUNKEN_OFFICE");
        while (1) {
            if (getdvarint(@"hash_34766c6f7cda260e", 0) == 1) {
                foreach (var_809fdff7726141bb in level.var_7ed6190e252d4ec8) {
                    sphere(var_809fdff7726141bb.origin, 128, (0, 0, 1));
                    print3d(var_809fdff7726141bb.origin + (0, 0, 550), var_809fdff7726141bb.targetname, (1, 1, 1), 1, 2, 20);
                }
            }
            waitframe();
        }
    #/
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6127
// Size: 0x151
function function_8e1cbe18678d7fff() {
    if (getdvarint(@"hash_1e9f946374cb994b", 0)) {
        return;
    }
    var_5374a9df4582df00 = getdvar(@"hash_64ddcf029687ca8b", "mp/loot/br/dmz/lootset_custom_nodes.csv");
    level.var_3da7559f232a2ca9 = [];
    numrows = tablelookupgetnumrows(var_5374a9df4582df00);
    for (i = 0; istrue(i < numrows); i++) {
        var_49710df804bea4d0 = tablelookupbyrow(var_5374a9df4582df00, i, 0);
        if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
            level.var_3da7559f232a2ca9[var_49710df804bea4d0] = [];
        }
        var_f2e7ef56fb1a0b7c = tablelookupbyrow(var_5374a9df4582df00, i, 1);
        dropchance = int(tablelookupbyrow(var_5374a9df4582df00, i, 2));
        var_dcb6e2b7467a12fc = tablelookupbyrow(var_5374a9df4582df00, i, 3);
        var_b99b2114134fe248 = tablelookupbyrow(var_5374a9df4582df00, i, 4);
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][var_f2e7ef56fb1a0b7c] = spawnstruct();
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][var_f2e7ef56fb1a0b7c].dropchance = dropchance;
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][var_f2e7ef56fb1a0b7c].var_dcb6e2b7467a12fc = var_dcb6e2b7467a12fc;
        level.var_3da7559f232a2ca9[var_49710df804bea4d0][var_f2e7ef56fb1a0b7c].var_b99b2114134fe248 = var_b99b2114134fe248;
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x627f
// Size: 0xa8
function function_799a9ee634da2160(node) {
    if (!isdefined(node.classname) || !isent(node)) {
        return 0;
    }
    var_9f1cae7f3799988a = node isscriptable();
    var_4f94796425d65f79 = issubstr(node.classname, "note");
    if (istrue(var_4f94796425d65f79)) {
        node.var_4f94796425d65f79 = var_4f94796425d65f79;
    }
    var_82d45592d750d388 = issubstr(node.classname, "key");
    if (istrue(var_82d45592d750d388)) {
        node.var_82d45592d750d388 = var_4f94796425d65f79;
    }
    return var_9f1cae7f3799988a && (var_4f94796425d65f79 || var_82d45592d750d388);
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632f
// Size: 0x382
function function_4c877fc54e2e6854(node, var_49710df804bea4d0) {
    if (getdvarint(@"hash_1e9f946374cb994b", 0)) {
        return;
    }
    var_49710df804bea4d0 = tolower(var_49710df804bea4d0);
    if (istrue(node.var_82d45592d750d388)) {
        if (!function_e05f1f84bb69a4d2(var_49710df804bea4d0, "key")) {
            var_7fa45e159979fe3c = -1;
        } else {
            var_7fa45e159979fe3c = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].dropchance;
        }
        if (var_7fa45e159979fe3c == 0) {
            return;
        }
        roll = randomint(100);
        if (roll < var_7fa45e159979fe3c) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(node.origin, node.angles);
            var_58564a86a29587a4 = 0;
            keyname = "loot_key_fortress";
            var_dcb6e2b7467a12fc = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].var_dcb6e2b7467a12fc;
            if (isdefined(var_dcb6e2b7467a12fc) && var_dcb6e2b7467a12fc != "") {
                keyname = var_dcb6e2b7467a12fc;
                if (issubstr(keyname, "loot_key")) {
                    var_58564a86a29587a4 = 1;
                }
            }
            if (keyname == "tier1Key") {
                keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20);
            } else if (keyname == "tier2Key") {
                keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 1, 0, 0, 0, 1, 0, 0, 20, 60, 20);
            } else if (keyname == "tier3Key") {
                keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 1, 0, 0, 0, 1, 0, 20, 60, 20);
            } else if (keyname == "heroKey") {
                keyname = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20);
            }
            scriptable = namespace_cb965d2f71fefddc::spawnpickup(keyname, var_cb4fad49263e20c4, 1, 0);
            if (istrue(var_58564a86a29587a4)) {
                scriptable.var_bbc200bc77c5db2b = 1;
            }
        }
    } else if (istrue(node.var_4f94796425d65f79) || istrue(node.var_86740fa764ee2fdc)) {
        if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0]) || isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0]["noteAlreadyPlaced"])) {
            return;
        } else {
            level.var_3da7559f232a2ca9[var_49710df804bea4d0]["noteAlreadyPlaced"] = 1;
        }
        if (!function_e05f1f84bb69a4d2(var_49710df804bea4d0, "note")) {
            var_7fa45e159979fe3c = -1;
        } else {
            var_7fa45e159979fe3c = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["note"].dropchance;
        }
        if (var_7fa45e159979fe3c == 0) {
            return;
        }
        roll = randomint(100);
        if (roll < var_7fa45e159979fe3c) {
            var_6ef4fd3894a9f0a2 = level.var_3da7559f232a2ca9[var_49710df804bea4d0]["note"].var_dcb6e2b7467a12fc;
            if (!isdefined(var_6ef4fd3894a9f0a2) || var_6ef4fd3894a9f0a2 == "") {
                return;
            }
            offset = (0, 0, 0);
            if (istrue(node.var_86740fa764ee2fdc)) {
                if (issubstr(var_6ef4fd3894a9f0a2, "_note_")) {
                    offset = (-90, 0, 0);
                }
            } else if (istrue(node.var_4f94796425d65f79)) {
                if (issubstr(var_6ef4fd3894a9f0a2, "_notebook_")) {
                    offset = (90, 0, 0);
                }
            }
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(node.origin, node.angles + offset);
            scriptable = namespace_cb965d2f71fefddc::spawnpickup(var_6ef4fd3894a9f0a2, var_cb4fad49263e20c4, 1, 0);
            scriptable.var_bbc200bc77c5db2b = 1;
        }
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b8
// Size: 0x92
function function_e05f1f84bb69a4d2(var_49710df804bea4d0, itemtype) {
    if (!isdefined(var_49710df804bea4d0) || !isdefined(itemtype)) {
        return 0;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
        return 0;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"])) {
        return 0;
    }
    if (!isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].dropchance)) {
        return 0;
    }
    if (!isint(level.var_3da7559f232a2ca9[var_49710df804bea4d0]["key"].dropchance)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6752
// Size: 0x17e
function function_a894d6041798cc06() {
    function_a9d72a6ee70123e5();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("locked_cache_prompt", &function_38904bc3a49af40c);
    var_4cc04c6a9dbfd0ee = getstructarray("lockedCache", "targetname");
    foreach (var_2076a994e0e7c929 in var_4cc04c6a9dbfd0ee) {
        var_c54e8a88506815aa = getentitylessscriptablearray(undefined, undefined, var_2076a994e0e7c929.origin, 64, "body");
        if (!isdefined(var_c54e8a88506815aa)) {
            continue;
        }
        cache = var_c54e8a88506815aa[0];
        if (!isdefined(cache)) {
            continue;
        }
        cache setscriptablepartstate("body", "closed_locked");
        forward = anglestoforward(cache.angles);
        scriptable = spawnscriptable("locked_cache_prompt", var_2076a994e0e7c929.origin);
        scriptable setscriptablepartstate("locked_cache_prompt", "on");
        if (isdefined(var_2076a994e0e7c929.script_noteworthy)) {
            scriptable.keyname = var_2076a994e0e7c929.script_noteworthy;
        } else {
            scriptable.keyname = "generic";
        }
        scriptable.cache = cache;
        scriptable.var_4187e96fe413300e = 1;
        cache.var_3e5d613e6f4d92e3 = 1;
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d7
// Size: 0x3a4
function function_38904bc3a49af40c(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    var_44082b06f156465d = instance.keyname;
    if (instance.keyname == "firefightTestContainer") {
        var_44082b06f156465d = "gravesite_container";
    }
    if (!function_e0e50ef00477deeb("loot_key_" + var_44082b06f156465d, player)) {
        player namespace_44abc05161e2e2cb::showerrormessage(function_bd958525be466cd7(var_44082b06f156465d));
        if (istrue(instance.var_4187e96fe413300e)) {
            instance.var_4187e96fe413300e = 0;
            playsoundatpos(instance.origin, "mp_door_locked");
            return 0;
        }
        wait(3);
        instance.var_4187e96fe413300e = 1;
        return 0;
    }
    cache = instance.cache;
    player thread function_83f5cdc3d883507e(instance, player);
    playsoundatpos(instance.origin, "mp_door_unlock_key");
    var_a82e2128e25504dc = instance.keyname;
    instance freescriptable();
    wait(1);
    cache setscriptablepartstate("body", "closed_usable");
    items = getscriptablelootcachecontents(cache);
    cache.var_46a3a8565ac0c17c = 3;
    cache.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
    itemarray = function_b98c91e5697edb49(var_a82e2128e25504dc);
    foreach (index, item in itemarray) {
        var_ce27cbabe010181e = item.var_b99b2114134fe248;
        if (!isdefined(var_ce27cbabe010181e)) {
            continue;
        }
        if (array_contains(level.br_plunder.names, item.var_dcb6e2b7467a12fc)) {
            lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5("cash");
            var_7baf6f0eafe87a8 = 0;
            foreach (var_f90d0e006a1f717b, var_3466c10973e9c476 in level.br_plunder.names) {
                if (var_3466c10973e9c476 == item.var_dcb6e2b7467a12fc) {
                    var_7baf6f0eafe87a8 = var_f90d0e006a1f717b;
                    break;
                }
            }
            count = level.br_plunder.quantity[var_7baf6f0eafe87a8];
        } else {
            lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(item.var_dcb6e2b7467a12fc);
            if (istrue(level.var_a9350d89a2e4d752)) {
                count = "";
                if (isdefined(level.br_pickups.counts[item.var_dcb6e2b7467a12fc])) {
                    count = level.br_pickups.counts[item.var_dcb6e2b7467a12fc];
                }
            } else {
                count = tablelookup(level.brloottablename, 1, item.var_dcb6e2b7467a12fc, 4);
                if (count == "") {
                    count = tablelookup(level.brloottablename, 1, "brloot_" + item.var_dcb6e2b7467a12fc, 4);
                }
            }
        }
        cache.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(cache.contents, count, lootid, undefined, index);
    }
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c82
// Size: 0x1f0
function function_a9d72a6ee70123e5() {
    level.var_409396d5620deae8 = [];
    level.var_409396d5620deae8["fortress"] = "MP_DMZ_LOCKS/CACHE_LOCKED_FORTRESS";
    level.var_409396d5620deae8["airport_lounge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_AIRPORT_LOUNGE";
    level.var_409396d5620deae8["baggage_handling"] = "MP_DMZ_LOCKS/CACHE_LOCKED_BAGGAGE_HANDLING";
    level.var_409396d5620deae8["end_runway"] = "MP_DMZ_LOCKS/CACHE_LOCKED_END_RUNWAY";
    level.var_409396d5620deae8["caves_bench_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CAVES_BENCH_CONTAINER";
    level.var_409396d5620deae8["powerstation_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_POWERSUBSTATION_CONTAINER";
    level.var_409396d5620deae8["gravesite_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_GRAVESITE_CONTAINER";
    level.var_409396d5620deae8["waterpit_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_WATERPIT_CONTAINER";
    level.var_409396d5620deae8["underwater_ship"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERWATER_SHIP";
    level.var_409396d5620deae8["clocktower_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CLOCKTOWER_CONTAINER";
    level.var_409396d5620deae8["hydro_island_room"] = "MP_DMZ_LOCKS/CACHE_LOCKED_HYDRO_ISLAND_ROOM";
    level.var_409396d5620deae8["ship_bridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_BRIDGE";
    level.var_409396d5620deae8["ship_center"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_CENTER";
    level.var_409396d5620deae8["fishing_box_dock"] = "MP_DMZ_LOCKS/CACHE_LOCKED_FISHING_BOX_DOCK";
    level.var_409396d5620deae8["underthebridge"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERBRIDGE";
    level.var_409396d5620deae8["tower_hill"] = "MP_DMZ_LOCKS/CACHE_LOCKED_TOWER_HILL";
    level.var_409396d5620deae8["canal_uw_container"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CANAL_UW_CONTAINER";
    level.var_409396d5620deae8["hallway_locker"] = "MP_DMZ_LOCKS/CACHE_LOCKED_HALLWAY_LOCKER";
    level.var_409396d5620deae8["control_room"] = "MP_DMZ_LOCKS/CACHE_LOCKED_CONTROL_ROOM";
    level.var_409396d5620deae8["ship_above_water"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SHIP_ABOVE_WATER";
    level.var_409396d5620deae8["sunken_ship"] = "MP_DMZ_LOCKS/CACHE_LOCKED_SUNKEN_SHIP";
    level.var_409396d5620deae8["underground_passage"] = "MP_DMZ_LOCKS/CACHE_LOCKED_UNDERGROUND_PASSAGE";
    level.var_409396d5620deae8["police_locker"] = "MP_DMZ_LOCKS/CACHE_LOCKED_POLICE_LOCKER";
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e79
// Size: 0x39
function function_bd958525be466cd7(keyname) {
    var_b00cc25137fa2908 = level.var_409396d5620deae8[keyname];
    if (!isdefined(var_b00cc25137fa2908)) {
        var_b00cc25137fa2908 = level.var_409396d5620deae8["fortress"];
    }
    return var_b00cc25137fa2908;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6eba
// Size: 0x19b
function function_b98c91e5697edb49(var_49710df804bea4d0) {
    itemarray = [];
    if (isdefined(level.var_3da7559f232a2ca9[var_49710df804bea4d0])) {
        foreach (var_811f40234cd18f32 in level.var_3da7559f232a2ca9[var_49710df804bea4d0]) {
            if (var_811f40234cd18f32.var_dcb6e2b7467a12fc == "tier1Key") {
                var_811f40234cd18f32.var_dcb6e2b7467a12fc = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 20, 60, 20);
                itemarray[itemarray.size] = var_811f40234cd18f32;
            } else if (var_811f40234cd18f32.var_dcb6e2b7467a12fc == "tier2Key") {
                var_811f40234cd18f32.var_dcb6e2b7467a12fc = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 1, 0, 0, 0, 1, 0, 0, 20, 60, 20);
                itemarray[itemarray.size] = var_811f40234cd18f32;
            } else if (var_811f40234cd18f32.var_dcb6e2b7467a12fc == "tier3Key") {
                var_811f40234cd18f32.var_dcb6e2b7467a12fc = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 1, 0, 0, 0, 1, 0, 20, 60, 20);
                itemarray[itemarray.size] = var_811f40234cd18f32;
            } else if (var_811f40234cd18f32.var_dcb6e2b7467a12fc == "heroKey") {
                var_811f40234cd18f32.var_dcb6e2b7467a12fc = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(0, 0, 0, 1, 0, 0, 0, 1, 20, 60, 20);
                itemarray[itemarray.size] = var_811f40234cd18f32;
            } else {
                roll = randomint(100);
                if (roll < var_811f40234cd18f32.dropchance) {
                    itemarray[itemarray.size] = var_811f40234cd18f32;
                }
            }
        }
    }
    return itemarray;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705d
// Size: 0xb08
function function_b35796a7c0a71079() {
    level.var_f2e2b5ed406a7d94 = [];
    level.var_f2e2b5ed406a7d94[1] = [];
    level.var_f2e2b5ed406a7d94[2] = [];
    level.var_f2e2b5ed406a7d94[3] = [];
    level.var_f2e2b5ed406a7d94[4] = [];
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "hydro_storage";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "airport_lounge";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "baggage_handling";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "caves_bench_container";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "undershack";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "gravehouse";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "powerstation_container";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "gravesite_container";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "mobile_office";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "groundskeepers";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "clocktower_container";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "hydro_island_room";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "fishing_box_dock";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "supply_rooms";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "power_substation";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "cell_phone_shop";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "underthebridge";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "police_academy_barracks";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "tv_station";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "shopping_booth";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "yumyum_burger";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "tower_hill";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "canal_uw_container";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "small_confer_room";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "hallway_locker";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "north_guard_shack";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "south_guard_shack";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "fortbarrack1";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "office_quarters1";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "sunken_2nd_office";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "sira_apartment";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "gaming_room";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "fishing_shack";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "spotters_view";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "grocery_office";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "neigh_storage_room";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "crane_building";
    level.var_f2e2b5ed406a7d94[1][level.var_f2e2b5ed406a7d94[1].size] = "underwater_ship";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "hydro_apt";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "conference_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "end_runway";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "cliffroom";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "poppyhome";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "waterpit_container";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "lighthouse_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "ship_bridge";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "ship_center";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "policestation";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "smugglers_warehouse";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "interrogation_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "police_lockerroom";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "apartment_closet";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "tv_computer_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "destroyed_telescope";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "scientist_apartment";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "control_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "end_pyro_tunnel";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "munitions_storage";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "car_shop";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "sunken_top_office";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "hotel_room1";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "ship_above_water";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "dressing_room";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "apartment_snipernest";
    level.var_f2e2b5ed406a7d94[2][level.var_f2e2b5ed406a7d94[2].size] = "underground_passage";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "maintenance";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "safe_house";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "western_storage";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "secret_comms";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "post_office";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "antiquities_office";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "quiet_bedroom";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "server_room";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "hotel_room2";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "sunken_ship";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "sec_camera_room";
    level.var_f2e2b5ed406a7d94[3][level.var_f2e2b5ed406a7d94[3].size] = "mountain_top";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "civic_center";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "embassy";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "fort";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "sira_mall";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "resort_entrance";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "police_academy";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "post_office_stronghold";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "control_tower";
    level.var_f2e2b5ed406a7d94[4][level.var_f2e2b5ed406a7d94[4].size] = "exhume_warehouse";
    /#
    #/
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x7b6c
// Size: 0x2d6
function function_23326c8ac97c60c7(var_d259d727bba44656, var_fd055a27da9b626f, var_ec6a1127cda9e8c4, var_b12c0079f47946df, var_86a95353c7e4ee8, var_7ac6d26c235b0601, var_b8da46c98dad35fa, var_fc3e95c7096a9a71, var_d521671a5dc52db9, var_28140ffed2089170, var_26edae68004e6c83) {
    var_333b22fc26cbc11f = [];
    var_eb6f2e9e793e992e = 0;
    if (istrue(var_d259d727bba44656)) {
        if (isdefined(var_86a95353c7e4ee8)) {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_86a95353c7e4ee8;
            var_333b22fc26cbc11f[1] = var_86a95353c7e4ee8;
        } else {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + 1;
            var_333b22fc26cbc11f[1] = 1;
        }
    }
    if (istrue(var_fd055a27da9b626f)) {
        if (isdefined(var_7ac6d26c235b0601)) {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_7ac6d26c235b0601;
            var_333b22fc26cbc11f[2] = var_7ac6d26c235b0601;
        } else {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + 1;
            var_333b22fc26cbc11f[2] = 1;
        }
    }
    if (istrue(var_ec6a1127cda9e8c4)) {
        if (isdefined(var_7ac6d26c235b0601)) {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_b8da46c98dad35fa;
            var_333b22fc26cbc11f[3] = var_b8da46c98dad35fa;
        } else {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + 1;
            var_333b22fc26cbc11f[3] = 1;
        }
    }
    if (istrue(var_b12c0079f47946df)) {
        if (isdefined(var_fc3e95c7096a9a71)) {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + var_fc3e95c7096a9a71;
            var_333b22fc26cbc11f[4] = var_fc3e95c7096a9a71;
        } else {
            var_eb6f2e9e793e992e = var_eb6f2e9e793e992e + 1;
            var_333b22fc26cbc11f[4] = 1;
        }
    }
    roll = randomint(var_eb6f2e9e793e992e);
    var_db4d4d3dcae5375 = 0;
    var_390ae2320a151006 = undefined;
    foreach (tier, var_dbbec3cd4a60ca51 in var_333b22fc26cbc11f) {
        var_db4d4d3dcae5375 = var_db4d4d3dcae5375 + var_dbbec3cd4a60ca51;
        if (roll < var_db4d4d3dcae5375) {
            var_390ae2320a151006 = tier;
            break;
        }
    }
    var_bf3d63e39c071fab = [];
    var_d73cb1f45b5418a1 = 0;
    if (isdefined(var_d521671a5dc52db9)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + var_d521671a5dc52db9;
        var_bf3d63e39c071fab[""] = var_d521671a5dc52db9;
    }
    if (isdefined(var_28140ffed2089170)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + var_28140ffed2089170;
        var_bf3d63e39c071fab["_used"] = var_28140ffed2089170;
    }
    if (isdefined(var_26edae68004e6c83)) {
        var_d73cb1f45b5418a1 = var_d73cb1f45b5418a1 + var_26edae68004e6c83;
        var_bf3d63e39c071fab["_worn"] = var_26edae68004e6c83;
    }
    if (var_bf3d63e39c071fab.size == 0) {
        var_f97b516eeab99cbb = random([0:"", 1:"_worn", 2:"_used"]);
    } else {
        roll = randomint(var_d73cb1f45b5418a1);
        var_db4d4d3dcae5375 = 0;
        var_f97b516eeab99cbb = undefined;
        foreach (quality, var_d4846ec86821410a in var_bf3d63e39c071fab) {
            var_db4d4d3dcae5375 = var_db4d4d3dcae5375 + var_d4846ec86821410a;
            if (roll < var_db4d4d3dcae5375) {
                var_f97b516eeab99cbb = quality;
                break;
            }
        }
    }
    keyname = random(level.var_f2e2b5ed406a7d94[var_390ae2320a151006]);
    var_fa6333b1a0588411 = "loot_key_" + keyname + var_f97b516eeab99cbb;
    return var_fa6333b1a0588411;
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e4a
// Size: 0x37
function function_ffc077d5175e066a() {
    /#
        while (1) {
            var_5eddc5152a128d55 = namespace_58dcf42cf567f34f::function_23326c8ac97c60c7(1, 0, 0, 0, 1, 0, 0, 0, 10, 70, 20);
            println(var_5eddc5152a128d55);
            waitframe();
        }
    #/
}

// Namespace namespace_9e69d66f68c38a10/namespace_f6368c72597c6d90
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e88
// Size: 0x322
function function_af458cfdaf8d86e4() {
    /#
        while (1) {
            if (getdvarint(@"hash_add2748481956623", 0) == 1) {
                var_74b0328b6595af05 = getentitylessscriptablearray();
                var_e98075a1f0dfce41 = [];
                var_e75ae897f63866b7 = [];
                var_174c9363f042b646 = [];
                foreach (item in var_74b0328b6595af05) {
                    switch (item.type) {
                    case #"hash_8709a7ef11ecdbea":
                        var_e98075a1f0dfce41[var_e98075a1f0dfce41.size] = item.origin;
                        goto LOC_000001ca;
                    case #"hash_183cb58bad34bd86":
                    case #"hash_19ba8d41970911ad":
                    case #"hash_33a1ab3969e0b64e":
                    case #"hash_417c605750c7baa5":
                    case #"hash_b1814c3921b5bcf2":
                    case #"hash_b5b4216883bf84b8":
                        var_174c9363f042b646[var_174c9363f042b646.size] = item;
                        goto LOC_000001ca;
                    }
                    if (isdefined(item.type) && (issubstr(item.type, "<unknown string>") || issubstr(item.type, "<unknown string>"))) {
                        var_e75ae897f63866b7[var_e75ae897f63866b7.size] = item.origin;
                    LOC_000001ca:
                    }
                LOC_000001ca:
                }
                foreach (cache in var_174c9363f042b646) {
                    var_6e3f4c5cedda0bcb = getscriptablelootcachecontents(cache);
                    foreach (item in var_6e3f4c5cedda0bcb) {
                        if (item == "MP_DMZ_LOCKS/UNLOCK_NEIGH_STORAGE_ROOM") {
                            var_e98075a1f0dfce41[var_e98075a1f0dfce41.size] = cache.origin;
                        } else if (issubstr(item, "<unknown string>") || issubstr(item, "<unknown string>")) {
                            var_e75ae897f63866b7[var_e75ae897f63866b7.size] = cache.origin;
                        }
                    }
                }
                color = (0, 1, 0);
                foreach (loc in var_e98075a1f0dfce41) {
                    thread namespace_d028276791d9cff6::drawsphere(loc, 32, 1, color);
                }
                color = (0, 0, 1);
                foreach (loc in var_e75ae897f63866b7) {
                    thread namespace_d028276791d9cff6::drawsphere(loc, 32, 1, color);
                }
            }
            wait(1);
        }
    #/
}

