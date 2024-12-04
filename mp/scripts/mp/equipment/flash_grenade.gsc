#using script_189b67b2735b981d;
#using script_5762ac2f22202ba2;
#using script_74b851b7aa1ef32d;
#using scripts\common\ae_utility;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\challenges;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\engine\utility;
#using scripts\mp\damage;
#using scripts\mp\equipment;
#using scripts\mp\equipment\flash_grenade;
#using scripts\mp\gamescore;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\perks\perks;
#using scripts\mp\utility\game;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\script;
#using scripts\mp\utility\stats;

#namespace flash_grenade;

// Namespace flash_grenade / scripts\mp\equipment\flash_grenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24d
// Size: 0x41
function onfired(equipmentref, slot, objweapon) {
    scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_flash", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace flash_grenade / scripts\mp\equipment\flash_grenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x6cf
function onplayerdamaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    data.bundle = scripts\mp\equipment::function_2113b6f7cb462692(data.inflictor.weapon_name);
    if (!isdefined(data.bundle)) {
        weaponname = getcompleteweaponname(data.objweapon);
        data.bundle = scripts\mp\equipment::function_2113b6f7cb462692(weaponname);
    }
    weight = 0;
    distsqr = undefined;
    dist = undefined;
    hasresist = undefined;
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
        if (scripts\cp_mp\utility\player_utility::playersareenemies(data.attacker, data.victim)) {
            data.victim scripts\cp_mp\challenges::resistedstun(data.attacker);
        }
        if (data.victim _hasperk("specialty_tac_mask")) {
            data.victim scripts\mp\perks\perks::activatePerk("specialty_tac_mask");
        } else {
            data.victim scripts\mp\perks\perks::activatePerk("specialty_tac_resist");
        }
        hasresist = 1;
    }
    dist = clamp(dist, 0, 540);
    distratio = 1 - (dist - 0) / 540;
    weight += floor(distratio * 65);
    if (scripts\engine\utility::within_fov(data.victim.origin, data.victim getplayerangles(), data.point, 0.5)) {
        weight += 35;
    }
    if (!scripts\cp_mp\utility\player_utility::playersareenemies(data.attacker, data.victim)) {
        if (!istrue(var_6d39eba1d284ebf4)) {
            if (data.attacker == data.victim) {
                weight += -30;
            } else {
                weight += -30;
            }
        }
    }
    weight = max(0, weight);
    weightratio = weight / 100;
    minduration = default_to(data.bundle.var_2c74f60c630718a3, 2.25);
    maxduration = default_to(data.bundle.var_bd11a6ec2cacbbcd, 3.75);
    if (istrue(hasresist)) {
        minduration = default_to(data.bundle.var_e6232deeb117097c, 1.5);
        maxduration = default_to(data.bundle.var_5e11cb9806623c4a, 3);
    }
    duration = minduration + (maxduration - minduration) * weightratio;
    if (istrue(data.bundle.var_bd8810d69c092f69)) {
        durationindex = 0;
        var_12fcb9fd7d26790a = [];
        var_12fcb9fd7d26790a[0] = default_to(data.bundle.var_4b5f9228a0619ab4, 4);
        var_12fcb9fd7d26790a[1] = default_to(data.bundle.var_96442f19ad927967, 2.35);
        var_12fcb9fd7d26790a[2] = default_to(data.bundle.var_4eeeec6c59f1b6fe, 0.45);
        var_a080d7a98bb2721f = [];
        var_a080d7a98bb2721f[0] = default_to(data.bundle.var_527a477fda1e62a7, 3);
        var_a080d7a98bb2721f[1] = default_to(data.bundle.var_9f8b03d78dc15d2e, 1.75);
        var_a080d7a98bb2721f[2] = default_to(data.bundle.var_c3066719979a1f0d, 0.3);
        victimeyepos = data.victim geteye();
        if (distancesquared(victimeyepos, data.point) < squared(default_to(data.bundle.var_3a1fc2cb6668e36c), 75)) {
            durationindex = 0;
        } else {
            var_8033091e81a55105 = vectornormalize(data.point - victimeyepos);
            forward = anglestoforward(data.victim getplayerangles());
            dot = vectordot(forward, var_8033091e81a55105);
            if (dot >= 0.5) {
                durationindex = 0;
            } else if (dot >= -0.259) {
                durationindex = 1;
            } else {
                durationindex = 2;
            }
        }
        if (istrue(hasresist)) {
            duration = var_a080d7a98bb2721f[durationindex];
        } else {
            duration = var_12fcb9fd7d26790a[durationindex];
        }
    }
    /#
        dvarstr = getdvar(@"hash_d206f268f04a78a3", "<dev string:x1c>");
        if (dvarstr != "<dev string:x1c>") {
            if (dvarstr == "<dev string:x20>") {
                duration = 3;
            } else if (dvarstr == "<dev string:x2a>") {
                duration = minduration;
            } else if (dvarstr == "<dev string:x31>") {
                duration = maxduration;
            } else {
                duration = scripts\mp\utility\script::stringtofloat(dvarstr);
                duration = clamp(duration, minduration, maxduration);
            }
        }
    #/
    data.victim thread applyflash(data.attacker, duration);
    if (isplayer(data.attacker)) {
        data.attacker scripts\mp\damage::combatrecordtacticalstat("equip_flash");
        data.attacker scripts\mp\utility\stats::incpersstat("flashbangHits", 1);
    }
    return 1;
}

// Namespace flash_grenade / scripts\mp\equipment\flash_grenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96e
// Size: 0x187
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
    if (scripts\mp\utility\game::getgametype() == "arena" || scripts\cp_mp\utility\game_utility::isbrstylegametype() && attacker scripts\mp\gametypes\br_public::isplayeringulag()) {
        duration = min(ter_op(level.tacticaltimemod <= 3, level.tacticaltimemod + 1.5, level.tacticaltimemod), duration);
    }
    scripts\mp\equipment\flash_grenade::clearflash();
    self endon("applyFlash");
    if (!istrue(self.flashbanged)) {
        self.flashbanged = 1;
        if (!self usingtouch()) {
            utility::hidehudenable();
        }
    }
    _shellshock("flash_grenade_mp", "flash", duration, 1);
    codcastersetplayerstatuseffect("flash", duration);
    if (scripts\cp_mp\utility\player_utility::playersareenemies(self, attacker)) {
        scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_flash", attacker, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
        thread scripts\mp\gamescore::trackdebuffassistfortime(attacker, self, "flash_grenade_mp", duration);
    }
    if (scripts\mp\utility\game::getgametype() == "arena") {
        duration = max(0, duration);
    } else {
        duration = max(0, duration - 0.5);
    }
    scripts\engine\utility::waittill_notify_or_timeout("death", duration);
    thread clearflash(!isreallyalive(self));
}

// Namespace flash_grenade / scripts\mp\equipment\flash_grenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafd
// Size: 0x3f
function clearflash(fromdeath) {
    self notify("applyFlash");
    if (istrue(self.flashbanged)) {
        if (!istrue(fromdeath)) {
            if (!self usingtouch()) {
                utility::hidehuddisable();
            }
        }
    }
    self.flashbanged = undefined;
}

// Namespace flash_grenade / scripts\mp\equipment\flash_grenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb44
// Size: 0x1c
function calculateinterruptdelay(duration) {
    return max(0, duration - 1.5) * 1000;
}

