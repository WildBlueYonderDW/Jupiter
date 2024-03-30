// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_608c50392df8c7d1;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using script_17caf3ab35defd13;

#namespace drone_swarm;

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x475
// Size: 0x2f
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("drone_swarm"), &function_72d7a59680238265);
    registersharedfunc("drone_swarm", "tryUseDroneSwarm", &tryUseDroneSwarm);
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x57
function function_72d7a59680238265() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("drone_swarm", &tryUseDroneSwarm);
    }
    scripts/engine/utility::registersharedfunc("drone_swarm", "tryUseKillstreak", &tryUseDroneSwarm);
    function_6bdbb403f0bf174d();
    function_a0e89e425d7647e9();
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509
// Size: 0xe9
function function_6bdbb403f0bf174d() {
    /#
        setdvarifuninitialized(@"hash_6f494a25f061be74", 0);
    #/
    setdvarifuninitialized(@"hash_c1f2b595bdbc1a78", 100);
    setdvarifuninitialized(@"hash_c2591707a1f66eea", 1);
    setdvarifuninitialized(@"hash_ed4f0310e6fe1f5b", 200);
    setdvarifuninitialized(@"hash_bf387ddf15b94493", 700);
    setdvarifuninitialized(@"hash_89d442f4e32705b3", 3);
    setdvarifuninitialized(@"hash_6ca247ada3a708ab", 8000);
    setdvarifuninitialized(@"hash_ab9a39e96f2dff27", 15);
    setdvarifuninitialized(@"hash_955594666ea4a4e0", 1);
    setdvarifuninitialized(@"hash_ec1167396d530042", 0.05);
    setdvarifuninitialized(@"hash_f065b6bad78c93b9", 200);
    setdvarifuninitialized(@"hash_b6455b787cd7cbab", 500);
    setdvarifuninitialized(@"hash_9719cfd50a1766ee", 1400);
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0x1c
function function_a0e89e425d7647e9() {
    game["dialog"]["drone_swarm_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61c
// Size: 0x169
function tryUseDroneSwarm(streakinfo) {
    if (!isdefined(level.var_30811ca154f392f1) || islargemap()) {
        function_2f27caaab9a759fa();
    }
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("drone_swarm", self);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_dd21567fdd9a3a6a = "ks_gesture_phone_mp";
    deployresult = scripts/cp_mp/killstreaks/killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, makeweapon(var_dd21567fdd9a3a6a));
    if (!istrue(deployresult)) {
        return undefined;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    self notify("munitions_used", "drone_swarm");
    if (isplayer(self)) {
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
            var_52a5be2e2f91d710 = 2.5;
        }
        thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + "drone_swarm", self);
    }
    thread function_79f28198cedcecf6(streakinfo);
    return 1;
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78d
// Size: 0x1e6
function function_79f28198cedcecf6(streakinfo) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    var_4659ac69102900ff = getdvarint(@"hash_ab9a39e96f2dff27");
    actuallyspawned = 0;
    result = function_21865cb353bbaf24(streakinfo);
    level.var_3677e794eb53000f = result[0];
    deploy_plane = function_15b8e0948c99ed81(streakinfo, var_4659ac69102900ff, result[1]);
    var_a59f6265be06fe24 = getdvarfloat(@"hash_955594666ea4a4e0");
    wait(var_a59f6265be06fe24);
    var_7d88cdd45285c464 = getdvarfloat(@"hash_ec1167396d530042");
    foreach (location in level.var_30811ca154f392f1) {
        if (actuallyspawned > bundle.var_802338ed50536ef6) {
            break;
        }
        thread function_3b5d077ae996be94(deploy_plane.origin, location, streakinfo);
        actuallyspawned++;
        wait(var_7d88cdd45285c464);
    }
    level.droneswarmactive = 1;
    thread function_f288b429af4c56e6();
    if (bundle.var_e4c252e50312c7cb > 0) {
        level.var_eac985365b1f6507 = bundle.var_e4c252e50312c7cb;
    }
    /#
        var_d63fb22169f7fdeb = getdvarint(@"hash_5a8e2bfaac44df7f");
        if (isdefined(var_d63fb22169f7fdeb)) {
            level.var_eac985365b1f6507 = var_d63fb22169f7fdeb;
        }
    #/
    result = streakinfo.owner waittill_any_timeout_1(bundle.dronelifetime, "emp_applied");
    if (isdefined(result) && result == "timeout") {
        thread function_9b447df727cd449b();
    }
    function_32fa416db2a928d9();
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x91
function function_9b447df727cd449b() {
    var_da8cec9bce12f9cb = self.pers["team"];
    characterref = scripts/cp_mp/utility/dialog_utility::function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
    character = scripts/cp_mp/utility/dialog_utility::function_309f1876dda94360("Character", characterref);
    if (!isdefined(character)) {
        character = "mili";
    }
    dialogalias = "dx_mp_core_anno_" + character + "_cdef";
    self queuedialogforplayer(dialogalias, "drone_swarm_end", 1);
    self.currentkillstreakopvo = "drone_swarm_end";
    thread clearstoredkillstreakoperatordialog(5);
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa12
// Size: 0x91
function function_f288b429af4c56e6() {
    var_da8cec9bce12f9cb = self.pers["team"];
    characterref = scripts/cp_mp/utility/dialog_utility::function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
    character = scripts/cp_mp/utility/dialog_utility::function_309f1876dda94360("Character", characterref);
    if (!isdefined(character)) {
        character = "mili";
    }
    dialogalias = "dx_mp_core_anno_" + character + "_cdrf";
    self queuedialogforplayer(dialogalias, "drone_swarm_active", 1);
    self.currentkillstreakopvo = "drone_swarm_active";
    thread clearstoredkillstreakoperatordialog(5);
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaa
// Size: 0xda
function function_d498c292dc37474b(location) {
    var_d06f735a85408be7 = namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm", location);
    zmult = 0;
    zstep = 500;
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    while (!var_d06f735a85408be7) {
        zmult++;
        newz = location[2] + zstep * zmult;
        location = (location[0], location[1], newz);
        var_d06f735a85408be7 = namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm", location);
    }
    if (!isdefined(self.var_4a76be0b74871ec4) || self.var_4a76be0b74871ec4 < zmult * zstep + bundle.dronemaxheight) {
        self.var_4a76be0b74871ec4 = zmult * zstep + bundle.dronemaxheight;
    }
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8b
// Size: 0x1d8
function function_21865cb353bbaf24(streakinfo) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    location = function_325d5b0c9d974e2f() + (0, 0, bundle.var_4c2dd9469ddc2247);
    if (islargemap()) {
        if (isdefined(self.var_4a76be0b74871ec4) && self.var_4a76be0b74871ec4 > 0 && self.var_4a76be0b74871ec4 > bundle.var_4c2dd9469ddc2247) {
            location = (location[0], location[1], self.var_4a76be0b74871ec4);
        }
    }
    if (location[2] <= self.origin[2] || location[2] - self.origin[2] < bundle.var_4c2dd9469ddc2247) {
        newz = ter_op(self.origin[2] + bundle.var_4c2dd9469ddc2247 < bundle.var_61e4c9a4cfdae1f9, self.origin[2] + bundle.var_4c2dd9469ddc2247, bundle.var_61e4c9a4cfdae1f9);
        location = (location[0], location[1], newz);
    }
    self.var_7578682b5a41122f = location[2];
    if (issubstr(level.mapname, "highrise")) {
        self.var_4a76be0b74871ec4 = 2000;
    }
    if (issubstr(level.mapname, "observatory")) {
        self.var_4a76be0b74871ec4 = 4000;
    }
    scriptable = spawnscriptable(bundle.var_eb929984cfcf48dd, location);
    scriptable.owner = streakinfo.owner;
    thread function_16595897697aa8f6(location, 1500, 1500, 0);
    return [scriptable, location];
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0x5d7
function function_2f27caaab9a759fa() {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    var_bc353689ef87c66e = 0;
    groupbuffer = getdvarint(@"hash_bf387ddf15b94493");
    buffersquared = groupbuffer * groupbuffer;
    level.var_30811ca154f392f1 = [];
    if (!islargemap() && getdvarint(@"hash_2cb1cc59241439e5", 0)) {
        dmspawns = getallnodes();
        level.numnodes = dmspawns.size;
        while (dmspawns.size > 0 && level.var_30811ca154f392f1.size < bundle.var_802338ed50536ef6) {
            randomindex = randomint(dmspawns.size);
            var_46a4bb4b09036e07 = dmspawns[randomindex];
            var_dafa50f375b9996d = var_46a4bb4b09036e07.origin;
            level.var_30811ca154f392f1[level.var_30811ca154f392f1.size] = var_dafa50f375b9996d;
            dmspawns = array_remove(dmspawns, var_46a4bb4b09036e07);
            var_77d247f906f3b843 = [];
            foreach (spawnpoint in dmspawns) {
                if (distancesquared(var_dafa50f375b9996d, spawnpoint.origin) < buffersquared) {
                    var_77d247f906f3b843[var_77d247f906f3b843.size] = spawnpoint;
                }
            }
            dmspawns = array_remove_array(dmspawns, var_77d247f906f3b843);
        }
        return;
    }
    startlocation = undefined;
    if (islargemap()) {
        startlocation = self.origin;
    } else {
        startlocation = function_325d5b0c9d974e2f();
    }
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    curzoffset = bundle.droneminheight;
    staticxoffset = 700;
    staticyoffset = 700;
    dronelocations = [];
    offsetmult = 1;
    var_4ec9b7828329970a = ["highrise", "observatory", "shipment", "rust", "slaughterhouse", "_home_"];
    foreach (map in var_4ec9b7828329970a) {
        if (issubstr(level.mapname, map)) {
            staticxoffset = int(staticxoffset * 0.6);
            staticyoffset = int(staticyoffset * 0.6);
            var_bc353689ef87c66e = 1;
            break;
        }
    }
    while (dronelocations.size < bundle.var_802338ed50536ef6) {
        if (dronelocations.size == 0) {
            dronelocations[0] = startlocation + (0, 0, bundle.droneminheight);
            continue;
        }
        curzoffset = ter_op(curzoffset == bundle.droneminheight, bundle.dronemaxheight, bundle.droneminheight);
        for (x = offsetmult * -1; x <= offsetmult; x = x + 2) {
            for (y = offsetmult * -1; y <= offsetmult; y = y + 2) {
                if (x != offsetmult * -1 && x != offsetmult && y != offsetmult * -1 && y != offsetmult) {
                    continue;
                }
                newxoffset = staticxoffset * x;
                newyoffset = staticyoffset * y;
                location = startlocation + (newxoffset, newyoffset, curzoffset);
                var_e5681f70e30ba045 = ["observatory", "shipment", "rust", "slaughterhouse", "favela", "skidrow", "urca", "_home_"];
                var_4e122e5a9b933ce9 = 0;
                foreach (map in var_e5681f70e30ba045) {
                    if (issubstr(level.mapname, map)) {
                        var_4e122e5a9b933ce9 = 1;
                        break;
                    }
                }
                if (!issharedfuncdefined("game", "isPointInOutOfBounds") || var_4e122e5a9b933ce9) {
                    dronelocations[dronelocations.size] = startlocation + (newxoffset, newyoffset, curzoffset);
                    continue;
                }
                if (issharedfuncdefined("game", "isPointInOutOfBounds") && ![[ getsharedfunc("game", "isPointInOutOfBounds") ]](location) && !array_contains(dronelocations, location) && !var_4e122e5a9b933ce9) {
                    dronelocations[dronelocations.size] = startlocation + (newxoffset, newyoffset, curzoffset);
                    continue;
                }
                if (!var_bc353689ef87c66e && dronelocations.size < 8) {
                    x = offsetmult * -1;
                    y = offsetmult * -1 - 2;
                    staticxoffset = int(staticxoffset * 0.6);
                    staticyoffset = int(staticyoffset * 0.6);
                    dronelocations = [];
                    var_bc353689ef87c66e = 1;
                }
            }
        }
        offsetmult++;
    }
    level.var_30811ca154f392f1 = dronelocations;
    self.var_4a76be0b74871ec4 = 0;
    if (islargemap()) {
        foreach (location in dronelocations) {
            function_d498c292dc37474b(location);
        }
    }
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1349
// Size: 0x15e
function function_325d5b0c9d974e2f() {
    center = undefined;
    if (islargemap()) {
        if (isdefined(level.mapcenter)) {
            center = (self.origin[0], self.origin[1], level.mapcenter[2]);
        } else if (issharedfuncdefined("game", "findboxcenter") && isdefined(level.spawnmins) && isdefined(level.spawnmaxs)) {
            mapcenter = [[ getsharedfunc("game", "findboxcenter") ]](level.spawnmins, level.spawnmaxs);
            center = (self.origin[0], self.origin[1], mapcenter[2]);
        } else {
            center = self.origin;
        }
    } else if (isdefined(level.mapcenter)) {
        center = level.mapcenter;
    } else if (issharedfuncdefined("game", "findboxcenter") && isdefined(level.spawnmins) && isdefined(level.spawnmaxs)) {
        center = [[ getsharedfunc("game", "findboxcenter") ]](level.spawnmins, level.spawnmaxs);
    } else {
        center = (0, 0, 0);
    }
    return center;
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14af
// Size: 0x44c
function function_15b8e0948c99ed81(streakinfo, var_4659ac69102900ff, location) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    planeflyheight = bundle.var_61e4c9a4cfdae1f9;
    if (islargemap()) {
        if (planeflyheight < self.origin[2] + bundle.var_61e4c9a4cfdae1f9) {
            planeflyheight = self.origin[2] + bundle.var_61e4c9a4cfdae1f9;
        }
        if (isdefined(self.var_4a76be0b74871ec4) && self.var_4a76be0b74871ec4 > 0 && self.var_4a76be0b74871ec4 + 500 > planeflyheight) {
            planeflyheight = self.var_4a76be0b74871ec4 + 500;
        }
        if (self.var_7578682b5a41122f + 500 > planeflyheight) {
            planeflyheight = self.var_7578682b5a41122f + 500;
        }
    } else if (isdefined(self.var_4a76be0b74871ec4)) {
        planeflyheight = planeflyheight + self.var_4a76be0b74871ec4;
    }
    self.var_99067f07b4dd1c34 = planeflyheight;
    var_2808a7840128187 = getdvarint(@"hash_6ca247ada3a708ab");
    mapcenter = function_325d5b0c9d974e2f();
    planespawnloc = (mapcenter[0] + var_2808a7840128187 * 1.5, mapcenter[1] + var_2808a7840128187 * 1.5, planeflyheight * 1.35);
    var_ee04f1671a7a1b31 = (mapcenter[0] - var_2808a7840128187 * 1.5, mapcenter[1] - var_2808a7840128187 * 1.5, planeflyheight * 1.35);
    pathstart = (mapcenter[0] + var_2808a7840128187 / 2, mapcenter[1] + var_2808a7840128187 / 2, planeflyheight);
    pathend = (mapcenter[0] - var_2808a7840128187 / 2, mapcenter[1] - var_2808a7840128187 / 2, planeflyheight);
    var_5fab0211464469bd = vectortoangles(pathstart - planespawnloc);
    var_b4bef23b5291bd7e = vectortoangles(pathend - pathstart);
    exitangles = vectortoangles(var_ee04f1671a7a1b31 - pathend);
    deploydist = distance(pathstart, pathend);
    var_283b2ff506acb348 = distance(planespawnloc, pathstart) / deploydist / var_4659ac69102900ff / 2;
    deploy_plane = spawn("script_model", planespawnloc);
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    if (!isdefined(deploy_plane)) {
        return;
    }
    deploy_plane setmodel(bundle.deployplanemodel);
    deploy_plane.angles = var_5fab0211464469bd;
    deploy_plane.owner = streakinfo.owner;
    deploy_plane.team = streakinfo.owner.team;
    deploy_plane.health = 999999;
    deploy_plane.maxhealth = 999999;
    deploy_plane.currenthealth = deploy_plane.maxhealth;
    deploy_plane.streakinfo = streakinfo;
    deploy_plane.streakname = streakinfo.streakname;
    if (issharedfuncdefined("game", "createObjective")) {
        deploy_plane.minimapid = deploy_plane [[ getsharedfunc("game", "createObjective") ]](bundle.var_f8c55648de42a75d, deploy_plane.team, 1, 1, 1);
    }
    deploy_plane moveto(pathstart, var_283b2ff506acb348, 0, 1);
    deploy_plane playsoundonmovingent("kls_drone_swarm_jet_start");
    wait(var_283b2ff506acb348 - 2);
    deploy_plane function_e09e108f69c7faf7(pathstart - planespawnloc, pathend - pathstart);
    deploy_plane moveto(pathend, var_4659ac69102900ff, var_4659ac69102900ff * 0, var_4659ac69102900ff * 0);
    level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "enabled");
    level.var_3677e794eb53000f setscriptablepartstate("vfx", "enabled");
    level.var_3677e794eb53000f setscriptablepartstate("droneSfx", "enabled");
    deploy_plane setscriptablepartstate("drone_swarm_deploy", "on");
    deploy_plane thread function_bbc8f1a45f899378(var_4659ac69102900ff, pathend - pathstart, var_ee04f1671a7a1b31 - pathend, var_ee04f1671a7a1b31, var_283b2ff506acb348);
    return deploy_plane;
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x67
function function_e09e108f69c7faf7(vector1, vector2) {
    for (time = 0; time < 1.5; time = time + 0.1) {
        self.angles = vectortoangles(vectorlerp(vector1, vector2, time / 1.5));
        wait(0.1);
    }
    self.angles = vectortoangles(vector2);
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1971
// Size: 0xaf
function function_bbc8f1a45f899378(deploytime, deployvector, exitvector, exitloc, exittime) {
    wait(deploytime - 2);
    function_e09e108f69c7faf7(deployvector, exitvector);
    self moveto(exitloc, exittime, 0, 0);
    level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "disabled");
    self setscriptablepartstate("drone_swarm_deploy", "off");
    wait(exittime);
    if (!istrue(self.owner.ksempd)) {
        level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "disabled");
    }
    function_2eff4cd94c3243e8();
    self delete();
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27
// Size: 0x130
function function_3b5d077ae996be94(spawnlocation, targetlocation, streakinfo) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    movetime = 5;
    dronescriptmodel = spawn("script_model", spawnlocation);
    dronescriptmodel setmodel(bundle.dronemodel);
    dronescriptmodel moveto(targetlocation, movetime, 0.25, 0.25);
    wait(movetime);
    if (!istrue(streakinfo.owner.ksempd)) {
        spawneddrone = function_9dd4990a96e47972(targetlocation, streakinfo);
        if (isdefined(spawneddrone)) {
            if (!isdefined(level.var_f37653d229f1f1c4)) {
                level.var_f37653d229f1f1c4 = [];
            }
            level.var_f37653d229f1f1c4 = array_add(level.var_f37653d229f1f1c4, spawneddrone);
            if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
                spawneddrone [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 100);
            }
        }
    }
    dronescriptmodel delete();
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5e
// Size: 0x35d
function function_9dd4990a96e47972(location, streakinfo) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    spawneddrone = self launchgrenade(bundle.droneweapon, location, (0, 0, 0));
    spawneddrone setscriptablepartstate("visibility", "show");
    spawneddrone.targetorigin = location;
    spawneddrone.owner = streakinfo.owner;
    spawneddrone.team = streakinfo.owner.team;
    var_6fe905dae10291e = undefined;
    /#
        var_6fe905dae10291e = getdvarint(@"hash_dc292ed5d6a897a4", 0);
    #/
    if ((istrue(bundle.var_9b2586bfb4f3de46) || istrue(var_6fe905dae10291e)) && issharedfuncdefined("game", "createObjective")) {
        spawneddrone.minimapid = spawneddrone [[ getsharedfunc("game", "createObjective") ]](bundle.minimapicon, spawneddrone.team, 1, 1, 1);
    }
    var_d06f735a85408be7 = 0;
    var_d06f735a85408be7 = spawneddrone namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm");
    if (!var_d06f735a85408be7 && level.mapname == "mp_jup_afghan_v2") {
        var_d06f735a85408be7 = 1;
        centerpos = (spawneddrone.targetorigin[0], spawneddrone.targetorigin[1], spawneddrone.targetorigin[2] + bundle.dronemaxheight);
        startlocation = centerpos + anglestoforward(spawneddrone.angles) * bundle.droneminradius;
        spawneddrone.startpos = startlocation;
        spawneddrone.centerpos = centerpos;
    }
    /#
        var_6fe905dae10291e = getdvarint(@"hash_dc292ed5d6a897a4", 0);
    #/
    if (!istrue(var_d06f735a85408be7)) {
        if (istrue(bundle.var_9b2586bfb4f3de46) || istrue(var_6fe905dae10291e)) {
            spawneddrone function_2eff4cd94c3243e8();
        }
        spawneddrone thread namespace_e5c25349d02a540b::function_a66b069993cf9abb();
        return undefined;
    }
    params = spawnstruct();
    params.streakinfo = streakinfo;
    spawneddrone callback::add("on_functional_death", &function_5de4ac1e8f7a7cc1, params);
    spawneddrone.var_e00c5cd8871892aa = 1;
    if (istrue(bundle.candamage) && issharedfuncdefined("damage", "monitorDamage")) {
        spawneddrone thread [[ getsharedfunc("damage", "monitorDamage") ]](isdefined(bundle.maxhealth) ? bundle.maxhealth : 25, "hitequip", &function_66a7440055d386c3, &function_7bdb3610d602438d, 0);
    }
    spawneddrone thread function_62c1c6833c19817c(65, 12);
    spawneddrone thread function_74f5ba869b257143(20, 10, 7);
    flyvelocity = randomfloatrange(400, 650);
    spawneddrone thread namespace_e5c25349d02a540b::function_5c89eb12f323ab1e(spawneddrone.centerpos, spawneddrone.startpos, flyvelocity);
    spawneddrone thread namespace_e5c25349d02a540b::function_171c9b525186dfee("drone_swarm", -400);
    spawneddrone thread function_111b87bbd927f6a3(5, 10);
    return spawneddrone;
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec3
// Size: 0x1bf
function function_5de4ac1e8f7a7cc1(callbackparams, additionalparams) {
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    /#
        var_d63fb22169f7fdeb = getdvarint(@"hash_5a8e2bfaac44df7f");
        if (isdefined(var_d63fb22169f7fdeb) && var_d63fb22169f7fdeb < 0) {
            var_692ed934434186df = 1;
        }
    #/
    if (isdefined(self.var_e00c5cd8871892aa) && istrue(self.var_e00c5cd8871892aa) && istrue(level.droneswarmactive) && (level.var_eac985365b1f6507 > 0 || bundle.var_e4c252e50312c7cb < 0 || istrue(var_692ed934434186df))) {
        respawnoffset = (500, 500, self.owner.var_99067f07b4dd1c34);
        spawnlocation = self.targetorigin + respawnoffset;
        self.owner thread function_3b5d077ae996be94(spawnlocation, self.targetorigin, additionalparams.streakinfo);
        if (bundle.var_e4c252e50312c7cb > 0) {
            level.var_eac985365b1f6507--;
        }
    }
    namespace_e5c25349d02a540b::function_ba6789000bf88889(additionalparams);
    level.var_f37653d229f1f1c4 = array_remove(level.var_f37653d229f1f1c4, self);
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    var_6fe905dae10291e = undefined;
    /#
        var_6fe905dae10291e = getdvarint(@"hash_dc292ed5d6a897a4", 0);
    #/
    if (istrue(bundle.var_9b2586bfb4f3de46) || istrue(var_6fe905dae10291e)) {
        function_2eff4cd94c3243e8();
    }
    wait(1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2089
// Size: 0x8d
function function_7d2bf0fc063e5cdb() {
    randomdelay = randomfloatrange(0, 3);
    wait(randomdelay);
    if (!isdefined(self.var_c69028d21747744b) || !istrue(self.var_c69028d21747744b)) {
        thread namespace_e5c25349d02a540b::function_1c87d0008280beb0(undefined, groundpos(self.targetorigin));
    }
    bundle = level.streakglobals.streakbundles["drone_swarm"];
    if (istrue(bundle.var_9b2586bfb4f3de46)) {
        function_2eff4cd94c3243e8();
    }
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0xf5
function function_32fa416db2a928d9() {
    level.droneswarmactive = 0;
    self playsoundonmovingent("kls_drone_swarm_exit");
    if (isdefined(level.var_f37653d229f1f1c4)) {
        foreach (var_aaaaea6cb8c584ef in level.var_f37653d229f1f1c4) {
            if (isdefined(var_aaaaea6cb8c584ef)) {
                var_aaaaea6cb8c584ef.var_e00c5cd8871892aa = 0;
                var_aaaaea6cb8c584ef thread function_7d2bf0fc063e5cdb();
            }
        }
    }
    if (isdefined(level.var_3677e794eb53000f)) {
        level.var_3677e794eb53000f setscriptablepartstate("vfx", "disabled");
        level.var_3677e794eb53000f setscriptablepartstate("droneSfx", "disabled");
        level.var_3677e794eb53000f setscriptablepartstate("music", "disabled");
        level.var_3677e794eb53000f freescriptable();
    }
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2219
// Size: 0x3f1
function function_16595897697aa8f6(location, offsetx, offsety, offsetz) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(level.player)) {
        level.player setsoundsubmix("jup_kls_drone_swarm", 0);
    } else {
        foreach (player in level.players) {
            player setsoundsubmix("jup_kls_drone_swarm", 0);
        }
    }
    if (islargemap()) {
        offsetx = offsetx * 2;
        offsety = offsety * 2;
    }
    var_526bac8791b9dd61 = spawn("script_origin", location + (offsetx * -1, 0, offsetz));
    var_526ba98791b9d6c8 = spawn("script_origin", location + (offsetx, 0, offsetz));
    var_ee65e071c215338c = spawn("script_origin", location + (0, offsety * -1, offsetz));
    var_ee65e371c2153a25 = spawn("script_origin", location + (0, offsety, offsetz));
    wait(7);
    var_526bac8791b9dd61 playloopsound("kls_drone_swarm_lp_01");
    var_526ba98791b9d6c8 playloopsound("kls_drone_swarm_lp_02");
    var_ee65e071c215338c playloopsound("kls_drone_swarm_lp_03");
    var_ee65e371c2153a25 playloopsound("kls_drone_swarm_lp_04");
    if (isdefined(level.player)) {
        level.player clearsoundsubmix("jup_kls_drone_swarm", 3);
    } else {
        foreach (player in level.players) {
            player setsoundsubmix("jup_kls_drone_swarm", 0);
        }
    }
    wait(7);
    if (isdefined(level.player)) {
        level.player setsoundsubmix("jup_kls_drone_swarm", 0, 0);
    } else {
        foreach (player in level.players) {
            player setsoundsubmix("jup_kls_drone_swarm", 0, 0);
        }
    }
    waittill_any_timeout_1(level.streakglobals.streakbundles["drone_swarm"].dronelifetime, "emp_applied");
    if (isdefined(level.player)) {
        level.player setsoundsubmix("jup_kls_drone_swarm", 5, 1);
    } else {
        foreach (player in level.players) {
            player setsoundsubmix("jup_kls_drone_swarm", 5, 1);
        }
    }
    wait(1.1);
    if (isdefined(level.player)) {
        level.player clearsoundsubmix("jup_kls_drone_swarm", 1);
    } else {
        foreach (player in level.players) {
            player clearsoundsubmix("jup_kls_drone_swarm", 1);
        }
    }
    var_526bac8791b9dd61 stoploopsound("kls_drone_swarm_lp_01");
    var_526ba98791b9d6c8 stoploopsound("kls_drone_swarm_lp_02");
    var_ee65e071c215338c stoploopsound("kls_drone_swarm_lp_03");
    var_ee65e371c2153a25 stoploopsound("kls_drone_swarm_lp_04");
    var_526bac8791b9dd61 delete();
    var_526ba98791b9d6c8 delete();
    var_ee65e071c215338c delete();
    var_ee65e371c2153a25 delete();
}

// Namespace drone_swarm / namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2612
// Size: 0x77
function function_111b87bbd927f6a3(minrate, maxrate) {
    self endon("emp_applied");
    self endon("death");
    self endon("foundBestTarget");
    self endon("diveBombing");
    self endon("flyingNewCircle");
    level endon("game_ended");
    while (true) {
        var_d7dcdaccf0142680 = randomintrange(minrate, maxrate);
        wait(var_d7dcdaccf0142680);
        self playsoundonmovingent("kls_drone_swarm_flybys");
        if (level.droneswarmactive == 0) {
            break;
        }
    }
}

