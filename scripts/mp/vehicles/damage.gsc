// mwiii decomp prototype
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\entity.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\vehicle_omnvar_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\events.gsc;

#namespace damage;

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e1
// Size: 0x26
function init() {
    level.vehicles = spawnstruct();
    init_hit_damage_data();
    init_mod_damage_data();
    init_damage_callback_data();
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0e
// Size: 0xa6
function init_damage_callback_data() {
    /#
        assertex(isdefined(level.vehicles), "init_damage_callback_data() called before level.vehicles was initialized.");
    #/
    level.vehicles.damagecallback = &callback_vehicledamage;
    level.vehicles.deathcallback = &callback_vehicledeath;
    data = spawnstruct();
    data.premoddamagecallbacks = [];
    data.postmoddamagecallbacks = [];
    data.deathcallbacks = [];
    data.var_5c1c1f2a6037c40a = [];
    level.vehicles.damagecallbacks = data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x65
function get_pre_mod_damage_callback(ref) {
    /#
        assertex(isdefined(level.vehicles), "get_pre_mod_damage_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "get_pre_mod_damage_callback() called before vehicle damage callbacks were initialized.");
    #/
    return level.vehicles.damagecallbacks.premoddamagecallbacks[ref];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb28
// Size: 0x65
function get_post_mod_damage_callback(ref) {
    /#
        assertex(isdefined(level.vehicles), "get_post_mod_damage_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "get_post_mod_damage_callback() called before vehicle damage callbacks were initialized.");
    #/
    return level.vehicles.damagecallbacks.postmoddamagecallbacks[ref];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x65
function get_death_callback(ref) {
    /#
        assertex(isdefined(level.vehicles), "get_death_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "get_death_callback() called before vehicle damage callbacks were initialized.");
    #/
    return level.vehicles.damagecallbacks.deathcallbacks[ref];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x65
function private function_5947a803f03ef1df(ref) {
    /#
        assertex(isdefined(level.vehicles), "get_additional_death_callbacks() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "get_additional_death_callbacks() called before vehicle damage callbacks were initialized.");
    #/
    return level.vehicles.damagecallbacks.var_5c1c1f2a6037c40a[ref];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6f
// Size: 0x6f
function set_pre_mod_damage_callback(ref, func) {
    /#
        assertex(isdefined(level.vehicles), "set_pre_mod_damage_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "set_pre_mod_damage_callback() called before vehicle damage callbacks were initialized.");
    #/
    level.vehicles.damagecallbacks.premoddamagecallbacks[ref] = func;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce5
// Size: 0x6f
function set_post_mod_damage_callback(ref, func) {
    /#
        assertex(isdefined(level.vehicles), "set_post_mod_damage_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "set_post_mod_damage_callback() called before vehicle damage callbacks were initialized.");
    #/
    level.vehicles.damagecallbacks.postmoddamagecallbacks[ref] = func;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5b
// Size: 0x6f
function set_death_callback(ref, func) {
    /#
        assertex(isdefined(level.vehicles), "set_death_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "set_death_callback() called before vehicle damage callbacks were initialized.");
    #/
    level.vehicles.damagecallbacks.deathcallbacks[ref] = func;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd1
// Size: 0xd8
function function_21a469b6e2805cf1(ref, func) {
    /#
        assertex(isdefined(level.vehicles), "set_death_callback() called before vehicles were initialized.");
    #/
    /#
        assertex(isdefined(level.vehicles.damagecallbacks), "set_death_callback() called before vehicle damage callbacks were initialized.");
    #/
    if (!isdefined(level.vehicles.damagecallbacks.var_5c1c1f2a6037c40a[ref])) {
        level.vehicles.damagecallbacks.var_5c1c1f2a6037c40a[ref] = [];
    }
    level.vehicles.damagecallbacks.var_5c1c1f2a6037c40a[ref] = function_6d6af8144a5131f1(level.vehicles.damagecallbacks.var_5c1c1f2a6037c40a[ref], func);
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params e, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0
// Size: 0xc5
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    self endon("death");
    data = packdamagedata(attacker, self, damage, objweapon, meansofdeath, inflictor, point, dir, modelindex, var_799f234362adb813, partname, undefined, dflags, eventid);
    data.hitloc = hitloc;
    data.timeoffset = timeoffset;
    callback_vehicledamage_internal(data);
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7c
// Size: 0xe86
function callback_vehicledamage_internal(data) {
    if (isdefined(data.attacker) && isdefined(data.attacker.classname) && data.attacker.classname == "worldspawn") {
        data.attacker = undefined;
    }
    if (!isdefined(data.attacker) || !isplayer(data.attacker)) {
        if (isdefined(data.attacker) && isdefined(data.attacker.owner)) {
            data.attacker = data.attacker.owner;
        } else if (isdefined(data.inflictor)) {
            if (isplayer(data.inflictor)) {
                data.attacker = data.inflictor;
            } else {
                data.attacker = data.inflictor.owner;
            }
        } else {
            data.attacker = undefined;
        }
    }
    if (isdefined(level.hostmigrationtimer)) {
        return;
    }
    if (isdefined(data.attacker) && !isdefined(_validateattacker(data.attacker))) {
        return;
    }
    if (game["state"] == "postgame") {
        return;
    }
    if (data.damage <= 0) {
        return;
    }
    if (istrue(self.godmode)) {
        return;
    }
    if (should_filter_out_friendly_damage(data)) {
        if (filter_out_friendly_damage(self, data.attacker)) {
            namespace_5a0f3ca265d3a4c8::function_9b1b715feb24f29f(self, data);
            return;
        }
    }
    if (istrue(self.var_135a33623c519457)) {
        namespace_5a0f3ca265d3a4c8::function_152437480e61a8a2(self, data, data.damage);
        return;
    }
    bulletdamage = isbulletdamage(data.meansofdeath);
    if (bulletdamage) {
        if (isdefined(data.attacker) && isplayer(data.attacker) && (!isdefined(data.inflictor) || data.inflictor == data.attacker || namespace_235de5057ddc58e0::isturret(data.inflictor))) {
            var_4866e2c44a0b5b1e = data.attacker getvehicle();
            if (isdefined(data.attacker.var_abd157413ac4e022)) {
                var_4866e2c44a0b5b1e = data.attacker.var_abd157413ac4e022;
            }
            if (!isdefined(level.var_514f6b203d914836)) {
                level.var_514f6b203d914836 = getdvarint(@"hash_de6cc6ced551f5f7", 0);
            }
            if (isdefined(var_4866e2c44a0b5b1e) && var_4866e2c44a0b5b1e == self && (level.var_514f6b203d914836 || !namespace_1f188a13f7e79610::vehicle_isenemytoplayer(self, data.attacker))) {
                return;
            }
        }
    }
    if (isdefined(data.meansofdeath) && isexplosivedamagemod(data.meansofdeath)) {
        if (!namespace_5a0f3ca265d3a4c8::function_c5a55810ed63c87d(data)) {
            return;
        }
    }
    var_69cfd14b4398c458 = data.damage;
    vehiclename = self.vehiclename;
    if (isdefined(vehiclename)) {
        var_bacc6dd14316758c = get_pre_mod_damage_callback(vehiclename);
        if (isdefined(var_bacc6dd14316758c)) {
            var_35ab2dabe0210d0f = self [[ var_bacc6dd14316758c ]](data);
            if (!istrue(var_35ab2dabe0210d0f)) {
                return;
            }
        }
    }
    if (non_player_should_ignore_damage(data.attacker, data.objweapon, data.inflictor, data.meansofdeath)) {
        return;
    }
    if (data.meansofdeath == "MOD_MELEE") {
        if (isdefined(vehiclename) && vehiclename == "radar_drone_recon") {
            goto LOC_000004ed;
        }
        if (isdefined(data.attacker) && isplayer(data.attacker)) {
            data.attacker namespace_74465391b3cf76b::trackcarpunches(self);
        LOC_000004ed:
        }
    LOC_000004ed:
    }
LOC_000004ed:
    if (isdefined(level.modifyvehicledamage)) {
        data.damage = self [[ level.modifyvehicledamage ]](data);
    }
    if (isarray(level.var_2d3abe16d5e2ffe6)) {
        var_9e247a064a68d942 = data.damage;
        foreach (func in level.var_2d3abe16d5e2ffe6) {
            var_188a38cf4c902143 = self [[ func ]](data);
            if (var_188a38cf4c902143 != -1) {
                var_9e247a064a68d942 = var_188a38cf4c902143;
            }
        }
        data.damage = var_9e247a064a68d942;
    }
    if (data.damage <= 0) {
        return;
    }
    var_361832452c18b9b2 = namespace_5a0f3ca265d3a4c8::function_152437480e61a8a2(self, data, data.damage);
    data.damage = namespace_5a0f3ca265d3a4c8::function_b9d933a7b78a67ad(data);
    if (data.meansofdeath == "MOD_MELEE") {
        if (isdefined(vehiclename) && vehiclename == "radar_drone_recon") {
            goto LOC_0000061d;
        }
        allowmeleedamage = 0;
        if (isdefined(level.modeallowmeleevehicledamage)) {
            allowmeleedamage = self [[ level.modeallowmeleevehicledamage ]](data);
        }
        if (!allowmeleedamage) {
            data.damage = 0;
        LOC_0000061d:
        }
    LOC_0000061d:
    } else if (data.meansofdeath == "MOD_IMPACT") {
        if (isdefined(vehiclename) && (vehiclename == "radar_drone_recon" || vehiclename == "assault_drone")) {
            if (isthrowingknife(data.objweapon) || function_160a992c78bdf589(data.objweapon)) {
                data.damage = self.maxhealth;
            } else {
                data.damage = 0;
            }
        } else {
            data.damage = 0;
        }
    } else if (isexplosivedamagemod(data.meansofdeath) || data.meansofdeath == "MOD_FIRE") {
        if (isdefined(level.modeignorevehicleexplosivedamage) && self [[ level.modeignorevehicleexplosivedamage ]](data)) {
            data.damage = 0;
        } else if (issmallsplashdamage(data.objweapon) && !isdefined(self.streakinfo)) {
            data.damage = 0;
        } else if (data.meansofdeath == "MOD_EXPLOSIVE_BULLET" && isdefined(vehiclename)) {
            data.damage = get_mod_damage(data.damage, self, data.objweapon, data.attacker);
        } else if (isdefined(vehiclename)) {
            data.damage = get_hit_damage(data.damage, self, data.objweapon);
        }
    } else if (bulletdamage) {
        if (isspreadweapon(data.objweapon)) {
            data.damage = spreadshotdamagemod(self, data.attacker, data.objweapon, data.damage, data.idflags);
        } else if (iscrossbowdamage(data.objweapon)) {
            if (isdefined(vehiclename) && (vehiclename == "radar_drone_recon" || vehiclename == "assault_drone")) {
                data.damage = self.maxhealth;
            } else if (shouldcrossbowhitmarker(self, data)) {
                data.damage = 1;
            } else {
                data.damage = 0;
            }
        } else if (isdefined(vehiclename)) {
            data.damage = get_mod_damage(data.damage, self, data.objweapon, data.attacker);
        }
    }
    if (data.damage != 0) {
        data.damage = max(1, data.damage * var_361832452c18b9b2);
    }
    namespace_5a0f3ca265d3a4c8::vehicle_damage_logevent(self, data);
    if (isdefined(vehiclename)) {
        var_7da88d9c69433487 = get_post_mod_damage_callback(vehiclename);
        if (isdefined(var_7da88d9c69433487)) {
            var_35ab2dabe0210d0f = self [[ var_7da88d9c69433487 ]](data);
            if (!istrue(var_35ab2dabe0210d0f)) {
                return;
            }
        }
    }
    vehicleref = namespace_1f188a13f7e79610::function_d93ec4635290febd();
    if (isdefined(vehicleref) && !namespace_dbbb37eb352edf96::function_b7148a3bfc4defb2()) {
        vehicledata = namespace_5a0f3ca265d3a4c8::vehicle_damage_getleveldataforvehicle(vehicleref);
        if (isdefined(vehicledata) && istrue(vehicledata.var_45c7e4f315c93c29)) {
            namespace_58a74e7d54b56e8d::updatescrapassistdata(data.attacker, data.damage);
        }
    }
    var_d6961ef4ab70843c = namespace_5a0f3ca265d3a4c8::vehicle_damage_shouldskipburndown(data);
    if (!var_d6961ef4ab70843c) {
        damagestate = namespace_5a0f3ca265d3a4c8::vehicle_damage_getstate();
        if (isdefined(damagestate) && damagestate == "heavy") {
            damagemod = ter_op(isexplosivedamagemod(data.meansofdeath) || data.meansofdeath == "MOD_FIRE", 0.15, 0.25);
            data.damage = data.damage * damagemod;
        }
    }
    namespace_5a0f3ca265d3a4c8::vehicle_damage_updatestate(data, var_d6961ef4ab70843c, 1);
    namespace_84cff6185e39aa66::vehomn_updateomnvarsondamage(self, data);
    thread namespace_141c4634b6ea7b27::function_68cdb3d30284be07();
    if (data.damage <= 0) {
        return;
    }
    if (istrue(level.vehiclegod)) {
        data.damage = 0;
    }
    non_player_log_attacker_data(data);
    modifieddamage = data.damage;
    var_b715cc72f047cbde = 1 - max(var_69cfd14b4398c458 - modifieddamage, 0) / var_69cfd14b4398c458;
    var_a711564324e5064e = data.damage >= self.health;
    iscriticaldamage = istrue(data.isrearcriticaldamage) || istrue(data.issidecriticaldamage);
    if (getdvarint(@"hash_1db87c3b655b5645", 0) == 1) {
        if (var_a711564324e5064e) {
            var_b98146816886d3c4 = "hitveharmorbreak";
        } else {
            var_b98146816886d3c4 = "hitequip";
        }
    } else {
        var_b98146816886d3c4 = "hitequip";
    }
    if (iscriticaldamage && isdefined(data.objweapon.basename)) {
        switch (data.objweapon.basename) {
        case #"hash_8c12df11df01f306":
            break;
        default:
            data.attacker thread namespace_48a08c5037514e04::givexpwithtext(#"hash_add42535de0b8b91");
            break;
        }
    }
    targetent = -1;
    if (getdvarint(@"hash_1db87c3b655b5645", 0) == 1 && !namespace_dbbb37eb352edf96::function_b7148a3bfc4defb2()) {
        if (var_a711564324e5064e) {
            deathpoint = spawn("script_model", self.origin);
            deathpoint setentityowner(data.attacker);
            deathpoint delaycall(3, &delete);
            targetent = deathpoint getentitynumber();
        } else {
            targetent = self getentitynumber();
        }
    }
    if (isdefined(data.attacker)) {
        data.attacker updatedamagefeedback(var_b98146816886d3c4, var_a711564324e5064e, iscriticaldamage, "hitequip", undefined, 1, targetent);
    }
    namespace_1fbd40990ee60ede::vehicle_occupancy_updatedamagefeedback(data);
    if (namespace_cd0b2d039510b38d::getsubgametype() == "champion") {
        level notify("post_veh_damaged", data.inflictor);
    }
    if (var_a711564324e5064e) {
        if (isdefined(data.attacker) && isplayer(data.attacker)) {
            data.attacker namespace_74465391b3cf76b::checkcarpuncherprogress(self);
        }
        if (isdefined(self.deathcallback)) {
            self thread [[ self.deathcallback ]](data.inflictor, data.attacker, data.damage, data.idflags, data.meansofdeath, data.objweapon, data.point, data.dir, data.hitloc, data.timeoffset, data.modelindex, data.partname);
        } else if (isdefined(level.vehicles) && isdefined(level.vehicles.deathcallback)) {
            self thread [[ level.vehicles.deathcallback ]](data);
        } else {
            self vehicle_finishdamage(data.inflictor, data.attacker, int(data.damage), data.idflags, data.meansofdeath, data.objweapon, data.point, data.direction_vec, data.hitloc, data.timeoffset, data.modelname, data.partname);
        }
        return;
    }
    self vehicle_finishdamage(data.inflictor, data.attacker, int(data.damage), data.damageflags, data.meansofdeath, data.objweapon, data.point, data.direction_vec, data.hitloc, data.timeoffset, data.modelname, data.var_799f234362adb813, data.partname);
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e09
// Size: 0x1ef
function callback_vehicledeath(data) {
    if (!isdefined(data.attacker) && isdefined(self.var_9328ded553f15d2b)) {
        data.attacker = self.var_9328ded553f15d2b;
    }
    if ((!isdefined(data.objweapon) || isnullweapon(data.objweapon)) && isdefined(self.var_3d917147266db534)) {
        data.objweapon = self.var_3d917147266db534;
    }
    vehiclename = self.vehiclename;
    if (isdefined(vehiclename)) {
        var_5c1c1f2a6037c40a = function_5947a803f03ef1df(vehiclename);
        if (isdefined(var_5c1c1f2a6037c40a)) {
            foreach (callback in var_5c1c1f2a6037c40a) {
                self thread [[ callback ]](data);
            }
        }
        deathcallback = get_death_callback(vehiclename);
        if (isdefined(deathcallback)) {
            deathtime = gettime();
            var_35ab2dabe0210d0f = self [[ deathcallback ]](data);
            /#
                assert(deathtime == gettime());
            #/
            if (!istrue(var_35ab2dabe0210d0f)) {
                if (isdefined(level.var_8decce720ed19f1a)) {
                    [[ level.var_8decce720ed19f1a ]](vehiclename, data.victim.team, data.attacker);
                }
                return;
            }
        }
    }
    self.health = 0;
    namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage(0);
    namespace_5a0f3ca265d3a4c8::vehicle_damage_clearvisuals(undefined, undefined, 1);
    non_player_clear_attacker_data();
    namespace_391de535501b0143::vehiclekilled(data);
    if (isdefined(level.var_8decce720ed19f1a)) {
        [[ level.var_8decce720ed19f1a ]](vehiclename, data.team, data.attacker);
    }
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fff
// Size: 0xc1
function filter_out_friendly_damage(vehicle, attacker, team) {
    if (!isdefined(attacker) && !isdefined(team)) {
        return 0;
    }
    if (namespace_5a0f3ca265d3a4c8::vehicle_damage_isownerdamageenabled(vehicle)) {
        if (isdefined(attacker) && isdefined(vehicle.owner) && attacker == vehicle.owner) {
            return 0;
        }
    }
    var_5b6c77c6825d63c2 = istrue(level.vehiclefriendlydamage) || 0;
    if (level.teambased) {
        if (!var_5b6c77c6825d63c2) {
            if (isdefined(team) && !isdefined(attacker)) {
                return namespace_1f188a13f7e79610::vehicle_isfriendlytoteam(vehicle, team);
            } else {
                return namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(vehicle, attacker);
            }
        }
        return 0;
    } else {
        if (!var_5b6c77c6825d63c2) {
            if (isdefined(attacker)) {
                return namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(vehicle, attacker);
            }
            return 0;
        }
        return 0;
    }
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c7
// Size: 0x6f
function should_filter_out_friendly_damage(data) {
    if (isdefined(data.objweapon)) {
        basename = undefined;
        if (isstring(data.objweapon)) {
            basename = data.objweapon;
        } else {
            basename = data.objweapon.basename;
        }
        if (basename == "nuke_mp") {
            return 0;
        }
    }
    return 1;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213e
// Size: 0x74
function init_mod_damage_data() {
    /#
        assertex(isdefined(level.vehicles), "init_mod_damage_data() called before level.vehicles was initialized.");
    #/
    data = spawnstruct();
    level.vehicles.moddamage = data;
    data.vehicles = [];
    data.weaponclasses = [];
    data.perks = [];
    data.attachments = [];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b9
// Size: 0x40
function get_mod_damage(damage, vehicle, objweapon, attacker) {
    modifier = get_mod_damage_modifier(vehicle, objweapon, attacker);
    return ceil(damage * modifier);
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2201
// Size: 0x2d9
function get_mod_damage_modifier(vehicle, objweapon, attacker) {
    /#
        assertex(vehicle namespace_1f188a13f7e79610::isvehicle(), "get_mod_damage_modifier() called with an invalid vehicle.");
    #/
    /#
        assertex(isdefined(objweapon), "get_mod_damage_modifier() called with an invalid objWeapon.");
    #/
    modifier = 0;
    var_8ad585800c7b3bc6 = 1;
    vehicleref = vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd();
    vehicledata = get_vehicle_mod_damage_data(vehicleref);
    if (isdefined(vehicledata)) {
        var_647150a820d29168 = objweapon.classname;
        weaponclassdata = get_weapon_class_mod_damage_data(var_647150a820d29168);
        if (isdefined(weaponclassdata)) {
            var_6150a2a43bf62f15 = vehicledata.weaponclassdata[var_647150a820d29168];
            if (isdefined(var_6150a2a43bf62f15)) {
                weaponclassdata = var_6150a2a43bf62f15;
            }
            if (weaponclassdata.modifier != 0) {
                if (weaponclassdata.ismultiplicative) {
                    var_8ad585800c7b3bc6 = var_8ad585800c7b3bc6 * weaponclassdata.modifier;
                } else {
                    modifier = modifier + weaponclassdata.modifier;
                }
            }
        }
        if (isdefined(attacker) && isdefined(attacker.perks)) {
            foreach (perkref, stackcount in attacker.perks) {
                perkdata = get_perk_mod_damage_data(perkref);
                if (isdefined(perkdata)) {
                    var_9120deed01dfd363 = vehicledata.perkdata[perkref];
                    if (isdefined(var_9120deed01dfd363)) {
                        perkdata = var_9120deed01dfd363;
                    }
                    if (perkdata.modifier != 0) {
                        if (perkdata.ismultiplicative) {
                            var_8ad585800c7b3bc6 = var_8ad585800c7b3bc6 * perkdata.modifier;
                        } else {
                            modifier = modifier + perkdata.modifier;
                        }
                    }
                }
            }
        }
        if (isdefined(objweapon.attachments)) {
            foreach (attachmentref in objweapon.attachments) {
                attachmentref = attachmentref;
                attachmentdata = get_attachment_mod_damage_data(attachmentref);
                if (isdefined(attachmentdata)) {
                    var_dedd9ad59151c25e = vehicledata.attachmentdata[attachmentref];
                    if (isdefined(var_dedd9ad59151c25e)) {
                        attachmentdata = var_dedd9ad59151c25e;
                    }
                    if (attachmentdata.modifier != 0) {
                        if (attachmentdata.ismultiplicative) {
                            var_8ad585800c7b3bc6 = var_8ad585800c7b3bc6 * attachmentdata.modifier;
                        } else {
                            modifier = modifier + attachmentdata.modifier;
                        }
                    }
                }
            }
        }
    }
    return modifier + var_8ad585800c7b3bc6;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24e2
// Size: 0xbc
function get_vehicle_mod_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.moddamage), "get_vehicle_damage_mod_data() called before init_mod_damage_data().");
    #/
    data = level.vehicles.moddamage.vehicles[ref];
    if (!isdefined(data) && istrue(create)) {
        data = spawnstruct();
        data.weaponclassdata = [];
        data.perkdata = [];
        data.attachmentdata = [];
        level.vehicles.moddamage.vehicles[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a6
// Size: 0x96
function get_weapon_class_mod_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.moddamage), "get_weapon_class_mod_damage_data() called before init_mod_damage_data().");
    #/
    data = level.vehicles.moddamage.weaponclasses[ref];
    if (!isdefined(data) && istrue(create)) {
        data = create_mod_damage_data_empty();
        level.vehicles.moddamage.weaponclasses[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2644
// Size: 0x96
function get_perk_mod_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.moddamage), "get_perk_mod_damage_data() called before init_mod_damage_data().");
    #/
    data = level.vehicles.moddamage.perks[ref];
    if (!isdefined(data) && istrue(create)) {
        data = create_mod_damage_data_empty();
        level.vehicles.moddamage.perks[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e2
// Size: 0x96
function get_attachment_mod_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.moddamage), "get_attachment_mod_damage_data() called before init_mod_damage_data().");
    #/
    data = level.vehicles.moddamage.attachments[ref];
    if (!isdefined(data) && istrue(create)) {
        data = create_mod_damage_data_empty();
        level.vehicles.moddamage.attachments[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2780
// Size: 0x5f
function set_weapon_class_mod_damage_data(ref, mod, var_21e99fcec7e19345) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    data = get_weapon_class_mod_damage_data(ref, 1);
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e6
// Size: 0xa5
function set_weapon_class_mod_damage_data_for_vehicle(ref, mod, var_21e99fcec7e19345, vehicleref) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    vehicledata = get_vehicle_mod_damage_data(vehicleref, 1);
    get_weapon_class_mod_damage_data(ref, 1);
    data = vehicledata.weaponclassdata[ref];
    if (!isdefined(data)) {
        data = create_mod_damage_data_empty();
    }
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
    vehicledata.weaponclassdata[ref] = data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2892
// Size: 0x5f
function set_perk_mod_damage_data(ref, mod, var_21e99fcec7e19345) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    data = get_perk_mod_damage_data(ref, 1);
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28f8
// Size: 0xa5
function set_perk_mod_damage_data_for_vehicle(ref, mod, var_21e99fcec7e19345, vehicleref) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    vehicledata = get_vehicle_mod_damage_data(vehicleref, 1);
    get_perk_mod_damage_data(ref, 1);
    data = vehicledata.perkdata[ref];
    if (!isdefined(data)) {
        data = create_mod_damage_data_empty();
    }
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
    vehicledata.perkdata[ref] = data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x29a4
// Size: 0x5f
function set_attachment_mod_damage_data(ref, mod, var_21e99fcec7e19345) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    data = get_attachment_mod_damage_data(ref, 1);
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0a
// Size: 0xa5
function set_attachment_mod_damage_data_for_vehicle(ref, mod, var_21e99fcec7e19345, vehicleref) {
    if (var_21e99fcec7e19345) {
        /#
            assertex(mod > 0, "mod must be > 0 when modIsMult is true.");
        #/
    }
    vehicledata = get_vehicle_mod_damage_data(vehicleref, 1);
    get_attachment_mod_damage_data(ref, 1);
    data = vehicledata.attachmentdata[ref];
    if (!isdefined(data)) {
        data = create_mod_damage_data_empty();
    }
    data.modifier = mod;
    data.ismultiplicative = var_21e99fcec7e19345;
    vehicledata.attachmentdata[ref] = data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab6
// Size: 0x2e
function create_mod_damage_data_empty() {
    data = spawnstruct();
    data.modifier = 0;
    data.ismultiplicative = 0;
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aec
// Size: 0x93
function shouldcrossbowhitmarker(vehicle, data) {
    if (function_6065fce6cdcad(data.objweapon)) {
        return 1;
    }
    tags = function_786c7ec25aad5005(vehicle, data);
    foreach (tagname in tags) {
        if (function_ee1ff9eed64d1e5d(vehicle, tagname, 0)) {
            return 1;
        }
    }
    return 0;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b87
// Size: 0x5a
function init_hit_damage_data() {
    /#
        assertex(isdefined(level.vehicles), "init_hit_damage_data() called before level.vehicles was initialized.");
    #/
    data = spawnstruct();
    level.vehicles.hitdamage = data;
    data.vehicles = [];
    data.weapons = [];
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be8
// Size: 0x123
function get_hit_damage(damage, vehicle, objweapon) {
    vehicleref = vehicle.vehiclename;
    weaponref = objweapon.basename;
    vehicledata = get_vehicle_hit_damage_data(vehicleref);
    weapondata = get_weapon_hit_damage_data(weaponref);
    if (isdefined(vehicledata) && isdefined(weapondata)) {
        hitstokill = weapondata.vehiclehitstokill[vehicleref];
        if (!isdefined(hitstokill) || hitstokill == 0) {
            hitstokill = vehicledata.hitstokill;
        }
        hitsperattack = vehicledata.weaponhitsperattack[weaponref];
        if (!isdefined(hitsperattack) || hitsperattack == 0) {
            hitsperattack = weapondata.hitsperattack;
        }
        if (hitstokill > 0 && hitsperattack > 0 && !istrue(vehicle.var_1faa3d3dec8d49bd)) {
            healthratio = hitsperattack / hitstokill;
            damage = int(ceil(healthratio * vehicle.maxhealth));
        }
    }
    return damage;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d13
// Size: 0xbc
function get_vehicle_hit_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.hitdamage), "get_vehicle_hit_damage_data() called before init_vehicle_damage_data().");
    #/
    data = level.vehicles.hitdamage.vehicles[ref];
    if (!isdefined(data) && istrue(create)) {
        data = spawnstruct();
        data.ref = ref;
        data.hitstokill = 0;
        data.weaponhitsperattack = [];
        level.vehicles.hitdamage.vehicles[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd7
// Size: 0xbc
function get_weapon_hit_damage_data(ref, create) {
    /#
        assertex(isdefined(level.vehicles.hitdamage), "get_weapon_hit_damage_data() called before init_vehicle_damage_data().");
    #/
    data = level.vehicles.hitdamage.weapons[ref];
    if (!isdefined(data) && istrue(create)) {
        data = spawnstruct();
        data.ref = ref;
        data.hitsperattack = 0;
        data.vehiclehitstokill = [];
        level.vehicles.hitdamage.weapons[ref] = data;
    }
    return data;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9b
// Size: 0x46
function set_vehicle_hit_damage_data(ref, hitstokill) {
    /#
        assertex(hitstokill > 0, "hitsToKill cannot be a negative value.");
    #/
    data = get_vehicle_hit_damage_data(ref, 1);
    data.hitstokill = hitstokill;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x64
function set_vehicle_hit_damage_data_for_weapon(ref, hitstokill, weaponref) {
    /#
        assertex(hitstokill > 0, "hitsToKill cannot be a negative value.");
    #/
    data = get_vehicle_hit_damage_data(ref, 1);
    weapondata = get_weapon_hit_damage_data(weaponref, 1);
    weapondata.vehiclehitstokill[ref] = hitstokill;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f53
// Size: 0x46
function set_weapon_hit_damage_data(ref, hitsperattack) {
    /#
        assertex(hitsperattack > 0, "hitsPerAttack cannot be a negative value.");
    #/
    data = get_weapon_hit_damage_data(ref, 1);
    data.hitsperattack = hitsperattack;
}

// Namespace damage/namespace_ad22b9cf6a2b30d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fa0
// Size: 0x64
function set_weapon_hit_damage_data_for_vehicle(ref, hitsperattack, vehicleref) {
    /#
        assertex(hitsperattack > 0, "hitsPerAttack cannot be a negative value.");
    #/
    data = get_weapon_hit_damage_data(ref, 1);
    vehicledata = get_vehicle_hit_damage_data(vehicleref, 1);
    vehicledata.weaponhitsperattack[ref] = hitsperattack;
}

