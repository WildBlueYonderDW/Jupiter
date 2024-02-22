// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\flags.gsc;
#using script_67fb1233e876ed8;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_mobile_armory.gsc;
#using scripts\mp\gametypes\br_satellite_truck.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_bank.gsc;
#using script_67cc94c07ab18d3a;
#using script_38eb8f4be20d54f4;
#using scripts\mp\gametypes\br_respawn.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5def7af2a9f04234;
#using script_4c770a9a4ad7659c;
#using scripts\mp\gametypes\br.gsc;

#namespace namespace_cf4fd9bcf6eb5df0;

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f
// Size: 0x85
function init() {
    flags::gameflaginit("POIs_initialized", 0);
    thread function_3e699a442af97058();
    br_plunder::init();
    namespace_225567553d05b89b::init();
    namespace_d15f50588af476af::init();
    br_armory_kiosk::init();
    namespace_d5abca8ae174a8dc::init();
    namespace_52ebf044fee9e4cd::init();
    namespace_7f0bcee5d45a1dea::callback("br_functional_poi_init");
    flags::gameflagset("POIs_initialized");
    flags::gameflaginit("POIs_spawned", 0);
    level notify("spawning_POIs");
    waittillframeend();
    level thread _spawnpois();
    /#
        level thread function_8b1a7bcc86e73c2e();
    #/
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x22
function private function_3e699a442af97058() {
    if (namespace_7052decdced06e44::init()) {
        namespace_d20f8ef223912e12::function_15fa5f9b3a2b7a52();
        level waittill("ssc_config_spawned");
        namespace_d20f8ef223912e12::function_84e10866b5154784();
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x324
// Size: 0x14
function initplayer(var_9156b53bcf7ce573) {
    br_plunder::initplayer(var_9156b53bcf7ce573);
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33f
// Size: 0x2f
function function_8b1a7bcc86e73c2e() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bf96a8b9e5433577);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x375
// Size: 0x53
function onprematchdone() {
    flags::gameflagwait("POIs_spawned");
    namespace_225567553d05b89b::onprematchdone();
    namespace_d15f50588af476af::onprematchdone();
    br_armory_kiosk::onprematchdone();
    namespace_7f0bcee5d45a1dea::callback("br_functional_poi_on_prematch_done");
    if (isdefined(level.var_ed20ae31a47f989f)) {
        [[ level.var_ed20ae31a47f989f.var_70da8bb6903d62dc ]]();
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cf
// Size: 0x8
function getinteractiveoutlineasset() {
    return "outline_depth_red";
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df
// Size: 0x43b
function _spawnpois() {
    level endon("game_ended");
    var_4b52cea8cfcf246e = 0.05;
    var_bd889cf87f50abbd = 5;
    var_d318f12e1c67d749 = 5;
    var_ebe0ecfba3880c6a = 65;
    var_ee39b6fa3a924128 = 7;
    var_aaf40e524177e096 = 7;
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" && (level.mapname == "mp_saba" || level.mapname == "mp_saba2") || brgametype == "risk") {
        level.adjusteventdistributionpadding = getdvarint(@"hash_325dd950793b218d", 35);
        level.pushdistributiontowardoppositecorner = getdvarint(@"hash_e8812b2c1b71911e", 1);
        level.buystationsusepaddingdistribution = getdvarint(@"hash_2bd779ec50609b29", 0);
        level thread setupmapquadrantcornersandgrid();
    }
    if (!getdvarint(@"hash_28df7f89e6eab57c", 0) || !getdvarint(@"hash_89be1a979c1ec008", 0)) {
        level.minplunderextractions = getdvarint(@"hash_eaacc4689dd5d721", var_aaf40e524177e096);
        level.maxplunderextractions = getdvarint(@"hash_23f4eae3aeebefd3", var_ee39b6fa3a924128);
        if (level.minplunderextractions < level.maxplunderextractions) {
            level.maxplunderextractions = randomintrange(level.minplunderextractions, level.maxplunderextractions + 1);
        }
    }
    if ((!getdvarint(@"hash_be0526203e262092", 0) || !getdvarint(@"hash_89be1a979c1ec008", 0)) && (!isdefined(level.br_armory_kiosk_enabled) || istrue(level.br_armory_kiosk_enabled))) {
        if (istrue(level.var_8dea6607b3189a60)) {
            namespace_a4b43c1cf86c6fe5::function_e486c07c28a71f34();
        } else {
            var_9d5a5091f02c88bd = getdvarint(@"hash_4aea002979a25696", var_ebe0ecfba3880c6a);
            var_d3db633bf63a5134 = namespace_a4b43c1cf86c6fe5::getallspawninstances();
            if (isdefined(var_d3db633bf63a5134) && var_d3db633bf63a5134.size > 0) {
                level.var_6aa304e25520289f = var_d3db633bf63a5134;
                var_d3db633bf63a5134 = function_360198969036bd2a(var_d3db633bf63a5134);
                var_d3db633bf63a5134 = _getlocationscircleinfluencedwithnoise(var_d3db633bf63a5134, var_9d5a5091f02c88bd, level.buystationsusepaddingdistribution);
                if (isdefined(var_d3db633bf63a5134) && var_d3db633bf63a5134.size > 0) {
                    namespace_a4b43c1cf86c6fe5::setspawninstances(var_d3db633bf63a5134);
                    level.var_6aa304e25520289f = array_difference(level.var_6aa304e25520289f, var_d3db633bf63a5134);
                }
            }
        }
        namespace_a4b43c1cf86c6fe5::function_86f5339f1334e16("buy_station");
    }
    if (!getdvarint(@"hash_28df7f89e6eab57c", 0) || !getdvarint(@"hash_89be1a979c1ec008", 0)) {
        var_eb398f94f1b5b0f2 = br_plunder::getallextractspawninstances();
        if (isdefined(var_eb398f94f1b5b0f2) && var_eb398f94f1b5b0f2.size > 0) {
            var_eb398f94f1b5b0f2 = _getlocationscircleinfluencedwithnoise(var_eb398f94f1b5b0f2, level.maxplunderextractions, isdefined(level.paddedquadgridcenterpoints));
            if (isdefined(var_eb398f94f1b5b0f2) && var_eb398f94f1b5b0f2.size > 0) {
                br_plunder::setextractspawninstances(var_eb398f94f1b5b0f2);
            }
        }
    }
    var_aa43b883cba2c7fd = utility::getstructarray("br_respawn_station", "targetname");
    for (i = 0; i < var_aa43b883cba2c7fd.size; i++) {
        wait(var_4b52cea8cfcf246e);
        br_respawn::spawnambulance(var_aa43b883cba2c7fd[i]);
    }
    var_3eaafd9e0db44ba4 = getdvarint(@"hash_3a7e96b56579724d", var_bd889cf87f50abbd);
    var_4486795ea11dc6e9 = utility::getstructarray("br_mobile_armory_location", "targetname");
    if (var_4486795ea11dc6e9.size > 0) {
        var_909064f7bd37eb5 = _getrandomlocations(var_4486795ea11dc6e9, var_3eaafd9e0db44ba4);
        for (i = 0; i < var_909064f7bd37eb5.size; i++) {
            wait(var_4b52cea8cfcf246e);
            namespace_225567553d05b89b::spawnmobilearmory(var_909064f7bd37eb5[i]);
        }
    }
    var_11d1cc3ed3670979 = getdvarint(@"hash_8b6e7b7f2fa8c4a5", var_d318f12e1c67d749);
    var_ccacdc005b2f9bdc = utility::getstructarray("br_satellite_truck_location", "targetname");
    if (var_ccacdc005b2f9bdc.size > 0) {
        var_bbeceb885d5618b5 = _getrandomlocations(var_ccacdc005b2f9bdc, var_11d1cc3ed3670979);
        for (i = 0; i < var_bbeceb885d5618b5.size; i++) {
            wait(var_4b52cea8cfcf246e);
            namespace_d15f50588af476af::spawnsatellitetruck(var_bbeceb885d5618b5[i]);
        }
    }
    flags::gameflagset("POIs_spawned");
    level notify("POIs_spawned");
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x821
// Size: 0x1c0
function _getlocationscircleinfluencedwithnoise(var_1eb07a39ff244cd5, maxinstancecount, var_395f0c06f7abdcc1) {
    if (var_1eb07a39ff244cd5.size == 0 || maxinstancecount == 0) {
        return undefined;
    }
    if (maxinstancecount > var_1eb07a39ff244cd5.size) {
        maxinstancecount = var_1eb07a39ff244cd5.size;
    }
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (brgametype == "plunder" && (level.mapname == "mp_saba" || level.mapname == "mp_saba2") || brgametype == "risk") {
        return [[ utility::getsharedfunc("plunder", "getPlunderExtractLocations") ]](var_1eb07a39ff244cd5, maxinstancecount, var_395f0c06f7abdcc1);
    } else if (!isdefined(level.br_circle) || !isdefined(level.br_level)) {
        return _getrandomlocations(var_1eb07a39ff244cd5, maxinstancecount);
    }
    var_6756bd882736e8bc = level.br_level.br_circlecenters.size - 1;
    var_ca10d004515b90a1 = int(max(1, var_6756bd882736e8bc * getdvarfloat(@"hash_5455e317c3719308", 1)));
    for (i = 0; i < var_1eb07a39ff244cd5.size; i++) {
        instance = var_1eb07a39ff244cd5[i];
        noise = randomintrange(-1 * var_ca10d004515b90a1, var_ca10d004515b90a1 + 1);
        instance.score = br_circle::getcircleindexforpoint(instance.origin) + noise;
    }
    var_52ed016b11ed960e = utility::array_sort_with_func(var_1eb07a39ff244cd5, &comparescore);
    var_fdcac90056ed9215 = [];
    for (i = 0; i < maxinstancecount; i++) {
        var_fdcac90056ed9215[i] = var_52ed016b11ed960e[i];
    }
    return utility::array_slice(var_52ed016b11ed960e, 0, maxinstancecount);
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e9
// Size: 0x2b
function comparescore(left, right) {
    return left.score > right.score;
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1c
// Size: 0x78
function _getrandomlocations(var_532388c61e12b9df, var_e296217c9fcd337f) {
    if (var_532388c61e12b9df.size == 0 || var_e296217c9fcd337f == 0) {
        return;
    }
    var_bfe291b401a9bf2a = [];
    if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = utility::array_randomize(var_532388c61e12b9df);
        var_ffae32b49df07dbf = int(min(var_e296217c9fcd337f, var_532388c61e12b9df.size));
        for (i = 0; i < var_ffae32b49df07dbf; i++) {
            var_bfe291b401a9bf2a[var_bfe291b401a9bf2a.size] = var_532388c61e12b9df[i];
        }
    }
    return var_bfe291b401a9bf2a;
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9c
// Size: 0x118
function showmiscmessagetoteam(team, messageref, var_e951f1cf3374883d, var_8796ba8bdf940ab2) {
    if (isdefined(team)) {
        var_15c9a60395adb62f = "mp/hints.csv";
        var_2a8f7b0deb4d3d93 = 1;
        var_975cbd2e24cfc56c = tablelookuprownum(var_15c9a60395adb62f, var_2a8f7b0deb4d3d93, messageref);
        var_37690f69e01d6f71 = undefined;
        if (isdefined(var_8796ba8bdf940ab2)) {
            var_37690f69e01d6f71 = gettime() + var_8796ba8bdf940ab2;
            /#
                var_2dbc72ecf7915248 = 3;
                var_86addcfa3d10c9cb = int(tablelookupbyrow(var_15c9a60395adb62f, var_975cbd2e24cfc56c, var_2dbc72ecf7915248));
                /#
                    assert(var_86addcfa3d10c9cb);
                #/
            #/
        }
        teamplayers = teams::getteamdata(team, "players");
        foreach (squadmember in teamplayers) {
            squadmember lower_message::setlowermessageomnvar(messageref, var_37690f69e01d6f71, var_e951f1cf3374883d);
        }
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x46
function initstatemachineforpoitype(var_4b725a40897f25f) {
    if (!isdefined(level.poistates)) {
        level.poistates = [];
    }
    /#
        assert(!isdefined(level.poistates[var_4b725a40897f25f]));
    #/
    level.poistates[var_4b725a40897f25f] = [];
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08
// Size: 0xb7
function registerstatecallbacksforpoitype(var_4b725a40897f25f, stateid, onentercallback, var_bafefcb94d8333ae, onexitcallback) {
    /#
        assert(isdefined(level.poistates[var_4b725a40897f25f]));
    #/
    /#
        assert(!isdefined(level.poistates[var_4b725a40897f25f][stateid]));
    #/
    level.poistates[var_4b725a40897f25f][stateid] = spawnstruct();
    level.poistates[var_4b725a40897f25f][stateid].onenter = onentercallback;
    level.poistates[var_4b725a40897f25f][stateid].onupdate = var_bafefcb94d8333ae;
    level.poistates[var_4b725a40897f25f][stateid].onexit = onexitcallback;
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc6
// Size: 0xeb
function gotopoistate(var_4b725a40897f25f, newstate) {
    var_5297ac440c92a444 = self;
    if (isdefined(var_5297ac440c92a444.currentstate)) {
        var_e7c7de60a5ea2f52 = level.poistates[var_4b725a40897f25f][var_5297ac440c92a444.currentstate];
        if (isdefined(var_e7c7de60a5ea2f52) && isdefined(var_e7c7de60a5ea2f52.onexit)) {
            level [[ var_e7c7de60a5ea2f52.onexit ]](var_5297ac440c92a444);
        }
    }
    var_5297ac440c92a444 notify("poi_state_change");
    var_5297ac440c92a444.currentstate = newstate;
    var_e7c7de60a5ea2f52 = level.poistates[var_4b725a40897f25f][var_5297ac440c92a444.currentstate];
    if (isdefined(var_e7c7de60a5ea2f52)) {
        if (isdefined(var_e7c7de60a5ea2f52.onenter)) {
            level [[ var_e7c7de60a5ea2f52.onenter ]](var_5297ac440c92a444);
        }
        if (isdefined(var_e7c7de60a5ea2f52.onupdate)) {
            var_5297ac440c92a444 thread _poistateupdate(var_e7c7de60a5ea2f52.onupdate);
        }
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb8
// Size: 0x43
function gotopoistateontimer(var_4b725a40897f25f, newstate, var_ddb222c7faf5ab50) {
    var_5297ac440c92a444 = self;
    var_5297ac440c92a444 endon("death");
    var_5297ac440c92a444 endon("poi_state_change");
    wait(var_ddb222c7faf5ab50);
    var_5297ac440c92a444 thread gotopoistate(var_4b725a40897f25f, newstate);
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0x1a
function getcurrentpoistate() {
    var_5297ac440c92a444 = self;
    return var_5297ac440c92a444.currentstate;
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe24
// Size: 0x4f
function _poistateupdate(var_bafefcb94d8333ae) {
    var_5297ac440c92a444 = self;
    var_5297ac440c92a444 endon("death");
    var_b7449ee1b53afd8c = var_5297ac440c92a444.currentstate;
    while (var_b7449ee1b53afd8c == var_5297ac440c92a444.currentstate) {
        level [[ var_bafefcb94d8333ae ]](var_5297ac440c92a444);
        waitframe();
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7a
// Size: 0xe2b
function setupmapquadrantcornersandgrid() {
    if (!isdefined(level.mapcorners)) {
        waitframe();
    }
    var_4e9bdd57294562fd = level.mapcorners[0].origin[0];
    var_4e78e757291f3143 = level.mapcorners[1].origin[0];
    corner0 = (level.mapcorners[0].origin[0], level.mapcorners[0].origin[1], level.mapcorners[0].origin[2]);
    corner1 = (level.mapcorners[1].origin[0], level.mapcorners[0].origin[1], level.mapcorners[1].origin[2]);
    if (var_4e78e757291f3143 < var_4e9bdd57294562fd) {
        corner0 = (level.mapcorners[1].origin[0], level.mapcorners[0].origin[1], level.mapcorners[1].origin[2]);
        corner1 = (level.mapcorners[0].origin[0], level.mapcorners[0].origin[1], level.mapcorners[0].origin[2]);
    }
    var_a056773a8ab0b014 = level.mapcorners[0].origin[1];
    var_a07a653a8ad90336 = level.mapcorners[1].origin[1];
    corner2 = (level.mapcorners[0].origin[0], level.mapcorners[1].origin[1], level.mapcorners[0].origin[2]);
    corner3 = (level.mapcorners[1].origin[0], level.mapcorners[1].origin[1], level.mapcorners[1].origin[2]);
    if (var_a07a653a8ad90336 < var_a056773a8ab0b014) {
        corner2 = (level.mapcorners[1].origin[0], level.mapcorners[1].origin[1], level.mapcorners[1].origin[2]);
        corner3 = (level.mapcorners[0].origin[0], level.mapcorners[1].origin[1], level.mapcorners[0].origin[2]);
    }
    quadgridcenterpoints = [];
    if (game_utility::isdonetskmap()) {
        level.corner3to0dist = abs(distance(corner3, corner0));
        var_f40b5c2409b628b = level.corner3to0dist / 10;
        corner0 = (corner0[0] + var_f40b5c2409b628b, corner0[1] - var_f40b5c2409b628b, corner0[2]);
        corner1 = (corner1[0] - var_f40b5c2409b628b, corner1[1] - var_f40b5c2409b628b, corner1[2]);
        corner2 = (corner2[0] - var_f40b5c2409b628b, corner2[1] + var_f40b5c2409b628b, corner2[2]);
        corner3 = (corner3[0] + var_f40b5c2409b628b, corner3[1] + var_f40b5c2409b628b, corner3[2]);
        level.corner3to0dist = abs(distance(corner3, corner0));
        i = 1;
        while (i < 4) {
            posx = i * level.corner3to0dist / 2;
            j = 1;
            while (j < 4) {
                posy = j * level.corner3to0dist / 2;
                var_dbc2014289d0bcbd = (corner3[0] + posx / 2, corner3[1] + posy / 2, 0);
                quadgridcenterpoints[quadgridcenterpoints.size] = var_dbc2014289d0bcbd;
                j = j + 2;
            }
            i = i + 2;
        }
    }
    level.quadgridcenterpoints = [];
    if (level.mapname == "mp_br_mechanics") {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (3965, 4054, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (4069, -4150, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-4035, -4074, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-4009, 4105, 0);
    } else if (level.mapname == "mp_br_money") {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (46569.5, -8170, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (56849.5, -8170, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (67081.5, -17919.5, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (46593, -17919.5, 0);
    } else {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-21299.2, 41779.2, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (37683.2, 41779.2, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (37683.2, -17203.2, 0);
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = (-21299.2, -17203.2, 0);
    }
    level.quadgridcenterpoints = utility::array_randomize(level.quadgridcenterpoints);
    var_6e7c192ffef59ac0 = 33704;
    level.quadgridradius2dsq = abs(var_6e7c192ffef59ac0 * var_6e7c192ffef59ac0);
    if (level.adjusteventdistributionpadding > 0 && game_utility::isdonetskmap()) {
        level.randomcorner = randomintrange(0, 5);
        var_f40b5c2409b628b = level.corner3to0dist / 10;
        var_62090c76dab8d45a = level.corner3to0dist / 100 / level.adjusteventdistributionpadding;
        switch (level.randomcorner) {
        case 0:
            var_5ca607e4c447781d = (corner0[0] + var_f40b5c2409b628b, corner0[1] - var_f40b5c2409b628b, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_62090c76dab8d45a, corner1[1] - var_f40b5c2409b628b, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_62090c76dab8d45a, corner2[1] + var_62090c76dab8d45a, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_f40b5c2409b628b, corner3[1] + var_62090c76dab8d45a, corner3[2]);
            break;
        case 1:
            var_5ca607e4c447781d = (corner0[0] + var_62090c76dab8d45a, corner0[1] - var_f40b5c2409b628b, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_f40b5c2409b628b, corner1[1] - var_f40b5c2409b628b, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_62090c76dab8d45a, corner2[1] + var_f40b5c2409b628b, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_62090c76dab8d45a, corner3[1] + var_62090c76dab8d45a, corner3[2]);
            break;
        case 2:
            var_5ca607e4c447781d = (corner0[0] + var_62090c76dab8d45a, corner0[1] - var_62090c76dab8d45a, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_f40b5c2409b628b, corner1[1] - var_62090c76dab8d45a, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_f40b5c2409b628b, corner2[1] + var_f40b5c2409b628b, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_62090c76dab8d45a, corner3[1] + var_f40b5c2409b628b, corner3[2]);
            break;
        case 3:
            var_5ca607e4c447781d = (corner0[0] + var_f40b5c2409b628b, corner0[1] - var_62090c76dab8d45a, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_62090c76dab8d45a, corner1[1] - var_62090c76dab8d45a, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_62090c76dab8d45a, corner2[1] + var_f40b5c2409b628b, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_f40b5c2409b628b, corner3[1] + var_f40b5c2409b628b, corner3[2]);
            break;
        case 4:
            var_5ca607e4c447781d = (corner0[0] + var_62090c76dab8d45a, corner0[1] - var_62090c76dab8d45a, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_62090c76dab8d45a, corner1[1] - var_62090c76dab8d45a, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_62090c76dab8d45a, corner2[1] + var_62090c76dab8d45a, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_62090c76dab8d45a, corner3[1] + var_62090c76dab8d45a, corner3[2]);
            break;
        default:
            var_5ca607e4c447781d = (corner0[0] + var_62090c76dab8d45a, corner0[1] - var_62090c76dab8d45a, corner0[2]);
            var_5ca606e4c44775ea = (corner1[0] - var_62090c76dab8d45a, corner1[1] - var_62090c76dab8d45a, corner1[2]);
            var_5ca605e4c44773b7 = (corner2[0] - var_62090c76dab8d45a, corner2[1] + var_62090c76dab8d45a, corner2[2]);
            var_5ca604e4c4477184 = (corner3[0] + var_62090c76dab8d45a, corner3[1] + var_62090c76dab8d45a, corner3[2]);
            break;
        }
        var_6f5b4bc105542115 = [];
        level.paddedquadgridcenterpoints = [];
        level.padcorner3to0dist = abs(distance(var_5ca604e4c4477184, var_5ca607e4c447781d));
        level.pointinsquarewidth = level.padcorner3to0dist / 2;
        i = 1;
        while (i < 4) {
            posx = i * level.padcorner3to0dist / 2;
            j = 1;
            while (j < 4) {
                posy = j * level.padcorner3to0dist / 2;
                var_dbc2014289d0bcbd = (var_5ca604e4c4477184[0] + posx / 2, var_5ca604e4c4477184[1] + posy / 2, 0);
                var_6f5b4bc105542115[var_6f5b4bc105542115.size] = var_dbc2014289d0bcbd;
                j = j + 2;
            }
            i = i + 2;
        }
        if (level.pushdistributiontowardoppositecorner == 2) {
            level.paddedquadgridcenterpoints = utility::array_randomize(var_6f5b4bc105542115);
        } else {
            switch (level.randomcorner) {
            case 0:
                if (level.pushdistributiontowardoppositecorner) {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                } else {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                }
                break;
            case 1:
                if (level.pushdistributiontowardoppositecorner) {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                } else {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                }
                break;
            case 2:
                if (level.pushdistributiontowardoppositecorner) {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                } else {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                }
                break;
            case 3:
                if (level.pushdistributiontowardoppositecorner) {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                } else {
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[0];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[1];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[3];
                    level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = var_6f5b4bc105542115[2];
                }
                break;
            case 4:
                level.paddedquadgridcenterpoints = utility::array_randomize(var_6f5b4bc105542115);
                break;
            default:
                level.paddedquadgridcenterpoints = utility::array_randomize(var_6f5b4bc105542115);
                break;
            }
        }
        var_671bbd330e59016e = abs(distance(var_5ca607e4c447781d, var_5ca605e4c44773b7));
        level.corner0to2dist = var_671bbd330e59016e;
        var_9f62e2ec55d8476e = var_671bbd330e59016e / 4.5;
        level.paddedquadgridradius2dsq = var_9f62e2ec55d8476e * var_9f62e2ec55d8476e;
    }
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cac
// Size: 0x274
function function_360198969036bd2a(var_1eb07a39ff244cd5) {
    if (getdvarint(@"hash_a54b73257618e553", 0) == 0) {
        return var_1eb07a39ff244cd5;
    }
    var_e0a3fb2a899ec453 = getdvarfloat(@"hash_333f89d956059704", 1);
    var_a9b92c79b1bac699 = getdvarfloat(@"hash_7801d124d3586409", 7000);
    var_4f367c294562db01 = var_a9b92c79b1bac699 * var_a9b92c79b1bac699;
    var_7cb19f95dbc68942 = [];
    var_5d0bb59f45d65c1c = [];
    foreach (instance in var_1eb07a39ff244cd5) {
        var_f96e9372bf4d85eb = poi::function_6cc445c02b5effac(instance.origin);
        if (!isdefined(var_5d0bb59f45d65c1c[var_f96e9372bf4d85eb])) {
            var_5d0bb59f45d65c1c[var_f96e9372bf4d85eb] = [];
        }
        var_5d0bb59f45d65c1c[var_f96e9372bf4d85eb] = utility::array_add(var_5d0bb59f45d65c1c[var_f96e9372bf4d85eb], instance);
    }
    foreach (poi in var_5d0bb59f45d65c1c) {
        var_150ce843e1fb54c5 = utility::array_randomize(poi);
        var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = var_150ce843e1fb54c5[0];
        var_b6e95e65d2b16845 = [];
        var_b6e95e65d2b16845[0] = var_150ce843e1fb54c5[0];
        var_1ee3788af637048e = int(ceil(var_150ce843e1fb54c5.size / var_e0a3fb2a899ec453));
        numfound = 1;
        for (i = 1; i < var_150ce843e1fb54c5.size && numfound < var_1ee3788af637048e; i++) {
            var_f14dfb66bf24c687 = var_150ce843e1fb54c5[i];
            valid = 1;
            foreach (var_982c7d5c81fb371e in var_b6e95e65d2b16845) {
                distsq = distance2dsquared(var_f14dfb66bf24c687.origin, var_982c7d5c81fb371e.origin);
                if (distsq < var_4f367c294562db01) {
                    valid = 0;
                    break;
                }
            }
            if (valid) {
                var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = var_f14dfb66bf24c687;
                var_b6e95e65d2b16845[var_b6e95e65d2b16845.size] = var_f14dfb66bf24c687;
                numfound++;
            }
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace namespace_cf4fd9bcf6eb5df0/namespace_15111e421d79d07d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f28
// Size: 0x152
function function_bf96a8b9e5433577() {
    /#
        foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
            var_cf635e78f21650ca setscriptablepartstate("<unknown string>", "<unknown string>");
            var_cf635e78f21650ca.visible = undefined;
        }
        var_9d5a5091f02c88bd = getdvarint(@"hash_4aea002979a25696", 65);
        var_d3db633bf63a5134 = br_armory_kiosk::getallspawninstances();
        if (isdefined(var_d3db633bf63a5134) && var_d3db633bf63a5134.size > 0) {
            var_d3db633bf63a5134 = function_360198969036bd2a(var_d3db633bf63a5134);
            var_d3db633bf63a5134 = _getlocationscircleinfluencedwithnoise(var_d3db633bf63a5134, var_9d5a5091f02c88bd, level.buystationsusepaddingdistribution);
            if (isdefined(var_d3db633bf63a5134) && var_d3db633bf63a5134.size > 0) {
                br_armory_kiosk::setspawninstances(var_d3db633bf63a5134);
            }
        }
        foreach (var_cf635e78f21650ca in level.br_armory_kiosk.scriptables) {
            var_cf635e78f21650ca setscriptablepartstate("<unknown string>", "<unknown string>");
            var_cf635e78f21650ca.visible = 1;
        }
    #/
}

