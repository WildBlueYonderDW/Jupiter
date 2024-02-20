// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\anim.gsc;
#using scripts\engine\trace.gsc;
#using script_5762ac2f22202ba2;
#using script_7ab5b649fa408138;
#using script_247745a526421ba7;
#using script_3b64eb40368c1450;
#using script_3ff084f114b7f6c9;
#using scripts\engine\scriptable.gsc;
#using script_5c65d346ac65390c;
#using scripts\mp\gamelogic.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\gametypes\br_public.gsc;
#using script_1174abedbefe9ada;
#using scripts\mp\utility\player.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\flags.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using script_2bc0b0102f9b7751;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\hud_message.gsc;
#using script_6fc415ff6a905dc1;
#using script_2cc6455920627806;
#using scripts\mp\rank.gsc;
#using script_2391409ef7b431e1;
#using scripts\mp\utility\points.gsc;
#using script_b7a9ce0a2282b79;
#using script_2d9d24f7c63ac143;
#using script_4a6760982b403bad;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\laststand.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_15ca41a3fbb0e379;

#namespace namespace_5287de5aa8b462db;

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff7
// Size: 0x530
function function_36f1bd0f5d72054a() {
    if (getdvarint(@"hash_25b11256c0da51a1", 1) == 0) {
        return;
    }
    level._effect["vfx_smk_signal"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal");
    level._effect["vfx_smk_signal_gr"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal_gr");
    level._effect["vfx_smk_signal_dmz"] = loadfx("vfx/iw9/level/mp_dmz_hydro/vfx_smk_signal_dmz");
    level._effect["vfx_smk_signal_dmz_diss"] = loadfx("vfx/iw9/level/mp_dmz_hydro/vfx_smk_signal_dmz_diss");
    function_832f6c1a7bb8c4ff();
    level thread function_9792d0e6c82398bf();
    level.var_95de4b6bb41fbbfa = [];
    level.var_b8457c8044b2ee02 = getdvarint(@"hash_bf86d2b0958e8803", 300);
    level.var_9405abd1db7cf2cf = getdvarint(@"hash_9eb35fd11109d87d", 60);
    level.var_b91d57df9d8ec00e = getdvarint(@"hash_28cc46b930476566", 10);
    level.var_745bebf82b7d49f8 = getdvarint(@"hash_ed723ab06879fdb5", 60);
    level.var_df3a6e8886416b36 = int(getdvarint(@"hash_918d5ea00183221c", 999) * 100);
    level.var_d962891163d17d4a = getdvarint(@"hash_f2f7f7118fbf4f48", 0);
    level.var_c8ff03474c1de67f = getdvarint(@"hash_66b127960b89bbe5", 2);
    level.var_6b712f0345bf6f12 = getdvarint(@"hash_8e317ce550e11531", 30);
    level.var_662586ede589f49c = getdvarint(@"hash_d0b1a615c1d96c4b", 0);
    level.var_8f7d92f10fc80ce = getdvarint(@"hash_ae0bc0d702b078c5", 0);
    level.var_9b6b8c7ecb7ac7c0 = getdvarint(@"hash_d335466b3a2cb667", 0);
    level.var_4644c9da9a611950 = getdvarint(@"hash_4f0a08cc7285b3c7", 0);
    level.var_cdc76bc962358072 = getdvarint(@"hash_4b12efc1e76639d1", 1);
    level.var_858dba9da8dc5419 = getdvarint(@"hash_41a3991a16d88a2a", 3);
    level.var_50477dc063210a56 = getdvarint(@"hash_f96d14f35aba8181", 0) == 1;
    level.var_c69d2b1eeb329a5a = getdvarint(@"hash_7aceaf0413d3f442", 1);
    level.var_f3a3f7cf0a42d67c = getdvarint(@"hash_71de0410d6b8a154", 5000);
    level.var_68cdddbbe057395d = getdvarint(@"hash_ba94141588893ff2", 1);
    level.var_9b3294726f6d3a6 = getdvarint(@"hash_987da8ab1c15d96b", 1) == 1;
    level.var_dd83d323306dcba7 = getdvarint(@"hash_761322608da01456", 0) == 1;
    level.var_540f24bb9acf4c02 = getdvarint(@"hash_654fac10fc85947e", 2);
    level.var_1eff61a95657ca2 = getdvarint(@"hash_4726749f66554ee", 1);
    level.var_628f636de1f2dda3 = getdvarint(@"hash_9756404935ac6487", 2);
    level.var_a276cd366472b025 = getdvarint(@"hash_4ac155bcb91cc93e", 5);
    level.var_bbf4a84349d0fdeb = getdvarint(@"hash_6719472694f0112", 2000);
    level.var_cf4723bfb4cc7643 = getdvarint(@"hash_b41c17e4ff85fb3c", 0);
    level.var_9fb5000ae38dcf7f = getdvarint(@"hash_87418a428facd9bb", 1);
    level.var_c64beb7b042390c8 = getdvarint(@"hash_8d43db8f06ffda3f", 1);
    level.var_679b51811bc32adc = getdvarint(@"hash_f9f43c362802ca01", 5);
    level.var_e5261a9a2feaf655 = getdvarint(@"hash_277d1a4cbe10e33c", 4);
    level.var_c7825757649c018e = getdvarint(@"hash_1d32c1595de57577", 15);
    level.var_50ff14b675031d14 = getdvarint(@"hash_a9ebe44e535cc367", 0);
    level.var_c42d6e4a40f70691 = getdvarint(@"hash_bd4b7eba67f38088", 0);
    if (level.var_c42d6e4a40f70691 || level.var_8f7d92f10fc80ce) {
        level.var_faa873310add1096 = &function_52781be0b4e8a959;
    }
    level.var_ff04728f8e36403f = getdvarint(@"hash_2bf795e2bb163c72", 0);
    level.var_53bdd63ac87a9076 = getdvarint(@"hash_62cc42aa2aca04c9", 1);
    level.var_4be8962610ee659b = getdvarfloat(@"hash_82ca0dece965efba", 0);
    level.var_cd6e8342a9c09c26 = getdvarfloat(@"hash_3bbb199dfb8a5bc7", 0.9);
    level.var_ba138ad5136d87d = getdvarint(@"hash_5d13b090ca102618", 900) * 1000;
    level.var_6c41580562fd09e2 = gettime();
    level thread function_119b893a0ca18687();
    level thread function_1fac2465eb5dda23();
    /#
        level thread function_d92380bfc792a6a9();
    #/
    namespace_76a219af07c28c13::registerTeamAssimilateCallback(&function_a857c0cb4fcb1819);
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_exfil_site", &function_c5f291acf1b44b69);
    namespace_e8fceb5cf6e8cdf8::function_7d47bded29ed7882(level.var_9405abd1db7cf2cf, level.var_bbf4a84349d0fdeb, level.var_745bebf82b7d49f8, level.var_a276cd366472b025, level.var_6fc3398b5a13400, getdvarint(@"hash_a3c1d41c94507f92", 279), level.var_c7825757649c018e, level.var_df3a6e8886416b36);
    function_43516e81ba78395d();
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152e
// Size: 0x113
function function_43516e81ba78395d() {
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("airspace_too_crowded", &function_40d3fb596096ac55);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("initial_splash", &function_595eede45a673b1f);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("setup_gas_masks", &function_aa3139c5fae701b8);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("player_exfil_timer", &function_496941bf27af77b1);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("exfil_players", &function_309c0a11484cc0db);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("reset_exfil", &function_1dcda56efb76e334);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("remove_exfil", &function_673f07bb8a61bcf3);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("music_stop", &function_113d0e9d241c8568);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("music_reset", &function_704dc2a5075c58b9);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("music_start", &function_1ce7b362085d943e);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("music_exfil_end", &function_b1219a25435ab949);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("dialog_start_exfil", &function_133deebbe58fb347);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("dialog_handle_touchdown", &function_25e48c3d85f4a59c);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("dialog_final_warning", &function_ab7f97a0b46cbeaf);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("dialog_final_leaving", &function_a0d539b960b93bb);
    namespace_e8fceb5cf6e8cdf8::function_3c673414d075ebfc("dialog_shortcut", &function_e392fd7cad768e25);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1648
// Size: 0x74
function function_119b893a0ca18687() {
    while (!isdefined(level.teamnamelist)) {
        waitframe();
    }
    foreach (team in level.teamnamelist) {
        level.teamdata[team]["exfils"] = [];
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c3
// Size: 0x6a
function function_9792d0e6c82398bf() {
    wait(1);
    level.var_cc6f9cf228accb4 = [];
    foreach (entry in level.teamnamelist) {
        level.var_cc6f9cf228accb4[entry] = 0;
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1734
// Size: 0x3f
function function_832f6c1a7bb8c4ff() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_waitfor_exfil", 1, "neutral", "MP_INGAME_ONLY/OBJ_EXFIL_NOTACTIVE_CAPS", "ui_map_icon_extraction", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_active_exfil", 1, "neutral", "MP_INGAME_ONLY/OBJ_Exfil_CAPS", "ui_map_icon_extraction", 0);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177a
// Size: 0x182
function function_a4181028915c44fa(node, droptoground) {
    var_3064fa24dbbd5bbf = spawnstruct();
    if (!isdefined(droptoground)) {
        droptoground = getdvarint(@"hash_2f6aa396e5e4e4f1", 1) == 1;
    }
    if (isdefined(node.poi)) {
        var_3064fa24dbbd5bbf.poi = node.poi;
    } else {
        var_3064fa24dbbd5bbf.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin);
    }
    var_3064fa24dbbd5bbf.angles = node.angles;
    var_3064fa24dbbd5bbf.origin = ter_op(droptoground, namespace_d3d40f75bb4e4c32::droptogroundmultitrace(getclosestpointonnavmesh(node.origin)), node.origin);
    var_3064fa24dbbd5bbf.modelname = "dmz_exfil_site_xmodel";
    var_3064fa24dbbd5bbf.var_d81e4008d63c5e96 = [];
    if (isdefined(node.target)) {
        helinode = getstruct(node.target, "targetname");
        if (isdefined(helinode)) {
            var_3064fa24dbbd5bbf.var_b44c269ea13f56ae = helinode.origin;
            var_3064fa24dbbd5bbf.var_a55fa332b1255e04 = helinode.angles;
        }
    }
    if (isdefined(node.script_label)) {
        if (node.script_label == "land") {
            var_3064fa24dbbd5bbf.land = 1;
        }
    }
    return var_3064fa24dbbd5bbf;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1904
// Size: 0x2c1
function function_1fac2465eb5dda23() {
    if (getdvarint(@"hash_61c64c6e38290aa1", 0) == 1) {
        return;
    }
    waitframe();
    level endon("game_ended");
    level.var_c26f0d22bc1fa7ef = [];
    level.var_b95a019fc748357a = [];
    level.var_ccbb0e8b2a740b8 = [];
    var_6b6476844b6ada68 = [];
    var_56ea112138f55047 = getdvarint(@"hash_b4f00bd105203ec9", 1);
    var_5a3867693588454b = getdvarint(@"hash_41d95a4caf9b2e7d", 0) == 1;
    var_fa41506cce024e8 = "dmz_squadExfilPoint";
    if (level.var_68cdddbbe057395d == 1) {
        var_fa41506cce024e8 = "dmz_communalExfilPoint" + level.var_53bdd63ac87a9076;
    }
    foreach (node in getstructarray(var_fa41506cce024e8, "script_noteworthy")) {
        if (var_5a3867693588454b && !isdefined(node.poi)) {
            continue;
        }
        if (isdefined(node.poi) && array_contains(level.var_ab20b3a256911579, node.poi)) {
            continue;
        }
        groundpos = getclosestpointonnavmesh(node.origin);
        if (isdefined(level.var_3796dc1d470dfab8)) {
            var_3064fa24dbbd5bbf = [[ level.var_3796dc1d470dfab8 ]](node);
        } else {
            var_3064fa24dbbd5bbf = function_a4181028915c44fa(node);
        }
        var_6b6476844b6ada68[var_6b6476844b6ada68.size] = var_3064fa24dbbd5bbf;
    }
    foreach (node in getstructarray("dmz_communalExfilPointFinal", "script_noteworthy")) {
        if (var_5a3867693588454b && !isdefined(node.poi)) {
            continue;
        }
        if (isdefined(node.poi) && array_contains(level.var_ab20b3a256911579, node.poi)) {
            continue;
        }
        groundpos = getclosestpointonnavmesh(node.origin);
        var_3064fa24dbbd5bbf = function_a4181028915c44fa(node);
        level.var_b95a019fc748357a[level.var_b95a019fc748357a.size] = var_3064fa24dbbd5bbf;
    }
    /#
        assertex(var_6b6476844b6ada68.size > 0, "DMZ Exfils: No valid createscript locations '" + var_fa41506cce024e8 + "' found");
    #/
    function_442bb8e42c0d40b7(var_6b6476844b6ada68);
    if (level.var_9b6b8c7ecb7ac7c0 == 1) {
        function_1db005b6eb39a56d();
    }
    if (level.var_c69d2b1eeb329a5a == 1) {
        level thread function_b9730bfe1e8b9f81();
    }
    level thread function_9a7567a2d46b857a();
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bcc
// Size: 0x12a
function private function_442bb8e42c0d40b7(var_3064fa24dbbd5bbf, var_d8aa357adf7cb05d) {
    var_f951f4bb16e92179 = 0;
    level.var_5fad09539823f92e = [];
    foreach (exfil in var_3064fa24dbbd5bbf) {
        var_f951f4bb16e92179++;
        exfil.var_302f61f95f10f7f3 = var_f951f4bb16e92179;
        level.var_c26f0d22bc1fa7ef[level.var_c26f0d22bc1fa7ef.size] = exfil;
        if (istrue(var_d8aa357adf7cb05d)) {
            function_bbe41f41d0f13612(exfil);
            exfil.ent setscriptablepartstate("dmz_exfil_icon", "communal_icon");
        }
        if (isdefined(exfil.poi)) {
            if (!isdefined(level.var_5fad09539823f92e[exfil.poi])) {
                level.var_5fad09539823f92e[exfil.poi] = [];
            }
            level.var_5fad09539823f92e[exfil.poi][level.var_5fad09539823f92e[exfil.poi].size] = exfil;
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cfd
// Size: 0x138
function private function_1db005b6eb39a56d() {
    /#
        assertex(isdefined(level.var_5fad09539823f92e), "Can't set up a shared pool without exfils by poi");
    #/
    level.var_58f477e9e7e8f739 = [];
    if (getdvarint(@"hash_a4617fb891ca21cb", 0) == 1) {
        foreach (exfil in level.var_c26f0d22bc1fa7ef) {
            level.var_58f477e9e7e8f739[level.var_58f477e9e7e8f739.size] = exfil;
        }
    } else {
        foreach (var_36847c9a092f0703 in level.var_5fad09539823f92e) {
            var_77b74bcc1cf886a8 = array_randomize(var_36847c9a092f0703);
            for (i = 0; i < level.var_540f24bb9acf4c02; i++) {
                level.var_58f477e9e7e8f739[level.var_58f477e9e7e8f739.size] = var_77b74bcc1cf886a8[i];
            }
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e3c
// Size: 0xd0
function private function_2431347a478dc694(var_2b6deb0f4170e1a4) {
    level.var_f9e4efea742e3709 = [];
    var_f951f4bb16e92179 = 0;
    level.var_5fad09539823f92e = [];
    foreach (exfil in var_2b6deb0f4170e1a4) {
        var_f951f4bb16e92179++;
        exfil.var_302f61f95f10f7f3 = var_f951f4bb16e92179;
        exfil.var_67f7d5ba67f4ad6 = [];
        exfil thread function_4bbc9b547eeb547f();
        level.var_c26f0d22bc1fa7ef[level.var_c26f0d22bc1fa7ef.size] = exfil;
        function_bbe41f41d0f13612(exfil);
        exfil.ent setscriptablepartstate("dmz_exfil_icon", "communal_icon");
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f13
// Size: 0xdd
function private function_4bbc9b547eeb547f() {
    level endon("game_ended");
    while (1) {
        players = utility::playersincylinder(self.origin, 500);
        if (players.size > 0) {
            foreach (player in players) {
                if (!isdefined(self.var_67f7d5ba67f4ad6[player.team]) || self.var_67f7d5ba67f4ad6[player.team] == 0) {
                    self.var_67f7d5ba67f4ad6[player.team] = 1;
                    function_9251ff271b0450dd(player.team);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ff7
// Size: 0x16c
function private function_9251ff271b0450dd(team) {
    var_940a3890ac273220 = level.var_6b712f0345bf6f12;
    while (var_940a3890ac273220 > 0) {
        players = utility::playersincylinder(self.origin, 500);
        foreach (player in players) {
            if (!isdefined(player.var_a09b2cb47a28054a) && player.team == team) {
                self.var_902a7ffcff8aa65[self.var_902a7ffcff8aa65.size] = player;
                player thread function_496941bf27af77b1(self.origin, var_940a3890ac273220, 500);
            }
        }
        var_940a3890ac273220--;
        wait(1);
    }
    players = utility::playersincylinder(self.origin, 500);
    teammates = [];
    foreach (player in players) {
        if (player.team == team) {
            teammates[teammates.size] = player;
        }
    }
    function_309c0a11484cc0db(teammates);
    self.var_67f7d5ba67f4ad6[team] = 0;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216a
// Size: 0xd4
function function_496941bf27af77b1(heli, time, dist) {
    self notify("dmz_exfil_timer");
    self endon("disconnect");
    self endon("dmz_exfil_timer");
    timer = time;
    if (!isdefined(timer)) {
        return;
    }
    while (timer > 0) {
        if (timer < 11) {
            self setentitysoundcontext("lobby_fade", "on");
        }
        if (isdefined(dist) && (!isdefined(self) || distance(heli.pos, self.origin) > dist)) {
            break;
        }
        if (timer < 80) {
            self setclientomnvar("ui_match_start_countdown", timer);
        }
        timer--;
        wait(1);
    }
    namespace_e8fceb5cf6e8cdf8::function_423f49e2512a5f53();
    self setclientomnvar("ui_match_start_countdown", 0);
    self setentitysoundcontext("lobby_fade", "", 2);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2245
// Size: 0x1f
function function_a9f268abd153b713() {
    self notify("dmz_exfil_timer");
    namespace_e8fceb5cf6e8cdf8::function_423f49e2512a5f53();
    self setclientomnvar("ui_match_start_countdown", 0);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x226b
// Size: 0x2f
function private function_b9730bfe1e8b9f81() {
    level waittill("dmz_radiation_started");
    if (!namespace_7789f919216d38a2::radiation_isInit()) {
        /#
            assertmsg("watchRadiationStart: Radiation spread started without being init somehow");
        #/
        return;
    }
    wait(5);
    level thread function_48272de6dc9130f7();
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22a1
// Size: 0xc4
function private function_48272de6dc9130f7() {
    /#
        assertex(isdefined(level.var_fe2e551da0962c3c), "RADITATION DISABLE ERROR: No visible exfils set.");
    #/
    while (1) {
        if (level.var_fe2e551da0962c3c.size > 0) {
            foreach (exfil in level.var_fe2e551da0962c3c) {
                if (namespace_7789f919216d38a2::radiation_isInRadiation(exfil.origin)) {
                    function_dda47641682585d9(exfil);
                    level.var_fe2e551da0962c3c = array_remove(level.var_fe2e551da0962c3c, exfil);
                }
            }
        } else {
            level thread function_a3f113dc69814771();
            return;
        }
        wait(1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x236c
// Size: 0x16b
function private function_a3f113dc69814771() {
    if (!isdefined(level.var_c5074bf13ffb95ef)) {
        return;
    }
    var_755bc4c5615671af = namespace_7789f919216d38a2::function_2a0c5b28dded3e06();
    var_c444e48ae40730ba = distance2d(level.var_aa174df565129c2b.origin, level.radiation.startorigin);
    var_1e6c96f9d4b225c4 = distance2d(level.var_c5074bf13ffb95ef.origin, level.radiation.startorigin);
    timer = (var_1e6c96f9d4b225c4 - var_c444e48ae40730ba) / var_755bc4c5615671af;
    var_10817a88ad06996f = level.var_c5074bf13ffb95ef;
    function_bbe41f41d0f13612(var_10817a88ad06996f);
    if (isdefined(var_10817a88ad06996f.ent)) {
        var_10817a88ad06996f.ent setscriptablepartstate("dmz_exfil_site", "standby");
        var_10817a88ad06996f.ent setscriptablepartstate("dmz_exfil_icon", "final_exfil_icon");
    }
    thread function_9fdf14c5aac8ce53("dmz_exfil_pilot_called_final");
    timer = timer - level.var_a276cd366472b025 + 5;
    timer = timer - level.var_c7825757649c018e;
    if (level.players.size <= 0) {
        return;
    }
    thread function_5bc15f36914e63c7(var_10817a88ad06996f.ent, undefined, undefined, level.players[randomint(level.players.size)], timer, 0, 1);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24de
// Size: 0x1dc
function private function_dda47641682585d9(exfil) {
    if (!isdefined(exfil)) {
        return;
    }
    if (!isdefined(level.var_35a1cdd4a92304a5)) {
        level.var_35a1cdd4a92304a5 = [];
    }
    var_29f917ae2719196a = function_f2811d61401a5e40(exfil);
    if (istrue(exfil.var_b6b245f03c15d48d) && level.var_f3a3f7cf0a42d67c > 0) {
        var_29f917ae2719196a = namespace_7e17181d03156026::getplayersinradius(exfil.origin, level.var_f3a3f7cf0a42d67c);
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("radiation_delete_personal_exfils", array_remove_array(var_29f917ae2719196a, level.var_35a1cdd4a92304a5));
    level.var_35a1cdd4a92304a5 = array_combine_unique(level.var_35a1cdd4a92304a5, var_29f917ae2719196a);
    if (isdefined(exfil.ent)) {
        exfil.ent notify("disable");
        exfil.ent.disabled = 1;
        exfil.ent setscriptablepartstate("dmz_exfil_icon", "disabled_icon");
        exfil.ent setscriptablepartstate("dmz_exfil_smoke", "stop");
        exfil.ent setscriptablepartstate("dmz_exfil_site", "standby");
    }
    level.var_c26f0d22bc1fa7ef = array_remove(level.var_c26f0d22bc1fa7ef, exfil);
    if (isdefined(exfil.poi) && isdefined(level.var_5fad09539823f92e) && isdefined(level.var_5fad09539823f92e[exfil.poi])) {
        level.var_5fad09539823f92e[exfil.poi] = array_remove(level.var_5fad09539823f92e[exfil.poi], exfil);
    }
    if (isdefined(level.var_58f477e9e7e8f739)) {
        level.var_58f477e9e7e8f739 = array_remove(level.var_58f477e9e7e8f739, exfil);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x26c1
// Size: 0xac
function private function_f2811d61401a5e40(exfil) {
    if (!isdefined(exfil)) {
        return [];
    }
    if (istrue(exfil.var_b6b245f03c15d48d)) {
        return level.players;
    }
    var_1a379627cf4b5391 = [];
    if (isdefined(exfil.var_d81e4008d63c5e96)) {
        foreach (team in exfil.var_d81e4008d63c5e96) {
            var_1a379627cf4b5391 = array_combine(var_1a379627cf4b5391, getteamdata(team, "players"));
        }
    }
    return var_1a379627cf4b5391;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2775
// Size: 0x3a9
function private function_5086b40cfd533087() {
    var_8c75c28da153bec6 = namespace_7789f919216d38a2::function_f3fb60f986f267c5();
    if (!isdefined(var_8c75c28da153bec6)) {
        return;
    }
    nodes = getstructarray("dmz_communalExfilPoint" + level.var_53bdd63ac87a9076, "script_noteworthy");
    if (nodes.size > 0) {
        var_2c1975f487bbe252 = getdvarint(@"hash_65d6b521ab74dc34", 1);
        var_5fc0bb331fcc1784 = getdvarint(@"hash_df07ea3ec5250762", 4);
        var_87d5384a614ba40c = ter_op(var_2c1975f487bbe252 >= var_5fc0bb331fcc1784, var_2c1975f487bbe252, randomintrange(var_2c1975f487bbe252, var_5fc0bb331fcc1784));
        if (var_87d5384a614ba40c <= 0) {
            return;
        }
        var_5f48ee4ed384234c = [];
        if (getdvarint(@"hash_2317bf1ebb6514f7", 0) == 1) {
            var_5f48ee4ed384234c[var_5f48ee4ed384234c.size] = sortbydistance(nodes, var_8c75c28da153bec6)[nodes.size - 1];
        } else {
            var_5f48ee4ed384234c[var_5f48ee4ed384234c.size] = random(array_slice(sortbydistance(nodes, var_8c75c28da153bec6), int(max(0, nodes.size - 2))));
            foreach (var_25f0cca0e08b71d0 in [0:45000, 1:25000, 2:10000, 3:3000]) {
                foreach (node in array_randomize(nodes)) {
                    var_267c3c85c7b5a7c5 = 1;
                    foreach (var_8504857c0c6f38c3 in var_5f48ee4ed384234c) {
                        if (distance(var_8504857c0c6f38c3.origin, node.origin) < var_25f0cca0e08b71d0) {
                            var_267c3c85c7b5a7c5 = 0;
                            break;
                        }
                    }
                    if (var_267c3c85c7b5a7c5) {
                        var_5f48ee4ed384234c[var_5f48ee4ed384234c.size] = node;
                        if (var_5f48ee4ed384234c.size >= var_87d5384a614ba40c) {
                            break;
                        }
                    }
                }
                if (var_5f48ee4ed384234c.size >= var_87d5384a614ba40c) {
                    break;
                }
            }
        }
        var_1eb20c7e1f001a1e = [];
        var_6db47c254e98cc63 = getdvarint(@"hash_bc7a50c09583d48f", 1) == 1;
        foreach (node in var_5f48ee4ed384234c) {
            groundpos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(node.origin);
            var_3064fa24dbbd5bbf = spawnstruct();
            if (isdefined(node.poi)) {
                var_3064fa24dbbd5bbf.poi = node.poi;
            } else {
                var_3064fa24dbbd5bbf.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(node.origin);
            }
            var_3064fa24dbbd5bbf.angles = node.angles;
            var_3064fa24dbbd5bbf.origin = groundpos;
            var_3064fa24dbbd5bbf.var_d81e4008d63c5e96 = [];
            var_3064fa24dbbd5bbf.modelname = ter_op(var_6db47c254e98cc63, "dmz_exfil_zone_xmodel", "dmz_exfil_site_xmodel");
            var_1eb20c7e1f001a1e[var_1eb20c7e1f001a1e.size] = var_3064fa24dbbd5bbf;
        }
        if (var_6db47c254e98cc63) {
            function_2431347a478dc694(var_1eb20c7e1f001a1e);
        } else {
            function_442bb8e42c0d40b7(var_1eb20c7e1f001a1e, 1);
        }
        level thread function_4868b0dabbb185f9(var_1eb20c7e1f001a1e);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b25
// Size: 0x5b
function function_4868b0dabbb185f9(var_1eb20c7e1f001a1e) {
    foreach (var_3064fa24dbbd5bbf in var_1eb20c7e1f001a1e) {
        level thread function_6613aeb065e36928(var_3064fa24dbbd5bbf);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b87
// Size: 0x33f
function function_6613aeb065e36928(loc) {
    if (!istrue(level.var_289df80e1ded586f)) {
        return;
    }
    var_8e39da7681bbcc4b = getdvarint(@"hash_f895a6b12aceb46", 12);
    if (var_8e39da7681bbcc4b <= 0) {
        return;
    }
    /#
        assert(namespace_4b0406965e556711::gameflagexists("prematch_done") && namespace_4b0406965e556711::gameflag("prematch_done"), "reinforce_requestReinforcements: requesting reinforcements before the prematch is done. Please simply spawn these agents directly.");
    #/
    var_89593782b8b4434d = getdvarint(@"hash_b7f14fbc972e9210", 6);
    var_6d3480de3b55c1aa = getdvarint(@"hash_ec0ad58367541fe3", 6);
    var_51fb808f0ad7b056 = getdvarint(@"hash_99e18e59aca26047", 6);
    var_eefd5067dc92a0e3 = getdvarint(@"hash_cdde0b9f53cd9d6a", 6);
    if (isdefined(level.var_4b195d3dd0024b9c)) {
        team = level.var_4b195d3dd0024b9c;
    } else {
        team = "team_hundred_ninety_five";
    }
    var_c5e7fce963586ec0 = loc;
    priority = "high";
    category = "reinforcements";
    subcategory = "exfil";
    poiName = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
    var_19b18e5335b6e88a = 256;
    var_2898710bec2562dc = 3500;
    var_8b2f5b7caa9b211c = getdvarint(@"hash_63d7f015b040d9c6", 5000);
    var_11b3529e57cfed0e = namespace_bfef6903bca5845d::function_353fecd1549f5f42(var_c5e7fce963586ec0, var_8b2f5b7caa9b211c, team, var_89593782b8b4434d, undefined, 1024, 1024, undefined);
    if (isarray(var_11b3529e57cfed0e)) {
        var_8e39da7681bbcc4b = var_8e39da7681bbcc4b - var_11b3529e57cfed0e.size;
        if (var_8e39da7681bbcc4b <= 0) {
            return;
        }
        foreach (agent in var_11b3529e57cfed0e) {
            vector = rotatevector((1, 0, 0), (0, randomint(360), 0));
            var_6fcfaf50ca25f632 = vector * randomfloatrange(512, 1536) + var_c5e7fce963586ec0;
            var_6fcfaf50ca25f632 = agent getclosestreachablepointonnavmesh(var_6fcfaf50ca25f632);
            namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, var_6fcfaf50ca25f632, 256, 256);
        }
    }
    if (!function_33357506b39df2ef()) {
        return;
    }
    if (var_8e39da7681bbcc4b > 2) {
        var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(min(var_8e39da7681bbcc4b, var_51fb808f0ad7b056), var_c5e7fce963586ec0, priority, category, subcategory, undefined, team, 1, poiName);
        if (isarray(var_b58631347b6ab04)) {
            var_8e39da7681bbcc4b = var_8e39da7681bbcc4b - var_b58631347b6ab04.size - 2;
            if (var_8e39da7681bbcc4b <= 0) {
                return;
            }
            foreach (agent in var_b58631347b6ab04) {
                vector = rotatevector((1, 0, 0), (0, randomint(360), 0));
                var_6fcfaf50ca25f632 = vector * randomfloatrange(512, 1536) + var_c5e7fce963586ec0;
                var_6fcfaf50ca25f632 = agent getclosestreachablepointonnavmesh(var_6fcfaf50ca25f632);
                namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, var_6fcfaf50ca25f632, 256, 256);
            }
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ecd
// Size: 0x4a
function function_40be536148b7548e(agent) {
    agent endon("death");
    level endon("game_ended");
    while (1) {
        agent thread namespace_d028276791d9cff6::drawsphere(agent.origin, 32, 1, (0, 1, 0));
        wait(1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1e
// Size: 0xc2
function function_377d92658a1e91(var_3064fa24dbbd5bbf, model) {
    if (isdefined(var_3064fa24dbbd5bbf.ent)) {
        return;
    }
    if (!isdefined(model)) {
        model = var_3064fa24dbbd5bbf.modelname;
    }
    ent = spawn("script_model", var_3064fa24dbbd5bbf.origin);
    ent setmodel(model);
    ent.angles = var_3064fa24dbbd5bbf.angles;
    ent.info = var_3064fa24dbbd5bbf;
    namespace_ede58c1e66c2c280::function_6b9641d0060c3a2c(ent);
    ent setscriptablepartstate("dmz_exfil_smoke", "smoking", 0);
    ent setscriptablepartstate("dmz_exfil_site", "ready", 0);
    ent hide();
    var_3064fa24dbbd5bbf.ent = ent;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe7
// Size: 0x6f
function function_bbe41f41d0f13612(var_3064fa24dbbd5bbf) {
    if (!isdefined(level.var_fe2e551da0962c3c)) {
        level.var_fe2e551da0962c3c = [];
    }
    if (!isdefined(var_3064fa24dbbd5bbf.ent)) {
        function_377d92658a1e91(var_3064fa24dbbd5bbf);
    }
    var_3064fa24dbbd5bbf.ent show();
    var_3064fa24dbbd5bbf.var_b6b245f03c15d48d = 1;
    level.var_fe2e551da0962c3c[level.var_fe2e551da0962c3c.size] = var_3064fa24dbbd5bbf;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305d
// Size: 0x61
function function_97061811695243ea(var_3064fa24dbbd5bbf) {
    if (!isdefined(level.var_fe2e551da0962c3c)) {
        return;
    }
    if (!isdefined(var_3064fa24dbbd5bbf.ent)) {
        return;
    }
    var_3064fa24dbbd5bbf.ent hide();
    var_3064fa24dbbd5bbf.var_b6b245f03c15d48d = 0;
    level.var_fe2e551da0962c3c = array_remove(level.var_fe2e551da0962c3c, var_3064fa24dbbd5bbf);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c5
// Size: 0xd5
function function_b513aaf6e49f184a(var_3064fa24dbbd5bbf) {
    if (!isdefined(var_3064fa24dbbd5bbf.ent)) {
        function_377d92658a1e91(var_3064fa24dbbd5bbf);
    }
    foreach (team in var_3064fa24dbbd5bbf.var_d81e4008d63c5e96) {
        foreach (player in getteamdata(team, "players")) {
            var_3064fa24dbbd5bbf.ent showtoplayer(player);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a1
// Size: 0x8d
function function_f4dc35c0f47a461c(var_3064fa24dbbd5bbf, team) {
    if (!isdefined(var_3064fa24dbbd5bbf.ent)) {
        function_377d92658a1e91(var_3064fa24dbbd5bbf);
    }
    foreach (player in getteamdata(team, "players")) {
        var_3064fa24dbbd5bbf.ent showtoplayer(player);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3235
// Size: 0x17d
function function_a857c0cb4fcb1819(player, oldteam, newteam) {
    var_87b0b8a08fb5e71a = level.teamdata[oldteam]["exfils"];
    var_f0e72070cf6e1eb1 = level.teamdata[newteam]["exfils"];
    foreach (exfil in var_87b0b8a08fb5e71a) {
        exfil.ent hidefromplayer(player);
    }
    foreach (exfil in var_f0e72070cf6e1eb1) {
        exfil.ent showtoplayer(player);
    }
    players = namespace_54d20dd0dd79277f::getteamdata(newteam, "players");
    foreach (teammate in players) {
        if (istrue(teammate.var_5a4d470f2093fff1)) {
            player setclientomnvar("ui_owns_personal_exfil", 1);
            break;
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33b9
// Size: 0x16f
function function_aee6fe083265e34c() {
    self endon("disable");
    numagents = getdvarint(@"hash_1ce7b251c3164b2c", 6);
    if (numagents == 0) {
        return;
    }
    var_8b61a19a823c6c0a = getdvarint(@"hash_3d1b037bbe89b3ac", 4000);
    var_3b40988f103f331e = var_8b61a19a823c6c0a * var_8b61a19a823c6c0a;
    while (1) {
        foreach (team in self.info.var_d81e4008d63c5e96) {
            foreach (player in getteamdata(team, "players")) {
                if (distancesquared(self.origin, player.origin) < var_3b40988f103f331e) {
                    var_5aeb0c8e23ff1430 = namespace_bfef6903bca5845d::function_77acc10c4823dd8a(numagents, self.origin, "medium", "reinforcements", "ExtractAmbush", undefined, undefined, 1, namespace_37f0fb6355a4618a::function_6cc445c02b5effac(player.origin));
                    return;
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352f
// Size: 0xe8
function function_309c0a11484cc0db(players, var_3064fa24dbbd5bbf) {
    if (!isdefined(var_3064fa24dbbd5bbf)) {
        var_3064fa24dbbd5bbf = namespace_e8fceb5cf6e8cdf8::function_730c660d9fc6808e(players, 0, 0, 0, 0);
    }
    namespace_a8b2b88699fc40fb::function_25a4b6a2083e2ab(players);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player.extracted = 1;
        function_17950170d1365ee0([0:player]);
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread function_ac298c756f30aea6(var_3064fa24dbbd5bbf);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x361e
// Size: 0x45d
function function_ac298c756f30aea6(var_3064fa24dbbd5bbf) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(self)) {
        if (getdvarint(@"hash_83914b051f41c82d", 1) == 1 && !namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
            namespace_a9c534dc7832aba4::migratespectators(self, undefined, 0);
        }
        thread fadetoblack();
        if (istrue(level.var_95de4b6bb41fbbfa[self.team])) {
            self setclientomnvar("ui_dmz_extract_successful", 2);
        } else {
            var_5e076183a565c611 = 1;
            foreach (player in getteamdata(self.team, "players")) {
                if (!istrue(player.extracted)) {
                    var_5e076183a565c611 = 0;
                    break;
                }
            }
            if (var_5e076183a565c611) {
                level.var_95de4b6bb41fbbfa[self.team] = 1;
                self setclientomnvar("ui_dmz_extract_successful", 2);
            } else {
                self setclientomnvar("ui_dmz_extract_successful", 1);
            }
        }
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("scorpion_event", "player_win");
        self.var_e7af56a2df18030d = 0;
        self.var_68426cbaac96006b = self.origin;
        self.spawnprotection = 1;
        namespace_41cb45263e591751::setlightarmorvalue(self, 1000, undefined, 0);
        val::function_2d6e7e0b80767910("exfil_success", [0:"usability", 1:"offhand_weapons", 2:"killstreaks", 3:"supers", 4:"gesture", 5:"weapon", 6:"weapon_switch"]);
        val::function_3633b947164be4f3("exfil_success", 0);
        self allowmovement(0);
        self allowfire(0);
        self freezecontrols(1);
        self notify("successful_exfil");
        wait(0.25);
        if (getdvarint(@"hash_a186ff3c324cdd8e", 1) == 1) {
            if (isdefined(level.var_11d0c321045f514f) && isdefined(level.var_11d0c321045f514f[self.team])) {
                self playerlinkto(level.var_11d0c321045f514f[self.team]);
            } else {
                namespace_a9c534dc7832aba4::function_3c5421c26d253eb0(0);
                self playerlinkto(level.var_11d0c321045f514f[self.team]);
            }
        }
        namespace_d696adde758cbe79::function_53109b63a7168074();
        function_46f56bf948599140(self);
        thread namespace_44abc05161e2e2cb::showsplash("callout_exfil_success");
    }
    if (isdefined(self)) {
        if (isdefined(self.var_68426cbaac96006b)) {
            self setorigin(self.var_68426cbaac96006b);
        }
        function_a593971d75d82113();
        function_379bb555405c16bb("br_dmz_extract::onPlayerExfilSuccess()");
        self sethidenameplate(0);
        self disableoffhandprimaryweapons(0);
        self disableoffhandsecondaryweapons(0);
        self disableweapons(0);
        self disableweaponswitch(0);
        self setcamerathirdperson(1);
        self allowcrouch(0);
        self allowmelee(0);
        self allowjump(0);
        self allowprone(0);
        self.ignoreme = 1;
        self.plotarmor = 1;
        namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/EXTRACTED_SUCCESS");
        namespace_512200f0f9e6ebc9::function_5332e1c0f06b0245(var_3064fa24dbbd5bbf);
        if (!isdefined(self.var_e7faf08f327b0fb5)) {
            self.var_e7faf08f327b0fb5 = 0;
        }
        var_fec4228317afe4ff = function_53c4c53197386572(self.var_fec4228317afe4ff, 0);
        self.var_e7faf08f327b0fb5 = self.var_e7faf08f327b0fb5 + namespace_b66505f20cbf2570::function_160a29300ce1e14(var_fec4228317afe4ff, self, getdvarfloat(@"hash_ce8c20ac42e3c18a", 0.75));
        var_d6de66cfada71a27 = getdvarfloat(@"hash_b733889f0b8c700", 1);
        var_689a927d39ba7262 = int(min(var_fec4228317afe4ff / var_d6de66cfada71a27, getdvarint(@"hash_890df0079e1885b8", 10000)));
        self.var_26d7a92a39b78748 = var_689a927d39ba7262;
        var_33e0291812d90fc1 = namespace_62c556437da28f50::getscoreinfoxp(#"hash_a664e407eb3e39d4");
        if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(self)) {
            var_33e0291812d90fc1 = var_33e0291812d90fc1 + getdvarint(@"hash_2b3cb1f1b979a35b", 500);
        }
        namespace_48a08c5037514e04::doScoreEvent(#"hash_a664e407eb3e39d4", undefined, undefined, var_33e0291812d90fc1 + var_689a927d39ba7262, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        level thread handlePlayerExfilDone(self);
        wait(1);
        namespace_d696adde758cbe79::function_865b1a5a62c49d7();
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a82
// Size: 0x69
function function_df3bfe2c77975120() {
    var_33e0291812d90fc1 = namespace_62c556437da28f50::getscoreinfoxp(#"hash_a664e407eb3e39d4");
    if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(self)) {
        var_33e0291812d90fc1 = var_33e0291812d90fc1 + getdvarint(@"hash_2b3cb1f1b979a35b", 500);
    }
    namespace_48a08c5037514e04::doScoreEvent(#"hash_a664e407eb3e39d4", undefined, undefined, var_33e0291812d90fc1, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    namespace_d696adde758cbe79::function_865b1a5a62c49d7(1);
    namespace_a38a2e1fe7519183::function_2ab8227b96ab5d5f(self);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3af2
// Size: 0x3ca
function function_46f56bf948599140(player) {
    var_5a0fc1d304e970ea = "unset";
    if (isdefined(player.sessionteam)) {
        var_5a0fc1d304e970ea = player.sessionteam;
    }
    if (isdefined(player.team)) {
        var_5a0fc1d304e970ea = player.team;
    }
    var_9c02e895e4dbdc3b = "0";
    if (isdefined(level.var_a7b62649c81b481a) && isdefined(level.var_a7b62649c81b481a.var_acc161de36707de2)) {
        var_9c02e895e4dbdc3b = namespace_3c37cb17ade254d::string(level.var_a7b62649c81b481a.var_acc161de36707de2);
    }
    var_e259eea64aef58d5 = player namespace_aead94004cf4c147::function_254150d1e667dee7();
    var_7838b9df983ad1ea = [];
    var_ea9dd7d31f4b0630 = player namespace_512200f0f9e6ebc9::function_9cd290910c24d4d3();
    var_a1fc16d2ea055338 = [];
    stowedweapon = namespace_aead94004cf4c147::function_2985254128b1c262(player);
    if (!isdefined(stowedweapon)) {
        stowedweapon = "none";
    } else {
        stowedweapon = stowedweapon.basename;
    }
    foreach (item in var_e259eea64aef58d5) {
        if (!isdefined(item.lootid)) {
            var_7838b9df983ad1ea[var_7838b9df983ad1ea.size] = "null";
        } else {
            var_cb325ddb4a764623 = namespace_3c37cb17ade254d::string(item.lootid);
            var_7838b9df983ad1ea[var_7838b9df983ad1ea.size] = var_cb325ddb4a764623;
        }
    }
    foreach (item in var_ea9dd7d31f4b0630) {
        if (isdefined(item.lootid)) {
            var_cb325ddb4a764623 = item.lootid;
            var_a1fc16d2ea055338[var_a1fc16d2ea055338.size] = var_cb325ddb4a764623;
        }
    }
    var_c00e2f62499a29f3 = namespace_a38a2e1fe7519183::function_1558f8fb859c492a(player);
    perks = var_c00e2f62499a29f3[1];
    streak = var_c00e2f62499a29f3[0];
    if (!isdefined(streak)) {
        streak = 0;
    }
    data = spawnstruct();
    data.player = player;
    data.var_5a0fc1d304e970ea = var_5a0fc1d304e970ea;
    data.x = player.origin[0];
    data.y = player.origin[1];
    data.z = player.origin[2];
    data.var_6437fc57f57c9ad8 = player.angles[0];
    data.var_fe76a03a13318315 = player.angles[1];
    data.zrot = player.angles[2];
    data.var_9c02e895e4dbdc3b = var_9c02e895e4dbdc3b;
    data.var_c983d3abb7ec13d9 = int(getsecondspassed());
    data.var_fcc975ee4c8b02cc = "0";
    data.var_42623c2865853280 = player.plundercount;
    data.var_8003724ead57ba09 = var_7838b9df983ad1ea;
    data.stowedweapon = stowedweapon;
    data.var_8919314d1df8d669 = var_a1fc16d2ea055338;
    data.var_3d1611a538e77206 = "none";
    data.var_3e8d5a83ae37a4ff = "none";
    data.var_d9bb11bff39d0bac = "none";
    data.var_d35c23115990e1ce = [];
    data.exfilstreak = streak;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_dmz_on_exfil", data);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec3
// Size: 0x1e8
function handlePlayerExfilDone(player) {
    namespace_d20f8ef223912e12::updateclientmatchdata(player);
    var_9c60d720a2bc0f37 = 5;
    player.var_e7af56a2df18030d = 1;
    wait(var_9c60d720a2bc0f37);
    if (isdefined(player)) {
        if (istrue(player.inlaststand)) {
            if (player namespace_10260b963310d30e::finishreviveplayer("self_revive_on_kill_success", player)) {
                player namespace_10260b963310d30e::onrevive(1);
            }
        }
        if (istrue(player.gasmaskequipped)) {
            player thread namespace_cb965d2f71fefddc::removegasmaskbr();
        }
        if (istrue(player.insertingarmorplate)) {
            player notify("try_armor_cancel", "game_end");
        }
        player namespace_4887422e77f3514e::onexitdeathsdoor(0);
        player.spawnprotection = 1;
        level.skipplaybodycountsound = 1;
        player namespace_99ac021a7547cae3::removefromalivecount(1, "dmzExfil");
        namespace_54d20dd0dd79277f::validatealivecount("extract", player.team, player, "handlePlayerExfilDone");
        if (istrue(level.var_95de4b6bb41fbbfa[player.team])) {
            if (isdefined(self.var_68426cbaac96006b)) {
                spawnpoint = spawnstruct();
                spawnpoint.origin = player.var_68426cbaac96006b;
                spawnpoint.angles = player.angles;
                player namespace_99ac021a7547cae3::spawnintermission(spawnpoint, undefined, 0);
            } else {
                player namespace_a9c534dc7832aba4::spawnintermissionatplayer(player);
            }
            player.br_spectatorinitialized = 1;
            player notify("br_spectatorInitialized");
        } else {
            player thread namespace_a9c534dc7832aba4::spawnspectator();
            function_b892c6b4c68c344a([0:player], 1);
        }
        player setclientomnvar("ui_br_squad_eliminated_active", 1);
        player setclientomnvar("ui_round_end_title", game["round_end"]["victory"]);
        player setclientomnvar("ui_round_end_reason", game["end_reason"]["objective_completed"]);
        player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
    }
    level thread namespace_d696adde758cbe79::function_da0fa1afaa8835cf();
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b2
// Size: 0xfd
function function_eff2a482b361a6ed(player, fadetoblack, fadetime) {
    player notify("start_fade_to_black");
    player endon("start_fade_to_black");
    player endon("disconnect");
    /#
        assertex(!isdefined(fadetime) || fadetime >= 0, "fadeToBlackForPlayer: fadeTime can't be less than 0");
    #/
    var_400fc540bbc48aa9 = 0;
    if (istrue(fadetoblack)) {
        var_400fc540bbc48aa9 = 1;
    }
    if (!isdefined(fadetime) || fadetime == 0) {
        player setclientomnvar("ui_total_fade", var_400fc540bbc48aa9);
        return;
    }
    var_226a6d12e60638a5 = var_400fc540bbc48aa9;
    var_400fc540bbc48aa9 = 0;
    var_db4af00b8b0bf7c6 = int(fadetime / level.framedurationseconds);
    var_f2c7b24b4f8544f3 = 1 / var_db4af00b8b0bf7c6;
    if (!istrue(fadetoblack)) {
        var_f2c7b24b4f8544f3 = var_f2c7b24b4f8544f3 * -1;
        var_400fc540bbc48aa9 = 1;
    }
    while (var_db4af00b8b0bf7c6 > 0) {
        var_400fc540bbc48aa9 = var_400fc540bbc48aa9 + var_f2c7b24b4f8544f3;
        player setclientomnvar("ui_total_fade", var_400fc540bbc48aa9);
        var_db4af00b8b0bf7c6--;
        waitframe();
    }
    player setclientomnvar("ui_total_fade", var_226a6d12e60638a5);
    player notify("finish_fade_to_black");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b6
// Size: 0x45
function fadetoblack() {
    level endon("game_ended");
    self endon("disconnect");
    level function_eff2a482b361a6ed(self, 1, 0.25);
    waittill_any_timeout_3(4, "force_spectate_done", "br_team_fully_eliminated", "br_spectatorInitialized");
    level function_eff2a482b361a6ed(self, 0, 1);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4202
// Size: 0x1e
function function_aaef0bd11948a0c() {
    self waittill("force_spectate_done");
    if (self.hidehudenabled) {
        utility::hidehuddisable();
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4227
// Size: 0x66
function function_1dcda56efb76e334(team) {
    self endon("disable");
    wait(level.var_b91d57df9d8ec00e);
    self setscriptablepartstate("dmz_exfil_smoke", "smoking", 1);
    self setscriptablepartstate("dmz_exfil_site", "ready", 1);
    if (isdefined(team)) {
        self.var_d81e4008d63c5e96[team] = team;
        function_ac66b79a73b21444(team, self.info);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4294
// Size: 0x62
function function_8fc5aeab9cb08048(ent) {
    if (isdefined(ent)) {
        if (level.var_9b3294726f6d3a6 && (!level.var_dd83d323306dcba7 || !level.radiation.var_9badbb469626f6)) {
            level thread function_6613aeb065e36928(ent.origin);
        }
        thread function_5bc15f36914e63c7(ent, undefined, undefined, self);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42fd
// Size: 0xa6
function function_33357506b39df2ef() {
    if (level.var_ba138ad5136d87d > 0) {
        var_2b38c1d78139313e = clamp((gettime() - level.var_6c41580562fd09e2) / level.var_ba138ad5136d87d, 0, 1);
        dif = level.var_cd6e8342a9c09c26 - level.var_4be8962610ee659b;
        c = clamp(dif * var_2b38c1d78139313e + level.var_4be8962610ee659b, 0, 1);
        return function_51d76700600cebe3(c);
    } else if (level.var_ba138ad5136d87d == 0) {
        return function_51d76700600cebe3(level.var_cd6e8342a9c09c26);
    }
    return 1;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ab
// Size: 0x160
function function_7ff5e35e992df372() {
    if (!isdefined(level.var_6ad981ae12245cbe)) {
        level.var_6ad981ae12245cbe = [];
    }
    if (!isdefined(level.var_6ad981ae12245cbe[self.team])) {
        level.var_6ad981ae12245cbe[self.team] = 0;
    }
    if (level.var_6ad981ae12245cbe[self.team] >= getdvarint(@"hash_bd34018fbf7c5375", 1)) {
        return 0;
    }
    var_f5aa0aac262fbf0b = sortbydistance(level.var_883f54a2a56e126c, self.origin);
    foreach (exfil in var_f5aa0aac262fbf0b) {
        if (istrue(exfil.personal) || istrue(exfil.var_b6b245f03c15d48d)) {
            continue;
        }
        exfil.personal = 1;
        level.var_6ad981ae12245cbe[self.team] = level.var_6ad981ae12245cbe[self.team] + 1;
        function_f4dc35c0f47a461c(exfil, self.team);
        exfil.ent setscriptablepartstate("dmz_exfil_icon", "personal_icon");
        return 1;
    }
    return 0;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4513
// Size: 0x1109
function function_9a7567a2d46b857a() {
    level endon("game_ended");
    while (!isdefined(level.var_c26f0d22bc1fa7ef)) {
        waitframe();
    }
    if (level.mapname == "mp_ai_firefight") {
        foreach (exfil in level.var_c26f0d22bc1fa7ef) {
            function_bbe41f41d0f13612(exfil);
        }
        return;
    }
    while (!isdefined(level.radiation)) {
        waitframe();
    }
    while (!isdefined(level.radiation.origin)) {
        waitframe();
    }
    while (!isdefined(level.var_1b7407dffe81e6e8) || !isdefined(level.var_1b7407dffe81e6e8.var_b2f15037287a033a)) {
        waitframe();
    }
    var_56ea112138f55047 = getdvarint(@"hash_b4f00bd105203ec9", 1);
    level.var_449a83b6455a0f37 = getstructarray("dmz_hostage_exfil", "script_noteworthy");
    foreach (exfil in level.var_449a83b6455a0f37) {
        exfil.origin = (0, 0, -10) + ter_op(var_56ea112138f55047 == 1, namespace_d3d40f75bb4e4c32::droptogroundmultitrace(getclosestpointonnavmesh(exfil.origin)), exfil.origin);
        exfil.modelname = "dmz_exfil_site_xmodel";
        if (isdefined(exfil.target)) {
            helinode = getstruct(exfil.target, "targetname");
            if (isdefined(helinode)) {
                exfil.var_b44c269ea13f56ae = helinode.origin;
                exfil.var_a55fa332b1255e04 = helinode.angles;
            }
        }
        if (isdefined(exfil.script_label)) {
            if (exfil.script_label == "land") {
                exfil.land = 1;
            }
        }
    }
    if (istrue(level.var_50477dc063210a56)) {
        var_883f54a2a56e126c = [];
        foreach (exfil in level.var_c26f0d22bc1fa7ef) {
            var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
        }
        foreach (exfil in level.var_449a83b6455a0f37) {
            var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
        }
        foreach (exfil in level.var_b95a019fc748357a) {
            var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
        }
        foreach (exfil in var_883f54a2a56e126c) {
            function_bbe41f41d0f13612(exfil);
        }
    } else if (level.var_858dba9da8dc5419 != 0) {
        if (level.var_858dba9da8dc5419 < 0) {
            var_58e0d6d6e9b4c639 = abs(level.var_858dba9da8dc5419);
            foreach (var_36847c9a092f0703 in level.var_5fad09539823f92e) {
                exfils = array_randomize(var_36847c9a092f0703);
                for (i = 0; i < var_58e0d6d6e9b4c639; i++) {
                    function_bbe41f41d0f13612(exfils[i]);
                }
            }
        } else {
            exfils = array_randomize(level.var_c26f0d22bc1fa7ef);
            if (exfils.size < level.var_858dba9da8dc5419) {
                level.var_858dba9da8dc5419 = exfils.size;
            }
            var_99a5914efbb9b30 = spawnstruct();
            var_99a5914efbb9b30.points = [];
            var_99a5914efbb9b30.var_f700d2836aab75a4 = [];
            var_99a5914efbb9b30.var_f700d2836aab75a4[0] = [];
            var_99a5914efbb9b30.var_f700d2836aab75a4[1] = [];
            var_99a5914efbb9b30.var_f700d2836aab75a4[2] = [];
            var_99a5914efbb9b30.var_f700d2836aab75a4[3] = [];
            var_99a5914efbb9b30.var_9f9244294d1d74e = [];
            var_99a5914efbb9b30.var_9f9244294d1d74e[0] = [];
            var_99a5914efbb9b30.var_9f9244294d1d74e[1] = [];
            var_99a5914efbb9b30.var_9f9244294d1d74e[2] = [];
            var_99a5914efbb9b30.var_9f9244294d1d74e[3] = [];
            var_99a5914efbb9b30.var_b2f070298a88dbcb = [];
            var_883f54a2a56e126c = [];
            foreach (exfil in level.var_c26f0d22bc1fa7ef) {
                var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
            }
            var_56ea112138f55047 = getdvarint(@"hash_b4f00bd105203ec9", 1);
            foreach (exfil in level.var_449a83b6455a0f37) {
                if (!istrue(exfil.chosen)) {
                    exfil.origin = (0, 0, -10) + ter_op(var_56ea112138f55047 == 1, namespace_d3d40f75bb4e4c32::droptogroundmultitrace(getclosestpointonnavmesh(exfil.origin)), exfil.origin);
                    exfil.modelname = "dmz_exfil_site_xmodel";
                    var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
                }
            }
            level.var_883f54a2a56e126c = var_883f54a2a56e126c;
            var_f5aa0aac262fbf0b = sortbydistance(var_883f54a2a56e126c, level.radiation.origin);
            foreach (point in var_f5aa0aac262fbf0b) {
                var_6fcd82720e35bec2 = point.origin - level.radiation.origin;
                point.var_6fcd82720e35bec2 = var_6fcd82720e35bec2;
                index = ter_op(var_6fcd82720e35bec2[0] < 0, -1, 0) + ter_op(var_6fcd82720e35bec2[1] < 0, 3, 1);
                var_99a5914efbb9b30.var_f700d2836aab75a4[index][var_99a5914efbb9b30.var_f700d2836aab75a4[index].size] = point;
            }
            foreach (point in level.var_b95a019fc748357a) {
                var_6fcd82720e35bec2 = point.origin;
                point.var_6fcd82720e35bec2 = var_6fcd82720e35bec2;
                index = ter_op(var_6fcd82720e35bec2[0] < 0, -1, 0) + ter_op(var_6fcd82720e35bec2[1] < 0, 3, 1);
                var_99a5914efbb9b30.var_9f9244294d1d74e[index][var_99a5914efbb9b30.var_9f9244294d1d74e[index].size] = point;
            }
            var_d23334f7ed3aef60 = ter_op(level.radiation.origin[0] * -1 < 0, -1, 0) + ter_op(level.radiation.origin[1] * -1 < 0, 3, 1);
            for (i = 0; i < 4; i++) {
                if (i != var_d23334f7ed3aef60) {
                    var_99a5914efbb9b30.var_b2f070298a88dbcb[var_99a5914efbb9b30.var_b2f070298a88dbcb.size] = i;
                }
            }
            var_99a5914efbb9b30.var_b2f070298a88dbcb = array_randomize(var_99a5914efbb9b30.var_b2f070298a88dbcb);
            level.var_c5074bf13ffb95ef = var_99a5914efbb9b30.var_9f9244294d1d74e[var_d23334f7ed3aef60][randomint(var_99a5914efbb9b30.var_9f9244294d1d74e[var_d23334f7ed3aef60].size)];
            if (!isdefined(level.var_c5074bf13ffb95ef)) {
                var_a82a50c49958a9ef = sortbydistance(level.var_b95a019fc748357a, level.radiation.origin);
                level.var_c5074bf13ffb95ef = var_a82a50c49958a9ef[var_a82a50c49958a9ef.size - 1];
            }
            level.var_c919655bc36d8c87 = var_99a5914efbb9b30;
            var_8438f4a482da474a = undefined;
            var_1c2bd1d8ccea9d4b = 0;
            if (isdefined(level.var_a422458ec66a5dfb) && getdvarint(@"hash_4d4f07cdde717aaf", 0)) {
                var_8438f4a482da474a = [[ level.var_a422458ec66a5dfb ]](var_f5aa0aac262fbf0b, level.var_b95a019fc748357a, level.var_c5074bf13ffb95ef, level.var_858dba9da8dc5419, level.radiation);
                if (isdefined(var_8438f4a482da474a) && var_8438f4a482da474a.size == level.var_858dba9da8dc5419) {
                    var_8438f4a482da474a = array_reverse(var_8438f4a482da474a);
                }
            }
            if (!isdefined(var_8438f4a482da474a)) {
                targetdist = getdvarfloat(@"hash_d92c4387f959542c", 0.65);
                var_dee7a3b516180a52 = getdvarint(@"hash_f24f686449931240", 2);
                mindist = getdvarint(@"hash_5d9984a8fa843de9", 20000);
                mindist = mindist * mindist;
                midpoint = level.radiation.origin + (level.var_c5074bf13ffb95ef.origin - level.radiation.origin) * targetdist;
                closestPoints = sortbydistance(var_f5aa0aac262fbf0b, midpoint);
                var_8438f4a482da474a = [0:closestPoints[randomint(var_dee7a3b516180a52)]];
                failed = 0;
                curIndex = 0;
                for (i = 0; i < level.var_858dba9da8dc5419 - 1; i++) {
                    index = i;
                    attempts = 0;
                    var_8243432c62a4dc77 = 0;
                    while (!var_8243432c62a4dc77 && attempts < var_99a5914efbb9b30.var_b2f070298a88dbcb.size) {
                        while (index >= var_99a5914efbb9b30.var_b2f070298a88dbcb.size) {
                            index = index - var_99a5914efbb9b30.var_b2f070298a88dbcb.size;
                        }
                        foreach (point in var_99a5914efbb9b30.var_f700d2836aab75a4[var_99a5914efbb9b30.var_b2f070298a88dbcb[index]]) {
                            if (distance2dsquared(point.origin, level.radiation.origin) < mindist) {
                                continue;
                            }
                            valid = 1;
                            foreach (var_4a95e4581cd308ca in var_8438f4a482da474a) {
                                if (distance2dsquared(point.origin, var_4a95e4581cd308ca.origin) < mindist) {
                                    valid = 0;
                                    break;
                                }
                            }
                            if (!valid) {
                                continue;
                            }
                            var_8438f4a482da474a[var_8438f4a482da474a.size] = point;
                            var_8243432c62a4dc77 = 1;
                            break;
                        }
                        index = index + 1;
                        attempts = attempts + 1;
                    }
                    if (!var_8243432c62a4dc77) {
                        failed = failed + 1;
                    }
                }
                if (failed > 0) {
                    /#
                        assertmsg("Exfils failed to generate the correct number of exfils");
                    #/
                    for (i = 0; i < failed; i++) {
                        var_8438f4a482da474a[var_8438f4a482da474a.size] = function_7a2aaa4a09a4d250(var_f5aa0aac262fbf0b);
                    }
                }
            }
            foreach (e in var_8438f4a482da474a) {
                function_bbe41f41d0f13612(e);
            }
            /#
                assertex(var_8438f4a482da474a.size == level.var_858dba9da8dc5419, "DMZ EXFILS: Failed to spawn the correct number of exfils.");
            #/
            level.var_aa174df565129c2b = var_8438f4a482da474a[0];
        }
        timer = getdvarint(@"hash_e022fd0199a95f84");
        waittime = int(max(timer - level.var_b8457c8044b2ee02, 0));
        if (waittime <= 0) {
            return;
        }
        wait(waittime);
        level notify("start_dmz_extracts");
        return;
    }
    level.var_45b8ebf14dbc4e63 = [];
    foreach (player in level.players) {
        exfils = getteamdata(player.team, "exfils");
        if (isdefined(exfils) && exfils.size > 0) {
            continue;
        }
        if (level.var_c42d6e4a40f70691 == 0 && level.var_ff04728f8e36403f == 0) {
            function_1c2bd1696d29935b(player.team, "dmz_exfil_intro");
        }
        if (isdefined(player) && isdefined(level.var_c26f0d22bc1fa7ef) && isdefined(level.var_c26f0d22bc1fa7ef[0])) {
            exfil = level.var_c26f0d22bc1fa7ef[0];
            maxdist = 0;
            /#
                assertex(isdefined(level.teamdata[player.team]["startPoint"]), "Team is missing a valid spawnpoint and therefore cannot be assigned a valid exfil.");
            #/
            if (isdefined(level.teamdata[player.team]["startPoint"])) {
                var_ac33fed0dd8063f8 = level.teamdata[player.team]["startPoint"].poi;
                var_de6cb1958be41b40 = undefined;
                var_e97fc2f67229c010 = ter_op(level.var_9b6b8c7ecb7ac7c0, level.var_58f477e9e7e8f739, level.var_c26f0d22bc1fa7ef);
                if (level.var_c8ff03474c1de67f >= level.poi.size) {
                    level.var_c8ff03474c1de67f = level.poi.size - 1;
                }
                if (level.var_e5993849fc7d5987 == 0 && isdefined(var_ac33fed0dd8063f8) && isdefined(level.poi[var_ac33fed0dd8063f8]["otherPoiByDist"])) {
                    var_de6cb1958be41b40 = level.poi[var_ac33fed0dd8063f8]["otherPoiByDist"][level.var_c8ff03474c1de67f];
                }
                for (i = 1; i < var_e97fc2f67229c010.size; i++) {
                    if (level.var_d962891163d17d4a == 1) {
                        if (isdefined(var_ac33fed0dd8063f8) && var_e97fc2f67229c010[i].poi != var_ac33fed0dd8063f8) {
                            continue;
                        }
                    } else if (level.var_c8ff03474c1de67f != 0 && isdefined(var_de6cb1958be41b40)) {
                        if (var_e97fc2f67229c010[i].poi != var_de6cb1958be41b40) {
                            continue;
                        }
                    }
                    dist = distance2dsquared(player.origin, var_e97fc2f67229c010[i].origin);
                    if (dist > maxdist) {
                        maxdist = dist;
                        exfil = var_e97fc2f67229c010[i];
                    }
                }
            }
            if (getdvarint(@"hash_7f50c115586dc8ca", -1) != -1) {
                exfil = level.var_c26f0d22bc1fa7ef[getdvarint(@"hash_7f50c115586dc8ca", 0)];
            }
            if (level.var_c42d6e4a40f70691 || level.var_ff04728f8e36403f != 0) {
                level.var_45b8ebf14dbc4e63[player.team] = exfil;
            } else if (level.var_cdc76bc962358072) {
                function_bbe41f41d0f13612(exfil);
            } else {
                exfil.var_d81e4008d63c5e96[player.team] = player.team;
                function_ac66b79a73b21444(player.team, exfil);
                if (getdvarint(@"hash_f0fc10ceb2d6142c", 0) == 0) {
                    if (isdefined(exfil.var_d81e4008d63c5e96) && exfil.var_d81e4008d63c5e96.size > 0) {
                        function_b513aaf6e49f184a(exfil);
                    } else {
                        function_bbe41f41d0f13612(exfil);
                    }
                }
            }
        }
    }
    timer = getdvarint(@"hash_e022fd0199a95f84");
    waittime = int(max(timer - level.var_b8457c8044b2ee02, 0));
    if (waittime <= 0) {
        return;
    }
    wait(waittime);
    level notify("start_dmz_extracts");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5623
// Size: 0x3f8
function private function_d92380bfc792a6a9() {
    wait(10);
    while (1) {
        if (getdvar(@"hash_ec9d0bc135119057", "") != "") {
            val = getdvar(@"hash_ec9d0bc135119057", "");
            setdvar(@"hash_ec9d0bc135119057", "");
            if (isdefined(level.var_fe2e551da0962c3c)) {
                foreach (exfil in level.var_fe2e551da0962c3c) {
                    function_97061811695243ea(exfil);
                }
            }
            vals = strtok(val, " ");
            var_56ea112138f55047 = getdvarint(@"hash_b4f00bd105203ec9", 1);
            var_883f54a2a56e126c = [];
            if (array_contains(vals, "hostage") && isdefined(level.var_449a83b6455a0f37)) {
                foreach (exfil in level.var_449a83b6455a0f37) {
                    exfil.origin = (0, 0, -10) + ter_op(var_56ea112138f55047 == 1, namespace_d3d40f75bb4e4c32::droptogroundmultitrace(getclosestpointonnavmesh(exfil.origin)), exfil.origin);
                    exfil.modelname = "dmz_exfil_site_xmodel";
                    var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
                }
            }
            if (array_contains(vals, "normal") && isdefined(level.var_c26f0d22bc1fa7ef)) {
                foreach (exfil in level.var_c26f0d22bc1fa7ef) {
                    var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
                }
            }
            if (array_contains(vals, "final") && isdefined(level.var_b95a019fc748357a)) {
                foreach (exfil in level.var_b95a019fc748357a) {
                    var_883f54a2a56e126c[var_883f54a2a56e126c.size] = exfil;
                }
            }
            foreach (exfil in var_883f54a2a56e126c) {
                function_bbe41f41d0f13612(exfil);
            }
        }
        if (getdvarint(@"hash_a48fc6794f79a816", 0) == 1) {
            player = level.players[0];
            var_a21d92f62733e9c9 = spawnstruct();
            var_a21d92f62733e9c9.poi = array_randomize(level.poi)[0];
            player.brmissionscompleted++;
            player setclientomnvar("ui_dmz_missions_completed", player.brmissionscompleted);
            function_52781be0b4e8a959(player.team, var_a21d92f62733e9c9);
            wait(4);
        }
        if (getdvarint(@"hash_dfbc149f9d4e85bf", 0) == 1) {
            foreach (player in level.players) {
                player dodamage(999999, player.origin, player, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
            }
            setdvar(@"hash_dfbc149f9d4e85bf", 0);
        }
        wait(1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a22
// Size: 0x22a
function function_52781be0b4e8a959(team, activity) {
    level.var_cc6f9cf228accb4[team]++;
    if (istrue(level.var_98c3db0dbb3d3029)) {
        return;
    }
    if (level.var_8f7d92f10fc80ce) {
        if (level.var_cc6f9cf228accb4[team] % level.var_8f7d92f10fc80ce != 0) {
            return;
        }
        if (level.var_9b6b8c7ecb7ac7c0) {
            var_204f99d788c2c529 = level.var_58f477e9e7e8f739[0];
            foreach (exfil in level.var_58f477e9e7e8f739) {
                if (!array_contains_key(exfil.var_d81e4008d63c5e96, team)) {
                    if (exfil.var_d81e4008d63c5e96.size > level.var_628f636de1f2dda3) {
                        var_204f99d788c2c529 = exfil;
                    } else {
                        if (level.var_1eff61a95657ca2 && isdefined(level.teamdata[team]["startPoint"].poi) && exfil.poi == level.teamdata[team]["startPoint"].poi) {
                            continue;
                        }
                        level thread function_f9ddc1898e570753(exfil, team);
                        return;
                    }
                }
            }
            if (isdefined(var_204f99d788c2c529)) {
                level.var_628f636de1f2dda3 = level.var_628f636de1f2dda3 + 1;
                level thread function_f9ddc1898e570753(var_204f99d788c2c529, team);
            }
            return;
        } else {
            players = namespace_54d20dd0dd79277f::getfriendlyplayers(team, 1);
            poi = ter_op(isdefined(activity.poi), activity.poi, namespace_37f0fb6355a4618a::function_6cc445c02b5effac(players[0].origin));
            exfil = function_ffef19d55026b498(team, activity.poi);
            if (isdefined(exfil)) {
                level thread function_f9ddc1898e570753(exfil, team);
                return;
            }
        }
    }
    if (level.var_cc6f9cf228accb4[team] != level.var_c42d6e4a40f70691) {
        return;
    }
    level thread function_ed7bc1aaeb97b0ef(team);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c53
// Size: 0xa3
function function_f9ddc1898e570753(exfil, team) {
    wait(4);
    exfil.var_d81e4008d63c5e96[team] = team;
    function_ac66b79a73b21444(team, exfil);
    players = namespace_54d20dd0dd79277f::getfriendlyplayers(team, 1);
    namespace_d696adde758cbe79::showDMZSplash("dmz_exfil_ready", players, exfil.poi);
    if (getdvarint(@"hash_f0fc10ceb2d6142c", 0) == 0) {
        if (isdefined(exfil.var_d81e4008d63c5e96) && exfil.var_d81e4008d63c5e96.size > 0) {
            function_b513aaf6e49f184a(exfil);
        } else {
            function_bbe41f41d0f13612(exfil);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cfd
// Size: 0xbe
function function_ed7bc1aaeb97b0ef(team) {
    wait(4);
    exfil = level.var_45b8ebf14dbc4e63[team];
    exfil.var_d81e4008d63c5e96[team] = team;
    function_ac66b79a73b21444(team, exfil);
    players = namespace_54d20dd0dd79277f::getfriendlyplayers(team, 1);
    namespace_d696adde758cbe79::showDMZSplash("dmz_exfil_ready", players, exfil.poi);
    namespace_944ddf7b8df1b0e3::leaderdialog("dmz_contract_complete_2", team);
    if (getdvarint(@"hash_f0fc10ceb2d6142c", 0) == 0) {
        if (isdefined(exfil.var_d81e4008d63c5e96) && exfil.var_d81e4008d63c5e96.size > 0) {
            function_b513aaf6e49f184a(exfil);
        } else {
            function_bbe41f41d0f13612(exfil);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dc2
// Size: 0xb9
function function_ffef19d55026b498(team, poi) {
    var_921a13367f73ab4d = undefined;
    if (!isdefined(level.var_5fad09539823f92e[poi])) {
        return undefined;
    }
    foreach (exfil in level.var_5fad09539823f92e[poi]) {
        if (exfil.var_d81e4008d63c5e96.size == 0 || level.var_4644c9da9a611950) {
            var_921a13367f73ab4d = exfil;
        }
        if (array_contains_key(exfil.var_d81e4008d63c5e96, team)) {
            return undefined;
        }
    }
    return var_921a13367f73ab4d;
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e83
// Size: 0x1a
function function_40d3fb596096ac55(player) {
    player function_6c155294223488b5(undefined, "KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea4
// Size: 0x40
function function_595eede45a673b1f(players, poi, var_27144879b0c7beed) {
    if (istrue(var_27144879b0c7beed)) {
        namespace_d696adde758cbe79::showDMZSplash("dmz_exfil_inbound_final", players, poi);
    } else {
        namespace_d696adde758cbe79::showDMZSplash("dmz_exfil_inbound", players, poi);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5eeb
// Size: 0x83
function function_779fdc701bfa688(players, var_27144879b0c7beed) {
    function_3a594b90827cde7e("dmz_exfil_start", players, var_27144879b0c7beed, "dmz_exfil_start_classic");
    foreach (player in players) {
        if (isplayer(player)) {
            player.var_2441210fe6eea080 = 1;
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f75
// Size: 0xdb
function function_133deebbe58fb347(players, team, var_27144879b0c7beed, ent, var_2c728460e4c9349d) {
    if (!istrue(var_27144879b0c7beed)) {
        if (namespace_d576b6dc7cef9c62::gettimeremaining() / 1000 < 30 + level.var_9405abd1db7cf2cf || namespace_7789f919216d38a2::function_28f7a303238284ee()) {
            function_1c2bd1696d29935b(team, "dmz_exfil_pilot_called_gas");
        } else {
            function_1c2bd1696d29935b(team, "dmz_exfil_pilot_called_default");
        }
    }
    if (var_2c728460e4c9349d >= 45) {
        var_2c728460e4c9349d = var_2c728460e4c9349d - 30;
        wait(var_2c728460e4c9349d);
        function_efd3004bcaa728f("dmz_exfil_pilot_called_30out", players);
        var_2c728460e4c9349d = 30;
    }
    if (var_2c728460e4c9349d >= 30) {
        var_2c728460e4c9349d = var_2c728460e4c9349d - 15;
        wait(var_2c728460e4c9349d);
        function_efd3004bcaa728f("dmz_exfil_pilot_called_15out", players);
        var_2c728460e4c9349d = 15;
    }
    wait(var_2c728460e4c9349d);
    if (!isdefined(ent) || istrue(ent.disabled)) {
        return;
    } else {
        function_efd3004bcaa728f("dmz_exfil_pilot_called_close", players);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6057
// Size: 0x40
function function_25e48c3d85f4a59c(players, heli) {
    if (isdefined(heli.var_9a9890e85503c247)) {
        function_efd3004bcaa728f("dmz_exfil_pilot_called_masks", players);
    } else {
        function_efd3004bcaa728f("dmz_exfil_pilot_called_touchdown", players);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x609e
// Size: 0x26
function function_a0d539b960b93bb(players, var_27144879b0c7beed) {
    if (istrue(var_27144879b0c7beed)) {
        function_efd3004bcaa728f("dmz_exfil_pilot_called_final_leaving", players);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60cb
// Size: 0x19
function function_ab7f97a0b46cbeaf(players) {
    function_efd3004bcaa728f("dmz_exfil_pilot_called_final_warning", players);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60eb
// Size: 0x48
function function_e392fd7cad768e25() {
    if (!isdefined(self)) {
        /#
            assertmsg("[BR_DMZ_EXTRACT]: Helicopter Exfil Shortcut callback - there's no actual player.");
        #/
        return;
    }
    if (!isdefined(self.team)) {
        /#
            assertmsg("[BR_DMZ_EXTRACT]: Helicopter Exfil Shortcut callback - there's a player but no team.");
        #/
        return;
    }
    function_1c2bd1696d29935b(self.team, "dmz_exfil_pilot_called_shortcut");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613a
// Size: 0x140
function function_aa3139c5fae701b8(heli) {
    if (namespace_d576b6dc7cef9c62::gettimeremaining() / 1000 < 30 || namespace_7789f919216d38a2::function_28f7a303238284ee()) {
        var_bf80f581fdce86d2 = heli.angles + (0, -90, -18);
        var_840c2ee92c8f78fe = [0:(33, 40, -198), 1:(-15, 40, -198), 2:(-58, 40, -198), 3:(-105, 40, -198)];
        foreach (offset in var_840c2ee92c8f78fe) {
            var_b96e8bc44751cfae = rotatevector(offset, heli.angles);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(heli.origin + var_b96e8bc44751cfae, var_bf80f581fdce86d2);
            gasmask = namespace_cb965d2f71fefddc::spawnpickup("brloot_equip_gasmask", var_cb4fad49263e20c4, 108);
            gasmask utility::function_6e506f39f121ea8a(heli, offset);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6281
// Size: 0x14
function function_113d0e9d241c8568(players, var_27144879b0c7beed) {
    
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x629c
// Size: 0x8c
function function_704dc2a5075c58b9(players) {
    foreach (player in players) {
        if (isplayer(player) && !istrue(player.extracted)) {
            player.var_2441210fe6eea080 = undefined;
            player notify("end_heli_exit_listener");
            function_b892c6b4c68c344a([0:player], 2);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632f
// Size: 0x75
function function_1ce7b362085d943e(players, var_27144879b0c7beed) {
    function_3a594b90827cde7e("dmz_exfil_start", players, var_27144879b0c7beed, "dmz_exfil_start_classic");
    foreach (player in players) {
        thread function_2094ef55dee7b236(player);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63ab
// Size: 0xc
function function_b1219a25435ab949(players) {
    
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63be
// Size: 0x26
function function_17950170d1365ee0(players) {
    function_3a594b90827cde7e("dmz_exfil_end", players);
    function_2eda2621150bd589(players, 4);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63eb
// Size: 0x26
function function_e7994a561be9b933(players) {
    function_3a594b90827cde7e("dmz_exfil_manual", players);
    function_2eda2621150bd589(players, 4);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6418
// Size: 0x54
function function_2094ef55dee7b236(player) {
    player notify("end_heli_exit_listener");
    player endon("end_heli_exit_listener");
    player waittill("exited_chopper");
    if (istrue(player.extracted)) {
        return;
    }
    function_b892c6b4c68c344a([0:player], 1);
    function_3a594b90827cde7e("dmz_exfil_abort", [0:player]);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6473
// Size: 0x45
function function_673f07bb8a61bcf3(ent, var_bedb769cc0e5e018) {
    if (level.var_662586ede589f49c && var_bedb769cc0e5e018) {
        ent.info.used = 1;
        ent delete();
        return;
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64bf
// Size: 0x4b
function function_5bc15f36914e63c7(ent, part, state, player, waittime, var_292d5d91fb6427ff, var_27144879b0c7beed) {
    namespace_e8fceb5cf6e8cdf8::function_d1478474b036b87f(ent, part, state, player, waittime, var_292d5d91fb6427ff, var_27144879b0c7beed);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6511
// Size: 0x1b
function function_184ff6b45e3f1b70() {
    self endon("death_or_disconnect");
    namespace_d3d40f75bb4e4c32::playerplaygestureweaponanim("iw8_ges_plyr_plunder_smoke", 1.867);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6533
// Size: 0x4b
function function_6c155294223488b5(weaponobject, var_734564ff3d4fd467) {
    self iprintlnbold(var_734564ff3d4fd467);
    self playlocalsound("br_pickup_deny");
    if (isdefined(weaponobject)) {
        ammo = self getweaponammoclip(weaponobject);
        self setweaponammoclip(weaponobject, ammo + 1);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x6585
// Size: 0x19d
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname, eventid) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
    }
    if (istrue(level.var_f7c6553e5222163f)) {
        return;
    }
    if ((attacker == self || isdefined(attacker.pers) && attacker.pers["team"] == self.team && !level.friendlyfire && level.teambased) && attacker != self.owner) {
        return;
    }
    if (self.health <= 0) {
        return;
    }
    damage = namespace_a2f809133c566621::getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    namespace_58a74e7d54b56e8d::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6729
// Size: 0x88
function function_efd3004bcaa728f(dialog, players) {
    var_cb3339ece72dbdeb = game["dialog"][dialog];
    foreach (player in players) {
        if (isdefined(player) && isreallyalive(player)) {
            player queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67b8
// Size: 0x93
function function_9fdf14c5aac8ce53(dialog) {
    var_cb3339ece72dbdeb = game["dialog"][dialog];
    foreach (player in level.players) {
        if (!isbot(player) && isdefined(player) && isreallyalive(player)) {
            player queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6852
// Size: 0x93
function function_1c2bd1696d29935b(teamname, dialog) {
    var_cb3339ece72dbdeb = game["dialog"][dialog];
    foreach (teammember in getteamdata(teamname, "players")) {
        if (isdefined(teammember) && isreallyalive(teammember)) {
            teammember queuedialogforplayer(var_cb3339ece72dbdeb, dialog, 2);
        }
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68ec
// Size: 0x66
function function_c5f291acf1b44b69(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(instance) || !isdefined(player)) {
        return;
    }
    player thread function_8fc5aeab9cb08048(instance.entity);
    instance setscriptablepartstate("dmz_exfil_site", "standby");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6959
// Size: 0x91
function function_3a594b90827cde7e(music, var_3a3d1b991ac7ba41, var_7e6513b2ae0d5c1d, var_6b9a0dbbf039dece) {
    musicstate = function_17ee301cf0b5ba85(music);
    var_cbfb00f6fdb0afba = function_17ee301cf0b5ba85(var_6b9a0dbbf039dece);
    if (isarray(var_3a3d1b991ac7ba41)) {
        players = var_3a3d1b991ac7ba41;
        function_fe75a89529dd0fd0(players, musicstate, undefined, undefined, var_cbfb00f6fdb0afba);
    } else if (isstring(var_3a3d1b991ac7ba41)) {
        team = var_3a3d1b991ac7ba41;
        function_46979d2fd81a6d4b(team, musicstate, undefined, var_cbfb00f6fdb0afba);
    }
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69f1
// Size: 0x8b
function function_2eda2621150bd589(players, fadetime) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player setsoundsubmix("iw9_mp_dmz_exfil_fadeout", fadetime);
        player.var_30dc7dfd9be2a276 = 1;
    }
    namespace_446fc987a980892f::function_2c722a2ef9574e87(players, "exfil_fadeout", 120);
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a83
// Size: 0x7e
function function_b892c6b4c68c344a(players, fadetime) {
    foreach (player in players) {
        player clearsoundsubmix("iw9_mp_dmz_exfil_fadeout", fadetime);
        player.var_30dc7dfd9be2a276 = undefined;
    }
    namespace_446fc987a980892f::function_70979c1eabf04180(players, "exfil_fadeout");
}

// Namespace namespace_5287de5aa8b462db/namespace_25b25d188ef778c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b08
// Size: 0x6a
function function_ac66b79a73b21444(team, var_3064fa24dbbd5bbf) {
    var_3fe83c7fbe0f3dfc = array_add(getteamdata(team, "exfils"), var_3064fa24dbbd5bbf);
    namespace_54d20dd0dd79277f::setteamdata(team, "exfils", var_3fe83c7fbe0f3dfc);
    /#
        namespace_d1a9ca87d78d9813::function_9533653868e59fb6("neutral", team, undefined, undefined, undefined, undefined, var_3064fa24dbbd5bbf.poi, var_3064fa24dbbd5bbf.origin);
    #/
}

