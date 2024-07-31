#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\powerups.gsc;
#using script_3a9930dfe832ae05;
#using script_2590b7a7de3dfc79;
#using scripts\mp\outofbounds.gsc;
#using script_58be75c518bf0d40;
#using script_638d701d263ee1ed;

#namespace ob_powerups;

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x152
// Size: 0x58
function function_bf1fbf65d3f8b503() {
    namespace_2520ec51681db245::init(&namespace_301533d2f1378cb9::function_8c80bfd5eb313b22, &namespace_301533d2f1378cb9::function_be68f708692f876f);
    root = function_ecdae672c660149e();
    root.var_29e4cb253683279f = &function_4e42a84f95b79cb0;
    root.var_4e1cce72cf8d8f63 = &function_bf0dace86671499b;
    root.var_d476bc08981505b4 = &function_c23cf1e91ae6319f;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1b2
// Size: 0xae
function private function_4e42a84f95b79cb0(params) {
    assert(self == level);
    if (!istrue(namespace_2520ec51681db245::function_96e1cf53bdd43f1c(params))) {
        return 0;
    }
    player = params.eattacker;
    if (!isplayer(player)) {
        return 0;
    }
    powerups_info = player function_25826d6baf7d0387();
    var_f1125f60759a155c = player function_4cfba9113145908e();
    powerups_info.var_806329fdd4078863++;
    var_cdcc412515151986 = isdefined(level.var_7f2e8af1175e5aa5) || powerups_info.var_806329fdd4078863 >= var_f1125f60759a155c;
    if (var_cdcc412515151986) {
        powerups_info.var_806329fdd4078863 = 0;
    }
    return var_cdcc412515151986;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x269
// Size: 0x4d
function private function_bf0dace86671499b(params) {
    if (isai(self) && (istrue(self.var_7a605ee6cf55d136) || istrue(self.var_7e4b076a06c6df27) || istrue(self.var_a9cfabe3e558f7fa))) {
        return false;
    }
    if (scripts\mp\outofbounds::istouchingoobtrigger()) {
        return false;
    }
    return true;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2bf
// Size: 0xac
function private function_c23cf1e91ae6319f() {
    a_members = namespace_ca7b90256548aa40::getsquadmembers(self.team, 1);
    if (isarray(a_members) && a_members.size > 0) {
        return a_members;
    }
    a_members = [];
    foreach (player in level.players) {
        if (isalive(player) && self.team == player.team) {
            a_members = array_add(a_members, player);
        }
    }
    return a_members;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x374
// Size: 0x8a
function private function_25826d6baf7d0387() {
    root = function_ecdae672c660149e();
    if (!isdefined(root.var_c68edffe25b4f7bc)) {
        root.var_c68edffe25b4f7bc = [];
    }
    squad_id = function_2dd375b88b7390ce();
    if (!isdefined(root.var_c68edffe25b4f7bc[squad_id])) {
        root.var_c68edffe25b4f7bc[squad_id] = spawnstruct();
        root.var_c68edffe25b4f7bc[squad_id].var_806329fdd4078863 = 0;
    }
    return root.var_c68edffe25b4f7bc[squad_id];
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x407
// Size: 0x1b
function private function_2dd375b88b7390ce() {
    return self.team + "_" + self.sessionsquadid;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x42b
// Size: 0x94
function private function_4cfba9113145908e() {
    range = function_16bfed565cfac7c4();
    var_2f8a12ff9fed4bcf = undefined;
    if (range["max"] != 0 || range["min"] != 0) {
        if (range["max"] > range["min"]) {
            var_2f8a12ff9fed4bcf = function_1652f8a8050283bd(range["min"], range["max"]);
        } else {
            root = function_ecdae672c660149e();
            assertmsg("<dev string:x1c>" + root.var_8487d1e9569b89de + "<dev string:x67>");
        }
    }
    return var_2f8a12ff9fed4bcf;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4c8
// Size: 0x198
function private function_16bfed565cfac7c4() {
    drop_event_ranges = function_edeba0070ca0709e("drop_event_ranges");
    assert(isarray(drop_event_ranges) && drop_event_ranges.size > 0, "<dev string:x82>");
    var_a569ba5777d4e941 = default_to(function_edeba0070ca0709e("drop_event_incremental_number_per_player"), 0);
    players = function_c23cf1e91ae6319f();
    n_players = players.size;
    region_label = function_69b4026f881d6f0b();
    var_fdea3a140966239a = 999;
    min_number = 990;
    max_number = 999;
    foreach (der in drop_event_ranges) {
        if (isdefined(der.str_label) && der.str_label != region_label) {
            continue;
        }
        player_diff = abs(der.n_players - n_players);
        if (player_diff < var_fdea3a140966239a) {
            extra_number = (n_players - der.n_players) * var_a569ba5777d4e941;
            min_number = der.n_min + extra_number;
            max_number = der.n_max + extra_number;
            var_fdea3a140966239a = player_diff;
        }
    }
    range = [];
    range["min"] = int(min_number);
    range["max"] = int(max_number);
    return range;
}

// Namespace ob_powerups / namespace_3dec7d4a7b9c6fa1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x669
// Size: 0x121
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
    region_label = "";
    foreach (region_name, rp in var_8c3c81896e2e6f60) {
        if (rp > var_f3553b8c4c0a8747) {
            var_f3553b8c4c0a8747 = rp;
            region_label = region_name;
        }
    }
    if (region_label == "" || region_label == "difficulty_undefined") {
        /#
            iprintlnbold("<dev string:xa7>");
        #/
        region_label = "difficulty_easy";
    }
    return region_label;
}

