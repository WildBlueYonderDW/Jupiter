// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\rank.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_48814951e916af89;
#using script_252fa7d2b1b1b50b;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\points.gsc;
#using script_371b4c2ab5861e62;
#using script_21c19cfc7139d773;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_5238dee479bbf7fb;
#using script_55e418c5cc946593;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\challenges.gsc;
#using script_38eb8f4be20d54f4;

#namespace namespace_8b4dfd90ae2d6d57;

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9af
// Size: 0x3
function __init() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x9b9
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("dataheist", &init);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d4
// Size: 0xf6
function init(config) {
    var_bd00ebb44a0208e0 = spawnstruct();
    var_bd00ebb44a0208e0.validatefunc = &function_ff2f2144ced4051a;
    var_bd00ebb44a0208e0.waitfunc = &function_259becae806189d;
    var_bd00ebb44a0208e0.activatefunc = &function_dce158cd5558c35d;
    var_bd00ebb44a0208e0.var_c9e871d29702e8cf = &function_de40a46baab733f5;
    var_bd00ebb44a0208e0.var_f4fd1f55ec89ded = &function_862bce27f6c70842;
    var_bd00ebb44a0208e0.weight = config.weight;
    var_bd00ebb44a0208e0.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_bd00ebb44a0208e0.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_bd00ebb44a0208e0.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("dataheist");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_bd00ebb44a0208e0, "dataheist");
    namespace_d76af9f804655767::registerpublicevent(8, var_bd00ebb44a0208e0);
    function_f1aed36ab4598ea("wz_pe_dataheist");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad1
// Size: 0xd2
function function_de40a46baab733f5() {
    init_dvars(self);
    function_6e94141d9de9568d(self);
    level thread init_ai(self);
    function_d9c64c99bd5f47a0();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("br_pe_dataheist_uplink_useable", &function_533c18ee02139b7e);
    namespace_62c556437da28f50::registerscoreinfo(#"br_pe_capNode", #"value", 1000);
    self.var_5790067a8a484040 = [];
    self.var_5790067a8a484040[0] = "default";
    self.var_5790067a8a484040[1] = "downloading";
    self.var_5790067a8a484040[2] = "interference";
    self.var_5790067a8a484040[3] = "blocked";
    /#
        level thread debug_init();
        setdvarifuninitialized(@"hash_31426ea35497080f", 0);
        setdvarifuninitialized(@"hash_8326c0fb793ffe45", "dths_grav_dhas");
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbaa
// Size: 0x4dc
function init_dvars(event_data) {
    team_size = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    switch (team_size) {
    case 1:
        event_data.var_a1579dc24e9412dd = 50;
        event_data.var_78fd234febf0416a = 3;
        event_data.var_7df9fdb99d27a28b = 4;
        break;
    case 2:
        event_data.var_a1579dc24e9412dd = 50;
        event_data.var_78fd234febf0416a = 3;
        event_data.var_7df9fdb99d27a28b = 4;
        break;
    case 3:
        event_data.var_a1579dc24e9412dd = 60;
        event_data.var_78fd234febf0416a = 4;
        event_data.var_7df9fdb99d27a28b = 3;
        break;
    case 4:
    default:
        event_data.var_a1579dc24e9412dd = 60;
        event_data.var_78fd234febf0416a = 4;
        event_data.var_7df9fdb99d27a28b = 3;
        break;
    }
    var_cca5fc6c8ed8be7f = getdvarint(@"hash_193a2e0ce733e6d1", 0);
    if (var_cca5fc6c8ed8be7f > -1) {
        event_data.var_78fd234febf0416a = var_cca5fc6c8ed8be7f;
    }
    event_data.var_a1579dc24e9412dd = getdvarint(@"hash_dc4cb3509e8702a4", event_data.var_a1579dc24e9412dd);
    event_data.var_7df9fdb99d27a28b = getdvarint(@"hash_6b8529ae11c8c7f6", event_data.var_7df9fdb99d27a28b);
    event_data.var_9e852ac0876c3bbe = [0:0.25];
    function_c1150641505df131();
    event_data.var_453503008f1b0d85 = getdvarint(@"hash_f1bec911a034dce4", 1500);
    event_data.var_adc5129ff19a0342 = squared(event_data.var_453503008f1b0d85);
    event_data.var_cc79ec8ec36334d3 = getdvarint(@"hash_3fe660588b6f40ce", 5000);
    event_data.var_a355ae253087e6ec = squared(event_data.var_cc79ec8ec36334d3);
    event_data.var_6dc1e20d4411f853 = getdvarint(@"hash_63a6751a902ecaec", 750);
    event_data.var_ad5deff214441f02 = getdvarint(@"hash_ebb538de66a9395", 500);
    event_data.var_1de3f81c4507840 = getdvarint(@"hash_c70440c743bc72f1", 1) == 1;
    event_data.var_76013aa23b2588d8 = getdvarint(@"hash_36db07fd99bb9b31", 1) == 1;
    event_data.var_f2f4664f784bb1b0 = getdvarint(@"hash_9ec61cfa337dc3e1", 1000);
    event_data.var_f6769d2b85aaf27e = int(max(1, getdvarint(@"hash_3b2ad4cc6d705455", 300)));
    event_data.var_f25b6e5894571eb2 = event_data.var_f6769d2b85aaf27e + event_data.var_a1579dc24e9412dd;
    event_data.var_160294b506c51a7c = getdvarint(@"hash_86aca5c7cdaf36b5", 4000);
    event_data.var_c740830cdb73800e = int(max(1, getdvarint(@"hash_f33906ab457ed275", 3)));
    event_data.var_5dfa1429cddcbc96 = int(max(1, getdvarint(@"hash_e87df641ad60dfbd", 3)));
    event_data.var_c5f1eb4d167935 = 1 / event_data.var_5dfa1429cddcbc96;
    event_data.var_80242dc777bb3f8 = getdvarint(@"hash_c70caafa18fe870f", 240);
    event_data.var_8b248d86225e95c5 = getdvarint(@"hash_ae3ec08cd03905e0", 50);
    event_data.var_62f375887033841f = getdvarint(@"hash_f63bb46f84687aac", 500);
    event_data.var_8fae2a4c66da64c0 = getdvarint(@"hash_8dbf9e06474b2ba7", 1) == 1;
    event_data.var_7e9fd2d078543358 = getdvarint(@"hash_17b8716c1c9ca6ff", 1);
    event_data.var_d03b16e4339a4546 = getdvarint(@"hash_9e246216c8ab73cd", 2);
    event_data.var_5b470c719e713baa = getdvarint(@"hash_d1254cb3a6456cd3", 3);
    event_data.var_3b2fe32897ffd722 = getdvarint(@"hash_6f20a3b0bc339fcb", 2);
    event_data.var_b9f9031320c76aa6 = getdvarfloat(@"hash_743f2aafce01b00d", 0.4);
    event_data.var_464ff1ef779c439d = getdvarint(@"hash_8a328fc0a8b887e4", 8);
    event_data.var_4febd27038048ffb = getdvarint(@"hash_89e40bcff5370f82", 120);
    event_data.var_94b952789d039abb = getdvarint(@"hash_5b21ed44f9d400", 1) == 1;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108d
// Size: 0xe1
function function_c1150641505df131() {
    var_f087e13b64fb79ca = getdvar(@"hash_4675782a74d204dc");
    if (isdefined(var_f087e13b64fb79ca) && var_f087e13b64fb79ca != "") {
        var_4976eafad6c14c36 = [];
        tokens = strtok(var_f087e13b64fb79ca, ",", 0);
        foreach (token in tokens) {
            threshold = float(token);
            if (!isfloat(threshold)) {
                /#
                    println("dataheist_ai_spawn" + token + "br_ftue_dataheist");
                #/
            } else {
                var_4976eafad6c14c36[var_4976eafad6c14c36.size] = threshold;
            }
        }
        if (var_4976eafad6c14c36.size > 0) {
            self.var_9e852ac0876c3bbe = var_4976eafad6c14c36;
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1175
// Size: 0x25e
function function_6e94141d9de9568d(event_data) {
    var_adabc9f186b54e6a = [];
    id = 0;
    var_ee2cfbb2d478e835 = getstructarray("dataheist_uplink_location", "script_noteworthy");
    foreach (struct in var_ee2cfbb2d478e835) {
        var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df(struct.origin, struct.angles, struct.group, id));
        id++;
    }
    if (var_adabc9f186b54e6a.size <= 0) {
        switch (level.mapname) {
        case #"hash_71c69de1abae3a2":
        case #"hash_4aa5d6e97851bdbd":
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((-471, -1886, 25), (0, 180, 0), "none", 0));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((-367, -811, 25), (0, 180, 0), "none", 1));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((704, -2767, 25), (0, 270, 0), "none", 2));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((1970, -4096, 25), (0, 270, 0), "none", 3));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((3077, -2300, 25), (0, 180, 0), "none", 4));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((2935, 59, 25), (0, 0, 0), "none", 5));
            var_adabc9f186b54e6a = array_add(var_adabc9f186b54e6a, function_c82760fff0dc45df((5015, -674, 25), (0, 0, 0), "none", 6));
            break;
        }
    }
    event_data.var_adabc9f186b54e6a = var_adabc9f186b54e6a;
    /#
        event_data function_24afcbb2ea0ccb49(event_data.var_f6769d2b85aaf27e);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13da
// Size: 0xaf
function function_c82760fff0dc45df(origin, angles, group, id) {
    point = spawnstruct();
    point.origin = origin;
    point.angles = angles;
    point.group = group;
    point.id = id;
    if (!isdefined(group)) {
        point.group = "none";
    }
    if (!isdefined(id)) {
        id = -1;
    }
    point.used = 0;
    point.is_valid = 0;
    point.var_927206bdb3f7000d = [];
    return point;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1491
// Size: 0x4f
function init_ai(event_data) {
    level endon("game_ended");
    if (event_data.var_78fd234febf0416a < 1) {
        return;
    }
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    namespace_bfef6903bca5845d::function_ba4022744dce59f6("dataheist", event_data.var_8b248d86225e95c5);
    namespace_8d9453d94dd4f401::function_b146e2b40516b668("dataheist");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e7
// Size: 0x10d
function function_d9c64c99bd5f47a0() {
    game["dialog"]["dataheist_event_start"] = "dths_grav_dhes";
    game["dialog"]["dataheist_comp_success"] = "dths_grav_dhcs";
    game["dialog"]["dataheist_comp_failure"] = "dths_grav_dhcf";
    game["dialog"]["dataheist_team_act_uplink"] = "dths_grav_dtap";
    game["dialog"]["dataheist_enemy_act_uplink"] = "dths_grav_dhnp";
    game["dialog"]["dataheist_enemy_cap_uplink"] = "dths_grav_dhnc";
    game["dialog"]["dataheist_team_cap_uplink"] = "dths_grav_dhtc";
    game["dialog"]["dataheist_ai_spawn"] = "dths_grav_dhas";
    game["dialog"]["dataheist_enemy_block_down"] = "dths_grav_debd";
    game["dialog"]["dataheist_out_range"] = "dths_grav_dhtr";
    game["dialog"]["dataheist_team_comp_uplink"] = "dths_grav_dhtp";
    game["dialog"]["dataheist_enemy_comp_uplink"] = "dths_grav_nmsn";
    game["dialog"]["dataheist_enemy_comp_lost_uplink"] = "dths_grav_dhnl";
    game["dialog"]["dataheist_time_warn"] = "dths_grav_dhtw";
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fb
// Size: 0x3
function function_23b03b3f109ab44d() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1605
// Size: 0x21
function function_ff2f2144ced4051a() {
    if (!namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return 0;
    }
    if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() != "resurgence") {
        return 0;
    }
    return 1;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162e
// Size: 0x3
function function_259becae806189d() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0x554
function function_dce158cd5558c35d() {
    /#
        assertex(self.var_a1579dc24e9412dd > 0, "Dataheist Error: Capture time must be greater than 0");
    #/
    self endon("event_deactivated");
    /#
        function_7b885b4b79b662b9();
    #/
    self.var_8d20f50b331db1f5 = [];
    self.var_fa407070d9ab9ada = [];
    thread function_cdb11d6d4ce247ea();
    namespace_d76af9f804655767::showsplashtoall("br_pe_dataheist_start", "splash_list_br_pe_dataheist");
    setomnvar("ui_minimap_pulse", 1);
    setomnvar("ui_publicevent_timer_type", 6);
    var_f6769d2b85aaf27e = self.var_f6769d2b85aaf27e;
    if (!level.br_circle_disabled) {
        var_f6769d2b85aaf27e = min(self.var_f6769d2b85aaf27e, namespace_c5622898120e827f::function_abbfb4d18d1a9ca7() - 5);
    }
    self.end_time = gettime() + var_f6769d2b85aaf27e * 1000;
    self.warning_time = self.end_time - 30000;
    setomnvar("ui_publicevent_timer", self.end_time);
    function_24afcbb2ea0ccb49(var_f6769d2b85aaf27e);
    var_2f1f2bd8531e8866 = getdvar(@"hash_8326c0fb793ffe45", "");
    var_11cb71dbfd7f944e = function_671cc803581d0e65(var_2f1f2bd8531e8866);
    points = [];
    if (var_11cb71dbfd7f944e.size > 0) {
        foreach (point_index in var_11cb71dbfd7f944e) {
            points[points.size] = self.var_adabc9f186b54e6a[point_index];
        }
    } else {
        var_ff9e6fbb61b45590 = function_45a890c985d26276();
        if (var_ff9e6fbb61b45590.size <= 0) {
            /#
                iprintlnbold("<unknown string>");
            #/
            level thread namespace_d76af9f804655767::function_2907d01a7d692108(8);
            return;
        }
        points[0] = random(var_ff9e6fbb61b45590);
        var_6906d84db2a3bc80 = array_randomize(points[0].var_927206bdb3f7000d);
        for (i = 0; i < self.var_c740830cdb73800e - 1; i++) {
            points[i + 1] = var_6906d84db2a3bc80[i];
        }
    }
    foreach (point in points) {
        thread function_e2125c5400cc5bf3(point);
    }
    self.midpoint = (0, 0, 0);
    foreach (point in points) {
        self.midpoint = self.midpoint + point.origin;
    }
    self.midpoint = self.midpoint / points.size;
    var_c27aa5edd70a0762 = 0;
    foreach (point in points) {
        dist_sq = distance2dsquared(self.midpoint, point.origin);
        if (dist_sq > var_c27aa5edd70a0762) {
            var_c27aa5edd70a0762 = dist_sq;
        }
    }
    self.var_59ea6b2ef4905653 = sqrt(var_c27aa5edd70a0762) + self.var_f2f4664f784bb1b0;
    if (self.var_1de3f81c4507840) {
        circle_radius = max(sqrt(var_c27aa5edd70a0762) + 250, self.var_160294b506c51a7c);
        self.var_9852072496d7f7e = function_dc11c1caffe56e16("Dataheist_Br", self.midpoint[0], self.midpoint[1], circle_radius, undefined);
        self.var_9852072496d7f7e show();
        if (self.var_f2f4664f784bb1b0 > self.var_6dc1e20d4411f853) {
            thread function_54539d559adc405c();
        }
        if (self.var_76013aa23b2588d8) {
            thread function_e6b8718faa7f2edf();
        }
    }
    /#
        if (getdvarint(@"hash_31426ea35497080f", 0) == 1) {
            function_29327b1833cde79e();
        }
    #/
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_60fdeceea0c7a20e);
    thread function_2b9e294b137a88d1();
    thread function_518af9f5c4bcde52(var_f6769d2b85aaf27e - 30);
    if (self.var_94b952789d039abb) {
        thread function_e86f6c7b0f5447e2();
    }
    function_e8ce5f018d2b942c("dataheist_event_start", 1);
    waittill_any_timeout_1(var_f6769d2b85aaf27e, "all_uplinks_complete");
    winners = [];
    var_93b3b06a17cc437b = [];
    foreach (player in level.players) {
        if (function_8d72849f49068945(player.team) > 0) {
            winners[winners.size] = player;
        } else {
            var_93b3b06a17cc437b[var_93b3b06a17cc437b.size] = player;
        }
    }
    function_63bdbc18191be5f9("dataheist_comp_success", winners, 0.5);
    function_63bdbc18191be5f9("dataheist_comp_failure", var_93b3b06a17cc437b, 0.5);
    level thread namespace_d76af9f804655767::function_2907d01a7d692108(8);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b93
// Size: 0xcf
function function_862bce27f6c70842() {
    /#
        function_1497224a9c74808b();
    #/
    namespace_d76af9f804655767::showsplashtoall("br_pe_dataheist_end", "splash_list_br_pe_dataheist");
    namespace_bfef6903bca5845d::function_66a6064fad612bf3(&function_60fdeceea0c7a20e);
    if (isdefined(self.var_9852072496d7f7e)) {
        self.var_9852072496d7f7e delete();
    }
    foreach (uplink in self.var_8d20f50b331db1f5) {
        uplink function_cdb8ea404983a187();
    }
    self.var_8d20f50b331db1f5 = undefined;
    self.var_fa407070d9ab9ada = undefined;
    setomnvar("ui_minimap_pulse", 0);
    setomnvar("ui_publicevent_timer_type", 0);
    self notify("event_deactivated");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c69
// Size: 0x42
function function_2b9e294b137a88d1() {
    level endon("game_ended");
    self endon("event_deactivated");
    for (i = 0; i < self.var_8d20f50b331db1f5.size; i++) {
        self waittill("uplink_complete");
    }
    self notify("all_uplinks_complete");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb2
// Size: 0x4c
function function_518af9f5c4bcde52(time) {
    level endon("game_ended");
    self endon("event_deactivated");
    wait(time);
    nearby_players = namespace_7e17181d03156026::getplayersinradius(self.midpoint, self.var_59ea6b2ef4905653);
    function_63bdbc18191be5f9("dataheist_time_warn", nearby_players);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d05
// Size: 0x13c
function function_54539d559adc405c() {
    level endon("game_ended");
    self endon("event_deactivated");
    while (1) {
        for (i = 0; i < self.var_8d20f50b331db1f5.size; i++) {
            uplink = self.var_8d20f50b331db1f5[i];
            uplink.nearby_players = namespace_7e17181d03156026::getplayersinradius(uplink.origin, self.var_f2f4664f784bb1b0);
            foreach (player in uplink.nearby_players) {
                if (isdefined(player.team) && !array_contains_key(uplink.var_cf3b62c466fc43bb, player.team)) {
                    uplink.var_cf3b62c466fc43bb[player.team] = 1;
                    if (isdefined(uplink.obj_id)) {
                        objective_addteamtomask(uplink.obj_id, player.team);
                    }
                }
            }
            wait(1);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e48
// Size: 0xe9
function function_e6b8718faa7f2edf() {
    level endon("game_ended");
    self endon("event_deactivated");
    var_5902f65b650f4a55 = 0;
    while (var_5902f65b650f4a55 < self.var_8d20f50b331db1f5.size) {
        uplink = self waittill("uplink_reveal");
        var_5902f65b650f4a55++;
        foreach (team, data in level.teamdata) {
            if (isdefined(team) && !array_contains_key(uplink.var_cf3b62c466fc43bb, team)) {
                uplink.var_cf3b62c466fc43bb[team] = 1;
                if (isdefined(uplink.obj_id)) {
                    objective_addteamtomask(uplink.obj_id, team);
                }
            }
        }
    }
    self.var_9d8c59410245296 = 1;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f38
// Size: 0xad
function function_2f06f510aff6c900(team) {
    if (istrue(self.var_9d8c59410245296)) {
        return;
    }
    foreach (uplink in self.var_8d20f50b331db1f5) {
        if (!array_contains_key(uplink.var_cf3b62c466fc43bb, team)) {
            uplink.var_cf3b62c466fc43bb[team] = 1;
            if (isdefined(uplink.obj_id)) {
                objective_addteamtomask(uplink.obj_id, team);
            }
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fec
// Size: 0x20
function function_cdb11d6d4ce247ea() {
    level endon("game_ended");
    self endon("event_deactivated");
    level waittill("cancel_public_event");
    function_862bce27f6c70842();
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2013
// Size: 0x14d
function function_da3599e311b1241a(team) {
    if (isdefined(self.var_fa407070d9ab9ada[team])) {
        self.var_fa407070d9ab9ada[team]++;
    } else {
        self.var_fa407070d9ab9ada[team] = 1;
    }
    var_c96877a325b94330 = "";
    switch (self.var_fa407070d9ab9ada[team]) {
    case 1:
        var_c96877a325b94330 = #"hash_cfddc35e5f58e75";
        break;
    case 2:
        var_c96877a325b94330 = #"hash_cfdd935e5f5895c";
        break;
    case 3:
    default:
        var_c96877a325b94330 = #"hash_cfdda35e5f58b0f";
        break;
    }
    team_players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    var_88846aeef1f75a50 = 0;
    foreach (player in team_players) {
        if (!player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            if (!var_88846aeef1f75a50) {
                player thread namespace_48a08c5037514e04::doScoreEvent(#"br_pe_capNode");
                var_88846aeef1f75a50 = 1;
            }
            player thread namespace_48a08c5037514e04::doScoreEvent(var_c96877a325b94330);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2167
// Size: 0x2c
function function_8d72849f49068945(team) {
    if (isdefined(self.var_fa407070d9ab9ada[team])) {
        return self.var_fa407070d9ab9ada[team];
    } else {
        return 0;
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x219a
// Size: 0xff
function function_60fdeceea0c7a20e(agent, attacker) {
    self endon("event_deactivated");
    category = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "category");
    if (!is_equal("dataheist", category)) {
        return;
    }
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (isdefined(self.var_8d20f50b331db1f5)) {
        foreach (uplink in self.var_8d20f50b331db1f5) {
            if (uplink.is_complete) {
                continue;
            }
            if (attacker.team == uplink.var_6bcb8569ef76541a && array_contains(uplink.agents, agent)) {
                uplink function_5e4d7ff52575526(self.var_7df9fdb99d27a28b);
            }
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a0
// Size: 0x7e
function function_e86f6c7b0f5447e2() {
    level endon("game_ended");
    wait(5);
    foreach (player in level.players) {
        if (isalive(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            player namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_dataheist");
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2325
// Size: 0x3
function function_57f7776e835d33b2() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232f
// Size: 0xb4c
function function_e2125c5400cc5bf3(var_26e940f5841ab19d) {
    /#
        /#
            assertex(isdefined(var_26e940f5841ab19d), "<unknown string>");
        #/
    #/
    level endon("game_ended");
    self endon("event_deactivated");
    var_26e940f5841ab19d.used = 1;
    uplink = spawnstruct();
    uplink.event = self;
    self.var_8d20f50b331db1f5[self.var_8d20f50b331db1f5.size] = uplink;
    uplink.is_complete = 0;
    uplink.is_active = 0;
    uplink.var_fe1d54bcb3c5043b = 0;
    uplink.var_a5d01c9b7f5297af = 0;
    uplink.time = 0;
    uplink.progress = 0;
    uplink.var_6bcb8569ef76541a = "None";
    uplink.origin = var_26e940f5841ab19d.origin;
    uplink.angles = var_26e940f5841ab19d.angles;
    uplink.agents = [];
    uplink.var_cf3b62c466fc43bb = [];
    uplink.var_ede20a7b50019dab = 0;
    uplink.var_a5d01c9b7f5297af = 0;
    uplink.var_fe1d54bcb3c5043b = 0;
    uplink.var_f64e221d661e7341 = "Uplink #" + var_26e940f5841ab19d.id + " @ " + var_26e940f5841ab19d.group;
    uplink.var_aa83c2ddc32095ed = self.var_a1579dc24e9412dd;
    uplink.var_a515d13bfdcb33f1 = [];
    uplink.obj_id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    uplink.trigger = spawn("trigger_radius", uplink.origin - (0, 0, self.var_ad5deff214441f02 * 0.5), 0, self.var_6dc1e20d4411f853, self.var_ad5deff214441f02);
    uplink.trigger.uplink = uplink;
    uplink.var_4c25f559cccbaada = [];
    uplink thread function_2bb37c482de07fd3();
    uplink.var_4c42ac43dde49b92 = 0;
    namespace_5a51aa78ea0b1b9f::add_emp_ent(uplink.trigger);
    uplink.trigger namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_88a9ce111608764a);
    uplink.trigger namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_635613a90782ee9b);
    uplink.scriptable = spawnscriptable("br_pe_dataheist_uplink", uplink.origin, uplink.angles);
    uplink.scriptable.uplink = uplink;
    if (self.var_78fd234febf0416a > 0) {
        var_dd4f509b9c56c76f = function_e27b61f74dfba712(self.var_78fd234febf0416a);
        uplink thread function_3723563cad2eb687(var_dd4f509b9c56c76f, [0:"heli", 1:"para", 2:"safe"], function_27ba596aafa69f39(1));
    }
    /#
        /#
            assertex(uplink.obj_id != -1, "<unknown string>");
        #/
    #/
    namespace_5a22b6f3a56f7e9b::objective_add_objective(uplink.obj_id, "current", uplink.origin + (0, 0, 15), "ui_map_icon_obj_dataheist_uplink");
    if (self.var_1de3f81c4507840) {
        objective_removeallfrommask(uplink.obj_id);
        objective_showtoplayersinmask(uplink.obj_id);
    }
    objective_setdescription(uplink.obj_id, "MP_BR_PE_DATAHEIST/NAME");
    objective_setbackground(uplink.obj_id, 6);
    team = uplink waittill("activated");
    self notify("uplink_reveal", uplink);
    uplink.scriptable setscriptablepartstate("br_pe_dataheist_uplink_useable", "active");
    uplink.is_active = 1;
    objective_setshowprogress(uplink.obj_id, 1);
    foreach (player in level.players) {
        objective_showprogressforclient(uplink.obj_id, player);
    }
    foreach (ent in uplink.var_4c25f559cccbaada) {
        if (isplayer(ent)) {
            objective_hideprogressforclient(uplink.obj_id, ent);
        }
    }
    uplink function_6fc077e1f039cf7(team);
    nearby_players = function_2a43e356ecd267c7(uplink.var_6bcb8569ef76541a);
    function_63bdbc18191be5f9("dataheist_team_act_uplink", nearby_players, 2);
    nearby_players = function_f8cd8b690a39bec2(uplink.var_6bcb8569ef76541a);
    function_63bdbc18191be5f9("dataheist_enemy_act_uplink", nearby_players, 2);
    nearby_players = undefined;
    uplink childthread function_f5b8c7d6bb6609c4();
    uplink childthread function_db1ce4cd12dd95d5();
    if (self.var_78fd234febf0416a > 0) {
        uplink childthread function_6314bc0655f4a7c9(self.var_9e852ac0876c3bbe);
    }
    last_state = uplink.var_ede20a7b50019dab;
    uplink.scriptable setscriptablepartstate("br_pe_dataheist_uplink_screen", self.var_5790067a8a484040[uplink.var_ede20a7b50019dab]);
    var_d13206c3844d8288 = 0.25;
    var_6c602b41960a6297 = gettime() + 5000;
    var_234548a5923400d2 = -1;
    var_836160b8b34bc69a = gettime() + 5000;
    var_b1da730a8bf61935 = -1;
    while (uplink.time < uplink.var_aa83c2ddc32095ed) {
        time = gettime();
        if (!uplink.var_a5d01c9b7f5297af) {
            uplink.var_ede20a7b50019dab = 0;
        } else if (uplink.var_4c42ac43dde49b92 || uplink.var_fe1d54bcb3c5043b >= self.var_5dfa1429cddcbc96) {
            uplink.var_ede20a7b50019dab = 3;
        } else if (uplink.var_fe1d54bcb3c5043b > 0) {
            uplink.var_ede20a7b50019dab = 2;
        } else {
            uplink.var_ede20a7b50019dab = 1;
        }
        if (uplink.var_ede20a7b50019dab != last_state) {
            foreach (ent in uplink.var_4c25f559cccbaada) {
                if (isplayer(ent)) {
                    ent setclientomnvar("ui_publicevent_dataheist_state", uplink.var_ede20a7b50019dab);
                }
            }
            if (uplink.var_ede20a7b50019dab == 0) {
                var_234548a5923400d2 = gettime() + 10000;
            } else {
                var_234548a5923400d2 = -1;
            }
            if (uplink.var_ede20a7b50019dab > 1) {
                var_b1da730a8bf61935 = gettime() + 6000;
            } else {
                var_b1da730a8bf61935 = -1;
            }
            last_state = uplink.var_ede20a7b50019dab;
            uplink.scriptable setscriptablepartstate("br_pe_dataheist_uplink_screen", self.var_5790067a8a484040[uplink.var_ede20a7b50019dab]);
        }
        if (var_234548a5923400d2 > 0) {
            if (time > var_234548a5923400d2 && time > var_6c602b41960a6297) {
                var_6c602b41960a6297 = time + 30000;
                var_e0a7e2154a8c2f62 = uplink function_aeb8753295c3577(uplink.var_6bcb8569ef76541a);
                function_63bdbc18191be5f9("dataheist_out_range", var_e0a7e2154a8c2f62);
                var_234548a5923400d2 = -1;
            }
        } else if (var_b1da730a8bf61935 > 0) {
            if (time > var_b1da730a8bf61935 && time > var_836160b8b34bc69a) {
                var_836160b8b34bc69a = time + 30000;
                var_e0a7e2154a8c2f62 = uplink function_aeb8753295c3577(uplink.var_6bcb8569ef76541a);
                function_63bdbc18191be5f9("dataheist_enemy_block_down", var_e0a7e2154a8c2f62);
            }
        }
        if (uplink.var_a5d01c9b7f5297af && !uplink.var_4c42ac43dde49b92) {
            scale = (time - self.warning_time) / (self.end_time - self.warning_time);
            scale = clamp(scale, 0, 1);
            var_16b27ed58761766d = 3 * scale + 1;
            increment = var_d13206c3844d8288 * var_16b27ed58761766d;
            uplink function_5e4d7ff52575526((1 - min(1, self.var_c5f1eb4d167935 * uplink.var_fe1d54bcb3c5043b)) * increment);
        }
        wait(var_d13206c3844d8288);
    }
    uplink.scriptable setscriptablepartstate("br_pe_dataheist_uplink_screen", "complete");
    uplink.scriptable setscriptablepartstate("br_pe_dataheist_uplink_useable", "complete");
    function_da3599e311b1241a(uplink.var_6bcb8569ef76541a);
    uplink.scriptable function_358de5caa85aabf7();
    foreach (player in uplink.var_72495d8d02f97943) {
        player thread function_ddfc2513ffdc4ddc();
    }
    if (uplink.obj_id != -1) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(uplink.obj_id);
        uplink.obj_id = undefined;
    }
    nearby_players = function_f3167a32a9d8b1e8();
    winners = [];
    var_93b3b06a17cc437b = [];
    var_bd1e3580ba157785 = [];
    foreach (player in nearby_players) {
        if (player.team == uplink.var_6bcb8569ef76541a) {
            winners[winners.size] = player;
        } else if (isdefined(uplink.var_a515d13bfdcb33f1[player.team])) {
            var_93b3b06a17cc437b[var_93b3b06a17cc437b.size] = player;
        } else {
            var_bd1e3580ba157785[var_bd1e3580ba157785.size] = player;
        }
    }
    uplink.scriptable thread function_a52def3d6b40207a(winners);
    uplink.is_complete = 1;
    uplink notify("complete");
    self notify("uplink_complete");
    function_2f06f510aff6c900(uplink.var_6bcb8569ef76541a);
    wait(1);
    function_63bdbc18191be5f9("dataheist_team_comp_uplink", winners, 2);
    foreach (player in winners) {
        player namespace_44abc05161e2e2cb::showsplash("br_pe_dataheist_success", undefined, undefined, undefined, undefined, "splash_list_br_pe_dataheist");
    }
    function_63bdbc18191be5f9("dataheist_enemy_comp_lost_uplink", var_93b3b06a17cc437b, 2);
    function_63bdbc18191be5f9("dataheist_enemy_comp_uplink", var_bd1e3580ba157785, 2);
    uplink function_cdb8ea404983a187();
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e82
// Size: 0xd6
function function_5e4d7ff52575526(increment) {
    self.time = self.time + increment;
    self.progress = min(1, self.time / self.var_aa83c2ddc32095ed);
    if (isdefined(self.obj_id)) {
        objective_setprogress(self.obj_id, self.progress);
    }
    foreach (ent in self.var_4c25f559cccbaada) {
        if (isplayer(ent)) {
            ent setclientomnvar("ui_publicevent_dataheist_progress", self.progress);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5f
// Size: 0xf4
function function_f5b8c7d6bb6609c4() {
    self endon("complete");
    while (1) {
        team = self waittill("activated");
        if (team == self.var_6bcb8569ef76541a) {
            continue;
        }
        nearby_players = self.event function_2a43e356ecd267c7(self.var_6bcb8569ef76541a);
        function_63bdbc18191be5f9("dataheist_enemy_cap_uplink", nearby_players, 2);
        foreach (player in nearby_players) {
            player namespace_44abc05161e2e2cb::showsplash("br_pe_dataheist_stolen", undefined, undefined, undefined, undefined, "splash_list_br_pe_dataheist");
        }
        function_6fc077e1f039cf7(team);
        nearby_players = self.event function_2a43e356ecd267c7(self.var_6bcb8569ef76541a);
        function_63bdbc18191be5f9("dataheist_team_cap_uplink", nearby_players, 2);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305a
// Size: 0x4f
function function_88a9ce111608764a(data) {
    if (data.attacker.team == self.uplink.var_6bcb8569ef76541a) {
        return;
    }
    self.uplink.var_4c42ac43dde49b92 = 1;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b0
// Size: 0x21
function function_635613a90782ee9b(var_c0b7b6772cd99b0) {
    self.uplink.var_4c42ac43dde49b92 = 0;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d8
// Size: 0xc1
function function_db1ce4cd12dd95d5() {
    self endon("complete");
    while (1) {
        self.var_a5d01c9b7f5297af = 0;
        self.var_fe1d54bcb3c5043b = 0;
        foreach (ent in self.var_4c25f559cccbaada) {
            if (ent namespace_dbbb37eb352edf96::isvehicle()) {
                continue;
            }
            if (isdefined(ent.team) && ent.team == self.var_6bcb8569ef76541a) {
                self.var_a5d01c9b7f5297af = 1;
            } else {
                self.var_fe1d54bcb3c5043b++;
            }
        }
        waitframe();
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a0
// Size: 0x169
function function_6314bc0655f4a7c9(var_aea828ab13b354b) {
    event = self.event;
    foreach (progress in var_aea828ab13b354b) {
        while (self.progress < progress) {
            wait(1);
        }
        var_dd4f509b9c56c76f = undefined;
        var_1ffc02522d731e6e = function_74428d38b94d6664();
        if (istrue(event.var_8fae2a4c66da64c0) && var_1ffc02522d731e6e < event.var_5b470c719e713baa) {
            var_148e19647354d724 = int(min(event.var_5b470c719e713baa - var_1ffc02522d731e6e, event.var_d03b16e4339a4546)) + 1;
            var_dd4f509b9c56c76f = function_16460a9daba16a6(event.var_78fd234febf0416a, randomintrange(event.var_7e9fd2d078543358, var_148e19647354d724), event.var_3b2fe32897ffd722);
        } else {
            var_dd4f509b9c56c76f = function_e27b61f74dfba712(event.var_78fd234febf0416a);
        }
        thread function_3723563cad2eb687(var_dd4f509b9c56c76f, [0:"safe", 1:"para"], function_27ba596aafa69f39(0));
        function_63bdbc18191be5f9("dataheist_ai_spawn", self.nearby_players, 5);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3310
// Size: 0x167
function function_6fc077e1f039cf7(team) {
    self.scriptable function_ae84023e1dbb45f3(team);
    self.var_6bcb8569ef76541a = team;
    self.var_72495d8d02f97943 = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    if (!isdefined(self.var_a515d13bfdcb33f1[team])) {
        self.var_a515d13bfdcb33f1[team] = 1;
    }
    foreach (player in self.var_72495d8d02f97943) {
        player namespace_44abc05161e2e2cb::showsplash("br_pe_dataheist_defend", undefined, undefined, undefined, undefined, "splash_list_br_pe_dataheist");
    }
    foreach (ent in self.var_4c25f559cccbaada) {
        if (isplayer(ent)) {
            if (ent.team == self.var_6bcb8569ef76541a) {
                function_b2588b08ad6f485b(ent);
            } else {
                function_e232769e6ea189ca(ent);
            }
        }
    }
    if (isdefined(self.obj_id)) {
        objective_setprogressteam(self.obj_id, self.var_6bcb8569ef76541a);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347e
// Size: 0x11a
function function_cdb8ea404983a187() {
    foreach (ent in self.var_4c25f559cccbaada) {
        if (isplayer(ent)) {
            ent setclientomnvar("ui_publicevent_dataheist_state", 0);
            ent setclientomnvar("ui_publicevent_dataheist_progress", 0);
        }
    }
    if (isdefined(self.var_9852072496d7f7e)) {
        self.var_9852072496d7f7e delete();
    }
    if (!self.is_complete && isdefined(self.scriptable)) {
        self.scriptable freescriptable();
    }
    if (isdefined(self.obj_id) && self.obj_id != -1) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.obj_id);
    }
    if (isdefined(self.trigger)) {
        self.trigger notify("destroy");
        self.trigger delete();
    }
    self notify("cleanup");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359f
// Size: 0x151
function function_2bb37c482de07fd3() {
    level endon("game_ended");
    self endon("cleanup");
    while (isdefined(self.trigger)) {
        ent = self.trigger waittill("trigger");
        var_cfce1656415dae16 = ent getentitynumber();
        if (isdefined(self.var_4c25f559cccbaada[var_cfce1656415dae16])) {
            continue;
        }
        if (!isplayer(ent) && !isagent(ent) && !ent namespace_dbbb37eb352edf96::isvehicle()) {
            continue;
        }
        if (ent namespace_dbbb37eb352edf96::isvehicle()) {
            occupants = namespace_1fbd40990ee60ede::vehicle_occupancy_getalloccupants(ent);
            foreach (occupant in occupants) {
                if (isplayer(occupant) || isagent(occupant)) {
                    var_7d47a1bf7f608636 = occupant getentitynumber();
                    if (isdefined(self.var_4c25f559cccbaada[var_7d47a1bf7f608636])) {
                        continue;
                    }
                    self.var_4c25f559cccbaada[var_7d47a1bf7f608636] = occupant;
                    occupant thread function_191978f898963a8(self);
                }
            }
        } else {
            self.var_4c25f559cccbaada[var_cfce1656415dae16] = ent;
            ent thread function_191978f898963a8(self);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36f7
// Size: 0xb0
function function_191978f898963a8(uplink) {
    level endon("game_ended");
    uplink endon("cleanup");
    if (isplayer(self)) {
        uplink function_190c4bfff3fdc6b8(self);
    }
    while (namespace_7e17181d03156026::isreallyalive(self)) {
        if (isdefined(self.vehicle)) {
            if (!self.vehicle istouching(uplink.trigger)) {
                break;
            }
        } else if (!self istouching(uplink.trigger)) {
            break;
        }
        waitframe();
    }
    var_cfce1656415dae16 = self getentitynumber();
    uplink.var_4c25f559cccbaada[var_cfce1656415dae16] = undefined;
    if (isplayer(self)) {
        uplink function_eb7d54264004374b(self);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ae
// Size: 0xa6
function function_190c4bfff3fdc6b8(player) {
    if (isdefined(player.team) && !array_contains_key(self.var_cf3b62c466fc43bb, player.team)) {
        self.var_cf3b62c466fc43bb[player.team] = 1;
        if (isdefined(self.obj_id)) {
            objective_addteamtomask(self.obj_id, player.team);
        }
    }
    if (istrue(self.is_active) && player.team == self.var_6bcb8569ef76541a) {
        function_b2588b08ad6f485b(player);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x385b
// Size: 0x14
function function_eb7d54264004374b(player) {
    function_e232769e6ea189ca(player);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3876
// Size: 0x53
function function_b2588b08ad6f485b(player) {
    if (isdefined(self.obj_id)) {
        objective_hideprogressforclient(self.obj_id, player);
    }
    player setclientomnvar("ui_publicevent_dataheist_state", self.var_ede20a7b50019dab);
    player setclientomnvar("ui_publicevent_dataheist_progress", self.progress);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38d0
// Size: 0x36
function function_e232769e6ea189ca(player) {
    if (isdefined(self.obj_id)) {
        objective_showprogressforclient(self.obj_id, player);
    }
    player setclientomnvar("ui_publicevent_dataheist_state", 0);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x390d
// Size: 0xa0
function function_533c18ee02139b7e(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (istrue(instance.var_180f4d931981e33e)) {
        if (getdvarint(@"hash_ed4efe8df2b29df0", 1)) {
            namespace_981ad73f8047222f::function_647a8c40104e4866(player.team);
        }
        instance thread function_7a3f6a13e7005ed();
    } else if (isdefined(instance.uplink)) {
        instance.uplink notify("activated", player.team);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b4
// Size: 0x7c
function function_ae84023e1dbb45f3(team) {
    foreach (player in level.players) {
        if (player.team == team) {
            self disablescriptableplayeruse(player);
        } else {
            self enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a37
// Size: 0x3
function function_2b41b2856496cbb9() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a41
// Size: 0xfc
function function_358de5caa85aabf7() {
    self.var_180f4d931981e33e = 1;
    uplink = self.uplink;
    event = uplink.event;
    score = event function_8d72849f49068945(uplink.var_6bcb8569ef76541a);
    team_size = namespace_36f464722d326bbe::function_4fb37368ae3585bb();
    self.loot = [];
    self.loot = function_921cab584a3d07c0(event, score, team_size);
    foreach (player in level.players) {
        if (player.team != uplink.var_6bcb8569ef76541a) {
            self disablescriptableplayeruse(player);
        } else {
            self enablescriptableplayeruse(player);
        }
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b44
// Size: 0x225
function function_921cab584a3d07c0(event, score, team_size) {
    var_2bcd4d9f9d3130ff = [];
    switch (score) {
    case 3:
        var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:"brloot_killstreak_auav", 1:1];
        if (cointoss() && getdvarint(@"hash_9264f8f1143934c6", 0) && namespace_708f627020de59d3::function_2980f22fb01f43e6()) {
            var_d418c6d54e23e75d = [0:"brloot_perkpack_beret_br", 1:"brloot_perkpack_insurgent_br", 2:"brloot_perkpack_demolitionist_br", 3:"brloot_perkpack_reserves_br", 4:"brloot_perkpack_swat_br"];
            var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:function_7a2aaa4a09a4d250(var_d418c6d54e23e75d), 1:1];
            goto LOC_0000012b;
        }
        jumpiffalse(getdvarint(@"hash_368ea569c1a6a4e4", 1)) LOC_0000012b;
        var_5a6d897e9cfe5f52 = [0:"brloot_plate_carrier_tempered"];
        var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:function_7a2aaa4a09a4d250(var_5a6d897e9cfe5f52), 1:1];
    case 2:
    LOC_0000012b:
        lootid = pickscriptablelootitem("weapon", 4, 4, "mp/loot/br/default/lootset_cache_lege.csv");
        var_ea156f5f477a8792 = 1;
        if (isdefined(level.br_lootiteminfo[lootid])) {
            weapon = namespace_cb965d2f71fefddc::getfullweaponobjfromscriptablename(lootid);
            var_ea156f5f477a8792 = weaponclipsize(weapon);
        }
        var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:lootid, 1:var_ea156f5f477a8792];
    case 1:
        if (score == 1 || score == 2) {
            var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:"brloot_killstreak_uav", 1:1];
        }
        var_63de1dee54326fdd = namespace_c6ccccd95254983f::getplundernamebyamount(event.var_80242dc777bb3f8);
        for (i = 0; i < team_size; i++) {
            var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:var_63de1dee54326fdd, 1:event.var_80242dc777bb3f8];
        }
        var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:"brloot_super_armorbox"];
        var_2bcd4d9f9d3130ff[var_2bcd4d9f9d3130ff.size] = [0:"brloot_super_munitionsbox"];
        break;
    }
    return var_2bcd4d9f9d3130ff;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d71
// Size: 0x149
function function_7a3f6a13e7005ed() {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    foreach (item in self.loot) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, undefined, level.br_pickups.var_ad49a38dd7c4c10f, level.br_pickups.var_3b53bc0eee6ae84e);
        scriptable = namespace_cb965d2f71fefddc::spawnpickup(item[0], var_cb4fad49263e20c4, item[1], 1);
    }
    if (isdefined(self.uplink.var_47b9acc51b653de0) && self.uplink.var_47b9acc51b653de0 != -1) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.uplink.var_47b9acc51b653de0);
    }
    self setscriptablepartstate("br_pe_dataheist_uplink_useable", "pickup");
    self setscriptablepartstate("br_pe_dataheist_uplink_screen", "hidden");
    self notify("uplink_looted");
    wait(1);
    self freescriptable();
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec1
// Size: 0x201
function function_a52def3d6b40207a(winners) {
    level endon("game_ended");
    self endon("uplink_looted");
    self.uplink.var_47b9acc51b653de0 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (self.uplink.var_47b9acc51b653de0 > -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.uplink.var_47b9acc51b653de0, "current", self.uplink.origin, "ui_map_icon_obj_sealion_sidequest_reward");
        objective_removeallfrommask(self.uplink.var_47b9acc51b653de0);
        objective_showtoplayersinmask(self.uplink.var_47b9acc51b653de0);
        objective_setbackground(self.uplink.var_47b9acc51b653de0, 1);
        objective_setplayintro(self.uplink.var_47b9acc51b653de0, 0);
        objective_position(self.uplink.var_47b9acc51b653de0, self.uplink.origin + (0, 0, 20));
        objective_setdescription(self.uplink.var_47b9acc51b653de0, "MP_BR_INGAME/REWARD_ICON_NAME_DATAHEIST");
    }
    foreach (player in winners) {
        objective_addclienttomask(self.uplink.var_47b9acc51b653de0, player);
    }
    thread function_606beeae377568ad();
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.uplink.var_47b9acc51b653de0, 1);
    wait(self.uplink.event.var_464ff1ef779c439d);
    namespace_5a22b6f3a56f7e9b::objective_set_pulsate(self.uplink.var_47b9acc51b653de0, 0);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c9
// Size: 0xb7
function function_606beeae377568ad() {
    level endon("game_ended");
    self endon("uplink_looted");
    var_d686ef7f3d2879c2 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(self.origin);
    var_7b67e7df5d9273fe = self.uplink.var_47b9acc51b653de0;
    time_to_wait = self.uplink.event.var_4febd27038048ffb;
    self.uplink.event waittill("event_deactivated");
    var_607904254b97e282 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_d686ef7f3d2879c2);
    if (var_607904254b97e282 < time_to_wait) {
        wait(var_607904254b97e282);
    } else {
        wait(time_to_wait);
    }
    namespace_5a22b6f3a56f7e9b::update_objective_state(var_7b67e7df5d9273fe, "active");
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4187
// Size: 0x3
function function_62e43e141326b7c5() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4191
// Size: 0x52
function function_e27b61f74dfba712(var_1eaffe65673cf616) {
    var_dd4f509b9c56c76f = [];
    for (i = 0; i < var_1eaffe65673cf616; i++) {
        ai_type = namespace_bfef6903bca5845d::function_ed108ff3eb578327("guard");
        var_dd4f509b9c56c76f[i] = namespace_bfef6903bca5845d::function_de59d7cb310c1aff(ai_type);
    }
    return var_dd4f509b9c56c76f;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41eb
// Size: 0x88
function function_16460a9daba16a6(var_1eaffe65673cf616, var_9ff8d6ff64b1e412, var_ddf7c7237f9c720d) {
    var_dd4f509b9c56c76f = [];
    tier = 1;
    for (i = 0; i < var_1eaffe65673cf616; i++) {
        if (i >= var_9ff8d6ff64b1e412) {
            ai_type = namespace_bfef6903bca5845d::function_ed108ff3eb578327("guard");
            tier = 1;
        } else {
            ai_type = "rusher";
            tier = var_ddf7c7237f9c720d;
        }
        var_dd4f509b9c56c76f[i] = namespace_bfef6903bca5845d::function_de59d7cb310c1aff(ai_type, tier);
    }
    return var_dd4f509b9c56c76f;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427b
// Size: 0x162
function function_3723563cad2eb687(var_dd4f509b9c56c76f, var_38ec12043600cbe0, params) {
    if (var_dd4f509b9c56c76f.size < 1) {
        return;
    }
    agents = namespace_8d9453d94dd4f401::spawn_reinforcements(self.origin, var_dd4f509b9c56c76f, var_38ec12043600cbe0, params);
    /#
        /#
            assertex(agents.size > 0, "<unknown string>");
        #/
    #/
    waitframe();
    foreach (agent in agents) {
        /#
            /#
                assertex(isdefined(agent), "<unknown string>");
            #/
        #/
        /#
            /#
                assertex(!isint(agent), "<unknown string>");
            #/
        #/
        if (issubstr(agent.agent_type, "rusher") || agent.var_ae3ea15396b65c1f == "rusher") {
            agent.pathenemyfightdist = 0;
            if (isdefined(agent.var_4c2e21367dbf09d0)) {
                [[ agent.var_4c2e21367dbf09d0 ]](self.origin, 1000);
            }
        }
        namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "dropWeapon", 0);
        namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "dropGrenade", 0);
    }
    self.agents = array_combine(self.agents, agents);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43e4
// Size: 0x81
function function_27ba596aafa69f39(var_15d6c88336debdf4) {
    params = spawnstruct();
    params.ai_category = "dataheist";
    params.var_6adbaf8d10937e14 = "high";
    params.var_a78daf96b4bdf866 = 1500;
    params.var_1b20f5fb6aee28f7 = 500;
    params.var_cf0b51ba5e529a7 = 5;
    params.var_15d6c88336debdf4 = ter_op(isdefined(var_15d6c88336debdf4), var_15d6c88336debdf4, 0);
    return params;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446d
// Size: 0xce
function function_74428d38b94d6664() {
    var_4d1c2f2324ff0903 = 0;
    agents = self.agents;
    if (!isdefined(agents) || agents.size <= 0) {
        /#
            println("<unknown string>" + self.var_f64e221d661e7341);
        #/
    } else {
        foreach (agent in agents) {
            if (!is_dead_or_dying(agent) && (issubstr(agent.agent_type, "rusher") || agent.var_ae3ea15396b65c1f == "rusher")) {
                var_4d1c2f2324ff0903++;
            }
        }
    }
    return var_4d1c2f2324ff0903;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4543
// Size: 0x3
function function_520dd8c02a62523b() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x454d
// Size: 0x26
function function_e8ce5f018d2b942c(dialog, delay) {
    function_63bdbc18191be5f9(dialog, level.players, delay);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x457a
// Size: 0x99
function function_63bdbc18191be5f9(dialog, players, delay) {
    var_668b93c688b30136 = game["dialog"][dialog];
    /#
        assertex(isdefined(var_668b93c688b30136), "Error: Dataheist failed to find sound name for dialog: " + dialog);
    #/
    foreach (player in players) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogplayer(dialog, player, undefined, undefined, delay, undefined);
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x461a
// Size: 0x3
function function_f1a6433b0371050b() {
    
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4624
// Size: 0xb3
function function_2a43e356ecd267c7(team) {
    players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    nearby_players = [];
    dist_sq = squared(self.var_59ea6b2ef4905653);
    foreach (player in players) {
        if (distance2dsquared(player.origin, self.midpoint) <= dist_sq) {
            nearby_players[nearby_players.size] = player;
        }
    }
    return nearby_players;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46df
// Size: 0x3d
function function_f8cd8b690a39bec2(team) {
    team_players = namespace_54d20dd0dd79277f::getteamdata(team, "players");
    return namespace_7e17181d03156026::getplayersinradius(self.midpoint, self.var_59ea6b2ef4905653, undefined, team_players);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4724
// Size: 0x1b
function function_f3167a32a9d8b1e8() {
    return namespace_7e17181d03156026::getplayersinradius(self.midpoint, self.var_59ea6b2ef4905653);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4747
// Size: 0x7c
function function_aeb8753295c3577(team) {
    members = [];
    foreach (player in self.nearby_players) {
        if (player.team == team) {
            members[members.size] = player;
        }
    }
    return members;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47cb
// Size: 0x34
function function_63245662e2e8a786(point) {
    return point.is_valid && point.var_927206bdb3f7000d.size >= self.var_c740830cdb73800e - 1;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4807
// Size: 0x6d
function function_45a890c985d26276() {
    var_46edfbf5c8ec3711 = [];
    foreach (point in self.var_adabc9f186b54e6a) {
        if (function_63245662e2e8a786(point)) {
            var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = point;
        }
    }
    return var_46edfbf5c8ec3711;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487c
// Size: 0x3e5
function function_24afcbb2ea0ccb49(var_70a2eef6ae310634) {
    foreach (point in self.var_adabc9f186b54e6a) {
        point.var_927206bdb3f7000d = [];
        point.is_valid = 1;
        if (point.used) {
            point.is_valid = 0;
            /#
                point.status = "<unknown string>";
            #/
        } else if (!level.br_circle_disabled) {
            var_3f69be4080274ac5 = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(point.origin);
            hit_time = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(var_3f69be4080274ac5);
            jumpiffalse(hit_time < var_70a2eef6ae310634) LOC_00000177;
            point.is_valid = 0;
            /#
                point.status = "<unknown string>" + hit_time + "<unknown string>";
            #/
        } else {
        LOC_00000177:
            /#
                point.status = "<unknown string>";
            #/
        }
    }
    for (i = 0; i < self.var_adabc9f186b54e6a.size; i++) {
        var_4ada0dbaa779f2ed = self.var_adabc9f186b54e6a[i];
        if (!var_4ada0dbaa779f2ed.is_valid) {
            continue;
        }
        for (j = i + 1; j < self.var_adabc9f186b54e6a.size; j++) {
            var_4ada0abaa779ec54 = self.var_adabc9f186b54e6a[j];
            if (!var_4ada0abaa779ec54.is_valid) {
                continue;
            }
            dist = distance2dsquared(var_4ada0dbaa779f2ed.origin, var_4ada0abaa779ec54.origin);
            if (dist > self.var_adc5129ff19a0342 && dist < self.var_a355ae253087e6ec) {
                var_4ada0dbaa779f2ed.var_927206bdb3f7000d[var_4ada0dbaa779f2ed.var_927206bdb3f7000d.size] = var_4ada0abaa779ec54;
                var_4ada0abaa779ec54.var_927206bdb3f7000d[var_4ada0abaa779ec54.var_927206bdb3f7000d.size] = var_4ada0dbaa779f2ed;
            }
        }
    }
    /#
        dump = function_eec1a284991f8d7a("<unknown string>");
        dump function_d10a8a5bcebaedf2("<unknown string>" + var_70a2eef6ae310634 + "<unknown string>");
        dump function_d10a8a5bcebaedf2("<unknown string>");
        var_5df4e50e27758200 = [];
        foreach (index, point in self.var_adabc9f186b54e6a) {
            if (!isdefined(var_5df4e50e27758200[point.group])) {
                var_5df4e50e27758200[point.group] = 0;
            }
            if (function_63245662e2e8a786(point)) {
                var_5df4e50e27758200[point.group] = var_5df4e50e27758200[point.group] + 1;
            }
            dump function_d10a8a5bcebaedf2("<unknown string>" + index + "<unknown string>" + point.group + "<unknown string>" + point.status);
            if (point.is_valid) {
                dump function_8c2574850bb05347("<unknown string>" + point.var_927206bdb3f7000d.size);
            }
        }
        keys = getarraykeys(var_5df4e50e27758200);
        foreach (key in keys) {
            dump function_d10a8a5bcebaedf2(key + "<unknown string>" + var_5df4e50e27758200[key]);
        }
        dump function_14f1f56f30d3b0fb();
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c68
// Size: 0x5d
function function_c034dc08d0d12cd8(state) {
    switch (state) {
    case 1:
        return "MP_BR_PE_DATAHEIST/CAPTURE_STATE_DOWNLOADING";
    case 2:
        return "MP_BR_PE_DATAHEIST/CAPTURE_STATE_INTERFERENCE";
    case 3:
        return "MP_BR_PE_DATAHEIST/CAPTURE_STATE_BLOCKED";
    default:
        return "!! INVALID STATE !!";
        break;
    }
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ccc
// Size: 0xdb
function function_671cc803581d0e65(var_55c91e2104be488a) {
    points = [];
    if (!isdefined(var_55c91e2104be488a)) {
        return points;
    }
    var_64598ecf49ab5725 = strtok(var_55c91e2104be488a, ",");
    foreach (var_f797bd32dd59c4a7 in var_64598ecf49ab5725) {
        var_dbfd5ecc8d4e11b7 = int(var_f797bd32dd59c4a7);
        if (isint(var_dbfd5ecc8d4e11b7) && var_dbfd5ecc8d4e11b7 >= 0 && var_dbfd5ecc8d4e11b7 < self.var_adabc9f186b54e6a.size) {
            points[points.size] = var_dbfd5ecc8d4e11b7;
        } else {
            /#
                iprintlnbold("<unknown string>" + var_f797bd32dd59c4a7 + "<unknown string>" + self.var_adabc9f186b54e6a.size - 1);
            #/
        }
    }
    return points;
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4daf
// Size: 0x12
function function_ddfc2513ffdc4ddc() {
    namespace_aad14af462a74d08::function_8359cadd253f9604(self, "dataheist_uplink_complete", 1);
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc8
// Size: 0x6
function function_3a24d044bf8e442e() {
    /#
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4dd5
// Size: 0x121
function debug_init() {
    /#
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("<unknown string>");
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_db70bae7732f5204);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_79f09180ee96a5de);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_ca12a92628328432);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_c3d7b176abc6b629);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_2a20415ca9baa8f9);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9f75279b43f251c6);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6eeb59951c1edac6);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fd6377203b2db297);
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fd6377203b2db297);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_83873605c0cc0f3a);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_41d60ffda1134555);
        namespace_b032b0cc17b10064::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7e5217f288b95f5e);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4efd
// Size: 0x2b
function function_c3d7b176abc6b629() {
    /#
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        init_dvars(event_data);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f2f
// Size: 0x57
function function_fd6377203b2db297(params) {
    /#
        if (!isdefined(params[0]) || !isdefined(params[1])) {
            return;
        }
        value = int(params[1]);
        if (!isint(value)) {
            return;
        }
        setdvar(function_2ef675c13ca1c4af(@"hash_7805fcacedd1cf62", params[0]), value);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f8d
// Size: 0x11
function function_db70bae7732f5204() {
    /#
        level thread namespace_d76af9f804655767::function_e37ee072d95a7c98(8);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa5
// Size: 0x11
function function_79f09180ee96a5de() {
    /#
        level thread namespace_d76af9f804655767::function_2907d01a7d692108(8);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fbd
// Size: 0x37
function function_ca12a92628328432() {
    /#
        spawnscriptable("<unknown string>", level.player.origin, level.player.angles);
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4ffb
// Size: 0x17
function function_29327b1833cde79e() {
    /#
        level notify("<unknown string>");
        level thread function_9c68002c913d40e5();
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5019
// Size: 0xe
function function_1497224a9c74808b() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502e
// Size: 0x2bb
function function_9c68002c913d40e5() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        var_bc14efd8d5953a88 = (0, 0, 40);
        var_f037fc926270b3a2 = (0, 0, 4);
        scale = 0.25;
        var_f83c0acd92722303 = (0, 1, 0);
        var_aed3278ba8364a07 = (1, 0.65, 0);
        var_f30d9739b5d1b9e = (0.25, 0.25, 0.25);
        color = undefined;
        print_duration = 1;
        var_e486b5f3a3268190 = int(print_duration / level.framedurationseconds);
        var_d42e6e9e256e7449 = undefined;
        while (1) {
            if (!istrue(event_data.active)) {
                function_1497224a9c74808b();
            }
            foreach (uplink in event_data.var_8d20f50b331db1f5) {
                if (!uplink.var_a5d01c9b7f5297af) {
                    color = var_f30d9739b5d1b9e;
                } else if (uplink.var_fe1d54bcb3c5043b > 0) {
                    color = var_aed3278ba8364a07;
                } else {
                    color = var_f83c0acd92722303;
                }
                print3d(uplink.origin + var_bc14efd8d5953a88 - var_f037fc926270b3a2 * 0, "<unknown string>" + uplink.origin, color, 1, scale, var_e486b5f3a3268190, 1);
                print3d(uplink.origin + var_bc14efd8d5953a88 - var_f037fc926270b3a2 * 1, "<unknown string>" + uplink.angles, color, 1, scale, var_e486b5f3a3268190, 1);
                print3d(uplink.origin + var_bc14efd8d5953a88 - var_f037fc926270b3a2 * 2, "<unknown string>" + uplink.var_6bcb8569ef76541a, color, 1, scale, var_e486b5f3a3268190, 1);
                print3d(uplink.origin + var_bc14efd8d5953a88 - var_f037fc926270b3a2 * 3, "<unknown string>" + uplink.progress * 100 + "<unknown string>", color, 1, scale, var_e486b5f3a3268190, 1);
                if (uplink.var_fe1d54bcb3c5043b > 0) {
                    print3d(uplink.origin + var_bc14efd8d5953a88 - var_f037fc926270b3a2 * 4, "<unknown string>" + uplink.var_fe1d54bcb3c5043b + "<unknown string>", color, 1, scale, var_e486b5f3a3268190, 1);
                }
            }
            wait(print_duration);
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52f0
// Size: 0x1b8
function function_7e5217f288b95f5e() {
    /#
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        var_f6769d2b85aaf27e = event_data.var_f6769d2b85aaf27e;
        if (!level.br_circle_disabled) {
            var_f6769d2b85aaf27e = min(event_data.var_f6769d2b85aaf27e, namespace_c5622898120e827f::function_abbfb4d18d1a9ca7() - 5);
        }
        event_data function_24afcbb2ea0ccb49(var_f6769d2b85aaf27e);
        points = [];
        var_ff9e6fbb61b45590 = event_data function_45a890c985d26276();
        points[0] = random(var_ff9e6fbb61b45590);
        var_6906d84db2a3bc80 = array_randomize(points[0].var_927206bdb3f7000d);
        for (i = 0; i < event_data.var_c740830cdb73800e - 1; i++) {
            points[i + 1] = var_6906d84db2a3bc80[i];
        }
        print_duration = 5;
        var_e486b5f3a3268190 = int(print_duration / level.framedurationseconds);
        last_point = undefined;
        foreach (point in points) {
            sphere(point.origin, 100, (0, 1, 0), 0, var_e486b5f3a3268190);
            if (isdefined(last_point)) {
                line(point.origin, last_point.origin, (0, 1, 0), 1, 0, var_e486b5f3a3268190);
            }
            last_point = point;
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54af
// Size: 0x17
function function_83873605c0cc0f3a() {
    /#
        level notify("<unknown string>");
        level thread function_2634cd6355be1303();
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54cd
// Size: 0xe
function function_41d60ffda1134555() {
    /#
        level notify("<unknown string>");
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54e2
// Size: 0x256
function function_2634cd6355be1303() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        var_bc14efd8d5953a88 = (0, 0, 40);
        var_e8285ce19e9412ce = (0, 0, 4);
        scale = 0.25;
        var_ce36f50f7b7da7c9 = (0, 1, 0);
        var_718404f207deec74 = (1, 0, 0);
        color = undefined;
        print_duration = 5;
        var_e486b5f3a3268190 = int(print_duration / level.framedurationseconds);
        halfheight = event_data.var_ad5deff214441f02 * 0.5;
        while (1) {
            foreach (point in event_data.var_adabc9f186b54e6a) {
                color = ter_op(point.is_valid, var_ce36f50f7b7da7c9, var_718404f207deec74);
                print3d(point.origin + var_bc14efd8d5953a88 + var_e8285ce19e9412ce * 3, "<unknown string>" + point.id, color, 1, scale, var_e486b5f3a3268190, 1);
                print3d(point.origin + var_bc14efd8d5953a88 + var_e8285ce19e9412ce * 2, "<unknown string>" + point.group, color, 1, scale, var_e486b5f3a3268190, 1);
                print3d(point.origin + var_bc14efd8d5953a88 + var_e8285ce19e9412ce * 1, "<unknown string>" + point.status, color, 1, scale, var_e486b5f3a3268190, 1);
                cylinder(point.origin - (0, 0, halfheight), point.origin + (0, 0, halfheight), event_data.var_6dc1e20d4411f853, color, 0, var_e486b5f3a3268190);
                draw_circle(point.origin, event_data.var_f2f4664f784bb1b0, color, 1, 0, var_e486b5f3a3268190);
            }
            wait(print_duration);
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x573f
// Size: 0x7f
function function_2a20415ca9baa8f9() {
    /#
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        foreach (uplink in event_data.var_8d20f50b331db1f5) {
            uplink notify("<unknown string>", "<unknown string>");
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57c5
// Size: 0x99
function function_9f75279b43f251c6() {
    /#
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        team = level.player.team;
        foreach (uplink in event_data.var_8d20f50b331db1f5) {
            uplink notify("<unknown string>", team);
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5865
// Size: 0xc4
function function_6eeb59951c1edac6() {
    /#
        event_data = level.br_pe_data[8];
        if (!isdefined(event_data)) {
            return;
        }
        event_data function_7b885b4b79b662b9();
        event_data.var_6d21295d793761b = [];
        foreach (point in event_data.var_adabc9f186b54e6a) {
            event_data.var_6d21295d793761b = array_add(event_data.var_6d21295d793761b, spawnscriptable("<unknown string>", point.origin, point.angles));
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5930
// Size: 0x67
function function_7b885b4b79b662b9() {
    /#
        if (isdefined(self.var_6d21295d793761b)) {
            foreach (scriptable in self.var_6d21295d793761b) {
                scriptable freescriptable();
            }
        }
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x599e
// Size: 0x6
function function_52a33edb15a54c39() {
    /#
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59ab
// Size: 0x3f
function function_eec1a284991f8d7a(title) {
    /#
        dump = spawnstruct();
        dump.title = title;
        dump.msg = "dths_grav_dhas";
        return dump;
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59f1
// Size: 0x3b
function function_14f1f56f30d3b0fb() {
    /#
        println("<unknown string>" + self.title + "<unknown string>");
        println(self.msg);
        println("<unknown string>");
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a33
// Size: 0x23
function function_8c2574850bb05347(text) {
    /#
        self.msg = self.msg + text;
    #/
}

// Namespace namespace_8b4dfd90ae2d6d57/namespace_ef0b659efcd09d98
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a5d
// Size: 0x1d
function function_d10a8a5bcebaedf2(text) {
    /#
        function_8c2574850bb05347("<unknown string>" + text);
    #/
}

