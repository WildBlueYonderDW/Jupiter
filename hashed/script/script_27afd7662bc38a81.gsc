// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\anim.gsc;
#using script_75377e59f5becac8;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_6775ad452d13858;

#namespace br_infils_ac130;

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da7
// Size: 0x249
function init() {
    /#
        assert(isdefined(level.infilstruct));
    #/
    /#
        setdevdvarifuninitialized(@"hash_ef579438c4248057", 3.75);
        setdevdvarifuninitialized(@"hash_224074cc9cbd34e3", 1);
        setdevdvarifuninitialized(@"hash_916619431dc89fba", 6);
        setdevdvarifuninitialized(@"hash_419ab155ef9169a4", 3);
        setdevdvarifuninitialized(@"hash_4ee80a43d1c50ca2", 1);
        setdevdvarifuninitialized(@"hash_bfded00ac93c45b7", 1);
        setdevdvarifuninitialized(@"hash_7f1da0c3501cbdf2", 1);
        setdevdvarifuninitialized(@"hash_5fd54d13e95394d5", 0);
    #/
    level.infilstruct.var_fd05dc031a2e7283 = ter_op(getdvarint(@"hash_2be93dd484220a45", 0) == 1, "shadow::veh9_mil_air_cargo_plane_exterior_infil", "jup_black_wz::veh9_mil_air_cargo_plane_exterior_infil");
    level.infilstruct.var_30e653e12f358438 = "veh9_mil_air_cargo_plane_interior_infil";
    level.infilstruct.var_c3a4f4442070a8b5 = "tag_body_animate";
    delaythread(0.05, &function_c880edba9face762, "ac130");
    level.infilstruct.var_b381e33e977da440 = &function_55f2480b4b819aea;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.var_8d5c19a9b693e913 = &function_8d5c19a9b693e913;
    level.infilstruct.var_dc0bc83a31193177 = &function_dc0bc83a31193177;
    level.infilstruct.var_12c912ee9672fa1 = 1;
    level.infilstruct.var_eb0e85a583f21b9d = 1;
    level.infilstruct.var_7a96307b6a7ed797 = "veh_br_infil_c17_distant_lp";
    var_1809e16510055e87 = [0:"cam_orbit_br_infil_ac130_player1", 1:"cam_orbit_br_infil_ac130_player2", 2:"cam_orbit_br_infil_ac130_player3", 3:"cam_orbit_br_infil_ac130_player4", 4:"cam_orbit_br_infil_ac130_player1"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("fadedown", &function_26874fd7694aa29);
    game["dialog"]["infil_ac130_5_seconds"] = "dx_br_dmzc_infl_ldms_drop";
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff7
// Size: 0x58
function function_9afdeab1e38dac18(animstruct, var_46b59aa03461a82e) {
    if (isdefined(animstruct.staticc130)) {
        add_pack_modelanim(animstruct.staticc130, var_46b59aa03461a82e);
    }
    if (isdefined(animstruct.movingc130)) {
        add_pack_modelanim(animstruct.movingc130, var_46b59aa03461a82e);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2056
// Size: 0x39ef
function function_55f2480b4b819aea(movingc130) {
    animstruct = spawnstruct();
    animstruct.origin = getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0));
    animstruct.angles = (0, 0, 0);
    animstruct.var_7a2af7fe0ef35baa = getdvarint(@"hash_4ee80a43d1c50ca2", 1);
    animstruct.var_3772737101aa4af = level.var_2655050b4d075e87;
    animstruct.cleanupfunc = &function_72145194f4f38714;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130.animname = "movingC130";
        animstruct.movingc130.innards.animname = "movingC130";
        animstruct.movingc130.animstruct = animstruct;
        animstruct.movingc130.var_6a704063a0555c1d = 1;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br_infils_ac130", "getAnimStruct")) {
        animstruct = [[ namespace_3c37cb17ade254d::getsharedfunc("br_infils_ac130", "getAnimStruct") ]](animstruct);
    } else {
        animstruct.staticc130 = getent("infil_ac130_exterior", "targetname");
        if (isdefined(animstruct.staticc130)) {
            animstruct.staticc130 show();
            animstruct.staticc130.animname = "c130";
            animstruct.staticc130.var_662efe6105e9f585 = 1;
        } else {
            animstruct.staticc130 = animstruct spawn_script_model("jup_black_wz::veh9_mil_air_cargo_plane_exterior_infil", "c130");
        }
        animstruct.staticc130.var_6a704063a0555c1d = 1;
        animstruct.var_e73ce295ae9d4104 = animstruct spawn_script_model("generic_prop_x30", "camera");
        animstruct.var_e73ce295ae9d4104 linkto(animstruct.staticc130, "tag_body_animate", (0, 0, 0), (0, 0, 0));
        animstruct.introPlane = animstruct spawn_script_model("black::veh9_mil_air_cargo_plane", "introPlane");
        animstruct.introPlane linkto(animstruct.var_e73ce295ae9d4104, "j_prop_30");
        skins = [0:"milsim_western_a", 1:"milsim_western_b", 2:"milsim_western_c", 3:"milsim_western_d", 4:"milsim_eastern_a", 5:"milsim_eastern_b", 6:"milsim_eastern_c", 7:"milsim_eastern_d"];
        animstruct.var_b50860e78d9e1e5 = [];
        animstruct.var_b50860e78d9e1e5[0] = animstruct spawn_script_model("tag_player", "playerTag1");
        animstruct.var_b50860e78d9e1e5[1] = animstruct spawn_script_model("tag_player", "playerTag2");
        animstruct.var_b50860e78d9e1e5[2] = animstruct spawn_script_model("tag_player", "playerTag3");
        animstruct.var_b50860e78d9e1e5[3] = animstruct spawn_script_model("tag_player", "playerTag4");
        animstruct.var_b50860e78d9e1e5[4] = animstruct spawn_script_model("tag_player", "playerTag5");
        animstruct.var_b50860e78d9e1e5[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_2", (0, 0, 0), (0, 0, 0));
        animstruct.var_b50860e78d9e1e5[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_3", (0, 0, 0), (0, 0, 0));
        animstruct.var_b50860e78d9e1e5[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_4", (0, 0, 0), (0, 0, 0));
        animstruct.var_b50860e78d9e1e5[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_5", (0, 0, 0), (0, 0, 0));
        animstruct.var_b50860e78d9e1e5[4] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_15", (0, 0, 0), (0, 0, 0));
        animstruct.var_a552ec61e51ece6e = [];
        animstruct.var_a552ec61e51ece6e[0] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
        animstruct.var_a552ec61e51ece6e[1] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
        animstruct.var_a552ec61e51ece6e[2] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
        animstruct.var_a552ec61e51ece6e[3] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
        animstruct.var_a552ec61e51ece6e[4] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player5");
        animstruct.var_a552ec61e51ece6e[0] linkto(animstruct.var_b50860e78d9e1e5[0], "tag_player", (0, 0, 0), (0, 0, 0));
        animstruct.var_a552ec61e51ece6e[1] linkto(animstruct.var_b50860e78d9e1e5[1], "tag_player", (0, 0, 0), (0, 0, 0));
        animstruct.var_a552ec61e51ece6e[2] linkto(animstruct.var_b50860e78d9e1e5[2], "tag_player", (0, 0, 0), (0, 0, 0));
        animstruct.var_a552ec61e51ece6e[3] linkto(animstruct.var_b50860e78d9e1e5[3], "tag_player", (0, 0, 0), (0, 0, 0));
        animstruct.var_a552ec61e51ece6e[4] linkto(animstruct.var_b50860e78d9e1e5[4], "tag_player", (0, 0, 0), (0, 0, 0));
        var_d84aaa47282d5918 = array_randomize(skins);
        animstruct.var_a552ec61e51ece6e[0] function_66b13900c5013de5(var_d84aaa47282d5918[0]);
        animstruct.var_a552ec61e51ece6e[1] function_66b13900c5013de5(var_d84aaa47282d5918[1]);
        animstruct.var_a552ec61e51ece6e[2] function_66b13900c5013de5(var_d84aaa47282d5918[2]);
        animstruct.var_a552ec61e51ece6e[3] function_66b13900c5013de5(var_d84aaa47282d5918[3]);
        animstruct.var_a552ec61e51ece6e[4] function_66b13900c5013de5(var_d84aaa47282d5918[4]);
        animstruct.crates = [];
        animstruct.crates[0] = animstruct spawn_script_model("military_carepackage_03_br", "crate1");
        animstruct.crates[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_8", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d = [];
        animstruct.var_2668fb5d52d6438d[0] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc1");
        animstruct.var_2668fb5d52d6438d[1] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc2");
        animstruct.var_2668fb5d52d6438d[2] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc3");
        animstruct.var_2668fb5d52d6438d[3] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc4");
        animstruct.var_2668fb5d52d6438d[4] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc5");
        animstruct.var_2668fb5d52d6438d[5] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "npc6");
        animstruct.var_2668fb5d52d6438d[0] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_9", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d[1] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_10", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d[2] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_11", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d[3] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_12", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d[4] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_13", (0, 0, 0), (0, 0, 0));
        animstruct.var_2668fb5d52d6438d[5] linkto(animstruct.var_e73ce295ae9d4104, "j_prop_14", (0, 0, 0), (0, 0, 0));
        var_d84aaa47282d5918 = array_randomize(skins);
        animstruct.var_2668fb5d52d6438d[0] function_66b13900c5013de5(var_d84aaa47282d5918[0]);
        animstruct.var_2668fb5d52d6438d[1] function_66b13900c5013de5(var_d84aaa47282d5918[1]);
        animstruct.var_2668fb5d52d6438d[2] function_66b13900c5013de5(var_d84aaa47282d5918[2]);
        animstruct.var_2668fb5d52d6438d[3] function_66b13900c5013de5(var_d84aaa47282d5918[3]);
        animstruct.var_2668fb5d52d6438d[4] function_66b13900c5013de5(var_d84aaa47282d5918[4]);
        animstruct.var_2668fb5d52d6438d[5] function_66b13900c5013de5(var_d84aaa47282d5918[5]);
        animstruct.packs = [];
        n = 0;
        var_e92aed86e7dd8b76 = 10;
        var_630e1dfe2a5b41ca = 10;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene0.0");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_1a124e836e45482c);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh000"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.introPlane, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh000"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh000"], "wz_infil_xcam_sh000_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh000_quads", 1:"wz_infil_xcam_sh000_quads", 2:"wz_infil_xcam_sh000_quads", 3:"wz_infil_xcam_sh000_quads"];
        if (!isdefined(level.scr_notetrack["camera"]) || !isdefined(level.scr_notetrack["camera"]["any"]["infil_header_player1"])) {
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "infil_header_player1", &function_1a5e2c1cef16393f);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "infil_header_player2", &function_7797914101c3a342);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "infil_header_player3", &function_e86f60ffd1abcd75);
            namespace_bc4a4b9456315863::addnotetrack_customfunction("camera", "infil_header_player4", &function_a9090d88a8813828);
        }
        n++;
        var_e92aed86e7dd8b76 = 35;
        var_630e1dfe2a5b41ca = 30;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene4");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_baf143dbadb3f80);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh040"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh040"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh040"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh040"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh040"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh040"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh040"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh040"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh040"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh040"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh040"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh040"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh040"], "wz_infil_xcam_sh040_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh040_solos", 1:"wz_infil_xcam_sh040_solos", 2:"wz_infil_xcam_sh040_quads", 3:"wz_infil_xcam_sh040_quads"];
        n++;
        var_e92aed86e7dd8b76 = 7.5;
        var_630e1dfe2a5b41ca = 40;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene5");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_9af898862a8c98b9);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh050"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh050"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh050"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh050"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh050"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh050"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh050"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh050"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh050"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh050"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh050"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh050"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh050"], "wz_infil_xcam_sh050_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh050_solos", 1:"wz_infil_xcam_sh050_solos", 2:"wz_infil_xcam_sh050_quads", 3:"wz_infil_xcam_sh050_quads"];
        n++;
        var_e92aed86e7dd8b76 = 30;
        var_630e1dfe2a5b41ca = 40;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene6");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_646b15a1f9a1e55a);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh060"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh060"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh060"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh060"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh060"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh060"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh060"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh060"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh060"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh060"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh060"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh060"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh060"], "wz_infil_xcam_sh060_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh060_solos", 1:"wz_infil_xcam_sh060_solos", 2:"wz_infil_xcam_sh060_quads", 3:"wz_infil_xcam_sh060_quads"];
        n++;
        var_e92aed86e7dd8b76 = 20;
        var_630e1dfe2a5b41ca = 50;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene7");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_a1154be6e3c8a13);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh070"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh070"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh070"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh070"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh070"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh070"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh070"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh070"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh070"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh070"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh070"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh070"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh070"], "wz_infil_xcam_sh070_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh070_solos", 1:"wz_infil_xcam_sh070_solos", 2:"wz_infil_xcam_sh070_quads", 3:"wz_infil_xcam_sh070_quads"];
        n++;
        var_e92aed86e7dd8b76 = 30;
        var_630e1dfe2a5b41ca = 50;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene8");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_5252a2070a63d534);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh080"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh080"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh080"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh080"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh080"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh080"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh080"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh080"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh080"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh080"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh080"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh080"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh080"], "wz_infil_xcam_sh080_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh080_solos", 1:"wz_infil_xcam_sh080_solos", 2:"wz_infil_xcam_sh080_quads", 3:"wz_infil_xcam_sh080_quads"];
        n++;
        var_e92aed86e7dd8b76 = 25;
        var_630e1dfe2a5b41ca = 31.78;
        var_92c2f39adf1c2e62 = 1;
        animstruct.packs[n] = animstruct create_animpack("scene9");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_6822439c818b5b8d);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh090"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh090"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh090"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh090"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh090"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh090"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh090"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh090"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh090"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh090"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh090"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh090"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh090"], "wz_infil_xcam_sh090_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh090_solos", 1:"wz_infil_xcam_sh090_quads", 2:"wz_infil_xcam_sh090_solos", 3:"wz_infil_xcam_sh090_quads"];
        n++;
        var_e92aed86e7dd8b76 = 20;
        var_630e1dfe2a5b41ca = 17.847;
        var_92c2f39adf1c2e62 = 1;
        animstruct.packs[n] = animstruct create_animpack("scene10");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_9cfd7cab1a6e747b);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh100"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh100"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh100"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh100"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh100"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh100"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh100"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh100"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh100"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh100"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_solowin_guy1_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh100"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh100"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh100"], "wz_infil_xcam_sh100_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh100_solos", 1:"wz_infil_xcam_sh100_quads", 2:"wz_infil_xcam_sh100_solos", 3:"wz_infil_xcam_sh100_quads"];
        n++;
        var_e92aed86e7dd8b76 = 40;
        var_630e1dfe2a5b41ca = 40;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene11");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_2391d520e79f9862);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh110"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh110"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh110"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh110"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh110"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh110"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh110"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh110"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh110"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh110"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh110"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh110"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh110"], "wz_infil_xcam_sh110_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh110_quads", 1:"wz_infil_xcam_sh110_quads", 2:"wz_infil_xcam_sh110_quads", 3:"wz_infil_xcam_sh110_quads"];
        n++;
        var_e92aed86e7dd8b76 = 45;
        var_630e1dfe2a5b41ca = 45;
        var_92c2f39adf1c2e62 = 0;
        animstruct.packs[n] = animstruct create_animpack("scene12");
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_e63ab2e92ddffaa1);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_sh120"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh120"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh120"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh120"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh120"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh120"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh120"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_sh120"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_sh120"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_sh120"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.crates[0], level.var_1a209bd995a7fa83["wz_infil_cargobox_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5_sh120"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6_sh120"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, "tag_origin", level.var_1a209bd995a7fa83["wz_infil_g_prop_sh120"], "wz_infil_xcam_sh120_quads", &function_3ad82a1083bf9fde);
        animstruct.packs[n].xcams = [0:"wz_infil_xcam_sh120_quads", 1:"wz_infil_xcam_sh120_quads", 2:"wz_infil_xcam_sh120_quads", 3:"wz_infil_xcam_sh120_quads"];
        var_e92aed86e7dd8b76 = 45;
        var_630e1dfe2a5b41ca = 45;
        var_92c2f39adf1c2e62 = 0;
        n++;
        animstruct.packs[n] = animstruct create_animpack("looping", 1);
        animstruct.packs[n] add_pack_startfunc([0:var_e92aed86e7dd8b76, 1:var_630e1dfe2a5b41ca, 2:var_92c2f39adf1c2e62], &function_f90e2db4b34d7f57);
        animstruct.packs[n] function_e718ba63d511fcde([], &function_60240beede5e1ab8);
        animstruct.packs[n] function_9afdeab1e38dac18(animstruct, level.var_1a209bd995a7fa83["wz_infil_cargoplane_idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_e73ce295ae9d4104, level.var_1a209bd995a7fa83["wz_infil_g_prop_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
        animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.var_b50860e78d9e1e5[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy2_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy3_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy4_idle_sh010"]);
        animstruct.packs[n] function_f7fc8b110c478968(animstruct.var_a552ec61e51ece6e[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy1_idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[0], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc1idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[1], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc2idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[2], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc3idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[3], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc4idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[4], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc5idle_sh010"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.var_2668fb5d52d6438d[5], level.var_1a209bd995a7fa83["wz_infil_drone_guy_npc6idle_sh010"]);
        animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.var_e73ce295ae9d4104, &function_e128261218fafdaa);
    }
    return animstruct;
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a4d
// Size: 0xb3
function function_cc1b64e82fd4680c(players) {
    /#
        assertex(isarray(players));
    #/
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

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b08
// Size: 0x5c5
function function_f3ae4b41df047ba0(array) {
    var_64be57cf259833de = 0;
    var_e92aed86e7dd8b76 = undefined;
    var_630e1dfe2a5b41ca = undefined;
    var_92c2f39adf1c2e62 = 0;
    if (isdefined(array) && array.size >= 2 && isnumber(array[0]) && isnumber(array[1])) {
        var_64be57cf259833de = 1;
        var_e92aed86e7dd8b76 = array[0];
        var_630e1dfe2a5b41ca = array[1];
    }
    if (isdefined(array) && array.size >= 3) {
        var_92c2f39adf1c2e62 = array[2];
    }
    pack = self.var_2739b8c6b038ba5e;
    /#
        assert(isdefined(pack));
    #/
    pack.var_92c2f39adf1c2e62 = var_92c2f39adf1c2e62;
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
        var_f5b09a636e6e3153 = [0:1, 1:2, 2:3, 3:4];
        if (isdefined(level.var_ca06425e37af610c)) {
            var_f5b09a636e6e3153 = [[ level.var_ca06425e37af610c ]](numplayers, var_92c2f39adf1c2e62);
        } else if (numplayers == 1) {
            var_f5b09a636e6e3153 = [0:5];
        } else if (numplayers == 2) {
            if (var_92c2f39adf1c2e62) {
                var_f5b09a636e6e3153 = [0:1, 1:4];
            } else {
                var_f5b09a636e6e3153 = [0:5, 1:4];
            }
        } else if (var_92c2f39adf1c2e62 && numplayers == 3) {
            var_f5b09a636e6e3153 = [0:5, 1:2, 2:3, 3:4];
        }
        playercount = 0;
        foreach (player in players) {
            player.infilanimindex = var_f5b09a636e6e3153[playercount % var_f5b09a636e6e3153.size];
            player.var_db122a8941dfee14 = numplayers;
            playercount++;
        }
        if (var_64be57cf259833de) {
            var_69ff9b8be936ac16 = var_630e1dfe2a5b41ca;
            if (var_92c2f39adf1c2e62 && numplayers == 2) {
                var_69ff9b8be936ac16 = var_630e1dfe2a5b41ca;
            } else if (var_92c2f39adf1c2e62 && numplayers == 3) {
                var_69ff9b8be936ac16 = var_e92aed86e7dd8b76;
            } else if (numplayers < 3) {
                var_69ff9b8be936ac16 = var_e92aed86e7dd8b76;
            }
            foreach (player in players) {
                player setclientdvar(@"hash_df1dc712c4a91588", var_69ff9b8be936ac16);
                player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
            }
        }
    }
    if (var_e49a1c04ac964563) {
        pack.var_a39842bcdfc531c2 = 1;
        pack.var_3bd5282b118d27f8 = array_removeundefined(pack.var_3bd5282b118d27f8);
        if (pack.var_3bd5282b118d27f8.size >= 5) {
            foreach (var_10727dcc51c74547 in pack.var_3bd5282b118d27f8) {
                var_10727dcc51c74547 hide();
            }
            if (var_1ff908a48d4dc0d3 == 1) {
                pack.var_3bd5282b118d27f8[4] show();
            } else if (var_1ff908a48d4dc0d3 == 2) {
                if (var_92c2f39adf1c2e62) {
                    pack.var_3bd5282b118d27f8[0] show();
                    pack.var_3bd5282b118d27f8[3] show();
                } else {
                    pack.var_3bd5282b118d27f8[4] show();
                    pack.var_3bd5282b118d27f8[3] show();
                }
            } else if (var_1ff908a48d4dc0d3 == 3) {
                if (var_92c2f39adf1c2e62) {
                    pack.var_3bd5282b118d27f8[4] show();
                    pack.var_3bd5282b118d27f8[1] show();
                    pack.var_3bd5282b118d27f8[2] show();
                } else {
                    pack.var_3bd5282b118d27f8[0] show();
                    pack.var_3bd5282b118d27f8[1] show();
                    pack.var_3bd5282b118d27f8[2] show();
                }
            } else {
                pack.var_3bd5282b118d27f8[0] show();
                pack.var_3bd5282b118d27f8[1] show();
                pack.var_3bd5282b118d27f8[2] show();
                pack.var_3bd5282b118d27f8[3] show();
            }
        } else if (pack.var_3bd5282b118d27f8.size >= 4) {
            var_2246d8f267e2c3de = 0;
            foreach (var_10727dcc51c74547 in pack.var_3bd5282b118d27f8) {
                if (var_2246d8f267e2c3de < var_1ff908a48d4dc0d3) {
                    var_10727dcc51c74547 show();
                } else {
                    var_10727dcc51c74547 hide();
                }
            }
        }
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x60d4
// Size: 0x42
function private function_a0d0e8089bfd149(callbackfunc) {
    if (isdefined(self.staticc130)) {
        self [[ callbackfunc ]](self.staticc130);
    }
    if (isdefined(self.movingc130)) {
        self [[ callbackfunc ]](self.movingc130);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x611d
// Size: 0x33
function private function_7f4bbc61ad158330(c130) {
    c130 show();
    if (isdefined(c130.innards)) {
        c130.innards show();
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6157
// Size: 0x1d
function private function_6c267f4c5a7845ae(c130) {
    c130 setscriptablepartstate("running_lights", "on");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x617b
// Size: 0xdf
function function_c53ec4fa5d1e2eae(teams, var_6d317d76597942a) {
    /#
        assert(isarray(teams));
    #/
    /#
        assert(isarray(var_6d317d76597942a));
    #/
    foreach (players in teams) {
        /#
            assert(var_6d317d76597942a.size >= players.size);
        #/
        sounds = var_6d317d76597942a[players.size - 1];
        for (i = 0; i < players.size; i++) {
            alias = sounds[i];
            if (isstring(alias) && alias != "") {
                function_7acde5feb50c98f2(players, alias);
            }
        }
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6261
// Size: 0x68
function function_6913bd6620c40d4c() {
    var_ce07a0a6d5c4501 = ter_op(isdefined(level.var_5621a5132074da11), level.var_5621a5132074da11, "mp_saba_infil_exterior");
    self visionsetnakedforplayer(var_ce07a0a6d5c4501, 0);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_451319f93d30ebe5(%"hash_16737cfa86d4521");
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62d0
// Size: 0x28f
function function_1a124e836e45482c(array) {
    function_f3ae4b41df047ba0(array);
    function_a0d0e8089bfd149(&function_7f4bbc61ad158330);
    self.introPlane setscriptablepartstate("running_lights", "on");
    function_a0d0e8089bfd149(&function_6c267f4c5a7845ae);
    var_a98a49377dbbb3fb = getdvarint(@"hash_5fd54d13e95394d5", 0);
    if (var_a98a49377dbbb3fb) {
        setsundirection(anglestoforward((-37, 40, 0)));
        setsuncolorandintensity(0.9294, 0.9608, 1, 0.2);
    }
    br_infil_intro = function_17ee301cf0b5ba85("br_infil_intro");
    br_infil_intro_classic = function_17ee301cf0b5ba85("br_infil_intro_classic");
    function_fe75a89529dd0fd0(level.infilstruct.players, br_infil_intro, undefined, undefined, br_infil_intro_classic);
    function_7acde5feb50c98f2(level.infilstruct.players, "scn_br_c17_infil_ext");
    thread delaystreamtomovingplane();
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    var_a90a02071386e840 = getdvarint(@"hash_6eff23c71a0d4b51", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setscriptablepartstate("skydiveVfx", "default", 0);
        player setisinfilskydive(0);
        var_ce07a0a6d5c4501 = ter_op(isdefined(level.var_5621a5132074da11), level.var_5621a5132074da11, "mp_saba_infil_exterior");
        player visionsetnakedforplayer(var_ce07a0a6d5c4501, 0);
        if (var_2a5e082b65f82a5c) {
            player function_451319f93d30ebe5(%"hash_16737cfa86d4521");
        }
        if (var_a90a02071386e840) {
            player clearpredictedstreampos();
        }
    }
    function_dfb3aefbc657970f();
    function_441fc5517a189a33();
    fadestarttime = get_notetrack_time(level.var_1a209bd995a7fa83["wz_infil_g_prop_sh000"], "fade_to_black_start");
    fadestarttime = fadestarttime - mod(fadestarttime, 0.05);
    var_cd1bd4a1058452da = 0.1;
    delaythread(fadestarttime, &function_ea856ec0b3c4cfc6, var_cd1bd4a1058452da, level.infilstruct.players, "sh000");
    function_6199c35f4cf4524c(&function_6913bd6620c40d4c);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6566
// Size: 0x6e
function private function_55e8eca046dc86e1(c130) {
    c130 show();
    if (isdefined(c130.innards)) {
        c130.innards show();
    }
    c130 setscriptablepartstate("running_lights", "off");
    var_a98a49377dbbb3fb = getdvarint(@"hash_5fd54d13e95394d5", 0);
    if (var_a98a49377dbbb3fb) {
        resetsundirection();
        resetsunlight();
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65db
// Size: 0xc3
function leaderdialog(var_d653377138d5eff2) {
    if (!getdvarint(@"hash_bfded00ac93c45b7", 1)) {
        return;
    }
    var_1499e7c2d69e0074 = 2;
    if (soundexists(var_d653377138d5eff2)) {
        var_1499e7c2d69e0074 = lookupsoundlength(var_d653377138d5eff2, 1) / 1000;
    }
    var_cb3339ece72dbdeb = game["dialog"][var_d653377138d5eff2];
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player queuedialogforplayer(var_cb3339ece72dbdeb, var_d653377138d5eff2, var_1499e7c2d69e0074);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66a5
// Size: 0x85
function function_a4a93d249c2219a7() {
    self playlocalsound("scn_br_c17_infil_int");
    var_372dada9a76a92a3 = ter_op(isdefined(level.var_269c8213b2c00d6b), level.var_269c8213b2c00d6b, "mp_saba_infil");
    self visionsetnakedforplayer(var_372dada9a76a92a3, 0);
    self setclienttriggeraudiozone("br_c17_infil_int", 0);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_451319f93d30ebe5(%"hash_1fae1fa57c3e3922");
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6731
// Size: 0x23a
function function_3d33299e71a25af0() {
    self.introPlane hide();
    function_a0d0e8089bfd149(&function_55e8eca046dc86e1);
    sound = ter_op(isdefined(level.var_4294e392c776520), level.var_4294e392c776520, "scn_br_c17_infil_int");
    function_7acde5feb50c98f2(level.infilstruct.players, sound);
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    sounds = [];
    if (isdefined(level.var_983ab0dfcd3f73f3) && isdefined(level.var_983ab0dfcd3f73f3["04"])) {
        sounds = level.var_983ab0dfcd3f73f3["04"];
    } else {
        sounds[0] = [0:"scn_br_c17_infil_solos_plr1_shot04"];
        sounds[1] = [0:"scn_br_c17_infil_duos_plr1_shot04", 1:""];
        sounds[2] = [0:"scn_br_c17_infil_trios_plr1_shot04", 1:"scn_br_c17_infil_trios_plr2_shot04", 2:"scn_br_c17_infil_trios_plr3_shot04"];
        sounds[3] = [0:"scn_br_c17_infil_quads_plr1_shot04", 1:"scn_br_c17_infil_quads_plr2_shot04", 2:"scn_br_c17_infil_quads_plr3_shot04", 3:""];
    }
    function_c53ec4fa5d1e2eae(teams, sounds);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        var_372dada9a76a92a3 = ter_op(isdefined(level.var_269c8213b2c00d6b), level.var_269c8213b2c00d6b, "mp_saba_infil");
        player visionsetnakedforplayer(var_372dada9a76a92a3, 0);
        player setclienttriggeraudiozone("br_c17_infil_int", 0);
        if (var_2a5e082b65f82a5c) {
            player function_451319f93d30ebe5(%"hash_1fae1fa57c3e3922");
        }
    }
    function_97fdb5e4895e8651();
    function_1ef7aa0dff43da85();
    thread function_48b6ad7afc978b6c();
    function_6199c35f4cf4524c(&function_a4a93d249c2219a7);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6972
// Size: 0x8c
function function_baf143dbadb3f80(array) {
    function_f3ae4b41df047ba0(array);
    function_3d33299e71a25af0();
    var_c2419ec768e4cb25 = get_notetrack_time(level.var_1a209bd995a7fa83["wz_infil_g_prop_sh040"], "fade_to_black_end");
    var_c2419ec768e4cb25 = var_c2419ec768e4cb25 + 0.05 - mod(var_c2419ec768e4cb25, 0.05);
    var_1bb7594c18d17443 = 0.65;
    delaythread(var_c2419ec768e4cb25, &function_7f3ad8fe6df1b8fe, var_1bb7594c18d17443, level.infilstruct.players, "sh000");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a05
// Size: 0x14
function function_9af898862a8c98b9(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a20
// Size: 0x14
function function_646b15a1f9a1e55a(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a3b
// Size: 0x14
function function_a1154be6e3c8a13(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a56
// Size: 0xf3
function function_5252a2070a63d534(array) {
    function_f3ae4b41df047ba0(array);
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    sounds = [];
    if (isdefined(level.var_983ab0dfcd3f73f3) && isdefined(level.var_983ab0dfcd3f73f3["08"])) {
        sounds = level.var_983ab0dfcd3f73f3["08"];
    } else {
        sounds[0] = [0:"scn_br_c17_infil_solos_plr1_shot08"];
        sounds[1] = [0:"scn_br_c17_infil_duos_plr1_shot08", 1:"scn_br_c17_infil_duos_plr2_shot08"];
        sounds[2] = [0:"scn_br_c17_infil_trios_plr1_shot08", 1:"scn_br_c17_infil_trios_plr2_shot08", 2:"scn_br_c17_infil_trios_plr3_shot08"];
        sounds[3] = [0:"scn_br_c17_infil_quads_plr1_shot08", 1:"scn_br_c17_infil_quads_plr2_shot08", 2:"scn_br_c17_infil_quads_plr3_shot08", 3:"scn_br_c17_infil_quads_plr4_shot08"];
    }
    function_c53ec4fa5d1e2eae(teams, sounds);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b50
// Size: 0x14
function function_6822439c818b5b8d(array) {
    function_f3ae4b41df047ba0(array);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6b
// Size: 0x14
function function_516cc7fcafadc9cd() {
    self setclienttriggeraudiozone("br_c17_infil_ext", 3);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b86
// Size: 0x90
function function_9cfd7cab1a6e747b(array) {
    function_f3ae4b41df047ba0(array);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setclienttriggeraudiozone("br_c17_infil_ext", 3);
    }
    function_6199c35f4cf4524c(&function_516cc7fcafadc9cd);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c1d
// Size: 0x104
function function_2391d520e79f9862(array) {
    function_f3ae4b41df047ba0(array);
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    sounds = [];
    if (isdefined(level.var_983ab0dfcd3f73f3) && isdefined(level.var_983ab0dfcd3f73f3["11"])) {
        sounds = level.var_983ab0dfcd3f73f3["11"];
    } else {
        sounds[0] = [0:"scn_br_c17_infil_solos_plr1_shot11"];
        sounds[1] = [0:"scn_br_c17_infil_duos_plr1_shot11", 1:"scn_br_c17_infil_duos_plr2_shot11"];
        sounds[2] = [0:"scn_br_c17_infil_trios_plr1_shot11", 1:"scn_br_c17_infil_trios_plr2_shot11", 2:"scn_br_c17_infil_trios_plr3_shot11"];
        sounds[3] = [0:"scn_br_c17_infil_quads_plr1_shot11", 1:"scn_br_c17_infil_quads_plr2_shot11", 2:"scn_br_c17_infil_quads_plr3_shot11", 3:"scn_br_c17_infil_quads_plr4_shot11"];
    }
    function_c53ec4fa5d1e2eae(teams, sounds);
    delaythread(0.5, &function_8ff9139b185cac31);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d28
// Size: 0x5d
function function_161da87df4150ee8() {
    var_8cfe7cedc00ff8d3 = getdvarfloat(@"hash_224074cc9cbd34e3", 1);
    self visionsetnakedforplayer("", var_8cfe7cedc00ff8d3);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_df8fad503896462(%"hash_1fae1fa57c3e3922");
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d8c
// Size: 0x103
function function_c337548f4b03bdf2() {
    delayseconds = getdvarfloat(@"hash_ef579438c4248057", 3.75);
    var_8cfe7cedc00ff8d3 = getdvarfloat(@"hash_224074cc9cbd34e3", 1);
    if (delayseconds > 0) {
        wait(delayseconds);
    }
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player visionsetnakedforplayer("", var_8cfe7cedc00ff8d3);
        if (var_2a5e082b65f82a5c) {
            player function_df8fad503896462(%"hash_1fae1fa57c3e3922");
        }
    }
    delaythread(1, &function_f23edad7e7a000c5);
    function_6199c35f4cf4524c(&function_161da87df4150ee8);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e96
// Size: 0x29
function function_d231ca558e0ab75d() {
    wait(3);
    function_c79f9300ee85f805(level.players, "solo_cin_igc_music", 3);
    wait(3);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6ec6
// Size: 0xc1
function private function_3724b7df63604071() {
    fadestarttime = get_notetrack_time(level.var_1a209bd995a7fa83["wz_infil_g_prop_sh120"], "fade_to_black_start");
    var_c2419ec768e4cb25 = get_notetrack_time(level.var_1a209bd995a7fa83["wz_infil_g_prop_sh120"], "fade_to_black_end");
    fadestarttime = fadestarttime - mod(fadestarttime, 0.05);
    var_c2419ec768e4cb25 = var_c2419ec768e4cb25 + 0.05 - mod(var_c2419ec768e4cb25, 0.05);
    wait(fadestarttime);
    function_ea856ec0b3c4cfc6(0.066, level.infilstruct.players, "sh120");
    wait(var_c2419ec768e4cb25 - fadestarttime);
    function_7f3ad8fe6df1b8fe(0.083, level.infilstruct.players, "sh120");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8e
// Size: 0x93
function function_e63ab2e92ddffaa1(array) {
    function_f3ae4b41df047ba0(array);
    level thread function_d231ca558e0ab75d();
    level thread function_c337548f4b03bdf2();
    delayseconds = getdvarfloat(@"hash_1968fc42f31e7d28", 3.9);
    if (delayseconds > 0) {
        delaythread(delayseconds, &teleportToMovingPlane);
    } else {
        teleportToMovingPlane();
    }
    level thread function_3724b7df63604071();
    self.movingc130 setscriptablepartstate("running_lights", "on");
    leaderdialog("infil_ac130_5_seconds");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7028
// Size: 0xdf
function function_8ff9139b185cac31() {
    var_bfe193d9d13c62dc = getentitylessscriptablearray("air_cargo_light_switch", "targetname");
    foreach (var_ce483278f59e7c3c in var_bfe193d9d13c62dc) {
        var_ce483278f59e7c3c setscriptablepartstate("base", "on_green");
    }
    var_405425b0f7da50dc = ter_op(isdefined(level.var_d7c4cc78f9c8bbd6), level.var_d7c4cc78f9c8bbd6, "on");
    self.staticc130 setscriptablepartstate("int_lights_red_all", "off");
    self.staticc130 setscriptablepartstate("int_lights_green_all", var_405425b0f7da50dc);
    function_7acde5feb50c98f2(level.players, "scn_br_c17_infil_jump_buzzer");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710e
// Size: 0x1c
function function_16f307c48e420065() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "on");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7131
// Size: 0xca
function function_97fdb5e4895e8651() {
    var_bfe193d9d13c62dc = getentitylessscriptablearray("air_cargo_light_switch", "targetname");
    foreach (var_ce483278f59e7c3c in var_bfe193d9d13c62dc) {
        var_ce483278f59e7c3c setscriptablepartstate("base", "on_red");
    }
    var_405425b0f7da50dc = ter_op(isdefined(level.var_d7c4cc78f9c8bbd6), level.var_d7c4cc78f9c8bbd6, "on");
    self.staticc130 setscriptablepartstate("int_lights_red_all", var_405425b0f7da50dc);
    self.staticc130 setscriptablepartstate("int_lights_green_all", "off");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7202
// Size: 0x1c
function function_1ef7aa0dff43da85() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "off");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7225
// Size: 0xa5
function function_dfb3aefbc657970f() {
    var_bfe193d9d13c62dc = getentitylessscriptablearray("air_cargo_light_switch", "targetname");
    foreach (var_ce483278f59e7c3c in var_bfe193d9d13c62dc) {
        var_ce483278f59e7c3c setscriptablepartstate("base", "off");
    }
    self.staticc130 setscriptablepartstate("int_lights_red_all", "off");
    self.staticc130 setscriptablepartstate("int_lights_green_all", "off");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72d1
// Size: 0x1c
function function_441fc5517a189a33() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "off");
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f4
// Size: 0x3
function function_f23edad7e7a000c5() {
    
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x72fe
// Size: 0xc
function private function_f900e49e0584ba57(c130) {
    
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7311
// Size: 0x1b
function function_f90e2db4b34d7f57(array) {
    function_f3ae4b41df047ba0(array);
    function_f23edad7e7a000c5();
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7333
// Size: 0x14
function function_60240beede5e1ab8(player, array) {
    
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x734e
// Size: 0x7c
function private function_a85e9f36f620029(players, index) {
    foreach (player in players) {
        if (isdefined(player.infilanimindex) && player.infilanimindex == index) {
            return player;
        }
    }
    return undefined;
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x73d2
// Size: 0x1f8
function private function_406a85847778fb1(index) {
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
        foundplayer = undefined;
        if (index == 0) {
            foundplayer = function_a85e9f36f620029(players, 1);
            if (!isdefined(foundplayer)) {
                foundplayer = function_a85e9f36f620029(players, 5);
            }
        } else if (index == 1) {
            if (numplayers == 2) {
                foundplayer = undefined;
            } else {
                foundplayer = function_a85e9f36f620029(players, 2);
            }
        } else if (index == 2) {
            foundplayer = function_a85e9f36f620029(players, 3);
        } else {
            /#
                assert(index == 3);
            #/
            foundplayer = function_a85e9f36f620029(players, 4);
        }
        var_5c9ddcf56d36f133 = -1;
        if (isdefined(foundplayer)) {
            var_5c9ddcf56d36f133 = foundplayer getentitynumber();
        }
        foreach (player in players) {
            player setclientomnvar("ui_br_infil_exfil_player_focus", var_5c9ddcf56d36f133);
        }
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75d1
// Size: 0x55
function private function_cd7e1a37d5e2ca2b() {
    level.nosuspensemusic = 1;
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    var_3b03284fc91eb596 = "mp_gamemode_br_infils";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br_infils_ac130", "getInfilSoundbank")) {
        var_3b03284fc91eb596 = [[ namespace_3c37cb17ade254d::getsharedfunc("br_infils_ac130", "getInfilSoundbank") ]]();
    }
    function_f1aed36ab4598ea(var_3b03284fc91eb596);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x762d
// Size: 0xd2
function private function_55fb66f4acb3d466() {
    if (getdvarint(@"hash_6eff23c71a0d4b51", 1)) {
        level.infilstruct.var_2a959f4ba13b75da = 1;
        waitframe();
        var_11f3b4465c8b637b = level.infilstruct.c130.animstruct.introPlane.origin;
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setpredictedstreamloaddist(-1);
            player function_bc667001f9dd3808(var_11f3b4465c8b637b);
        }
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7706
// Size: 0x4c
function private function_8d050f78fe1d180f() {
    level thread function_55fb66f4acb3d466();
    function_4e8ba327eb12540c(level.players, "solo_cin_igc_music", 2.5);
    function_6f9b54cea87f1c9e();
    wait(2.5);
    function_c79f9300ee85f805(level.players, "mp_br_lobby_fade", 0);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7759
// Size: 0xc
function private function_26874fd7694aa29() {
    level thread function_8d050f78fe1d180f();
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x776c
// Size: 0x14
function function_1a5e2c1cef16393f(camera) {
    function_406a85847778fb1(0);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7787
// Size: 0x15
function function_7797914101c3a342(camera) {
    function_406a85847778fb1(1);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77a3
// Size: 0x15
function function_e86f60ffd1abcd75(camera) {
    function_406a85847778fb1(2);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77bf
// Size: 0x15
function function_a9090d88a8813828(camera) {
    function_406a85847778fb1(3);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77db
// Size: 0x50
function function_72145194f4f38714() {
    var_3b03284fc91eb596 = "mp_gamemode_br_infils";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br_infils_ac130", "getInfilSoundbank")) {
        var_3b03284fc91eb596 = [[ namespace_3c37cb17ade254d::getsharedfunc("br_infils_ac130", "getInfilSoundbank") ]]();
    }
    function_e66f664ad726f2e();
    function_f4e0ff5cb899686d(var_3b03284fc91eb596);
    namespace_56a3588493afc984::cleanupents();
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7832
// Size: 0xc1
function function_e128261218fafdaa(player) {
    var_4a99009e075a9364 = "j_prop_1";
    var_4febd9f54a7e9968 = "j_prop_17";
    cameratag = var_4a99009e075a9364;
    if (isdefined(player) && isdefined(player.var_db122a8941dfee14)) {
        teamcount = player.var_db122a8941dfee14;
        var_92c2f39adf1c2e62 = 0;
        if (isdefined(self.var_2739b8c6b038ba5e)) {
            var_92c2f39adf1c2e62 = istrue(self.var_2739b8c6b038ba5e.var_92c2f39adf1c2e62);
        }
        if (var_92c2f39adf1c2e62 && teamcount == 2) {
            cameratag = var_4a99009e075a9364;
        } else if (var_92c2f39adf1c2e62 && teamcount == 3) {
            cameratag = var_4febd9f54a7e9968;
        } else if (teamcount < 3) {
            cameratag = var_4febd9f54a7e9968;
        }
    }
    return cameratag;
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78fb
// Size: 0x8d
function function_3ad82a1083bf9fde(player) {
    /#
        assert(isdefined(self.xcams));
    #/
    if (isdefined(player) && isdefined(player.var_db122a8941dfee14)) {
        /#
            assert(player.var_db122a8941dfee14 > 0);
        #/
        /#
            assert(player.var_db122a8941dfee14 <= self.xcams.size);
        #/
        return self.xcams[player.var_db122a8941dfee14 - 1];
    }
    return self.xcams[0];
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7990
// Size: 0x223
function function_ad4a7a73c7d7d9e0() {
    self clearclienttriggeraudiozone(3);
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    var_4b52f031a2cbef8e = anglestoforward(level.infilstruct.c130.angles);
    var_d8bb89f41ae3d919 = anglestoright(level.infilstruct.c130.angles);
    var_172d42d175e16c61 = vectordot(playerforward, var_4b52f031a2cbef8e);
    var_ed451f0ea36c48c6 = vectordot(playerforward, var_d8bb89f41ae3d919);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    infilanimindex = self.infilanimindex;
    if (infilanimindex >= 5) {
        infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + infilanimindex + 1;
    cos45 = cos(45);
    if (var_172d42d175e16c61 < -1 * cos45) {
        return [0:"wz_infil_gprop_standard_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_standard_sh010"], 2:"wz_infil_standardforward_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
    if (var_ed451f0ea36c48c6 > cos45) {
        return [0:"wz_infil_gprop_l90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l90_sh010"], 2:"wz_infil_l90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 < -1 * cos45) {
        return [0:"wz_infil_gprop_r90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r90_sh010"], 2:"wz_infil_r90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 > 0) {
        return [0:"wz_infil_gprop_l180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l180_sh010"], 2:"wz_infil_l180_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else {
        return [0:"wz_infil_gprop_r180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r180_sh010"], 2:"wz_infil_r180_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bba
// Size: 0x3c
function function_d99d934d14e73d() {
    self endon("disconnect");
    wait(5);
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    if (var_2a5e082b65f82a5c) {
        self function_df8fad503896462(%"hash_16737cfa86d4521");
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bfd
// Size: 0x40
function function_8d5c19a9b693e913() {
    thread function_d99d934d14e73d();
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(0, 0);
        self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c44
// Size: 0x9b
function function_dc0bc83a31193177() {
    self endon("disconnect");
    self lerpfov(65, 0.5);
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(1, 0.5);
    }
    wait(1);
    if (isdefined(self.var_1f0a019572c9f8e2)) {
        self.var_1f0a019572c9f8e2 = undefined;
        self disablephysicaldepthoffieldscripting();
    }
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_86bf34d5f48fa435", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce6
// Size: 0x5b
function function_52bedae2ced8e191() {
    var_a910600eadf5e31c = level._effect["vfx_br_ac130_clouds"];
    var_8b26de022a9f35f = level._effect["vfx_br_ac130_oneshot"];
    if (isdefined(var_a910600eadf5e31c)) {
        stopfxontag(var_a910600eadf5e31c, self, "tag_body");
    }
    if (isdefined(var_8b26de022a9f35f)) {
        stopfxontag(var_8b26de022a9f35f, self, "tag_body");
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d48
// Size: 0x131
function delaystreamtomovingplane() {
    self endon("stopScene");
    if (isdefined(self.movingc130)) {
        delaytime = getdvarint(@"hash_d01d0472d843d39e", 8);
        wait(delaytime);
        if (!isdefined(self.movingc130)) {
            return;
        }
        var_11f3b4465c8b637b = self.movingc130.origin;
        forward = getdvarint(@"hash_7abcda2d7aabbe4c", 0);
        if (forward > 0) {
            dir = anglestoforward(self.movingc130.angles);
            var_11f3b4465c8b637b = self.movingc130.origin + dir * forward;
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

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e80
// Size: 0xaa
function private function_98486f8b479597e1(percent) {
    if (percent <= 0) {
        percent = 0;
    } else if (percent >= 1) {
        percent = 1;
    }
    var_c5faa94190723347 = int(percent * 100);
    var_c5faa94190723347 = var_c5faa94190723347 - mod(var_c5faa94190723347, 10);
    if (isplayer(self)) {
        setwind(string(var_c5faa94190723347), 1);
    } else if (self getscriptablehaspart("wind") && self getscriptableparthasstate("wind", string(var_c5faa94190723347))) {
        self setscriptablepartstate("wind", string(var_c5faa94190723347), 1);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7f31
// Size: 0x1ac
function private function_48b6ad7afc978b6c() {
    self endon("stopWind");
    var_e8d980a1b17bc221 = self.staticc130.origin;
    var_1ea13aa1f992052f = self.staticc130.angles;
    if (!isdefined(var_1ea13aa1f992052f)) {
        var_1ea13aa1f992052f = (0, 0, 0);
    }
    var_27220e8d699e8148 = anglestoforward(var_1ea13aa1f992052f);
    var_6628001e4283c554 = var_27220e8d699e8148 * -1;
    var_1e51bf3beb996bea = getdvarfloat(@"hash_35e512315ec17f9e", -200);
    var_9c1b24ed417256ac = getdvarfloat(@"hash_35c124315e992c7c", 50);
    var_2668fb5d52d6438d = array_combine(self.var_2668fb5d52d6438d, self.var_a552ec61e51ece6e);
    while (1) {
        operators = array_combine(level.infilstruct.players, var_2668fb5d52d6438d);
        foreach (operator in operators) {
            if (!isdefined(operator)) {
                continue;
            }
            var_6f56fa8209dcf5d0 = operator.origin - var_e8d980a1b17bc221;
            var_a6c6221a1040f454 = math::scalar_projection(var_6628001e4283c554, var_6f56fa8209dcf5d0);
            var_1865b7643c24139d = (var_a6c6221a1040f454 - var_1e51bf3beb996bea) / (var_9c1b24ed417256ac - var_1e51bf3beb996bea);
            operator function_98486f8b479597e1(var_1865b7643c24139d);
        }
        wait(0.5);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80e4
// Size: 0xc7
function private clearplayerwind() {
    self notify("stopWind");
    var_2668fb5d52d6438d = array_combine(self.var_2668fb5d52d6438d, self.var_a552ec61e51ece6e);
    operators = array_combine(level.infilstruct.players, var_2668fb5d52d6438d);
    foreach (operator in operators) {
        if (!isdefined(operator)) {
            continue;
        }
        if (isplayer(operator)) {
            operator.manualoverridewindmaterial = undefined;
        }
        operator setscriptablepartstate("wind", "1", 1);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81b2
// Size: 0x5b
function function_708e8449a90a636f() {
    wait(0.1);
    function_16f307c48e420065();
    var_d81ae3a6458c2ee8 = ter_op(isdefined(level.var_13e59fcf9acfdcff), level.var_13e59fcf9acfdcff, "clouds");
    if (isdefined(self.movingc130)) {
        self.movingc130 setscriptablepartstate("br_fx", var_d81ae3a6458c2ee8);
    }
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8214
// Size: 0x25
function function_f1462ccad9c4e0be() {
    self.manualoverridewindmaterial = undefined;
    setwind("1");
    self setallstreamloaddist(0);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8240
// Size: 0x122
function teleportToMovingPlane() {
    clearplayerwind();
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
    }
    if (isdefined(self.movingc130)) {
        self.var_e73ce295ae9d4104 unlink();
        self.var_e73ce295ae9d4104 linkto(self.movingc130, "tag_body_animate", (0, 0, 0), (0, 0, 0));
        if (!istrue(level.infilstruct.var_df94e780c2b3c994) || function_8663da4077fa7e20()) {
            self.movingc130 notify("start_moving");
        }
    }
    setomnvar("ui_hide_player_icons", 0);
    level notify("teleportToMovingPlane");
    thread function_708e8449a90a636f();
    function_6199c35f4cf4524c(&function_f1462ccad9c4e0be);
}

// Namespace br_infils_ac130/namespace_ecab45ae367735ef
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8369
// Size: 0x54
function function_66b13900c5013de5(var_c26fc18bda607b7) {
    body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_c26fc18bda607b7);
    head = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_c26fc18bda607b7);
    if (body == "" || head == "") {
        return;
    }
    self function_dd6d30b9ec87c1b3(body, head, "iw9_avatar_scriptable_mp");
}

