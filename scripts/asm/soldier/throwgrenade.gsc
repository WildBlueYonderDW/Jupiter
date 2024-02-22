// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\soldier\throwgrenade.gsc;
#using scripts\anim\utility_common.gsc;
#using script_13d1c402f1421c35;
#using script_7e4d332e911e1b90;
#using script_50eeb9595c6d6e1b;

#namespace throwgrenade;

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a
// Size: 0x13a
function playanim_throwgrenade(asmname, statename, params) {
    throwdata = spawnstruct();
    throwdata.xanim = self.var_7f098191f1773fbf;
    throwdata.vel = self.var_42febd687af39d67;
    throwdata.target = self._blackboard.throwgrenadetarget;
    throwdata.targetpos = self._blackboard.var_166faa0e61b0570c;
    throwdata.fastthrow = self.var_c054a6da1261fef2;
    throwdata.withbounce = self.var_18230b6226821ed4;
    throwdata.time = self.var_9b8861b6840ca825;
    /#
        assert(isdefined(throwdata));
    #/
    /#
        assert(gettime() - throwdata.time <= 100);
    #/
    self.ispreppinggrenade = 1;
    var_865c56cff05fe0ad = trygrenadethrow(asmname, statename, throwdata);
    if (!var_865c56cff05fe0ad) {
        self endon(statename + "_finished");
        wait(0.2);
        asm_fireevent(asmname, "end");
    }
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x39b
// Size: 0x3e
function playcoveranim_throwgrenade(asmname, statename, params) {
    if (isdefined(self.node)) {
        self.keepclaimednodeifvalid = 1;
    }
    namespace_47c4116b48b7aff1::playanim_throwgrenade(asmname, statename, params);
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e0
// Size: 0x5a
function function_335cff6a052a118c(model, tag) {
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

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x441
// Size: 0x2d
function playcoveranim_throwgrenade_cleanup(asmname, statename, params) {
    self function_4ea7891f787c6725();
    playanim_throwgrenade_cleanup(asmname, statename, params);
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x475
// Size: 0xb5
function playanim_throwgrenade_cleanup(asmname, statename, params) {
    self._blackboard.throwdata = undefined;
    asm_fireephemeralevent("throwgrenade", "end");
    model = namespace_7843e1029b5c80e::getgrenademodel();
    if (isdefined(self.var_37477c0658477fa8)) {
        function_335cff6a052a118c(model, self.var_37477c0658477fa8);
        self.var_37477c0658477fa8 = undefined;
    }
    if ((utility::issp() || utility::iscp()) && isdefined(self.isholdinggrenade)) {
        namespace_ba1fcf33692e2fad::dropgrenade();
        self.isholdinggrenade = undefined;
    }
    self.ispreppinggrenade = undefined;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0x3f
function shouldbounce(var_f9eec358459d9350) {
    grenadetype = var_f9eec358459d9350.basename;
    return grenadetype != "antigrav" && grenadetype != "emp" && grenadetype != "c8_grenade";
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x578
// Size: 0x2cc
function trygrenadethrow(asmname, statename, throwdata, var_973c51e9fd66d178) {
    destination = throwdata.targetpos;
    var_a15426692301f3f0 = throwdata.target;
    withbounce = throwdata.withbounce;
    if (!isdefined(withbounce)) {
        withbounce = 1;
    }
    /#
        assert(isdefined(throwdata.xanim));
    #/
    if (isdefined(destination)) {
        var_b1c462b90341e70e = getgrenadethrowoffset(statename, throwdata.xanim);
        if (!isdefined(throwdata.fastthrow)) {
            var_edcb23eb9e6141be = self checkgrenadethrowpos(var_b1c462b90341e70e, destination, withbounce, "min energy", "min time", "max time");
        } else {
            var_edcb23eb9e6141be = self checkgrenadethrowpos(var_b1c462b90341e70e, destination, withbounce, "min time", "min energy");
        }
    } else {
        var_edcb23eb9e6141be = throwdata.vel;
        /#
            assert(isdefined(var_edcb23eb9e6141be));
        #/
    }
    var_a15426692301f3f0 = throwdata.target;
    if (isdefined(var_edcb23eb9e6141be)) {
        if (!isdefined(self.oldgrenawareness)) {
            self.oldgrenawareness = self.grenadeawareness;
        }
        self.grenadeawareness = 0;
        /#
            if (getdvar(@"hash_9f7713320782588b") == "watchGrenadeTowardsTargetTimeout") {
                thread namespace_f87a4b6569ce73b2::debugpos(destination, "flash_grenade");
            }
        #/
        var_3251b898a0907271 = getdesiredgrenadetimervalue();
        setgrenadetimer(min(gettime() + 3000, var_3251b898a0907271));
        var_e57aea3945878349 = 0;
        if (isdefined(var_a15426692301f3f0) && usingplayergrenadetimer()) {
            /#
                assert(var_a15426692301f3f0 == self.var_a3441d87a95e9040);
            #/
            var_a15426692301f3f0 function_e89f2bdb307f137e();
            thread reducegiptponkillanimscript(statename, var_a15426692301f3f0);
            if (var_a15426692301f3f0 function_4c108309dc0d7fd2() > 1) {
                var_e57aea3945878349 = 1;
            }
            if (self.var_cc183df556f63da0 == "lethal") {
                if (var_a15426692301f3f0 function_4c108309dc0d7fd2() <= 1) {
                    var_a15426692301f3f0 function_ff4aa047884e7a14(gettime());
                }
            }
        }
        /#
            if (getdvar(@"hash_d5eaf4f7f5fd7d88") == "<unknown string>") {
                var_3251b898a0907271 = 0;
            }
        #/
        if (isdefined(var_973c51e9fd66d178)) {
            thread dogrenadethrow(asmname, statename, throwdata.xanim, var_edcb23eb9e6141be, var_3251b898a0907271, var_e57aea3945878349);
        } else {
            dogrenadethrow(asmname, statename, throwdata.xanim, var_edcb23eb9e6141be, var_3251b898a0907271, var_e57aea3945878349);
        }
        return 1;
    } else {
        /#
            function_c3d487ba233976c7("<unknown string>");
        #/
        /#
            if (getdvar(@"hash_4f3a4c91fee3cc20") == "<unknown string>" && isdefined(throwdata.destination)) {
                var_b1c462b90341e70e = getgrenadethrowoffset(statename, throwdata.xanim);
                thread grenadeline(var_b1c462b90341e70e, destination);
            }
        #/
    }
    return 0;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84c
// Size: 0x7c
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

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d0
// Size: 0x2c
function usingplayergrenadetimer() {
    /#
        assert(self.var_423e348b1ba9f198);
    #/
    return self.var_58c197914dd654e0 && isdefined(self.var_a3441d87a95e9040);
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x904
// Size: 0x31
function reducegiptponkillanimscript(statename, var_a15426692301f3f0) {
    self endon("dont_reduce_giptp_on_killanimscript");
    self waittill(statename + "_finished");
    if (isdefined(var_a15426692301f3f0)) {
        var_a15426692301f3f0 function_a33073d6fd58e58e();
    }
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x51c
function dogrenadethrow(asmname, statename, var_a9112040a3d575f1, var_edcb23eb9e6141be, var_3251b898a0907271, var_e57aea3945878349) {
    self endon("killanimscript");
    self endon(statename + "_finished");
    /#
        thread function_70a1498e97799dc4(statename, "<unknown string>", 3);
    #/
    asm_fireephemeralevent("throwgrenade", "start");
    covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
    if (!isdefined(covernode) || covernode.type == "Exposed" || covernode.type == "Path") {
        self orientmode("face direction", var_edcb23eb9e6141be);
    }
    var_d5c987658103bffd = asm_getbodyknob();
    /#
        assert(isdefined(var_d5c987658103bffd));
    #/
    var_7e86f9ecd18c5801 = asm_getxanim(statename, var_a9112040a3d575f1);
    function_216c67ab6749137a(self, undefined, "grenade_throw", namespace_24b7b4457f51f1a3::function_c666e714b2411844(self.grenadeweapon));
    asm_playfacialanim(asmname, statename, var_7e86f9ecd18c5801);
    self aisetanim(statename, var_a9112040a3d575f1, fasteranimspeed());
    thread asm_donotetracks(asmname, statename);
    model = namespace_7843e1029b5c80e::getgrenademodel();
    var_7924db5d06b35fb = "none";
    var_9930afea4de87021 = 0;
    while (!var_9930afea4de87021) {
        notes = self waittill(statename);
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        foreach (notetrack in notes) {
            if (notetrack == "grenade_right") {
                var_7924db5d06b35fb = attachgrenademodel(statename, model, "tag_accessory_right");
                self.isholdinggrenade = 1;
                self.var_37477c0658477fa8 = "tag_accessory_right";
            } else if (notetrack == "grenade_left") {
                var_7924db5d06b35fb = attachgrenademodel(statename, model, "tag_accessory_left");
                self.isholdinggrenade = 1;
                self.var_37477c0658477fa8 = "tag_accessory_left";
            }
            if (notetrack == "grenade_throw" || notetrack == "grenade throw") {
                var_9930afea4de87021 = 1;
            } else {
                /#
                    assert(notetrack != "end");
                #/
                if (notetrack == "end") {
                    self.var_a3441d87a95e9040 function_a33073d6fd58e58e();
                    self notify("dont_reduce_giptp_on_killanimscript");
                    return 0;
                }
            }
        }
    }
    /#
        if (getdvar(@"hash_27494f1d75fc0809") == "<unknown string>") {
            tags = [];
            var_c1b3d6b48e668752 = self getattachsize();
            emptyslot = [];
            for (i = 0; i < var_c1b3d6b48e668752; i++) {
                name = self getattachmodelname(i);
                if (issubstr(name, "<unknown string>")) {
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
                iprintlnbold("<unknown string>");
                println("<unknown string>", var_7e86f9ecd18c5801, "<unknown string>", tags[i]);
                break;
            }
        }
    #/
    /#
        thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
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
    var_2249366b1972061f = self throwgrenade(grenadetag);
    if (var_e57aea3945878349 && var_ddda1dbc4b1d9bfb) {
        player = self.var_a3441d87a95e9040;
        /#
            assert(isplayer(player));
        #/
        if (player function_4c108309dc0d7fd2() > 1 || gettime() - player function_df95fe0fcee94bf3() < 2000) {
            function_e4da167dc330b3d3(player, gettime() + min(5000, player.gs.playerdoublegrenadetime));
        }
    }
    self notify("stop grenade check");
    if (var_7924db5d06b35fb != "none") {
        self detach(model, var_7924db5d06b35fb);
    }
    self.isholdinggrenade = undefined;
    self.ispreppinggrenade = undefined;
    self.grenadeawareness = self.oldgrenawareness;
    self.oldgrenawareness = undefined;
    self.throwgrenadeatenemyasap = 0;
    if (isdefined(var_2249366b1972061f) && self.team == "axis") {
        level notify("enemy_grenade_fire", var_2249366b1972061f);
    }
    self waittillmatch(statename, "end");
    self notify("done_grenade_throw");
    self notify("weapon_switch_done");
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5f
// Size: 0x8
function fasteranimspeed() {
    return 1.5;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6f
// Size: 0x26
function attachgrenademodel(statename, model, tag) {
    self attach(model, tag);
    return tag;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9d
// Size: 0x1d
function waittillscriptchange(statename) {
    self endon(statename + "_finished");
    self waittill("killanimscript");
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xec1
// Size: 0x63
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

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b
// Size: 0xd3
function function_8337cab97d859a28(statename) {
    var_e97dd4a810914db1 = spawnstruct();
    var_e97dd4a810914db1 thread watchgrenadetowardstargettimeout(5);
    var_e97dd4a810914db1 endon("watchGrenadeTowardsTargetTimeout");
    grenade = getgrenadeithrew(statename);
    if (!isdefined(grenade)) {
        return;
    }
    /#
        grenade thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
    #/
    prevorigin = grenade.origin;
    while (1) {
        wait(0.1);
        if (!isdefined(grenade)) {
            break;
        }
        if (distancesquared(grenade.origin, prevorigin) < 400) {
            /#
                grenade thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
            #/
            function_16bae3e0b0aa09e3(grenade.origin);
            break;
        }
        prevorigin = grenade.origin;
    }
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1005
// Size: 0x38
function watchgrenadetowardsplayer(statename, player, var_3251b898a0907271) {
    player endon("death");
    watchgrenadetowardsplayerinternal(statename, var_3251b898a0907271);
    if (isdefined(player)) {
        player function_a33073d6fd58e58e();
    }
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1044
// Size: 0x23d
function watchgrenadetowardsplayerinternal(statename, var_3251b898a0907271) {
    var_cc183df556f63da0 = self.var_cc183df556f63da0;
    var_e97dd4a810914db1 = spawnstruct();
    var_e97dd4a810914db1 thread watchgrenadetowardstargettimeout(5);
    var_e97dd4a810914db1 endon("watchGrenadeTowardsTargetTimeout");
    type = self.grenadeweapon.basename;
    grenade = getgrenadeithrew(statename);
    if (!isdefined(grenade)) {
        return;
    }
    setgrenadetimer(min(gettime() + 5000, var_3251b898a0907271));
    /#
        grenade thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
    #/
    var_e4dd0eed70be5b70 = 62500;
    var_70167ae0bb5abd9d = 160000;
    if (type == "flash_grenade") {
        var_e4dd0eed70be5b70 = 810000;
        var_70167ae0bb5abd9d = 1690000;
    }
    var_fe16f116477f0084 = level.players;
    prevorigin = grenade.origin;
    var_6a984a8887a1a08b = 0;
    while (1) {
        wait(0.1);
        if (!isdefined(grenade)) {
            break;
        }
        if (distancesquared(grenade.origin, prevorigin) < 400) {
            /#
                grenade thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
            #/
            if (!var_6a984a8887a1a08b) {
                function_16bae3e0b0aa09e3(grenade.origin);
                var_6a984a8887a1a08b = 1;
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
                        grenade thread function_70a1498e97799dc4(statename, "<unknown string>", 5);
                    #/
                    player grenadelandednearplayer(var_cc183df556f63da0, var_3251b898a0907271);
                } else if (distsqrd < var_70167ae0bb5abd9d) {
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

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1288
// Size: 0x8d
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

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131c
// Size: 0x96
function setgrenadetimer(newvalue) {
    if (usingplayergrenadetimer() && isalive(self.var_a3441d87a95e9040)) {
        player = self.var_a3441d87a95e9040;
        weapontype = self.var_cc183df556f63da0;
        oldvalue = function_9752a69f79a06b7a(player, weapontype);
        function_b4ebe6632d7e8efe(player, weapontype, max(newvalue, oldvalue));
    } else {
        weapontype = self.var_cc183df556f63da0;
        oldvalue = function_9752a69f79a06b7a(undefined, weapontype);
        function_b4ebe6632d7e8efe(undefined, weapontype, max(newvalue, oldvalue));
    }
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b9
// Size: 0x30
function getgrenadeithrew(statename) {
    self endon("killanimscript");
    self endon(statename + "_finished");
    grenade = self waittill("grenade_fire");
    return grenade;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f1
// Size: 0x16
function watchgrenadetowardstargettimeout(var_5f6346f9ecd5e22a) {
    wait(var_5f6346f9ecd5e22a);
    self notify("watchGrenadeTowardsTargetTimeout");
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x140e
// Size: 0x73
function offsettoorigin(start) {
    forward = anglestoforward(self.angles);
    right = anglestoright(self.angles);
    up = anglestoup(self.angles);
    forward = forward * start[0];
    right = right * start[1];
    up = up * start[2];
    return forward + right + up;
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1489
// Size: 0x89
function grenadeline(start, end) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        start = self.origin + offsettoorigin(start);
        for (;;) {
            line(start, end, (1, 0, 1));
            print3d(start, start, (0.2, 0.5, 1), 1, 1);
            print3d(end, end, (0.2, 0.5, 1), 1, 1);
            wait(0.05);
        }
    #/
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0x31
function function_c3d487ba233976c7(reason) {
    /#
        if (getdvar(@"hash_2f0d3d5b9e9dbd3") != "watchGrenadeTowardsTargetTimeout") {
            return;
        }
        self.var_53cfc52e74b46509 = reason;
    #/
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1551
// Size: 0x11a
function function_70a1498e97799dc4(statename, state, duration, var_312ba7f72a3a2b1c) {
    /#
        if (getdvar(@"hash_2f0d3d5b9e9dbd3") != "watchGrenadeTowardsTargetTimeout") {
            return;
        }
        self notify("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        self endon(statename + "<unknown string>");
        self endon("<unknown string>");
        endtime = gettime() + 1000 * duration;
        while (gettime() < endtime) {
            print3d(self getshootatpos() + (0, 0, 10), state);
            if (isdefined(var_312ba7f72a3a2b1c) && isdefined(self.var_53cfc52e74b46509)) {
                print3d(self getshootatpos() + (0, 0, 0), "<unknown string>" + self.var_53cfc52e74b46509);
            } else if (self.var_423e348b1ba9f198) {
                print3d(self getshootatpos() + (0, 0, 0), "<unknown string>" + function_96d556dea441d1dc());
            }
            wait(0.05);
        }
    #/
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1672
// Size: 0x79
function function_96d556dea441d1dc() {
    /#
        if (usingplayergrenadetimer()) {
            for (i = 0; i < level.players.size; i++) {
                if (level.players[i] == self.var_a3441d87a95e9040) {
                    break;
                }
            }
            return ("<unknown string>" + i + 1 + "<unknown string>" + self.var_cc183df556f63da0);
        } else {
            return ("<unknown string>" + self.var_cc183df556f63da0);
        }
    #/
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f2
// Size: 0x4f5
function function_7ce8f6913eb4c152(asmname, var_5e1ab61c2c7fe69b) {
    /#
        /#
            assertex(isdefined(self.var_ae3ea15396b65c1f) && self.var_ae3ea15396b65c1f == asmname, "<unknown string>");
        #/
        var_1c69eec4a8595d25 = archetypegetalias(var_5e1ab61c2c7fe69b, "<unknown string>", "<unknown string>", 0);
        var_1c69eec4a8595d25 = var_1c69eec4a8595d25.anims;
        animarray = "<unknown string>" + var_5e1ab61c2c7fe69b + "<unknown string>";
        var_63cee04303d949d7 = "<unknown string>" + var_5e1ab61c2c7fe69b + "<unknown string>";
        println("<unknown string>");
        println("<unknown string>" + var_5e1ab61c2c7fe69b + "<unknown string>");
        println("<unknown string>" + animarray + "<unknown string>");
        println("<unknown string>" + var_63cee04303d949d7 + "<unknown string>");
        var_c47ac0395985867a = asmdevgetallstates(asmname);
        foreach (statename in var_c47ac0395985867a) {
            var_3e95892f99a9b61c = 0;
            aliases = archetypegetaliases(var_5e1ab61c2c7fe69b, statename);
            if (isdefined(aliases)) {
                foreach (alias in aliases) {
                    if (issubstr(statename, "<unknown string>") || issubstr(statename, "<unknown string>")) {
                        var_791b098a09314f83 = asm_getallanimindicesforalias(statename, alias);
                        var_44492a4eb603ec4c = asm_getxanim(statename, var_791b098a09314f83[0]);
                        /#
                            assert(!animhasnotetrack(var_44492a4eb603ec4c, "<unknown string>"));
                        #/
                        if (animhasnotetrack(var_44492a4eb603ec4c, "<unknown string>")) {
                            foreach (var_778945aba331d5db in var_791b098a09314f83) {
                                xanim = asm_getxanim(statename, var_778945aba331d5db);
                                /#
                                    assert(animhasnotetrack(xanim, "<unknown string>") && !animhasnotetrack(xanim, "<unknown string>"));
                                #/
                            }
                            println("<unknown string>" + animarray + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>");
                            println("<unknown string>" + var_63cee04303d949d7 + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>");
                            foreach (var_73e118efd1b1c59d, var_778945aba331d5db in var_791b098a09314f83) {
                                xanim = asm_getxanim(statename, var_778945aba331d5db);
                                var_95aca96ee2618fe = getnotetracktimes(xanim, "<unknown string>");
                                self clearanim(var_1c69eec4a8595d25, 0);
                                self setanimrestart(xanim, 1, 0, 0);
                                wait(0.05);
                                startpos = self.origin;
                                startangles = self.angles;
                                self setanimtime(xanim, var_95aca96ee2618fe[0]);
                                wait(0.05);
                                var_95abccfe668f369a = getmovedelta(xanim, 0, var_95aca96ee2618fe[0]);
                                startpos = startpos - rotatevector(var_95abccfe668f369a, startangles);
                                var_f24f3237b7e83856 = self gettagorigin("<unknown string>");
                                var_b47356da69a1f7ac = self gettagangles("<unknown string>");
                                var_b1513eaba8ac4d29 = rotatevectorinverted(var_f24f3237b7e83856 - startpos, startangles);
                                line(var_f24f3237b7e83856, var_f24f3237b7e83856 + anglestoforward(var_b47356da69a1f7ac) * 12, (0, 0, 1), 1, 0, 5);
                                line(var_f24f3237b7e83856, var_f24f3237b7e83856 + anglestoleft(var_b47356da69a1f7ac) * 12, (1, 0, 0), 1, 0, 5);
                                line(var_f24f3237b7e83856, var_f24f3237b7e83856 + anglestoup(var_b47356da69a1f7ac) * 12, (0, 1, 0), 1, 0, 5);
                                wait(0.25);
                                println("<unknown string>" + var_63cee04303d949d7 + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>" + var_73e118efd1b1c59d + "<unknown string>" + var_b1513eaba8ac4d29 + "<unknown string>");
                            }
                            println("<unknown string>" + animarray + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>" + var_63cee04303d949d7 + "<unknown string>" + statename + "<unknown string>" + alias + "<unknown string>");
                        }
                    }
                }
            }
        }
    #/
}

// Namespace throwgrenade/namespace_47c4116b48b7aff1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bee
// Size: 0x17
function function_d4917a3a4a6f232a() {
    /#
        function_7ce8f6913eb4c152("<unknown string>", "<unknown string>");
    #/
}

