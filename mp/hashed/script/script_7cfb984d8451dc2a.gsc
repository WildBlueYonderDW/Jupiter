#using script_75377e59f5becac8;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\common\anim;
#using scripts\common\utility;
#using scripts\engine\utility;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\utility\player;

#namespace namespace_82162455806f6229;

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x987
// Size: 0x119
function init() {
    assert(isdefined(level.infilstruct));
    level.infilstruct.var_b381e33e977da440 = &function_55f2480b4b819aea;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.var_477bd548940c3a78 = "mp_donetsk_c130_intro";
    level.infilstruct.var_10d27b439af13a2a = 3.2;
    var_1809e16510055e87 = ["cam_orbit_br_ac130_player1", "cam_orbit_br_ac130_player2", "cam_orbit_br_ac130_player3", "cam_orbit_br_ac130_player4"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("cinematic", &function_5901cd0be722f86a);
    function_ad12d29d41483e8a("animatic", &function_39c2cf6576478d41);
    level._effect["vfx_br_ac130_clouds"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_ac130_clouds");
    level._effect["vfx_br_infil_cloud_anim"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_anim");
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa8
// Size: 0xd14
function function_55f2480b4b819aea(movingc130) {
    animstruct = spawnstruct();
    animstruct.origin = getdvarvector(@"hash_223915c6339dbc10", (0, 0, 0));
    animstruct.angles = (0, 0, 0);
    animstruct.cleanupfunc = &function_72145194f4f38714;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    animstruct.staticc130 = getent("infil_plane", "script_noteworthy");
    if (isdefined(animstruct.staticc130)) {
        animstruct.staticc130 show();
        animstruct.staticc130.animname = "c130";
    } else {
        animstruct.staticc130 = animstruct spawn_script_model("veh8_mil_air_acharlie130_magma_animated", "c130");
    }
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingc130.animname = "movingC130";
        animstruct.movingc130.innards.animname = "movingC130";
        animstruct.movingc130 = animstruct;
    }
    animstruct.camera = animstruct spawn_script_model("generic_prop_x5", "camera");
    animstruct.camera linkto(animstruct.staticc130, "", (0, 0, 0), (0, 0, 0));
    if (isdefined(animstruct.movingc130)) {
        animstruct.movingcam = animstruct spawn_script_model("generic_prop_x5", "cameramoving");
        animstruct.movingcam linkto(animstruct.movingc130, "", (0, 0, 0), (0, 0, 0));
    }
    animstruct.var_16cfd3cbf327feef = animstruct spawn_script_model("generic_prop_x5", "parent");
    animstruct.var_16cfd3cbf327feef linkto(animstruct.staticc130, "", (0, 0, 0), (0, 0, 0));
    animstruct.playertags = [];
    animstruct.playertags[0] = animstruct spawn_script_model("tag_player", "playerTag1");
    animstruct.playertags[1] = animstruct spawn_script_model("tag_player", "playerTag2");
    animstruct.playertags[2] = animstruct spawn_script_model("tag_player", "playerTag3");
    animstruct.playertags[3] = animstruct spawn_script_model("tag_player", "playerTag4");
    animstruct.playertags[0] linkto(animstruct.var_16cfd3cbf327feef, "j_prop_1", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[1] linkto(animstruct.var_16cfd3cbf327feef, "j_prop_2", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[2] linkto(animstruct.var_16cfd3cbf327feef, "j_prop_3", (0, 0, 0), (0, 0, 0));
    animstruct.playertags[3] linkto(animstruct.var_16cfd3cbf327feef, "j_prop_4", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels = [];
    animstruct.playermodels[0] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player1");
    animstruct.playermodels[1] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player2");
    animstruct.playermodels[2] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player3");
    animstruct.playermodels[3] = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "player4");
    animstruct.playermodels[0] linkto(animstruct.playertags[0], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[1] linkto(animstruct.playertags[1], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[2] linkto(animstruct.playertags[2], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.playermodels[3] linkto(animstruct.playertags[3], "tag_player", (0, 0, 0), (0, 0, 0));
    animstruct.doorchief = animstruct spawn_script_model("fullbody_usmc_ar_br_infil", "doorChief");
    animstruct.doorchief linkto(animstruct.var_16cfd3cbf327feef, "j_prop_5", (0, 0, 0), (0, 0, 0));
    animstruct.cloudanimfx = spawnfx(level._effect["vfx_br_infil_cloud_anim"], animstruct.staticc130.origin);
    animstruct.packs = [];
    n = 0;
    animstruct.packs[n] = animstruct create_animpack("scene1");
    animstruct.packs[n] add_pack_startfunc([], &function_21ea09462d07ca25);
    animstruct.packs[n] function_e718ba63d511fcde([], &function_b33e50ed017d5ace);
    animstruct.packs[n] add_pack_modelanim(animstruct.staticc130, level.br_anim["sdr_mp_infil_ac130_redux_players_ac130"]);
    if (isdefined(animstruct.movingc130)) {
        animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.br_anim["sdr_mp_infil_ac130_redux_players_ac130"]);
    }
    animstruct.packs[n] add_pack_modelanim(animstruct.camera, level.br_anim["sdr_mp_infil_ac130_redux_players_cam"]);
    if (isdefined(animstruct.movingcam)) {
        animstruct.packs[n] add_pack_modelanim(animstruct.movingcam, level.br_anim["sdr_mp_infil_ac130_redux_players_cam"]);
    }
    animstruct.packs[n] add_pack_modelanim(animstruct.var_16cfd3cbf327feef, level.br_anim["sdr_mp_infil_ac130_redux_character_link"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[0], level.br_anim["sdr_mp_infil_ac130_redux_player1"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[1], level.br_anim["sdr_mp_infil_ac130_redux_player2"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[2], level.br_anim["sdr_mp_infil_ac130_redux_player3"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[3], level.br_anim["sdr_mp_infil_ac130_redux_player4"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[0], level.br_anim["sdr_mp_infil_ac130_redux_player1"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[1], level.br_anim["sdr_mp_infil_ac130_redux_player2"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[2], level.br_anim["sdr_mp_infil_ac130_redux_player3"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[3], level.br_anim["sdr_mp_infil_ac130_redux_player4"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.doorchief, level.br_anim["sdr_mp_infil_ac130_redux_doorchief"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.camera, ["j_prop_1", "j_prop_2", "j_prop_3", "j_prop_4"], level.br_anim["sdr_mp_infil_ac130_redux_players_ac130"]);
    if (!isdefined(level.scr_notetrack["c130"]) || !isdefined(level.scr_notetrack["c130"]["any"]["gored"])) {
        scripts\common\anim::addnotetrack_customfunction("c130", "gored", &function_4e1db4886edfa5b2);
        scripts\common\anim::addnotetrack_customfunction("c130", "gogreen", &function_ecc93c094efc9af2);
        scripts\common\anim::addnotetrack_customfunction("c130", "opendoor", &function_fd00edc34074bb24);
        scripts\common\anim::addnotetrack_customfunction("c130", "transitionstart", &function_97b59eb002f8ddeb);
        scripts\common\anim::addnotetrack_customfunction("camera", "transition", &transitionfunc);
    }
    n++;
    animstruct.packs[n] = animstruct create_animpack("looping", 1);
    animstruct.packs[n] add_pack_startfunc([], &function_f90e2db4b34d7f57);
    animstruct.packs[n] function_e718ba63d511fcde([], &function_60240beede5e1ab8);
    if (isdefined(animstruct.movingc130)) {
        animstruct.packs[n] add_pack_modelanim(animstruct.movingc130, level.br_anim["sdr_mp_infil_ac130_loop2_plane"]);
        animstruct.packs[n] add_pack_modelanim(animstruct.movingc130.innards, level.br_anim["sdr_mp_infil_ac130_loop2_plane"]);
    }
    animstruct.packs[n] add_pack_modelanim(animstruct.var_16cfd3cbf327feef, level.br_anim["sdr_mp_infil_ac130_loop_genpropx10"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[0], level.br_anim["sdr_mp_infil_ac130_loop_pl01"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[1], level.br_anim["sdr_mp_infil_ac130_loop_pl02"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[2], level.br_anim["sdr_mp_infil_ac130_loop_pl03"]);
    animstruct.packs[n] function_ad0bcac98781e0ab(animstruct.playertags[3], level.br_anim["sdr_mp_infil_ac130_loop_pl04"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[0], level.br_anim["sdr_mp_infil_ac130_loop_pl01"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[1], level.br_anim["sdr_mp_infil_ac130_loop_pl02"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[2], level.br_anim["sdr_mp_infil_ac130_loop_pl03"]);
    animstruct.packs[n] function_f7fc8b110c478968(animstruct.playermodels[3], level.br_anim["sdr_mp_infil_ac130_loop_pl04"]);
    animstruct.packs[n] add_pack_modelanim(animstruct.doorchief, level.br_anim["sdr_mp_infil_ac130_loop_doorchief"]);
    animstruct.packs[n] function_d4561ab1ba4f5de9(animstruct.camera, ["j_prop_1", "j_prop_2", "j_prop_3", "j_prop_4"]);
    return animstruct;
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c5
// Size: 0x79
function function_21ea09462d07ca25(array) {
    if (isdefined(self.movingc130)) {
        self.movingc130 stoploopsound();
    }
    self.doorchief hide();
    playfxontag(level._effect["vfx_br_ac130_clouds"], self.staticc130, "tag_body");
    thread clearsoundsubmixmpbrinfilanim();
    thread offlight();
    thread infil_light_dvars();
    thread delaystreamtomovingplane();
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1846
// Size: 0xe5
function function_b33e50ed017d5ace(player, array) {
    assert(isdefined(player));
    var_28844396b0024faf = 34;
    var_d1c04ff6328d20d6 = 5.6;
    var_95288242e2d19a2 = 50.7;
    var_8a3ce4d151659d21 = 2;
    var_9b5197cc4bb4356a = 4;
    player setsoundsubmix("mp_br_infil_anim", 0);
    player setsoundsubmix("mp_br_infil_music", 0);
    player setsoundsubmix("mp_br_infil_ac130", 0);
    player setclienttriggeraudiozone("mp_br_c130_infil_int", 1);
    player setclientdvar(@"cg_fov", var_28844396b0024faf);
    player enablephysicaldepthoffieldscripting();
    player setphysicaldepthoffield(var_d1c04ff6328d20d6, var_95288242e2d19a2, var_8a3ce4d151659d21, var_9b5197cc4bb4356a);
    self.doorchief showtoplayer(player);
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1933
// Size: 0x5e
function function_f90e2db4b34d7f57(array) {
    stopfxontag(level._effect["vfx_br_ac130_clouds"], self.staticc130, "tag_body");
    self.staticc130 stoploopsound();
    if (isdefined(self.movingc130)) {
        self.movingc130 playloopsound("br_ac130_lp");
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1999
// Size: 0x13
function function_60240beede5e1ab8(player, array) {
    
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19b4
// Size: 0x10
function function_72145194f4f38714() {
    function_e66f664ad726f2e();
    namespace_56a3588493afc984::cleanupents();
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x19cc
// Size: 0x7d
function private clearsoundsubmixmpbrinfilanim() {
    waitandpause(0.65);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_anim", 3);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a51
// Size: 0x7d
function private clearsoundsubmixfadetoblackamb() {
    waitandpause(0.5);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 1);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ad6
// Size: 0x7d
function private clearsoundsubmixmpbrinfilac130() {
    waitandpause(7.7);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("mp_br_infil_ac130", 30);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b5b
// Size: 0x72
function private offlight() {
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (lightcontroller in var_620d0024527f448c) {
        lightcontroller setscriptablepartstate("light_blinking_slow", "light_off_hold", 1);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1bd5
// Size: 0x7b
function private function_4e1db4886edfa5b2(c130) {
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (lightcontroller in var_620d0024527f448c) {
        lightcontroller setscriptablepartstate("light_blinking_slow", "light_on", 1);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c58
// Size: 0x7b
function private function_ecc93c094efc9af2(c130) {
    var_620d0024527f448c = getentitylessscriptablearray("infil_blinking_light", "script_noteworthy");
    foreach (lightcontroller in var_620d0024527f448c) {
        lightcontroller setscriptablepartstate("light_blinking_slow", "light_jump", 1);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1cdb
// Size: 0xac
function private function_fd00edc34074bb24(c130) {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player) || isbot(player)) {
            continue;
        }
        player setwind("100", 1);
    }
    level.infilstruct.animstruct.doorchief setwind("100");
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1d8f
// Size: 0x8d
function private clearplayerwind() {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setwind("1");
        player.manualoverridewindmaterial = undefined;
    }
    self.doorchief setwind("0");
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e24
// Size: 0x2e
function private function_97b59eb002f8ddeb(c130) {
    triggerfx(level.infilstruct.animstruct.cloudanimfx);
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e5a
// Size: 0x43c
function private transitionfunc(c130) {
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
        player setclienttriggeraudiozone("mp_br_c130_infil_ext", 2);
    }
    if (isdefined(level.infilstruct.animstruct.movingc130)) {
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            cameraent = level.infilstruct.animstruct.movingcam;
            cameratag = undefined;
            if (isarray(level.infilstruct.animstruct.activepack.camerainfo.var_e6783d526b4a7212)) {
                assert(isdefined(player.infilanimindex) && player.infilanimindex <= level.infilstruct.animstruct.activepack.camerainfo.var_e6783d526b4a7212.size);
                cameratag = level.infilstruct.animstruct.activepack.camerainfo.var_e6783d526b4a7212[player.infilanimindex - 1];
            } else {
                cameratag = level.infilstruct.animstruct.activepack.camerainfo.var_e6783d526b4a7212;
            }
            player cameraunlink();
            player cameralinkto(cameraent, cameratag, 1, 1);
            player setclientdvar(@"cg_fov", var_1992f143059ac1d5);
            player setphysicaldepthoffield(var_e49fe50208c2823c, var_60a2fccf1c5e6d84, var_af0267d0ec57107f, var_92de264f62389db4);
        }
        level thread clearsoundsubmixfadetoblackamb();
        if (isdefined(level.infilstruct.animstruct.cloudanimfx)) {
            level.infilstruct.animstruct.cloudanimfx.origin = level.infilstruct.animstruct.movingc130.origin;
        }
        level.infilstruct.animstruct.var_16cfd3cbf327feef unlink();
        level.infilstruct.animstruct.var_16cfd3cbf327feef linkto(level.infilstruct.animstruct.movingc130, "", (0, 0, 0), (0, 0, 0));
        level.infilstruct.animstruct.movingc130 notify("start_moving");
    }
    level.infilstruct.animstruct.staticc130 hide();
    setomnvar("ui_hide_player_icons", 0);
    level thread clearsoundsubmixmpbrinfilac130();
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x229e
// Size: 0xff
function private infil_light_dvars() {
    var_c3ed855fe7c983e3 = getdvarfloat(@"hash_8667c0bb90c5bfc3");
    var_1800e53d66415e2d = getdvarint(@"hash_63eb1893f96ac98d");
    var_5506432d2291c178 = getdvarint(@"hash_1dde331a8e0153d8");
    var_488f9b9fe1ead0a6 = getdvarfloat(@"hash_9ab6a766fc4e0c06");
    setdvar(@"hash_8667c0bb90c5bfc3", 1000);
    setdvar(@"hash_63eb1893f96ac98d", 6);
    setdvar(@"hash_1dde331a8e0153d8", 8);
    setdvar(@"hash_9ab6a766fc4e0c06", 0.25);
    waittill_either("infil_reset_light_dvars", "stopScene");
    setdvar(@"hash_8667c0bb90c5bfc3", var_c3ed855fe7c983e3);
    setdvar(@"hash_63eb1893f96ac98d", var_1800e53d66415e2d);
    setdvar(@"hash_1dde331a8e0153d8", var_5506432d2291c178);
    setdvar(@"hash_9ab6a766fc4e0c06", var_488f9b9fe1ead0a6);
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x23a5
// Size: 0x12b
function private delaystreamtomovingplane() {
    self endon("stopScene");
    if (isdefined(self.movingc130)) {
        delaytime = getdvarint(@"hash_d01d0472d843d39e", 8);
        wait delaytime;
        if (!isdefined(self.movingc130)) {
            return;
        }
        streamorigin = self.movingc130.origin;
        forward = getdvarint(@"hash_7abcda2d7aabbe4c", 0);
        if (forward > 0) {
            dir = anglestoforward(self.movingc130.angles);
            streamorigin = self.movingc130.origin + dir * forward;
        }
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setpredictedstreamloaddist(0);
            player scripts\mp\gametypes\br_public::playerstreamhintlocation(streamorigin);
        }
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x24d8
// Size: 0xa9
function private stopstreamtomovingplane() {
    if (isdefined(self.movingc130) && getdvarint(@"hash_eb8a05afa7735e5f", 1) == 1) {
        delaytime = getdvarint(@"hash_b7c6d487b0f5506b", 5);
        wait delaytime;
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player thread scripts\mp\gametypes\br_public::playerclearstreamhintorigin();
        }
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2589
// Size: 0x29
function function_cd7e1a37d5e2ca2b() {
    var_567639d26f6a140b = getent("infil_plane", "script_noteworthy");
    if (isdefined(var_567639d26f6a140b)) {
        var_567639d26f6a140b hide();
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25ba
// Size: 0xbe
function function_5901cd0be722f86a() {
    br_infil_intro = function_17ee301cf0b5ba85("br_infil_intro");
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setentitysoundcontext("lobby_fade", "", 2);
        player playlocalsound("br_infil_part1_lr");
        player clearsoundsubmix("mp_br_lobby_fade", 1.5);
        player setsoundsubmix("solo_cin_igc_music", 0.5);
        player setplayermusicstate(br_infil_intro);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2680
// Size: 0xb
function function_39c2cf6576478d41() {
    level thread setsoundsubmixfadetoblackamb();
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2693
// Size: 0x97
function private setsoundsubmixfadetoblackamb(players) {
    waitandpause(2);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player clearsoundsubmix("solo_cin_igc_music", 0.5);
        player setsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 2);
    }
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2732
// Size: 0x1f8
function function_ad4a7a73c7d7d9e0() {
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    planeforward = anglestoforward(level.infilstruct.c130.angles);
    planeright = anglestoright(level.infilstruct.c130.angles);
    dotforward = vectordot(playerforward, planeforward);
    dotright = vectordot(playerforward, planeright);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + self.infilanimindex + 2;
    cos45 = cos(45);
    if (dotforward < -1 * cos45) {
        return ["sdr_mp_infil_ac130_jump_genpropx10", level.br_anim["sdr_mp_infil_ac130_jump_genpropx10"], "sdr_mp_infil_ac130_jump", var_8e3afd40d3c95b46];
    }
    if (dotright > cos45) {
        return ["sdr_mp_infil_ac130_jump_genpropx10_90_l", level.br_anim["sdr_mp_infil_ac130_jump_genpropx10_90_l"], "sdr_mp_infil_ac130_jump_90_l", var_8e3afd40d3c95b46];
    }
    if (dotright < -1 * cos45) {
        return ["sdr_mp_infil_ac130_jump_genpropx10_90_r", level.br_anim["sdr_mp_infil_ac130_jump_genpropx10_90_r"], "sdr_mp_infil_ac130_jump_90_r", var_8e3afd40d3c95b46];
    }
    if (dotright > 0) {
        return ["sdr_mp_infil_ac130_jump_genpropx10_180_l", level.br_anim["sdr_mp_infil_ac130_jump_genpropx10_180_l"], "sdr_mp_infil_ac130_jump_180_l", var_8e3afd40d3c95b46];
    }
    return ["sdr_mp_infil_ac130_jump_genpropx10_180_r", level.br_anim["sdr_mp_infil_ac130_jump_genpropx10_180_r"], "sdr_mp_infil_ac130_jump_180_r", var_8e3afd40d3c95b46];
}

// Namespace namespace_82162455806f6229 / namespace_6b61356959df5986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2932
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

