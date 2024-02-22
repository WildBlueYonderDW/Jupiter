// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using script_930a1e7bd882c1d;
#using script_7ab5b649fa408138;
#using scripts\common\anim.gsc;
#using script_75377e59f5becac8;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace namespace_58c6a84f987ee8e1;

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa87
// Size: 0x167
function init() {
    /#
        assert(isdefined(level.infilstruct));
    #/
    level.var_f84366b8fdd80cf2 = getdvarint(@"hash_1d024c82743aa4ce", 0);
    level.infilstruct.var_fd05dc031a2e7283 = "veh8_mil_air_mindia8_open_back_infil";
    level.infilstruct.var_30e653e12f358438 = "veh8_mil_air_mindia8_interior_vm_infil";
    level.infilstruct.var_477bd548940c3a78 = "mp_donetsk_mindia8_intro";
    level.infilstruct.var_10d27b439af13a2a = ter_op(level.var_f84366b8fdd80cf2, 0.1, 5);
    level.infilstruct.var_b381e33e977da440 = &function_55f2480b4b819aea;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.var_a6547e85663b3bc2 = &function_b766175a1f0eeb13;
    var_1809e16510055e87 = [0:"cam_orbit_br_chopper_squad_player1", 1:"cam_orbit_br_chopper_squad_player1", 2:"cam_orbit_br_chopper_squad_player2", 3:"cam_orbit_br_chopper_squad_player3", 4:"cam_orbit_br_chopper_squad_player4"];
    function_226e337633a44059(var_1809e16510055e87, "cam_orbit_br_chopper_solo");
    function_ad12d29d41483e8a("prematch", &void);
    function_ad12d29d41483e8a("cinematic", &function_5901cd0be722f86a);
    function_ad12d29d41483e8a("animatic", &function_39c2cf6576478d41);
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf5
// Size: 0x1415
function function_55f2480b4b819aea(movingchopper) {
    animstruct = spawnstruct();
    movingchopper.animstruct = animstruct;
    animstruct.origin = getdvarvector(@"hash_223915c6339dbc10", (4319, 0, -28644));
    animstruct.angles = (0, 0, 0);
    animstruct.movingchopper = movingchopper;
    animstruct.cleanupfunc = &function_a5668882499fb369;
    animstruct.chopper = getent("infil_chopper", "script_noteworthy");
    if (isdefined(animstruct.chopper)) {
        animstruct.chopper show();
    } else {
        animstruct.chopper = animstruct spawn_script_model("veh8_mil_air_mindia8_interior_infil", "chopper");
        animstruct.chopper.angles = animstruct.angles;
        animstruct.chopper.cleanme = 1;
    }
    animstruct.choppershell = getent("infil_chopper_open", "script_noteworthy");
    if (isdefined(animstruct.choppershell)) {
        animstruct.choppershell show();
    } else {
        animstruct.choppershell = animstruct.chopper spawn_script_model("veh8_mil_air_mindia8_open_back_infil", "choppershell");
        animstruct.choppershell.angles = animstruct.chopper.angles;
        animstruct.choppershell.cleanme = 1;
    }
    animstruct.var_c1bf2a7fd5e40dad = animstruct.chopper spawn_script_model("veh8_mil_air_mindia8_interior_infil_netting", "movingChopper");
    animstruct.var_c1bf2a7fd5e40dad linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    animstruct.chopperdoor = animstruct.chopper spawn_script_model("veh8_mil_air_mindia8_interior_infil_cabin_door", "chopperDoor");
    animstruct.chopperdoor linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    if (isdefined(animstruct.movingchopper)) {
        animstruct.movingchopper.animname = "movingChopper";
        animstruct.movingchopper.innards.animname = "movingChopper";
    }
    animstruct.var_d60e3315aba032e0 = animstruct.chopper spawn_script_model("generic_prop_x3", "camera");
    animstruct.var_d60e3315aba032e0 linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    animstruct.var_2f73a403f1e61903 = animstruct.chopper spawn_script_model("generic_prop_x3", "cameraSquad");
    animstruct.var_2f73a403f1e61903 linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    if (isdefined(movingchopper)) {
        movingchopper forcenetfieldhighlod(1);
        animstruct.var_7bbc3350e7793cc6 = movingchopper spawn_script_model("generic_prop_x3", "cameramoving");
        animstruct.var_7bbc3350e7793cc6 linkto(movingchopper, "tag_origin", (0, 0, 0), (0, 0, 0));
        animstruct.var_7bbc3350e7793cc6 forcenetfieldhighlod(1);
        animstruct.var_a9a5dab973b28fad = movingchopper spawn_script_model("generic_prop_x3", "cameraSquadmoving");
        animstruct.var_a9a5dab973b28fad linkto(movingchopper, "tag_origin", (0, 0, 0), (0, 0, 0));
        animstruct.var_a9a5dab973b28fad forcenetfieldhighlod(1);
    }
    animstruct.playerpositionents["parent_solo"] = animstruct.chopper spawn_script_model("generic_prop_x3", "propsolo");
    animstruct.playerpositionents["parent_solo"] linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    animstruct.playerpositionents["parent_squad"] = animstruct.chopper spawn_script_model("generic_prop_x5", "propparent");
    animstruct.playerpositionents["parent_squad"] linkto(animstruct.chopper, "tag_origin", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5 = [];
    animstruct.var_b50860e78d9e1e5[0] = animstruct.chopper spawn_script_model("tag_player", "playerTag1");
    animstruct.var_b50860e78d9e1e5[1] = animstruct.chopper spawn_script_model("tag_player", "playerTag1");
    animstruct.var_b50860e78d9e1e5[2] = animstruct.chopper spawn_script_model("tag_player", "playerTag2");
    animstruct.var_b50860e78d9e1e5[3] = animstruct.chopper spawn_script_model("tag_player", "playerTag3");
    animstruct.var_b50860e78d9e1e5[4] = animstruct.chopper spawn_script_model("tag_player", "playerTag4");
    animstruct.var_b50860e78d9e1e5[0] linkto(animstruct.playerpositionents["parent_solo"], "j_prop_1", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[1] linkto(animstruct.playerpositionents["parent_squad"], "j_prop_1", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[2] linkto(animstruct.playerpositionents["parent_squad"], "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[3] linkto(animstruct.playerpositionents["parent_squad"], "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.var_b50860e78d9e1e5[4] linkto(animstruct.playerpositionents["parent_squad"], "j_prop_4", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e = [];
    animstruct.var_a552ec61e51ece6e[0] = animstruct.chopper spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.var_a552ec61e51ece6e[1] = animstruct.chopper spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.var_a552ec61e51ece6e[2] = animstruct.chopper spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
    animstruct.var_a552ec61e51ece6e[3] = animstruct.chopper spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
    animstruct.var_a552ec61e51ece6e[4] = animstruct.chopper spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
    animstruct.var_a552ec61e51ece6e[0] linkto(animstruct.var_b50860e78d9e1e5[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[1] linkto(animstruct.var_b50860e78d9e1e5[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[2] linkto(animstruct.var_b50860e78d9e1e5[1], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[3] linkto(animstruct.var_b50860e78d9e1e5[2], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.var_a552ec61e51ece6e[4] linkto(animstruct.var_b50860e78d9e1e5[3], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.aipilot = animstruct.chopper spawn_script_model("body_mp_western_otter_3_1_lod1", "aiPilot");
    animstruct.aipilothead = spawn("script_model", animstruct.aipilot gettagorigin("j_neck"));
    animstruct.aipilothead setmodel("head_mp_eastern_metalghost_1_1");
    animstruct.aipilothead.animname = "aiPilotHead";
    animstruct.aipilothead linkto(animstruct.aipilot, "j_neck", (-9, 1, 0), (0, 0, 0));
    animstruct.aipilot linkto(animstruct.playerpositionents["parent_solo"], "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.aicopilot = animstruct.chopper spawn_script_model("body_mp_western_otter_3_1_lod1", "aiCopilot");
    var_8b31bc2c19776c6f = spawn("script_model", animstruct.aicopilot gettagorigin("j_neck"));
    var_8b31bc2c19776c6f setmodel("head_mp_eastern_metalghost_1_1");
    var_8b31bc2c19776c6f linkto(animstruct.aicopilot, "j_neck", (-9, 1, 0), (0, 0, 0));
    animstruct.aicopilot linkto(animstruct.playerpositionents["parent_solo"], "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.armadarig = animstruct.chopper spawn_script_model("generic_prop_x10", "armadaRig");
    animstruct.armadarig linkto(animstruct.chopper, "", (0, 0, 0), (0, 0, 0));
    animstruct.armadarig forcenetfieldhighlod(1);
    var_d4e512c7842a8a5d = 9;
    animstruct.var_8a5c28116079c26b = [];
    for (i = 0; i < var_d4e512c7842a8a5d; i++) {
        newchopper = animstruct.chopper spawn_script_model("veh8_mil_air_mindia8_infil_flight", "newChopper" + i);
        newchopper linkto(animstruct.armadarig, "j_prop_" + i + 2, (0, 0, 0), (0, 0, 0));
        newchopper forcenetfieldhighlod(1);
        newchopper playloopsound("br_heli_infil_fleet_lp");
        animstruct.var_8a5c28116079c26b[animstruct.var_8a5c28116079c26b.size] = newchopper;
    }
    animstruct.packs = [];
    n = 0;
    if (!istrue(level.var_f84366b8fdd80cf2)) {
        animstruct.packs[n] = animstruct create_animpack("scene1");
        animstruct.packs[n] add_pack_startfunc([], &function_1d609f282b615eb7);
        animstruct.packs[n] function_e718ba63d511fcde([], &function_447159ec37003898);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_d60e3315aba032e0, level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_cam"]);
        if (isdefined(animstruct.var_7bbc3350e7793cc6)) {
            animstruct.packs[n] add_pack_modelanim(animstruct.var_7bbc3350e7793cc6, level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_cam"]);
        }
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2f73a403f1e61903, level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_cam"]);
        if (isdefined(animstruct.var_a9a5dab973b28fad)) {
            animstruct.packs[n] add_pack_modelanim(animstruct.var_a9a5dab973b28fad, level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_cam"]);
        }
        animstruct.packs[n] add_pack_modelanim(animstruct.playerpositionents["parent_solo"], level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_character_link"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.playerpositionents["parent_squad"], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_character_link"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_player"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player1"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player2"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player3"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player4"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_player"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player1"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player2"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player3"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_mindia8_squad_player4"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.aipilot, level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_pilot"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.aipilothead, level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_pilot"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.aicopilot, level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_copilot"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.armadarig, level.var_1a209bd995a7fa83["wz_infil_mindia8_armada"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_2f73a403f1e61903, "j_prop_1", level.var_1a209bd995a7fa83["wz_infil_mindia8_solo_player"]);
        if (!isdefined(level.scr_notetrack["camera"])) {
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "transition", &function_88ba30853f3d01f0);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "fadeinstart", &function_45739096d37dd8ba);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "fadeoutstart", &function_6e89fafbfcedd6f3);
        }
        if (!isdefined(level.scr_notetrack["cameraSquad"])) {
            namespace_bc4a4b9456315863::addnotetrack_customfunction("cameraSquad", "transition", &function_88ba30853f3d01f0);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("cameraSquad", "fadeinstart", &function_45739096d37dd8ba);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("cameraSquad", "fadeoutstart", &function_6e89fafbfcedd6f3);
        }
    }
    n++;
    animstruct.packs[n] = animstruct create_animpack("looping", 1);
    animstruct.packs[n] add_pack_startfunc([], &function_5ff576fc264728a6);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl01"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl01"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl02"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl03"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl04"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl01"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl01"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl02"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl03"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_pl04"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_2f73a403f1e61903, "j_prop_1");
    return animstruct;
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2012
// Size: 0x1a1
function function_f3ae4b41df047ba0() {
    teams = [];
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(teams[player.team])) {
            teams[player.team] = [];
        }
        teams[player.team][teams[player.team].size] = player;
    }
    foreach (players in teams) {
        numplayers = players.size;
        var_f5b09a636e6e3153 = [0:2, 1:3, 2:4, 3:5];
        if (numplayers == 1) {
            var_f5b09a636e6e3153 = [0:1];
        }
        playercount = 0;
        foreach (player in players) {
            player.infilanimindex = var_f5b09a636e6e3153[playercount % var_f5b09a636e6e3153.size];
            player.var_db122a8941dfee14 = numplayers;
            playercount++;
        }
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ba
// Size: 0x1a7
function function_1d609f282b615eb7(array) {
    function_f3ae4b41df047ba0();
    if (isdefined(self.movingchopper)) {
        self.movingchopper stoploopsound();
    }
    self.aipilot hide();
    self.aicopilot hide();
    self.movingchopper show();
    self.var_c1bf2a7fd5e40dad show();
    thread clearsoundsubmixmpbrinfilanim();
    if (isdefined(self.movingchopper)) {
        self.movingchopper setscriptablepartstate("infil_fx_hero", "on");
        self.movingchopper setscriptablepartstate("infil_fx_mindia8", "moving");
    }
    function_fd00edc34074bb24();
    thread function_69d240b44d66f525();
    thread infil_light_dvars();
    thread delaystreamtomovingplane();
    foreach (armadachopper in self.var_8a5c28116079c26b) {
        var_52d8b7e47fb268fc = getanimlength(level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_veh"]);
        var_23a79fd929b2ba3d = randomfloatrange(0.5, var_52d8b7e47fb268fc - 0.5);
        armadachopper scriptmodelplayanim("wz_infil_mindia8_loop_veh", "armadaChopper", var_23a79fd929b2ba3d);
        armadachopper setscriptablepartstate("infil_fx_armada", "on");
        if (isdefined(armadachopper.innards)) {
            armadachopper.innards scriptmodelplayanim("wz_infil_mindia8_loop_veh", "armadaChopperInnards", var_23a79fd929b2ba3d);
        }
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2368
// Size: 0x14e
function function_447159ec37003898(player, array) {
    /#
        assert(isdefined(player));
    #/
    var_28844396b0024faf = 48;
    var_d1c04ff6328d20d6 = 5.6;
    var_95288242e2d19a2 = 50.7;
    var_8a3ce4d151659d21 = 2;
    var_9b5197cc4bb4356a = 4;
    player playlocalsound("br_heli_infil_part2_lr");
    player setsoundsubmix("mp_br_infil_anim", 0);
    player setsoundsubmix("mp_br_infil_music", 0);
    player setsoundsubmix("mp_br_infil_ac130", 0);
    player setclienttriggeraudiozone("mp_br_c130_infil_int", 1);
    player setclientdvar(@"hash_df1dc712c4a91588", var_28844396b0024faf);
    player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    player enablephysicaldepthoffieldscripting();
    player setphysicaldepthoffield(var_d1c04ff6328d20d6, var_95288242e2d19a2, var_8a3ce4d151659d21, var_9b5197cc4bb4356a);
    self.aipilot showtoplayer(player);
    self.aicopilot showtoplayer(player);
    if (!isdefined(player.infilcoveroverlay)) {
        player.infilcoveroverlay = newclienthudelem(player);
        function_347d499c7fd9af39(player.infilcoveroverlay);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24bd
// Size: 0xb9
function function_347d499c7fd9af39(hudelem) {
    hudelem.x = 0;
    hudelem.y = 0;
    hudelem setshader("white", 640, 480);
    hudelem.alignx = "left";
    hudelem.aligny = "top";
    hudelem.horzalign = "fullscreen";
    hudelem.vertalign = "fullscreen";
    hudelem.sort = -1;
    hudelem.color = (0.21, 0.21, 0.17);
    hudelem.alpha = 0;
    hudelem setshowinrealism(1);
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257d
// Size: 0x1bb
function function_5ff576fc264728a6(array) {
    if (istrue(level.var_f84366b8fdd80cf2)) {
        if (isdefined(self.movingchopper)) {
            self.movingchopper setscriptablepartstate("infil_fx_hero", "on");
            self.movingchopper setscriptablepartstate("infil_fx_mindia8", "moving");
        }
        foreach (armadachopper in self.var_8a5c28116079c26b) {
            var_52d8b7e47fb268fc = getanimlength(level.var_1a209bd995a7fa83["wz_infil_mindia8_loop_veh"]);
            var_23a79fd929b2ba3d = randomfloatrange(0.5, var_52d8b7e47fb268fc - 0.5);
            armadachopper scriptmodelplayanim("wz_infil_mindia8_loop_veh", "armadaChopper", var_23a79fd929b2ba3d);
            armadachopper setscriptablepartstate("infil_fx_armada", "on");
            if (isdefined(armadachopper.innards)) {
                armadachopper.innards scriptmodelplayanim("wz_infil_mindia8_loop_veh", "armadaChopperInnards", var_23a79fd929b2ba3d);
            }
        }
        self.var_7bbc3350e7793cc6 scriptmodelplayanim("wz_infil_mindia8_solo_cam", "cameramoving", 10, 6);
        self.var_a9a5dab973b28fad scriptmodelplayanim("wz_infil_mindia8_squad_cam", "cameraSquadmoving", 10, 6);
        self.armadarig scriptmodelplayanim("wz_infil_mindia8_armada", "armadaRig", 0, 3);
        function_88ba30853f3d01f0();
    }
    self.chopper stoploopsound();
    if (isdefined(self.movingchopper)) {
        self.movingchopper playloopsound("br_heli_infil_hero_lp");
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273f
// Size: 0x12
function function_a5668882499fb369() {
    namespace_56a3588493afc984::cleanupents();
    level notify("cleanupInfil");
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2758
// Size: 0x86
function private clearsoundsubmixmpbrinfilanim() {
    level endon("cleanupInfil");
    waitandpause(0.65);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_anim", 3);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27e5
// Size: 0x7f
function private clearsoundsubmixfadetoblackamb() {
    waitandpause(0.5);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 1);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x286b
// Size: 0x7f
function private function_c6cedf68afe4e839() {
    waitandpause(7.7);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_ac130", 30);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28f1
// Size: 0x85
function private function_fd00edc34074bb24(c130) {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player) || isbot(player)) {
            continue;
        }
        player setwind("80", 1);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x297d
// Size: 0x61
function function_69d240b44d66f525() {
    level endon("cleanupInfil");
    if (isdefined(self.chopperdoor)) {
        self.chopperdoor hide();
    }
    self.var_d60e3315aba032e0 waittill_match_or_timeout("camera", "showdoor", 30);
    if (isdefined(self.chopperdoor)) {
        self.chopperdoor show();
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29e5
// Size: 0x7a
function private clearplayerwind() {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setwind("1");
        player.manualoverridewindmaterial = undefined;
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a66
// Size: 0xce
function private function_45739096d37dd8ba(c130) {
    fadeintime = 0.15;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.infilcoveroverlay)) {
            continue;
        }
        player.infilcoveroverlay.alpha = 0;
        player.infilcoveroverlay fadeovertime(fadeintime);
        player.infilcoveroverlay.alpha = 1;
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b3b
// Size: 0x155
function private function_6e89fafbfcedd6f3(c130) {
    fadeouttime = 0.2;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.infilcoveroverlay)) {
            continue;
        }
        player.infilcoveroverlay.alpha = 1;
        player.infilcoveroverlay fadeovertime(fadeouttime);
        player.infilcoveroverlay.alpha = 0;
    }
    waitandpause(fadeouttime + 0.1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.infilcoveroverlay)) {
            continue;
        }
        player.infilcoveroverlay destroy();
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c97
// Size: 0x552
function private function_88ba30853f3d01f0(c130) {
    level.infilstruct.animstruct notify("infil_reset_light_dvars");
    level.infilstruct.animstruct clearplayerwind();
    var_1992f143059ac1d5 = 65;
    var_e49fe50208c2823c = 14;
    var_60a2fccf1c5e6d84 = 35;
    var_af0267d0ec57107f = 2;
    var_92de264f62389db4 = 4;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
        player setclienttriggeraudiozone("mp_br_infil_ext", 2);
    }
    if (isdefined(level.infilstruct.animstruct.movingchopper)) {
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            cameraent = ter_op(player.var_db122a8941dfee14 == 1, level.infilstruct.animstruct.var_7bbc3350e7793cc6, level.infilstruct.animstruct.var_a9a5dab973b28fad);
            cameratag = "j_prop_1";
            player cameraunlink();
            player cameralinkto(cameraent, cameratag, 1, 1);
            player setclientdvar(@"hash_df1dc712c4a91588", var_1992f143059ac1d5);
            player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
            player setphysicaldepthoffield(var_e49fe50208c2823c, var_60a2fccf1c5e6d84, var_af0267d0ec57107f, var_92de264f62389db4);
            player thread function_9441cfee5f114846();
        }
        level thread clearsoundsubmixfadetoblackamb();
        level.infilstruct.animstruct.playerpositionents["parent_solo"] unlink();
        level.infilstruct.animstruct.playerpositionents["parent_squad"] unlink();
        level.infilstruct.animstruct.playerpositionents["parent_solo"] linkto(level.infilstruct.animstruct.movingchopper, "", (0, 0, 0), (0, 0, 0));
        level.infilstruct.animstruct.playerpositionents["parent_squad"] linkto(level.infilstruct.animstruct.movingchopper, "", (0, 0, 0), (0, 0, 0));
        level.infilstruct.animstruct.armadarig unlink();
        level.infilstruct.animstruct.armadarig linkto(level.infilstruct.animstruct.movingchopper, "", (0, 0, 0), (0, 0, 0));
        level.infilstruct.animstruct.movingchopper scriptmodelplayanim("wz_infil_mindia8_loop_veh", "movingChopper");
        level.infilstruct.animstruct.movingchopper.innards scriptmodelplayanim("wz_infil_mindia8_loop_veh", "movingChopperInnards");
        level.infilstruct.animstruct.playerpositionents["parent_solo"] scriptmodelplayanim("wz_infil_mindia8_loop_genpropx10", "prop");
        level.infilstruct.animstruct.playerpositionents["parent_squad"] scriptmodelplayanim("wz_infil_mindia8_loop_genpropx10", "prop");
        if (istrue(level.var_f84366b8fdd80cf2)) {
            level waittill("play_video_complete");
        }
        level.infilstruct.animstruct.movingchopper notify("start_moving");
        if (istrue(level.var_f84366b8fdd80cf2)) {
            wait(3.5);
        }
    }
    level.infilstruct.animstruct.aipilot hide();
    level.infilstruct.animstruct.aicopilot hide();
    setomnvar("ui_hide_player_icons", 0);
    level thread function_c6cedf68afe4e839();
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31f0
// Size: 0x20
function function_9441cfee5f114846() {
    if (istrue(level.var_f84366b8fdd80cf2)) {
        level waittill("play_video_complete");
    }
    self notify("infil_move");
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3217
// Size: 0x142
function private infil_light_dvars() {
    level endon("cleanupInfil");
    var_c3ed855fe7c983e3 = getdvarfloat(@"hash_8667c0bb90c5bfc3");
    var_1800e53d66415e2d = getdvarint(@"hash_63eb1893f96ac98d");
    var_5506432d2291c178 = getdvarint(@"hash_1dde331a8e0153d8");
    var_488f9b9fe1ead0a6 = getdvarfloat(@"hash_9ab6a766fc4e0c06");
    var_64224ecf1e2975d9 = getdvarint(@"hash_e6ac75ab2927895b");
    setdvar(@"hash_8667c0bb90c5bfc3", 1000);
    setdvar(@"hash_63eb1893f96ac98d", 8);
    setdvar(@"hash_1dde331a8e0153d8", 8);
    setdvar(@"hash_9ab6a766fc4e0c06", 0.25);
    setdvar(@"hash_e6ac75ab2927895b", 0);
    waittill_either("infil_reset_light_dvars", "stopScene");
    setdvar(@"hash_8667c0bb90c5bfc3", var_c3ed855fe7c983e3);
    setdvar(@"hash_63eb1893f96ac98d", var_1800e53d66415e2d);
    setdvar(@"hash_1dde331a8e0153d8", var_5506432d2291c178);
    setdvar(@"hash_9ab6a766fc4e0c06", var_488f9b9fe1ead0a6);
    setdvar(@"hash_e6ac75ab2927895b", var_64224ecf1e2975d9);
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3360
// Size: 0x138
function private delaystreamtomovingplane() {
    self endon("stopScene");
    level endon("cleanupInfil");
    if (isdefined(self.movingchopper)) {
        delaytime = getdvarint(@"hash_d01d0472d843d39e", 8);
        wait(delaytime);
        if (!isdefined(self.movingchopper)) {
            return;
        }
        var_11f3b4465c8b637b = self.movingchopper.origin;
        forward = getdvarint(@"hash_7abcda2d7aabbe4c", 0);
        if (forward > 0) {
            dir = anglestoforward(self.movingchopper.angles);
            var_11f3b4465c8b637b = self.movingchopper.origin + dir * forward;
        }
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setpredictedstreamloaddist(0);
            player namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_11f3b4465c8b637b);
        }
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x349f
// Size: 0xac
function private stopstreamtomovingplane() {
    if (isdefined(self.movingchopper) && getdvarint(@"hash_eb8a05afa7735e5f", 1) == 1) {
        delaytime = getdvarint(@"hash_b7c6d487b0f5506b", 5);
        wait(delaytime);
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player thread namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
        }
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3552
// Size: 0xc1
function function_5901cd0be722f86a() {
    br_infil_intro = function_17ee301cf0b5ba85("br_infil_intro");
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setentitysoundcontext("lobby_fade", "", 2);
        player playlocalsound("br_heli_infil_part1_lr");
        player clearsoundsubmix("mp_br_lobby_fade", 1.5);
        player setsoundsubmix("solo_cin_igc_music", 0.5);
        player setplayermusicstate(br_infil_intro);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361a
// Size: 0xc
function function_39c2cf6576478d41() {
    level thread setsoundsubmixfadetoblackamb();
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x362d
// Size: 0xad
function private setsoundsubmixfadetoblackamb(players) {
    level endon("cleanupInfil");
    if (!istrue(level.var_f84366b8fdd80cf2)) {
        waitandpause(2);
    }
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("solo_cin_igc_music", 0.5);
        player setsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 2);
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e1
// Size: 0x1ff
function function_ad4a7a73c7d7d9e0() {
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    var_4b52f031a2cbef8e = anglestoforward(level.infilstruct.c130.angles);
    var_d8bb89f41ae3d919 = anglestoright(level.infilstruct.c130.angles);
    var_172d42d175e16c61 = vectordot(playerforward, var_4b52f031a2cbef8e);
    var_ed451f0ea36c48c6 = vectordot(playerforward, var_d8bb89f41ae3d919);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + self.infilanimindex + 2;
    cos45 = cos(45);
    if (var_172d42d175e16c61 < -1 * cos45) {
        return [0:"wz_infil_mindia8_jump_genpropx10", 1:level.var_1a209bd995a7fa83["wz_infil_mindia8_jump_genpropx10"], 2:"wz_infil_mindia8_jump01_pl01", 3:var_8e3afd40d3c95b46];
    }
    if (var_ed451f0ea36c48c6 > cos45) {
        return [0:"wz_infil_mindia8_jump_genpropx10_90_l", 1:level.var_1a209bd995a7fa83["wz_infil_mindia8_jump_genpropx10_90_l"], 2:"wz_infil_mindia8_jump01_pl01_90_l", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 < -1 * cos45) {
        return [0:"wz_infil_mindia8_jump_genpropx10_90_r", 1:level.var_1a209bd995a7fa83["wz_infil_mindia8_jump_genpropx10_90_r"], 2:"wz_infil_mindia8_jump01_pl01_90_r", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 > 0) {
        return [0:"wz_infil_mindia8_jump_genpropx10_180_l", 1:level.var_1a209bd995a7fa83["wz_infil_mindia8_jump_genpropx10_180_l"], 2:"wz_infil_mindia8_jump01_pl01_180_l", 3:var_8e3afd40d3c95b46];
    } else {
        return [0:"wz_infil_mindia8_jump_genpropx10_180_r", 1:level.var_1a209bd995a7fa83["wz_infil_mindia8_jump_genpropx10_180_r"], 2:"wz_infil_mindia8_jump01_pl01_180_r", 3:var_8e3afd40d3c95b46];
    }
}

// Namespace namespace_58c6a84f987ee8e1/namespace_5c75c180befb8e98
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e7
// Size: 0xae
function function_b766175a1f0eeb13(var_c7f46ef27d351cd0, movetime) {
    level endon("game_ended");
    self endon("death");
    self hide();
    if (isdefined(self.innards)) {
        self.innards hide();
    }
    self waittill("start_moving");
    self show();
    if (isdefined(self.innards)) {
        self.innards show();
    }
    self moveto(var_c7f46ef27d351cd0, movetime);
    /#
        if (getdvarint(@"hash_c25457fbe123d92f", 0)) {
            movetime = movetime - 10;
        }
    #/
    thread namespace_ad389306d44fc6b4::killaftertime(movetime, "c130");
    self playloopsound("br_heli_infil_hero_lp");
}

