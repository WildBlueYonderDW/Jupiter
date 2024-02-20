// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\traverse.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_4fecf90fd9e5c41a;

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399
// Size: 0x1f
function function_64d97cf652a4d385() {
    self.var_acb02d417fdecc8f = &function_4fcd5f899c149076;
    self.var_bb9dc4a1372891c6 = &function_46b64b8f6d835b78;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bf
// Size: 0x29a
function function_56b8dc251ee4e178(asmname, statename, params) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(statename + "_finished");
    startnode = undefined;
    if (self.var_32a34987ee1b3095 == "node_based") {
        startnode = self getnegotiationstartnode();
        startnode = function_53c4c53197386572(startnode, self.traversal_start_node);
        /#
            assert(isdefined(startnode));
        #/
    }
    startpos = undefined;
    endpos = undefined;
    if (self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless") {
        if (self.var_32a34987ee1b3095 == "linkless" && self.var_59c43504d7aabb7a == "fence") {
            var_e8885693728fd806 = &function_3bb347b40346528a;
        } else if (isdefined(self.var_bb9dc4a1372891c6)) {
            var_e8885693728fd806 = self.var_bb9dc4a1372891c6;
        }
        /#
            /#
                assertex(isdefined(var_e8885693728fd806), "Wall traversal missing start node");
            #/
        #/
        self.var_64b933af90edc53c = self [[ var_e8885693728fd806 ]]();
        startpos = self.var_64b933af90edc53c.origin;
        endpos = self.var_64b933af90edc53c.endpos;
    } else if (self.var_32a34987ee1b3095 == "node_based") {
        startpos = startnode.origin;
        endpos = self getnegotiationendpos();
        if (!isdefined(endpos)) {
            endnode = self getnegotiationendnode();
            if (!isdefined(endnode) && isdefined(self.traversal_end_node)) {
                endpos = self.traversal_end_node.origin;
            }
        }
    }
    if (isdefined(endpos)) {
        self forceteleport(endpos, self.angles);
        /#
            animscript = "<unknown string>";
            var_407df2ccd3b264d2 = "<unknown string>";
            if (isdefined(startnode) && isdefined(startnode.animscript)) {
                animscript = "<unknown string>" + startnode.animscript + "<unknown string>";
                var_407df2ccd3b264d2 = "<unknown string>" + ter_op(istrue(startnode.var_e25867ac07f6cb19), "<unknown string>", "<unknown string>");
            }
            println("<unknown string>" + startpos + "<unknown string>" + animscript + var_407df2ccd3b264d2);
            record3dtext("<unknown string>" + animscript + var_407df2ccd3b264d2, self.origin + (0, 0, 70), (1, 0, 1));
        #/
    }
    terminatetraverse(asmname, statename);
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x660
// Size: 0x178
function function_46b64b8f6d835b78() {
    var_73ba1b0a68c224f5 = self.var_c97cd7821467b22c;
    var_ef78260982b9116c = self.var_e341ef38b14d5cd3;
    var_18bca10706db67d2 = spawnstruct();
    var_18bca10706db67d2.angles = vectortoangles(flat_origin(var_ef78260982b9116c - var_73ba1b0a68c224f5));
    var_18bca10706db67d2.origin = var_73ba1b0a68c224f5;
    var_18bca10706db67d2.endpos = var_ef78260982b9116c;
    if (abs(var_73ba1b0a68c224f5[2] - var_ef78260982b9116c[2]) < 5) {
        var_deb6d45028c3ef80 = averagepoint([0:var_73ba1b0a68c224f5, 1:var_ef78260982b9116c]);
    } else {
        var_deb6d45028c3ef80 = function_fda6a76c32365675(var_73ba1b0a68c224f5, var_ef78260982b9116c);
        if (!isdefined(var_deb6d45028c3ef80)) {
            var_deb6d45028c3ef80 = averagepoint([0:var_73ba1b0a68c224f5, 1:var_ef78260982b9116c]);
        }
    }
    if (isdefined(var_deb6d45028c3ef80)) {
        var_18bca10706db67d2.var_e25867ac07f6cb19 = 1;
        var_18bca10706db67d2.traverse_height = var_deb6d45028c3ef80[2];
        var_18bca10706db67d2.traverse_height_delta = var_deb6d45028c3ef80[2] - var_73ba1b0a68c224f5[2];
        var_18bca10706db67d2.traverse_drop_height_delta = var_deb6d45028c3ef80[2] - var_ef78260982b9116c[2];
        var_18bca10706db67d2.apex_delta = var_deb6d45028c3ef80 - var_73ba1b0a68c224f5;
        if (isdefined(self.var_371c13977bb78c59)) {
            var_18bca10706db67d2.traversetype = [[ self.var_371c13977bb78c59 ]](undefined, var_18bca10706db67d2);
        }
    }
    if (isdefined(var_18bca10706db67d2.traversetype) && var_18bca10706db67d2.traversetype == "traverse_warp_across") {
        var_18bca10706db67d2.across_delta = var_ef78260982b9116c - var_73ba1b0a68c224f5;
    }
    return var_18bca10706db67d2;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7e0
// Size: 0x97
function function_c4b3846ecfe9e4ec(asmname, statename, params) {
    self.var_371c13977bb78c59 = function_53c4c53197386572(self.var_371c13977bb78c59, &function_486011c6564f32e5);
    self.var_12a6a7d538790f6e = function_53c4c53197386572(self.var_12a6a7d538790f6e, &function_27277e151d315a62);
    /#
        if (self.var_32a34987ee1b3095 == "<unknown string>") {
            /#
                assertex(isdefined(self.var_c97cd7821467b22c), "<unknown string>" + self.origin);
            #/
        }
    #/
    namespace_39fbff2ac567437e::calctraversetype(asmname, statename, params);
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x87e
// Size: 0x30f
function private function_486011c6564f32e5(var_b928c399c807ac2e, var_20b8beaaf9e38a2e) {
    if (function_8f0f50119c5937bb(var_b928c399c807ac2e)) {
        return var_b928c399c807ac2e;
    }
    if (isdefined(self.var_ad4d9f5a34656396)) {
        if (self.var_ad4d9f5a34656396 == "traverse_wall") {
            return "traverse_wall";
        } else if (self.var_ad4d9f5a34656396 == "traverse_ground") {
            return "traverse_ground";
        }
    }
    var_f137529d107e68cb = 108;
    var_4a57ae194030542 = 100;
    var_5234b8c29e944631 = 20;
    var_c5f7e9587d8928eb = 0;
    var_d16a732cd6f6ad8f = 0;
    var_a54c0815de2b6d09 = undefined;
    if (isdefined(var_20b8beaaf9e38a2e)) {
        /#
            assert(var_20b8beaaf9e38a2e.var_e25867ac07f6cb19);
        #/
        var_c5f7e9587d8928eb = var_20b8beaaf9e38a2e.traverse_height_delta;
        var_d16a732cd6f6ad8f = var_20b8beaaf9e38a2e.traverse_drop_height_delta;
        if (isdefined(var_20b8beaaf9e38a2e.across_delta)) {
            var_a54c0815de2b6d09 = length2d(var_20b8beaaf9e38a2e.across_delta);
        } else if (!isdefined(var_b928c399c807ac2e) || var_b928c399c807ac2e == "traverse_warp_across" || !isdefined(var_20b8beaaf9e38a2e.traversetype) || var_20b8beaaf9e38a2e.traversetype == "traverse_warp_across") {
            var_a54c0815de2b6d09 = length2d(var_20b8beaaf9e38a2e.endpos - var_20b8beaaf9e38a2e.origin);
        }
    } else {
        startpos = self function_ad3c975cb94e4736();
        if (!isdefined(startpos)) {
            startnode = self.traversal_start_node;
            if (isdefined(startnode)) {
                startpos = startnode.origin;
            } else {
                startpos = self.origin;
            }
        }
        endpos = self getnegotiationendpos();
        if (!isdefined(endpos)) {
            if (isdefined(self.traversal_end_node)) {
                endpos = self.traversal_end_node.origin;
            } else {
                /#
                    assertmsg("Can't determine end position of traversal at start pos: " + startpos);
                #/
                return undefined;
            }
        }
        if (abs(startpos[2] - endpos[2]) < 5) {
            var_4dab7ef153201f31 = averagepoint([0:startpos, 1:endpos]);
        } else {
            var_4dab7ef153201f31 = function_fda6a76c32365675(startpos, endpos);
            if (!isdefined(var_4dab7ef153201f31)) {
                /#
                    assertmsg("Failed to generate apex_point for traversal at start pos: " + startpos + ", end pos: " + endpos);
                #/
                return undefined;
            }
        }
        var_c5f7e9587d8928eb = var_4dab7ef153201f31[2] - startpos[2];
        var_d16a732cd6f6ad8f = var_4dab7ef153201f31[2] - endpos[2];
        if (!isdefined(startnode) || !isdefined(startnode.animscript) || startnode.animscript == "traverse_warp_across") {
            var_a54c0815de2b6d09 = length2d(endpos - startpos);
        }
    }
    if (isdefined(var_a54c0815de2b6d09) && var_a54c0815de2b6d09 > var_f137529d107e68cb && var_c5f7e9587d8928eb < var_4a57ae194030542 && var_d16a732cd6f6ad8f < var_4a57ae194030542) {
        return "traverse_warp_across";
    }
    if (var_c5f7e9587d8928eb > var_5234b8c29e944631 && var_d16a732cd6f6ad8f > var_5234b8c29e944631) {
        return "traverse_warp_over";
    } else if (var_c5f7e9587d8928eb < var_5234b8c29e944631 && var_d16a732cd6f6ad8f < var_5234b8c29e944631) {
        return "traverse_warp_across";
    } else if (var_d16a732cd6f6ad8f < var_c5f7e9587d8928eb) {
        return "traverse_warp_up";
    } else if (var_d16a732cd6f6ad8f >= var_c5f7e9587d8928eb) {
        return "traverse_warp_down";
    }
    return undefined;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb95
// Size: 0x21f
function private function_27277e151d315a62(var_e9db8fc3741a7e52, type) {
    if (self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless") {
        /#
            assertex(isdefined(self.var_64b933af90edc53c) && self.var_64b933af90edc53c.var_e25867ac07f6cb19, "Data for nodeless or linkless traversal has not been calculated");
        #/
    } else if (self.var_32a34987ee1b3095 == "node_based") {
        /#
            assertex(isdefined(self.traversal_start_node) && isdefined(self.traversal_start_node.traverse_height), "Traversal data for node-based data has not been calculated");
        #/
        if (isdefined(self.traversal_start_node)) {
            end_node = self.traversal_end_node;
            if (isdefined(end_node)) {
                if (type == "traverse_warp_up" || issubstr(type, "climb_building_up")) {
                    var_e9db8fc3741a7e52["drop_height"] = 0;
                    var_e9db8fc3741a7e52["height"] = end_node.origin[2] - self.traversal_start_node.origin[2];
                } else if (type == "traverse_warp_down" || issubstr(type, "climb_building_down")) {
                    var_e9db8fc3741a7e52["drop_height"] = self.traversal_start_node.origin[2] - end_node.origin[2];
                    var_e9db8fc3741a7e52["height"] = 0;
                } else if (type == "traverse_warp_across") {
                    var_e9db8fc3741a7e52["length"] = distance2d(self.traversal_start_node.origin, end_node.origin);
                }
            }
        }
    }
    var_e9db8fc3741a7e52["climb_building_type"] = "";
    if (issubstr(type, "climb_building_up")) {
        tokens = strtok(type, "_");
        if (isdefined(tokens[3]) && tokens[3] != "") {
            var_e9db8fc3741a7e52["climb_building_type"] = tokens[3];
        }
    }
    if (isdefined(self.var_db44b0ed0f52e2b)) {
        var_e9db8fc3741a7e52 = array_combine_unique_keys(self.var_db44b0ed0f52e2b, var_e9db8fc3741a7e52);
    }
    return var_e9db8fc3741a7e52;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdbc
// Size: 0xc7
function private function_8f0f50119c5937bb(type) {
    if (!isdefined(type)) {
        return 0;
    }
    switch (type) {
    case #"hash_20e18a3582122c1f":
    case #"hash_2517ba3af2f13858":
    case #"hash_3929e05b5be2d50d":
    case #"hash_668adb9645eda622":
    case #"hash_9e0d753b4c4375e3":
    case #"hash_e8ee1dc75e1bef22":
        return 1;
        break;
    }
    if (issubstr(type, "climb_building_up") || issubstr(type, "climb_building_down")) {
        if (self asmhasstate(self.asmname, type)) {
            return 1;
        }
    }
    if (self asmhasstate(self.asmname, "traverse_custom") && asm_lookupanimfromaliasifexists("traverse_custom", type) != undefined) {
        return 1;
    }
    return 0;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8b
// Size: 0x14c
function private function_4fcd5f899c149076(note) {
    if (note == "warp_arrival_start") {
        if (self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless") {
            if (!isdefined(self.var_64b933af90edc53c)) {
                /#
                    println("<unknown string>" + self.var_32a34987ee1b3095 + "<unknown string>");
                #/
                return;
            }
            targetangles = self.var_64b933af90edc53c.angles;
        } else {
            if (!isdefined(self.traversestartnode)) {
                /#
                    println("<unknown string>" + self.var_32a34987ee1b3095 + "<unknown string>");
                #/
                return;
            }
            targetangles = self.traversestartnode.angles;
        }
        if (isdefined(targetangles)) {
            yaw_diff = absangleclamp180(targetangles[1] - self.angles[1]);
            var_9e4cfe0d44c34dfe = 45;
            if (yaw_diff > var_9e4cfe0d44c34dfe) {
                thread function_5eea36f1be69547b(targetangles[1]);
                /#
                    print3d(self.origin + (10, 0, 0), "<unknown string>" + yaw_diff, (1, 1, 0.9), 0.8, 0.5);
                #/
            }
        }
    }
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfde
// Size: 0xe8
function private function_5eea36f1be69547b(target_yaw) {
    var_690fb7cd50d952c3 = 200;
    self endon("death");
    yaw = self.angles[1];
    while (yaw != target_yaw && istrue(self.var_20a0e88052918576)) {
        yaw = self.angles[1];
        rotation_speed = level.framedurationseconds * var_690fb7cd50d952c3;
        diff = angleclamp180(target_yaw - yaw);
        new_yaw = undefined;
        if (abs(diff) < rotation_speed) {
            new_yaw = target_yaw;
        } else {
            new_yaw = yaw + namespace_3c37cb17ade254d::sign(diff) * rotation_speed;
        }
        new_angles = (self.angles[0], new_yaw, self.angles[2]);
        self forceteleport(self.origin, new_angles);
        waitframe();
    }
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10cd
// Size: 0x113
function function_37ec13c91574883c(asmname, statename, params) {
    startnode = function_234a86bad9f7c8cf();
    endpos = self getnegotiationendpos();
    /#
        assertex(isdefined(startnode), "Wall traversal missing start node");
    #/
    /#
        assertex(isdefined(startnode.var_a8392bf67e62cf17), "Wall traversal nodes undefined");
    #/
    /#
        assertex(startnode.var_a8392bf67e62cf17.size >= 2, "Wall traversal node data invalid");
    #/
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    /#
        assertex(isdefined(var_2c8936d08f85c5c1), "No valid anim for wall traversal");
    #/
    if (!isdefined(var_2c8936d08f85c5c1) || !isdefined(startnode) || !isdefined(startnode.var_a8392bf67e62cf17) || startnode.var_a8392bf67e62cf17.size < 2) {
        terminatetraverse(asmname, statename);
        return;
    }
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    self animmode("noclip");
    thread function_a8461d8c8de86efe(asmname, statename, startnode, endpos);
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e7
// Size: 0x3f1
function function_a8461d8c8de86efe(asmname, statename, startnode, endpos) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(statename + "_finished");
    var_157e0150178595f2 = self.var_157e0150178595f2;
    self.var_157e0150178595f2 = 0;
    self.jumping = 1;
    if (startnode.var_a4a172256f89bf7a.size > 0 && startnode.var_a4a172256f89bf7a[0] != 0) {
        var_896fa7e7b5e3617a = startnode.var_a4a172256f89bf7a[0];
    } else if (isdefined(startnode.var_143b20e77684b51) && istrue(startnode.var_143b20e77684b51)) {
        var_896fa7e7b5e3617a = 90;
    } else {
        var_896fa7e7b5e3617a = -90;
    }
    var_cb108454048737bb = vectortoangles(startnode.var_a8392bf67e62cf17[1] - startnode.var_a8392bf67e62cf17[0]);
    targetangles = (var_cb108454048737bb[0], var_cb108454048737bb[1], var_896fa7e7b5e3617a);
    self forceteleport(startnode.var_a8392bf67e62cf17[0], targetangles, 10, 0, 1);
    /#
        assert(startnode.var_a8392bf67e62cf17.size == startnode.var_a4a172256f89bf7a.size);
    #/
    var_8bbc12868bacdc91 = randomfloat(1);
    var_9afdde4c7203b41e = getdvarfloat(@"hash_368b68b43590556d", 0);
    var_ad44f728fb4888be = getdvarint(@"hash_507099c93f31940f", 0);
    lastpos = self.origin;
    for (i = 0; i < startnode.var_a8392bf67e62cf17.size - 1; i++) {
        var_2a8b3723e132b997 = startnode.var_a8392bf67e62cf17[i];
        var_7b46278c694807a8 = startnode.var_a8392bf67e62cf17[i + 1];
        var_5eb953348620e51f = var_7b46278c694807a8 - var_2a8b3723e132b997;
        if (var_9afdde4c7203b41e > 0) {
            var_21279c66a0239416 = length(var_5eb953348620e51f);
            if (var_21279c66a0239416 == 0) {
                continue;
            }
            var_acd303f03e981a0c = var_5eb953348620e51f / var_21279c66a0239416;
        }
        /#
            if (var_ad44f728fb4888be > 0) {
                line(var_2a8b3723e132b997, var_7b46278c694807a8, (1, 0, 0), 1, 0, var_ad44f728fb4888be);
            }
        #/
        var_b1b63ca2ea201b75 = vectortoangles(var_5eb953348620e51f);
        if (startnode.var_a4a172256f89bf7a[i] != 0) {
            var_896fa7e7b5e3617a = startnode.var_a4a172256f89bf7a[i];
        }
        targetangles = (var_b1b63ca2ea201b75[0], var_b1b63ca2ea201b75[1], var_896fa7e7b5e3617a);
        if (var_9afdde4c7203b41e == 0) {
            self orientmode("face angle 3d", targetangles);
        }
        while (1) {
            if (var_9afdde4c7203b41e > 0) {
                var_b9e885154e1e4fea = self.origin - var_2a8b3723e132b997;
                var_a40d3e2b5af48c06 = vectordot(var_b9e885154e1e4fea, var_acd303f03e981a0c);
                var_46cb36303a8d9748 = var_a40d3e2b5af48c06 / var_21279c66a0239416;
                var_26e79ebc4fe0389b = sin((var_8bbc12868bacdc91 + var_46cb36303a8d9748) * 360) * var_9afdde4c7203b41e;
                targetangles = (var_b1b63ca2ea201b75[0] + var_26e79ebc4fe0389b, var_b1b63ca2ea201b75[1], var_896fa7e7b5e3617a);
                self orientmode("face angle 3d", targetangles);
            }
            var_d644fdede50aa497 = var_7b46278c694807a8 - self.origin;
            if (vectordot(var_5eb953348620e51f, var_d644fdede50aa497) < 0) {
                continue;
            }
            /#
                if (var_ad44f728fb4888be > 0) {
                    line(lastpos, self.origin, (0, 1, 0), 1, 0, var_ad44f728fb4888be);
                    lastpos = self.origin;
                }
            #/
            waitframe();
        }
    }
    self.var_157e0150178595f2 = var_157e0150178595f2;
    asm_fireevent(asmname, "end");
    self animmode("normal");
    self forceteleport(endpos, (self.angles[0], 0, 0));
    self.jumping = 0;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15df
// Size: 0xc7
function private function_234a86bad9f7c8cf() {
    startnode = undefined;
    if (self.var_32a34987ee1b3095 == "not_set") {
        var_afc9e281d28edc65 = self setuptraversaltransitioncheck(120);
        /#
            assert(var_afc9e281d28edc65);
        #/
    }
    if (self.var_32a34987ee1b3095 == "node_based") {
        startnode = self getnegotiationstartnode();
        if (!isdefined(startnode)) {
            self starttraversearrival(120);
            startnode = self getnegotiationstartnode();
        }
        /#
            assert(isdefined(startnode));
        #/
    } else if (self.var_32a34987ee1b3095 == "linkless" || self.var_32a34987ee1b3095 == "nodeless") {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    } else {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
    return startnode;
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16ae
// Size: 0x99
function function_4b209d7ba1366aa1(asmname, statename, params) {
    var_5822b500407415f6 = function_ab33388488f8492b();
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    /#
        assertex(isdefined(var_2c8936d08f85c5c1), "No valid anim for walking traversal");
    #/
    if (var_5822b500407415f6.size < 2 || !isdefined(var_2c8936d08f85c5c1)) {
        terminatetraverse(asmname, statename);
        return;
    }
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, var_2c8936d08f85c5c1));
    self animmode("gravity_off_nav");
    thread function_3131bcdd32390c23(asmname, statename, var_5822b500407415f6);
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174e
// Size: 0x101
function function_3131bcdd32390c23(asmname, statename, var_5822b500407415f6) {
    self endon("death");
    self endon("terminate_ai_threads");
    self endon(statename + "_finished");
    var_157e0150178595f2 = self.var_157e0150178595f2;
    self.var_157e0150178595f2 = 0;
    for (i = 0; i < var_5822b500407415f6.size - 1; i++) {
        startpos = var_5822b500407415f6[i];
        endpos = var_5822b500407415f6[i + 1];
        var_93b71025e5032b3b = endpos - startpos;
        yaw = vectortoyaw(var_93b71025e5032b3b);
        self orientmode("face angle", yaw);
        while (1) {
            var_14899d470e0ce373 = endpos - self.origin;
            if (vectordot(var_93b71025e5032b3b, var_14899d470e0ce373) < 0) {
                continue;
            }
            waitframe();
        }
    }
    self.var_157e0150178595f2 = var_157e0150178595f2;
    asm_fireevent(asmname, "end");
}

// Namespace namespace_4fecf90fd9e5c41a/namespace_842bb3917a35dd62
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1856
// Size: 0x1a2
function private function_ab33388488f8492b() {
    var_5822b500407415f6 = [];
    if (self.var_32a34987ee1b3095 == "not_set") {
        var_afc9e281d28edc65 = self setuptraversaltransitioncheck(120);
        /#
            assert(var_afc9e281d28edc65);
        #/
    }
    if (self.var_32a34987ee1b3095 == "linkless") {
        startpos = self function_ad3c975cb94e4736();
        if (!isdefined(startpos)) {
            self starttraversearrival(120, self.var_e2b4fc394eef5c0f, self.var_64b933af90edc53c.origin, self.var_64b933af90edc53c.endpos);
            startpos = self function_ad3c975cb94e4736();
        }
        /#
            assert(isdefined(startpos));
        #/
        endpos = self getnegotiationendpos();
        var_5822b500407415f6 = array_add(var_5822b500407415f6, startpos);
        var_5822b500407415f6 = array_add(var_5822b500407415f6, endpos);
    } else if (self.var_32a34987ee1b3095 == "nodeless") {
        startpos = self function_ad3c975cb94e4736();
        if (!isdefined(startpos)) {
            self starttraversearrival(120, self.var_e2b4fc394eef5c0f);
            startpos = self function_ad3c975cb94e4736();
        }
        /#
            assert(isdefined(startpos));
        #/
        endpos = self getnegotiationendpos();
        var_5822b500407415f6 = array_add(var_5822b500407415f6, startpos);
        var_5822b500407415f6 = array_add(var_5822b500407415f6, endpos);
    } else if (self.var_32a34987ee1b3095 == "node_based") {
        startnode = self getnegotiationstartnode();
        if (!isdefined(startnode)) {
            self starttraversearrival(120);
            startnode = self getnegotiationstartnode();
        }
        /#
            assert(isdefined(startnode));
        #/
        var_5822b500407415f6 = startnode.var_5822b500407415f6;
    } else {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
    return var_5822b500407415f6;
}

