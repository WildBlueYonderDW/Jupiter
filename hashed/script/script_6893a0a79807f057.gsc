// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_600b944a95c3a7bf;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;

#namespace namespace_96967e67f325d164;

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4
// Size: 0xd7
function activate() {
    var_67fff5b201c4698d = 120;
    for (i = 0; i < 3; i++) {
        spawnangle = var_67fff5b201c4698d * i + randomfloatrange(-15, 15);
        spawnpos = level.player.origin + 75 * (cos(spawnangle), sin(spawnangle), 0);
        agent = namespace_34f6a6adabfc542d::spawnnewagentaitype("support_mp_ar_base", spawnpos, (0, spawnangle, 0), level.player.team);
        agent.leader = level.player;
        agent.var_b786822d9a87ab34 = 1;
        agent thread function_2afd04eb035f975();
        agent thread function_456ff70fc6a3b1f8();
    }
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0xbd
function function_1d901a49ea1a6787() {
    var_67fff5b201c4698d = 360;
    enemyorigin = level.player.origin + anglestoforward(level.player.angles) * 1000;
    for (i = 0; i < 1; i++) {
        spawnangle = var_67fff5b201c4698d * i + randomfloatrange(-15, 15);
        spawnpos = enemyorigin + 75 * (cos(spawnangle), sin(spawnangle), 0);
        agent = namespace_34f6a6adabfc542d::spawnnewagentaitype("enemy_mp_ar_base", spawnpos, (0, spawnangle, 0), "team_hundred_ninety_five");
    }
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0x28e
function function_2afd04eb035f975() {
    self endon("death");
    self.leader endon("death_or_disconnect");
    while (1) {
        var_60fdfb1cfd734d00 = var_394466c2ddb208cb = notification = self.leader waittill("calloutmarkerping_notifyhandled");
        if (!isdefined(notification) || !isdefined(var_394466c2ddb208cb)) {
            continue;
        }
        if (notification == "calloutmarkerping_cleared" && isdefined(self.var_1f7d056b16649f4) && self.var_1f7d056b16649f4 == var_394466c2ddb208cb) {
            self notify("ping_canceled");
            self.var_1f7d056b16649f4 = undefined;
            continue;
        }
        switch (notification) {
        case #"hash_bf30d88fa3f51a24":
            pingtype = self.leader calloutmarkerping_gettype(var_394466c2ddb208cb);
            var_8512c523dca1fd8f = self.leader calloutmarkerping_getorigin(var_394466c2ddb208cb);
            if (namespace_ede58c1e66c2c280::function_c648f0fd527e089a(pingtype)) {
                var_d16c481bae2b1cd3 = self.leader calloutmarkerping_getent(var_394466c2ddb208cb);
                if (isdefined(var_d16c481bae2b1cd3)) {
                    self.var_1f7d056b16649f4 = var_394466c2ddb208cb;
                    self setgoalpos(getclosestpointonnavmesh(var_d16c481bae2b1cd3.origin));
                }
            } else if (namespace_ede58c1e66c2c280::function_5dacc89a40a58737(pingtype)) {
                var_c0e3b7c8c7c23791 = self.leader calloutmarkerping_getent(var_394466c2ddb208cb);
                if (isdefined(var_c0e3b7c8c7c23791) && isdefined(var_c0e3b7c8c7c23791.entity)) {
                    var_c0e3b7c8c7c23791 = var_c0e3b7c8c7c23791.entity;
                }
                self.favoriteenemy = var_c0e3b7c8c7c23791;
                self notify("target_switch");
                thread function_675553db448c2741(var_c0e3b7c8c7c23791);
            } else if (namespace_ede58c1e66c2c280::function_d3789a9a4be5df2e(pingtype)) {
                var_c0e3b7c8c7c23791 = self.leader calloutmarkerping_getent(var_394466c2ddb208cb);
                if (isdefined(var_c0e3b7c8c7c23791) && isdefined(var_c0e3b7c8c7c23791.entity)) {
                    var_c0e3b7c8c7c23791 = var_c0e3b7c8c7c23791.entity;
                }
                self.var_1f7d056b16649f4 = var_394466c2ddb208cb;
                self setgoalpos(getclosestpointonnavmesh(var_c0e3b7c8c7c23791.origin));
            } else {
                if (namespace_ede58c1e66c2c280::function_87df78670540e9b2(pingtype)) {
                    goto LOC_00000277;
                }
                switch (pingtype) {
                case 3:
                    break;
                case 2:
                case 4:
                    self.var_1f7d056b16649f4 = var_394466c2ddb208cb;
                    self setgoalpos(getclosestpointonnavmesh(var_8512c523dca1fd8f));
                    break;
                case 6:
                    break;
                case 5:
                    break;
                case 12:
                    break;
                default:
                    break;
                }
            LOC_00000277:
            }
        LOC_00000277:
            break;
        }
    }
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0xe3
function function_456ff70fc6a3b1f8() {
    self.leader endon("death_or_disconnect");
    while (1) {
        attacker = damage = self.leader waittill("damage");
        if (isdefined(self.favoriteenemy) && self.leader.health >= 0.5 * self.leader.maxhealth) {
            continue;
        }
        if (isdefined(attacker) && isalive(attacker) && attacker.team != self.team) {
            if (isdefined(self.favoriteenemy) && self.favoriteenemy == attacker) {
                continue;
            }
            self.favoriteenemy = attacker;
            self notify("target_switch");
            thread function_675553db448c2741(attacker);
        }
    }
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f5
// Size: 0x35
function function_675553db448c2741(attacker) {
    self endon("death");
    self endon("target_switch");
    while (1) {
        attacker waittill("death");
        self.favoriteenemy = undefined;
        return;
    }
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x731
// Size: 0x88e
function function_92cfd582ab09b167(pickup) {
    if (namespace_d3d40f75bb4e4c32::isammo(pickup.scriptablename)) {
        var_fb40d5954b4f6792 = canholdammobox(pickup.scriptablename);
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_f8a3ff0a73fa0c1d(pickup, var_fb40d5954b4f6792);
        } else if (var_fb40d5954b4f6792) {
            return 1;
        } else {
            return 4;
        }
    }
    isautouse = istrue(pickup.isautouse);
    if (isweaponpickupitem(pickup)) {
        if (namespace_f8065cafc523dba5::isinvehicle()) {
            return 17;
        }
        newweapon = namespace_3bcd40a3005712ec::function_55c5d35c8c76a95b(pickup)[0];
        foreach (weap in self.primaryweapons) {
            if (issameweapon(weap, newweapon)) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.scriptablename = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(newweapon);
                var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                if (isdefined(var_60227bff1e9478cc.scriptablename)) {
                    result = function_f8a3ff0a73fa0c1d(var_60227bff1e9478cc, canholdammobox(pickup.scriptablename));
                    if (result == 1) {
                        result = 5;
                    } else if (result == 20) {
                        result = 27;
                    }
                    return result;
                } else {
                    return 28;
                }
            }
        }
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename) && namespace_aead94004cf4c147::function_3ab0a87eeaa203bf()) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickup.scriptablename);
            result = namespace_aead94004cf4c147::function_e01d9736b2d100ac(lootid, pickup.count);
            if (istrue(result)) {
                return 20;
            }
        }
        return 1;
    }
    if (namespace_d3d40f75bb4e4c32::isequipment(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        }
        return 1;
    }
    if (isplunder(pickup.scriptablename)) {
        if (isdefined(level.br_plunder) && isdefined(level.br_plunder.plunderlimit) && self.plundercount >= level.br_plunder.plunderlimit) {
            return 11;
        }
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        }
    }
    if (isgasmask(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        }
    }
    if (function_6b5f3fb6550ae6d5(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickup.scriptablename);
            result = namespace_aead94004cf4c147::function_e01d9736b2d100ac(lootid, pickup.count);
            if (istrue(result)) {
                return 20;
            }
        }
        return 1;
    }
    if (iskillstreak(pickup.scriptablename)) {
        killstreakref = level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename];
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename) && namespace_aead94004cf4c147::function_d674d32c2d3ba5ed(self)) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickup.scriptablename);
            result = namespace_aead94004cf4c147::function_e01d9736b2d100ac(lootid, pickup.count);
            if (istrue(result)) {
                return 20;
            }
        }
        return 4;
    }
    if (issuperpickup(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (namespace_aead94004cf4c147::function_5e7049647595ab97()) {
                return function_cbbf9bf3544dc456(pickup);
            }
        }
        return 4;
    }
    if (namespace_d3d40f75bb4e4c32::isarmor(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_99ab09ba7022d107(pickup);
        }
        return 1;
    }
    if (function_a5202e2fc8ecb076(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (!isdefined(pickup.count)) {
                pickup.count = 1;
            }
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (isaccesscard(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_233d8364992b23b4(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
    }
    if (function_82d45592d750d388(pickup.scriptablename)) {
        if (function_9a5d18fbdad686c2(pickup.scriptablename)) {
            if (istrue(self.var_43b2a82936a5e974)) {
                return 23;
            } else {
                return 1;
            }
        }
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickup.scriptablename);
            index = namespace_aead94004cf4c147::function_e05897f5d860188e(lootid, pickup.count, 0);
            if (isdefined(index)) {
                var_e5fe6c50ec351711 = namespace_aead94004cf4c147::function_6738846da50730f1(index);
                if (isdefined(var_e5fe6c50ec351711) && isdefined(var_e5fe6c50ec351711[1]) && var_e5fe6c50ec351711[1] > 2) {
                    return 23;
                }
            }
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (isvaluable(pickup.scriptablename) || function_eac097ce4c683ab9(pickup.scriptablename) || function_cb1e30930c35f2e2(pickup.scriptablename) || function_5449da9d3d0358a4(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_55f0daea8408e3a9(pickup.scriptablename)) {
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (isdogtag(pickup.scriptablename)) {
        namespace_85cd45b4fe0d86fb::function_b5d4fcc3fab92696(pickup);
        if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (namespace_85cd45b4fe0d86fb::function_d9f5c5090de1241b(self, pickup.count)) {
                var_57acadc40b2f0a8 = namespace_85cd45b4fe0d86fb::getdogtagvictimandkiller(pickup.count);
                _ = var_57acadc40b2f0a8[1];
                victimindex = var_57acadc40b2f0a8[0];
                if (isdefined(level.dogtaginfo[victimindex].player)) {
                    namespace_85cd45b4fe0d86fb::function_8e643d6706defeea(level.dogtaginfo[victimindex].player, pickup.count);
                }
                if (level.dogtaginfo[victimindex].player != self) {
                    namespace_d696adde758cbe79::showdmzsplash("dmz_recover_dog_tag", [0:self], undefined);
                }
                return 1;
            }
            result = function_cbbf9bf3544dc456(pickup);
            if (result == 20) {
                if (isdefined(level.var_9a3c2481a4cd4b46)) {
                    [[ level.var_9a3c2481a4cd4b46 ]](self, pickup.count);
                }
                if (namespace_85cd45b4fe0d86fb::function_1129ba5718d33025(self, pickup.count)) {
                    thread namespace_85cd45b4fe0d86fb::function_ea29bccf97cb1b9a(self, pickup.count);
                }
                namespace_85cd45b4fe0d86fb::function_b5fbe3cb4ed955f4(self, pickup.count);
            }
            return result;
        }
        return 1;
    }
    if (namespace_d3d40f75bb4e4c32::function_4aa12e0ed3f6b745(pickup.scriptablename)) {
        var_e9cfd120b0b43ef = namespace_d3d40f75bb4e4c32::function_692c3df266580df6(pickup.scriptablename);
        if (self.var_bed158a6dfac230d < var_e9cfd120b0b43ef) {
            return 1;
        }
        return function_cbbf9bf3544dc456(pickup);
    }
    if (function_36de08ea672b354c(pickup.scriptablename)) {
        if (isdefined(self.var_338c9e20b836e44c) && self.var_338c9e20b836e44c != "brloot_perkpack_custom" && self.var_338c9e20b836e44c == pickup.scriptablename) {
            if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
                result = function_cbbf9bf3544dc456(pickup);
                if (result == 4) {
                    return 29;
                } else {
                    return result;
                }
            } else {
                return 4;
            }
        }
        return 1;
    }
    return 4;
}

// Namespace namespace_96967e67f325d164/namespace_bf7e4ac48f40185
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc7
// Size: 0x31e
function function_b95656bc9f3d0896(var_d16c481bae2b1cd3) {
    self endon("ping_canceled");
    self waittill("goal");
    var_9da49b7a0e592d6d = var_d16c481bae2b1cd3 scriptableisdoor();
    var_3d5823cc55965dd7 = var_d16c481bae2b1cd3 scriptableislootcache();
    isusable = var_d16c481bae2b1cd3 function_6954a8d7ba8cd9fb();
    if (isusable) {
        if (var_9da49b7a0e592d6d) {
            if (var_d16c481bae2b1cd3 scriptabledoorisclosed()) {
            }
        } else {
            if (var_3d5823cc55965dd7) {
                goto LOC_0000031c;
            }
            part = var_d16c481bae2b1cd3.type;
            state = var_d16c481bae2b1cd3 getscriptablepartstate(part);
            pickup = spawnstruct();
            pickup.scriptablename = var_d16c481bae2b1cd3.type;
            pickup.origin = var_d16c481bae2b1cd3.origin;
            pickup.count = loot_getitemcount(var_d16c481bae2b1cd3);
            pickup.countlefthand = loot_getitemcountlefthand(var_d16c481bae2b1cd3);
            pickup.var_e97d731bedd44c63 = function_3a5f7703319142dd(var_d16c481bae2b1cd3);
            pickup.instance = var_d16c481bae2b1cd3;
            pickup.customweaponname = var_d16c481bae2b1cd3.customweaponname;
            pickup.maxcount = level.br_pickups.maxcounts[pickup.scriptablename];
            pickup.stackable = level.br_pickups.stackable[pickup.scriptablename];
            /#
                assert(isdefined(pickup.count));
            #/
            if (!pickup.count && isdefined(level.br_pickups.counts[pickup.scriptablename])) {
                pickup.count = level.br_pickups.counts[pickup.scriptablename];
            }
            pickup.isweaponfromcrate = var_d16c481bae2b1cd3.isweaponfromcrate;
            pickup.isautouse = 0;
            if (!isdefined(var_d16c481bae2b1cd3) || var_d16c481bae2b1cd3 getscriptableisloot() && !lootusedignore(var_d16c481bae2b1cd3)) {
                results = function_92cfd582ab09b167(pickup);
                if (results == 1) {
                    return function_60234aa487445085(pickup, self, 0, var_d16c481bae2b1cd3);
                } else if (results == 20) {
                    return function_8f0bd51f5c6108b(pickup, self, 0, var_d16c481bae2b1cd3);
                } else if (results == 5 || results == 27) {
                    newweapon = namespace_3bcd40a3005712ec::function_55c5d35c8c76a95b(pickup)[0];
                    var_60227bff1e9478cc = spawnstruct();
                    var_60227bff1e9478cc.scriptablename = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(newweapon);
                    var_60227bff1e9478cc.origin = pickup.origin;
                    var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                    if (results == 5) {
                        function_60234aa487445085(var_60227bff1e9478cc, self);
                    } else {
                        function_8f0bd51f5c6108b(var_60227bff1e9478cc, self);
                    }
                    if (isdefined(var_d16c481bae2b1cd3)) {
                        loothide(var_d16c481bae2b1cd3);
                    }
                    goto LOC_0000031c;
                }
            LOC_0000031c:
            }
        LOC_0000031c:
        }
    LOC_0000031c:
    }
LOC_0000031c:
}

