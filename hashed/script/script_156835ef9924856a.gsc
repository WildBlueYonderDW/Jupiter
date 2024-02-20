// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_1186371447c87818;

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4
// Size: 0x4f
function function_80b2d6867c192094() {
    val::function_2d6e7e0b80767910("iodineUse", [0:"usability", 1:"killstreaks", 2:"supers", 3:"gesture", 4:"weapon_switch", 5:"melee", 6:"armor"]);
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a
// Size: 0x27
function function_43fe8ccc8b4e6146(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    if (equipmentref != "equip_iodine_pills") {
        return;
    }
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x278
// Size: 0x1f
function function_d41fe283435e26c4(equipmentref, var_cbb2b3d05e48bd27) {
    if (equipmentref != "equip_iodine_pills") {
        return;
    }
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e
// Size: 0x39
function function_7430b01f931d7e4e(grenade, var_102a3f5a4d33c2db) {
    var_e65a457f9ea02ade = undefined;
    if (!isdefined(grenade)) {
        var_e65a457f9ea02ade = 0;
    } else {
        var_e65a457f9ea02ade = 1;
    }
    thread function_9c89631481683dd2(var_e65a457f9ea02ade, var_102a3f5a4d33c2db);
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0xd1
function function_9c89631481683dd2(var_e65a457f9ea02ade, var_102a3f5a4d33c2db) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (!function_bef9c19cb3be47ef()) {
        return;
    }
    if (!istrue(var_e65a457f9ea02ade)) {
        if (isdefined(var_102a3f5a4d33c2db)) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_102a3f5a4d33c2db.scriptablename);
            namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid, 1);
        }
        thread function_bbfe4eae6d4cdb6f();
        weaponobj = makeweapon("iodine_pills_mp");
        self giveandfireoffhand(weaponobj);
        objweapon = grenade = self waittill("grenade_fire");
    }
    var_8a7b4dc1a58fc045 = 0;
    if (function_3abd8504e2419fce(self)) {
        var_8a7b4dc1a58fc045 = 1;
    } else {
        self.var_d7f035d45152b8f5 = 1;
    }
    thread function_bc28931a036b205(var_8a7b4dc1a58fc045);
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6
// Size: 0xae
function function_bef9c19cb3be47ef() {
    if (istrue(namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self))) {
        return 0;
    }
    if (namespace_448ccf1ca136fbbe::isusingremote()) {
        return 0;
    }
    if (istrue(self.insertingarmorplate)) {
        return 0;
    }
    if (self isswitchingweapon() || isanymonitoredweaponswitchinprogress()) {
        return 0;
    }
    if (self isinfreefall() || self isparachuting()) {
        return 0;
    }
    if (self isreloading() || self ismantling() || self isthrowinggrenade() || self israisingweapon() || self ismeleeing() || self isgestureplaying()) {
        return 0;
    }
    if (self islinked()) {
        return 0;
    }
    if (!val::get("offhand_weapons")) {
        return 0;
    }
    return 1;
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46c
// Size: 0x3e
function function_bbfe4eae6d4cdb6f() {
    self endon("disconnect");
    val::function_3633b947164be4f3("iodineUse", 0);
    waittill_any_4("grenade_fire", "death", "last_stand_start", "enter_live_ragdoll");
    val::function_588f2307a3040610("iodineUse");
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b1
// Size: 0x18
function function_7214173379da1591(grenade) {
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d0
// Size: 0xf8
function function_bc28931a036b205(var_8a7b4dc1a58fc045) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("iodinePills_duration");
    self endon("iodinePills_duration");
    var_a801bc06b34b53d8 = 120;
    if (istrue(var_8a7b4dc1a58fc045)) {
        if (isdefined(self.var_a92738e0c1337805)) {
            var_489b2f6c93e7464b = self.var_a92738e0c1337805;
            var_d9c0575cf0093a35 = var_a801bc06b34b53d8 + var_489b2f6c93e7464b;
            var_a801bc06b34b53d8 = min(var_d9c0575cf0093a35, 240);
            /#
                iprintlnbold("<unknown string>" + var_a801bc06b34b53d8);
            #/
        }
    }
    while (var_a801bc06b34b53d8 > 0) {
        if (!isalive(self)) {
            break;
        }
        self setclientomnvar("ui_iodine_pills", int(ceil(var_a801bc06b34b53d8)));
        self.var_a92738e0c1337805 = var_a801bc06b34b53d8;
        var_a801bc06b34b53d8 = var_a801bc06b34b53d8 - 0.05;
        wait(0.05);
    }
    self setclientomnvar("ui_iodine_pills", 0);
    self.var_d7f035d45152b8f5 = undefined;
    self.var_ba4ca459c2788f09 = undefined;
    /#
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf
// Size: 0xcc
function function_ac74ff0686d2886e(damage) {
    if (isdefined(self.var_ba4ca459c2788f09)) {
        var_7e537db4f2a171ef = self.var_ba4ca459c2788f09 + 2000;
        if (gettime() < var_7e537db4f2a171ef) {
            return 0;
        }
    }
    player = self;
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        damage = namespace_cf880efca02c6010::modifybrgasdamage(damage);
    }
    damage = max(1, int(damage * 0.5));
    self.var_ba4ca459c2788f09 = gettime();
    if (namespace_9c6cddd872ad75f7::hasgasmask(player)) {
        return damage;
    } else {
        player dodamage(damage, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
        player namespace_f8d3520d3483c1::damagearmor(damage);
        player thread namespace_c5622898120e827f::tryplaycoughaudio(randomintrange(7000, 10000));
        return damage;
    }
}

// Namespace namespace_1186371447c87818/namespace_4033b03dc100de62
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a2
// Size: 0x18
function function_3abd8504e2419fce(player) {
    return istrue(player.var_d7f035d45152b8f5);
}

