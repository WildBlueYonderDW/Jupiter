#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_multi_circle.gsc;
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x26a
function initcircle() {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("circle")) {
        level.br_circle_disabled = 1;
        return;
    }
    if (!isdefined(level.br_level)) {
        return;
    }
    level.br_circle = spawnstruct();
    level.br_circle.mapbounds = level.br_level.br_mapbounds;
    if (getdvarint(@"hash_b5133e800e8d7fef", 10) > 0) {
        level.br_circle.damagetick = [getdvarint(@"hash_b5133e800e8d7fef", 10)];
    } else if (level.mapname == "mp_quarry2" || level.mapname == "mp_prison" || level.mapname == "mp_lumber") {
        level.br_circle.damagetick = [10, 10, 10, 10, 10];
    } else {
        level.br_circle.damagetick = [10, 10, 10, 10, 10, 10, 10, 10];
    }
    level.var_53c0fa66001cff52 = getdvarint(@"hash_bc78c3747f2a6ab4", 1574);
    setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[0]);
    var_b6f3e70ef79763be = level.br_level.br_circleclosetimes.size;
    setomnvar("ui_br_total_circle_collapse_count", var_b6f3e70ef79763be);
    level.br_circle.circleindex = -1;
    level.br_circle.var_a0d948a339eee04 = 0;
    scripts\mp\gametypes\br_multi_circle::init();
    namespace_813f5a035e59565a::init();
    level thread namespace_bbc79db4c3949a5c::function_8e779f490bbd1ae9();
    if (isdefined(level.var_ea923bf109f8a376)) {
        function_64f6d9b4ba95ed35();
        [[ level.var_ea923bf109f8a376 ]]();
    } else {
        _precalcsafecirclecenters();
    }
    scripts\mp\gametypes\br_multi_circle::function_598312eb02c8eb61();
    if (getdvarint(@"hash_6ce99c9bce6e5660", 0)) {
        function_7fb9a2d57c0c42e2();
    }
    if (istrue(function_4bff90e55e5e18e4())) {
        pausecircle(1);
    }
    /#
        setdevdvarifuninitialized(@"hash_907618e8f550cb42", 0);
    #/
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b
// Size: 0x182
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1295
// Size: 0x47
function function_38773ae9c311a6ea(dvarvalue) {
    array = strtok(dvarvalue, " ");
    for (i = 0; i < array.size; i++) {
        array[i] = int(array[i]);
    }
    return array;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e5
// Size: 0x47
function function_488d5286d6e45d8b(dvarvalue) {
    array = strtok(dvarvalue, " ");
    for (i = 0; i < array.size; i++) {
        array[i] = float(array[i]);
    }
    return array;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335
// Size: 0x383
function initcirclepoststarttocircleindex(origin, var_8f6402ad8e91da6a, startcircleindex, var_26189638809f7b88) {
    if (isdefined(level.br_circle)) {
        return;
    }
    level.br_circle = spawnstruct();
    level.br_circle.mapbounds = level.br_level.br_mapbounds;
    level.br_circle.damagetick = [10, 10, 10, 10, 10, 10, 10, 10];
    maxindex = level.br_level.br_circleclosetimes.size - 1;
    if (!isdefined(startcircleindex) || startcircleindex < 0) {
        startcircleindex = 0;
    } else if (startcircleindex > maxindex) {
        startcircleindex = maxindex;
    }
    newsize = level.br_level.br_circleclosetimes.size - startcircleindex;
    var_7a29dcf228edd854 = level.br_level.br_circleradii[0];
    if (!isdefined(var_26189638809f7b88) || var_26189638809f7b88 <= 0) {
        var_26189638809f7b88 = level.br_level.br_circleclosetimes[0];
    }
    level.br_circle.circleindex = -1;
    level.br_level.circle_defaults = undefined;
    level.br_circle.damagetick = copycirclearraystartingat(level.br_circle.damagetick, startcircleindex);
    level.br_level.br_circleclosetimes = copycirclearraystartingat(level.br_level.br_circleclosetimes, startcircleindex);
    level.br_level.br_circledelaytimes = getzeroarray(newsize, var_8f6402ad8e91da6a);
    level.br_level.br_circleshowdelaydanger = getzeroarray(newsize, var_8f6402ad8e91da6a);
    level.br_level.br_circleshowdelaysafe = copycirclearraystartingat(level.br_level.br_circleshowdelaysafe, startcircleindex);
    level.br_level.br_circleminimapradii = copycirclearraystartingat(level.br_level.br_circleminimapradii, startcircleindex);
    level.br_level.br_circleradii = copycirclearraystartingat(level.br_level.br_circleradii, startcircleindex);
    level.br_level.br_circleradii[0] = var_7a29dcf228edd854;
    level.br_level.br_circleclosetimes[0] = var_26189638809f7b88;
    applycirclesettings();
    level thread _precalcsafecirclecenters(origin);
    level notify("CirclePeekCleanup");
    if (isdefined(level.circlepeeks)) {
        foreach (circlepeek in level.circlepeeks) {
            circlepeek function_af5604ce591768e1();
        }
        level.circlepeeks = undefined;
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            scripts\mp\gametypes\br_quest_util::setupcirclepeek();
        } else {
            namespace_981ad73f8047222f::setupcirclepeek();
        }
    }
    thread runcircles(0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x28
function copycirclearraystartingat(circlearray, startindex) {
    if (startindex == 0) {
        return circlearray;
    }
    circlearray = array_slice(circlearray, startindex, circlearray.size);
    return circlearray;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16f1
// Size: 0x44
function getzeroarray(size, var_3739e75778ddc8ca) {
    newarray = [];
    newarray[0] = var_3739e75778ddc8ca;
    for (i = 1; i < size; i++) {
        newarray[newarray.size] = 0;
    }
    return newarray;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173e
// Size: 0x7a
function getsafecircleorigin() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        return (level.br_circle.safecircleent.origin[0], level.br_circle.safecircleent.origin[1], 0);
    }
    return (0, 0, 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c0
// Size: 0x4d
function getsafecircleradius() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        return level.br_circle.safecircleent.origin[2];
    }
    return 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1815
// Size: 0x7a
function getdangercircleorigin() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        return (level.br_circle.dangercircleent.origin[0], level.br_circle.dangercircleent.origin[1], 0);
    }
    return (0, 0, 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1897
// Size: 0x4d
function getdangercircleradius() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        return level.br_circle.dangercircleent.origin[2];
    }
    return 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ec
// Size: 0x57
function getnextsafecircleorigin() {
    var_3c3e327952ce34d3 = level.br_circle.circleindex + 2;
    if (var_3c3e327952ce34d3 < level.br_level.br_circlecenters.size) {
        return level.br_level.br_circlecenters[var_3c3e327952ce34d3];
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194b
// Size: 0x57
function getnextsafecircleradius() {
    var_3c3e327952ce34d3 = level.br_circle.circleindex + 2;
    if (var_3c3e327952ce34d3 < level.br_level.br_circleradii.size) {
        return level.br_level.br_circleradii[var_3c3e327952ce34d3];
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19aa
// Size: 0x5c
function function_88f7b8fa20846f45() {
    if (isdefined(level.br_level.var_8e40f29c8cdeb0f4) && level.br_level.var_8e40f29c8cdeb0f4 > 0) {
        return (level.br_level.br_circleclosetimes.size - level.br_level.var_8e40f29c8cdeb0f4);
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0f
// Size: 0x5c
function function_6249dca788e0dff0() {
    if (isdefined(level.br_level.var_33e9e49f9e4a0834) && level.br_level.var_33e9e49f9e4a0834 > 0) {
        return (level.br_level.br_circleclosetimes.size - level.br_level.var_33e9e49f9e4a0834);
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a74
// Size: 0x26
function function_d6f728b66bd3966(circleindex) {
    firstindex = function_6249dca788e0dff0();
    if (isdefined(firstindex)) {
        return (circleindex >= firstindex);
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa3
// Size: 0x38
function canseesafecircleui() {
    return isdefined(level.br_circle.safecircleent) && !istrue(level.br_circle.safecircleent.hidden);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae4
// Size: 0x38
function canseedangercircleui() {
    return isdefined(level.br_circle.dangercircleent) && !istrue(level.br_circle.dangercircleent.hidden);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b25
// Size: 0x7a
function playercanseedangercircleworld() {
    if (istrue(self.wasingulag)) {
        return 0;
    }
    if (istrue(self.gulag)) {
        if (istrue(self.gulagarena) || istrue(self.jailed) || istrue(self.playinggulagbink)) {
            return 0;
        }
    }
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerCanSeeDangerCircleWorld")) {
        result = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerCanSeeDangerCircleWorld");
        if (isdefined(result)) {
            return result;
        }
    }
    return canseedangercircleui();
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba8
// Size: 0x6c
function cancircledamageplayer(player) {
    return isalive(player) && player playercanseedangercircleworld() && !istrue(player.gulag) && !istrue(player.inrespawnc130) && !player scripts\mp\gametypes\br_public::playeriszombie() && !isdefined(player.c130) && !function_d4fbb8e1e555b4f0(player.origin);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c1d
// Size: 0x7f
function function_d4fbb8e1e555b4f0(position) {
    if (isdefined(level.exclusionzones)) {
        foreach (zone in level.exclusionzones) {
            var_75faff8af3dda5b6 = function_92b7f40b735f689f(zone, position);
            if (var_75faff8af3dda5b6) {
                return true;
            }
        }
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x1a9
function tryplaycoughaudio(var_dc548d1807ca0b2f) {
    player = self;
    if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
        return;
    }
    if (istrue(player.extracted)) {
        return;
    }
    if (!isdefined(player.operatorcustomization)) {
        return;
    }
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
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
    operatorteam = scripts\mp\gametypes\br_public::brgetoperatorteam(player);
    operatorgender = player.operatorcustomization.gender;
    if (isdefined(operatorteam) && operatorteam == "axis") {
        if (isdefined(operatorgender) && operatorgender == "female") {
            var_4de0f8859b1a8d67 = "axis_female_cough";
        } else {
            var_4de0f8859b1a8d67 = "axis_male_cough";
        }
    } else if (isdefined(operatorgender) && operatorgender == "female") {
        var_4de0f8859b1a8d67 = "allies_female_cough";
    } else {
        var_4de0f8859b1a8d67 = "allies_male_cough";
    }
    var_d4eb9b956e707234 = randomint(game["dialogue"][var_4de0f8859b1a8d67].size);
    coughsoundalias = game["dialogue"][var_4de0f8859b1a8d67][var_d4eb9b956e707234];
    if (isdefined(player) && player scripts\cp_mp\utility\player_utility::_isalive()) {
        player playsound(coughsoundalias, player, player);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0x2b
function function_f8d9c5f59fc6c187() {
    if (!isdefined(self.var_8d272c0341202e9d)) {
        self.var_8d272c0341202e9d = gettime();
        self setclientomnvar("ui_br_player_is_in_gas", 1);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e89
// Size: 0x19
function function_6fcdea7a7060ce40() {
    self.var_8d272c0341202e9d = undefined;
    self setclientomnvar("ui_br_player_is_in_gas", 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eaa
// Size: 0x208
function function_ce6456364079cce7() {
    defaulttimes = [45, 50, 60, 70, 80, 90, 100, 110, 120];
    var_421b5b34a21338d1 = [1.4, 1.8, 2, 2.5, 2.8, 3, 4, 5, 10];
    assert(defaulttimes.size == var_421b5b34a21338d1.size);
    data = spawnstruct();
    data.enabled = getdvarint(@"hash_a4814b42abcaa1d7", 1);
    data.var_8d1ed26b4a14cb16 = getdvarint(@"hash_8799dcded2374711", 9);
    data.timeinseconds = [];
    data.multipliers = [];
    curtime = 0;
    curmult = 1;
    for (i = 0; i < data.var_8d1ed26b4a14cb16; i++) {
        defaulttime = undefined;
        defaultmult = undefined;
        if (i < defaulttimes.size) {
            defaulttime = defaulttimes[i];
            defaultmult = var_421b5b34a21338d1[i];
            curtime = defaulttime;
            curmult = defaultmult;
        } else {
            curtime += 1;
            curmult += 1;
            defaulttime = curtime;
            defaultmult = curmult;
        }
        data.timeinseconds[i] = getdvarfloat(hashcat(@"hash_1e5bced3bad4bb2c", i + 1), defaulttime);
        data.multipliers[i] = getdvarfloat(hashcat(@"hash_73aa78457e1fa15d", i + 1), defaultmult);
    }
    return data;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bb
// Size: 0xb7
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
            curmult = data.multipliers[i];
            return int(damagetick * curmult);
        }
    }
    return damagetick;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217b
// Size: 0x6c
function function_24c5a8d31ae262f(origin, var_819edacdacb810e4, dangercircleradius) {
    /#
        if (level.mapname == "<dev string:x1c>" && getdvarint(@"hash_97ab1e3e328ddff9", 0) == 0) {
            return false;
        }
    #/
    if (!isdefined(var_819edacdacb810e4)) {
        var_819edacdacb810e4 = getdangercircleorigin();
    }
    if (!isdefined(dangercircleradius)) {
        dangercircleradius = getdangercircleradius();
    }
    return distance2dsquared(var_819edacdacb810e4, origin) > dangercircleradius * dangercircleradius;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f0
// Size: 0xb6
function ispointwithininitialdangercircle(origin) {
    if (!isdefined(level.br_level) || !isdefined(level.br_level.br_circlecenters) || !isdefined(level.br_level.br_circleradii)) {
        return true;
    }
    var_a019f99effa95be2 = (level.br_level.br_circlecenters[0][0], level.br_level.br_circlecenters[0][1], 0);
    var_3675d09395caf91a = squared(level.br_level.br_circleradii[0]);
    return distance2dsquared(var_a019f99effa95be2, origin) < var_3675d09395caf91a;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22af
// Size: 0x531
function circledamagetick() {
    level endon("game_ended");
    level endon("endCircleDamageTick");
    while (level.br_circle.circleindex < 0) {
        waitframe();
    }
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("circleEarlyStart")) {
        level waittill("infils_ready");
    }
    thresholdradius = getdvarfloat(@"hash_d6d1181cd67d957d", 1000);
    var_a058dc250ace641d = function_ce6456364079cce7();
    while (true) {
        if (isdefined(level.br_circle.dangercircleent)) {
            index = level.br_circle.circleindex;
            if (index > level.br_circle.damagetick.size - 1) {
                index = level.br_circle.damagetick.size - 1;
            }
            damagetick = level.br_circle.damagetick[index];
            if (isdefined(level.circledamagemultiplier)) {
                damagetick *= level.circledamagemultiplier;
            }
            if (damagetick > 0) {
                var_819edacdacb810e4 = getdangercircleorigin();
                dangercircleradius = getdangercircleradius();
                foreach (player in level.players) {
                    if (!isdefined(player) || !isdefined(player.origin)) {
                        continue;
                    }
                    if (isdefined(player) && istrue(player.inairpocket)) {
                        continue;
                    }
                    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("circleEarlyStart") && istrue(player.plotarmor)) {
                        player function_6fcdea7a7060ce40();
                        if (getdvarint(@"hash_acff883bb1879e40", 0)) {
                            logstring("CIRCLE DAMAGE LOGGING: Resetting player gas timer for " + player.name + " during circle index " + index + "for circleEarlyStart and plotArmor.");
                        }
                        continue;
                    }
                    var_acfa1a113ba7d7c7 = 0;
                    if (function_24c5a8d31ae262f(player.origin, var_819edacdacb810e4, dangercircleradius)) {
                        if (player cancircledamageplayer(player)) {
                            var_acfa1a113ba7d7c7 = 1;
                            player function_f8d9c5f59fc6c187();
                            if (getdvarint(@"hash_2b717602559e86b8", 0) == 1) {
                                modifieddamagetick = player function_1e0f84e555b3de7d(var_a058dc250ace641d, damagetick);
                            } else {
                                modifieddamagetick = damagetick;
                            }
                            gasmaskdamage = modifieddamagetick;
                            if (isdefined(level.var_aa1aaed4a9b80d4b) && isdefined(level.var_152d5a9c5ac5cdad) && level.br_circle.circleindex <= level.var_aa1aaed4a9b80d4b) {
                                gasmaskdamage *= level.var_152d5a9c5ac5cdad;
                            }
                            if (scripts\cp_mp\gasmask::hasgasmask(player)) {
                                if (scripts\mp\gametypes\br_pickups::function_f213f06eba604bbd(player)) {
                                    if (istrue(player.var_a18181d8bdaa0dab)) {
                                        player notify("gasmask_buffer_reset");
                                    } else if (level.var_5312bc14bd5db377 > 0) {
                                        player.var_a18181d8bdaa0dab = 1;
                                        player thread scripts\mp\gametypes\br_pickups::function_a1d897962a19d27e();
                                    }
                                }
                                if (istrue(player.var_a18181d8bdaa0dab)) {
                                    if (!istrue(player.gasmaskequipped)) {
                                        player function_81652bad17cd28bd(modifieddamagetick);
                                    }
                                    player scripts\cp_mp\gasmask::processdamage(gasmaskdamage);
                                } else if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                    player playsoundtoplayer("br_gas_mask_break_plr", player);
                                    player scripts\mp\gametypes\br_pickups::function_4d16b9c52efa3b8();
                                    player scripts\mp\gametypes\br_pickups::function_8e9b00a1d2b23d72();
                                } else {
                                    player scripts\mp\gametypes\br_pickups::function_cdf7f2f6bd3207("br_circle");
                                    player scripts\cp_mp\gasmask::processdamage(gasmaskdamage);
                                }
                            } else {
                                player function_81652bad17cd28bd(modifieddamagetick);
                            }
                            if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
                                player namespace_aead94004cf4c147::function_5323bef1ad6244b9(gasmaskdamage);
                            }
                        } else {
                            if (getdvarint(@"hash_acff883bb1879e40", 0)) {
                                logstring("CIRCLE DAMAGE LOGGING: Resetting player gas timer for " + player.name + " during circle index " + index + "for failing canCircleDamagePlayer check.");
                            }
                            player function_6fcdea7a7060ce40();
                        }
                    } else {
                        player function_6fcdea7a7060ce40();
                        if (scripts\cp_mp\gasmask::hasgasmask(player)) {
                            if (scripts\mp\gametypes\br_pickups::function_f213f06eba604bbd(player)) {
                                if (istrue(player.var_a18181d8bdaa0dab)) {
                                    player notify("gasmask_buffer_reset");
                                } else if (level.var_5312bc14bd5db377 > 0) {
                                    player.var_a18181d8bdaa0dab = 1;
                                    player thread scripts\mp\gametypes\br_pickups::function_a1d897962a19d27e();
                                }
                            }
                            if (istrue(player.var_a18181d8bdaa0dab)) {
                                continue;
                            } else if (isdefined(player.gasmaskhealth) && player.gasmaskhealth <= 0) {
                                player playsoundtoplayer("br_gas_mask_break_plr", player);
                                player scripts\mp\gametypes\br_pickups::function_4d16b9c52efa3b8();
                            } else {
                                player scripts\mp\gametypes\br_pickups::function_8206bc54a1ed73cb("br_circle");
                            }
                        }
                    }
                    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                        player updateindangercirclestate(var_acfa1a113ba7d7c7);
                    }
                    if (var_acfa1a113ba7d7c7) {
                        if (scripts\engine\utility::issharedfuncdefined("ftue", "player_action")) {
                            player [[ scripts\engine\utility::getsharedfunc("ftue", "player_action") ]]("br_ftue_gas_damage");
                        }
                    }
                }
                namespace_bbc79db4c3949a5c::function_8c0f978940451524(var_819edacdacb810e4, dangercircleradius, thresholdradius);
            }
        }
        wait 1;
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e8
// Size: 0xdc
function function_81652bad17cd28bd(modifieddamagetick) {
    player = self;
    if (isdefined(level.modifybrgasdamage)) {
        modifieddamagetick = player [[ level.modifybrgasdamage ]](modifieddamagetick);
    }
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
        modifieddamagetick = scripts\mp\gametypes\br_jugg_common::modifybrgasdamage(modifieddamagetick);
    }
    finalperc = 1;
    if (isdefined(player.var_c2c2848ce2585f29)) {
        finalperc += player.var_c2c2848ce2585f29;
    }
    modifieddamagetick *= finalperc;
    if (getdvarint(@"hash_acff883bb1879e40", 0) && modifieddamagetick <= 0) {
        logstring("CIRCLE DAMAGE LOGGING: Logging modifiedDamageTick of zero for " + player.name + ".");
    }
    player dodamage(modifieddamagetick, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
    player namespace_f8d3520d3483c1::damagearmor(modifieddamagetick);
    player tryplaycoughaudio();
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cc
// Size: 0xec
function updateindangercirclestate(isincircle) {
    if (!isdefined(self.isincircle)) {
        self.isincircle = isincircle;
        self.lastcircleeventtime = gettime();
    }
    if (self.isincircle != isincircle) {
        self.isincircle = isincircle;
        scripts\mp\perks\perkfunctions::function_2a32431b16c54b0d();
        currenttime = gettime();
        if (isincircle) {
            startchallengetimer("alive_in_gas");
            scripts\mp\gametypes\br_analytics::branalytics_circleenter(self, currenttime - self.lastcircleeventtime);
            namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_gas");
            if (istrue(self.gasmaskequipped)) {
                self clearsoundsubmix("jup_wz_gasmask_nogas");
            }
        } else {
            scripts\cp_mp\challenges::stopchallengetimer("alive_in_gas");
            scripts\mp\gametypes\br_analytics::branalytics_circleexit(self, currenttime - self.lastcircleeventtime);
            if (istrue(self.gasmaskequipped)) {
                self setsoundsubmix("jup_wz_gasmask_nogas");
            }
        }
        self.lastcircleeventtime = currenttime;
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x35a
function startuiclosetimer(waittime, var_f007ce073dc3c519, var_6b890e6be7982efb, circleindex, skipsplash) {
    level endon("game_ended");
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_hardpoint_timer", gettime() + int(waittime * 1000));
    }
    var_ae2ad6c65a8689f = function_fc0f865ddcf551ad() || getsubgametype() == "zxp" || getsubgametype() == "plunder";
    if (!var_f007ce073dc3c519 && !istrue(skipsplash)) {
        foreach (player in level.players) {
            if (!isbot(player) && !player scripts\mp\gametypes\br_public::isplayeringulag()) {
                if (istrue(var_6b890e6be7982efb)) {
                    player thread scripts\mp\hud_message::showsplash("br_final_circle");
                    continue;
                }
                if (!var_ae2ad6c65a8689f || circleindex > 1) {
                    player thread scripts\mp\hud_message::showsplash("br_new_circle");
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
    var_4f9eb3b7488639db = [60, 30, 20, 10, 0];
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
    wait waittime - var_4f9eb3b7488639db[startindex];
    for (i = startindex; i < var_4f9eb3b7488639db.size - 1; i++) {
        if (i == 3) {
            if (!isdefined(level.var_e486acb8f70c45a2)) {
                setomnvar("ui_br_circle_state", 2);
            }
            var_a0d948a339eee04 = istrue(level.br_circle.var_a0d948a339eee04) && !(isdefined(level.isstandardsandbox) && !level.isstandardsandbox);
            if (var_a0d948a339eee04) {
                var_2948ca54731de34f = 10.4;
                level thread scripts\mp\music_and_dialog::function_a486df26072a530a(level.br_circle.circleindex, level.br_level.br_circleclosetimes.size, var_2948ca54731de34f);
            }
        }
        wait var_4f9eb3b7488639db[i] - var_4f9eb3b7488639db[i + 1];
    }
    level notify("br_circle_closing");
    namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(0);
    foreach (player in level.players) {
        if (!isbot(player) && !player scripts\mp\gametypes\br_public::isplayeringulag() && (!var_ae2ad6c65a8689f || circleindex > 0) && !istrue(skipsplash)) {
            player thread scripts\mp\hud_message::showsplash("br_circle_moving");
            player namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_circle");
            player playlocalsound("br_circle_closing");
        }
    }
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_br_circle_state", 1);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d22
// Size: 0x2b
function _hidesafecircleui() {
    if (getsubgametype() == "champion") {
        return;
    }
    player = self;
    player setclientomnvar("ui_br_circle0_start_time", 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d55
// Size: 0x7b
function setpreviewuicircle(safecircleent) {
    foreach (player in level.players) {
        if (!isbot(player)) {
            player setclientomnvar("ui_br_circle0_start_entity", safecircleent);
            player setclientomnvar("ui_br_circle0_end_entity", safecircleent);
        }
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd8
// Size: 0x124
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f04
// Size: 0x125
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3031
// Size: 0xc9
function updatecirclehide(duration, safecircleent, var_fb3b2613d6f0eb05) {
    level notify("update_circle_omnvars");
    level endon("update_circle_omnvars");
    while (true) {
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3102
// Size: 0x2c
function _dangercircledurationforplayer(player, default_duration) {
    if (canseedangercircleui()) {
        return int(default_duration * 1000);
    }
    return 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3136
// Size: 0x2c
function _safecircledurationforplayer(player, default_duration) {
    if (canseesafecircleui()) {
        return int(default_duration * 1000);
    }
    return 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x316a
// Size: 0x5d
function islastcircle() {
    return level.br_circle.circleindex >= level.br_level.br_circleradii.size - 1 || !(level.br_level.br_circleradii[level.br_circle.circleindex + 1] > 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d0
// Size: 0x90
function gettimetillcircleclosing(circleindex, timeoffset) {
    assert(isdefined(circleindex) && circleindex >= 0);
    if (!isdefined(timeoffset)) {
        timeoffset = 0;
    }
    circlestart = level.br_circle.starttime / 1000;
    timefrom = gettime() / 1000 + timeoffset;
    timeremaining = timefrom - circlestart - level.br_level.br_circledelaytimes[circleindex];
    return max(timeremaining, 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3269
// Size: 0x90
function function_8aeca3abf89a629d(circleindex, timeoffset) {
    assert(isdefined(circleindex) && circleindex >= 0);
    if (!isdefined(timeoffset)) {
        timeoffset = 0;
    }
    circlestart = level.br_circle.starttime / 1000;
    timefrom = gettime() / 1000 + timeoffset;
    timeremaining = timefrom - circlestart - level.br_level.br_circleclosetimes[circleindex];
    return max(timeremaining, 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3302
// Size: 0x6c
function circleduration(circleindex) {
    assert(isdefined(circleindex) && circleindex >= 0);
    delaytime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    totaltime = delaytime + closetime;
    return totaltime;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3377
// Size: 0x79
function function_abbfb4d18d1a9ca7() {
    curcircleindex = level.br_circle.circleindex;
    var_8c2ce200a652593d = circleduration(curcircleindex);
    var_c36de2ea5fc9f896 = level.br_circle.starttime / 1000;
    var_d618cf2b46344a74 = gettime() / 1000 - var_c36de2ea5fc9f896;
    assert(var_d618cf2b46344a74 >= 0);
    return var_8c2ce200a652593d - var_d618cf2b46344a74;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f9
// Size: 0x318
function function_bf5f4d7a498988a8(player, var_498e4e279fb8ed85, timeoffset) {
    var_517e15e5e8524c5a = array_randomize(level.teamdata[player.team]["alivePlayers"]);
    targetsquadmember = undefined;
    foreach (squadmember in var_517e15e5e8524c5a) {
        if (squadmember != player) {
            targetsquadmember = squadmember;
            break;
        }
    }
    if (!isdefined(targetsquadmember)) {
        return undefined;
    }
    point = targetsquadmember.origin;
    currcircleindex = level.br_circle.circleindex;
    var_c0fc062071351cda = gettimetillcircleclosing(currcircleindex, var_498e4e279fb8ed85 + timeoffset);
    nextcircleindex = int(min(currcircleindex + 1, level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount - 1));
    var_6f469351639732e2 = level.br_level.br_circleclosetimes[currcircleindex];
    var_6b1bef6d15c8772c = level.br_level.br_circlecenters[currcircleindex];
    currcircleradius = level.br_level.br_circleradii[currcircleindex];
    nextcirclecenter = level.br_level.br_circlecenters[nextcircleindex];
    nextcircleradius = level.br_level.br_circleradii[nextcircleindex];
    closingspeedcenter = (nextcirclecenter - var_6b1bef6d15c8772c) / var_6f469351639732e2;
    var_11a5c2966a360011 = (nextcircleradius - currcircleradius) / var_6f469351639732e2;
    var_2f5ff20fce786fc1 = var_6b1bef6d15c8772c + closingspeedcenter * var_c0fc062071351cda;
    targetcircleradius = currcircleradius + var_11a5c2966a360011 * var_c0fc062071351cda;
    dist = distance2d(point, var_2f5ff20fce786fc1);
    checkbadcircles = getdvarint(@"hash_7525f014f690c068", 0);
    var_1fbe1a61e1b49e9b = getdvarfloat(@"hash_f8eebbe68b000328", 1000);
    targetpoint = point + (var_2f5ff20fce786fc1 - point) * var_1fbe1a61e1b49e9b / dist;
    if (isvalidpointinbounds(targetpoint, checkbadcircles, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    var_75ec7457d721f50d = getdvarfloat(@"hash_921a01e1bee01d8b", 0.5);
    var_1fbe1a61e1b49e9b = dist * var_75ec7457d721f50d;
    targetpoint = point + (var_2f5ff20fce786fc1 - point) * var_1fbe1a61e1b49e9b / dist;
    if (isvalidpointinbounds(targetpoint, checkbadcircles, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    vector = point - var_2f5ff20fce786fc1;
    targetpoint = var_2f5ff20fce786fc1 + targetcircleradius / dist * vector;
    if (isvalidpointinbounds(targetpoint, checkbadcircles, var_498e4e279fb8ed85 + timeoffset)) {
        return targetpoint;
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371a
// Size: 0x5c
function isvalidpointinbounds(point, var_ae913f2dc0534b48, var_498e4e279fb8ed85) {
    if (!scripts\mp\gametypes\br_c130::ispointinbounds(point, 1)) {
        return false;
    }
    if (istrue(var_ae913f2dc0534b48) && _ispointinbadarea(point)) {
        return false;
    }
    if (isdefined(var_498e4e279fb8ed85)) {
        var_653bf8aef0b21244 = scripts\mp\gametypes\br_circle::getmintimetillpointindangercircle(point);
        if (var_498e4e279fb8ed85 > var_653bf8aef0b21244) {
            return false;
        }
    }
    return true;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377f
// Size: 0xf8
function function_fc52ae1478a8fc25(radiuspercent, var_498e4e279fb8ed85) {
    aliveteammembers = level.teamdata[self.team]["alivePlayers"];
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent) && isdefined(aliveteammembers)) {
        var_517e15e5e8524c5a = array_sort_with_func(aliveteammembers, &function_dab8de01355c25ec);
        foreach (squadmember in var_517e15e5e8524c5a) {
            if (squadmember != self) {
                if (squadmember scripts\mp\gametypes\br_public::isplayerinorgoingtogulag() == 0) {
                    var_eb253da880af5bb6 = function_2548c1ccae77830b(squadmember.origin, radiuspercent, var_498e4e279fb8ed85);
                    if (isdefined(var_eb253da880af5bb6)) {
                        return var_eb253da880af5bb6;
                    }
                }
            }
        }
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3880
// Size: 0x2a
function function_dab8de01355c25ec(player1, player2) {
    return player1.health >= player2.health;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38b3
// Size: 0x110
function function_bf16029a7b6ff1fa(radiuspercent, var_498e4e279fb8ed85) {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.safecircleent)) {
        foreach (crate in level.br_pickups.crates) {
            if (!isdefined(crate) || !isdefined(crate.team) || crate.team != self.team) {
                continue;
            }
            if (isdefined(crate.playerscaptured) && isdefined(crate.playerscaptured[self getentitynumber()])) {
                continue;
            }
            var_eb253da880af5bb6 = function_2548c1ccae77830b(crate.origin, radiuspercent, var_498e4e279fb8ed85);
            if (isdefined(var_eb253da880af5bb6)) {
                return var_eb253da880af5bb6;
            }
        }
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39cc
// Size: 0x1db
function function_2548c1ccae77830b(targetpos, radiuspercent, var_498e4e279fb8ed85) {
    safeorigins = namespace_bbc79db4c3949a5c::function_de2f1b656ee04ba9();
    saferadii = namespace_bbc79db4c3949a5c::function_54798383fa7f572b();
    dangerorigins = namespace_bbc79db4c3949a5c::function_7d381171eae99b77();
    dangerradii = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
    checkbadcircles = getdvarint(@"hash_a7a08b8f08b5bc60", 1);
    currentclosestpoint = undefined;
    var_a243a9012c90f841 = undefined;
    for (index = 0; index < safeorigins.size; index++) {
        safeorigin = safeorigins[index];
        saferadius = saferadii[index];
        dangerorigin = dangerorigins[index];
        dangerradius = dangerradii[index];
        var_c6af26ce6f14b427 = saferadius * saferadius;
        if (var_c6af26ce6f14b427 > 0) {
            targetdistance = distance2d(targetpos, dangerorigin);
            totalsteps = 4;
            for (currentstep = totalsteps; currentstep >= 0; currentstep--) {
                testdistance = dangerradius * currentstep / totalsteps;
                var_eb253da880af5bb6 = (targetpos - dangerorigin) * testdistance / targetdistance * radiuspercent + dangerorigin;
                if (isvalidpointinbounds(var_eb253da880af5bb6, checkbadcircles, var_498e4e279fb8ed85)) {
                    if (getdvarint(@"hash_7017ad29dbedc8b1", 1) == 1 && isnavmeshloaded()) {
                        var_eb253da880af5bb6 = getclosestpointonnavmesh(var_eb253da880af5bb6);
                        if (!isvalidpointinbounds(var_eb253da880af5bb6, checkbadcircles, var_498e4e279fb8ed85)) {
                            continue;
                        }
                    }
                    var_dce4ec4424bb0dd0 = distance2dsquared(var_eb253da880af5bb6, targetpos);
                    if (!isdefined(var_a243a9012c90f841) || var_dce4ec4424bb0dd0 < var_a243a9012c90f841) {
                        currentclosestpoint = var_eb253da880af5bb6;
                        var_a243a9012c90f841 = var_dce4ec4424bb0dd0;
                    }
                    break;
                }
            }
        }
    }
    return currentclosestpoint;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb0
// Size: 0x1eb
function function_177e9958fce17793(targetpos, radiuspercent, var_498e4e279fb8ed85, var_59e43f8ce6784122) {
    safeorigins = namespace_bbc79db4c3949a5c::function_de2f1b656ee04ba9();
    saferadii = namespace_bbc79db4c3949a5c::function_54798383fa7f572b();
    dangerorigins = namespace_bbc79db4c3949a5c::function_7d381171eae99b77();
    dangerradii = namespace_bbc79db4c3949a5c::function_bf15a5aa7e72aee9();
    checkbadcircles = getdvarint(@"hash_a7a08b8f08b5bc60", 1);
    currentclosestpoint = undefined;
    var_a243a9012c90f841 = undefined;
    for (index = 0; index < safeorigins.size; index++) {
        safeorigin = safeorigins[index];
        saferadius = saferadii[index];
        dangerorigin = dangerorigins[index];
        dangerradius = dangerradii[index];
        var_c6af26ce6f14b427 = saferadius * saferadius;
        if (var_c6af26ce6f14b427 > 0) {
            targetdistance = distance2d(targetpos, dangerorigin);
            totalsteps = 4;
            for (currentstep = totalsteps; currentstep >= 0; currentstep--) {
                stepratio = currentstep / totalsteps;
                vector = targetpos - dangerorigin;
                if (targetdistance > dangerradius) {
                    vector = vector / targetdistance * dangerradius;
                }
                var_eb253da880af5bb6 = vector * stepratio * radiuspercent + dangerorigin;
                if (isvalidpointinbounds(var_eb253da880af5bb6, checkbadcircles, var_498e4e279fb8ed85)) {
                    if (istrue(var_59e43f8ce6784122) && isnavmeshloaded()) {
                        var_eb253da880af5bb6 = getclosestpointonnavmesh(var_eb253da880af5bb6);
                        if (!isvalidpointinbounds(var_eb253da880af5bb6, checkbadcircles, var_498e4e279fb8ed85)) {
                            continue;
                        }
                    }
                    var_dce4ec4424bb0dd0 = distance2dsquared(var_eb253da880af5bb6, targetpos);
                    if (!isdefined(var_a243a9012c90f841) || var_dce4ec4424bb0dd0 < var_a243a9012c90f841) {
                        currentclosestpoint = var_eb253da880af5bb6;
                        var_a243a9012c90f841 = var_dce4ec4424bb0dd0;
                    }
                    break;
                }
            }
        }
    }
    return currentclosestpoint;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3da4
// Size: 0x16e
function getrandompointinboundscircle(origin, radius, percentmin, percentmax, droptoground, var_38a4c729748ad94c, var_ae913f2dc0534b48, var_498e4e279fb8ed85, anglemin, anglemax) {
    maxtests = 8;
    pointinbounds = origin;
    testcount = 0;
    if (!isdefined(anglemin)) {
        anglemin = 0;
    }
    if (!isdefined(anglemax)) {
        anglemax = 360;
    }
    while (testcount < maxtests) {
        randompoint = getrandompointincircle(origin, radius, percentmin, percentmax, 1, 0, anglemin, anglemax);
        if (isvalidpointinbounds(randompoint, var_ae913f2dc0534b48, var_498e4e279fb8ed85)) {
            var_16330882772f973f = randompoint;
            if (istrue(var_38a4c729748ad94c) && isnavmeshloaded()) {
                randompoint = getclosestpointonnavmesh(var_16330882772f973f);
                if (isvalidpointinbounds(randompoint, var_ae913f2dc0534b48, var_498e4e279fb8ed85)) {
                    pointinbounds = randompoint;
                    break;
                }
            } else {
                pointinbounds = randompoint;
                break;
            }
        }
        dirtocenter = level.br_level.br_circlecenters[0] - origin;
        dirtocenter = (dirtocenter[0], dirtocenter[1], 0);
        yaw = vectortoangles(dirtocenter)[1];
        delta = (1 - testcount / maxtests) * 180;
        anglemin = yaw - delta;
        anglemax = yaw + delta;
        testcount++;
    }
    return pointinbounds;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1b
// Size: 0x1ef
function getrandompointincircle(origin, radius, percentmin, percentmax, droptoground, var_38a4c729748ad94c, minangle, maxangle) {
    if (radius <= 0) {
        return origin;
    }
    mindistpercent = 0;
    if (isdefined(percentmin)) {
        assert(percentmin >= 0 && percentmin <= 1);
        mindistpercent = percentmin;
    }
    maxdistpercent = 1;
    if (isdefined(percentmax)) {
        assert(percentmax >= 0 && percentmax <= 1);
        maxdistpercent = percentmax;
    }
    assert(mindistpercent <= maxdistpercent);
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
    assert(minangle <= maxangle);
    minchoice = squared(radius * mindistpercent);
    maxchoice = squared(radius * maxdistpercent);
    r = undefined;
    if (minchoice == maxchoice) {
        r = sqrt(minchoice);
    } else {
        r = sqrt(randomfloatrange(minchoice, maxchoice));
    }
    theta = minangle + randomfloat(maxangle - minangle);
    offset = (r * cos(theta), r * sin(theta), 0);
    randompoint = origin + offset;
    if (droptoground) {
        contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1);
        randompoint = scripts\mp\gametypes\br_public::droptogroundmultitrace((origin[0], origin[1], 4000) + offset, undefined, undefined, contents);
    }
    if (var_38a4c729748ad94c && isnavmeshloaded()) {
        randompoint = getclosestpointonnavmesh(randompoint);
    }
    return randompoint;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4113
// Size: 0x63
function getrandompointincurrentcircle(percentmin, percentmax) {
    var_819edacdacb810e4 = getdangercircleorigin();
    dist = level.br_level.br_circleradii[level.br_circle.circleindex + 1];
    return getrandompointincircle(var_819edacdacb810e4, dist, percentmin, percentmax);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417f
// Size: 0x3f
function getrandompointinsafecircle(percentmin, percentmax) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    safecircleradius = getsafecircleradius();
    return getrandompointincircle(var_add4fd7502a75a8a, safecircleradius, percentmin, percentmax);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c7
// Size: 0x3f
function getrandompointinboundssafecircle(percentmin, percentmax) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    safecircleradius = getsafecircleradius();
    return getrandompointinboundscircle(var_add4fd7502a75a8a, safecircleradius, percentmin, percentmax);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x420f
// Size: 0xc3
function ispointincurrentsafecircle(point) {
    if (!isdefined(level.br_circle.dangercircleent)) {
        return false;
    }
    var_ddb2971ce26a24a9 = (level.br_circle.dangercircleent.origin[0], level.br_circle.dangercircleent.origin[1], 0);
    safecircleradius = level.br_level.br_circleradii[level.br_circle.circleindex + 1];
    var_2db625e063f40b4 = distance2dsquared(point, var_ddb2971ce26a24a9);
    if (var_2db625e063f40b4 < safecircleradius * safecircleradius) {
        return true;
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42db
// Size: 0x59
function ispointinnextsafecircle(point) {
    var_ce1da41cb549917 = getnextsafecircleorigin();
    var_1a7e5abe8e67caab = getnextsafecircleradius();
    if (!isdefined(var_ce1da41cb549917) || !isdefined(var_1a7e5abe8e67caab)) {
        return false;
    }
    var_2db625e063f40b4 = distance2dsquared(point, var_ce1da41cb549917);
    if (var_2db625e063f40b4 < var_1a7e5abe8e67caab * var_1a7e5abe8e67caab) {
        return true;
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x433d
// Size: 0x4b
function function_c11714256f856e10(point) {
    circleorigin = getdangercircleorigin();
    circleradius = getdangercircleradius();
    radiussquared = circleradius * circleradius;
    if (distance2dsquared(point, circleorigin) < radiussquared) {
        return true;
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4391
// Size: 0x7f
function dangercircleenthidefromplayers() {
    self endon("death");
    while (true) {
        self show();
        foreach (player in level.players) {
            if (!player playercanseedangercircleworld()) {
                self hidefromplayer(player);
            }
        }
        level waittill("update_circle_hide");
    }
}

/#

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4418
    // Size: 0x566
    function function_907a72325980713f(maxpoints, areacount, circleindex) {
        level notify("<dev string:x2c>");
        level endon("<dev string:x2c>");
        endpoints = [];
        if (!isdefined(maxpoints)) {
            maxpoints = 1000;
        }
        if (!isdefined(areacount)) {
            areacount = 10;
        }
        if (!isdefined(circleindex)) {
            circleindex = level.br_level.br_circlecenters.size - 1 - level.br_level.br_movingcirclecount;
        }
        xmin = level.mapcorners[0].origin[0];
        xmax = level.mapcorners[1].origin[0];
        if (xmax < xmin) {
            xmin = level.mapcorners[1].origin[0];
            xmax = level.mapcorners[0].origin[0];
        }
        xsize = xmax - xmin;
        var_d3426ff50f0ff497 = xsize / areacount;
        ymin = level.mapcorners[0].origin[1];
        ymax = level.mapcorners[1].origin[1];
        if (ymax < ymin) {
            ymin = level.mapcorners[1].origin[1];
            ymax = level.mapcorners[0].origin[1];
        }
        ysize = ymax - ymin;
        var_b3dd581cafbd5000 = ysize / areacount;
        areacounts = [];
        for (x = 0; x < areacount; x++) {
            areacounts[x] = [];
            for (y = 0; y < areacount; y++) {
                areacounts[x][y] = 0;
            }
        }
        waitevery = 500;
        maxcount = 0;
        for (i = 0; i < maxpoints; i++) {
            var_926527df010af9f4 = !circleindex || circleindex == level.br_level.br_circlecenters.size - 1 - level.br_level.br_movingcirclecount;
            scripts\mp\gametypes\br_multi_circle::function_f92da29572a7dc78();
            _precalcsafecirclecenters(undefined, 1, var_926527df010af9f4);
            point = level.br_level.br_circlecenters[circleindex];
            pointx = point[0];
            if (pointx < xmin || pointx > xmax) {
                continue;
            }
            x = int((pointx - xmin) / (xmax - xmin) * areacount);
            pointy = point[1];
            if (pointy < ymin || pointy > ymax) {
                continue;
            }
            y = int((pointy - ymin) / (ymax - ymin) * areacount);
            areacounts[x][y] = areacounts[x][y] + 1;
            if (areacounts[x][y] > maxcount) {
                maxcount = areacounts[x][y];
            }
            if (!((i + 1) % waitevery)) {
                waitframe();
            }
        }
        _precalcsafecirclecenters();
        mincount = maxcount;
        for (x = 0; x < areacount; x++) {
            for (y = 0; y < areacount; y++) {
                if (areacounts[x][y] < mincount) {
                    mincount = areacounts[x][y];
                }
            }
        }
        deltacount = maxcount - mincount;
        while (true) {
            for (x = 0; x <= areacount; x++) {
                line((xmin + x * var_d3426ff50f0ff497, ymin, 0), (xmin + x * var_d3426ff50f0ff497, ymax, 0), (1, 1, 0));
            }
            for (y = 0; y <= areacount; y++) {
                line((xmin, ymin + y * var_d3426ff50f0ff497, 0), (xmax, ymin + y * var_d3426ff50f0ff497, 0), (1, 1, 0));
            }
            for (x = 0; x < areacount; x++) {
                for (y = 0; y < areacount; y++) {
                    count = areacounts[x][y];
                    if (count == 0) {
                        continue;
                    }
                    if (deltacount) {
                        colorfrac = (count - mincount) / deltacount;
                    } else {
                        colorfrac = 1;
                    }
                    if (colorfrac < 0.25) {
                        color = (0, colorfrac / 0.25, 1);
                    } else if (colorfrac < 0.5) {
                        colorfrac -= 0.25;
                        color = (0, 1, 1 - colorfrac / 0.25);
                    } else if (colorfrac < 0.75) {
                        colorfrac -= 0.5;
                        color = (colorfrac / 0.25, 1, 0);
                    } else {
                        colorfrac -= 0.75;
                        color = (1, 1 - colorfrac / 0.25, 0);
                    }
                    scale = var_d3426ff50f0ff497 / 32;
                    print3d((xmin + x * var_d3426ff50f0ff497 + var_d3426ff50f0ff497 / 2, ymin + y * var_d3426ff50f0ff497 + var_b3dd581cafbd5000 / 2, 0), "<dev string:x55>" + count, color, 1, scale, 1, 1);
                }
            }
            waitframe();
        }
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4986
    // Size: 0x201
    function function_184d1e23ec969c18(simulations) {
        level notify("<dev string:x56>");
        level endon("<dev string:x56>");
        if (isdefined(level.var_184d1e23ec969c18)) {
            level.var_184d1e23ec969c18 = undefined;
            return;
        }
        level.var_184d1e23ec969c18 = 1;
        circlesimulations = [];
        for (i = 0; i < simulations; i++) {
            scripts\mp\gametypes\br_multi_circle::function_f92da29572a7dc78();
            _precalcsafecirclecenters(undefined, 1);
            var_3db3628ca5e80be6 = spawnstruct();
            var_3db3628ca5e80be6.circlecenters = arraycopy(level.br_level.br_circlecenters);
            var_3db3628ca5e80be6.color = (randomfloatrange(0.2, 1), randomfloatrange(0.2, 1), randomfloatrange(0.2, 1));
            circlesimulations[circlesimulations.size] = var_3db3628ca5e80be6;
        }
        endingcircleindex = level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount - 1;
        startingcircleindex = 1;
        while (true) {
            foreach (var_3db3628ca5e80be6 in circlesimulations) {
                circlecenters = var_3db3628ca5e80be6.circlecenters;
                color = var_3db3628ca5e80be6.color;
                for (circleindex = startingcircleindex; circleindex <= endingcircleindex; circleindex += 1) {
                    print3d(circlecenters[circleindex], "<dev string:x55>" + circleindex, color, 1, 25, 1);
                    sphere(circlecenters[circleindex], 180, color, 0, 1);
                    if (circleindex != startingcircleindex) {
                        cylinder(circlecenters[circleindex - 1], circlecenters[circleindex], 20, color, 1, 0, 1);
                    }
                }
            }
            waitframe();
        }
    }

#/

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8f
// Size: 0xb3
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
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("getFinalCircleCenter")) {
        level.br_circle.br_finalcircleoverride = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("getFinalCircleCenter");
    }
    function_84e5ef30b000ef20();
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c4a
// Size: 0x12f
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
        return;
    }
    var_e943e46f29a2e1ce = function_8e888649a8178cea(var_e60bfc21d3dced49);
    if (isdefined(var_e943e46f29a2e1ce)) {
        level.br_circle.br_finalcircleoverride = level.var_da89dff7e3009777[var_e943e46f29a2e1ce].origin;
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d81
// Size: 0x1be
function function_72cbdb2550894694() {
    level.var_da89dff7e3009777 = [];
    for (row = 0; true; row++) {
        locationname = tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 1);
        if (locationname == "") {
            break;
        }
        locationdisabled = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 5));
        if (!istrue(locationdisabled)) {
            locationindex = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 0));
            locationx = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 2));
            locationy = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 3));
            locationz = int(tablelookupbyrow(level.br_level.var_257dee2bbc2480f5, row, 4));
            stringref = tablelookupistringbyrow(level.br_level.var_257dee2bbc2480f5, row, 6);
            var_7d64a7c122b67e8a = spawnstruct();
            var_7d64a7c122b67e8a.name = locationname;
            var_7d64a7c122b67e8a.id = locationindex;
            var_7d64a7c122b67e8a.origin = (locationx, locationy, locationz);
            var_7d64a7c122b67e8a.stringref = stringref;
            level.var_da89dff7e3009777[level.var_da89dff7e3009777.size] = var_7d64a7c122b67e8a;
        }
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f47
// Size: 0x84
function function_8e888649a8178cea(searchid) {
    locationindex = undefined;
    validlocations = level.var_da89dff7e3009777;
    foreach (index, location in validlocations) {
        if (searchid == location.id) {
            locationindex = index;
        }
    }
    return locationindex;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd4
// Size: 0xbf
function _ispointinbadarea(point) {
    if (getdvarint(@"hash_507e524ae2b21f76", 0) == 1) {
        return false;
    }
    if (!isdefined(level.br_badcircleareas) || level.br_badcircleareas.size == 0) {
        return false;
    }
    foreach (area in level.br_badcircleareas) {
        distsq = distance2dsquared(point, area.origin);
        if (distsq < area.radiussq) {
            return true;
        }
    }
    return false;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509c
// Size: 0xee
function function_5ad21cddca41580f(circleindex) {
    var_5aa1b0e46123e5b4 = getdvarfloat(@"hash_35d088c38ab6c27", 0.7);
    playerspeed = var_5aa1b0e46123e5b4 * getdvarfloat(@"hash_917b939513f89b55", 200);
    radius = level.br_level.br_circleradii[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    prevradius = level.br_level.br_circleradii[circleindex + 1];
    deltaradius = radius - prevradius;
    radiusspeed = deltaradius / closetime;
    maxmovespeed = max(0, playerspeed - radiusspeed);
    maxmovedist = maxmovespeed * closetime;
    return maxmovedist;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5193
// Size: 0x153
function function_d45be26e9bfb904(var_50c422b464b3e15d, var_ad4d828d3b1da2e6, var_b7c9fe00120ea96c) {
    movedistances = [];
    startcenter = level.br_level.br_circlecenters[var_50c422b464b3e15d];
    endcenter = level.br_level.br_circlecenters[var_ad4d828d3b1da2e6];
    var_eb03f3d04f21f2b = distance2d(endcenter, startcenter);
    var_370050a3c3a88a8f = 0;
    for (circleindex = var_50c422b464b3e15d; circleindex >= var_ad4d828d3b1da2e6; circleindex--) {
        movedistances[circleindex] = function_5ad21cddca41580f(circleindex);
        var_370050a3c3a88a8f += movedistances[circleindex];
    }
    if (var_370050a3c3a88a8f < var_eb03f3d04f21f2b) {
        if (!istrue(var_b7c9fe00120ea96c)) {
            dlog_recordevent("dlog_event_br_circle_fixed_distance_warning", ["circle_distance", var_eb03f3d04f21f2b, "max_circle_distance", var_370050a3c3a88a8f]);
        }
        var_370050a3c3a88a8f = var_eb03f3d04f21f2b;
    }
    slack = var_370050a3c3a88a8f - var_eb03f3d04f21f2b;
    var_46f89614eb4490f4 = [];
    foreach (circleindex, movedist in movedistances) {
        var_46f89614eb4490f4[circleindex] = movedist - slack * movedist / var_370050a3c3a88a8f;
    }
    return var_46f89614eb4490f4;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52ef
// Size: 0x14b
function function_4ae4729139de5b5c(circleindex, movedist, fixedcircleindex, var_38a4c729748ad94c) {
    var_7bb01beb74a0dc89 = level.br_level.br_circlecenters[circleindex + 1];
    var_c6d2479dfc6ccd98 = level.br_level.br_circlecenters[fixedcircleindex];
    var_c0cb87deaceeb1c0 = distance2d(var_7bb01beb74a0dc89, var_c6d2479dfc6ccd98);
    circledist = var_c0cb87deaceeb1c0 - movedist;
    var_c6789737f9e7468d = var_7bb01beb74a0dc89 - var_c6d2479dfc6ccd98;
    var_f700ce08c40eab6d = vectortoangles(var_c6789737f9e7468d)[1];
    maxmovedist = function_5ad21cddca41580f(circleindex);
    var_d4e52415eaeb9fc6 = (circledist * circledist + var_c0cb87deaceeb1c0 * var_c0cb87deaceeb1c0 - maxmovedist * maxmovedist) / 2 * circledist * var_c0cb87deaceeb1c0;
    var_d4e52415eaeb9fc6 = clamp(var_d4e52415eaeb9fc6, -1, 1);
    var_aef5a331ed08af8f = acos(var_d4e52415eaeb9fc6);
    anglemin = var_f700ce08c40eab6d - var_aef5a331ed08af8f;
    anglemax = var_f700ce08c40eab6d + var_aef5a331ed08af8f;
    circlecenter = getrandompointinboundscircle(var_c6d2479dfc6ccd98, circledist, 1, 1, 1, var_38a4c729748ad94c, 1, undefined, anglemin, anglemax);
    return circlecenter;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5443
// Size: 0x6b
function function_23be439885e300bd(var_50c422b464b3e15d, var_ad4d828d3b1da2e6, var_38a4c729748ad94c) {
    var_bdd890aa9e9f45a0 = function_d45be26e9bfb904(var_50c422b464b3e15d, var_ad4d828d3b1da2e6);
    for (circleindex = var_50c422b464b3e15d - 1; circleindex > var_ad4d828d3b1da2e6; circleindex--) {
        level.br_level.br_circlecenters[circleindex] = function_4ae4729139de5b5c(circleindex, var_bdd890aa9e9f45a0[circleindex], var_ad4d828d3b1da2e6, var_38a4c729748ad94c);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54b6
// Size: 0xd25
function _precalcsafecirclecenters(var_21231f7b22a75955, var_b7c9fe00120ea96c, var_437c3e3159a04f4e) {
    function_64f6d9b4ba95ed35(var_21231f7b22a75955);
    level.br_level.br_circlecenters = [];
    mapcenter = (level.br_circle.mapbounds[0] + level.br_circle.mapbounds[1]) * 0.5;
    level.br_level.br_circlecenters[0] = (mapcenter[0], mapcenter[1], 0);
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("mapCenterFinalCircle")) {
        mapcenter = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("mapCenterFinalCircle");
        if (isdefined(mapcenter)) {
            level.br_level.br_circlecenters[0] = (mapcenter[0], mapcenter[1], 0);
        }
    }
    centerx = mapcenter[0];
    centery = mapcenter[1];
    if (istrue(level.br_level.staticcircle)) {
        level.br_level.br_circlecenters[0] = scripts\mp\gametypes\br_public::droptogroundmultitrace((centerx, centery, 4000));
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
    radiusbounds = [];
    radiusbounds[0] = level.br_circle.mapbounds[0][0] - var_ba2d3e495cf92c77;
    radiusbounds[1] = level.br_circle.mapbounds[0][1] - var_ba2d3e495cf92c77;
    radiusbounds[2] = level.br_circle.mapbounds[1][0] + var_ba2d3e495cf92c77;
    radiusbounds[3] = level.br_circle.mapbounds[1][1] + var_ba2d3e495cf92c77;
    xmin = min(radiusbounds[0], radiusbounds[2]);
    xmax = max(radiusbounds[0], radiusbounds[2]);
    ymin = min(radiusbounds[1], radiusbounds[3]);
    ymax = max(radiusbounds[1], radiusbounds[3]);
    var_c0013e62498c366b = function_3011d71052d72d2a();
    circlecenter = var_c0013e62498c366b[1];
    scriptedendpos = var_c0013e62498c366b[0];
    var_38a4c729748ad94c = getdvarint(@"hash_67a8c844bad5a45b", 0);
    if (!var_38a4c729748ad94c && scripts\mp\gametypes\br_gametypes::isfeatureenabled("circleSnapToNavMesh")) {
        var_38a4c729748ad94c = 1;
    }
    contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1);
    lastcircleindex = level.br_level.br_circleradii.size - 1 - level.br_level.br_movingcirclecount;
    var_8aeea60c4409a34f = function_88f7b8fa20846f45();
    if (isdefined(var_8aeea60c4409a34f)) {
        var_ec56dfc4f3659de2 = var_8aeea60c4409a34f + 1;
    } else {
        var_ec56dfc4f3659de2 = lastcircleindex + 1;
    }
    if (isdefined(level.br_circle.br_finalcircleoverride)) {
        testx = level.br_circle.br_finalcircleoverride[0];
        testy = level.br_circle.br_finalcircleoverride[1];
        ispointinbounds = scripts\mp\gametypes\br_c130::ispointinbounds((testx, testy, 0), 1);
        var_6e3da7022558f910 = _ispointinbadarea((testx, testy, 0));
        isvalidpointbr = ispointinbounds && !var_6e3da7022558f910;
        if (isvalidpointbr) {
            centerx = testx;
            centery = testy;
        }
    } else if (isdefined(scriptedendpos)) {
        centerx = scriptedendpos[0];
        centery = scriptedendpos[1];
        if (getdvarint(@"hash_bbf992a979df8e2c", 0) == 1) {
            level.br_level.br_circlecenters[0] = (circlecenter[0], circlecenter[1], 0);
        }
    } else if (var_ec56dfc4f3659de2 <= lastcircleindex) {
        offsetseconds = function_676cfe2ab64ea758() / 1000;
        circledurations = [];
        trainspeeds = [];
        for (index = 0; index < lastcircleindex; index++) {
            circledurations[index] = level.br_level.br_circleclosetimes[index] + level.br_level.br_circledelaytimes[index] + offsetseconds;
            trainspeeds[index] = level.br_level.var_572a1674797a9fa8[index];
        }
        flag_wait("wztrain_array_set");
        var_2a89c7b0c1c8790a = undefined;
        var_7544a4e82ac345b2 = 0;
        if (issharedfuncdefined("br_movingtrain", "predictCargoTrainPositions")) {
            var_53cf92a0f79db880 = getsharedfunc("br_movingtrain", "predictCargoTrainPositions");
            var_2a89c7b0c1c8790a = [[ var_53cf92a0f79db880 ]](circledurations, trainspeeds, level.br_level.var_564911cbc1774914, var_7544a4e82ac345b2);
            centerx = var_2a89c7b0c1c8790a[lastcircleindex - 1][0];
            centery = var_2a89c7b0c1c8790a[lastcircleindex - 1][1];
        } else {
            assertmsg("Cannot find train functions to predict circle centers!");
        }
    } else {
        maxtests = 8;
        for (testcount = 0; testcount < maxtests; testcount++) {
            testx = randomfloatrange(xmin, xmax);
            testy = randomfloatrange(ymin, ymax);
            if (scripts\mp\gametypes\br_c130::ispointinbounds((testx, testy, 0), 1) && !_ispointinbadarea((testx, testy, 0))) {
                var_45481dbe05c81f00 = 1;
                if (var_38a4c729748ad94c && isnavmeshloaded()) {
                    groundpos = scripts\mp\gametypes\br_public::droptogroundmultitrace((testx, testy, 4000), undefined, undefined, contents);
                    navmeshpoint = getclosestpointonnavmesh(groundpos);
                    if (distance2dsquared(navmeshpoint, (testx, testy, 0)) > 10000) {
                        var_45481dbe05c81f00 = 0;
                    }
                }
                if (var_45481dbe05c81f00) {
                    centerx = testx;
                    centery = testy;
                    break;
                }
            }
            xmin *= 0.9;
            xmax *= 0.9;
            ymin *= 0.9;
            ymax *= 0.9;
        }
    }
    level.br_level.br_circlecenters[lastcircleindex] = scripts\mp\gametypes\br_public::droptogroundmultitrace((centerx, centery, 4000));
    if (istrue(var_437c3e3159a04f4e)) {
        return;
    }
    playerspeed = getdvarfloat(@"hash_917b939513f89b55", 200);
    var_11c1e6222da58849 = getdvarint(@"hash_e65611a4d524bcbe", 0);
    var_2c81885db7212a3a = lastcircleindex;
    circleindex = lastcircleindex - 1;
    for (fixedcircleindex = lastcircleindex; fixedcircleindex >= 0; fixedcircleindex--) {
        if (getdvarint(hashcat(@"hash_6e15be73eb8cd142", fixedcircleindex), 0)) {
            var_eec904e8534cd82d = getdvarvector(hashcat(@"hash_1f5d1ccbe88f98a5", fixedcircleindex), (0, 0, 0));
            level.br_level.br_circlecenters[fixedcircleindex] = scripts\mp\gametypes\br_public::droptogroundmultitrace((var_eec904e8534cd82d[0], var_eec904e8534cd82d[1], 4000));
            function_23be439885e300bd(var_2c81885db7212a3a, fixedcircleindex, var_38a4c729748ad94c);
            var_2c81885db7212a3a = fixedcircleindex;
            circleindex = fixedcircleindex - 1;
        }
    }
    while (circleindex >= 0) {
        if (circleindex >= var_ec56dfc4f3659de2 && isdefined(var_2a89c7b0c1c8790a)) {
            circlecenter = var_2a89c7b0c1c8790a[circleindex - 1];
            level.br_level.br_circlecenters[circleindex] = scripts\mp\gametypes\br_public::droptogroundmultitrace((circlecenter[0], circlecenter[1], 4000));
        } else {
            origin = level.br_level.br_circlecenters[circleindex + 1];
            radius = level.br_level.br_circleradii[circleindex];
            minpct = 0;
            maxpct = 1 - level.br_level.br_circleradii[circleindex + 1] / radius;
            if (isdefined(level.br_circle.var_bf394857229861a5) && isfunction(level.br_circle.var_bf394857229861a5)) {
                var_c0013d62498c3438 = [[ level.br_circle.var_bf394857229861a5 ]](circleindex + 1);
                var_a82bed82fd7fcb04 = var_c0013d62498c3438[1];
                var_5bd850c4e76ad14e = var_c0013d62498c3438[0];
                if (isdefined(var_5bd850c4e76ad14e)) {
                    minpct = max(var_5bd850c4e76ad14e, minpct);
                }
                if (isdefined(var_a82bed82fd7fcb04)) {
                    maxpct = min(var_a82bed82fd7fcb04, maxpct);
                }
            }
            pct = minpct + randomfloat(maxpct - minpct);
            closetime = level.br_level.br_circleclosetimes[circleindex];
            prevradius = level.br_level.br_circleradii[circleindex + 1];
            deltaradius = radius - prevradius;
            radiusspeed = deltaradius / closetime;
            maxmovespeed = max(0, playerspeed - radiusspeed);
            maxmovedist = maxmovespeed * closetime;
            var_6443d240572e7a5b = maxmovedist / radius;
            var_3f139f4756ad700e = pct > var_6443d240572e7a5b;
            if (var_3f139f4756ad700e && !istrue(var_b7c9fe00120ea96c)) {
                circlespeed = radiusspeed + pct * radius / closetime;
                dlog_recordevent("dlog_event_br_circle_speed_warning", ["player_speed", playerspeed, "circle_speed", circlespeed, "circle_close_time", float(closetime), "circle_current_radius", float(radius), "circle_next_radius", float(prevradius)]);
            }
            if (circleindex) {
                if (var_11c1e6222da58849 && var_3f139f4756ad700e) {
                    pct = minpct + randomfloat(var_6443d240572e7a5b - minpct);
                }
                anglemin = undefined;
                anglemax = undefined;
                if (var_44007e72f56f988b) {
                    tomapcenter = var_b4715d17a358590a - origin;
                    var_d6480fb0c703c3ab = vectortoangles(tomapcenter);
                    mapcenteryaw = var_d6480fb0c703c3ab[1];
                    var_c89123f941c94f8d = length2d(tomapcenter);
                    theta = scripts\engine\math::remap(var_c89123f941c94f8d, var_d62a50630c1a525a, var_6692bcf69c8ab74, var_f5dd795b027a31a8, var_b3ac9b6e95d79e0e);
                    theta = clamp(theta, var_f5dd795b027a31a8, var_b3ac9b6e95d79e0e);
                    anglemin = mapcenteryaw - theta * 0.5;
                    anglemax = mapcenteryaw + theta * 0.5;
                }
                level.br_level.br_circlecenters[circleindex] = getrandompointinboundscircle(origin, radius, pct, pct, 1, var_38a4c729748ad94c, 1, undefined, anglemin, anglemax);
            }
        }
        circleindex--;
    }
    for (circleindex = lastcircleindex + 1; circleindex < lastcircleindex + 1 + level.br_level.br_movingcirclecount; circleindex++) {
        var_9d2610f6a0b725a4 = level.br_level.br_circleradii[circleindex - 1];
        var_a754cfa0ff072630 = level.br_level.br_circlecenters[circleindex - 1];
        current_circle_radius = level.br_level.br_circleradii[circleindex];
        mindist = var_9d2610f6a0b725a4 + current_circle_radius + level.br_level.br_movingcirclemovedistmin;
        maxdist = var_9d2610f6a0b725a4 + current_circle_radius + level.br_level.br_movingcirclemovedistmax;
        level.br_level.br_circlecenters[circleindex] = getrandompointinboundscircle(var_a754cfa0ff072630, maxdist, mindist / maxdist, 1, 1, var_38a4c729748ad94c, 1);
    }
    level notify("calc_circle_centers");
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61e3
// Size: 0x225
function function_3011d71052d72d2a() {
    circleends = [];
    totalweight = 0;
    var_84c71fbaede8b93d = getdvarint(@"hash_29097e089cd5654f", 0);
    for (i = 0; i < var_84c71fbaede8b93d; i++) {
        pos = getdvarvector(hashcat(@"hash_97bfc9bb98165cc0", i));
        endinfo = spawnstruct();
        endinfo.pos = pos;
        endinfo.radius = getdvarfloat(hashcat(@"hash_7ee50d7eb0ae1f7b", i), 0);
        weight = getdvarfloat(hashcat(@"hash_2bd6e0674bf7c8ed", i), 1);
        if (weight > 0) {
            totalweight += weight;
            endinfo.weight = totalweight;
            circleends[circleends.size] = endinfo;
        }
    }
    if (!circleends.size) {
        return [undefined, undefined];
    }
    var_901f7f6175b781f0 = undefined;
    forceindex = getdvarint(@"hash_2cc91c52f62a55e0", -1);
    if (forceindex >= 0) {
        if (forceindex < circleends.size) {
            var_901f7f6175b781f0 = circleends[forceindex];
        }
    } else {
        rand = randomfloatrange(0, totalweight);
        for (i = 0; i < circleends.size; i++) {
            if (rand < circleends[i].weight) {
                var_901f7f6175b781f0 = circleends[i];
                break;
            }
        }
    }
    if (!isdefined(var_901f7f6175b781f0)) {
        return [undefined, undefined];
    }
    if (var_901f7f6175b781f0.radius > 0) {
        randomendorigin = getrandompointinboundscircle(var_901f7f6175b781f0.pos, var_901f7f6175b781f0.radius, 0, 1, 1, 1, 1);
        return [randomendorigin, var_901f7f6175b781f0.pos];
    }
    return [var_901f7f6175b781f0.pos, var_901f7f6175b781f0.pos];
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6410
// Size: 0x3e
function runcircles(var_7b6d5db8cb3c5782) {
    level endon("game_ended");
    level endon("br_ending_start");
    if (isdefined(level.var_80c1e8e18146024f)) {
        [[ level.var_80c1e8e18146024f ]](var_7b6d5db8cb3c5782);
        return;
    }
    function_3f9dc64647891e08(var_7b6d5db8cb3c5782);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6456
// Size: 0x323
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
    if (istrue(var_7b6d5db8cb3c5782) && !scripts\mp\gametypes\br_gametypes::isfeatureenabled("circleEarlyStart") && !istrue(level.br_prematchstarted)) {
        level waittill("infils_ready");
    }
    if (istrue(level.usegulag)) {
        scripts\mp\gametypes\br_gulag::setupgulagtimer();
    }
    showdangercircle();
    level.br_circle thread circledamagetick();
    level thread stopcirclesatgameend();
    level.br_circle.circleinittime = gettime();
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6781
// Size: 0x38
function stopcirclesatgameend() {
    level notify("stopCirclesAtGameEnd");
    level endon("stopCirclesAtGameEnd");
    level waittill_any_2("game_ended", "br_ending_start");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        setomnvar("ui_hardpoint_timer", 0);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67c1
// Size: 0xd8
function getcircleindexforpoint(point, startfrom) {
    if (!isdefined(startfrom)) {
        startfrom = 0;
    }
    if (!isdefined(level.br_circle)) {
        return -1;
    }
    circleindex = -1;
    for (i = startfrom; i < level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount; i++) {
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68a2
// Size: 0x4b0
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
    safetime = 0;
    if (level.br_circle.circleindex >= 0) {
        circleindex = level.br_circle.circleindex;
        circlestarttime = level.br_circle.starttime;
        currentradius = level.br_circle.dangercircleent.origin[2];
        currentorigin = level.br_circle.dangercircleent.origin;
        if (circleindex >= level.br_level.br_circlecenters.size - level.br_level.br_movingcirclecount) {
            return safetime;
        }
    } else {
        circleindex = 0;
        circlestarttime = gettime();
        currentradius = level.br_level.br_circleradii[0];
        currentorigin = level.br_level.br_circlecenters[0];
    }
    var_93971b25bd669411 = getdvarint(@"hash_cf757888073e9093", 0);
    if (var_93971b25bd669411) {
        if (distance2d(currentorigin, point) > currentradius) {
            return safetime;
        }
        pointindex = getcircleindexforpoint(point, circleindex + 1);
        if (pointindex == -1) {
            pointindex = circleindex;
        }
    } else {
        pointindex = getcircleindexforpoint(point);
    }
    if (pointindex < 0) {
        return safetime;
    } else if (pointindex < circleindex) {
        return safetime;
    } else if (pointindex == circleindex) {
        if (distance2d(currentorigin, point) > currentradius) {
            return safetime;
        }
    }
    for (i = circleindex + 1; i < pointindex; i++) {
        safetime += level.br_level.br_circleclosetimes[i];
        safetime += level.br_level.br_circledelaytimes[i];
    }
    delaytime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    timepassed = (gettime() - circlestarttime) / 1000;
    if (pointindex > circleindex) {
        if (getsubgametype() == "champion" && pointindex == level.br_level.br_circlecenters.size - 1) {
            return -1;
        }
        totaltime = delaytime + closetime;
        safetime += totaltime - timepassed;
        testindex = pointindex;
        startorigin = level.br_level.br_circlecenters[pointindex];
        endorigin = level.br_level.br_circlecenters[pointindex + 1];
        startradius = level.br_level.br_circleradii[pointindex];
        endradius = level.br_level.br_circleradii[pointindex + 1];
        delaytimeremaining = level.br_level.br_circledelaytimes[pointindex];
        closetimeremaining = level.br_level.br_circleclosetimes[pointindex];
    } else {
        testindex = circleindex;
        startorigin = currentorigin;
        endorigin = level.br_level.br_circlecenters[circleindex + 1];
        startradius = currentradius;
        endradius = level.br_level.br_circleradii[circleindex + 1];
        if (timepassed < delaytime) {
            delaytimeremaining = delaytime - timepassed;
            closetimeremaining = closetime;
        } else {
            delaytimeremaining = 0;
            closetimeremaining = closetime - timepassed - delaytime;
        }
    }
    if (function_d6f728b66bd3966(testindex) && delaytimeremaining > 0) {
        var_63471afdb08176f2 = vectorlerp(startorigin, endorigin, delaytimeremaining / (delaytimeremaining + closetimeremaining));
        if (distance2d(var_63471afdb08176f2, point) >= startradius) {
            safetime += function_3fa958de973c98c6(point, startorigin, var_63471afdb08176f2, startradius, startradius, delaytimeremaining);
            return safetime;
        } else {
            startorigin = var_63471afdb08176f2;
        }
    }
    safetime += delaytimeremaining;
    safetime += function_3fa958de973c98c6(point, startorigin, endorigin, startradius, endradius, closetimeremaining);
    return safetime;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5b
// Size: 0x222
function function_3fa958de973c98c6(point, startorigin, endorigin, startradius, endradius, timeremaining) {
    startradius = float(startradius);
    endradius = float(endradius);
    a = point[0];
    b = startorigin[0];
    var_df4d16c922bdbe0e = a - b;
    c = (endorigin[0] - startorigin[0]) / timeremaining;
    cs = c * c;
    d = point[1];
    e = startorigin[1];
    dminuse = d - e;
    f = (endorigin[1] - startorigin[1]) / timeremaining;
    fs = f * f;
    g = startradius;
    gs = g * g;
    h = (endradius - startradius) / timeremaining;
    hs = h * h;
    p1s = pow(2 * c * var_df4d16c922bdbe0e + 2 * f * dminuse + 2 * g * h, 2) - 4 * (-1 * cs - fs + hs) * (-1 * pow(var_df4d16c922bdbe0e, 2) - pow(dminuse, 2) + gs);
    p1 = sqrt(max(0, p1s));
    p2 = -2 * c * var_df4d16c922bdbe0e - 2 * f * dminuse - 2 * g * h;
    p3 = 2 * (-1 * cs - fs + hs);
    if (p3 == 0) {
        return 0;
    }
    neg = (-1 * p1 + p2) / p3;
    pos = (p1 + p2) / p3;
    if (neg < 0) {
        return pos;
    }
    if (pos < 0) {
        return neg;
    }
    return min(neg, pos);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f85
// Size: 0x6d
function hidedangercircle() {
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleui)) {
        return;
    }
    level.br_circle.dangercircleui.hidden++;
    level.br_circle.dangercircleent.hidden++;
    level notify("update_circle_hide");
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ffa
// Size: 0x46
function hidesafecircle() {
    level.br_circle.safecircleui.hidden++;
    level.br_circle.safecircleent.hidden++;
    level notify("update_circle_hide");
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7048
// Size: 0x131
function showdangercircle() {
    washidden = level.br_circle.dangercircleent.hidden || level.br_circle.dangercircleent.hidden;
    level.br_circle.dangercircleui.hidden--;
    level.br_circle.dangercircleent.hidden--;
    assert(level.br_circle.dangercircleui.hidden >= 0);
    assert(level.br_circle.dangercircleent.hidden >= 0);
    ishidden = level.br_circle.dangercircleui.hidden || level.br_circle.dangercircleent.hidden;
    if (washidden && !ishidden) {
        level notify("update_circle_hide");
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7181
// Size: 0x131
function showsafecircle() {
    washidden = level.br_circle.safecircleui.hidden || level.br_circle.safecircleent.hidden;
    level.br_circle.safecircleui.hidden--;
    level.br_circle.safecircleent.hidden--;
    assert(level.br_circle.safecircleui.hidden >= 0);
    assert(level.br_circle.safecircleent.hidden >= 0);
    ishidden = level.br_circle.safecircleui.hidden || level.br_circle.safecircleent.hidden;
    if (washidden && !ishidden) {
        level notify("update_circle_hide");
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72ba
// Size: 0x679
function circletimer(circleindex) {
    level endon("game_ended");
    level endon("br_ending_start");
    /#
        function_673b160b18fe0611();
    #/
    if (istrue(scripts\mp\gametypes\br_gametypes::runbrgametypefunc("circleTimer", circleindex))) {
        return;
    }
    level.br_circle.starttime = gettime();
    level.br_circle.circleindex = circleindex;
    var_f007ce073dc3c519 = circleindex == 0;
    var_6b890e6be7982efb = circleindex == level.br_level.br_circleclosetimes.size - 1;
    prewaittime = level.br_level.br_circledelaytimes[circleindex];
    closetime = level.br_level.br_circleclosetimes[circleindex];
    targetradius = level.br_level.br_circleradii[circleindex + 1];
    if (function_fc0f865ddcf551ad()) {
        setomnvar("ui_br_circle_num", circleindex);
    } else {
        setomnvar("ui_br_circle_num", circleindex + 1);
    }
    thread scripts\mp\gametypes\br_gulag::circletimer(circleindex);
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("circleTimerNext", circleindex);
    assertex(isdefined(level.br_level.br_circleminimapradii[circleindex]), "Minimap radius not defined for circle " + circleindex + "! Make sure you have defined level.br_level.br_circleMinimapRadii[] in the map's init().");
    level thread br_lerp_minimap_zoom(circleindex);
    groundposcenter = level.br_level.br_circlecenters[circleindex + 1];
    level.br_circle.centertarget = groundposcenter;
    level.br_circle.safecircleent.origin = (level.br_circle.centertarget[0], level.br_circle.centertarget[1], targetradius);
    level.respawnclosets = gathervalidspawnclosets(groundposcenter, targetradius);
    cleanupoutercrates();
    gatheroutercrates(groundposcenter, targetradius);
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
    level thread startuiclosetimer(prewaittime, var_f007ce073dc3c519, var_6b890e6be7982efb, circleindex);
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = getdangercircleorigin() + (0, 0, getdangercircleradius());
    setstaticuicircles(prewaittime, level.br_circle.safecircleui, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    if (canplaycircleopendialog(circleindex)) {
        if (var_f007ce073dc3c519) {
            scripts\mp\gametypes\br_public::brleaderdialog("first_circle", 1, undefined, undefined, 0.5);
        } else {
            scripts\mp\gametypes\br_public::brleaderdialog("new_circle", 1, undefined, undefined, 0.5);
        }
    }
    if (istrue(level.usegulag)) {
        level thread scripts\mp\gametypes\br_gulag::transitioncircle(targetradius, prewaittime);
    }
    level notify("br_circle_set");
    wait prewaittime;
    function_2f4fb0777ebb4cc0();
    level notify("br_circle_started");
    level.circleclosing = 1;
    if (!isdefined(level.var_e486acb8f70c45a2)) {
        setomnvar("ui_hardpoint_timer", gettime() + int(closetime * 1000));
    }
    if (canplaycircleclosedialog(circleindex)) {
        if (var_6b890e6be7982efb) {
            scripts\mp\gametypes\br_public::brleaderdialog("final_circle", 1, undefined, undefined, 0.5);
        } else {
            scripts\mp\gametypes\br_public::brleaderdialog("circle_closing", 1, undefined, undefined, 0.5);
            thread brcirclebattlechatter(circleindex);
        }
    }
    level.br_circle.safecircleui.origin = level.br_circle.safecircleent.origin;
    level.br_circle.dangercircleui.origin = getdangercircleorigin() + (0, 0, getdangercircleradius());
    setclosinguicircle(int(closetime), level.br_circle.safecircleent, level.br_circle.dangercircleui, var_6b890e6be7982efb);
    level.br_circle.dangercircleent brcirclemoveto(level.br_circle.centertarget[0], level.br_circle.centertarget[1], targetradius, closetime);
    isplayingmusic = !istrue(level.br_circle.var_a0d948a339eee04) && !(isdefined(level.isstandardsandbox) && !level.isstandardsandbox);
    if (isplayingmusic) {
        level thread scripts\mp\music_and_dialog::function_a486df26072a530a(level.br_circle.circleindex, level.br_level.br_circleclosetimes.size, 0.4);
    }
    wait closetime;
    function_2f4fb0777ebb4cc0();
    if (resetdangercircleorigin(circleindex)) {
        if (getdvarint(@"hash_e0a1364a76dd764e", 1)) {
            level.br_circle.dangercircleent.origin = (level.br_circle.centertarget[0], level.br_circle.centertarget[1], targetradius);
        }
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onCloseCircleCompleted", var_6b890e6be7982efb);
    var_f2da81fb842e7a5e = 5;
    if (var_f2da81fb842e7a5e > 0 && circleindex < var_f2da81fb842e7a5e) {
        scripts\mp\rank::addglobalrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
        scripts\mp\weaponrank::addweaponrankxpmultiplier(1.2, "cirlceMult_" + string(circleindex));
    }
    level notify("br_circle_closed");
    level.circleclosing = 0;
    if (isdefined(groundposcenter) && isdefined(targetradius)) {
        cleanupouterspawnclosets(groundposcenter, targetradius);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793b
// Size: 0x13
function function_ab678f36f465fdeb() {
    return getdvarint(@"hash_47d8674c992e098", 0) > 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7957
// Size: 0x1e
function function_4bff90e55e5e18e4() {
    return istrue(function_ab678f36f465fdeb()) && getdvarint(@"hash_192990fc79b06600", 0) > 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x797e
// Size: 0x3c
function function_e32a50f37301a6ab() {
    if (isdefined(level.br_circle) && isdefined(level.br_circle.ispaused)) {
        return level.br_circle.ispaused;
    }
    return 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79c3
// Size: 0xa5
function pausecircle(value) {
    if (!istrue(function_ab678f36f465fdeb()) || !isdefined(level.br_circle) || isdefined(level.br_circle.ispaused) && level.br_circle.ispaused == value) {
        return;
    }
    level.br_circle.ispaused = value;
    if (istrue(level.br_circle.ispaused)) {
        level.br_circle notify("circle_paused");
        return;
    }
    level.br_circle notify("circle_unpaused");
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a70
// Size: 0x27
function function_2f4fb0777ebb4cc0() {
    if (istrue(function_ab678f36f465fdeb()) && istrue(function_e32a50f37301a6ab())) {
        level.br_circle waittill("circle_unpaused");
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a9f
// Size: 0x147
function br_lerp_minimap_zoom(circleindex) {
    level endon("game_ended");
    if (circleindex > 0) {
        previousindex = circleindex - 1;
        goalzoom = level.br_level.br_circleminimapradii[circleindex];
        previouszoom = level.br_level.br_circleminimapradii[previousindex];
        if (goalzoom == previouszoom) {
            return;
        }
        zoominterval = 0.05;
        totallerptime = 2;
        var_7f479bce3abf8b1b = totallerptime / zoominterval;
        var_777913b6f66c8417 = int((previouszoom - goalzoom) / var_7f479bce3abf8b1b);
        var_d1f50321d77c76dc = level.br_level.br_circleminimapradii[previousindex];
        for (i = 0; i < var_7f479bce3abf8b1b; i++) {
            var_d1f50321d77c76dc -= var_777913b6f66c8417;
            setomnvar("ui_br_minimap_radius", var_d1f50321d77c76dc);
            wait zoominterval;
        }
        setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[circleindex]);
        return;
    }
    setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[circleindex]);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bee
// Size: 0x130
function cleanupouterspawnclosets(center, saferadius) {
    radsqr = saferadius * saferadius;
    if (isdefined(level.revivetriggers)) {
        foreach (guid, revive in level.revivetriggers) {
            if (isdefined(revive) && distance2dsquared(center, revive.trigger.origin) > radsqr) {
                validclosets = gathervalidspawnclosets(revive.trigger.origin, saferadius);
                if (isdefined(validclosets) && validclosets.size > 0) {
                    println("<dev string:x75>" + validclosets.size + "<dev string:x82>" + validclosets[0].origin);
                    revive.victim scripts\mp\teamrevive::relocatetrigger(validclosets[0].origin);
                    continue;
                }
                revive.victim scripts\mp\teamrevive::removetrigger(guid);
            }
        }
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d26
// Size: 0x41
function gathervalidspawnclosets(center, safecircleradius) {
    if (isdefined(level.respawnclosets)) {
        respawnclosets = get_array_of_closest(center, level.respawnclosets, undefined, undefined, safecircleradius);
        return respawnclosets;
    }
    return undefined;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d70
// Size: 0xbe
function gatheroutercrates(center, saferadius) {
    radsqr = saferadius * saferadius;
    foreach (crate in level.br_pickups.crates) {
        if (isdefined(crate) && distance2dsquared(center, crate.origin) > radsqr) {
            level.br_pickups.outercrates[level.br_pickups.outercrates.size] = crate;
        }
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e36
// Size: 0x8d
function cleanupoutercrates() {
    foreach (crate in level.br_pickups.outercrates) {
        if (isdefined(crate) && crate.curprogress == 0) {
            crate thread scripts\cp_mp\killstreaks\airdrop::destroycrate();
        }
    }
    level.br_pickups.outercrates = [];
}

/#

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7ecb
    // Size: 0x15
    function function_37a87bb09c54ad61(to_copy) {
        to_copy[to_copy.size] = undefined;
        return to_copy;
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x7ee8
    // Size: 0x138
    function function_17f6274b4504ead2() {
        assert(!isdefined(level.br_level.circle_defaults));
        level.br_level.circle_defaults = spawnstruct();
        defaults = level.br_level.circle_defaults;
        defaults.br_circleradii = function_37a87bb09c54ad61(level.br_level.br_circleradii);
        defaults.br_circleclosetimes = function_37a87bb09c54ad61(level.br_level.br_circleclosetimes);
        defaults.br_circledelaytimes = function_37a87bb09c54ad61(level.br_level.br_circledelaytimes);
        defaults.br_circleminimapradii = function_37a87bb09c54ad61(level.br_level.br_circleminimapradii);
        defaults.br_circleshowdelaydanger = function_37a87bb09c54ad61(level.br_level.br_circleshowdelaydanger);
        defaults.br_circleshowdelaysafe = function_37a87bb09c54ad61(level.br_level.br_circleshowdelaysafe);
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8028
    // Size: 0x11e
    function function_536560624d05801b() {
        assert(isdefined(level.br_level.circle_defaults));
        defaults = level.br_level.circle_defaults;
        level.br_level.br_circleradii = function_37a87bb09c54ad61(defaults.br_circleradii);
        level.br_level.br_circleclosetimes = function_37a87bb09c54ad61(defaults.br_circleclosetimes);
        level.br_level.br_circledelaytimes = function_37a87bb09c54ad61(defaults.br_circledelaytimes);
        level.br_level.br_circleminimapradii = function_37a87bb09c54ad61(defaults.br_circleminimapradii);
        level.br_level.br_circleshowdelaydanger = function_37a87bb09c54ad61(defaults.br_circleshowdelaydanger);
        level.br_level.br_circleshowdelaysafe = function_37a87bb09c54ad61(defaults.br_circleshowdelaysafe);
    }

#/

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x814e
// Size: 0x3e
function array_init_fill(value, count) {
    array = [];
    for (i = 0; i < count; i++) {
        array[array.size] = value;
    }
    return array;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8195
// Size: 0x117
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
    totalarea = a / 3 + b / 2 + c;
    for (i = 0; i < num; i++) {
        if (reverse) {
            index = num - i - 1;
        } else {
            index = i;
        }
        sectionarea = (a * (6 * i * i + 6 * i + 2) + 3 * num * (2 * b * i + b + 2 * c * num)) / 6 * num * num * num;
        sectionscale = sectionarea / totalarea;
        results[index] = sectionscale * value;
    }
    return results;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82b5
// Size: 0x2d8
function extendcirclelist(circleradius, circleclosetime, circledelaytime, var_83536127fa3a72aa, var_f32810da2b97b928, var_8e386906eab86e36) {
    if (!isdefined(var_f32810da2b97b928)) {
        var_f32810da2b97b928 = 0;
    }
    if (!isdefined(var_8e386906eab86e36)) {
        var_8e386906eab86e36 = 0;
    }
    if (!isarray(circleradius)) {
        circleradius = [circleradius];
    }
    if (!isarray(circleclosetime)) {
        circleclosetime = array_init_fill(circleclosetime, circleradius.size);
    }
    if (!isarray(circledelaytime)) {
        circledelaytime = array_init_fill(circledelaytime, circleradius.size);
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
    assert(circleradius.size == circleclosetime.size);
    assert(circleradius.size == circledelaytime.size);
    assert(circleradius.size == var_83536127fa3a72aa.size);
    assert(circleradius.size == var_f32810da2b97b928.size);
    assert(circleradius.size == var_8e386906eab86e36.size);
    lastradius = level.br_level.br_circleradii[level.br_level.br_circleradii.size - 1];
    level.br_level.br_circleradii[level.br_level.br_circleradii.size - 1] = undefined;
    for (i = 0; i < circleradius.size; i++) {
        size = level.br_level.br_circleradii.size;
        level.br_level.br_circleradii[size] = circleradius[i];
        size = level.br_level.br_circleclosetimes.size;
        level.br_level.br_circleclosetimes[size] = circleclosetime[i];
        size = level.br_level.br_circledelaytimes.size;
        level.br_level.br_circledelaytimes[size] = circledelaytime[i];
        size = level.br_level.br_circleminimapradii.size;
        level.br_level.br_circleminimapradii[size] = var_83536127fa3a72aa[i];
        size = level.br_level.br_circleshowdelaydanger.size;
        level.br_level.br_circleshowdelaydanger[size] = var_f32810da2b97b928[i];
        size = level.br_level.br_circleshowdelaysafe.size;
        level.br_level.br_circleshowdelaysafe[size] = var_8e386906eab86e36[i];
    }
    level.br_level.br_circleradii[level.br_level.br_circleradii.size] = lastradius;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8595
// Size: 0x11f
function deletecircle(circleindex) {
    level.br_level.br_circleradii = array_remove_index(level.br_level.br_circleradii, circleindex);
    level.br_level.br_circleclosetimes = array_remove_index(level.br_level.br_circleclosetimes, circleindex);
    level.br_level.br_circledelaytimes = array_remove_index(level.br_level.br_circledelaytimes, circleindex);
    level.br_level.br_circleminimapradii = array_remove_index(level.br_level.br_circleminimapradii, circleindex);
    level.br_level.br_circleshowdelaydanger = array_remove_index(level.br_level.br_circleshowdelaydanger, circleindex);
    level.br_level.br_circleshowdelaysafe = array_remove_index(level.br_level.br_circleshowdelaysafe, circleindex);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86bc
// Size: 0xd65
function applymovingcircles() {
    if (!getdvarint(@"hash_39a8907d7f184021", 1) || scripts\mp\gametypes\br_gametypes::isfeaturedisabled("movingCircle")) {
        level.br_level.br_movingcirclecount = 0;
        return;
    }
    level.br_level.br_movingcirclecount = getdvarint(@"hash_2499127213b409af", 0);
    level.br_level.br_movingcirclemovedistmin = getdvarfloat(@"hash_c2162f0faf12f429", 100);
    level.br_level.br_movingcirclemovedistmax = getdvarfloat(@"hash_c1f3210faeec8da7", 300);
    preset = getdvarint(@"hash_7edc88917d09c24f", 0);
    circlecount = level.br_level.br_circleradii.size - 1;
    switch (preset) {
    case 1: 
        if (!level.br_level.br_movingcirclecount) {
            level.br_level.br_movingcirclecount = 4;
        }
        endradius = level.br_level.br_circleradii[circlecount];
        lastradius = level.br_level.br_circleradii[circlecount - 1];
        lastclosetime = level.br_level.br_circleclosetimes[circlecount - 1];
        lastdelaytime = level.br_level.br_circledelaytimes[circlecount - 1];
        var_d750aeced79dfb3a = level.br_level.br_circleminimapradii[circlecount - 1];
        deletecircle(circlecount - 1);
        var_f59ab661ba766221 = level.br_level.br_movingcirclecount;
        scales = getdvarvector(@"hash_4cd7066d8ea6d39d", (0, 1, 0));
        circleradius = [];
        circleradiusdeltas = array_init_distribute(lastradius - endradius, var_f59ab661ba766221 + 1, 1, scales[0], scales[1], scales[2]);
        delta = 0;
        for (i = 0; i < var_f59ab661ba766221; i++) {
            delta += circleradiusdeltas[i];
            circleradius[i] = lastradius - delta;
        }
        scales = getdvarvector(@"hash_b6771b3f9e9fdd90", (0, 1, 0.125));
        time_scale = getdvarfloat(@"hash_52f861c9d86fc540", 1);
        time_ratio = getdvarfloat(@"hash_fe0dae92131847f9", 0.5);
        var_7588325a3f6a6120 = (lastclosetime + lastclosetime) * time_scale;
        circleclosetime = array_init_distribute(var_7588325a3f6a6120 * time_ratio, var_f59ab661ba766221, 1, scales[0], scales[1], scales[2]);
        circledelaytime = array_init_distribute(var_7588325a3f6a6120 * (1 - time_ratio), var_f59ab661ba766221, 1, scales[0], scales[1], scales[2]);
        extendcirclelist(circleradius, circleclosetime, circledelaytime, var_d750aeced79dfb3a);
        break;
    case 2: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [1200, 900, 600, 300];
        circleclosetime = [30, 30, 30, 30];
        delaytime = [30, 20, 10, 0];
        minimapradius = [5500, 5000, 4500, 4000];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 3: 
        level.br_level.br_movingcirclecount = 5;
        circleradius = [1200, 900, 600, 300];
        circleclosetime = [30, 30, 30, 30];
        delaytime = [30, 20, 10, 0];
        minimapradius = [5500, 5000, 4500, 4000];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 4: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 1500;
        var_2f36026c369a82a2 = 750 + randomint(301);
        var_2f36036c369a84d5 = 1000 + randomint(301);
        circleradius = [var_2f36016c369a806f, var_2f36016c369a806f, var_2f36026c369a82a2, var_2f36036c369a84d5];
        circleclosetime = [30, 30, 30, 45];
        delaytime = [10, 5, 5, 0];
        minimapradius = [5500, 5500, 5500, 5500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 5: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [1500, 1500, 1000, 600];
        circleclosetime = [30, 30, 20, 20];
        delaytime = [30, 30, 20, 20];
        minimapradius = [4000, 3000, 2000, 1000];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 6: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 1500;
        var_2f36026c369a82a2 = 750 + randomint(301);
        var_2f36036c369a84d5 = 1000 + randomint(301);
        circleradius = [var_2f36016c369a806f, var_2f36016c369a806f, var_2f36026c369a82a2, var_2f36036c369a84d5];
        circleclosetime = [30, 30, 30, 45];
        delaytime = [10, 5, 5, 0];
        minimapradius = [5500, 5500, 5500, 5500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 7: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        var_2f36016c369a806f = 3500;
        var_2f36026c369a82a2 = 1250 + randomint(501);
        var_2f36036c369a84d5 = 750 + randomint(501);
        var_2f35fc6c369a7570 = 750 + randomint(301);
        circleradius = [var_2f36016c369a806f, var_2f36026c369a82a2, var_2f36036c369a84d5, var_2f35fc6c369a7570];
        circleclosetime = [40, 30, 25, 25];
        delaytime = [15, 10, 5, 0];
        minimapradius = [5500, 5500, 5500, 5500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 8: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [2000, 1500, 1000, 600];
        circleclosetime = [30, 30, 20, 20];
        delaytime = [30, 30, 20, 20];
        minimapradius = [4000, 3000, 2000, 1000];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 9: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 2;
        var_2f36016c369a806f = 1000 + randomint(301);
        var_2f36026c369a82a2 = 750 + randomint(301);
        circleradius = [var_2f36016c369a806f, var_2f36026c369a82a2];
        circleclosetime = [30, 30];
        delaytime = [10, 5];
        minimapradius = [5500, 5500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 10: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 4;
        circleradius = [1500, 1400, 1200, 1000];
        circleclosetime = [30, 30, 30, 45];
        delaytime = [15, 10, 5, 5];
        minimapradius = [5000, 4500, 3500, 3000];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 11: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 2;
        circleradius = [1400, 800];
        circleclosetime = [70, 60];
        delaytime = [20, 20];
        minimapradius = [5000, 2500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 12: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 3;
        circleradius = [1400, 1000, 800];
        circleclosetime = [55, 45, 35];
        delaytime = [10, 10, 10];
        minimapradius = [5000, 4000, 2900];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 13: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 2;
        var_2f36016c369a806f = 1400;
        var_2f36026c369a82a2 = 800;
        circleradius = [var_2f36016c369a806f, var_2f36026c369a82a2];
        circleclosetime = [65, 55];
        delaytime = [15, 15];
        minimapradius = [5000, 2500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 14: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 2;
        circleradius = [1400, 800];
        circleclosetime = [60, 45];
        delaytime = [10, 10];
        minimapradius = [5000, 2500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 15: 
        deletecircle(circlecount - 1);
        level.br_level.br_movingcirclecount = 6;
        circleradius = [8500, 5500, 4500, 5500, 3500, 1500];
        circleclosetime = [140, 120, 100, 100, 90, 75];
        delaytime = [0, 0, 0, 0, 0, 0];
        minimapradius = [8500, 7500, 6500, 7500, 5500, 2500];
        extendcirclelist(circleradius, circleclosetime, delaytime, minimapradius);
        break;
    case 0:
    default: 
        break;
    }
    if (preset) {
        var_cdfba54d71f1ee18 = level.br_level.br_circleradii.size - 1;
        level.br_level.br_movingcirclegulagcloseoffset = var_cdfba54d71f1ee18 - circlecount;
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9429
// Size: 0xbe
function function_64757fdc2b889d2c() {
    level.br_level.var_8e40f29c8cdeb0f4 = getmatchrulesdata("brData", "numCirclesAtTrain");
    level.br_level.var_33e9e49f9e4a0834 = getmatchrulesdata("brData", "numCirclesFollowTrain");
    if (level.br_level.var_8e40f29c8cdeb0f4) {
        var_f1dd2e25837dc7e1 = getdvar(@"hash_d281b5ca2dcec30f", "0.35");
        level.br_level.var_572a1674797a9fa8 = function_488d5286d6e45d8b(var_f1dd2e25837dc7e1);
        level.br_level.var_564911cbc1774914 = getdvarfloat(@"hash_4fc42d03f5b9f20a", 0.1);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94ef
// Size: 0x339
function applycirclesetdvars() {
    br = level.br_level;
    numcircles = br.br_circleclosetimes.size;
    finalRadius = br.br_circleradii[numcircles];
    for (i = 0; i < numcircles + 1; i++) {
        name_hash = hashcat(@"hash_cedf59e742e58084", i);
        var_1641afe84817865a = "scr_br_circle_set_" + i;
        value = getdvar(name_hash, "");
        if (value == "") {
            continue;
        }
        if (value == "delete") {
            for (j = i; j < numcircles; j++) {
                br.br_circleradii[j] = undefined;
                br.br_circleclosetimes[j] = undefined;
                br.br_circledelaytimes[j] = undefined;
                br.br_circleminimapradii[j] = undefined;
                br.br_circleshowdelaydanger[j] = undefined;
                br.br_circleshowdelaysafe[j] = undefined;
            }
            br.br_circleradii[i] = finalRadius;
            br.br_circleradii[j] = undefined;
            break;
        }
        var_6af0a57b38e894be = "?";
        toks = strtok(value, ",");
        if (i >= numcircles) {
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
                break;
            case 1: 
                br.br_circleclosetimes[i] = int(tok);
                break;
            case 2: 
                br.br_circledelaytimes[i] = int(tok);
                break;
            case 3: 
                br.br_circleminimapradii[i] = int(tok);
                break;
            case 4: 
                br.br_circleshowdelaydanger[i] = int(tok);
                break;
            case 5: 
                br.br_circleshowdelaysafe[i] = int(tok);
                break;
            default: 
                break;
            }
        }
        if (i >= numcircles) {
            br.br_circleradii[i + 1] = finalRadius;
            numcircles++;
        }
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9830
// Size: 0x2d2
function initcirclesettings(circlesettingsbundle, var_e891c8f4915dff8a) {
    level.br_level.br_circleclosetimes = [];
    level.br_level.br_circledelaytimes = [];
    level.br_level.br_circleshowdelaydanger = [];
    level.br_level.br_circleshowdelaysafe = [];
    level.br_level.br_circleminimapradii = [];
    level.br_level.br_circleradii = [];
    circlesettings = getscriptbundle(circlesettingsbundle);
    var_f8e6895d28bfaa60 = circlesettings.circle_list;
    foreach (var_dd2f6ed9da93223f in var_f8e6895d28bfaa60) {
        if (istrue(var_e891c8f4915dff8a)) {
            circle = var_dd2f6ed9da93223f.var_a57abce10ce0b9ed;
        } else {
            circle = var_dd2f6ed9da93223f.defaultproperties;
        }
        level.br_level.br_circleclosetimes = array_add(level.br_level.br_circleclosetimes, default_to(circle.circleclosetime, 0));
        level.br_level.br_circledelaytimes = array_add(level.br_level.br_circledelaytimes, default_to(circle.circledelaytime, 0));
        level.br_level.br_circleshowdelaydanger = array_add(level.br_level.br_circleshowdelaydanger, default_to(circle.var_f32810da2b97b928, 0));
        level.br_level.br_circleshowdelaysafe = array_add(level.br_level.br_circleshowdelaysafe, default_to(circle.var_8e386906eab86e36, 0));
        level.br_level.br_circleminimapradii = array_add(level.br_level.br_circleminimapradii, default_to(circle.var_5af681d13c7745a9, 0));
        level.br_level.br_circleradii = array_add(level.br_level.br_circleradii, default_to(circle.circleradius, 0));
    }
    level.br_level.br_circleradii = array_add(level.br_level.br_circleradii, 0);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b0a
// Size: 0x13a
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c4c
// Size: 0xab
function _applydvarstosettings(settings, dvarstr, timescale) {
    dvartimescale = getdvarfloat(hashcat(@"hash_2f30e28124ff7895", dvarstr, "_scale"), 1);
    for (i = 0; i < settings.size; i++) {
        closetime = getdvarfloat(hashcat(@"hash_f3544a0fde0fb9b6", dvarstr, "_", string(i)), -1);
        if (closetime > 0) {
            settings[i] = closetime;
        }
        settings[i] = settings[i] * timescale;
        settings[i] = settings[i] * dvartimescale;
    }
    return settings;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d00
// Size: 0x3b6
function assertcirclesettings() {
    circlesettingsassert(isdefined(level.br_level.br_circleclosetimes), "level.br_level.br_circleCloseTimes not defined");
    circlesettingsassert(isdefined(level.br_level.br_circledelaytimes), "level.br_level.br_circleDelayTimes not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleshowdelaydanger), "level.br_level.br_circleShowDelayDanger not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleshowdelaysafe), "level.br_level.br_circleShowDelaySafe not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleminimapradii), "level.br_level.br_circleMinimapRadii not defined");
    circlesettingsassert(isdefined(level.br_level.br_circleradii), "level.br_level.br_circleDelayTimes not defined");
    numcircles = level.br_level.br_circleclosetimes.size;
    circlesettingsassert(numcircles == level.br_level.br_circledelaytimes.size, "level.br_level.br_circleDelayTimes size != " + numcircles);
    circlesettingsassert(numcircles == level.br_level.br_circleshowdelaydanger.size, "level.br_level.br_circleShowDelayDanger size != " + numcircles);
    circlesettingsassert(numcircles == level.br_level.br_circleshowdelaysafe.size, "level.br_level.br_circleShowDelaySafe size != " + numcircles);
    circlesettingsassert(numcircles == level.br_level.br_circleminimapradii.size, "level.br_level.br_circleMinimapRadii size != " + numcircles);
    circlesettingsassert(numcircles == level.br_level.br_circleradii.size - 1, "level.br_level.br_circleRadii size-1 != " + numcircles);
    for (i = 0; i < level.br_level.br_circleshowdelaydanger.size; i++) {
        delaytime = level.br_level.br_circledelaytimes[i];
        showdelay = level.br_level.br_circleshowdelaydanger[i];
        circlesettingsassert(showdelay <= delaytime, "level.br_level.br_circleShowDelayDanger[" + i + "] " + delaytime + " > " + showdelay);
    }
    for (i = 0; i < level.br_level.br_circledelaytimes.size; i++) {
        delaytime = level.br_level.br_circledelaytimes[i];
        showdelay = level.br_level.br_circleshowdelaysafe[i];
        circlesettingsassert(showdelay <= delaytime, "level.br_level.br_circleDelayTimes[" + i + "] " + delaytime + " > " + showdelay);
    }
    if (getdvarint(@"hash_39a8907d7f184021", 1) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("movingCircle")) {
        circlesettingsassert(level.br_level.br_circleradii[0] == level.br_level.br_circleradiizero, "Changing circle radius 0 is not supported");
    }
    if (level.br_level.var_33e9e49f9e4a0834 > 0) {
        circlesettingsassert(level.br_level.var_8e40f29c8cdeb0f4 <= numcircles && level.br_level.var_8e40f29c8cdeb0f4 >= 0, "Improper match rules for train tracking, require: 0 <= numCirclesAtTrain <= numCircles");
        circlesettingsassert(level.br_level.var_33e9e49f9e4a0834 >= 0, "Improper match rules for train tracking, require: 0 <= br_numCirclesFollowTrain");
        circlesettingsassert(level.br_level.var_8e40f29c8cdeb0f4 >= level.br_level.var_33e9e49f9e4a0834 + 1, "Improper match rules for train tracking, require: numCirclesAtTrain >= ( numCirclesFollowTrain + 1 )");
        circlesettingsassert(level.br_level.br_movingcirclecount == 0, "Cannot simultaneously support train tracking and moving circles!");
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0be
// Size: 0x21
function circlesettingsassert(value, msg) {
    if (!value) {
        assertmsg(msg);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0e7
// Size: 0xe3
function getcircleclosetime(targetindex) {
    if (!isdefined(level.br_level)) {
        return 0;
    }
    if (!isdefined(level.br_level.br_circledelaytimes) || !level.br_level.br_circledelaytimes.size) {
        return 0;
    }
    numcircles = level.br_level.br_circledelaytimes.size;
    if (targetindex >= numcircles) {
        targetindex = numcircles - 1;
    }
    time = 0;
    for (circleindex = 0; circleindex <= targetindex; circleindex++) {
        timedelay = level.br_level.br_circledelaytimes[circleindex];
        timeclose = level.br_level.br_circleclosetimes[circleindex];
        time = time + timedelay + timeclose;
    }
    return time;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1d3
// Size: 0x91
function brcirclebattlechatter(circleindex) {
    waittime = level.br_level.br_circledelaytimes[circleindex] / 5;
    wait waittime;
    foreach (team in level.teamnamelist) {
        level thread doteamcirclebattlechatter(level.teamdata[team]);
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa26c
// Size: 0x139
function doteamcirclebattlechatter(team) {
    var_add4fd7502a75a8a = getsafecircleorigin();
    safecircleradius = getsafecircleradius();
    if (team["alivePlayers"].size <= 1) {
        return;
    }
    players = sortbydistance(team["alivePlayers"], var_add4fd7502a75a8a);
    eventname = undefined;
    var_5c06026650b5de35 = distance2dsquared(var_add4fd7502a75a8a, players[0].origin);
    if (var_5c06026650b5de35 > safecircleradius * safecircleradius) {
        if (var_5c06026650b5de35 > safecircleradius * safecircleradius * 4) {
            eventname = "sitrep_circle_outfar";
        } else {
            eventname = "sitrep_circle_out";
        }
    } else {
        var_6d4b305f9681783 = distance2dsquared(var_add4fd7502a75a8a, players[players.size - 1].origin);
        if (var_6d4b305f9681783 > safecircleradius * safecircleradius) {
            eventname = "sitrep_circle_mixed";
        } else {
            eventname = "sitrep_circle_in";
        }
    }
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        sound = hashcat(#"obj_", eventname);
        level thread scripts\mp\battlechatter_mp::trysaylocalsound(players[0], sound);
        return;
    }
    dialog = "br_" + eventname;
    scripts\mp\gametypes\br_public::brleaderdialog(dialog, 1, players);
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3ad
// Size: 0x4d
function createinvalidcirclearea(origin, radius) {
    zone = spawnstruct();
    zone.origin = origin;
    zone.radius = radius;
    zone.radiussq = radius * radius;
    return zone;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa403
// Size: 0xe3
function canplaycircleopendialog(circleindex) {
    canplay = 1;
    currentgamemode = getsubgametype();
    if (istrue(level.brgametype.var_bf437f9ee755c3e6)) {
        canplay = 0;
    } else if (function_fc0f865ddcf551ad() || currentgamemode == "mini" || currentgamemode == "mini_mgl" || currentgamemode == "kingslayer" || currentgamemode == "zxp" || currentgamemode == "rumble_mgl" || currentgamemode == "resurgence_mgl" || currentgamemode == "champion") {
        if (circleindex <= 1) {
            canplay = 0;
        }
    } else if (currentgamemode == "dmz" || currentgamemode == "exgm" || currentgamemode == "resurgence" || currentgamemode == "plunder" || currentgamemode == "truckwar") {
        canplay = 0;
    }
    return canplay;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4ef
// Size: 0xaf
function canplaycircleclosedialog(circleindex) {
    canplay = 1;
    currentgamemode = getsubgametype();
    if (function_fc0f865ddcf551ad() || currentgamemode == "mini" || currentgamemode == "mini_mgl" || currentgamemode == "zxp" || currentgamemode == "rumble_mgl" || currentgamemode == "resurgence_mgl" || currentgamemode == "champion" || currentgamemode == "poiresurgence") {
        if (circleindex == 0) {
            canplay = 0;
        }
    } else if (currentgamemode == "dmz" || currentgamemode == "exgm" || currentgamemode == "plunder") {
        canplay = 0;
    }
    return canplay;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5a7
// Size: 0x87
function resetdangercircleorigin(circleindex) {
    var_e904bcca7e8660f2 = 0;
    currentgamemode = getsubgametype();
    switch (currentgamemode) {
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa637
// Size: 0xfd
function function_eca79fa0f341ee08(var_7f590f6ae7f3bc83, var_457258eed204db55, var_1dc8b3a2ba6e135c, var_ac90ea5dc05930cd, var_c660f86463f75e9e) {
    if (isdefined(var_457258eed204db55)) {
        level.var_9ebef1efb6e8a3a9 = default_to(level.var_9ebef1efb6e8a3a9, []);
        level.var_9ebef1efb6e8a3a9[var_7f590f6ae7f3bc83] = var_457258eed204db55;
    }
    if (isdefined(var_1dc8b3a2ba6e135c)) {
        level.var_c7fd2b5cf3acb3da = default_to(level.var_c7fd2b5cf3acb3da, []);
        level.var_8a12e160a2617c92 = default_to(level.var_8a12e160a2617c92, []);
        level.var_c7fd2b5cf3acb3da[var_7f590f6ae7f3bc83] = var_1dc8b3a2ba6e135c;
        level.var_8a12e160a2617c92[var_7f590f6ae7f3bc83] = [];
    }
    if (isdefined(var_ac90ea5dc05930cd)) {
        level.var_725403a0618f5a10 = default_to(level.var_725403a0618f5a10, []);
        level.var_725403a0618f5a10[var_7f590f6ae7f3bc83] = var_ac90ea5dc05930cd;
    }
    if (isdefined(var_c660f86463f75e9e)) {
        level.var_20f62868a14ab570 = default_to(level.var_20f62868a14ab570, []);
        level.var_20f62868a14ab570[var_7f590f6ae7f3bc83] = var_c660f86463f75e9e;
    }
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa73c
// Size: 0xc9
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa80d
// Size: 0x33
function function_fc0f865ddcf551ad() {
    return getsubgametype() == "mini" || getsubgametype() == "mini_mgl" || getdvarint(@"hash_32bd10766631266f", 0) != 0;
}

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa849
// Size: 0x164
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

// Namespace br_circle / scripts\mp\gametypes\br_circle
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9b5
// Size: 0x45
function function_e900c5a0c7a22c7a() {
    level endon("game_ended");
    level waittill("prematch_over");
    level.br_circle.var_dabf59aeb6b1034c function_af5604ce591768e1();
    level.br_circle.var_bce22ba84fcc1cfe function_af5604ce591768e1();
}

/#

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xaa02
    // Size: 0x1ed
    function function_e5958529715b6395() {
        if (!isdefined(level.player)) {
            return;
        }
        player = level.player;
        startx = 40;
        starty = -32;
        lineheight = 16;
        header = player scripts\mp\hud_util::createfontstring("<dev string:x94>", 1.2);
        header.alpha = 1;
        header.color = (1, 1, 0);
        header scripts\mp\hud_util::setpoint("<dev string:x9c>", undefined, startx, starty);
        header setdevtext("<dev string:xa7>");
        circleorigin = player scripts\mp\hud_util::createfontstring("<dev string:x94>", 1.2);
        circleorigin.alpha = 1;
        circleorigin.color = (1, 1, 0);
        circleorigin scripts\mp\hud_util::setpoint("<dev string:x9c>", undefined, startx, starty + lineheight);
        circleradius = player scripts\mp\hud_util::createfontstring("<dev string:x94>", 1.2);
        circleradius.alpha = 1;
        circleradius.color = (1, 1, 0);
        circleradius scripts\mp\hud_util::setpoint("<dev string:x9c>", undefined, startx, starty + lineheight * 2);
        circletime = player scripts\mp\hud_util::createfontstring("<dev string:x94>", 1.2);
        circletime.alpha = 1;
        circletime.color = (1, 1, 0);
        circletime scripts\mp\hud_util::setpoint("<dev string:x9c>", undefined, startx, starty + lineheight * 3);
        function_7f31d213264baf4d(header, circleorigin, circleradius, circletime);
        header destroy();
        circleorigin destroy();
        circleradius destroy();
        circletime destroy();
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0xabf7
    // Size: 0xc3
    function function_7f31d213264baf4d(header, circleorigin, circleradius, circletime) {
        level endon("<dev string:xb3>");
        while (true) {
            header clearalltextafterhudelem();
            origin = getdangercircleorigin();
            radius = getdangercircleradius();
            circleorigin setdevtext("<dev string:xca>" + int(origin[0]) + "<dev string:xd4>" + int(origin[1]) + "<dev string:xd6>");
            circleradius setdevtext("<dev string:xd8>" + int(radius));
            circletime setdevtext("<dev string:xe1>" + getmintimetillpointindangercircle(level.player.origin));
            waitframe();
        }
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xacc2
    // Size: 0xd
    function function_6a6e7f489e42bcda() {
        level notify("<dev string:xb3>");
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xacd7
    // Size: 0x11a
    function function_673b160b18fe0611() {
        waspaused = 0;
        pausestarttime = gettime();
        while (getdvarint(@"hash_907618e8f550cb42", 0) > 0) {
            if ((gettime() - pausestarttime) % 10000 == 0) {
                iprintln("<dev string:xef>");
            }
            foreach (p in level.players) {
                if (!isbot(p)) {
                    var_416318ee02bcd7d9 = _safecircledurationforplayer(p, 10000);
                    p setclientomnvar("<dev string:x124>", gettime());
                    p setclientomnvar("<dev string:x13d>", var_416318ee02bcd7d9);
                    var_416318ee02bcd7d9 = _dangercircledurationforplayer(p, 10000);
                    p setclientomnvar("<dev string:x154>", gettime());
                    p setclientomnvar("<dev string:x16d>", var_416318ee02bcd7d9);
                }
            }
            waspaused = 1;
            waitframe();
        }
        if (waspaused) {
            iprintln("<dev string:x184>");
        }
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xadf9
    // Size: 0x34a
    function function_9eb173d6a8fed181() {
        level notify("<dev string:x195>");
        level endon("<dev string:x195>");
        colors = [(1, 1, 1), (0.764706, 0.25098, 0.129412), (0.380392, 0.647059, 0.309804), (0.427451, 0.811765, 0.964706), (0.929412, 0.796078, 0.337255), (1, 0.0431373, 0.843137), (0.380392, 0.278431, 0.517647), (1, 0.658824, 0.647059), (0.380392, 0.780392, 0.803922), (1, 1, 1), (0.501961, 0.501961, 0.501961), (0.898039, 0.6, 0), (0, 0, 0), (0.929412, 0.796078, 0.337255)];
        firstcolorindex = 1;
        lastcolorindex = 1;
        skipcolor = [];
        skipcolor[firstcolorindex] = 1;
        skipcolor[lastcolorindex] = 1;
        skipcolor[0] = 1;
        skipcolor[9] = 1;
        skipcolor[10] = 1;
        skipcolor[12] = 1;
        skipcolor[13] = 1;
        thread function_7486a9cd4aef46c8();
        test_colors = ["<dev string:x1a8>", "<dev string:x1af>", "<dev string:x1b4>"];
        for (spawnents = 1; true; spawnents = 0) {
            waitframe();
            if (!isdefined(level.br_level.br_circlecenters) || !level.br_level.br_circlecenters.size) {
                continue;
            }
            colorindex = 0;
            for (circleindex = 0; circleindex < level.br_level.br_circlecenters.size; circleindex++) {
                radius = level.br_level.br_circleradii[circleindex];
                center = level.br_level.br_circlecenters[circleindex];
                if (circleindex == 0) {
                    currentcolorindex = firstcolorindex;
                } else if (circleindex == level.br_level.br_circlecenters.size - 1) {
                    currentcolorindex = lastcolorindex;
                } else {
                    while (istrue(skipcolor[colorindex])) {
                        colorindex = (colorindex + 1) % colors.size;
                    }
                    currentcolorindex = colorindex;
                    colorindex = (colorindex + 1) % colors.size;
                }
                color = colors[currentcolorindex];
                scripts\engine\utility::draw_circle(center, max(5, radius), color, 1, 0, 1);
                print3d(center, "<dev string:x1bb>" + circleindex + "<dev string:x1be>" + radius, color, 1, 1, 1, 1);
                if (spawnents) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<dev string:x1c3>" + test_colors[circleindex % test_colors.size], center, max(50, radius));
                    circleent function_6988310081de7b45();
                    circleent thread function_c3f32250a5b22066();
                }
            }
        }
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb14b
    // Size: 0x1c
    function function_7486a9cd4aef46c8() {
        level endon("<dev string:x195>");
        level waittill("<dev string:x1cf>");
        thread function_9eb173d6a8fed181();
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb16f
    // Size: 0x2b
    function function_c3f32250a5b22066() {
        self.mapcircle endon("<dev string:x1e3>");
        level waittill("<dev string:x195>");
        self.mapcircle delete();
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xb1a2
    // Size: 0xd
    function function_46097952cff4dc2e() {
        level notify("<dev string:x195>");
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb1b7
    // Size: 0x4d
    function function_acc901c78fe65b94(args) {
        if (!istrue(level.var_270ddda42e50ae65)) {
            level.var_270ddda42e50ae65 = 1;
            level thread function_8ebb53f2c5ed597d(args);
            return;
        }
        level.var_270ddda42e50ae65 = undefined;
        level notify("<dev string:x1e9>");
        level notify("<dev string:x195>");
    }

    // Namespace br_circle / scripts\mp\gametypes\br_circle
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xb20c
    // Size: 0x20b
    function function_8ebb53f2c5ed597d(args) {
        level notify("<dev string:x1e9>");
        level endon("<dev string:x1e9>");
        testpt = undefined;
        if (args.size > 0) {
            testpt = spawnstruct();
            testpt.radius = int(args[0]);
            host = scripts\mp\gamelogic::gethostplayer();
            start = host geteye();
            dir = anglestoforward(host getplayerangles());
            end = start + dir * 50000;
            trace = scripts\engine\trace::ray_trace(start, end, host);
            testpt.origin = trace["<dev string:x200>"];
        }
        spawnents = 1;
        while (true) {
            foreach (area in level.br_badcircleareas) {
                scripts\engine\utility::draw_circle(area.origin, area.radius, (1, 1, 1), 1, 0, 1);
                if (spawnents) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<dev string:x209>", area.origin, area.radius);
                    circleent thread function_c3f32250a5b22066();
                }
            }
            if (isdefined(testpt)) {
                scripts\engine\utility::draw_circle(testpt.origin, testpt.radius, (1, 1, 1), 1, 0, 1);
                if (spawnents) {
                    circleent = spawnstruct();
                    circleent function_6b6b6273f8180522("<dev string:x209>", testpt.origin, testpt.radius);
                    circleent thread function_c3f32250a5b22066();
                }
            }
            spawnents = 0;
            waitframe();
        }
    }

#/
