#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\anim.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_40f4c8f2b94c5cd9;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_62c595d55b88b26;
#using scripts\mp\gametypes\br_ending.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\common\ui.gsc;

#namespace br_ending_chopper2;

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ec9
// Size: 0x5a
function function_e04bd99e1bb6430b() {
    /#
        setdevdvarifuninitialized(@"hash_70809e88d9881104", 0);
    #/
    delaythread(0.05, &function_c880edba9face762, "chopper2");
    function_d32f459ab9f5e7af();
    level.var_79c116f876dc27eb = &function_3d52f342af8a087a;
    level._effect["player_disconnect"] = loadfx("vfx/iw8_br/gameplay/vfx_br_disconnect_player.vfx");
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f2b
// Size: 0x37
function function_eb5e590400f33c26(accolade, shotfunc) {
    if (!isdefined(level.var_c2df25d0caadc76e)) {
        level.var_c2df25d0caadc76e = [];
    }
    level.var_c2df25d0caadc76e[accolade] = shotfunc;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f6a
// Size: 0x1d
function function_3d52f342af8a087a(winnerplayers, var_f7b694a4edf7dc9a) {
    thread function_79304f320f2acf0f(winnerplayers, var_f7b694a4edf7dc9a);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f8f
// Size: 0x107
function private function_79304f320f2acf0f(winners, var_cbfc3ba10cefc8ce, movetime) {
    soundbank = "mp_gamemode_br_exfils";
    if (scripts\engine\utility::issharedfuncdefined("br_ending_chopper2", "getExfilSoundbank")) {
        soundbank = [[ scripts\engine\utility::getsharedfunc("br_ending_chopper2", "getExfilSoundbank") ]]();
    }
    function_f1aed36ab4598ea(soundbank);
    clearmusicstate();
    wait 1;
    winners = default_to(winners, []);
    var_cbfc3ba10cefc8ce = default_to(var_cbfc3ba10cefc8ce, (0, 0, 0));
    movetime = default_to(movetime, 7);
    endorigin = var_cbfc3ba10cefc8ce + (0, 0, 360);
    startorigin = endorigin + (-7200, 7200, 1800);
    tempent = spawn("script_model", startorigin);
    tempent forcenetfieldhighlod(1);
    waitframe();
    tempent playsoundonmovingent("veh_br_palfa_exfil_incoming");
    tempent moveto(endorigin, movetime);
    wait movetime;
    tempent delete();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x509e
// Size: 0x118d
function chopperexfil_pack(var_cbfc3ba10cefc8ce) {
    if (!isdefined(var_cbfc3ba10cefc8ce)) {
        var_cbfc3ba10cefc8ce = (0, 0, 0);
    }
    foreach (player in level.players) {
        player setclientomnvar("ui_br_infil_exfil_player_focus", -1);
    }
    if (!getdvarint(@"hash_19a406e3c51ce52f")) {
        self.transientname = get_chopperexfil_transient();
        loadinfiltransient(self.transientname);
        setomnvarforallclients("ui_br_end_game_splash_type", 18);
        for (var_24b79087f3897e94 = 0; !var_24b79087f3897e94; var_24b79087f3897e94 = function_2030cc4ad67d1634(self.transientname)) {
            waitframe();
        }
    }
    chopper = function_38c7f6bc1deef269("veh9_mil_air_heli_palfa_doors_open_x_vehphys_mp_exfil", undefined, "veh9_mil_air_heli_palfa_physics_mp_exfil");
    chopper setscriptablepartstate("engine", "on", 0);
    chopper vehicle_turnengineoff();
    chopper.dontteleport = 1;
    scenename = ter_op(isdefined(level.var_81a5664bb0c0dd5a), level.var_81a5664bb0c0dd5a, "chopper2");
    lightingrig = function_8c2d124dbef4fa60(scenename, chopper);
    self.lightingrig = lightingrig;
    self.exfilchopper = chopper;
    chopperexfil_set_brcircle();
    self.winners = array_removeundefined(self.winners);
    /#
        if (getdvarint(@"hash_70809e88d9881104", 0)) {
            self.winners = [];
        }
    #/
    if (self.winners.size == 0) {
        create_disconnectplayer(self);
    } else {
        function_45d36b9c3fc63236(chopper, self.winners[0]);
    }
    var_7fa848e5b3bbc437 = getdvarint(@"hash_cf55e0f95935f5af", 1);
    if (getdvarint(@"hash_19a406e3c51ce52f") || getdvarint(@"hash_2d200a3da7fb2518")) {
        var_7fa848e5b3bbc437 = 0;
    }
    var_807fea2fc7e90adc = undefined;
    var_d980f6395ec61106 = getdvar(@"hash_ad33abd04b38d2fa", "");
    var_d980f5395ec60ed3 = getdvar(@"hash_ad33aad04b38d0c7", "");
    var_d980f4395ec60ca0 = getdvar(@"hash_ad33a9d04b38ce94", "");
    var_d980fb395ec61c05 = getdvar(@"hash_ad33a8d04b38cc61", "");
    var_d980fa395ec619d2 = getdvar(@"hash_ad33a7d04b38ca2e", "");
    var_d980f9395ec6179f = getdvar(@"hash_ad33a6d04b38c7fb", "");
    if (var_d980f6395ec61106 != "" || var_d980f5395ec60ed3 != "" || var_d980f4395ec60ca0 != "" || var_d980fb395ec61c05 != "" || var_d980fa395ec619d2 != "" || var_d980f9395ec6179f != "") {
        var_807fea2fc7e90adc = [];
        var_807fea2fc7e90adc[0] = var_d980f6395ec61106;
        var_807fea2fc7e90adc[1] = var_d980f5395ec60ed3;
        var_807fea2fc7e90adc[2] = var_d980f4395ec60ca0;
        var_807fea2fc7e90adc[3] = var_d980fb395ec61c05;
        var_807fea2fc7e90adc[4] = var_d980fa395ec619d2;
        var_807fea2fc7e90adc[5] = var_d980f9395ec6179f;
    }
    namespace_ab7fb53f62c7ae2e::function_74497a0f417e329f(self.winners);
    scripts\mp\gametypes\br_ending::function_226b83f846d32ff2(self.winners);
    namespace_ab7fb53f62c7ae2e::function_5864d7eeac0e9ac(self.winners, var_7fa848e5b3bbc437, var_807fea2fc7e90adc);
    npc = spawn_script_model("fullbody_mp_ally_helicopter_crew_chief_exfil");
    npc hide(1);
    self.npc = npc;
    npc2 = spawn_script_model("fullbody_usmc_ar_br_infil");
    npc2 hide(1);
    self.npc2 = npc2;
    self.cam = create_cam();
    if (scripts\engine\utility::issharedfuncdefined("br_ending_chopper2", "getAnimPack")) {
        self.pack = self [[ scripts\engine\utility::getsharedfunc("br_ending_chopper2", "getAnimPack") ]](chopper, lightingrig, npc, 0.25);
    } else {
        self.packs = [];
        n = 0;
        self.packs[n] = create_animpack("scene1");
        self.packs[n] function_2d4c340dd3908b2d(55);
        self.packs[n] add_pack_startfunc([], &function_56d4e443a1c8a4b5);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh010"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[4], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[5], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_fem_sh010"]);
        self.packs[n] add_pack_playeranim(self.winners[6], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_fem_sh010"]);
        self.packs[n] add_pack_modelanim(npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_doorguy_sh010"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_camera_sh010"], "wz_iw9_exfil_intro_xcam_sh010");
        n++;
        self.packs[n] = create_animpack("scene3");
        self.packs[n] function_2d4c340dd3908b2d(55);
        self.packs[n] add_pack_startfunc([], &function_b33b68f751a3cbae);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh030"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[4], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[5], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_fem_sh030"]);
        self.packs[n] add_pack_playeranim(self.winners[6], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_fem_sh030"]);
        self.packs[n] add_pack_modelanim(npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_doorguy_sh030"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_camera_sh030"], "wz_iw9_exfil_intro_xcam_sh030");
        n++;
        self.packs[n] = create_animpack("scene4");
        self.packs[n] function_2d4c340dd3908b2d(55);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh040"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        if (self.winners.size == 1) {
            self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_solo_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_solo_fem_sh040"]);
        } else {
            self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_fem_sh040"]);
        }
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_fem_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_fem_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_fem_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[4], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_fem_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[5], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_fem_sh040"]);
        self.packs[n] add_pack_playeranim(self.winners[6], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh040"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_fem_sh040"]);
        self.packs[n] add_pack_modelanim(npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_doorguy_sh040"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_camera_sh040"], "wz_iw9_exfil_intro_xcam_sh040");
        n++;
        self.packs[n] = create_animpack("scene5");
        self.packs[n] function_2d4c340dd3908b2d(55);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh050"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[4], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[5], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_fem_sh050"]);
        self.packs[n] add_pack_playeranim(self.winners[6], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh050"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_fem_sh050"]);
        self.packs[n] add_pack_modelanim(npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_doorguy_sh050"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_camera_sh050"], "wz_iw9_exfil_intro_xcam_sh050");
        n++;
        self.packs[n] = create_animpack("scene6");
        self.packs[n] function_2d4c340dd3908b2d(55);
        self.packs[n] function_6372afdc0e9ee2dd(0.25);
        self.packs[n] function_decf1e23d78d0944([], &function_324c1a95a562301e);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh060"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        self.packs[n] add_pack_playeranim(self.winners[0], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[1], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[2], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[3], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[4], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[5], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_fem_sh060"]);
        self.packs[n] add_pack_playeranim(self.winners[6], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh060"], level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_fem_sh060"]);
        self.packs[n] add_pack_modelanim(npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_doorguy_sh060"]);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_camera_sh060"], "wz_iw9_exfil_intro_xcam_sh060");
        n = function_bb81f97536f811f(n);
        n++;
        self.packs[n] = create_animpack("scene56");
        self.packs[n] function_2d4c340dd3908b2d(65);
        self.packs[n] function_6098f3014cd4c598(0.25);
        self.packs[n] add_pack_startfunc([], &outrofunc);
        self.packs[n] function_decf1e23d78d0944([], &function_2d3425695113e32b);
        self.packs[n] add_pack_modelanim(chopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_outro_helicopter_sh010"]);
        self.packs[n] function_707983b9fdb53c55(lightingrig);
        self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_outro_camera_sh010"], "wz_iw9_exfil_outro_xcam_sh010");
    }
    self.var_43fa788e45fc7b1e = getstartorigin(self.origin, self.angles, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_helicopter_sh010"]);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6233
// Size: 0x5d
function function_45d36b9c3fc63236(chopper, player) {
    if (isdefined(player.vehiclecustomization)) {
        mtx = function_471cde1983a05f66(player, "veh9_palfa");
        if (isdefined(mtx)) {
            chopper.mtx = mtx;
            chopper function_788d3c14d6b4ba6b(mtx.ref);
        }
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6298
// Size: 0x6cb
function function_a5538b1593309bb0() {
    var_79a78f73d2d4925d = [];
    guyradius = 30;
    guyheight = 68;
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh010"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh030"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh040"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh050"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator01_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator02_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator03_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator04_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator05_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator06_sh060"], 0, undefined, guyradius, guyheight);
    var_79a78f73d2d4925d = function_3f005b301ec7f15b(var_79a78f73d2d4925d, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_operator07_sh060"], 0, undefined, guyradius, guyheight);
    choppermodel = "veh9_mil_air_heli_palfa_doors_open_x_vehphys_mp_exfil";
    chopperoriginoffset = (0, 0, -70);
    chopperradius = 350;
    choppersegments = 10;
    var_d4364a524e8a2bcd = 1;
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh010"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh030"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh040"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh050"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh060"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_outro_helicopter_sh010"], 0, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_f317a6f0ae25e3d4(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_outro_helicopter_sh010"], 0.99, chopperoriginoffset, chopperradius, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh010"], chopperoriginoffset, chopperradius, choppersegments, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh030"], chopperoriginoffset, chopperradius, choppersegments, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh040"], chopperoriginoffset, chopperradius, choppersegments, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh050"], chopperoriginoffset, chopperradius, choppersegments, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_intro_helicopter_sh060"], chopperoriginoffset, chopperradius, choppersegments, var_d4364a524e8a2bcd);
    var_79a78f73d2d4925d = function_19ae50e23fe0625a(var_79a78f73d2d4925d, choppermodel, level.var_1a209bd995a7fa83["wz_iw9_exfil_outro_helicopter_sh010"], chopperoriginoffset, chopperradius, 200, var_d4364a524e8a2bcd);
    return var_79a78f73d2d4925d;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x696c
// Size: 0xf0
function private function_bc14125cc728c43c() {
    lightnames = ["light_009", "light_010", "light_003", "light_012", "light_008", "light_012", "light_013", "light_016"];
    if (isdefined(self.lightingrig)) {
        foreach (light in self.lightingrig.lights) {
            if (isdefined(light.name) && array_contains(lightnames, light.name)) {
                light.override_intensity = 0;
            }
        }
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a64
// Size: 0xea
function private function_cd166dfb41041fb2() {
    lightnames = ["light_009", "light_010", "light_003", "light_012", "light_008", "light_012", "light_013", "light_016"];
    if (isdefined(self.lightingrig)) {
        foreach (light in self.lightingrig.lights) {
            if (isdefined(light.name) && array_contains(lightnames, light.name)) {
                light.override_intensity = undefined;
            }
        }
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b56
// Size: 0x69
function private function_98486f8b479597e1(percent) {
    if (percent <= 0) {
        percent = 0;
    } else if (percent >= 1) {
        percent = 1;
    }
    var_c5faa94190723347 = int(percent * 100);
    var_c5faa94190723347 -= mod(var_c5faa94190723347, 10);
    self setscriptablepartstate("wind", string(var_c5faa94190723347), 1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bc7
// Size: 0x184
function private function_48b6ad7afc978b6c() {
    self endon("stopWind");
    var_1e51bf3beb996bea = getdvarfloat(@"hash_35e512315ec17f9e", -175);
    windmaxdistance = getdvarfloat(@"hash_35c124315e992c7c", -275);
    while (true) {
        baseorigin = self.exfilchopper.origin;
        baseangles = self.exfilchopper.angles;
        if (!isdefined(baseangles)) {
            baseangles = (0, 0, 0);
        }
        basedirection = anglestoforward(baseangles);
        operators = array_add(self.winners, self.npc);
        foreach (operator in operators) {
            if (!isdefined(operator)) {
                continue;
            }
            if (istrue(operator.isdisconnectplayer)) {
                continue;
            }
            var_2024448b0e38d2cd = operator.origin - baseorigin;
            projection = math::scalar_projection(basedirection, var_2024448b0e38d2cd);
            projectionpercent = (projection - var_1e51bf3beb996bea) / (windmaxdistance - var_1e51bf3beb996bea);
            operator function_98486f8b479597e1(projectionpercent);
        }
        wait 0.1;
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d53
// Size: 0x9f
function private clearplayerwind() {
    self notify("stopWind");
    operators = array_add(self.winners, self.npc);
    foreach (operator in operators) {
        if (!isdefined(operator)) {
            continue;
        }
        if (istrue(operator.isdisconnectplayer)) {
            continue;
        }
        operator setscriptablepartstate("wind", "1", 1);
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dfa
// Size: 0x146
function function_56d4e443a1c8a4b5(array) {
    self.npc show();
    level thread function_b9291d46181cf846(self.winners);
    function_bc14125cc728c43c();
    operators = array_add(self.winners, self.npc);
    foreach (operator in operators) {
        if (!isdefined(operator)) {
            continue;
        }
        if (istrue(operator.isdisconnectplayer)) {
            continue;
        }
        operator setscriptablepartstate("wind", "100", 1);
    }
    if (getdvarint(@"hash_b44ba42bba42b79e", 1)) {
        if (isdefined(self.var_43fa788e45fc7b1e)) {
            foreach (player in level.players) {
                player function_bc667001f9dd3808(self.var_43fa788e45fc7b1e);
            }
        }
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f48
// Size: 0x13
function function_b33b68f751a3cbae(array) {
    thread function_48b6ad7afc978b6c();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f63
// Size: 0x1c
function function_4aab258f30cc0184(array) {
    self.npc hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f87
// Size: 0x142
function function_b9291d46181cf846(winners) {
    var_d39eb0d89e4b241f = 7;
    winners = default_to(winners, []);
    var_c5d4ae74fe20f862 = min(winners.size, var_d39eb0d89e4b241f);
    assertex(winners.size >= 0 && winners.size <= 7, "chopper introStart_audioThread: unexpected winners.size");
    musicstate = function_17ee301cf0b5ba85("br_exfil_intro1");
    musicstate_classic = function_17ee301cf0b5ba85("br_exfil_intro1_classic");
    soundalias = "scn_br_palfa_exfil_intro";
    if (var_c5d4ae74fe20f862 > 0) {
        musicset = "br_exfil_intro" + var_c5d4ae74fe20f862;
        musicstate = function_17ee301cf0b5ba85(musicset);
        musicstate_classic = function_17ee301cf0b5ba85(musicset + "_classic");
        prefix = "scn_br_palfa_exfil_";
        if (scripts\engine\utility::issharedfuncdefined("br_ending_chopper2", "getExfilSoundPrefix")) {
            prefix = [[ scripts\engine\utility::getsharedfunc("br_ending_chopper2", "getExfilSoundPrefix") ]]();
        }
        soundalias = prefix + var_c5d4ae74fe20f862 + "player";
    }
    function_fe75a89529dd0fd0(level.players, musicstate, undefined, undefined, musicstate_classic);
    function_7acde5feb50c98f2(level.players, soundalias);
    function_4e8ba327eb12540c(level.players, "mp_br_exfil_fade", 4);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d1
// Size: 0x1d6
function function_324c1a95a562301e(array) {
    foreach (player in level.players) {
        player setclienttriggeraudiozone("br_exfil_palfa_int", 0);
    }
    function_4aab258f30cc0184(array);
    var_25cf5fd8fe110865 = ter_op(isdefined(level.var_2fbc45a120a095d), level.var_2fbc45a120a095d, "mp_saba_exfil");
    _visionsetnaked(var_25cf5fd8fe110865, 0);
    function_ee7c0ccde65de2ec(%"hash_270c7fe96829828b");
    fistsweapon = makeweapon("iw9_me_fists_mp");
    foreach (player in self.winners) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.player_rig) && isdefined(player.player_rig.avatar) && isdefined(player.player_rig.avatar.weaponent)) {
            player.player_rig.avatar.weaponent delete();
        }
        if (istrue(player.isdisconnectplayer)) {
            continue;
        }
        player clearaccessory();
        player takeallweapons();
        player giveweapon(fistsweapon);
        player switchtoweaponimmediate(fistsweapon);
    }
    function_cd166dfb41041fb2();
    clearplayerwind();
    thread function_e395443832372863();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72af
// Size: 0x13f
function function_e395443832372863() {
    previousscenename = "scene6";
    targetscenename = "scene56";
    var_1da0ebb14f23d56a = 0;
    var_86ef029e00d906fe = 0;
    foreach (pack in self.packs) {
        if (pack.anime == targetscenename) {
            break;
        }
        if (!var_1da0ebb14f23d56a && pack.anime == previousscenename) {
            var_1da0ebb14f23d56a = 1;
            continue;
        }
        if (var_1da0ebb14f23d56a) {
            if (isdefined(pack.xcamasset)) {
                xcamlength = getxcamlength(pack.xcamasset);
                var_86ef029e00d906fe += xcamlength;
                continue;
            }
            animlength = getanimlength(level.scr_anim["endingCam"][pack.anime]);
            var_86ef029e00d906fe += animlength;
        }
    }
    var_86ef029e00d906fe -= mod(var_86ef029e00d906fe, 0.05);
    level thread function_42f6e3ede94bfa29(var_86ef029e00d906fe);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73f6
// Size: 0x134
function function_acf4f08cf7755a04(array) {
    if (array.size > 0) {
        playernumber = array[0];
        if (isdefined(playernumber)) {
            foreach (winner in self.winners) {
                if (isdefined(winner) && isplayer(winner)) {
                    if (winner getentitynumber() == playernumber) {
                        winner function_6fb380927695ee76();
                        winner function_985b0973f29da4f8("br_ending_chopper2::hideAllButFocusPlayer()");
                        continue;
                    }
                    winner function_a593971d75d82113();
                    winner function_379bb555405c16bb("br_ending_chopper2::hideAllButFocusPlayer()");
                }
            }
            foreach (rig in self.player_rigs) {
                if (rig.playernum == playernumber) {
                    rig function_e874fd3a9c016379(0, 1);
                    continue;
                }
                rig function_e874fd3a9c016379(1, 1);
            }
        }
    }
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7532
// Size: 0x37
function function_a58b0cd5621c3a9b(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_assists");
    function_acf4f08cf7755a04(array);
    self.npc show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7571
// Size: 0x1c
function function_54b72844c61d70d6(array) {
    self.npc hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7595
// Size: 0x37
function function_f3fef66a70eef54c(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_bigguns");
    function_acf4f08cf7755a04(array);
    self.turret show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d4
// Size: 0x1c
function function_dcff93dc43b3b24d(array) {
    self.turret hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f8
// Size: 0x37
function function_11c3e7f6948a2f8b(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_interrogator");
    function_acf4f08cf7755a04(array);
    self.phones show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7637
// Size: 0x1c
function function_9e25517348f9bc46(array) {
    self.phones hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x765b
// Size: 0x37
function function_8a728519d4905203(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_survivor");
    function_acf4f08cf7755a04(array);
    self.npc show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x769a
// Size: 0x1c
function function_34b1eedbda30832e(array) {
    self.npc hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76be
// Size: 0x37
function function_d194cefae48cf24b(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_commando");
    function_acf4f08cf7755a04(array);
    self.shotgun show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76fd
// Size: 0x1c
function function_874c741f98ea4106(array) {
    self.shotgun hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7721
// Size: 0x37
function function_932662a48f4b78a0(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_killer");
    function_acf4f08cf7755a04(array);
    self.pistol show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7760
// Size: 0x1c
function function_d4167f1fb22f9b99(array) {
    self.pistol hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7784
// Size: 0x37
function function_4ab372da9678b072(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_assassin");
    function_acf4f08cf7755a04(array);
    self.knife show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77c3
// Size: 0x1c
function function_c1d49d4c8bbd7f8f(array) {
    self.knife hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77e7
// Size: 0x37
function function_efcf7c93bc6a0909(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_machinist");
    function_acf4f08cf7755a04(array);
    self.trophy show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7826
// Size: 0x1c
function function_e0b764063f385640(array) {
    self.trophy hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x784a
// Size: 0x46
function function_a051b485ba0fb929(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_pyro");
    function_acf4f08cf7755a04(array);
    self.molotov show();
    self.lighter show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7898
// Size: 0x2d
function function_2bc9b32efc090060(array) {
    self.molotov hide(1);
    self.lighter hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78cd
// Size: 0x37
function function_15415640afe4a773(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_breacher");
    function_acf4f08cf7755a04(array);
    self.map show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x790c
// Size: 0x1c
function function_dd6b801655a7c7de(array) {
    self.map hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7930
// Size: 0x37
function function_febe34f292dd99aa(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_moneybags");
    function_acf4f08cf7755a04(array);
    self.duffels show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x796f
// Size: 0x1c
function function_e5af63c2421e9f7(array) {
    self.duffels hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7993
// Size: 0x37
function function_966e436219859937(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_marksman");
    function_acf4f08cf7755a04(array);
    self.ar show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79d2
// Size: 0x1c
function function_8138aa473f39300a(array) {
    self.ar hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79f6
// Size: 0x37
function function_6e62f53b0aad04ec(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_sniper");
    function_acf4f08cf7755a04(array);
    self.sniper show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a35
// Size: 0x1c
function function_ae65051999f31fed(array) {
    self.sniper hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a59
// Size: 0x37
function function_25b6a50a7aa50c29(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_scout");
    function_acf4f08cf7755a04(array);
    self.tablet show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a98
// Size: 0x1c
function function_108417d7e3f01b60(array) {
    self.tablet hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7abc
// Size: 0x37
function function_ccc949210abf432a(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_team_objectives");
    function_acf4f08cf7755a04(array);
    self.laptop show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7afb
// Size: 0x1c
function function_a5500f224fd47777(array) {
    self.laptop hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b1f
// Size: 0x55
function function_3da3c099a7b6d51d(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_trapper");
    function_acf4f08cf7755a04(array);
    self.claymore show();
    self.claymore_stack show();
    self.c4_stack show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b7c
// Size: 0x3e
function function_3cf591a6ff5a5b7c(array) {
    self.claymore hide(1);
    self.claymore_stack hide(1);
    self.c4_stack hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc2
// Size: 0x73
function function_16667626a939adaf(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_scavenger");
    function_acf4f08cf7755a04(array);
    self.sniper show();
    self.shotgun show();
    self.pistol show();
    self.ar show();
    self.duffels show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c3d
// Size: 0x60
function function_30779e2b5ada3052(array) {
    self.sniper hide(1);
    self.shotgun hide(1);
    self.pistol hide(1);
    self.ar hide(1);
    self.duffels hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ca5
// Size: 0x91
function function_fb788d97921f7d15(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_supplier");
    function_acf4f08cf7755a04(array);
    self.sniper show();
    self.shotgun show();
    self.pistol show();
    self.ar show();
    self.duffels show();
    self.vest show();
    self.npc2 show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3e
// Size: 0x82
function function_ced95b76ae5616e4(array) {
    self.sniper hide(1);
    self.shotgun hide(1);
    self.pistol hide(1);
    self.ar hide(1);
    self.duffels hide(1);
    self.vest hide(1);
    self.npc2 hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dc8
// Size: 0x37
function function_88eefe51538f221d(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_medic");
    function_acf4f08cf7755a04(array);
    self.stim show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e07
// Size: 0x1c
function function_d76ec37713e7e07c(array) {
    self.stim hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e2b
// Size: 0x37
function function_85db091ef1712ad6(array) {
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_accolade_ghost");
    function_acf4f08cf7755a04(array);
    self.dogtags show();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e6a
// Size: 0x1c
function function_5016da1692956a9b(array) {
    self.dogtags hide(1);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e8e
// Size: 0xab
function function_42f6e3ede94bfa29(var_86ef029e00d906fe) {
    var_86ef029e00d906fe = default_to(var_86ef029e00d906fe, 0);
    if (var_86ef029e00d906fe > 1.5) {
        waittime = var_86ef029e00d906fe - 1.5;
        wait waittime;
    }
    foreach (player in level.players) {
        player clearclienttriggeraudiozone(1.5);
    }
    function_7acde5feb50c98f2(level.players, "scn_br_palfa_exfil_outro");
    clearmusicstate();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f41
// Size: 0xb1
function function_4d471b771b1ff7e8() {
    level waittill("br_credits_complete");
    delaytime = getdvarfloat(@"hash_c88b807ea15b731f", 0);
    fadedowntime = getdvarfloat(@"hash_a1ceffe4417264d1", 1);
    var_95a318d022e623a7 = getdvarfloat(@"hash_c9f5c9db0c714fae", 2);
    var_1bb7594c18d17443 = getdvarfloat(@"hash_4633bce56a15979a", 1);
    if (delaytime > 0) {
        wait delaytime;
    }
    level.var_9b73afbde2775159 = 1;
    level thread function_c300d34e34164b6d(fadedowntime, var_95a318d022e623a7, var_1bb7594c18d17443);
    if (fadedowntime > 0) {
        wait fadedowntime;
    }
    level notify("br_ending_skip_scene");
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ffa
// Size: 0x13
function function_c63452ae16fa9df1(val) {
    level notify("br_credits_complete");
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8015
// Size: 0xdf
function outrofunc(array) {
    if (getdvarint(@"hash_b44ba42bba42b79e", 1)) {
        foreach (player in level.players) {
            player clearpredictedstreampos();
        }
    }
    _visionsetnaked("", 0);
    function_90fb4916aa7fd9f3(%"hash_270c7fe96829828b");
    function_ee7c0ccde65de2ec(%"hash_2d625fb2f0ff42fb");
    if (!scripts\mp\gametypes\br_public::isanytutorialorbotpracticematch()) {
        setomnvarforallclients("post_game_state", 14);
        setomnvarforallclients("ui_br_end_game_splash_type", 17);
    }
    level scripts\common\ui::lui_registercallback("br_credits_complete", &function_c63452ae16fa9df1);
    level thread function_4d471b771b1ff7e8();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80fc
// Size: 0x4e
function function_2d3425695113e32b(array) {
    if (!istrue(level.var_9b73afbde2775159)) {
        level thread function_c300d34e34164b6d(undefined, 2, 1);
    }
    level.var_9b73afbde2775159 = undefined;
    function_90fb4916aa7fd9f3(%"hash_2d625fb2f0ff42fb");
    level thread function_c4ebe940e6d84d42();
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8152
// Size: 0x47
function function_c4ebe940e6d84d42() {
    wait 60;
    soundbank = "mp_gamemode_br_exfils";
    if (scripts\engine\utility::issharedfuncdefined("br_ending_chopper2", "getExfilSoundbank")) {
        soundbank = [[ scripts\engine\utility::getsharedfunc("br_ending_chopper2", "getExfilSoundbank") ]]();
    }
    function_f4e0ff5cb899686d(soundbank);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81a1
// Size: 0x132
function get_chopperexfil_transient() {
    switch (level.script) {
    case #"hash_4aa5d6e97851bdbd": 
        return "mp_infil_br_mechanics_ending_chopper2_tr";
    case #"hash_3ebe34631513de1d": 
        return "mp_infil_br_jup_mech_ending_chopper2_tr";
    case #"hash_75b253ac88bdcfe": 
        return "mp_infil_br_saba_pm_ending_chopper2_tr";
    case #"hash_57eba45b7ddbdcd6":
    case #"hash_63326ac3e12f8da0":
    case #"hash_9ae3f9a4f2372775": 
        return "mp_infil_br_saba_ending_chopper2_tr";
    case #"hash_aeddd44c5b27b2d":
    case #"hash_bce1a7274538a78":
    case #"hash_73e90c896fdaebc3": 
        return "mp_infil_br_jup_bigmap_ending_chopper2_tr";
    case #"hash_4617d802bdced46":
    case #"hash_a82a4d91a314a926": 
        return "mp_infil_br_sealion_ending_chopper2_tr";
    case #"hash_3eff14ec1d9395c1":
    case #"hash_636b409bbce21729":
    case #"hash_e817308cc606e9e1": 
        return "mp_infil_delta_ending_chopper2_tr";
    case #"hash_9606e63421f54d69": 
        return "mp_infil_delta_pm_ending_chopper2_tr";
    case #"hash_2ca9e474cad5e079": 
        return "mp_infil_br_escape4_ending_chopper2_tr";
    case #"hash_da8f14763f037922": 
        return "mp_infil_br_jup_sm_island_2_ending_chopper2_tr";
    case #"hash_a3e3924c74796689": 
        return "mp_infil_br_escape4_ending_chopper2_tr";
    }
    return "";
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82dc
// Size: 0x156
function function_d32f459ab9f5e7af() {
    function_eb5e590400f33c26("assists", &function_b3b9870beb16d86a);
    function_eb5e590400f33c26("bigguns", &function_7e54a96ea5e607d6);
    function_eb5e590400f33c26("interrogator", &function_12e989117d690d7);
    function_eb5e590400f33c26("survivor", &function_2aefbd13a387e43b);
    function_eb5e590400f33c26("commando", &function_cd69f0db8f84cbe3);
    function_eb5e590400f33c26("killer", &function_2e1f07b2be2d2fa2);
    function_eb5e590400f33c26("assassin", &function_4d1476b502255acc);
    function_eb5e590400f33c26("machinist", &function_aa5a08332191098d);
    function_eb5e590400f33c26("pyro", &function_8b2bdba1733047bd);
    function_eb5e590400f33c26("breacher", &function_9dd165dbfb566c1b);
    function_eb5e590400f33c26("moneybags", &function_b708b05c5b1f9748);
    function_eb5e590400f33c26("marksman", &function_21deb471e3977db7);
    function_eb5e590400f33c26("sniper", &function_b8c41db7e4f3c4f2);
    function_eb5e590400f33c26("scout", &function_d1ca14fc67a1a96d);
    function_eb5e590400f33c26("teamobjectives", &function_64e12d18ecc4e758);
    function_eb5e590400f33c26("trapper", &function_aaa9c9c9a239388d);
    function_eb5e590400f33c26("scavenger", &function_ae31b668b8588403);
    function_eb5e590400f33c26("supplier", &function_e95e12d39f4b87d9);
    function_eb5e590400f33c26("medic", &function_3ac76bb4e8c880e1);
    function_eb5e590400f33c26("ghost", &function_9a174d9e60e5ca74);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x843a
// Size: 0x102
function function_bb81f97536f811f(n) {
    foreach (var_16a81c74ce61860e in level.var_6b11625abe5346b0) {
        var_b37316fae4667b00 = var_16a81c74ce61860e.ref;
        player = var_16a81c74ce61860e.player;
        var_1384d9221443f717 = level.var_bcf7be5c24905ab9[var_b37316fae4667b00];
        assert(isdefined(var_1384d9221443f717));
        assert(isdefined(var_1384d9221443f717.name));
        assert(isdefined(level.var_c2df25d0caadc76e));
        var_32fadf218fe865ad = level.var_c2df25d0caadc76e[var_1384d9221443f717.name];
        assert(isdefined(var_32fadf218fe865ad));
        n = [[ var_32fadf218fe865ad ]](n, player);
    }
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8545
// Size: 0xe0
function function_734a8512ebf4e928(player, array) {
    assert(isdefined(array));
    assert(array.size == 2);
    assert(isstring(array[0]));
    var_b37316fae4667b00 = array[0];
    var_5a4f63372f6a484d = array[1];
    var_caa2afb2cdcb7815 = level.var_e3fca817c22e740d[var_b37316fae4667b00];
    assert(isdefined(var_caa2afb2cdcb7815));
    assert(var_caa2afb2cdcb7815 >= 0 && var_caa2afb2cdcb7815 < 256);
    var_c7df9d76114d30f4 = 0;
    if (isdefined(var_5a4f63372f6a484d)) {
        var_c7df9d76114d30f4 = var_5a4f63372f6a484d getentitynumber();
    }
    assert(var_c7df9d76114d30f4 >= 0 && var_c7df9d76114d30f4 < 256);
    var_5c9ddcf56d36f133 = var_c7df9d76114d30f4;
    var_5c9ddcf56d36f133 |= var_caa2afb2cdcb7815 << 8;
    player setclientomnvar("ui_br_infil_exfil_player_focus", var_5c9ddcf56d36f133);
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862d
// Size: 0x1be
function function_b3b9870beb16d86a(n, player) {
    assert(isdefined(self.npc));
    n++;
    self.packs[n] = create_animpack("assists");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(48);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_a58b0cd5621c3a9b);
    self.packs[n] function_decf1e23d78d0944([], &function_54b72844c61d70d6);
    self.packs[n] function_e718ba63d511fcde(["assists", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.npc, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_operator02_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assists_camera_sh010"], "wz_IW9_exfil_acc_assists_xcam_sh010");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87f4
// Size: 0x1dd
function function_7e54a96ea5e607d6(n, player) {
    if (!isdefined(self.turret)) {
        self.turret = spawn_script_model("weapon_vm_mg_sentry_turret_exfil");
        self.turret hide(1);
    }
    n++;
    self.packs[n] = create_animpack("biggunsA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_f3fef66a70eef54c);
    self.packs[n] function_decf1e23d78d0944([], &function_dcff93dc43b3b24d);
    self.packs[n] function_e718ba63d511fcde(["bigguns", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_bigguns_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_bigguns_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_bigguns_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.turret, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_bigguns_mg_sentry_turret_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_bigguns_camera_sh010"], "wz_iw9_exfil_acc_bigguns_xcam_sh010");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89da
// Size: 0x2e6
function function_12e989117d690d7(n, player) {
    if (!isdefined(self.phones)) {
        self.phones = spawn_script_model("offhand1h_smartphone_exfil");
        self.phones hide(1);
    }
    n++;
    self.packs[n] = create_animpack("interrogatorA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_11c3e7f6948a2f8b);
    self.packs[n] function_e718ba63d511fcde(["interrogator", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.phones, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_smphones_01_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_camera_sh010"], "wz_iw9_exfil_acc_interrogator_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("interrogatorB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_9e25517348f9bc46);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_operator01_sh020"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.phones, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_smphones_01_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_interrogator_camera_sh020"], "wz_iw9_exfil_acc_interrogator_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cc9
// Size: 0x1be
function function_2aefbd13a387e43b(n, player) {
    assert(isdefined(self.npc));
    n++;
    self.packs[n] = create_animpack("survivor");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_8a728519d4905203);
    self.packs[n] function_decf1e23d78d0944([], &function_34b1eedbda30832e);
    self.packs[n] function_e718ba63d511fcde(["survivor", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_survivor_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_survivor_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_survivor_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.npc, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_survivor_operator02_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_survivor_camera_sh010"], "wz_iw9_exfil_acc_survivor_xcam_sh010");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e90
// Size: 0x4f8
function function_cd69f0db8f84cbe3(n, player) {
    if (!isdefined(self.shotgun)) {
        self.shotgun = spawn_script_model("wpn_vm_p12_sh_mike1014_exfil");
        self.shotgun hide(1);
    }
    n++;
    self.packs[n] = create_animpack("commandoA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_d194cefae48cf24b);
    self.packs[n] function_e718ba63d511fcde(["commando", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_sh_mike1014_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_camera_sh010"], "wz_iw9_exfil_acc_commando_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("commandoB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_sh_mike1014_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_camera_sh020"], "wz_iw9_exfil_acc_commando_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("commandoC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_sh_mike1014_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_camera_sh030"], "wz_iw9_exfil_acc_commando_xcam_sh030");
    n++;
    self.packs[n] = create_animpack("commandoD");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_874c741f98ea4106);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_helicopter_sh040"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_sh040"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_operator01_fem_sh040"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_sh_mike1014_sh040"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_commando_camera_sh040"], "wz_iw9_exfil_acc_commando_xcam_sh040");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9391
// Size: 0x3ef
function function_2e1f07b2be2d2fa2(n, player) {
    if (!isdefined(self.pistol)) {
        self.pistol = spawn_script_model("wpn_vm_p27_pi_papa220_exfil");
        self.pistol hide(1);
    }
    n++;
    self.packs[n] = create_animpack("killerA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_932662a48f4b78a0);
    self.packs[n] function_e718ba63d511fcde(["killer", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_pipapa220_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_camera_sh010"], "wz_iw9_exfil_acc_killer_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("killerB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_sh020"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_pipapa220_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_camera_sh020"], "wz_iw9_exfil_acc_killer_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("killerC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_d4167f1fb22f9b99);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_pipapa220_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_killer_camera_sh030"], "wz_iw9_exfil_acc_killer_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9789
// Size: 0x3ef
function function_4d1476b502255acc(n, player) {
    if (!isdefined(self.knife)) {
        self.knife = spawn_script_model("att_wm_p33_me_tac_knife02_exfil");
        self.knife hide(1);
    }
    n++;
    self.packs[n] = create_animpack("assassinA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_4ab372da9678b072);
    self.packs[n] function_e718ba63d511fcde(["assassin", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.knife, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_knife_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_camera_sh010"], "wz_iw9_exfil_acc_assassin_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("assassinB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_sh020"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.knife, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_knife_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_camera_sh020"], "wz_iw9_exfil_acc_assassin_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("assassinC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_c1d49d4c8bbd7f8f);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_sh030"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.knife, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_knife_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_assassin_camera_sh030"], "wz_iw9_exfil_acc_assassin_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b81
// Size: 0x2e6
function function_aa5a08332191098d(n, player) {
    if (!isdefined(self.trophy)) {
        self.trophy = spawn_script_model("offhand_2h_vm_trophy_system_exfil");
        self.trophy hide(1);
    }
    n++;
    self.packs[n] = create_animpack("machinistA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_efcf7c93bc6a0909);
    self.packs[n] function_e718ba63d511fcde(["machinist", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.trophy, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_2htrophy_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_camera_sh010"], "wz_iw9_exfil_acc_machinist_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("machinistB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_e0b764063f385640);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.trophy, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_2htrophy_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_machinist_camera_sh020"], "wz_iw9_exfil_acc_machinist_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e70
// Size: 0x49f
function function_8b2bdba1733047bd(n, player) {
    if (!isdefined(self.molotov)) {
        self.molotov = spawn_script_model("offhand_2h_vm_molotov_exfil");
        self.molotov hide(1);
    }
    if (!isdefined(self.lighter)) {
        self.lighter = spawn_script_model("equipment_lighter_wm_exfil");
        self.lighter hide(1);
    }
    n++;
    self.packs[n] = create_animpack("pyroA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_a051b485ba0fb929);
    self.packs[n] function_e718ba63d511fcde(["pyro", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.molotov, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_molotov_sh010"]);
    self.packs[n] add_pack_modelanim(self.lighter, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_lighter_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_camera_sh010"], "wz_iw9_exfil_acc_pyro_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("pyroB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.molotov, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_molotov_sh020"]);
    self.packs[n] add_pack_modelanim(self.lighter, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_lighter_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_camera_sh020"], "wz_iw9_exfil_acc_pyro_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("pyroC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_2bc9b32efc090060);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.molotov, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_molotov_sh030"]);
    self.packs[n] add_pack_modelanim(self.lighter, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_lighter_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_pyro_camera_sh030"], "wz_iw9_exfil_acc_pyro_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa318
// Size: 0x2e6
function function_9dd165dbfb566c1b(n, player) {
    if (!isdefined(self.map)) {
        self.map = spawn_script_model("accessory_paper_wall_map_exfil");
        self.map hide(1);
    }
    n++;
    self.packs[n] = create_animpack("breacherA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_15415640afe4a773);
    self.packs[n] function_e718ba63d511fcde(["breacher", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_operator01_sh010"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.map, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_map_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_camera_sh010"], "wz_iw9_exfil_acc_breacher_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("breacherB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_dd6b801655a7c7de);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_operator01_sh020"], level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.map, level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_map_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_iw9_exfil_acc_breacher_camera_sh020"], "wz_iw9_exfil_acc_breacher_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa607
// Size: 0x3ef
function function_b708b05c5b1f9748(n, player) {
    if (!isdefined(self.duffels)) {
        self.duffels = spawn_script_model("accessory_money_bag_large_exfil");
        self.duffels hide(1);
    }
    n++;
    self.packs[n] = create_animpack("moneybagsA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_febe34f292dd99aa);
    self.packs[n] function_e718ba63d511fcde(["moneybags", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_moneybag01_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_camera_sh010"], "wz_iw9_exfil_acc_moneybags_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("moneybagsB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_moneybag01_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_camera_sh020"], "wz_iw9_exfil_acc_moneybags_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("moneybagsC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_e5af63c2421e9f7);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_moneybag01_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_moneybags_camera_sh030"], "wz_iw9_exfil_acc_moneybags_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9ff
// Size: 0x3ef
function function_21deb471e3977db7(n, player) {
    if (!isdefined(self.ar)) {
        self.ar = spawn_script_model("wpn_wm_p01_ar_mike4_exfil");
        self.ar hide(1);
    }
    n++;
    self.packs[n] = create_animpack("marksmanA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(40);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_966e436219859937);
    self.packs[n] function_e718ba63d511fcde(["marksman", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_mike4_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_camera_sh010"], "wz_iw9_exfil_acc_marksman_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("marksmanB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_mike4_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_camera_sh020"], "wz_iw9_exfil_acc_marksman_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("marksmanC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_8138aa473f39300a);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_mike4_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_marksman_camera_sh030"], "wz_iw9_exfil_acc_marksman_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadf7
// Size: 0x3ef
function function_b8c41db7e4f3c4f2(n, player) {
    if (!isdefined(self.sniper)) {
        self.sniper = spawn_script_model("weapon_wm_sn_alpha50_exfil");
        self.sniper hide(1);
    }
    n++;
    self.packs[n] = create_animpack("sniperA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_6e62f53b0aad04ec);
    self.packs[n] function_e718ba63d511fcde(["sniper", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_snalpha50_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_camera_sh010"], "wz_iw9_exfil_acc_sniper_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("sniperB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_snalpha50_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_camera_sh020"], "wz_iw9_exfil_acc_sniper_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("sniperC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_ae65051999f31fed);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_snalpha50_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_sniper_camera_sh030"], "wz_iw9_exfil_acc_sniper_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1ef
// Size: 0x3ef
function function_d1ca14fc67a1a96d(n, player) {
    if (!isdefined(self.tablet)) {
        self.tablet = spawn_script_model("offhand_1h_vm_tablet_ui_v0");
        self.tablet hide(1);
    }
    n++;
    self.packs[n] = create_animpack("scoutA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(35);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_25b6a50a7aa50c29);
    self.packs[n] function_e718ba63d511fcde(["scout", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.tablet, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_tablet_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_camera_sh010"], "wz_iw9_exfil_acc_scout_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("scoutB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(45);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.tablet, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_tablet_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_camera_sh020"], "wz_iw9_exfil_acc_scout_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("scoutC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_108417d7e3f01b60);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.tablet, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_tablet_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scout_camera_sh030"], "wz_iw9_exfil_acc_scout_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5e7
// Size: 0x3ef
function function_64e12d18ecc4e758(n, player) {
    if (!isdefined(self.laptop)) {
        self.laptop = spawn_script_model("device_laptop_exfil");
        self.laptop hide(1);
    }
    n++;
    self.packs[n] = create_animpack("teamObjectivesA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(35);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_ccc949210abf432a);
    self.packs[n] function_e718ba63d511fcde(["teamobjectives", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.laptop, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_laptop_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_camera_sh010"], "wz_IW9_exfil_acc_team_objectives_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("teamObjectivesB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.laptop, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_laptop_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_camera_sh020"], "wz_IW9_exfil_acc_team_objectives_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("teamObjectivesC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(55);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_a5500f224fd47777);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.laptop, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_laptop_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_team_objectives_camera_sh030"], "wz_IW9_exfil_acc_team_objectives_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9df
// Size: 0x3f2
function function_aaa9c9c9a239388d(n, player) {
    if (!isdefined(self.claymore)) {
        self.claymore = spawn_script_model("offhand_2h_vm_c4_exfil");
        self.claymore hide(1);
    }
    if (!isdefined(self.claymore_stack)) {
        self.claymore_stack = spawn_script_model("offhand_wm_claymore_stack_exfil");
        self.claymore_stack hide(1);
    }
    if (!isdefined(self.c4_stack)) {
        self.c4_stack = spawn_script_model("offhand_wm_c4_stack_exfil");
        self.c4_stack hide(1);
    }
    n++;
    self.packs[n] = create_animpack("trapperA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_3da3c099a7b6d51d);
    self.packs[n] function_e718ba63d511fcde(["trapper", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.claymore, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_claymore_sh010"]);
    self.packs[n] add_pack_modelanim(self.claymore_stack, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_stack_claymore_sh010"]);
    self.packs[n] add_pack_modelanim(self.c4_stack, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_stack_c4_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_camera_sh010"], "wz_iw9_exfil_acc_trapper_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("trapperB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_3cf591a6ff5a5b7c);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.claymore, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_claymore_sh020"]);
    self.packs[n] add_pack_modelanim(self.claymore_stack, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_stack_claymore_sh020"]);
    self.packs[n] add_pack_modelanim(self.c4_stack, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_stack_c4_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_trapper_camera_sh020"], "wz_iw9_exfil_acc_trapper_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdda
// Size: 0x6af
function function_ae31b668b8588403(n, player) {
    if (!isdefined(self.sniper)) {
        self.sniper = spawn_script_model("weapon_wm_sn_alpha50_exfil");
        self.sniper hide(1);
    }
    if (!isdefined(self.shotgun)) {
        self.shotgun = spawn_script_model("wpn_vm_p12_sh_mike1014_exfil");
        self.shotgun hide(1);
    }
    if (!isdefined(self.pistol)) {
        self.pistol = spawn_script_model("wpn_vm_p27_pi_papa220_exfil");
        self.pistol hide(1);
    }
    if (!isdefined(self.ar)) {
        self.ar = spawn_script_model("wpn_wm_p01_ar_mike4_exfil");
        self.ar hide(1);
    }
    if (!isdefined(self.duffels)) {
        self.duffels = spawn_script_model("accessory_money_bag_large_exfil");
        self.duffels hide(1);
    }
    n++;
    self.packs[n] = create_animpack("scavengerA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_16667626a939adaf);
    self.packs[n] function_e718ba63d511fcde(["scavenger", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_alpha50_sh010"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike1014_sh010"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_papa220_sh010"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike4_sh010"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_money_bag_large_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_camera_sh010"], "wz_iw9_exfil_acc_scavenger_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("scavengerB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(50);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_alpha50_sh020"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike1014_sh020"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_papa220_sh020"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike4_sh020"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_money_bag_large_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_camera_sh020"], "wz_iw9_exfil_acc_scavenger_xcam_sh020");
    n++;
    self.packs[n] = create_animpack("scavengerC");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_30779e2b5ada3052);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_helicopter_sh030"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_sh030"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_operator01_fem_sh030"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_alpha50_sh030"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike1014_sh030"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_papa220_sh030"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_mike4_sh030"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_money_bag_large_sh030"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_scavenger_camera_sh030"], "wz_iw9_exfil_acc_scavenger_xcam_sh030");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc492
// Size: 0x5eb
function function_e95e12d39f4b87d9(n, player) {
    assert(isdefined(self.npc2));
    if (!isdefined(self.sniper)) {
        self.sniper = spawn_script_model("weapon_wm_sn_alpha50_exfil");
        self.sniper hide(1);
    }
    if (!isdefined(self.shotgun)) {
        self.shotgun = spawn_script_model("wpn_vm_p12_sh_mike1014_exfil");
        self.shotgun hide(1);
    }
    if (!isdefined(self.pistol)) {
        self.pistol = spawn_script_model("wpn_vm_p27_pi_papa220_exfil");
        self.pistol hide(1);
    }
    if (!isdefined(self.ar)) {
        self.ar = spawn_script_model("wpn_wm_p01_ar_mike4_exfil");
        self.ar hide(1);
    }
    if (!isdefined(self.duffels)) {
        self.duffels = spawn_script_model("accessory_money_bag_large_exfil");
        self.duffels hide(1);
    }
    if (!isdefined(self.vest)) {
        self.vest = spawn_script_model("props_armor_pickup_light_exfil");
        self.vest hide(1);
    }
    n++;
    self.packs[n] = create_animpack("supplierA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(35);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_fb788d97921f7d15);
    self.packs[n] function_e718ba63d511fcde(["supplier", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_alpha50_sh010"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_mike1014_sh010"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_papa220_sh010"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_mike4_sh010"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_money_bag_large_sh010"]);
    self.packs[n] add_pack_modelanim(self.vest, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_vest_sh010"]);
    self.packs[n] add_pack_modelanim(self.npc2, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator02_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_camera_sh010"], "wz_iw9_exfil_acc_supplier_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("supplierB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(42);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_ced95b76ae5616e4);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.sniper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_alpha50_sh020"]);
    self.packs[n] add_pack_modelanim(self.shotgun, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_mike1014_sh020"]);
    self.packs[n] add_pack_modelanim(self.pistol, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_papa220_sh020"]);
    self.packs[n] add_pack_modelanim(self.ar, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_mike4_sh020"]);
    self.packs[n] add_pack_modelanim(self.duffels, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_money_bag_large_sh020"]);
    self.packs[n] add_pack_modelanim(self.vest, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_vest_sh020"]);
    self.packs[n] add_pack_modelanim(self.npc2, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_operator02_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_supplier_camera_sh020"], "wz_iw9_exfil_acc_supplier_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca86
// Size: 0x2e6
function function_3ac76bb4e8c880e1(n, player) {
    if (!isdefined(self.stim)) {
        self.stim = spawn_script_model("weapon_wm_stim_exfil");
        self.stim hide(1);
    }
    n++;
    self.packs[n] = create_animpack("medicA");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(48);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_88eefe51538f221d);
    self.packs[n] function_e718ba63d511fcde(["medic", player], &function_734a8512ebf4e928);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.stim, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_stim_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_camera_sh010"], "wz_iw9_exfil_acc_medic_xcam_sh010");
    n++;
    self.packs[n] = create_animpack("medicB");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(65);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] function_decf1e23d78d0944([], &function_d76ec37713e7e07c);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_helicopter_sh020"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_operator01_sh020"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_operator01_fem_sh020"]);
    self.packs[n] add_pack_modelanim(self.stim, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_stim_sh020"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_medic_camera_sh020"], "wz_iw9_exfil_acc_medic_xcam_sh020");
    return n;
}

// Namespace br_ending_chopper2 / namespace_1cf0585e9841d60a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd75
// Size: 0x1dd
function function_9a174d9e60e5ca74(n, player) {
    if (!isdefined(self.dogtags)) {
        self.dogtags = spawn_script_model("c_t10_gear_usa_dogtag_exfil");
        self.dogtags hide(1);
    }
    n++;
    self.packs[n] = create_animpack("ghost");
    self.packs[n] function_5c32248dfffac064();
    self.packs[n] function_2d4c340dd3908b2d(48);
    self.packs[n] function_6098f3014cd4c598(0.25);
    self.packs[n] function_6372afdc0e9ee2dd(0.25);
    self.packs[n] add_pack_startfunc([player getentitynumber()], &function_85db091ef1712ad6);
    self.packs[n] function_e718ba63d511fcde(["ghost", player], &function_734a8512ebf4e928);
    self.packs[n] function_decf1e23d78d0944([], &function_5016da1692956a9b);
    self.packs[n] add_pack_modelanim(self.exfilchopper, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_ghost_helicopter_sh010"]);
    self.packs[n] function_707983b9fdb53c55(self.lightingrig);
    self.packs[n] add_pack_playeranim(player, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_ghost_operator01_sh010"], level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_ghost_operator01_fem_sh010"]);
    self.packs[n] add_pack_modelanim(self.dogtags, level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_ghost_dogtag_sh010"]);
    self.packs[n] add_pack_camanim(level.var_1a209bd995a7fa83["wz_IW9_exfil_acc_ghost_camera_sh010"], "wz_iw9_exfil_acc_ghost_xcam_sh010");
    return n;
}

