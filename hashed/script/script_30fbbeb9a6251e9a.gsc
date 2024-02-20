// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_6d2e67e0b5564054;

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x6c
function function_c789cc0bd60384c2(start_pos, end_pos, var_88ce468da5ffdfed, var_ce8be7b4cdc21296, var_475db6034144cbf4, var_8330be2d492dad2) {
    self endon("death");
    thread function_377a053e8962309();
    function_dcd66ae47dd9c9fa(start_pos, end_pos, var_88ce468da5ffdfed, var_ce8be7b4cdc21296);
    function_3dee8aebad8a54d0(var_475db6034144cbf4);
    function_45348b6cef309ef2();
    function_aa703fb26bb4f9fe(var_8330be2d492dad2);
    function_fb904ef821445698();
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26a
// Size: 0x184
function function_dcd66ae47dd9c9fa(start_pos, end_pos, var_88ce468da5ffdfed, var_ce8be7b4cdc21296) {
    self allowedstances("stand");
    self.ignoreme = 1;
    self.ignoreall = 1;
    self.scripted_mode = 1;
    self.playing_skit = 1;
    self.do_immediate_ragdoll = 1;
    self function_9f82c74eb1b7caf9(0);
    var_21e35e707d4d8613 = function_53c4c53197386572(var_ce8be7b4cdc21296, 50);
    var_b2c29e3fba2e1d31 = function_53c4c53197386572(var_88ce468da5ffdfed, 1000);
    self asmsetstate(self.asmname, "parachute_freefall");
    self._blackboard.parachutestate = "freefall";
    self setorigin(start_pos, 0);
    if (var_21e35e707d4d8613 == 0) {
        self.landing_spot = end_pos;
    } else {
        startorigin = end_pos + (randomfloatrange(var_21e35e707d4d8613 * -1, var_21e35e707d4d8613), randomfloatrange(var_21e35e707d4d8613 * -1, var_21e35e707d4d8613), 0);
        self.landing_spot = getclosestpointonnavmesh(getgroundposition(startorigin, 64, 15000, 15000));
    }
    dest = self.landing_spot;
    dir = dest - self.origin;
    dir = vectornormalize(dir);
    var_b2c29e3fba2e1d31 = var_b2c29e3fba2e1d31 + randomfloatrange(-200, 200);
    self.skydive_dest = self.landing_spot - dir * var_b2c29e3fba2e1d31;
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5
// Size: 0x148
function function_3dee8aebad8a54d0(var_475db6034144cbf4) {
    self endon("death");
    dest = self.landing_spot;
    dir = dest - self.origin;
    yaw = vectortoyaw(dir);
    self setplayerangles((self.angles[0], yaw, self.angles[2]));
    self.anchor = spawn("script_origin", self.origin);
    self.anchor.angles = (0, self.angles[1], 0);
    self linkto(self.anchor);
    rotatetime = 2;
    dist = distance(self.origin, self.skydive_dest);
    movetime = dist / 1000;
    self.anchor rotateto((0, yaw, 0), rotatetime);
    self.anchor moveto(self.skydive_dest, movetime);
    waittime = movetime;
    waittime = waittime - 2;
    waittime = clamp(waittime, 0, movetime);
    wait(waittime);
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x544
// Size: 0x105
function function_45348b6cef309ef2() {
    chute = spawn("script_model", self gettagorigin("j_spine4"));
    chute.angles = self gettagangles("j_spine4");
    chute setmodel("misc_wm_br_parachute");
    chute linkto(self, "j_spine4", (0, 0, 0), (0, 0, 0));
    self.chute = chute;
    self.chute thread function_a0c4f5545fcc37e4(self);
    self.chute scriptmodelplayanim("sdr_com_parachute_pullcord");
    self playsound("exgm_parachute_open_npc");
    self playloopsound("exgm_parachute_falling_npc");
    self._blackboard.parachutestate = "parachuting";
    self asmsetstate(self.asmname, "parachute_deploy");
    self endon("death");
    wait(1.7);
    self asmfireevent(self.asmname, "finish");
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650
// Size: 0xf5
function function_aa703fb26bb4f9fe(var_8330be2d492dad2) {
    self endon("death");
    move_time = function_53c4c53197386572(var_8330be2d492dad2, 5);
    move_time = move_time + randomfloatrange(-1, 1);
    var_fecc6e7f3326e7ca = int(min(3, move_time * 0.5));
    var_59509577645de971 = int(max(1, move_time - var_fecc6e7f3326e7ca - 1));
    self.anchor moveto(self.landing_spot, move_time, 0, var_fecc6e7f3326e7ca);
    wait(move_time - 1.5);
    self notify("parachute_prepare_to_land");
    self._blackboard.parachutestate = "landing";
    self.chute scriptmodelplayanim("sdr_com_parachute_prepare_for_landing");
    self playsound("exgm_parachute_detach_npc");
    thread function_775ca9e4c54166aa();
    wait(3);
    self.chute delete();
    self notify("parachute_detached");
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74c
// Size: 0x15
function function_775ca9e4c54166aa() {
    wait(0.5);
    self stoploopsound("exgm_parachute_falling_npc");
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x768
// Size: 0x24
function function_316b7ce518c834d3() {
    self endon("death");
    wait(1.5);
    self.chute scriptmodelplayanim("sdr_com_parachute_idle");
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793
// Size: 0x102
function function_fb904ef821445698() {
    self endon("death");
    self.anchor.origin = self.landing_spot;
    self setplayerangles((0, self.anchor.angles[1], 0));
    self unlink();
    self setplayerangles((0, self.anchor.angles[1], 0));
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
    self allowedstances("prone", "stand", "crouch");
    self.playing_skit = undefined;
    self.ignoreall = 0;
    self.ignoreme = 0;
    self.scripted_mode = 0;
    self.combatmode = "cover";
    self.script_combatmode = "cover";
    self function_9f82c74eb1b7caf9(1);
    self notify("delete_chute");
    wait(1);
    self.do_immediate_ragdoll = undefined;
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89c
// Size: 0x2e
function function_377a053e8962309() {
    self endon("parachute_detached");
    self waittill("death");
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
}

// Namespace namespace_6d2e67e0b5564054/namespace_30bebe2c8fdd4f94
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d1
// Size: 0x3e
function function_a0c4f5545fcc37e4(ai) {
    self endon("death");
    ai endon("parachute_detached");
    ai waittill("death");
    self unlink();
    self movez(100, 2);
    wait(2);
    self delete();
}

