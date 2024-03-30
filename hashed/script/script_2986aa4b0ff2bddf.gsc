// mwiii decomp prototype
#using script_59ff79d681bb860c;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using script_3d2770dc09c1243;
#using scripts\mp\outofbounds.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\parachute.gsc;

#namespace namespace_503ce3a6b9903b4d;

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x277
// Size: 0x3b
function init() {
    level.mit.roaming = spawnstruct();
    level.mit.roaming.var_18105e1cc239e2de = [];
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b9
// Size: 0x1a1
function testprocess(var_a998844686a7ae57) {
    var_cbef341a3aeef001 = 32;
    self.mit.onplayerkilled = &onplayerkilled;
    self.mit.var_c2f04ca3110fa58a = 0;
    self.mit.var_d1dcf59fc3a6fa1 = undefined;
    enableparachute(0);
    if (isdefined(var_a998844686a7ae57)) {
        destination = var_a998844686a7ae57;
    } else {
        destination = function_f2a51e5bf06397e3();
    }
    /#
        assert(isdefined(destination));
    #/
    function_9e400058ef021b03(destination, var_cbef341a3aeef001);
    self.mit.botstartpos = self.origin;
    self.mit.botendpos = destination;
    self botsetdifficultysetting("slideChance", 0);
    childthread function_a27eb75c08f18c4f();
    childthread function_6885bdfe55f8f15d(destination);
    childthread function_e6c8677b0fb79d74(destination);
    childthread function_898085e0edaf6334(destination);
    var_b61d2f13ca2d857f = ["custom_fall_check_finished", "custom_stuck_check_finished", "path_event_check_finished"];
    function_5adca43f839a3cce(var_b61d2f13ca2d857f);
    if (self.mit.var_d1dcf59fc3a6fa1 != "goal") {
        if (isdefined(var_a998844686a7ae57)) {
            freezebot(1);
            while (true) {
                wait(60);
            }
        }
        function_eea4061f2af571b4(self.mit.var_d1dcf59fc3a6fa1 != "skip");
    }
    self.mit.var_c2f04ca3110fa58a = 1;
    return self.mit.var_d1dcf59fc3a6fa1;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x462
// Size: 0x4c
function endhandler() {
    if (!istrue(self.mit.var_c2f04ca3110fa58a) && isaliveplayer(self)) {
        return report("unexpectedly", self, [function_57a85ec4923ff680("botPos", self.origin)]);
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b5
// Size: 0xf6
function private onplayerkilled(deathdata) {
    if (!isbot(self)) {
        return;
    }
    interestingpos = [];
    interestingpos[interestingpos.size] = function_57a85ec4923ff680("deathPos", self.lastdeathpos);
    if (scripts/mp/outofbounds::ispointinoutofbounds(self.lastdeathpos, self.team)) {
        report("killed_by_oob", self, interestingpos, self.mit.botendpos, undefined, deathdata.meansofdeath);
    } else {
        if (isdefined(self.mit.var_9a0bbf45ee5bcf80)) {
            interestingpos[interestingpos.size] = function_57a85ec4923ff680("startFall", self.mit.var_9a0bbf45ee5bcf80);
        }
        report("death", self, interestingpos, self.mit.botendpos, undefined, deathdata.meansofdeath);
    }
    enableparachute(1);
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b2
// Size: 0xa1
function private function_a27eb75c08f18c4f() {
    var_30f1a5ab0be2ab6e = 0.5;
    lastorigin = self.origin;
    self.mit.var_df1c47227c3b4ea5 = [lastorigin];
    while (true) {
        wait(var_30f1a5ab0be2ab6e);
        var_ff5e5f5119ac870b = 100;
        if (distancesquared(lastorigin, self.origin) > var_ff5e5f5119ac870b) {
            lastorigin = self.origin;
            self.mit.var_df1c47227c3b4ea5[self.mit.var_df1c47227c3b4ea5.size] = lastorigin;
        }
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x65a
// Size: 0x18c
function private function_6885bdfe55f8f15d(target) {
    var_2530eb2df770b9f9 = 0.5;
    var_7b00b13d4490deb3 = 100;
    var_55b2e7290fca6911 = 4;
    lastpos = undefined;
    self.mit.startfalltime = undefined;
    while (true) {
        wait(var_2530eb2df770b9f9);
        if (self isonground() || self function_3e76c64a7bfe7be9()) {
            lastpos = undefined;
            self.mit.startfalltime = undefined;
            continue;
        }
        curpos = self.origin;
        if (isdefined(lastpos)) {
            fallingspeed = (lastpos[2] - curpos[2]) / var_2530eb2df770b9f9;
            if (fallingspeed > var_7b00b13d4490deb3) {
                if (!isdefined(self.mit.startfalltime)) {
                    self.mit.startfalltime = getsystemtime();
                    self.mit.var_9a0bbf45ee5bcf80 = lastpos;
                }
                if (getsystemtime() - self.mit.startfalltime >= var_55b2e7290fca6911) {
                    self.mit.var_d1dcf59fc3a6fa1 = report("custom_fall", self, [function_57a85ec4923ff680("startFalling", self.mit.var_9a0bbf45ee5bcf80)], target, undefined, undefined);
                    self notify("custom_fall_check_finished");
                    return;
                }
            } else {
                self.mit.startfalltime = undefined;
            }
        }
        lastpos = curpos;
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ed
// Size: 0x13b
function private function_e6c8677b0fb79d74(target) {
    self endon("end_custom_stuck");
    var_45a16c7edeccb500 = 10;
    var_68c48f0a02281be6 = 32;
    var_b0f645bd38d985cc = 64;
    lastpos = self.origin;
    path = undefined;
    var_6d82c1563a4ff586 = 5000;
    while (true) {
        wait(var_45a16c7edeccb500);
        var_f122a392f555d0c8 = function_71b519a5e0525acc();
        while (distance(lastpos, self.origin) < var_68c48f0a02281be6) {
            if (function_71b519a5e0525acc() - var_f122a392f555d0c8 < var_6d82c1563a4ff586) {
                waitframe();
                continue;
            }
            newpath = self function_b96cea3ba44fc035();
            if (isdefined(newpath)) {
                path = newpath;
            }
            reason = detectdoor(self, var_b0f645bd38d985cc);
            if (!isdefined(reason)) {
                reason = detectladder(self, var_b0f645bd38d985cc);
            }
            self.mit.var_d1dcf59fc3a6fa1 = report("custom_stuck", self, [function_57a85ec4923ff680("botPos", self.origin)], target, path, reason);
            self notify("custom_stuck_check_finished");
            return;
        }
        lastpos = self.origin;
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x92f
// Size: 0xca
function function_898085e0edaf6334(target) {
    path = undefined;
    const_timeout = 2;
    while (true) {
        result = function_b564050a363f08ec(self, const_timeout);
        newpath = self function_b96cea3ba44fc035();
        if (isdefined(newpath)) {
            path = newpath;
        }
        if (result == "goal") {
            self.mit.var_d1dcf59fc3a6fa1 = result;
            break;
        }
        if (result != "timeout") {
            self.mit.var_d1dcf59fc3a6fa1 = report(result, self, [function_57a85ec4923ff680("botPos", self.origin)], target, path);
            break;
        }
    }
    self notify("path_event_check_finished");
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa00
// Size: 0x3bb
function private report(situation, bot, position, target, path, comment) {
    if (!istrue(level.mit.roaming.var_5b2e8a31f3418367)) {
        header = "#time; #situation; #bot; #position; #begin; #end; #pathFind; #comment; #track";
        outputlog("Roaming", header);
        level.mit.roaming.var_5b2e8a31f3418367 = 1;
    }
    /#
        assert(isarray(position));
    #/
    if (function_cdbac84c6cf66a08(position[0].origin, path)) {
        return "skip";
    }
    posstr = "";
    foreach (pos in position) {
        posstr = posstr + pos.posdescription + pos.origin + " ";
    }
    pathstr = "";
    if (isdefined(path)) {
        for (i = 0; i < path.size; i++) {
            pathstr = pathstr + path[i];
        }
    }
    reportstring = gettime() + "; " + situation + "; " + bot getentitynumber() + "; " + posstr + "; " + bot.mit.botstartpos + "; " + default_to(target, "") + "; " + pathstr + "; " + default_to(comment, "") + ";";
    var_b47c51ade878375b = 4096;
    lineindex = 0;
    if (isarray(self.mit.var_df1c47227c3b4ea5)) {
        foreach (path in self.mit.var_df1c47227c3b4ea5) {
            pathstr = path + "";
            if (reportstring.size + pathstr.size >= var_b47c51ade878375b) {
                outputlog("Roaming", reportstring, lineindex > 0);
                reportstring = "";
                lineindex++;
            }
            reportstring = reportstring + pathstr;
        }
    }
    outputlog("Roaming", reportstring, lineindex > 0);
    extrareport(situation, bot, position, target, path, comment);
    /#
        if (getdvarint(@"hash_824c718cad3c0f17", 1)) {
            if (isdefined(level.mit.roaming.var_31e45429b9998458)) {
                level.mit.roaming.var_31e45429b9998458 = level.mit.roaming.var_31e45429b9998458 + 1;
            } else {
                level.mit.roaming.var_31e45429b9998458 = 1;
            }
            function_f2bc01a7b0321f52("disable_rotation", position[0].origin, position[0].origin + (0, 0, 100), undefined, level.mit.roaming.var_31e45429b9998458);
        }
    #/
    return situation;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdc3
// Size: 0x145
function private extrareport(situation, bot, position, target, path, comment) {
    reportstring = "";
    switch (situation) {
    case #"hash_e8bc3da4af287c2d":
        var_acc73b9be635b8be = isarray(position) && isdefined(position[1]) && position[1].posdescription == "startFall" && position[0].origin[2] < level.mit.var_513a313408516dc2;
        if (var_acc73b9be635b8be) {
            reportstring = reportstring + "death_bot_fell_in_hole, " + position[0].posdescription + position[0].origin + ", " + position[1].posdescription + position[1].origin;
        }
        break;
    case #"hash_c023be270799b5f9":
        if (isdefined(comment)) {
            reportstring = reportstring + "custom_stuck_by_" + comment;
            reportstring = reportstring + ", " + position;
        }
        break;
    }
    if (reportstring != "") {
        outputlog("Roaming_Bug", reportstring);
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf0f
// Size: 0x33
function private function_cdbac84c6cf66a08(position, path) {
    return function_474c2bdac948dd09(position) || function_5fc639be43086a50(position, path) || function_30be3ceb758e4162(position, path);
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf4a
// Size: 0xc8
function private function_474c2bdac948dd09(position) {
    var_ff5e5f5119ac870b = 100;
    foreach (var_4d547643f25a864 in level.mit.roaming.var_18105e1cc239e2de) {
        if (distancesquared(var_4d547643f25a864, position) < var_ff5e5f5119ac870b) {
            return true;
        }
    }
    level.mit.roaming.var_18105e1cc239e2de[level.mit.roaming.var_18105e1cc239e2de.size] = position;
    return false;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x101a
// Size: 0x198
function private function_5fc639be43086a50(position, path) {
    if (!isdefined(level.mit.door) || !isarray(level.mit.door.var_baace84a7c08f5dd)) {
        return false;
    }
    var_749cb00edb06e02a = 64;
    subpaths = function_6a04d8387ace6ae8(position, path, var_749cb00edb06e02a, 1);
    if (!isdefined(subpaths)) {
        return false;
    }
    foreach (doorinfo in level.mit.door.var_baace84a7c08f5dd) {
        var_1e35e50e4b93eab6 = 64;
        var_11855ac71db6dc0d = doorinfo.door.origin;
        var_1a2dfa0e910c8a94 = var_11855ac71db6dc0d + anglestoforward(doorinfo.originangle) * var_1e35e50e4b93eab6;
        foreach (subpath in subpaths) {
            var_96fa6fb431ddede3 = function_3c55380b5e177254(subpath[0], subpath[1], var_11855ac71db6dc0d, var_1a2dfa0e910c8a94);
            if (var_96fa6fb431ddede3) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11ba
// Size: 0x17b
function private function_30be3ceb758e4162(position, path) {
    if (!isdefined(level.mit.traversal) || !isarray(level.mit.traversal.var_eb99c06f565b2a3b)) {
        return false;
    }
    var_749cb00edb06e02a = 64;
    subpaths = function_6a04d8387ace6ae8(position, path, var_749cb00edb06e02a, 0);
    if (!isdefined(subpaths)) {
        return false;
    }
    foreach (traversalinfo in level.mit.traversal.var_eb99c06f565b2a3b) {
        traversalstart = traversalinfo[0].origin;
        traversalend = traversalinfo[1].origin;
        foreach (subpath in subpaths) {
            var_aef8c08e0b7f4061 = function_aef8c08e0b7f4061(traversalstart, traversalend, subpath[0], subpath[1]);
            if (var_aef8c08e0b7f4061) {
                return true;
            }
        }
    }
    return false;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x133d
// Size: 0xeb
function private function_6a04d8387ace6ae8(position, path, thresholddist, var_411f5d81b0a4c8a1) {
    if (!isdefined(position) || !isdefined(path) || !isarray(path) || path.size < 2) {
        return undefined;
    }
    if (!isdefined(thresholddist)) {
        thresholddist = 64;
    }
    res = [];
    for (i = 0; i < path.size - 1; i++) {
        p1 = path[i];
        p2 = path[i + 1];
        if (istrue(var_411f5d81b0a4c8a1) && i == 0) {
            d12 = vectornormalize(p1 - p2);
            p1 = p1 + d12 * thresholddist;
        }
        if (function_7c9ea559aa168fb4(position, p1, p2, thresholddist)) {
            res[res.size] = [p1, p2];
        }
    }
    if (res.size > 0) {
        return res;
    }
    return undefined;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1430
// Size: 0x6b
function private function_7c9ea559aa168fb4(position, start, end, thresholddist) {
    subpathlength = length2d(end - start);
    var_dcda148dbd56ce31 = length2d(position - start);
    var_f5708e0946783d54 = length2d(position - end);
    return abs(var_dcda148dbd56ce31 + var_f5708e0946783d54 - subpathlength) < thresholddist;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14a3
// Size: 0x48
function private function_aef8c08e0b7f4061(traversalstart, traversalend, subpathstart, subpathend) {
    var_6d80ddc0fe3c4e03 = 1024;
    return distancesquared(traversalstart, subpathstart) < var_6d80ddc0fe3c4e03 && distancesquared(traversalend, subpathend) < var_6d80ddc0fe3c4e03;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14f3
// Size: 0x22
function private function_f2a51e5bf06397e3() {
    if (getdvarint(@"hash_a7dba9fd2c230875", 0)) {
        return function_2cd5adf6cf3179e5();
    }
    return function_3ec57983d173d1e3();
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x151d
// Size: 0x286
function private function_2cd5adf6cf3179e5() {
    var_4d2861d9375d49bc = 5;
    var_92b1717b42bb9cd4 = [30, 60, 90, 145, 180];
    var_d3c5b52b55e39c07 = [500, 1000, 1500, 2000, 2500];
    /#
        assert(var_92b1717b42bb9cd4.size == var_4d2861d9375d49bc && var_d3c5b52b55e39c07.size == var_4d2861d9375d49bc);
    #/
    var_9ccc7137eea64baf = 0.5;
    var_9ca95f37ee7fdc61 = 1;
    var_9178eec664b1667f = 1600;
    var_80055d9eec7074a5 = 200;
    yaw = self.angles[1];
    attempts = 0;
    finalpoint = undefined;
    while (attempts < var_4d2861d9375d49bc) {
        var_53ff1d53d1ec1f07 = angleclamp180(yaw - var_92b1717b42bb9cd4[attempts]);
        rightangle = angleclamp180(yaw + var_92b1717b42bb9cd4[attempts]);
        anglediff = anglesdelta((0, var_53ff1d53d1ec1f07, 0), (0, rightangle, 0));
        theta = var_53ff1d53d1ec1f07 + randomfloat(anglediff);
        radius = var_d3c5b52b55e39c07[attempts] * randomfloatrange(var_9ccc7137eea64baf, var_9ca95f37ee7fdc61);
        offset = radius * (cos(theta), sin(theta), 0);
        desiredpoint = self.origin + offset;
        var_8e438c1bacb25a0a = function_f8350ab882cc2439(desiredpoint);
        randompoints = getrandomnavpoints(var_8e438c1bacb25a0a, var_80055d9eec7074a5, 3, self);
        prevdistsq = -1;
        candidatepoint = undefined;
        foreach (point in randompoints) {
            distsq = lengthsquared(point - var_8e438c1bacb25a0a);
            if (distsq > prevdistsq) {
                candidatepoint = point;
                prevdistsq = distsq;
            }
        }
        /#
            function_35b98ade1d8d308d(desiredpoint, var_8e438c1bacb25a0a, candidatepoint);
        #/
        if (lengthsquared(candidatepoint - self.origin) > var_9178eec664b1667f) {
            finalpoint = candidatepoint;
            break;
        }
        attempts++;
    }
    if (!isdefined(finalpoint)) {
        finalpoint = function_3ec57983d173d1e3();
    }
    return finalpoint;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ab
// Size: 0x238
function function_3ec57983d173d1e3() {
    if (scripts/cp_mp/utility/game_utility::isbrstylegametype()) {
        minx = min(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        maxx = max(level.br_level.br_mapbounds[0][0], level.br_level.br_mapbounds[1][0]);
        miny = min(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        maxy = max(level.br_level.br_mapbounds[1][1], level.br_level.br_mapbounds[0][1]);
        minz = level.br_level.c130_sealeveloverride;
        maxz = level.br_level.c130_heightoverride;
    } else {
        x1 = level.mapcorners[1].origin[0];
        x2 = level.mapcorners[0].origin[0];
        y1 = level.mapcorners[1].origin[1];
        y2 = level.mapcorners[0].origin[1];
        minx = min(x1, x2);
        maxx = max(x1, x2);
        miny = min(y1, y2);
        maxy = max(y1, y2);
        minz = scripts/cp_mp/parachute::getc130sealevel();
        maxz = scripts/cp_mp/parachute::getc130height();
    }
    randompoint = (randomfloatrange(minx, maxx), randomfloatrange(miny, maxy), randomfloatrange(minz, maxz));
    return function_f8350ab882cc2439(randompoint);
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19eb
// Size: 0x34
function private enableparachute(enabled) {
    self skydive_setdeploymentstatus(enabled);
    self skydive_setbasejumpingstatus(enabled);
    if (enabled == 1) {
        self skydive_cutautodeployon();
        return;
    }
    self skydive_cutautodeployoff();
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a26
// Size: 0x87
function private function_eea4061f2af571b4(takescreenshot) {
    /#
        if (takescreenshot && getdvarint(@"hash_824c718cad3c0f17", 1) && isdefined(level.mit.roaming.var_31e45429b9998458)) {
            freezebot(1);
            level waittill("<unknown string>" + level.mit.roaming.var_31e45429b9998458);
            freezebot(0);
        }
    #/
    resetposition();
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ab4
// Size: 0x46
function private freezebot(freeze) {
    self botsetflag("disable_movement", freeze);
    self botsetflag("disable_rotation", freeze);
    if (freeze) {
        self notify("end_custom_stuck");
        self setvelocity((0, 0, 0));
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b01
// Size: 0x6b
function private resetposition() {
    if (getdvarint(@"hash_568a0d6a4a05aea4", 0)) {
        return;
    }
    newpoint = function_3ec57983d173d1e3();
    failedresult = botteleport(newpoint, 50, 100);
    if (isdefined(failedresult)) {
        report("failed_teleport", self, [function_57a85ec4923ff680("newPoint", newpoint)], undefined, undefined, failedresult);
        self setorigin(newpoint);
    }
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b73
// Size: 0xa5
function private detectladder(bot, dist) {
    nodes = getnodesinradius(bot.origin, dist, 0);
    foreach (node in nodes) {
        if (isdefined(node.animscript) && issubstr(node.animscript, "ladder")) {
            return "ladder";
        }
    }
    return undefined;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c20
// Size: 0x116
function private detectdoor(bot, dist) {
    traceresult = navtrace(bot.origin, anglestoforward(bot.angles) * dist + bot.origin);
    if (istrue(traceresult)) {
        doors = getentitylessscriptablearray(undefined, undefined, bot.origin, dist, "door");
        foreach (door in doors) {
            includedangle = anglesdelta(door.angles, bot.angles);
            var_c32162f8d2bf2d4d = includedangle < 100 && includedangle > 80;
            if (var_c32162f8d2bf2d4d) {
                return ter_op(door scriptabledoorisclosed(), "closed_door", "opened_door");
            }
        }
    }
    return undefined;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d3e
// Size: 0x3f
function private function_57a85ec4923ff680(description, origin) {
    pos = spawnstruct();
    pos.posdescription = description;
    pos.origin = origin;
    return pos;
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1d85
// Size: 0xfa
function private function_35b98ade1d8d308d(desiredpoint, var_8e438c1bacb25a0a, candidatepoint) {
    /#
        drawoption = getdvarint(@"hash_e58e30094d98d46e", 0);
        if (drawoption <= 0) {
            return;
        }
        if (drawoption > 1 && getdvarint(@"hash_72c1d25dd9519ff0", 0) != self getentitynumber()) {
            return;
        }
        var_22b471bd4bfb2324 = 200;
        yellow = (1, 1, 0);
        red = (1, 0, 0);
        green = (0, 1, 0);
        sphere(desiredpoint, 10, yellow, 0, var_22b471bd4bfb2324);
        sphere(var_8e438c1bacb25a0a, 10, red, 0, var_22b471bd4bfb2324);
        line(desiredpoint, var_8e438c1bacb25a0a, yellow, 1, 0, var_22b471bd4bfb2324);
        sphere(candidatepoint, 10, green, 0, var_22b471bd4bfb2324);
        line(var_8e438c1bacb25a0a, candidatepoint, green, 1, 0, var_22b471bd4bfb2324);
    #/
}

// Namespace namespace_503ce3a6b9903b4d / namespace_4dbcecb8aa6160e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e86
// Size: 0x40
function function_63bde891e2fb515c(stuckpos) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        while (true) {
            sphere(stuckpos, 6, (1, 0, 0), 0, 1);
            waitframe();
        }
    #/
}

