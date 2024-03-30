// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using script_7edf952f8921aa6b;
#using script_2ece06910a5c572;
#using script_38c251115537f16e;
#using script_433375b6cbabfc47;
#using script_3b78d23dad7ec5be;
#using script_686729055b66c6e4;
#using script_371b4c2ab5861e62;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\mp\mp_agent.gsc;

#namespace namespace_e5049f73842ac360;

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd8
// Size: 0x322
function function_1f7bc5dd1e86ee1f() {
    /#
        waitframe();
        function_6e7290c8ee4f558b("<unknown string>");
        priority = 20;
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + priority, &function_6aca4fbb47b31a61);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + priority, &function_6aca4fbb47b31a61);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_79e6bc2cbae5a949);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_1aaf94b6b4be4ec4);
        level.var_f6c271f9f2c0fd8 = namespace_14d36171baccf528::function_8ca4e221673e423c();
        var_a559014c9ce72754 = function_83dcd153ba762bfa();
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_233d42b214d5a6cd);
        foreach (subclass, aitypes in level.var_f6c271f9f2c0fd8) {
            spawn_name = default_to(var_a559014c9ce72754[subclass], subclass);
            if (issubstr(subclass, "<unknown string>")) {
                function_b23a59dfb4ca49a1("<unknown string>" + spawn_name, "<unknown string>" + aitypes[0], &function_a252e2eb60d04623);
                continue;
            }
            function_b23a59dfb4ca49a1("<unknown string>" + spawn_name, "<unknown string>" + aitypes[0], &function_a252e2eb60d04623);
        }
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_958e5c5cb15de054);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_958e5c5cb15de054);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_cacc6088d6b42b34);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_e4acd0ee95b2b171);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bb2c7a7d908691b3);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &ragdoll_all);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_168f04942cd64395);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_168f04942cd64395);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7d5de5e77bc3e95d);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_b4ecf2809c2b8328);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_b4ecf2809c2b8328);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_789810fa398850aa);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_db4932603c9f24eb);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &kill_all_zombies);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_5e521f045efe7ec2);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x401
// Size: 0xb0
function function_83dcd153ba762bfa() {
    /#
        arr = [];
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        arr["<unknown string>"] = "<unknown string>";
        return arr;
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0xec
function function_5e521f045efe7ec2(params) {
    /#
        if (!isdefined(params) || !isdefined(params[0])) {
            iprintlnbold("<unknown string>");
            return;
        }
        bb_variable = params[0];
        value = default_to(params[1], 1);
        value_type = default_to(params[2], "<unknown string>");
        switch (value_type) {
        case #"hash_4730906c2f53f03e":
            value = int(value);
            break;
        case #"hash_3e4a6f464c850b65":
            value = float(value);
            break;
        case #"hash_2ac140ce3b5ea398":
            value = string(value);
            break;
        }
        closest_ai = function_6d1fbda4b8524ef2(level.players[0].origin);
        if (!isdefined(closest_ai)) {
            return;
        }
        closest_ai function_3e89eb3d8e3f1811(bb_variable, value);
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5ab
// Size: 0xab
function private function_6aca4fbb47b31a61(params) {
    /#
        new_speed = params[0];
        id_name = params[1];
        priority = int(params[2]);
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            zombie function_f1e5805da192a1ef(new_speed, id_name, priority);
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x65d
// Size: 0x7a
function private function_79e6bc2cbae5a949() {
    /#
        player = level.players[0];
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        var_fdec05e6675e0c8a = closest_zombie getclosestreachablepointonnavmesh(player.origin);
        closest_zombie setbtgoalpos(0, var_fdec05e6675e0c8a);
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6de
// Size: 0x91
function private function_1aaf94b6b4be4ec4(params) {
    /#
        player = level.players[0];
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        if (istrue(closest_zombie.enablebite)) {
            closest_zombie request_bite(player);
            return;
        }
        if (istrue(closest_zombie.enablemelee)) {
            closest_zombie request_melee(player);
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x776
// Size: 0x165
function private function_a252e2eb60d04623(params) {
    /#
        aitype = params[0];
        subclass = params[0];
        team = params[1];
        if (isdefined(level.var_f6c271f9f2c0fd8[subclass])) {
            aitype = level.var_f6c271f9f2c0fd8[subclass][0];
        }
        if (!string_starts_with(aitype, "<unknown string>")) {
            aitype = "<unknown string>" + aitype;
        }
        if (!isdefined(level.agent_definition[aitype])) {
            println("<unknown string>" + aitype + "<unknown string>");
            return;
        }
        origin = function_9b4c82dba041b23d();
        if (isdefined(origin)) {
            player = level.players[0];
            team = default_to(team, "<unknown string>");
            ai = scripts/mp/mp_agent::spawnnewagentaitype(aitype, origin, (0, 0, 0), team);
            if (isdefined(ai) && getdvarint(@"hash_6c38ce1320bfb98f", 0)) {
                var_5bb577a0f2f9e0d3 = getdvar(@"hash_ad84b507251e9ec8", "<unknown string>");
                if (ai function_8fa69650e33c84ef(var_5bb577a0f2f9e0d3)) {
                    origin = getgroundposition(origin, 32, 720, 100);
                    ai thread function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "<unknown string>", origin, (0, 0, 0), "<unknown string>");
                }
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8e2
// Size: 0x26
function private function_233d42b214d5a6cd() {
    /#
        iprintln("<unknown string>");
        function_2fb888667001fc39("<unknown string>", @"hash_6c38ce1320bfb98f");
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x90f
// Size: 0x8a
function private function_958e5c5cb15de054(params) {
    /#
        duration = float(params[0]);
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            zombie function_2e4d3c67e63f83ac(duration);
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9a0
// Size: 0x68
function private function_cacc6088d6b42b34() {
    /#
        player = level.players[0];
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        closest_zombie = get_array_of_closest(player.origin, zombies)[0];
        closest_zombie function_e96aac065abbec4e(player.origin);
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa0f
// Size: 0xb1
function private function_e4acd0ee95b2b171() {
    /#
        player = level.players[0];
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        zombies_sorted = get_array_of_closest(player.origin, zombies);
        foreach (zombie in zombies_sorted) {
            if (!zombie ent_flag("<unknown string>")) {
                zombie function_ca27630def7b7aad(player);
                return;
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xac7
// Size: 0x10e
function private function_bb2c7a7d908691b3() {
    /#
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        foreach (ai in ai_sorted) {
            if (isdefined(ai)) {
                asm_state = "<unknown string>";
                if (ai asmhasstate(ai.asmname, asm_state)) {
                    if (istrue(ai function_3c1b4ff1cb5f468d(player.origin, getdvarfloat(@"hash_dcef59d374174d79", 30000)))) {
                        return;
                    }
                    return;
                }
                asm_state = "<unknown string>";
                if (ai asmhasstate(ai.asmname, asm_state)) {
                    ai function_360874d9808f0724();
                    ai function_ac90fa5cc0a80298(asm_state);
                    return;
                }
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbdc
// Size: 0xcd
function private ragdoll_all(params) {
    /#
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        foreach (ai in ai_sorted) {
            if (isdefined(ai)) {
                ai kill();
                corpse = ai getcorpseentity();
                corpse startragdollfromimpact("<unknown string>", (0, 0, 100));
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcb0
// Size: 0xfb
function private function_168f04942cd64395(params) {
    /#
        player = level.players[0];
        all_ai = getaiarray();
        ai_sorted = get_array_of_closest(player.origin, all_ai);
        hitloc = params[0];
        bone = params[1];
        if (!isdefined(hitloc) || !isdefined(bone)) {
            return;
        }
        foreach (ai in ai_sorted) {
            if (isdefined(ai) && isalive(ai)) {
                ai kill();
                body = ai getcorpseentity();
                if (isdefined(body)) {
                    body thread function_bf2edfaccb048554(hitloc, bone);
                    return;
                }
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdb2
// Size: 0x12a
function private function_bf2edfaccb048554(hitloc, bone) {
    /#
        self endon("<unknown string>");
        self startragdoll();
        waitframe();
        if (!isdefined(level.var_c73bfa3a0535c023)) {
            level.var_c73bfa3a0535c023 = [];
        }
        if (!isdefined(level.var_dd0a1e7ffd4586d5)) {
            level.var_dd0a1e7ffd4586d5 = [];
        }
        mover = spawn_tag_origin(self.origin + (0, 0, 64), self.angles);
        constraint = spawnragdollconstraint(self, hitloc, bone, (0, 0, 0), 0);
        constraint.origin = mover.origin;
        constraint.angles = mover.angles;
        constraint linkto(mover);
        level.var_c73bfa3a0535c023[level.var_c73bfa3a0535c023.size] = constraint;
        level.var_dd0a1e7ffd4586d5[level.var_dd0a1e7ffd4586d5.size] = mover;
        mover moveto(mover.origin + (0, 0, 16), 3);
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xee3
// Size: 0xd2
function private function_7d5de5e77bc3e95d() {
    /#
        if (isdefined(level.var_dd0a1e7ffd4586d5)) {
            foreach (mover in level.var_dd0a1e7ffd4586d5) {
                if (isdefined(mover)) {
                    mover delete();
                }
            }
        }
        if (isdefined(level.var_c73bfa3a0535c023)) {
            foreach (constraint in level.var_c73bfa3a0535c023) {
                if (isdefined(constraint)) {
                    constraint delete();
                }
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xfbc
// Size: 0x9b
function private function_b4ecf2809c2b8328(params) {
    /#
        player_index = int(params[0]);
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            zombie function_a047f71d0256058b(level.players[player_index], "<unknown string>", 1);
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x105e
// Size: 0x7f
function private kill_all_zombies() {
    /#
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            if (!isdefined(zombie) || !isalive(zombie)) {
                continue;
            }
            zombie kill();
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10e4
// Size: 0x10f
function private function_789810fa398850aa() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_d95010ddcdec6c36");
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            if (isalive(zombie) && getdvarint(@"hash_d95010ddcdec6c36", 0) <= 0) {
                zombie._blackboard.var_2ad5368672cc47ba = 0;
                zombie setbtgoalpos(0, zombie.origin);
                continue;
            }
            if (isalive(zombie) && getdvarint(@"hash_d95010ddcdec6c36", 0) <= 1) {
                zombie._blackboard.var_2ad5368672cc47ba = zombie.zombieaisettings.var_106f0eccad94d9fa;
            }
        }
    #/
}

// Namespace namespace_e5049f73842ac360 / namespace_85d29b89b454cb3b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11fa
// Size: 0xc0
function private function_db4932603c9f24eb() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_3e9837d038eef96f");
        zombies = getaispeciesarray("<unknown string>", "<unknown string>");
        foreach (zombie in zombies) {
            if (isalive(zombie) && getdvarint(@"hash_3e9837d038eef96f", 0) <= 0) {
                zombie val::set("<unknown string>", "<unknown string>", 0);
                continue;
            }
            zombie val::reset("<unknown string>", "<unknown string>");
        }
    #/
}

