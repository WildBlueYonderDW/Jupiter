// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\soldier\pain.gsc;
#using script_159f253f9bd2314e;
#using scripts\engine\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\asm\soldier\death.gsc;
#using scripts\asm\soldier\melee.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\soldier\script_funcs.gsc;

#namespace vehicle;

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f7
// Size: 0x3d
function setvehiclearchetype(asmname, statename, params) {
    self setoverridearchetype("vehicle", self._blackboard.currentvehicleanimalias, 1);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b
// Size: 0x2b
function clearvehiclearchetype(asmname, statename, params) {
    self clearoverridearchetype("vehicle", 0, 1);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x56d
// Size: 0x80
function function_35baeb62e712b6b4(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self._blackboard.currentvehicle)) {
        return 1;
    }
    var_a7f05f87335b6c63 = distancesquared(self.origin, self._blackboard.currentvehicle.origin);
    if (var_a7f05f87335b6c63 > 50000) {
        return 0;
    }
    return 1;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f5
// Size: 0x3a
function function_b3bb4d116f5a79cb(currentvehicle, position) {
    if (isdefined(currentvehicle)) {
        aianims = anim_pos(currentvehicle, position);
        return istrue(aianims.var_8af43e63a663dbd6);
    }
    return 0;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x637
// Size: 0xce
function function_ef715d817b10b063() {
    alias = "";
    if (istrue(self.var_2954e7fe0d59dc3a)) {
        alias = alias + "_4";
    } else {
        alias = alias + "_6";
    }
    if (isdefined(self.enemy)) {
        toenemy = self.enemy.origin - self.origin;
        toenemyyaw = angleclamp180(vectortoyaw(toenemy) - self.angles[1]);
        if (toenemyyaw < 0) {
            alias = alias + "_turn6";
        } else {
            alias = alias + "_turn4";
        }
    } else if (istrue(self.var_2954e7fe0d59dc3a)) {
        alias = alias + "_turn4";
    } else {
        alias = alias + "_turn6";
    }
    return alias;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d
// Size: 0x11c
function function_ad6244629719d941(aianims) {
    alias = "";
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        if (istrue(self.var_2954e7fe0d59dc3a)) {
            alias = alias + "_4";
        } else {
            alias = alias + "_6";
        }
    }
    flashed = isflashed();
    if (isdefined(self.damageyaw) && !flashed) {
        if (self.damageyaw > 135) {
            alias = alias + "_2";
        } else if (self.damageyaw > 45) {
            alias = alias + "_4";
        } else if (self.damageyaw > -45) {
            alias = alias + "_8";
        } else if (self.damageyaw > -135) {
            alias = alias + "_6";
        } else {
            alias = alias + "_2";
        }
    }
    if (istrue(self.var_58e8388f04abb64e)) {
        alias = alias + "_lean";
    }
    return alias;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x831
// Size: 0x84
function function_37da44a7cf24fdad(aianims) {
    alias = "";
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        if (istrue(self.var_2954e7fe0d59dc3a)) {
            alias = alias + "_4";
        } else {
            alias = alias + "_6";
        }
    }
    if (istrue(self.var_58e8388f04abb64e)) {
        alias = alias + "_lean";
    }
    return alias;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bd
// Size: 0x3c
function chooseanim_vehicle(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, string(self._blackboard.var_9176cae5619d7fba));
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x901
// Size: 0x11d
function function_93584fe710642bd2(asmname, statename, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        alias = alias + function_ad6244629719d941(aianims);
    }
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
    if (isdefined(var_eabf81b5be8ddb5)) {
        return asm_lookupanimfromalias(statename, alias);
    } else {
        return asm_lookupanimfromalias(statename, string(self._blackboard.var_9176cae5619d7fba));
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa25
// Size: 0xd8
function function_47a713aa81f9ae9e(asmname, statename, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        alias = alias + function_37da44a7cf24fdad(aianims);
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0xe8
function function_9cc47d66814e0219(asmname, statename, params) {
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        if (istrue(self.var_2954e7fe0d59dc3a)) {
            alias = alias + "_4";
        } else {
            alias = alias + "_6";
        }
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbf5
// Size: 0x25
function function_71542e68d0fa0478(asmname, statename, params) {
    return chooseanim_vehicle(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc22
// Size: 0x9b
function function_b2e6831f01246042(asmname, statename, params) {
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self.var_2954e7fe0d59dc3a)) {
        var_19f92fa83d7cd69 = function_ef715d817b10b063();
        alias = alias + var_19f92fa83d7cd69;
        self.var_2954e7fe0d59dc3a = !self.var_2954e7fe0d59dc3a;
        self._blackboard.var_feaa963beeb05107 = self.var_2954e7fe0d59dc3a;
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcc5
// Size: 0x186
function function_7f09702cf0b2e4b5(asmname, statename, params) {
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        if (isdefined(self.enemy)) {
            vehicle = self._blackboard.currentvehicle;
            position = self._blackboard.var_9176cae5619d7fba;
            aianims = anim_pos(vehicle, position);
            tovehicle = self.enemy.origin - vehicle.origin;
            var_b948350ee67e31fb = angleclamp180(vectortoyaw(tovehicle) - vehicle.angles[1]);
            if (var_b948350ee67e31fb < 0) {
                alias = alias + "_6";
            } else {
                alias = alias + "_4";
            }
            if (isdefined(self.var_2954e7fe0d59dc3a) && (var_b948350ee67e31fb < 0 && self.var_2954e7fe0d59dc3a || var_b948350ee67e31fb > 0 && !self.var_2954e7fe0d59dc3a)) {
                self.var_2954e7fe0d59dc3a = !self.var_2954e7fe0d59dc3a;
            }
        }
    }
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe53
// Size: 0xbb
function function_f96dcce7d9cc58a5(asmname, statename, params) {
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        vehicle = self._blackboard.currentvehicle;
        if (isdefined(vehicle.var_c4ec8708d1cba967) && isdefined(vehicle.var_c50f7508d1f1c989)) {
            self.var_5c7a1cd1128675f5 = gettime() + randomintrange(vehicle.var_c4ec8708d1cba967, vehicle.var_c50f7508d1f1c989);
        }
    }
    return function_9cc47d66814e0219(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf16
// Size: 0x30
function function_6bc1a54175023072(asmname, statename, var_f2b19b25d457c2a6, param) {
    return self [[ self.fnisinstealthidle ]]();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4e
// Size: 0x67
function vehicleincombat(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (weaponclass(self.weapon) == "rocketlauncher" && !istrue(self.var_76dddeef63852fda)) {
        return 0;
    }
    return asm_getdemeanor() == "combat" && !self [[ self.fnisinstealthhunt ]]();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfbd
// Size: 0x125
function function_222ef5b005c37d77(asmname, statename, var_f2b19b25d457c2a6, param) {
    if (!isdefined(self._blackboard.currentvehicle)) {
        return 0;
    }
    if (!function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        return 0;
    }
    vehicle = self._blackboard.currentvehicle;
    if (!isdefined(vehicle.var_c4ec8708d1cba967) || !isdefined(vehicle.var_c50f7508d1f1c989)) {
        return 0;
    }
    if (!isdefined(self.var_5c7a1cd1128675f5)) {
        self.var_5c7a1cd1128675f5 = gettime() + randomintrange(vehicle.var_c4ec8708d1cba967, vehicle.var_c50f7508d1f1c989);
    }
    if (gettime() > self.var_5c7a1cd1128675f5) {
        self.var_5c7a1cd1128675f5 = gettime() + randomintrange(vehicle.var_c4ec8708d1cba967, vehicle.var_c50f7508d1f1c989);
        return 1;
    }
    return 0;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10ea
// Size: 0x2ba
function function_d4533dcc81147462(asmname, statename, param) {
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(archetypegetrandomalias(self._blackboard.currentvehicleanimalias, statename, alias, asm_isfrantic()))) {
        return asm_lookupanimfromalias(statename, alias);
    }
    alias = alias + "_" + self._blackboard.var_b79347f04f2c0672;
    /#
        assertex(isdefined(self.var_fbe92f71b3bab094), "Vehicle Impulse Response requires collision data to exists. This data should be initialized when a collision is detected by VehicleCollisionWatcher");
    #/
    vehicle = self._blackboard.currentvehicle;
    forward = anglestoforward(vehicle.angles);
    normal = self.var_fbe92f71b3bab094.normal;
    function_535f605646d65a4d();
    /#
        setdvarifuninitialized(@"hash_e4eece17e1ee5b59", 0);
    #/
    var_8a4d4017eab53ab6 = 0.70711;
    var_cdb7a0ef79eb2457 = vectordot(forward, normal);
    if (var_cdb7a0ef79eb2457 > var_8a4d4017eab53ab6) {
        alias = alias + "_2";
        /#
            if (getdvarint(@"hash_e4eece17e1ee5b59") != 0) {
                print3d(self.origin, alias, (0, 1, 0), 1, 0.5, 100, 1);
            }
        #/
        return asm_lookupanimfromalias(statename, alias);
    } else if (var_cdb7a0ef79eb2457 < -1 * var_8a4d4017eab53ab6) {
        alias = alias + "_8";
        /#
            if (getdvarint(@"hash_e4eece17e1ee5b59") != 0) {
                print3d(self.origin, alias, (0, 1, 0), 1, 0.5, 100, 1);
            }
        #/
        return asm_lookupanimfromalias(statename, alias);
    }
    var_82623b1112d975b4 = vectorcross(forward, normal);
    if (var_82623b1112d975b4[2] > 0) {
        alias = alias + "_6";
        /#
            if (getdvarint(@"hash_e4eece17e1ee5b59") != 0) {
                print3d(self.origin, alias, (0, 1, 0), 1, 0.5, 100, 1);
            }
        #/
        return asm_lookupanimfromalias(statename, alias);
    }
    alias = alias + "_4";
    /#
        if (getdvarint(@"hash_e4eece17e1ee5b59") != 0) {
            print3d(self.origin, alias, (0, 1, 0), 1, 0.5, 100, 1);
        }
    #/
    return asm_lookupanimfromalias(statename, alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13ac
// Size: 0x24d
function function_3a547f046d6592a(asmname, statename, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        if (istrue(self.var_2954e7fe0d59dc3a)) {
            alias = alias + "_4";
        } else {
            alias = alias + "_6";
        }
    } else if (isdefined(self._blackboard.var_b79347f04f2c0672) && self._blackboard.var_b79347f04f2c0672 != 8) {
        alias = alias + "_" + self._blackboard.var_b79347f04f2c0672;
    }
    var_7d9d8a88d65590d1 = "_" + weaponclass(self.weapon);
    var_fdc520e439ffb47c = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias + var_7d9d8a88d65590d1, asm_isfrantic());
    if (isdefined(var_fdc520e439ffb47c)) {
        return asm_lookupanimfromalias(statename, alias + var_7d9d8a88d65590d1);
    } else {
        var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, statename, alias, asm_isfrantic());
        if (isdefined(var_eabf81b5be8ddb5)) {
            return asm_lookupanimfromalias(statename, alias);
        } else {
            var_fdc520e439ffb47c = archetypegetrandomalias(var_38548703ea2bdadc, statename, string(self._blackboard.var_9176cae5619d7fba) + var_7d9d8a88d65590d1, asm_isfrantic());
            if (isdefined(var_fdc520e439ffb47c)) {
                return asm_lookupanimfromalias(statename, string(self._blackboard.var_9176cae5619d7fba) + var_7d9d8a88d65590d1);
            } else {
                return asm_lookupanimfromalias(statename, string(self._blackboard.var_9176cae5619d7fba));
            }
        }
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1600
// Size: 0x28
function chooseanim_vehicleturret(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "blank");
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1630
// Size: 0x28
function chooseanim_vehicleturretdeath(asmname, statename, params) {
    return asm_lookupanimfromalias(statename, "vehicle_turret_death");
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1660
// Size: 0x158
function getvehicleanimtargetoriginandangles(vehicle, vehicleanim, var_cbfbb4efa1348391, var_7661fce9997cc9a4, vehicleangles, var_47b4bdc915cff70d) {
    result = [];
    if (!isdefined(var_47b4bdc915cff70d)) {
        var_47b4bdc915cff70d = 1;
    }
    if (isdefined(vehicle) && isdefined(var_cbfbb4efa1348391)) {
        tagorigin = vehicle gettagorigin(var_cbfbb4efa1348391);
        tagangles = vehicle gettagangles(var_cbfbb4efa1348391);
        startorigin = getstartorigin(tagorigin, tagangles, vehicleanim);
        startangles = getstartangles(tagorigin, tagangles, vehicleanim);
        movedelta = getmovedelta(vehicleanim, 0, var_47b4bdc915cff70d);
        anglesdelta = getangledelta3d(vehicleanim, 0, var_47b4bdc915cff70d)[1];
        result["startOrigin"] = startorigin;
        result["startAngles"] = startangles;
        result["targetOrigin"] = rotatevector(movedelta, startangles) + startorigin;
        result["targetAngles"] = (startangles[0], angleclamp(startangles[1] + anglesdelta), startangles[2]);
    } else {
        result["startOrigin"] = self.origin;
        result["startAngles"] = self.angles;
        result["targetOrigin"] = var_7661fce9997cc9a4;
        result["targetAngles"] = vehicleangles;
    }
    return result;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c0
// Size: 0x218
function linktovehicle(org, ang, linktoblend, sittag) {
    self forceteleport(org, ang);
    if (istrue(linktoblend)) {
        self linktoblendtotag(self._blackboard.currentvehicle, sittag, 0);
    } else {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        if (isdefined(aianims.linkoffset) && isdefined(aianims.var_3630ffa8edafef8)) {
            self linktomoveoffset(self._blackboard.currentvehicle, sittag, aianims.linkoffset, aianims.var_3630ffa8edafef8);
        } else if (istrue(self._blackboard.currentvehicle.var_9e0ade9f6d9a6b3)) {
            self linktomoveoffset(self._blackboard.currentvehicle, sittag);
        } else {
            self linktomoveoffset(self._blackboard.currentvehicle, sittag, (0, 0, 0), (0, 0, 0));
        }
    }
    vehicle = self._blackboard.currentvehicle;
    position = self._blackboard.var_9176cae5619d7fba;
    if (isdefined(vehicle) && isdefined(position)) {
        aianims = anim_pos(vehicle, position);
        if (isdefined(aianims.var_8dbb2562ec7ab3ed)) {
            self.var_2954e7fe0d59dc3a = aianims.var_8dbb2562ec7ab3ed;
            self._blackboard.var_feaa963beeb05107 = aianims.var_8dbb2562ec7ab3ed;
        }
    }
    if (isagent(self)) {
        self playerlinkedoffsetenable();
        self fixlinktointerpolationbug(1);
    }
    self._blackboard.linkedtovehicle = 1;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19df
// Size: 0x299
function faceenemyincombat(asmname, statename) {
    self endon(statename + "_finished");
    while (1) {
        canshootinvehicle = istrue(self._blackboard.var_6a69fa6b0b354c93) && istrue(self.canshootinvehicle);
        var_48000663b117f7a6 = isdefined(self._blackboard.currentvehicle) && !istrue(self._blackboard.currentvehicle.vehicledisableturningwhileshooting);
        var_8c0e7b4f9142b8a4 = isdefined(self.enemy) && (!(isplayer(self.enemy) || isai(self.enemy)) || isalive(self.enemy));
        var_46abba9d70107be = vehicleincombat(asmname, statename, statename);
        if (var_46abba9d70107be && var_8c0e7b4f9142b8a4 && canshootinvehicle && var_48000663b117f7a6) {
            axis = anglestoaxis(self._blackboard.currentvehicle.angles);
            forward = axis["forward"];
            up = axis["up"];
            yaw = getyaw(self.enemy.origin) - self._blackboard.currentvehicle.angles[1];
            yaw = angleclamp180(yaw);
            facing = rotatepointaroundvector(up, forward, yaw);
            faceangles = axistoangles(facing, vectorcross(facing, up), up);
            self orientmode("face angle 3d", faceangles);
        } else {
            self orientmode("face current angles");
        }
        /#
            if (getdvarint(@"hash_e8e7feb9b789f1d7") && var_46abba9d70107be) {
                sphere(self.origin + (0, 0, 40), 2.5, (0, 1, 0), 0, 1);
                line(self.origin + (0, 0, 40), self.origin + (0, 0, 40) + anglestoforward(self.angles) * 10, (0, 1, 0), 1, 0, 1);
            }
        #/
        waitframe();
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7f
// Size: 0x1d8
function playanim_vehicleidle(asmname, statename, params) {
    self endon(statename + "_finished");
    setvehiclearchetype();
    if (isdefined(self.var_1a3d45a997bc8446)) {
        self.aimyawspeed = self.var_1a3d45a997bc8446;
    } else {
        self.aimyawspeed = 108;
    }
    if (!istrue(self._blackboard.linkedtovehicle) && isdefined(self._blackboard.currentvehicle)) {
        self.leftaimlimit = 180;
        self.rightaimlimit = -180;
        var_917b4946225e8aba = asm_getanim(asmname, "vehicle_idle");
        var_e3fe8e8fa41efb4 = asm_getxanim("vehicle_idle", var_917b4946225e8aba);
        self.asm.targetvalues = getvehicleanimtargetoriginandangles(self._blackboard.currentvehicle, var_e3fe8e8fa41efb4, self._blackboard.var_1745d2b69c72c627, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9);
        linktovehicle(self.asm.targetvalues["targetOrigin"], self.asm.targetvalues["targetAngles"], self._blackboard.var_f6d06d1e68f4f4e5, self._blackboard.var_1745d2b69c72c627);
    }
    self animmode("nogravity");
    self orientmode("face current angles");
    animindex = asm_getanim(asmname, statename);
    self aisetanim(statename, animindex);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5e
// Size: 0x59
function function_7d994706653f02b4(asmname, statename, params) {
    self endon("death");
    self endon(statename + "_finished");
    var_767a8707bdc87a4e = randomfloatrange(0, 1.25);
    wait(var_767a8707bdc87a4e);
    setvehiclearchetype();
    asm_playanimstate(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebe
// Size: 0x2d
function function_e985e877247d21e9(asmname, statename, params) {
    setvehiclearchetype();
    playpainanim(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef2
// Size: 0x2d
function function_3cb7671ef707bc14(asmname, statename, params) {
    setvehiclearchetype();
    playanim_flashed(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f26
// Size: 0x18d
function vehicleturretshootthread(turret) {
    self endon("death");
    self endon("stop_shooting");
    turret startfiring();
    turret self_func("SetAISpread", 2);
    turret setmode("manual");
    self linktoblendtotag(turret, "tag_gunner", 0);
    var_545fcaa06cea9a1b = 0;
    var_e787b215e9fd1517 = 2;
    while (1) {
        if (isdefined(self.enemy)) {
            turret settargetentity(self.enemy);
            turret waittill("turret_on_target");
            burst = randomintrange(12, 18);
            shots = 0;
            var_3746ec1befd86ae8 = randomintrange(7, 12);
            for (i = 0; i < burst; i++) {
                shots++;
                turret shootturret();
                wait(0.05);
                if (randomint(100) < 25) {
                    wait(randomfloatrange(0.1, 0.2));
                }
                target = turret getturrettarget(0);
                if (isdefined(target) && isplayer(target) && var_545fcaa06cea9a1b < var_e787b215e9fd1517 && target.health < 60) {
                    var_545fcaa06cea9a1b++;
                    wait(3);
                }
                if (shots > var_3746ec1befd86ae8) {
                    if (isdefined(target) && issentient(target) && !isalive(target)) {
                        break;
                    }
                }
            }
        } else {
            turret cleartargetentity();
        }
        wait(0.8 + randomfloat(1));
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20ba
// Size: 0x1ba
function playanim_vehicleturret(asmname, statename, params) {
    self endon(statename + "_finished");
    utility::use_turret(self._blackboard.currentvehicle.mgturret[0], undefined);
    if (isdefined(self._blackboard.currentvehicle.mgturret[0]) && !istrue(self._blackboard.currentvehicle.mgturret[0].var_9a120b82cc83c49e)) {
        self useturret(self._blackboard.currentvehicle.mgturret[0]);
        if (isdefined(self._blackboard.currentvehicle.var_3f8ba6301ee08ff0)) {
            self._blackboard.currentvehicle thread [[ self._blackboard.currentvehicle.var_3f8ba6301ee08ff0 ]]();
        } else {
            thread vehicleturretshootthread(self._blackboard.currentvehicle.mgturret[0]);
        }
        self._blackboard.currentvehicle.mgturret[0].var_9a120b82cc83c49e = 1;
    }
    setvehiclearchetype();
    self animmode("nogravity");
    self orientmode("face current angles");
    animindex = asm_getanim(asmname, statename);
    self aisetanim(statename, animindex);
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x227b
// Size: 0xd5
function playanim_vehicleturret_terminate(asmname, statename, params) {
    clearvehiclearchetype();
    self stopuseturret();
    if (isdefined(self._blackboard.currentvehicle) && isdefined(self._blackboard.currentvehicle.mgturret)) {
        if (isdefined(self._blackboard.currentvehicle.mgturret[0])) {
            self._blackboard.currentvehicle.mgturret[0] cleartargetentity();
            self._blackboard.currentvehicle.mgturret[0] setmode("manual");
        }
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2357
// Size: 0x36
function rotatetocurrentangles() {
    self endon("death");
    self endon("EndVehicleMotionWarp");
    self endon("EndRotateToCurrentAngles");
    while (1) {
        self orientmode("face angle 3d", self.angles);
        waitframe();
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2394
// Size: 0xdd5
function enterexitvehiclemotionwarp(asmname, statename, xanim, var_cbfbb4efa1348391, exiting, var_d1b180ee30493e0b) {
    if (isplayer(self)) {
        self endon("death_or_disconnect");
    } else {
        self endon("death");
    }
    self endon("EndVehicleMotionWarp");
    animlength = getanimlength(xanim);
    var_67b5a24409d655f0 = 0;
    var_b9460e0cb9b449a3 = undefined;
    if (animhasnotetrack(xanim, "motion_warp_begin")) {
        var_67b5a24409d655f0 = getnotetracktimes(xanim, "motion_warp_begin")[0];
        var_b9460e0cb9b449a3 = "motion_warp_begin";
    }
    var_47b4bdc915cff70d = 1;
    endnote = undefined;
    if (animhasnotetrack(xanim, "motion_warp_end")) {
        var_47b4bdc915cff70d = getnotetracktimes(xanim, "motion_warp_end")[0];
        endnote = "motion_warp_end";
    }
    if (animhasnotetrack(xanim, "vehicle_cab_transition")) {
        var_82a7fde5e8ac4a68 = getnotetracktimes(xanim, "vehicle_cab_transition")[0];
        if (exiting) {
            self.var_f39c6b01b1d95542 = gettime();
            self.var_d9134148f9bb887 = gettime() + 1000 * animlength * var_82a7fde5e8ac4a68;
        } else {
            self.var_f39c6b01b1d95542 = gettime() + 1000 * animlength * var_82a7fde5e8ac4a68;
            self.var_d9134148f9bb887 = gettime() + 1000 * animlength;
        }
    }
    animindex = asm_getanim(asmname, statename);
    waittime = animlength * var_67b5a24409d655f0;
    /#
        if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
            sphere(self.origin, 2, (1, 0, 0), 0, 300);
        }
    #/
    if (exiting) {
        if (isdefined(self._blackboard.var_e5ec3a6afd92645d)) {
            thread rotatetocurrentangles();
        } else {
            if (isdefined(var_d1b180ee30493e0b)) {
                self.asm.targetvalues = getvehicleanimtargetoriginandangles(self._blackboard.currentvehicle, var_d1b180ee30493e0b, var_cbfbb4efa1348391, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9, var_47b4bdc915cff70d);
            } else {
                self.asm.targetvalues = getvehicleanimtargetoriginandangles(self._blackboard.currentvehicle, xanim, var_cbfbb4efa1348391, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9, var_47b4bdc915cff70d);
            }
            self orientmode("face angle 3d", self.asm.targetvalues["startAngles"]);
            /#
                if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
                    sphere(self.asm.targetvalues["SetAISpread"], 3, (0, 0, 1), 0, 300);
                }
            #/
        }
    } else {
        self aisetanim(statename, animindex);
        var_88ad5fe1080b1129 = self._blackboard.currentvehicle gettagorigin(var_cbfbb4efa1348391);
        var_90ff9ae0521ac213 = self._blackboard.currentvehicle gettagangles(var_cbfbb4efa1348391);
        var_7b1c8fcebb9c392d = self.origin - var_88ad5fe1080b1129;
        var_ed38213b0a9af604 = invertangles(var_90ff9ae0521ac213);
        var_ae7383494ea7fef1 = rotatevector(var_7b1c8fcebb9c392d, var_ed38213b0a9af604);
        var_b6c5de4898b7f63b = function_848155be2b7da2cb(var_90ff9ae0521ac213, self.angles);
        self linktomoveoffset(self._blackboard.currentvehicle, var_cbfbb4efa1348391, var_ae7383494ea7fef1, var_b6c5de4898b7f63b);
        /#
            if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
                sphere(self._blackboard.var_d59400d26aee998e, 3, (0, 1, 0), 0, 300);
            }
        #/
        motionwarpwithnotetracks(xanim, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9, undefined, var_b9460e0cb9b449a3, int(waittime * 1000));
    }
    wait(waittime);
    /#
        if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
            print3d(self.origin + (0, 0, 60), "face angle", (1, 1, 1), 1, 0.3, 300);
            sphere(self.origin, 2, (1, 0, 0), 0, 300);
        }
    #/
    self motionwarpcancel();
    if (!isdefined(self.asm)) {
        return;
    }
    self notify("EndRotateToCurrentAngles");
    if (isdefined(var_d1b180ee30493e0b)) {
        self.asm.targetvalues = getvehicleanimtargetoriginandangles(self._blackboard.currentvehicle, var_d1b180ee30493e0b, var_cbfbb4efa1348391, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9, var_47b4bdc915cff70d);
    } else {
        self.asm.targetvalues = getvehicleanimtargetoriginandangles(self._blackboard.currentvehicle, xanim, var_cbfbb4efa1348391, self._blackboard.var_d59400d26aee998e, self._blackboard.var_a3111c437379d9e9, var_47b4bdc915cff70d);
    }
    targetpoint = self.asm.targetvalues["targetOrigin"];
    if (exiting) {
        self.asm.targetvalues["targetAngles"] = (0, self.asm.targetvalues["targetAngles"][1], 0);
        targetpoint = getclosestpointonnavmesh(self.asm.targetvalues["targetOrigin"]);
        if (distance2dsquared(targetpoint, self.asm.targetvalues["targetOrigin"]) > 16384) {
            /#
                if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
                    print3d(self.origin, "vehicle_transition_death", (1, 1, 1), 1, 0.3, 2000, 0);
                    line(self.origin, targetpoint, (255, 165, 0), 1, 0, 2000);
                    sphere(targetpoint, 5, (255, 165, 0), 0, 2000);
                }
            #/
            targetpoint = self.asm.targetvalues["targetOrigin"];
        }
        contents = namespace_2a184fc4902783dc::create_solid_ai_contents(1);
        ignorelist = [];
        if (isdefined(self)) {
            ignorelist = array_add(ignorelist, self);
        }
        if (isdefined(self._blackboard.currentvehicle)) {
            ignorelist = array_add(ignorelist, self._blackboard.currentvehicle);
        }
        var_f8baa18de1f819b9 = targetpoint + (0, 0, 72);
        var_d88dcbcdd09a0ba8 = targetpoint + (0, 0, -1000);
        var_bcee9cd35c91eb3 = physics_spherecast(var_f8baa18de1f819b9, var_d88dcbcdd09a0ba8, 12, contents, ignorelist, "physicsquery_closest");
        if (isdefined(var_bcee9cd35c91eb3) && var_bcee9cd35c91eb3.size > 0) {
            targetpoint = var_bcee9cd35c91eb3[0]["position"];
        }
        self orientmode("face angle 3d", self.asm.targetvalues["targetAngles"]);
        /#
            if (getdvarint(@"hash_516c8a0d29dad543", 0) == 1) {
                startpoint = self.asm.targetvalues["<unknown string>"];
                startangles = self.asm.targetvalues["<unknown string>"];
                var_7aa13ee5fe2bdee6 = startpoint + anglestoforward(startangles) * 5;
                line(startpoint, var_7aa13ee5fe2bdee6, (0, 1, 0), 1, 0, 2000);
                sphere(startpoint, 1, (0, 1, 0), 0, 2000);
                line(targetpoint, self.origin, (0, 0, 1), 1, 0, 2000);
                sphere(targetpoint, 5, (0, 0, 1), 0, 2000);
                line(self.asm.targetvalues["SetAISpread"], self.origin, (1, 0, 0), 1, 0, 2000);
                sphere(self.asm.targetvalues["SetAISpread"], 5, (1, 0, 0), 0, 2000);
            }
        #/
    }
    /#
        if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
            sphere(targetpoint, 3, (0, 1, 0), 0, 300);
        }
    #/
    var_6040e7eba5e09557 = (var_47b4bdc915cff70d - var_67b5a24409d655f0) * animlength;
    self animmode("noclip");
    motionwarpwithnotetracks(xanim, targetpoint, self.asm.targetvalues["targetAngles"], var_b9460e0cb9b449a3, endnote, int(var_6040e7eba5e09557 * 1000));
    wait(var_6040e7eba5e09557);
    /#
        if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
            print3d(self.origin + (0, 0, 60), "<unknown string>", (1, 1, 1), 1, 0.3, 300);
            sphere(self.origin, 2, (1, 0, 0), 0, 300);
        }
    #/
    if (exiting) {
        if (!isdefined(self._blackboard)) {
            return;
        }
        if (istrue(self._blackboard.linkedtovehicle)) {
            self unlink();
            self._blackboard.linkedtovehicle = 0;
            self orientmode("face angle", self.asm.targetvalues["targetAngles"][1]);
            self animmode("gravity");
        }
    } else {
        self motionwarpcancel();
        self aiclearanim(statename, animindex, 0);
        self animmode("noclip");
        self orientmode("face current");
        self aisetanim(statename, animindex);
        self aisetanimtime(xanim, var_47b4bdc915cff70d);
        tagorigin = self._blackboard.currentvehicle gettagorigin(var_cbfbb4efa1348391);
        tagangles = self._blackboard.currentvehicle gettagangles(var_cbfbb4efa1348391);
        var_88e63d3aa1307c00 = distance2dsquared(self.origin, targetpoint) < 4 && abs(self.angles[0], self.asm.targetvalues["targetAngles"][0]) < 1 && abs(self.angles[1], self.asm.targetvalues["targetAngles"][1]) < 1 && abs(self.angles[2], self.asm.targetvalues["targetAngles"][2]) < 1;
        self.asm.targetvalues = undefined;
        if (!var_88e63d3aa1307c00 && var_47b4bdc915cff70d < 1) {
            var_33db3a06c680bc05 = int(1000 * animlength * (1 - var_47b4bdc915cff70d));
            motionwarpwithtimes(xanim, tagorigin, tagangles, var_47b4bdc915cff70d, 1, var_33db3a06c680bc05);
            /#
                if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
                    print3d(self.origin + (0, 0, 60), "<unknown string>", (1, 1, 1), 1, 0.3, 300);
                    sphere(tagorigin, 3, (0, 1, 0), 0, 300);
                }
            #/
            var_9473d6da1303637e = var_33db3a06c680bc05 * 0.5 / 1000;
            var_6ad3f3636dbbebed = var_33db3a06c680bc05 * 0.5 / 1000;
            movedelta = getmovedelta(xanim, 1 - (1 - var_47b4bdc915cff70d) * 0.5, 1);
            angledelta = getangledelta3d(xanim, 1 - (1 - var_47b4bdc915cff70d) * 0.5, 1);
            var_1858a5a3adf74ae6 = tagorigin - movedelta;
            var_2b59495b388d8170 = tagangles - angledelta;
            thread function_710d997ba5906931(var_9473d6da1303637e, var_1858a5a3adf74ae6, var_2b59495b388d8170, tagorigin, tagangles, var_6ad3f3636dbbebed);
        }
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
        if (!isdefined(self._blackboard) || !isdefined(self)) {
            return;
        }
        if (!istrue(self._blackboard.linkedtovehicle)) {
            linktovehicle(self.origin, self.angles, self._blackboard.var_f6d06d1e68f4f4e5, self._blackboard.var_1745d2b69c72c627);
        }
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3170
// Size: 0x16c
function function_710d997ba5906931(waitduration, targetpoint, targetangles, tagorigin, tagangles, var_6040e7eba5e09557) {
    self endon("death");
    self endon("EndVehicleMotionWarp");
    /#
        if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
            sphere(targetpoint, 3, (0, 1, 0), 0, 300);
        }
    #/
    wait(waitduration);
    var_539a5cf0803a5cfe = distance2dsquared(self.origin, targetpoint) < 40 && abs(self.angles[0], targetangles[0]) < 5 && abs(self.angles[1], targetangles[1]) < 5 && abs(self.angles[2], targetangles[2]) < 5;
    if (!var_539a5cf0803a5cfe) {
        /#
            if (namespace_fbfdc656dd3cbd79::function_745ac044fcee731b(3)) {
                print3d(self.origin + (0, 0, 60), "<unknown string>", (1, 1, 1), 1, 0.3, 300);
                sphere(self.origin, 3, (1, 0, 0), 0, 300);
            }
        #/
        self motionwarpcancel();
        self motionwarp(tagorigin, tagangles, int(var_6040e7eba5e09557 * 1000));
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x32e3
// Size: 0x1a3
function playanim_entervehicle(asmname, statename, params) {
    self endon(statename + "_finished");
    setvehiclearchetype();
    self.var_a41edf45bb0ff97 = undefined;
    self._blackboard.startedenteringvehicle = 1;
    animindex = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, animindex);
    /#
        assertex(isdefined(xanim), "Cannot find alias " + self._blackboard.var_9176cae5619d7fba + " in archetype " + self._blackboard.currentvehicleanimalias + " for state " + statename + " for " + self.classname + ". The state may not be added in the arc");
    #/
    self animmode("noclip");
    self orientmode("face current angles");
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        var_917b4946225e8aba = asm_getanim(asmname, "vehicle_idle");
        var_e3fe8e8fa41efb4 = asm_getxanim("vehicle_idle", var_917b4946225e8aba);
        thread enterexitvehiclemotionwarp(asmname, statename, xanim, self._blackboard.var_1745d2b69c72c627, 0, undefined);
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x348d
// Size: 0x200
function entervehicle_terminate(asmname, statename, params) {
    clearvehiclearchetype();
    if (isalive(self)) {
        if (!istrue(self._blackboard.linkedtovehicle) && isalive(self._blackboard.currentvehicle)) {
            linktovehicle(self.asm.targetvalues["targetOrigin"], self.asm.targetvalues["targetAngles"], self._blackboard.var_f6d06d1e68f4f4e5, self._blackboard.var_1745d2b69c72c627);
            self.asm.targetvalues = undefined;
        }
        if (isalive(self._blackboard.currentvehicle)) {
            self._blackboard.enteredvehicle = 1;
        }
    } else {
        setvehiclearchetype();
        xanim = asm_getxanim(statename, self._blackboard.var_9176cae5619d7fba);
        animtime = self aigetanimtime(statename, self._blackboard.var_9176cae5619d7fba);
        animlength = getanimlength(xanim);
        transitiontime = getnotetracktimes(xanim, "vehicle_cab_transition")[0];
        if (isdefined(transitiontime)) {
            if (animtime < transitiontime) {
                self.var_aa0214e1292a7b3 = 1;
            } else {
                self._blackboard.vehicledeathwait = (1 - animtime) * animlength;
                self._blackboard.var_c191edddbacadd2a = animtime;
                self._blackboard.var_dd5dd40921b4615c = statename;
                self.var_442eeeabc15edd0a = 1;
            }
        } else {
            self.var_aa0214e1292a7b3 = 1;
        }
    }
    self motionwarpcancel();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3694
// Size: 0x4b
function exitvehiclewatchpath(statename) {
    self endon(statename + "_finished");
    while (1) {
        if (isdefined(self.pathgoalpos)) {
            endvehiclemotionwarp();
            self animmode("gravity");
            self orientmode("face motion");
            return;
        }
        waitframe();
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x36e6
// Size: 0xc6
function function_ee4d3aa4c40e4e63(xanim) {
    /#
        waittime = getnotetracktimes(xanim, "<unknown string>")[0];
        ragdolltime = getnotetracktimes(xanim, "<unknown string>")[0];
        if (isdefined(waittime) && isdefined(ragdolltime)) {
            animlength = getanimlength(xanim);
            wait(waittime * animlength);
            endtime = gettime() + (ragdolltime - waittime) * animlength * 1000;
            while (isdefined(self) && isalive(self) && gettime() < endtime) {
                sphere(self.origin + (0, 0, 60), 4, (1, 0, 0), 0, 1);
                waitframe();
            }
        }
    #/
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x37b3
// Size: 0x249
function playanim_exitvehicle(asmname, statename, params) {
    self endon(statename + "_finished");
    self setdefaultaimlimits();
    self.requestopendoor = 1;
    self.requestopendoorparams = params;
    self.allowpain = 1;
    if (isdefined(self._blackboard.currentvehicle)) {
        if (isdefined(self._blackboard.var_a43d8e6e8a225cd2)) {
            anim_name = self._blackboard.var_a43d8e6e8a225cd2;
            self._blackboard.currentvehicle function_eb2255b847e6681c(anim_name);
        }
    }
    set_movement_speed(60);
    self aisettargetspeed(60);
    self.exitvehicle_oldturnrate = self.turnrate;
    self.turnrate = 0.3;
    setvehiclearchetype();
    animindex = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, animindex);
    /#
        assertex(isdefined(xanim), "Cannot find alias " + self._blackboard.var_9176cae5619d7fba + " in archetype " + self._blackboard.currentvehicleanimalias + " for state " + statename + " for " + self.classname + ". The state may not be added in the arc");
    #/
    self._blackboard.exitvehicleanimindex = animindex;
    /#
        if (getdvarint(@"hash_89424474a6dbe389", 0) == 1) {
            thread function_ee4d3aa4c40e4e63(xanim);
        }
    #/
    if (isdefined(self._blackboard.currentvehicle)) {
        thread enterexitvehiclemotionwarp(asmname, statename, xanim, self._blackboard.var_1745d2b69c72c627, 1, undefined);
    }
    self animmode("nogravity");
    self aisetanim(statename, animindex);
    endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, undefined, 0);
    if (endnote == "code_move") {
        thread exitvehiclewatchpath(statename);
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename), undefined, undefined, 0);
    }
    asm_fireevent(asmname, "end");
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a03
// Size: 0x25
function endvehiclemotionwarp() {
    self notify("EndVehicleMotionWarp");
    self.asm.targetvalues = undefined;
    self motionwarpcancel();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a2f
// Size: 0x435
function exitvehicle_terminate(asmname, statename, params) {
    self._blackboard.invehicle = 0;
    utility::clear_movement_speed();
    if (isdefined(self.exitvehicle_oldturnrate)) {
        self.turnrate = self.exitvehicle_oldturnrate;
        self.exitvehicle_oldturnrate = undefined;
    }
    if (!isalive(self) && !istrue(self._blackboard.var_80912ec8ade08716)) {
        if (!isdefined(self._blackboard.exitvehicleanimindex)) {
            self._blackboard.exitvehicleanimindex = asm_getanim(asmname, statename);
        }
        xanim = asm_getxanim(statename, self._blackboard.exitvehicleanimindex);
        animtime = self aigetanimtime(statename, self._blackboard.exitvehicleanimindex);
        animlength = getanimlength(xanim);
        waittime = getnotetracktimes(xanim, "vehicle_death_wait")[0];
        ragdolltime = getnotetracktimes(xanim, "vehicle_death_ragdoll")[0];
        var_a142374769d92d = isdefined(self._blackboard.currentvehicle) && self._blackboard.currentvehicle namespace_dbbb37eb352edf96::ishelicopter() && self._blackboard.currentvehicle namespace_dbbb37eb352edf96::vehicle_is_crashing();
        if (isdefined(waittime) && isdefined(ragdolltime)) {
            if (animtime < waittime) {
                self._blackboard.invehicle = 1;
            } else if (animtime < ragdolltime) {
                if (var_a142374769d92d) {
                    self._blackboard.invehicle = 1;
                } else {
                    self._blackboard.vehicledeathwait = (ragdolltime - animtime) * animlength;
                    self._blackboard.var_c191edddbacadd2a = animtime;
                    self._blackboard.var_dd5dd40921b4615c = statename;
                }
            }
        } else {
            self.var_aa0214e1292a7b3 = 1;
            transitiontime = getnotetracktimes(xanim, "vehicle_cab_transition")[0];
            if (isdefined(transitiontime)) {
                if (animtime < transitiontime) {
                    self._blackboard.vehicledeathwait = (transitiontime - animtime) * animlength;
                    self._blackboard.var_c191edddbacadd2a = animtime;
                    self._blackboard.var_dd5dd40921b4615c = statename;
                }
            }
        }
    } else if (!isalive(self)) {
        self.var_aa0214e1292a7b3 = 1;
        if (!isdefined(self._blackboard.exitvehicleanimindex)) {
            self._blackboard.exitvehicleanimindex = asm_getanim(asmname, statename);
        }
        xanim = asm_getxanim(statename, self._blackboard.exitvehicleanimindex);
        animtime = self aigetanimtime(statename, self._blackboard.exitvehicleanimindex);
        animlength = getanimlength(xanim);
        transitiontime = getnotetracktimes(xanim, "vehicle_cab_transition")[0];
        if (isdefined(transitiontime)) {
            if (animtime < transitiontime) {
                self._blackboard.vehicledeathwait = (transitiontime - animtime) * animlength;
                self._blackboard.var_c191edddbacadd2a = animtime;
                self._blackboard.var_dd5dd40921b4615c = statename;
            }
        }
    } else if (istrue(self._blackboard.linkedtovehicle)) {
        self unlink();
        self._blackboard.linkedtovehicle = 0;
    }
    if (!isdefined(self._blackboard.vehicledeathwait)) {
        endvehiclemotionwarp();
        self._blackboard.exitvehicleanimindex = undefined;
    }
    self notify("jumpedout");
    self._blackboard.exitingvehicle = 0;
    self.requestopendoor = undefined;
    self.requestopendoorparams = undefined;
    clearvehiclearchetype();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e6b
// Size: 0x37
function function_119026bd546dd180(asmname, statename, params) {
    if (!isalive(self)) {
        self.var_aa0214e1292a7b3 = 1;
    }
    clearvehiclearchetype();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea9
// Size: 0xa8
function watchvehicledeath() {
    self endon("entitydeleted");
    if (self isragdoll()) {
        return;
    }
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        while (1) {
            if (!isdefined(self)) {
                return;
            }
            if (!isdefined(vehicle) || vehicle namespace_b479ac682b93cd92::vehicle_iscorpse()) {
                if (istrue(self.var_60adc9e1ec2a70cd)) {
                    self delete();
                    return;
                }
                endvehiclemotionwarp();
                self startragdoll();
                self.skipdeathcleanup = 0;
                self.vehicle_idling = 0;
                deathcleanup();
                return;
            }
            waitframe();
        }
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3f58
// Size: 0x424
function playanim_vehicledeath(asmname, statename, params) {
    if (!isdefined(self)) {
        return;
    }
    self endon("entitydeleted");
    setvehiclearchetype();
    if (!isagent(self)) {
        if (istrue(self.var_aa0214e1292a7b3) || isdefined(self.damagemod) && (self.damagemod == "MOD_FIRE" || self.damagemod == "MOD_IMPACT")) {
            self.var_1447d8fee27482b0 = (0, 0, 0);
        }
        namespace_f0a0c13f724da4b::handleburningtodeath();
        self.burningtodeath = 0;
        var_fc8654aa4f8e7c51 = !isdefined(self._blackboard.currentvehicle) || self._blackboard.currentvehicle namespace_b479ac682b93cd92::vehicle_iscorpse();
        if (isdefined(self._blackboard.vehicledeathwait)) {
            if (!var_fc8654aa4f8e7c51) {
                xanim = animsetgetanimfromindex(self._blackboard.currentvehicleanimalias, self._blackboard.var_dd5dd40921b4615c, self._blackboard.var_9176cae5619d7fba);
                self aisetanim(self._blackboard.var_dd5dd40921b4615c, self._blackboard.var_9176cae5619d7fba, 1);
                self aisetanimtime(xanim, self._blackboard.var_c191edddbacadd2a);
                self animmode("noclip");
                if (istrue(self.var_442eeeabc15edd0a) && isdefined(self._blackboard.currentvehicle)) {
                    function_df956d52bae0b61d(xanim, self._blackboard.currentvehicle, self._blackboard.var_1745d2b69c72c627, (0, 0, 0), (0, 0, 0), self._blackboard.var_c191edddbacadd2a, 1);
                }
                thread watchvehicledeath();
                wait(self._blackboard.vehicledeathwait);
                if (!isdefined(self)) {
                    return;
                }
                self.var_1447d8fee27482b0 = (0, 0, 0);
                self._blackboard.exitvehicleanimindex = undefined;
                self._blackboard.vehicledeathwait = undefined;
            }
            endvehiclemotionwarp();
        }
        self orientmode("face current angles");
        var_5d6e6d808c153d03 = undefined;
        self.noragdoll = 0;
        var_41154210564d7c9c = function_ea379d7359bd10ae(asmname, statename, params);
        /#
            assert(isdefined(var_41154210564d7c9c) && var_41154210564d7c9c.size == 2);
        #/
        notetracks = function_c8bcc9dbbf542ce3(var_41154210564d7c9c[1], "start_ragdoll");
        if (notetracks.size != 0) {
            var_5d6e6d808c153d03 = 1;
        }
        var_10ccd1eb1d027b69 = var_fc8654aa4f8e7c51 || istrue(self._blackboard.var_80912ec8ade08716) || istrue(var_5d6e6d808c153d03) || istrue(self.var_aa0214e1292a7b3);
        var_7dfbf656d13d1a6c = !var_fc8654aa4f8e7c51 && istrue(var_5d6e6d808c153d03);
        if (var_10ccd1eb1d027b69) {
            self.skipdeathcleanup = 0;
            self.vehicle_idling = 0;
            if (istrue(self.var_aa0214e1292a7b3)) {
                self.nogravityragdoll = 1;
                self.ragdoll_immediate = 1;
                self.deathstate = "vehicle_transition_death";
                self.deathalias = "death";
            } else if (var_7dfbf656d13d1a6c) {
                self.nogravityragdoll = 1;
                self.ragdolltime = getanimlength(var_41154210564d7c9c[1]) * notetracks[0]["time"];
            } else {
                self.ragdoll_immediate = 1;
            }
        } else {
            self animmode("nogravity");
            self.noragdoll = 1;
            self.skipdeathcleanup = 1;
            thread watchvehicledeath();
        }
    } else {
        self motionwarpcancel();
        self orientmode("face current angles");
    }
    namespace_f0a0c13f724da4b::playdeathanim(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4383
// Size: 0x2d
function playanim_vehicle(asmname, statename, params) {
    setvehiclearchetype();
    asm_playanimstate(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43b7
// Size: 0x38
function function_863eaacfe47cedee(asmname, statename, params) {
    setvehiclearchetype();
    self.useanimgoalweight = 1;
    asm_playanimstate(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43f6
// Size: 0x9d
function playanim_vehiclereload(asmname, statename, params) {
    self endon("reload_terminate");
    self endon(statename + "_finished");
    setvehiclearchetype();
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    /#
        assert(animhasnotetrack(xanim, "refill clip") || animhasnotetrack(xanim, "reload done"));
    #/
    asm_playfacialanim(asmname, statename, xanim);
    asm_donotetracks(asmname, statename, undefined, undefined, undefined, 1);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x449a
// Size: 0x4e
function function_59af18a4aee683ff(asmname, statename, params) {
    setvehiclearchetype();
    self.var_58e8388f04abb64e = 1;
    self._blackboard.var_6a69fa6b0b354c93 = 1;
    asm_playanimstate(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x44ef
// Size: 0x4c
function function_97519548bded06bd(asmname, statename, params) {
    setvehiclearchetype();
    self.var_58e8388f04abb64e = 0;
    self._blackboard.var_6a69fa6b0b354c93 = 0;
    asm_playanimstate(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4542
// Size: 0x125
function function_e2cdb897d2f82507(asmname, statename, params) {
    self endon(statename + "_finished");
    self endon("death");
    setvehiclearchetype();
    vehicle = self._blackboard.currentvehicle;
    position = self._blackboard.var_9176cae5619d7fba;
    aianims = anim_pos(vehicle, position);
    namespace_98502514a7e5f809::playmeleeattacksound();
    target = namespace_28edc79fcf2fe234::bb_getmeleetarget();
    if (!isdefined(target)) {
        self orientmode("face current");
    } else if (target == self.enemy) {
        self orientmode("face enemy");
    } else {
        self orientmode("face point", target.origin);
    }
    asm_fireephemeralevent("melee_attack", "begin");
    self aisetanim(statename, asm_getanim(asmname, statename));
    namespace_98502514a7e5f809::donotetracks_vsplayer(asmname, statename, asm_getnotehandler(asmname, statename));
    asm_fireevent(asmname, "end");
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x466e
// Size: 0x2d
function vehiclereload_terminate(asmname, statename, params) {
    namespace_1a7cea57c200f504::reload_cleanup(asmname, statename, params);
    clearvehiclearchetype();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x46a2
// Size: 0x3d
function function_3c5410e410caa595(asmname, statename, var_f2b19b25d457c2a6, params) {
    return !isalive(self._blackboard.currentvehicle);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46e7
// Size: 0x17
function isnotinvehicle() {
    return !self._blackboard.invehicle;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4706
// Size: 0xc9
function function_99cabda949b9375a(asmname, statename, var_f2b19b25d457c2a6, params) {
    vehicle = self._blackboard.currentvehicle;
    position = self._blackboard.var_9176cae5619d7fba;
    aianims = anim_pos(vehicle, position);
    if (!isdefined(aianims) || !istrue(aianims.var_bcd0a0afd54c6491)) {
        return 0;
    }
    if (function_b3bb4d116f5a79cb(self._blackboard.currentvehicle, self._blackboard.var_9176cae5619d7fba)) {
        return 0;
    }
    if (self function_5b5d9b0857469a76()) {
        return 1;
    }
    return 0;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x47d7
// Size: 0x6d
function function_29fed6f5a8b07e74(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (isdefined(self._blackboard.var_b79347f04f2c0672)) {
        return (self._blackboard.var_b79347f04f2c0672 == 0 || self._blackboard.var_b79347f04f2c0672 == 8);
    }
    return 1;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x484c
// Size: 0x10b
function function_3e064916882c7b95(asmname, statename, params) {
    alias = string(self._blackboard.var_9176cae5619d7fba);
    vehicle = self._blackboard.currentvehicle;
    position = self._blackboard.var_9176cae5619d7fba;
    aianims = anim_pos(vehicle, position);
    currentdir = self._blackboard.var_b79347f04f2c0672;
    alias = alias + "_" + string(self._blackboard.var_b79347f04f2c0672);
    if (currentdir == 2) {
        alias = alias + "_turn_2";
    } else if (currentdir == 4) {
        alias = alias + "_turn_6";
    } else {
        alias = alias + "_turn_4";
    }
    return asm_lookupanimfromalias("vehicle_idle_combat_shoot_turn", alias);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x495f
// Size: 0xab
function function_b6fb6cffe3f92b36(asmname, statename, params) {
    self endon(statename + "_finished");
    setvehiclearchetype();
    self.useanimgoalweight = 1;
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    var_1be6952bb25e8aab = "vehicle_idle_combat_shoot_turn";
    self aisetanim(var_1be6952bb25e8aab, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, var_1be6952bb25e8aab, asm_getxanim(var_1be6952bb25e8aab, var_2c8936d08f85c5c1));
    endnote = asm_donotetracks(asmname, var_1be6952bb25e8aab, asm_getnotehandler(asmname, var_1be6952bb25e8aab));
    if (endnote == "code_move") {
        endnote = asm_donotetracks(asmname, var_1be6952bb25e8aab, asm_getnotehandler(asmname, var_1be6952bb25e8aab));
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4a11
// Size: 0x69
function vehicleshouldstophide(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!self issuppressed() && isdefined(self.var_edb88205b19560bd) && self.var_edb88205b19560bd) {
        return 1;
    } else {
        return (gettime() > self._blackboard.vehiclehidetime);
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a81
// Size: 0x3c
function function_fda43da6e52af4b5(asmname, statename, params) {
    self._blackboard.var_3769628964ac89c1 = 1;
    playanim_vehicle(asmname, statename, params);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac4
// Size: 0xf3
function function_b4b7ff53be58de23(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        alias = alias + function_37da44a7cf24fdad(aianims);
    }
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, var_f2b19b25d457c2a6, alias, asm_isfrantic());
    return isdefined(var_eabf81b5be8ddb5);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4bbf
// Size: 0x128
function function_b0734010e3a7e4b3(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self._blackboard.currentvehicle)) {
        vehicle = self._blackboard.currentvehicle;
        position = self._blackboard.var_9176cae5619d7fba;
        aianims = anim_pos(vehicle, position);
        alias = alias + function_ad6244629719d941(aianims);
    }
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, var_f2b19b25d457c2a6, alias, asm_isfrantic());
    if (isdefined(var_eabf81b5be8ddb5)) {
        return 1;
    } else {
        var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, var_f2b19b25d457c2a6, string(self._blackboard.var_9176cae5619d7fba), asm_isfrantic());
        return isdefined(var_eabf81b5be8ddb5);
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4cee
// Size: 0xa4
function function_b373bc69137d18d1(asmname, statename, var_f2b19b25d457c2a6, params) {
    var_38548703ea2bdadc = self._blackboard.currentvehicleanimalias;
    alias = string(self._blackboard.var_9176cae5619d7fba);
    if (isdefined(self.var_2954e7fe0d59dc3a)) {
        var_19f92fa83d7cd69 = function_ef715d817b10b063();
        alias = alias + var_19f92fa83d7cd69;
    }
    var_eabf81b5be8ddb5 = archetypegetrandomalias(var_38548703ea2bdadc, var_f2b19b25d457c2a6, alias, asm_isfrantic());
    return isdefined(var_eabf81b5be8ddb5);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9a
// Size: 0x2e
function vehicleshouldrunexit(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.vehiclerunexit);
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd0
// Size: 0x45
function vehiclegetoutcodemove(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (asm_eventfired(asmname, "code_move") && isdefined(self.pathgoalpos)) {
        return 1;
    }
    return 0;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e1d
// Size: 0x194
function function_eba2c90ee8749a0f() {
    self endon("EndVehicleCollisionThread");
    self endon("death");
    if (!isdefined(self._blackboard.currentvehicle)) {
        return;
    }
    ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self._blackboard.currentvehicle waittill("collision");
    self.var_fbe92f71b3bab094 = spawnstruct();
    self.var_fbe92f71b3bab094.position = position;
    self.var_fbe92f71b3bab094.normal = normal;
    self.var_fbe92f71b3bab094.impulse = impulse;
    forward = anglestoforward(self.angles);
    /#
        setdvarifuninitialized(@"hash_e4eece17e1ee5b59", 0);
        var_954bc44d18944071 = getdvarint(@"hash_e4eece17e1ee5b59");
        if (var_954bc44d18944071) {
            line(position, position + normal * impulse * 1000, (0, 1, 0), 1, 0, 100);
            line(position, position + forward * 100, (1, 0, 0), 1, 0, 100);
            sphere(position, 20, (0, 1, 0), 0, 100);
        }
    #/
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4fb8
// Size: 0x24
function function_c9c1b653ecdcaffd(asmname, statename, params) {
    thread function_eba2c90ee8749a0f();
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fe3
// Size: 0x1a
function function_535f605646d65a4d() {
    if (isdefined(self.var_fbe92f71b3bab094)) {
        self.var_fbe92f71b3bab094 = undefined;
    }
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5004
// Size: 0x24
function function_ea6fcddde1c07c00(asmname, statename, params) {
    self notify("EndVehicleCollisionThread");
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502f
// Size: 0x1c
function function_ef6a628ea4adc090() {
    /#
        wait(0.5);
        setdvar(@"hash_cb545ecc4d88b530", 0);
    #/
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5052
// Size: 0x17d
function function_9e3ca0a0abcf9cf0(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self._blackboard.currentvehicle) || !isdefined(self._blackboard.var_9176cae5619d7fba)) {
        return 0;
    }
    vehicle = self._blackboard.currentvehicle;
    position = self._blackboard.var_9176cae5619d7fba;
    aianims = anim_pos(vehicle, position);
    /#
        setdvarifuninitialized(@"hash_cb545ecc4d88b530", 0);
        var_f8649152ce78e00e = getdvarint(@"hash_cb545ecc4d88b530", 0);
        if (var_f8649152ce78e00e) {
            self.var_fbe92f71b3bab094 = spawnstruct();
            self.var_fbe92f71b3bab094.position = self.origin;
            self.var_fbe92f71b3bab094.normal = (1, 0, 0);
            self.var_fbe92f71b3bab094.impulse = 0.5;
            thread function_ef6a628ea4adc090();
        }
    #/
    if (!isdefined(aianims) || !istrue(aianims.var_bcd0a0afd54c6491)) {
        return 0;
    }
    if (!isdefined(self.var_fbe92f71b3bab094) || !istrue(aianims.var_70aa9eaf339ddb20)) {
        return 0;
    }
    return 1;
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x51d7
// Size: 0x81
function function_b8fad26db245639d(asmname, statename, arc, alias, xanim, message) {
    /#
        println("<unknown string>" + asmname + "<unknown string>" + statename + "<unknown string>" + arc + "<unknown string>");
        level.var_e941151b3a81c996 = 0;
        println("<unknown string>" + alias + "<unknown string>" + xanim + "<unknown string>" + message);
    #/
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x525f
// Size: 0x3b3
function function_f3e1b78b6e0b6b0(asmname, statename, arc) {
    /#
        if (!archetypeassetloaded(arc)) {
            return;
        }
        aliases = archetypegetaliases(arc, statename);
        if (!isdefined(aliases)) {
            return;
        }
        foreach (alias in aliases) {
            var_fb34eb17f76fc7a1 = archetypegetalias(arc, statename, alias, 0);
            if (isarray(var_fb34eb17f76fc7a1.anims)) {
                anims = var_fb34eb17f76fc7a1.anims;
            } else {
                anims = [0:var_fb34eb17f76fc7a1.anims];
            }
            foreach (xanim in anims) {
                waittime = getnotetracktimes(xanim, "<unknown string>")[0];
                ragdolltime = getnotetracktimes(xanim, "<unknown string>")[0];
                var_7d4694abb95101bc = getnotetracktimes(xanim, "face angle");
                var_d184203d4dd078 = getnotetracktimes(xanim, "<unknown string>");
                var_1cf3cc2bfbd90835 = getnotetracktimes(xanim, "<unknown string>");
                var_d32ff27e82ab0acc = getnotetracktimes(xanim, "<unknown string>");
                if (isdefined(var_7d4694abb95101bc) && var_7d4694abb95101bc.size > 1) {
                    function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                }
                if (isdefined(var_d184203d4dd078) && var_d184203d4dd078.size > 1) {
                    function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                }
                if (isdefined(var_7d4694abb95101bc) && var_7d4694abb95101bc.size > 0 && isdefined(var_d184203d4dd078) && var_d184203d4dd078.size > 0) {
                    if (var_7d4694abb95101bc[0] >= var_d184203d4dd078[0]) {
                        function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                    }
                    if (isdefined(var_d32ff27e82ab0acc)) {
                        if (var_d32ff27e82ab0acc.size > 0 && var_7d4694abb95101bc[0] > var_d32ff27e82ab0acc[0]) {
                            function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                        }
                        if (var_d32ff27e82ab0acc.size > 0 && var_d184203d4dd078[0] > var_d32ff27e82ab0acc[0]) {
                            function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                        }
                    }
                    if (isdefined(var_1cf3cc2bfbd90835)) {
                        if (var_1cf3cc2bfbd90835.size > 0 && var_7d4694abb95101bc[0] > var_1cf3cc2bfbd90835[0]) {
                            function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                        }
                        if (var_1cf3cc2bfbd90835.size > 0 && var_d184203d4dd078[0] > var_1cf3cc2bfbd90835[0]) {
                            function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                        }
                    }
                    var_d927de90dc779426 = getmovedelta(xanim, 0, 1);
                    var_95de91b718b5a4f2 = getmovedelta(xanim, var_7d4694abb95101bc[0], var_d184203d4dd078[0]);
                    if (abs(var_95de91b718b5a4f2[2]) < abs(var_d927de90dc779426[2]) * 0.5) {
                        function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                    }
                }
                if (isdefined(waittime) && !isdefined(ragdolltime)) {
                    function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                }
                if (!isdefined(waittime) && isdefined(ragdolltime)) {
                    function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                }
                if (isdefined(waittime) && isdefined(ragdolltime) && waittime >= ragdolltime) {
                    function_b8fad26db245639d(asmname, statename, arc, alias, xanim, "<unknown string>");
                }
            }
        }
    #/
}

// Namespace vehicle/namespace_5f32d8ce8842daed
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5619
// Size: 0x139
function function_839aa14eda8a2d82(asmname, statename, params) {
    /#
        if (isagent(self)) {
            return;
        }
        archetypes = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>", 8:"<unknown string>", 9:"<unknown string>", 10:"<unknown string>", 11:"<unknown string>", 12:"<unknown string>", 13:"<unknown string>", 14:"<unknown string>", 15:"<unknown string>", 16:"<unknown string>", 17:"<unknown string>", 18:"<unknown string>", 19:"<unknown string>"];
        foreach (arc in archetypes) {
            function_f3e1b78b6e0b6b0(asmname, statename, arc);
        }
    #/
}

