// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\stealth\callbacks.gsc;
#using scripts\stealth\threat_sight.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\asm.gsc;
#using scripts\aitypes\stealth.gsc;
#using scripts\stealth\friendly.gsc;
#using scripts\stealth\neutral.gsc;
#using scripts\stealth\utility.gsc;
#using scripts\stealth\event.gsc;
#using scripts\smartobjects\utility.gsc;
#using scripts\stealth\group.gsc;

#namespace stealth;

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281
// Size: 0x8f
function initstealthfunctions() {
    self.fnsetstealthstate = &namespace_f5226b7f82a415af::function_20bf793de5175709;
    self.fnisinstealthidle = &namespace_f5226b7f82a415af::isidle;
    self.fnisinstealthinvestigate = &namespace_f5226b7f82a415af::isinvestigating;
    self.fnisinstealthhunt = &namespace_f5226b7f82a415af::ishunting;
    self.fnisinstealthcombat = &namespace_f5226b7f82a415af::iscombating;
    self.fnisinstealthidlescriptedanim = &namespace_f5226b7f82a415af::isidlescriptedanim;
    self.fnstealthupdatevisionforlighting = &namespace_f5226b7f82a415af::updatevisionforlighting;
    self.fnstealthisidlecurious = &namespace_f5226b7f82a415af::isidlecurious;
    self.fnclearstealthvolume = &namespace_f5226b7f82a415af::clearstealthvolume;
    self.var_743f5eeb386835f5 = &namespace_f5226b7f82a415af::function_9c4a08f7dcd2796b;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317
// Size: 0x33
function isidlescriptedanim() {
    return isdefined(self.stealth) && self.var_fe5ebefa740c7106 == 0 && self._blackboard.var_6ff150891bb0c47;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352
// Size: 0x1c
function isidle() {
    return isdefined(self.stealth) && self.var_fe5ebefa740c7106 == 0;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0x1d
function isinvestigating() {
    return isdefined(self.stealth) && self.var_fe5ebefa740c7106 == 1;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b
// Size: 0x1d
function ishunting() {
    return isdefined(self.stealth) && self.var_fe5ebefa740c7106 == 2;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x1d
function iscombating() {
    return isdefined(self.stealth) && self.var_fe5ebefa740c7106 == 3;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5
// Size: 0x1c
function stealth_initfriendly(taskid) {
    namespace_d611598f63dea5a7::main();
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x409
// Size: 0x20
function stealth_terminatefriendly(taskid) {
    self.stealth = undefined;
    self.stealth_enabled = 0;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x430
// Size: 0x1c
function stealth_initneutral(taskid) {
    namespace_aa303642163f52a7::main();
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454
// Size: 0x24
function isinlight(var_df000bec2cb34458) {
    if (!isdefined(var_df000bec2cb34458)) {
        return !istrue(level.is_dark);
    }
    return var_df000bec2cb34458 >= 0.5;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x480
// Size: 0x3
function updatevisionforlighting() {
    
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a
// Size: 0x135
function forceflashlightplayercanseeifnecessary() {
    if (isdefined(self.flashlight) && self.flashlight) {
        var_4f9b0be341b4c88d = 0.1;
        foreach (player in level.players) {
            if (isdefined(player.nvg) && isdefined(player.nvg.lightmeter) && player.nvg.lightmeter > var_4f9b0be341b4c88d && isdefined(player.nvg.prevlightmeter) && player.nvg.lightmeter - player.nvg.prevlightmeter > 0.01) {
                if (self aipointinfov(player.origin) && !self cansee(player)) {
                    self cansee(player, 0);
                }
            }
        }
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6
// Size: 0xbf
function function_e75ff8b7f46a7761(taskid) {
    var_cb489a1a37e61b8e = ent_flag_exist("react_to_dynolights") && ent_flag("react_to_dynolights");
    if (var_cb489a1a37e61b8e && !isdefined(self.lightmeter)) {
        namespace_e124d8b75dab4be0::update_light_meter();
        var_cb489a1a37e61b8e = 0;
    }
    updatelightbasedflashlight(self.var_fe5ebefa740c7106, 0.5);
    if (var_cb489a1a37e61b8e) {
        entnum = self getentitynumber();
        frametime = level.frameduration;
        /#
            assert(isdefined(frametime));
        #/
        if (gettime() / frametime % 5 == entnum % 5) {
            namespace_e124d8b75dab4be0::update_light_meter();
        }
    }
    forceflashlightplayercanseeifnecessary();
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68d
// Size: 0x38
function function_fe4155eb92b02f4a() {
    if (!self isinscriptedstate()) {
        if (istrue(self.var_efe2696bf37f54b9)) {
            self.gunposeoverride_internal = "gun_down";
        } else {
            self.gunposeoverride_internal = "ready";
        }
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cc
// Size: 0x222
function updatelightbasedflashlight(state, var_45af66a61bdb7b50) {
    if (self isinscriptedstate()) {
        return;
    }
    if (gettime() == self.starttime) {
        return;
    }
    lightmeter = self.lightmeter;
    /#
        if (getdvarint(@"hash_7cbaa1208f238b77", 0)) {
            lightmeter = 0;
        }
    #/
    if (isdefined(self._blackboard.bflashlight)) {
        var_1a544a7e8d153ea = self._blackboard.bflashlight;
    } else {
        var_1a544a7e8d153ea = 0;
    }
    if (isdefined(self.flashlightoverride)) {
        self._blackboard.bflashlight = self.flashlightoverride;
    } else if (istrue(self.noflashlight)) {
        self._blackboard.bflashlight = 0;
    } else if (isdefined(lightmeter)) {
        var_d962c2ec5a81d7a3 = 0.1;
        if (istrue(self._blackboard.bflashlight)) {
            if (lightmeter > var_45af66a61bdb7b50 + var_d962c2ec5a81d7a3) {
                self._blackboard.bflashlight = 0;
            }
        } else {
            self._blackboard.bflashlight = lightmeter < var_45af66a61bdb7b50;
        }
    } else if (istrue(level.is_dark)) {
        self._blackboard.bflashlight = 1;
    } else {
        self._blackboard.bflashlight = 0;
    }
    if (var_1a544a7e8d153ea != self._blackboard.bflashlight) {
        if (asm_getdemeanor() != "patrol" && (!isdefined(self.var_1bab8712529eb3c2) || !self.var_1bab8712529eb3c2)) {
            /#
                assert(isdefined(self.fnstealthflashlighton) && isdefined(self.fnstealthflashlightoff));
            #/
            if (self._blackboard.bflashlight) {
                self [[ self.fnstealthflashlighton ]]();
            } else {
                self [[ self.fnstealthflashlightoff ]]();
            }
        }
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f5
// Size: 0xc
function isidlecurious() {
    return self.var_d17737f2fb2cea58;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x909
// Size: 0xa1
function idle_init(taskid) {
    self function_ae41fbf799ba43f(1, "bt");
    namespace_92d413b0c411a750::event_escalation_clear();
    if (isdefined(self.stealth.funcs["hidden"])) {
        stealth_call_thread("hidden");
    }
    var_552c4c67a7040d3c = namespace_e124d8b75dab4be0::function_783cf2a7aaab23c();
    if (!var_552c4c67a7040d3c && isdefined(self.target)) {
        self.goalradius = 32;
        if (isdefined(self.fnstealthgotonode)) {
            self thread [[ self.fnstealthgotonode ]](undefined, undefined, undefined, undefined);
        }
    }
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9b2
// Size: 0x50
function idle_terminate(taskid) {
    self notify("stop_going_to_node");
    self function_ae41fbf799ba43f(0, "bt");
    namespace_e124d8b75dab4be0::save_last_goal();
    self.last_set_goalnode = undefined;
    self.last_set_goalent = undefined;
    self.moveplaybackrate = 1;
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0a
// Size: 0x2e
function stealth_shouldinvestigate(taskid) {
    if (self.var_fe5ebefa740c7106 == 1) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa40
// Size: 0xe
function investigate_shouldfacedecentdirectionwhenidle() {
    return !istrue(self.limitstealthturning);
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa56
// Size: 0xb5
function investigate_setreaction(event) {
    var_25a7f9b7f59cc41e = "small";
    if (event.typeorig == "bulletwhizby" || event.typeorig == "grenade danger") {
        var_25a7f9b7f59cc41e = "med";
    } else if (event.typeorig == "footstep_sprint") {
        if (isdefined(event.entity) && isplayer(event.entity) && self function_89931185060d4d6f(event.entity)) {
            var_25a7f9b7f59cc41e = "med";
        }
    }
    namespace_e124d8b75dab4be0::set_patrol_react(event.investigate_pos, var_25a7f9b7f59cc41e);
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb12
// Size: 0x2e
function stealth_shouldhunt(taskid) {
    if (self.var_fe5ebefa740c7106 == 2) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb48
// Size: 0xa
function hunt_clearroomdata() {
    self function_ca38a887735b9b48();
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb59
// Size: 0xe3
function function_6057074fd95d3e65() {
    var_8b8967d098e7c16e = 147456;
    var_7f1a348686b3a9b0 = [];
    var_edca2d230a0013aa = self function_fda3fd9342329f97();
    if (isdefined(var_edca2d230a0013aa)) {
        if (isdefined(anim.var_463c0093dff0f81c) && isdefined(anim.var_463c0093dff0f81c[var_edca2d230a0013aa])) {
            foreach (obj in anim.var_463c0093dff0f81c[var_edca2d230a0013aa]) {
                if (distancesquared(obj.origin, self.origin) > var_8b8967d098e7c16e) {
                    continue;
                }
                if (!namespace_277f7d3daf8f1a98::canclaimsmartobject(obj)) {
                    continue;
                }
                if (!namespace_277f7d3daf8f1a98::canusesmartobject(obj)) {
                    continue;
                }
                var_7f1a348686b3a9b0[var_7f1a348686b3a9b0.size] = obj;
            }
        }
    }
    return var_7f1a348686b3a9b0;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc44
// Size: 0x15
function hunt_updateeveryframe(taskid) {
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc61
// Size: 0x5c
function hunt_custom_init(taskid) {
    namespace_e124d8b75dab4be0::set_patrol_style("cqb");
    if (isdefined(self.stealth.funcs["hunt_custom_init"])) {
        self thread [[ self.stealth.funcs["hunt_custom_init"] ]]();
    }
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcc5
// Size: 0x8f
function hunt_custom_update(taskid) {
    if (!self.var_f843fbbada4e59b2) {
        return anim.failure;
    }
    if (isdefined(self.stealth.funcs["hunt_custom_update"])) {
        var_fd306faba3e6da68 = self [[ self.stealth.funcs["hunt_custom_update"] ]]();
        if (isdefined(var_fd306faba3e6da68)) {
            if (var_fd306faba3e6da68) {
                return anim.running;
            } else {
                return anim.failure;
            }
        }
    }
    return anim.running;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd5c
// Size: 0x50
function hunt_custom_terminate(taskid) {
    if (isdefined(self.stealth.funcs["hunt_custom_terminate"])) {
        self thread [[ self.stealth.funcs["hunt_custom_terminate"] ]]();
    }
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdb4
// Size: 0x33
function hunt_initialdelay_init(taskid) {
    self.bt.instancedata[taskid] = gettime() + randomintrange(500, 1500);
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdee
// Size: 0x57
function hunt_initialdelay(taskid) {
    if (!isdefined(self.var_7dee6dfdb05ecaf9) || isdefined(bb_getcovernode()) || gettime() >= self.bt.instancedata[taskid]) {
        return anim.success;
    }
    return anim.running;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4d
// Size: 0x21
function hunt_initialdelay_terminate(taskid) {
    self.bt.instancedata[taskid] = undefined;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe75
// Size: 0x146
function hunt_cqbtargetupdate(instancedata) {
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    if (isdefined(pod.target)) {
        curtime = gettime();
        if (self cansee(pod.target) || self getthreatsight(pod.target) > 0.1) {
            self.var_abc30858a62a19a = pod.target.origin;
            instancedata.cqbtargettime = curtime;
            return 1;
        } else if (issentient(pod.target) && (isdefined(self.stealth.btargetlastknown) || isdefined(instancedata.cqbtargettime) && curtime - instancedata.cqbtargettime < 2000)) {
            self.var_abc30858a62a19a = self lastknownpos(pod.target);
            return 1;
        }
    }
    facingdir = anglestoforward(self.angles);
    self.var_abc30858a62a19a = self.origin + facingdir * 384;
    return 0;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc3
// Size: 0x15
function hunt_shouldhunker(taskid) {
    return anim.failure;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe0
// Size: 0xf5
function hunt_hunker_init(taskid) {
    curtime = gettime();
    instancedata = spawnstruct();
    instancedata.nextcoverchecktime = curtime + randomintrange(4000, 6000);
    self.bt.instancedata[taskid] = instancedata;
    self.stealth.hunthunkerlastexposetime = curtime;
    namespace_e124d8b75dab4be0::set_patrol_style("cqb");
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    node = self findbestcovernode(undefined, 0, pod.origin);
    if (isdefined(node)) {
        if (!isdefined(self.node) || self.node != node) {
            self.keepclaimednode = 0;
            self.keepclaimednodeifvalid = 0;
            self usecovernode(node);
        }
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10dc
// Size: 0x191
function hunt_hunker(taskid) {
    curtime = gettime();
    if (curtime > self.bt.instancedata[taskid].nextcoverchecktime) {
        pod = function_bc5df124338cefea(self);
        /#
            assert(isdefined(pod));
        #/
        var_dfb6755a19ee191b = randomint(3) < 1;
        node = self findbestcovernode(%"hash_4f49ec32ba3841db", var_dfb6755a19ee191b, pod.origin);
        if (isdefined(node)) {
            var_559f42bcdb572d45 = 0;
            if (!isdefined(self.node) || self.node != node) {
                self.keepclaimednode = 0;
                self.keepclaimednodeifvalid = 0;
                var_559f42bcdb572d45 = !self usecovernode(node);
            }
            if (var_559f42bcdb572d45) {
                self.bt.instancedata[taskid].nextcoverchecktime = curtime + 500;
            } else {
                self.bt.instancedata[taskid].nextcoverchecktime = curtime + randomintrange(4000, 6000);
            }
        } else {
            self.bt.instancedata[taskid].nextcoverchecktime = curtime + randomintrange(2000, 4000);
        }
    }
    namespace_f5226b7f82a415af::hunt_cqbtargetupdate(self.bt.instancedata[taskid]);
    return anim.running;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1275
// Size: 0x21
function hunt_hunker_terminate(taskid) {
    self.bt.instancedata[taskid] = undefined;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x129d
// Size: 0x7f
function hunt_hunker_shouldexpose(taskid) {
    var_129825f5ea14c1e4 = 5000;
    if (!isinlight(self.lightmeter)) {
        var_129825f5ea14c1e4 = 3000;
    }
    /#
        assert(isdefined(self.stealth.hunthunkerlastexposetime));
    #/
    if (gettime() > self.stealth.hunthunkerlastexposetime + var_129825f5ea14c1e4) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1324
// Size: 0xd8
function hunt_hunker_expose_init(taskid) {
    instancedata = spawnstruct();
    instancedata.endtime = gettime() + 4000;
    instancedata.nextpostime = 0;
    instancedata.nextposidx = 0;
    self.bt.instancedata[taskid] = instancedata;
    bb_requestcoverstate("exposed", 0);
    /#
        assert(isdefined(self.node));
    #/
    if (isnodecoverleft(self.node) || isnodecoverright(self.node)) {
        bb_requestcoverexposetype("B");
    } else {
        bb_requestcoverexposetype("exposed");
    }
    self.stealth.btargetlastknown = 1;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1403
// Size: 0x5f
function hunt_hunker_expose(taskid) {
    curtime = gettime();
    instancedata = self.bt.instancedata[taskid];
    if (curtime > instancedata.endtime) {
        return anim.success;
    }
    return anim.running;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x146a
// Size: 0x65
function hunt_hunker_expose_terminate(taskid) {
    self.var_abc30858a62a19a = undefined;
    self.bt.instancedata[taskid] = undefined;
    bb_requestcoverstate("hide", 1);
    self.stealth.btargetlastknown = undefined;
    self.stealth.hunthunkerlastexposetime = gettime();
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14d6
// Size: 0xb7
function hunt_isincover(taskid) {
    if (!isdefined(self.node)) {
        return anim.failure;
    }
    var_6901a79fc03ea862 = 16;
    if (isdefined(self.pathgoalpos)) {
        if (distancesquared(self.pathgoalpos, self.origin) > var_6901a79fc03ea862) {
            return anim.failure;
        }
    } else if (self.keepclaimednodeifvalid) {
        var_6901a79fc03ea862 = 3600;
    } else {
        var_6901a79fc03ea862 = 225;
    }
    if (distance2dsquared(self.node.origin, self.origin) > var_6901a79fc03ea862) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1595
// Size: 0x22
function hunt_active_terminate(taskid) {
    namespace_277f7d3daf8f1a98::clearsmartobject(bb_getrequestedsmartobject());
    self clearbtgoal(3);
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15be
// Size: 0x15
function function_6771d1c0abc4da9c(taskid) {
    return anim.failure;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15db
// Size: 0x113
function function_b647c0d07e4a3078(taskid) {
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    var_2924e404150ff758 = pod namespace_e5c9a7258a3d79cb::function_75087b386454d072(self);
    goalpos = var_2924e404150ff758.var_10098495a8e7e9e7[self getentitynumber()];
    self setbtgoalpos(3, goalpos);
    self setbtgoalradius(3, 24);
    instancedata = spawnstruct();
    instancedata.starttime = gettime();
    instancedata.var_10098495a8e7e9e7 = goalpos;
    self.bt.instancedata[taskid] = instancedata;
    var_cc2828da32453f24 = var_2924e404150ff758.guys[0];
    if (self == var_cc2828da32453f24) {
        var_cc2828da32453f24 = var_2924e404150ff758.guys[1];
    }
    var_5de4575810c72ff0 = vectortoyaw(var_cc2828da32453f24.origin - self.origin);
    self.var_a41edf45bb0ff97 = (0, var_5de4575810c72ff0, 0);
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16f5
// Size: 0xd3
function function_5ba0240304e46139(taskid) {
    if (self.pathpending) {
        return anim.running;
    }
    instancedata = self.bt.instancedata[taskid];
    curtime = gettime();
    if (curtime - instancedata.starttime > 0 && !isdefined(self.pathgoalpos)) {
        if (distancesquared(self.origin, instancedata.var_10098495a8e7e9e7) < 576 && !self.arriving) {
            return anim.success;
            goto LOC_000000aa;
        }
    LOC_000000aa:
    }
LOC_000000aa:
    if (curtime - instancedata.starttime > 15000) {
        return anim.failure;
    }
    return anim.running;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d0
// Size: 0x2b
function function_8f3c5de8d0839565(taskid) {
    self.var_a41edf45bb0ff97 = undefined;
    self.bt.instancedata[taskid] = undefined;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1802
// Size: 0x99
function function_90ed2a34d9f66902(taskid) {
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    var_2924e404150ff758 = pod namespace_e5c9a7258a3d79cb::function_75087b386454d072(self);
    if (!isdefined(var_2924e404150ff758)) {
        return "ReturnSuccess";
    }
    var_bbaa211f594f17ba = var_2924e404150ff758.state[self getentitynumber()];
    if (var_bbaa211f594f17ba == "wait") {
        return "Stealth_Hunt_Coordinate_Wait";
    } else if (var_bbaa211f594f17ba == "gesture") {
        return "Stealth_Hunt_Coordinate_Action";
    } else if (var_bbaa211f594f17ba == "done") {
        return "ReturnSuccess";
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18a2
// Size: 0x13c
function function_7e3b6c64f2c2c6be(taskid) {
    pod = function_bc5df124338cefea(self);
    /#
        assert(isdefined(pod));
    #/
    var_2924e404150ff758 = pod namespace_e5c9a7258a3d79cb::function_75087b386454d072(self);
    var_cc2828da32453f24 = var_2924e404150ff758.guys[0];
    if (self == var_cc2828da32453f24) {
        var_cc2828da32453f24 = var_2924e404150ff758.guys[1];
    }
    if (isdefined(self.var_7b492275ef047be2)) {
        self._blackboard.var_3dbe624a18d61f13 = self.var_7b492275ef047be2;
        var_6c66de307018dfe3 = spawnstruct();
        var_6c66de307018dfe3.origin = self.origin;
        var_6c66de307018dfe3.angles = self.angles;
        var_6c66de307018dfe3.script_smartobject = "hunt_point";
        namespace_277f7d3daf8f1a98::setsmartobject(var_6c66de307018dfe3);
    } else {
        var_6c66de307018dfe3 = spawnstruct();
        var_6c66de307018dfe3.origin = self.origin;
        var_6c66de307018dfe3.angles = self.angles;
        var_6c66de307018dfe3.script_smartobject = "hunt_checkin";
        namespace_277f7d3daf8f1a98::setsmartobject(var_6c66de307018dfe3);
    }
    return anim.success;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19e6
// Size: 0xc
function function_1baa3d287f64fa3(taskid) {
    
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f9
// Size: 0x21
function function_9b6fd81057ede5ce() {
    self.var_587d8840dea10869 = 0;
    self.var_4b1fa39975a3fd58 = undefined;
    self.var_97db6f81ba0702e3 = undefined;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a21
// Size: 0x62
function clearstealthvolume() {
    if (isdefined(level.stealth.combat_volumes[self.script_stealthgroup]) && iscombating() || isdefined(level.stealth.hunt_volumes[self.script_stealthgroup]) && ishunting()) {
        self clearbtgoal(0);
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0xf9
function function_6bdcfa57946930c7(event) {
    /#
        assert(isdefined(event.typeorig));
    #/
    self.stealth.investigateevent = event;
    self.var_bb3bab49c9a764a4 = event.typeorig;
    self.var_cc20708455457566 = event.entity;
    self.var_bf4e91e691d898fc = event.receiver;
    self.var_f97ff24102472069 = event.type;
    self.var_1a15e562b3389b69 = 0;
    if (isdefined(event.position)) {
        self.var_d70f3a3817594dc6 = event.position;
    }
    if (isdefined(event.investigate_pos)) {
        self.var_b446b52dfacc181 = event.investigate_pos;
    }
    if (isdefined(event.look_pos)) {
        self.var_743c0e8cfe4adc6f = event.look_pos;
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b8a
// Size: 0x14f
function function_9c4a08f7dcd2796b() {
    if (!isdefined(self.var_bb3bab49c9a764a4) || !isdefined(self.stealth.investigateevent)) {
        return undefined;
    }
    self.stealth.investigateevent.typeorig = self.var_bb3bab49c9a764a4;
    self.stealth.investigateevent.position = self.var_d70f3a3817594dc6;
    self.stealth.investigateevent.entity = self.var_cc20708455457566;
    self.stealth.investigateevent.receiver = self.var_bf4e91e691d898fc;
    self.stealth.investigateevent.type = self.var_f97ff24102472069;
    self.stealth.investigateevent.investigate_pos = self.var_b446b52dfacc181;
    self.stealth.investigateevent.look_pos = self.var_743c0e8cfe4adc6f;
    return self.stealth.investigateevent;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce1
// Size: 0x20
function function_de475c37aeeaf6c() {
    self.stealth.investigateevent = undefined;
    self.var_bb3bab49c9a764a4 = undefined;
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d08
// Size: 0x234
function function_9499f9e2b35b85c8(event, var_aa6726f343a56725) {
    if (isplayer(self.var_da668f8de95278e9) && !isplayer(event.entity) && event.typeorig != "saw_corpse") {
        return;
    }
    if (isdefined(self.var_f97ff24102472069)) {
        if (self.var_bb3bab49c9a764a4 == "saw_corpse" && (event.typeorig == "found_corpse" || event.typeorig == "saw_corpse") && isdefined(self.var_da668f8de95278e9) && event.entity == self.var_da668f8de95278e9) {
            return;
        }
        var_1b676e77b43546a0 = namespace_92d413b0c411a750::event_severity_compare(self.var_f97ff24102472069, event.type);
        if (var_1b676e77b43546a0 >= 0) {
            self.var_b217b37a4a7c7817 = event.typeorig;
            self.var_da668f8de95278e9 = event.entity;
            function_6bdcfa57946930c7(event);
        }
        curtime = gettime();
        var_ccd49d42c848e0a8 = var_1b676e77b43546a0 > 0 || curtime > self.var_f1d505e3ed5189bb || distancesquared(event.investigate_pos, self.origin) < distancesquared(self.var_b446b52dfacc181, self.origin);
        if (var_ccd49d42c848e0a8) {
            groupdata = namespace_e5c9a7258a3d79cb::getgroup(self.script_stealthgroup);
            pod = namespace_e5c9a7258a3d79cb::group_findpod(groupdata, self);
            var_cd514bf5922b5a83 = namespace_e5c9a7258a3d79cb::group_trytojoinexistingpod(pod, var_aa6726f343a56725, self, event.investigate_pos);
            if (isdefined(var_cd514bf5922b5a83)) {
                pod = var_cd514bf5922b5a83;
            }
            /#
                assert(isdefined(pod));
            #/
            pod namespace_e5c9a7258a3d79cb::pod_updateinvestigateorigin(self, event.investigate_pos);
            thread namespace_e124d8b75dab4be0::addeventplaybcs("stealth", "state_change", "update_investigate", undefined, event);
            if (var_aa6726f343a56725 == 1) {
                self notify("stealth_update_investigate");
            }
            self.var_f1d505e3ed5189bb = curtime;
        }
        self.var_27ebf45f68998ef8 = undefined;
    }
}

// Namespace stealth/namespace_f5226b7f82a415af
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f43
// Size: 0x53
function function_20bf793de5175709(statename, e) {
    if (!flag("stealth_enabled") || !isdefined(self.stealth) || !istrue(self.stealth_enabled)) {
        return;
    }
    if (!isalive(self)) {
        return;
    }
    self setstealthstate(statename, e);
}

