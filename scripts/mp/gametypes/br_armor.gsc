// mwiii decomp prototype
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\equipment\armor_plate.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_7c40fa80892a721;

#namespace br_armor;

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18e
// Size: 0x25
function main() {
    /#
        setdvarifuninitialized(@"hash_6f491f10c40cf0a9", -1);
    #/
    level.onhelmetsniped = &onhelmetsniped;
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba
// Size: 0x3d
function initarmor() {
    self.br_armorhealth = 0;
    self.br_maxarmorhealth = function_f5fad893f2305590();
    self setclientomnvar("ui_armor_percent", 0);
    namespace_53700d7451202c81::br_armor_plate_amount_equipped_set(0);
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&brdpadcallback);
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x18
function function_f5fad893f2305590() {
    if (istrue(level.var_75c3b6e138fd717c)) {
        return 200;
    }
    return 150;
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e
// Size: 0x30
function brdpadcallback(notification, var_e1d097c517c3af5b) {
    if (isdefined(notification) && notification == "try_use_heal_slot") {
        var_57d8f859dc2dd35d = var_e1d097c517c3af5b;
    }
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x255
// Size: 0x9f
function getoldarmorent(var_b66c691c7efb8a01) {
    pickup = spawnstruct();
    pickup.count = 1;
    pickup.maxcount = 1;
    pickup.stackable = 1;
    if (namespace_d3d40f75bb4e4c32::ishelmet(var_b66c691c7efb8a01.scriptablename)) {
        goto LOC_0000009c;
    }
    if (namespace_cb965d2f71fefddc::isgasmask(var_b66c691c7efb8a01.scriptablename)) {
        pickup.gasmaskhealth = self.gasmaskhealth;
    } else {
        pickup.armorhealth = self.br_armorhealth;
    LOC_0000009c:
    }
LOC_0000009c:
    return pickup;
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0x4c
function helmetitemtypeforlevel(var_9fb8a8ee3a677cea) {
    switch (var_9fb8a8ee3a677cea) {
    case 1:
        return "brloot_armor_helmet_1";
    case 2:
        return "brloot_armor_helmet_2";
    case 3:
        return "brloot_armor_helmet_3";
        break;
    }
    return undefined;
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x350
// Size: 0x6a
function givestartingarmor(var_25d647af59249079) {
    if (isdefined(var_25d647af59249079)) {
        var_9a5097fe8a19dcfd = var_25d647af59249079;
    } else {
        var_9a5097fe8a19dcfd = 100;
    }
    if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
        var_9a5097fe8a19dcfd = function_f5fad893f2305590();
    }
    var_4fb4b206a997692d = getdvarint(@"hash_6f491f10c40cf0a9", -1);
    if (var_4fb4b206a997692d >= 0) {
        var_9a5097fe8a19dcfd = var_4fb4b206a997692d;
    }
    givearmorvalue(var_9a5097fe8a19dcfd);
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c1
// Size: 0x6e
function givearmorvalue(value) {
    if (!isdefined(value) || value < 0) {
        return;
    }
    self.br_armorhealth = value;
    self.br_maxarmorhealth = function_f5fad893f2305590();
    armorpercent = self.br_armorhealth / self.br_maxarmorhealth;
    self setclientomnvar("ui_armor_percent", armorpercent);
    namespace_53700d7451202c81::br_armor_plate_amount_equipped_set(self.br_armorhealth);
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x436
// Size: 0x63
function takehelmet(var_73b1997698ae0deb, var_9fb8a8ee3a677cea) {
    self.br_helmetlevel = var_9fb8a8ee3a677cea;
    row = level.br_pickups.br_itemrow[var_73b1997698ae0deb.scriptablename];
    if (self.br_helmetlevel == 3) {
        namespace_82dcd1d5ae30ff7::giveperk("specialty_stun_resistance");
    }
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a0
// Size: 0x15
function breakarmor() {
    namespace_f8d3520d3483c1::damagearmor(self.br_armorhealth, 1);
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc
// Size: 0x6f
function isarmorbetterthanequipped(var_dbd090cc010cd89b) {
    var_9fb8a8ee3a677cea = 0;
    if (var_dbd090cc010cd89b == "equip_helmet_1") {
        var_9fb8a8ee3a677cea = 1;
    } else if (var_dbd090cc010cd89b == "equip_helmet_2") {
        var_9fb8a8ee3a677cea = 2;
    } else if (var_dbd090cc010cd89b == "equip_helmet_3") {
        var_9fb8a8ee3a677cea = 3;
    }
    if (var_9fb8a8ee3a677cea > 0) {
        if (!isdefined(self.br_helmetlevel) || self.br_helmetlevel < var_9fb8a8ee3a677cea) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533
// Size: 0x208
function popoffhelmet(var_483b72bbc1109ab2, playerangles, playerorigin) {
    level endon("game_ended");
    var_332f92d26f25d2bc = self gettagorigin("j_helmet");
    if (!isdefined(var_332f92d26f25d2bc)) {
        var_332f92d26f25d2bc = playerorigin + (0, 0, 80);
    }
    helmet = spawn("script_model", self gettagorigin("j_helmet"));
    helmet setmodel("loot_helmet");
    helmet.angles = playerangles;
    up = anglestoup(playerangles);
    forward = var_483b72bbc1109ab2;
    vel = vectornormalize(forward + up) * 2500;
    helmet physicslaunchserver(helmet.origin, vel);
    var_73b1997698ae0deb = "brloot_armor_helmet_" + self.br_helmetlevel;
    var_29511a1c049e1067 = 15;
    var_f246e6dc812fbcfe = 0.1;
    var_29511a1c049e1067 = var_29511a1c049e1067 * 1 / var_f246e6dc812fbcfe;
    previousorigin = helmet.origin;
    for (i = 0; i < var_29511a1c049e1067; i++) {
        wait(var_f246e6dc812fbcfe);
        var_76a2ea10ccbc4c62 = previousorigin - helmet.origin;
        if (var_76a2ea10ccbc4c62[0] < 2 && var_76a2ea10ccbc4c62[1] < 2 && var_76a2ea10ccbc4c62[2] < 2 && var_76a2ea10ccbc4c62[0] > -2 && var_76a2ea10ccbc4c62[1] > -2 && var_76a2ea10ccbc4c62[2] > -2) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(helmet.origin, helmet.angles);
            helmet delete();
            pickupent = namespace_cb965d2f71fefddc::spawnpickup(var_73b1997698ae0deb, var_cb4fad49263e20c4);
            pickupent.count = 1;
            return;
        }
        previousorigin = helmet.origin;
    }
    helmet delete();
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x742
// Size: 0x39
function onhelmetsniped(victim, var_483b72bbc1109ab2) {
    if (isdefined(victim)) {
        victim thread popoffhelmet(var_483b72bbc1109ab2, victim.angles, victim.origin);
    }
}

// Namespace br_armor/namespace_961ccdbc9a5d4c1e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x782
// Size: 0x35
function function_bcb1d5fb674fa3a0() {
    if (isdefined(self.armorhealth)) {
        armorpercent = self.armorhealth / function_f5fad893f2305590();
        namespace_b919c4be206d3c80::function_f8b808cd6473e6cc(18, armorpercent);
    }
}

