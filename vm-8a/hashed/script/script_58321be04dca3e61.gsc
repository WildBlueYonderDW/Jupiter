#using scripts\engine\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\player.gsc;
#using script_40f4c8f2b94c5cd9;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_14494b17e1758742;

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2
// Size: 0x9
function function_e04bd99e1bb6430b() {
    chopperexif_fx_init();
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x903
// Size: 0x7db
function chopperexfil_pack(var_cbfc3ba10cefc8ce) {
    if (!isdefined(var_cbfc3ba10cefc8ce)) {
        var_cbfc3ba10cefc8ce = (0, 0, 0);
    }
    thread chopperexfil_introsound(5, var_cbfc3ba10cefc8ce);
    if (!getdvarint(@"hash_19a406e3c51ce52f")) {
        self.transientname = get_chopperexfil_transient();
        loadinfiltransient(self.transientname);
        setomnvarforallclients("ui_br_end_game_splash_type", 18);
        for (var_24b79087f3897e94 = 0; !var_24b79087f3897e94; var_24b79087f3897e94 = function_2030cc4ad67d1634(self.transientname)) {
            waitframe();
        }
    }
    chopper = spawn_script_model("veh8_mil_air_blima_scriptmodel");
    chopper hidepart("tag_main_rotor_blade_01");
    chopper hidepart("tag_main_rotor_blade_02");
    chopper hidepart("tag_main_rotor_blade_03");
    chopper hidepart("tag_main_rotor_blade_04");
    chopper hidepart("tag_tail_rotor_blade_01");
    chopper hidepart("tag_tail_rotor_blade_02");
    chopper hidepart("tag_tail_rotor_blade_03");
    chopper hidepart("tag_tail_rotor_blade_04");
    self.exfilchopper = chopper;
    chopperexfil_set_brcircle();
    head = ["head_mp_helicopter_crew", "j_spine4"];
    extramodels = [head];
    body = "body_pilot_helicopter_british";
    ropeguy = spawn_script_model(body, undefined, extramodels);
    self.ropeguy = ropeguy;
    self.winners = array_removeundefined(self.winners);
    if (self.winners.size == 0) {
        create_disconnectplayer(self);
    }
    rope = spawn_script_model("equipment_fast_rope_wm_01_infil_heli_l");
    self.rope = rope;
    self.cam = create_cam();
    ascenders = [];
    ascenders[0] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender0");
    if (self.winners.size > 1) {
        ascenders[1] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender1");
    }
    if (self.winners.size > 2) {
        ascenders[2] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender2");
    }
    if (self.winners.size > 3) {
        ascenders[3] = spawn_script_model("misc_wm_ascender", "misc_wm_ascender3");
    }
    self.ascenders = ascenders;
    self.packs = [];
    n = 0;
    self.packs[n] = create_animpack("scene1");
    self.packs[n] add_pack_startfunc([], &chopperexfil_sh010_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh010"]);
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_co_sh010"]);
    self.packs[n] add_pack_modelanim(rope, level.var_1a209bd995a7fa83["br_exfil_rope_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh010"]);
    self.packs[n] add_pack_fx("chopperExfil_gas", self.origin, self.angles);
    n++;
    self.packs[n] = create_animpack("scene2");
    self.packs[n] add_pack_startfunc(self.winners, &chopperexfil_sh020_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"]);
    if (!isdefined(level.scr_notetrack["veh8_mil_air_blima_scriptmodel"]) || !isdefined(level.scr_notetrack["veh8_mil_air_blima_scriptmodel"]["any"]["guy0_aboard"])) {
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy0_aboard", &chopperexfil_skip_ascend0);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy1_aboard", &chopperexfil_skip_ascend1);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "guy2_aboard", &chopperexfil_skip_ascend2);
        addnotetrack_customfunction("veh8_mil_air_blima_scriptmodel", "slamtoblack", &chopperexfil_slamtoblack);
    }
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_pilot_sh020"]);
    self.packs[n] add_pack_modelanim(rope, level.var_1a209bd995a7fa83["br_exfil_rope_sh020"]);
    self.packs[n] add_pack_modelanim(ascenders[0], level.var_1a209bd995a7fa83["br_exfil_ascender0_sh020"]);
    if (self.winners.size > 1) {
        self.packs[n] add_pack_modelanim(ascenders[1], level.var_1a209bd995a7fa83["br_exfil_ascender1_sh020"]);
    }
    if (self.winners.size > 2) {
        self.packs[n] add_pack_modelanim(ascenders[2], level.var_1a209bd995a7fa83["br_exfil_ascender2_sh020"]);
    }
    if (self.winners.size > 3) {
        self.packs[n] add_pack_modelanim(ascenders[3], level.var_1a209bd995a7fa83["br_exfil_ascender3_sh020"]);
    }
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy0_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy1_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy2_sh020_fem"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh020"], level.var_1a209bd995a7fa83["br_exfil_guy3_sh020_fem"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh020"]);
    n++;
    self.packs[n] = create_animpack("scene2.5");
    self.packs[n] add_pack_startfunc(self.winners, &chopperexfil_sh025_start);
    self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"]);
    self.packs[n] add_pack_modelanim(ropeguy, level.var_1a209bd995a7fa83["br_exfil_pilot_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["br_exfil_guy0_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["br_exfil_guy1_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["br_exfil_guy2_sh025"]);
    self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["br_exfil_guy3_sh025"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["br_exfil_cam_sh025"]);
    self.packs[n] function_decf1e23d78d0944(self.winners, &chopperexfil_slamtoblack);
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10e6
// Size: 0x2e9
function function_a5538b1593309bb0() {
    var_79a78f73d2d4925d = [];
    guyradius = 30;
    guyheight = 68;
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy0_sh020"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy1_sh020"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy2_sh020"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["br_exfil_guy3_sh020"], 0, undefined, guyradius, guyheight);
    choppermodel = "veh8_mil_air_blima_scriptmodel";
    chopperoriginoffset = (0, 0, -70);
    chopperradius = 350;
    choppersegments = 10;
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh030"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh040"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh050"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh060"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], 0, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], 0.99, chopperoriginoffset, chopperradius);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh010"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh020"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh025"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh030"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh040"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh050"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh060"], chopperoriginoffset, chopperradius, choppersegments);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["br_exfil_blima_sh070"], chopperoriginoffset, chopperradius, choppersegments);
    return var_79a78f73d2d4925d;
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13d8
// Size: 0x50
function private chopperexif_fx_init() {
    level._effect["chopperExfil_rotorwash"] = loadfx("vfx/iw8_br/gameplay/vfx_br_blima_rotor_infil.vfx");
    level._effect["chopperExfil_gas"] = loadfx("vfx/iw8_br/gameplay/circle/vfx_br_circle_gas_exfil_01.vfx");
    level._effect["player_disconnect"] = loadfx("vfx/iw8_br/gameplay/vfx_br_disconnect_player.vfx");
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1430
// Size: 0xaa
function private chopperexfil_introsound(time, var_cbfc3ba10cefc8ce) {
    setmusicstate("br_exfil_main_4player");
    function_adfd4002c83fe6b2("igc", 0.3, 0);
    endorigin = self.origin + (0, 0, 1000);
    forward = vectornormalize(endorigin - var_cbfc3ba10cefc8ce);
    startorigin = endorigin + forward * 3000;
    temp = spawn("script_model", startorigin);
    temp playsound("br_exfil_incoming_heli_lr");
    temp moveto(endorigin, time);
    wait time;
    temp delete();
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e2
// Size: 0x11a
function get_chopperexfil_transient() {
    switch (level.script) {
    case #"hash_d7b993f67c508b1d": 
        return "mp_infil_br_donetsk_ending_chopper_tr";
    case #"hash_e9af1c05b2cb1afd": 
        return "mp_infil_br_donetsk2_ending_chopper_tr";
    case #"hash_914054ef261f122":
    case #"hash_c9458e4403b73c27": 
        return "mp_infil_br_don3_ending_chopper_tr";
    case #"hash_20e8ae1b499051a1": 
        return "mp_infil_br_ftue_downtown_ending_chopper_tr";
    case #"hash_5bdc66d44b83f826": 
        return "mp_infil_br_quarry_ending_chopper_tr";
    case #"hash_2ad5096943807dfb":
    case #"hash_4aa5d6e97851bdbd": 
        return "mp_infil_br_mechanics_ending_chopper_tr";
    case #"hash_2de697274b41ff79": 
        return "mp_infil_br_kstenod_ending_chopper_tr";
    case #"hash_4486e35de937847c": 
        return "mp_infil_br_escape2_ending_chopper_tr";
    case #"hash_4486e45de937860f": 
        return "mp_infil_br_escape2_ending_chopper_tr";
    case #"hash_57eba45b7ddbdcd6":
    case #"hash_63326ac3e12f8da0": 
        return "mp_infil_br_saba_ending_chopper_tr";
    case #"hash_3eff14ec1d9395c1":
    case #"hash_636b409bbce21729":
    case #"hash_e817308cc606e9e1": 
        return "mp_infil_br_saba_ending_chopper_tr";
    }
    return "";
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1605
// Size: 0xd6
function private chopperexfil_sh010_start(array) {
    level.br_ending.exfilchopper thread chopper_playfx();
    thread chopperexfil_music_start();
    if (!scripts\mp\gametypes\br_public::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    if (isdefined(level.br_ending_debugmode)) {
        level.br_ending.ropeguy show();
        foreach (player in level.players) {
            player.player_rig unlink();
        }
    }
    allplayers_setphysicaldof(2.8, 200);
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16e3
// Size: 0xf9
function private chopperexfil_sh020_start(players) {
    allplayers_setphysicaldof(2.8, 250);
    level.br_ending.exfilchopper thread chopper_playfx();
    if (isdefined(level.br_ending_debugmode)) {
        foreach (ascender in level.br_ending.ascenders) {
            ascender show();
        }
    }
    foreach (player in players) {
        if (isdefined(player)) {
            player setwind("60", 1);
        }
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17e4
// Size: 0x360
function private chopperexfil_sh025_start(players) {
    allplayers_setphysicaldof(2.8, 250);
    if (!isdefined(level.br_ending_debugmode)) {
        if (level.br_ending.winners.size < 4) {
            if (isdefined(level.br_ending.rope)) {
                level.br_ending.rope delete();
            }
        }
    }
    level.br_ending.exfilchopper thread chopper_playfx();
    if (isdefined(level.br_ending_debugmode)) {
        foreach (ascender in level.br_ending.ascenders) {
            ascender hide();
        }
    } else {
        foreach (ascender in level.br_ending.ascenders) {
            ascender delete();
        }
    }
    tags = ["tag_guy0", "tag_guy2", "tag_guy4", "tag_guy5"];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.winindex)) {
            continue;
        }
        player.player_rig linkto(level.br_ending.exfilchopper, tags[player.winindex], (0, 0, 0), (0, 0, 0));
        player.linkedtoent = level.br_ending.exfilchopper;
        player.linkedtotag = tags[player.winindex];
    }
    foreach (rig in level.br_ending.player_rigs) {
        if (isdefined(rig.player)) {
            continue;
        }
        if (!isdefined(rig.winindex)) {
            continue;
        }
        rig linkto(level.br_ending.exfilchopper, tags[rig.winindex], (0, 0, 0), (0, 0, 0));
        rig.linkedtoent = level.br_ending.exfilchopper;
        rig.linkedtotag = tags[rig.winindex];
    }
    chopperexfil_sitting_wind(players);
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b4c
// Size: 0xd4
function private chopperexfil_music_start() {
    if (level.br_ending.winners.size == 0) {
        return;
    }
    var_4de75e7f916838a0 = "br_exfil_part1_1person_lr";
    foreach (player in level.players) {
        player playlocalsound(var_4de75e7f916838a0);
    }
    waitframe();
    foreach (player in level.players) {
        player setsoundsubmix("mp_br_exfil_fade", 4);
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c28
// Size: 0x64
function private chopperexfil_sitting_wind(players) {
    foreach (player in players) {
        if (isdefined(player)) {
            player setwind("30", 1);
        }
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c94
// Size: 0x2c
function private chopperexfil_skip_ascend0(ent) {
    if (level.br_ending.winners.size == 1) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cc8
// Size: 0x2c
function private chopperexfil_skip_ascend1(ent) {
    if (level.br_ending.winners.size == 2) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cfc
// Size: 0x2c
function private chopperexfil_skip_ascend2(ent) {
    if (level.br_ending.winners.size == 3) {
        stop_all_ascend_anims();
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d30
// Size: 0x25
function private chopperexfil_slamtoblack(ent) {
    if (!isdefined(level.br_ending_debugmode)) {
        setomnvarforallclients("ui_world_fade", 1);
    }
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d5d
// Size: 0x26
function private chopper_playfx() {
    self endon("death");
    wait 0.1;
    playfxontag(getfx("chopperExfil_rotorwash"), self, "tag_origin");
}

// Namespace namespace_14494b17e1758742 / namespace_e62527f32363042f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d8b
// Size: 0x21
function private stop_all_ascend_anims() {
    level.br_ending.cam notify("single anim", "end");
}

