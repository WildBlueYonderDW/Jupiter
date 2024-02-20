// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace group;

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x4
function function_4e29112ac7171ec8() {
    return 0;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28b
// Size: 0xc0
function initgroup(groupname) {
    if (!isdefined(level.stealth.groupdata)) {
        level.stealth.groupdata = spawnstruct();
    }
    groupdata = level.stealth.groupdata;
    if (!isdefined(groupdata.groups)) {
        groupdata.groups = [];
    }
    var_5c38c36e9f129b3e = groupdata.groups[groupname];
    if (!isdefined(var_5c38c36e9f129b3e)) {
        var_5c38c36e9f129b3e = function_ff39fd6d3d8e4d65(groupname);
        groupdata.groups[groupname] = var_5c38c36e9f129b3e;
    }
    level.stealth.groupdata notify(groupname);
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352
// Size: 0xb6
function addtogroup(groupname, guy) {
    if (!isdefined(level.stealth.groupdata) || !isdefined(level.stealth.groupdata.groups) || !isdefined(level.stealth.groupdata.groups[groupname])) {
        initgroup(groupname);
    }
    var_5c38c36e9f129b3e = level.stealth.groupdata.groups[groupname];
    function_c30acbb55783d011(groupname, guy);
    var_5c38c36e9f129b3e thread group_waitfordeath(guy);
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f
// Size: 0x3a
function group_waitfordeath(guy) {
    guy waittill("death");
    guy thread namespace_6db9b2dcda758664::death_cleanup();
    if (isdefined(guy)) {
        group_removefrompod(guy);
        function_bf304efe09a7ceeb(self.name, guy);
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450
// Size: 0x124
function clearallgroups() {
    if (!isdefined(level.stealth.groupdata)) {
        return;
    }
    if (!isdefined(level.stealth.groupdata.groups)) {
        return;
    }
    /#
        foreach (group in level.stealth.groupdata.groups) {
            if (isdefined(group.pods)) {
                foreach (pod in group.pods) {
                    pod notify("start_singlespreadout");
                }
            }
        }
    #/
    level.stealth.groupdata.groups = undefined;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57b
// Size: 0x82
function getgroup(groupname) {
    /#
        assert(isdefined(level.stealth));
    #/
    /#
        assert(isdefined(level.stealth.groupdata));
    #/
    /#
        assert(isdefined(level.stealth.groupdata.groups));
    #/
    return level.stealth.groupdata.groups[groupname];
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x605
// Size: 0x3d
function makenewpod(groupname, state, origin) {
    var_6c53c959d5828324 = function_8858434f2625bf7(groupname, state, origin);
    var_6c53c959d5828324.var_ba700a27db96934b = groupname;
    return var_6c53c959d5828324;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64a
// Size: 0x26
function addtopod(pod, guy) {
    function_8107c79679a9f8e1(pod.id, guy);
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x677
// Size: 0x7b
function group_trytojoinexistingpod(var_454dadde3d9b791, var_aa6726f343a56725, guy, var_2afc91629de00a1a) {
    if (isdefined(var_454dadde3d9b791)) {
        var_ab308d685d86fc64 = var_454dadde3d9b791.id;
    } else {
        var_ab308d685d86fc64 = undefined;
    }
    var_cd514bf5922b5a83 = function_4af71893064929f8(var_aa6726f343a56725, var_2afc91629de00a1a, guy.script_stealthgroup, var_ab308d685d86fc64);
    if (isdefined(var_cd514bf5922b5a83)) {
        group_removefrompod(guy);
        addtopod(var_cd514bf5922b5a83, guy);
        return var_cd514bf5922b5a83;
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f9
// Size: 0x118
function group_assigntoinvestigatepod(guy, var_2afc91629de00a1a) {
    var_cd514bf5922b5a83 = group_trytojoinexistingpod(undefined, 1, guy, var_2afc91629de00a1a);
    if (isdefined(var_cd514bf5922b5a83)) {
        if (!isdefined(var_cd514bf5922b5a83.investigateoriginguy)) {
            var_cd514bf5922b5a83 pod_updateinvestigateorigin(guy, var_2afc91629de00a1a);
        }
        return 0;
    }
    group_removefrompod(guy);
    var_6c53c959d5828324 = makenewpod(guy.script_stealthgroup, 1, var_2afc91629de00a1a);
    addtopod(var_6c53c959d5828324, guy);
    var_6c53c959d5828324.investigateoriginguy = guy;
    vol = level.stealth.investigate_volumes[self.script_stealthgroup];
    if (isdefined(vol)) {
        var_6c53c959d5828324.volume = vol;
        var_6c53c959d5828324.borigininvolume = ispointinvolume(var_2afc91629de00a1a, vol);
    }
    if (!isdefined(self.script_stealthgroup)) {
        var_6c53c959d5828324.var_edca2d230a0013aa = function_25040278e58d8da3("investigate", self.origin);
    }
    /#
        thread function_ddab1aa517333fa0(var_6c53c959d5828324);
    #/
    level thread function_92f7df07df367143(guy);
    return 1;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x819
// Size: 0x94
function group_removefrompod(guy) {
    pod = function_bc5df124338cefea(guy);
    if (!isdefined(pod)) {
        return;
    }
    function_6daa1ca6fed22cf3(pod.id, guy);
    if (isdefined(pod.var_8c189ffa521c9391) && isdefined(guy) && isdefined(pod.var_8c189ffa521c9391[guy getentitynumber()])) {
        guy notify("pod_job_abort");
        pod.var_8c189ffa521c9391[guy getentitynumber()] = undefined;
    }
    if (pod.members.size == 0) {
        pod pod_delete();
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b4
// Size: 0x97
function drawcross(origin) {
    /#
        r = 6;
        forward = (r, 0, 0);
        left = (0, r, 0);
        up = (0, 0, r);
        color = (0, 1, 0);
        line(origin - forward, origin + forward, color, 1, 0, 1);
        line(origin - left, origin + left, color, 1, 0, 1);
        line(origin - up, origin + up, color, 1, 0, 1);
    #/
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x952
// Size: 0x267
function function_ddab1aa517333fa0(pod) {
    /#
        pod endon("<unknown string>");
        up = (0, 0, 128);
        down = (0, 0, -12);
        while (1) {
            if (namespace_91707ccc3e1bf8ff::debug_enabled()) {
                line(pod.origin, pod.origin + up, (0, 0, 1), 1, 0, 1);
                groupname = pod.var_ba700a27db96934b;
                if (isdefined(groupname)) {
                    print3d(pod.origin, groupname, (1, 1, 0), 1, 0.8, 1);
                }
                var_a79dc0fc4646993 = "<unknown string>";
                foreach (member in pod.members) {
                    if (isalive(member)) {
                        var_a79dc0fc4646993 = var_a79dc0fc4646993 + "<unknown string>" + member getentitynumber();
                    }
                }
                if (pod.state == 1) {
                    print3d(pod.origin + down, "<unknown string>" + var_a79dc0fc4646993, (1, 1, 0), 1, 0.4, 1);
                } else if (pod.state == 2) {
                    print3d(pod.origin + down, "<unknown string>" + var_a79dc0fc4646993, (1, 1, 0), 1, 0.4, 1);
                }
                var_7a3a94cac8ee2d62 = pod.members.size;
                var_c80dc34ac2989635 = 360 / var_7a3a94cac8ee2d62;
                for (var_1cd5b17b24f2d4ba = 0; var_1cd5b17b24f2d4ba < var_7a3a94cac8ee2d62 + 1; var_1cd5b17b24f2d4ba++) {
                    angle = var_1cd5b17b24f2d4ba * var_c80dc34ac2989635;
                    line(pod.origin, pod.origin + 128 * (cos(angle - var_c80dc34ac2989635), sin(angle - var_c80dc34ac2989635), 0), (0, 1, 0), 1, 0, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc0
// Size: 0x223
function group_findsomeotherguytoinvestigate(pos, var_32a96bf508fbd2f) {
    var_7e6c997a4d1908fc = 2304;
    var_cc2828da32453f24 = undefined;
    closestdistsq = 2359296;
    var_adfa0c3861a668c6 = [];
    foreach (group in level.stealth.groupdata.groups) {
        if (group.name == var_32a96bf508fbd2f) {
            continue;
        }
        volume = level.stealth.investigate_volumes[group.name];
        if (isdefined(volume) && !ispointinvolume(pos, volume)) {
            continue;
        }
        foreach (pod in group.pods) {
            if (pod.state == 1 && distance2dsquared(pod.origin, pos) < var_7e6c997a4d1908fc) {
                return undefined;
            }
        }
        foreach (guy in group.members) {
            if ([[ self.fnisinstealthidle ]]()) {
                distsq = distancesquared(guy.origin, pos);
                if (distsq < closestdistsq) {
                    var_adfa0c3861a668c6[var_adfa0c3861a668c6.size] = guy;
                    if (var_adfa0c3861a668c6.size > 8) {
                        break;
                    }
                }
            }
        }
    }
    if (var_adfa0c3861a668c6.size > 0) {
        var_cc2828da32453f24 = findclosestpointbyapproxpathdist(var_adfa0c3861a668c6, pos);
    }
    return var_cc2828da32453f24;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdeb
// Size: 0xc3
function group_checkrequestbackupoutsideofvolume(e) {
    volume = level.stealth.investigate_volumes[self.script_stealthgroup];
    if (isdefined(volume)) {
        if (!ispointinvolume(e.investigate_pos, volume)) {
            var_cc2828da32453f24 = group_findsomeotherguytoinvestigate(e.investigate_pos, self.script_stealthgroup);
            if (isdefined(var_cc2828da32453f24)) {
                /#
                    namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(self, "<unknown string>");
                #/
                /#
                    namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(self, "<unknown string>");
                #/
                /#
                    namespace_91707ccc3e1bf8ff::function_ec780a18fdfb4982(var_cc2828da32453f24, "<unknown string>");
                #/
                var_cc2828da32453f24 aieventlistenerevent("seek_backup", self, e.investigate_pos);
                return 1;
            }
        }
    }
    return 0;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb6
// Size: 0x3f
function group_eventinvestigate(guy, e) {
    var_d24e406e7deefabc = group_assigntoinvestigatepod(guy, e.investigate_pos);
    if (var_d24e406e7deefabc) {
        guy thread group_investigate_seekbackup(e);
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc
// Size: 0xfe
function group_investigate_seekbackup(e) {
    self endon("death");
    self endon("start_context_melee");
    self endon("scripted_melee_start");
    waitframe();
    group_checkrequestbackupoutsideofvolume(e);
    if (!isdefined(self.script_stealthgroup)) {
        return;
    }
    waitframe();
    group = getgroup(self.script_stealthgroup);
    pod = group_findpod(group, self);
    if (!isdefined(pod)) {
        return;
    }
    if (pod.members.size == 1) {
        nummembers = group.members.size;
        for (var_206bd3daca6681fa = 0; var_206bd3daca6681fa < nummembers; var_206bd3daca6681fa++) {
            var_cc2828da32453f24 = group.members[var_206bd3daca6681fa];
            if (var_cc2828da32453f24.var_fe5ebefa740c7106 == 0 && distancesquared(var_cc2828da32453f24.origin, self.origin) < 10000) {
                var_cc2828da32453f24 glanceatentity(self);
            }
        }
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1001
// Size: 0xae
function group_findpod(groupdata, guy) {
    if (!isdefined(groupdata.pods)) {
        return;
    }
    var_223c150c67b7bc3f = groupdata.pods.size;
    for (var_b58b3bb6eeae68d3 = 0; var_b58b3bb6eeae68d3 < var_223c150c67b7bc3f; var_b58b3bb6eeae68d3++) {
        pod = groupdata.pods[var_b58b3bb6eeae68d3];
        nummembers = pod.members.size;
        for (var_206bd3daca6681fa = 0; var_206bd3daca6681fa < nummembers; var_206bd3daca6681fa++) {
            if (pod.members[var_206bd3daca6681fa] == guy) {
                return pod;
            }
        }
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10b6
// Size: 0x6e
function group_eventcoverblown(groupname, guy, e) {
    if (isdefined(groupname)) {
        groupdata = getgroup(groupname);
    } else {
        groupdata = undefined;
    }
    groupdata thread group_delayedcoverblownpropagation(guy);
    var_d24e406e7deefabc = group_assigntoinvestigatepod(guy, e.investigate_pos);
    if (var_d24e406e7deefabc) {
        thread group_coverblown_seekbackup(groupdata, e);
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112b
// Size: 0x29
function group_delayedcoverblownpropagation(guy) {
    wait(2);
    if (isdefined(guy) && isalive(guy)) {
        self.bcoverhasbeenblown = 1;
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115b
// Size: 0x174
function group_coverblown_seekbackup(groupdata, e) {
    self endon("death");
    self endon("start_context_melee");
    self endon("scripted_melee_start");
    waitframe();
    pod = function_bc5df124338cefea(self);
    if (!isdefined(pod)) {
        return;
    }
    if (isdefined(groupdata) && pod.members.size == 1) {
        nummembers = groupdata.members.size;
        for (var_206bd3daca6681fa = 0; var_206bd3daca6681fa < nummembers; var_206bd3daca6681fa++) {
            var_cc2828da32453f24 = groupdata.members[var_206bd3daca6681fa];
            if (var_cc2828da32453f24 != self && var_cc2828da32453f24.var_fe5ebefa740c7106 == 0 && distancesquared(var_cc2828da32453f24.origin, self.origin) < 10000) {
                var_cc2828da32453f24 glanceatentity(self);
            }
        }
    }
    if (group_checkrequestbackupoutsideofvolume(e)) {
        return;
    }
    if (isdefined(groupdata) && groupdata.members.size > 1) {
        pod = function_bc5df124338cefea(self);
        if (isdefined(pod) && pod.state == 1 && pod.members.size == 1 && (!isdefined(pod.volume) || pod.borigininvolume)) {
            thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "announce2", "seek_backup", 2, undefined, 1);
        }
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d6
// Size: 0x41
function pod_updateinvestigateorigin(guy, pos) {
    self.origin = pos;
    self.investigateoriginguy = guy;
    self.needsupdate = array_add(self.needsupdate, guy);
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x131e
// Size: 0x14
function group_updatepodhuntorigin(guy, var_f31054cb5cab2166) {
    
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1339
// Size: 0x32
function pod_hunt_update(squadid) {
    pod = spawnstruct();
    pod.squadid = squadid;
    pod thread function_9919694707b210df();
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1372
// Size: 0xb8
function function_561073db8e56e510(guy) {
    var_f68d091e4829568a = 48;
    var_fdc0268bd71773d8 = 5000;
    if (!isdefined(guy) || !isalive(guy)) {
        return 0;
    }
    if (isdefined(self.var_8c189ffa521c9391[guy getentitynumber()])) {
        return 0;
    }
    if (isdefined(guy.pathgoalpos) && guy pathdisttogoal(1) < var_f68d091e4829568a) {
        return 0;
    }
    if (guy namespace_28edc79fcf2fe234::bb_playsmartobjectrequested()) {
        return 0;
    }
    if (isdefined(guy.stealth.var_3fcbec5af762e2) && gettime() - guy.stealth.var_3fcbec5af762e2 < var_fdc0268bd71773d8) {
        return 0;
    }
    return 1;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1432
// Size: 0x3c5
function function_9919694707b210df() {
    var_3c1365bacf30636 = 262144;
    if (!isdefined(self.var_8c189ffa521c9391)) {
        self.var_8c189ffa521c9391 = [];
    }
    var_36d5ac8294f54f45 = 0;
    while (1) {
        if (!isdefined(self.squadid)) {
            return;
        }
        members = function_b9e807f454d30fe4(self.squadid);
        if (!isdefined(members) || members.size == 0) {
            return;
        }
        for (i = 0; i < members.size; i++) {
            guy = members[i];
            if (is_dead_or_dying(guy) || !function_561073db8e56e510(guy)) {
                continue;
            }
            entnum = guy getentitynumber();
            var_30fc4f3e175e52cb = guy.lookaheaddir;
            for (j = i + 1; j < members.size; j++) {
                var_cc2828da32453f24 = members[j];
                if (!isdefined(var_cc2828da32453f24) || !isalive(var_cc2828da32453f24)) {
                    continue;
                }
                if (is_dead_or_dying(var_cc2828da32453f24)) {
                    continue;
                }
                var_643cf7b28c35d12e = var_cc2828da32453f24 getentitynumber();
                if (distancesquared(guy.origin, var_cc2828da32453f24.origin) < var_3c1365bacf30636) {
                    if (!function_561073db8e56e510(var_cc2828da32453f24)) {
                        continue;
                    }
                    var_483427e5f1c2060b = var_cc2828da32453f24.lookaheaddir;
                    var_21704ffa3438468f = vectornormalize(var_cc2828da32453f24.origin - guy.origin);
                    if (vectordot(var_30fc4f3e175e52cb, var_21704ffa3438468f) < 0 && vectordot(var_30fc4f3e175e52cb, var_483427e5f1c2060b) < 0) {
                        continue;
                    }
                    var_dbd6700fa110570e = guy.origin;
                    var_397b216df790894e = var_cc2828da32453f24.origin;
                    midpoint = (var_dbd6700fa110570e + var_397b216df790894e) / 2;
                    var_cffc7c7f4795b067 = vectornormalize(midpoint - guy.origin);
                    var_2b410386a2207da7 = vectornormalize(midpoint - var_cc2828da32453f24.origin);
                    if (vectordot(var_cffc7c7f4795b067, var_30fc4f3e175e52cb) < 0.5) {
                        continue;
                    }
                    if (vectordot(var_2b410386a2207da7, var_483427e5f1c2060b) < 0.5) {
                        continue;
                    }
                    if (guy hastacvis(var_cc2828da32453f24) || var_cc2828da32453f24 hastacvis(guy)) {
                        midpoint = guy getclosestreachablepointonnavmesh(midpoint);
                        var_dbd6700fa110570e = guy getclosestreachablepointonnavmesh(midpoint + 30 * vectornormalize(var_dbd6700fa110570e - midpoint));
                        var_397b216df790894e = var_cc2828da32453f24 getclosestreachablepointonnavmesh(midpoint + 30 * vectornormalize(var_397b216df790894e - midpoint));
                        var_2924e404150ff758 = spawnstruct();
                        var_2924e404150ff758.guys = [];
                        var_2924e404150ff758.guys[var_2924e404150ff758.guys.size] = guy;
                        var_2924e404150ff758.guys[var_2924e404150ff758.guys.size] = var_cc2828da32453f24;
                        var_2924e404150ff758.var_10098495a8e7e9e7 = [];
                        var_2924e404150ff758.var_10098495a8e7e9e7[entnum] = var_dbd6700fa110570e;
                        var_2924e404150ff758.var_10098495a8e7e9e7[var_643cf7b28c35d12e] = var_397b216df790894e;
                        var_2924e404150ff758.state[entnum] = "init";
                        var_2924e404150ff758.state[var_643cf7b28c35d12e] = "init";
                        var_2924e404150ff758.leader = guy;
                        var_2924e404150ff758.requesttime = gettime();
                        var_2924e404150ff758.id = var_36d5ac8294f54f45;
                        self.var_8c189ffa521c9391[var_643cf7b28c35d12e] = var_2924e404150ff758;
                        self.var_8c189ffa521c9391[entnum] = var_2924e404150ff758;
                        childthread function_67386b112e199533(var_2924e404150ff758);
                        var_36d5ac8294f54f45++;
                        wait(5);
                        continue;
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fe
// Size: 0x33
function function_87601e94f761af22(var_2924e404150ff758) {
    self endon("pod_job_complete");
    self waittill("pod_job_abort");
    var_2924e404150ff758.state[self getentitynumber()] = "done";
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1838
// Size: 0x38d
function function_67386b112e199533(var_2924e404150ff758) {
    status = "wait_for_arrival";
    var_bd628a3cc63eb86d = var_2924e404150ff758.guys[0] getentitynumber();
    var_bd62873cc63eb1d4 = var_2924e404150ff758.guys[1] getentitynumber();
    leader = var_2924e404150ff758.leader;
    if (var_2924e404150ff758.leader == var_2924e404150ff758.guys[0]) {
        follower = var_2924e404150ff758.guys[1];
    } else {
        follower = var_2924e404150ff758.guys[0];
    }
    leader endon("death");
    follower endon("death");
    leader.gunposeoverride_internal = "gun_down";
    follower.gunposeoverride_internal = "gun_down";
    leader function_1c339daaba3f71db(1);
    follower function_1c339daaba3f71db(1);
    leader childthread function_87601e94f761af22(var_2924e404150ff758);
    follower childthread function_87601e94f761af22(var_2924e404150ff758);
    leader endon("pod_job_abort");
    follower endon("pod_job_abort");
    var_c1a82ba971c52f69 = "";
    var_c1a828a971c528d0 = "";
    leader delaycall(randomfloatrange(0.2, 1), &setlookatentity, follower, 0);
    follower delaycall(randomfloatrange(0.2, 1), &setlookatentity, leader, 0);
    while (1) {
        if (!isdefined(var_2924e404150ff758.guys[0]) || !isalive(var_2924e404150ff758.guys[0])) {
            break;
        }
        if (!isdefined(var_2924e404150ff758.guys[1]) || !isalive(var_2924e404150ff758.guys[1])) {
            break;
        }
        guy1 = var_2924e404150ff758.guys[0];
        guy2 = var_2924e404150ff758.guys[1];
        if (status == "wait_for_arrival") {
            if (var_c1a82ba971c52f69 != "arrived" && !isdefined(guy1.pathgoalpos)) {
                var_c1a82ba971c52f69 = "arrived";
                var_2924e404150ff758.state[var_bd628a3cc63eb86d] = "wait";
            }
            if (var_c1a828a971c528d0 != "arrived" && !isdefined(guy2.pathgoalpos)) {
                var_c1a828a971c528d0 = "arrived";
                var_2924e404150ff758.state[var_bd62873cc63eb1d4] = "wait";
            }
            if (var_c1a82ba971c52f69 == "arrived" && var_c1a828a971c528d0 == "arrived") {
                status = "gesture";
            }
        }
        if (status == "gesture") {
            var_2924e404150ff758.state[leader getentitynumber()] = "gesture";
            leader function_c5bfef99b23e74be("hunt_gesture");
            if (!isdefined(leader) || !isalive(leader)) {
                break;
            }
            var_2924e404150ff758.state[leader getentitynumber()] = "wait";
            var_2924e404150ff758.state[follower getentitynumber()] = "gesture";
            follower function_c5bfef99b23e74be("hunt_gesture");
            if (!isdefined(follower) || !isalive(follower)) {
                break;
            }
            var_2924e404150ff758.state[follower getentitynumber()] = "wait";
            status = "complete";
        }
        if (status == "complete") {
            var_2924e404150ff758.state[var_bd628a3cc63eb86d] = "done";
            var_2924e404150ff758.state[var_bd62873cc63eb1d4] = "done";
            break;
        }
        waitframe();
    }
    leader notify("pod_job_complete");
    follower notify("pod_job_complete");
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x5a
function function_c5bfef99b23e74be(flag) {
    self endon("death");
    self endon("smartobject_logic_finished");
    self endon("hunt_gesture_timeout");
    childthread function_1e36bd48fc41811e(10);
    while (1) {
        status = self waittill(flag);
        if (status == "gesture_finish" || status == "gesture_cancel") {
            break;
        }
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2d
// Size: 0x16
function function_1e36bd48fc41811e(t) {
    wait(t);
    self notify("hunt_gesture_timeout");
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4a
// Size: 0x2a
function function_75087b386454d072(guy) {
    if (!isdefined(self.var_8c189ffa521c9391)) {
        return;
    }
    return self.var_8c189ffa521c9391[guy getentitynumber()];
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7c
// Size: 0x2a
function function_b121dde73e7da661(guy) {
    if (!isdefined(self.var_8c189ffa521c9391)) {
        return;
    }
    self.var_8c189ffa521c9391[guy getentitynumber()] = undefined;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cad
// Size: 0x396
function function_92f7df07df367143(guy) {
    level notify("stop investigate start vo");
    level endon("stop investigate start vo");
    if (!isdefined(guy.script_stealthgroup)) {
        return;
    }
    groupdata = getgroup(guy.script_stealthgroup);
    if (!isdefined(groupdata)) {
        return;
    }
    groupdata.var_a67f19dde4bb4421 = 1;
    wait(0.1);
    if (groupdata.pods.size == 0) {
        return;
    }
    var_804640963e89351f = [];
    var_b2f98cc1c4ec5171 = [];
    var_9dad3f5a14a525a3 = [];
    var_43545efd7df4555e = groupdata.pods[0];
    for (i = 1; i < groupdata.pods.size; i++) {
        if (var_43545efd7df4555e.members.size < groupdata.pods[i].members.size) {
            var_43545efd7df4555e = groupdata.pods[i];
        }
    }
    if (utility::issp()) {
        speaker = getclosest(level.player.origin, var_43545efd7df4555e.members);
    } else {
        speaker = random(var_43545efd7df4555e.members);
    }
    if (!isdefined(speaker) || !isdefined(speaker.battlechatter)) {
        return;
    }
    var_b2f98cc1c4ec5171 = var_43545efd7df4555e.members;
    foreach (pod in groupdata.pods) {
        if (pod != var_43545efd7df4555e) {
            var_9dad3f5a14a525a3 = array_combine(var_9dad3f5a14a525a3, pod.members);
        }
    }
    var_804640963e89351f = array_remove_array(groupdata.members, array_combine(var_b2f98cc1c4ec5171, var_9dad3f5a14a525a3));
    var_804640963e89351f = array_remove(var_804640963e89351f, speaker);
    if (var_9dad3f5a14a525a3.size == 0 && var_b2f98cc1c4ec5171.size == 0 && var_804640963e89351f.size == 0) {
        groupdata.var_a67f19dde4bb4421 = 0;
        return;
    }
    if (!isdefined(speaker) || !isdefined(speaker.battlechatter)) {
        return;
    }
    speaker.battlechatter.var_c9011e302f0673bc = spawnstruct();
    speaker.battlechatter.var_c9011e302f0673bc.var_804640963e89351f = var_804640963e89351f;
    speaker.battlechatter.var_c9011e302f0673bc.var_b2f98cc1c4ec5171 = var_b2f98cc1c4ec5171;
    speaker.battlechatter.var_c9011e302f0673bc.var_9dad3f5a14a525a3 = var_9dad3f5a14a525a3;
    speaker thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "state_change", "investigate");
    if (var_9dad3f5a14a525a3.size > 0) {
        if (var_b2f98cc1c4ec5171.size > 0) {
            if (var_804640963e89351f.size > 0) {
                speaker thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "investigate", "start_spreadoutwithmestay", undefined, undefined, 1);
            } else {
                speaker thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "investigate", "start_spreadoutwithme", undefined, undefined, 1);
            }
        } else if (var_804640963e89351f.size > 0) {
            speaker thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "investigate", "start_singlespreadoutstay", undefined, undefined, 1);
        } else {
            speaker thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "investigate", "start_singlespreadout", undefined, undefined, 1);
        }
    } else {
        if (var_b2f98cc1c4ec5171.size > 0) {
            goto LOC_00000394;
        }
        if (var_804640963e89351f.size > 0) {
        LOC_00000394:
        }
    LOC_00000394:
    }
LOC_00000394:
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x204a
// Size: 0x81
function function_500fe4721adccab3(array) {
    var_38d1de6d4017e745 = [];
    foreach (guy in array) {
        if (isdefined(guy.bccallsign)) {
            var_38d1de6d4017e745 = array_add(var_38d1de6d4017e745, guy.bccallsign);
        }
    }
    return var_38d1de6d4017e745;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d3
// Size: 0x350
function pod_hunt_vo() {
    if (isdefined(level.bcs_stealthhuntthink)) {
        return;
    }
    level.bcs_stealthhuntthink = 1;
    level.var_cc7fb07b623a0ef5 = function_53c4c53197386572(level.var_cc7fb07b623a0ef5, [0:6, 1:12]);
    first_lost = undefined;
    while (1) {
        hunters = [];
        foreach (group in level.stealth.groupdata.groups) {
            if (!isdefined(group.pods)) {
                continue;
            }
            foreach (pod in group.pods) {
                if (!isdefined(pod.state) || pod.state != 2) {
                    continue;
                }
                foreach (hunter in pod.members) {
                    hunters = array_add(hunters, hunter);
                }
            }
        }
        if (hunters.size < 1) {
            break;
        }
        if (hunters.size > 1) {
            if (utility::issp()) {
                hunters = sortbydistance(hunters, level.player.origin);
            } else {
                hunters = array_randomize(hunters);
            }
            hunters[0].battlechatter.var_220cb768abcad30b = hunters;
            leader = hunters[0];
            hunters = array_remove(hunters, leader);
            wait(randomfloatrange(2, 2.5));
            hunters = array_removedead_or_dying(hunters);
            if (utility::issp()) {
                hunters = sortbydistance(hunters, level.player.origin);
            } else {
                hunters = array_randomize(hunters);
            }
            hunter = undefined;
            switch (hunters.size) {
            case 0:
                break;
            case 1:
            case 2:
            case 3:
                hunter = hunters[randomint(hunters.size)];
                break;
            default:
                hunter = hunters[randomint(3)];
                break;
            }
            if (!isdefined(hunter)) {
                break;
            }
            hunters = array_add(hunters, leader);
            hunter.battlechatter.var_220cb768abcad30b = hunters;
        } else {
            hunter = hunters[0];
            if (!isdefined(first_lost)) {
                goto LOC_00000306;
            }
        LOC_00000306:
        }
    LOC_00000306:
        if (isarray(level.var_cc7fb07b623a0ef5)) {
            wait(randomfloatrange(level.var_cc7fb07b623a0ef5[0], level.var_cc7fb07b623a0ef5[1]));
        } else {
            wait(level.var_cc7fb07b623a0ef5);
        }
    }
    level.bcs_stealthhuntthink = undefined;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x242a
// Size: 0x82
function group_anyoneincombat(groupname) {
    groupdata = getgroup(groupname);
    foreach (pod in groupdata.pods) {
        if (pod.state == 3) {
            return 1;
        }
    }
    return 0;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b4
// Size: 0x82
function function_624f57a99242f017(groupname) {
    groupdata = getgroup(groupname);
    foreach (pod in groupdata.pods) {
        if (pod.state == 1) {
            return 1;
        }
    }
    return 0;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x253e
// Size: 0x3
function groups_combat_checklosttarget() {
    
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2548
// Size: 0xd1
function pod_combat_update_checklosttarget() {
    self endon("state_change");
    wait(level.stealth.var_e012fd4f27172998);
    if (istrue(self.var_dff7984130ece673)) {
        while (self.var_dff7984130ece673) {
            wait(0.5);
        }
        wait(randomfloatrange(0.5, 1));
    }
    if (!pod_haslostenemy() && isdefined(level.stealth.funcs) && isdefined(level.stealth.funcs["call_backup"])) {
        self thread [[ level.stealth.funcs["call_backup"] ]]();
    }
    if (isdefined(level.stealth.bstayincombatoncealerted)) {
        return;
    }
    self.bchecklosttarget = 1;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2620
// Size: 0x28c
function pod_haslostenemy() {
    ctimetolose = 10000;
    var_7c08dd16ffa22ba8 = 15000;
    cstillrighttheredistsq = 50625;
    if (isdefined(level.stealth.var_792e4b9a380ade11)) {
        ctimetolose = level.stealth.var_792e4b9a380ade11;
    }
    if (isdefined(level.stealth.var_94f8771062f2161)) {
        var_7c08dd16ffa22ba8 = level.stealth.var_94f8771062f2161;
    }
    if (isdefined(level.stealth.var_e2e3c78d7dc88605)) {
        cstillrighttheredistsq = level.stealth.var_e2e3c78d7dc88605;
    }
    curtime = gettime();
    var_397afc8bc8ec2d48 = undefined;
    foreach (guy in self.members) {
        if (isdefined(guy.stealth.funcs) && isdefined(guy.stealth.funcs["has_lost_enemy"])) {
            if (!guy [[ guy.stealth.funcs["has_lost_enemy"] ]]()) {
                return 0;
            }
        } else {
            enemy = guy.enemy;
            if (isdefined(enemy) && issentient(enemy) && isalive(enemy)) {
                if (utility::issp() && enemy.team != "allies") {
                    return 0;
                }
                lasttime = guy lastknowntime(enemy);
                if (curtime < lasttime + ctimetolose) {
                    return 0;
                }
                var_fb806200a8e9a011 = guy lastknownpos(enemy);
                if (lasttime > 0 && distancesquared(enemy.origin, var_fb806200a8e9a011) < cstillrighttheredistsq) {
                    return 0;
                }
                if (curtime < lasttime + var_7c08dd16ffa22ba8 && enemy hastacvis(var_fb806200a8e9a011)) {
                    return 0;
                }
                if (istrue(guy.benemyinlowcover)) {
                    return 0;
                }
            } else if (!isdefined(guy.enemy) && guy ent_flag_exist("in_the_dark") && guy ent_flag("in_the_dark") && curtime - guy.lastenemysighttime < ctimetolose) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28b4
// Size: 0x12a
function pod_settohunt(var_d384e7929fbdb26c) {
    var_af71cf8e790a407f = self.members;
    foreach (guy in var_af71cf8e790a407f) {
        var_332044e98950634f = 1;
        if (isdefined(guy.stealth.funcs) && isdefined(guy.stealth.funcs["should_hunt"])) {
            var_332044e98950634f = guy [[ guy.stealth.funcs["should_hunt"] ]]();
        }
        if (!var_332044e98950634f) {
            guy namespace_6db9b2dcda758664::bt_set_stealth_state("idle", undefined);
        } else {
            if (isdefined(var_d384e7929fbdb26c)) {
                guy.var_4b1fa39975a3fd58 = randomint(var_d384e7929fbdb26c);
                guy thread function_b32f74bb1f7e968e(var_d384e7929fbdb26c / 1000);
                if (cointoss()) {
                    guy.var_587d8840dea10869 = 1;
                }
            }
            guy namespace_6db9b2dcda758664::bt_set_stealth_state("hunt", undefined);
        }
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e5
// Size: 0x29
function function_b32f74bb1f7e968e(delaytime) {
    self endon("death");
    wait(delaytime);
    self.var_4b1fa39975a3fd58 = undefined;
    self.var_587d8840dea10869 = undefined;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a15
// Size: 0x68
function pod_settoidle() {
    foreach (guy in self.members) {
        guy aieventlistenerevent("reset", guy, guy.origin);
    }
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a84
// Size: 0x4a
function pod_isleader(guy) {
    pod = function_bc5df124338cefea(guy);
    if (!isdefined(pod)) {
        return 0;
    }
    /#
        assert(pod.members.size > 0);
    #/
    return pod.members[0] == guy;
}

// Namespace group/namespace_e5c9a7258a3d79cb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad6
// Size: 0x2f
function pod_delete() {
    self notify("state_change");
    /#
        assert(self.members.size == 0);
    #/
    function_90814ee949699baa(self.id);
}

