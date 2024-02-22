// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_74b851b7aa1ef32d;
#using script_189b67b2735b981d;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\mp\gamescore.gsc;

#namespace flash_grenade;

// Namespace flash_grenade/namespace_5e840d01a2244aea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0x42
function onfired(equipmentref, slot, objweapon) {
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_flash", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace flash_grenade/namespace_5e840d01a2244aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243
// Size: 0x6e1
function onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    data.bundle = namespace_1a507865f681850e::function_2113b6f7cb462692(data.inflictor.weapon_name);
    if (!isdefined(data.bundle)) {
        weaponname = getcompleteweaponname(data.objweapon);
        data.bundle = namespace_1a507865f681850e::function_2113b6f7cb462692(weaponname);
    }
    weight = 0;
    distsqr = undefined;
    dist = undefined;
    var_c284f94b9d9a04ed = undefined;
    var_6d39eba1d284ebf4 = undefined;
    /#
        if (getdvarint(@"hash_6c7fd12a611ca1e8") == 1) {
            var_6d39eba1d284ebf4 = 1;
        }
    #/
    if (data.attacker == data.victim && !istrue(var_6d39eba1d284ebf4)) {
        distsqr = distancesquared(data.victim.origin, data.point);
        if (distsqr > 65536) {
            return 0;
        } else if (distsqr <= 0) {
            dist = 0;
        } else {
            dist = sqrt(distsqr);
        }
    } else {
        dist = distance(data.victim.origin, data.point);
    }
    if (!val::get("flashed")) {
        return;
    }
    if (data.victim _hasperk("specialty_stun_resistance") && (data.attacker != data.victim || getdvarint(@"hash_e5a558aeef05491e", 1))) {
        data.attacker updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
        if (namespace_f8065cafc523dba5::playersareenemies(data.attacker, data.victim)) {
            data.victim namespace_aad14af462a74d08::resistedstun(data.attacker);
        }
        if (data.victim _hasperk("specialty_tac_mask")) {
            data.victim namespace_b6a8027f477010e1::activateperk("specialty_tac_mask");
        } else {
            data.victim namespace_b6a8027f477010e1::activateperk("specialty_tac_resist");
        }
        var_c284f94b9d9a04ed = 1;
    }
    dist = clamp(dist, 0, 540);
    var_ae3412f7b9b48d44 = 1 - (dist - 0) / 540;
    weight = weight + floor(var_ae3412f7b9b48d44 * 65);
    if (namespace_3c37cb17ade254d::within_fov(data.victim.origin, data.victim getplayerangles(), data.point, 0.5)) {
        weight = weight + 35;
    }
    if (!namespace_f8065cafc523dba5::playersareenemies(data.attacker, data.victim)) {
        if (!istrue(var_6d39eba1d284ebf4)) {
            if (data.attacker == data.victim) {
                weight = weight + -30;
            } else {
                weight = weight + -30;
            }
        }
    }
    weight = max(0, weight);
    var_453227e7b36f0b24 = weight / 100;
    var_5f651e1139ef776f = function_53c4c53197386572(data.bundle.var_2c74f60c630718a3, 2.25);
    maxduration = function_53c4c53197386572(data.bundle.var_bd11a6ec2cacbbcd, 3.75);
    if (istrue(var_c284f94b9d9a04ed)) {
        var_5f651e1139ef776f = function_53c4c53197386572(data.bundle.var_e6232deeb117097c, 1.5);
        maxduration = function_53c4c53197386572(data.bundle.var_5e11cb9806623c4a, 3);
    }
    duration = var_5f651e1139ef776f + (maxduration - var_5f651e1139ef776f) * var_453227e7b36f0b24;
    if (istrue(data.bundle.var_bd8810d69c092f69)) {
        var_98caf6bc51559017 = 0;
        var_12fcb9fd7d26790a = [];
        var_12fcb9fd7d26790a[0] = function_53c4c53197386572(data.bundle.var_4b5f9228a0619ab4, 4);
        var_12fcb9fd7d26790a[1] = function_53c4c53197386572(data.bundle.var_96442f19ad927967, 2.35);
        var_12fcb9fd7d26790a[2] = function_53c4c53197386572(data.bundle.var_4eeeec6c59f1b6fe, 0.45);
        var_a080d7a98bb2721f = [];
        var_a080d7a98bb2721f[0] = function_53c4c53197386572(data.bundle.var_527a477fda1e62a7, 3);
        var_a080d7a98bb2721f[1] = function_53c4c53197386572(data.bundle.var_9f8b03d78dc15d2e, 1.75);
        var_a080d7a98bb2721f[2] = function_53c4c53197386572(data.bundle.var_c3066719979a1f0d, 0.3);
        var_aed6a200c4dfe0c = data.victim geteye();
        if (distancesquared(var_aed6a200c4dfe0c, data.point) < squared(function_53c4c53197386572(data.bundle.var_3a1fc2cb6668e36c), 75)) {
            var_98caf6bc51559017 = 0;
        } else {
            var_8033091e81a55105 = vectornormalize(data.point - var_aed6a200c4dfe0c);
            forward = anglestoforward(data.victim getplayerangles());
            dot = vectordot(forward, var_8033091e81a55105);
            if (dot >= 0.5) {
                var_98caf6bc51559017 = 0;
            } else if (dot >= -0.259) {
                var_98caf6bc51559017 = 1;
            } else {
                var_98caf6bc51559017 = 2;
            }
        }
        if (istrue(var_c284f94b9d9a04ed)) {
            duration = var_a080d7a98bb2721f[var_98caf6bc51559017];
        } else {
            duration = var_12fcb9fd7d26790a[var_98caf6bc51559017];
        }
    }
    /#
        dvarstr = getdvar(@"hash_d206f268f04a78a3", "<unknown string>");
        if (dvarstr != "<unknown string>") {
            if (dvarstr == "<unknown string>") {
                duration = 3;
            } else if (dvarstr == "<unknown string>") {
                duration = var_5f651e1139ef776f;
            } else if (dvarstr == "<unknown string>") {
                duration = maxduration;
            } else {
                duration = namespace_9c840bb9f2ecbf00::stringtofloat(dvarstr);
                duration = clamp(duration, var_5f651e1139ef776f, maxduration);
            }
        }
    #/
    data.victim thread applyflash(data.attacker, duration);
    if (isplayer(data.attacker)) {
        data.attacker namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_flash");
        data.attacker namespace_3c5a4254f2b957ea::incpersstat("flashbangHits", 1);
    }
    return 1;
}

// Namespace flash_grenade/namespace_5e840d01a2244aea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92c
// Size: 0x188
function applyflash(attacker, duration) {
    self endon("disconnect");
    if (isusingremote()) {
        return;
    }
    if (attacker != self) {
        attacker namespace_a850435086c88de3::doonactionscoreevent(0, "flashGrenadeHit");
    }
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "player_blinded");
    namespace_27c74152ccb91331::function_55b08d6d71b41402(attacker, "enemy_blinded");
    if (namespace_cd0b2d039510b38d::getgametype() == "arena" || namespace_36f464722d326bbe::isbrstylegametype() && attacker namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        duration = min(ter_op(level.tacticaltimemod <= 3, level.tacticaltimemod + 1.5, level.tacticaltimemod), duration);
    }
    namespace_5e840d01a2244aea::clearflash();
    self endon("applyFlash");
    if (!istrue(self.flashbanged)) {
        self.flashbanged = 1;
        if (!self function_c6cb3e654225077a()) {
            utility::hidehudenable();
        }
    }
    _shellshock("flash_grenade_mp", "flash", duration, 1);
    codcastersetplayerstatuseffect("flash", duration);
    if (namespace_f8065cafc523dba5::playersareenemies(self, attacker)) {
        namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_flash", attacker, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
        thread namespace_e8a49b70d0769b66::trackdebuffassistfortime(attacker, self, "flash_grenade_mp", duration);
    }
    if (namespace_cd0b2d039510b38d::getgametype() == "arena") {
        duration = max(0, duration);
    } else {
        duration = max(0, duration - 0.5);
    }
    namespace_3c37cb17ade254d::waittill_notify_or_timeout("death", duration);
    thread clearflash(!isreallyalive(self));
}

// Namespace flash_grenade/namespace_5e840d01a2244aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x40
function clearflash(var_fcef8d217a441961) {
    self notify("applyFlash");
    if (istrue(self.flashbanged)) {
        if (!istrue(var_fcef8d217a441961)) {
            if (!self function_c6cb3e654225077a()) {
                utility::hidehuddisable();
            }
        }
    }
    self.flashbanged = undefined;
}

// Namespace flash_grenade/namespace_5e840d01a2244aea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb02
// Size: 0x1d
function calculateinterruptdelay(duration) {
    return max(0, duration - 1.5) * 1000;
}

