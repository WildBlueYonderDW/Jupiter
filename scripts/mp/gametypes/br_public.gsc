#using scripts\engine\utility.gsc;
#using scripts\common\values.gsc;
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
#using scripts\mp\gametypes\br_utility.gsc;
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

#namespace br_public;

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafa
// Size: 0x17
function iswaitingtoentergulag(player) {
    return istrue(player.entergulagwait);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb1a
// Size: 0x17
function isloadinggulag(player) {
    return istrue(player.gulagloading);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb3a
// Size: 0x17
function isrespawningfromtoken(player) {
    return istrue(player.respawningfromtoken);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5a
// Size: 0x31
function isplayeringulag() {
    player = self;
    return isdefined(player) && (istrue(player.jailed) || istrue(player.gulagarena));
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb94
// Size: 0x41
function isplayerinorgoingtogulag() {
    player = self;
    return isdefined(player) && (istrue(player.jailed) || istrue(player.gulagarena) || istrue(player.gulag));
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbde
// Size: 0x3b
function function_c0461110bcceb029() {
    player = self;
    return isdefined(player) && isdefined(player.arena) && istrue(player.arena.goagain);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc22
// Size: 0x21
function function_f1918f2fce663b2c() {
    player = self;
    return isdefined(player) && istrue(player.wasingulag);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4c
// Size: 0x32
function function_8f0e6614368f64c2() {
    player = self;
    return isdefined(player) && isdefined(player.respawndelay) && player.respawndelay > 0;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc87
// Size: 0x35
function iseligibleforteamrevive() {
    player = self;
    return istrue(player.br_iseliminated) && !isalive(player) && !istrue(player.gulag);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcc5
// Size: 0x2f
function function_57244bfdbe157401() {
    if (isusingmatchrulesdata()) {
        return getmatchrulesdata("brData", "trainEnabled");
    }
    return getdvarint(@"hash_ed4a71e34e488e86", 0) > 0;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcfc
// Size: 0xc
function playeriszombie() {
    return istrue(self.iszombie);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd11
// Size: 0xc
function function_f5446040a93792c3() {
    return istrue(self.isghost);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd26
// Size: 0x2e
function watchhealend() {
    self endon("heal_end");
    self endon("death_or_disconnect");
    self endon("armor_plate_done");
    level endon("game_ended");
    childthread heal_removeonplayernotifies();
    childthread heal_removeondamage();
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5c
// Size: 0x4d
function heal_removeonplayernotifies() {
    self notifyonplayercommand("try_heal_cancel", "+weapnext");
    self notifyonplayercommand("try_heal_cancel", "+attack");
    self notifyonplayercommand("try_heal_cancel", "+breath_sprint");
    waittill_any_2("death", "try_heal_cancel");
    healend();
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb1
// Size: 0xa1
function heal_removeondamage() {
    while (true) {
        idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon = self waittill("damage");
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_UNKNOWN")) {
            continue;
        }
        healend();
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5a
// Size: 0x3d
function healend() {
    self notifyonplayercommandremove("try_heal_cancel", "+weapnext");
    self notifyonplayercommandremove("try_heal_cancel", "+attack");
    self notifyonplayercommandremove("try_heal_cancel", "+breath_sprint");
    self notify("heal_end");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe9f
// Size: 0x2b
function removeitemfrominventory(slot) {
    assert(isdefined(self.br_inventory_slots[slot]));
    self.br_inventory_slots[slot] = undefined;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xed2
// Size: 0x53
function ishelmet(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"armor" && issubstr(scriptablename, "helmet");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0x12
function isarmor(scriptablename) {
    return ishelmet(scriptablename);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf49
// Size: 0x12
function isarmorplate(scriptablename) {
    return scriptablename == "brloot_armor_plate";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf64
// Size: 0x53
function function_4aa12e0ed3f6b745(scriptablename) {
    return issubstr(scriptablename, "brloot_plate_carrier") || isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"plate_carrier";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc0
// Size: 0x16
function function_1a4d30da7f8971fd(scriptablename) {
    return issubstr(scriptablename, "brloot_voucher");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfdf
// Size: 0x4d
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

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1035
// Size: 0x36
function function_c2f2bb9e0ae9a454(platesize) {
    if (!isdefined(platesize) || platesize <= 1) {
        return undefined;
    }
    if (platesize == 2) {
        return "brloot_plate_carrier_2";
    }
    if (platesize == 3) {
        return "brloot_plate_carrier_3";
    }
    return undefined;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1074
// Size: 0x28
function ishealitem(scriptablename) {
    return scriptablename == "brloot_health_bandages" || scriptablename == "brloot_health_firstaid" || scriptablename == "brloot_health_adrenaline";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10a5
// Size: 0x1d
function function_12d9a293931f0455(scriptablename) {
    return scriptablename == "brloot_offhand_heartbeatsensor" || scriptablename == "brloot_super_heartbeatsensor";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10cb
// Size: 0x7d
function isequipment(scriptablename) {
    return isarmorplate(scriptablename) || ishealitem(scriptablename) || isdefined(level.br_pickups.br_itemtype[scriptablename]) && (level.br_pickups.br_itemtype[scriptablename] == #"lethal" || level.br_pickups.br_itemtype[scriptablename] == #"tactical");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1151
// Size: 0x44
function isequipmentlethal(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"lethal";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x119e
// Size: 0x44
function isequipmenttactical(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"tactical";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11eb
// Size: 0x44
function isammo(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"ammo";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1238
// Size: 0x44
function istoken(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"token";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1285
// Size: 0x2e
function isKiosk(scriptablename) {
    return isdefined(scriptablename) && (scriptablename == "br_plunder_box" || scriptablename == "br_plunder_box_high_tier" || scriptablename == "br_plunder_box_nocollision");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12bc
// Size: 0x18
function function_746c06c00cd6bdc5(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "drone_deployable_kiosk";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12dd
// Size: 0x18
function isweaponupgrade(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "br_workbench";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12fe
// Size: 0x18
function function_a84a6acb3c2edcae(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "br_plunder_box_stronghold";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x131f
// Size: 0x3a
function function_63d8455b2c1455eb(scriptablename) {
    return isdefined(level.br_pickups.var_688c9b0a44e4a8ca[scriptablename]) && level.br_pickups.var_688c9b0a44e4a8ca[scriptablename];
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1362
// Size: 0x83
function playercanplaynotcriticalgesture() {
    if (self isswitchingweapon() || self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing() || self [[ scripts\engine\utility::getsharedfunc("player", "isPlayerADS") ]]() || istrue(self.insertingarmorplate)) {
        return false;
    }
    curweap = self getcurrentweapon();
    if (isnullweapon(curweap)) {
        return false;
    }
    return true;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ee
// Size: 0x5d
function playerplaygestureweaponanim(weaponref, animtime, variantid) {
    self endon("death_or_disconnect");
    weapobj = makeweapon(weaponref, [], undefined, undefined, ter_op(isdefined(variantid), variantid, undefined));
    self giveandfireoffhand(weapobj);
    wait animtime;
    if (self hasweapon(weapobj)) {
        self takeweapon(weapobj);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1453
// Size: 0x1b
function hasrespawntoken() {
    player = self;
    return istrue(player.hasrespawntoken);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1477
// Size: 0x1b
function function_15da77dc195bd80a() {
    player = self;
    return istrue(player.var_15da77dc195bd80a);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x149b
// Size: 0x55
function function_8b2396647673be50() {
    return !istrue(level.br_pickups.var_174664c71517f679) || istrue(level.br_pickups.var_5609de5240e42e84) && isdefined(level.gulag) && istrue(level.gulag.shutdown);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f9
// Size: 0x1b
function hasselfrevivetoken() {
    player = self;
    return isdefined(player.var_6c05b62d5521a0b2);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x151d
// Size: 0x31
function function_38a924a5f3d8ca8(player) {
    return player hasselfrevivetoken() && player.var_6c05b62d5521a0b2.name == "brloot_battlerage_self_revive";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1557
// Size: 0x3d
function function_723bd1ab3bb16b2b(player, scriptablename) {
    if (!isdefined(player) || !isdefined(scriptablename)) {
        return false;
    }
    var_87f79e2fde6f6049 = function_791e72676cd7b544(player);
    return isdefined(var_87f79e2fde6f6049) && var_87f79e2fde6f6049 == scriptablename;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x159d
// Size: 0x33
function function_791e72676cd7b544(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.name;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d9
// Size: 0x33
function function_7285c46ee8b26043(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.perk;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1615
// Size: 0x33
function function_1e141ad1f7106373(player) {
    if (!isdefined(player) || !player hasselfrevivetoken()) {
        return undefined;
    }
    return player.var_6c05b62d5521a0b2.type;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1651
// Size: 0x38
function function_56733d929b67a814(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 0;
    }
    switch (scriptablename) {
    case #"hash_b3bbb437bf12b40a": 
        return 1;
    default: 
        return 0;
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1691
// Size: 0x3b
function function_8e65095b82c19d04(scriptablename) {
    if (!isdefined(scriptablename)) {
        return undefined;
    }
    switch (scriptablename) {
    case #"hash_b3bbb437bf12b40a": 
        return "specialty_br_faster_revive";
    default: 
        return undefined;
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d4
// Size: 0x1b
function hasplatepouch() {
    player = self;
    return istrue(player.hasplatepouch);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f8
// Size: 0x1b
function hasspecialistbonus() {
    player = self;
    return istrue(player.hasbrspecialistbonus);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x171c
// Size: 0x4c
function hasaccesscard(specifictype) {
    player = self;
    if (!isdefined(specifictype) || !isdefined(player.accesscard)) {
        return isdefined(player.accesscard);
    }
    return specifictype == player.accesscard;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1770
// Size: 0x12
function haskey(lootid) {
    return namespace_aead94004cf4c147::function_36b1968bfe78916b(lootid);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x178b
// Size: 0x2bd
function cleanac130struct(planestruct) {
    if (isdefined(planestruct.playerslot1)) {
        if (isdefined(planestruct.playerslot1.head)) {
            planestruct.playerslot1.head delete();
        }
        if (isdefined(planestruct.playerslot1.helmet)) {
            planestruct.playerslot1.helmet delete();
        }
        planestruct.playerslot1 delete();
    }
    if (isdefined(planestruct.playerslot2)) {
        if (isdefined(planestruct.playerslot2.head)) {
            planestruct.playerslot2.head delete();
        }
        planestruct.playerslot2 delete();
    }
    if (isdefined(planestruct.playerslot3)) {
        planestruct.playerslot3 delete();
    }
    if (isdefined(planestruct.playerslot4)) {
        planestruct.playerslot4 delete();
    }
    if (isdefined(planestruct.aidoorchief)) {
        planestruct.aidoorchief delete();
    }
    if (isdefined(planestruct.cameraent)) {
        planestruct.cameraent delete();
    }
    if (isdefined(planestruct.cameraentmoving)) {
        planestruct.cameraentmoving delete();
    }
    if (isdefined(planestruct.playerpositionents)) {
        foreach (ent in planestruct.playerpositionents) {
            ent delete();
        }
    }
    if (isdefined(planestruct.cloudcoverfx)) {
        planestruct.cloudcoverfx delete();
    }
    if (isdefined(planestruct.staticc130) && istrue(planestruct.staticc130.cleanme)) {
        planestruct.staticc130 delete();
    }
    if (isdefined(planestruct.movingc130) && istrue(planestruct.movingc130.cleanme)) {
        if (istrue(planestruct.movingc130.innards.cleanme)) {
            planestruct.movingc130.innards delete();
        }
        planestruct.movingc130 delete();
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a50
// Size: 0x16
function function_64fa4c213439177f() {
    player = self;
    player function_9b5704d0633b87fa();
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x494
function updatebrscoreboardstat(statname, value) {
    player = self;
    assert(isplayer(player));
    assert(isdefined(statname) && isstring(statname));
    bitoffset = 0;
    bitwidth = 0;
    infoindex = 0;
    var_43dd2772924a0920 = 0;
    switch (statname) {
    case #"hash_30a2bd77d6fd595f": 
        var_57acadc40b2f0a8 = [0, 8, 0];
        infoindex = var_57acadc40b2f0a8[2];
        bitwidth = var_57acadc40b2f0a8[1];
        bitoffset = var_57acadc40b2f0a8[0];
        break;
    case #"hash_80e2211904012a81": 
        var_57acbdc40b2f2db = [0, 12, 0];
        infoindex = var_57acbdc40b2f2db[2];
        bitwidth = var_57acbdc40b2f2db[1];
        bitoffset = var_57acbdc40b2f2db[0];
        break;
    case #"hash_6d7da638af8fecbb": 
        var_57ad0dc40b2fdda = [0, 8, 1];
        infoindex = var_57ad0dc40b2fdda[2];
        bitwidth = var_57ad0dc40b2fdda[1];
        bitoffset = var_57ad0dc40b2fdda[0];
        break;
    case #"hash_b0f342895fb227f9": 
        var_57ad1dc40b3000d = [0, 7, 1];
        infoindex = var_57ad1dc40b3000d[2];
        bitwidth = var_57ad1dc40b3000d[1];
        bitoffset = var_57ad1dc40b3000d[0];
        break;
    case #"hash_67733e84369e4cb1": 
        var_57acedc40b2f974 = [0, 8, 1];
        infoindex = var_57acedc40b2f974[2];
        bitwidth = var_57acedc40b2f974[1];
        bitoffset = var_57acedc40b2f974[0];
        break;
    case #"hash_16a3898de48ed541": 
        var_57acfdc40b2fba7 = [0, 8, 2];
        infoindex = var_57acfdc40b2fba7[2];
        bitwidth = var_57acfdc40b2fba7[1];
        bitoffset = var_57acfdc40b2fba7[0];
        break;
    case #"hash_ecd8ab7521415233": 
        var_57ac4dc40b2e376 = [8, 4, 2];
        infoindex = var_57ac4dc40b2e376[2];
        bitwidth = var_57ac4dc40b2e376[1];
        bitoffset = var_57ac4dc40b2e376[0];
        break;
    case #"hash_e806c669b1968751": 
        var_57ac5dc40b2e5a9 = [12, 3, 2];
        infoindex = var_57ac5dc40b2e5a9[2];
        bitwidth = var_57ac5dc40b2e5a9[1];
        bitoffset = var_57ac5dc40b2e5a9[0];
        break;
    case #"hash_7423dc1edc0a169a": 
        var_c00a2c6249962d83 = [15, 1, 2];
        infoindex = var_c00a2c6249962d83[2];
        bitwidth = var_c00a2c6249962d83[1];
        bitoffset = var_c00a2c6249962d83[0];
        break;
    case #"hash_b90a4e6c283d0c06": 
        var_c00a2b6249962b50 = [0, 16, 3];
        infoindex = var_c00a2b6249962b50[2];
        bitwidth = var_c00a2b6249962b50[1];
        bitoffset = var_c00a2b6249962b50[0];
        break;
    case #"hash_f43fd3867872aef3": 
        var_c00a2e62499631e9 = [0, 10, 4];
        infoindex = var_c00a2e62499631e9[2];
        bitwidth = var_c00a2e62499631e9[1];
        bitoffset = var_c00a2e62499631e9[0];
        break;
    case #"hash_837c8aaaaaa8c5ab": 
        var_c00a2d6249962fb6 = [10, 6, 4];
        infoindex = var_c00a2d6249962fb6[2];
        bitwidth = var_c00a2d6249962fb6[1];
        bitoffset = var_c00a2d6249962fb6[0];
        break;
    case #"hash_97c4881805a48fcc": 
        var_c00a30624996364f = [0, 2, 5];
        infoindex = var_c00a30624996364f[2];
        bitwidth = var_c00a30624996364f[1];
        bitoffset = var_c00a30624996364f[0];
        break;
    case #"hash_9eaf5b602890d1cf": 
        var_c00a2f624996341c = [2, 5, 5];
        infoindex = var_c00a2f624996341c[2];
        bitwidth = var_c00a2f624996341c[1];
        bitoffset = var_c00a2f624996341c[0];
        break;
    case #"hash_1580ef2bedfde211":
    case #"hash_466dcff665608ca0":
    case #"hash_6f4e7e5330c0b130":
    case #"hash_985d10ac4d0e3bcc":
    case #"hash_a356e771faafb08c":
    case #"hash_a765c47eedad2989":
    case #"hash_f933905aabddd9c7": 
        var_43dd2772924a0920 = 1;
        break;
    default: 
        assertmsg("<dev string:x1c>" + statname + "<dev string:x35>");
        return;
    }
    assertex(value < 1 << bitwidth || var_43dd2772924a0920, "<dev string:x51>" + statname + "<dev string:x65>" + value + "<dev string:x74>");
    player packstatintoextrainfo(value, bitoffset, bitwidth, infoindex);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0a
// Size: 0x1b9
function packstatintoextrainfo(value, bitoffset, bitwidth, infoindex) {
    player = self;
    infovalues = [player.extrascore0, player.extrascore1, player.extrascore2, player.extrascore3, player.extrascore4, player.extrascore5];
    mask = int(pow(2, bitwidth)) - 1;
    var_a463992091f1d483 = (value & mask) << bitoffset;
    var_f8f977081d3da8b4 = ~(mask << bitoffset);
    prevvalue = infovalues[infoindex];
    cleanedbase = prevvalue & var_f8f977081d3da8b4;
    var_82a90e56e416fa55 = cleanedbase + var_a463992091f1d483;
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
    case 5: 
        player.extrascore5 = var_82a90e56e416fa55;
        break;
    default: 
        break;
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20cb
// Size: 0x40
function setplayerdownedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 2048;
        return;
    }
    self.game_extrainfo &= ~2048;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2113
// Size: 0x44
function function_cc20f0c1304019d9(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 262144;
        return;
    }
    self.game_extrainfo &= ~262144;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x215f
// Size: 0x44
function function_eb28f4724f0f14b(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 524288;
        return;
    }
    self.game_extrainfo &= ~524288;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21ab
// Size: 0x40
function setplayerbeingrevivedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 4096;
        return;
    }
    self.game_extrainfo &= ~4096;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21f3
// Size: 0x40
function setplayerselfrevivingextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 8192;
        return;
    }
    self.game_extrainfo &= ~8192;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x223b
// Size: 0x40
function setplayermostwantedextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 32768;
        return;
    }
    self.game_extrainfo &= ~32768;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2283
// Size: 0x44
function sethasselfrevivetokenextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 65536;
        return;
    }
    self.game_extrainfo &= ~65536;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22cf
// Size: 0x44
function sethasrespawntokenextrainfo(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 131072;
        return;
    }
    self.game_extrainfo &= ~131072;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231b
// Size: 0x6a
function incrementplayersdownedstat() {
    player = self;
    if (!isdefined(player.br_playersdowned)) {
        player.br_playersdowned = 0;
    }
    player.br_playersdowned++;
    player updatebrscoreboardstat("playersDowned", player.br_playersdowned);
    player scripts\mp\utility\stats::incpersstat("downs", 1);
    player scripts\mp\codcasterclientmatchdata::function_48544e365f4f5648(16, 1);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x238d
// Size: 0x44
function function_e58801acf7adcdc8(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 1048576;
        return;
    }
    self.game_extrainfo &= ~1048576;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23d9
// Size: 0x44
function function_c2afa687bc871d71(value) {
    if (istrue(value)) {
        self.game_extrainfo |= 2097152;
        return;
    }
    self.game_extrainfo &= ~2097152;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2425
// Size: 0x5f
function isplayerbrsquadleader() {
    player = self;
    /#
        if (istrue(player.isbrsquadleader) != istrue(player.game_extrainfo & 256)) {
            assertmsg("<dev string:x96>");
        }
    #/
    return istrue(player.isbrsquadleader) && player.game_extrainfo & 256;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x248d
// Size: 0x84
function brbroadcastplayercardsplash(splash, optionalnumber) {
    foreach (player in level.players) {
        if (!isplayer(player)) {
            continue;
        }
        if (player isplayeringulag()) {
            continue;
        }
        player thread scripts\mp\hud_message::showsplash(splash, optionalnumber, player);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2519
// Size: 0xc8
function brleaderdialogteamexcludeplayer(dialog, team, excludeplayer, var_a64cad1ecc519617, allowdead, delay, var_abb7e1ea2adce060, prefixoverride) {
    assert(isplayer(excludeplayer));
    foreach (teammate in level.teamdata[team]["players"]) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate != excludeplayer) {
            brleaderdialogplayer(dialog, teammate, var_a64cad1ecc519617, allowdead, delay, var_abb7e1ea2adce060, prefixoverride);
        }
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x25e9
// Size: 0x51
function brleaderdialogteam(dialog, team, var_a64cad1ecc519617, delay, var_abb7e1ea2adce060, prefixoverride) {
    brleaderdialog(dialog, var_a64cad1ecc519617, level.teamdata[team]["players"], undefined, delay, var_abb7e1ea2adce060, prefixoverride);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2642
// Size: 0xb7
function brleaderdialog(dialog, var_a64cad1ecc519617, playersoverride, allowdead, delay, var_abb7e1ea2adce060, prefixoverride) {
    if (!isdefined(game["dialog"][dialog])) {
        println("<dev string:xdc>" + dialog + "<dev string:xe7>");
        return;
    }
    players = level.players;
    if (isdefined(playersoverride)) {
        players = playersoverride;
    }
    for (playerindex = 0; playerindex < players.size; playerindex++) {
        player = players[playerindex];
        thread brleaderdialogplayer(dialog, player, var_a64cad1ecc519617, allowdead, delay, var_abb7e1ea2adce060, prefixoverride);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2701
// Size: 0xf3
function modeplayerskipdialog(dialog, var_a64cad1ecc519617) {
    if (!isdefined(var_a64cad1ecc519617)) {
        var_a64cad1ecc519617 = 1;
    }
    if (istrue(var_a64cad1ecc519617) && isplayeringulag()) {
        return true;
    }
    if (function_94b952789d039abb() && getdvar(@"hash_12e53040d5281856", "") == "scripted") {
        return true;
    }
    if (istrue(self.playinggulagbink)) {
        return true;
    }
    if (isBrPracticeMode()) {
        if (istrue(self.playingtutorialdialogue)) {
            return true;
        }
        if (dialog == "deploy_squad_leader" || dialog == "prematch_enter") {
            return true;
        }
        if ((dialog == "circle_closing" || dialog == "first_circle") && !istrue(level.playerumpedfromplane)) {
            return true;
        }
    }
    issolos = level.maxteamsize == 1;
    if (issolos) {
        switch (dialog) {
        case #"hash_8c7e4eedbb3a6dd9": 
            return true;
        }
    }
    return false;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27fd
// Size: 0x53
function brgetoperatorteam(player) {
    operatorteam = player.defaultoperatorteam;
    if (isai(player)) {
        operatorteam = player.botoperatorteam;
    }
    if (istutorial() || isBrPracticeMode()) {
        operatorteam = "allies";
    }
    return operatorteam;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2859
// Size: 0x15d
function brleaderdialogplayer(dialog, player, var_a64cad1ecc519617, allowdead, delay, var_abb7e1ea2adce060, prefixoverride) {
    player endon("disconnect");
    level endon("game_ended");
    if (!isdefined(player)) {
        return;
    }
    if (istrue(player.isdisconnecting)) {
        return;
    }
    if (!isdefined(allowdead)) {
        allowdead = getdvarint(@"hash_a6587a24d2081693", 1);
    }
    if (!isalive(player) && !istrue(allowdead)) {
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
    if (istutorial() || isBrPracticeMode()) {
        if (dialog == "mission_scav_accept" || dialog == "mission_obj_next_nptarget") {
            return;
        }
    }
    soundname = function_93550b34f0a49dd9(dialog, player, prefixoverride);
    if (isdefined(soundname)) {
        soundname = tolower(soundname);
        if (soundexists(soundname)) {
            soundlength = lookupsoundlength(soundname, 1) / 1000;
            if (isdefined(delay) && delay >= level.framedurationseconds) {
                wait delay;
            }
            player queuedialogforplayer(soundname, dialog, soundlength);
            return;
        }
        function_27167a39cd08cea0(soundname);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29be
// Size: 0xbd
function function_93550b34f0a49dd9(dialog, player, prefixoverride) {
    soundname = undefined;
    operatorteam = brgetoperatorteam(player);
    if (!isdefined(operatorteam)) {
        operatorteam = "allies";
    }
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        soundname = "dx_bra_" + game["voice"][operatorteam] + "_" + game["dialog"][dialog];
    } else {
        prefix = "dx_br_brdm_";
        if (isdefined(prefixoverride)) {
            prefix = prefixoverride;
        }
        soundname = "" + prefix + game["dialog"][dialog];
        soundname = function_659ac3bd735f8bd8(game["dialog"][dialog], prefix, soundname);
    }
    if (isdefined(soundname)) {
        soundname = tolower(soundname);
    }
    return soundname;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2a84
// Size: 0x180
function function_659ac3bd735f8bd8(dialogalias, prefix, var_6435e90dbd48d412) {
    oldspeaker = "wzan";
    soundname = "" + prefix + dialogalias;
    if (!issubstr(dialogalias, oldspeaker)) {
        return soundname;
    }
    var_3b4802d432f9a896 = strtok(dialogalias, "_");
    updatedstring = "";
    for (i = 0; i < var_3b4802d432f9a896.size; i++) {
        if (i != 0) {
            updatedstring += "_";
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
                updatedstring += var_99f6ac11ef7746fa;
                function_126e8340466d1bb2(var_3b4802d432f9a896[i], var_99f6ac11ef7746fa);
            } else {
                updatedstring += var_3b4802d432f9a896[i];
            }
            continue;
        }
        updatedstring += refname;
    }
    updatedstring = "" + prefix + updatedstring;
    if (!soundexists(updatedstring)) {
        function_27167a39cd08cea0(var_6435e90dbd48d412, updatedstring);
    } else {
        soundname = updatedstring;
    }
    return soundname;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0d
// Size: 0x91
function function_27167a39cd08cea0(var_6435e90dbd48d412, updatedstring) {
    if (true) {
        return;
    }
    if (!isdefined(level.var_de6c144f804bafd4)) {
        level.var_de6c144f804bafd4 = [];
    }
    if (!array_contains(level.var_de6c144f804bafd4, var_6435e90dbd48d412)) {
        level.var_de6c144f804bafd4[level.var_de6c144f804bafd4.size] = var_6435e90dbd48d412;
        if (isdefined(updatedstring)) {
            scripts\mp\utility\script::demoforcesre("SoundName for " + updatedstring + " was not found for the IW9 " + var_6435e90dbd48d412 + " alias. Make sure the Jup line for this is added.");
            return;
        }
        scripts\mp\utility\script::demoforcesre("SoundName for " + var_6435e90dbd48d412 + " was probably deleted and there was not a Jup version created for it.");
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca6
// Size: 0x37
function function_126e8340466d1bb2(var_8f323a27033ae060, var_a78424d72e029d71) {
    if (!isdefined(level.var_5607245a55dc82ea)) {
        level.var_5607245a55dc82ea = [];
    }
    level.var_5607245a55dc82ea[var_8f323a27033ae060] = var_a78424d72e029d71;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce5
// Size: 0x3e
function function_9442ae46b8802d0e(var_8f323a27033ae060) {
    if (!isdefined(level.var_5607245a55dc82ea)) {
        return "";
    }
    if (!isdefined(level.var_5607245a55dc82ea[var_8f323a27033ae060])) {
        return "";
    }
    return level.var_5607245a55dc82ea[var_8f323a27033ae060];
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2c
// Size: 0x1f
function function_d6ae35e0ce14bbaf() {
    return isdefined(level.script) && level.script == "mp_bm_tut";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d54
// Size: 0x1b
function function_55b494a07469298a() {
    return getdvar(@"hash_12e53040d5281856", "") == "scripted";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d78
// Size: 0x3c
function istutorial() {
    return function_55b494a07469298a() || isdefined(level.script) && (level.script == "mp_br_tut" || level.script == "mp_lc_br_tut");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dbd
// Size: 0x3f
function isBrPracticeMode() {
    if (!isdefined(level.isBrPracticeMode)) {
        if (!isdefined(level.script)) {
            return 0;
        }
        level.isBrPracticeMode = level.script == "mp_br_quarry";
    }
    return level.isBrPracticeMode;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e05
// Size: 0x1f
function isdmzbotpracticematch() {
    return isdefined(level.script) && level.script == "mp_br_money";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2d
// Size: 0x26
function isanytutorialorbotpracticematch() {
    return istutorial() || function_d6ae35e0ce14bbaf() || isBrPracticeMode() || isdmzbotpracticematch();
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e5c
// Size: 0xb3
function playergetlaststandpistol() {
    weaponlist = self getweaponslistprimaries();
    foreach (weaponobject in weaponlist) {
        weaponname = weaponobject.basename;
        if (weaponclass(weaponobject) == "pistol" && weaponname != "iw9_me_fists_mp" && weaponname != "iw8_me_riotshield_mp" && weaponname != "iw9_knifestab_mp" && weaponname != "iw8_throwingknife_fire_melee_mp" && weaponname != "iw8_throwingknife_electric_melee_mp") {
            return weaponobject;
        }
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f17
// Size: 0x17
function playerwaittillstreamhintcomplete() {
    if (istrue(self.prestreaminglocation)) {
        self waittill("playerPrestreamComplete");
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f36
// Size: 0x7c
function playerstreamhintdroptoground(streamorigin, startheight) {
    if (!isdefined(startheight)) {
        startheight = namespace_81156089ff1fe819::getinfilspawnoffset();
    }
    var_18a32798902944ee = getdvarint(@"hash_c103b956e0125687", 4500);
    if (var_18a32798902944ee >= 0) {
        var_625180ce8d2f8f77 = startheight - var_18a32798902944ee;
        contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1);
        streamorigin = drop_to_ground(streamorigin, 0, -1 * var_625180ce8d2f8f77, undefined, contents);
    }
    return streamorigin;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbb
// Size: 0x38
function playerstreamhintlocation(streamorigin, timeoutms, streamcustomization, extrawaittime, var_4a1d79951b2bd56c) {
    thread playerstreamhintlocationinternal(streamorigin, timeoutms, streamcustomization, extrawaittime, var_4a1d79951b2bd56c);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2ffb
// Size: 0x291
function playerstreamhintlocationinternal(streamorigin, timeoutms, streamcustomization, extrawaittime, var_4a1d79951b2bd56c) {
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
    waitstarttime = gettime();
    if (var_4de859b9228e5cfd) {
        while (!istrue(self.pers["streamSyncComplete"]) && gettime() < timeout) {
            waitframe();
        }
    }
    if (namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
        self function_bc667001f9dd3808(streamorigin);
    }
    if (istrue(streamcustomization)) {
        self loadcustomizationplayerview(self);
    }
    if (var_4de859b9228e5cfd) {
        waitframe();
        /#
            debugwaittime = getdvarfloat(@"hash_e799b8bb09ac23a4", 0);
            if (debugwaittime > 0) {
                wait debugwaittime;
            }
        #/
        while ((!self ispredictedstreamposready() || istrue(streamcustomization) && !self hasloadedcustomizationplayerview(self)) && gettime() < timeout) {
            waitframe();
        }
        self.var_f9bcdd83c6c6899f = 1;
        if (istrue(extrawaittime)) {
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
                    self function_bc667001f9dd3808(streamorigin);
                    var_8cabe71736d798a7 = gettime() + var_1e41981f0fa40795;
                }
                waitframe();
            }
        }
    }
    /#
        var_5d76b626b769435c = !var_4de859b9228e5cfd || self ispredictedstreamposready();
        var_fa20744680749e52 = (gettime() - waitstarttime) / 1000;
        println("<dev string:x112>" + streamorigin[0] + "<dev string:x14f>" + streamorigin[1] + "<dev string:x14f>" + streamorigin[2] + "<dev string:x155>" + var_fa20744680749e52 + "<dev string:x15e>" + ter_op(istrue(var_5d76b626b769435c), "<dev string:x16d>", "<dev string:x179>") + "<dev string:x186>");
    #/
    self.prestreaminglocation = undefined;
    self notify("playerPrestreamComplete");
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3294
// Size: 0x13
function getdefaultstreamhinttimeoutms() {
    return getdvarint(@"hash_aaffd5b201281ad4", 9000);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32b0
// Size: 0x1a
function playerclearstreamhintorigin() {
    self notify("playerPrestreamLocationWait");
    if (namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
        self clearpredictedstreampos();
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32d2
// Size: 0x180
function function_2dcd6a9eb79260a6() {
    self cancelmantle();
    if (self isskydiving()) {
        self skydive_interrupt();
    }
    if (istrue(self.inlaststand)) {
        scripts\mp\laststand::finishreviveplayer("self_revive_success", self);
    }
    if (isdefined(self.burninginfo)) {
        scripts\mp\equipment\molotov::molotov_clear_burning();
    }
    if (self function_9cc921a57ff4deb5()) {
        scripts\mp\gametypes\br_utility::function_fd357ca89e5e29d9();
    }
    if (scripts\cp_mp\utility\player_utility::isinvehicle(1)) {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_exit(self.vehicle, undefined, self, data, 1);
    }
    if (isdefined(self.remoteuav)) {
        self.remoteuav scripts\mp\killstreaks\remoteuav::remoteuav_leave();
    }
    if (isdefined(self.currentturret)) {
        scripts\cp_mp\killstreaks\manual_turret::manualturret_endplayeruse(self.currentturret);
    }
    if (isdefined(self.usingremote)) {
        vehicles = vehicle_getarray();
        foreach (vehicle in vehicles) {
            if (isdefined(vehicle.owner) && vehicle.owner == self) {
                if (isdefined(vehicle.helperdronetype)) {
                    vehicle scripts\cp_mp\killstreaks\helper_drone::function_6edfda4764129e3(1);
                }
            }
        }
    }
    scripts\mp\javelin::javelin_forceclear();
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x345a
// Size: 0x2a
function calchelicoptertrailpoint() {
    droppoint = self.origin - anglestoforward(self.angles) * 150;
    return droppoint;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x348d
// Size: 0x139
function prematchmusic(team) {
    if (scripts\mp\utility\game::getsubgametype() == "dmz" || scripts\mp\utility\game::getsubgametype() == "exgm") {
        return;
    }
    teamarray = scripts\mp\utility\teams::getteamdata(team, "players");
    if (isarray(teamarray) && teamarray.size == 0) {
        return;
    }
    setglobalsoundcontext("lobby_fade", "on", 3);
    brgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    if (!isdefined(level.var_9d615a366ec2fb6f) && scripts\cp_mp\utility\game_utility::isbrstylegametype() && brgametype != "dmz" && brgametype != "exgm") {
        level.var_9d615a366ec2fb6f = 1;
    }
    var_ae72ff5502108e49 = 15.7;
    if (level.matchcountdowntime > var_ae72ff5502108e49) {
        waittime = level.matchcountdowntime - var_ae72ff5502108e49;
        wait waittime;
        br_lobby_outro = function_17ee301cf0b5ba85("br_lobby_outro");
        function_46979d2fd81a6d4b(team, br_lobby_outro);
        function_c7f38d0611aa82e7(team, "mp_br_lobby_fade", 8);
        wait level.matchcountdowntime;
        return;
    }
    println("<dev string:x18b>" + level.matchcountdowntime);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35ce
// Size: 0x6b
function prematchdialog(team) {
    if (istutorial() || scripts\mp\utility\game::getsubgametype() == "dmz" || scripts\mp\utility\game::getsubgametype() == "exgm") {
        return;
    }
    if (level.matchcountdowntime > 3) {
        waittime = level.matchcountdowntime - 3;
        wait waittime;
        brleaderdialogteam("prematch_end", team);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3641
// Size: 0x11e
function function_d26e2b04e5d064b6(timeinseconds) {
    if (!getdvarint(@"hash_65f74244d3c0f108", 1)) {
        return;
    }
    var_3d9a04704748e997 = getdvarint(@"hash_501689ed1f1820d6", 2);
    players = level.players;
    restrictions = ["execution_attack", "execution_victim"];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player set_array("prematch_plotarmor", restrictions, 0);
    }
    wait timeinseconds + var_3d9a04704748e997;
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player set_array("prematch_plotarmor", restrictions, 1);
    }
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3767
// Size: 0xa6
function applyprematchplotarmor(countdowntime) {
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 0) {
        return;
    }
    timeinseconds = 5;
    waittime = countdowntime - timeinseconds;
    if (waittime > 0) {
        wait waittime;
    }
    foreach (player in level.players) {
        player.plotarmor = 1;
    }
    level thread function_d26e2b04e5d064b6(timeinseconds);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3815
// Size: 0x1b
function br_onvehicledeath() {
    player = self;
    player namespace_f8d3520d3483c1::damagearmor(150, 1);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3838
// Size: 0x46
function br_delaynojip() {
    level endon("game_ended");
    delayseconds = getdvarint(@"hash_c1af35bdcbb75c06", 30);
    wait delayseconds;
    setnojipscore(1, 1);
    setnojiptime(1, 1);
    level.nojip = 1;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3886
// Size: 0x60
function raytraceoffset(origin, xoffset, yoffset, updist, downdist, contents, ignoreents) {
    result = scripts\engine\trace::ray_trace(origin + (xoffset, yoffset, updist), origin + (xoffset, yoffset, downdist), ignoreents, contents);
    return result;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ef
// Size: 0x4c
function function_90312434b1550c4c() {
    var_1632bb04978fef4a = 10000;
    if (isdefined(level.br_level) && isdefined(level.br_level.var_a49c4f8101a5423e)) {
        var_1632bb04978fef4a = level.br_level.var_a49c4f8101a5423e;
    }
    return var_1632bb04978fef4a;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3944
// Size: 0x4c
function function_cc755ff7170d3dd0() {
    var_e0be8bb269d1b3ee = -2400;
    if (isdefined(level.br_level) && isdefined(level.br_level.var_540c681a924e2df2)) {
        var_e0be8bb269d1b3ee = level.br_level.var_540c681a924e2df2;
    }
    return var_e0be8bb269d1b3ee;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3999
// Size: 0xdb
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

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7d
// Size: 0xb9
function function_4ce70ef04544cb4c(origin, radius) {
    drones = [];
    if (isdefined(level.var_fc4bb27a820f54dd)) {
        radiussq = radius * radius;
        foreach (droneinstance in level.var_fc4bb27a820f54dd.var_cd2de8814a52f22c) {
            distsq = distance2dsquared(origin, droneinstance.origin);
            if (distsq < radiussq) {
                drones[drones.size] = droneinstance;
            }
        }
    }
    return drones;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3b3f
// Size: 0x49
function droptogroundmultitrace(origin, updist, downdist, contentsoverride, ignoreents) {
    result = function_3407d8cd152ddb10(origin, updist, downdist, contentsoverride, ignoreents);
    return result["position"];
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3b91
// Size: 0x43
function function_3cb43370cd3fc57c(origin, updist, downdist, contentsoverride, ignoreents) {
    result = function_3407d8cd152ddb10(origin, updist, downdist, contentsoverride, ignoreents);
    return result;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x3bdd
// Size: 0x2b9
function function_3407d8cd152ddb10(origin, updist, downdist, contentsoverride, ignoreents) {
    var_e0be8bb269d1b3ee = function_cc755ff7170d3dd0();
    var_1632bb04978fef4a = function_90312434b1550c4c();
    var_e25c6801a01f7fce = 5000;
    var_befd185e0007a7b8 = -18000 + var_e0be8bb269d1b3ee;
    var_e89346b6c5bfd043 = 15;
    if (!isdefined(updist)) {
        updist = getdvarint(@"hash_2a585c8e6dceac23", var_e25c6801a01f7fce);
    }
    if (!isdefined(downdist)) {
        downdist = getdvarint(@"hash_31f5cb462b87b556", var_befd185e0007a7b8);
    }
    low = getdvarint(@"hash_8408f03a735c0934", var_e0be8bb269d1b3ee);
    high = getdvarint(@"hash_fdc476e42fa40a6e", var_1632bb04978fef4a);
    contents = undefined;
    if (isdefined(contentsoverride)) {
        contents = contentsoverride;
    } else {
        contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1);
    }
    if (!isdefined(ignoreents)) {
        ignoreents = [];
    }
    leveldata = scripts\cp_mp\vehicles\vehicle_spawn::vehicle_spawn_getleveldata();
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
    result = raytraceoffset(origin, 0, 0, updist, downdist, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, var_e89346b6c5bfd043, 0, updist, downdist, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, 0, var_e89346b6c5bfd043, updist, downdist, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, -1 * var_e89346b6c5bfd043, 0, updist, downdist, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = raytraceoffset(origin, 0, -1 * var_e89346b6c5bfd043, updist, downdist, contents, ignoreents);
    if (traceresultisvalid(result, low)) {
        return result;
    }
    result = [];
    result["position"] = (origin[0], origin[1], high);
    result["fraction"] = 0;
    return result;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e9f
// Size: 0x2d
function traceresultisvalid(result, lowestz) {
    return result["fraction"] != 1 && result["position"][2] > lowestz;
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed5
// Size: 0x6b
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

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f48
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

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f93
// Size: 0x4a
function function_b7da95b3958a0ef0(flag, bool) {
    currentvalue = self getclientomnvar("br_archived_flags");
    if (istrue(bool)) {
        currentvalue |= flag;
    } else {
        currentvalue &= ~flag;
    }
    self setclientomnvar("br_archived_flags", currentvalue);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fe5
// Size: 0x15
function function_179a8d5a185dfb56(bool) {
    function_b7da95b3958a0ef0(1, bool);
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4002
// Size: 0x2f
function function_ac3376fecc550ef0(scriptablename) {
    if (!isdefined(scriptablename)) {
        return false;
    }
    return scriptablename == "brloot_offhand_binoculars" || scriptablename == "brloot_offhand_heartbeatsensor" || scriptablename == "brloot_offhand_geigercounter";
}

// Namespace br_public / scripts\mp\gametypes\br_public
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x403a
// Size: 0x14a
function kickplayersatcircleedge(var_bf2d8935024450a8) {
    if (!isdefined(var_bf2d8935024450a8)) {
        var_bf2d8935024450a8 = undefined;
    }
    level endon("game_ended");
    self endon("death");
    remainingdistance = distance2d(self.origin, self.pathstruct.endptui);
    remainingtime = remainingdistance / scripts\mp\gametypes\br_c130::getc130speed();
    if (isdefined(var_bf2d8935024450a8)) {
        earlytime = [[ var_bf2d8935024450a8 ]]();
    } else {
        var_2b9cbfdc00d0d9cb = hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_kick_player_time_before_circle_edge");
        earlytime = getdvarfloat(var_2b9cbfdc00d0d9cb, 1.1);
    }
    wait remainingtime - earlytime;
    foreach (player in level.players) {
        if (isdefined(player) && isdefined(player.br_infil_type) && player.br_infil_type == "c130" && !isdefined(player.jumptype)) {
            player.jumptype = "outOfBounds";
            player notify("halo_kick_c130");
        }
    }
}

