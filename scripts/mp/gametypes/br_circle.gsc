// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_3c46a15a541390cf;
#using script_21cccabf14b4dbe6;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_5238dee479bbf7fb;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_21c19cfc7139d773;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using script_548072087c9fd504;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\weaponrank.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace br_circle;

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x26b
function initcircle() {
    if (namespace_71073fa38f11492::isfeaturedisabled("circle")) {
        level.br_circle_disabled = 1;
        return;
    }
    if (!isdefined(level.br_level)) {
        return;
    }
    level.br_circle = spawnstruct();
    level.br_circle.mapbounds = level.br_level.br_mapbounds;
    if (getdvarint(@"hash_b5133e800e8d7fef", 10) > 0) {
        level.br_circle.damagetick = [0:getdvarint(@"hash_b5133e800e8d7fef", 10)];
    } else if (level.mapname == "mp_quarry2" || level.mapname == "mp_prison" || level.mapname == "mp_lumber") {
        level.br_circle.damagetick = [0:10, 1:10, 2:10, 3:10, 4:10];
    } else {
        level.br_circle.damagetick = [0:10, 1:10, 2:10, 3:10, 4:10, 5:10, 6:10, 7:10];
    }
    level.var_53c0fa66001cff52 = getdvarint(@"hash_bc78c3747f2a6ab4", 1574);
    setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[0]);
    var_b6f3e70ef79763be = level.br_level.br_circleclosetimes.size;
    setomnvar("ui_br_total_circle_collapse_count", var_b6f3e70ef79763be);
    level.br_circle.circleindex = -1;
    level.br_circle.var_a0d948a339eee04 = 0;
    namespace_d04031d92bc84201::init();
    namespace_813f5a035e59565a::init();
    level thread namespace_bbc79db4c3949a5c::function_8e779f490bbd1ae9();
    if (isdefined(level.var_ea923bf109f8a376)) {
        function_64f6d9b4ba95ed35();
        [[ level.var_ea923bf109f8a376 ]]();
    } else {
        _precalcsafecirclecenters();
    }
    namespace_d04031d92bc84201::function_598312eb02c8eb61();
    if (getdvarint(@"hash_6ce99c9bce6e5660", 0)) {
        function_7fb9a2d57c0c42e2();
    }
    if (istrue(function_4bff90e55e5e18e4())) {
        function_64aeda8c8a4179c5(1);
    }
    /#
        setdevdvarifuninitialized(@"hash_907618e8f550cb42", 0);
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b
// Size: 0x183
function function_c85d65f8d1f9413() {
    br_circleclosetimes = function_38773ae9c311a6ea(getdvar(@"hash_6cd6dc22dec17dbf", ""));
    br_circledelaytimes = function_38773ae9c311a6ea(getdvar(@"hash_72781cba09f3e490", ""));
    br_circleshowdelaydanger = function_38773ae9c311a6ea(getdvar(@"hash_78cf613edd8ce3f8", ""));
    br_circleshowdelaysafe = function_38773ae9c311a6ea(getdvar(@"hash_2fd27b62394d3332", ""));
    br_circleminimapradii = function_38773ae9c311a6ea(getdvar(@"hash_8c15e38a9558ea05", ""));
    br_circleradii = function_38773ae9c311a6ea(getdvar(@"hash_d29ee9cb1d59bcb6", ""));
    if (br_circleclosetimes.size > 0) {
        level.br_level.br_circleclosetimes = br_circleclosetimes;
    }
    if (br_circledelaytimes.size > 0) {
        level.br_level.br_circledelaytimes = br_circledelaytimes;
    }
    if (br_circleshowdelaydanger.size > 0) {
        level.br_level.br_circleshowdelaydanger = br_circleshowdelaydanger;
    }
    if (br_circleshowdelaysafe.size > 0) {
        level.br_level.br_circleshowdelaysafe = br_circleshowdelaysafe;
    }
    if (br_circleminimapradii.size > 0) {
        level.br_level.br_circleminimapradii = br_circleminimapradii;
    }
    if (br_circleradii.size > 0) {
        level.br_level.br_circleradii = br_circleradii;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1295
// Size: 0x48
function function_38773ae9c311a6ea(dvarvalue) {
    array = strtok(dvarvalue, " ");
    for (i = 0; i < array.size; i++) {
        array[i] = int(array[i]);
    }
    return array;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e5
// Size: 0x48
function function_488d5286d6e45d8b(dvarvalue) {
    array = strtok(dvarvalue, " ");
    for (i = 0; i < array.size; i++) {
        array[i] = float(array[i]);
    }
    return array;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335
// Size: 0x384
function initcirclepoststarttocircleindex(origin, var_8f6402ad8e91da6a, var_836a83c2bca261, var_26189638809f7b88) {
    if (isdefined(level.br_circle)) {
        return;
    }
    level.br_circle = spawnstruct();
    level.br_circle.mapbounds = level.br_level.br_mapbounds;
    level.br_circle.damagetick = [0:10, 1:10, 2:10, 3:10, 4:10, 5:10, 6:10, 7:10];
    maxindex = level.br_level.br_circleclosetimes.size - 1;
    if (!isdefined(var_836a83c2bca261) || var_836a83c2bca261 < 0) {
        var_836a83c2bca261 = 0;
    } else if (var_836a83c2bca261 > maxindex) {
        var_836a83c2bca261 = maxindex;
    }
    var_176ecfacee5f2ef4 = level.br_level.br_circleclosetimes.size - var_836a83c2bca261;
    var_7a29dcf228edd854 = level.br_level.br_circleradii[0];
    if (!isdefined(var_26189638809f7b88) || var_26189638809f7b88 <= 0) {
        var_26189638809f7b88 = level.br_level.br_circleclosetimes[0];
    }
    level.br_circle.circleindex = -1;
    level.br_level.circle_defaults = undefined;
    level.br_circle.damagetick = copycirclearraystartingat(level.br_circle.damagetick, var_836a83c2bca261);
    level.br_level.br_circleclosetimes = copycirclearraystartingat(level.br_level.br_circleclosetimes, var_836a83c2bca261);
    level.br_level.br_circledelaytimes = getzeroarray(var_176ecfacee5f2ef4, var_8f6402ad8e91da6a);
    level.br_level.br_circleshowdelaydanger = getzeroarray(var_176ecfacee5f2ef4, var_8f6402ad8e91da6a);
    level.br_level.br_circleshowdelaysafe = copycirclearraystartingat(level.br_level.br_circleshowdelaysafe, var_836a83c2bca261);
    level.br_level.br_circleminimapradii = copycirclearraystartingat(level.br_level.br_circleminimapradii, var_836a83c2bca261);
    level.br_level.br_circleradii = copycirclearraystartingat(level.br_level.br_circleradii, var_836a83c2bca261);
    level.br_level.br_circleradii[0] = var_7a29dcf228edd854;
    level.br_level.br_circleclosetimes[0] = var_26189638809f7b88;
    applycirclesettings();
    level thread _precalcsafecirclecenters(origin);
    level notify("CirclePeekCleanup");
    if (isdefined(level.circlepeeks)) {
        foreach (var_582e2e465a7917ee in level.circlepeeks) {
            var_582e2e465a7917ee function_af5604ce591768e1();
        }
        level.circlepeeks = undefined;
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_4bc0ead8d2af3d84::setupcirclepeek();
        } else {
            namespace_981ad73f8047222f::setupcirclepeek();
        }
    }
    thread runcircles(0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x29
function copycirclearraystartingat(var_4c55469b726b54f6, startindex) {
    if (startindex == 0) {
        return var_4c55469b726b54f6;
    }
    var_4c55469b726b54f6 = array_slice(var_4c55469b726b54f6, startindex, var_4c55469b726b54f6.size);
    return var_4c55469b726b54f6;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f1
// Size: 0x45
function getzeroarray(size, var_3739e75778ddc8ca) {
    newarray = [];
    newarray[0] = var_3739e75778ddc8ca;
    for (i = 1; i < size; i++) {
        newarray[newarray.size] = 0;
    }
    return newarray;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173e
// Size: 0x7b
function getsafecircleorigin() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        return (level.br_circle.safecircleent.origin[0], level.br_circle.safecircleent.origin[1], 0);
    } else {
        return (0, 0, 0);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c0
// Size: 0x4e
function getsafecircleradius() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        return level.br_circle.safecircleent.origin[2];
    } else {
        return 0;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1815
// Size: 0x7b
function getdangercircleorigin() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        return (level.br_circle.dangercircleent.origin[0], level.br_circle.dangercircleent.origin[1], 0);
    } else {
        return (0, 0, 0);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1897
// Size: 0x4e
function getdangercircleradius() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        return level.br_circle.dangercircleent.origin[2];
    } else {
        return 0;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ec
// Size: 0x58
function getnextsafecircleorigin() {
    var_3c3e327952ce34d3 = level.br_circle.circleindex + 2;
    if (var_3c3e327952ce34d3 < level.br_level.br_circlecenters.size) {
        return level.br_level.br_circlecenters[var_3c3e327952ce34d3];
    } else {
        return undefined;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194b
// Size: 0x58
function getnextsafecircleradius() {
    var_3c3e327952ce34d3 = level.br_circle.circleindex + 2;
    if (var_3c3e327952ce34d3 < level.br_level.br_circleradii.size) {
        return level.br_level.br_circleradii[var_3c3e327952ce34d3];
    } else {
        return undefined;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19aa
// Size: 0x5d
function function_88f7b8fa20846f45() {
    if (isdefined(level.br_level.var_8e40f29c8cdeb0f4) && level.br_level.var_8e40f29c8cdeb0f4 > 0) {
        return (level.br_level.br_circleclosetimes.size - level.br_level.var_8e40f29c8cdeb0f4);
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0f
// Size: 0x5d
function function_6249dca788e0dff0() {
    if (isdefined(level.br_level.var_33e9e49f9e4a0834) && level.br_level.var_33e9e49f9e4a0834 > 0) {
        return (level.br_level.br_circleclosetimes.size - level.br_level.var_33e9e49f9e4a0834);
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a74
// Size: 0x27
function function_d6f728b66bd3966(circleindex) {
    var_47868f432c8fcb6b = function_6249dca788e0dff0();
    if (isdefined(var_47868f432c8fcb6b)) {
        return (circleindex >= var_47868f432c8fcb6b);
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa3
// Size: 0x39
function canseesafecircleui() {
    return isdefined(level.br_circle.safecircleent) && !istrue(level.br_circle.safecircleent.hidden);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae4
// Size: 0x39
function canseedangercircleui() {
    return isdefined(level.br_circle.dangercircleent) && !istrue(level.br_circle.dangercircleent.hidden);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b25
// Size: 0x7b
function playercanseedangercircleworld() {
    if (istrue(self.wasingulag)) {
        return 0;
    }
    if (istrue(self.gulag)) {
        if (istrue(self.gulagarena) || istrue(self.jailed) || istrue(self.playinggulagbink)) {
            return 0;
        }
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerCanSeeDangerCircleWorld")) {
        result = namespace_71073fa38f11492::runbrgametypefunc("playerCanSeeDangerCircleWorld");
        if (isdefined(result)) {
            return result;
        }
    }
    return canseedangercircleui();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba8
// Size: 0x6d
function cancircledamageplayer(player) {
    return isalive(player) && player playercanseedangercircleworld() && !istrue(player.gulag) && !istrue(player.inrespawnc130) && !player namespace_d3d40f75bb4e4c32::playeriszombie() && !isdefined(player.c130) && !function_d4fbb8e1e555b4f0(player.origin);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1d
// Size: 0x80
function function_d4fbb8e1e555b4f0(position) {
    if (isdefined(level.var_bfbde2b8715f6c72)) {
        foreach (zone in level.var_bfbde2b8715f6c72) {
            var_75faff8af3dda5b6 = function_92b7f40b735f689f(zone, position);
            if (var_75faff8af3dda5b6) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x1aa
function tryplaycoughaudio(var_dc548d1807ca0b2f) {
    player = self;
    if (!player namespace_f8065cafc523dba5::_isalive()) {
        return;
    }
    if (istrue(player.extracted)) {
        return;
    }
    if (!isdefined(player.operatorcustomization)) {
        return;
    }
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        return;
    }
    if (isdefined(player.brcirclecoughnexttime) && gettime() < player.brcirclecoughnexttime) {
        return;
    }
    var_b78d7611dd745ddf = randomintrange(5000, 7000);
    if (isdefined(var_dc548d1807ca0b2f)) {
        var_b78d7611dd745ddf = var_dc548d1807ca0b2f;
    }
    player.brcirclecoughnexttime = gettime() + var_b78d7611dd745ddf;
    if (!isai(player)) {
        player playsoundtoplayer("gas_player_cough", player, player);
    }
    var_4de0f8859b1a8d67 = "allies_male_cough";
    var_95ce4f91d0f58568 = namespace_d3d40f75bb4e4c32::brgetoperatorteam(player);
    var_ae461ab77282f77c = player.operatorcustomization.gender;
    if (isdefined(var_95ce4f91d0f58568) && var_95ce4f91d0f58568 == "axis") {
        if (isdefined(var_ae461ab77282f77c) && var_ae461ab77282f77c == "female") {
            var_4de0f8859b1a8d67 = "axis_female_cough";
        } else {
            var_4de0f8859b1a8d67 = "axis_male_cough";
        }
    } else if (isdefined(var_ae461ab77282f77c) && var_ae461ab77282f77c == "female") {
        var_4de0f8859b1a8d67 = "allies_female_cough";
    } else {
        var_4de0f8859b1a8d67 = "allies_male_cough";
    }
    var_d4eb9b956e707234 = randomint(game["dialogue"][var_4de0f8859b1a8d67].size);
    var_818f7c4cf3588018 = game["dialogue"][var_4de0f8859b1a8d67][var_d4eb9b956e707234];
    if (isdefined(player) && player namespace_f8065cafc523dba5::_isalive()) {
        player playsound(var_818f7c4cf3588018, player, player);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x2c
function function_f8d9c5f59fc6c187() {
    if (!isdefined(self.var_8d272c0341202e9d)) {
        self.var_8d272c0341202e9d = gettime();
        self setclientomnvar("ui_br_player_is_in_gas", 1);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e89
// Size: 0x1a
function function_6fcdea7a7060ce40() {
    self.var_8d272c0341202e9d = undefined;
    self setclientomnvar("ui_br_player_is_in_gas", 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eaa
// Size: 0x209
function function_ce6456364079cce7() {
    var_ca59d6183ccb9870 = [0:45, 1:50, 2:60, 3:70, 4:80, 5:90, 6:100, 7:110, 8:120];
    var_421b5b34a21338d1 = [0:1.4, 1:1.8, 2:2, 3:2.5, 4:2.8, 5:3, 6:4, 7:5, 8:10];
    /#
        assert(var_ca59d6183ccb9870.size == var_421b5b34a21338d1.size);
    #/
    data = spawnstruct();
    data.enabled = getdvarint(@"hash_a4814b42abcaa1d7", 1);
    data.var_8d1ed26b4a14cb16 = getdvarint(@"hash_8799dcded2374711", 9);
    data.timeinseconds = [];
    data.var_85dce75bab934da3 = [];
    curtime = 0;
    var_cd78c15de6f76d7b = 1;
    for (i = 0; i < data.var_8d1ed26b4a14cb16; i++) {
        defaulttime = undefined;
        var_680582b33f7dfc98 = undefined;
        if (i < var_ca59d6183ccb9870.size) {
            defaulttime = var_ca59d6183ccb9870[i];
            var_680582b33f7dfc98 = var_421b5b34a21338d1[i];
            curtime = defaulttime;
            var_cd78c15de6f76d7b = var_680582b33f7dfc98;
        } else {
            curtime = curtime + 1;
            var_cd78c15de6f76d7b = var_cd78c15de6f76d7b + 1;
            defaulttime = curtime;
            var_680582b33f7dfc98 = var_cd78c15de6f76d7b;
        }
        data.timeinseconds[i] = getdvarfloat(function_2ef675c13ca1c4af(@"hash_1e5bced3bad4bb2c", i + 1), defaulttime);
        data.var_85dce75bab934da3[i] = getdvarfloat(function_2ef675c13ca1c4af(@"hash_73aa78457e1fa15d", i + 1), var_680582b33f7dfc98);
    }
    return data;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bb
// Size: 0xb8
function function_1e0f84e555b3de7d(data, damagetick) {
    if (!data.enabled) {
        return damagetick;
    }
    if (!isdefined(self.var_8d272c0341202e9d)) {
        return damagetick;
    }
    var_8c4fa1bb96483aac = (gettime() - self.var_8d272c0341202e9d) * 0.001;
    for (i = data.var_8d1ed26b4a14cb16 - 1; i >= 0; i--) {
        curtime = data.timeinseconds[i];
        if (var_8c4fa1bb96483aac >= curtime) {
            var_cd78c15de6f76d7b = data.var_85dce75bab934da3[i];
            return int(damagetick * var_cd78c15de6f76d7b);
        }
    }
    return damagetick;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217b
// Size: 0x6d
function function_24c5a8d31ae262f(origin, var_819edacdacb810e4, var_e86632d645c137d0) {
    /#
        if (level.mapname == "br_circle" && getdvarint(@"hash_97ab1e3e328ddff9", 0) == 0) {
            return 0;
        }
    #/
    if (!isdefined(var_819edacdacb810e4)) {
        var_819edacdacb810e4 = getdangercircleorigin();
    }
    if (!isdefined(var_e86632d645c137d0)) {
        var_e86632d645c137d0 = getdangercircleradius();
    }
    return distance2dsquared(var_819edacdacb810e4, origin) > var_e86632d645c137d0 * var_e86632d645c137d0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f0
// Size: 0xb7
function ispointwithininitialdangercircle(origin) {
    if (!isdefined(level.br_level) || !isdefined(level.br_level.br_circlecenters) || !isdefined(level.br_level.br_circleradii)) {
        return 1;
    }
    var_a019f99effa95be2 = (level.br_level.br_circlecenters[0][0], level.br_level.br_circlecenters[0][1], 0);
    var_3675d09395caf91a = squared(level.br_level.br_circleradii[0]);
    return distance2dsquared(var_a019f99effa95be2, origin) < var_3675d09395caf91a;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22af
// Size: 0x532
function circledamagetick() {
    level endon("game_ended");
    level endon("endCircleDamageTick");
    while (level.br_circle.circleindex < 0) {
        waitframe();
    }
    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    var_5d954f1724092f5a = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    var_a058dc250ace641d = function_ce6456364079cce7();
    while (1) {
        if (isdefined(level.br_circle.dangercircleent)) {
            index = level.br_circle.circleindex;
            if (index > level.br_circle.damagetick.size - 1) {
                index = level.br_circle.damagetick.size - 1;
            }
            damagetick = level.br_circle.damagetick[index];
            if (isdefined(level.circledamagemultiplier)) {
                damagetick = damagetick * level.circledamagemultiplier;
            }
            if (damagetick > 0) {
                var_819edacdacb810e4 = getdangercircleorigin();
                var_e86632d645c137d0 = getdangercircleradius();
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    if (isdefined(player) && istrue(player.var_a6637f42471575bc)) {
                        continue;
                    }
                    if (namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart") && istrue(player.plotarmor)) {
                        player function_6fcdea7a7060ce40();
                        if (getdvarint(@"hash_acff883bb1879e40", 0)) {
                            logstring("CIRCLE DAMAGE LOGGING: Resetting player gas timer for " + player.name + " during circle index " + index + "for circleEarlyStart and plotArmor.");
                        }
                    } else {
                        var_acfa1a113ba7d7c7 = 0;
                        if (function_24c5a8d31ae262f(player.origin, var_819edacdacb810e4, var_e86632d645c137d0)) {
                            if (player cancircledamageplayer(player)) {
                                var_acfa1a113ba7d7c7 = 1;
                                player function_f8d9c5f59fc6c187();
                                if (getdvarint(@"hash_2b717602559e86b8", 0) == 1) {
                                    var_36e462d047634362 = player function_1e0f84e555b3de7d(var_a058dc250ace641d, damagetick);
                                } else {
                                    var_36e462d047634362 = damagetick;
                                }
                                var_973f8e42fb3c591b = var_36e462d047634362;
                                if (isdefined(level.var_aa1aaed4a9b80d4b) && isdefined(level.var_152d5a9c5ac5cdad) && level.br_circle.circleindex <= level.var_aa1aaed4a9b80d4b) {
                                    var_973f8e42fb3c591b = var_973f8e42fb3c591b * level.var_152d5a9c5ac5cdad;
                                }
                                if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
                                    if (namespace_cb965d2f71fefddc::function_f213f06eba604bbd(player)) {
                                        if (istrue(player.var_a18181d8bdaa0dab)) {
                                            player notify("gasmask_buffer_reset");
                                        } else if (level.var_5312bc14bd5db377 > 0) {
                                            player.var_a18181d8bdaa0dab = 1;
                                            player thread namespace_cb965d2f71fefddc::function_a1d897962a19d27e();
                                        }
                                    }
                                    if (istrue(player.var_a18181d8bdaa0dab)) {
                                        if (!istrue(player.gasmaskequipped)) {
                                            player function_81652bad17cd28bd(var_36e462d047634362);
                                        }
                                        player namespace_9c6cddd872ad75f7::processdamage(var_973f8e42fb3c591b);
                                    } else if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                        player playsoundtoplayer("br_gas_mask_break_plr", player);
                                        player namespace_cb965d2f71fefddc::function_4d16b9c52efa3b8();
                                        player namespace_cb965d2f71fefddc::function_8e9b00a1d2b23d72();
                                    } else {
                                        player namespace_cb965d2f71fefddc::function_cdf7f2f6bd3207("br_circle");
                                        player namespace_9c6cddd872ad75f7::processdamage(var_973f8e42fb3c591b);
                                    }
                                } else {
                                    player function_81652bad17cd28bd(var_36e462d047634362);
                                }
                                if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
                                    player namespace_aead94004cf4c147::function_5323bef1ad6244b9(var_973f8e42fb3c591b);
                                }
                            } else {
                                if (getdvarint(@"hash_acff883bb1879e40", 0)) {
                                    logstring("CIRCLE DAMAGE LOGGING: Resetting player gas timer for " + player.name + " during circle index " + index + "for failing canCircleDamagePlayer check.");
                                }
                                player function_6fcdea7a7060ce40();
                            }
                        } else {
                            player function_6fcdea7a7060ce40();
                            if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
                                if (namespace_cb965d2f71fefddc::function_f213f06eba604bbd(player)) {
                                    if (istrue(player.var_a18181d8bdaa0dab)) {
                                        player notify("gasmask_buffer_reset");
                                    } else if (level.var_5312bc14bd5db377 > 0) {
                                        player.var_a18181d8bdaa0dab = 1;
                                        player thread namespace_cb965d2f71fefddc::function_a1d897962a19d27e();
                                    }
                                }
                                if (istrue(player.var_a18181d8bdaa0dab)) {
                                    continue;
                                } else if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                    player playsoundtoplayer("br_gas_mask_break_plr", player);
                                    player namespace_cb965d2f71fefddc::function_4d16b9c52efa3b8();
                                } else {
                                    player namespace_cb965d2f71fefddc::function_8206bc54a1ed73cb("br_circle");
                                }
                            }
                        }
                        if (namespace_36f464722d326bbe::isbrstylegametype()) {
                            player updateindangercirclestate(var_acfa1a113ba7d7c7);
                        }
                        if (var_acfa1a113ba7d7c7) {
                            if (namespace_3c37cb17ade254d::issharedfuncdefined("ftue", "player_action")) {
                                player [[ namespace_3c37cb17ade254d::getsharedfunc("ftue", "player_action") ]]("br_ftue_gas_damage");
                            }
                        }
                    }
                }
                namespace_bbc79db4c3949a5c::function_8c0f978940451524(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a);
            }
        }
        wait(1);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e8
// Size: 0xdd
function function_81652bad17cd28bd(var_36e462d047634362) {
    player = self;
    if (isdefined(level.modifybrgasdamage)) {
        var_36e462d047634362 = player [[ level.modifybrgasdamage ]](var_36e462d047634362);
    }
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        var_36e462d047634362 = namespace_cf880efca02c6010::modifybrgasdamage(var_36e462d047634362);
    }
    var_dc736a03e3446f3 = 1;
    if (isdefined(player.var_c2c2848ce2585f29)) {
        var_dc736a03e3446f3 = var_dc736a03e3446f3 + player.var_c2c2848ce2585f29;
    }
    var_36e462d047634362 = var_36e462d047634362 * var_dc736a03e3446f3;
    if (getdvarint(@"hash_acff883bb1879e40", 0) && var_36e462d047634362 <= 0) {
        logstring("CIRCLE DAMAGE LOGGING: Logging modifiedDamageTick of zero for " + player.name + ".");
    }
    player dodamage(var_36e462d047634362, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
    player namespace_f8d3520d3483c1::damagearmor(var_36e462d047634362);
    player tryplaycoughaudio();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cc
// Size: 0xed
function updateindangercirclestate(isincircle) {
    if (!isdefined(self.isincircle)) {
        self.isincircle = isincircle;
        self.lastcircleeventtime = gettime();
    }
    if (self.isincircle != isincircle) {
        self.isincircle = isincircle;
        namespace_282db5a41b643e19::function_2a32431b16c54b0d();
        currenttime = gettime();
        if (isincircle) {
            startchallengetimer("alive_in_gas");
            namespace_a011fbf6d93f25e5::branalytics_circleenter(self, currenttime - self.lastcircleeventtime);
            namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_gas");
            if (istrue(self.gasmaskequipped)) {
                self clearsoundsubmix("jup_wz_gasmask_nogas");
            }
        } else {
            namespace_aad14af462a74d08::stopchallengetimer("alive_in_gas");
            namespace_a011fbf6d93f25e5::branalytics_circleexit(self, currenttime - self.lastcircleeventtime);
            if (istrue(self.gasmaskequipped)) {
                self setsoundsubmix("jup_wz_gasmask_nogas");
            }
        }
        self.lastcircleeventtime = currenttime;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x35b
function startuiclosetimer(waittime, var_f007ce073dc3c519, var_6b890e6be7982efb, circleindex, skipsplash) {
    level endon("game_ended");
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_hardpoint_timer", gettime() + int(waittime * 1000));
    }
    var_ae2ad6c65a8689f = function_fc0f865ddcf551ad() || getsubgametype() == "zxp" || getsubgametype() == "plunder";
    if (!var_f007ce073dc3c519 && !istrue(skipsplash)) {
        foreach (player in level.players) {
            if (!isbot(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                if (istrue(var_6b890e6be7982efb)) {
                    player thread namespace_44abc05161e2e2cb::showsplash("br_final_circle");
                } else if (!var_ae2ad6c65a8689f || circleindex > 1) {
                    player thread namespace_44abc05161e2e2cb::showsplash("br_new_circle");
                }
            }
        }
    }
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        if (istrue(var_6b890e6be7982efb)) {
            setomnvar("ui_br_circle_state", 3);
        } else {
            setomnvar("ui_br_circle_state", 0);
        }
    }
    var_4f9eb3b7488639db = [0:60, 1:30, 2:20, 3:10, 4:0];
    startindex = var_4f9eb3b7488639db.size - 1;
    for (i = 0; i < var_4f9eb3b7488639db.size; i++) {
        if (waittime > var_4f9eb3b7488639db[i]) {
            startindex = i;
            break;
        }
    }
    if (waittime < var_4f9eb3b7488639db[startindex]) {
        return;
    }
    wait(waittime - var_4f9eb3b7488639db[startindex]);
    for (i = startindex; i < var_4f9eb3b7488639db.size - 1; i++) {
        if (i == 3) {
            if (!isdefined(level.var_e486acb8f70c45a2)) {
                setomnvar("ui_br_circle_state", 2);
            }
            var_a0d948a339eee04 = istrue(level.br_circle.var_a0d948a339eee04) && !(isdefined(level.isstandardsandbox) && !level.isstandardsandbox);
            if (var_a0d948a339eee04) {
                var_2948ca54731de34f = 10.4;
                level thread namespace_3bde6869e44a2770::function_a486df26072a530a(level.br_circle.circleindex, level.br_level.br_circleclosetimes.size, var_2948ca54731de34f);
            }
        }
        wait(var_4f9eb3b7488639db[i] - var_4f9eb3b7488639db[i + 1]);
    }
    level notify("br_circle_closing");
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(0);
    foreach (player in level.players) {
        if (!isbot(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag() && (!var_ae2ad6c65a8689f || circleindex > 0) && !istrue(skipsplash)) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_circle_moving");
            player namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_circle");
            player playlocalsound("br_circle_closing");
        }
    }
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_br_circle_state", 1);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d22
// Size: 0x2c
function _hidesafecircleui() {
    if (getsubgametype() == "champion") {
        return;
    }
    player = self;
    player setclientomnvar("ui_br_circle0_start_time", 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d55
// Size: 0x7c
function setpreviewuicircle(safecircleent) {
    foreach (player in level.players) {
        if (!isbot(player)) {
            player setclientomnvar("ui_br_circle0_start_entity", safecircleent);
            player setclientomnvar("ui_br_circle0_end_entity", safecircleent);
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd8
// Size: 0x125
function setstaticuicircles(duration, safecircleent, var_fb3b2613d6f0eb05, var_6b890e6be7982efb) {
    foreach (p in level.players) {
        if (!isbot(p)) {
            var_416318ee02bcd7d9 = _safecircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle0_start_time", gettime());
            p setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
            p setclientomnvar("ui_br_circle0_start_entity", safecircleent);
            p setclientomnvar("ui_br_circle0_end_entity", safecircleent);
            if (istrue(var_6b890e6be7982efb)) {
                p _hidesafecircleui();
            }
            var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle1_start_time", gettime());
            p setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
            p setclientomnvar("ui_br_circle1_start_entity", var_fb3b2613d6f0eb05);
            p setclientomnvar("ui_br_circle1_end_entity", var_fb3b2613d6f0eb05);
        }
    }
    thread updatecirclehide(duration, safecircleent, var_fb3b2613d6f0eb05);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f04
// Size: 0x126
function setclosinguicircle(duration, safecircleent, var_fb3b2613d6f0eb05, var_6b890e6be7982efb) {
    foreach (p in level.players) {
        if (!isbot(p)) {
            var_416318ee02bcd7d9 = _safecircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle0_start_time", gettime());
            p setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
            p setclientomnvar("ui_br_circle0_start_entity", safecircleent);
            p setclientomnvar("ui_br_circle0_end_entity", safecircleent);
            if (istrue(var_6b890e6be7982efb)) {
                p _hidesafecircleui();
            }
            var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, duration);
            p setclientomnvar("ui_br_circle1_start_time", gettime());
            p setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
            p setclientomnvar("ui_br_circle1_start_entity", var_fb3b2613d6f0eb05);
            p setclientomnvar("ui_br_circle1_end_entity", safecircleent);
        }
    }
    thread updatecirclehide(duration, safecircleent, var_fb3b2613d6f0eb05);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3031
// Size: 0xca
function updatecirclehide(duration, safecircleent, var_fb3b2613d6f0eb05) {
    level notify("update_circle_omnvars");
    level endon("update_circle_omnvars");
    while (1) {
        level waittill("update_circle_hide");
        foreach (p in level.players) {
            if (!isbot(p)) {
                var_416318ee02bcd7d9 = _safecircledurationforplayer(p, duration);
                p setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
                var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, duration);
                p setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
            }
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3102
// Size: 0x2d
function _dangercircledurationforplayer(player, var_c6fa546d9034b033) {
    if (canseedangercircleui()) {
        return int(var_c6fa546d9034b033 * 1000);
    } else {
        return 0;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3136
// Size: 0x2d
function _safecircledurationforplayer(player, var_c6fa546d9034b033) {
    if (canseesafecircleui()) {
        return int(var_c6fa546d9034b033 * 1000);
    } else {
        return 0;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x316a
// Size: 0x5e
function islastcircle() {
    return level.br_circle.circleindex >= level.br_level.br_circleradii.size - 1 || !(level.br_level.br_circleradii[level.br_circle.circleindex + 1] > 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d0
// Size: 0x91
function gettimetillcircleclosing(circleindex, timeoffset) {
    /#
        assert(isdefined(circleindex) && circleindex >= 0);
    #/
    if (!isdefined(timeoffset)) {
        timeoffset = 0;
    }
    var_4a22f0da61f0c1cf = level.br_circle.starttime / 1000;
    var_fbdcfbd6233e2398 = gettime() / 1000 + timeoffset;
    timeremaining = var_fbdcfbd6233e2398 - var_4a22f0da61f0c1cf - level.br_level.br_circledelaytimes[circleindex];
    return max(timeremaining, 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x91
function function_8aeca3abf89a629d(circleindex, timeoffset) {
    /#
        assert(isdefined(circleindex) && circleindex >= 0);
    #/
    if (!isdefined(timeoffset)) {
        timeoffset = 0;
    }
    var_4a22f0da61f0c1cf = level.br_circle.starttime / 1000;
    var_fbdcfbd6233e2398 = gettime() / 1000 + timeoffset;
    timeremaining = var_fbdcfbd6233e2398 - var_4a22f0da61f0c1cf - level.br_level.br_circleclosetimes[circleindex];
    return max(timeremaining, 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3302
// Size: 0x6d
function function_2fb1ab6e77cc6a3d(circleindex) {
    /#
        assert(isdefined(circleindex) && circleindex >= 0);
    #/
    delaytime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    totaltime = delaytime + closetime;
    return totaltime;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3377
// Size: 0x7a
function function_abbfb4d18d1a9ca7() {
    var_382e141c1a44e21b = level.br_circle.circleindex;
    var_8c2ce200a652593d = function_2fb1ab6e77cc6a3d(var_382e141c1a44e21b);
    var_c36de2ea5fc9f896 = level.br_circle.starttime / 1000;
    var_d618cf2b46344a74 = gettime() / 1000 - var_c36de2ea5fc9f896;
    /#
        assert(var_d618cf2b46344a74 >= 0);
    #/
    return var_8c2ce200a652593d - var_d618cf2b46344a74;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f9
// Size: 0x319
function function_bf5f4d7a498988a8(player, var_498e4e279fb8ed85, timeoffset) {
    var_517e15e5e8524c5a = array_randomize(level.teamdata[player.team]["alivePlayers"]);
    var_8dd50db647861d68 = undefined;
    foreach (squadmember in var_517e15e5e8524c5a) {
        if (squadmember != player) {
            var_8dd50db647861d68 = squadmember;
            break;
        }
    }
    if (!isdefined(var_8dd50db647861d68)) {
        return undefined;
    }
    point = var_8dd50db647861d68.origin;
    var_46ba883294abd43 = level.br_circle.circleindex;
    var_c0fc062071351cda = gettimetillcircleclosing(var_46ba883294abd43, var_498e4e279fb8ed85 + timeoffset);
    var_71e46ead9308542c = int(min(var_46ba883294abd43 + 1, level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount - 1));
    var_6f469351639732e2 = level.br_level.br_circleclosetimes[var_46ba883294abd43];
    var_6b1bef6d15c8772c = level.br_level.br_circlecenters[var_46ba883294abd43];
    var_36ee3127e5558d7b = level.br_level.br_circleradii[var_46ba883294abd43];
    var_3bbbb179e51e3809 = level.br_level.br_circlecenters[var_71e46ead9308542c];
    var_7d66506ed0054176 = level.br_level.br_circleradii[var_71e46ead9308542c];
    var_bfba751474cd67a6 = (var_3bbbb179e51e3809 - var_6b1bef6d15c8772c) / var_6f469351639732e2;
    var_11a5c2966a360011 = (var_7d66506ed0054176 - var_36ee3127e5558d7b) / var_6f469351639732e2;
    var_2f5ff20fce786fc1 = var_6b1bef6d15c8772c + var_bfba751474cd67a6 * var_c0fc062071351cda;
    var_cc3b2aa6cc4d0f2e = var_36ee3127e5558d7b + var_11a5c2966a360011 * var_c0fc062071351cda;
    dist = distance2d(point, var_2f5ff20fce786fc1);
    var_40cb6248dee31807 = getdvarint(@"hash_7525f014f690c068", 0);
    var_1fbe1a61e1b49e9b = getdvarfloat(@"hash_f8eebbe68b000328", 1000);
    targetpoint = point + (var_2f5ff20fce786fc1 - point) * var_1fbe1a61e1b49e9b / dist;
    if (isvalidpointinbounds(targetpoint, var_40cb6248dee31807, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    var_75ec7457d721f50d = getdvarfloat(@"hash_921a01e1bee01d8b", 0.5);
    var_1fbe1a61e1b49e9b = dist * var_75ec7457d721f50d;
    targetpoint = point + (var_2f5ff20fce786fc1 - point) * var_1fbe1a61e1b49e9b / dist;
    if (isvalidpointinbounds(targetpoint, var_40cb6248dee31807, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    vector = point - var_2f5ff20fce786fc1;
    targetpoint = var_2f5ff20fce786fc1 + var_cc3b2aa6cc4d0f2e / dist * vector;
    if (isvalidpointinbounds(targetpoint, var_40cb6248dee31807, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371a
// Size: 0x5d
function isvalidpointinbounds(point, var_ae913f2dc0534b48, var_498e4e279fb8ed85) {
    if (!namespace_ad389306d44fc6b4::ispointinbounds(point, 1)) {
        return 0;
    }
    if (istrue(var_ae913f2dc0534b48) && _ispointinbadarea(point)) {
        return 0;
    }
    if (isdefined(var_498e4e279fb8ed85)) {
        var_653bf8aef0b21244 = namespace_c5622898120e827f::getmintimetillpointindangercircle(point);
        if (var_498e4e279fb8ed85 > var_653bf8aef0b21244) {
            return 0;
        }
    }
    return 1;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377f
// Size: 0xf9
function function_fc52ae1478a8fc25(var_cfa336cb6beeec04, var_498e4e279fb8ed85) {
    var_88b32122bf1b04f6 = level.teamdata[self.team]["alivePlayers"];
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent) && isdefined(var_88b32122bf1b04f6)) {
        var_517e15e5e8524c5a = array_sort_with_func(var_88b32122bf1b04f6, &function_dab8de01355c25ec);
        foreach (squadmember in var_517e15e5e8524c5a) {
            if (squadmember != self) {
                if (squadmember namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag() == 0) {
                    var_eb253da880af5bb6 = function_2548c1ccae77830b(squadmember.origin, var_cfa336cb6beeec04, var_498e4e279fb8ed85);
                    if (isdefined(var_eb253da880af5bb6)) {
                        return var_eb253da880af5bb6;
                    }
                }
            }
        }
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3880
// Size: 0x2b
function function_dab8de01355c25ec(player1, player2) {
    return player1.health >= player2.health;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b3
// Size: 0x111
function function_bf16029a7b6ff1fa(var_cfa336cb6beeec04, var_498e4e279fb8ed85) {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        foreach (crate in level.br_pickups.crates) {
            if (!isdefined(crate) || !isdefined(crate.team) || crate.team != self.team) {
                continue;
            }
            if (isdefined(crate.playerscaptured) && isdefined(crate.playerscaptured[self getentitynumber()])) {
                continue;
            }
            var_eb253da880af5bb6 = function_2548c1ccae77830b(crate.origin, var_cfa336cb6beeec04, var_498e4e279fb8ed85);
            if (isdefined(var_eb253da880af5bb6)) {
                return var_eb253da880af5bb6;
            }
        }
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39cc
// Size: 0x1dc
function function_2548c1ccae77830b(targetpos, var_cfa336cb6beeec04, var_498e4e279fb8ed85) {
    var_a9aecd1f10a3ac37 = namespace_bbc79db4c3949a5c::function_de2f1b656ee04ba9();
    var_85a64a18900791a9 = namespace_bbc79db4c3949a5c::function_54798383fa7f572b();
    var_e87e5b35f702a1ed = namespace_bbc79db4c3949a5c::function_7d381171eae99b77();
    var_f8d6627557732d6f = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
    var_40cb6248dee31807 = getdvarint(@"hash_a7a08b8f08b5bc60", 1);
    var_fdab7e6125110779 = undefined;
    var_a243a9012c90f841 = undefined;
    for (index = 0; index < var_a9aecd1f10a3ac37.size; index++) {
        safeorigin = var_a9aecd1f10a3ac37[index];
        var_f434d604c09196aa = var_85a64a18900791a9[index];
        var_ef8f7e66dc0feb2c = var_e87e5b35f702a1ed[index];
        dangerradius = var_f8d6627557732d6f[index];
        var_c6af26ce6f14b427 = var_f434d604c09196aa * var_f434d604c09196aa;
        if (var_c6af26ce6f14b427 > 0) {
            targetdistance = distance2d(targetpos, var_ef8f7e66dc0feb2c);
            var_909901f2c9dd9088 = 4;
            for (var_e950dfdd6e1577dc = var_909901f2c9dd9088; var_e950dfdd6e1577dc >= 0; var_e950dfdd6e1577dc--) {
                testdistance = dangerradius * var_e950dfdd6e1577dc / var_909901f2c9dd9088;
                var_eb253da880af5bb6 = (targetpos - var_ef8f7e66dc0feb2c) * testdistance / targetdistance * var_cfa336cb6beeec04 + var_ef8f7e66dc0feb2c;
                if (isvalidpointinbounds(var_eb253da880af5bb6, var_40cb6248dee31807, var_498e4e279fb8ed85)) {
                    if (getdvarint(@"hash_7017ad29dbedc8b1", 1) == 1 && isnavmeshloaded()) {
                        var_eb253da880af5bb6 = getclosestpointonnavmesh(var_eb253da880af5bb6);
                        jumpiftrue(isvalidpointinbounds(var_eb253da880af5bb6, var_40cb6248dee31807, var_498e4e279fb8ed85)) LOC_000001aa;
                    } else {
                    LOC_000001aa:
                        var_dce4ec4424bb0dd0 = distance2dsquared(var_eb253da880af5bb6, targetpos);
                        if (!isdefined(var_a243a9012c90f841) || var_dce4ec4424bb0dd0 < var_a243a9012c90f841) {
                            var_fdab7e6125110779 = var_eb253da880af5bb6;
                            var_a243a9012c90f841 = var_dce4ec4424bb0dd0;
                        }
                        continue;
                    }
                }
            }
        }
    }
    return var_fdab7e6125110779;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb0
// Size: 0x1ec
function function_177e9958fce17793(targetpos, var_cfa336cb6beeec04, var_498e4e279fb8ed85, var_59e43f8ce6784122) {
    var_a9aecd1f10a3ac37 = namespace_bbc79db4c3949a5c::function_de2f1b656ee04ba9();
    var_85a64a18900791a9 = namespace_bbc79db4c3949a5c::function_54798383fa7f572b();
    var_e87e5b35f702a1ed = namespace_bbc79db4c3949a5c::function_7d381171eae99b77();
    var_f8d6627557732d6f = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
    var_40cb6248dee31807 = getdvarint(@"hash_a7a08b8f08b5bc60", 1);
    var_fdab7e6125110779 = undefined;
    var_a243a9012c90f841 = undefined;
    for (index = 0; index < var_a9aecd1f10a3ac37.size; index++) {
        safeorigin = var_a9aecd1f10a3ac37[index];
        var_f434d604c09196aa = var_85a64a18900791a9[index];
        var_ef8f7e66dc0feb2c = var_e87e5b35f702a1ed[index];
        dangerradius = var_f8d6627557732d6f[index];
        var_c6af26ce6f14b427 = var_f434d604c09196aa * var_f434d604c09196aa;
        if (var_c6af26ce6f14b427 > 0) {
            targetdistance = distance2d(targetpos, var_ef8f7e66dc0feb2c);
            var_909901f2c9dd9088 = 4;
            for (var_e950dfdd6e1577dc = var_909901f2c9dd9088; var_e950dfdd6e1577dc >= 0; var_e950dfdd6e1577dc--) {
                var_265ca91d8fa92c8e = var_e950dfdd6e1577dc / var_909901f2c9dd9088;
                vector = targetpos - var_ef8f7e66dc0feb2c;
                if (targetdistance > dangerradius) {
                    vector = vector / targetdistance * dangerradius;
                }
                var_eb253da880af5bb6 = vector * var_265ca91d8fa92c8e * var_cfa336cb6beeec04 + var_ef8f7e66dc0feb2c;
                if (isvalidpointinbounds(var_eb253da880af5bb6, var_40cb6248dee31807, var_498e4e279fb8ed85)) {
                    if (istrue(var_59e43f8ce6784122) && isnavmeshloaded()) {
                        var_eb253da880af5bb6 = getclosestpointonnavmesh(var_eb253da880af5bb6);
                        jumpiftrue(isvalidpointinbounds(var_eb253da880af5bb6, var_40cb6248dee31807, var_498e4e279fb8ed85)) LOC_000001ba;
                    } else {
                    LOC_000001ba:
                        var_dce4ec4424bb0dd0 = distance2dsquared(var_eb253da880af5bb6, targetpos);
                        if (!isdefined(var_a243a9012c90f841) || var_dce4ec4424bb0dd0 < var_a243a9012c90f841) {
                            var_fdab7e6125110779 = var_eb253da880af5bb6;
                            var_a243a9012c90f841 = var_dce4ec4424bb0dd0;
                        }
                        continue;
                    }
                }
            }
        }
    }
    return var_fdab7e6125110779;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da4
// Size: 0x16f
function getrandompointinboundscircle(origin, radius, var_8108b284f99b128a, var_812bbc84f9c17040, droptoground, var_38a4c729748ad94c, var_ae913f2dc0534b48, var_498e4e279fb8ed85, anglemin, anglemax) {
    var_5c9d9a8b7e76e4f2 = 8;
    var_c6b77e459cbd9727 = origin;
    var_556abf7963472f10 = 0;
    if (!isdefined(anglemin)) {
        anglemin = 0;
    }
    if (!isdefined(anglemax)) {
        anglemax = 360;
    }
    while (var_556abf7963472f10 < var_5c9d9a8b7e76e4f2) {
        randompoint = getrandompointincircle(origin, radius, var_8108b284f99b128a, var_812bbc84f9c17040, 1, 0, anglemin, anglemax);
        if (isvalidpointinbounds(randompoint, var_ae913f2dc0534b48, var_498e4e279fb8ed85)) {
            var_16330882772f973f = randompoint;
            if (istrue(var_38a4c729748ad94c) && isnavmeshloaded()) {
                randompoint = getclosestpointonnavmesh(var_16330882772f973f);
                if (isvalidpointinbounds(randompoint, var_ae913f2dc0534b48, var_498e4e279fb8ed85)) {
                    var_c6b77e459cbd9727 = randompoint;
                    break;
                }
            } else {
                var_c6b77e459cbd9727 = randompoint;
                break;
            }
        }
        dirtocenter = level.br_level.br_circlecenters[0] - origin;
        dirtocenter = (dirtocenter[0], dirtocenter[1], 0);
        yaw = vectortoangles(dirtocenter)[1];
        delta = (1 - var_556abf7963472f10 / var_5c9d9a8b7e76e4f2) * 180;
        anglemin = yaw - delta;
        anglemax = yaw + delta;
        var_556abf7963472f10++;
    }
    return var_c6b77e459cbd9727;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1b
// Size: 0x1f0
function getrandompointincircle(origin, radius, var_8108b284f99b128a, var_812bbc84f9c17040, droptoground, var_38a4c729748ad94c, minangle, maxangle) {
    if (radius <= 0) {
        return origin;
    }
    var_e83450544cf8f718 = 0;
    if (isdefined(var_8108b284f99b128a)) {
        /#
            assert(var_8108b284f99b128a >= 0 && var_8108b284f99b128a <= 1);
        #/
        var_e83450544cf8f718 = var_8108b284f99b128a;
    }
    var_4b623d88fd385c86 = 1;
    if (isdefined(var_812bbc84f9c17040)) {
        /#
            assert(var_812bbc84f9c17040 >= 0 && var_812bbc84f9c17040 <= 1);
        #/
        var_4b623d88fd385c86 = var_812bbc84f9c17040;
    }
    /#
        assert(var_e83450544cf8f718 <= var_4b623d88fd385c86);
    #/
    if (!isdefined(droptoground)) {
        droptoground = 1;
    }
    if (!isdefined(var_38a4c729748ad94c)) {
        var_38a4c729748ad94c = 1;
    }
    if (!isdefined(minangle)) {
        minangle = 0;
    }
    if (!isdefined(maxangle)) {
        maxangle = 360;
    }
    /#
        assert(minangle <= maxangle);
    #/
    var_ddac6dde9be7a08 = squared(radius * var_e83450544cf8f718);
    var_7ef9f894c9f94a26 = squared(radius * var_4b623d88fd385c86);
    r = undefined;
    if (var_ddac6dde9be7a08 == var_7ef9f894c9f94a26) {
        r = sqrt(var_ddac6dde9be7a08);
    } else {
        r = sqrt(randomfloatrange(var_ddac6dde9be7a08, var_7ef9f894c9f94a26));
    }
    theta = minangle + randomfloat(maxangle - minangle);
    offset = (r * cos(theta), r * sin(theta), 0);
    randompoint = origin + offset;
    if (droptoground) {
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
        randompoint = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((origin[0], origin[1], 4000) + offset, undefined, undefined, contents);
    }
    if (var_38a4c729748ad94c && isnavmeshloaded()) {
        randompoint = getclosestpointonnavmesh(randompoint);
    }
    return randompoint;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4113
// Size: 0x64
function getrandompointincurrentcircle(var_8108b284f99b128a, var_812bbc84f9c17040) {
    var_819edacdacb810e4 = getdangercircleorigin();
    dist = level.br_level.br_circleradii[level.br_circle.circleindex + 1];
    return getrandompointincircle(var_819edacdacb810e4, dist, var_8108b284f99b128a, var_812bbc84f9c17040);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417f
// Size: 0x40
function getrandompointinsafecircle(var_8108b284f99b128a, var_812bbc84f9c17040) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    var_77e882da07e78cfe = getsafecircleradius();
    return getrandompointincircle(var_add4fd7502a75a8a, var_77e882da07e78cfe, var_8108b284f99b128a, var_812bbc84f9c17040);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c7
// Size: 0x40
function getrandompointinboundssafecircle(var_8108b284f99b128a, var_812bbc84f9c17040) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    var_77e882da07e78cfe = getsafecircleradius();
    return getrandompointinboundscircle(var_add4fd7502a75a8a, var_77e882da07e78cfe, var_8108b284f99b128a, var_812bbc84f9c17040);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x420f
// Size: 0xc4
function ispointincurrentsafecircle(point) {
    if (!isdefined(level.br_circle.dangercircleent)) {
        return 0;
    }
    var_ddb2971ce26a24a9 = (level.br_circle.dangercircleent.origin[0], level.br_circle.dangercircleent.origin[1], 0);
    var_77e882da07e78cfe = level.br_level.br_circleradii[level.br_circle.circleindex + 1];
    var_2db625e063f40b4 = distance2dsquared(point, var_ddb2971ce26a24a9);
    if (var_2db625e063f40b4 < var_77e882da07e78cfe * var_77e882da07e78cfe) {
        return 1;
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42db
// Size: 0x5a
function ispointinnextsafecircle(point) {
    var_ce1da41cb549917 = getnextsafecircleorigin();
    var_1a7e5abe8e67caab = getnextsafecircleradius();
    if (!isdefined(var_ce1da41cb549917) || !isdefined(var_1a7e5abe8e67caab)) {
        return 0;
    }
    var_2db625e063f40b4 = distance2dsquared(point, var_ce1da41cb549917);
    if (var_2db625e063f40b4 < var_1a7e5abe8e67caab * var_1a7e5abe8e67caab) {
        return 1;
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433d
// Size: 0x4c
function function_c11714256f856e10(point) {
    circleorigin = getdangercircleorigin();
    circleradius = getdangercircleradius();
    var_8fa87d2c8780e014 = circleradius * circleradius;
    if (distance2dsquared(point, circleorigin) < var_8fa87d2c8780e014) {
        return 1;
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4391
// Size: 0x80
function dangercircleenthidefromplayers() {
    self endon("death");
    while (1) {
        self show();
        foreach (player in level.players) {
            if (!player playercanseedangercircleworld()) {
                self hidefromplayer(player);
            }
        }
        level waittill("update_circle_hide");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4418
// Size: 0x567
function function_907a72325980713f(var_1ba38423d163b2f6, var_baa9e68ccfc47d07, circleindex) {
    /#
        level notify("br_new_circle");
        level endon("br_new_circle");
        var_b7965b0fcb4595c1 = [];
        if (!isdefined(var_1ba38423d163b2f6)) {
            var_1ba38423d163b2f6 = 1000;
        }
        if (!isdefined(var_baa9e68ccfc47d07)) {
            var_baa9e68ccfc47d07 = 10;
        }
        if (!isdefined(circleindex)) {
            circleindex = level.br_level.br_circlecenters.size - 1 - level.br_level.br_movingcirclecount;
        }
        var_4e9bdd57294562fd = level.mapcorners[0].origin[0];
        var_4e78e757291f3143 = level.mapcorners[1].origin[0];
        if (var_4e78e757291f3143 < var_4e9bdd57294562fd) {
            var_4e9bdd57294562fd = level.mapcorners[1].origin[0];
            var_4e78e757291f3143 = level.mapcorners[0].origin[0];
        }
        var_f77b805c2452218a = var_4e78e757291f3143 - var_4e9bdd57294562fd;
        var_d3426ff50f0ff497 = var_f77b805c2452218a / var_baa9e68ccfc47d07;
        var_a056773a8ab0b014 = level.mapcorners[0].origin[1];
        var_a07a653a8ad90336 = level.mapcorners[1].origin[1];
        if (var_a07a653a8ad90336 < var_a056773a8ab0b014) {
            var_a056773a8ab0b014 = level.mapcorners[1].origin[1];
            var_a07a653a8ad90336 = level.mapcorners[0].origin[1];
        }
        var_c2e5ddd5c3fe2389 = var_a07a653a8ad90336 - var_a056773a8ab0b014;
        var_b3dd581cafbd5000 = var_c2e5ddd5c3fe2389 / var_baa9e68ccfc47d07;
        var_48237baced1fe61c = [];
        for (x = 0; x < var_baa9e68ccfc47d07; x++) {
            var_48237baced1fe61c[x] = [];
            for (y = 0; y < var_baa9e68ccfc47d07; y++) {
                var_48237baced1fe61c[x][y] = 0;
            }
        }
        var_caf66225b1870aef = 500;
        maxcount = 0;
        for (i = 0; i < var_1ba38423d163b2f6; i++) {
            var_926527df010af9f4 = !circleindex || circleindex == level.br_level.br_circlecenters.size - 1 - level.br_level.br_movingcirclecount;
            namespace_d04031d92bc84201::function_f92da29572a7dc78();
            _precalcsafecirclecenters(undefined, 1, var_926527df010af9f4);
            point = level.br_level.br_circlecenters[circleindex];
            var_bf6a113c5a54166f = point[0];
            if (var_bf6a113c5a54166f < var_4e9bdd57294562fd || var_bf6a113c5a54166f > var_4e78e757291f3143) {
                continue;
            }
            x = int((var_bf6a113c5a54166f - var_4e9bdd57294562fd) / (var_4e78e757291f3143 - var_4e9bdd57294562fd) * var_baa9e68ccfc47d07);
            var_bf6a103c5a54143c = point[1];
            if (var_bf6a103c5a54143c < var_a056773a8ab0b014 || var_bf6a103c5a54143c > var_a07a653a8ad90336) {
                continue;
            }
            y = int((var_bf6a103c5a54143c - var_a056773a8ab0b014) / (var_a07a653a8ad90336 - var_a056773a8ab0b014) * var_baa9e68ccfc47d07);
            var_48237baced1fe61c[x][y] = var_48237baced1fe61c[x][y] + 1;
            if (var_48237baced1fe61c[x][y] > maxcount) {
                maxcount = var_48237baced1fe61c[x][y];
            }
            if (!((i + 1) % var_caf66225b1870aef)) {
                waitframe();
            }
        }
        _precalcsafecirclecenters();
        var_9acc94e86eecaf7a = maxcount;
        for (x = 0; x < var_baa9e68ccfc47d07; x++) {
            for (y = 0; y < var_baa9e68ccfc47d07; y++) {
                if (var_48237baced1fe61c[x][y] < var_9acc94e86eecaf7a) {
                    var_9acc94e86eecaf7a = var_48237baced1fe61c[x][y];
                }
            }
        }
        var_f9b6dedd4ffef774 = maxcount - var_9acc94e86eecaf7a;
        while (1) {
            for (x = 0; x <= var_baa9e68ccfc47d07; x++) {
                line((var_4e9bdd57294562fd + x * var_d3426ff50f0ff497, var_a056773a8ab0b014, 0), (var_4e9bdd57294562fd + x * var_d3426ff50f0ff497, var_a07a653a8ad90336, 0), (1, 1, 0));
            }
            for (y = 0; y <= var_baa9e68ccfc47d07; y++) {
                line((var_4e9bdd57294562fd, var_a056773a8ab0b014 + y * var_d3426ff50f0ff497, 0), (var_4e78e757291f3143, var_a056773a8ab0b014 + y * var_d3426ff50f0ff497, 0), (1, 1, 0));
            }
            for (x = 0; x < var_baa9e68ccfc47d07; x++) {
                for (y = 0; y < var_baa9e68ccfc47d07; y++) {
                    count = var_48237baced1fe61c[x][y];
                    if (count == 0) {
                        continue;
                    }
                    if (var_f9b6dedd4ffef774) {
                        colorfrac = (count - var_9acc94e86eecaf7a) / var_f9b6dedd4ffef774;
                    } else {
                        colorfrac = 1;
                    }
                    if (colorfrac < 0.25) {
                        color = (0, colorfrac / 0.25, 1);
                    } else if (colorfrac < 0.5) {
                        colorfrac = colorfrac - 0.25;
                        color = (0, 1, 1 - colorfrac / 0.25);
                    } else if (colorfrac < 0.75) {
                        colorfrac = colorfrac - 0.5;
                        color = (colorfrac / 0.25, 1, 0);
                    } else {
                        colorfrac = colorfrac - 0.75;
                        color = (1, 1 - colorfrac / 0.25, 0);
                    }
                    scale = var_d3426ff50f0ff497 / 32;
                    print3d((var_4e9bdd57294562fd + x * var_d3426ff50f0ff497 + var_d3426ff50f0ff497 / 2, var_a056773a8ab0b014 + y * var_d3426ff50f0ff497 + var_b3dd581cafbd5000 / 2, 0), "Minimap radius not defined for circle " + count, color, 1, scale, 1, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4986
// Size: 0x202
function function_184d1e23ec969c18(var_53b0cc913f0a5693) {
    /#
        level notify("! Make sure you have defined level.br_level.br_circleMinimapRadii[] in the map's init().");
        level endon("! Make sure you have defined level.br_level.br_circleMinimapRadii[] in the map's init().");
        if (isdefined(level.var_184d1e23ec969c18)) {
            level.var_184d1e23ec969c18 = undefined;
            return;
        }
        level.var_184d1e23ec969c18 = 1;
        var_998d5050dd5178af = [];
        for (i = 0; i < var_53b0cc913f0a5693; i++) {
            namespace_d04031d92bc84201::function_f92da29572a7dc78();
            _precalcsafecirclecenters(undefined, 1);
            var_3db3628ca5e80be6 = spawnstruct();
            var_3db3628ca5e80be6.var_8ae269616d09dfc5 = arraycopy(level.br_level.br_circlecenters);
            var_3db3628ca5e80be6.color = (randomfloatrange(0.2, 1), randomfloatrange(0.2, 1), randomfloatrange(0.2, 1));
            var_998d5050dd5178af[var_998d5050dd5178af.size] = var_3db3628ca5e80be6;
        }
        var_19d2bb8732ff3326 = level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount - 1;
        var_c0ca6b50bc70866f = 1;
        while (1) {
            foreach (var_3db3628ca5e80be6 in var_998d5050dd5178af) {
                var_8ae269616d09dfc5 = var_3db3628ca5e80be6.var_8ae269616d09dfc5;
                color = var_3db3628ca5e80be6.color;
                circleindex = var_c0ca6b50bc70866f;
                while (circleindex <= var_19d2bb8732ff3326) {
                    print3d(var_8ae269616d09dfc5[circleindex], "Minimap radius not defined for circle " + circleindex, color, 1, 25, 1);
                    sphere(var_8ae269616d09dfc5[circleindex], 180, color, 0, 1);
                    if (circleindex != var_c0ca6b50bc70866f) {
                        cylinder(var_8ae269616d09dfc5[circleindex - 1], var_8ae269616d09dfc5[circleindex], 20, color, 1, 0, 1);
                    }
                    circleindex = circleindex + 1;
                }
            }
            waitframe();
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8f
// Size: 0xb4
function function_64f6d9b4ba95ed35(var_21231f7b22a75955) {
    if (isdefined(var_21231f7b22a75955)) {
        level.br_circle.br_finalcircleoverride = var_21231f7b22a75955;
        return;
    }
    level.br_circle.br_finalcircleoverride = undefined;
    var_d7bd8769331c5b66 = getdvarvector(@"hash_eb589c6bd2884bbb", (0, 0, 0));
    if (length(var_d7bd8769331c5b66) > 0) {
        level.br_circle.br_finalcircleoverride = var_d7bd8769331c5b66;
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("getFinalCircleCenter")) {
        level.br_circle.br_finalcircleoverride = namespace_71073fa38f11492::runbrgametypefunc("getFinalCircleCenter");
    }
    function_84e5ef30b000ef20();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4a
// Size: 0x130
function function_84e5ef30b000ef20() {
    if (!isdefined(level.br_level.var_257dee2bbc2480f5)) {
        return;
    }
    var_e60bfc21d3dced49 = getdvarint(@"hash_d87502944afeee16", 0);
    if (isdefined(level.br_multi_circle) && isdefined(level.br_multi_circle.var_e60bfc21d3dced49)) {
        var_e60bfc21d3dced49 = level.br_multi_circle.var_e60bfc21d3dced49;
    }
    if (!isdefined(level.var_da89dff7e3009777)) {
        function_72cbdb2550894694();
    }
    if (!level.var_da89dff7e3009777.size) {
        return;
    }
    if (var_e60bfc21d3dced49 == 0 || getdvarint(@"hash_50f3248965c9dd60", 0)) {
        var_c9bbe66d20810a2b = randomint(level.var_da89dff7e3009777.size);
        level.br_circle.br_finalcircleoverride = level.var_da89dff7e3009777[var_c9bbe66d20810a2b].origin;
    } else {
        var_e943e46f29a2e1ce = function_8e888649a8178cea(var_e60bfc21d3dced49);
        if (isdefined(var_e943e46f29a2e1ce)) {
            level.br_circle.br_finalcircleoverride = level.var_da89dff7e3009777[var_e943e46f29a2e1ce].origin;
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d81
// Size: 0x1bf
function function_72cbdb2550894694() {
    level.var_da89dff7e3009777 = [];
    for (row = 0; 1; row++) {
        var_9a1612bf33a317b1 = tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 1);
        if (var_9a1612bf33a317b1 == "") {
            break;
        }
        var_406edb7edd9769a2 = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 5));
        if (!istrue(var_406edb7edd9769a2)) {
            var_be9720eaaaa043e = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 0));
            locationx = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 2));
            locationy = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 3));
            locationz = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 4));
            stringref = tablelookupistringbyrow(level.br_level.var_257dee2bbc2480f5, row, 6);
            var_7d64a7c122b67e8a = spawnstruct();
            var_7d64a7c122b67e8a.name = var_9a1612bf33a317b1;
            var_7d64a7c122b67e8a.id = var_be9720eaaaa043e;
            var_7d64a7c122b67e8a.origin = (locationx, locationy, locationz);
            var_7d64a7c122b67e8a.stringref = stringref;
            level.var_da89dff7e3009777[level.var_da89dff7e3009777.size] = var_7d64a7c122b67e8a;
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f47
// Size: 0x85
function function_8e888649a8178cea(var_ef1c0e3fa372d6f8) {
    var_be9720eaaaa043e = undefined;
    validlocations = level.var_da89dff7e3009777;
    foreach (index, location in validlocations) {
        if (var_ef1c0e3fa372d6f8 == location.id) {
            var_be9720eaaaa043e = index;
        }
    }
    return var_be9720eaaaa043e;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd4
// Size: 0xc0
function _ispointinbadarea(point) {
    if (getdvarint(@"hash_507e524ae2b21f76", 0) == 1) {
        return 0;
    }
    if (!isdefined(level.br_badcircleareas) || level.br_badcircleareas.size == 0) {
        return 0;
    }
    foreach (area in level.br_badcircleareas) {
        distsq = distance2dsquared(point, area.origin);
        if (distsq < area.radiussq) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509c
// Size: 0xef
function function_5ad21cddca41580f(circleindex) {
    var_5aa1b0e46123e5b4 = getdvarfloat(@"hash_35d088c38ab6c27", 0.7);
    var_7a50883c31353c77 = var_5aa1b0e46123e5b4 * getdvarfloat(@"hash_917b939513f89b55", 200);
    radius = level.br_level.br_circleradii[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    prevradius = level.br_level.br_circleradii[circleindex + 1];
    var_6041996e5ca4b1f3 = radius - prevradius;
    var_c9f9b6297ab4434a = var_6041996e5ca4b1f3 / closetime;
    var_599ca8aac66aed6f = max(0, var_7a50883c31353c77 - var_c9f9b6297ab4434a);
    var_797b88a97bedc494 = var_599ca8aac66aed6f * closetime;
    return var_797b88a97bedc494;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5193
// Size: 0x154
function function_d45be26e9bfb904(var_50c422b464b3e15d, var_ad4d828d3b1da2e6, var_b7c9fe00120ea96c) {
    var_85e19d6780a13308 = [];
    var_5ad9a6da6c84c786 = level.br_level.br_circlecenters[var_50c422b464b3e15d];
    var_3404b12d2adf615b = level.br_level.br_circlecenters[var_ad4d828d3b1da2e6];
    var_eb03f3d04f21f2b = distance2d(var_3404b12d2adf615b, var_5ad9a6da6c84c786);
    var_370050a3c3a88a8f = 0;
    for (circleindex = var_50c422b464b3e15d; circleindex >= var_ad4d828d3b1da2e6; circleindex--) {
        var_85e19d6780a13308[circleindex] = function_5ad21cddca41580f(circleindex);
        var_370050a3c3a88a8f = var_370050a3c3a88a8f + var_85e19d6780a13308[circleindex];
    }
    if (var_370050a3c3a88a8f < var_eb03f3d04f21f2b) {
        if (!istrue(var_b7c9fe00120ea96c)) {
            dlog_recordevent("dlog_event_br_circle_fixed_distance_warning", [0:"circle_distance", 1:var_eb03f3d04f21f2b, 2:"max_circle_distance", 3:var_370050a3c3a88a8f]);
        }
        var_370050a3c3a88a8f = var_eb03f3d04f21f2b;
    }
    var_e108608e4d70e433 = var_370050a3c3a88a8f - var_eb03f3d04f21f2b;
    var_46f89614eb4490f4 = [];
    foreach (circleindex, movedist in var_85e19d6780a13308) {
        var_46f89614eb4490f4[circleindex] = movedist - var_e108608e4d70e433 * movedist / var_370050a3c3a88a8f;
    }
    return var_46f89614eb4490f4;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ef
// Size: 0x14c
function function_4ae4729139de5b5c(circleindex, movedist, var_69d632877542196f, var_38a4c729748ad94c) {
    var_7bb01beb74a0dc89 = level.br_level.br_circlecenters[circleindex + 1];
    var_c6d2479dfc6ccd98 = level.br_level.br_circlecenters[var_69d632877542196f];
    var_c0cb87deaceeb1c0 = distance2d(var_7bb01beb74a0dc89, var_c6d2479dfc6ccd98);
    var_9789125f918a5a79 = var_c0cb87deaceeb1c0 - movedist;
    var_c6789737f9e7468d = var_7bb01beb74a0dc89 - var_c6d2479dfc6ccd98;
    var_f700ce08c40eab6d = vectortoangles(var_c6789737f9e7468d)[1];
    var_797b88a97bedc494 = function_5ad21cddca41580f(circleindex);
    var_d4e52415eaeb9fc6 = (var_9789125f918a5a79 * var_9789125f918a5a79 + var_c0cb87deaceeb1c0 * var_c0cb87deaceeb1c0 - var_797b88a97bedc494 * var_797b88a97bedc494) / 2 * var_9789125f918a5a79 * var_c0cb87deaceeb1c0;
    var_d4e52415eaeb9fc6 = clamp(var_d4e52415eaeb9fc6, -1, 1);
    var_aef5a331ed08af8f = acos(var_d4e52415eaeb9fc6);
    anglemin = var_f700ce08c40eab6d - var_aef5a331ed08af8f;
    anglemax = var_f700ce08c40eab6d + var_aef5a331ed08af8f;
    circlecenter = getrandompointinboundscircle(var_c6d2479dfc6ccd98, var_9789125f918a5a79, 1, 1, 1, var_38a4c729748ad94c, 1, undefined, anglemin, anglemax);
    return circlecenter;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5443
// Size: 0x6c
function function_23be439885e300bd(var_50c422b464b3e15d, var_ad4d828d3b1da2e6, var_38a4c729748ad94c) {
    var_bdd890aa9e9f45a0 = function_d45be26e9bfb904(var_50c422b464b3e15d, var_ad4d828d3b1da2e6);
    for (circleindex = var_50c422b464b3e15d - 1; circleindex > var_ad4d828d3b1da2e6; circleindex--) {
        level.br_level.br_circlecenters[circleindex] = function_4ae4729139de5b5c(circleindex, var_bdd890aa9e9f45a0[circleindex], var_ad4d828d3b1da2e6, var_38a4c729748ad94c);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b6
// Size: 0xd26
function _precalcsafecirclecenters(var_21231f7b22a75955, var_b7c9fe00120ea96c, var_437c3e3159a04f4e) {
    function_64f6d9b4ba95ed35(var_21231f7b22a75955);
    level.br_level.br_circlecenters = [];
    mapcenter = (level.br_circle.mapbounds[0] + level.br_circle.mapbounds[1]) * 0.5;
    level.br_level.br_circlecenters[0] = (mapcenter[0], mapcenter[1], 0);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("mapCenterFinalCircle")) {
        mapcenter = namespace_71073fa38f11492::runbrgametypefunc("mapCenterFinalCircle");
        if (isdefined(mapcenter)) {
            level.br_level.br_circlecenters[0] = (mapcenter[0], mapcenter[1], 0);
        }
    }
    centerx = mapcenter[0];
    centery = mapcenter[1];
    if (istrue(level.br_level.staticcircle)) {
        level.br_level.br_circlecenters[0] = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((centerx, centery, 4000));
        level.br_level.br_circlecenters[1] = level.br_level.br_circlecenters[0];
        return;
    }
    var_44007e72f56f988b = getdvarint(@"hash_b9941bb7847f3ca", 1);
    var_b4715d17a358590a = getdvarvector(@"hash_394a1a053c87ca53", level.br_level.br_circlecenters[0]);
    var_f5dd795b027a31a8 = getdvarfloat(@"hash_be07e52acb983430", 30);
    var_b3ac9b6e95d79e0e = getdvarfloat(@"hash_94d6e49f6f5a39b6", 180);
    var_6692bcf69c8ab74 = getdvarfloat(@"hash_357248a19e6e2e6c", 10000);
    var_d62a50630c1a525a = getdvarfloat(@"hash_8b1c4ddad73b9352", 30000);
    var_b0fdc1a74465d5b3 = getdvarfloat(@"hash_14f6d33e8f4f0c84", 0);
    var_ba2d3e495cf92c77 = var_b0fdc1a74465d5b3 * level.br_level.br_circleradii[1];
    var_dcb0ccfa24d727ca = [];
    var_dcb0ccfa24d727ca[0] = level.br_circle.mapbounds[0][0] - var_ba2d3e495cf92c77;
    var_dcb0ccfa24d727ca[1] = level.br_circle.mapbounds[0][1] - var_ba2d3e495cf92c77;
    var_dcb0ccfa24d727ca[2] = level.br_circle.mapbounds[1][0] + var_ba2d3e495cf92c77;
    var_dcb0ccfa24d727ca[3] = level.br_circle.mapbounds[1][1] + var_ba2d3e495cf92c77;
    var_4e9bdd57294562fd = min(var_dcb0ccfa24d727ca[0], var_dcb0ccfa24d727ca[2]);
    var_4e78e757291f3143 = max(var_dcb0ccfa24d727ca[0], var_dcb0ccfa24d727ca[2]);
    var_a056773a8ab0b014 = min(var_dcb0ccfa24d727ca[1], var_dcb0ccfa24d727ca[3]);
    var_a07a653a8ad90336 = max(var_dcb0ccfa24d727ca[1], var_dcb0ccfa24d727ca[3]);
    var_c0013e62498c366b = function_3011d71052d72d2a();
    circlecenter = var_c0013e62498c366b[1];
    var_91c2149316242976 = var_c0013e62498c366b[0];
    var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
    if (!var_38a4c729748ad94c && namespace_71073fa38f11492::isfeatureenabled("circleSnapToNavMesh")) {
        var_38a4c729748ad94c = 1;
    }
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
    var_2082f17f2e1c69bf = level.br_level.br_circleradii.size - 1 - level.br_level.br_movingcirclecount;
    var_8aeea60c4409a34f = function_88f7b8fa20846f45();
    if (isdefined(var_8aeea60c4409a34f)) {
        var_ec56dfc4f3659de2 = var_8aeea60c4409a34f + 1;
    } else {
        var_ec56dfc4f3659de2 = var_2082f17f2e1c69bf + 1;
    }
    if (isdefined(level.br_circle.br_finalcircleoverride)) {
        var_976dda17532fe2c3 = level.br_circle.br_finalcircleoverride[0];
        var_976dd917532fe090 = level.br_circle.br_finalcircleoverride[1];
        ispointinbounds = namespace_ad389306d44fc6b4::ispointinbounds((var_976dda17532fe2c3, var_976dd917532fe090, 0), 1);
        var_6e3da7022558f910 = _ispointinbadarea((var_976dda17532fe2c3, var_976dd917532fe090, 0));
        var_7956a8d6f7b21ee9 = ispointinbounds && !var_6e3da7022558f910;
        if (var_7956a8d6f7b21ee9) {
            centerx = var_976dda17532fe2c3;
            centery = var_976dd917532fe090;
        }
    } else if (isdefined(var_91c2149316242976)) {
        centerx = var_91c2149316242976[0];
        centery = var_91c2149316242976[1];
        if (getdvarint(@"hash_bbf992a979df8e2c", 0) == 1) {
            level.br_level.br_circlecenters[0] = (circlecenter[0], circlecenter[1], 0);
        }
    } else if (var_ec56dfc4f3659de2 <= var_2082f17f2e1c69bf) {
        var_ba149b26e90ddf8b = function_676cfe2ab64ea758() / 1000;
        var_b02651f1768dc98a = [];
        var_d1f607fb279e67b1 = [];
        for (index = 0; index < var_2082f17f2e1c69bf; index++) {
            var_b02651f1768dc98a[index] = level.br_level.br_circleclosetimes[index] + level.br_level.br_circledelaytimes[index] + var_ba149b26e90ddf8b;
            var_d1f607fb279e67b1[index] = level.br_level.var_572a1674797a9fa8[index];
        }
        flag_wait("wztrain_array_set");
        var_2a89c7b0c1c8790a = undefined;
        var_7544a4e82ac345b2 = 0;
        if (issharedfuncdefined("br_movingtrain", "predictCargoTrainPositions")) {
            var_53cf92a0f79db880 = getsharedfunc("br_movingtrain", "predictCargoTrainPositions");
            var_2a89c7b0c1c8790a = [[ var_53cf92a0f79db880 ]](var_b02651f1768dc98a, var_d1f607fb279e67b1, level.br_level.var_564911cbc1774914, var_7544a4e82ac345b2);
            centerx = var_2a89c7b0c1c8790a[var_2082f17f2e1c69bf - 1][0];
            centery = var_2a89c7b0c1c8790a[var_2082f17f2e1c69bf - 1][1];
        } else {
            /#
                assertmsg("Cannot find train functions to predict circle centers!");
            #/
        }
    } else {
        var_5c9d9a8b7e76e4f2 = 8;
        for (var_556abf7963472f10 = 0; var_556abf7963472f10 < var_5c9d9a8b7e76e4f2; var_556abf7963472f10++) {
            var_976dda17532fe2c3 = randomfloatrange(var_4e9bdd57294562fd, var_4e78e757291f3143);
            var_976dd917532fe090 = randomfloatrange(var_a056773a8ab0b014, var_a07a653a8ad90336);
            if (namespace_ad389306d44fc6b4::ispointinbounds((var_976dda17532fe2c3, var_976dd917532fe090, 0), 1) && !_ispointinbadarea((var_976dda17532fe2c3, var_976dd917532fe090, 0))) {
                var_45481dbe05c81f00 = 1;
                if (var_38a4c729748ad94c && isnavmeshloaded()) {
                    groundpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((var_976dda17532fe2c3, var_976dd917532fe090, 4000), undefined, undefined, contents);
                    navmeshpoint = getclosestpointonnavmesh(groundpos);
                    if (distance2dsquared(navmeshpoint, (var_976dda17532fe2c3, var_976dd917532fe090, 0)) > 10000) {
                        var_45481dbe05c81f00 = 0;
                    }
                }
                if (var_45481dbe05c81f00) {
                    centerx = var_976dda17532fe2c3;
                    centery = var_976dd917532fe090;
                    break;
                }
            }
            var_4e9bdd57294562fd = var_4e9bdd57294562fd * 0.9;
            var_4e78e757291f3143 = var_4e78e757291f3143 * 0.9;
            var_a056773a8ab0b014 = var_a056773a8ab0b014 * 0.9;
            var_a07a653a8ad90336 = var_a07a653a8ad90336 * 0.9;
        }
    }
    level.br_level.br_circlecenters[var_2082f17f2e1c69bf] = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((centerx, centery, 4000));
    if (istrue(var_437c3e3159a04f4e)) {
        return;
    }
    var_7a50883c31353c77 = getdvarfloat(@"hash_917b939513f89b55", 200);
    var_11c1e6222da58849 = getdvarint(@"hash_e65611a4d524bcbe", 0);
    var_2c81885db7212a3a = var_2082f17f2e1c69bf;
    circleindex = var_2082f17f2e1c69bf - 1;
    for (var_69d632877542196f = var_2082f17f2e1c69bf; var_69d632877542196f >= 0; var_69d632877542196f--) {
        if (getdvarint(function_2ef675c13ca1c4af(@"hash_6e15be73eb8cd142", var_69d632877542196f), 0)) {
            var_eec904e8534cd82d = getdvarvector(function_2ef675c13ca1c4af(@"hash_1f5d1ccbe88f98a5", var_69d632877542196f), (0, 0, 0));
            level.br_level.br_circlecenters[var_69d632877542196f] = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((var_eec904e8534cd82d[0], var_eec904e8534cd82d[1], 4000));
            function_23be439885e300bd(var_2c81885db7212a3a, var_69d632877542196f, var_38a4c729748ad94c);
            var_2c81885db7212a3a = var_69d632877542196f;
            circleindex = var_69d632877542196f - 1;
        }
    }
    while (circleindex >= 0) {
        if (circleindex >= var_ec56dfc4f3659de2 && isdefined(var_2a89c7b0c1c8790a)) {
            circlecenter = var_2a89c7b0c1c8790a[circleindex - 1];
            level.br_level.br_circlecenters[circleindex] = namespace_d3d40f75bb4e4c32::droptogroundmultitrace((circlecenter[0], circlecenter[1], 4000));
        } else {
            origin = level.br_level.br_circlecenters[circleindex + 1];
            radius = level.br_level.br_circleradii[circleindex];
            var_9bedd0ecb39838d6 = 0;
            var_d6bac3bf0f64d280 = 1 - level.br_level.br_circleradii[circleindex + 1] / radius;
            if (isdefined(level.br_circle.var_bf394857229861a5) && isfunction(level.br_circle.var_bf394857229861a5)) {
                var_c0013d62498c3438 = [[ level.br_circle.var_bf394857229861a5 ]](circleindex + 1);
                var_a82bed82fd7fcb04 = var_c0013d62498c3438[1];
                var_5bd850c4e76ad14e = var_c0013d62498c3438[0];
                if (isdefined(var_5bd850c4e76ad14e)) {
                    var_9bedd0ecb39838d6 = max(var_5bd850c4e76ad14e, var_9bedd0ecb39838d6);
                }
                if (isdefined(var_a82bed82fd7fcb04)) {
                    var_d6bac3bf0f64d280 = min(var_a82bed82fd7fcb04, var_d6bac3bf0f64d280);
                }
            }
            var_b1d0bc03029f6a2c = var_9bedd0ecb39838d6 + randomfloat(var_d6bac3bf0f64d280 - var_9bedd0ecb39838d6);
            closetime = level.br_level.br_circleclosetimes[circleindex];
            prevradius = level.br_level.br_circleradii[circleindex + 1];
            var_6041996e5ca4b1f3 = radius - prevradius;
            var_c9f9b6297ab4434a = var_6041996e5ca4b1f3 / closetime;
            var_599ca8aac66aed6f = max(0, var_7a50883c31353c77 - var_c9f9b6297ab4434a);
            var_797b88a97bedc494 = var_599ca8aac66aed6f * closetime;
            var_6443d240572e7a5b = var_797b88a97bedc494 / radius;
            var_3f139f4756ad700e = var_b1d0bc03029f6a2c > var_6443d240572e7a5b;
            if (var_3f139f4756ad700e && !istrue(var_b7c9fe00120ea96c)) {
                var_9ed6827753db2370 = var_c9f9b6297ab4434a + var_b1d0bc03029f6a2c * radius / closetime;
                dlog_recordevent("dlog_event_br_circle_speed_warning", [0:"player_speed", 1:var_7a50883c31353c77, 2:"circle_speed", 3:var_9ed6827753db2370, 4:"circle_close_time", 5:float(closetime), 6:"circle_current_radius", 7:float(radius), 8:"circle_next_radius", 9:float(prevradius)]);
            }
            if (circleindex) {
                if (var_11c1e6222da58849 && var_3f139f4756ad700e) {
                    var_b1d0bc03029f6a2c = var_9bedd0ecb39838d6 + randomfloat(var_6443d240572e7a5b - var_9bedd0ecb39838d6);
                }
                anglemin = undefined;
                anglemax = undefined;
                if (var_44007e72f56f988b) {
                    var_8589033a649df46b = var_b4715d17a358590a - origin;
                    var_d6480fb0c703c3ab = vectortoangles(var_8589033a649df46b);
                    var_579b7163dc769db7 = var_d6480fb0c703c3ab[1];
                    var_c89123f941c94f8d = length2d(var_8589033a649df46b);
                    theta = namespace_d3f3cb0a543667c1::remap(var_c89123f941c94f8d, var_d62a50630c1a525a, var_6692bcf69c8ab74, var_f5dd795b027a31a8, var_b3ac9b6e95d79e0e);
                    theta = clamp(theta, var_f5dd795b027a31a8, var_b3ac9b6e95d79e0e);
                    anglemin = var_579b7163dc769db7 - theta * 0.5;
                    anglemax = var_579b7163dc769db7 + theta * 0.5;
                }
                level.br_level.br_circlecenters[circleindex] = getrandompointinboundscircle(origin, radius, var_b1d0bc03029f6a2c, var_b1d0bc03029f6a2c, 1, var_38a4c729748ad94c, 1, undefined, anglemin, anglemax);
                goto LOC_00000c3d;
            }
        LOC_00000c3d:
        }
    LOC_00000c3d:
        circleindex--;
    }
    for (circleindex = var_2082f17f2e1c69bf + 1; circleindex < var_2082f17f2e1c69bf + 1 + level.br_level.br_movingcirclecount; circleindex++) {
        var_9d2610f6a0b725a4 = level.br_level.br_circleradii[circleindex - 1];
        var_a754cfa0ff072630 = level.br_level.br_circlecenters[circleindex - 1];
        var_2e8e1bbffd8bc082 = level.br_level.br_circleradii[circleindex];
        mindist = var_9d2610f6a0b725a4 + var_2e8e1bbffd8bc082 + level.br_level.br_movingcirclemovedistmin;
        maxdist = var_9d2610f6a0b725a4 + var_2e8e1bbffd8bc082 + level.br_level.br_movingcirclemovedistmax;
        level.br_level.br_circlecenters[circleindex] = getrandompointinboundscircle(var_a754cfa0ff072630, maxdist, mindist / maxdist, 1, 1, var_38a4c729748ad94c, 1);
    }
    level notify("calc_circle_centers");
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61e3
// Size: 0x226
function function_3011d71052d72d2a() {
    var_2e156443240a8e4b = [];
    totalweight = 0;
    var_84c71fbaede8b93d = getdvarint(@"hash_29097e089cd5654f", 0);
    for (i = 0; i < var_84c71fbaede8b93d; i++) {
        pos = getdvarvector(function_2ef675c13ca1c4af(@"hash_97bfc9bb98165cc0", i));
        var_7e682884c9ae9926 = spawnstruct();
        var_7e682884c9ae9926.pos = pos;
        var_7e682884c9ae9926.radius = getdvarfloat(function_2ef675c13ca1c4af(@"hash_7ee50d7eb0ae1f7b", i), 0);
        weight = getdvarfloat(function_2ef675c13ca1c4af(@"hash_2bd6e0674bf7c8ed", i), 1);
        if (weight > 0) {
            totalweight = totalweight + weight;
            var_7e682884c9ae9926.weight = totalweight;
            var_2e156443240a8e4b[var_2e156443240a8e4b.size] = var_7e682884c9ae9926;
        }
    }
    if (!var_2e156443240a8e4b.size) {
        return [0:undefined, 1:undefined];
    }
    var_901f7f6175b781f0 = undefined;
    var_384446a35f40358c = getdvarint(@"hash_2cc91c52f62a55e0", -1);
    if (var_384446a35f40358c >= 0) {
        if (var_384446a35f40358c < var_2e156443240a8e4b.size) {
            var_901f7f6175b781f0 = var_2e156443240a8e4b[var_384446a35f40358c];
        }
    } else {
        rand = randomfloatrange(0, totalweight);
        for (i = 0; i < var_2e156443240a8e4b.size; i++) {
            if (rand < var_2e156443240a8e4b[i].weight) {
                var_901f7f6175b781f0 = var_2e156443240a8e4b[i];
                break;
            }
        }
    }
    if (!isdefined(var_901f7f6175b781f0)) {
        return [0:undefined, 1:undefined];
    }
    if (var_901f7f6175b781f0.radius > 0) {
        var_59af6e9bfe7cf735 = getrandompointinboundscircle(var_901f7f6175b781f0.pos, var_901f7f6175b781f0.radius, 0, 1, 1, 1, 1);
        return [0:var_59af6e9bfe7cf735, 1:var_901f7f6175b781f0.pos];
    } else {
        return [0:var_901f7f6175b781f0.pos, 1:var_901f7f6175b781f0.pos];
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6410
// Size: 0x3f
function runcircles(var_7b6d5db8cb3c5782) {
    level endon("game_ended");
    level endon("br_ending_start");
    if (isdefined(level.var_80c1e8e18146024f)) {
        [[ level.var_80c1e8e18146024f ]](var_7b6d5db8cb3c5782);
    } else {
        function_3f9dc64647891e08(var_7b6d5db8cb3c5782);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6456
// Size: 0x324
function function_3f9dc64647891e08(var_7b6d5db8cb3c5782) {
    level.br_circle.safecircleent = spawn("script_model", (level.br_level.br_circlecenters[1][0], level.br_level.br_circlecenters[1][1], level.br_level.br_circleradii[1]));
    level.br_circle.safecircleent.hidden = 0;
    level.br_circle.safecircleui = spawn("script_model", level.br_circle.safecircleent.origin);
    level.br_circle.safecircleui.hidden = 0;
    level.br_circle.dangercircleent = spawnbrcircle(level.br_level.br_circlecenters[0][0], level.br_level.br_circlecenters[0][1], level.br_level.br_circleradii[0]);
    level.br_circle.dangercircleent.hidden = 0;
    level.br_circle.dangercircleent thread dangercircleenthidefromplayers();
    level.br_circle.dangercircleui = spawn("script_model", level.br_circle.dangercircleent.origin);
    level.br_circle.dangercircleui.hidden = 0;
    hidedangercircle();
    function_2f4fb0777ebb4cc0();
    setpreviewuicircle(level.br_circle.safecircleent);
    if (istrue(var_7b6d5db8cb3c5782) && !namespace_71073fa38f11492::isfeatureenabled("circleEarlyStart") && !istrue(level.br_prematchstarted)) {
        level waittill("infils_ready");
    }
    if (istrue(level.usegulag)) {
        namespace_47fd1e79a44628cd::setupgulagtimer();
    }
    showdangercircle();
    level.br_circle thread circledamagetick();
    level thread stopcirclesatgameend();
    level.br_circle.var_5b8569581e64d55a = gettime();
    if (isdefined(level.br_level.br_circledelaytimes)) {
        for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
            circletimer(i);
        }
    }
    if (isdefined(level.var_20f62868a14ab570)) {
        foreach (callback in level.var_20f62868a14ab570) {
            [[ callback ]]();
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6781
// Size: 0x39
function stopcirclesatgameend() {
    level notify("stopCirclesAtGameEnd");
    level endon("stopCirclesAtGameEnd");
    level waittill_any_2("game_ended", "br_ending_start");
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        setomnvar("ui_hardpoint_timer", 0);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c1
// Size: 0xd9
function getcircleindexforpoint(point, var_e5437a537345261f) {
    if (!isdefined(var_e5437a537345261f)) {
        var_e5437a537345261f = 0;
    }
    if (!isdefined(level.br_circle)) {
        return -1;
    }
    circleindex = -1;
    for (i = var_e5437a537345261f; i < level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount; i++) {
        center = level.br_level.br_circlecenters[i];
        radius = level.br_level.br_circleradii[i];
        dist = distance2d(point, center);
        if (dist >= radius) {
            break;
        }
        circleindex = i;
    }
    return circleindex;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a2
// Size: 0x4b1
function getmintimetillpointindangercircle(point) {
    if (istrue(level.br_circle_disabled)) {
        return 99999;
    }
    if (!isdefined(level.br_circle)) {
        return -1;
    }
    if (istrue(level.br_level.staticcircle)) {
        return -1;
    }
    var_cf876cd1a06753f5 = 0;
    if (level.br_circle.circleindex >= 0) {
        circleindex = level.br_circle.circleindex;
        var_e39d8e5a89e12a3e = level.br_circle.starttime;
        currentradius = level.br_circle.dangercircleent.origin[2];
        currentorigin = level.br_circle.dangercircleent.origin;
        if (circleindex >= level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount) {
            return var_cf876cd1a06753f5;
        }
    } else {
        circleindex = 0;
        var_e39d8e5a89e12a3e = gettime();
        currentradius = level.br_level.br_circleradii[0];
        currentorigin = level.br_level.br_circlecenters[0];
    }
    var_93971b25bd669411 = getdvarint(@"hash_cf757888073e9093", 0);
    if (var_93971b25bd669411) {
        if (distance2d(currentorigin, point) > currentradius) {
            return var_cf876cd1a06753f5;
        }
        pointindex = getcircleindexforpoint(point, circleindex + 1);
        if (pointindex == -1) {
            pointindex = circleindex;
        }
    } else {
        pointindex = getcircleindexforpoint(point);
    }
    if (pointindex < 0) {
        return var_cf876cd1a06753f5;
    } else if (pointindex < circleindex) {
        return var_cf876cd1a06753f5;
    } else if (pointindex == circleindex) {
        if (distance2d(currentorigin, point) > currentradius) {
            return var_cf876cd1a06753f5;
        }
    }
    for (i = circleindex + 1; i < pointindex; i++) {
        var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + level.br_level.br_circleclosetimes[i];
        var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + level.br_level.br_circledelaytimes[i];
    }
    delaytime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    timepassed = (gettime() - var_e39d8e5a89e12a3e) / 1000;
    if (pointindex > circleindex) {
        if (getsubgametype() == "champion" && pointindex == level.br_level.br_circlecenters.size - 1) {
            return -1;
        }
        totaltime = delaytime + closetime;
        var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + totaltime - timepassed;
        var_465df4a45cdb81bf = pointindex;
        startorigin = level.br_level.br_circlecenters[pointindex];
        endorigin = level.br_level.br_circlecenters[pointindex + 1];
        startradius = level.br_level.br_circleradii[pointindex];
        var_15b8ff04c24c09f4 = level.br_level.br_circleradii[pointindex + 1];
        var_b6af11757b612ba3 = level.br_level.br_circledelaytimes[pointindex];
        var_465cca2d81f6b88e = level.br_level.br_circleclosetimes[pointindex];
    } else {
        var_465df4a45cdb81bf = circleindex;
        startorigin = currentorigin;
        endorigin = level.br_level.br_circlecenters[circleindex + 1];
        startradius = currentradius;
        var_15b8ff04c24c09f4 = level.br_level.br_circleradii[circleindex + 1];
        if (timepassed < delaytime) {
            var_b6af11757b612ba3 = delaytime - timepassed;
            var_465cca2d81f6b88e = closetime;
        } else {
            var_b6af11757b612ba3 = 0;
            var_465cca2d81f6b88e = closetime - timepassed - delaytime;
        }
    }
    if (function_d6f728b66bd3966(var_465df4a45cdb81bf) && var_b6af11757b612ba3 > 0) {
        var_63471afdb08176f2 = vectorlerp(startorigin, endorigin, var_b6af11757b612ba3 / (var_b6af11757b612ba3 + var_465cca2d81f6b88e));
        if (distance2d(var_63471afdb08176f2, point) >= startradius) {
            var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + function_3fa958de973c98c6(point, startorigin, var_63471afdb08176f2, startradius, startradius, var_b6af11757b612ba3);
            return var_cf876cd1a06753f5;
        } else {
            startorigin = var_63471afdb08176f2;
        }
    }
    var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + var_b6af11757b612ba3;
    var_cf876cd1a06753f5 = var_cf876cd1a06753f5 + function_3fa958de973c98c6(point, startorigin, endorigin, startradius, var_15b8ff04c24c09f4, var_465cca2d81f6b88e);
    return var_cf876cd1a06753f5;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5b
// Size: 0x223
function function_3fa958de973c98c6(point, startorigin, endorigin, startradius, var_15b8ff04c24c09f4, timeremaining) {
    startradius = float(startradius);
    var_15b8ff04c24c09f4 = float(var_15b8ff04c24c09f4);
    a = point[0];
    b = startorigin[0];
    var_df4d16c922bdbe0e = a - b;
    c = (endorigin[0] - startorigin[0]) / timeremaining;
    cs = c * c;
    d = point[1];
    e = startorigin[1];
    var_7738731431557520 = d - e;
    f = (endorigin[1] - startorigin[1]) / timeremaining;
    var_ce2d3278f5802032 = f * f;
    g = startradius;
    gs = g * g;
    h = (var_15b8ff04c24c09f4 - startradius) / timeremaining;
    hs = h * h;
    var_b079c3030126650f = pow(2 * c * var_df4d16c922bdbe0e + 2 * f * var_7738731431557520 + 2 * g * h, 2) - 4 * (-1 * cs - var_ce2d3278f5802032 + hs) * (-1 * pow(var_df4d16c922bdbe0e, 2) - pow(var_7738731431557520, 2) + gs);
    p1 = sqrt(max(0, var_b079c3030126650f));
    p2 = -2 * c * var_df4d16c922bdbe0e - 2 * f * var_7738731431557520 - 2 * g * h;
    p3 = 2 * (-1 * cs - var_ce2d3278f5802032 + hs);
    if (p3 == 0) {
        return 0;
    }
    var_6512ad0441b0016d = (-1 * p1 + p2) / p3;
    pos = (p1 + p2) / p3;
    if (var_6512ad0441b0016d < 0) {
        return pos;
    } else if (pos < 0) {
        return var_6512ad0441b0016d;
    } else {
        return min(var_6512ad0441b0016d, pos);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f85
// Size: 0x6e
function hidedangercircle() {
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleui)) {
        return;
    }
    level.br_circle.dangercircleui.hidden++;
    level.br_circle.dangercircleent.hidden++;
    level notify("update_circle_hide");
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ffa
// Size: 0x47
function hidesafecircle() {
    level.br_circle.safecircleui.hidden++;
    level.br_circle.safecircleent.hidden++;
    level notify("update_circle_hide");
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7048
// Size: 0x132
function showdangercircle() {
    var_a899490687f828c6 = level.br_circle.dangercircleent.hidden || level.br_circle.dangercircleent.hidden;
    level.br_circle.dangercircleui.hidden--;
    level.br_circle.dangercircleent.hidden--;
    /#
        assert(level.br_circle.dangercircleui.hidden >= 0);
    #/
    /#
        assert(level.br_circle.dangercircleent.hidden >= 0);
    #/
    ishidden = level.br_circle.dangercircleui.hidden || level.br_circle.dangercircleent.hidden;
    if (var_a899490687f828c6 && !ishidden) {
        level notify("update_circle_hide");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7181
// Size: 0x132
function showsafecircle() {
    var_a899490687f828c6 = level.br_circle.safecircleui.hidden || level.br_circle.safecircleent.hidden;
    level.br_circle.safecircleui.hidden--;
    level.br_circle.safecircleent.hidden--;
    /#
        assert(level.br_circle.safecircleui.hidden >= 0);
    #/
    /#
        assert(level.br_circle.safecircleent.hidden >= 0);
    #/
    ishidden = level.br_circle.safecircleui.hidden || level.br_circle.safecircleent.hidden;
    if (var_a899490687f828c6 && !ishidden) {
        level notify("update_circle_hide");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72ba
// Size: 0x67a
function circletimer(circleindex) {
    level endon("game_ended");
    level endon("br_ending_start");
    /#
        function_673b160b18fe0611();
    #/
    if (istrue(namespace_71073fa38f11492::runbrgametypefunc("circleTimer", circleindex))) {
        return;
    }
    level.br_circle.starttime = gettime();
    level.br_circle.circleindex = circleindex;
    var_f007ce073dc3c519 = circleindex == 0;
    var_6b890e6be7982efb = circleindex == level.br_level.br_circleclosetimes.size - 1;
    var_c3d4caa5cb4132e6 = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    var_154ef61b7a7f747a = level.br_level.br_circleradii[circleindex + 1];
    if (function_fc0f865ddcf551ad()) {
        setomnvar("ui_br_circle_num", circleindex);
    } else {
        setomnvar("ui_br_circle_num", circleindex + 1);
    }
    thread namespace_47fd1e79a44628cd::circletimer(circleindex);
    namespace_71073fa38f11492::runbrgametypefunc("circleTimerNext", circleindex);
    /#
        assertex(isdefined(level.br_level.br_circleminimapradii[circleindex]), "Minimap radius not defined for circle " + circleindex + "! Make sure you have defined level.br_level.br_circleMinimapRadii[] in the map's init().");
    #/
    level thread br_lerp_minimap_zoom(circleindex);
    var_5a6e343a8574af81 = level.br_level.br_circlecenters[circleindex + 1];
    level.br_circle.centertarget = var_5a6e343a8574af81;
    level.br_circle.safecircleent.origin = (level.br_circle.centertarget[0], level.br_circle.centertarget[1], var_154ef61b7a7f747a);
    level.respawnclosets = gathervalidspawnclosets(var_5a6e343a8574af81, var_154ef61b7a7f747a);
    cleanupoutercrates();
    gatheroutercrates(var_5a6e343a8574af81, var_154ef61b7a7f747a);
    var_a9ed63230d9a3c95 = level.br_level.br_circleshowdelaydanger[circleindex];
    if (var_a9ed63230d9a3c95 > 0) {
        hidedangercircle();
        delaythread(var_a9ed63230d9a3c95, &showdangercircle);
    }
    var_4f48a6344ec8a9c7 = level.br_level.br_circleshowdelaysafe[circleindex];
    if (var_4f48a6344ec8a9c7 > 0) {
        hidesafecircle();
        delaythread(var_4f48a6344ec8a9c7, &showsafecircle);
    }
    level thread startuiclosetimer(var_c3d4caa5cb4132e6, var_f007ce073dc3c519, var_6b890e6be7982efb, circleindex);
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = getdangercircleorigin() + (0, 0, getdangercircleradius());
    setstaticuicircles(var_c3d4caa5cb4132e6, level.br_circle.safecircleui, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    if (canplaycircleopendialog(circleindex)) {
        if (var_f007ce073dc3c519) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("first_circle", 1, undefined, undefined, 0.5);
        } else {
            namespace_d3d40f75bb4e4c32::brleaderdialog("new_circle", 1, undefined, undefined, 0.5);
        }
    }
    if (istrue(level.usegulag)) {
        level thread namespace_47fd1e79a44628cd::transitioncircle(var_154ef61b7a7f747a, var_c3d4caa5cb4132e6);
    }
    level notify("br_circle_set");
    wait(var_c3d4caa5cb4132e6);
    function_2f4fb0777ebb4cc0();
    level notify("br_circle_started");
    level.circleclosing = 1;
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_hardpoint_timer", gettime() + int(closetime * 1000));
    }
    if (canplaycircleclosedialog(circleindex)) {
        if (var_6b890e6be7982efb) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("final_circle", 1, undefined, undefined, 0.5);
        } else {
            namespace_d3d40f75bb4e4c32::brleaderdialog("circle_closing", 1, undefined, undefined, 0.5);
            thread brcirclebattlechatter(circleindex);
        }
    }
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = getdangercircleorigin() + (0, 0, getdangercircleradius());
    setclosinguicircle(int(closetime), level.br_circle.safecircleent, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    level.br_circle.dangercircleent brcirclemoveto(level.br_circle.centertarget[0], level.br_circle.centertarget[1], var_154ef61b7a7f747a, closetime);
    var_e499790b0786eb88 = !istrue(level.br_circle.var_a0d948a339eee04) && !(isdefined(level.isstandardsandbox) && !level.isstandardsandbox);
    if (var_e499790b0786eb88) {
        level thread namespace_3bde6869e44a2770::function_a486df26072a530a(level.br_circle.circleindex, level.br_level.br_circleclosetimes.size, 0.4);
    }
    wait(closetime);
    function_2f4fb0777ebb4cc0();
    if (resetdangercircleorigin(circleindex)) {
        if (getdvarint(@"hash_e0a1364a76dd764e", 1)) {
            level.br_circle.dangercircleent.origin = (level.br_circle.centertarget[0], level.br_circle.centertarget[1], var_154ef61b7a7f747a);
        }
    }
    namespace_71073fa38f11492::runbrgametypefunc("onCloseCircleCompleted", var_6b890e6be7982efb);
    var_f2da81fb842e7a5e = 5;
    if (var_f2da81fb842e7a5e > 0 && circleindex < var_f2da81fb842e7a5e) {
        namespace_62c556437da28f50::addglobalrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
        namespace_4cd6e0abb58d4200::addweaponrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
    }
    level notify("br_circle_closed");
    level.circleclosing = 0;
    if (isdefined(var_5a6e343a8574af81) && isdefined(var_154ef61b7a7f747a)) {
        cleanupouterspawnclosets(var_5a6e343a8574af81, var_154ef61b7a7f747a);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793b
// Size: 0x14
function function_ab678f36f465fdeb() {
    return getdvarint(@"hash_47d8674c992e098", 0) > 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7957
// Size: 0x1f
function function_4bff90e55e5e18e4() {
    return istrue(function_ab678f36f465fdeb()) && getdvarint(@"hash_192990fc79b06600", 0) > 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x797e
// Size: 0x3d
function function_e32a50f37301a6ab() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.ispaused)) {
        return level.br_circle.ispaused;
    }
    return 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79c3
// Size: 0xa6
function function_64aeda8c8a4179c5(value) {
    if (!istrue(function_ab678f36f465fdeb()) || !isdefined(level.br_circle) || isdefined(level.br_circle.ispaused) && level.br_circle.ispaused == value) {
        return;
    }
    level.br_circle.ispaused = value;
    if (istrue(level.br_circle.ispaused)) {
        level.br_circle notify("circle_paused");
    } else {
        level.br_circle notify("circle_unpaused");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a70
// Size: 0x28
function function_2f4fb0777ebb4cc0() {
    if (istrue(function_ab678f36f465fdeb()) && istrue(function_e32a50f37301a6ab())) {
        level.br_circle waittill("circle_unpaused");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a9f
// Size: 0x148
function br_lerp_minimap_zoom(circleindex) {
    level endon("game_ended");
    if (circleindex > 0) {
        var_6d5b4e7465608df0 = circleindex - 1;
        var_48d779f8598f6791 = level.br_level.br_circleminimapradii[circleindex];
        var_d4659de197d07387 = level.br_level.br_circleminimapradii[var_6d5b4e7465608df0];
        if (var_48d779f8598f6791 == var_d4659de197d07387) {
            return;
        }
        var_d533f7d3fb526d13 = 0.05;
        var_661a636dbc7d54b5 = 2;
        var_7f479bce3abf8b1b = var_661a636dbc7d54b5 / var_d533f7d3fb526d13;
        var_777913b6f66c8417 = int((var_d4659de197d07387 - var_48d779f8598f6791) / var_7f479bce3abf8b1b);
        var_d1f50321d77c76dc = level.br_level.br_circleminimapradii[var_6d5b4e7465608df0];
        for (i = 0; i < var_7f479bce3abf8b1b; i++) {
            var_d1f50321d77c76dc = var_d1f50321d77c76dc - var_777913b6f66c8417;
            setomnvar("ui_br_minimap_radius", var_d1f50321d77c76dc);
            wait(var_d533f7d3fb526d13);
        }
        setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[circleindex]);
    } else {
        setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[circleindex]);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bee
// Size: 0x131
function cleanupouterspawnclosets(center, var_f434d604c09196aa) {
    var_76c9a6fb0ec8375a = var_f434d604c09196aa * var_f434d604c09196aa;
    if (isdefined(level.revivetriggers)) {
        foreach (guid, revive in level.revivetriggers) {
            if (isdefined(revive) && distance2dsquared(center, revive.trigger.origin) > var_76c9a6fb0ec8375a) {
                var_97b398030664c65a = gathervalidspawnclosets(revive.trigger.origin, var_f434d604c09196aa);
                if (isdefined(var_97b398030664c65a) && var_97b398030664c65a.size > 0) {
                    /#
                        println("_scale" + var_97b398030664c65a.size + "] " + var_97b398030664c65a[0].origin);
                    #/
                    revive.victim namespace_7db13bdf599e41a6::relocatetrigger(var_97b398030664c65a[0].origin);
                } else {
                    revive.victim namespace_7db13bdf599e41a6::removetrigger(guid);
                }
            }
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d26
// Size: 0x42
function gathervalidspawnclosets(center, var_77e882da07e78cfe) {
    if (isdefined(level.respawnclosets)) {
        respawnclosets = get_array_of_closest(center, level.respawnclosets, undefined, undefined, var_77e882da07e78cfe);
        return respawnclosets;
    }
    return undefined;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d70
// Size: 0xbf
function gatheroutercrates(center, var_f434d604c09196aa) {
    var_76c9a6fb0ec8375a = var_f434d604c09196aa * var_f434d604c09196aa;
    foreach (crate in level.br_pickups.crates) {
        if (isdefined(crate) && distance2dsquared(center, crate.origin) > var_76c9a6fb0ec8375a) {
            level.br_pickups.outercrates[level.br_pickups.outercrates.size] = crate;
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e36
// Size: 0x8e
function cleanupoutercrates() {
    foreach (crate in level.br_pickups.outercrates) {
        if (isdefined(crate) && crate.curprogress == 0) {
            crate thread namespace_6c578d6ef48f10ef::destroycrate();
        }
    }
    level.br_pickups.outercrates = [];
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ecb
// Size: 0x16
function function_37a87bb09c54ad61(var_1a85aeb37218323c) {
    /#
        var_1a85aeb37218323c[var_1a85aeb37218323c.size] = undefined;
        return var_1a85aeb37218323c;
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ee8
// Size: 0x139
function function_17f6274b4504ead2() {
    /#
        /#
            assert(!isdefined(level.br_level.circle_defaults));
        #/
        level.br_level.circle_defaults = spawnstruct();
        defaults = level.br_level.circle_defaults;
        defaults.br_circleradii = function_37a87bb09c54ad61(level.br_level.br_circleradii);
        defaults.br_circleclosetimes = function_37a87bb09c54ad61(level.br_level.br_circleclosetimes);
        defaults.br_circledelaytimes = function_37a87bb09c54ad61(level.br_level.br_circledelaytimes);
        defaults.br_circleminimapradii = function_37a87bb09c54ad61(level.br_level.br_circleminimapradii);
        defaults.br_circleshowdelaydanger = function_37a87bb09c54ad61(level.br_level.br_circleshowdelaydanger);
        defaults.br_circleshowdelaysafe = function_37a87bb09c54ad61(level.br_level.br_circleshowdelaysafe);
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8028
// Size: 0x11f
function function_536560624d05801b() {
    /#
        /#
            assert(isdefined(level.br_level.circle_defaults));
        #/
        defaults = level.br_level.circle_defaults;
        level.br_level.br_circleradii = function_37a87bb09c54ad61(defaults.br_circleradii);
        level.br_level.br_circleclosetimes = function_37a87bb09c54ad61(defaults.br_circleclosetimes);
        level.br_level.br_circledelaytimes = function_37a87bb09c54ad61(defaults.br_circledelaytimes);
        level.br_level.br_circleminimapradii = function_37a87bb09c54ad61(defaults.br_circleminimapradii);
        level.br_level.br_circleshowdelaydanger = function_37a87bb09c54ad61(defaults.br_circleshowdelaydanger);
        level.br_level.br_circleshowdelaysafe = function_37a87bb09c54ad61(defaults.br_circleshowdelaysafe);
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x814e
// Size: 0x3f
function array_init_fill(value, count) {
    array = [];
    for (i = 0; i < count; i++) {
        array[array.size] = value;
    }
    return array;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8195
// Size: 0x118
function array_init_distribute(value, num, reverse, a, b, c) {
    results = [];
    if (!isdefined(a)) {
        a = 0;
    }
    if (!isdefined(b)) {
        b = 0.5;
    }
    if (!isdefined(c)) {
        c = 0.1;
    }
    if (!isdefined(reverse)) {
        reverse = 0;
    }
    var_f74b2939ee4938d8 = a / 3 + b / 2 + c;
    for (i = 0; i < num; i++) {
        if (reverse) {
            index = num - i - 1;
        } else {
            index = i;
        }
        var_2e68460884b8a6c9 = (a * (6 * i * i + 6 * i + 2) + 3 * num * (2 * b * i + b + 2 * c * num)) / 6 * num * num * num;
        var_6f2c137ad115bcd2 = var_2e68460884b8a6c9 / var_f74b2939ee4938d8;
        results[index] = var_6f2c137ad115bcd2 * value;
    }
    return results;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b5
// Size: 0x2d9
function extendcirclelist(circleradius, var_4f81729168c0b8a, var_35c9dcaf6de45f41, var_83536127fa3a72aa, var_f32810da2b97b928, var_8e386906eab86e36) {
    if (!isdefined(var_f32810da2b97b928)) {
        var_f32810da2b97b928 = 0;
    }
    if (!isdefined(var_8e386906eab86e36)) {
        var_8e386906eab86e36 = 0;
    }
    if (!isarray(circleradius)) {
        circleradius = [0:circleradius];
    }
    if (!isarray(var_4f81729168c0b8a)) {
        var_4f81729168c0b8a = array_init_fill(var_4f81729168c0b8a, circleradius.size);
    }
    if (!isarray(var_35c9dcaf6de45f41)) {
        var_35c9dcaf6de45f41 = array_init_fill(var_35c9dcaf6de45f41, circleradius.size);
    }
    if (!isarray(var_83536127fa3a72aa)) {
        var_83536127fa3a72aa = array_init_fill(var_83536127fa3a72aa, circleradius.size);
    }
    if (!isarray(var_f32810da2b97b928)) {
        var_f32810da2b97b928 = array_init_fill(var_f32810da2b97b928, circleradius.size);
    }
    if (!isarray(var_8e386906eab86e36)) {
        var_8e386906eab86e36 = array_init_fill(var_8e386906eab86e36, circleradius.size);
    }
    /#
        assert(circleradius.size == var_4f81729168c0b8a.size);
    #/
    /#
        assert(circleradius.size == var_35c9dcaf6de45f41.size);
    #/
    /#
        assert(circleradius.size == var_83536127fa3a72aa.size);
    #/
    /#
        assert(circleradius.size == var_f32810da2b97b928.size);
    #/
    /#
        assert(circleradius.size == var_8e386906eab86e36.size);
    #/
    var_31259e6ba118ff73 = level.br_level.br_circleradii[level.br_level.br_circleradii.size - 1];
    level.br_level.br_circleradii[level.br_level.br_circleradii.size - 1] = undefined;
    for (i = 0; i < circleradius.size; i++) {
        size = level.br_level.br_circleradii.size;
        level.br_level.br_circleradii[size] = circleradius[i];
        size = level.br_level.br_circleclosetimes.size;
        level.br_level.br_circleclosetimes[size] = var_4f81729168c0b8a[i];
        size = level.br_level.br_circledelaytimes.size;
        level.br_level.br_circledelaytimes[size] = var_35c9dcaf6de45f41[i];
        size = level.br_level.br_circleminimapradii.size;
        level.br_level.br_circleminimapradii[size] = var_83536127fa3a72aa[i];
        size = level.br_level.br_circleshowdelaydanger.size;
        level.br_level.br_circleshowdelaydanger[size] = var_f32810da2b97b928[i];
        size = level.br_level.br_circleshowdelaysafe.size;
        level.br_level.br_circleshowdelaysafe[size] = var_8e386906eab86e36[i];
    }
    level.br_level.br_circleradii[level.br_level.br_circleradii.size] = var_31259e6ba118ff73;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8595
// Size: 0x120
function deletecircle(circleindex) {
    level.br_level.br_circleradii = array_remove_index(level.br_level.br_circleradii, circleindex);
    level.br_level.br_circleclosetimes = array_remove_index(level.br_level.br_circleclosetimes, circleindex);
    level.br_level.br_circledelaytimes = array_remove_index(level.br_level.br_circledelaytimes, circleindex);
    level.br_level.br_circleminimapradii = array_remove_index(level.br_level.br_circleminimapradii, circleindex);
    level.br_level.br_circleshowdelaydanger = array_remove_index(level.br_level.br_circleshowdelaydanger, circleindex);
    level.br_level.br_circleshowdelaysafe = array_remove_index(level.br_level.br_circleshowdelaysafe, circleindex);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86bc
// Size: 0xd66
function applymovingcircles() {
    if (!getdvarint(@"hash_39a8907d7f184021", 1) || namespace_71073fa38f11492::isfeaturedisabled("movingCircle")) {
        level.br_level.br_movingcirclecount = 0;
        return;
    }
    level.br_level.br_movingcirclecount = getdvarint(@"hash_2499127213b409af", 0);
    level.br_level.br_movingcirclemovedistmin = getdvarfloat(@"hash_c2162f0faf12f429", 100);
    level.br_level.br_movingcirclemovedistmax = getdvarfloat(@"hash_c1f3210faeec8da7", 300);
    preset = getdvarint(@"hash_7edc88917d09c24f", 0);
    var_209967c144016964 = level.br_level.br_circleradii.size - 1;
    switch (preset) {
    case 1:
        if (!level.br_level.br_movingcirclecount) {
            level.br_level.br_movingcirclecount = 4;
        }
        var_15b8ff04c24c09f4 = level.br_level.br_circleradii[var_209967c144016964];
        var_31259e6ba118ff73 = level.br_level.br_circleradii[var_209967c144016964 - 1];
        var_441e40c8389d209a = level.br_level.br_circleclosetimes[var_209967c144016964 - 1];
        var_2b5a25974fad05d1 = level.br_level.br_circledelaytimes[var_209967c144016964 - 1];
        var_d750aeced79dfb3a = level.br_level.br_circleminimapradii[var_209967c144016964 - 1];
        deletecircle(var_209967c144016964 - 1);
        var_f59ab661ba766221 = level.br_level.br_movingcirclecount;
        var_b7ab27868f552bc2 = getdvarvector(@"hash_4cd7066d8ea6d39d", (0, 1, 0));
        circleradius = [];
        var_c34091cf26e77f50 = array_init_distribute(var_31259e6ba118ff73 - var_15b8ff04c24c09f4, var_f59ab661ba766221 + 1, 1, var_b7ab27868f552bc2[0], var_b7ab27868f552bc2[1], var_b7ab27868f552bc2[2]);
        delta = 0;
        for (i = 0; i < var_f59ab661ba766221; i++) {
            delta = delta + var_c34091cf26e77f50[i];
            circleradius[i] = var_31259e6ba118ff73 - delta;
        }
        var_b7ab27868f552bc2 = getdvarvector(@"hash_b6771b3f9e9fdd90", (0, 1, 0.125));
        time_scale = getdvarfloat(@"hash_52f861c9d86fc540", 1);
        time_ratio = getdvarfloat(@"hash_fe0dae92131847f9", 0.5);
        var_7588325a3f6a6120 = (var_441e40c8389d209a + var_441e40c8389d209a) * time_scale;
        var_4f81729168c0b8a = array_init_distribute(var_7588325a3f6a6120 * time_ratio, var_f59ab661ba766221, 1, var_b7ab27868f552bc2[0], var_b7ab27868f552bc2[1], var_b7ab27868f552bc2[2]);
        var_35c9dcaf6de45f41 = array_init_distribute(var_7588325a3f6a6120 * (1 - time_ratio), var_f59ab661ba766221, 1, var_b7ab27868f552bc2[0], var_b7ab27868f552bc2[1], var_b7ab27868f552bc2[2]);
        extendcirclelist(circleradius, var_4f81729168c0b8a, var_35c9dcaf6de45f41, var_d750aeced79dfb3a);
        break;
    case 2:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [0:1200, 1:900, 2:600, 3:300];
        var_4f81729168c0b8a = [0:30, 1:30, 2:30, 3:30];
        delaytime = [0:30, 1:20, 2:10, 3:0];
        var_1afd23e03d011ec6 = [0:5500, 1:5000, 2:4500, 3:4000];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 3:
        level.br_level.br_movingcirclecount = 5;
        circleradius = [0:1200, 1:900, 2:600, 3:300];
        var_4f81729168c0b8a = [0:30, 1:30, 2:30, 3:30];
        delaytime = [0:30, 1:20, 2:10, 3:0];
        var_1afd23e03d011ec6 = [0:5500, 1:5000, 2:4500, 3:4000];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 4:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 1500;
        var_2f36026c369a82a2 = 750 + randomint(301);
        var_2f36036c369a84d5 = 1000 + randomint(301);
        circleradius = [0:var_2f36016c369a806f, 1:var_2f36016c369a806f, 2:var_2f36026c369a82a2, 3:var_2f36036c369a84d5];
        var_4f81729168c0b8a = [0:30, 1:30, 2:30, 3:45];
        delaytime = [0:10, 1:5, 2:5, 3:0];
        var_1afd23e03d011ec6 = [0:5500, 1:5500, 2:5500, 3:5500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 5:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [0:1500, 1:1500, 2:1000, 3:600];
        var_4f81729168c0b8a = [0:30, 1:30, 2:20, 3:20];
        delaytime = [0:30, 1:30, 2:20, 3:20];
        var_1afd23e03d011ec6 = [0:4000, 1:3000, 2:2000, 3:1000];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 6:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 1500;
        var_2f36026c369a82a2 = 750 + randomint(301);
        var_2f36036c369a84d5 = 1000 + randomint(301);
        circleradius = [0:var_2f36016c369a806f, 1:var_2f36016c369a806f, 2:var_2f36026c369a82a2, 3:var_2f36036c369a84d5];
        var_4f81729168c0b8a = [0:30, 1:30, 2:30, 3:45];
        delaytime = [0:10, 1:5, 2:5, 3:0];
        var_1afd23e03d011ec6 = [0:5500, 1:5500, 2:5500, 3:5500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 7:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 3500;
        var_2f36026c369a82a2 = 1250 + randomint(501);
        var_2f36036c369a84d5 = 750 + randomint(501);
        var_2f35fc6c369a7570 = 750 + randomint(301);
        circleradius = [0:var_2f36016c369a806f, 1:var_2f36026c369a82a2, 2:var_2f36036c369a84d5, 3:var_2f35fc6c369a7570];
        var_4f81729168c0b8a = [0:40, 1:30, 2:25, 3:25];
        delaytime = [0:15, 1:10, 2:5, 3:0];
        var_1afd23e03d011ec6 = [0:5500, 1:5500, 2:5500, 3:5500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 8:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [0:2000, 1:1500, 2:1000, 3:600];
        var_4f81729168c0b8a = [0:30, 1:30, 2:20, 3:20];
        delaytime = [0:30, 1:30, 2:20, 3:20];
        var_1afd23e03d011ec6 = [0:4000, 1:3000, 2:2000, 3:1000];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 9:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 2;
        var_2f36016c369a806f = 1000 + randomint(301);
        var_2f36026c369a82a2 = 750 + randomint(301);
        circleradius = [0:var_2f36016c369a806f, 1:var_2f36026c369a82a2];
        var_4f81729168c0b8a = [0:30, 1:30];
        delaytime = [0:10, 1:5];
        var_1afd23e03d011ec6 = [0:5500, 1:5500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 10:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [0:1500, 1:1400, 2:1200, 3:1000];
        var_4f81729168c0b8a = [0:30, 1:30, 2:30, 3:45];
        delaytime = [0:15, 1:10, 2:5, 3:5];
        var_1afd23e03d011ec6 = [0:5000, 1:4500, 2:3500, 3:3000];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 11:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 2;
        circleradius = [0:1400, 1:800];
        var_4f81729168c0b8a = [0:70, 1:60];
        delaytime = [0:20, 1:20];
        var_1afd23e03d011ec6 = [0:5000, 1:2500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 12:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 3;
        circleradius = [0:1400, 1:1000, 2:800];
        var_4f81729168c0b8a = [0:55, 1:45, 2:35];
        delaytime = [0:10, 1:10, 2:10];
        var_1afd23e03d011ec6 = [0:5000, 1:4000, 2:2900];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 13:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 2;
        var_2f36016c369a806f = 1400;
        var_2f36026c369a82a2 = 800;
        circleradius = [0:var_2f36016c369a806f, 1:var_2f36026c369a82a2];
        var_4f81729168c0b8a = [0:65, 1:55];
        delaytime = [0:15, 1:15];
        var_1afd23e03d011ec6 = [0:5000, 1:2500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 14:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 2;
        circleradius = [0:1400, 1:800];
        var_4f81729168c0b8a = [0:60, 1:45];
        delaytime = [0:10, 1:10];
        var_1afd23e03d011ec6 = [0:5000, 1:2500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 15:
        deletecircle(var_209967c144016964 - 1);
        level.br_level.br_movingcirclecount = 6;
        circleradius = [0:8500, 1:5500, 2:4500, 3:5500, 4:3500, 5:1500];
        var_4f81729168c0b8a = [0:140, 1:120, 2:100, 3:100, 4:90, 5:75];
        delaytime = [0:0, 1:0, 2:0, 3:0, 4:0, 5:0];
        var_1afd23e03d011ec6 = [0:8500, 1:7500, 2:6500, 3:7500, 4:5500, 5:2500];
        extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
        break;
    case 0:
    default:
        break;
    }
    if (preset) {
        var_cdfba54d71f1ee18 = level.br_level.br_circleradii.size - 1;
        level.br_level.br_movingcirclegulagcloseoffset = var_cdfba54d71f1ee18 - var_209967c144016964;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9429
// Size: 0xbf
function function_64757fdc2b889d2c() {
    level.br_level.var_8e40f29c8cdeb0f4 = getmatchrulesdata("brData", "numCirclesAtTrain");
    level.br_level.var_33e9e49f9e4a0834 = getmatchrulesdata("brData", "numCirclesFollowTrain");
    if (level.br_level.var_8e40f29c8cdeb0f4) {
        var_f1dd2e25837dc7e1 = getdvar(@"hash_d281b5ca2dcec30f", "0.35");
        level.br_level.var_572a1674797a9fa8 = function_488d5286d6e45d8b(var_f1dd2e25837dc7e1);
        level.br_level.var_564911cbc1774914 = getdvarfloat(@"hash_4fc42d03f5b9f20a", 0.1);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94ef
// Size: 0x33a
function applycirclesetdvars() {
    br = level.br_level;
    var_6756bd882736e8bc = br.br_circleclosetimes.size;
    finalradius = br.br_circleradii[var_6756bd882736e8bc];
    for (i = 0; i < var_6756bd882736e8bc + 1; i++) {
        name_hash = function_2ef675c13ca1c4af(@"hash_cedf59e742e58084", i);
        var_1641afe84817865a = "scr_br_circle_set_" + i;
        value = getdvar(name_hash, "");
        if (value == "") {
            continue;
        }
        if (value == "delete") {
            for (j = i; j < var_6756bd882736e8bc; j++) {
                br.br_circleradii[j] = undefined;
                br.br_circleclosetimes[j] = undefined;
                br.br_circledelaytimes[j] = undefined;
                br.br_circleminimapradii[j] = undefined;
                br.br_circleshowdelaydanger[j] = undefined;
                br.br_circleshowdelaysafe[j] = undefined;
            }
            br.br_circleradii[i] = finalradius;
            br.br_circleradii[j] = undefined;
            break;
        }
        var_6af0a57b38e894be = "?";
        toks = strtok(value, ",");
        if (i >= var_6756bd882736e8bc) {
            var_30886feff7e7284c = 6;
            circlesettingsassert(toks.size == var_30886feff7e7284c, "Dvar: " + var_1641afe84817865a + " has " + toks.size + " values, expected " + var_30886feff7e7284c);
            if (toks.size != var_30886feff7e7284c) {
                break;
            }
            var_a15637a9566cdcb4 = 1;
            for (j = 0; j < var_30886feff7e7284c; j++) {
                if (toks[j] == var_6af0a57b38e894be) {
                    var_a15637a9566cdcb4 = 0;
                    break;
                }
            }
            circlesettingsassert(var_a15637a9566cdcb4, "Dvar: " + var_1641afe84817865a + " has requires all " + var_30886feff7e7284c + " values set");
            if (!var_a15637a9566cdcb4) {
                break;
            }
        }
        for (j = 0; j < toks.size; j++) {
            tok = toks[j];
            if (tok == var_6af0a57b38e894be) {
                continue;
            }
            switch (j) {
            case 0:
                br.br_circleradii[i] = int(tok);
                continue;
            case 1:
                br.br_circleclosetimes[i] = int(tok);
                continue;
            case 2:
                br.br_circledelaytimes[i] = int(tok);
                continue;
            case 3:
                br.br_circleminimapradii[i] = int(tok);
                continue;
            case 4:
                br.br_circleshowdelaydanger[i] = int(tok);
                continue;
            case 5:
                br.br_circleshowdelaysafe[i] = int(tok);
                continue;
            default:
                continue;
            }
        }
        if (i >= var_6756bd882736e8bc) {
            br.br_circleradii[i + 1] = finalradius;
            var_6756bd882736e8bc++;
        }
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9830
// Size: 0x2d3
function function_c96b267dc4f7e14a(var_d42884b992023310, var_e891c8f4915dff8a) {
    level.br_level.br_circleclosetimes = [];
    level.br_level.br_circledelaytimes = [];
    level.br_level.br_circleshowdelaydanger = [];
    level.br_level.br_circleshowdelaysafe = [];
    level.br_level.br_circleminimapradii = [];
    level.br_level.br_circleradii = [];
    var_573c0bdc9ab8a1f8 = getscriptbundle(var_d42884b992023310);
    var_f8e6895d28bfaa60 = var_573c0bdc9ab8a1f8.var_d67b446a08631e4a;
    foreach (var_dd2f6ed9da93223f in var_f8e6895d28bfaa60) {
        if (istrue(var_e891c8f4915dff8a)) {
            circle = var_dd2f6ed9da93223f.var_a57abce10ce0b9ed;
        } else {
            circle = var_dd2f6ed9da93223f.var_31e918c38b1e104f;
        }
        level.br_level.br_circleclosetimes = array_add(level.br_level.br_circleclosetimes, function_53c4c53197386572(circle.var_4f81729168c0b8a, 0));
        level.br_level.br_circledelaytimes = array_add(level.br_level.br_circledelaytimes, function_53c4c53197386572(circle.var_35c9dcaf6de45f41, 0));
        level.br_level.br_circleshowdelaydanger = array_add(level.br_level.br_circleshowdelaydanger, function_53c4c53197386572(circle.var_f32810da2b97b928, 0));
        level.br_level.br_circleshowdelaysafe = array_add(level.br_level.br_circleshowdelaysafe, function_53c4c53197386572(circle.var_8e386906eab86e36, 0));
        level.br_level.br_circleminimapradii = array_add(level.br_level.br_circleminimapradii, function_53c4c53197386572(circle.var_5af681d13c7745a9, 0));
        level.br_level.br_circleradii = array_add(level.br_level.br_circleradii, function_53c4c53197386572(circle.circleradius, 0));
    }
    level.br_level.br_circleradii = array_add(level.br_level.br_circleradii, 0);
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b0a
// Size: 0x13b
function applycirclesettings() {
    /#
        if (isdefined(level.br_level.circle_defaults)) {
            function_536560624d05801b();
        } else {
            function_17f6274b4504ead2();
        }
    #/
    function_c85d65f8d1f9413();
    applymovingcircles();
    function_64757fdc2b889d2c();
    applycirclesetdvars();
    timescale = getmatchrulesdata("brData", "circleTimeScale");
    br = level.br_level;
    br.br_circleclosetimes = _applydvarstosettings(br.br_circleclosetimes, "close_time", timescale);
    br.br_circledelaytimes = _applydvarstosettings(br.br_circledelaytimes, "delay_time", timescale);
    br.br_circleshowdelaydanger = _applydvarstosettings(br.br_circleshowdelaydanger, "show_delay_danger", timescale);
    br.br_circleshowdelaysafe = _applydvarstosettings(br.br_circleshowdelaysafe, "show_delay_safe", timescale);
    if (!isdefined(br.br_circleradiizero)) {
        br.br_circleradiizero = level.br_level.br_circleradii[0];
    }
    assertcirclesettings();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c4c
// Size: 0xac
function _applydvarstosettings(settings, dvarstr, timescale) {
    var_f0f12a9716532101 = getdvarfloat(function_2ef675c13ca1c4af(@"hash_2f30e28124ff7895", dvarstr, "_scale"), 1);
    for (i = 0; i < settings.size; i++) {
        closetime = getdvarfloat(function_2ef675c13ca1c4af(@"hash_f3544a0fde0fb9b6", dvarstr, "_", string(i)), -1);
        if (closetime > 0) {
            settings[i] = closetime;
        }
        settings[i] = settings[i] * timescale;
        settings[i] = settings[i] * var_f0f12a9716532101;
    }
    return settings;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d00
// Size: 0x3b7
function assertcirclesettings() {
    circlesettingsassert(isdefined(level.br_level.br_circleclosetimes), "level.br_level.br_circleCloseTimes not defined");
    circlesettingsassert(isdefined(level.br_level.br_circledelaytimes), "level.br_level.br_circleDelayTimes not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleshowdelaydanger), "level.br_level.br_circleShowDelayDanger not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleshowdelaysafe), "level.br_level.br_circleShowDelaySafe not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleminimapradii), "level.br_level.br_circleMinimapRadii not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleradii), "level.br_level.br_circleDelayTimes not defined");
    var_6756bd882736e8bc = level.br_level.br_circleclosetimes.size;
    circlesettingsassert(var_6756bd882736e8bc == level.br_level.br_circledelaytimes.size, "level.br_level.br_circleDelayTimes size != " + var_6756bd882736e8bc);
    circlesettingsassert(var_6756bd882736e8bc == level.br_level.br_circleshowdelaydanger.size, "level.br_level.br_circleShowDelayDanger size != " + var_6756bd882736e8bc);
    circlesettingsassert(var_6756bd882736e8bc == level.br_level.br_circleshowdelaysafe.size, "level.br_level.br_circleShowDelaySafe size != " + var_6756bd882736e8bc);
    circlesettingsassert(var_6756bd882736e8bc == level.br_level.br_circleminimapradii.size, "level.br_level.br_circleMinimapRadii size != " + var_6756bd882736e8bc);
    circlesettingsassert(var_6756bd882736e8bc == level.br_level.br_circleradii.size - 1, "level.br_level.br_circleRadii size-1 != " + var_6756bd882736e8bc);
    for (i = 0; i < level.br_level.br_circleshowdelaydanger.size; i++) {
        delaytime = level.br_level.br_circledelaytimes[i];
        var_43a22b73f7ab26b7 = level.br_level.br_circleshowdelaydanger[i];
        circlesettingsassert(var_43a22b73f7ab26b7 <= delaytime, "level.br_level.br_circleShowDelayDanger[" + i + "] " + delaytime + " > " + var_43a22b73f7ab26b7);
    }
    for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
        delaytime = level.br_level.br_circledelaytimes[i];
        var_43a22b73f7ab26b7 = level.br_level.br_circleshowdelaysafe[i];
        circlesettingsassert(var_43a22b73f7ab26b7 <= delaytime, "level.br_level.br_circleDelayTimes[" + i + "] " + delaytime + " > " + var_43a22b73f7ab26b7);
    }
    if (getdvarint(@"hash_39a8907d7f184021", 1) && !namespace_71073fa38f11492::isfeaturedisabled("movingCircle")) {
        circlesettingsassert(level.br_level.br_circleradii[0] == level.br_level.br_circleradiizero, "Changing circle radius 0 is not supported");
    }
    if (level.br_level.var_33e9e49f9e4a0834 > 0) {
        circlesettingsassert(level.br_level.var_8e40f29c8cdeb0f4 <= var_6756bd882736e8bc && level.br_level.var_8e40f29c8cdeb0f4 >= 0, "Improper match rules for train tracking, require: 0 <= numCirclesAtTrain <= numCircles");
        circlesettingsassert(level.br_level.var_33e9e49f9e4a0834 >= 0, "Improper match rules for train tracking, require: 0 <= br_numCirclesFollowTrain");
        circlesettingsassert(level.br_level.var_8e40f29c8cdeb0f4 >= level.br_level.var_33e9e49f9e4a0834 + 1, "Improper match rules for train tracking, require: numCirclesAtTrain >= ( numCirclesFollowTrain + 1 )");
        circlesettingsassert(level.br_level.br_movingcirclecount == 0, "Cannot simultaneously support train tracking and moving circles!");
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0be
// Size: 0x22
function circlesettingsassert(value, msg) {
    if (!value) {
        /#
            assertmsg(msg);
        #/
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0e7
// Size: 0xe4
function getcircleclosetime(targetindex) {
    if (!isdefined(level.br_level)) {
        return 0;
    }
    if (!isdefined(level.br_level.br_circledelaytimes) || !level.br_level.br_circledelaytimes.size) {
        return 0;
    }
    var_6756bd882736e8bc = level.br_level.br_circledelaytimes.size;
    if (targetindex >= var_6756bd882736e8bc) {
        targetindex = var_6756bd882736e8bc - 1;
    }
    time = 0;
    for (circleindex = 0; circleindex <= targetindex; circleindex++) {
        timedelay = level.br_level.br_circledelaytimes[circleindex];
        var_3d8565e2775a243c = level.br_level.br_circleclosetimes[circleindex];
        time = time + timedelay + var_3d8565e2775a243c;
    }
    return time;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d3
// Size: 0x92
function brcirclebattlechatter(circleindex) {
    waittime = level.br_level.br_circledelaytimes[circleindex] / 5;
    wait(waittime);
    foreach (team in level.teamnamelist) {
        level thread doteamcirclebattlechatter(level.teamdata[team]);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26c
// Size: 0x13a
function doteamcirclebattlechatter(team) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    var_77e882da07e78cfe = getsafecircleradius();
    if (team["alivePlayers"].size <= 1) {
        return;
    }
    players = sortbydistance(team["alivePlayers"], var_add4fd7502a75a8a);
    eventname = undefined;
    var_5c06026650b5de35 = distance2dsquared(var_add4fd7502a75a8a, players[0].origin);
    if (var_5c06026650b5de35 > var_77e882da07e78cfe * var_77e882da07e78cfe) {
        if (var_5c06026650b5de35 > var_77e882da07e78cfe * var_77e882da07e78cfe * 4) {
            eventname = "sitrep_circle_outfar";
        } else {
            eventname = "sitrep_circle_out";
        }
    } else {
        var_6d4b305f9681783 = distance2dsquared(var_add4fd7502a75a8a, players[players.size - 1].origin);
        if (var_6d4b305f9681783 > var_77e882da07e78cfe * var_77e882da07e78cfe) {
            eventname = "sitrep_circle_mixed";
        } else {
            eventname = "sitrep_circle_in";
        }
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        sound = function_2ef675c13ca1c4af(#"hash_6ff1a4b4a68216ff", eventname);
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(players[0], sound);
    } else {
        dialog = "br_" + eventname;
        namespace_d3d40f75bb4e4c32::brleaderdialog(dialog, 1, players);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3ad
// Size: 0x4e
function createinvalidcirclearea(origin, radius) {
    zone = spawnstruct();
    zone.origin = origin;
    zone.radius = radius;
    zone.radiussq = radius * radius;
    return zone;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa403
// Size: 0xe4
function canplaycircleopendialog(circleindex) {
    var_bff1e3c9ba212857 = 1;
    var_960ffe6216854a87 = getsubgametype();
    if (istrue(level.brgametype.var_bf437f9ee755c3e6)) {
        var_bff1e3c9ba212857 = 0;
    } else if (function_fc0f865ddcf551ad() || var_960ffe6216854a87 == "mini" || var_960ffe6216854a87 == "mini_mgl" || var_960ffe6216854a87 == "kingslayer" || var_960ffe6216854a87 == "zxp" || var_960ffe6216854a87 == "rumble_mgl" || var_960ffe6216854a87 == "resurgence_mgl" || var_960ffe6216854a87 == "champion") {
        if (circleindex <= 1) {
            var_bff1e3c9ba212857 = 0;
        }
    } else if (var_960ffe6216854a87 == "dmz" || var_960ffe6216854a87 == "exgm" || var_960ffe6216854a87 == "resurgence" || var_960ffe6216854a87 == "plunder" || var_960ffe6216854a87 == "truckwar") {
        var_bff1e3c9ba212857 = 0;
    }
    return var_bff1e3c9ba212857;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4ef
// Size: 0xb0
function canplaycircleclosedialog(circleindex) {
    var_bff1e3c9ba212857 = 1;
    var_960ffe6216854a87 = getsubgametype();
    if (function_fc0f865ddcf551ad() || var_960ffe6216854a87 == "mini" || var_960ffe6216854a87 == "mini_mgl" || var_960ffe6216854a87 == "zxp" || var_960ffe6216854a87 == "rumble_mgl" || var_960ffe6216854a87 == "resurgence_mgl" || var_960ffe6216854a87 == "champion" || var_960ffe6216854a87 == "poiresurgence") {
        if (circleindex == 0) {
            var_bff1e3c9ba212857 = 0;
        }
    } else if (var_960ffe6216854a87 == "dmz" || var_960ffe6216854a87 == "exgm" || var_960ffe6216854a87 == "plunder") {
        var_bff1e3c9ba212857 = 0;
    }
    return var_bff1e3c9ba212857;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5a7
// Size: 0x88
function resetdangercircleorigin(circleindex) {
    var_e904bcca7e8660f2 = 0;
    var_960ffe6216854a87 = getsubgametype();
    switch (var_960ffe6216854a87) {
    case #"hash_a3f25a001a121f":
    case #"hash_5e0a8ff36bce5106":
    case #"hash_8299694594ab149d":
    case #"hash_bfabc434c59611fa":
    case #"hash_d542616c7a17d00d":
    case #"hash_dddecc2751311914":
        if (circleindex == 0) {
            var_e904bcca7e8660f2 = 1;
        }
        break;
    }
    return var_e904bcca7e8660f2;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa637
// Size: 0xfe
function function_eca79fa0f341ee08(var_7f590f6ae7f3bc83, var_457258eed204db55, var_1dc8b3a2ba6e135c, var_ac90ea5dc05930cd, var_c660f86463f75e9e) {
    if (isdefined(var_457258eed204db55)) {
        level.var_9ebef1efb6e8a3a9 = function_53c4c53197386572(level.var_9ebef1efb6e8a3a9, []);
        level.var_9ebef1efb6e8a3a9[var_7f590f6ae7f3bc83] = var_457258eed204db55;
    }
    if (isdefined(var_1dc8b3a2ba6e135c)) {
        level.var_c7fd2b5cf3acb3da = function_53c4c53197386572(level.var_c7fd2b5cf3acb3da, []);
        level.var_8a12e160a2617c92 = function_53c4c53197386572(level.var_8a12e160a2617c92, []);
        level.var_c7fd2b5cf3acb3da[var_7f590f6ae7f3bc83] = var_1dc8b3a2ba6e135c;
        level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83] = [];
    }
    if (isdefined(var_ac90ea5dc05930cd)) {
        level.var_725403a0618f5a10 = function_53c4c53197386572(level.var_725403a0618f5a10, []);
        level.var_725403a0618f5a10[var_7f590f6ae7f3bc83] = var_ac90ea5dc05930cd;
    }
    if (isdefined(var_c660f86463f75e9e)) {
        level.var_20f62868a14ab570 = function_53c4c53197386572(level.var_20f62868a14ab570, []);
        level.var_20f62868a14ab570[var_7f590f6ae7f3bc83] = var_c660f86463f75e9e;
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa73c
// Size: 0xca
function function_4448b165e1f42719(var_7f590f6ae7f3bc83) {
    if (isdefined(level.var_9ebef1efb6e8a3a9)) {
        level.var_9ebef1efb6e8a3a9 = array_remove_key(level.var_9ebef1efb6e8a3a9, var_7f590f6ae7f3bc83);
    }
    if (isdefined(level.var_c7fd2b5cf3acb3da)) {
        level.var_c7fd2b5cf3acb3da = array_remove_key(level.var_c7fd2b5cf3acb3da, var_7f590f6ae7f3bc83);
    }
    if (isdefined(level.var_8a12e160a2617c92)) {
        level.var_8a12e160a2617c92 = array_remove_key(level.var_8a12e160a2617c92, var_7f590f6ae7f3bc83);
    }
    if (isdefined(level.var_725403a0618f5a10)) {
        level.var_725403a0618f5a10 = array_remove_key(level.var_725403a0618f5a10, var_7f590f6ae7f3bc83);
    }
    if (isdefined(level.var_20f62868a14ab570)) {
        level.var_20f62868a14ab570 = array_remove_key(level.var_20f62868a14ab570, var_7f590f6ae7f3bc83);
    }
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80d
// Size: 0x34
function function_fc0f865ddcf551ad() {
    return getsubgametype() == "mini" || getsubgametype() == "mini_mgl" || getdvarint(@"hash_32bd10766631266f", 0) != 0;
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa849
// Size: 0x165
function function_7fb9a2d57c0c42e2() {
    level.br_circle.var_dabf59aeb6b1034c = spawnstruct();
    level.br_circle.var_bce22ba84fcc1cfe = spawnstruct();
    var_4a28a04e419fa561 = ter_op(function_fc0f865ddcf551ad(), 1, 0);
    var_f6caa991dfd18a35 = var_4a28a04e419fa561 + 1;
    level.br_circle.var_dabf59aeb6b1034c function_6b6b6273f8180522("Prematch_Preview_Danger_Circle_BR", (level.br_level.br_circlecenters[var_4a28a04e419fa561][0], level.br_level.br_circlecenters[var_4a28a04e419fa561][1], 0), level.br_level.br_circleradii[var_4a28a04e419fa561]);
    level.br_circle.var_bce22ba84fcc1cfe function_6b6b6273f8180522("Prematch_Preview_Safe_Circle_BR", (level.br_level.br_circlecenters[var_f6caa991dfd18a35][0], level.br_level.br_circlecenters[var_f6caa991dfd18a35][1], 0), level.br_level.br_circleradii[var_f6caa991dfd18a35]);
    level.br_circle.var_dabf59aeb6b1034c function_6988310081de7b45();
    level.br_circle.var_bce22ba84fcc1cfe function_6988310081de7b45();
    level thread function_e900c5a0c7a22c7a();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b5
// Size: 0x46
function function_e900c5a0c7a22c7a() {
    level endon("game_ended");
    level waittill("prematch_over");
    level.br_circle.var_dabf59aeb6b1034c function_af5604ce591768e1();
    level.br_circle.var_bce22ba84fcc1cfe function_af5604ce591768e1();
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa02
// Size: 0x1ee
function function_e5958529715b6395() {
    /#
        if (!isdefined(level.player)) {
            return;
        }
        player = level.player;
        startx = 40;
        starty = -32;
        var_ca02086954972024 = 16;
        header = player namespace_52f6938dd902c7d0::createfontstring("dmz", 1.2);
        header.alpha = 1;
        header.color = (1, 1, 0);
        header namespace_52f6938dd902c7d0::setpoint("<unknown string>", undefined, startx, starty);
        header setdevtext("<unknown string>");
        circleorigin = player namespace_52f6938dd902c7d0::createfontstring("dmz", 1.2);
        circleorigin.alpha = 1;
        circleorigin.color = (1, 1, 0);
        circleorigin namespace_52f6938dd902c7d0::setpoint("<unknown string>", undefined, startx, starty + var_ca02086954972024);
        circleradius = player namespace_52f6938dd902c7d0::createfontstring("dmz", 1.2);
        circleradius.alpha = 1;
        circleradius.color = (1, 1, 0);
        circleradius namespace_52f6938dd902c7d0::setpoint("<unknown string>", undefined, startx, starty + var_ca02086954972024 * 2);
        var_975b4be3f9205374 = player namespace_52f6938dd902c7d0::createfontstring("dmz", 1.2);
        var_975b4be3f9205374.alpha = 1;
        var_975b4be3f9205374.color = (1, 1, 0);
        var_975b4be3f9205374 namespace_52f6938dd902c7d0::setpoint("<unknown string>", undefined, startx, starty + var_ca02086954972024 * 3);
        function_7f31d213264baf4d(header, circleorigin, circleradius, var_975b4be3f9205374);
        header destroy();
        circleorigin destroy();
        circleradius destroy();
        var_975b4be3f9205374 destroy();
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xabf7
// Size: 0xc4
function function_7f31d213264baf4d(header, circleorigin, circleradius, var_975b4be3f9205374) {
    /#
        level endon("<unknown string>");
        while (1) {
            header clearalltextafterhudelem();
            origin = getdangercircleorigin();
            radius = getdangercircleradius();
            circleorigin setdevtext("<unknown string>" + int(origin[0]) + "<unknown string>" + int(origin[1]) + "<unknown string>");
            circleradius setdevtext("<unknown string>" + int(radius));
            var_975b4be3f9205374 setdevtext("<unknown string>" + getmintimetillpointindangercircle(level.player.origin));
            waitframe();
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacc2
// Size: 0xe
function function_6a6e7f489e42bcda() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacd7
// Size: 0x11b
function function_673b160b18fe0611() {
    /#
        var_c6b7edb2c70b1304 = 0;
        var_18d34d021394e68a = gettime();
        while (getdvarint(@"hash_907618e8f550cb42", 0) > 0) {
            if ((gettime() - var_18d34d021394e68a) % 10000 == 0) {
                iprintln("<unknown string>");
            }
            foreach (p in level.players) {
                if (!isbot(p)) {
                    var_416318ee02bcd7d9 = _safecircledurationforplayer(p, 10000);
                    p setclientomnvar("<unknown string>", gettime());
                    p setclientomnvar("<unknown string>", var_416318ee02bcd7d9);
                    var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, 10000);
                    p setclientomnvar("<unknown string>", gettime());
                    p setclientomnvar("<unknown string>", var_416318ee02bcd7d9);
                }
            }
            var_c6b7edb2c70b1304 = 1;
            waitframe();
        }
        if (var_c6b7edb2c70b1304) {
            iprintln("<unknown string>");
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xadf9
// Size: 0x34b
function function_9eb173d6a8fed181() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        colors = [0:(1, 1, 1), 1:(0.764706, 0.25098, 0.129412), 2:(0.380392, 0.647059, 0.309804), 3:(0.427451, 0.811765, 0.964706), 4:(0.929412, 0.796078, 0.337255), 5:(1, 0.0431373, 0.843137), 6:(0.380392, 0.278431, 0.517647), 7:(1, 0.658824, 0.647059), 8:(0.380392, 0.780392, 0.803922), 9:(1, 1, 1), 10:(0.501961, 0.501961, 0.501961), 11:(0.898039, 0.6, 0), 12:(0, 0, 0), 13:(0.929412, 0.796078, 0.337255)];
        var_515792830044f5b4 = 1;
        var_6c3696e7c53f4954 = 1;
        var_3689cc0770006441 = [];
        var_3689cc0770006441[var_515792830044f5b4] = 1;
        var_3689cc0770006441[var_6c3696e7c53f4954] = 1;
        var_3689cc0770006441[0] = 1;
        var_3689cc0770006441[9] = 1;
        var_3689cc0770006441[10] = 1;
        var_3689cc0770006441[12] = 1;
        var_3689cc0770006441[13] = 1;
        thread function_7486a9cd4aef46c8();
        var_5a4d0a8404636492 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"];
        var_b35ce0e21357e4c6 = 1;
        while (1) {
            waitframe();
            if (!isdefined(level.br_level.br_circlecenters) || !level.br_level.br_circlecenters.size) {
                continue;
            }
            colorindex = 0;
            for (circleindex = 0; circleindex < level.br_level.br_circlecenters.size; circleindex++) {
                radius = level.br_level.br_circleradii[circleindex];
                center = level.br_level.br_circlecenters[circleindex];
                if (circleindex == 0) {
                    var_7cf2711e2953a547 = var_515792830044f5b4;
                } else if (circleindex == level.br_level.br_circlecenters.size - 1) {
                    var_7cf2711e2953a547 = var_6c3696e7c53f4954;
                } else {
                    while (istrue(var_3689cc0770006441[colorindex])) {
                        colorindex = (colorindex + 1) % colors.size;
                    }
                    var_7cf2711e2953a547 = colorindex;
                    colorindex = (colorindex + 1) % colors.size;
                }
                color = colors[var_7cf2711e2953a547];
                namespace_3c37cb17ade254d::draw_circle(center, max(5, radius), color, 1, 0, 1);
                print3d(center, "<unknown string>" + circleindex + "<unknown string>" + radius, color, 1, 1, 1, 1);
                if (var_b35ce0e21357e4c6) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<unknown string>" + var_5a4d0a8404636492[circleindex % var_5a4d0a8404636492.size], center, max(50, radius));
                    circleent function_6988310081de7b45();
                    circleent thread function_c3f32250a5b22066();
                }
            }
            var_b35ce0e21357e4c6 = 0;
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb14b
// Size: 0x1d
function function_7486a9cd4aef46c8() {
    /#
        level endon("<unknown string>");
        level waittill("<unknown string>");
        thread function_9eb173d6a8fed181();
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb16f
// Size: 0x2c
function function_c3f32250a5b22066() {
    /#
        self.mapcircle endon("<unknown string>");
        level waittill("<unknown string>");
        self.mapcircle delete();
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a2
// Size: 0xe
function function_46097952cff4dc2e() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb1b7
// Size: 0x4e
function function_acc901c78fe65b94(args) {
    /#
        if (!istrue(level.var_270ddda42e50ae65)) {
            level.var_270ddda42e50ae65 = 1;
            level thread function_8ebb53f2c5ed597d(args);
        } else {
            level.var_270ddda42e50ae65 = undefined;
            level notify("<unknown string>");
            level notify("<unknown string>");
        }
    #/
}

// Namespace br_circle/namespace_c5622898120e827f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb20c
// Size: 0x20c
function function_8ebb53f2c5ed597d(args) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_369c684bf276035d = undefined;
        if (args.size > 0) {
            var_369c684bf276035d = spawnstruct();
            var_369c684bf276035d.radius = int(args[0]);
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            start = host geteye();
            dir = anglestoforward(host getplayerangles());
            end = start + dir * 50000;
            trace = namespace_2a184fc4902783dc::ray_trace(start, end, host);
            var_369c684bf276035d.origin = trace["<unknown string>"];
        }
        var_b35ce0e21357e4c6 = 1;
        while (1) {
            foreach (area in level.br_badcircleareas) {
                namespace_3c37cb17ade254d::draw_circle(area.origin, area.radius, (1, 1, 1), 1, 0, 1);
                if (var_b35ce0e21357e4c6) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<unknown string>", area.origin, area.radius);
                    circleent thread function_c3f32250a5b22066();
                }
            }
            if (isdefined(var_369c684bf276035d)) {
                namespace_3c37cb17ade254d::draw_circle(var_369c684bf276035d.origin, var_369c684bf276035d.radius, (1, 1, 1), 1, 0, 1);
                if (var_b35ce0e21357e4c6) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<unknown string>", var_369c684bf276035d.origin, var_369c684bf276035d.radius);
                    circleent thread function_c3f32250a5b22066();
                }
            }
            var_b35ce0e21357e4c6 = 0;
            waitframe();
        }
    #/
}

