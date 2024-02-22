// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_74b851b7aa1ef32d;

#namespace concussion_grenade;

// Namespace concussion_grenade/namespace_bcc915524a9a5eba
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194
// Size: 0x42
function onfired(equipmentref, slot, objweapon) {
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_concussion", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace concussion_grenade/namespace_bcc915524a9a5eba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd
// Size: 0x1c9
function onexplode(owner, position) {
    if (!isdefined(owner) || !isdefined(position)) {
        return;
    }
    foreach (mine in level.mines) {
        if (!isdefined(mine.equipmentref) || mine.equipmentref != "equip_claymore") {
            continue;
        }
        if (!istrue(namespace_f8065cafc523dba5::playersareenemies(owner, mine.owner))) {
            continue;
        }
        if (isdefined(mine.bundle) && istrue(mine.bundle.var_756978364a723e66)) {
            mine thread namespace_8c5b266f689b1e0b::claymore_explode(owner);
        }
        if (distancesquared(position, mine.origin) < 262144) {
            if (isdefined(mine.bundle) && istrue(mine.bundle.var_756978364a723e66)) {
                mine thread namespace_8c5b266f689b1e0b::claymore_explode(owner);
            } else {
                mine thread namespace_8c5b266f689b1e0b::claymore_stunned(owner);
            }
        }
    }
    entities = getentarrayinradius(undefined, undefined, position, 512);
    foreach (guy in entities) {
        if (isagent(guy)) {
            guy notify("flashbang", guy.origin);
        }
    }
}

// Namespace concussion_grenade/namespace_bcc915524a9a5eba
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0x106
function onplayerdamaged(data) {
    victim = data.victim;
    attacker = data.attacker;
    point = data.point;
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    if (attacker == victim && distancesquared(point, victim.origin) > 65536) {
        return 0;
    }
    if (!isdefined(data.inflictor)) {
        return 0;
    }
    data.inflictor.bundle = namespace_1a507865f681850e::function_2113b6f7cb462692(data.inflictor.weapon_name);
    victim thread applyconcussion(data.inflictor, attacker);
    if (isplayer(attacker)) {
        attacker namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_concussion");
        attacker namespace_3c5a4254f2b957ea::incpersstat("stunHits", 1);
    }
    return 1;
}

// Namespace concussion_grenade/namespace_bcc915524a9a5eba
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bb
// Size: 0x27e
function applyconcussion(einflictor, eattacker) {
    if (isusingremote()) {
        return;
    }
    if (istrue(self.concussionimmune)) {
        return;
    }
    if (!val::get("stunned")) {
        return;
    }
    if (namespace_cd0b2d039510b38d::getgametype() == "arena" || namespace_36f464722d326bbe::isbrstylegametype() && eattacker namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        var_73dc87c72d7f6c03 = level.tacticaltimemod;
        var_636c8be8a25f3a8 = level.tacticaltimemod;
    } else {
        var_73dc87c72d7f6c03 = function_53c4c53197386572(einflictor.bundle.var_f2fb099c7b7b0a1f, 1.5);
        var_636c8be8a25f3a8 = function_53c4c53197386572(einflictor.bundle.var_c5a6a953a99cea74, 1.5);
    }
    var_8907f741f3a7b3f7 = self == eattacker;
    /#
        if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
            var_8907f741f3a7b3f7 = 0;
        }
    #/
    if (var_8907f741f3a7b3f7) {
        if (namespace_cd0b2d039510b38d::getgametype() == "arena" || namespace_36f464722d326bbe::isbrstylegametype() && eattacker namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            var_73dc87c72d7f6c03 = max(level.tacticaltimemod - 1, 0.5);
            var_636c8be8a25f3a8 = max(level.tacticaltimemod - 1, 0.5);
        } else {
            var_73dc87c72d7f6c03 = function_53c4c53197386572(einflictor.bundle.var_c57f50a067e13927, 2);
            var_636c8be8a25f3a8 = function_53c4c53197386572(einflictor.bundle.var_ff2db6bba9101658, 2);
        }
    }
    scale = 1 - distance(self.origin, einflictor.origin) / 512;
    if (scale < 0) {
        scale = 0;
    }
    if (namespace_cd0b2d039510b38d::getgametype() == "arena") {
        time = var_73dc87c72d7f6c03;
    } else {
        time = var_73dc87c72d7f6c03 + var_636c8be8a25f3a8 * scale;
    }
    time = namespace_282db5a41b643e19::applystunresistence(eattacker, self, time);
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_concussion", eattacker, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
    thread namespace_e8a49b70d0769b66::trackdebuffassistfortime(eattacker, self, "concussion_grenade_mp", time);
    eattacker notify("stun_hit");
    self notify("concussed", eattacker);
    utility::setplayerstunned();
    thread namespace_d325722f2754c2c4::cleanupconcussionstun(time);
    _shellshock("concussion_grenade_mp", "stun", time, 1);
    codcastersetplayerstatuseffect("stun", time);
    if (!var_8907f741f3a7b3f7) {
        eattacker namespace_a850435086c88de3::doonactionscoreevent(0, "concussionGrenadeHit");
    }
}

