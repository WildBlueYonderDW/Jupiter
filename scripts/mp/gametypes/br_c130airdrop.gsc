// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\points.gsc;

#namespace br_c130Airdrop;

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0x106
function init() {
    registersharedfunc("br_c130Airdrop", "c130Airdrop_onCrateUse", &c130airdrop_oncrateuse);
    level.c130deliveriesinprogress = [];
    level.c130successfulairdrops = [];
    level.c130airdrop_heightoverride = getdvarint(@"hash_5697ce5db08f0e93", 12000);
    /#
        setdevdvarifuninitialized(@"hash_bb26d1091b0f057d", 0);
        setdevdvarifuninitialized(@"hash_5d70eab0efbc5895", 0);
        setdevdvarifuninitialized(@"hash_301a0076aa763558", 1);
        setdevdvarifuninitialized(@"hash_7b5f99d862e0fd13", 3);
        setdevdvarifuninitialized(@"hash_42f7332f1e9035b3", 3);
        setdevdvarifuninitialized(@"hash_a811b4c67a77ce31", 12);
        setdevdvarifuninitialized(@"hash_d313f3ed75dbff0f", 10000);
        setdevdvarifuninitialized(@"hash_61cd7f929e3a8d6c", 240);
        setdevdvarifuninitialized(@"hash_61a98d929e12317e", 360);
        setdevdvarifuninitialized(@"hash_f21f22782971c2ac", 750);
        setdevdvarifuninitialized(@"hash_ff7bb52f31b387e1", 1);
    #/
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x402
// Size: 0x275
function c130airdrop_managedrop() {
    level endon("game_ended");
    var_f49a0a20d47e1dc0 = 1;
    /#
        level thread function_34b411986509f682();
        level thread function_73d8265b112f259d();
    #/
    level waittill("br_prematchEnded");
    while (1) {
        var_f798734f97421714 = getdvarint(@"hash_301a0076aa763558", 1);
        if (!var_f798734f97421714) {
            waitframe();
            continue;
        }
        var_b63480e487f34e3a = getdvarint(@"hash_7b5f99d862e0fd13", 3);
        var_2b458b39bbf6bb8b = getdvarint(@"hash_a811b4c67a77ce31", 12);
        var_f013e3fc1f370ca7 = getdvarint(@"hash_61cd7f929e3a8d6c", 240);
        var_3fb775a12c864c31 = getdvarint(@"hash_61a98d929e12317e", 360);
        var_b1d5325407f562dd = randomintrange(var_f013e3fc1f370ca7, var_3fb775a12c864c31);
        if (istrue(var_f49a0a20d47e1dc0)) {
            namespace_4b0406965e556711::gameflagwait("activate_cash_drops");
        } else {
            wait(var_b1d5325407f562dd);
        }
        if (isdefined(level.br_level)) {
            level.br_level.c130_speedoverride = 3044;
        }
        var_334267db87355776 = level.c130successfulairdrops.size;
        if (var_334267db87355776 < var_2b458b39bbf6bb8b) {
            var_a027d7566fc885a9 = getdvarint(@"hash_42f7332f1e9035b3", 3);
            var_26c6514c64f95ecf = var_2b458b39bbf6bb8b - var_334267db87355776;
            if (!istrue(var_f49a0a20d47e1dc0)) {
                var_b63480e487f34e3a = 1;
            }
            var_4528266cd203c948 = min(var_b63480e487f34e3a, ceil(var_26c6514c64f95ecf / var_a027d7566fc885a9));
            var_734798c9f67545df = var_26c6514c64f95ecf;
            for (i = 0; i < var_4528266cd203c948; i++) {
                var_5ee94ae126526f2f = min(var_a027d7566fc885a9, var_734798c9f67545df);
                var_734798c9f67545df = var_734798c9f67545df - var_5ee94ae126526f2f;
                pathstruct = c130airdrop_createpath(i);
                dist = distance(pathstruct.startpt, pathstruct.endpt);
                travelspeed = namespace_ad389306d44fc6b4::getc130speed();
                time = dist / travelspeed;
                var_184d0a0ce31a2b27 = c130airdrop_spawn(pathstruct, dist, travelspeed, time);
                if (i == 0) {
                    showsplashtoall("br_c130airdrop_incoming");
                }
                var_184d0a0ce31a2b27 c130airdrop_startdelivery(var_5ee94ae126526f2f);
                if (istrue(level.usemilestonephases)) {
                    wait(randomintrange(4, 8));
                }
            }
            if (istrue(var_f49a0a20d47e1dc0)) {
                var_f49a0a20d47e1dc0 = 0;
            }
        }
    }
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67e
// Size: 0x124
function function_34b411986509f682() {
    /#
        level endon("tablet");
        startingindex = 0;
        while (1) {
            var_94498af4ca201804 = getdvarint(@"hash_bb26d1091b0f057d", 0);
            if (!var_94498af4ca201804) {
                waitframe();
                continue;
            }
            if (isdefined(level.br_level)) {
                level.br_level.c130_speedoverride = 3044;
            }
            pathstruct = c130airdrop_createpath(startingindex);
            dist = distance(pathstruct.startpt, pathstruct.endpt);
            travelspeed = namespace_ad389306d44fc6b4::getc130speed();
            time = dist / travelspeed;
            var_184d0a0ce31a2b27 = c130airdrop_spawn(pathstruct, dist, travelspeed, time);
            var_5ee94ae126526f2f = getdvarint(@"hash_42f7332f1e9035b3", 3);
            showsplashtoall("<unknown string>");
            var_184d0a0ce31a2b27 c130airdrop_startdelivery(var_5ee94ae126526f2f);
            setdvar(@"hash_bb26d1091b0f057d", 0);
            startingindex++;
            if (startingindex > 2) {
                startingindex = 0;
            }
            waitframe();
        }
    #/
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a9
// Size: 0x197
function function_73d8265b112f259d() {
    /#
        level endon("tablet");
        while (1) {
            var_94498af4ca201804 = getdvarint(@"hash_5d70eab0efbc5895", 0);
            if (!var_94498af4ca201804) {
                waitframe();
                continue;
            }
            firstplayer = undefined;
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    firstplayer = player;
                    break;
                }
            }
            droplocation = undefined;
            starttrace = firstplayer.origin + (0, 0, 10000);
            endtrace = firstplayer.origin - (0, 0, 20000);
            trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, firstplayer);
            if (isdefined(trace) && trace["<unknown string>"] != "<unknown string>") {
                droplocation = trace["<unknown string>"];
            }
            if (isdefined(droplocation)) {
                crate = namespace_6c578d6ef48f10ef::dropbrc130airdropcrate(droplocation + (0, 0, 5000), droplocation, (0, 0, 0));
                if (isdefined(crate)) {
                    level.c130successfulairdrops[level.c130successfulairdrops.size] = crate;
                }
            } else {
                iprintlnbold("<unknown string>");
            }
            setdvar(@"hash_5d70eab0efbc5895", 0);
        }
    #/
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x947
// Size: 0x6c
function c130airdrop_createpath(pathindex, var_adcb4e55deb23e76, var_60e425cb62ae9e62) {
    if (isdefined(level.br_level.br_mapcenter) && isdefined(level.br_level.br_mapsize)) {
        pathstruct = c130airdrop_createpathstruct(pathindex, var_adcb4e55deb23e76, var_60e425cb62ae9e62);
    } else {
        pathstruct = namespace_ad389306d44fc6b4::spawnc130pathstruct(var_adcb4e55deb23e76);
    }
    return pathstruct;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bb
// Size: 0x1b3
function c130airdrop_createpathstruct(pathindex, var_adcb4e55deb23e76, var_60e425cb62ae9e62) {
    pathstruct = undefined;
    centerpt = level.br_level.br_mapcenter;
    if (isdefined(var_adcb4e55deb23e76)) {
        centerpt = var_adcb4e55deb23e76;
    }
    var_f434d604c09196aa = namespace_ad389306d44fc6b4::getplanepathsaferadiusfromcenter();
    var_fda870b32ab92c1f = (0, randomfloat(360), 0);
    if (!isdefined(pathindex) || pathindex == 0) {
        if (!istrue(var_60e425cb62ae9e62)) {
            var_b36772ca73e9a3d = c130airdrop_getvalidteaminlastplace();
            var_c27add4c8461843d = c130airdrop_getteamaveragepos(var_b36772ca73e9a3d);
            var_fda870b32ab92c1f = vectortoangles(centerpt - var_c27add4c8461843d * (1, 1, 0));
            level.c130deliverydirection = var_fda870b32ab92c1f;
        }
    } else {
        if (isdefined(level.c130deliverydirection)) {
            var_fda870b32ab92c1f = level.c130deliverydirection;
            var_587fdce5c24bdf3e = 1;
            if (pathindex == 2) {
                var_587fdce5c24bdf3e = -1;
            }
            offsetvec = anglestoright(var_fda870b32ab92c1f) * var_f434d604c09196aa * var_587fdce5c24bdf3e;
            var_e2bb8be14a3105f3 = randomint(2);
            randomyaw = randomfloat(360);
            var_fda870b32ab92c1f = (0, randomyaw, 0);
            var_fda870b32ab92c1f = ter_op(var_e2bb8be14a3105f3, var_fda870b32ab92c1f, var_fda870b32ab92c1f + (0, 180, 0));
        } else {
            randomyaw = randomfloat(360);
            offsetvec = anglestoforward((0, randomyaw, 0));
            offsetvec = offsetvec * var_f434d604c09196aa * randomfloatrange(-1, 1);
        }
        centerpt = centerpt + offsetvec;
    }
    var_fdfe2d4aaf8ec33d = namespace_5078ee98abb32db9::getc130airdropheight();
    pathstruct = namespace_ad389306d44fc6b4::spawnc130pathstructnewinternal(centerpt, var_fda870b32ab92c1f, var_fdfe2d4aaf8ec33d);
    return pathstruct;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb76
// Size: 0x186
function c130airdrop_getvalidteaminlastplace() {
    var_cf4bbe562ea35eaa = undefined;
    teamPlacements = namespace_e8a49b70d0769b66::getteamscoreplacements();
    var_176a993b8d63593a = [];
    foreach (var_e275b8e011923428 in level.teamnamelist) {
        teamplayers = getteamdata(var_e275b8e011923428, "players");
        if (teamplayers.size > 0) {
            var_10838a721b202259 = 0;
            foreach (player in teamplayers) {
                if (!isdefined(player)) {
                    continue;
                }
                if (isreallyalive(player)) {
                    var_10838a721b202259 = 1;
                    break;
                }
            }
            if (!istrue(var_10838a721b202259)) {
                continue;
            }
            var_d27a4d6c71fd80d6 = teamPlacements[var_e275b8e011923428];
            if (!isdefined(var_cf4bbe562ea35eaa) || var_d27a4d6c71fd80d6 >= var_cf4bbe562ea35eaa) {
                var_cf4bbe562ea35eaa = var_d27a4d6c71fd80d6;
                teamindex = var_176a993b8d63593a.size;
                var_176a993b8d63593a[teamindex] = spawnstruct();
                var_176a993b8d63593a[teamindex].team = var_e275b8e011923428;
                var_176a993b8d63593a[teamindex].players = teamplayers;
            }
        }
    }
    if (var_176a993b8d63593a.size > 0) {
        teamindex = 0;
        if (var_176a993b8d63593a.size > 1) {
            teamindex = randomint(var_176a993b8d63593a.size);
        }
        return var_176a993b8d63593a[teamindex];
    }
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd04
// Size: 0x191
function c130airdrop_getteamaveragepos(var_b36772ca73e9a3d) {
    if (!isdefined(var_b36772ca73e9a3d.players)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return (randomfloatrange(-1000, 1000), 0, 0);
    }
    var_5e57c125ba3e9b8 = (0, 0, 0);
    var_82316dc9ed0020f7 = 3000;
    var_b5b5e50f6ef69aae = 1;
    foreach (player in var_b36772ca73e9a3d.players) {
        if (!isreallyalive(player)) {
            continue;
        }
        var_5e57c125ba3e9b8 = player.origin;
        foreach (otherplayer in var_b36772ca73e9a3d.players) {
            if (otherplayer == player) {
                continue;
            }
            if (!isreallyalive(otherplayer)) {
                continue;
            }
            if (distance2dsquared(player.origin, otherplayer.origin) <= var_82316dc9ed0020f7 * var_82316dc9ed0020f7) {
                var_b5b5e50f6ef69aae++;
                var_5e57c125ba3e9b8 = var_5e57c125ba3e9b8 + otherplayer.origin;
                break;
            }
        }
        if (var_b5b5e50f6ef69aae >= 2) {
            break;
        }
    }
    var_2f432d8c975decc6 = var_5e57c125ba3e9b8 / var_b5b5e50f6ef69aae;
    return var_2f432d8c975decc6;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9d
// Size: 0x1f8
function c130airdrop_spawn(var_41c8bb9afb483172, pathdist, var_f0192932004dce8d, var_5b16491505732b2b) {
    airdrop = spawn("script_model", var_41c8bb9afb483172.startpt);
    airdrop setmodel("veh8_mil_air_acharlie130_magma_animated");
    airdrop setcandamage(0);
    airdrop.maxhealth = 100000;
    airdrop.health = airdrop.maxhealth;
    airdrop.startpt = var_41c8bb9afb483172.startpt;
    airdrop.endpt = var_41c8bb9afb483172.endpt;
    airdrop.centerpt = var_41c8bb9afb483172.centerpt;
    airdrop.dir = vectornormalize(airdrop.endpt - airdrop.startpt);
    airdrop.angles = vectortoangles(airdrop.dir);
    airdrop.pathdist = pathdist;
    airdrop.speed = var_f0192932004dce8d;
    airdrop.lifetime = var_5b16491505732b2b;
    airdrop.chassis = spawn("script_model", airdrop.startpt);
    airdrop.chassis setmodel("veh8_mil_air_acharlie130_magma_rigid");
    airdrop.chassis linkto(airdrop, "", (0, 0, 0), (0, 0, 0));
    if (issharedfuncdefined("game", "createObjective")) {
        minimapid = airdrop [[ getsharedfunc("game", "createObjective") ]]("icon_minimap_dropship", undefined, undefined, 1, 1);
        airdrop.minimapid = minimapid;
    }
    level.c130deliveriesinprogress[level.c130deliveriesinprogress.size] = airdrop;
    return airdrop;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109d
// Size: 0x63
function c130airdrop_startdelivery(var_5ee94ae126526f2f, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle) {
    self setscriptablepartstate("audio_lp_dmz", "on", 0);
    self moveto(self.endpt, self.lifetime);
    thread c130airdrop_deleteatlifetime();
    thread c130airdrop_dropcrates(var_5ee94ae126526f2f, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle);
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1107
// Size: 0xd8
function c130airdrop_deleteatlifetime() {
    self endon("death");
    level endon("game_ended");
    wait(self.lifetime - 1);
    var_b23a5ba733c5935d = spawn("script_model", self.origin);
    var_b23a5ba733c5935d setmodel("veh8_mil_air_acharlie130_magma_scriptable");
    var_b23a5ba733c5935d setscriptablepartstate("audio_exit_dmz", "on", 0);
    var_b23a5ba733c5935d thread namespace_9c840bb9f2ecbf00::delayentdelete(10);
    wait(1);
    level.c130deliveriesinprogress = array_remove(level.c130deliveriesinprogress, self);
    self setscriptablepartstate("audio_lp_dmz", "off", 0);
    if (isdefined(self.minimapid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.minimapid);
    }
    if (isdefined(self.chassis)) {
        self.chassis delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e6
// Size: 0x1bf
function c130airdrop_dropcrates(var_5ee94ae126526f2f, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle) {
    self endon("death");
    if (isdefined(self.dropfunc)) {
        self [[ self.dropfunc ]](var_5ee94ae126526f2f, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle);
    } else {
        var_bd693dcf6bece704 = self.lifetime;
        var_11f20c6978f7d6a6 = var_bd693dcf6bece704 * 0.4;
        var_4fd47bd923217de1 = var_bd693dcf6bece704 - var_11f20c6978f7d6a6;
        var_be2eea72dfa2c196 = var_11f20c6978f7d6a6 / 2;
        cratedroptime = var_4fd47bd923217de1 / max(1, var_5ee94ae126526f2f - 1);
        var_4e2dc12fc7bd831e = 1;
        var_71cac1d48ab1c488 = 0;
        var_800df1b7c6e3aa60 = var_be2eea72dfa2c196;
        numcrates = 0;
        while (numcrates < var_5ee94ae126526f2f) {
            if (!istrue(var_4e2dc12fc7bd831e)) {
                var_800df1b7c6e3aa60 = cratedroptime;
            }
            if (istrue(var_71cac1d48ab1c488)) {
                var_800df1b7c6e3aa60 = cratedroptime / 3;
                var_71cac1d48ab1c488 = 0;
            }
            wait(var_800df1b7c6e3aa60);
            if (istrue(var_4e2dc12fc7bd831e)) {
                var_4e2dc12fc7bd831e = 0;
            }
            droplocation = c130airdrop_findvaliddroplocation(self.origin + anglestoforward(self.angles) * 500);
            if (!isdefined(droplocation)) {
                var_71cac1d48ab1c488 = 1;
                continue;
            }
            crate = namespace_6c578d6ef48f10ef::dropbrc130airdropcrate(droplocation + (0, 0, level.c130airdrop_heightoverride - 100), droplocation, self.angles, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4);
            if (!isdefined(crate)) {
                var_71cac1d48ab1c488 = 1;
                continue;
            }
            numcrates++;
            var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(crate);
            var_ef5d5141fdb51174.usetimeoverride = 5;
            level.c130successfulairdrops[level.c130successfulairdrops.size] = crate;
        }
    }
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ac
// Size: 0xef
function c130airdrop_findvaliddroplocation(starttrace, var_5ce47de2b275eec8, var_d637e30565be7341) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    ignorelist = [0:self, 1:self.chassis];
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 0, 1, 1, 1);
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist, contents);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    if (isdefined(droplocation) && !istrue(var_5ce47de2b275eec8)) {
        validpoint = namespace_ad389306d44fc6b4::ispointinbounds(droplocation) && (istrue(var_d637e30565be7341) || !c130airdrop_isnearotherdrop(droplocation));
        if (!istrue(validpoint)) {
            droplocation = undefined;
        }
    }
    return droplocation;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a3
// Size: 0xbb
function c130airdrop_isnearotherdrop(droplocation) {
    var_f6ea6dc7b7e56191 = 0;
    var_fe9fa47fa7fa928b = level.c130successfulairdrops;
    var_491f9f618ad350f6 = getdvarint(@"hash_d313f3ed75dbff0f", 10000);
    var_16fac8f9233a1aca = var_491f9f618ad350f6 * var_491f9f618ad350f6;
    foreach (drop in var_fe9fa47fa7fa928b) {
        if (distance2dsquared(droplocation, drop.origin) < var_16fac8f9233a1aca) {
            var_f6ea6dc7b7e56191 = 1;
            break;
        }
    }
    return var_f6ea6dc7b7e56191;
}

// Namespace br_c130Airdrop/namespace_d58f8bbad53774ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1566
// Size: 0x280
function c130airdrop_oncrateuse(player) {
    var_6b5e1783915835c1 = getdvar(@"hash_c6f562bbcb26f231", "mp/loot_set_airdrop_contents_dmz.csv");
    self.itemsdropped = 0;
    var_e05413a53b5d9167 = [];
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "killstreak", var_6b5e1783915835c1);
        var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    }
    pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 4, 1, "weapon", var_6b5e1783915835c1);
    var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "health", var_6b5e1783915835c1);
    var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 2, "ammo", var_6b5e1783915835c1);
    var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf() && getdvarint(@"hash_506a78bc5717f8f4", 0) == 1) {
        pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "tablet", var_6b5e1783915835c1);
        var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    }
    var_3ebbdc9f30b63842 = randomint(3);
    if (var_3ebbdc9f30b63842 == 2) {
        pickups = namespace_1b7e64f50cca9321::chooseandspawnitems(dropstruct, 0, 1, "revive", var_6b5e1783915835c1);
        var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    }
    var_29e0256e5dd397a3 = 750;
    if (isdefined(level.airdropbasecashamount)) {
        var_29e0256e5dd397a3 = level.airdropbasecashamount;
    }
    if (istrue(level.bmoovertime)) {
        var_29e0256e5dd397a3 = int(var_29e0256e5dd397a3 * level.overtimecashmultiplier);
    }
    pickups = namespace_c6ccccd95254983f::dropplunderbyrarity(var_29e0256e5dd397a3, dropstruct);
    var_e05413a53b5d9167 = array_combine(var_e05413a53b5d9167, pickups);
    foreach (ent in var_e05413a53b5d9167) {
        ent.lootsource = "c130_box";
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "risk" || namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
    }
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_d9180ca5c5dc7b88");
}

