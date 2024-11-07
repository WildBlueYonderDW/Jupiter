#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_66122a002aff5d57;
#using script_74502a9e0ef1f19c;
#using scripts\cp\cp_player_battlechatter.gsc;
#using scripts\cp\cp_loadout.gsc;
#using script_7ef95bba57dc4b82;
#using script_1db8d0e02a99c5e2;
#using scripts\cp\utility.gsc;
#using scripts\cp\cp_achievement.gsc;
#using script_35de402efc5acfb3;
#using scripts\cp\coop_stealth.gsc;

#namespace namespace_4129658e5be98777;

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30c
// Size: 0xb2
function init() {
    scripts\engine\utility::registersharedfunc("tripwire", "init", &function_fd2cc3a566c5a280);
    scripts\engine\utility::registersharedfunc("tripwire", "createHintObject", &tripwire_createhintobject);
    scripts\engine\utility::registersharedfunc("tripwire", "canTripTrap", &tripwire_cantriptrap);
    scripts\engine\utility::registersharedfunc("tripwire", "damageFunc", &tripwire_damagefunc);
    scripts\engine\utility::registersharedfunc("tripwire", "disarmGiveWeapon", &tripwire_disarmgiveweapon);
    scripts\engine\utility::registersharedfunc("tripwire", "blowTripWire", &tripwire_trackachievementboom);
    scripts\engine\utility::registersharedfunc("tripwire", "createLootDropInfo", &createLootDropInfo);
    scripts\engine\utility::registersharedfunc("tripwire", "spawnPickup", &namespace_6250b14b3f614101::spawnpickup);
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c6
// Size: 0x1c
function function_fd2cc3a566c5a280() {
    setdvar(@"hash_492741ff5b4afd4a", 1);
    level thread function_c119a25a61ffcb35();
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x3ea
// Size: 0x20f
function tripwire_createhintobject(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    use_model = spawn("script_model", hintpos);
    use_model setmodel("tag_origin");
    use_model.angles = (0, 0, 0);
    use_model makeusable();
    if (isdefined(duration)) {
        use_model setuseholdduration(duration);
    } else {
        use_model setuseholdduration("duration_medium");
    }
    if (!isdefined(duration) || duration == "duration_medium" || duration == "duration_long") {
        use_model sethintrequiresholding(1);
    }
    if (isdefined(onobstruction)) {
        use_model sethintonobstruction(onobstruction);
    } else {
        use_model sethintonobstruction("hide");
    }
    if (isdefined(hintdist)) {
        use_model sethintdisplayrange(hintdist);
    } else {
        use_model sethintdisplayrange(200);
    }
    use_model sethintdisplayfov(65);
    if (isdefined(level.var_ca6cc42c53b63433)) {
        use_model setuserange(level.var_ca6cc42c53b63433);
    } else if (isdefined(usedist)) {
        use_model setuserange(usedist);
    } else {
        use_model setuserange(72);
    }
    if (isdefined(usefov)) {
        use_model setusefov(usefov);
    } else {
        use_model setusefov(65);
    }
    thread setup_player_marks();
    level thread namespace_a0628d6954815ef8::add_to_mine_list(self);
    if (isdefined(level.var_93617d996e732d98)) {
        use_model thread [[ level.var_93617d996e732d98 ]]();
    }
    if (isdefined(level.var_e7cbc54feb458782)) {
        use_model thread [[ level.var_e7cbc54feb458782 ]]();
    }
    if (!isdefined(level.var_52e8037d5931b083)) {
        level.var_52e8037d5931b083 = [];
    }
    level.var_52e8037d5931b083[level.var_52e8037d5931b083.size] = use_model;
    use_model thread function_3525aa896a01c0ba();
    hintstring = %CP_STRIKE/DEFUSE;
    use_model sethintstring(hintstring);
    use_model setcursorhint("HINT_BUTTON");
    return use_model;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x31
function function_3525aa896a01c0ba() {
    if (!isdefined(level.var_52e8037d5931b083)) {
        return;
    }
    self waittill("death");
    level.var_52e8037d5931b083 = array_remove(level.var_52e8037d5931b083, self);
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63b
// Size: 0xcc
function function_dc7db69812defce8(allow) {
    if (!isdefined(level.var_52e8037d5931b083)) {
        return;
    }
    if (istrue(allow)) {
        foreach (var_ec973bbad906c159 in level.var_52e8037d5931b083) {
            if (isent(var_ec973bbad906c159)) {
                var_ec973bbad906c159 enableplayeruse(self);
            }
        }
        return;
    }
    foreach (var_ec973bbad906c159 in level.var_52e8037d5931b083) {
        if (isent(var_ec973bbad906c159)) {
            var_ec973bbad906c159 disableplayeruse(self);
        }
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70f
// Size: 0x27
function setup_player_marks() {
    self enableplayermarks("equipment");
    self waittill("death");
    if (isdefined(self)) {
        self disableplayermarks("equipment");
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x73e
// Size: 0x88
function tripwire_cantriptrap(attacker, objweapon, type, damage, point) {
    if (!isdefined(attacker)) {
        return false;
    }
    if (isplayer(attacker) && isexplosivedamagemod(type) && damage > 90) {
        return true;
    }
    if (isplayer(attacker) && istripwiredamagetype(type) && damage > 10) {
        return true;
    }
    if (isplayer(attacker) && isempdamage(attacker, objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7cf
// Size: 0x26
function istripwiredamagetype(type) {
    if (isbulletdamage(type)) {
        return true;
    }
    if (type == "MOD_FIRE") {
        return true;
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7fe
// Size: 0x59
function isempdamage(attacker, objweapon) {
    if (objweapon.basename == "emp_drone_player_mp") {
        return true;
    }
    if (objweapon.basename == "emp_drone_non_player_mp") {
        return true;
    }
    if (objweapon.basename == "emp_drone_non_player_direct_mp") {
        return true;
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x860
// Size: 0x153
function tripwire_damagefunc(var_7e1f1fcfbe3f027d, victim) {
    level notify("trigger_reinforcements_if_applicable");
    if (isdefined(level.var_75aebc73793d8c40)) {
        level.var_75aebc73793d8c40 = array_removeundefined(level.var_75aebc73793d8c40);
        var_349b1adb8e32fd9a = getclosest(var_7e1f1fcfbe3f027d.origin, level.var_75aebc73793d8c40);
        if (isdefined(var_349b1adb8e32fd9a)) {
            var_349b1adb8e32fd9a delete();
        }
        level.var_75aebc73793d8c40 = array_removeundefined(level.var_75aebc73793d8c40);
    }
    var_7e1f1fcfbe3f027d disableplayermarks("equipment");
    if (isdefined(victim) && isplayer(victim)) {
        victim.shouldskipdeathsshield = 1;
    }
    radiusdamage(var_7e1f1fcfbe3f027d.origin, 384, 700, 120, undefined, "MOD_EXPLOSIVE", "frag_grenade_mp");
    playrumbleonposition("grenade_rumble", var_7e1f1fcfbe3f027d.origin);
    earthquake(0.45, 0.7, var_7e1f1fcfbe3f027d.origin, 800);
    if (isdefined(victim) && isplayer(victim)) {
        if (distancesquared(victim.origin, var_7e1f1fcfbe3f027d.origin) < 250000) {
            level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(victim, #"hash_c8122b0900ba529d", undefined, 1);
        }
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9bb
// Size: 0x102
function tripwire_givegrenade(weapon, player) {
    weapon_name = "power_frag";
    if (!isstring(weapon)) {
        weapon_name = getcompleteweaponname(weapon);
    }
    switch (weapon_name) {
    case #"hash_a8e4a914fb03a4d5":
        name = "equip_frag";
        break;
    case #"hash_5d11ac1131cddab1":
        name = "equip_semtex";
        break;
    case #"hash_fa1e80f6bd5b8e72":
        name = "equip_c4";
        break;
    default:
        name = "equip_frag";
        break;
    }
    maxcharges = scripts\cp\cp_loadout::get_num_of_charges_for_power(player, "primary");
    var_caf75c2ba47b7261 = namespace_4fb9dddfb8c1a67a::getequipmentammo(name);
    var_9b4fb988b660eb30 = namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(name);
    if (var_caf75c2ba47b7261 >= var_9b4fb988b660eb30) {
        var_caf75c2ba47b7261 = var_9b4fb988b660eb30 - 1;
    }
    player namespace_4fb9dddfb8c1a67a::giveequipment(name, "primary");
    player namespace_4fb9dddfb8c1a67a::setequipmentammo(name, var_caf75c2ba47b7261 + 1);
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xac5
// Size: 0x126
function tripwire_disarmgiveweapon(weapon, lootname, player, grenade_origin, var_40559a644f5cc3e6) {
    objweapon = weapon;
    if (isstring(weapon)) {
        objweapon = makeweaponfromstring(weapon);
    }
    var_f79f311c1ed5a958 = namespace_47366e00aa4211f4::function_4fd4273c8a15ac00("equip_frag");
    if (var_f79f311c1ed5a958 != "") {
        if (!isdefined(grenade_origin)) {
            grenade_origin = self.origin;
        }
        if (!isdefined(var_40559a644f5cc3e6)) {
            var_40559a644f5cc3e6 = self.angles;
        }
        dropinfo = namespace_6250b14b3f614101::getitemdropinfo(grenade_origin, var_40559a644f5cc3e6);
        item = namespace_6250b14b3f614101::spawnpickup(var_f79f311c1ed5a958, dropinfo);
    }
    if (isdefined(level.var_75aebc73793d8c40)) {
        var_349b1adb8e32fd9a = getclosest(grenade_origin, level.var_75aebc73793d8c40);
        if (isdefined(var_349b1adb8e32fd9a)) {
            var_349b1adb8e32fd9a delete();
        }
        level.var_75aebc73793d8c40 = array_removeundefined(level.var_75aebc73793d8c40);
    }
    if (istrue(level.var_460285f52f6bc514)) {
        level thread function_d9e4a4a56dd99ab3(player, grenade_origin, var_40559a644f5cc3e6);
    }
    level thread play_disarm_operator_vo(player);
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbf3
// Size: 0xc0
function hasequipmentoftype(weap, player) {
    objweapon = weap;
    if (isstring(weap)) {
        objweapon = makeweaponfromstring(weap);
    }
    var_70148ff25532a07f = player.offhandinventory;
    foreach (weapon in var_70148ff25532a07f) {
        if (getweaponbasename(weapon) == getweaponbasename(objweapon)) {
            return true;
        }
        if (getweaponbasename(objweapon) == "frag" && getweaponbasename(weapon) == "frag_grenade_mp") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcbc
// Size: 0xa0
function hasnolethalequipment(player) {
    var_edc29cd611c294cd = 0;
    var_70148ff25532a07f = player.offhandinventory;
    foreach (weapon in var_70148ff25532a07f) {
        weapon_type = scripts\cp\utility::getequipmenttype(getweaponbasename(weapon));
        if (isdefined(weapon_type)) {
            if (weapon_type == "lethal") {
                var_edc29cd611c294cd = 1;
            }
        }
    }
    if (!var_edc29cd611c294cd) {
        return true;
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd65
// Size: 0x3c
function issameoffhandtype(weapon, objweapon) {
    weapon_type = scripts\cp\utility::getequipmenttype(weapon);
    if (!isdefined(weapon_type)) {
        return false;
    }
    if (weapon_type == scripts\cp\utility::getequipmenttype(objweapon)) {
        return true;
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdaa
// Size: 0x8d
function haslethalequipment(player) {
    var_70148ff25532a07f = player.offhandinventory;
    foreach (weapon in var_70148ff25532a07f) {
        weapon_type = scripts\cp\utility::getequipmenttype(getweaponbasename(weapon));
        if (isdefined(weapon_type) && weapon_type == "lethal") {
            return true;
        }
    }
    return false;
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe40
// Size: 0x57
function play_disarm_operator_vo(player) {
    if (!isdefined(level.vo_tripwire_next_callout_time) || gettime() > level.vo_tripwire_next_callout_time) {
        level.vo_tripwire_next_callout_time = gettime() + 30000;
        level thread scripts\cp\cp_player_battlechatter::trysaylocalsound(player, #"hash_6cc3d12844634b0e", undefined, 0.8);
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe9f
// Size: 0x3c
function tripwire_trackachievementboom(attacker, type) {
    if (isplayer(attacker) && (type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH")) {
        attacker thread scripts\cp\cp_achievement::trapachievementboom(attacker);
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xee3
// Size: 0x4a
function createLootDropInfo(baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44) {
    return namespace_6250b14b3f614101::getitemdroporiginandangles(0, baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44);
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf36
// Size: 0xf7
function function_7bda4e577b34a556() {
    if (!isdefined(level.tripwires) || !isdefined(level.tripwires.traps)) {
        return;
    }
    foreach (tripwire in level.tripwires.traps) {
        if (isdefined(tripwire.deletefunc)) {
            tripwire [[ tripwire.deletefunc ]]();
        }
    }
    wait 1;
    foreach (tripwire in level.tripwires.tripwires) {
        if (isent(tripwire)) {
            tripwire delete();
        }
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1035
// Size: 0x238
function function_d9e4a4a56dd99ab3(player, var_6aff01e5a3f618ad, var_33348f75cdbf1e03, dist_override) {
    var_310236dbf257fbb5 = getaiarray("axis");
    dist = ter_op(isdefined(dist_override), dist_override, 512);
    var_310236dbf257fbb5 = namespace_378f8281e2d12ced::function_fd9e4cb348a5f283(var_6aff01e5a3f618ad, dist);
    if (isdefined(var_310236dbf257fbb5) && var_310236dbf257fbb5.size > 0) {
        var_310236dbf257fbb5 = sortbydistance(var_310236dbf257fbb5, var_6aff01e5a3f618ad);
    } else {
        var_310236dbf257fbb5 = [];
    }
    count = min(var_310236dbf257fbb5.size, 10);
    for (i = 0; i < count; i++) {
        waitframe();
        count_ratio = (i + 1) / count;
        if (percent_chance((1 - count_ratio) * 30)) {
            continue;
        }
        guy = var_310236dbf257fbb5[i];
        if (!isalive(guy)) {
            continue;
        }
        team = guy.team;
        origin = guy.origin;
        if (!isdefined(team) || !isdefined(origin)) {
            continue;
        }
        state = guy namespace_378f8281e2d12ced::getcombatstate();
        if (!isdefined(state) || !isdefined(guy.team)) {
            continue;
        }
        if (state == "dead" || guy.team == "neutral") {
            continue;
        }
        if (state == "combat" && guy namespace_378f8281e2d12ced::function_8f59caa9212fcc56()) {
            continue;
        }
        /#
            if (scripts\cp\coop_stealth::function_e39a555170607456()) {
                print3d(origin + (0, 0, 100), "<dev string:x1c>", (1, 1, 1), 1, 0.3, 20, 1);
            }
        #/
        angles = vectortoangles(var_6aff01e5a3f618ad - guy.origin);
        spot = guy.origin + anglestoforward(angles) * 750;
        guy aieventlistenerevent("investigate", player, spot);
        waitframe();
        guy.var_93b8288efb765770 = 90000;
        wait 3 + randomfloat(2);
    }
}

// Namespace namespace_4129658e5be98777 / scripts\cp\tripwire_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0xbc
function function_c119a25a61ffcb35() {
    level endon("game_ended");
    wait 3;
    if (!isdefined(level.tripwires) || !isdefined(level.tripwires.traps)) {
        return;
    }
    foreach (trap in level.tripwires.traps) {
        if (isdefined(trap.model) && trap.model == "projectile_c4_v0") {
            trap setscriptablepartstate("effects", "plant", 0);
        }
    }
}

