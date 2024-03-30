// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace game_utility;

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd57
// Size: 0x30
function getmapname() {
    if (!isdefined(level.mapname)) {
        level.mapname = getdvar(@"hash_687fb8f9b7a23245");
    }
    return level.mapname;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8f
// Size: 0x66
function getgametype() {
    if (!isdefined(level.gametype)) {
        if (isbrstylegametype()) {
            level.gametype = "br";
        } else {
            level.gametype = tolower(getdvar(@"hash_8fe3271cd74f65a2"));
        }
    }
    if (isinfectedgametype()) {
        level.gametype = "infect";
    }
    return level.gametype;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfd
// Size: 0xb9
function getbasegametype() {
    if (isdefined(level.var_7b79f7162d8f11f6)) {
        return level.var_7b79f7162d8f11f6;
    }
    gametype = getgametype();
    tokens = strtok(gametype, "_");
    if (tokens[0] == "hc" || tokens[0] == "cdl" || tokens[0] == "lp") {
        gametype = tokens[tokens.size - 1];
    }
    if (isdefined(tokens[1]) && (tokens[1] == "snipers" || tokens[1] == "horde")) {
        gametype = tokens[0];
    }
    if (!isdefined(level.var_7b79f7162d8f11f6)) {
        level.var_7b79f7162d8f11f6 = gametype;
    }
    return level.var_7b79f7162d8f11f6;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe
// Size: 0x3b
function isinfectedgametype() {
    if (!isdefined(level.gametype)) {
        return false;
    }
    if (level.gametype == "infect" || level.gametype == "infect_holiday") {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf01
// Size: 0x28
function function_b276be88d495440b() {
    if (!isdefined(level.gametype)) {
        return false;
    }
    if (level.gametype == "koth_horde") {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf31
// Size: 0x49
function isbrstylegametype() {
    if (isdefined(level.gametypebundle)) {
        return default_to(level.gametypebundle.isbrstylegametype, 0);
    }
    if (!isdefined(level.gametype)) {
        return 0;
    }
    return level.gametype == "br";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf82
// Size: 0x29
function function_42e2dcfd4571b89b() {
    return isbrstylegametype() && (function_6c1fce6f6b8779d5() == "dmz" || function_6c1fce6f6b8779d5() == "exgm");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3
// Size: 0x21
function function_a3a69db84e39e0b8() {
    if (!isdefined(level.gametype)) {
        return false;
    }
    return level.gametype == "xfire";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfdc
// Size: 0x21
function function_d04af493b6e718ac() {
    if (!isdefined(level.gametype)) {
        return false;
    }
    return level.gametype == "wm";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1005
// Size: 0x15
function function_8b6131109e66d962() {
    return function_d04af493b6e718ac() && istrue(game["roundsPlayed"]);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1022
// Size: 0x47
function function_22cd3d64fdb05892() {
    if (!isdefined(level.gametype)) {
        return false;
    }
    return level.gametype == "arm" || level.gametype == "gwtdm" || level.gametype == "conflict";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1071
// Size: 0x1a
function function_eb455c18ac9d8ac5() {
    return getsubstr(level.gametype, 0, 4) == "cdl_";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1093
// Size: 0x14
function function_ba5574c7f287c587() {
    return getdvarint(@"hash_39c3947a2e4f5f9e", 0) != 0;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10af
// Size: 0x13
function function_fa7bfcc1d68b7b73() {
    return function_ba5574c7f287c587() && isbrstylegametype();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ca
// Size: 0x13
function function_2d79a7a3b91c4c3e() {
    return function_ba5574c7f287c587() && !isbrstylegametype();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e5
// Size: 0x1c
function function_a0148d3a4a97bbb1() {
    return function_2d79a7a3b91c4c3e() && level.mapname == "mp_don3_mobile";
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0xe
function function_7f8a6a1772bd6f5f() {
    level.highhealth = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111e
// Size: 0xd
function function_244067e915c0eabe() {
    return istrue(level.highhealth);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1133
// Size: 0x12
function function_6493ec89ae923684() {
    return getdvarint(@"hash_3ba88ee1b012ae7", 0);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114d
// Size: 0x9
function function_6910a4c65560c44b() {
    return function_6493ec89ae923684();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115e
// Size: 0xe
function registerlargemap() {
    level.largemap = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1173
// Size: 0xd
function islargemap() {
    return istrue(level.largemap);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1188
// Size: 0x13
function islargebrmap() {
    return isbrstylegametype() && islargemap();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11a3
// Size: 0x15
function registerdonetskmap() {
    registerlargemap();
    level.isdonetskmap = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bf
// Size: 0xd
function isdonetskmap() {
    return istrue(level.isdonetskmap);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d4
// Size: 0xe
function registerdonetsksubmap() {
    level.donetsksubmap = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e9
// Size: 0xd
function isdonetsksubmap() {
    return istrue(level.donetsksubmap);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11fe
// Size: 0x15
function function_5258141665ff7b95() {
    registerlargemap();
    level.var_7ee65fae13124702 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121a
// Size: 0xd
function function_7ee65fae13124702() {
    return istrue(level.var_7ee65fae13124702);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122f
// Size: 0xe
function function_5b9e95acd14775a5() {
    level.var_6c8c09778110ddf8 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1244
// Size: 0xd
function function_da8c49606d8aa048() {
    return istrue(level.var_6c8c09778110ddf8);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1259
// Size: 0x15
function function_db54db563ac2ec62() {
    registerlargemap();
    level.var_3678e32ea86b4da7 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0xd
function function_3678e32ea86b4da7() {
    return istrue(level.var_3678e32ea86b4da7);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128a
// Size: 0xe
function function_9cfe515677727128() {
    level.var_e0708dadcdaba5ab = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129f
// Size: 0xd
function function_47eb75d4e513b67b() {
    return istrue(level.var_e0708dadcdaba5ab);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12b4
// Size: 0x15
function function_743719859fbab899() {
    registerlargemap();
    level.var_e21746abaaaf8414 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d0
// Size: 0xd
function function_e21746abaaaf8414() {
    return istrue(level.var_e21746abaaaf8414);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12e5
// Size: 0xe
function function_7643f25d8ef9f5d9() {
    level.var_9eb5d18392a3526e = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fa
// Size: 0xd
function function_9eb5d18392a3526e() {
    return istrue(level.var_9eb5d18392a3526e);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x130f
// Size: 0x15
function function_4b8e6239b2d87474() {
    registerlargemap();
    level.var_5e0e3a24dbb1fae1 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132b
// Size: 0xd
function function_5e0e3a24dbb1fae1() {
    return istrue(level.var_5e0e3a24dbb1fae1);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1340
// Size: 0xe
function function_ac85a5ab21db294e() {
    level.var_a88026e516cded1 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1355
// Size: 0xd
function function_a88026e516cded1() {
    return istrue(level.var_a88026e516cded1);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x136a
// Size: 0x15
function function_35f5b4e643757db7() {
    registerlargemap();
    level.var_eb4bce9b222e36ac = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1386
// Size: 0xd
function function_eb4bce9b222e36ac() {
    return istrue(level.var_eb4bce9b222e36ac);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x139b
// Size: 0xe
function function_3673befc7dcade8b() {
    level.var_24e8e1db997c8248 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b0
// Size: 0xd
function function_b1d9cdb3f16a7678() {
    return istrue(level.var_24e8e1db997c8248);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c5
// Size: 0x15
function function_daf8300f9f179ee6() {
    registerlargemap();
    level.var_314ff105a27cc131 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e1
// Size: 0xd
function function_314ff105a27cc131() {
    return istrue(level.var_314ff105a27cc131);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f6
// Size: 0x15
function function_f22234472142284f() {
    registerlargemap();
    level.var_d945f73c1a21c452 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1412
// Size: 0x13
function function_ffbbb4525b11d5a2() {
    return istrue(level.mapname == "mp_bio_lab");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142d
// Size: 0x13
function function_ee0c2958aa2ee59e() {
    return istrue(level.mapname == "mp_biobunker");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1448
// Size: 0x27
function function_934ac55aa85ce574() {
    return istrue(level.mapname == "mp_bio_lab") || istrue(level.mapname == "mp_biobunker");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1477
// Size: 0xd
function function_d945f73c1a21c452() {
    return istrue(level.var_d945f73c1a21c452);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x148c
// Size: 0xe
function function_6d696efa3fa61b93() {
    level.var_69c987308ed50f76 = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a1
// Size: 0xd
function function_d5f96052f275a4a6() {
    return istrue(level.var_69c987308ed50f76);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14b6
// Size: 0x15
function function_a373e183d1b9bae9() {
    registerlargemap();
    level.var_107d784c61b514da = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14d2
// Size: 0xe
function function_35f564beac680d88() {
    level.var_da466a8aa038e27d = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e7
// Size: 0x49
function function_da466a8aa038e27d() {
    return istrue(level.var_da466a8aa038e27d) || isdonetsksubmap() || function_da8c49606d8aa048() || function_47eb75d4e513b67b() || function_9eb5d18392a3526e() || function_b1d9cdb3f16a7678() || function_d5f96052f275a4a6();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0x27
function function_7fd83d3e076a309() {
    return istrue(level.mapname == "mp_saba_pm") || istrue(level.mapname == "mp_delta_pm");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1567
// Size: 0x36
function registernightmap(var_674c814e22d13236) {
    if (!isdefined(var_674c814e22d13236)) {
        var_674c814e22d13236 = 1;
    }
    level.nightmap = 1;
    visionsetkillcamthirdpersonnight("killcam_night");
    if (var_674c814e22d13236) {
        function_67c053f33e4f21a1();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a4
// Size: 0xd
function isnightmap() {
    return istrue(level.nightmap);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b9
// Size: 0xe
function function_67c053f33e4f21a1() {
    level.var_3eac2a21ee8e9d4f = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ce
// Size: 0xd
function function_d2d2b803a7b741a4() {
    return istrue(level.var_3eac2a21ee8e9d4f);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e3
// Size: 0x2e
function registerarenamap() {
    level.arenamap = 1;
    level.disablespawncamera = 1;
    level.skipfirstraise = 1;
    level.requiresminstartspawns = 0;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1618
// Size: 0x19
function registersmallmap() {
    level.disablespawncamera = 1;
    level.skipfirstraise = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0xd
function isarenamap() {
    return istrue(level.arenamap);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164d
// Size: 0x2a
function function_5a094c7dc3b36ebd() {
    if (issharedfuncdefined("game", "isLifeLimited")) {
        return [[ getsharedfunc("game", "isLifeLimited") ]]();
    }
    return 0;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167f
// Size: 0x60
function function_6ae03efb52c52c29(player) {
    if (function_5a094c7dc3b36ebd()) {
        gametypenumlives = function_f3bb4f4911a1beb2("game", "getGametypeNumLives");
        if (isdefined(player.pers["deaths"]) && player.pers["deaths"] >= gametypenumlives) {
            return true;
        }
    }
    return false;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e7
// Size: 0xd
function function_9cdaadfddeda4d7a() {
    return istrue(level.var_9cdaadfddeda4d7a);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fc
// Size: 0x48
function function_6c1fce6f6b8779d5() {
    if (isbrstylegametype()) {
        subgametype = level.gametypebundle.brsubgametype;
        if (!isdefined(subgametype)) {
            subgametype = "";
        }
        if (subgametype != "") {
            return subgametype;
        }
    }
    return getgametype();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174c
// Size: 0x31
function function_4fb37368ae3585bb() {
    if (!isdefined(level.maxteamsize)) {
        level.maxteamsize = getmatchrulesdata("commonOption", "teamSize");
    }
    return level.maxteamsize;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1785
// Size: 0x128
function function_1e9ff68a8f2562bd(value_table) {
    /#
        assertex(isdefined(value_table), "Array of map info overrides is missing or invalid!");
    #/
    gametype = getgametype();
    subgametype = ter_op(isbrstylegametype(), function_6c1fce6f6b8779d5(), "");
    bestmatch = undefined;
    foreach (row in value_table) {
        recordgametype = default_to(row.gametype, "");
        var_218bf995909cf648 = default_to(row.subgametype, "");
        if (recordgametype == gametype && var_218bf995909cf648 == subgametype) {
            bestmatch = row;
            break;
        }
        if (recordgametype == gametype && var_218bf995909cf648 == "") {
            bestmatch = row;
            continue;
        }
        if (recordgametype == "" && !isdefined(bestmatch)) {
            bestmatch = row;
        }
    }
    return bestmatch;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b5
// Size: 0x35
function shouldskipfirstraise() {
    if (!isdefined(level.skipfirstraise)) {
        level.skipfirstraise = getdvarint(@"hash_aa3a174ef690f2d2", 0) == 1;
    }
    return istrue(level.skipfirstraise);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f2
// Size: 0x10b
function getlocaleid() {
    if (!isdefined(level.localeid)) {
        localeid = getdvarint(@"hash_6beec004cdf37c0", 0);
        /#
            println("deaths" + localeid);
        #/
        if (localeid > 0) {
            level.localeid = "locale_" + localeid;
        } else if (localeid == 0) {
            level.localeid = undefined;
        } else if (scripts/cp_mp/utility/game_utility::isdonetskmap()) {
            level.localeid = "locale_6";
        } else {
            switch (getmapname()) {
            case #"hash_7a28db3c5928c489":
                level.localeid = "locale_5";
                break;
            case #"hash_32eaa112f8caa7e4":
                level.localeid = "locale_6";
                break;
            case #"hash_50de71be6e7469ff":
                level.localeid = "locale_9";
                break;
            case #"hash_a8b272dba33a4aed":
                level.localeid = "locale_17";
                break;
            }
        }
    }
    return level.localeid;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a05
// Size: 0x1c0
function getlocaleent(entname, var_8a8a9680c8ad47a2, var_783ab83623b57681) {
    possibleents = getentarray(entname, "targetname");
    var_44716bcb2430218b = undefined;
    if (isdefined(possibleents) && possibleents.size == 1) {
        return possibleents[0];
    }
    if (isdefined(getlocaleid()) && !istrue(var_783ab83623b57681)) {
        foreach (ent in possibleents) {
            if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == level.localeid) {
                var_44716bcb2430218b = ent;
                continue;
            }
            if (level.mapname == "mp_port2_gw" && entname == "airstrikeheight") {
                if (ent.origin == (34880, -26944, 3072)) {
                    var_44716bcb2430218b = ent;
                }
                continue;
            }
            ent delete();
        }
    } else {
        foreach (ent in possibleents) {
            if (!isdefined(var_44716bcb2430218b)) {
                var_44716bcb2430218b = ent;
                continue;
            }
            ent delete();
        }
    }
    if (isdefined(var_44716bcb2430218b)) {
        return var_44716bcb2430218b;
    }
    /#
        if (isdefined(level.localeid)) {
            println("reportChallengeUserSerializedEventWrapper" + entname + "tjugg" + level.localeid + "brm");
        }
    #/
    if (istrue(var_8a8a9680c8ad47a2)) {
        /#
            assertmsg("Asking for a locale tagged ent that cannot be found.");
        #/
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x14d
function getlocalestruct(structname, var_8a8a9680c8ad47a2) {
    possibleents = getstructarray(structname, "targetname");
    var_44716bcb2430218b = undefined;
    if (isdefined(getlocaleid())) {
        foreach (ent in possibleents) {
            if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == level.localeid) {
                var_44716bcb2430218b = ent;
            }
        }
    } else {
        foreach (ent in possibleents) {
            if (!isdefined(var_44716bcb2430218b)) {
                var_44716bcb2430218b = ent;
                break;
            }
        }
    }
    if (isdefined(var_44716bcb2430218b)) {
        return var_44716bcb2430218b;
    }
    /#
        if (isdefined(level.localeid)) {
            println("reportChallengeUserSerializedEventWrapper" + structname + "tjugg" + level.localeid + "brm");
        }
    #/
    if (istrue(var_8a8a9680c8ad47a2)) {
        /#
            assertmsg("Asking for a locale tagged ent that cannot be found.");
        #/
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d20
// Size: 0x11f
function getlocalestructarray(structname, var_8a8a9680c8ad47a2) {
    possibleents = getstructarray(structname, "targetname");
    var_134cb8f60ff902c0 = [];
    if (isdefined(getlocaleid())) {
        foreach (ent in possibleents) {
            if (getmapname() == "mp_quarry2") {
                var_134cb8f60ff902c0[var_134cb8f60ff902c0.size] = ent;
                continue;
            }
            if (isdefined(ent.script_noteworthy) && ent.script_noteworthy == level.localeid) {
                var_134cb8f60ff902c0[var_134cb8f60ff902c0.size] = ent;
            }
        }
        return var_134cb8f60ff902c0;
    }
    if (possibleents.size == 0) {
        /#
            if (isdefined(level.localeid)) {
                println("reportChallengeUserSerializedEventWrapper" + structname + "tjugg" + level.localeid + "brm");
            }
        #/
        if (istrue(var_8a8a9680c8ad47a2)) {
            /#
                assertmsg("Asking for a locale tagged ent that cannot be found.");
            #/
        }
        return;
    }
    return possibleents;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e47
// Size: 0xd
function function_b2c4b42f9236924() {
    return istrue(level.tier1ModeEnabled);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5c
// Size: 0x17
function function_21322da268e71c19() {
    return istrue(level.hardcoremodeenabled) || scripts/cp_mp/utility/game_utility::function_b2c4b42f9236924();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7b
// Size: 0x11a
function function_852712268d005332(player, fadetoblack, fadetime) {
    if (getdvarint(@"hash_19e3006228036170", 0)) {
        return;
    }
    if (player function_6d451118968a70bb()) {
        return;
    }
    player notify("start_fade_to_black_keep_ui");
    player endon("start_fade_to_black_keep_ui");
    player endon("disconnect");
    level endon("game_ended");
    /#
        assertex(!isdefined(fadetime) || fadetime >= 0, "fadeToBlackForPlayerKeepUI: fadeTime can't be less than 0");
    #/
    var_400fc540bbc48aa9 = 0;
    if (istrue(fadetoblack)) {
        var_400fc540bbc48aa9 = 1;
    }
    if (!isdefined(fadetime) || fadetime == 0) {
        player setclientomnvar("ui_world_fade", var_400fc540bbc48aa9);
        return;
    }
    var_226a6d12e60638a5 = var_400fc540bbc48aa9;
    var_400fc540bbc48aa9 = 0;
    fadetimecounter = int(fadetime / level.framedurationseconds);
    fadechange = 1 / fadetimecounter;
    if (!istrue(fadetoblack)) {
        fadechange = fadechange * -1;
        var_400fc540bbc48aa9 = 1;
    }
    while (fadetimecounter > 0) {
        var_400fc540bbc48aa9 = var_400fc540bbc48aa9 + fadechange;
        player setclientomnvar("ui_world_fade", var_400fc540bbc48aa9);
        fadetimecounter--;
        waitframe();
    }
    player setclientomnvar("ui_world_fade", var_226a6d12e60638a5);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9c
// Size: 0x16
function function_20cb4a5f727abe6e(bool) {
    self.var_2214edc8665072ab = bool;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb9
// Size: 0xd
function function_6d451118968a70bb() {
    return istrue(self.var_2214edc8665072ab);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fce
// Size: 0x140
function fadetoblackforplayer(player, fadetoblack, fadetime, var_dd8b0e146fd638e) {
    if (getdvarint(@"hash_19e3006228036170", 0)) {
        return;
    }
    if (player function_6d451118968a70bb()) {
        return;
    }
    player notify("start_fade_to_black");
    player endon("start_fade_to_black");
    player endon("disconnect");
    if (!istrue(var_dd8b0e146fd638e)) {
        level endon("game_ended");
    }
    /#
        assertex(!isdefined(fadetime) || fadetime >= 0, "fadeToBlackForPlayer: fadeTime can't be less than 0");
    #/
    var_400fc540bbc48aa9 = 0;
    if (istrue(fadetoblack)) {
        var_400fc540bbc48aa9 = 1;
    }
    if (!isdefined(fadetime) || fadetime == 0) {
        player setclientomnvar("ui_total_fade", var_400fc540bbc48aa9);
        return;
    }
    var_226a6d12e60638a5 = var_400fc540bbc48aa9;
    var_400fc540bbc48aa9 = 0;
    fadetimecounter = int(fadetime / level.framedurationseconds);
    fadechange = 1 / fadetimecounter;
    if (!istrue(fadetoblack)) {
        fadechange = fadechange * -1;
        var_400fc540bbc48aa9 = 1;
    }
    while (fadetimecounter > 0) {
        var_400fc540bbc48aa9 = var_400fc540bbc48aa9 + fadechange;
        if (!isdefined(player)) {
            return;
        }
        player setclientomnvar("ui_total_fade", var_400fc540bbc48aa9);
        fadetimecounter--;
        waitframe();
    }
    if (!isdefined(player)) {
        return;
    }
    player setclientomnvar("ui_total_fade", var_226a6d12e60638a5);
    player notify("finish_fade_to_black");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2115
// Size: 0x15
function gettimesincegamestart() {
    return [[ getsharedfunc("game_utility", "getTimeSinceGameStart") ]]();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2132
// Size: 0x143
function startkeyearning() {
    if (isbot(self)) {
        return;
    }
    if (isdefined(self.reportchallengeuserevent_done)) {
        return;
    }
    if (!istrue(level.playerxpenabled)) {
        return;
    }
    if (istrue(function_f3bb4f4911a1beb2("br", "isInstancedSpace"))) {
        return;
    }
    var_8283ee79fff791be = int(getbattlepassxpultipliertotal() * 100);
    aeeventname = #"start_match";
    aeeventid = function_6e2deb013c9ca85e(aeeventname);
    params = [function_d6f771aedba70ce7(aeeventname, #"version"), 1, function_d6f771aedba70ce7(aeeventname, #"playlist_id"), getplaylistid(), function_d6f771aedba70ce7(aeeventname, #"hash_f49dbd32adacb71c"), var_8283ee79fff791be, function_d6f771aedba70ce7(aeeventname, #"lobby_id"), function_4f9373a1227db35c(), function_d6f771aedba70ce7(aeeventname, #"match_id"), function_94c7ae7049488358()];
    if (issharedfuncdefined("challenges", "reportChallengeUserSerializedEventWrapper")) {
        function_f3bb4f4911a1beb2("challenges", "reportChallengeUserSerializedEventWrapper", aeeventid, params);
    }
    self.reportchallengeuserevent_done = 0;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227c
// Size: 0x34e
function stopkeyearning(winner) {
    if (!isdefined(self)) {
        /#
            assertmsg("Game_utility.gsc - stopKeyEarning: passed undefined self");
        #/
        return;
    }
    if (isbot(self)) {
        return;
    }
    if (istrue(self.reportchallengeuserevent_done)) {
        return;
    }
    if (!istrue(level.playerxpenabled)) {
        return;
    }
    result = function_b40278e5e468c6c1(#"matchresult", #"hash_106b352506ad77f9");
    if (istrue(self.disconnecting) && !isdefined(self.connectedpostgame)) {
        result = function_b40278e5e468c6c1(#"matchresult", #"hash_27e56f374f24d308");
    }
    if (!isdefined(winner)) {
        /#
            assertmsg("Game_utility.gsc - stopKeyEarning was passed an undefined winner string");
        #/
    }
    if (isdefined(winner)) {
        if (level.teambased) {
            if (winner == "eliminated") {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_ec51c9ff7e5317ce");
            } else if (winner == "tie") {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_67eb9ff552740025");
            } else if (isdefined(self.pers["team"]) && self.pers["team"] == winner) {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_c9fec00cfb18c0f");
            } else if (isdefined(self.pers["team"]) && self.pers["team"] != winner) {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_27e56f374f24d308");
            }
        } else if (isdefined(self.connectedpostgame)) {
            result = function_b40278e5e468c6c1(#"matchresult", #"hash_106b352506ad77f9");
        } else if (!isdefined(self.timeplayed) || self.timeplayed["total"] < 1 || self.pers["participation"] < 1) {
            result = function_b40278e5e468c6c1(#"matchresult", #"hash_106b352506ad77f9");
        } else if (!istrue(self.pers["hasDoneAnyCombat"])) {
            result = function_b40278e5e468c6c1(#"matchresult", #"hash_106b352506ad77f9");
        } else if (!isdefined(level.placement)) {
            result = function_b40278e5e468c6c1(#"matchresult", #"hash_106b352506ad77f9");
        } else if (!isplayer(winner) && winner == "eliminated") {
            result = function_b40278e5e468c6c1(#"matchresult", #"hash_ec51c9ff7e5317ce");
        } else {
            iswinner = 0;
            for (pidx = 0; pidx < min(level.placement["all"].size, 3); pidx++) {
                if (level.placement["all"][pidx] != self) {
                    continue;
                }
                iswinner = 1;
            }
            if (iswinner) {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_c9fec00cfb18c0f");
            } else {
                result = function_b40278e5e468c6c1(#"matchresult", #"hash_27e56f374f24d308");
            }
        }
    }
    scripts/cp_mp/challenges::function_b5929663421247fa(self, result, winner);
    self.reportchallengeuserevent_done = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d1
// Size: 0xb4
function _visionsetnakedforplayer(visionset, transitionduration) {
    /#
        assertex(isdefined(visionset), "_visionSetNakedForPlayer(): needs to have a valid visionSet");
    #/
    if (visionset == "") {
        self visionsetnakedforplayer(visionset, transitionduration);
        if (isdefined(self.activevisionsetlist)) {
            self.activevisionsetlist = undefined;
        }
        return;
    }
    if (!isdefined(transitionduration)) {
        transitionduration = 0;
    }
    if (!isdefined(self.activevisionsetlist)) {
        self.activevisionsetlist = [];
    }
    if (!isdefined(self.activevisionsetlist[visionset])) {
        self.activevisionsetlist[visionset] = 1;
    } else {
        self.activevisionsetlist[visionset]++;
    }
    if (self.activevisionsetlist[visionset] == 1) {
        self visionsetnakedforplayer(visionset, transitionduration);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268c
// Size: 0x113
function _visionunsetnakedforplayer(visionset) {
    self endon("disconnect");
    level endon("game_ended");
    /#
        assertex(isdefined(self.activevisionsetlist[visionset]), "_visionUnSetNakedForPlayer(): Trying to remove an invalid visionset from the player");
    #/
    self.activevisionsetlist[visionset]--;
    if (self.activevisionsetlist[visionset] == 0) {
        var_bfd32f432f9daccf = [];
        foreach (visionindex, visionsetcount in self.activevisionsetlist) {
            if (visionindex == visionset) {
                continue;
            }
            var_bfd32f432f9daccf[visionindex] = visionsetcount;
        }
        self.activevisionsetlist = var_bfd32f432f9daccf;
        self visionsetnakedforplayer("", 0);
        foreach (visionindex, visionsetcount in var_bfd32f432f9daccf) {
            waitframe();
            self visionsetnakedforplayer(visionindex, level.framedurationseconds);
        }
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27a6
// Size: 0xbc
function removematchingents_bymodel(name, var_4732c617e87c7c9d) {
    ents = getentarray();
    foreach (ent in ents) {
        if (isdefined(ent.model) && ent.model == name) {
            if (istrue(var_4732c617e87c7c9d) && isdefined(ent.target)) {
                removematchingents_bykey(ent.target, "targetname");
            }
            ent delete();
        }
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2869
// Size: 0x88
function removematchingents_bycodeclassname(name) {
    ents = getentarray();
    foreach (ent in ents) {
        if (isdefined(ent.code_classname) && ent.code_classname == name) {
            ent delete();
        }
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f8
// Size: 0x88
function removematchingents_byclassname(name) {
    ents = getentarray();
    foreach (ent in ents) {
        if (isdefined(ent.classname) && ent.classname == name) {
            ent delete();
        }
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2987
// Size: 0x72
function removematchingents_bykey(name, key) {
    ents = getentarray(name, key);
    foreach (ent in ents) {
        ent delete();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a00
// Size: 0xabc
function initchallengeandeventglobals() {
    globals = spawnstruct();
    level.challengeandeventglobals = globals;
    globals.game_type_col = [];
    globals.game_type_col["missions"] = function_b40278e5e468c6c1(#"gametype", #"hash_94a3e9eef8486ceb");
    globals.game_type_col["dm"] = function_b40278e5e468c6c1(#"gametype", #"hash_283088392650cf49");
    globals.game_type_col["war"] = function_b40278e5e468c6c1(#"gametype", #"hash_27a9511c6b561209");
    globals.game_type_col["sd"] = function_b40278e5e468c6c1(#"gametype", #"hash_28716139268823f9");
    globals.game_type_col["dom"] = function_b40278e5e468c6c1(#"gametype", #"hash_9b3fa11c1b49e24a");
    globals.game_type_col["conf"] = function_b40278e5e468c6c1(#"gametype", #"hash_ef25fedf53b657bc");
    globals.game_type_col["sr"] = function_b40278e5e468c6c1(#"gametype", #"hash_287173392688428f");
    globals.game_type_col["grind"] = function_b40278e5e468c6c1(#"gametype", #"hash_ef9a4413a5aba5c4");
    globals.game_type_col["ball"] = function_b40278e5e468c6c1(#"gametype", #"hash_cfecd0d34f64445f");
    globals.game_type_col["infect"] = function_b40278e5e468c6c1(#"gametype", #"hash_d2318c9d1c1c48c7");
    globals.game_type_col["tjugg"] = function_b40278e5e468c6c1(#"gametype", #"hash_dc39a236526e4509");
    globals.game_type_col["gun"] = function_b40278e5e468c6c1(#"gametype", #"hash_93dc951c177762dc");
    globals.game_type_col["grnd"] = function_b40278e5e468c6c1(#"gametype", #"hash_8be52fbbc7559ed1");
    globals.game_type_col["siege"] = function_b40278e5e468c6c1(#"gametype", #"hash_32ae842c947a11b1");
    globals.game_type_col["koth"] = function_b40278e5e468c6c1(#"gametype", #"hash_e72de898a6de98ec");
    globals.game_type_col["ctf"] = function_b40278e5e468c6c1(#"gametype", #"hash_b7b1431c2c18d7ed");
    globals.game_type_col["dd"] = function_b40278e5e468c6c1(#"gametype", #"hash_28308f392650db2e");
    globals.game_type_col["tdef"] = function_b40278e5e468c6c1(#"gametype", #"hash_bae2324a6357ff25");
    globals.game_type_col["front"] = function_b40278e5e468c6c1(#"gametype", #"hash_9596002d37fafad9");
    globals.game_type_col["cmd"] = function_b40278e5e468c6c1(#"gametype", #"hash_b7ff231c2c5ac2de");
    globals.game_type_col["br"] = function_b40278e5e468c6c1(#"gametype", #"hash_283771392656c6e2");
    globals.game_type_col["resurgence"] = function_b40278e5e468c6c1(#"gametype", #"hash_f619a150a59cd8b8");
    globals.game_type_col["zonecontrol"] = function_b40278e5e468c6c1(#"gametype", #"hash_1c4004bc52aa7574");
    globals.game_type_col["plunder"] = function_b40278e5e468c6c1(#"gametype", #"hash_731d29529dec358d");
    globals.game_type_col["arena"] = function_b40278e5e468c6c1(#"gametype", #"hash_b6b155127486c1e9");
    globals.game_type_col["cyber"] = function_b40278e5e468c6c1(#"gametype", #"hash_d5007927e17e9f2f");
    globals.game_type_col["rush"] = function_b40278e5e468c6c1(#"gametype", #"hash_a237b75bff436418");
    globals.game_type_col["esc"] = function_b40278e5e468c6c1(#"gametype", #"hash_a595c41c219e743f");
    globals.game_type_col["vip"] = function_b40278e5e468c6c1(#"gametype", #"hash_1572e41c60c50539");
    globals.game_type_col["btm"] = function_b40278e5e468c6c1(#"gametype", #"hash_ace80f1c2562eb87");
    globals.game_type_col["rugby"] = function_b40278e5e468c6c1(#"gametype", #"hash_96132a53224a13f9");
    globals.game_type_col["arm"] = function_b40278e5e468c6c1(#"gametype", #"hash_c68b8a1c33cecfb0");
    globals.game_type_col["mtmc"] = function_b40278e5e468c6c1(#"gametype", #"hash_4083828bb7543117");
    globals.game_type_col["snatch"] = function_b40278e5e468c6c1(#"gametype", #"hash_7cad9b981acb29d");
    globals.game_type_col["hq"] = function_b40278e5e468c6c1(#"gametype", #"hash_28236c3926461559");
    globals.game_type_col["defcon"] = function_b40278e5e468c6c1(#"gametype", #"hash_155388b4618596b");
    globals.game_type_col["pill"] = function_b40278e5e468c6c1(#"gametype", #"hash_cb35b96938bb6729");
    globals.game_type_col["blitz"] = function_b40278e5e468c6c1(#"gametype", #"hash_400b8b2cb23f693d");
    globals.game_type_col["brm"] = function_b40278e5e468c6c1(#"gametype", #"hash_acfbf31c257364fd");
    globals.game_type_col["hvt"] = function_b40278e5e468c6c1(#"gametype", #"hash_7a4a101c0919e0e8");
    globals.game_type_col["trial"] = function_b40278e5e468c6c1(#"gametype", #"hash_637597fbdf194e7a");
    globals.game_type_col["cp_survival"] = function_b40278e5e468c6c1(#"gametype", #"hash_79cc8147f3dc8572");
    globals.game_type_col["cp_wave_sv"] = function_b40278e5e468c6c1(#"gametype", #"hash_210b7c134eaec1f3");
    globals.game_type_col["brtdm"] = function_b40278e5e468c6c1(#"gametype", #"hash_67c1df9e3d5023ed");
    globals.game_type_col["oic"] = function_b40278e5e468c6c1(#"gametype", #"hash_4f413a1bf0cd2d97");
    globals.game_type_col["ko"] = function_b40278e5e468c6c1(#"gametype", #"hash_281f8639264258b0");
    globals.game_type_col["risk"] = function_b40278e5e468c6c1(#"gametype", #"hash_94545e5c8846c395");
    globals.game_type_col["hstg"] = function_b40278e5e468c6c1(#"gametype", #"hash_c8df63a365d0db66");
    globals.game_type_col["fr"] = function_b40278e5e468c6c1(#"gametype", #"hash_282a7939264c4a1e");
    globals.game_type_col["gwbomb"] = function_b40278e5e468c6c1(#"gametype", #"hash_259348284f0f4cc4");
    globals.game_type_col["rescue"] = function_b40278e5e468c6c1(#"gametype", #"hash_9ebabf7a445387c3");
    globals.game_type_col["war_mgl"] = function_b40278e5e468c6c1(#"gametype", #"hash_2c940e978e2052e6");
    globals.game_type_col["dom_mgl"] = function_b40278e5e468c6c1(#"gametype", #"hash_6bfe18dcf0bec72d");
    globals.game_type_col["zm_rb"] = function_b40278e5e468c6c1(#"gametype", #"hash_ee1508011908d6f0");
    globals.game_type_col["gwai"] = function_b40278e5e468c6c1(#"gametype", #"hash_a51fa5bbd5689172");
    globals.game_type_col["control"] = function_b40278e5e468c6c1(#"gametype", #"hash_b7a4eaad0b7e7803");
    globals.game_type_col["ob"] = function_b40278e5e468c6c1(#"gametype", #"hash_28127b392637bba3");
    globals.game_type_col["elim"] = 7;
    globals.game_type_col["benchmark"] = function_b40278e5e468c6c1(#"gametype", #"hash_6cca546ad092b105");
    globals.game_type_col["ballmode"] = function_b40278e5e468c6c1(#"gametype", #"hash_3fe61236bae85f58");
    globals.game_type_col["dungeons"] = 10;
    globals.game_type_col["zm_turned"] = 6;
    globals.game_type_col["bounty"] = function_b40278e5e468c6c1(#"gametype", #"hash_77c2b42a34b997bd");
    globals.game_type_col["brtdm_mgl"] = function_b40278e5e468c6c1(#"gametype", #"hash_b04061cb04f6f43a");
    globals.game_type_col["conflict"] = function_b40278e5e468c6c1(#"gametype", #"hash_44f627b6b4df0374");
    globals.game_type_col["training_course"] = function_b40278e5e468c6c1(#"gametype", #"hash_206378862002a2dc");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34c3
// Size: 0x3c2
function function_e1770d1e0f2d89e2() {
    globals = spawnstruct();
    level.challengeandeventglobals = globals;
    globals.game_type_col = [];
    globals.game_type_col["dm"] = 5;
    globals.game_type_col["war"] = 6;
    globals.game_type_col["sd"] = 7;
    globals.game_type_col["dom"] = 8;
    globals.game_type_col["conf"] = 9;
    globals.game_type_col["sr"] = 10;
    globals.game_type_col["grind"] = 11;
    globals.game_type_col["ball"] = 12;
    globals.game_type_col["infect"] = 13;
    globals.game_type_col["tjugg"] = 14;
    globals.game_type_col["gun"] = 15;
    globals.game_type_col["grnd"] = 16;
    globals.game_type_col["siege"] = 17;
    globals.game_type_col["koth"] = 18;
    globals.game_type_col["ctf"] = 19;
    globals.game_type_col["dd"] = 20;
    globals.game_type_col["tdef"] = 21;
    globals.game_type_col["front"] = 22;
    globals.game_type_col["cmd"] = 23;
    globals.game_type_col["br"] = 24;
    globals.game_type_col["arena"] = 25;
    globals.game_type_col["cyber"] = 26;
    globals.game_type_col["rush"] = 27;
    globals.game_type_col["esc"] = 28;
    globals.game_type_col["vip"] = 29;
    globals.game_type_col["btm"] = 30;
    globals.game_type_col["rugby"] = 31;
    globals.game_type_col["arm"] = 32;
    globals.game_type_col["mtmc"] = 33;
    globals.game_type_col["snatch"] = 34;
    globals.game_type_col["hq"] = 35;
    globals.game_type_col["defcon"] = 36;
    globals.game_type_col["pill"] = 37;
    globals.game_type_col["blitz"] = 38;
    globals.game_type_col["brm"] = 39;
    globals.game_type_col["hvt"] = 40;
    globals.game_type_col["trial"] = 41;
    globals.game_type_col["cp_survival"] = 42;
    globals.game_type_col["cp_wave_sv"] = 43;
    globals.game_type_col["brtdm"] = 44;
    globals.game_type_col["oic"] = 45;
    globals.game_type_col["cp_specops"] = 46;
    globals.game_type_col["incursion"] = 47;
    globals.game_type_col["missions"] = 48;
    globals.game_type_col["cqc"] = 49;
    globals.game_type_col["dungeons"] = 50;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388c
// Size: 0x6e
function function_6b6b6273f8180522(var_e6f187bcb4b1648e, origin, radius, entityowner) {
    /#
        assertex(isdefined(self), "questCircle_create: self is undefined, please make sure you call this with a valid ent/struct.");
    #/
    if (isdefined(origin)) {
        self.mapcircle = function_dc11c1caffe56e16(var_e6f187bcb4b1648e, origin[0], origin[1], radius, entityowner);
    } else {
        self.mapcircle = function_dc11c1caffe56e16(var_e6f187bcb4b1648e, undefined, undefined, radius, entityowner);
    }
    function_4eaf685bc40a3b9();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3901
// Size: 0x5f
function function_6e148c8da2e4db13(neworigin) {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_move: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle.origin = (neworigin[0], neworigin[1], self.mapcircle.origin[2]);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3967
// Size: 0x3d
function function_6a52fd9d448df322(newindex) {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_setIndex: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle function_9a27bb9750c77935(newindex);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39ab
// Size: 0x33
function function_6988310081de7b45() {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_showToAll: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle show();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e5
// Size: 0x33
function function_4eaf685bc40a3b9() {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_hideFromAll: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle hide();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1f
// Size: 0x3d
function function_cfd53c8f6878014f(player) {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_showToPlayer: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle showtoplayer(player);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a63
// Size: 0x3d
function function_d7d113d56ef0ef5b(player) {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_hideFromPlayer: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle hidefromplayer(player);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aa7
// Size: 0x6e
function function_4584ad1c0e2c58ec(newradius) {
    /#
        assertex(isdefined(self.mapcircle), "questCircle_setRadius: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_acaa75ca8754452e()) {
        self.mapcircle.origin = (self.mapcircle.origin[0], self.mapcircle.origin[1], newradius);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1c
// Size: 0x1b
function function_af5604ce591768e1() {
    if (function_acaa75ca8754452e()) {
        self.mapcircle delete();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3e
// Size: 0x3a
function function_d9583306c5a171e4() {
    var_2a73dee08dd771a7 = (0, 0, 0);
    if (function_acaa75ca8754452e()) {
        var_2a73dee08dd771a7 = self.mapcircle.origin;
    }
    return var_2a73dee08dd771a7;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b80
// Size: 0xd
function function_acaa75ca8754452e() {
    return isdefined(self.mapcircle);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b95
// Size: 0x53
function function_db48978d7206bd41(var_e6f187bcb4b1648e, origin, radius, var_a567a9249da5e49b) {
    /#
        assertex(isdefined(self), "questCircle_create: self is undefined, please make sure you call this with a valid ent/struct.");
    #/
    self.var_616c7052c6c2d9b9 = function_dc11c1caffe56e16(var_e6f187bcb4b1648e, origin[0], origin[1], radius, var_a567a9249da5e49b);
    function_8d43e0a01e766078();
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bef
// Size: 0x5f
function function_1d0718fb3b210270(neworigin) {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_move: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9.origin = (neworigin[0], neworigin[1], self.var_616c7052c6c2d9b9.origin[2]);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c55
// Size: 0x33
function function_6c06a9a26af579e8() {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_showToAll: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9 show();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c8f
// Size: 0x33
function function_8d43e0a01e766078() {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_hideFromAll: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9 hide();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cc9
// Size: 0x3d
function function_fab8ec5feb7d4c9c(player) {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_showToPlayer: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9 showtoplayer(player);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0d
// Size: 0x3d
function function_74c4cd59f26eb9ec(player) {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_hideFromPlayer: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9 hidefromplayer(player);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d51
// Size: 0x6e
function function_ae2bfaa147f91ca5(newradius) {
    /#
        assertex(isdefined(self.var_616c7052c6c2d9b9), "questCircle_setRadius: self.mapCircle2 is undefined. Please make sure you call createQuestCircle() first.");
    #/
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9.origin = (self.var_616c7052c6c2d9b9.origin[0], self.var_616c7052c6c2d9b9.origin[1], newradius);
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dc6
// Size: 0x1b
function function_f630402329582086() {
    if (function_28f9dfe13002dbb9()) {
        self.var_616c7052c6c2d9b9 delete();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3de8
// Size: 0x3a
function function_dcc52394e28dafad() {
    var_2a73dee08dd771a7 = (0, 0, 0);
    if (function_28f9dfe13002dbb9()) {
        var_2a73dee08dd771a7 = self.var_616c7052c6c2d9b9.origin;
    }
    return var_2a73dee08dd771a7;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e2a
// Size: 0xd
function function_28f9dfe13002dbb9() {
    return isdefined(self.var_616c7052c6c2d9b9);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e3f
// Size: 0x35
function isaigameparticipant(ent) {
    if (isagent(ent) && istrue(ent.agent_gameparticipant)) {
        return true;
    }
    if (isbot(ent)) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7c
// Size: 0x26
function isgameparticipant(ent) {
    if (isaigameparticipant(ent)) {
        return true;
    }
    if (isplayer(ent)) {
        return true;
    }
    return false;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eaa
// Size: 0x29
function addtoparticipantsarray() {
    /#
        assert(isgameparticipant(self));
    #/
    level.participants[level.participants.size] = self;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eda
// Size: 0x19
function function_1802112b9d0b0ff1() {
    self.agent_teamparticipant = 1;
    level.var_96df914b8abdd34f = 1;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3efa
// Size: 0xa4
function removefromparticipantsarray() {
    found = 0;
    for (entry = 0; entry < level.participants.size; entry++) {
        if (level.participants[entry] == self) {
            found = 1;
            while (entry < level.participants.size - 1) {
                level.participants[entry] = level.participants[entry + 1];
                /#
                    assert(level.participants[entry] != self);
                #/
                entry++;
            }
            level.participants[entry] = undefined;
            break;
        }
    }
    /#
        assert(found);
    #/
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fa5
// Size: 0x63
function addtocharactersarray() {
    /#
        assert(isplayer(self) || isbot(self) || isagent(self));
    #/
    /#
        assert(!isdefined(self.var_7a9bd393dfab7faf));
    #/
    self.var_7a9bd393dfab7faf = level.characters.size;
    level.characters[level.characters.size] = self;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400f
// Size: 0x169
function removefromcharactersarray() {
    /#
        assert(isdefined(self.var_7a9bd393dfab7faf));
    #/
    toremoveindex = undefined;
    if (isdefined(self.var_7a9bd393dfab7faf)) {
        /#
            assert(isdefined(level.characters[self.var_7a9bd393dfab7faf]));
        #/
        if (isdefined(level.characters[self.var_7a9bd393dfab7faf])) {
            /#
                assert(level.characters[self.var_7a9bd393dfab7faf] == self);
            #/
            if (level.characters[self.var_7a9bd393dfab7faf] == self) {
                toremoveindex = self.var_7a9bd393dfab7faf;
            }
        }
    }
    if (!isdefined(toremoveindex)) {
        found = 0;
        for (entry = 0; entry < level.characters.size; entry++) {
            if (level.characters[entry] == self) {
                toremoveindex = entry;
                found = 1;
                break;
            }
        }
        /#
            assert(found);
        #/
    }
    if (isdefined(toremoveindex)) {
        level.characters[toremoveindex] = level.characters[level.characters.size - 1];
        level.characters[toremoveindex].var_7a9bd393dfab7faf = toremoveindex;
        level.characters[level.characters.size - 1] = undefined;
        self.var_7a9bd393dfab7faf = undefined;
        return;
    }
    /#
        assertmsg("We could not find our character to remove");
    #/
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417f
// Size: 0x95
function trackprojectiles() {
    if (!isdefined(level.mines)) {
        level.mines = [];
    }
    if (!isdefined(level.projectilekillstreaks)) {
        level.projectilekillstreaks = [];
    }
    if (!isdefined(level.var_2d97afead10e4548)) {
        level.var_2d97afead10e4548 = 0;
    }
    while (true) {
        level.grenades = getentarray("grenade", "classname");
        level.missiles = getentarray("rocket", "classname");
        level.var_715aa7f8de54c394 = undefined;
        level.var_e7e46e0e18411a5b = undefined;
        waitframe();
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x421b
// Size: 0x23
function function_f5e8b13acc5b4e24() {
    if (isdefined(level.var_715aa7f8de54c394)) {
        return;
    }
    level.var_715aa7f8de54c394 = function_8e7fb050ec31dcb1(400);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4245
// Size: 0x23
function function_9ed62e98a39d59eb() {
    if (isdefined(level.var_e7e46e0e18411a5b)) {
        return;
    }
    level.var_e7e46e0e18411a5b = function_8e7fb050ec31dcb1(400);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x426f
// Size: 0x103
function private function_8e7fb050ec31dcb1(size) {
    var_c70b9adbc218860a = [];
    var_c70b9adbc218860a[0] = level.grenades;
    var_c70b9adbc218860a[1] = level.missiles;
    var_c70b9adbc218860a[2] = level.mines;
    var_c70b9adbc218860a[3] = level.projectilekillstreaks;
    projectiles = [];
    foreach (array in var_c70b9adbc218860a) {
        foreach (entity in array) {
            if (isent(entity)) {
                projectiles[entity getentitynumber()] = entity;
            }
        }
    }
    return function_21a6a1c613b50a28(projectiles, size);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x437a
// Size: 0x7e
function game_utility_init() {
    /#
        issharedfuncdefined("questCircle_hideFromAll: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.", "rocket", 1);
    #/
    [[ getsharedfunc("game_utility", "init") ]]();
    /#
        issharedfuncdefined("questCircle_hideFromAll: self.mapCircle is undefined. Please make sure you call createQuestCircle() first.", "player_for_spawn_logic", 1);
    #/
    battlepassxpscale = getdvarint(@"hash_95f4193739093e89");
    if (battlepassxpscale > 4 || battlepassxpscale < 0) {
        exitlevel(0);
    }
    level addbattlepassxpmultiplier(battlepassxpscale, "online_battle_xpscale_dvar");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ff
// Size: 0x3f
function values_init() {
    val::register("player_for_spawn_logic", 1, 0, "$self", &function_a3d2fe29dc7c7c4c, "$value");
    val::register("cg_drawcrosshair", 1, 0, "$self", &function_c88206dcf93476a2, "$value");
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4445
// Size: 0x1e
function private function_a3d2fe29dc7c7c4c(b_value) {
    if (!isdefined(b_value)) {
        b_value = 1;
    }
    self ignorecharacterduringspawnselection(!b_value);
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446a
// Size: 0x7b
function getbattlepassxpultipliertotal() {
    xpmodifier = level getbattlepassxpmultiplier();
    var_9a43fe5a154b7bc8 = 1;
    var_18648eb9853b55b = getdvarint(@"hash_a429ab6edb6e3023", 0) == 0;
    if ((xpmodifier > 4 || xpmodifier < 0) && var_18648eb9853b55b) {
        exitlevel(0);
    }
    if (self isbnetigrplayer()) {
        var_9a43fe5a154b7bc8 = getbnetigrbattlepassxpmultiplier(self);
    }
    returnval = xpmodifier * var_9a43fe5a154b7bc8;
    return returnval;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44ed
// Size: 0x81
function getbattlepassxpmultiplier() {
    if (!isdefined(self.battlepassxpmultipliers)) {
        return 1;
    }
    modifiertotal = 1;
    foreach (modifier in self.battlepassxpmultipliers) {
        if (!isdefined(modifier)) {
            continue;
        }
        modifiertotal = modifiertotal * modifier;
    }
    return modifiertotal;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4576
// Size: 0x83
function addbattlepassxpmultiplier(multiplier, ref) {
    maxmultiplier = 4 / level getbattlepassxpmultiplier();
    if (multiplier > maxmultiplier) {
        return;
    }
    if (!isdefined(self.battlepassxpmultipliers)) {
        self.battlepassxpmultipliers = [];
    }
    if (isdefined(self.battlepassxpmultipliers[ref])) {
        self.battlepassxpmultipliers[ref] = max(self.battlepassxpmultipliers[ref], multiplier);
        return;
    }
    self.battlepassxpmultipliers[ref] = multiplier;
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4600
// Size: 0x57
function function_e3ef0908b595e8e1() {
    playlistid = getplaylistid();
    xpscale = getdvarint(@"hash_261fdcd18e2fad2a");
    if (!isdefined(playlistid) || playlistid == 0) {
        return xpscale;
    }
    playlistxpscale = function_ebc8c5847567a441();
    return int(max(xpscale, playlistxpscale));
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x465f
// Size: 0x14
function private function_c88206dcf93476a2(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
}

// Namespace game_utility / scripts/cp_mp/utility/game_utility
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467a
// Size: 0x7c
function gettimepassed() {
    if (!isdefined(level.starttime) || !isdefined(level.discardtime)) {
        return 0;
    }
    if (level.timerstopped) {
        return (level.timerpausetime - level.starttime - level.discardtime - level.overtimetotal);
    }
    return gettime() - level.starttime - level.discardtime - level.overtimetotal;
}

