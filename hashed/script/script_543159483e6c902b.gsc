// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_3a9930dfe832ae05;
#using script_2590b7a7de3dfc79;
#using scripts\mp\outofbounds.gsc;
#using script_58be75c518bf0d40;
#using script_638d701d263ee1ed;

#namespace namespace_313fdf6399ae3408;

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x58
function function_bf1fbf65d3f8b503() {
    namespace_2520ec51681db245::init(&namespace_301533d2f1378cb9::function_8c80bfd5eb313b22, &namespace_301533d2f1378cb9::function_be68f708692f876f);
    root = function_ecdae672c660149e();
    root.var_29e4cb253683279f = &function_4e42a84f95b79cb0;
    root.var_4e1cce72cf8d8f63 = &function_bf0dace86671499b;
    root.var_d476bc08981505b4 = &function_c23cf1e91ae6319f;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fc
// Size: 0xb1
function private function_4e42a84f95b79cb0(params) {
    /#
        /#
            assert(self == level);
        #/
    #/
    if (!istrue(namespace_2520ec51681db245::function_96e1cf53bdd43f1c(params))) {
        return 0;
    }
    player = params.eattacker;
    if (!isplayer(player)) {
        return 0;
    }
    var_cd10c6beaeb6db69 = player function_25826d6baf7d0387();
    var_f1125f60759a155c = player function_4cfba9113145908e();
    var_cd10c6beaeb6db69.var_806329fdd4078863++;
    var_cdcc412515151986 = isdefined(level.var_7f2e8af1175e5aa5) || var_cd10c6beaeb6db69.var_806329fdd4078863 >= var_f1125f60759a155c;
    if (var_cdcc412515151986) {
        var_cd10c6beaeb6db69.var_806329fdd4078863 = 0;
    }
    return var_cdcc412515151986;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b5
// Size: 0x4e
function private function_bf0dace86671499b(params) {
    if (isai(self) && (istrue(self.var_7a605ee6cf55d136) || istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa))) {
        return 0;
    }
    if (namespace_d9c77dc2a6fe29c6::istouchingoobtrigger()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0xaf
function private function_c23cf1e91ae6319f() {
    var_60f89df29738f118 = namespace_ca7b90256548aa40::getsquadmembers(self.team, 1);
    if (isarray(var_60f89df29738f118) && var_60f89df29738f118.size > 0) {
        return var_60f89df29738f118;
    }
    var_60f89df29738f118 = [];
    foreach (player in level.players) {
        if (isalive(player) && self.team == player.team) {
            var_60f89df29738f118 = array_add(var_60f89df29738f118, player);
        }
    }
    return var_60f89df29738f118;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c2
// Size: 0x8b
function private function_25826d6baf7d0387() {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_c68edffe25b4f7bc)) {
        root.var_c68edffe25b4f7bc = [];
    }
    var_2c5acd47a263fae3 = function_2dd375b88b7390ce();
    if (!isdefined(root.var_c68edffe25b4f7bc[var_2c5acd47a263fae3])) {
        root.var_c68edffe25b4f7bc[var_2c5acd47a263fae3] = spawnstruct();
        root.var_c68edffe25b4f7bc[var_2c5acd47a263fae3].var_806329fdd4078863 = 0;
    }
    return root.var_c68edffe25b4f7bc[var_2c5acd47a263fae3];
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x455
// Size: 0x1c
function private function_2dd375b88b7390ce() {
    return self.team + "_" + self.var_ff97225579de16a;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x479
// Size: 0x96
function private function_4cfba9113145908e() {
    range = function_16bfed565cfac7c4();
    var_2f8a12ff9fed4bcf = undefined;
    if (range["max"] != 0 || range["min"] != 0) {
        if (range["max"] > range["min"]) {
            var_2f8a12ff9fed4bcf = function_1652f8a8050283bd(range["min"], range["max"]);
        } else {
            root = function_ecdae672c660149e();
            /#
                assertmsg("Drop Event Number Max (Per Player) value should be greater than Min in " + root.var_8487d1e9569b89de + ". Please update in APE.");
            #/
        }
    }
    return var_2f8a12ff9fed4bcf;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x517
// Size: 0x1a5
function private function_16bfed565cfac7c4() {
    drop_event_ranges = function_edeba0070ca0709e("drop_event_ranges");
    /#
        assert(isarray(drop_event_ranges) && drop_event_ranges.size > 0, "No drop event number range is set");
    #/
    var_a569ba5777d4e941 = function_53c4c53197386572(function_edeba0070ca0709e("drop_event_incremental_number_per_player"), 0);
    players = function_c23cf1e91ae6319f();
    n_players = players.size;
    var_6e2717077402378 = function_69b4026f881d6f0b();
    var_fdea3a140966239a = 999;
    var_6ecee421896fb7cd = 990;
    var_63f635ee86eb782b = 999;
    foreach (var_d3fa0603d7527d84 in drop_event_ranges) {
        if (isdefined(var_d3fa0603d7527d84.str_label) && var_d3fa0603d7527d84.str_label != var_6e2717077402378) {
            continue;
        }
        var_51d39efba2a8cde6 = abs(var_d3fa0603d7527d84.n_players - n_players);
        if (var_51d39efba2a8cde6 < var_fdea3a140966239a) {
            var_a4b73720a63b8b73 = (n_players - var_d3fa0603d7527d84.n_players) * var_a569ba5777d4e941;
            var_6ecee421896fb7cd = var_d3fa0603d7527d84.n_min + var_a4b73720a63b8b73;
            var_63f635ee86eb782b = var_d3fa0603d7527d84.n_max + var_a4b73720a63b8b73;
            var_fdea3a140966239a = var_51d39efba2a8cde6;
        }
    }
    range = [];
    range["min"] = int(var_6ecee421896fb7cd);
    range["max"] = int(var_63f635ee86eb782b);
    return range;
}

// Namespace namespace_313fdf6399ae3408/namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6c4
// Size: 0x12b
function private function_69b4026f881d6f0b() {
    players = function_c23cf1e91ae6319f();
    var_8c3c81896e2e6f60 = [];
    foreach (player in players) {
        r = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
        if (!isdefined(var_8c3c81896e2e6f60[r])) {
            var_8c3c81896e2e6f60[r] = 0;
        }
        var_8c3c81896e2e6f60[r]++;
    }
    var_f3553b8c4c0a8747 = 0;
    var_6e2717077402378 = "";
    foreach (var_168c108518d4bac9, var_cdd53978f51f62cb in var_8c3c81896e2e6f60) {
        if (var_cdd53978f51f62cb > var_f3553b8c4c0a8747) {
            var_f3553b8c4c0a8747 = var_cdd53978f51f62cb;
            var_6e2717077402378 = var_168c108518d4bac9;
        }
    }
    if (var_6e2717077402378 == "" || var_6e2717077402378 == "difficulty_undefined") {
        /#
            iprintlnbold("<unknown string>");
        #/
        var_6e2717077402378 = "difficulty_easy";
    }
    return var_6e2717077402378;
}

