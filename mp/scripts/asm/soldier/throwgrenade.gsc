#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\soldier\throwgrenade.gsc;
#using scripts\anim\utility_common.gsc;
#using script_13d1c402f1421c35;
#using script_7e4d332e911e1b90;
#using script_50eeb9595c6d6e1b;

#namespace throwgrenade;

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc
// Size: 0x139
function playanim_throwgrenade(asmname, statename, params) {
    throwdata = spawnstruct();
    throwdata.xanim = self.var_7f098191f1773fbf;
    throwdata.vel = self.var_42febd687af39d67;
    throwdata.target = self._blackboard.throwgrenadetarget;
    throwdata.targetpos = self._blackboard.var_166faa0e61b0570c;
    throwdata.fastthrow = self.var_c054a6da1261fef2;
    throwdata.withbounce = self.var_18230b6226821ed4;
    throwdata.time = self.var_9b8861b6840ca825;
    assert(isdefined(throwdata));
    assert(gettime() - throwdata.time <= 100);
    self.ispreppinggrenade = 1;
    var_865c56cff05fe0ad = trygrenadethrow(asmname, statename, throwdata);
    if (!var_865c56cff05fe0ad) {
        self endon(statename + "_finished");
        wait 0.2;
        asm_fireevent(asmname, "end");
    }
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41d
// Size: 0x3d
function playcoveranim_throwgrenade(asmname, statename, params) {
    if (isdefined(self.node)) {
        self.keepclaimednodeifvalid = 1;
    }
    scripts\asm\soldier\throwgrenade::playanim_throwgrenade(asmname, statename, params);
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x462
// Size: 0x59
function detachgrenade(model, tag) {
    if (!isdefined(self)) {
        return;
    }
    if (!istrue(self.isholdinggrenade)) {
        return;
    }
    if (isdefined(self.oldgrenawareness)) {
        self.grenadeawareness = self.oldgrenawareness;
        self.oldgrenawareness = undefined;
    }
    self detach(model, tag);
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c3
// Size: 0x2c
function playcoveranim_throwgrenade_cleanup(asmname, statename, params) {
    self function_4ea7891f787c6725();
    playanim_throwgrenade_cleanup(asmname, statename, params);
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4f7
// Size: 0xb5
function playanim_throwgrenade_cleanup(asmname, statename, params) {
    self._blackboard.throwdata = undefined;
    asm_fireephemeralevent("throwgrenade", "end");
    model = scripts\anim\utility_common::getgrenademodel();
    if (isdefined(self.var_37477c0658477fa8)) {
        detachgrenade(model, self.var_37477c0658477fa8);
        self.var_37477c0658477fa8 = undefined;
    }
    if ((utility::issp() || utility::iscp()) && isdefined(self.isholdinggrenade)) {
        namespace_ba1fcf33692e2fad::dropgrenade();
        self.isholdinggrenade = undefined;
    }
    self.ispreppinggrenade = undefined;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b4
// Size: 0x3f
function shouldbounce(objgrenadeweapon) {
    grenadetype = objgrenadeweapon.basename;
    return grenadetype != "antigrav" && grenadetype != "emp" && grenadetype != "c8_grenade";
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5fc
// Size: 0x2c6
function trygrenadethrow(asmname, statename, throwdata, var_973c51e9fd66d178) {
    destination = throwdata.targetpos;
    throwingat = throwdata.target;
    withbounce = throwdata.withbounce;
    if (!isdefined(withbounce)) {
        withbounce = 1;
    }
    assert(isdefined(throwdata.xanim));
    if (isdefined(destination)) {
        armoffset = getgrenadethrowoffset(statename, throwdata.xanim);
        if (!isdefined(throwdata.fastthrow)) {
            throwvel = self checkgrenadethrowpos(armoffset, destination, withbounce, "min energy", "min time", "max time");
        } else {
            throwvel = self checkgrenadethrowpos(armoffset, destination, withbounce, "min time", "min energy");
        }
    } else {
        throwvel = throwdata.vel;
        assert(isdefined(throwvel));
    }
    throwingat = throwdata.target;
    if (isdefined(throwvel)) {
        if (!isdefined(self.oldgrenawareness)) {
            self.oldgrenawareness = self.grenadeawareness;
        }
        self.grenadeawareness = 0;
        /#
            if (getdvar(@"anim_debug") == "<dev string:x1c>") {
                thread namespace_f87a4b6569ce73b2::debugpos(destination, "<dev string:x21>");
            }
        #/
        var_3251b898a0907271 = getdesiredgrenadetimervalue();
        setgrenadetimer(min(gettime() + 3000, var_3251b898a0907271));
        var_e57aea3945878349 = 0;
        if (isdefined(throwingat) && usingplayergrenadetimer()) {
            assert(throwingat == self.var_a3441d87a95e9040);
            throwingat function_e89f2bdb307f137e();
            thread reducegiptponkillanimscript(statename, throwingat);
            if (throwingat function_4c108309dc0d7fd2() > 1) {
                var_e57aea3945878349 = 1;
            }
            if (self.var_cc183df556f63da0 == "lethal") {
                if (throwingat function_4c108309dc0d7fd2() <= 1) {
                    throwingat function_ff4aa047884e7a14(gettime());
                }
            }
        }
        /#
            if (getdvar(@"hash_d5eaf4f7f5fd7d88") == "<dev string:x26>") {
                var_3251b898a0907271 = 0;
            }
        #/
        if (isdefined(var_973c51e9fd66d178)) {
            thread dogrenadethrow(asmname, statename, throwdata.xanim, throwvel, var_3251b898a0907271, var_e57aea3945878349);
        } else {
            dogrenadethrow(asmname, statename, throwdata.xanim, throwvel, var_3251b898a0907271, var_e57aea3945878349);
        }
        return true;
    } else {
        /#
            function_c3d487ba233976c7("<dev string:x2c>");
        #/
        /#
            if (getdvar(@"hash_4f3a4c91fee3cc20") == "<dev string:x26>" && isdefined(throwdata.destination)) {
                armoffset = getgrenadethrowoffset(statename, throwdata.xanim);
                thread grenadeline(armoffset, destination);
            }
        #/
    }
    return false;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8cb
// Size: 0x7b
function getdesiredgrenadetimervalue() {
    var_3251b898a0907271 = undefined;
    if (usingplayergrenadetimer()) {
        player = self.var_a3441d87a95e9040;
        var_3251b898a0907271 = gettime() + player.gs.playergrenadebasetime + randomint(player.gs.playergrenaderangetime);
    } else {
        var_3251b898a0907271 = gettime() + 30000 + randomint(30000);
    }
    return var_3251b898a0907271;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94f
// Size: 0x2b
function usingplayergrenadetimer() {
    assert(self.var_423e348b1ba9f198);
    return self.var_58c197914dd654e0 && isdefined(self.var_a3441d87a95e9040);
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x983
// Size: 0x30
function reducegiptponkillanimscript(statename, throwingat) {
    self endon("dont_reduce_giptp_on_killanimscript");
    self waittill(statename + "_finished");
    if (isdefined(throwingat)) {
        throwingat function_a33073d6fd58e58e();
    }
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x9bb
// Size: 0x509
function dogrenadethrow(asmname, statename, var_a9112040a3d575f1, throwvel, var_3251b898a0907271, var_e57aea3945878349) {
    self endon("killanimscript");
    self endon(statename + "_finished");
    /#
        thread grenadedebug(statename, "<dev string:x48>", 3);
    #/
    asm_fireephemeralevent("throwgrenade", "start");
    covernode = scripts\asm\asm_bb::bb_getcovernode();
    if (!isdefined(covernode) || covernode.type == "Exposed" || covernode.type == "Path") {
        self orientmode("face direction", throwvel);
    }
    bodyknob = asm_getbodyknob();
    assert(isdefined(bodyknob));
    throw_xanim = asm_getxanim(statename, var_a9112040a3d575f1);
    function_216c67ab6749137a(self, undefined, "grenade_throw", namespace_24b7b4457f51f1a3::function_c666e714b2411844(self.grenadeweapon));
    asm_playfacialanim(asmname, statename, throw_xanim);
    self aisetanim(statename, var_a9112040a3d575f1, fasteranimspeed());
    thread asm_donotetracks(asmname, statename);
    model = scripts\anim\utility_common::getgrenademodel();
    attachside = "none";
    var_9930afea4de87021 = 0;
    while (!var_9930afea4de87021) {
        self waittill(statename, notes);
        if (!isarray(notes)) {
            notes = [notes];
        }
        foreach (notetrack in notes) {
            if (notetrack == "grenade_right") {
                attachside = attachgrenademodel(statename, model, "tag_accessory_right");
                self.isholdinggrenade = 1;
                self.var_37477c0658477fa8 = "tag_accessory_right";
            } else if (notetrack == "grenade_left") {
                attachside = attachgrenademodel(statename, model, "tag_accessory_left");
                self.isholdinggrenade = 1;
                self.var_37477c0658477fa8 = "tag_accessory_left";
            }
            if (notetrack == "grenade_throw" || notetrack == "grenade throw") {
                var_9930afea4de87021 = 1;
                continue;
            }
            assert(notetrack != "<dev string:x5a>");
            if (notetrack == "end") {
                self.var_a3441d87a95e9040 function_a33073d6fd58e58e();
                self notify("dont_reduce_giptp_on_killanimscript");
                return 0;
            }
        }
    }
    /#
        if (getdvar(@"hash_27494f1d75fc0809") == "<dev string:x26>") {
            tags = [];
            numtags = self getattachsize();
            emptyslot = [];
            for (i = 0; i < numtags; i++) {
                name = self getattachmodelname(i);
                if (issubstr(name, "<dev string:x61>")) {
                    tagname = self getattachtagname(i);
                    emptyslot[tagname] = 0;
                    tags[tags.size] = tagname;
                }
            }
            for (i = 0; i < tags.size; i++) {
                emptyslot[tags[i]]++;
                if (emptyslot[tags[i]] < 2) {
                    continue;
                }
                iprintlnbold("<dev string:x6b>");
                println("<dev string:x99>", throw_xanim, "<dev string:xb5>", tags[i]);
                break;
            }
        }
    #/
    /#
        thread grenadedebug(statename, "<dev string:xdb>", 5);
    #/
    self notify("dont_reduce_giptp_on_killanimscript");
    var_ddda1dbc4b1d9bfb = usingplayergrenadetimer();
    if (var_ddda1dbc4b1d9bfb) {
        thread watchgrenadetowardsplayer(statename, self.var_a3441d87a95e9040, var_3251b898a0907271);
    } else {
        thread function_8337cab97d859a28(statename);
        setgrenadetimer(var_3251b898a0907271);
    }
    grenadetag = undefined;
    if (getdvarint(@"hash_e4a1f0f8938917ac", 0)) {
        grenadetag = self.var_37477c0658477fa8;
    }
    throwngrenade = self throwgrenade(grenadetag);
    if (var_e57aea3945878349 && var_ddda1dbc4b1d9bfb) {
        player = self.var_a3441d87a95e9040;
        assert(isplayer(player));
        if (player function_4c108309dc0d7fd2() > 1 || gettime() - player function_df95fe0fcee94bf3() < 2000) {
            function_e4da167dc330b3d3(player, gettime() + min(5000, player.gs.playerdoublegrenadetime));
        }
    }
    self notify("stop grenade check");
    if (attachside != "none") {
        self detach(model, attachside);
    }
    self.isholdinggrenade = undefined;
    self.ispreppinggrenade = undefined;
    self.grenadeawareness = self.oldgrenawareness;
    self.oldgrenawareness = undefined;
    self.throwgrenadeatenemyasap = 0;
    if (isdefined(throwngrenade) && self.team == "axis") {
        level notify("enemy_grenade_fire", throwngrenade);
    }
    self waittillmatch(statename, "end");
    self notify("done_grenade_throw");
    self notify("weapon_switch_done");
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xecc
// Size: 0x7
function fasteranimspeed() {
    return 1.5;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xedc
// Size: 0x25
function attachgrenademodel(statename, model, tag) {
    self attach(model, tag);
    return tag;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf0a
// Size: 0x1c
function waittillscriptchange(statename) {
    self endon(statename + "_finished");
    self waittill("killanimscript");
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0x62
function detachgrenadeonscriptchange(statename, model, tag) {
    self endon("stop grenade check");
    waittillscriptchange(statename);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.oldgrenawareness)) {
        self.grenadeawareness = self.oldgrenawareness;
        self.oldgrenawareness = undefined;
    }
    self detach(model, tag);
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf98
// Size: 0xd1
function function_8337cab97d859a28(statename) {
    timeoutobj = spawnstruct();
    timeoutobj thread watchGrenadeTowardsTargetTimeout(5);
    timeoutobj endon("watchGrenadeTowardsTargetTimeout");
    grenade = getgrenadeithrew(statename);
    if (!isdefined(grenade)) {
        return;
    }
    /#
        grenade thread grenadedebug(statename, "<dev string:xe4>", 5);
    #/
    for (prevorigin = grenade.origin; true; prevorigin = grenade.origin) {
        wait 0.1;
        if (!isdefined(grenade)) {
            break;
        }
        if (distancesquared(grenade.origin, prevorigin) < 400) {
            /#
                grenade thread grenadedebug(statename, "<dev string:xf0>", 5);
            #/
            function_16bae3e0b0aa09e3(grenade.origin);
            break;
        }
    }
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1071
// Size: 0x37
function watchgrenadetowardsplayer(statename, player, var_3251b898a0907271) {
    player endon("death");
    watchgrenadetowardsplayerinternal(statename, var_3251b898a0907271);
    if (isdefined(player)) {
        player function_a33073d6fd58e58e();
    }
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10b0
// Size: 0x231
function watchgrenadetowardsplayerinternal(statename, var_3251b898a0907271) {
    var_cc183df556f63da0 = self.var_cc183df556f63da0;
    timeoutobj = spawnstruct();
    timeoutobj thread watchGrenadeTowardsTargetTimeout(5);
    timeoutobj endon("watchGrenadeTowardsTargetTimeout");
    type = self.grenadeweapon.basename;
    grenade = getgrenadeithrew(statename);
    if (!isdefined(grenade)) {
        return;
    }
    setgrenadetimer(min(gettime() + 5000, var_3251b898a0907271));
    /#
        grenade thread grenadedebug(statename, "<dev string:xe4>", 5);
    #/
    var_e4dd0eed70be5b70 = 62500;
    var_70167ae0bb5abd9d = 160000;
    if (type == "flash_grenade") {
        var_e4dd0eed70be5b70 = 810000;
        var_70167ae0bb5abd9d = 1690000;
    }
    var_fe16f116477f0084 = level.players;
    prevorigin = grenade.origin;
    haslanded = 0;
    while (true) {
        wait 0.1;
        if (!isdefined(grenade)) {
            break;
        }
        if (distancesquared(grenade.origin, prevorigin) < 400) {
            /#
                grenade thread grenadedebug(statename, "<dev string:xf0>", 5);
            #/
            if (!haslanded) {
                function_16bae3e0b0aa09e3(grenade.origin);
                haslanded = 1;
            }
            var_2ed5956d72563348 = [];
            for (i = 0; i < var_fe16f116477f0084.size; i++) {
                player = var_fe16f116477f0084[i];
                if (!isdefined(player) || !isalive(player)) {
                    continue;
                }
                distsqrd = distancesquared(grenade.origin, player.origin);
                if (distsqrd < var_e4dd0eed70be5b70) {
                    /#
                        grenade thread grenadedebug(statename, "<dev string:xfa>", 5);
                    #/
                    player grenadelandednearplayer(var_cc183df556f63da0, var_3251b898a0907271);
                    continue;
                }
                if (distsqrd < var_70167ae0bb5abd9d) {
                    var_2ed5956d72563348[var_2ed5956d72563348.size] = player;
                }
            }
            var_fe16f116477f0084 = var_2ed5956d72563348;
            if (var_fe16f116477f0084.size == 0) {
                break;
            }
        }
        prevorigin = grenade.origin;
    }
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12e9
// Size: 0x8b
function grenadelandednearplayer(var_cc183df556f63da0, var_3251b898a0907271) {
    player = self;
    function_98deae9464f6c005(0);
    curtime = gettime();
    if (curtime - player function_df95fe0fcee94bf3() < 3000) {
        function_e4da167dc330b3d3(player, curtime + player.gs.playerdoublegrenadetime);
    }
    player function_4f19cf7b3c28acd7(curtime);
    oldvalue = function_9752a69f79a06b7a(player, var_cc183df556f63da0);
    function_b4ebe6632d7e8efe(player, var_cc183df556f63da0, max(var_3251b898a0907271, oldvalue));
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137c
// Size: 0x94
function setgrenadetimer(newvalue) {
    if (usingplayergrenadetimer() && isalive(self.var_a3441d87a95e9040)) {
        player = self.var_a3441d87a95e9040;
        weapontype = self.var_cc183df556f63da0;
        oldvalue = function_9752a69f79a06b7a(player, weapontype);
        function_b4ebe6632d7e8efe(player, weapontype, max(newvalue, oldvalue));
        return;
    }
    weapontype = self.var_cc183df556f63da0;
    oldvalue = function_9752a69f79a06b7a(undefined, weapontype);
    function_b4ebe6632d7e8efe(undefined, weapontype, max(newvalue, oldvalue));
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1418
// Size: 0x30
function getgrenadeithrew(statename) {
    self endon("killanimscript");
    self endon(statename + "_finished");
    self waittill("grenade_fire", grenade);
    return grenade;
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1451
// Size: 0x15
function watchGrenadeTowardsTargetTimeout(timerlength) {
    wait timerlength;
    self notify("watchGrenadeTowardsTargetTimeout");
}

// Namespace throwgrenade / scripts\asm\soldier\throwgrenade
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146e
// Size: 0x71
function offsettoorigin(start) {
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    up = anglestoup(self.angles);
    forward *= start[0];
    right *= start[1];
    up *= start[2];
    return forward + right + up;
}

/#

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x14e8
    // Size: 0x88
    function grenadeline(start, end) {
        level notify("<dev string:x110>");
        level endon("<dev string:x110>");
        start = self.origin + offsettoorigin(start);
        for (;;) {
            line(start, end, (1, 0, 1));
            print3d(start, start, (0.2, 0.5, 1), 1, 1);
            print3d(end, end, (0.2, 0.5, 1), 1, 1);
            wait 0.05;
        }
    }

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1578
    // Size: 0x30
    function function_c3d487ba233976c7(reason) {
        if (getdvar(@"hash_2f0d3d5b9e9dbd3") != "<dev string:x1c>") {
            return;
        }
        self.var_53cfc52e74b46509 = reason;
    }

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x15b0
    // Size: 0x11a
    function grenadedebug(statename, state, duration, var_312ba7f72a3a2b1c) {
        if (getdvar(@"hash_2f0d3d5b9e9dbd3") != "<dev string:x1c>") {
            return;
        }
        self notify("<dev string:x11d>");
        self endon("<dev string:x11d>");
        self endon("<dev string:x12e>");
        self endon(statename + "<dev string:x140>");
        self endon("<dev string:x14d>");
        endtime = gettime() + 1000 * duration;
        while (gettime() < endtime) {
            print3d(self getshootatpos() + (0, 0, 10), state);
            if (isdefined(var_312ba7f72a3a2b1c) && isdefined(self.var_53cfc52e74b46509)) {
                print3d(self getshootatpos() + (0, 0, 0), "<dev string:x156>" + self.var_53cfc52e74b46509);
            } else if (self.var_423e348b1ba9f198) {
                print3d(self getshootatpos() + (0, 0, 0), "<dev string:x162>" + function_96d556dea441d1dc());
            }
            wait 0.05;
        }
    }

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x16d2
    // Size: 0x79
    function function_96d556dea441d1dc() {
        if (usingplayergrenadetimer()) {
            for (i = 0; i < level.players.size; i++) {
                if (level.players[i] == self.var_a3441d87a95e9040) {
                    break;
                }
            }
            return ("<dev string:x16d>" + i + 1 + "<dev string:x178>" + self.var_cc183df556f63da0);
        }
        return "<dev string:x17d>" + self.var_cc183df556f63da0;
    }

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x1753
    // Size: 0x4db
    function function_7ce8f6913eb4c152(asmname, archetypename) {
        assertex(isdefined(self.animsetname) && self.animsetname == asmname, "<dev string:x184>");
        rootknob = archetypegetalias(archetypename, "<dev string:x1dc>", "<dev string:x1e5>", 0);
        rootknob = rootknob.anims;
        animarray = "<dev string:x1ed>" + archetypename + "<dev string:x20a>";
        var_63cee04303d949d7 = "<dev string:x211>" + archetypename + "<dev string:x20a>";
        println("<dev string:x230>");
        println("<dev string:x280>" + archetypename + "<dev string:x2ae>");
        println("<dev string:x2c4>" + animarray + "<dev string:x2c9>");
        println("<dev string:x2c4>" + var_63cee04303d949d7 + "<dev string:x2c9>");
        allstates = asmdevgetallstates(asmname);
        foreach (statename in allstates) {
            var_3e95892f99a9b61c = 0;
            aliases = archetypegetaliases(archetypename, statename);
            if (isdefined(aliases)) {
                foreach (alias in aliases) {
                    if (issubstr(statename, "<dev string:x2d3>") || issubstr(statename, "<dev string:x2de>")) {
                        var_791b098a09314f83 = asm_getallanimindicesforalias(statename, alias);
                        var_44492a4eb603ec4c = asm_getxanim(statename, var_791b098a09314f83[0]);
                        assert(!animhasnotetrack(var_44492a4eb603ec4c, "<dev string:x2e7>"));
                        if (animhasnotetrack(var_44492a4eb603ec4c, "<dev string:x2f8>")) {
                            foreach (animidx in var_791b098a09314f83) {
                                xanim = asm_getxanim(statename, animidx);
                                assert(animhasnotetrack(xanim, "<dev string:x2f8>") && !animhasnotetrack(xanim, "<dev string:x2e7>"));
                            }
                            println("<dev string:x2c4>" + animarray + "<dev string:x309>" + statename + "<dev string:x310>" + alias + "<dev string:x31a>" + statename + "<dev string:x349>" + alias + "<dev string:x351>");
                            println("<dev string:x2c4>" + var_63cee04303d949d7 + "<dev string:x309>" + statename + "<dev string:x310>" + alias + "<dev string:x359>");
                            foreach (var_73e118efd1b1c59d, animidx in var_791b098a09314f83) {
                                xanim = asm_getxanim(statename, animidx);
                                notetracktimes = getnotetracktimes(xanim, "<dev string:x2f8>");
                                self clearanim(rootknob, 0);
                                self setanimrestart(xanim, 1, 0, 0);
                                wait 0.05;
                                startpos = self.origin;
                                startangles = self.angles;
                                self setanimtime(xanim, notetracktimes[0]);
                                wait 0.05;
                                animdelta = getmovedelta(xanim, 0, notetracktimes[0]);
                                startpos -= rotatevector(animdelta, startangles);
                                handpos = self gettagorigin("<dev string:x366>");
                                var_b47356da69a1f7ac = self gettagangles("<dev string:x366>");
                                var_b1513eaba8ac4d29 = rotatevectorinverted(handpos - startpos, startangles);
                                line(handpos, handpos + anglestoforward(var_b47356da69a1f7ac) * 12, (0, 0, 1), 1, 0, 5);
                                line(handpos, handpos + anglestoleft(var_b47356da69a1f7ac) * 12, (1, 0, 0), 1, 0, 5);
                                line(handpos, handpos + anglestoup(var_b47356da69a1f7ac) * 12, (0, 1, 0), 1, 0, 5);
                                wait 0.25;
                                println("<dev string:x2c4>" + var_63cee04303d949d7 + "<dev string:x309>" + statename + "<dev string:x310>" + alias + "<dev string:x37d>" + var_73e118efd1b1c59d + "<dev string:x386>" + var_b1513eaba8ac4d29 + "<dev string:x38f>");
                            }
                            println("<dev string:x394>" + animarray + "<dev string:x309>" + statename + "<dev string:x310>" + alias + "<dev string:x3a1>" + var_63cee04303d949d7 + "<dev string:x309>" + statename + "<dev string:x310>" + alias + "<dev string:x3b1>");
                        }
                    }
                }
            }
        }
    }

    // Namespace throwgrenade / scripts\asm\soldier\throwgrenade
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c36
    // Size: 0x16
    function function_d4917a3a4a6f232a() {
        function_7ce8f6913eb4c152("<dev string:x3c0>", "<dev string:x3c0>");
    }

#/
