#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\sp\utility;
#using scripts\engine\utility;
#using scripts\sp\hud_util;
#using scripts\sp\spawner;
#using scripts\sp\utility;

#namespace stayahead;

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x846
// Size: 0x2216
function stayahead_thread(followent) {
    self endon("death");
    self endon("stop_stayahead");
    if (!isdefined(self.stayahead)) {
        self.stayahead = spawnstruct();
    }
    if (!ent_flag_exist("stayahead_pause")) {
        ent_flag_init("stayahead_pause");
    }
    thread stayahead_watch_end();
    childthread pause_flag_monitor();
    dir = anglestoforward(self.angles);
    dir_prev = anglestoforward(self.angles);
    lastpos = "";
    prevpos = "";
    goalpos = get_goalpos();
    var_3edc51c8ca0a8407 = [self.origin];
    var_7ccaea7a1fc7de36 = undefined;
    scriptedanim = undefined;
    self.stayahead.lookat_last = gettime();
    self.stayahead.exit_speed = undefined;
    self.stayahead.exit_finish_time = undefined;
    self.stayahead.exit_last_finish_time = undefined;
    self.stayahead.wait_node_radius = 400;
    self.stayahead.dir = anglestoforward(self.angles);
    if (!isdefined(self.stayahead.p1)) {
        self.stayahead.p1 = [];
    }
    while (true) {
        if (isdefined(self.stayahead.team) && !isdefined(self.stayahead.team_thinking)) {
            thread stayahead_team_think();
        }
        var_a1e0771fa720725c = goalpos;
        goalpos = get_goalpos();
        if (var_a1e0771fa720725c[0] != goalpos[0]) {
            var_3edc51c8ca0a8407 = var_a1e0771fa720725c;
        }
        if (isdefined(self.stayahead.turbo)) {
            var_cc3af13504eb08f9 = self.stayahead.turbo;
            var_14be1b3c18af36e = self.stayahead.turbo;
            var_8067d7e2d70301eb = self.stayahead.turbo;
            var_df3e2bb9678ca1e0 = self.stayahead.turbo;
            var_b22f6a0aa883e403 = 0;
            var_b37c9f7963fd038 = 0;
            var_a48079d9b2e6a9d1 = 0;
            var_a6c9ca7fc80223de = 0;
        } else {
            var_cc3af13504eb08f9 = self.stayahead.p1["speed"];
            var_14be1b3c18af36e = self.stayahead.p2["speed"];
            var_8067d7e2d70301eb = self.stayahead.p3["speed"];
            var_df3e2bb9678ca1e0 = self.stayahead.p4["speed"];
            var_b22f6a0aa883e403 = ter_op(isdefined(self.stayahead.p1["variance"]), self.stayahead.p1["variance"], 0.2);
            var_b37c9f7963fd038 = ter_op(isdefined(self.stayahead.p2["variance"]), self.stayahead.p2["variance"], 0.2);
            var_a48079d9b2e6a9d1 = ter_op(isdefined(self.stayahead.p3["variance"]), self.stayahead.p3["variance"], 0.2);
            var_a6c9ca7fc80223de = ter_op(isdefined(self.stayahead.p4["variance"]), self.stayahead.p4["variance"], 0.2);
        }
        var_eb24cd241c8955ba = self.stayahead.p1["distance"];
        var_93c57f222846fe43 = self.stayahead.p2["distance"];
        var_8b8721b280e290 = self.stayahead.p3["distance"];
        var_e326d62cb2e2289 = self.stayahead.p4["distance"];
        var_67b98cac565e94ac = undefined;
        var_a123517d91404d87 = undefined;
        var_758352390ecd5826 = undefined;
        if (isdefined(self.stayahead.pw)) {
            var_67b98cac565e94ac = self.stayahead.pw["distance"];
            var_a123517d91404d87 = self.stayahead.pw["speed"];
            var_758352390ecd5826 = ter_op(isdefined(self.stayahead.pw["buffer"]), self.stayahead.pw["buffer"], 1.5);
            var_758352390ecd5826 *= 20;
        }
        /#
            if (getdvarint(@"hash_3d6aec1e7192648b")) {
                if (self.arriving) {
                    print3d_debug(self.origin + (0, 0, 16), "<dev string:x1c>" + self.arriving, (0.9, 0.9, 0.9), 0.9, 0.3);
                }
                if (istrue(self._blackboard.var_9fbdce5fa10f8964)) {
                    print2d3d_debug(self.origin + (0, 0, 12), "<dev string:x27>" + self._blackboard.var_9fbdce5fa10f8964, (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "<dev string:x3b>", 5);
                }
                thread create_2d_background();
                if (ent_flag("<dev string:x41>")) {
                    level thread create_2d_text("<dev string:x51>", (1, 0, 0), "<dev string:x64>", 0, 1);
                } else {
                    level thread create_2d_text("<dev string:x69>", (0, 1, 1), "<dev string:x64>", 0, 1);
                }
                level thread create_2d_text("<dev string:x70>", (0, 1, 1), "<dev string:x3b>", 0, 1);
                level thread create_2d_text("<dev string:x73>" + get_player_demeanor(), (0, 1, 1), "<dev string:x64>", 1, 1);
                level thread create_2d_text("<dev string:x70>", (0, 1, 1), "<dev string:x64>", 4, 1);
                if (isdefined(self.demeanoroverride)) {
                    level thread create_2d_text("<dev string:x73>" + self.demeanoroverride, (0, 1, 1), "<dev string:x64>", 5, 1);
                }
                if (isdefined(self.goalradius)) {
                    level thread create_2d_text("<dev string:x7e>" + self.goalradius, (0, 1, 1), "<dev string:x64>", 6, 1);
                }
                if (isdefined(level.player.movementstate)) {
                    level thread create_2d_text("<dev string:x8b>" + level.player.movementstate, (0, 1, 1), "<dev string:x64>", 2, 1);
                }
                if (isdefined(level.player.movespeedscale)) {
                    level thread create_2d_text("<dev string:x9c>" + level.player.movespeedscale, (0, 1, 1), "<dev string:x64>", 3, 1);
                }
            }
        #/
        var_5c8527b79f02ec6c = flat_origin(self getposonpath(32));
        var_fbbd821088eebc76 = flat_origin(goalpos[0]);
        var_c64b9437370844d1 = flat_origin(var_3edc51c8ca0a8407[0]);
        origin2d = flat_origin(self.origin);
        if (self isinscriptedstate()) {
            if (isdefined(self.stayahead.exit_speed) && !isdefined(self.stayahead.exit_finish_time)) {
                self.stayahead.exit_finish_time = gettime();
                self.stayahead.exit_last_finish_time = self.stayahead.exit_finish_time;
            } else {
                self.stayahead.exit_speed = undefined;
                self.stayahead.exit_finish_time = undefined;
            }
            print2d3d_debug(self.origin + (0, 0, 30), "dir: SCRIPTED ANIM: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
        } else if (self.arriving || distancesquared(var_fbbd821088eebc76, origin2d) < 1024) {
            if (isdefined(self.stayahead.exit_speed) && !isdefined(self.stayahead.exit_finish_time)) {
                self.stayahead.exit_finish_time = gettime();
                self.stayahead.exit_last_finish_time = self.stayahead.exit_finish_time;
            } else {
                self.stayahead.exit_speed = undefined;
                self.stayahead.exit_finish_time = undefined;
            }
            if (isdefined(self.goalnode) && istrue(self.goalnode.script_useangles)) {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: arriving/close USEANGLES OVERRIDE vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                dir = lerp_plane_vector(dir, anglestoforward(self.goalnode.angles));
            } else if (isdefined(goalpos[1])) {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: arriving/close GOAL vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                var_fbbd821088eebc76 = flat_origin(goalpos[1]);
                dir = lerp_plane_vector(dir, vectornormalize(var_fbbd821088eebc76 - origin2d));
            } else {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: arriving/close FWD vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                dir = lerp_plane_vector(dir, anglestoforward(self.angles));
            }
        } else if (istrue(self._blackboard.var_9fbdce5fa10f8964) || distancesquared(var_c64b9437370844d1, origin2d) < 1024) {
            if (istrue(self._blackboard.var_9fbdce5fa10f8964) && !isdefined(self.stayahead.exit_speed)) {
                self.stayahead.exit_speed = -1;
            }
            if (isdefined(self.using_goto_node)) {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: exiting GOTO vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                var_fbbd821088eebc76 = flat_origin(goalpos[0]);
                dir = lerp_plane_vector(dir, vectornormalize(var_fbbd821088eebc76 - var_c64b9437370844d1));
            } else if (isdefined(goalpos[1])) {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: exiting GOAL vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                var_fbbd821088eebc76 = flat_origin(goalpos[1]);
                dir = lerp_plane_vector(dir, vectornormalize(var_fbbd821088eebc76 - var_c64b9437370844d1));
            } else {
                print2d3d_debug(self.origin + (0, 0, 30), "dir: exiting FWD vector: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
                dir = lerp_plane_vector(dir, anglestoforward(self.angles));
            }
        } else {
            if (isdefined(self.stayahead.exit_speed) && !isdefined(self.stayahead.exit_finish_time)) {
                self.stayahead.exit_finish_time = gettime();
                self.stayahead.exit_last_finish_time = self.stayahead.exit_finish_time;
            } else {
                self.exit_speed = undefined;
                self.exit_finish_time = undefined;
            }
            print2d3d_debug(self.origin + (0, 0, 30), "dir: stopped or moving to new goal: " + gettime(), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 4);
            if (distance(var_5c8527b79f02ec6c, origin2d) < 1) {
                print_debug("STAYAHEAD: segments are colliding! " + gettime());
                dir = lerp_plane_vector(dir, vectornormalize(var_fbbd821088eebc76 - var_5c8527b79f02ec6c));
            } else {
                dir = lerp_plane_vector(dir, vectornormalize(var_5c8527b79f02ec6c - origin2d));
            }
        }
        var_ed1068f77fba5d23 = self.origin + dir * var_93c57f222846fe43;
        var_4fe18ad975c2297a = self.origin + dir * var_8b8721b280e290;
        var_c4ab0d7fde3ac589 = self.origin + dir * var_e326d62cb2e2289;
        var_3400cdbff0926f4e = distance(var_ed1068f77fba5d23, var_4fe18ad975c2297a) * 0.25;
        var_b8b793c95b3a1c2d = distance(var_ed1068f77fba5d23, var_4fe18ad975c2297a) * 0.6;
        var_9150f3b2e4bd88fd = distance(var_ed1068f77fba5d23, var_4fe18ad975c2297a) * 0.25;
        var_80104df680745372 = distance(var_4fe18ad975c2297a, var_c4ab0d7fde3ac589) * 0.6;
        var_43d709d52baf035c = distance(var_4fe18ad975c2297a, var_c4ab0d7fde3ac589) * 0.25;
        var_bfcf85b13bbb58c7 = distance(var_4fe18ad975c2297a, var_c4ab0d7fde3ac589) * 0.6;
        var_efd33cfb668c5fe2 = vectordot(vectornormalize(followent.origin - var_ed1068f77fba5d23), dir);
        var_efd33dfb668c6215 = vectordot(vectornormalize(followent.origin - var_4fe18ad975c2297a), dir);
        var_efd336fb668c52b0 = vectordot(vectornormalize(followent.origin - var_c4ab0d7fde3ac589), dir);
        var_736670ae619274c = undefined;
        var_efd33bfb668c5daf = undefined;
        var_e70b4c0f0605aa9f = undefined;
        var_f3c6d14c9c4b01a8 = undefined;
        if (isdefined(var_eb24cd241c8955ba)) {
            var_736670ae619274c = self.origin + dir * var_eb24cd241c8955ba;
            var_efd33bfb668c5daf = vectordot(vectornormalize(followent.origin - var_736670ae619274c), dir);
            var_e70b4c0f0605aa9f = distance(var_736670ae619274c, var_ed1068f77fba5d23) * 0.25;
            var_f3c6d14c9c4b01a8 = distance(var_736670ae619274c, var_ed1068f77fba5d23) * 0.6;
            var_3400cdbff0926f4e = distance(var_736670ae619274c, var_ed1068f77fba5d23) * 0.25;
        }
        var_7cc6511024b99736 = undefined;
        var_efd379fb668ce609 = undefined;
        if (isdefined(var_67b98cac565e94ac)) {
            var_7cc6511024b99736 = self.origin + dir * var_67b98cac565e94ac;
            var_efd379fb668ce609 = vectordot(vectornormalize(followent.origin - var_7cc6511024b99736), dir);
        }
        /#
            if (getdvarint(@"hash_3d6aec1e7192648b")) {
                var_2f189297023d95bc = vectortoangles(dir);
                var_a49ad51491362e06 = anglestoright(var_2f189297023d95bc);
                var_e8d32461b8ef680d = var_a49ad51491362e06 * -1;
                var_63b92580f9bc2247 = var_ed1068f77fba5d23 + dir * var_3400cdbff0926f4e;
                var_5044c2aaa091e8b5 = var_ed1068f77fba5d23 + dir * var_b8b793c95b3a1c2d * -1;
                var_2cafad0145a554a = var_4fe18ad975c2297a + dir * var_9150f3b2e4bd88fd;
                var_25f3e65eb8d76486 = var_4fe18ad975c2297a + dir * var_80104df680745372 * -1;
                var_190991af9a87fe39 = var_c4ab0d7fde3ac589 + dir * var_43d709d52baf035c;
                var_ef9b0d1945b01397 = var_c4ab0d7fde3ac589 + dir * var_bfcf85b13bbb58c7 * -1;
                line_debug(self.origin, goalpos[0], (0.9, 0.9, 0.9));
                print3d_debug(goalpos[0], "<dev string:xad>", (0.9, 0.9, 0.9), 0.9, 0.3, 1, 1);
                offsetorigin = self.origin + (0, 0, 5);
                line_debug(offsetorigin, offsetorigin + dir * 80, (0, 0, 0.9));
                if (isdefined(goalpos[1])) {
                    line_debug(goalpos[0], goalpos[1], (0.9, 0, 0));
                    print3d_debug(goalpos[1], "<dev string:xb4>", (1, 0, 1), 0.9, 0.3, 1, 1);
                }
                line_debug(var_ed1068f77fba5d23 + var_a49ad51491362e06 * 300, var_ed1068f77fba5d23 + var_e8d32461b8ef680d * 300, (1, 0, 0));
                line_debug(var_4fe18ad975c2297a + var_a49ad51491362e06 * 300, var_4fe18ad975c2297a + var_e8d32461b8ef680d * 300, (0, 1, 0));
                line_debug(var_c4ab0d7fde3ac589 + var_a49ad51491362e06 * 300, var_c4ab0d7fde3ac589 + var_e8d32461b8ef680d * 300, (0, 0, 1));
                line_debug(var_63b92580f9bc2247 + var_a49ad51491362e06 * 300, var_63b92580f9bc2247 + var_e8d32461b8ef680d * 300, (1, 0.8, 0.8));
                line_debug(var_5044c2aaa091e8b5 + var_a49ad51491362e06 * 300, var_5044c2aaa091e8b5 + var_e8d32461b8ef680d * 300, (1, 0.8, 0.8));
                line_debug(var_2cafad0145a554a + var_a49ad51491362e06 * 300, var_2cafad0145a554a + var_e8d32461b8ef680d * 300, (0.8, 1, 0.8));
                line_debug(var_25f3e65eb8d76486 + var_a49ad51491362e06 * 300, var_25f3e65eb8d76486 + var_e8d32461b8ef680d * 300, (0.8, 1, 0.8));
                line_debug(var_190991af9a87fe39 + var_a49ad51491362e06 * 300, var_190991af9a87fe39 + var_e8d32461b8ef680d * 300, (0.8, 0.8, 1));
                line_debug(var_ef9b0d1945b01397 + var_a49ad51491362e06 * 300, var_ef9b0d1945b01397 + var_e8d32461b8ef680d * 300, (0.8, 0.8, 1));
                print3d_debug(var_ed1068f77fba5d23, var_14be1b3c18af36e, (1, 0.25, 0.25), 0.9, 0.3);
                print3d_debug(var_4fe18ad975c2297a, var_8067d7e2d70301eb, (0.5, 1, 0.5), 0.9, 0.3);
                print3d_debug(var_c4ab0d7fde3ac589, var_df3e2bb9678ca1e0, (0.25, 0.25, 1), 0.9, 0.3);
                print3d_debug(var_ed1068f77fba5d23 + (0, 0, -4), var_b37c9f7963fd038, (1, 0.25, 0.25), 0.9, 0.3);
                print3d_debug(var_4fe18ad975c2297a + (0, 0, -4), var_a48079d9b2e6a9d1, (0.5, 1, 0.5), 0.9, 0.3);
                print3d_debug(var_c4ab0d7fde3ac589 + (0, 0, -4), var_a6c9ca7fc80223de, (0.25, 0.25, 1), 0.9, 0.3);
                if (isdefined(var_736670ae619274c)) {
                    line_debug(var_736670ae619274c + var_a49ad51491362e06 * 300, var_736670ae619274c + var_e8d32461b8ef680d * 300, (1, 0, 1));
                    print3d_debug(var_736670ae619274c, var_cc3af13504eb08f9, (1, 0.25, 1), 0.9, 0.3);
                    print3d_debug(var_736670ae619274c + (0, 0, -4), var_b22f6a0aa883e403, (1, 0.25, 1), 0.9, 0.3);
                    var_bc947c65be4c4d26 = var_736670ae619274c + dir * var_e70b4c0f0605aa9f;
                    var_84a84755c3f9f2a = var_736670ae619274c + dir * var_f3c6d14c9c4b01a8 * -1;
                    line_debug(var_bc947c65be4c4d26 + var_a49ad51491362e06 * 300, var_bc947c65be4c4d26 + var_e8d32461b8ef680d * 300, (1, 0.8, 1));
                    line_debug(var_84a84755c3f9f2a + var_a49ad51491362e06 * 300, var_84a84755c3f9f2a + var_e8d32461b8ef680d * 300, (1, 0.8, 1));
                }
                if (isdefined(var_7cc6511024b99736)) {
                    line_debug(var_7cc6511024b99736 + var_a49ad51491362e06 * 300, var_7cc6511024b99736 + var_e8d32461b8ef680d * 300, (0, 1, 1));
                    print3d_debug(var_7cc6511024b99736, "<dev string:xcc>", (0.25, 1, 1), 0.9, 0.3);
                }
                print2d3d_debug(self.origin + (0, 0, 20), "<dev string:xd1>" + distancesquared(goalpos[0], self.origin), (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "<dev string:x3b>", 3);
                thread display_goto_path((0, 1, 1));
            }
        #/
        if (ent_flag("stayahead_pause")) {
            waitframe();
            continue;
        }
        if (isdefined(var_efd379fb668ce609)) {
            if (!isdefined(self.stayahead.pw_behind_buffer)) {
                self.stayahead.pw_behind_buffer = 0;
            }
            if (!isdefined(self.stayahead.pw_infront_buffer)) {
                self.stayahead.pw_infront_buffer = 0;
            }
            if (var_efd379fb668ce609 < 0) {
                self.stayahead.pw_infront_buffer = 0;
                if (!isdefined(self.stayahead.goalnode)) {
                    if (isdefined(self.using_goto_node)) {
                        print3d_debug(self.origin + (0, 0, 10), "pw using goto goalnode", (1, 0, 1), 1, 0.5, 500, 1);
                        if (isdefined(self.patharray)) {
                            self.stayahead.goalnode = self.patharray[self.patharray.size - 1];
                        } else {
                            print3d_debug(self.origin + (0, 0, 14), "BAAAAD!!!  USING GOTO NODE BUT PATHARRAY IS NO LONGER DEFINED.  MAYBE A RACE CONDITION!", (1, 0, 0), 1, 0.5, 500, 1);
                        }
                    } else if (isdefined(self.goalnode)) {
                        self.stayahead.goalnode = self.goalnode;
                    } else {
                        print3d_debug(self.origin, "pw no goalnode, goalpos?", (1, 0, 0), 1, 0.5, 200, 1);
                    }
                }
                if (isdefined(self.stayahead.goalnode) && !isdefined(self.stayahead.goalnode_pw) && self.stayahead.pw_behind_buffer > var_758352390ecd5826) {
                    var_6ec7ad100ba120aa = get_wait_node();
                    if (isdefined(var_6ec7ad100ba120aa) && distance(self.origin, var_6ec7ad100ba120aa.origin) <= self.stayahead.wait_node_radius && distance(self.origin, var_6ec7ad100ba120aa.origin) > 32 && stayahead_goal_is_far_enough(var_6ec7ad100ba120aa)) {
                        self.stayahead.goalnode_pw = var_6ec7ad100ba120aa;
                        line_debug(self.origin, self.origin + dir * -100, (1, 1, 1), 1, 0, 500);
                        line_debug(self.origin, var_6ec7ad100ba120aa.origin, (1, 0, 0), 1, 0, 500);
                        print3d_debug(self.origin, "going to pW node: " + distance(self.origin, var_6ec7ad100ba120aa.origin) + " GoalRadius: " + self.goalradius, (1, 1, 0), 1, 0.3, 500, 1);
                        childthread stayahead_wait_set_goal_or_path();
                        childthread stayahead_set_goalnode(var_6ec7ad100ba120aa, 1);
                    } else if (!isdefined(var_6ec7ad100ba120aa)) {
                        print2d3d_debug(self.origin + (0, 0, 16), "pW fail no wait nodes", (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                    } else if (distance(self.origin, var_6ec7ad100ba120aa.origin) >= self.stayahead.wait_node_radius) {
                        line_debug(self.origin, var_6ec7ad100ba120aa.origin, (1, 0, 0), 1, 0, 1);
                        print2d3d_debug(self.origin + (0, 0, 16), "pW fail wait node too far: " + distance(self.origin, var_6ec7ad100ba120aa.origin), (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                    } else if (distance(self.origin, var_6ec7ad100ba120aa.origin) < 32) {
                        line_debug(self.origin, var_6ec7ad100ba120aa.origin, (1, 0, 0), 1, 0, 1);
                        print2d3d_debug(self.origin + (0, 0, 16), "pW fail wait node too close: " + distance(self.origin, var_6ec7ad100ba120aa.origin), (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                    }
                } else if (!isdefined(self.stayahead.goalnode)) {
                    print2d3d_debug(self.origin + (0, 0, 16), "pW fail no goalnode or goto", (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                } else if (isdefined(self.stayahead.goalnode_pw)) {
                    print2d3d_debug(self.origin + (0, 0, 16), "pW fail already have wait node", (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                } else if (self.stayahead.pw_behind_buffer < var_758352390ecd5826) {
                    print2d3d_debug(self.origin + (0, 0, 16), "pW fail buffer too small", (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                } else {
                    print2d3d_debug(self.origin + (0, 0, 16), "pW fail uh oh!", (1, 0, 0), 1, 0.3, 1, 0, "right", 6);
                }
                self.stayahead.pw_behind_buffer += 1;
                if (self.stayahead.pw_behind_buffer > var_758352390ecd5826) {
                    print2d3d_debug(self.origin + (0, 0, 12), "pW behind buffer: " + self.stayahead.pw_behind_buffer, (1, 0, 0), 1, 0.3, 1, 0, "right", 7);
                } else {
                    print2d3d_debug(self.origin + (0, 0, 12), "pW behind buffer: " + self.stayahead.pw_behind_buffer, (0, 0, 1), 1, 0.3, 1, 0, "right", 7);
                }
            } else if (isdefined(self.stayahead.goalnode) && isdefined(self.stayahead.goalnode_pw)) {
                self.stayahead.pw_behind_buffer = 0;
                if (var_efd336fb668c52b0 > 0 && self.stayahead.pw_infront_buffer > var_758352390ecd5826 * 0.4 || var_efd33dfb668c6215 > 0) {
                    print3d_debug(self.origin, "going to OG goal: " + distance(self.origin, self.stayahead.goalnode.origin), (0, 1, 0), 1, 0.3, 500, 1);
                    self.stayahead.goalnode_pw = undefined;
                    childthread stayahead_set_goalnode(self.stayahead.goalnode, 0);
                    self.stayahead.goalnode = undefined;
                }
                self.stayahead.pw_infront_buffer += 1;
                print2d3d_debug(self.origin + (0, 0, 12), "pW infront buffer: " + self.stayahead.pw_infront_buffer, (0, 1, 0), 1, 0.3, 1, 0, "right", 7);
            } else {
                self notify("stop_stayahead_wait_func");
                self.stayahead.pw_behind_buffer = 0;
                print2d3d_debug(self.origin + (0, 0, 12), "pW failing???", (1, 0, 0), 1, 0.3, 1, 0, "right", 5);
            }
        }
        if (isdefined(var_efd33bfb668c5daf) && var_efd33bfb668c5daf > 0) {
            if (lastpos != "p1Front") {
                prevpos = lastpos;
                lastpos = "p1Front";
            }
            stayahead_set_speed(1, followent, var_eb24cd241c8955ba + var_e70b4c0f0605aa9f, var_eb24cd241c8955ba, dir, var_cc3af13504eb08f9, var_cc3af13504eb08f9 + var_cc3af13504eb08f9 * var_b22f6a0aa883e403, 1);
        } else if (var_efd33cfb668c5fe2 > 0) {
            if (lastpos != "p2Front") {
                prevpos = lastpos;
                lastpos = "p2Front";
            }
            if (prevpos == "p3Front" || prevpos == "") {
                stayahead_set_speed(2, followent, var_93c57f222846fe43 + var_3400cdbff0926f4e, var_93c57f222846fe43, dir, var_14be1b3c18af36e, var_14be1b3c18af36e + var_14be1b3c18af36e * var_b37c9f7963fd038);
            } else if (isdefined(var_efd33bfb668c5daf)) {
                stayahead_set_speed(1, followent, var_eb24cd241c8955ba, var_eb24cd241c8955ba - var_f3c6d14c9c4b01a8, dir, var_cc3af13504eb08f9 + var_cc3af13504eb08f9 * var_b22f6a0aa883e403 * -1, var_cc3af13504eb08f9, 1);
            } else {
                stayahead_set_speed(2, followent, var_93c57f222846fe43 + var_3400cdbff0926f4e, var_93c57f222846fe43, dir, var_14be1b3c18af36e, var_14be1b3c18af36e + var_14be1b3c18af36e * var_b37c9f7963fd038);
            }
        } else if (var_efd33dfb668c6215 > 0) {
            if (lastpos != "p3Front") {
                prevpos = lastpos;
                lastpos = "p3Front";
                stayahead_lookat(followent);
            }
            if (prevpos == "p4Front" || prevpos == "") {
                stayahead_set_speed(3, followent, var_8b8721b280e290 + var_9150f3b2e4bd88fd, var_8b8721b280e290, dir, var_8067d7e2d70301eb, var_8067d7e2d70301eb + var_8067d7e2d70301eb * var_a48079d9b2e6a9d1);
            } else {
                stayahead_set_speed(2, followent, var_93c57f222846fe43, var_93c57f222846fe43 - var_b8b793c95b3a1c2d, dir, var_14be1b3c18af36e + var_14be1b3c18af36e * var_b37c9f7963fd038 * -1, var_14be1b3c18af36e);
            }
        } else if (var_efd336fb668c52b0 > 0) {
            if (lastpos != "p4Front") {
                prevpos = lastpos;
                lastpos = "p4Front";
                stayahead_lookat(followent);
            }
            if (prevpos == "p4Back" || prevpos == "") {
                stayahead_set_speed(4, followent, var_e326d62cb2e2289 + var_43d709d52baf035c, var_e326d62cb2e2289, dir, var_df3e2bb9678ca1e0, var_df3e2bb9678ca1e0 + var_df3e2bb9678ca1e0 * var_a6c9ca7fc80223de);
            } else {
                stayahead_set_speed(3, followent, var_8b8721b280e290, var_8b8721b280e290 - var_80104df680745372, dir, var_8067d7e2d70301eb + var_8067d7e2d70301eb * var_a48079d9b2e6a9d1 * -1, var_8067d7e2d70301eb);
            }
        } else if (var_efd336fb668c52b0 < 0) {
            if (isdefined(var_efd379fb668ce609) && var_efd379fb668ce609 < 0) {
            }
            if (lastpos != "p4Back") {
                prevpos = lastpos;
                lastpos = "p4Back";
                stayahead_lookat(followent);
            }
            stayahead_set_speed("W", followent, var_e326d62cb2e2289, var_e326d62cb2e2289 - var_bfcf85b13bbb58c7, dir, var_df3e2bb9678ca1e0 + var_df3e2bb9678ca1e0 * var_a6c9ca7fc80223de * -1, var_df3e2bb9678ca1e0);
        } else {
            print2d3d_debug(self.origin + (0, 0, 30), "uh oh!", (0.9, 0, 0), 0.9, 0.3, 250, 0, "right", 4);
        }
        waitframe();
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a64
// Size: 0x12f
function stayahead_lookat(followent) {
    if (!istrue(self.stayahead.lookat_allowed)) {
        return;
    }
    if (istrue(self.lookingatent)) {
        print3d_debug(self.origin + (0, 0, 50), "look skipped, already looking", (0.9, 0, 0), 0.9, 0.3, 250);
        return;
    }
    if (gettime() - self.stayahead.lookat_last < 3000) {
        print3d_debug(self.origin + (0, 0, 50), "look skipped, too soon", (0.9, 0, 0), 0.9, 0.3, 250);
        return;
    }
    self notify("stop_stayahead_lookat");
    self endon("death");
    self endon("stop_stayahead_lookat");
    var_e12b2113162ee01e = 0.5;
    self.stayahead.lookat_last = gettime();
    childthread stayahead_lookat_debug(var_e12b2113162ee01e);
    utility::lookatentity(followent);
    delaythread(var_e12b2113162ee01e, &utility::lookatentity);
    wait var_e12b2113162ee01e * 0.6;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9b
// Size: 0x4e
function stayahead_lookat_far(followent) {
    self endon("death");
    var_e69c9fc8bc540c6e = randomfloatrange(6000, 11000);
    if (gettime() > self.stayahead.lookat_last + var_e69c9fc8bc540c6e) {
        stayahead_lookat(followent);
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf1
// Size: 0x7d
function stayahead_lookat_debug(var_e12b2113162ee01e) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            starttime = gettime();
            while (gettime() - starttime + var_e12b2113162ee01e * 1000) {
                print3d_debug(self.origin + (0, 0, 60), "<dev string:xe2>", (0.9, 0, 0), 0.9, 0.3);
                waitframe();
            }
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x2c76
// Size: 0x4e1
function stayahead_set_speed(plane, followent, forwarddist, backdist, dir, minspeed, maxspeed, catchup) {
    print2d3d_debug(self.origin, "Plane: " + plane, (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 1);
    forwardpos = self.origin + dir * forwarddist;
    backpos = self.origin + dir * backdist;
    if (distance(forwardpos, backpos) < 1) {
        print_debug("segments are colliding, not setting speed! " + gettime());
        return;
    }
    playerpos = pointonsegmentnearesttopoint(forwardpos, backpos, followent.origin);
    dist = distance(forwardpos, playerpos);
    totaldist = forwarddist - backdist;
    scale = 1 - math::lerp_fraction(0, abs(totaldist), dist);
    var_7f826b90c59b211f = 250;
    if (isdefined(self.stayahead.turbo) || istrue(catchup)) {
        var_7f826b90c59b211f = 300;
    }
    if (!isdefined(self.stayahead.exit_last_finish_time) || gettime() > self.stayahead.exit_last_finish_time + 1000) {
        speed = math::lerp(minspeed, maxspeed, scale);
        speed = clamp(speed, 23, var_7f826b90c59b211f);
        curspeed = self aigetdesiredspeed();
        diff = speed - curspeed;
        if (istrue(catchup) || diff > 50) {
            if (!istrue(catchup) && !isdefined(self.stayahead.last_speed_set_time)) {
                speed = curspeed + clamp(diff, -2, 2);
                self.stayahead.last_speed_set_time = undefined;
                print3d_debug(self.origin + (0, 0, 32), "StayAhead STARTUP! plane: " + plane + " diff: " + diff + " curSpeed: " + curspeed + " speed: " + speed, (1, 1, 1), 1, 0.1, 100, 1);
                print_console_debug("StayAhead STARTUP! plane: " + plane + " diff: " + diff + " curSpeed: " + curspeed + " speed: " + speed);
            } else {
                speed = curspeed + clamp(diff, -10, 10);
                self.stayahead.last_speed_set_time = gettime();
                print3d_debug(self.origin + (0, 0, 32), "StayAhead CATCHUP! plane: " + plane + " diff: " + diff + " curSpeed: " + curspeed + " speed: " + speed, (1, 1, 1), 1, 0.1, 100, 1);
                print_console_debug("StayAhead CATCHUP! plane: " + plane + " diff: " + diff + " curSpeed: " + curspeed + " speed: " + speed);
            }
        } else if (isdefined(self.stayahead_accel)) {
            speed = curspeed + clamp(diff, -1 * self.stayahead_accel, self.stayahead_accel);
            self.stayahead.last_speed_set_time = gettime();
        } else {
            speed = curspeed + clamp(diff, -3.5, 3.5);
            self.stayahead.last_speed_set_time = gettime();
        }
        set_movement_speed(speed);
        if (isdefined(self.stayahead.exit_speed) && self.stayahead.exit_speed == -1) {
            self.stayahead.exit_speed = speed;
        }
        line_debug(followent.origin, playerpos);
        print2d3d_debug(self.origin + (0, 0, 8), "speed: " + speed, (0.9, 0.9, 0.9), 0.9, 0.3, 1, 0, "right", 2);
        print3d_debug(playerpos + (0, 0, 8), speed, (0.9, 0.9, 0.9), 0.9, 0.3);
        return;
    }
    print3d_debug(self.origin + (0, 0, 8), "IsExiting, not setting speed: " + gettime(), (0.9, 0, 0), 0.9, 0.3, 1);
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x315f
// Size: 0x1ce
function get_best_goto_node(path, var_1ca496d6095a0025) {
    dots = [];
    largestindex = 0;
    var_f7405c867ee4e0c8 = undefined;
    for (i = 0; i < var_1ca496d6095a0025; i++) {
        if (!isdefined(path[i])) {
            break;
        }
        dots[i] = vectordot(vectornormalize(path[i].origin - self.origin), self.stayahead.dir);
        if (dots[i] < 0) {
            var_1ca496d6095a0025 += 1;
            continue;
        }
        if (dots[i] > 0.5) {
            print3d_debug(path[i].origin, "GOTO GOOD ENOUGH re-start: " + dots[i], (0, 1, 0), 1, 0.3, 200, 1);
            var_f7405c867ee4e0c8 = 1;
            largestindex = i;
            break;
        }
        if (dots[i] > dots[largestindex]) {
            largestindex = i;
        }
    }
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            foreach (i, dot in dots) {
                if (i == largestindex && !isdefined(var_f7405c867ee4e0c8)) {
                    path[i] thread print3d_debug(path[i].origin, "<dev string:xea>" + dot, (0, 1, 0), 1, 0.3, 200, 1);
                    continue;
                }
                if (i != largestindex) {
                    path[i] thread node_display_debug(path[i].origin, "<dev string:xfa>" + dot, (1, 0, 0), 1, 0.3, 200, 1);
                }
            }
        }
    #/
    return path[largestindex];
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3336
// Size: 0x2b
function get_goto_nodes(nodes) {
    if (isdefined(self.patharray)) {
        nodes = array_combine(nodes, self.patharray);
    }
    return nodes;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x336a
// Size: 0xfe
function get_goalpos() {
    goalpos = [];
    if (isdefined(self.goalnode)) {
        goalpos[0] = self.goalnode.origin;
        if (isdefined(self.goalnode.target)) {
            var_ae9271000f62cba8 = self.goalnode get_node_or_struct();
            if (isdefined(var_ae9271000f62cba8)) {
                goalpos[1] = var_ae9271000f62cba8.origin;
            }
        } else if (isdefined(self.stayahead.goalnode) && isdefined(self.stayahead.goalnode_pw) && self.goalnode == self.stayahead.goalnode_pw) {
            goalpos[1] = self.stayahead.goalnode.origin;
        }
    } else {
        goalpos[0] = self.scriptgoalpos;
    }
    return goalpos;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3471
// Size: 0x41
function get_node_or_struct() {
    var_ae9271000f62cba8 = getnode(self.target, "targetname");
    if (isdefined(var_ae9271000f62cba8)) {
        return var_ae9271000f62cba8;
    } else {
        var_ae9271000f62cba8 = getstruct(self.target, "targetname");
    }
    return var_ae9271000f62cba8;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34bb
// Size: 0x6f3
function get_wait_node(dir) {
    nodes = [];
    if (isdefined(self.stayahead.wait_nodes)) {
        nodes = self.stayahead.wait_nodes;
        nodes = sortbydistance(nodes, self.origin);
    } else if (!isdefined(self.stayahead.use_goto_wait)) {
        nodes = getnodesinradiussorted(self.origin, self.stayahead.wait_node_radius, 0, 64, "cover");
    }
    if (isdefined(self.using_goto_node) && istrue(self.stayahead.use_goto_wait)) {
        nodes = array_combine(nodes, get_goto_nodes(nodes));
        nodes = sortbydistance(nodes, self.origin);
    }
    allowed_dot = 0.75;
    foreach (i, node in nodes) {
        nodedot = vectordot(vectornormalize(node.origin - self.origin), self.stayahead.dir);
        var_87014a763dbee513 = ter_op(isdefined(self.goalnode) && node == self.goalnode, 0, 1);
        var_8f05af16d81fa32d = ter_op(isdefined(self.goalpos) && node.origin == self.goalpos, 0, 1);
        if (!isdefined(node.stayahead_wait_used) && !isdefined(node.script_dontremove) && nodedot >= allowed_dot && var_87014a763dbee513 && var_8f05af16d81fa32d) {
            if (isdefined(self.script_forcecolor) && isdefined(node.script_color_allies) && issubstr(node.script_color_allies, self.script_forcecolor)) {
                line_debug(self.origin, node.origin, (0, 1, 0), 1, 0, 1);
                node thread node_display_debug(node.origin, node.script_color_allies, (0, 1, 0), 1, 0.2, 1000, 1);
            } else if (isdefined(self.script_forcecolor) && !isdefined(self.stayahead.use_goto_wait)) {
                if (!isdefined(node.script_color_allies)) {
                    if (isdefined(self.stayahead.wait_nodes) && !isdefined(array_find(self.stayahead.wait_nodes, node))) {
                        node thread node_display_debug(node.origin, "invalid: no color, removing", (1, 0, 1), 1, 0.2, 1000, 1);
                        nodes = array_remove(nodes, node);
                    }
                } else if (!issubstr(node.script_color_allies, self.script_forcecolor)) {
                    node thread node_display_debug(node.origin, "invalid: wrong color, removing", (1, 0, 1), 1, 0.2, 1000, 1);
                    nodes = array_remove(nodes, node);
                }
            }
            continue;
        }
        if (!isdefined(node.script_dontremove)) {
            if (isdefined(node.stayahead_wait_used)) {
                node thread node_display_debug(node.origin, "invalid: used", (1, 0, 1), 1, 0.2, 1000, 1);
            } else if (nodedot < 0) {
                node thread node_display_debug(node.origin, "removed: behind", (0, 0, 1), 1, 0.2, 1000, 1);
            } else if (nodedot < allowed_dot) {
                node thread node_display_debug(node.origin, "removed: bad angle: " + nodedot, (1, 0, 0), 1, 0.2, 1000, 1);
            } else if (!var_87014a763dbee513) {
                node thread node_display_debug(node.origin, "removed: IS goalNode", (1, 0, 0), 1, 0.2, 1000, 1);
            } else if (!var_8f05af16d81fa32d) {
                node thread node_display_debug(node.origin, "removed: IS goalPos", (1, 0, 0), 1, 0.2, 1000, 1);
            } else {
                node thread node_display_debug(node.origin, "invalid???", (1, 0, 1), 1, 0.2, 1000, 1);
            }
            nodes = array_remove(nodes, node);
        }
    }
    if (getdvarint(@"hash_3d6aec1e7192648b")) {
        foreach (node in nodes) {
            node thread node_display_debug(node.origin, "wait node: " + i, (0, 1, 0), 1, 0.2, 1000, 1);
        }
    }
    var_6ec7ad100ba120aa = undefined;
    if (nodes.size > 0) {
        var_7fc5f3a6e1f2f335 = undefined;
        foreach (node in nodes) {
            if (isnode(node)) {
                var_7fc5f3a6e1f2f335 = node;
                break;
            }
        }
        var_6ec7ad100ba120aa = nodes[0];
        if (isstruct(nodes[0]) && isdefined(var_7fc5f3a6e1f2f335)) {
            if (distance(nodes[0].origin, var_7fc5f3a6e1f2f335.origin) < 128) {
                if (node_within_fov(var_7fc5f3a6e1f2f335)) {
                    print3d_debug(var_7fc5f3a6e1f2f335.origin, "NEAREST NODE", (1, 1, 1), 1, 0.3, 1, 1);
                    print3d_debug(self.origin, "STAYAHEAD: using closest 'node' bc it's not a struct!", (1, 1, 1), 1, 0.3, 100, 1);
                    var_6ec7ad100ba120aa = var_7fc5f3a6e1f2f335;
                }
            }
        }
    } else {
        print3d_debug(self.origin, "STAYAHEAD: NO BEST WAIT NODE, RETURNING UNDEFINED!", (1, 0, 0), 1, 0.3, 100, 1);
    }
    return var_6ec7ad100ba120aa;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb7
// Size: 0xaf
function pause_flag_monitor() {
    while (true) {
        ent_flag_wait("stayahead_pause");
        print3d_debug(self.origin + (0, 0, 16), "PAUSING stayahead", (0, 1, 1), 1, 0.3, 1000, 1);
        ent_flag_waitopen("stayahead_pause");
        print3d_debug(self.origin + (0, 0, 16), "UNpausing stayahead", (0, 1, 1), 1, 0.3, 1000, 1);
        self.stayahead.pw_behind_buffer = 0;
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c6e
// Size: 0x8a
function waitnode_trigger_think(node, trigger) {
    thread delay_endon(0.05, "goal_changed");
    self waittill("goal");
    thread scripts\sp\utility::stayahead_pause(1);
    childthread waitnode_trigger_debug(node, trigger);
    childthread waitnode_trigger_delay_speed_clear();
    msg = trigger waittill_any_return("trigger", "death");
    thread scripts\sp\utility::stayahead_pause(0);
    childthread stayahead_set_goalnode(self.stayahead.goalnode, 0);
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d00
// Size: 0x16
function waitnode_trigger_delay_speed_clear() {
    waittillframeend();
    self.stayahead.last_speed_set_time = undefined;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1e
// Size: 0xb1
function waitnode_trigger_debug(node, trigger) {
    trigger endon("death");
    trigger endon("trigger");
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            for (;;) {
                print3d_debug(trigger.origin, "<dev string:x109>", (0, 1, 0), 1, 0.3, 1, 1);
                line_debug(node.origin, trigger.origin, (0, 1, 0), 1, 0, 1);
                draw_entity_bounds(trigger, 0.05, (0, 1, 0));
                waitframe();
            }
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd7
// Size: 0xa3
function stayahead_watch_end() {
    self endon("death");
    if (!isdefined(self.stayahead)) {
        self.stayahead = spawnstruct();
    }
    self.stayahead.active = 1;
    self waittill("stop_stayahead");
    if (isdefined(self.stayahead)) {
        if (isdefined(self.stayahead.active)) {
            self.stayahead.active = undefined;
        }
        if (isdefined(self.stayahead.team_thinking)) {
            self.stayahead.team_thinking = undefined;
        }
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e82
// Size: 0x59
function stayahead_wait_func(node) {
    self endon("death");
    self endon("stop_stayahead");
    self notify("stop_stayahead_wait_func");
    self endon("stop_stayahead_wait_func");
    thread delay_endon(0.05, "goal_changed");
    stayahead_at_waitnode(node);
    self [[ self.stayahead.wait_func ]]();
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee3
// Size: 0xe5
function stayahead_wait_set_goal_or_path() {
    if (isdefined(self.using_goto_node)) {
        self.stayahead.goto_patharray = self.patharray;
        self.stayahead.using_goto_node = 1;
        for (i = 0; i <= self.patharrayindex; i++) {
            if (self.stayahead.goto_patharray.size > 1) {
                print_console_debug("Removing go_to_node num: " + i);
                self.stayahead.goto_patharray = array_remove_index(self.stayahead.goto_patharray, 0);
            }
        }
        return;
    }
    if (isdefined(self.goalnode)) {
        self.stayahead.goalnode = self.goalnode;
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fd0
// Size: 0x87
function stayahead_at_waitnode(node) {
    thread delay_endon(0.05, "goal_changed");
    while (distance2dsquared(self.origin, node.origin) > 64) {
        print3d_debug(self.origin, "distanceSQ to waitnode: " + distance2dsquared(self.origin, node.origin), (1, 1, 1), 1, 0.3, 1, 1);
        waitframe();
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x405f
// Size: 0x147
function stayahead_goal_is_far_enough(var_6ec7ad100ba120aa) {
    if (node_within_fov(self.stayahead.goalnode)) {
        if (distance(self.origin, self.stayahead.goalnode.origin) - distance(self.origin, var_6ec7ad100ba120aa.origin) < 128) {
            print2d3d_debug(self.origin + (0, 0, 16), "pW fail goalnode too close: " + distance(self.origin, self.stayahead.goalnode.origin) + " Waitnode: " + distance(self.origin, var_6ec7ad100ba120aa.origin), (1, 0, 0), 1, 0.3, 1, 0, "right", 5);
            return false;
        }
    } else {
        print2d3d_debug(self.origin + (0, 0, 16), "pW fail goalnode not within FOV.", (0, 1, 0), 1, 0.3, 1, 0, "right", 5);
    }
    return true;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41af
// Size: 0x9a
function node_within_fov(node) {
    if (isdefined(self.stayahead) && isdefined(self.stayahead.dir)) {
        forward = self.stayahead.dir;
    } else {
        forward = anglestoforward(self.angles);
    }
    dot = vectordot(forward, vectornormalize(node.origin - self.origin));
    if (dot >= 0.9) {
        return true;
    }
    return false;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4252
// Size: 0x18
function delay_endon(delay, ender) {
    wait delay;
    self endon(ender);
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4272
// Size: 0x88
function stayahead_goto_can_use_wait(wait_nodes) {
    if (isdefined(self.using_goto_node)) {
        if (isdefined(self.stayahead.goto_nextnode) && distance(self.origin, self.stayahead.goto_nextnode.origin) > distance(self.origin, wait_nodes[0].origin)) {
            return 1;
        } else {
            return 0;
        }
        return;
    }
    return 1;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4302
// Size: 0x3ca
function stayahead_set_goalnode(node, var_9c5b0a5eea5b3998) {
    if (isdefined(self.stayahead.spawned_wait_node)) {
        despawncovernode(self.stayahead.spawned_wait_node);
    }
    if (!isdefined(node)) {
        return;
    }
    if (istrue(var_9c5b0a5eea5b3998)) {
        if (isstruct(node)) {
            var_be07d3ddbda4e05e = node.origin;
            angles = vectortoangles(self.stayahead.dir);
            node = spawncovernode(var_be07d3ddbda4e05e, angles, "Exposed", 1);
            if (!isdefined(node)) {
                print3d_debug(var_be07d3ddbda4e05e, "UNABLE TO SPAWN COVER NODE!  TRYING TO CREATE ONE CLOSER TO THE GROUND!", (1, 1, 0), 1, 0.3, 500, 1);
                node = spawncovernode(getgroundposition(var_be07d3ddbda4e05e, 32), angles, "Exposed", 1);
                if (isdefined(node)) {
                    print3d_debug(node.origin + (0, 0, 4), "SUCCESS SPAWNING NODE CLOSER TO THE GROUND!", (1, 1, 0), 1, 0.3, 500, 1);
                }
            }
            if (!isdefined(node)) {
                print3d_debug(var_be07d3ddbda4e05e, "UNABLE TO SPAWN COVER NODE!", (1, 0, 0), 1, 0.3, 500, 1);
                return;
            }
            self.stayahead.spawned_wait_node = node;
        }
        node.stayahead_wait_used = 1;
        self notify("stayahead_going_to_wait_node");
        self notify("stop_going_to_node");
        set_goal_node(node);
        if (isdefined(self.stayahead.goto_patharray) && node == self.stayahead.goto_patharray[self.stayahead.goto_patharray.size - 1]) {
            self.stayahead.goto_finished = 1;
        }
        if (isdefined(self.stayahead.wait_func)) {
            childthread stayahead_wait_func(node);
        }
        linked_ents = node get_linked_ents();
        if (linked_ents.size > 0) {
            foreach (ent in linked_ents) {
                if (issubstr(ent.code_classname, "trigger")) {
                    childthread waitnode_trigger_think(node, ent);
                }
            }
        }
        return;
    }
    if (isdefined(self.stayahead.using_goto_node)) {
        self notify("stop_stayahead_wait_func");
        self notify("stayahead_leaving_wait_node");
        if (istrue(self.stayahead.goto_finished)) {
            print3d_debug(self.origin + (0, 0, 8), "last node wait node; go_to_node() path done!", (0, 1, 0), 1, 0.3, 500, 1);
            self.stayahead.goto_finished = undefined;
            self notify("reached_path_end");
        } else {
            print3d_debug(self.origin + (0, 0, 8), "going BACK to goto patharray", (0, 1, 0), 1, 0.3, 500, 1);
            node = get_best_goto_node(self.stayahead.goto_patharray, 2);
            thread scripts\sp\spawner::go_to_node(node);
            self.stayahead.using_goto_node = 1;
        }
        return;
    }
    self notify("stop_stayahead_wait_func");
    self notify("stayahead_leaving_wait_node");
    self notify("stop_going_to_node");
    set_goal_node(node);
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46d4
// Size: 0x472
function stayahead_team_think() {
    self.stayahead.team_thinking = 1;
    self endon("death");
    self endon("stop_stayahead");
    speedscale = 0.8;
    var_cc3af13504eb08f9 = self.stayahead.p1["speed"];
    var_14be1b3c18af36e = self.stayahead.p2["speed"];
    var_8067d7e2d70301eb = self.stayahead.p3["speed"];
    var_df3e2bb9678ca1e0 = self.stayahead.p4["speed"];
    var_eb24cd241c8955ba = self.stayahead.p1["distance"];
    var_93c57f222846fe43 = self.stayahead.p2["distance"];
    var_8b8721b280e290 = self.stayahead.p3["distance"];
    var_e326d62cb2e2289 = self.stayahead.p4["distance"];
    childthread stayahead_team_debug();
    while (true) {
        foreach (guy in self.stayahead.team) {
            if (!isdefined(guy.stayahead.dynamic_frontdist)) {
                guy.stayahead.dynamic_frontdist = 200;
            }
            if (!isdefined(guy.stayahead.dynamic_middist)) {
                guy.stayahead.dynamic_middist = 125;
            }
            if (!isdefined(guy.stayahead.dynamic_backdist)) {
                guy.stayahead.dynamic_backdist = 50;
            }
            guy childthread enable_dynamic_run_speed(self, var_df3e2bb9678ca1e0 * speedscale, var_8067d7e2d70301eb * speedscale, var_14be1b3c18af36e * speedscale, guy.stayahead.dynamic_frontdist, guy.stayahead.dynamic_middist, guy.stayahead.dynamic_backdist);
            if (!isdefined(guy.stayahead.dir)) {
                guy.stayahead.dir = anglestoforward(self.angles);
            }
            if (!isdefined(guy.stayahead.wait_node_radius)) {
                guy.stayahead.wait_node_radius = self.stayahead.wait_node_radius;
            }
        }
        self waittill("stayahead_going_to_wait_node");
        foreach (guy in self.stayahead.team) {
            guy childthread stayahead_wait_set_goal_or_path();
            guy disable_dynamic_run_speed(var_df3e2bb9678ca1e0);
            var_6ec7ad100ba120aa = guy get_wait_node(vectortoangles(guy.angles));
            if (isdefined(var_6ec7ad100ba120aa)) {
                guy childthread stayahead_set_goalnode(var_6ec7ad100ba120aa, 1);
            }
        }
        self waittill("stayahead_leaving_wait_node");
        foreach (guy in self.stayahead.team) {
            guy.stayahead.dir = anglestoforward(guy.angles);
            guy.stayahead.using_goto_node = 1;
            guy childthread stayahead_set_goalnode(guy.stayahead.goto_patharray[0], 0);
        }
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b4e
// Size: 0xa3
function stayahead_team_debug() {
    self endon("stop_stayahead");
    for (;;) {
        foreach (guy in self.stayahead.team) {
            guy thread display_goto_path((1, 0, 1));
            line_debug(self.origin, guy.origin, (1, 0, 1), 1, 0, 1);
        }
        waitframe();
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bf9
// Size: 0x57
function lerp_plane_vector(dir_prev, dir_new) {
    adjustment = 0.03;
    dir_adj = (dir_new - dir_prev) * adjustment;
    dir = dir_prev + dir_adj;
    self.stayahead.dir = dir;
    return dir;
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c59
// Size: 0x26
function print_debug(string) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            iprintln(string);
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c87
// Size: 0x26
function print_console_debug(string) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            println(string);
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4cb5
// Size: 0x6e
function print3d_debug(origin, text, color, alpha, scale, duration, centered) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            if (!isdefined(duration)) {
                duration = 1;
            }
            if (!isdefined(centered)) {
                centered = 0;
            }
            print3d(origin, text, color, alpha, scale, duration, centered);
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2b
// Size: 0x80
function print2d3d_debug(origin, text, color, alpha, scale, duration, centered, side, line) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            if (!isdefined(duration)) {
                duration = 1;
            }
            if (!isdefined(centered)) {
                centered = 0;
            }
            level thread create_2d_text(text, color, side, line, duration);
        }
    #/
}

/#

    // Namespace stayahead / scripts\sp\stayahead
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4db3
    // Size: 0x17c
    function create_2d_background() {
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            if (!isdefined(self.stayahead.bg_2d)) {
                self.stayahead.bg_2d = newhudelem();
            } else {
                return;
            }
            self.stayahead.bg_2d.alignx = "<dev string:x11b>";
            self.stayahead.bg_2d.aligny = "<dev string:x122>";
            self.stayahead.bg_2d.horzalign = "<dev string:x126>";
            self.stayahead.bg_2d.vertalign = "<dev string:x126>";
            self.stayahead.bg_2d.x = 310;
            self.stayahead.bg_2d.y = 70;
            self.stayahead.bg_2d.sort = -10;
            self.stayahead.bg_2d.alpha = 0.5;
            self.stayahead.bg_2d setshader("<dev string:x131>", 160, 52);
        }
    }

    // Namespace stayahead / scripts\sp\stayahead
    // Params 5, eflags: 0x0
    // Checksum 0x0, Offset: 0x4f37
    // Size: 0x143
    function create_2d_text(string, color, side, line, duration) {
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            offset_x = 232;
            switch (side) {
            case #"hash_96815ce4f2a3dbc5":
                offset_x += 63;
                break;
            }
            offset_y = 72;
            offset_y += 6 * line;
            text = newhudelem();
            text settext(string);
            text.fontscale = 0.5;
            text.alignx = "<dev string:x64>";
            text.aligny = "<dev string:x122>";
            text.horzalign = "<dev string:x126>";
            text.vertalign = "<dev string:x126>";
            text.x = offset_x;
            text.y = offset_y;
            text.sort = 100;
            text.color = color;
            text.alpha = 1;
            duration *= 0.05;
            wait duration;
            text destroy();
        }
    }

#/

// Namespace stayahead / scripts\sp\stayahead
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5082
// Size: 0x81
function line_debug(start, end, color, alpha, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            if (!isdefined(color)) {
                color = (1, 1, 1);
            }
            if (!isdefined(alpha)) {
                alpha = 1;
            }
            if (!isdefined(depthtest)) {
                depthtest = 0;
            }
            if (!isdefined(duration)) {
                duration = 1;
            }
            line(start, end, color, alpha, depthtest, duration);
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x510b
// Size: 0x4a
function sphere_debug(origin, radius, color, depthtest, duration) {
    /#
        if (getdvarint(@"hash_3d6aec1e7192648b")) {
            sphere(origin, radius, color, depthtest, duration);
        }
    #/
}

// Namespace stayahead / scripts\sp\stayahead
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x515d
// Size: 0xca
function node_display_debug(origin, text, color, alpha, scale, duration, centered, no_endon) {
    if (isstruct(self) || isnode(self) && isdefined(self.targetname) && !isdefined(no_endon)) {
        level notify(self.targetname);
        level endon(self.targetname);
    }
    for (i = 0; i < duration; i++) {
        print3d_debug(origin + (0, 0, 6), text, color, alpha, scale, 1, centered);
        sphere_debug(origin, 6, color, 0, 1);
        waitframe();
    }
}

// Namespace stayahead / scripts\sp\stayahead
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x522f
// Size: 0x198
function display_goto_path(color) {
    og_color = color;
    if (getdvarint(@"hash_3d6aec1e7192648b")) {
        if (isdefined(self.using_goto_node) && isdefined(self.patharray)) {
            foreach (i, node in self.patharray) {
                if (isdefined(self.patharrayindex) && i < self.patharrayindex) {
                    color = (1, 0, 0);
                } else {
                    color = og_color;
                }
                node thread node_display_debug(node.origin, "goto: " + i, color, 1, 0.2, 100, 1);
                if (isdefined(node.target)) {
                    if (isdefined(getstruct(node.target, "targetname"))) {
                        line_debug(node.origin, getstruct(node.target, "targetname").origin, color, 1, 0, 1);
                        continue;
                    }
                    if (isdefined(getnode(node.target, "targetname"))) {
                        line_debug(node.origin, getnode(node.target, "targetname").origin, color, 1, 0, 1);
                    }
                }
            }
        }
    }
}

