// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br.gsc;

#namespace namespace_225567553d05b89b;

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x396
// Size: 0xdf
function init() {
    level._effect["poi_mobile_armory_available"] = loadfx("vfx/iw8_br/gameplay/vfx_br_poi_armory_white.vfx");
    level._effect["poi_mobile_armory_charging"] = loadfx("vfx/iw8_br/gameplay/vfx_br_poi_armory_red.vfx");
    level.br_mobilearmories = [];
    level.br_mobile_armory_enabled = getdvarint(@"hash_faf37a1bb44f33a1", 0) != 0;
    level.mobilearmoryplundercost = getdvarint(@"hash_9c45dd1e0492ab50", 1);
    namespace_15111e421d79d07d::initstatemachineforpoitype("mobile_armory");
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("mobile_armory", 0, &_onenterdefaultstate, undefined, &_onexitdefaultstate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("mobile_armory", 1, &_onenterchargingstate, undefined, &_onexitchargingstate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("mobile_armory", 2, &_onenteractivestate, undefined, &_onexitactivestate);
    namespace_15111e421d79d07d::registerstatecallbacksforpoitype("mobile_armory", 3, &_onentercooldownstate, undefined, undefined);
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x1e3
function spawnmobilearmory(struct) {
    if (!istrue(level.br_mobile_armory_enabled)) {
        return;
    }
    var_f474d8d44be22a81 = spawn("script_model", struct.origin);
    if (isdefined(struct.angles)) {
        var_f474d8d44be22a81.angles = struct.angles;
    }
    var_f474d8d44be22a81 setmodel("veh8_mil_lnd_stango_static");
    var_7347f41687ba2720 = getstruct(struct.target, "targetname");
    if (!isdefined(var_f474d8d44be22a81.interactiveelement)) {
        var_9d9f9751c9583c1b = (0, 0, 3);
        interactiveelement = spawn("script_model", var_7347f41687ba2720.origin + var_9d9f9751c9583c1b);
        if (isdefined(var_7347f41687ba2720.angles)) {
            interactiveelement.angles = var_7347f41687ba2720.angles;
        }
        interactiveelement setmodel("military_crate_large_stackable_01");
        interactiveelement setcursorhint("HINT_NOICON");
        interactiveelement setuseholdduration("duration_medium");
        interactiveelement sethintdisplayfov(120);
        interactiveelement setusefov(120);
        interactiveelement setuserange(80);
        interactiveelement setusepriority(-1);
        var_f474d8d44be22a81.interactiveelement = interactiveelement;
    }
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "active", (0, 0, 0), "hud_icon_br_mobile_armory");
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objectiveiconid, var_f474d8d44be22a81);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
        var_f474d8d44be22a81.objectiveiconid = objectiveiconid;
        var_f474d8d44be22a81 thread _mobilearmorymanageminimapicon();
    } else {
        /#
            println("br_mobile_armory_charging");
        #/
    }
    level.br_mobilearmories[level.br_mobilearmories.size] = var_f474d8d44be22a81;
    return var_f474d8d44be22a81;
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667
// Size: 0x13b
function _mobilearmorymanageminimapicon() {
    var_65e09ecb5157ffe1 = self;
    var_65e09ecb5157ffe1 endon("death");
    updateinterval = 1;
    var_e2329e812c2919bb = 5000;
    var_65e09ecb5157ffe1.playersinrange = [];
    while (1) {
        wait(updateinterval);
        if (!istrue(level.br_prematchstarted)) {
            continue;
        }
        foreach (player in var_65e09ecb5157ffe1.playersinrange) {
            if (isdefined(player)) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(var_65e09ecb5157ffe1.objectiveiconid, player);
            }
        }
        var_65e09ecb5157ffe1.playersinrange = namespace_7e17181d03156026::getplayersinradius(var_65e09ecb5157ffe1.origin, var_e2329e812c2919bb);
        foreach (player in var_65e09ecb5157ffe1.playersinrange) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(var_65e09ecb5157ffe1.objectiveiconid, player);
        }
    }
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a9
// Size: 0x5e
function onprematchdone() {
    foreach (var_65e09ecb5157ffe1 in level.br_mobilearmories) {
        var_65e09ecb5157ffe1 namespace_15111e421d79d07d::gotopoistate("mobile_armory", 0);
    }
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80e
// Size: 0x17
function _mobilearmoryendusethink() {
    var_65e09ecb5157ffe1 = self;
    var_65e09ecb5157ffe1 notify("mobileArmoryUseThinkEnd");
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82c
// Size: 0x190
function _mobilearmoryusethink() {
    var_65e09ecb5157ffe1 = self;
    var_65e09ecb5157ffe1 endon("death");
    var_65e09ecb5157ffe1 _mobilearmoryendusethink();
    var_65e09ecb5157ffe1 endon("mobileArmoryUseThinkEnd");
    var_3268df12a22d1a03 = var_65e09ecb5157ffe1 namespace_15111e421d79d07d::getcurrentpoistate();
    var_65e09ecb5157ffe1.recordedusers = [];
    while (1) {
        player = var_65e09ecb5157ffe1.interactiveelement waittill("trigger");
        if (var_65e09ecb5157ffe1 namespace_15111e421d79d07d::getcurrentpoistate() != var_3268df12a22d1a03) {
            return;
        }
        if (var_65e09ecb5157ffe1 namespace_15111e421d79d07d::getcurrentpoistate() == 0) {
            if (player.plundercount < level.mobilearmoryplundercost) {
                player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/NOT_ENOUGH_PLUNDER_ACTIVATE");
                continue;
            } else {
                player namespace_c6ccccd95254983f::playersetplundercount(player.plundercount - level.mobilearmoryplundercost);
            }
        }
        if (var_3268df12a22d1a03 == 0) {
            var_65e09ecb5157ffe1.ownerteam = player.team;
            var_65e09ecb5157ffe1 thread namespace_15111e421d79d07d::gotopoistate("mobile_armory", 1);
            return;
        } else if (var_3268df12a22d1a03 == 2) {
            var_9c71ef3ee76c7193 = 0;
            foreach (user in var_65e09ecb5157ffe1.recordedusers) {
                if (user == player) {
                    var_9c71ef3ee76c7193 = 1;
                    break;
                }
            }
            if (var_9c71ef3ee76c7193) {
                player namespace_44abc05161e2e2cb::showerrormessage("MP/BR_MOBILE_ARMORY_ALREADY_USED");
            } else {
                player thread _mobilearmorychooseclass(var_65e09ecb5157ffe1);
            }
        }
    }
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c3
// Size: 0x206
function _mobilearmorychooseclass(var_65e09ecb5157ffe1) {
    player = self;
    player endon("death");
    player endon("disconnect");
    level endon("game_ended");
    if (isai(player)) {
        return;
    }
    if (player isswitchingweapon() || player isreloading() || player ismantling() || player isthrowinggrenade() || player israisingweapon() || player ismeleeing()) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/MOBILE_ARMORY_ACTION_ERROR");
        return;
    }
    player setclientomnvar("ui_options_menu", 2);
    while (1) {
        newclass = channel = player waittill("luinotifyserver");
        if (channel != "class_select") {
            continue;
        }
        var_2d36749fdffc49b4 = namespace_e5ed2f5a5ee8410e::getclasschoice(newclass);
        player.pers["class"] = var_2d36749fdffc49b4;
        player.class = var_2d36749fdffc49b4;
        player namespace_d19129e4fa5d176::preloadandqueueclass(var_2d36749fdffc49b4);
        player namespace_d19129e4fa5d176::swaploadout();
        player.gearchangedfromloadout = 0;
        var_65e09ecb5157ffe1.recordedusers[var_65e09ecb5157ffe1.recordedusers.size] = player;
        var_53c0aa79eb3cb6c = 50;
        var_9111b9a018285894 = player getweaponslistprimaries();
        foreach (weaponobj in var_9111b9a018285894) {
            weaponname = getcompleteweaponname(weaponobj);
            if (getsubstr(weaponname, 0, 4) == "alt_") {
                continue;
            }
            clipsize = weaponclipsize(weaponobj);
            var_cb2dbf59aaeec569 = int(min(var_53c0aa79eb3cb6c, clipsize));
            player setweaponammoclip(weaponobj, var_cb2dbf59aaeec569);
        }
        namespace_3bcd40a3005712ec::br_ammo_update_weapons(player);
    }
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x82
function _onenterdefaultstate(var_65e09ecb5157ffe1) {
    var_4430b08d5a2d47bf = namespace_15111e421d79d07d::getinteractiveoutlineasset();
    var_65e09ecb5157ffe1.interactiveelement hudoutlineenable(var_4430b08d5a2d47bf);
    var_65e09ecb5157ffe1.interactiveelement makeusable();
    var_65e09ecb5157ffe1.interactiveelement sethintstring("MP/BR_ACTIVATE_MOBILE_ARMORY");
    var_65e09ecb5157ffe1 thread _mobilearmoryusethink();
    var_18e46c38378f618 = getfx("poi_mobile_armory_available");
    playfxontag(var_18e46c38378f618, var_65e09ecb5157ffe1, "tag_origin");
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc59
// Size: 0x59
function _onexitdefaultstate(var_65e09ecb5157ffe1) {
    var_65e09ecb5157ffe1.interactiveelement hudoutlinedisable();
    var_65e09ecb5157ffe1 _mobilearmoryendusethink();
    var_65e09ecb5157ffe1.interactiveelement makeunusable();
    var_18e46c38378f618 = getfx("poi_mobile_armory_available");
    stopfxontag(var_18e46c38378f618, var_65e09ecb5157ffe1, "tag_origin");
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb9
// Size: 0x8c
function _onenterchargingstate(var_65e09ecb5157ffe1) {
    var_3058dbc123e6c741 = getdvarfloat(@"hash_718bb8e6fbb6438e", 10);
    var_65e09ecb5157ffe1 thread namespace_15111e421d79d07d::gotopoistateontimer("mobile_armory", 2, var_3058dbc123e6c741);
    namespace_15111e421d79d07d::showmiscmessagetoteam(var_65e09ecb5157ffe1.ownerteam, "br_mobile_armory_charging", var_3058dbc123e6c741, int(var_3058dbc123e6c741 * 1000));
    var_90d6a5c6923319de = getfx("poi_mobile_armory_charging");
    playfxontag(var_90d6a5c6923319de, var_65e09ecb5157ffe1, "tag_origin");
    var_65e09ecb5157ffe1 playloopsound("truck_reversebeep_lp");
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd4c
// Size: 0x36
function _onexitchargingstate(var_65e09ecb5157ffe1) {
    var_90d6a5c6923319de = getfx("poi_mobile_armory_charging");
    stopfxontag(var_90d6a5c6923319de, var_65e09ecb5157ffe1, "tag_origin");
    var_65e09ecb5157ffe1 stoploopsound();
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd89
// Size: 0xd4
function _onenteractivestate(var_65e09ecb5157ffe1) {
    var_4430b08d5a2d47bf = namespace_15111e421d79d07d::getinteractiveoutlineasset();
    var_65e09ecb5157ffe1.interactiveelement hudoutlineenable(var_4430b08d5a2d47bf);
    level thread namespace_d20f8ef223912e12::teamsplashbr("br_mobile_armory_activate", var_65e09ecb5157ffe1.player, var_65e09ecb5157ffe1.ownerteam);
    var_65e09ecb5157ffe1.interactiveelement makeusable();
    var_65e09ecb5157ffe1.interactiveelement sethintstring("MP/BR_USE_MOBILE_ARMORY");
    var_65e09ecb5157ffe1 thread _mobilearmoryusethink();
    activetimeseconds = getdvarfloat(@"hash_e9149bfe8d43e5a0", 15);
    var_65e09ecb5157ffe1 thread namespace_15111e421d79d07d::gotopoistateontimer("mobile_armory", 3, activetimeseconds);
    namespace_15111e421d79d07d::showmiscmessagetoteam(var_65e09ecb5157ffe1.ownerteam, "br_mobile_armory_active", activetimeseconds, int(activetimeseconds * 1000));
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe64
// Size: 0x5a
function _onexitactivestate(var_65e09ecb5157ffe1) {
    var_65e09ecb5157ffe1.interactiveelement hudoutlinedisable();
    var_65e09ecb5157ffe1 _mobilearmoryendusethink();
    var_65e09ecb5157ffe1.interactiveelement makeunusable();
    namespace_15111e421d79d07d::showmiscmessagetoteam(var_65e09ecb5157ffe1.ownerteam, "br_mobile_armory_cooldown", 3);
    var_65e09ecb5157ffe1.ownerteam = undefined;
}

// Namespace namespace_225567553d05b89b/namespace_ebc61dc58366a710
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x3a
function _onentercooldownstate(var_65e09ecb5157ffe1) {
    var_ecda8dcb2c2ca2d2 = getdvarfloat(@"hash_8f082ed019c7f63d", 120);
    var_65e09ecb5157ffe1 thread namespace_15111e421d79d07d::gotopoistateontimer("mobile_armory", 0, var_ecda8dcb2c2ca2d2);
}

