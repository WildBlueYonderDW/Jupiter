#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_74b851b7aa1ef32d;

#namespace concussion_grenade;

// Namespace concussion_grenade / scripts\mp\equipment\concussion_grenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x247
// Size: 0x41
function onfired(equipmentref, slot, objweapon) {
    scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_concussion", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace concussion_grenade / scripts\mp\equipment\concussion_grenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x290
// Size: 0x21f
function onexplode(owner, position) {
    if (!isdefined(owner) || !isdefined(position)) {
        return;
    }
    foreach (mine in level.mines) {
        if (!isdefined(mine.equipmentref) || mine.equipmentref != "equip_claymore") {
            continue;
        }
        if (!istrue(scripts\cp_mp\utility\player_utility::playersareenemies(owner, mine.owner))) {
            continue;
        }
        if (isdefined(mine.bundle) && istrue(mine.bundle.var_756978364a723e66)) {
            mine thread scripts\mp\equipment\claymore::claymore_explode(owner);
        }
        if (distancesquared(position, mine.origin) < 262144) {
            if (isdefined(mine.bundle) && istrue(mine.bundle.var_756978364a723e66)) {
                mine thread scripts\mp\equipment\claymore::claymore_explode(owner);
                continue;
            }
            mine thread scripts\mp\equipment\claymore::claymore_stunned(owner);
        }
    }
    gametype = scripts\mp\utility\game::getgametype();
    entities = getentarrayinradius(undefined, undefined, position, 512);
    foreach (guy in entities) {
        if (isagent(guy)) {
            guy notify("flashbang", guy.origin, 1, 1, owner, "axis");
            if (isdefined(guy.unittype)) {
                if (guy.unittype == "zombie") {
                    if (gametype == "koth_horde" || gametype == "br") {
                        guy utility::function_f3bb4f4911a1beb2("zombie", "stunZombie", 5);
                    }
                }
            }
        }
    }
}

// Namespace concussion_grenade / scripts\mp\equipment\concussion_grenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7
// Size: 0x104
function onplayerdamaged(data) {
    victim = data.victim;
    attacker = data.attacker;
    point = data.point;
    if (data.meansofdeath == "MOD_IMPACT") {
        return true;
    }
    if (attacker == victim && distancesquared(point, victim.origin) > 65536) {
        return false;
    }
    if (!isdefined(data.inflictor)) {
        return false;
    }
    data.inflictor.bundle = scripts\mp\equipment::function_2113b6f7cb462692(data.inflictor.weapon_name);
    victim thread applyconcussion(data.inflictor, attacker);
    if (isplayer(attacker)) {
        attacker scripts\mp\damage::combatrecordtacticalstat("equip_concussion");
        attacker scripts\mp\utility\stats::incpersstat("stunHits", 1);
    }
    return true;
}

// Namespace concussion_grenade / scripts\mp\equipment\concussion_grenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c4
// Size: 0x2a0
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
    if (scripts\mp\utility\game::getgametype() == "arena" || scripts\cp_mp\utility\game_utility::isbrstylegametype() && eattacker scripts\mp\gametypes\br_public::isplayeringulag()) {
        var_73dc87c72d7f6c03 = level.tacticaltimemod;
        var_636c8be8a25f3a8 = level.tacticaltimemod;
    } else {
        var_73dc87c72d7f6c03 = default_to(einflictor.bundle.var_f2fb099c7b7b0a1f, 1.5);
        var_636c8be8a25f3a8 = default_to(einflictor.bundle.var_c5a6a953a99cea74, 1.5);
    }
    var_8907f741f3a7b3f7 = self == eattacker;
    /#
        if (getdvarint(@"hash_6c7fd12a611ca1e8", 0) == 1) {
            var_8907f741f3a7b3f7 = 0;
        }
    #/
    if (var_8907f741f3a7b3f7) {
        if (scripts\mp\utility\game::getgametype() == "arena" || scripts\cp_mp\utility\game_utility::isbrstylegametype() && eattacker scripts\mp\gametypes\br_public::isplayeringulag()) {
            var_73dc87c72d7f6c03 = max(level.tacticaltimemod - 1, 0.5);
            var_636c8be8a25f3a8 = max(level.tacticaltimemod - 1, 0.5);
        } else {
            var_73dc87c72d7f6c03 = default_to(einflictor.bundle.var_c57f50a067e13927, 2);
            var_636c8be8a25f3a8 = default_to(einflictor.bundle.var_ff2db6bba9101658, 2);
        }
    }
    scale = 1 - distance(self.origin, einflictor.origin) / 512;
    if (scale < 0) {
        scale = 0;
    }
    if (scripts\mp\utility\game::getgametype() == "arena") {
        time = var_73dc87c72d7f6c03;
    } else {
        time = var_73dc87c72d7f6c03 + var_636c8be8a25f3a8 * scale;
    }
    time = scripts\mp\perks\perkfunctions::applystunresistence(eattacker, self, time);
    scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_concussion", eattacker, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
    thread scripts\mp\gamescore::trackdebuffassistfortime(eattacker, self, "concussion_grenade_mp", time);
    eattacker notify("stun_hit");
    self notify("concussed", eattacker);
    utility::setplayerstunned();
    thread scripts\cp_mp\utility\weapon_utility::cleanupconcussionstun(time);
    if (_hasperk("specialty_tac_mask")) {
        _shellshock("concussion_grenade_tac_mask_mp", "stun", time, 1);
    } else {
        thread _shellshock("concussion_grenade_mp", "stun", time, 1);
    }
    codcastersetplayerstatuseffect("stun", time);
    if (!var_8907f741f3a7b3f7) {
        eattacker namespace_a850435086c88de3::doonactionscoreevent(0, "concussionGrenadeHit");
    }
}

