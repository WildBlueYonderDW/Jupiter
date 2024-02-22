// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_48814951e916af89;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\vehicle\vehicle_common.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\vehicle_code.gsc;

#namespace namespace_35e55eb0037e4a11;

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x251
// Size: 0x47
function function_e09936350b8d90fe() {
    data = spawnstruct();
    data.spawnheli = &function_c8189fd441946d86;
    data.var_e0fd93cddc4b8912 = &function_595d4ebd73e6b933;
    data.flyaway = &function_5eb66c5c1382fed;
    return data;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0
// Size: 0x89
function function_c8189fd441946d86(var_7e5a592e28788406) {
    heli = function_b232793fe47c01b9();
    heli thread function_282ffb050875ade6(var_7e5a592e28788406);
    namespace_3bbb5a98b932c46f::function_e00b77a9cb4d8322(heli);
    heli.var_f6a794b2d3dc63e7 = &function_90ac39c3f9e0bc50;
    heli.flaresreservecount = 1;
    heli.flareslive = [];
    if (namespace_3c37cb17ade254d::issharedfuncdefined("flares", "handleIncomingStinger")) {
        heli thread [[ namespace_3c37cb17ade254d::getsharedfunc("flares", "handleIncomingStinger") ]](&function_8fe1775245b13b6f);
    }
    return heli;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x331
// Size: 0x12e
function private function_b232793fe47c01b9() {
    node = getclosest((self.vehicle.origin + self.end.origin) * 0.5, level.var_77aa416377054823);
    var_c229d93c0bb4f8e8 = spawnstruct();
    var_c229d93c0bb4f8e8.origin = node.origin;
    var_c229d93c0bb4f8e8.angles = node.angles;
    var_c229d93c0bb4f8e8.classname_mp = "script_vehicle_heli_medium";
    var_c229d93c0bb4f8e8.vehicletype = "lbravo_infil_cp";
    heli = namespace_1f188a13f7e79610::vehicle_spawn("little_bird", var_c229d93c0bb4f8e8);
    heli.var_a1a5d39c25c6d70b = 1;
    heli.gunners = [];
    heli.gunners[heli.gunners.size] = function_7512e3d88c4083fa(heli, 3);
    heli.gunners[heli.gunners.size] = function_7512e3d88c4083fa(heli, 4);
    heli.var_de315b064bb20d9 = node;
    return heli;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x467
// Size: 0x35
function function_e1a0ba4bbcab4d69(heli) {
    heli waittill("death");
    if (isdefined(self) && isalive(self)) {
        self.nocorpse = 1;
        namespace_bfef6903bca5845d::function_28b90eb2b591003f();
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a3
// Size: 0x15e
function private function_7512e3d88c4083fa(heli, var_cdbb4a9588abef59) {
    origin = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, heli.origin);
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, heli.angles, "absolute", "mission", "vehicleDriveHeliDriver", undefined, undefined, undefined, self.node.poi, 1, undefined, 0);
    if (!isdefined(agent)) {
        /#
            println("circle");
        #/
        return undefined;
    }
    var_b87e69df003b39f5 = heli namespace_4ff41449ab14a3a0::get_availablepositions();
    agent.script_startingposition = var_cdbb4a9588abef59;
    pos = heli namespace_4ff41449ab14a3a0::choose_vehicle_position(agent, var_b87e69df003b39f5, 0);
    agent namespace_fbfdc656dd3cbd79::entervehicle(heli, 1, pos, namespace_4ff41449ab14a3a0::anim_pos(heli, pos.vehicle_position));
    agent.vehicle_position = pos.vehicle_position;
    agent.goalradius = 10000;
    agent.maxsightdistsqrd = squared(10000);
    agent function_9215ce6fc83759b9(10000);
    agent.ignoreall = 1;
    return agent;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x609
// Size: 0x116
function function_282ffb050875ade6(vehicle) {
    self endon("death");
    self endon("flyaway");
    self setmaxpitchroll(20, 20);
    self setneargoalnotifydist(150);
    var_8e95e5b8fd976f6 = 0;
    updaterate = 0.1;
    self.var_83be9a2713b0d741 = 0;
    while (1) {
        wait(updaterate);
        if (!isdefined(vehicle)) {
            thread function_5eb66c5c1382fed();
            return;
        }
        if (istrue(self.var_e99777b08fe2d86b)) {
            continue;
        }
        veh_speed = vehicle vehicle_getspeed();
        var_8e95e5b8fd976f6 = 0;
        var_8c1d7e7ae38471bd = distance2dsquared(self.origin, vehicle.var_52a27c0888f8eab7);
        self vehicle_setspeed(150, 30, 30);
        if (var_8c1d7e7ae38471bd > 16777216) {
            thread function_a051d3cda138645(vehicle.var_52a27c0888f8eab7, 1, vehicle);
        } else if (var_8c1d7e7ae38471bd > 1048576) {
            thread function_a051d3cda138645(vehicle.var_52a27c0888f8eab7, 1, vehicle);
        }
        if (function_93b8918609703560()) {
            thread function_5eb66c5c1382fed();
            return;
        }
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x726
// Size: 0x2a7
function function_692565a9023d24d7(vehicle, heli) {
    heli endon("stop_throwing");
    heli endon("death");
    heli endon("flyaway");
    heli.var_e99777b08fe2d86b = 0;
    var_275ccd4650eae652 = (0, 0, 0);
    var_2427db20dedd2237 = (0, 0, 0);
    var_6caddec344e5f991 = 0;
    var_8250186c6d2d1e2c = 0;
    var_4d31b9022a51b776 = heli.origin;
    while (1) {
        if (!isdefined(vehicle)) {
            return;
        }
        if (heli function_93b8918609703560()) {
            heli thread function_5eb66c5c1382fed();
            return;
        }
        diff = heli.origin - var_4d31b9022a51b776;
        var_4d31b9022a51b776 = heli.origin;
        var_8c1d7e7ae38471bd = distance2dsquared(heli.origin, vehicle.var_52a27c0888f8eab7);
        if (!istrue(heli.var_e99777b08fe2d86b)) {
            if (var_8c1d7e7ae38471bd < 1048576) {
                heli vehicle_setspeed(125, 20, 20);
                speed = vehicle vehicle_getspeed();
                var_275ccd4650eae652 = vehicle.var_52a27c0888f8eab7 - 1000 * vectornormalize(vehicle.var_52a27c0888f8eab7 - heli.origin);
                var_2427db20dedd2237 = vehicle.var_52a27c0888f8eab7 + 1000 * vectornormalize(vehicle.var_52a27c0888f8eab7 - heli.origin);
                var_275ccd4650eae652 = (var_275ccd4650eae652[0], var_275ccd4650eae652[1], heli.origin[2]);
                var_2427db20dedd2237 = (var_2427db20dedd2237[0], var_2427db20dedd2237[1], heli.origin[2]);
                startdist = distance2dsquared(heli.origin, var_275ccd4650eae652);
                if (startdist < 122500) {
                    heli.var_e99777b08fe2d86b = 1;
                    var_6caddec344e5f991 = 0;
                    var_8250186c6d2d1e2c = 0;
                } else {
                    heli thread function_a051d3cda138645(var_275ccd4650eae652, 0, vehicle);
                }
            }
        }
        if (istrue(heli.var_e99777b08fe2d86b)) {
            heli vehicle_setspeed(120, 20, 20);
            heli thread function_a051d3cda138645(var_2427db20dedd2237, 0, vehicle);
            if (var_8c1d7e7ae38471bd < squared(2500)) {
                var_6caddec344e5f991 = var_6caddec344e5f991 + length(diff);
                if (var_6caddec344e5f991 > 500) {
                    var_6caddec344e5f991 = var_6caddec344e5f991 - 500;
                    var_8250186c6d2d1e2c++;
                    thread function_88b12c91f836c975(heli, vehicle);
                }
            } else {
                heli.var_e99777b08fe2d86b = 0;
            }
            if (var_8250186c6d2d1e2c > 8) {
                heli.var_e99777b08fe2d86b = 0;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d4
// Size: 0x152
function function_595d4ebd73e6b933() {
    self.vehicle endon("death");
    self endon("task_ended");
    var_96cff7319bc0421a = [0:self.vehicle.origin, 1:self.vehicle.origin, 2:self.vehicle.origin, 3:self.vehicle.origin];
    maxindex = 3;
    var_448456f634611aaf = 0;
    while (1) {
        speed = self.vehicle vehicle_getspeed();
        var_b413a5de3aa90b12 = 17.6;
        forward = vectornormalize(self.vehicle.origin - var_96cff7319bc0421a[var_448456f634611aaf]);
        var_96cff7319bc0421a[var_448456f634611aaf] = self.vehicle.origin;
        var_448456f634611aaf = ter_op(var_448456f634611aaf < maxindex - 1, var_448456f634611aaf + 1, 0);
        self.vehicle.var_52a27c0888f8eab7 = self.vehicle.origin + forward * speed * var_b413a5de3aa90b12 * 6;
        wait(0.5);
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb2d
// Size: 0xdc
function private function_88b12c91f836c975(heli, vehicle) {
    if (!istrue(heli.var_dac7ebf81da6ba53)) {
        var_e2b2bbd9e6539f11 = namespace_54d20dd0dd79277f::getteamdata(vehicle.var_a21a9516d1dede9e, "players");
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("vehicledrive_helibomb", var_e2b2bbd9e6539f11);
        heli.var_dac7ebf81da6ba53 = 1;
    }
    if (heli function_93b8918609703560()) {
        heli thread function_5eb66c5c1382fed();
        return;
    }
    gunner = getclosest(vehicle.origin, heli.gunners);
    start = gunner.origin + (0, 0, 40) + anglestoforward(gunner.angles) * 10;
    thread function_61aa56cc8bf30b2f(start, heli);
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc10
// Size: 0xb0
function function_61aa56cc8bf30b2f(origin, heli) {
    level notify("dropping_bombs");
    c4 = magicgrenademanual("c4_dmz_heli", origin, (0, 0, -100));
    c4 setotherent(heli);
    c4.angles = (0, randomfloat(360), 0) + (-90, 180, 0);
    c4 setscriptablepartstate("effects", "neutral");
    c4 thread function_8a112ffdc7706922();
    c4 waittill_any_timeout_1(8, "detonate");
    c4 setscriptablepartstate("effects", "explode");
    wait(3);
    c4 delete();
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc7
// Size: 0x104
function function_8a112ffdc7706922(vehicle) {
    self endon("entitydeleted");
    playerdist = squared(200);
    var_e4f2397e1dd763a3 = squared(275);
    while (1) {
        var_e6ccd23fed826d6 = 0;
        foreach (player in level.players) {
            if (!player namespace_f8065cafc523dba5::isinvehicle()) {
                if (distancesquared(self.origin, player.origin) < playerdist) {
                    var_e6ccd23fed826d6 = 1;
                }
            } else if (distancesquared(self.origin, player.vehicle.origin) < var_e4f2397e1dd763a3) {
                var_e6ccd23fed826d6 = 1;
            }
        }
        if (var_e6ccd23fed826d6) {
            break;
        }
        waitframe();
    }
    self notify("detonate");
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd2
// Size: 0x65
function function_90ac39c3f9e0bc50(damage_data) {
    if (isdefined(damage_data.meansofdeath)) {
        if (isexplosivedamagemod(damage_data.meansofdeath)) {
            namespace_dbbb37eb352edf96::vehicle_kill(damage_data.attacker);
        } else if (isbulletdamage(damage_data.meansofdeath)) {
            return 5;
        }
    }
    return damage_data.damage;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3f
// Size: 0xf3
function function_8fe1775245b13b6f(player, var_82fd3ee8fbace30e, missiletarget, var_5991f0e5da9f9bd5) {
    self endon("death");
    while (1) {
        if (!isdefined(missiletarget)) {
            break;
        }
        center = missiletarget getpointinbounds(0, 0, 0);
        curdist = distance(self.origin, center);
        if (curdist < 4000 && missiletarget.flaresreservecount > 0) {
            missiletarget.flaresreservecount--;
            missiletarget thread function_c0afe8bb86f32d06(var_5991f0e5da9f9bd5);
            newtarget = undefined;
            if (issharedfuncdefined("flares", "deploy")) {
                newtarget = missiletarget [[ getsharedfunc("flares", "deploy") ]]();
            }
            self.var_afcd53cfa79abccf = 1;
            self missile_settargetent(newtarget);
            self notify("missile_pairedWithFlare");
            level notify("flares", player);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x49
function function_c0afe8bb86f32d06(var_5991f0e5da9f9bd5) {
    var_23e275144756d0 = "tag_origin";
    if (isdefined(var_5991f0e5da9f9bd5)) {
        var_23e275144756d0 = var_5991f0e5da9f9bd5;
    }
    playsoundatpos(self gettagorigin(var_23e275144756d0), "ks_ac130_flares");
    playfxontag(getfx("gunship_flares"), self, var_23e275144756d0);
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf89
// Size: 0xcf
function function_5eb66c5c1382fed() {
    self endon("death");
    if (istrue(self.var_c1e02d477104abd0)) {
        return;
    }
    self notify("flyaway");
    self.var_c1e02d477104abd0 = 1;
    self setvehgoalpos(self.var_de315b064bb20d9.origin, 1);
    self vehicle_setspeed(80, 25, 25);
    self waittill("near_goal");
    namespace_b479ac682b93cd92::vehicle_deathcleanup();
    foreach (gunner in self.gunners) {
        gunner.nocorpse = 1;
        gunner namespace_bfef6903bca5845d::function_28b90eb2b591003f();
    }
    thread namespace_1f188a13f7e79610::vehicle_death(self);
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x105f
// Size: 0x75
function private function_93b8918609703560() {
    alive = 0;
    foreach (gunner in self.gunners) {
        if (!isdefined(gunner) || !isalive(gunner)) {
            continue;
        }
        alive++;
    }
    return alive == 0;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x10dc
// Size: 0x12a
function private function_3ab365a3526e539(point, numpositions, var_5619b7bbc3745888) {
    var_a1ae74a22938014d = 360 / numpositions;
    positions = [];
    fwd = (1, 0, 0);
    i = 0;
    while (i < 360) {
        altforward = fwd * var_5619b7bbc3745888;
        var_124d5f9c30b15673 = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        pos = point + var_124d5f9c30b15673;
        position = spawnstruct();
        position.origin = pos;
        z = position function_8c04a86613702b7d();
        position.origin = (position.origin[0], position.origin[1], z);
        positions[positions.size] = position;
        i = i + var_a1ae74a22938014d;
    }
    return positions;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x120e
// Size: 0x36
function private function_8c04a86613702b7d() {
    heliheight = getgroundposition(self.origin, 128, 10000, 2000) + (0, 0, 800);
    return heliheight[2];
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x124c
// Size: 0xbf
function private function_a051d3cda138645(goal_pos, stopatgoal, vehicle) {
    self endon("death");
    self endon("flyaway");
    self endon("circle");
    self notify("gotopos");
    self endon("gotopos");
    path = function_30401425c3d8874f(goal_pos, vehicle);
    foreach (index, node in path) {
        if (index == path.size - 1) {
            self setvehgoalpos(node, stopatgoal);
        } else {
            self setvehgoalpos(node);
        }
        self waittill("near_goal");
    }
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1312
// Size: 0x25e
function private function_30401425c3d8874f(goal_pos, vehicle) {
    path = [];
    dir = vectortoangles(goal_pos - self.origin);
    fwd = anglestoforward(dir);
    dist = length(self.origin - goal_pos);
    if (dist > 250) {
        steps = dist / 250;
        for (i = 1; i < steps; i++) {
            if (i > 5) {
                break;
            }
            var_6cb568fec1cf255a = i * 250;
            newpos = self.origin + fwd * var_6cb568fec1cf255a;
            var_57f9b1a7f5f34a7d = function_57dd2a79f8ad4fee(newpos);
            if (isdefined(var_57f9b1a7f5f34a7d)) {
                path[path.size] = var_57f9b1a7f5f34a7d.origin;
            } else {
                var_b7059dcbbb56102c = self.gunners;
                var_b7059dcbbb56102c[var_b7059dcbbb56102c.size] = self;
                trace = namespace_2a184fc4902783dc::ray_trace(newpos + (0, 0, 1000), newpos + (0, 0, -10000), var_b7059dcbbb56102c, undefined, undefined, 1, 1);
                pos = getgroundposition(trace["position"] + (0, 0, 800), 32, 2000, 100);
                path[path.size] = pos + (0, 0, 800);
                if (isdefined(vehicle) && isalive(vehicle)) {
                    if (path[path.size - 1][2] < vehicle.origin[2]) {
                        path[path.size - 1] = (path[path.size - 1][0], path[path.size - 1][1], vehicle.origin[2]) + (0, 0, 800);
                    }
                }
            }
        }
    }
    if (isdefined(vehicle) && isalive(vehicle)) {
        if (goal_pos[2] < vehicle.origin[2]) {
            path[path.size] = (goal_pos[0], goal_pos[1], vehicle.origin[2]) + (0, 0, 800);
        }
    } else {
        path[path.size] = goal_pos;
    }
    path = function_521e6d5a9479e771(path);
    return path;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1578
// Size: 0x9b
function function_521e6d5a9479e771(path) {
    thresh = 100;
    foreach (index, node in path) {
        if (index == path.size - 1) {
            break;
        }
        diff = path[index + 1][2] - node[2];
        if (diff > thresh) {
            node = node + (0, 0, node[2] + diff / 2);
        }
    }
    return path;
}

// Namespace namespace_35e55eb0037e4a11/namespace_2b263a10299a0a3a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161b
// Size: 0x64
function function_57dd2a79f8ad4fee(pos) {
    if (!isdefined(level.var_6b278dce447d6034)) {
        return undefined;
    }
    closest = getclosest(pos, level.var_6b278dce447d6034);
    if (isdefined(closest) && distancesquared(closest.origin, pos) <= squared(closest.radius)) {
        return closest;
    }
    return undefined;
}

