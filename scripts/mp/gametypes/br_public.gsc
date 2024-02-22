// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using script_7ab5b649fa408138;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using script_6981400abfcd765c;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\script.gsc;
#using script_930a1e7bd882c1d;
#using scripts\engine\trace.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using script_a34750d17473c49;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\killstreaks\remoteuav.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\mp\javelin.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_7c40fa80892a721;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace namespace_a548bd428a566cf3;

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95d
// Size: 0x18
function iswaitingtoentergulag(player) {
    return istrue(player.entergulagwait);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97d
// Size: 0x18
function isloadinggulag(player) {
    return istrue(player.gulagloading);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99d
// Size: 0x18
function isrespawningfromtoken(player) {
    return istrue(player.respawningfromtoken);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bd
// Size: 0x31
function isplayeringulag() {
    player = self;
    return isdefined(player) && (istrue(player.jailed) || istrue(player.gulagarena));
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f6
// Size: 0x41
function isplayerinorgoingtogulag() {
    player = self;
    return isdefined(player) && (istrue(player.jailed) || istrue(player.gulagarena) || istrue(player.gulag));
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3f
// Size: 0x3b
function function_c0461110bcceb029() {
    player = self;
    return isdefined(player) && isdefined(player.arena) && istrue(player.arena.var_26df1613c111c9c5);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa82
// Size: 0x21
function function_f1918f2fce663b2c() {
    player = self;
    return isdefined(player) && istrue(player.wasingulag);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaab
// Size: 0x32
function function_8f0e6614368f64c2() {
    player = self;
    return isdefined(player) && isdefined(player.respawndelay) && player.respawndelay > 0;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae5
// Size: 0x35
function iseligibleforteamrevive() {
    player = self;
    return istrue(player.br_iseliminated) && !isalive(player) && !istrue(player.gulag);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb22
// Size: 0x30
function function_57244bfdbe157401() {
    if (isusingmatchrulesdata()) {
        return getmatchrulesdata("brData", "trainEnabled");
    } else {
        return (getdvarint(@"hash_ed4a71e34e488e86", 0) > 0);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb59
// Size: 0xd
function playeriszombie() {
    return istrue(self.iszombie);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6e
// Size: 0xd
function function_f5446040a93792c3() {
    return istrue(self.isghost);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb83
// Size: 0x2f
function watchhealend() {
    self endon("heal_end");
    self endon("death_or_disconnect");
    self endon("armor_plate_done");
    level endon("game_ended");
    childthread heal_removeonplayernotifies();
    childthread heal_removeondamage();
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb9
// Size: 0x4e
function heal_removeonplayernotifies() {
    self notifyonplayercommand("try_heal_cancel", "+weapnext");
    self notifyonplayercommand("try_heal_cancel", "+attack");
    self notifyonplayercommand("try_heal_cancel", "+breath_sprint");
    waittill_any_2("death", "try_heal_cancel");
    healend();
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e
// Size: 0xaa
function heal_removeondamage() {
    while (1) {
        objweapon = idflags = var_920ff4456ce9a2fc = var_1d3f20a69ced2dd5 = var_9e834fe6754a9c98 = smeansofdeath = vpoint = vdir = eattacker = idamage = self waittill("damage");
        if (namespace_36f464722d326bbe::isbrstylegametype() && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_UNKNOWN")) {
            continue;
        }
        healend();
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbf
// Size: 0x3e
function healend() {
    self notifyonplayercommandremove("try_heal_cancel", "+weapnext");
    self notifyonplayercommandremove("try_heal_cancel", "+attack");
    self notifyonplayercommandremove("try_heal_cancel", "+breath_sprint");
    self notify("heal_end");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd04
// Size: 0x2c
function removeitemfrominventory(slot) {
    /#
        assert(isdefined(self.br_inventory_slots[slot]));
    #/
    self.br_inventory_slots[slot] = undefined;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd37
// Size: 0x54
function ishelmet(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"armor" && issubstr(scriptablename, "helmet");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd93
// Size: 0x13
function isarmor(scriptablename) {
    return ishelmet(scriptablename);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae
// Size: 0x13
function isarmorplate(scriptablename) {
    return scriptablename == "brloot_armor_plate";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc9
// Size: 0x54
function function_4aa12e0ed3f6b745(scriptablename) {
    return issubstr(scriptablename, "brloot_plate_carrier") || isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"plate_carrier";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe25
// Size: 0x17
function function_1a4d30da7f8971fd(scriptablename) {
    return issubstr(scriptablename, "brloot_voucher");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe44
// Size: 0x4e
function function_692c3df266580df6(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 1;
    }
    if (issubstr(scriptablename, "brloot_plate_carrier_2")) {
        return 2;
    }
    if (issubstr(scriptablename, "brloot_plate_carrier_3") || scriptablename == "brloot_plate_carrier_tempered" || scriptablename == "brloot_plate_carrier_high_capacity") {
        return 3;
    }
    return 1;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9a
// Size: 0x37
function function_c2f2bb9e0ae9a454(var_d1fc2132cd825d26) {
    if (!isdefined(var_d1fc2132cd825d26) || var_d1fc2132cd825d26 <= 1) {
        return undefined;
    }
    if (var_d1fc2132cd825d26 == 2) {
        return "brloot_plate_carrier_2";
    }
    if (var_d1fc2132cd825d26 == 3) {
        return "brloot_plate_carrier_3";
    }
    return undefined;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed9
// Size: 0x29
function ishealitem(scriptablename) {
    return scriptablename == "brloot_health_bandages" || scriptablename == "brloot_health_firstaid" || scriptablename == "brloot_health_adrenaline";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0a
// Size: 0x1e
function function_12d9a293931f0455(scriptablename) {
    return scriptablename == "brloot_offhand_heartbeatsensor" || scriptablename == "brloot_super_heartbeatsensor";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf30
// Size: 0x7e
function isequipment(scriptablename) {
    return isarmorplate(scriptablename) || ishealitem(scriptablename) || isdefined(level.br_pickups.br_itemtype[scriptablename]) && (level.br_pickups.br_itemtype[scriptablename] == #"lethal" || level.br_pickups.br_itemtype[scriptablename] == #"tactical");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb6
// Size: 0x45
function isequipmentlethal(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"lethal";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1003
// Size: 0x45
function isequipmenttactical(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"tactical";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1050
// Size: 0x45
function isammo(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"ammo";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d
// Size: 0x45
function function_e62085e15d2da8f6(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"token";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ea
// Size: 0x2f
function iskiosk(scriptablename) {
    return isdefined(scriptablename) && (scriptablename == "br_plunder_box" || scriptablename == "br_plunder_box_high_tier" || scriptablename == "br_plunder_box_nocollision");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1121
// Size: 0x19
function function_746c06c00cd6bdc5(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "drone_deployable_kiosk";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1142
// Size: 0x19
function function_600d1ab3a9ff61f(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "br_workbench";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1163
// Size: 0x19
function function_a84a6acb3c2edcae(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "br_plunder_box_stronghold";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1184
// Size: 0x3b
function function_63d8455b2c1455eb(scriptablename) {
    return isdefined(level.br_pickups.var_688c9b0a44e4a8ca[scriptablename]) && level.br_pickups.var_688c9b0a44e4a8ca[scriptablename];
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c7
// Size: 0x83
function playercanplaynotcriticalgesture() {
    if (self isswitchingweapon() || self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing() || self [[ namespace_3c37cb17ade254d::getsharedfunc("player", "isPlayerADS") ]]() || istrue(self.insertingarmorplate)) {
        return 0;
    }
    var_4a8f5643e919524 = self getcurrentweapon();
    if (isnullweapon(var_4a8f5643e919524)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1252
// Size: 0x5d
function playerplaygestureweaponanim(weaponref, animtime, variantid) {
    self endon("death_or_disconnect");
    var_a7408dbfed49f3f9 = makeweapon(weaponref, [], undefined, undefined, ter_op(isdefined(variantid), variantid, undefined));
    self giveandfireoffhand(var_a7408dbfed49f3f9);
    wait(animtime);
    if (self hasweapon(var_a7408dbfed49f3f9)) {
        self takeweapon(var_a7408dbfed49f3f9);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b6
// Size: 0x1b
function hasrespawntoken() {
    player = self;
    return istrue(player.hasrespawntoken);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d9
// Size: 0x1b
function function_15da77dc195bd80a() {
    player = self;
    return istrue(player.var_15da77dc195bd80a);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12fc
// Size: 0x56
function function_8b2396647673be50() {
    return !istrue(level.br_pickups.var_174664c71517f679) || istrue(level.br_pickups.var_5609de5240e42e84) && isdefined(level.gulag) && istrue(level.gulag.shutdown);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135a
// Size: 0x1b
function hasselfrevivetoken() {
    player = self;
    return isdefined(player.var_6c05b62d5521a0b2);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137d
// Size: 0x32
function function_38a924a5f3d8ca8(player) {
    return player hasselfrevivetoken() && player.var_6c05b62d5521a0b2.name == "brloot_battlerage_self_revive";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b7
// Size: 0x3d
function function_723bd1ab3bb16b2b(player, scriptablename) {
    if (!isdefined(player) || !isdefined(scriptablename)) {
        return 0;
    }
    var_87f79e2fde6f6049 = function_791e72676cd7b544(player);
    return isdefined(var_87f79e2fde6f6049) && var_87f79e2fde6f6049 == scriptablename;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fc
// Size: 0x34
function function_791e72676cd7b544(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.name;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1438
// Size: 0x34
function function_7285c46ee8b26043(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.perk;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1474
// Size: 0x34
function function_1e141ad1f7106373(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.type;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b0
// Size: 0x39
function function_56733d929b67a814(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 0;
    }
    switch (scriptablename) {
    case #"hash_b3bbb437bf12b40a":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f0
// Size: 0x3c
function function_8e65095b82c19d04(scriptablename) {
    if (!isdefined(scriptablename)) {
        return undefined;
    }
    switch (scriptablename) {
    case #"hash_b3bbb437bf12b40a":
        return "specialty_br_faster_revive";
    default:
        return undefined;
        break;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1533
// Size: 0x1b
function hasplatepouch() {
    player = self;
    return istrue(player.hasplatepouch);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1556
// Size: 0x1b
function hasspecialistbonus() {
    player = self;
    return istrue(player.hasbrspecialistbonus);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1579
// Size: 0x4c
function hasaccesscard(var_f6afd1d56892dc8d) {
    player = self;
    if (!isdefined(var_f6afd1d56892dc8d) || !isdefined(player.accesscard)) {
        return isdefined(player.accesscard);
    } else {
        return (var_f6afd1d56892dc8d == player.accesscard);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15cc
// Size: 0x13
function function_3bb38b68cd07463e(lootid) {
    return namespace_aead94004cf4c147::function_36b1968bfe78916b(lootid);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e7
// Size: 0x2bf
function cleanac130struct(var_2c43414ff4583b64) {
    if (isdefined(var_2c43414ff4583b64.playerslot1)) {
        if (isdefined(var_2c43414ff4583b64.playerslot1.head)) {
            var_2c43414ff4583b64.playerslot1.head delete();
        }
        if (isdefined(var_2c43414ff4583b64.playerslot1.helmet)) {
            var_2c43414ff4583b64.playerslot1.helmet delete();
        }
        var_2c43414ff4583b64.playerslot1 delete();
    }
    if (isdefined(var_2c43414ff4583b64.playerslot2)) {
        if (isdefined(var_2c43414ff4583b64.playerslot2.head)) {
            var_2c43414ff4583b64.playerslot2.head delete();
        }
        var_2c43414ff4583b64.playerslot2 delete();
    }
    if (isdefined(var_2c43414ff4583b64.playerslot3)) {
        var_2c43414ff4583b64.playerslot3 delete();
    }
    if (isdefined(var_2c43414ff4583b64.playerslot4)) {
        var_2c43414ff4583b64.playerslot4 delete();
    }
    if (isdefined(var_2c43414ff4583b64.aidoorchief)) {
        var_2c43414ff4583b64.aidoorchief delete();
    }
    if (isdefined(var_2c43414ff4583b64.cameraent)) {
        var_2c43414ff4583b64.cameraent delete();
    }
    if (isdefined(var_2c43414ff4583b64.cameraentmoving)) {
        var_2c43414ff4583b64.cameraentmoving delete();
    }
    if (isdefined(var_2c43414ff4583b64.playerpositionents)) {
        foreach (ent in var_2c43414ff4583b64.playerpositionents) {
            ent delete();
        }
    }
    if (isdefined(var_2c43414ff4583b64.cloudcoverfx)) {
        var_2c43414ff4583b64.cloudcoverfx delete();
    }
    if (isdefined(var_2c43414ff4583b64.staticc130) && istrue(var_2c43414ff4583b64.staticc130.cleanme)) {
        var_2c43414ff4583b64.staticc130 delete();
    }
    if (isdefined(var_2c43414ff4583b64.movingc130) && istrue(var_2c43414ff4583b64.movingc130.cleanme)) {
        if (istrue(var_2c43414ff4583b64.movingc130.innards.cleanme)) {
            var_2c43414ff4583b64.movingc130.innards delete();
        }
        var_2c43414ff4583b64.movingc130 delete();
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ad
// Size: 0x16
function function_64fa4c213439177f() {
    player = self;
    player function_9b5704d0633b87fa();
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ca
// Size: 0x3ac
function updatebrscoreboardstat(statname, value) {
    player = self;
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isdefined(statname) && isstring(statname));
    #/
    var_64571e3aeccd1a07 = 0;
    var_8534515023afc188 = 0;
    infoindex = 0;
    switch (statname) {
    case #"hash_30a2bd77d6fd595f":
        var_57acadc40b2f0a8 = [0:0, 1:8, 2:0];
        infoindex = var_57acadc40b2f0a8[2];
        var_8534515023afc188 = var_57acadc40b2f0a8[1];
        var_64571e3aeccd1a07 = var_57acadc40b2f0a8[0];
        break;
    case #"hash_80e2211904012a81":
        var_57acbdc40b2f2db = [0:0, 1:12, 2:0];
        infoindex = var_57acbdc40b2f2db[2];
        var_8534515023afc188 = var_57acbdc40b2f2db[1];
        var_64571e3aeccd1a07 = var_57acbdc40b2f2db[0];
        break;
    case #"hash_6d7da638af8fecbb":
        var_57ad0dc40b2fdda = [0:0, 1:8, 2:1];
        infoindex = var_57ad0dc40b2fdda[2];
        var_8534515023afc188 = var_57ad0dc40b2fdda[1];
        var_64571e3aeccd1a07 = var_57ad0dc40b2fdda[0];
        break;
    case #"hash_b0f342895fb227f9":
        var_57ad1dc40b3000d = [0:0, 1:7, 2:1];
        infoindex = var_57ad1dc40b3000d[2];
        var_8534515023afc188 = var_57ad1dc40b3000d[1];
        var_64571e3aeccd1a07 = var_57ad1dc40b3000d[0];
        break;
    case #"hash_67733e84369e4cb1":
        var_57acedc40b2f974 = [0:0, 1:8, 2:1];
        infoindex = var_57acedc40b2f974[2];
        var_8534515023afc188 = var_57acedc40b2f974[1];
        var_64571e3aeccd1a07 = var_57acedc40b2f974[0];
        break;
    case #"hash_16a3898de48ed541":
        var_57acfdc40b2fba7 = [0:0, 1:8, 2:2];
        infoindex = var_57acfdc40b2fba7[2];
        var_8534515023afc188 = var_57acfdc40b2fba7[1];
        var_64571e3aeccd1a07 = var_57acfdc40b2fba7[0];
        break;
    case #"hash_ecd8ab7521415233":
        var_57ac4dc40b2e376 = [0:8, 1:4, 2:2];
        infoindex = var_57ac4dc40b2e376[2];
        var_8534515023afc188 = var_57ac4dc40b2e376[1];
        var_64571e3aeccd1a07 = var_57ac4dc40b2e376[0];
        break;
    case #"hash_e806c669b1968751":
        var_57ac5dc40b2e5a9 = [0:12, 1:3, 2:2];
        infoindex = var_57ac5dc40b2e5a9[2];
        var_8534515023afc188 = var_57ac5dc40b2e5a9[1];
        var_64571e3aeccd1a07 = var_57ac5dc40b2e5a9[0];
        break;
    case #"hash_7423dc1edc0a169a":
        var_c00a2c6249962d83 = [0:15, 1:1, 2:2];
        infoindex = var_c00a2c6249962d83[2];
        var_8534515023afc188 = var_c00a2c6249962d83[1];
        var_64571e3aeccd1a07 = var_c00a2c6249962d83[0];
        break;
    case #"hash_b90a4e6c283d0c06":
        var_c00a2b6249962b50 = [0:0, 1:16, 2:3];
        infoindex = var_c00a2b6249962b50[2];
        var_8534515023afc188 = var_c00a2b6249962b50[1];
        var_64571e3aeccd1a07 = var_c00a2b6249962b50[0];
        break;
    case #"hash_f43fd3867872aef3":
        var_c00a2e62499631e9 = [0:0, 1:10, 2:4];
        infoindex = var_c00a2e62499631e9[2];
        var_8534515023afc188 = var_c00a2e62499631e9[1];
        var_64571e3aeccd1a07 = var_c00a2e62499631e9[0];
        break;
    case #"hash_1580ef2bedfde211":
    case #"hash_466dcff665608ca0":
    case #"hash_6f4e7e5330c0b130":
    case #"hash_985d10ac4d0e3bcc":
    case #"hash_a356e771faafb08c":
    case #"hash_a765c47eedad2989":
    case #"hash_f933905aabddd9c7":
        break;
    default:
        /#
            assertmsg("Unknown player info '" + statname + "' requested for packing!");
        #/
        return;
    }
    player packstatintoextrainfo(value, var_64571e3aeccd1a07, var_8534515023afc188, infoindex);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7d
// Size: 0x195
function packstatintoextrainfo(value, var_64571e3aeccd1a07, var_8534515023afc188, infoindex) {
    player = self;
    var_3742f6ea342282ff = [0:player.extrascore0, 1:player.extrascore1, 2:player.extrascore2, 3:player.extrascore3, 4:player.extrascore4];
    mask = int(pow(2, var_8534515023afc188)) - 1;
    var_a463992091f1d483 = (value & mask) << var_64571e3aeccd1a07;
    var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
    var_ee27f3f198276535 = var_3742f6ea342282ff[infoindex];
    var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_a463992091f1d483;
    switch (infoindex) {
    case 0:
        player.extrascore0 = var_82a90e56e416fa55;
        break;
    case 1:
        player.extrascore1 = var_82a90e56e416fa55;
        break;
    case 2:
        player.extrascore2 = var_82a90e56e416fa55;
        break;
    case 3:
        player.extrascore3 = var_82a90e56e416fa55;
        break;
    case 4:
        player.extrascore4 = var_82a90e56e416fa55;
        break;
    default:
        break;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e19
// Size: 0x41
function setplayerdownedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 2048;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~2048;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e61
// Size: 0x45
function function_cc20f0c1304019d9(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 262144;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~262144;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ead
// Size: 0x45
function function_eb28f4724f0f14b(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 524288;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~524288;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef9
// Size: 0x41
function setplayerbeingrevivedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 4096;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~4096;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f41
// Size: 0x41
function setplayerselfrevivingextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 8192;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~8192;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f89
// Size: 0x41
function setplayermostwantedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 32768;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~32768;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd1
// Size: 0x45
function sethasselfrevivetokenextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 65536;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~65536;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201d
// Size: 0x45
function sethasrespawntokenextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 131072;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~131072;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2069
// Size: 0x6a
function incrementplayersdownedstat() {
    player = self;
    if (!isdefined(player.br_playersdowned)) {
        player.br_playersdowned = 0;
    }
    player.br_playersdowned++;
    player updatebrscoreboardstat("playersDowned", player.br_playersdowned);
    player namespace_3c5a4254f2b957ea::incpersstat("downs", 1);
    player namespace_b919c4be206d3c80::function_48544e365f4f5648(16, 1);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20da
// Size: 0x45
function function_e58801acf7adcdc8(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 1048576;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~1048576;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2126
// Size: 0x45
function function_c2afa687bc871d71(value) {
    if (istrue(value)) {
        self.game_extrainfo = self.game_extrainfo | 2097152;
    } else {
        self.game_extrainfo = self.game_extrainfo & ~2097152;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2172
// Size: 0x5f
function isplayerbrsquadleader() {
    player = self;
    /#
        if (istrue(player.isbrsquadleader) != istrue(player.game_extrainfo & 256)) {
            /#
                assertmsg("br_plunder_box_high_tier");
            #/
        }
    #/
    return istrue(player.isbrsquadleader) && player.game_extrainfo & 256;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21d9
// Size: 0x86
function brbroadcastplayercardsplash(splash, optionalnumber) {
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (player isplayeringulag()) {
            continue;
        }
        player thread namespace_44abc05161e2e2cb::showsplash(splash, optionalnumber, player);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2266
// Size: 0xca
function brleaderdialogteamexcludeplayer(dialog, team, var_f5720cac60ca8410, var_a64cad1ecc519617, var_29b55b55d98a28f4, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d) {
    /#
        assert(isplayer(var_f5720cac60ca8410));
    #/
    foreach (teammate in level.teamdata[team]["players"]) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate != var_f5720cac60ca8410) {
            brleaderdialogplayer(dialog, teammate, var_a64cad1ecc519617, var_29b55b55d98a28f4, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d);
        }
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2337
// Size: 0x52
function brleaderdialogteam(dialog, team, var_a64cad1ecc519617, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d) {
    brleaderdialog(dialog, var_a64cad1ecc519617, level.teamdata[team]["players"], undefined, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2390
// Size: 0xb9
function brleaderdialog(dialog, var_a64cad1ecc519617, var_f16321ba668d68f5, var_29b55b55d98a28f4, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d) {
    if (!isdefined(game["dialog"][dialog])) {
        /#
            println("little_bird_mg" + dialog + "brloot_offhand_geigercounter");
        #/
        return;
    }
    players = level.players;
    if (isdefined(var_f16321ba668d68f5)) {
        players = var_f16321ba668d68f5;
    }
    for (playerindex = 0; playerindex < players.size; playerindex++) {
        player = players[playerindex];
        thread brleaderdialogplayer(dialog, player, var_a64cad1ecc519617, var_29b55b55d98a28f4, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2450
// Size: 0xf3
function modeplayerskipdialog(dialog, var_a64cad1ecc519617) {
    if (!isdefined(var_a64cad1ecc519617)) {
        var_a64cad1ecc519617 = 1;
    }
    if (istrue(var_a64cad1ecc519617) && isplayeringulag()) {
        return 1;
    }
    if (function_94b952789d039abb() && getdvar(@"hash_12e53040d5281856", "") == "scripted") {
        return 1;
    }
    if (istrue(self.playinggulagbink)) {
        return 1;
    }
    if (isbrpracticemode()) {
        if (istrue(self.playingtutorialdialogue)) {
            return 1;
        }
        if (dialog == "deploy_squad_leader" || dialog == "prematch_enter") {
            return 1;
        }
        if ((dialog == "circle_closing" || dialog == "first_circle") && !istrue(level.playerumpedfromplane)) {
            return 1;
        }
    }
    var_4ad7c03ec4fa687 = level.maxteamsize == 1;
    if (var_4ad7c03ec4fa687) {
        switch (dialog) {
        case #"hash_8c7e4eedbb3a6dd9":
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254b
// Size: 0x53
function brgetoperatorteam(player) {
    var_95ce4f91d0f58568 = player.defaultoperatorteam;
    if (isai(player)) {
        var_95ce4f91d0f58568 = player.botoperatorteam;
    }
    if (istutorial() || isbrpracticemode()) {
        var_95ce4f91d0f58568 = "allies";
    }
    return var_95ce4f91d0f58568;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0x15e
function brleaderdialogplayer(dialog, player, var_a64cad1ecc519617, var_29b55b55d98a28f4, delay, var_abb7e1ea2adce060, var_ba850ef48cfdad1d) {
    player endon("disconnect");
    level endon("game_ended");
    if (!isdefined(player)) {
        return;
    }
    if (istrue(player.isdisconnecting)) {
        return;
    }
    if (!isdefined(var_29b55b55d98a28f4)) {
        var_29b55b55d98a28f4 = getdvarint(@"hash_a6587a24d2081693", 1);
    }
    if (!isalive(player) && !istrue(var_29b55b55d98a28f4)) {
        return;
    }
    if (istrue(player.extracted)) {
        return;
    }
    if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
        return;
    }
    if (player modeplayerskipdialog(dialog, var_a64cad1ecc519617)) {
        return;
    }
    if (istutorial() || isbrpracticemode()) {
        if (dialog == "mission_scav_accept" || dialog == "mission_obj_next_nptarget") {
            return;
        }
    }
    var_cb3339ece72dbdeb = function_93550b34f0a49dd9(dialog, player, var_ba850ef48cfdad1d);
    if (isdefined(var_cb3339ece72dbdeb)) {
        var_cb3339ece72dbdeb = tolower(var_cb3339ece72dbdeb);
        if (soundexists(var_cb3339ece72dbdeb)) {
            var_1499e7c2d69e0074 = lookupsoundlength(var_cb3339ece72dbdeb, 1) / 1000;
            if (isdefined(delay) && delay >= level.framedurationseconds) {
                wait(delay);
            }
            player queuedialogforplayer(var_cb3339ece72dbdeb, dialog, var_1499e7c2d69e0074);
        } else {
            function_27167a39cd08cea0(var_cb3339ece72dbdeb);
        }
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270b
// Size: 0xbf
function function_93550b34f0a49dd9(dialog, player, var_ba850ef48cfdad1d) {
    var_cb3339ece72dbdeb = undefined;
    var_95ce4f91d0f58568 = brgetoperatorteam(player);
    if (!isdefined(var_95ce4f91d0f58568)) {
        var_95ce4f91d0f58568 = "allies";
    }
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        var_cb3339ece72dbdeb = "dx_bra_" + game["voice"][var_95ce4f91d0f58568] + "_" + game["dialog"][dialog];
    } else {
        prefix = "dx_br_brdm_";
        if (isdefined(var_ba850ef48cfdad1d)) {
            prefix = var_ba850ef48cfdad1d;
        }
        var_cb3339ece72dbdeb = "" + prefix + game["dialog"][dialog];
        var_cb3339ece72dbdeb = function_659ac3bd735f8bd8(game["dialog"][dialog], prefix, var_cb3339ece72dbdeb);
    }
    if (isdefined(var_cb3339ece72dbdeb)) {
        var_cb3339ece72dbdeb = tolower(var_cb3339ece72dbdeb);
    }
    return var_cb3339ece72dbdeb;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d2
// Size: 0x186
function function_659ac3bd735f8bd8(dialogalias, prefix, var_6435e90dbd48d412) {
    var_cdc19acca6ad3c1b = "wzan";
    var_cb3339ece72dbdeb = "" + prefix + dialogalias;
    if (!issubstr(dialogalias, var_cdc19acca6ad3c1b)) {
        return var_cb3339ece72dbdeb;
    }
    var_3b4802d432f9a896 = strtok(dialogalias, "_");
    var_f862cd469dc91e5d = "";
    for (i = 0; i < var_3b4802d432f9a896.size; i++) {
        if (i != 0) {
            var_f862cd469dc91e5d = var_f862cd469dc91e5d + "_";
        }
        refname = function_9442ae46b8802d0e(var_3b4802d432f9a896[i]);
        if (refname == "") {
            refname = tablelookup("sound/tables/iw9/dialog/gamedef_ref_table.csv", 2, var_3b4802d432f9a896[i], 1);
            if (isdefined(refname) && refname != "") {
                if (var_3b4802d432f9a896[i] == "gams") {
                    var_99f6ac11ef7746fa = "gmst";
                } else {
                    var_99f6ac11ef7746fa = tablelookup("sound/tables/s6/dialog/gamedef_ref_table.csv", 1, refname, 2);
                }
                switch (var_99f6ac11ef7746fa) {
                case #"hash_6dabe074177d7643":
                    var_99f6ac11ef7746fa = "grav";
                    break;
                default:
                    break;
                }
                var_f862cd469dc91e5d = var_f862cd469dc91e5d + var_99f6ac11ef7746fa;
                function_126e8340466d1bb2(var_3b4802d432f9a896[i], var_99f6ac11ef7746fa);
            } else {
                var_f862cd469dc91e5d = var_f862cd469dc91e5d + var_3b4802d432f9a896[i];
            }
        } else {
            var_f862cd469dc91e5d = var_f862cd469dc91e5d + refname;
        }
    }
    var_f862cd469dc91e5d = "" + prefix + var_f862cd469dc91e5d;
    if (!soundexists(var_f862cd469dc91e5d)) {
        function_27167a39cd08cea0(var_6435e90dbd48d412, var_f862cd469dc91e5d);
    } else {
        var_cb3339ece72dbdeb = var_f862cd469dc91e5d;
    }
    return var_cb3339ece72dbdeb;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2960
// Size: 0x92
function function_27167a39cd08cea0(var_6435e90dbd48d412, var_f862cd469dc91e5d) {
    if (1) {
        return;
    }
    if (!isdefined(level.var_de6c144f804bafd4)) {
        level.var_de6c144f804bafd4 = [];
    }
    if (!array_contains(level.var_de6c144f804bafd4, var_6435e90dbd48d412)) {
        level.var_de6c144f804bafd4[level.var_de6c144f804bafd4.size] = var_6435e90dbd48d412;
        if (isdefined(var_f862cd469dc91e5d)) {
            namespace_9c840bb9f2ecbf00::demoforcesre("SoundName for " + var_f862cd469dc91e5d + " was not found for the IW9 " + var_6435e90dbd48d412 + " alias. Make sure the Jup line for this is added.");
        } else {
            namespace_9c840bb9f2ecbf00::demoforcesre("SoundName for " + var_6435e90dbd48d412 + " was probably deleted and there was not a Jup version created for it.");
        }
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29f9
// Size: 0x38
function function_126e8340466d1bb2(var_8f323a27033ae060, var_a78424d72e029d71) {
    if (!isdefined(level.var_5607245a55dc82ea)) {
        level.var_5607245a55dc82ea = [];
    }
    level.var_5607245a55dc82ea[var_8f323a27033ae060] = var_a78424d72e029d71;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a38
// Size: 0x3f
function function_9442ae46b8802d0e(var_8f323a27033ae060) {
    if (!isdefined(level.var_5607245a55dc82ea)) {
        return "";
    }
    if (!isdefined(level.var_5607245a55dc82ea[var_8f323a27033ae060])) {
        return "";
    }
    return level.var_5607245a55dc82ea[var_8f323a27033ae060];
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7f
// Size: 0x20
function function_d6ae35e0ce14bbaf() {
    return isdefined(level.script) && level.script == "mp_bm_tut";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa7
// Size: 0x1c
function function_55b494a07469298a() {
    return getdvar(@"hash_12e53040d5281856", "") == "scripted";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2acb
// Size: 0x3d
function istutorial() {
    return function_55b494a07469298a() || isdefined(level.script) && (level.script == "mp_br_tut" || level.script == "mp_lc_br_tut");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b10
// Size: 0x40
function isbrpracticemode() {
    if (!isdefined(level.isbrpracticemode)) {
        if (!isdefined(level.script)) {
            return 0;
        }
        level.isbrpracticemode = level.script == "mp_br_quarry";
    }
    return level.isbrpracticemode;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b58
// Size: 0x20
function isdmzbotpracticematch() {
    return isdefined(level.script) && level.script == "mp_br_money";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b80
// Size: 0x27
function isanytutorialorbotpracticematch() {
    return istutorial() || function_d6ae35e0ce14bbaf() || isbrpracticemode() || isdmzbotpracticematch();
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2baf
// Size: 0xb7
function playergetlaststandpistol() {
    weaponlist = self getweaponslistprimaries();
    foreach (weaponobject in weaponlist) {
        weaponname = weaponobject.basename;
        if (weaponclass(weaponobject) == "pistol" && weaponname != "iw9_me_fists_mp" && weaponname != "iw8_me_riotshield_mp" && weaponname != "iw9_knifestab_mp" && weaponname != "iw8_throwingknife_fire_melee_mp" && weaponname != "iw8_throwingknife_electric_melee_mp") {
            return weaponobject;
        }
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6d
// Size: 0x18
function playerwaittillstreamhintcomplete() {
    if (istrue(self.prestreaminglocation)) {
        self waittill("playerPrestreamComplete");
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c8c
// Size: 0x7e
function playerstreamhintdroptoground(var_11f3b4465c8b637b, startheight) {
    if (!isdefined(startheight)) {
        startheight = namespace_81156089ff1fe819::getinfilspawnoffset();
    }
    var_18a32798902944ee = getdvarint(@"hash_c103b956e0125687", 4500);
    if (var_18a32798902944ee >= 0) {
        var_625180ce8d2f8f77 = startheight - var_18a32798902944ee;
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
        var_11f3b4465c8b637b = drop_to_ground(var_11f3b4465c8b637b, 0, -1 * var_625180ce8d2f8f77, undefined, contents);
    }
    return var_11f3b4465c8b637b;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d12
// Size: 0x39
function playerstreamhintlocation(var_11f3b4465c8b637b, timeoutms, var_a3269db2b15568da, var_de6ef125511e1141, var_4a1d79951b2bd56c) {
    thread playerstreamhintlocationinternal(var_11f3b4465c8b637b, timeoutms, var_a3269db2b15568da, var_de6ef125511e1141, var_4a1d79951b2bd56c);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d52
// Size: 0x299
function playerstreamhintlocationinternal(var_11f3b4465c8b637b, timeoutms, var_a3269db2b15568da, var_de6ef125511e1141, var_4a1d79951b2bd56c) {
    if (!isdefined(self)) {
        return;
    }
    self notify("playerPrestreamLocationWait");
    self endon("playerPrestreamLocationWait");
    self endon("disconnect");
    var_4de859b9228e5cfd = !self isplayerheadless() && !isbot(self);
    if (!isdefined(timeoutms)) {
        timeoutms = getdefaultstreamhinttimeoutms();
    }
    timeout = gettime() + timeoutms;
    self.prestreaminglocation = 1;
    self.var_f9bcdd83c6c6899f = undefined;
    if (!self ispredictedstreamposready()) {
        self clearpredictedstreampos();
    }
    var_599be23b9afb9909 = gettime();
    if (var_4de859b9228e5cfd) {
        while (!istrue(self.pers["streamSyncComplete"]) && gettime() < timeout) {
            waitframe();
        }
    }
    if (namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
        self function_bc667001f9dd3808(var_11f3b4465c8b637b);
    }
    if (istrue(var_a3269db2b15568da)) {
        self loadcustomizationplayerview(self);
    }
    if (var_4de859b9228e5cfd) {
        waitframe();
        /#
            var_532c912daac4929c = getdvarfloat(@"hash_e799b8bb09ac23a4", 0);
            if (var_532c912daac4929c > 0) {
                wait(var_532c912daac4929c);
            }
        #/
        while ((!self ispredictedstreamposready() || istrue(var_a3269db2b15568da) && !self hasloadedcustomizationplayerview(self)) && gettime() < timeout) {
            waitframe();
        }
        self.var_f9bcdd83c6c6899f = 1;
        if (istrue(var_de6ef125511e1141)) {
            var_6176904164db6b75 = gettime() + getdvarint(@"hash_6f5f8daeb9f79d47", 5000);
            while (gettime() < var_6176904164db6b75) {
                waitframe();
            }
        }
        if (isdefined(var_4a1d79951b2bd56c)) {
            var_1e41981f0fa40795 = getdvarint(@"hash_9d5507c09010bae5", 2000);
            timeout = gettime() + var_4a1d79951b2bd56c;
            var_8cabe71736d798a7 = 0;
            while (var_4a1d79951b2bd56c == -1 || gettime() < timeout) {
                if (gettime() > var_8cabe71736d798a7) {
                    self function_bc667001f9dd3808(var_11f3b4465c8b637b);
                    var_8cabe71736d798a7 = gettime() + var_1e41981f0fa40795;
                }
                waitframe();
            }
        }
    }
    /#
        var_5d76b626b769435c = !var_4de859b9228e5cfd || self ispredictedstreamposready();
        var_fa20744680749e52 = (gettime() - var_599be23b9afb9909) / 1000;
        println("<unknown string>" + var_11f3b4465c8b637b[0] + "<unknown string>" + var_11f3b4465c8b637b[1] + "<unknown string>" + var_11f3b4465c8b637b[2] + "<unknown string>" + var_fa20744680749e52 + "<unknown string>" + ter_op(istrue(var_5d76b626b769435c), "<unknown string>", "<unknown string>") + "<unknown string>");
    #/
    self.prestreaminglocation = undefined;
    self notify("playerPrestreamComplete");
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff2
// Size: 0x14
function getdefaultstreamhinttimeoutms() {
    return getdvarint(@"hash_aaffd5b201281ad4", 9000);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300e
// Size: 0x1b
function playerclearstreamhintorigin() {
    self notify("playerPrestreamLocationWait");
    if (namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
        self clearpredictedstreampos();
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3030
// Size: 0x184
function function_2dcd6a9eb79260a6() {
    self cancelmantle();
    if (self isskydiving()) {
        self skydive_interrupt();
    }
    if (istrue(self.inlaststand)) {
        namespace_10260b963310d30e::finishreviveplayer("self_revive_success", self);
    }
    if (isdefined(self.burninginfo)) {
        namespace_df478cc572a311d3::molotov_clear_burning();
    }
    if (self function_9cc921a57ff4deb5()) {
        namespace_80cec6cfc70c4f95::function_fd357ca89e5e29d9();
    }
    if (namespace_f8065cafc523dba5::isinvehicle(1)) {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread namespace_1fbd40990ee60ede::vehicle_occupancy_exit(self.vehicle, undefined, self, data, 1);
    }
    if (isdefined(self.remoteuav)) {
        self.remoteuav namespace_6a0a424c378cb31c::remoteuav_leave();
    }
    if (isdefined(self.currentturret)) {
        namespace_ac45d22648d4adff::manualturret_endplayeruse(self.currentturret);
    }
    if (isdefined(self.usingremote)) {
        vehicles = vehicle_getarray();
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle.owner) && vehicle.owner == self) {
                if (isdefined(vehicle.helperdronetype)) {
                    vehicle namespace_bba8bc8532aa4913::function_6edfda4764129e3(1);
                }
            }
        }
    }
    namespace_484d135e1e3717ed::javelin_forceclear();
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31bb
// Size: 0x2a
function calchelicoptertrailpoint() {
    droppoint = self.origin - anglestoforward(self.angles) * 150;
    return droppoint;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ed
// Size: 0x13d
function prematchmusic(team) {
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") {
        return;
    }
    teamarray = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    if (isarray(teamarray) && teamarray.size == 0) {
        return;
    }
    setglobalsoundcontext("lobby_fade", "on", 3);
    brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    if (!isdefined(level.var_9d615a366ec2fb6f) && namespace_36f464722d326bbe::isbrstylegametype() && brgametype != "dmz" && brgametype != "exgm") {
        level.var_9d615a366ec2fb6f = 1;
    }
    var_ae72ff5502108e49 = 15.7;
    if (level.matchcountdowntime > var_ae72ff5502108e49) {
        waittime = level.matchcountdowntime - var_ae72ff5502108e49;
        wait(waittime);
        br_lobby_outro = function_17ee301cf0b5ba85("br_lobby_outro");
        function_46979d2fd81a6d4b(team, br_lobby_outro);
        function_c7f38d0611aa82e7(team, "mp_br_lobby_fade", 8);
        wait(level.matchcountdowntime);
    } else {
        /#
            println("<unknown string>" + level.matchcountdowntime);
        #/
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3331
// Size: 0x6b
function prematchdialog(team) {
    if (istutorial() || namespace_cd0b2d039510b38d::getsubgametype() == "dmz" || namespace_cd0b2d039510b38d::getsubgametype() == "exgm") {
        return;
    }
    if (level.matchcountdowntime > 3) {
        waittime = level.matchcountdowntime - 3;
        wait(waittime);
        brleaderdialogteam("prematch_end", team);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33a3
// Size: 0x125
function function_d26e2b04e5d064b6(timeinseconds) {
    if (!getdvarint(@"hash_65f74244d3c0f108", 1)) {
        return;
    }
    var_3d9a04704748e997 = getdvarint(@"hash_501689ed1f1820d6", 2);
    players = level.players;
    restrictions = [0:"execution_attack", 1:"execution_victim"];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_59c053b89257bc95("prematch_plotarmor", restrictions, 0);
    }
    wait(timeinseconds + var_3d9a04704748e997);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_59c053b89257bc95("prematch_plotarmor", restrictions, 1);
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34cf
// Size: 0xaa
function applyprematchplotarmor(var_6958d396e4ad3b95) {
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 0) {
        return;
    }
    timeinseconds = 5;
    waittime = var_6958d396e4ad3b95 - timeinseconds;
    if (waittime > 0) {
        wait(waittime);
    }
    foreach (player in level.players) {
        player.plotarmor = 1;
    }
    level thread function_d26e2b04e5d064b6(timeinseconds);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3580
// Size: 0x1b
function br_onvehicledeath() {
    player = self;
    player namespace_f8d3520d3483c1::damagearmor(150, 1);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35a2
// Size: 0x46
function br_delaynojip() {
    level endon("game_ended");
    delayseconds = getdvarint(@"hash_c1af35bdcbb75c06", 30);
    wait(delayseconds);
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ef
// Size: 0x60
function raytraceoffset(origin, xoffset, yoffset, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents) {
    result = namespace_2a184fc4902783dc::ray_trace(origin + (xoffset, yoffset, var_84d0c3e36addfa4), origin + (xoffset, yoffset, var_191ebd2dd0d5f975), ignoreents, contents);
    return result;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3657
// Size: 0x4c
function function_90312434b1550c4c() {
    var_1632bb04978fef4a = 10000;
    if (isdefined(level.br_level) && isdefined(level.br_level.var_a49c4f8101a5423e)) {
        var_1632bb04978fef4a = level.br_level.var_a49c4f8101a5423e;
    }
    return var_1632bb04978fef4a;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ab
// Size: 0x4c
function function_cc755ff7170d3dd0() {
    var_e0be8bb269d1b3ee = -2400;
    if (isdefined(level.br_level) && isdefined(level.br_level.var_540c681a924e2df2)) {
        var_e0be8bb269d1b3ee = level.br_level.var_540c681a924e2df2;
    }
    return var_e0be8bb269d1b3ee;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ff
// Size: 0xe0
function function_f15d53d526f86482(origin, radius) {
    if (!isdefined(level.cratedata) || !isdefined(level.cratedata.crates)) {
        return;
    }
    radiussq = radius * radius;
    crates = [];
    foreach (crate in level.cratedata.crates) {
        if (!isdefined(crate)) {
            continue;
        }
        distsq = distance2dsquared(crate.origin, origin);
        if (distsq < radiussq) {
            crates[crates.size] = crate;
        }
    }
    return crates;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37e7
// Size: 0xbe
function function_4ce70ef04544cb4c(origin, radius) {
    drones = [];
    if (isdefined(level.var_fc4bb27a820f54dd)) {
        radiussq = radius * radius;
        foreach (var_16f25af2db9564b2 in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            distsq = distance2dsquared(origin, var_16f25af2db9564b2.origin);
            if (distsq < radiussq) {
                drones[drones.size] = var_16f25af2db9564b2;
            }
        }
    }
    return drones;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38ad
// Size: 0x49
function droptogroundmultitrace(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_c3fbb6661b91750f, ignoreents) {
    result = function_3407d8cd152ddb10(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_c3fbb6661b91750f, ignoreents);
    return result["position"];
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x38fe
// Size: 0x43
function function_3cb43370cd3fc57c(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_c3fbb6661b91750f, ignoreents) {
    result = function_3407d8cd152ddb10(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_c3fbb6661b91750f, ignoreents);
    return result;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3949
// Size: 0x2c3
function function_3407d8cd152ddb10(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_c3fbb6661b91750f, ignoreents) {
    var_e0be8bb269d1b3ee = function_cc755ff7170d3dd0();
    var_1632bb04978fef4a = function_90312434b1550c4c();
    var_e25c6801a01f7fce = 5000;
    var_befd185e0007a7b8 = -18000 + var_e0be8bb269d1b3ee;
    var_e89346b6c5bfd043 = 15;
    if (!isdefined(var_84d0c3e36addfa4)) {
        var_84d0c3e36addfa4 = getdvarint(@"hash_2a585c8e6dceac23", var_e25c6801a01f7fce);
    }
    if (!isdefined(var_191ebd2dd0d5f975)) {
        var_191ebd2dd0d5f975 = getdvarint(@"hash_31f5cb462b87b556", var_befd185e0007a7b8);
    }
    low = getdvarint(@"hash_8408f03a735c0934", var_e0be8bb269d1b3ee);
    high = getdvarint(@"hash_fdc476e42fa40a6e", var_1632bb04978fef4a);
    contents = undefined;
    if (isdefined(var_c3fbb6661b91750f)) {
        contents = var_c3fbb6661b91750f;
    } else {
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1);
    }
    if (!isdefined(ignoreents)) {
        ignoreents = [];
    }
    leveldata = namespace_dace9d390bc4a290::vehicle_spawn_getleveldata();
    if (isdefined(leveldata.instancesbyref)) {
        if (isdefined(leveldata.instancesbyref["little_bird"])) {
            ignoreents = array_combine(ignoreents, leveldata.instancesbyref["little_bird"]);
        }
        if (isdefined(leveldata.instancesbyref["little_bird_mg"])) {
            ignoreents = array_combine(ignoreents, leveldata.instancesbyref["little_bird_mg"]);
        }
        if (isdefined(leveldata.instancesbyref["veh9_palfa"])) {
            ignoreents = array_combine(ignoreents, leveldata.instancesbyref["veh9_palfa"]);
        }
    }
    crates = function_f15d53d526f86482(origin, 100);
    if (isdefined(crates) && crates.size > 0) {
        ignoreents = array_combine(ignoreents, crates);
    }
    result = raytraceoffset(origin, 0, 0, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, var_e89346b6c5bfd043, 0, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, 0, var_e89346b6c5bfd043, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, -1 * var_e89346b6c5bfd043, 0, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, 0, -1 * var_e89346b6c5bfd043, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = [];
    result["position"] = (origin[0], origin[1], high);
    result["fraction"] = 0;
    return result;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c14
// Size: 0x2e
function traceresultisvalid(result, lowestz) {
    return result["fraction"] != 1 && result["position"][2] > lowestz;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c4a
// Size: 0x6c
function function_199ed650e3e5b30c() {
    if (!getdvarint(@"hash_74ce45c3ef7d0741", 1)) {
        return;
    }
    if (self.triggertype == "proximity" && !self.usetime) {
        self.touchlist = [];
        self.touchlist["neutral"] = [];
        self.touchlist["none"] = [];
        self.assisttouchlist = undefined;
    }
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cbd
// Size: 0x42
function function_6b531c76815d77f3(scriptablename) {
    if (isammo(scriptablename)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref(scriptablename);
    } else {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
    }
    if (isdefined(lootid)) {
        return namespace_aead94004cf4c147::function_36b1968bfe78916b(lootid);
    }
    return 0;
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d07
// Size: 0x4a
function function_b7da95b3958a0ef0(flag, bool) {
    currentvalue = self getclientomnvar("br_archived_flags");
    if (istrue(bool)) {
        currentvalue = currentvalue | flag;
    } else {
        currentvalue = currentvalue & ~flag;
    }
    self setclientomnvar("br_archived_flags", currentvalue);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d58
// Size: 0x16
function function_179a8d5a185dfb56(bool) {
    function_b7da95b3958a0ef0(1, bool);
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d75
// Size: 0x30
function function_ac3376fecc550ef0(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 0;
    }
    return scriptablename == "brloot_offhand_binoculars" || scriptablename == "brloot_offhand_heartbeatsensor" || scriptablename == "brloot_offhand_geigercounter";
}

// Namespace namespace_a548bd428a566cf3/namespace_d3d40f75bb4e4c32
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dad
// Size: 0x150
function kickplayersatcircleedge(var_bf2d8935024450a8) {
    if (!isdefined(var_bf2d8935024450a8)) {
        var_bf2d8935024450a8 = undefined;
    }
    level endon("game_ended");
    self endon("death");
    remainingdistance = distance2d(self.origin, self.pathstruct.endptui);
    remainingtime = remainingdistance / namespace_ad389306d44fc6b4::getc130speed();
    if (isdefined(var_bf2d8935024450a8)) {
        var_8352485f68c78819 = [[ var_bf2d8935024450a8 ]]();
    } else {
        var_2b9cbfdc00d0d9cb = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_kick_player_time_before_circle_edge");
        var_8352485f68c78819 = getdvarfloat(var_2b9cbfdc00d0d9cb, 1.1);
    }
    wait(remainingtime - var_8352485f68c78819);
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == "c130" && !isdefined(player.jumptype)) {
            player.jumptype = "outOfBounds";
            player notify("halo_kick_c130");
        }
    }
}

