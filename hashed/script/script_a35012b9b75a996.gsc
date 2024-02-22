// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_3214e6fcdce468a7;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\equipment.gsc;
#using script_a35012b9b75a996;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_10ad6174c8938599;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_74b851b7aa1ef32d;
#using script_cbb0697de4c5728;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\equipment\nvg.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_4b5b395ea0ea0fb;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\perks\perks.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_2aabac61f2ae422;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\mp\bots\bots_util.gsc;

#namespace shock_stick;

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4c
// Size: 0x130
function function_54655641d3957e3(grenade, var_e012e0b70d7d54fa) {
    /#
        setdevdvarifuninitialized(@"hash_d677956e73b3bfb4", 0.8);
    #/
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    grenade.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    if (!isdefined(grenade.var_8bf83d28be4c2d4f.bundle)) {
        /#
            assertmsg("Shock Stick needs a bundle.");
        #/
    }
    if (istrue(grenade.var_8bf83d28be4c2d4f.bundle.var_b79e08e886b92d46)) {
        if (!isdefined(self.var_801217fe248465c4)) {
            self.var_801217fe248465c4 = [];
            callback::add("onPlayerSpawn_destroyEquipment", &function_2bcd92a365fef09);
        }
        self.var_801217fe248465c4[self.var_801217fe248465c4.size] = grenade;
    }
    function_641996b5e113c5c6(grenade, &function_f7d28ac22f07d9c0);
    grenade thread function_c00fb7cc84f2d066();
    grenade thread function_50a6b61f28ff21c8();
    namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_shockstick", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    thread function_374b1abf46319e21(grenade);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc83
// Size: 0x89
function function_f7d28ac22f07d9c0(var_e527f023260c562c) {
    victim = var_e527f023260c562c.victim;
    attacker = var_e527f023260c562c.attacker;
    objweapon = var_e527f023260c562c.objweapon;
    if (istrue(namespace_f8065cafc523dba5::playersareenemies(victim.owner, attacker))) {
        attacker notify("destroyed_equipment");
        attacker namespace_58a74e7d54b56e8d::givescoreforequipment(victim, objweapon);
    }
    self notify("enemy_destroyed_equipment", attacker);
    victim function_c44b639f5005afa(1);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd13
// Size: 0x38
function function_c00fb7cc84f2d066() {
    self endon("death");
    self endon("underwater_swap");
    self.owner waittill_any_3("joined_team", "joined_spectators", "disconnect");
    thread function_c44b639f5005afa();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd52
// Size: 0x21
function function_50a6b61f28ff21c8() {
    self endon("death");
    self endon("underwater_swap");
    self waittill("forceDeath");
    thread function_c44b639f5005afa();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7a
// Size: 0x79
function function_c44b639f5005afa(var_6a94cf09aa6e486e) {
    if (istrue(self.exploding)) {
        return;
    }
    time = 0.25;
    if (istrue(var_6a94cf09aa6e486e)) {
        time = 0;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.exploding = 1;
    self setscriptablepartstate("destroy", "on", 0);
    thread function_c5852887bdea3efb(time);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfa
// Size: 0x122
function function_c5852887bdea3efb(var_cbf7be4f62a0ddb2) {
    level endon("game_ended");
    if (!isdefined(self)) {
        return;
    }
    function_83cebe0ae5318a7f(self);
    if (istrue(self.var_8bf83d28be4c2d4f.bundle.var_6bf09ccafb1e16d2)) {
        self setscriptablepartstate("electric", "neutral", 0);
        var_84d5c7478409fed5 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_a3395b5076eb8a6c, 1);
        wait(var_84d5c7478409fed5 + 0.5);
        self notify("death");
        wait(var_cbf7be4f62a0ddb2);
        if (isdefined(self)) {
            if (isdefined(self.badplace)) {
                destroynavobstacle(self.badplace);
            }
            self.var_5bcbcef205cb1486 = undefined;
            self delete();
        }
    } else {
        self notify("death");
        if (var_cbf7be4f62a0ddb2 > 0) {
            wait(var_cbf7be4f62a0ddb2);
        }
        if (isdefined(self)) {
            if (isdefined(self.badplace)) {
                destroynavobstacle(self.badplace);
            }
            self.var_5bcbcef205cb1486 = undefined;
            self setscriptablepartstate("electric", "neutral", 0);
            self delete();
        }
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf23
// Size: 0x3d
function function_ca6c37e5d8f35c8b(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    data.victim thread function_5d58ea6516bf050c(0.2);
    return 1;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x7d
function function_2bcd92a365fef09(params) {
    if (isdefined(self.var_801217fe248465c4)) {
        foreach (shockstick in self.var_801217fe248465c4) {
            if (isdefined(shockstick)) {
                shockstick function_c44b639f5005afa();
            }
        }
        self.var_801217fe248465c4 = [];
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfec
// Size: 0xb8
function function_a5e91eaa60d034d7(grenade) {
    var_87c2825d26c0f315 = namespace_68e641469fde3fa7::_launchgrenade("shock_stick_underwater_mp", grenade.origin, (0, 0, 0), undefined, 1);
    namespace_3bbb5a98b932c46f::grenadeinitialize(var_87c2825d26c0f315, makeweapon("shock_stick_underwater_mp"), 0, self);
    ref = namespace_4fb9dddfb8c1a67a::function_7f245729fcb6414d(grenade.weapon_name);
    var_87c2825d26c0f315.var_8bf83d28be4c2d4f = namespace_4fb9dddfb8c1a67a::getequipmenttableinfo(ref);
    var_87c2825d26c0f315.owner = self;
    grenade notify("underwater_swap");
    grenade delete();
    var_87c2825d26c0f315 setscriptablepartstate("danger-icon", "on", 0);
    var_87c2825d26c0f315 thread function_ab90d143e732b403();
    return var_87c2825d26c0f315;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ac
// Size: 0x193
function function_374b1abf46319e21(grenade) {
    self endon("disconnect");
    level endon("game_ended");
    grenade endon("death");
    bundle = grenade.var_8bf83d28be4c2d4f.bundle;
    var_a681b7890cd017c7 = grenade namespace_1a507865f681850e::function_f69ed22535d90b78();
    if (!isdefined(var_a681b7890cd017c7)) {
        return;
    }
    stucktoplayer = 0;
    if (isdefined(var_a681b7890cd017c7.stuckto)) {
        stuckto = var_a681b7890cd017c7.stuckto;
        if (isdefined(var_a681b7890cd017c7.stuckto.weapon_name) && istrue(var_a681b7890cd017c7.stuckto.weapon_name == "deployed_decoy_mp") && istrue(var_a681b7890cd017c7.stuckto.var_3fe87ed1237724cc)) {
            grenade thread namespace_742e7eca5294ecdc::function_c44b639f5005afa(1);
            return;
        }
        if (isplayer(stuckto) || isagent(stuckto)) {
            grenade thread namespace_3bbb5a98b932c46f::grenadestuckto(grenade, var_a681b7890cd017c7.stuckto);
            stucktoplayer = 1;
        } else {
            grenade thread namespace_1a507865f681850e::function_4af015619e2534ba(stuckto, &function_c44b639f5005afa, 1);
        }
        grenade.stuckto = stuckto;
    }
    if (!stucktoplayer) {
        grenade thread function_ab90d143e732b403();
        fusetime = function_53c4c53197386572(bundle.var_359bfa5663381124, 0.35);
        fusetime = getdvarfloat(@"hash_b3e986ad3c157f80", fusetime);
        grenade setscriptablepartstate("electric", "fuse", 0);
        wait(fusetime);
    }
    thread function_c205d3a32bf04340(grenade, var_a681b7890cd017c7);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1246
// Size: 0xe3
function private function_c205d3a32bf04340(grenade, var_a681b7890cd017c7) {
    self endon("disconnect");
    level endon("game_ended");
    bundle = grenade.var_8bf83d28be4c2d4f.bundle;
    var_5fbadc0f9063d647 = istrue(bundle.var_b79e08e886b92d46);
    if (istrue(grenade.exploding)) {
        return;
    }
    if (isdefined(var_a681b7890cd017c7.isunderwater)) {
        if (var_5fbadc0f9063d647) {
            grenade function_c44b639f5005afa();
        } else {
            grenade = function_a5e91eaa60d034d7(grenade);
        }
    }
    grenade endon("death");
    if (var_5fbadc0f9063d647) {
        if (!isdefined(var_a681b7890cd017c7.isunderwater)) {
            grenade function_4d13735859a44508(var_a681b7890cd017c7);
        }
    } else {
        grenade setscriptablepartstate("electric", "active", 0);
        grenade setscriptablepartstate("detonate", "detonate", 0);
        grenade thread function_f47ab824a48fe570();
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1330
// Size: 0x47
function private function_ab90d143e732b403() {
    var_6f9ab20311c32e55 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_890704710e61ebcc, 100);
    thread namespace_3e725f3cc58bddd3::monitordamage(var_6f9ab20311c32e55, "hitequip", &function_8e8a3b7d66fdc1b1, undefined);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x137e
// Size: 0x38
function private function_8e8a3b7d66fdc1b1(data) {
    self notify("enemy_destroyed_equipment", data.attacker);
    function_4714b4df7581ef29(data.attacker);
    function_c44b639f5005afa();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x51
function function_4714b4df7581ef29(attacker) {
    if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        attacker thread namespace_48a08c5037514e04::doscoreevent(#"destroyed_equipment");
        attacker namespace_25c5a6f43bb97b43::equipmentdestroyed(self);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1415
// Size: 0x66
function shockstick_canbehaywire(shockstick, var_c21cbb75e13200d4) {
    if (self == shockstick) {
        return 0;
    }
    if (!isdefined(self)) {
        return 0;
    }
    if (isplayer(self)) {
        return function_d3690389f7d8334c(shockstick, var_c21cbb75e13200d4);
    } else if (istrue(self.exploding)) {
        return 0;
    } else if (istrue(self.var_98e373d243c1936f)) {
        return 0;
    } else {
        return function_407cdd75e41a385d(shockstick);
    }
    return 1;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1483
// Size: 0x174
function function_407cdd75e41a385d(shockstick) {
    if (!isdefined(self.classname)) {
        return 0;
    }
    if (!isdefined(self.owner) && !isagent(self) && self.classname != "misc_turret" && self.classname != "script_vehicle") {
        return 0;
    }
    if (shockstick == self) {
        return 0;
    }
    bundle = shockstick.var_8bf83d28be4c2d4f.bundle;
    if (!istrue(bundle.var_5dd66ebda239d1b)) {
        return 0;
    }
    if (level.teambased) {
        if (isdefined(self.team) && shockstick.team == self.team) {
            if (isagent(self) || isdefined(self.owner) && self.owner != shockstick.owner) {
                return 0;
            }
        }
    }
    if (isdefined(self.weapon_name)) {
        weapontype = namespace_68e641469fde3fa7::getweapontype(self.weapon_name);
        if (isdefined(weapontype)) {
            if (weapontype != "lethal" && weapontype != "tactical" && weapontype != "super" && !namespace_39febbb7a6990e45::function_60dface26506153e(self.weapon_name) && weapontype == "killstreak" && !isdefined(self.var_aa6fe6af4cbbdd47)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ff
// Size: 0x153
function function_d3690389f7d8334c(shockstick, var_c21cbb75e13200d4) {
    /#
        print("super");
    #/
    bundle = shockstick.var_8bf83d28be4c2d4f.bundle;
    if (namespace_a2f809133c566621::isjuggernaut()) {
        return 0;
    }
    if (istrue(bundle.var_b79e08e886b92d46) && (function_b80ed39805876e5c(shockstick) || self == shockstick.owner)) {
        return 0;
    }
    if (level.teambased) {
        if (!isdefined(self.team)) {
            return 1;
        }
        if (shockstick.team == self.team && self != shockstick.owner) {
            return 0;
        }
    }
    if (isusingremote() || istrue(self.isusingcamera)) {
        return 0;
    }
    isalive = namespace_f8065cafc523dba5::_isalive();
    var_160cf99a24c57b98 = shockstick function_91a16c9b36fa1b5c(self);
    var_672d556fca0c15cc = function_53c4c53197386572(5, bundle.var_95602b4d7262c11f);
    if (!isalive || var_160cf99a24c57b98 >= var_672d556fca0c15cc) {
        return 0;
    }
    if (!istrue(var_c21cbb75e13200d4)) {
        if (self sightconetrace(shockstick.origin, shockstick) <= 0) {
            return 0;
        }
    }
    return istrue(function_5e15cf3721cdcaab(shockstick));
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175a
// Size: 0xd5
function function_f793c14e21581402(shockstick, var_aea56050ca64fc24) {
    bundle = shockstick.var_8bf83d28be4c2d4f.bundle;
    if (istrue(bundle.var_b79e08e886b92d46) && (function_b80ed39805876e5c(shockstick) || self == shockstick.owner)) {
        return 0;
    }
    isalive = namespace_f8065cafc523dba5::_isalive();
    var_160cf99a24c57b98 = shockstick function_91a16c9b36fa1b5c(self);
    var_672d556fca0c15cc = function_53c4c53197386572(5, bundle.var_95602b4d7262c11f);
    if (!isalive || var_160cf99a24c57b98 >= var_672d556fca0c15cc) {
        return 0;
    }
    if (self sightconetrace(var_aea56050ca64fc24.origin, var_aea56050ca64fc24) <= 0) {
        return 0;
    }
    return istrue(function_5e15cf3721cdcaab(shockstick));
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1837
// Size: 0x45
function function_91a16c9b36fa1b5c(target) {
    if (!isdefined(self.var_5bcbcef205cb1486)) {
        return 0;
    } else {
        duration = self.var_5bcbcef205cb1486[target getentitynumber()];
        if (!isdefined(duration)) {
            return 0;
        } else {
            return duration;
        }
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1883
// Size: 0x74
function function_b80ed39805876e5c(shockstick) {
    if (!isdefined(self.var_cb886ff3371f4df8)) {
        return 0;
    }
    bundle = shockstick.var_8bf83d28be4c2d4f.bundle;
    var_c3fa36eb9aa40509 = function_53c4c53197386572(bundle.var_33bce1558051ceb5, 0.3);
    var_c3fa36eb9aa40509 = var_c3fa36eb9aa40509 * 1000;
    return gettime() - self.var_cb886ff3371f4df8 <= var_c3fa36eb9aa40509;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0x846
function function_f47ab824a48fe570() {
    self endon("death");
    self.owner endon("disconnect");
    var_ce431d3bba9e09e6 = 0;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        var_ce431d3bba9e09e6 = getdvarint(@"hash_25b486e84d3b2909", 1);
    }
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    ticks = 0;
    objweapon = makeweapon(bundle.useweapon);
    contents = [0:"physicscontents_item", 1:"physicscontents_vehicle", 2:"physicscontents_characterproxy", 3:"physicscontents_explosionclip", 4:"physicscontents_clipshot", 5:"physicscontents_missileclip", 6:"physicscontents_explosionclip"];
    var_703e9fc257d523f1 = function_53c4c53197386572(bundle.var_48d181037894a0fe, 5);
    var_703e9fc257d523f1 = getdvarfloat(@"hash_2c69cb8cd7d267cd", var_703e9fc257d523f1);
    tickrate = function_53c4c53197386572(bundle.var_aba76142349af9c0, 0.2);
    tickrate = getdvarfloat(@"hash_b2f16983a17dc833", tickrate);
    var_5112e7794dca9367 = var_703e9fc257d523f1 / tickrate;
    var_6ce919400e8c5e02 = function_53c4c53197386572(bundle.var_f196cc01f2b12053, 125);
    var_d38b72705084c645 = function_53c4c53197386572(bundle.var_4d5d534ef8820d0a, 6);
    var_46d6554bcb2371a1 = istrue(bundle.var_6bf09ccafb1e16d2);
    if (var_46d6554bcb2371a1) {
        self.var_dac6c64c0c59d452 = [];
    }
    self.badplace = function_9c95c914395a9d4a(self.origin, var_6ce919400e8c5e02);
    function_daf6c5596bb31dff("decoy_grenade", self.owner, self.origin, 512);
    thread function_1ff93e5069cbb8e2(self.origin, var_6ce919400e8c5e02, var_6ce919400e8c5e02);
    while (ticks < var_5112e7794dca9367) {
        ents = namespace_235de5057ddc58e0::getentitiesinradius(self.origin, var_6ce919400e8c5e02, undefined, undefined, physics_createcontents(contents));
        /#
            print("death_or_disconnect" + ents.size);
        #/
        foreach (ent in ents) {
            if (!isdefined(ent)) {
                /#
                    print("fire" + ent getentitynumber() + "specialty_shock_resist");
                #/
            } else if (ent == self) {
                /#
                    print("fire" + ent getentitynumber() + "secondary");
                #/
            } else {
                if (var_ce431d3bba9e09e6) {
                    if (isdefined(ent.domflag) && isdefined(ent.domflag.trigger) && isdefined(ent.domflag.trigger.var_3545410459b16762)) {
                        if (isdefined(ent.domflag.trigger.stronghold) && isdefined(ent.domflag.trigger.stronghold.var_4756733ecc825a2) && istrue(ent.domflag.trigger.stronghold.var_4756733ecc825a2 == self.owner.team)) {
                            continue;
                        }
                        if (!isdefined(ent.domflag.trigger.var_14f5316be5cf1613)) {
                            ent.domflag.trigger.var_14f5316be5cf1613 = self;
                        } else if (ent.domflag.trigger.var_14f5316be5cf1613 == self) {
                            continue;
                        } else {
                            ent.domflag.trigger.var_14f5316be5cf1613 = self;
                        }
                        data = spawnstruct();
                        data.time = 5;
                        data.attacker = self.owner;
                        data.reason = "SHOCK_STICK";
                        ent.domflag.trigger thread [[ ent.domflag.trigger.var_3545410459b16762 ]](data);
                    }
                }
                if (!ent shockstick_canbehaywire(self)) {
                    /#
                        print("fire" + ent getentitynumber() + "<unknown string>");
                    #/
                } else {
                    /#
                        print("fire" + ent getentitynumber() + "<unknown string>");
                    #/
                    if (isagent(ent) || isplayer(ent)) {
                        isswimming = ent isswimming();
                        if (isswimming) {
                            ent dodamage(var_d38b72705084c645, self.origin, self.owner, self, "MOD_ELEMENTAL_ELEC", objweapon, "torso_upper");
                        }
                        if (ent namespace_82dcd1d5ae30ff7::_hasperk("specialty_shock_immunity")) {
                            continue;
                        }
                        if (!isswimming) {
                            if (ent != self.owner) {
                                if (ent namespace_82dcd1d5ae30ff7::_hasperk("specialty_tac_resist") || ent namespace_82dcd1d5ae30ff7::_hasperk("specialty_tac_resist_br")) {
                                    if (getdvarint(@"hash_2909726ff0e12a7d", 0) == 1 && isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e76a5e57e1ff6b9b)) {
                                        self.owner namespace_e072c8407b2a861c::updatedamagefeedback("hittacresist", undefined, undefined, 2, 1);
                                    } else {
                                        self.owner namespace_e072c8407b2a861c::updatedamagefeedback("hittacresist", undefined, undefined, undefined, 1);
                                    }
                                } else if (getdvarint(@"hash_2909726ff0e12a7d", 0) == 1 && isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_e76a5e57e1ff6b9b)) {
                                    self.owner namespace_e072c8407b2a861c::updatedamagefeedback("", undefined, undefined, 2);
                                } else {
                                    self.owner namespace_e072c8407b2a861c::updatedamagefeedback("");
                                }
                            }
                        }
                        if (ent != self.owner) {
                            self.owner namespace_3c5a4254f2b957ea::incpersstat("shockStickHits", 1);
                        }
                    }
                    if (var_46d6554bcb2371a1) {
                        self.var_dac6c64c0c59d452[self.var_dac6c64c0c59d452.size] = ent;
                    }
                    /#
                        print("fire" + ent getentitynumber() + "<unknown string>");
                    #/
                    thread shockstick_applyhaywire(ent, objweapon, var_46d6554bcb2371a1);
                    function_bba576fc720ed9c5(ent);
                }
            }
        }
        if (var_ce431d3bba9e09e6) {
            scriptables = getentitylessscriptablearray(undefined, undefined, self.origin, var_6ce919400e8c5e02);
            foreach (scriptable in scriptables) {
                if (isdefined(scriptable.var_3545410459b16762)) {
                    if (isdefined(scriptable.var_dcc5f31ec71d6d8a) && scriptable.var_dcc5f31ec71d6d8a == self.owner.team) {
                        continue;
                    }
                    if (!isdefined(scriptable.var_14f5316be5cf1613)) {
                        scriptable.var_14f5316be5cf1613 = self;
                    } else if (scriptable.var_14f5316be5cf1613 == self) {
                        continue;
                    } else {
                        scriptable.var_14f5316be5cf1613 = self;
                    }
                    data = spawnstruct();
                    data.time = 5;
                    data.attacker = self.owner;
                    data.reason = "SHOCK_STICK";
                    scriptable thread [[ scriptable.var_3545410459b16762 ]](data);
                }
            }
        }
        ticks++;
        wait(tickrate);
    }
    function_c44b639f5005afa();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214c
// Size: 0x7b
function function_1ff93e5069cbb8e2(location, radius, height) {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(location, radius, height, self.owner.team, undefined, self.owner, 1, self, 1);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0xcd
function function_bba576fc720ed9c5(ent) {
    entisvehicle = ent namespace_1f188a13f7e79610::isvehicle();
    if (!istrue(entisvehicle)) {
        if (ent != self.owner) {
            if (level.teambased) {
                if (isdefined(ent.team) && isdefined(self.team)) {
                    if (ent.team != self.team) {
                        self.owner namespace_a850435086c88de3::doonactionscoreevent(0, "shockStickHit");
                    }
                }
            } else {
                self.owner namespace_a850435086c88de3::doonactionscoreevent(0, "shockStickHit");
            }
        }
    } else if (namespace_1f188a13f7e79610::vehicle_isenemytoplayer(ent, self.owner)) {
        self.owner namespace_a850435086c88de3::doonactionscoreevent(0, "shockStickHit");
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a2
// Size: 0x431
function function_afa7236ce2426c99(victim) {
    self endon("death");
    self.owner endon("disconnect");
    var_84d5c7478409fed5 = function_53c4c53197386572(self.var_8bf83d28be4c2d4f.bundle.var_a3395b5076eb8a6c, 1);
    wait(var_84d5c7478409fed5);
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    objweapon = makeweapon("shock_stick_mp");
    contents = [0:"physicscontents_item", 1:"physicscontents_characterproxy", 2:"physicscontents_explosionclip", 3:"physicscontents_clipshot", 4:"physicscontents_missileclip", 5:"physicscontents_explosionclip"];
    var_d38b72705084c645 = function_53c4c53197386572(bundle.var_4d5d534ef8820d0a, 6);
    var_804ec4ef50698a33 = function_53c4c53197386572(bundle.var_606c50913543c2f6, 3);
    var_b22bec491ee6513d = function_53c4c53197386572(bundle.var_c0ee4e9b4b96de5a, 125);
    ents = namespace_235de5057ddc58e0::getentitiesinradius(victim.origin, var_b22bec491ee6513d, undefined, undefined, physics_createcontents(contents));
    targets = [];
    victimorigin = victim.origin;
    var_e5539fe48e93bdcc = 1;
    maxdistance = -1;
    var_9c11b3617c013966 = 0;
    foreach (ent in ents) {
        if (!isdefined(ent)) {
            continue;
        }
        if (ent == victim) {
            continue;
        }
        if (isagent(ent) || isplayer(ent)) {
            if (!ent function_f793c14e21581402(self, victim)) {
                continue;
            }
            if (level.teambased) {
                jumpiffalse(self.team == ent.team) LOC_0000025f;
            } else {
            LOC_0000025f:
                if (array_contains(self.var_dac6c64c0c59d452, ent)) {
                    continue;
                }
                if (ent isswimming()) {
                    ent dodamage(var_d38b72705084c645, self.origin, self.owner, self, "MOD_ELEMENTAL_ELEC", objweapon, "torso_upper");
                } else if (ent != self.owner) {
                    self.owner namespace_e072c8407b2a861c::updatedamagefeedback("");
                }
                if (targets.size < var_804ec4ef50698a33) {
                    var_ced0426e7e729ed5 = spawnstruct();
                    var_ced0426e7e729ed5.ent = ent;
                    targets[targets.size] = var_ced0426e7e729ed5;
                } else {
                    if (var_e5539fe48e93bdcc) {
                        var_e5539fe48e93bdcc = 0;
                        for (i = 0; i < targets.size; i++) {
                            targets[i].dist = distancesquared(victimorigin, targets[i].ent.origin);
                            if (targets[i].dist > maxdistance) {
                                maxdistance = targets[i].dist;
                                var_9c11b3617c013966 = i;
                            }
                        }
                    }
                    targetdist = distancesquared(victimorigin, ent.origin);
                    if (targetdist < maxdistance) {
                        targets[var_9c11b3617c013966].ent = ent;
                        targets[var_9c11b3617c013966].dist = targetdist;
                        maxdistance = -1;
                        var_9c11b3617c013966 = -1;
                        for (i = 0; i < targets.size; i++) {
                            if (targets[i].dist > maxdistance) {
                                maxdistance = targets[i].dist;
                                var_9c11b3617c013966 = i;
                            }
                        }
                    }
                }
            }
        }
    }
    foreach (target in targets) {
        thread shockstick_applyhaywire(target.ent, objweapon, 0);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26da
// Size: 0x1a1
function function_4d13735859a44508(var_a681b7890cd017c7) {
    self endon("death");
    self setscriptablepartstate("beacon", "active", 0);
    contents = [0:"physicscontents_item", 1:"physicscontents_characterproxy", 2:"physicscontents_explosionclip", 3:"physicscontents_clipshot", 4:"physicscontents_missileclip", 5:"physicscontents_explosionclip"];
    var_775635eb25c3c213 = 0;
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    triggerradius = function_53c4c53197386572(bundle.var_4262c0e42874114f, 125);
    while (!var_775635eb25c3c213) {
        if (!isdefined(self.owner)) {
            function_c44b639f5005afa();
        }
        ents = namespace_235de5057ddc58e0::getentitiesinradius(self.origin, triggerradius, undefined, undefined, physics_createcontents(contents));
        foreach (ent in ents) {
            if (!isdefined(ent)) {
                continue;
            }
            if (ent == self) {
                continue;
            }
            if (!ent shockstick_canbehaywire(self)) {
                continue;
            }
            if (isagent(ent) || isplayer(ent)) {
                var_775635eb25c3c213 = 1;
            }
        }
        if (!var_775635eb25c3c213) {
            wait(0.1);
        }
    }
    self setscriptablepartstate("electric", "active", 0);
    self setscriptablepartstate("detonate", "detonate", 0);
    thread function_f47ab824a48fe570();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2882
// Size: 0xeb
function function_9b3d2da91a6665(victim) {
    victim endon("haywire_cleared");
    self endon("death");
    if (!isdefined(self.var_5bcbcef205cb1486)) {
        self.var_5bcbcef205cb1486 = [];
    }
    if (!isdefined(self.var_5bcbcef205cb1486[victim getentitynumber()])) {
        self.var_5bcbcef205cb1486[victim getentitynumber()] = 0;
    }
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    maxduration = function_53c4c53197386572(bundle.var_95602b4d7262c11f, 5);
    while (1) {
        self.var_5bcbcef205cb1486[victim getentitynumber()] = self.var_5bcbcef205cb1486[victim getentitynumber()] + 0.05;
        if (self.var_5bcbcef205cb1486[victim getentitynumber()] >= maxduration) {
            victim notify("haywire_max_duration");
            break;
        }
        wait(0.05);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2974
// Size: 0x128
function shockstick_applyhaywire(victim, objweapon, chain) {
    level endon("game_ended");
    victim endon("disconnect");
    victim notify("shockStick_haywireApplied");
    victim endon("shockStick_haywireApplied");
    /#
        assertex(isdefined(victim), "shockStick_applyHaywire() doesn't have a victim. ");
    #/
    /#
        assertex(isdefined(objweapon), "shockStick_applyHaywire() doesn't have a weapon reference. ");
    #/
    if (isplayer(victim)) {
        victim thread namespace_46e942396566f2da::function_943511ab1f39db66();
    }
    data = packdamagedata(self.owner, victim, 1, objweapon, "MOD_EXPLOSIVE", self, self.origin);
    function_b3a0629a55a36978();
    if (chain) {
        childthread function_afa7236ce2426c99(victim);
    }
    if (isplayer(victim) || isagent(victim)) {
        childthread function_9b3d2da91a6665(victim);
    }
    function_ea2863c73339ae9e(data);
    function_fb327fd48c0e34e0(data);
    var_fcef8d217a441961 = 0;
    if (isplayer(data.victim) || isagent(data.victim)) {
        var_fcef8d217a441961 = !namespace_7e17181d03156026::isreallyalive(data.victim);
    }
    function_46b866d198a76ddc(data, var_fcef8d217a441961);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa3
// Size: 0xd
function function_b3a0629a55a36978() {
    self.var_a23f35f8460d8857 = undefined;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab7
// Size: 0x260
function function_ea2863c73339ae9e(data) {
    /#
        assertex(isdefined(data), "shockStick_applyHaywireStruct() called without data.");
    #/
    /#
        assertex(isdefined(data.attacker), "shockStick_applyHaywireStruct() data does not have a .attacker.");
    #/
    /#
        assertex(isdefined(data.victim), "shockStick_applyHaywireStruct() data does not have a .victim.");
    #/
    /#
        assertex(isdefined(data.objweapon), "shockStick_applyHaywireStruct() data does not have a .objWeapon.");
    #/
    /#
        assertex(isweapon(data.objweapon), "shockStick_applyHaywireStruct() data.objWeapon is not a weapon object.");
    #/
    /#
        assertex(isdefined(data.inflictor), "shockStick_applyHaywireStruct() data does not have an inflictor.");
    #/
    if (!isdefined(data.damage)) {
        data.damage = 1;
    }
    if (!isdefined(data.meansofdeath)) {
        data.meansofdeath = "MOD_EXPLOSIVE";
    }
    if (!isdefined(data.point)) {
        data.point = (0, 0, 0);
    }
    if (!isdefined(data.direction_vec)) {
        data.direction_vec = (0, 0, 0);
    }
    if (!isdefined(data.modelname)) {
        data.modelname = 0;
    }
    if (!isdefined(data.partname)) {
        data.partname = "";
    }
    if (!isdefined(data.tagname)) {
        data.tagname = 0;
    }
    if (!isdefined(data.damageflags)) {
        data.damageflags = 0;
    }
    if (!isdefined(data.hitloc)) {
        data.hitloc = "none";
    }
    if (!isdefined(data.timeoffset)) {
        data.timeoffset = 0;
    }
    if (isagent(data.victim)) {
        thread shockstick_haywireagent(data);
    } else if (isplayer(data.victim)) {
        thread function_c927fd013fc6e502(data);
    } else if (namespace_235de5057ddc58e0::isturret(data.victim) && !isdefined(data.victim.var_aa6fe6af4cbbdd47)) {
        thread function_805969ca0925b2bd(data);
    } else {
        thread function_5dd66ebda239d1b(data);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1e
// Size: 0xba
function function_805969ca0925b2bd(data) {
    level endon("game_ended");
    data.victim endon("death");
    data.victim endon("haywire_cleared");
    if (istrue(data.victim.var_12bfb031c0a0efd8)) {
        return;
    }
    data.victim.var_12bfb031c0a0efd8 = 1;
    turretweapon = data.victim.objweapon;
    if (!isdefined(turretweapon)) {
        return;
    }
    var_6fcdbf704e881920 = data.victim.owner;
    if (!isdefined(var_6fcdbf704e881920)) {
        return;
    }
    var_6fcdbf704e881920 startforcedfire();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ddf
// Size: 0xb3
function function_fb327fd48c0e34e0(data) {
    data.victim endon("death_or_disconnect");
    level endon("game_ended");
    data.victim childthread function_48f07ea78daa5b21();
    bundle = self.var_8bf83d28be4c2d4f.bundle;
    var_160cf99a24c57b98 = function_53c4c53197386572(bundle.var_7c742af3d434b807, 0.25);
    var_160cf99a24c57b98 = getdvarfloat(@"hash_e66e541920ac9101", var_160cf99a24c57b98);
    data.victim waittill_any_timeout_5(var_160cf99a24c57b98, "haywire_cleared", "haywire_max_duration", "shockstick_interrupt", "killed_player", "last_stand_start");
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e99
// Size: 0x37
function function_48f07ea78daa5b21() {
    self endon("haywire_cleared");
    self endon("haywire_max_duration");
    while (1) {
        if (isplayer(self)) {
            if (self isinexecutionvictim()) {
                self notify("shockstick_interrupt");
                break;
            }
        }
        waitframe();
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed7
// Size: 0x1b8
function function_a9a57668997e3c85(var_12bfb031c0a0efd8, islauncher) {
    if (var_12bfb031c0a0efd8) {
        val::set("haywire_controls", "sprint", 0);
        val::set("haywire_controls", "supersprint", 0);
        val::set("haywire_controls", "ads", 0);
        val::set("haywire_controls", "weapon_switch", 0);
        val::set("haywire_controls", "weapon_pickup", 0);
        val::set("haywire_controls", "ascender_use", 0);
        val::set("haywire_controls", "autoreload", 0);
        val::set("haywire_controls", "reload", 0);
        val::set("haywire_controls", "mantle", 0);
        val::set("haywire_controls", "weapon_switch_clip", 0);
        val::set("haywire_controls", "melee", 0);
        val::set("haywire_controls", "offhand_throwback", 0);
        val::set("haywire_controls", "offhand_weapons", 0);
        val::set("haywire_controls", "supers", 0);
        val::set("haywire_controls", "usability", 0);
        val::set("haywire_controls", "interactions", 0);
        val::set("haywire_controls", "ladder", 0);
        val::set("haywire_controls", "execution_attack", 0);
        if (namespace_32b635fd0594e0cc::function_258c5e445c8b7f80()) {
            val::set("haywire_controls", "nvg", 0);
        }
        namespace_7e17181d03156026::codcastersetplayerstatuseffect("shock", -1);
        if (istrue(islauncher)) {
            val::set("haywire_controls", "fire", 0);
        }
    } else {
        val::function_c9d0b43701bdba00("haywire_controls");
        namespace_7e17181d03156026::codcastersetplayerstatuseffect("shock", 0);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3096
// Size: 0x2fe
function function_c927fd013fc6e502(var_91beb5c3a5ab6910, bundle) {
    victim = var_91beb5c3a5ab6910.victim;
    objweapon = var_91beb5c3a5ab6910.objweapon;
    /#
        print("<unknown string>");
    #/
    level endon("game_ended");
    if (istrue(victim.var_12bfb031c0a0efd8) || victim isusingremote() || !isreallyalive(victim)) {
        return;
    }
    victim.var_12bfb031c0a0efd8 = 1;
    if (namespace_cd0b2d039510b38d::getgametype() == "rescue") {
        if (isdefined(victim.carryobject)) {
            hostage = victim.carryobject;
            hostage namespace_19b4203b51d56488::setdropped(0);
            hostage namespace_6d8fa3f81f071973::function_4988b37643f2672f(victim);
            if (isnullweapon(victim getcurrentweapon())) {
                foreach (weap in victim.primaryweapons) {
                    if (!isnullweapon(weap)) {
                        victim namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(weap, 1);
                        break;
                    }
                }
            }
        }
    } else if (isdefined(victim.carryobject)) {
        victim notify("force_manual_drop");
    }
    if (victim function_415fe9eeca7b2e2b()) {
        victim function_8ca38a054f432ff2();
    }
    curweapon = victim getcurrentweapon();
    var_405b7207cd5f1b1d = "vm_ges_shockstick_react";
    if (curweapon.basename == "iw9_me_fists_mp") {
        var_405b7207cd5f1b1d = "vm_ges_shockstick_react_fists";
    }
    islauncher = isdefined(curweapon) && weaponclass(curweapon.basename) == "rocketlauncher";
    victim function_a9a57668997e3c85(1, islauncher);
    victim function_7e66e7ae96dd938(1);
    if (istrue(namespace_f8065cafc523dba5::function_b7869f6d9d4242e3(victim))) {
        victim.var_4a2f2f50a9020e2e = 1;
    }
    if (!isdefined(bundle)) {
        bundle = self.var_8bf83d28be4c2d4f.bundle;
    }
    if (isdefined(bundle.var_1d572199f88fb41b)) {
        [[ bundle.var_1d572199f88fb41b ]]();
    } else {
        victim function_4ce69562a1b41fc7(objweapon);
    }
    victim childthread function_efe1093111eaf7c2(bundle);
    victim childthread function_6cda7b0c3d3f6f3c(curweapon, var_405b7207cd5f1b1d, self);
    if (!istrue(victim.var_108e6be5e24e9d1d)) {
        victim childthread function_627c93c58129d8f4(bundle);
    }
    victim childthread function_e57c787da33655d9(bundle);
    victim childthread function_a386b883464f4891(bundle, islauncher);
    if (!istrue(bundle.var_e926abd3e5970492) && issubstr(objweapon.basename, "shock_stick")) {
        namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_shockstick", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"hit"));
    }
    victim notify("player_isHaywire");
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339b
// Size: 0x9b
function function_efe1093111eaf7c2(bundle) {
    movespeedscale = getdvarfloat(@"hash_d677956e73b3bfb4", 0.8);
    movespeedscale = function_53c4c53197386572(bundle.var_77ae83eedd8cab0c, movespeedscale);
    if (!namespace_82dcd1d5ae30ff7::_hasperk("specialty_tac_resist") && !namespace_82dcd1d5ae30ff7::_hasperk("specialty_shock_resist")) {
        self setmovespeedscale(movespeedscale);
        while (!self isswimming() && istrue(self.var_12bfb031c0a0efd8)) {
            wait(0.1);
        }
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
    } else {
        namespace_b6a8027f477010e1::activateperk("specialty_tac_resist");
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x343d
// Size: 0x74
function function_6cda7b0c3d3f6f3c(curweapon, var_405b7207cd5f1b1d, grenade) {
    level endon("game_ended");
    grenade endon("death");
    self endon("death_or_disconnect");
    while (self function_55965d2ca2ada688()) {
        waitframe();
    }
    if (!namespace_68e641469fde3fa7::isakimbo(curweapon) && curweapon.basename != "iw9_me_sword01_mp") {
        while (!self isgestureplaying(var_405b7207cd5f1b1d)) {
            self forceplaygestureviewmodel(var_405b7207cd5f1b1d);
            waitframe();
        }
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34b8
// Size: 0x2f
function function_a386b883464f4891(bundle, islauncher) {
    if (istrue(bundle.var_d5798377c05f4edf) && !islauncher) {
        self startforcedfire();
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ee
// Size: 0x51
function function_627c93c58129d8f4(bundle) {
    if (istrue(bundle.var_b79e08e886b92d46)) {
        self setempjammed(1);
        self.var_cb886ff3371f4df8 = gettime();
    }
    self waittill("haywire_cleared");
    if (istrue(bundle.var_b79e08e886b92d46)) {
        self setempjammed(0);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3546
// Size: 0x43
function function_e57c787da33655d9(bundle) {
    if (istrue(bundle.var_7c149d627799674)) {
        function_600c7c4c73c6a773(1);
    }
    self waittill("haywire_cleared");
    if (istrue(bundle.var_7c149d627799674)) {
        function_600c7c4c73c6a773(0);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3590
// Size: 0x98
function function_cf082013d5205e0d(weapon) {
    weaponname = weapon.basename;
    if (function_aa6acff8443c394b(weaponname)) {
        return 1;
    }
    if (istrue(namespace_e0ee43ef2dddadaa::function_417760651c48814b(weapon))) {
        return 0;
    }
    if (namespace_e0ee43ef2dddadaa::function_5419ac7173288fc1(weapon)) {
        return 1;
    }
    if (namespace_e0ee43ef2dddadaa::function_ada582163d1aca5e(weapon)) {
        return 1;
    }
    if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(weapon) || namespace_68e641469fde3fa7::issuperweapon(weapon)) {
        return 1;
    }
    if (namespace_9abe40d2af041eb2::isremotekillstreaktabletweapon(weaponname) || namespace_49492dacb8708592::function_b04cbd5db8951229(weaponname)) {
        return 1;
    }
    if (namespace_bba8bc8532aa4913::function_8c4ab0a7799e7ab8(weapon)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x362f
// Size: 0x6e
function function_aa6acff8443c394b(weaponname) {
    switch (weaponname) {
    case #"hash_22f1c67a16accbe":
    case #"hash_23e064160a945b76":
    case #"hash_4391d14a10c9085b":
    case #"hash_56ee829cc162271a":
    case #"hash_5be4c94863c15240":
    case #"hash_e6e5011c399831fc":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36a4
// Size: 0x3e
function function_ed29898d6e83dd3(weaponname) {
    switch (weaponname) {
    case #"hash_10480ca9423043c7":
    case #"hash_4cdc20240e59faaf":
        return 0;
    default:
        return 1;
        break;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e9
// Size: 0x287
function function_5e15cf3721cdcaab(shockstick) {
    /#
        print("<unknown string>");
    #/
    self endon("death_or_disconnect");
    shockstick endon("death");
    currentweapon = undefined;
    if (namespace_68e641469fde3fa7::grenadeinpullback()) {
        currentweapon = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
        if (shockstick.owner == self && currentweapon.basename == "shock_stick_mp") {
            return 1;
        }
        currentweapon = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
        if (!isdefined(currentweapon)) {
            currentweapon = self.currentweapon;
        }
    } else {
        currentweapon = self.currentweapon;
    }
    if (!isdefined(currentweapon) || isnullweapon(currentweapon)) {
        return 0;
    }
    if (!istrue(function_ed29898d6e83dd3(currentweapon.basename))) {
        return 0;
    }
    ammocount = self getweaponammoclip(currentweapon);
    var_64615c1842352e97 = function_cf082013d5205e0d(currentweapon);
    prevweapon = self.prevweaponobj;
    if (!isdefined(prevweapon)) {
        prevweapon = makeweapon("iw9_me_fists");
    }
    /#
        print("fire" + self getentitynumber() + "<unknown string>");
    #/
    if (!var_64615c1842352e97) {
        /#
            print("fire" + self getentitynumber() + "<unknown string>");
        #/
        var_87caac6bf5e569e7 = self.origin;
        var_11d2f075e9a0e643 = namespace_68e641469fde3fa7::getequipmenttype(currentweapon);
        shoulddropweapon = !self function_55965d2ca2ada688();
        if (!isdefined(var_11d2f075e9a0e643)) {
            return 1;
        }
        if (var_11d2f075e9a0e643 == "tactical") {
            var_87caac6bf5e569e7 = self gettagorigin("tag_accessory_right");
        } else if (var_11d2f075e9a0e643 == "lethal") {
            var_87caac6bf5e569e7 = self gettagorigin("tag_accessory_left");
        }
        if (shoulddropweapon) {
            var_6e17d9fbf3b64b04 = (0, 0, 0);
            var_6e17d9fbf3b64b04 = var_6e17d9fbf3b64b04 + anglestoforward(self.angles) * getdvarfloat(@"hash_c7f7fb9ea22e108f", 200);
            var_6e17d9fbf3b64b04 = var_6e17d9fbf3b64b04 + anglestoup(self.angles) * getdvarfloat(@"hash_b2d4c6bd7da9e85f", 100);
            namespace_df5cfdbe6e2d3812::getridofweapon(currentweapon, 1);
            namespace_df5cfdbe6e2d3812::_giveweapon(currentweapon, undefined, undefined, 1);
            var_a22f69faea7636b1 = namespace_68e641469fde3fa7::_launchgrenade(currentweapon.basename, var_87caac6bf5e569e7, var_6e17d9fbf3b64b04);
            self setweaponammoclip(currentweapon, ammocount - 1);
            namespace_3bbb5a98b932c46f::grenadeinitialize(var_a22f69faea7636b1, currentweapon, 0, self);
            namespace_3bbb5a98b932c46f::grenadeused(var_a22f69faea7636b1);
        }
        return 1;
    } else {
        return function_de0e81433eb4b20c(currentweapon);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3977
// Size: 0x26
function function_e3bcea2db6ca29bc() {
    return isdefined(self.var_318e9ed18014aada) && gettime() - self.var_318e9ed18014aada < 0.5;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a5
// Size: 0x145
function function_de0e81433eb4b20c(currentweapon) {
    /#
        print("<unknown string>");
    #/
    if (namespace_9abe40d2af041eb2::isremotekillstreaktabletweapon(currentweapon.basename)) {
        return 0;
    } else if (namespace_bba8bc8532aa4913::function_8c4ab0a7799e7ab8(currentweapon)) {
        return 0;
    } else if (namespace_e0ee43ef2dddadaa::function_5419ac7173288fc1(currentweapon)) {
        self.var_4a2f2f50a9020e2e = 1;
        self notify("cancel_location");
        return 0;
    } else if (currentweapon.basename == "deploy_sentry_mp" || currentweapon.basename == "deploy_remote_turret_mp") {
        self notify("equip_deploy_cancel");
        return 1;
    } else if (currentweapon.basename == "deploy_loadout_drop_mp") {
        /#
            print("<unknown string>");
        #/
        self notify("cancel_all_killstreak_deployments");
        return 1;
    } else if (function_84422a637aa542e2(currentweapon.basename)) {
        function_5ac47272c12bd920(currentweapon);
        if (namespace_68e641469fde3fa7::issuperweapon(currentweapon)) {
            if (function_e3bcea2db6ca29bc()) {
                namespace_85d036cb78063c4a::refundsuper();
                if (isdefined(self.var_9df92c66c8402503)) {
                    self.var_9df92c66c8402503 delete();
                }
            }
        }
        return 1;
    } else {
        if (namespace_10260b963310d30e::function_3b4a396318897a49(currentweapon)) {
            self.var_a23f35f8460d8857 = 1;
        }
        namespace_df5cfdbe6e2d3812::getridofweapon(currentweapon, 1);
        return 1;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af1
// Size: 0x102
function function_5ac47272c12bd920(weapon) {
    self endon("death_or_disconnect");
    self endon("killed_player");
    level endon("game_ended");
    ammoclip = self getweaponammoclip(weapon);
    ammostock = self getweaponammostock(weapon);
    namespace_df5cfdbe6e2d3812::_takeweapon(weapon);
    wait(0.05);
    namespace_df5cfdbe6e2d3812::_giveweapon(weapon, undefined, undefined);
    self setweaponammoclip(weapon, ammoclip);
    self setweaponammostock(weapon, ammostock);
    if (namespace_68e641469fde3fa7::issuperweapon(weapon)) {
        self assignweaponoffhandspecial(weapon);
    } else {
        equipmentref = namespace_1a507865f681850e::getequipmentreffromweapon(weapon);
        if (isdefined(equipmentref)) {
            slot = namespace_1a507865f681850e::findequipmentslot(equipmentref);
            /#
                assertex(isdefined(slot) && (slot == "primary" || slot == "secondary"), "shockstick is trying to " + equipmentref + ", but its slot is invalid.");
            #/
            if (slot == "primary") {
                self assignweaponoffhandprimary(weapon);
            } else if (slot == "secondary") {
                self assignweaponoffhandsecondary(weapon);
            }
        }
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bfa
// Size: 0x63
function function_84422a637aa542e2(weaponname) {
    if (namespace_68e641469fde3fa7::issuperweapon(weaponname)) {
        return 1;
    }
    switch (weaponname) {
    case #"hash_22f1c67a16accbe":
    case #"hash_23e064160a945b76":
    case #"hash_56ee829cc162271a":
    case #"hash_5be4c94863c15240":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c64
// Size: 0x23e
function shockstick_haywireagent(var_91beb5c3a5ab6910) {
    level endon("game_ended");
    victim = var_91beb5c3a5ab6910.victim;
    attacker = var_91beb5c3a5ab6910.attacker;
    objweapon = var_91beb5c3a5ab6910.objweapon;
    inflictor = var_91beb5c3a5ab6910.inflictor;
    if (isstruct(inflictor)) {
        inflictor = attacker;
    }
    if (victim.health > 0 && !victim namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        var_dba6bbe47bd81571 = gettime() > victim._blackboard.var_dc51d4ea36da3ae1 + getdvarint(@"hash_acf5b8fed3c019");
        victim._blackboard.var_dc51d4ea36da3ae1 = gettime();
        var_4e1c44370f1101bb = 0;
        if (!isdefined(victim.var_801217fe248465c4)) {
            victim.var_801217fe248465c4 = [];
        }
        if (!array_contains(victim.var_801217fe248465c4, self)) {
            victim.var_801217fe248465c4[victim.var_801217fe248465c4.size] = self;
            var_4e1c44370f1101bb = 1;
        }
        params = spawnstruct();
        params.var_91beb5c3a5ab6910 = var_91beb5c3a5ab6910;
        params.var_dba6bbe47bd81571 = var_dba6bbe47bd81571;
        params.var_4e1c44370f1101bb = var_4e1c44370f1101bb;
        victim callback::callback("shockStick_agentApplyHaywire", params);
        if (istrue(victim.allowpain) && victim asmhaspainstate(victim.asmname) && var_dba6bbe47bd81571) {
            victim asmevalpaintransition(victim.asmname);
        }
        victim function_4ce69562a1b41fc7(objweapon);
        if (var_dba6bbe47bd81571) {
            if (!isdefined(level.var_2d4ec6306e1af875)) {
                level.var_2d4ec6306e1af875 = function_e4c99b0f178ffb98("shockStick_haywireAgent", 1, level.framedurationseconds);
            }
            function_f632348cbb773537(level.var_2d4ec6306e1af875, victim);
            victim dodamage(1, victim.origin, attacker, inflictor, "MOD_ELEMENTAL_ELEC", objweapon, "torso_upper");
        }
        victim.var_12bfb031c0a0efd8 = 1;
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea9
// Size: 0x51
function function_5dd66ebda239d1b(data) {
    level endon("game_ended");
    if (isdefined(data.victim.var_aa6fe6af4cbbdd47)) {
        data.victim thread [[ data.victim.var_aa6fe6af4cbbdd47 ]](data);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f01
// Size: 0x2e7
function function_46b866d198a76ddc(data, var_fcef8d217a441961) {
    if (istrue(data.victim.var_12bfb031c0a0efd8)) {
        if (isdefined(data.victim.var_801217fe248465c4) && data.victim.var_801217fe248465c4.size > 0) {
            data.victim.var_801217fe248465c4 = array_remove(data.victim.var_801217fe248465c4, self);
            data.victim.var_801217fe248465c4 = array_removeundefined(data.victim.var_801217fe248465c4);
            if (data.victim.var_801217fe248465c4.size > 0) {
                return;
            }
        }
        data.victim.var_12bfb031c0a0efd8 = undefined;
        if (isagent(data.victim)) {
            params = spawnstruct();
            params.var_91beb5c3a5ab6910 = data;
            params.var_fcef8d217a441961 = var_fcef8d217a441961;
            data.victim callback::callback("shockStick_agentClearHaywire", params);
            if (data.victim isscriptable() && data.victim getscriptablehaspart("shockStickVfx")) {
                var_8a46c62f0a756dd3 = data.victim getscriptablepartstate("shockStickVfx", 1);
                if (isdefined(var_8a46c62f0a756dd3)) {
                    data.victim setscriptablepartstate("shockStickVfx", "off", 0);
                } else {
                    /#
                        /#
                            assertmsg("<unknown string>");
                        #/
                    #/
                }
            }
        } else if (isplayer(data.victim)) {
            data.victim thread function_6c0a9d95ebb14f2a(var_fcef8d217a441961);
        } else if (namespace_235de5057ddc58e0::isturret(data.victim)) {
            if (isdefined(data.victim.owner)) {
                data.victim.owner stopforcedfire();
            }
        } else if (isdefined(data.victim.var_2ca1a8cc9f467817)) {
            data.victim [[ data.victim.var_2ca1a8cc9f467817 ]](data);
        }
        if (namespace_235de5057ddc58e0::isturret(data.victim) && isdefined(data.victim.var_2ca1a8cc9f467817)) {
            data.victim [[ data.victim.var_2ca1a8cc9f467817 ]](data);
        }
        data.victim notify("haywire_cleared");
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41ef
// Size: 0x16
function function_f100472240074998(var_9b9a9fd5c7f44af0) {
    self.var_aa6fe6af4cbbdd47 = var_9b9a9fd5c7f44af0;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x420c
// Size: 0x16
function function_6eb20c71654fb6b4(var_31ab61e6884f3bc2) {
    self.var_63cf7c55a99888eb = var_31ab61e6884f3bc2;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4229
// Size: 0xd7
function function_6c0a9d95ebb14f2a(var_fcef8d217a441961, bundle) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self stopforcedfire();
    self function_7e66e7ae96dd938(0);
    blendouttime = getdvarfloat(@"hash_bcf804b0535227b8", 1.3);
    if (isdefined(bundle) && isdefined(bundle.var_1d572199f88fb41b)) {
        [[ bundle.var_1d572199f88fb41b ]]();
    } else {
        self setscriptablepartstate("shockStickVfx", "off", 0);
    }
    curweapon = self getcurrentweapon();
    if (!namespace_68e641469fde3fa7::isakimbo(curweapon)) {
        self stopgestureviewmodel("vm_ges_shockstick_react", 0.7);
        self stopgestureviewmodel("vm_ges_shockstick_react_fists", 0.7);
    }
    namespace_3bbb5a98b932c46f::updatemovespeedscale();
    if (!var_fcef8d217a441961) {
        function_a9a57668997e3c85(0);
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4307
// Size: 0xc0
function function_600c7c4c73c6a773(lock) {
    stance = self getstance();
    if (lock) {
        if (stance == "stand") {
            val::set("shockstick_stance", "crouch", 0);
            val::set("shockstick_stance", "prone", 0);
        } else if (stance == "crouch") {
            val::set("shockstick_stance", "stand", 0);
            val::set("shockstick_stance", "prone", 0);
        } else if (stance == "prone") {
            val::set("shockstick_stance", "crouch", 0);
            val::set("shockstick_stance", "stand", 0);
        }
    } else {
        val::function_c9d0b43701bdba00("shockstick_stance");
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ce
// Size: 0x80
function function_9c95c914395a9d4a(var_183bdcc9e630d8dd, radius) {
    if (!namespace_c52269d70f989750::bot_bots_enabled_or_added() && !namespace_448ccf1ca136fbbe::function_a10967d736dc56e5()) {
        return;
    }
    if (isdefined(level.var_85f0faee1e7958bb)) {
        badplace = function_619cdac2efb21978(var_183bdcc9e630d8dd, (radius, radius, 125), (0, 0, 0), level.var_85f0faee1e7958bb);
    } else {
        badplace = createnavbadplacebybounds(var_183bdcc9e630d8dd, (radius, radius, 125), (0, 0, 0));
    }
    return badplace;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4456
// Size: 0x3a
function function_5d58ea6516bf050c(duration) {
    self endon("clearShockFX");
    self endon("disconnect");
    self notify("shockFX_active");
    self endon("shockFX_active");
    thread function_17adeb1fe103990d();
    wait(duration);
    stopshockfx();
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4497
// Size: 0x9d
function function_17adeb1fe103990d() {
    self notify("stopShockFX");
    self endon("disconnect");
    self endon("stopShockFX");
    while (1) {
        if (!isreallyalive(self)) {
            return;
        }
        var_d0fe1a6b5a5e42b5 = !istrue(self isswimming());
        var_a576cb241180fb7f = istrue(self.var_a576cb241180fb7f);
        if (var_d0fe1a6b5a5e42b5 && var_a576cb241180fb7f) {
            namespace_3e725f3cc58bddd3::dequeuecorpsetablefunc("shockStickDeath");
            self.var_a576cb241180fb7f = undefined;
        } else if (!var_d0fe1a6b5a5e42b5 && !var_a576cb241180fb7f) {
            namespace_3e725f3cc58bddd3::enqueuecorpsetablefunc("shockStickDeath", &function_a09639f24d4e918e);
            self.var_a576cb241180fb7f = 1;
        }
        waitframe();
    }
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453b
// Size: 0x21
function stopshockfx() {
    self notify("stopShockFX");
    namespace_3e725f3cc58bddd3::dequeuecorpsetablefunc("shockStickDeath");
    self.var_a576cb241180fb7f = undefined;
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4563
// Size: 0x1e
function function_a09639f24d4e918e(var_3741ea5b9fb53ec3) {
    var_3741ea5b9fb53ec3 setscriptablepartstate("shockStickDeath", "vfx_start", 0);
}

// Namespace shock_stick/namespace_742e7eca5294ecdc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4588
// Size: 0x76
function function_4ce69562a1b41fc7(objweapon) {
    var_e889cecab32d8e47 = "vfx_start";
    if (isdefined(objweapon) && isdefined(objweapon.basename)) {
        switch (objweapon.basename) {
        case #"hash_4cdc20240e59faaf":
            var_e889cecab32d8e47 = "vfx_start_super";
            break;
        }
    }
    if (self getscriptablehaspart("shockStickVfx")) {
        self setscriptablepartstate("shockStickVfx", var_e889cecab32d8e47, 0);
    }
}

