#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\scene.gsc;
#using script_75377e59f5becac8;
#using scripts\mp\music_and_dialog.gsc;
#using script_6775ad452d13858;

#namespace namespace_f8ca021ce77f892f;

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e9
// Size: 0x1a5
function init() {
    assert(isdefined(level.infilstruct));
    /#
        setdevdvarifuninitialized(@"hash_bfded00ac93c45b7", 1);
        setdevdvarifuninitialized(@"hash_7f1da0c3501cbdf2", 1);
    #/
    level.infilstruct.c130model = "black::veh9_mil_air_cargo_plane_exterior_infil";
    level.infilstruct.var_30e653e12f358438 = "veh9_mil_air_cargo_plane_interior_infil";
    level.infilstruct.var_c3a4f4442070a8b5 = "tag_body_animate";
    level.infilstruct.c130soundalias = "veh_br_infil_c17_distant_lp";
    level.infilstruct.var_12c912ee9672fa1 = 1;
    level.infilstruct.var_eb0e85a583f21b9d = 1;
    level.infilstruct.var_b381e33e977da440 = &function_3158c3418412e97f;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.jumpfunc = &jumpfunc;
    level.infilstruct.var_dc0bc83a31193177 = &function_dc0bc83a31193177;
    var_1809e16510055e87 = ["cam_orbit_br_infil_ac130_player1", "cam_orbit_br_infil_ac130_player2", "cam_orbit_br_infil_ac130_player3", "cam_orbit_br_infil_ac130_player4", "cam_orbit_br_infil_ac130_player1"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("fadedown", &function_26874fd7694aa29);
    game["dialog"]["infil_ac130_5_seconds"] = "dx_br_dmzc_infl_ldms_drop";
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x996
// Size: 0x9a7
function function_3158c3418412e97f(movingc130) {
    animstruct = spawnstruct();
    animstruct.origin = getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0));
    animstruct.angles = (0, 0, 0);
    animstruct.cleanupfunc = &infilcleanup;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    animstruct.movingc130.animname = "movingC130";
    animstruct.camerarunner = animstruct spawn_script_model("generic_prop_x30", "camera");
    animstruct.camerarunner.angles = getdvarvector(@"hash_a243c97d0dc94bd7", animstruct.camerarunner.angles);
    animstruct.camerarunner linkto(animstruct.movingc130, "tag_body_animate", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[0] = animstruct spawn_script_model("tag_player", "playerTag1");
    animstruct.playertags[1] = animstruct spawn_script_model("tag_player", "playerTag2");
    animstruct.playertags[2] = animstruct spawn_script_model("tag_player", "playerTag3");
    animstruct.playertags[3] = animstruct spawn_script_model("tag_player", "playerTag4");
    animstruct.playertags[0] linkto(animstruct.camerarunner, "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[1] linkto(animstruct.camerarunner, "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[2] linkto(animstruct.camerarunner, "j_prop_4", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[3] linkto(animstruct.camerarunner, "j_prop_5", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[0] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.playermodels[1] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
    animstruct.playermodels[2] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
    animstruct.playermodels[3] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
    animstruct.playermodels[0] linkto(animstruct.playertags[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[1] linkto(animstruct.playertags[1], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[2] linkto(animstruct.playertags[2], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[3] linkto(animstruct.playertags[3], "tag_player", (0, 0, 0), (0, 0, 0));
    skins = ["milsim_western_a", "milsim_western_b", "milsim_western_c", "milsim_western_d", "milsim_eastern_a", "milsim_eastern_b", "milsim_eastern_c", "milsim_eastern_d"];
    randomskins = array_randomize(skins);
    animstruct.playermodels[0] function_66b13900c5013de5(randomskins[0]);
    animstruct.playermodels[1] function_66b13900c5013de5(randomskins[1]);
    animstruct.playermodels[2] function_66b13900c5013de5(randomskins[2]);
    animstruct.playermodels[3] function_66b13900c5013de5(randomskins[3]);
    animstruct.packs = [];
    n = 0;
    animstruct.packs[n] = animstruct create_animpack("prelooping", 0);
    animstruct.packs[n] add_pack_startfunc([45], &function_6f33464b9145231b);
    animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.var_1a209bd995a7fa83["wz_br_jup_infil_idle_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_gprop"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.camerarunner, "tag_origin", level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_gprop"], "wz_br_jup_infil_transition_xcam");
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_br_jup_infil_transition_plyr4"]);
    n++;
    animstruct.packs[n] = animstruct create_animpack("looping", 1);
    animstruct.packs[n] add_pack_startfunc([45], &function_f3ae4b41df047ba0);
    animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.var_1a209bd995a7fa83["wz_br_jup_infil_idle_crgopln"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.camerarunner, level.var_1a209bd995a7fa83["wz_infil_g_prop_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.camerarunner, "j_prop_1");
    return animstruct;
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1346
// Size: 0x33a
function function_f3ae4b41df047ba0(array) {
    pack = self.activepack;
    assert(isdefined(pack));
    var_e49a1c04ac964563 = 0;
    var_1ff908a48d4dc0d3 = 4;
    /#
        var_e49a1c04ac964563 = namespace_56a3588493afc984::function_c43d732289ecf3e8();
        var_1ff908a48d4dc0d3 = namespace_56a3588493afc984::function_d8220f4960da76cd();
    #/
    function_583f118c4064ca21(level.infilstruct.players);
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    foreach (players in teams) {
        numplayers = players.size;
        if (var_e49a1c04ac964563) {
            numplayers = var_1ff908a48d4dc0d3;
        }
        possibleindices = [1, 2, 3, 4];
        usedindices = [];
        playercount = 0;
        foreach (player in players) {
            player.infilanimindex = possibleindices[playercount % possibleindices.size];
            player.var_db122a8941dfee14 = numplayers;
            playercount++;
            usedindices[usedindices.size] = player.infilanimindex;
        }
    }
    if (var_e49a1c04ac964563) {
        pack.var_3bd5282b118d27f8 = array_removeundefined(pack.var_3bd5282b118d27f8);
        var_2246d8f267e2c3de = 0;
        foreach (proxy in pack.var_3bd5282b118d27f8) {
            if (var_2246d8f267e2c3de < var_1ff908a48d4dc0d3) {
                proxy show();
                continue;
            }
            proxy hide();
        }
        for (idx = 0; idx < var_1ff908a48d4dc0d3; idx++) {
            foreach (player in players) {
                self.parachutes[idx] showtoplayer(player);
                self.var_9574d80eb717270a[idx] showtoplayer(player);
            }
        }
    }
    if (isdefined(array) && array.size >= 1 && isnumber(array[0])) {
        foreach (player in level.infilstruct.players) {
            player setclientdvar(@"cg_fov", array[0]);
            player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
        }
    }
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1688
// Size: 0x1a
function function_6f33464b9145231b(array) {
    function_f3ae4b41df047ba0(array);
    teleporttomovingplane();
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16aa
// Size: 0x24
function function_8f7e8b26075a5371() {
    self.manualoverridewindmaterial = undefined;
    setwind("1");
    self setallstreamloaddist(0);
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0xf3
function teleporttomovingplane() {
    self.movingc130 setscriptablepartstate("running_lights", "on");
    setomnvar("ui_hide_player_icons", 0);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
        player clearpredictedstreampos();
    }
    if (isdefined(self.movingc130)) {
        if (!istrue(level.infilstruct.var_df94e780c2b3c994) || function_8663da4077fa7e20()) {
            self.movingc130 notify("start_moving");
        }
    }
    level notify("teleportToMovingPlane");
    thread function_708e8449a90a636f();
    function_6199c35f4cf4524c(&function_8f7e8b26075a5371);
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d1
// Size: 0xf
function function_708e8449a90a636f() {
    wait 0.1;
    function_16f307c48e420065();
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e8
// Size: 0x1b
function function_16f307c48e420065() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "on");
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x180b
// Size: 0x204
function function_ad4a7a73c7d7d9e0() {
    self clearclienttriggeraudiozone(3);
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    planeforward = anglestoforward(level.infilstruct.c130.angles);
    planeright = anglestoright(level.infilstruct.c130.angles);
    dotforward = vectordot(playerforward, planeforward);
    dotright = vectordot(playerforward, planeright);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + self.infilanimindex + 1;
    cos45 = cos(45);
    if (dotforward < -1 * cos45) {
        return ["wz_infil_gprop_standard_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_standard_sh010"], "wz_infil_standardforward_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright > cos45) {
        return ["wz_infil_gprop_l90_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_l90_sh010"], "wz_infil_l90_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright < -1 * cos45) {
        return ["wz_infil_gprop_r90_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_r90_sh010"], "wz_infil_r90_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright > 0) {
        return ["wz_infil_gprop_l180_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_l180_sh010"], "wz_infil_l180_jump_sh010", var_8e3afd40d3c95b46];
    }
    return ["wz_infil_gprop_r180_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_r180_sh010"], "wz_infil_r180_jump_sh010", var_8e3afd40d3c95b46];
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a17
// Size: 0x37
function jumpfunc() {
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(0, 0);
        self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a56
// Size: 0x85
function function_dc0bc83a31193177() {
    self endon("disconnect");
    self lerpfov(65, 0.5);
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(1, 0.5);
    }
    wait 1;
    if (isdefined(self.var_1f0a019572c9f8e2)) {
        self.var_1f0a019572c9f8e2 = undefined;
        self disablephysicaldepthoffieldscripting();
    }
    self setclientdvar(@"cg_fov", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ae3
// Size: 0x21
function private function_cd7e1a37d5e2ca2b() {
    level.nosuspensemusic = 1;
    thread scripts\mp\music_and_dialog::stopsuspensemusic();
    function_f1aed36ab4598ea("mp_gamemode_br_infils");
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b0c
// Size: 0xb
function private function_26874fd7694aa29() {
    level thread function_8d050f78fe1d180f();
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b1f
// Size: 0x28
function private function_8d050f78fe1d180f() {
    clearmusicstate();
    wait 2.5;
    function_c79f9300ee85f805(level.players, "mp_br_lobby_fade", 0);
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4f
// Size: 0x1c
function infilcleanup() {
    function_e66f664ad726f2e();
    function_f4e0ff5cb899686d("mp_gamemode_br_infils");
    namespace_56a3588493afc984::cleanupents();
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b73
// Size: 0x5a
function function_52bedae2ced8e191() {
    cloudfx = level._effect["vfx_br_ac130_clouds"];
    var_8b26de022a9f35f = level._effect["vfx_br_ac130_oneshot"];
    if (isdefined(cloudfx)) {
        stopfxontag(cloudfx, self, "tag_body");
    }
    if (isdefined(var_8b26de022a9f35f)) {
        stopfxontag(var_8b26de022a9f35f, self, "tag_body");
    }
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1bd5
// Size: 0xb0
function private function_cc1b64e82fd4680c(players) {
    assertex(isarray(players));
    teams = [];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(teams[player.team])) {
            teams[player.team] = [];
        }
        teams[player.team][teams[player.team].size] = player;
    }
    return teams;
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c8e
// Size: 0x53
function private function_66b13900c5013de5(var_c26fc18bda607b7) {
    body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_c26fc18bda607b7);
    head = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_c26fc18bda607b7);
    if (body == "" || head == "") {
        return;
    }
    self function_dd6d30b9ec87c1b3(body, head, "iw9_avatar_scriptable_mp");
}

// Namespace namespace_f8ca021ce77f892f / namespace_d8d4c267054a30a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce9
// Size: 0xa
function function_8cb390c64468017() {
    self setallstreamloaddist(0);
}

