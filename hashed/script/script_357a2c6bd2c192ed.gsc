// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_608c50392df8c7d1;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using script_17caf3ab35defd13;

#namespace drone_swarm;

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x475
// Size: 0x2f
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("drone_swarm"), &function_72d7a59680238265);
    registersharedfunc("drone_swarm", "tryUseDroneSwarm", &tryUseDroneSwarm);
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ab
// Size: 0x57
function function_72d7a59680238265() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("drone_swarm", &tryUseDroneSwarm);
    }
    namespace_3c37cb17ade254d::registersharedfunc("drone_swarm", "tryUseKillstreak", &tryUseDroneSwarm);
    function_6bdbb403f0bf174d();
    function_a0e89e425d7647e9();
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0x1c
function function_a0e89e425d7647e9() {
    game["dialog"]["drone_swarm_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
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
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon(var_dd21567fdd9a3a6a));
    if (!istrue(var_9b1deb5e9d32bbe3)) {
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78d
// Size: 0x1e6
function function_79f28198cedcecf6(streakinfo) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    var_4659ac69102900ff = getdvarint(@"hash_ab9a39e96f2dff27");
    var_a2fa393ad1ebe0fa = 0;
    result = function_21865cb353bbaf24(streakinfo);
    level.var_3677e794eb53000f = result[0];
    var_1611d98d55c62327 = function_15b8e0948c99ed81(streakinfo, var_4659ac69102900ff, result[1]);
    var_a59f6265be06fe24 = getdvarfloat(@"hash_955594666ea4a4e0");
    wait(var_a59f6265be06fe24);
    var_7d88cdd45285c464 = getdvarfloat(@"hash_ec1167396d530042");
    foreach (location in level.var_30811ca154f392f1) {
        if (var_a2fa393ad1ebe0fa > bundle.var_802338ed50536ef6) {
            break;
        } else {
            thread function_3b5d077ae996be94(var_1611d98d55c62327.origin, location, streakinfo);
            var_a2fa393ad1ebe0fa++;
            wait(var_7d88cdd45285c464);
        }
    }
    level.var_88c42ecebf31fc81 = 1;
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
    result = streakinfo.owner waittill_any_timeout_1(bundle.var_8f245c13e5b07cee, "emp_applied");
    if (isdefined(result) && result == "timeout") {
        thread function_9b447df727cd449b();
    }
    function_32fa416db2a928d9();
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x91
function function_9b447df727cd449b() {
    var_da8cec9bce12f9cb = self.pers["team"];
    var_817b24cc21ede559 = namespace_d2b94521fd636348::function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
    character = namespace_d2b94521fd636348::function_309f1876dda94360("Character", var_817b24cc21ede559);
    if (!isdefined(character)) {
        character = "mili";
    }
    dialogalias = "dx_mp_core_anno_" + character + "_cdef";
    self queuedialogforplayer(dialogalias, "drone_swarm_end", 1);
    self.currentkillstreakopvo = "drone_swarm_end";
    thread clearstoredkillstreakoperatordialog(5);
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa12
// Size: 0x91
function function_f288b429af4c56e6() {
    var_da8cec9bce12f9cb = self.pers["team"];
    var_817b24cc21ede559 = namespace_d2b94521fd636348::function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
    character = namespace_d2b94521fd636348::function_309f1876dda94360("Character", var_817b24cc21ede559);
    if (!isdefined(character)) {
        character = "mili";
    }
    dialogalias = "dx_mp_core_anno_" + character + "_cdrf";
    self queuedialogforplayer(dialogalias, "drone_swarm_active", 1);
    self.currentkillstreakopvo = "drone_swarm_active";
    thread clearstoredkillstreakoperatordialog(5);
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaa
// Size: 0xda
function function_d498c292dc37474b(location) {
    var_d06f735a85408be7 = namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm", location);
    var_f20a07e7158c5ebb = 0;
    var_1ff57c8ad6bc2d9b = 500;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    while (!var_d06f735a85408be7) {
        var_f20a07e7158c5ebb++;
        newz = location[2] + var_1ff57c8ad6bc2d9b * var_f20a07e7158c5ebb;
        location = (location[0], location[1], newz);
        var_d06f735a85408be7 = namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm", location);
    }
    if (!isdefined(self.var_4a76be0b74871ec4) || self.var_4a76be0b74871ec4 < var_f20a07e7158c5ebb * var_1ff57c8ad6bc2d9b + bundle.var_905a54a3a40e7f4e) {
        self.var_4a76be0b74871ec4 = var_f20a07e7158c5ebb * var_1ff57c8ad6bc2d9b + bundle.var_905a54a3a40e7f4e;
    }
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8b
// Size: 0x1d8
function function_21865cb353bbaf24(streakinfo) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
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
    return [0:scriptable, 1:location];
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6b
// Size: 0x5d7
function function_2f27caaab9a759fa() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    var_bc353689ef87c66e = 0;
    var_cd983d9e89477a42 = getdvarint(@"hash_bf387ddf15b94493");
    var_8f845105a8619b5c = var_cd983d9e89477a42 * var_cd983d9e89477a42;
    level.var_30811ca154f392f1 = [];
    if (!islargemap() && getdvarint(@"hash_2cb1cc59241439e5", 0)) {
        var_71d90f8d556a2262 = getallnodes();
        level.var_76045cf7c0669684 = var_71d90f8d556a2262.size;
        while (var_71d90f8d556a2262.size > 0 && level.var_30811ca154f392f1.size < bundle.var_802338ed50536ef6) {
            randomindex = randomint(var_71d90f8d556a2262.size);
            var_46a4bb4b09036e07 = var_71d90f8d556a2262[randomindex];
            var_dafa50f375b9996d = var_46a4bb4b09036e07.origin;
            level.var_30811ca154f392f1[level.var_30811ca154f392f1.size] = var_dafa50f375b9996d;
            var_71d90f8d556a2262 = array_remove(var_71d90f8d556a2262, var_46a4bb4b09036e07);
            var_77d247f906f3b843 = [];
            foreach (spawnpoint in var_71d90f8d556a2262) {
                if (distancesquared(var_dafa50f375b9996d, spawnpoint.origin) < var_8f845105a8619b5c) {
                    var_77d247f906f3b843[var_77d247f906f3b843.size] = spawnpoint;
                }
            }
            var_71d90f8d556a2262 = array_remove_array(var_71d90f8d556a2262, var_77d247f906f3b843);
        }
    } else {
        startlocation = undefined;
        if (islargemap()) {
            startlocation = self.origin;
        } else {
            startlocation = function_325d5b0c9d974e2f();
        }
        bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
        var_fba5b100f0d7ab4e = bundle.var_d5e973964314cf48;
        var_4d5e202179b31492 = 700;
        var_e6fde9619f881fd = 700;
        var_1be25e6a8260168f = [];
        var_777deef3f86c344 = 1;
        var_4ec9b7828329970a = [0:"highrise", 1:"observatory", 2:"shipment", 3:"rust", 4:"slaughterhouse", 5:"_home_"];
        foreach (map in var_4ec9b7828329970a) {
            if (issubstr(level.mapname, map)) {
                var_4d5e202179b31492 = int(var_4d5e202179b31492 * 0.6);
                var_e6fde9619f881fd = int(var_e6fde9619f881fd * 0.6);
                var_bc353689ef87c66e = 1;
                break;
            }
        }
        while (var_1be25e6a8260168f.size < bundle.var_802338ed50536ef6) {
            if (var_1be25e6a8260168f.size == 0) {
                var_1be25e6a8260168f[0] = startlocation + (0, 0, bundle.var_d5e973964314cf48);
                continue;
            }
            var_fba5b100f0d7ab4e = ter_op(var_fba5b100f0d7ab4e == bundle.var_d5e973964314cf48, bundle.var_905a54a3a40e7f4e, bundle.var_d5e973964314cf48);
            x = var_777deef3f86c344 * -1;
            while (x <= var_777deef3f86c344) {
                y = var_777deef3f86c344 * -1;
                while (y <= var_777deef3f86c344) {
                    if (x != var_777deef3f86c344 * -1 && x != var_777deef3f86c344 && y != var_777deef3f86c344 * -1 && y != var_777deef3f86c344) {
                        goto LOC_00000569;
                    }
                    var_d134f2dea122bca4 = var_4d5e202179b31492 * x;
                    var_46c8815c92969577 = var_e6fde9619f881fd * y;
                    location = startlocation + (var_d134f2dea122bca4, var_46c8815c92969577, var_fba5b100f0d7ab4e);
                    var_e5681f70e30ba045 = [0:"observatory", 1:"shipment", 2:"rust", 3:"slaughterhouse", 4:"favela", 5:"skidrow", 6:"urca", 7:"_home_"];
                    var_4e122e5a9b933ce9 = 0;
                    foreach (map in var_e5681f70e30ba045) {
                        if (issubstr(level.mapname, map)) {
                            var_4e122e5a9b933ce9 = 1;
                            break;
                        }
                    }
                    if (!issharedfuncdefined("game", "isPointInOutOfBounds") || var_4e122e5a9b933ce9) {
                        var_1be25e6a8260168f[var_1be25e6a8260168f.size] = startlocation + (var_d134f2dea122bca4, var_46c8815c92969577, var_fba5b100f0d7ab4e);
                    } else if (issharedfuncdefined("game", "isPointInOutOfBounds") && ![[ getsharedfunc("game", "isPointInOutOfBounds") ]](location) && !array_contains(var_1be25e6a8260168f, location) && !var_4e122e5a9b933ce9) {
                        var_1be25e6a8260168f[var_1be25e6a8260168f.size] = startlocation + (var_d134f2dea122bca4, var_46c8815c92969577, var_fba5b100f0d7ab4e);
                    } else if (!var_bc353689ef87c66e && var_1be25e6a8260168f.size < 8) {
                        x = var_777deef3f86c344 * -1;
                        y = var_777deef3f86c344 * -1 - 2;
                        var_4d5e202179b31492 = int(var_4d5e202179b31492 * 0.6);
                        var_e6fde9619f881fd = int(var_e6fde9619f881fd * 0.6);
                        var_1be25e6a8260168f = [];
                        var_bc353689ef87c66e = 1;
                    LOC_00000569:
                    }
                LOC_00000569:
                    y = y + 2;
                }
                x = x + 2;
            }
            var_777deef3f86c344++;
        }
        level.var_30811ca154f392f1 = var_1be25e6a8260168f;
        self.var_4a76be0b74871ec4 = 0;
        if (islargemap()) {
            foreach (location in var_1be25e6a8260168f) {
                function_d498c292dc37474b(location);
            }
        }
    }
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14af
// Size: 0x44c
function function_15b8e0948c99ed81(streakinfo, var_4659ac69102900ff, location) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
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
    var_a4a7ed3a25b766a = (mapcenter[0] + var_2808a7840128187 * 1.5, mapcenter[1] + var_2808a7840128187 * 1.5, planeflyheight * 1.35);
    var_ee04f1671a7a1b31 = (mapcenter[0] - var_2808a7840128187 * 1.5, mapcenter[1] - var_2808a7840128187 * 1.5, planeflyheight * 1.35);
    pathstart = (mapcenter[0] + var_2808a7840128187 / 2, mapcenter[1] + var_2808a7840128187 / 2, planeflyheight);
    pathend = (mapcenter[0] - var_2808a7840128187 / 2, mapcenter[1] - var_2808a7840128187 / 2, planeflyheight);
    var_5fab0211464469bd = vectortoangles(pathstart - var_a4a7ed3a25b766a);
    var_b4bef23b5291bd7e = vectortoangles(pathend - pathstart);
    exitangles = vectortoangles(var_ee04f1671a7a1b31 - pathend);
    var_cfa3f71c623b406e = distance(pathstart, pathend);
    var_283b2ff506acb348 = distance(var_a4a7ed3a25b766a, pathstart) / var_cfa3f71c623b406e / var_4659ac69102900ff / 2;
    var_1611d98d55c62327 = spawn("script_model", var_a4a7ed3a25b766a);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    if (!isdefined(var_1611d98d55c62327)) {
        return;
    }
    var_1611d98d55c62327 setmodel(bundle.var_c99cf7e4979cc539);
    var_1611d98d55c62327.angles = var_5fab0211464469bd;
    var_1611d98d55c62327.owner = streakinfo.owner;
    var_1611d98d55c62327.team = streakinfo.owner.team;
    var_1611d98d55c62327.health = 999999;
    var_1611d98d55c62327.maxhealth = 999999;
    var_1611d98d55c62327.currenthealth = var_1611d98d55c62327.maxhealth;
    var_1611d98d55c62327.streakinfo = streakinfo;
    var_1611d98d55c62327.streakname = streakinfo.streakname;
    if (issharedfuncdefined("game", "createObjective")) {
        var_1611d98d55c62327.minimapid = var_1611d98d55c62327 [[ getsharedfunc("game", "createObjective") ]](bundle.var_f8c55648de42a75d, var_1611d98d55c62327.team, 1, 1, 1);
    }
    var_1611d98d55c62327 moveto(pathstart, var_283b2ff506acb348, 0, 1);
    var_1611d98d55c62327 playsoundonmovingent("kls_drone_swarm_jet_start");
    wait(var_283b2ff506acb348 - 2);
    var_1611d98d55c62327 function_e09e108f69c7faf7(pathstart - var_a4a7ed3a25b766a, pathend - pathstart);
    var_1611d98d55c62327 moveto(pathend, var_4659ac69102900ff, var_4659ac69102900ff * 0, var_4659ac69102900ff * 0);
    level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "enabled");
    level.var_3677e794eb53000f setscriptablepartstate("vfx", "enabled");
    level.var_3677e794eb53000f setscriptablepartstate("droneSfx", "enabled");
    var_1611d98d55c62327 setscriptablepartstate("drone_swarm_deploy", "on");
    var_1611d98d55c62327 thread function_bbc8f1a45f899378(var_4659ac69102900ff, pathend - pathstart, var_ee04f1671a7a1b31 - pathend, var_ee04f1671a7a1b31, var_283b2ff506acb348);
    return var_1611d98d55c62327;
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1903
// Size: 0x67
function function_e09e108f69c7faf7(var_2b2be2708df81cd, var_2b2bb2708df7b34) {
    time = 0;
    while (time < 1.5) {
        self.angles = vectortoangles(vectorlerp(var_2b2be2708df81cd, var_2b2bb2708df7b34, time / 1.5));
        wait(0.1);
        time = time + 0.1;
    }
    self.angles = vectortoangles(var_2b2bb2708df7b34);
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1971
// Size: 0xaf
function function_bbc8f1a45f899378(deploytime, var_234cd1fe1b83bc51, exitvector, var_13773916f63239e1, exittime) {
    wait(deploytime - 2);
    function_e09e108f69c7faf7(var_234cd1fe1b83bc51, exitvector);
    self moveto(var_13773916f63239e1, exittime, 0, 0);
    level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "disabled");
    self setscriptablepartstate("drone_swarm_deploy", "off");
    wait(exittime);
    if (!istrue(self.owner.var_65219c911f198c95)) {
        level.var_3677e794eb53000f setscriptablepartstate("planeSfx", "disabled");
    }
    function_2eff4cd94c3243e8();
    self delete();
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27
// Size: 0x130
function function_3b5d077ae996be94(spawnlocation, var_7b59b41b01684053, streakinfo) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    movetime = 5;
    var_6eb2924bbc043887 = spawn("script_model", spawnlocation);
    var_6eb2924bbc043887 setmodel(bundle.var_b923287498a8519a);
    var_6eb2924bbc043887 moveto(var_7b59b41b01684053, movetime, 0.25, 0.25);
    wait(movetime);
    if (!istrue(streakinfo.owner.var_65219c911f198c95)) {
        var_e8ade8c30e272779 = function_9dd4990a96e47972(var_7b59b41b01684053, streakinfo);
        if (isdefined(var_e8ade8c30e272779)) {
            if (!isdefined(level.var_f37653d229f1f1c4)) {
                level.var_f37653d229f1f1c4 = [];
            }
            level.var_f37653d229f1f1c4 = array_add(level.var_f37653d229f1f1c4, var_e8ade8c30e272779);
            if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
                var_e8ade8c30e272779 [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 100);
            }
        }
    }
    var_6eb2924bbc043887 delete();
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5e
// Size: 0x35d
function function_9dd4990a96e47972(location, streakinfo) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    var_e8ade8c30e272779 = self launchgrenade(bundle.var_e1e53f2d00c43d61, location, (0, 0, 0));
    var_e8ade8c30e272779 setscriptablepartstate("visibility", "show");
    var_e8ade8c30e272779.targetorigin = location;
    var_e8ade8c30e272779.owner = streakinfo.owner;
    var_e8ade8c30e272779.team = streakinfo.owner.team;
    var_6fe905dae10291e = undefined;
    /#
        var_6fe905dae10291e = getdvarint(@"hash_dc292ed5d6a897a4", 0);
    #/
    if ((istrue(bundle.var_9b2586bfb4f3de46) || istrue(var_6fe905dae10291e)) && issharedfuncdefined("game", "createObjective")) {
        var_e8ade8c30e272779.minimapid = var_e8ade8c30e272779 [[ getsharedfunc("game", "createObjective") ]](bundle.minimapicon, var_e8ade8c30e272779.team, 1, 1, 1);
    }
    var_d06f735a85408be7 = 0;
    var_d06f735a85408be7 = var_e8ade8c30e272779 namespace_e5c25349d02a540b::function_f50add73e923b629("drone_swarm");
    if (!var_d06f735a85408be7 && level.mapname == "mp_jup_afghan_v2") {
        var_d06f735a85408be7 = 1;
        centerpos = (var_e8ade8c30e272779.targetorigin[0], var_e8ade8c30e272779.targetorigin[1], var_e8ade8c30e272779.targetorigin[2] + bundle.var_905a54a3a40e7f4e);
        startlocation = centerpos + anglestoforward(var_e8ade8c30e272779.angles) * bundle.var_ed789e6ec52a0345;
        var_e8ade8c30e272779.startpos = startlocation;
        var_e8ade8c30e272779.centerpos = centerpos;
    }
    /#
        var_6fe905dae10291e = getdvarint(@"hash_dc292ed5d6a897a4", 0);
    #/
    if (!istrue(var_d06f735a85408be7)) {
        if (istrue(bundle.var_9b2586bfb4f3de46) || istrue(var_6fe905dae10291e)) {
            var_e8ade8c30e272779 function_2eff4cd94c3243e8();
        }
        var_e8ade8c30e272779 thread namespace_e5c25349d02a540b::function_a66b069993cf9abb();
        return undefined;
    }
    params = spawnstruct();
    params.streakinfo = streakinfo;
    var_e8ade8c30e272779 callback::add("on_functional_death", &function_5de4ac1e8f7a7cc1, params);
    var_e8ade8c30e272779.var_e00c5cd8871892aa = 1;
    if (istrue(bundle.candamage) && issharedfuncdefined("damage", "monitorDamage")) {
        if (!isdefined(bundle.maxhealth)) {
            goto LOC_000002d8;
        }
        var_e8ade8c30e272779 thread [[ getsharedfunc("damage", "monitorDamage") ]](bundle.maxhealth, 25, "hitequip", &function_66a7440055d386c3, &function_7bdb3610d602438d, 0);
    }
    var_e8ade8c30e272779 thread function_62c1c6833c19817c(65, 12);
    var_e8ade8c30e272779 thread function_74f5ba869b257143(20, 10, 7);
    var_3a52187ea923fe75 = randomfloatrange(400, 650);
    var_e8ade8c30e272779 thread namespace_e5c25349d02a540b::function_5c89eb12f323ab1e(var_e8ade8c30e272779.centerpos, var_e8ade8c30e272779.startpos, var_3a52187ea923fe75);
    var_e8ade8c30e272779 thread namespace_e5c25349d02a540b::function_171c9b525186dfee("drone_swarm", -400);
    var_e8ade8c30e272779 thread function_111b87bbd927f6a3(5, 10);
    return var_e8ade8c30e272779;
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec3
// Size: 0x1bf
function function_5de4ac1e8f7a7cc1(var_ba669c07247b5ab0, var_d0f7a18a2f38ca6e) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    /#
        var_d63fb22169f7fdeb = getdvarint(@"hash_5a8e2bfaac44df7f");
        if (isdefined(var_d63fb22169f7fdeb) && var_d63fb22169f7fdeb < 0) {
            var_692ed934434186df = 1;
        }
    #/
    if (isdefined(self.var_e00c5cd8871892aa) && istrue(self.var_e00c5cd8871892aa) && istrue(level.var_88c42ecebf31fc81) && (level.var_eac985365b1f6507 > 0 || bundle.var_e4c252e50312c7cb < 0 || istrue(var_692ed934434186df))) {
        var_400dab8f90bd22e8 = (500, 500, self.owner.var_99067f07b4dd1c34);
        spawnlocation = self.targetorigin + var_400dab8f90bd22e8;
        self.owner thread function_3b5d077ae996be94(spawnlocation, self.targetorigin, var_d0f7a18a2f38ca6e.streakinfo);
        if (bundle.var_e4c252e50312c7cb > 0) {
            level.var_eac985365b1f6507--;
        }
    }
    namespace_e5c25349d02a540b::function_ba6789000bf88889(var_d0f7a18a2f38ca6e);
    level.var_f37653d229f1f1c4 = array_remove(level.var_f37653d229f1f1c4, self);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2089
// Size: 0x8d
function function_7d2bf0fc063e5cdb() {
    var_445b8e3c7f65e081 = randomfloatrange(0, 3);
    wait(var_445b8e3c7f65e081);
    if (!isdefined(self.var_c69028d21747744b) || !istrue(self.var_c69028d21747744b)) {
        thread namespace_e5c25349d02a540b::function_1c87d0008280beb0(undefined, groundpos(self.targetorigin));
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"];
    if (istrue(bundle.var_9b2586bfb4f3de46)) {
        function_2eff4cd94c3243e8();
    }
}

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0xf5
function function_32fa416db2a928d9() {
    level.var_88c42ecebf31fc81 = 0;
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
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
    waittill_any_timeout_1(level.var_b23156d776b1d85.var_38f2a11237246ac["drone_swarm"].var_8f245c13e5b07cee, "emp_applied");
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

// Namespace drone_swarm/namespace_e2f93bf4e107e56d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2612
// Size: 0x77
function function_111b87bbd927f6a3(var_4d221d6017330c71, var_d935705dbbe8c4b7) {
    self endon("emp_applied");
    self endon("death");
    self endon("foundBestTarget");
    self endon("diveBombing");
    self endon("flyingNewCircle");
    level endon("game_ended");
    while (1) {
        var_d7dcdaccf0142680 = randomintrange(var_4d221d6017330c71, var_d935705dbbe8c4b7);
        wait(var_d7dcdaccf0142680);
        self playsoundonmovingent("kls_drone_swarm_flybys");
        if (level.var_88c42ecebf31fc81 == 0) {
            break;
        }
    }
}

