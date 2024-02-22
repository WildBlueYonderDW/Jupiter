// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using script_930a1e7bd882c1d;
#using script_3b64eb40368c1450;
#using script_7933519955f32c4e;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using script_a34750d17473c49;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\deathicons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_7c40fa80892a721;
#using script_27afd7662bc38a81;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\equipment\thermite.gsc;
#using script_a35012b9b75a996;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\common\notetrack.gsc;
#using script_142b065a6cb7bf82;
#using script_7cfb984d8451dc2a;
#using script_1a2a18b8a4837a05;
#using script_289ea7ea13a4a6cc;
#using script_4500eeb43be80324;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace namespace_59982bac4da47c6f;

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0
// Size: 0x18d
function main() {
    namespace_973962356ce55fee::init();
    if (namespace_973962356ce55fee::function_b4e9d46918f067bb()) {
        return;
    }
    /#
        assert(!isdefined(level.infilstruct));
    #/
    level.infilstruct = spawnstruct();
    level.infilstruct.players = [];
    if (getdvarint(@"hash_2be93dd484220a45", 0) == 1) {
        register_state(0, "prematch", &function_548eaacfe34b28e1);
        register_state(1, "fadedown", &function_d2e5a4473e27019);
        register_state(2, "streaming", &function_6e7a11c7804fe019);
        register_state(3, "cinematic", &function_c6dc2c9535e1fac8);
        register_state(4, "animatic", &function_c1e0d339c6959b81);
        register_state(5, "flyover", &function_2923788bc736bb9e);
        register_state(6, "done", &function_abb2b783f6044bb3);
    } else {
        register_state(0, "prematch", &function_548eaacfe34b28e1);
        register_state(1, "fadedown", &function_d2e5a4473e27019);
        register_state(2, "streaming", &function_d23657823446b3a1);
        register_state(3, "cinematic", &function_c6dc2c9535e1fac8);
        register_state(4, "animatic", &function_6cc48d378966bc2f);
        register_state(5, "flyover", &function_2923788bc736bb9e);
        register_state(6, "done", &function_abb2b783f6044bb3);
    }
    function_fe85c23fc6fa8c2();
    function_c03893a40366ed07();
    level thread function_891dc8f3bb2a44aa();
    /#
        thread function_5ade9d48cec313b2();
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa44
// Size: 0x6d
function function_891dc8f3bb2a44aa() {
    level endon("game_ended");
    level endon("kill_state_machine");
    level.var_90481fb292a83c2b = undefined;
    waitframe();
    var_f4db5b4567f88914 = 0;
    while (1) {
        if (!isdefined(level.var_90481fb292a83c2b)) {
            set_state(var_f4db5b4567f88914);
        } else {
            set_state(level.var_90481fb292a83c2b + 1);
        }
        if (level.var_90481fb292a83c2b == 6) {
            break;
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab8
// Size: 0xb
function private kill_state_machine() {
    level notify("kill_state_machine");
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaca
// Size: 0x80
function register_state(statenum, statename, var_3f1bc3e031a251e4) {
    if (!isdefined(level.var_da14b46dae9397eb)) {
        level.var_da14b46dae9397eb = [];
    }
    /#
        assert(!isdefined(level.var_da14b46dae9397eb[statenum]));
    #/
    newstate = spawnstruct();
    newstate.name = statename;
    newstate.var_3f1bc3e031a251e4 = var_3f1bc3e031a251e4;
    level.var_da14b46dae9397eb[statenum] = newstate;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb51
// Size: 0x96
function set_state(statenum) {
    level.var_90481fb292a83c2b = statenum;
    var_69466217dfab45fe = level.var_da14b46dae9397eb[level.var_90481fb292a83c2b];
    if (isdefined(level.infilstruct.var_e7c7de60a5ea2f52[var_69466217dfab45fe.name])) {
        [[ level.infilstruct.var_e7c7de60a5ea2f52[var_69466217dfab45fe.name] ]]();
    }
    if (isdefined(var_69466217dfab45fe.var_3f1bc3e031a251e4)) {
        [[ var_69466217dfab45fe.var_3f1bc3e031a251e4 ]]();
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbee
// Size: 0x25f
function function_548eaacfe34b28e1() {
    c130pathstruct = undefined;
    if (!istrue(level.br_infils_disabled) && !istrue(level.var_59ff09549058dda2)) {
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("createC130PathStruct")) {
            c130pathstruct = namespace_71073fa38f11492::runbrgametypefunc("createC130PathStruct");
        } else {
            c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path(level.var_b88975a1f2a5e092, undefined);
        }
    }
    level.infilstruct.c130pathstruct = c130pathstruct;
    if (getdvarint(@"hash_602981760e1c923d", 1)) {
        if (!istrue(level.skipprematch) && !istrue(level.prematchstarted)) {
            level waittill("start_prematch");
        }
        if (isdefined(level.infilstruct.var_eb0cd5e47dbbfd6a)) {
            [[ level.infilstruct.var_eb0cd5e47dbbfd6a ]]();
            function_6199c35f4cf4524c(&function_ab16b6a69b739179);
            thread function_6d2764481349d838();
        }
    }
    if (!istrue(level.prematchstarted)) {
        level waittill("prematch_started");
    }
    if (istrue(level.br_infils_disabled)) {
        level.infilstruct.players = namespace_80cec6cfc70c4f95::function_22a0e95dd4174c81();
        namespace_4b0406965e556711::gameflagset("prematch_fade_done");
        waitframe();
        level.allowprematchdamage = 0;
        forcespawnplayers(level.infilstruct.players);
        function_ec7fe6e7834d5d70();
        if (!namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
            level.disablespawning = 1;
            setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 1);
        }
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player.plotarmor = undefined;
            /#
                if (istrue(level.var_3a92df26d817352d)) {
                    player thread namespace_d20f8ef223912e12::givestandardtableloadout(0, 1);
                }
            #/
        }
        namespace_4b0406965e556711::gameflagset("br_ready_to_jump");
        kill_state_machine();
    } else if (namespace_71073fa38f11492::isbrgametypefuncdefined("infilSequence")) {
        namespace_71073fa38f11492::runbrgametypefunc("infilSequence");
        namespace_4b0406965e556711::gameflagset("br_ready_to_jump");
        kill_state_machine();
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x56
function function_ab16b6a69b739179() {
    if (isdefined(level.infilstruct.var_5a3d20651fd80005)) {
        self [[ level.infilstruct.var_5a3d20651fd80005 ]]();
    } else {
        self setallstreamloaddist(0);
    }
    self function_bc667001f9dd3808(level.infilstruct.var_6930961c8a8d33fc);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb1
// Size: 0xc0
function function_6d2764481349d838() {
    while (1) {
        if (level.var_90481fb292a83c2b > 3) {
            break;
        }
        foreach (player in level.players) {
            if (isdefined(level.infilstruct.var_5a3d20651fd80005)) {
                player [[ level.infilstruct.var_5a3d20651fd80005 ]]();
            } else {
                player setallstreamloaddist(0);
            }
            player function_bc667001f9dd3808(level.infilstruct.var_6930961c8a8d33fc);
        }
        wait(10);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf78
// Size: 0x2ce
function function_d2e5a4473e27019() {
    if (isdefined(level.var_c5877dbe60fddbf6)) {
        foreach (codcaster in level.var_c5877dbe60fddbf6) {
            codcaster setclientomnvar("ui_br_infil_started", 1);
            codcaster setclientomnvar("ui_br_infiled", 0);
        }
    }
    /#
        assert(isdefined(level.infilstruct.c130pathstruct));
    #/
    namespace_ad389306d44fc6b4::spawnc130(level.infilstruct.var_fd05dc031a2e7283, level.infilstruct.var_30e653e12f358438, level.infilstruct.var_c3a4f4442070a8b5, level.infilstruct.c130pathstruct, level.infilstruct.var_a6547e85663b3bc2, level.infilstruct.var_7a96307b6a7ed797);
    /#
        assert(isdefined(level.br_ac130));
    #/
    level.infilstruct.c130 = level.br_ac130;
    level.infilstruct.players = namespace_80cec6cfc70c4f95::function_22a0e95dd4174c81();
    /#
        if (function_176ea5668fe41dad()) {
            level.infilstruct.players = array_remove(level.infilstruct.players, level.player);
        }
    #/
    function_8252134bb4aaa66b();
    if (level.var_7647df14c1f116f7 && isdefined(level.infilstruct.var_6f0c032ec6e5d14)) {
        [[ level.infilstruct.var_6f0c032ec6e5d14 ]](level.infilstruct.c130.animstruct);
    }
    namespace_b984803e2ef247a2::removealldeathicons();
    setomnvar("ui_hide_player_icons", 1);
    level.br_c130spawndone = 0;
    level.infiltransistioning = 1;
    level.infilcinematicactive = 1;
    level.allowprematchdamage = 0;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_38f6e236e493c28b();
    }
    function_6199c35f4cf4524c(&function_540bab0e9a607717);
    level.infilstruct.c130 thread gunship_updateplayercount();
    waitandpause(1);
    waitframe();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x10e
function private function_38f6e236e493c28b() {
    if (isdefined(level.infilstruct.var_5a3d20651fd80005)) {
        self [[ level.infilstruct.var_5a3d20651fd80005 ]]();
    } else {
        self setallstreamloaddist(-1);
    }
    if (istrue(level.var_7647df14c1f116f7)) {
        self function_bc667001f9dd3808(level.infilstruct.var_3a6128a99dc22eb2);
    } else if (function_7812117b17c4d21e() == "hq_ac130_v2") {
        self function_bc667001f9dd3808(level.infilstruct.c130.animstruct.origin);
    } else {
        self function_bc667001f9dd3808(level.infilstruct.c130.origin);
    }
    function_179ad01817ae940b(level.infilstruct.c130);
    function_1b7e57bfe648f609();
    function_10f93bb3f3966751(1, "stateMachine");
    self setclientdvar(@"hash_b21f1157c582ff15", 0);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1362
// Size: 0x1b
function function_540bab0e9a607717() {
    self endon("disconnect");
    function_38f6e236e493c28b();
    waitandpause(1);
    waitframe();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1384
// Size: 0x50
function private function_179ad01817ae940b(c130) {
    self.c130 = c130;
    if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        utility::hidehudenable();
    }
    namespace_d19129e4fa5d176::blockclasschange();
    /#
        if (self isnoclip()) {
            self noclip();
        }
        if (self isufo()) {
            self ufo();
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x13db
// Size: 0x62
function private gunship_updateplayercount() {
    level endon("game_ended");
    self notify("ac130_player_count");
    self endon("ac130_player_count");
    level.infilstruct.playersinc130 = 0;
    while (1) {
        setomnvar("ui_br_players_left_in_plane", level.infilstruct.playersinc130);
        if (!isdefined(self)) {
            break;
        }
        wait(0.5);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1444
// Size: 0x20f
function function_d23657823446b3a1() {
    namespace_15d3019056d1bcea::emptyallvehicles();
    setomnvar("ui_in_infil", 1);
    namespace_4b0406965e556711::gameflagset("prematch_fade_done");
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientomnvar("ui_options_menu", 0);
    }
    forcespawnplayers(level.infilstruct.players, level.infilstruct.c130.origin, level.infilstruct.c130);
    level.snatchspawnalltoc130done = 1;
    function_ec7fe6e7834d5d70();
    if (!namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        level.disablespawning = 1;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 1);
    }
    function_6199c35f4cf4524c(&function_f6248665c763b00f);
    waitandpause(getdvarfloat(@"hash_669c21dc4d23066d", 3));
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!istrue(level.infilstruct.var_2a959f4ba13b75da)) {
            player clearpredictedstreampos();
        }
        player endprematchskydiving();
        player.br_isininfil = 1;
        if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
            player setclientomnvar("ui_options_menu", -1);
        }
    }
    function_583f118c4064ca21(level.infilstruct.players);
    function_6199c35f4cf4524c(&function_c3d1219a613ebcdf);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165a
// Size: 0x177
function function_6e7a11c7804fe019() {
    function_d23657823446b3a1();
    waittime = getdvarfloat(@"hash_ff017df91bbce1b3", 10);
    var_71b179643f3088fe = function_425d34ddd114f3de();
    /#
        var_71b179643f3088fe = getdvarint(@"hash_a1a244c93c599fe8", var_71b179643f3088fe);
    #/
    while (level.players.size < var_71b179643f3088fe) {
        waittime = waittime - level.framedurationseconds;
        if (waittime < 0) {
            break;
        }
        waitframe();
    }
    if (getdvarint(@"hash_9be38b3a8782259c", 0) == 1) {
        return;
    }
    wait(getdvarfloat(@"hash_fbe5ab97a6675878", 10));
    function_d5131497d473cb79("");
    foreach (player in level.players) {
        player setsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 2);
    }
    setomnvar("ui_in_infil", 3);
    wait(getdvarfloat(@"hash_a707d8e7bcd8e3a7", 118));
    foreach (player in level.players) {
        player clearsoundsubmix("fade_to_black_all_except_music_scripted5_and_amb", 2);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d8
// Size: 0x4e
function function_f6248665c763b00f() {
    self endon("disconnect");
    forcespawnplayers([0:self], level.infilstruct.c130.origin, level.infilstruct.c130);
    function_d392b52249d2a8fe();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x182d
// Size: 0x33
function function_c3d1219a613ebcdf() {
    self endon("disconnect");
    self clearpredictedstreampos();
    endprematchskydiving();
    self.br_isininfil = 1;
    function_423115ed15f21e05(self.team);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1867
// Size: 0x74
function private function_2fd95fb465cf24fe() {
    self endon("disconnect");
    if (self.class == "") {
        self.class = "custom1";
        self.pers["class"] = "custom1";
    }
    namespace_99ac021a7547cae3::spawnplayer(0);
    self.br_infilstarted = 1;
    self notify("brWaitAndSpawnClientComplete");
    self setclientomnvar("ui_br_transition_type", 0);
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18e2
// Size: 0x23b
function private forcespawnplayers(players, spawnorigin, var_f60347f29feec261) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.team) || player.team == "spectator" || player.team == "codcaster") {
            /#
                /#
                    assertmsg("fade_to_black_all_except_music_scripted5_and_amb");
                #/
            #/
        } else {
            prevpos = player.origin;
            player endprematchskydiving();
            player clearladderstate();
            if (isalive(player)) {
                player function_d87e1768229d0e3e();
            }
            if (!istrue(level.br_infils_disabled)) {
                player namespace_d20f8ef223912e12::playerexecutionsdisable();
                player namespace_1cd9f6896754adb0::set("br_infil", "offhand_throwback", 0);
            }
            player.var_e3bb1b362fbe3cc5 = undefined;
            if (!isalive(player)) {
                if (istrue(player.waitingtospawnamortize)) {
                    player waittill_either("spawned_player", "disconnect");
                    if (isdefined(player) && isdefined(spawnorigin)) {
                        player setorigin(spawnorigin);
                    }
                } else {
                    if (isdefined(spawnorigin)) {
                        player.forcespawnorigin = spawnorigin;
                    }
                    player function_2fd95fb465cf24fe();
                }
            } else if (isdefined(spawnorigin)) {
                player setorigin(spawnorigin);
            }
            if (!isdefined(player)) {
                continue;
            }
            player thread function_e139474e71a93fb0();
            player.br_infilstarted = 1;
            player thread [[ level.parachutetakeweaponscb ]]();
            player.plotarmor = 1;
            if (isdefined(var_f60347f29feec261)) {
                player playerlinkto(var_f60347f29feec261);
                player.c130 = var_f60347f29feec261;
                if (function_60597da56f99d304(player)) {
                    player namespace_f8065cafc523dba5::function_a593971d75d82113();
                    player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_common::forceSpawnPlayers()");
                }
            }
            if (istrue(player.br_iseliminated)) {
                namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player, "forceSpawnPlayers");
            }
            if (isdefined(spawnorigin)) {
                namespace_71073fa38f11492::function_d72afaccedfc946e("onPlayerTeleport", player, prevpos, spawnorigin, "c130");
            }
            player notify("beginC130");
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b24
// Size: 0x56
function private function_e139474e71a93fb0() {
    self endon("disconnect");
    player = self;
    waittillframeend();
    var_dc6bf94dbaaa7056 = getmatchrulesdata("commonOption", "infilArmor");
    infilreserveplates = getmatchrulesdata("commonOption", "infilReservePlates");
    player namespace_f8d3520d3483c1::givestartingarmor(var_dc6bf94dbaaa7056, undefined, infilreserveplates);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b81
// Size: 0x11d
function private function_ec7fe6e7834d5d70() {
    if (namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
        return;
    }
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            teamplayers = getteamdata(team, "players");
            var_fc8439660d24b9c4 = setupbrsquadleader(teamplayers);
            if (isdefined(var_fc8439660d24b9c4)) {
                registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4);
                var_fc8439660d24b9c4 thread watchbrsquadleaderdisconnect(team);
            }
            namespace_d20f8ef223912e12::updatesquadleaderpassstateforteam(team);
        }
    } else {
        foreach (player in level.infilstruct.players) {
            if (isdefined(player)) {
                registerbrsquadleaderjumpcommands(player);
            }
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ca5
// Size: 0x89
function private function_d392b52249d2a8fe() {
    if (namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
        return;
    }
    if (level.teambased) {
        teamplayers = getteamdata(self.team, "players");
        var_fc8439660d24b9c4 = setupbrsquadleader(teamplayers);
        if (isdefined(var_fc8439660d24b9c4)) {
            registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4);
            var_fc8439660d24b9c4 thread watchbrsquadleaderdisconnect(self.team);
        }
        namespace_d20f8ef223912e12::updatesquadleaderpassstateforteam(self.team);
    } else {
        registerbrsquadleaderjumpcommands(self);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d35
// Size: 0x4c
function function_c6dc2c9535e1fac8() {
    function_ec4400561e6be23a();
    function_749c46213cdb834();
    if (isdefined(level.infilstruct.var_477bd548940c3a78)) {
        function_7f3ad8fe6df1b8fe(0.3, level.infilstruct.players, "stateMachine");
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d88
// Size: 0x11
function function_9215bf6c0287802c() {
    self endon("disconnect");
    function_12ccccd25dafe834();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1da0
// Size: 0x70
function function_6cc48d378966bc2f() {
    function_1696e6e3ac4a370a();
    if (!isdefined(level.infilstruct.var_477bd548940c3a78)) {
        function_7f3ad8fe6df1b8fe(1, level.infilstruct.players, "stateMachine");
    }
    if (level.var_7647df14c1f116f7) {
        function_6199c35f4cf4524c(&function_1ef9f2a9d0d8f157);
    } else {
        function_6199c35f4cf4524c(&function_32583056e04e8645);
    }
    function_8d001511b174ef1e();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e17
// Size: 0x84
function function_c1e0d339c6959b81() {
    function_1696e6e3ac4a370a();
    function_7f3ad8fe6df1b8fe(1, level.infilstruct.players, "stateMachine");
    function_6199c35f4cf4524c(&function_6ee3f813b3c2d7af);
    level.infilstruct.c130.animstruct namespace_ecab45ae367735ef::teleporttomovingplane();
    level.br_ac130 setscriptablepartstate("running_lights", "on");
    level.br_ac130 notify("start_moving");
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea2
// Size: 0x11
function function_6ee3f813b3c2d7af() {
    function_1162dbfdb942d179(1, "stateMachine");
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eba
// Size: 0x61
function function_1ef9f2a9d0d8f157() {
    self endon("disconnect");
    self notify("beginC130");
    if (level.var_90481fb292a83c2b == 4) {
        level.infilstruct.c130 waittill("start_moving");
    }
    function_1162dbfdb942d179(1, "stateMachine");
    _freezelookcontrols(0);
    function_423115ed15f21e05(self.team);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f22
// Size: 0x15b
function function_32583056e04e8645() {
    self endon("disconnect");
    self notify("beginC130");
    function_1162dbfdb942d179(1, "stateMachine");
    function_6d8ac534ad288aa5(self);
    _freezelookcontrols(1);
    var_2739b8c6b038ba5e = undefined;
    if (isdefined(level.infilstruct) && isdefined(level.infilstruct.animstruct)) {
        var_2739b8c6b038ba5e = level.infilstruct.animstruct.var_2739b8c6b038ba5e;
    }
    if (isdefined(var_2739b8c6b038ba5e.var_eedb5fb15eb26bfa)) {
        level.infilstruct.animstruct [[ var_2739b8c6b038ba5e.var_eedb5fb15eb26bfa ]](self, var_2739b8c6b038ba5e.var_5ab13b55d7ceff80);
    }
    if (var_2739b8c6b038ba5e.islooping) {
        _freezelookcontrols(0);
        var_2739b8c6b038ba5e function_8839d2f2f530a0b9(self);
        wait(1);
        self cameraunlink();
        self function_8ff8fd7841f6eba2();
        thread namespace_ad389306d44fc6b4::orbitcam(level.infilstruct.c130);
        function_423115ed15f21e05(self.team);
    } else {
        self cameraunlink();
        self function_8ff8fd7841f6eba2();
        var_2739b8c6b038ba5e function_bda88f27a0337eaa(self);
        var_2739b8c6b038ba5e function_8839d2f2f530a0b9(self);
        if (function_60597da56f99d304(self)) {
            namespace_f8065cafc523dba5::function_a593971d75d82113();
            namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_common::state_animatic_playerLateJoin()");
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2084
// Size: 0x15f
function function_2923788bc736bb9e() {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_25a0c882b7e8bb02();
        if (player isplayerheadless()) {
            registerheadlessinfil(player);
        }
    }
    if (isdefined(level.var_c5877dbe60fddbf6)) {
        foreach (codcaster in level.var_c5877dbe60fddbf6) {
            codcaster setclientomnvar("ui_br_infiled", 1);
        }
    }
    level.br_ac130 namespace_71073fa38f11492::runbrgametypefunc("addToC130Infil");
    function_6199c35f4cf4524c(&function_d2540ea30a17f53a);
    setomnvar("ui_in_infil", -1);
    level.infiltransistioning = undefined;
    level.infilcinematicactive = 0;
    namespace_4b0406965e556711::gameflagset("infil_animatic_complete");
    level thread function_c22e838caf108bb0();
    if (isdefined(level.headlessinfilplayers)) {
        level thread function_12d78457edd58de();
    }
    function_9f3146807ea18258();
    level waittill("br_c130_left_bounds");
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21ea
// Size: 0x152
function private function_25a0c882b7e8bb02() {
    self setallstreamloaddist(0);
    namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
    if (!istrue(level.infilstruct.var_eb0e85a583f21b9d)) {
        self setclientdvar(@"hash_df1dc712c4a91588", 65);
        self setclientdvar(@"hash_86bf34d5f48fa435", 65);
        if (!istrue(level.infilstruct.var_12c912ee9672fa1)) {
            self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
        }
        self disablephysicaldepthoffieldscripting();
        setdof_default();
    }
    self.instantclassswapallowed = 1;
    namespace_d19129e4fa5d176::unblockclasschange();
    if (get_int_or_0(self.hidehudenabled) > 0) {
        utility::hidehuddisable();
    }
    self visionsetfadetoblackforplayer("", 1);
    self notify("joining_Infil");
    self.br_infilstarted = 1;
    if (!istrue(level.c130inbounds)) {
        self setclientomnvar("ui_hide_minimap", 1);
    }
    self.health = self.maxhealth;
    self cameraunlink();
    self function_8ff8fd7841f6eba2();
    namespace_ad389306d44fc6b4::spawnplayertoc130();
    playersetupcontrolsforinfil();
    namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("isInInfilPlane", 1);
    level.infilstruct.playersinc130++;
    namespace_d3d40f75bb4e4c32::function_64fa4c213439177f();
    thread playercleanupinfilondisconnect();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2343
// Size: 0x105
function private function_c22e838caf108bb0() {
    namespace_d3d40f75bb4e4c32::brleaderdialog("match_start", 0, level.infilstruct.players, undefined, undefined, undefined, level.brgametype.var_b09b7afe082a9239);
    level thread namespace_ad389306d44fc6b4::waittoplayinfildialog();
    if (istrue(level.brgametype.var_98ade9e8627af484) && isdefined(game["dialog"]["offense_obj"])) {
        var_cb3339ece72dbdeb = namespace_d3d40f75bb4e4c32::function_93550b34f0a49dd9("match_start", level.infilstruct.players[0], level.brgametype.var_b09b7afe082a9239);
        if (isdefined(var_cb3339ece72dbdeb)) {
            var_1499e7c2d69e0074 = lookupsoundlength(var_cb3339ece72dbdeb, 1) / 1000;
            wait(var_1499e7c2d69e0074 + 1);
        }
        namespace_d3d40f75bb4e4c32::brleaderdialog("offense_obj", 0, level.infilstruct.players, undefined, undefined, undefined, level.brgametype.var_b09b7afe082a9239);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244f
// Size: 0x83
function function_d2540ea30a17f53a() {
    self endon("disconnect");
    function_25a0c882b7e8bb02();
    thread watchinfiljumpanim();
    namespace_d3d40f75bb4e4c32::brleaderdialog("match_start", 0, [0:self], undefined, undefined, undefined, level.brgametype.var_b09b7afe082a9239);
    _freezelookcontrols(0);
    self cameraunlink();
    self function_8ff8fd7841f6eba2();
    thread namespace_ad389306d44fc6b4::orbitcam(level.infilstruct.c130);
    function_423115ed15f21e05(self.team);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24d9
// Size: 0xa
function function_abb2b783f6044bb3() {
    function_bee6776dbf711484();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24ea
// Size: 0x39
function private registerheadlessinfil(player) {
    if (!isdefined(level.headlessinfilplayers)) {
        level.headlessinfilplayers = [];
    }
    level.headlessinfilplayers[level.headlessinfilplayers.size] = player;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x252a
// Size: 0xb1
function private function_12d78457edd58de() {
    level endon("game_ended");
    dist = distance(level.br_ac130.pathstruct.startpt, level.br_ac130.pathstruct.endpt);
    time = dist / namespace_ad389306d44fc6b4::getc130speed() / level.headlessinfilplayers.size;
    for (i = 0; i < level.headlessinfilplayers.size; i++) {
        wait(time);
        level.headlessinfilplayers[i] notify("halo_jump_c130");
    }
    level.headlessinfilplayers = undefined;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25e2
// Size: 0xae
function private playersetupcontrolsforinfil(var_a19e18e7cc768828) {
    if (!isdefined(var_a19e18e7cc768828)) {
        var_a19e18e7cc768828 = 0;
    }
    self setclientomnvar("ui_br_infil_started", 1);
    self setclientomnvar("ui_br_infiled", 0);
    if (!var_a19e18e7cc768828) {
        self notifyonplayercommand("halo_jump_c130", "+gostand");
        if (!isbot(self)) {
            self notifyonplayercommand("halo_jump_parachute_c130", "+open_parachute");
        }
    } else {
        self notifyonplayercommand("halo_jump_solo_c130", "+gostand");
        if (!isbot(self)) {
            self notifyonplayercommand("halo_jump_parachute_solo_c130", "+open_parachute");
        }
    }
    self notifyonplayercommand("br_pass_squad_leader", "+usereload");
    self notifyonplayercommand("br_pass_squad_leader", "+activate");
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2697
// Size: 0x79
function private playercleanupinfilondisconnect() {
    level endon("game_ended");
    self endon("death");
    self endon("cancel_c130");
    self endon("br_jump");
    self waittill("disconnect");
    if (isdefined(level.infilstruct) && isdefined(level.infilstruct.playersinc130) && level.infilstruct.playersinc130 > 0) {
        level.infilstruct.playersinc130--;
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2717
// Size: 0x75
function private function_9f3146807ea18258() {
    level.infiljumpentsspawned = 0;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread watchinfiljumpanim();
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2793
// Size: 0x35
function playjumpsoundtosquad() {
    aliasname = "evt_br_infil_squadmate_jump";
    if (namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        aliasname = "evt_br_infil_squad_leader_jump";
    }
    self playsoundtoteam(aliasname, self.team, self);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27cf
// Size: 0x1f
function private function_dd86c05daa1432c3() {
    self endon("disconnect");
    wait(5);
    self setclientdvar(@"hash_b21f1157c582ff15", 1);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27f5
// Size: 0x574
function private watchinfiljumpanim() {
    self endon("death_or_disconnect");
    self.hasspawnweapons = 0;
    self waittill("br_jump");
    if (isdefined(level.infilstruct.var_8d5c19a9b693e913)) {
        self thread [[ level.infilstruct.var_8d5c19a9b693e913 ]]();
    }
    var_a2117ea816a8b7f1 = getdvarint(@"hash_8be4acc5eebb19ca", 1) != 0;
    if (level.infiljumpentsspawned >= 100) {
        var_a2117ea816a8b7f1 = 0;
    }
    var_77b785278f139079 = undefined;
    if (var_a2117ea816a8b7f1) {
        var_77b785278f139079 = 0;
        /#
            assert(isdefined(level.infilstruct.var_ae9e4023110acc6e));
        #/
        var_bffcb26249870cb0 = [[ level.infilstruct.var_ae9e4023110acc6e ]]();
        var_d337825df4506344 = var_bffcb26249870cb0[3];
        var_66809387054fc02a = var_bffcb26249870cb0[2];
        var_4d261ef98868b4e6 = var_bffcb26249870cb0[1];
        var_8dec95713ec1f7ba = var_bffcb26249870cb0[0];
        parentent = level.infilstruct.c130;
        if (isdefined(level.infilstruct.animstruct) && istrue(level.infilstruct.animstruct.var_c978f36e30808108)) {
            parentent = level.infilstruct.animstruct.c130;
        }
        var_9b145eb55513dbb5["parent"] = spawn("script_model", parentent.origin);
        level.infiljumpentsspawned++;
        var_9b145eb55513dbb5["parent"] setmodel("generic_prop_x10");
        var_9b145eb55513dbb5["parent"] forcenetfieldhighlod(1);
        var_9b145eb55513dbb5["parent"] linkto(parentent, "tag_body", (0, 0, 0), (0, 0, 0));
        var_9b145eb55513dbb5[var_d337825df4506344] = spawn("script_model", var_9b145eb55513dbb5["parent"] gettagorigin(var_d337825df4506344));
        level.infiljumpentsspawned++;
        var_9b145eb55513dbb5[var_d337825df4506344] setmodel("tag_player");
        var_9b145eb55513dbb5[var_d337825df4506344] forcenetfieldhighlod(1);
        var_9b145eb55513dbb5[var_d337825df4506344] linkto(var_9b145eb55513dbb5["parent"], var_d337825df4506344, (0, 0, 0), (0, 0, 0));
        self playerlinkto(var_9b145eb55513dbb5[var_d337825df4506344], "tag_player");
        namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
        self playanimscriptsceneevent("scripted_scene", var_66809387054fc02a);
        self.infilanimindex = undefined;
        self.var_db122a8941dfee14 = undefined;
        self playlocalsound("evt_br_infil_jump_stinger");
        playjumpsoundtosquad();
        var_9b145eb55513dbb5["parent"] scriptmodelplayanim(var_8dec95713ec1f7ba, "prop");
        var_7a79e5c326955318 = getanimlength(var_4d261ef98868b4e6);
        var_886f7978500acb10 = 1;
        var_7a79e5c326955318 = max(var_7a79e5c326955318, var_886f7978500acb10 + 0.1);
        wait(var_7a79e5c326955318 - var_886f7978500acb10);
        self cameradefault();
        if (isdefined(level.infilstruct.var_dc0bc83a31193177)) {
            self thread [[ level.infilstruct.var_dc0bc83a31193177 ]]();
        }
        thread function_dd86c05daa1432c3();
        wait(var_886f7978500acb10);
        foreach (ent in var_9b145eb55513dbb5) {
            ent delete();
            level.infiljumpentsspawned--;
        }
    } else {
        var_77b785278f139079 = 1;
        waittillframeend();
        thread function_dd86c05daa1432c3();
    }
    self.infilanimindex = undefined;
    self.var_db122a8941dfee14 = undefined;
    self.var_3dad98a9e686fb = undefined;
    self stopanimscriptsceneevent();
    self notify("infil_jump_done");
    namespace_d20f8ef223912e12::playerexecutionsenable();
    namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("br_infil");
    if (var_77b785278f139079) {
        waitframe();
        if (isdefined(level.infilstruct.c130)) {
            if (isdefined(level.infilstruct.c130.playeroffsets) && isdefined(level.infilstruct.c130.currentplayeroffset)) {
                offset = level.infilstruct.c130.playeroffsets[level.infilstruct.c130.currentplayeroffset];
                self setorigin(level.infilstruct.c130.origin + offset, 1, 1);
                level.infilstruct.c130.currentplayeroffset++;
                if (level.infilstruct.c130.currentplayeroffset == level.infilstruct.c130.playeroffsets.size) {
                    level.infilstruct.c130.currentplayeroffset = 0;
                }
                namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
                playjumpsoundtosquad();
                if (isdefined(level.infilstruct.var_dc0bc83a31193177)) {
                    self thread [[ level.infilstruct.var_dc0bc83a31193177 ]]();
                }
            }
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d70
// Size: 0x1c5
function private function_b599ea9ce3625a9d(players) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        var_e478ac91af0e92cb = player getlinkedchildren();
        if (isdefined(var_e478ac91af0e92cb) && var_e478ac91af0e92cb.size) {
            numchildren = var_e478ac91af0e92cb.size;
            if (numchildren > 0) {
                message = "Infil Player (" + player.name + ") with (" + numchildren + ") linked ents: ";
                foreach (var_6c82d947757d13d6 in var_e478ac91af0e92cb) {
                    var_8ee353d273e5b1d4 = var_6c82d947757d13d6 function_67ea74bab288a2b5();
                    if (isdefined(var_8ee353d273e5b1d4) && var_8ee353d273e5b1d4.size > 0) {
                        message = message + "stack:" + var_8ee353d273e5b1d4 + ",";
                    }
                    if (isdefined(var_6c82d947757d13d6.equipmentref)) {
                        message = message + "equip:" + var_6c82d947757d13d6.equipmentref + ",";
                    } else if (isdefined(var_6c82d947757d13d6.weapon_name)) {
                        message = message + "weapon:" + var_6c82d947757d13d6.weapon_name + ",";
                    } else if (isdefined(var_6c82d947757d13d6.model)) {
                        message = message + "model:" + var_6c82d947757d13d6.model + ",";
                    } else {
                        message = message + "?,";
                    }
                }
                namespace_9c840bb9f2ecbf00::demoforcesre(message);
            }
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f3c
// Size: 0x200
function private function_1696e6e3ac4a370a() {
    if (isdefined(level.var_9d615a366ec2fb6f)) {
        level.var_9d615a366ec2fb6f = undefined;
    }
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player notify("beginC130");
        player namespace_80cec6cfc70c4f95::function_fd357ca89e5e29d9();
        var_e478ac91af0e92cb = player getlinkedchildren();
        foreach (var_6c82d947757d13d6 in var_e478ac91af0e92cb) {
            if (isdefined(var_6c82d947757d13d6.equipmentref) && var_6c82d947757d13d6.equipmentref == "equip_molotov") {
                player namespace_df478cc572a311d3::molotov_clear_burning(1);
                var_6c82d947757d13d6 delete();
            } else if (isdefined(var_6c82d947757d13d6.equipmentref) && var_6c82d947757d13d6.equipmentref == "equip_thermite") {
                var_6c82d947757d13d6 thread namespace_8a5c6d833b2eeab1::thermite_destroy(1);
            } else if (isdefined(var_6c82d947757d13d6.equipmentref) && var_6c82d947757d13d6.equipmentref == "equip_shockstick") {
                var_6c82d947757d13d6 thread namespace_742e7eca5294ecdc::function_c44b639f5005afa(1);
            }
        }
    }
    if (isdefined(level.throwingknives)) {
        foreach (throwingknife in level.throwingknives) {
            if (isdefined(throwingknife)) {
                throwingknife thread namespace_eb0feb5c721a9f11::throwing_knife_deletepickup();
            }
        }
    }
    function_b599ea9ce3625a9d(level.infilstruct.players);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3143
// Size: 0x2f
function private function_1b7e57bfe648f609() {
    var_4f105563ca74cf73 = level.infilstruct.var_477bd548940c3a78;
    if (!isdefined(var_4f105563ca74cf73)) {
        return;
    }
    self preloadcinematicforplayer(var_4f105563ca74cf73);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3179
// Size: 0xa4
function private function_ec4400561e6be23a() {
    var_4f105563ca74cf73 = level.infilstruct.var_477bd548940c3a78;
    if (!isdefined(var_4f105563ca74cf73)) {
        return;
    }
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player playcinematicforplayer(var_4f105563ca74cf73);
        player setclientomnvar("ui_br_bink_overlay_state", 3);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3224
// Size: 0x49
function private function_12ccccd25dafe834() {
    var_4f105563ca74cf73 = level.infilstruct.var_477bd548940c3a78;
    if (!isdefined(var_4f105563ca74cf73)) {
        return;
    }
    self setplayermusicstate("");
    self playcinematicforplayer(var_4f105563ca74cf73);
    self setclientomnvar("ui_br_bink_overlay_state", 3);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3274
// Size: 0x53
function infilvideocompletecallback(channel, val) {
    if (istrue(self.var_20a6defc94783931)) {
        return;
    }
    if (channel == "bink_complete") {
        level notify("play_video_complete");
        self setclientomnvar("ui_br_bink_overlay_state", 0);
        self stopcinematicforplayer();
        self.var_20a6defc94783931 = 1;
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32ce
// Size: 0xc3
function private function_749c46213cdb834() {
    var_4f105563ca74cf73 = level.infilstruct.var_477bd548940c3a78;
    if (!isdefined(var_4f105563ca74cf73)) {
        return;
    }
    /#
        assert(isdefined(level.infilstruct.var_10d27b439af13a2a));
    #/
    wait(level.infilstruct.var_10d27b439af13a2a);
    foreach (player in level.infilstruct.players) {
        player setclientomnvar("ui_br_bink_overlay_state", 0);
        player stopcinematicforplayer();
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3398
// Size: 0x11b
function private function_19ea8f6d547dc8bc(player) {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    cameraent = self.var_2336099a20080602.ent;
    cameratag = undefined;
    if (isfunction(self.var_2336099a20080602.var_e6783d526b4a7212)) {
        cameratag = self [[ self.var_2336099a20080602.var_e6783d526b4a7212 ]](player);
    } else if (isarray(self.var_2336099a20080602.var_e6783d526b4a7212)) {
        /#
            assert(isdefined(player.infilanimindex) && player.infilanimindex <= self.var_2336099a20080602.var_e6783d526b4a7212.size);
        #/
        cameratag = self.var_2336099a20080602.var_e6783d526b4a7212[player.infilanimindex - 1];
    } else {
        cameratag = self.var_2336099a20080602.var_e6783d526b4a7212;
    }
    return [0:cameraent, 1:cameratag];
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34bb
// Size: 0x2a
function private function_ff03e352a5746185() {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    return isdefined(self.var_2336099a20080602.var_437b6bb41d98df26);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34ed
// Size: 0x125
function private function_bda88f27a0337eaa(player, var_e45f1cd8436c9aa9) {
    var_c017436249a4749d = function_19ea8f6d547dc8bc(player);
    cameratag = var_c017436249a4749d[1];
    cameraent = var_c017436249a4749d[0];
    if (function_ff03e352a5746185()) {
        if (!istrue(var_e45f1cd8436c9aa9)) {
            var_437b6bb41d98df26 = self.var_2336099a20080602.var_437b6bb41d98df26;
            if (isdefined(self.var_2336099a20080602.var_75a7646007505356)) {
                var_437b6bb41d98df26 = self [[ self.var_2336099a20080602.var_75a7646007505356 ]](player);
            }
            player cameraunlink();
            var_f09380914f6e8c79 = ter_op(istrue(level.var_8cf2b3f6bd2bf0e6), function_676cfe2ab64ea758() * 0.001, undefined);
            if (level.infilstruct.var_3772737101aa4af) {
                player function_cebd47970f60e9b(var_437b6bb41d98df26, 0, cameraent, cameratag, var_f09380914f6e8c79, 1, 1, 1);
            } else {
                player function_cebd47970f60e9b(var_437b6bb41d98df26, 0, cameraent, cameratag, var_f09380914f6e8c79, 1);
            }
        }
    } else {
        player function_8ff8fd7841f6eba2();
        player cameralinkto(cameraent, cameratag, 1, 1);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3619
// Size: 0x6b
function private function_78dfe475a5d4f843(player) {
    var_c017406249a46e04 = function_19ea8f6d547dc8bc(player);
    cameratag = var_c017406249a46e04[1];
    cameraent = var_c017406249a46e04[0];
    var_3df9d9a1027fb9bc = cameraent gettagorigin(cameratag);
    cameraangles = cameraent gettagangles(cameratag);
    return [0:var_3df9d9a1027fb9bc, 1:cameraangles];
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x368c
// Size: 0x4a
function private function_347d56feb29d7f74() {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    if (function_ff03e352a5746185()) {
        return self.var_2336099a20080602.var_8355076d4ed3fc96;
    } else {
        return self.var_2336099a20080602.animlength;
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36dd
// Size: 0x192
function private function_8839d2f2f530a0b9(player) {
    /#
        assert(isdefined(player.infilanimindex) && player.infilanimindex <= self.playerpositions.size);
    #/
    linkent = self.playerpositions[player.infilanimindex - 1].ent;
    animname = self.playerpositions[player.infilanimindex - 1].animname;
    if (istrue(level.var_5338013d30a283c8)) {
        if (isdefined(self.playerpositions[player.infilanimindex - 1].var_1fc8efb020e9a71d)) {
            if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.gender) && player.operatorcustomization.gender == "female") {
                animname = self.playerpositions[player.infilanimindex - 1].var_1fc8efb020e9a71d;
            }
        }
    }
    var_5934ae37f5ed079c = 0;
    var_569b6c130acd3daa = player.var_4b72faf29b9b511a;
    if (!isdefined(var_569b6c130acd3daa) || var_569b6c130acd3daa != linkent) {
        var_5934ae37f5ed079c = 1;
    }
    if (var_5934ae37f5ed079c) {
        player playerlinkto(linkent, "tag_player");
        player.var_4b72faf29b9b511a = linkent;
    }
    player playanimscriptsceneevent("scripted_scene", animname);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3876
// Size: 0x76
function private unfreezeplayercontrols(delaytime) {
    wait(delaytime);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player _freezelookcontrols(0);
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38f3
// Size: 0xac2
function private function_1c3d2f575360d8fa(var_df94e780c2b3c994) {
    self endon("stopScene");
    level.infilstruct.animstruct = self;
    level.infilstruct.var_df94e780c2b3c994 = var_df94e780c2b3c994;
    self.var_2739b8c6b038ba5e = undefined;
    level.infilstruct.var_3772737101aa4af = function_53c4c53197386572(self.var_3772737101aa4af, 0);
    var_e49a1c04ac964563 = 0;
    /#
        var_e49a1c04ac964563 = function_c43d732289ecf3e8();
    #/
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        function_6d8ac534ad288aa5(player);
        player _freezelookcontrols(1);
        player.var_3dad98a9e686fb = 1;
    }
    if (level.infilstruct.var_3772737101aa4af) {
        self.var_e73ce295ae9d4104 val::set("br_infil", "cinematics_participant", 1);
    }
    foreach (pack in self.packs) {
        self.var_2739b8c6b038ba5e = pack;
        /#
            if (istrue(var_df94e780c2b3c994)) {
                iprintlnbold("br_infils_common::playInfilSequence()" + pack.anime);
            }
        #/
        if (pack.islooping) {
            function_583f118c4064ca21(level.infilstruct.players);
        }
        if (isdefined(pack.fov)) {
            allplayers_setfov(pack.fov);
        } else {
            function_cf47ab3f9defe35b();
        }
        if (isdefined(pack.fstop) && isdefined(pack.var_ed8206fef1806fef)) {
            allplayers_setphysicaldof(pack.fstop, pack.var_ed8206fef1806fef, pack.focusspeed, pack.aperturespeed, pack.var_c06551440b16249c);
        }
        if (isdefined(pack.startfunc)) {
            [[ pack.startfunc ]](pack.var_c65bb75cce61100f);
        }
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(pack.var_eedb5fb15eb26bfa)) {
                [[ pack.var_eedb5fb15eb26bfa ]](player, pack.var_5ab13b55d7ceff80);
            }
            if (!namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() || !pack.islooping) {
                player cameraunlink();
                player function_8ff8fd7841f6eba2();
                pack function_bda88f27a0337eaa(player);
            }
        }
        if (isdefined(pack.fx)) {
            playfx(getfx(pack.fx), pack.fxorigin, anglestoforward(pack.fxangles), anglestoup(pack.fxangles));
        }
        pack.ents = array_removeundefined(pack.ents);
        foreach (ent in pack.ents) {
            var_f09380914f6e8c79 = ter_op(istrue(level.var_8cf2b3f6bd2bf0e6), function_676cfe2ab64ea758() * 0.001, undefined);
            if (level.infilstruct.var_3772737101aa4af) {
                ent val::set("br_infil", "cinematics_participant", 1);
                ent scriptmodelplayanim(level.scr_anim[ent.animname][pack.anime], ent.animname, var_f09380914f6e8c79, 1, "none");
            } else {
                if (!istrue(ent.var_6a704063a0555c1d)) {
                    ent dontinterpolate();
                }
                ent scriptmodelplayanim(level.scr_anim[ent.animname][pack.anime], ent.animname, var_f09380914f6e8c79);
            }
            ent thread namespace_b5a115f53b441ef5::start_notetrack_wait(ent, ent.animname, pack.anime, ent.animname, level.scr_anim[ent.animname][pack.anime]);
        }
        foreach (rig in pack.var_5ba8db57a9811d96) {
            foreach (probe in rig.probes) {
                origin_offset = probe.origin_offset;
                angles_offset = probe.angles_offset;
                if (!isdefined(angles_offset)) {
                    angles_offset = (0, 0, 0);
                }
                probe show();
                probe linkto(rig.linkent, "tag_origin", origin_offset, angles_offset);
            }
            foreach (light in rig.lights) {
                if (isdefined(light.original_intensity)) {
                    light setlightintensity(light.original_intensity);
                }
                origin_offset = light.origin_offset;
                angles_offset = light.angles_offset;
                if (!isdefined(angles_offset)) {
                    angles_offset = (0, 0, 0);
                }
                light linkto(rig.linkent, "tag_origin", origin_offset, angles_offset);
            }
        }
        var_2246d8f267e2c3de = 0;
        var_2119f74ea52e3c92 = 4;
        /#
            var_2119f74ea52e3c92 = function_d8220f4960da76cd();
        #/
        pack.var_3bd5282b118d27f8 = array_removeundefined(pack.var_3bd5282b118d27f8);
        foreach (var_10727dcc51c74547 in pack.var_3bd5282b118d27f8) {
            var_f09380914f6e8c79 = ter_op(istrue(level.var_8cf2b3f6bd2bf0e6), function_676cfe2ab64ea758() * 0.001, undefined);
            if (level.infilstruct.var_3772737101aa4af) {
                var_10727dcc51c74547 val::set("br_infil", "cinematics_participant", 1);
                var_10727dcc51c74547 scriptmodelplayanim(level.scr_anim[var_10727dcc51c74547.animname][pack.anime], var_10727dcc51c74547.animname, var_f09380914f6e8c79, 1, "none");
            } else {
                var_10727dcc51c74547 dontinterpolate();
                var_10727dcc51c74547 scriptmodelplayanim(level.scr_anim[var_10727dcc51c74547.animname][pack.anime], var_10727dcc51c74547.animname, var_f09380914f6e8c79);
            }
            if (var_e49a1c04ac964563) {
                if (!isdefined(pack.var_a39842bcdfc531c2)) {
                    if (var_2246d8f267e2c3de < var_2119f74ea52e3c92) {
                        var_10727dcc51c74547 show();
                    } else {
                        var_10727dcc51c74547 hide();
                    }
                }
            } else {
                var_10727dcc51c74547 hide();
            }
            var_2246d8f267e2c3de++;
        }
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (level.infilstruct.var_3772737101aa4af) {
                player val::set("br_infil", "cinematics_participant", 1);
            }
            pack function_8839d2f2f530a0b9(player);
            if (var_e49a1c04ac964563) {
                if (function_60597da56f99d304(player)) {
                    player namespace_f8065cafc523dba5::function_a593971d75d82113();
                    player namespace_f8065cafc523dba5::function_379bb555405c16bb("br_infils_common::playInfilSequence()");
                }
            }
        }
        if (pack.islooping) {
            break;
        }
        animlength = pack function_347d56feb29d7f74();
        waitandpause(animlength);
    }
    wait(1);
    if (!istrue(level.infilstruct.var_eb0e85a583f21b9d)) {
        allplayers_clearphysicaldof();
        function_cf47ab3f9defe35b();
    }
    if (level.infilstruct.var_3772737101aa4af) {
        foreach (player in level.infilstruct.players) {
            player val::reset("br_infil", "cinematics_participant");
            if (isdefined(player.var_4b72faf29b9b511a)) {
                player.var_4b72faf29b9b511a = undefined;
            }
        }
    }
    /#
        if (getdvarint(@"hash_187e8c5233803ac8", 0)) {
            thread function_b0f7742c6d38dbd1();
        } else if (istrue(var_df94e780c2b3c994)) {
            foreach (player in level.infilstruct.players) {
                if (!isdefined(player)) {
                    continue;
                }
                player cameraunlink();
                player function_8ff8fd7841f6eba2();
                player namespace_ad389306d44fc6b4::orbitcam(level.br_ac130);
            }
        }
    #/
    level thread unfreezeplayercontrols(1.2);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43bc
// Size: 0x1a2
function private function_8b74f71235297593(var_df94e780c2b3c994) {
    level.infilstruct.animstruct = self;
    level.infilstruct.var_df94e780c2b3c994 = var_df94e780c2b3c994;
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        function_6d8ac534ad288aa5(player);
        player _freezelookcontrols(1);
    }
    if (isdefined(level.infilstruct.var_c7e1f8034a6cca31)) {
        [[ level.infilstruct.var_c7e1f8034a6cca31 ]](self);
    }
    if (!istrue(level.infilstruct.var_eb0e85a583f21b9d)) {
        allplayers_clearphysicaldof();
        function_cf47ab3f9defe35b();
    }
    /#
        if (getdvarint(@"hash_187e8c5233803ac8", 0)) {
            thread function_b0f7742c6d38dbd1();
        } else if (istrue(var_df94e780c2b3c994)) {
            foreach (player in level.infilstruct.players) {
                if (!isdefined(player)) {
                    continue;
                }
                player cameraunlink();
                player function_8ff8fd7841f6eba2();
                player namespace_ad389306d44fc6b4::orbitcam(level.br_ac130);
            }
        }
    #/
    level thread unfreezeplayercontrols(1.2);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4565
// Size: 0x337
function function_b0f7742c6d38dbd1() {
    /#
        transitiontime = 1;
        wait(transitiontime);
        c130 = self.movingc130;
        if (!isdefined(c130)) {
            c130 = self.c130;
        }
        var_4a64c51edab7d63b = anglestoaxis(c130.angles);
        var_ca8604d07949e4ec = -1 * var_4a64c51edab7d63b["<unknown string>"];
        var_f8ff5945440f4cdb = var_4a64c51edab7d63b["<unknown string>"];
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            var_15314da30b44470 = player.infilanimindex - 1;
            /#
                assert(isdefined(self.var_2739b8c6b038ba5e));
            #/
            var_c012b162499f3db0 = self.var_2739b8c6b038ba5e function_78dfe475a5d4f843(player);
            cameraangles = var_c012b162499f3db0[1];
            var_3df9d9a1027fb9bc = var_c012b162499f3db0[0];
            baseorigin = player getvieworigin();
            playerangles = player getplayerangles();
            var_14d9d4fffc09a76d = anglestoaxis(playerangles);
            var_b7034ef67b8ca88d = var_3df9d9a1027fb9bc;
            var_5a5ade6f6717ebc2 = anglestoforward(cameraangles);
            var_fad8ba79dadaf9ee = (var_5a5ade6f6717ebc2[0] * -1, var_5a5ade6f6717ebc2[1] * -1, 0);
            var_fad8ba79dadaf9ee = vectornormalize(var_fad8ba79dadaf9ee);
            denominator = vectordot(var_fad8ba79dadaf9ee, var_5a5ade6f6717ebc2);
            difference = baseorigin - var_b7034ef67b8ca88d;
            t = vectordot(difference, var_fad8ba79dadaf9ee) / denominator;
            result = var_b7034ef67b8ca88d + t * var_5a5ade6f6717ebc2;
            offset = result - baseorigin;
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + offset[0] + "<unknown string>" + offset[1] + "<unknown string>" + offset[2] + "<unknown string>");
            var_47293b1e94ff8fb0 = baseorigin + var_ca8604d07949e4ec * offset[0] + var_f8ff5945440f4cdb * offset[2];
            var_ac59002aa0721741 = distance(var_3df9d9a1027fb9bc, var_47293b1e94ff8fb0);
            var_cf201622a9fd5646 = var_47293b1e94ff8fb0 - var_3df9d9a1027fb9bc;
            var_cf201622a9fd5646 = vectornormalize(var_cf201622a9fd5646);
            var_abdc396b57c7f955 = vectordot(var_5a5ade6f6717ebc2, var_cf201622a9fd5646);
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + var_ac59002aa0721741 + "<unknown string>" + var_abdc396b57c7f955 + "<unknown string>");
            var_4200398f14c8db5 = var_3df9d9a1027fb9bc - var_47293b1e94ff8fb0;
            var_629f52c3d96c0cb9 = length(var_4200398f14c8db5);
            var_867d9818ce7f2161 = acos(var_4200398f14c8db5[2] / var_629f52c3d96c0cb9);
            println("<unknown string>" + var_15314da30b44470 + "<unknown string>" + var_629f52c3d96c0cb9 + "<unknown string>" + var_867d9818ce7f2161 + "<unknown string>");
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48a3
// Size: 0x3a
function function_475fe383999c5286() {
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.var_662efe6105e9f585)) {
        return;
    }
    if (isdefined(self.innards)) {
        self.innards delete();
    }
    self delete();
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48e4
// Size: 0x280
function cleanupents() {
    foreach (pack in self.packs) {
        pack.var_3bd5282b118d27f8 = array_removeundefined(pack.var_3bd5282b118d27f8);
        foreach (var_10727dcc51c74547 in pack.var_3bd5282b118d27f8) {
            var_10727dcc51c74547 function_475fe383999c5286();
        }
        pack.playerpositions = array_removeundefined(pack.playerpositions);
        foreach (var_460f06fb83940b20 in pack.playerpositions) {
            if (isdefined(var_460f06fb83940b20.ent)) {
                var_460f06fb83940b20.ent function_475fe383999c5286();
            }
        }
        pack.playerpositions = [];
        pack.ents = array_removeundefined(pack.ents);
        foreach (ent in pack.ents) {
            if (isdefined(ent.linkedents)) {
                array_delete(ent.linkedents);
            }
            ent function_475fe383999c5286();
        }
        pack.var_fb299adfd0f8bfc5 = array_removeundefined(pack.var_fb299adfd0f8bfc5);
        foreach (ent in pack.var_fb299adfd0f8bfc5) {
            if (isdefined(ent.linkedents)) {
                array_delete(ent.linkedents);
            }
            ent function_475fe383999c5286();
        }
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b6b
// Size: 0x26
function private function_7812117b17c4d21e() {
    var_3c0f86a5d66ac462 = "ac130";
    scenetype = function_56d92ab945808b50(var_3c0f86a5d66ac462);
    return scenetype;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b99
// Size: 0x32
function private function_56d92ab945808b50(var_8508980407dc317b) {
    scenetype = getdvar(@"hash_2f5821f46995d1e2");
    if (scenetype != "") {
        return scenetype;
    }
    return var_8508980407dc317b;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bd3
// Size: 0x112
function private function_fe85c23fc6fa8c2() {
    level.infilstruct.var_e7c7de60a5ea2f52 = [];
    level.infilstruct.var_477bd548940c3a78 = undefined;
    scenetype = function_7812117b17c4d21e();
    switch (scenetype) {
    case #"hash_1136bc3322c0a548":
        level.var_7647df14c1f116f7 = 0;
        namespace_5c75c180befb8e98::init();
        break;
    case #"hash_5428ebdaaca96e36":
        level.var_7647df14c1f116f7 = 0;
        namespace_6b61356959df5986::init();
        break;
    case #"hash_ee578a15ca8b126d":
        level.var_7647df14c1f116f7 = 1;
        namespace_3c940a00e48e77dd::init();
        break;
    case #"hash_a9257f2a837c6176":
        level.var_7647df14c1f116f7 = 0;
        namespace_8229c5f55435b3e6::init();
        break;
    case #"hash_b730c3301d705212":
        level.var_7647df14c1f116f7 = 0;
        namespace_d8d4c267054a30a2::init();
        break;
    case #"hash_a9f638b560f8481f":
    default:
        level.var_7647df14c1f116f7 = 0;
        namespace_ecab45ae367735ef::init();
        break;
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cec
// Size: 0x63
function function_8252134bb4aaa66b() {
    /#
        assert(isdefined(level.infilstruct.c130));
    #/
    animstruct = function_55f2480b4b819aea(level.infilstruct.c130);
    level.infilstruct.c130.animstruct = animstruct;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d56
// Size: 0x98
function function_8d001511b174ef1e() {
    level.infilstruct.var_1cf4fe3c9d7da8a2 = 1;
    /#
        assert(isdefined(level.infilstruct.c130.animstruct));
    #/
    if (istrue(level.var_7647df14c1f116f7)) {
        level.infilstruct.c130.animstruct function_8b74f71235297593();
    } else {
        level.infilstruct.c130.animstruct function_1c3d2f575360d8fa();
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4df5
// Size: 0x3f
function function_55f2480b4b819aea(movingc130) {
    /#
        assert(isdefined(level.infilstruct.var_b381e33e977da440));
    #/
    return [[ level.infilstruct.var_b381e33e977da440 ]](movingc130);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e3c
// Size: 0x1b
function private function_c03893a40366ed07() {
    level.var_16da1e546dc92a4c = [];
    level.brlatespawnplayer = &latespawnplayer;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e5e
// Size: 0xd
function private function_bee6776dbf711484() {
    level.var_16da1e546dc92a4c = undefined;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e72
// Size: 0x1d
function private function_c69c9cf4ab75a1ef() {
    return isdefined(level.var_16da1e546dc92a4c) && level.var_16da1e546dc92a4c.size > 0;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e97
// Size: 0x27
function private missedinfilplayerhandler() {
    self.br_infilstarted = 1;
    namespace_cb965d2f71fefddc::addrespawntoken(1);
    namespace_47fd1e79a44628cd::playergulagautowin("missedInfil", undefined, undefined, 1);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ec5
// Size: 0x271
function private function_7e1bbc382ad810f9() {
    self endon("disconnect");
    self.br_isininfil = 0;
    self.br_infilstarted = 1;
    isuibot = namespace_d20f8ef223912e12::function_7dbb8165d792b06c();
    if (!namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
        teamplayers = getteamdata(self.team, "players");
        if (!isdefined(teamplayers) || teamplayers.size == 0) {
            teamplayers = [0:self];
        }
        setupbrsquadleader(teamplayers);
    }
    self setallstreamloaddist(0);
    self clearpredictedstreampos();
    if (isdefined(self.var_cd09849e16631c71)) {
        foreach (overlay in self.var_cd09849e16631c71) {
            if (isdefined(overlay)) {
                overlay destroy();
            }
        }
        self.var_cd09849e16631c71 = undefined;
    }
    self setclientdvar(@"hash_b21f1157c582ff15", 1);
    namespace_f8065cafc523dba5::function_6fb380927695ee76();
    namespace_f8065cafc523dba5::function_985b0973f29da4f8("br_infils_common::lateSpawnPlayerAfterInfil()");
    self.plotarmor = 0;
    _freezelookcontrols(0, 1);
    self cameraunlink();
    self function_8ff8fd7841f6eba2();
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_86bf34d5f48fa435", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    self disablephysicaldepthoffieldscripting();
    setdof_default();
    if (isdefined(self.hidehudenabled) && self.hidehudenabled > 0) {
        utility::hidehuddisable();
    }
    self visionsetfadetoblackforplayer("", 1);
    self visionsetnakedforplayer("", 1);
    namespace_d3d40f75bb4e4c32::function_64fa4c213439177f();
    if (!isalive(self)) {
        if (getdvarint(@"hash_25ad2925d6075c8f", 0) == 2 && isbot(self) && !isuibot) {
            self.jumped = 1;
            namespace_99ac021a7547cae3::addtoalivecount("lateSpawn");
        }
        if (isuibot) {
            thread namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
        } else {
            thread missedinfilplayerhandler();
        }
    } else {
        /#
            assertmsg("This shouldn't happen because lateSpawnPlayerAfterInfil() will only be called once!");
        #/
    }
    if (!isbot(self)) {
        setwind("1");
    }
    self setclientomnvar("ui_br_transition_type", 0);
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513d
// Size: 0xc6
function latespawnplayer() {
    if (!function_c69c9cf4ab75a1ef()) {
        function_7e1bbc382ad810f9();
        return;
    }
    /#
        assert(isdefined(level.infilstruct.players));
    #/
    if (array_contains(level.infilstruct.players, self)) {
        return;
    }
    var_f30707d99174cdc6 = 0;
    while (var_f30707d99174cdc6 < level.var_16da1e546dc92a4c.size) {
        func = level.var_16da1e546dc92a4c[var_f30707d99174cdc6];
        self [[ func ]]();
        var_f30707d99174cdc6++;
        if (!function_c69c9cf4ab75a1ef()) {
            function_7e1bbc382ad810f9();
            return;
        }
    }
    level.infilstruct.players[level.infilstruct.players.size] = self;
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x520a
// Size: 0x3c
function function_60597da56f99d304(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (getdvarint(@"hash_ad78f0f19c8707ab", 1) == 1) {
        return isdefined(player.c130);
    } else {
        return 1;
    }
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x524d
// Size: 0x20
function private function_3e9deb911031fc08() {
    /#
        level.var_ca629cf434263639 = 0;
        thread function_710d2b779609907d();
        thread function_b51365f787d44355();
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5274
// Size: 0x143
function private function_c5c00974981e6e90() {
    /#
        level.var_ca629cf434263639 = undefined;
        self notify("<unknown string>");
        foreach (player in level.players) {
            player _freezelookcontrols(0);
            player cameradefault();
            player cameraunlink();
            player function_8ff8fd7841f6eba2();
            player lerpfov(65, 0.5);
            if (istrue(player.var_1f0a019572c9f8e2)) {
                player disablephysicaldepthoffieldscripting();
                player setdof_default();
                player.var_1f0a019572c9f8e2 = undefined;
            }
        }
        wait(1);
        foreach (player in level.players) {
            player setclientdvar(@"hash_df1dc712c4a91588", 65);
            player setclientdvar(@"hash_86bf34d5f48fa435", 65);
            player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
        }
        cleanupents();
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x53be
// Size: 0x303
function private function_710d2b779609907d() {
    /#
        self endon("<unknown string>");
        hostplayer = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        while (1) {
            level.var_ca629cf434263639 = 0;
            while (hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(self.var_2739b8c6b038ba5e)) {
                self.var_2739b8c6b038ba5e.ents = array_removeundefined(self.var_2739b8c6b038ba5e.ents);
                foreach (ent in self.var_2739b8c6b038ba5e.ents) {
                    ent scriptmodelpauseanim(1);
                }
                self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8 = array_removeundefined(self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8);
                foreach (var_10727dcc51c74547 in self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8) {
                    var_10727dcc51c74547 scriptmodelpauseanim(1);
                }
                if (self.var_2739b8c6b038ba5e function_ff03e352a5746185()) {
                    hostplayer function_a37d805bcda4d0d2(1);
                }
            }
            level.var_ca629cf434263639 = 1;
            while (hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(self.var_2739b8c6b038ba5e)) {
                self.var_2739b8c6b038ba5e.ents = array_removeundefined(self.var_2739b8c6b038ba5e.ents);
                foreach (ent in self.var_2739b8c6b038ba5e.ents) {
                    ent scriptmodelpauseanim(0);
                }
                self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8 = array_removeundefined(self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8);
                foreach (var_10727dcc51c74547 in self.var_2739b8c6b038ba5e.var_3bd5282b118d27f8) {
                    var_10727dcc51c74547 scriptmodelpauseanim(0);
                }
                if (self.var_2739b8c6b038ba5e function_ff03e352a5746185()) {
                    hostplayer function_a37d805bcda4d0d2(0);
                }
            }
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56c8
// Size: 0x1a0
function function_b51365f787d44355() {
    /#
        self endon("<unknown string>");
        hostplayer = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        while (1) {
            while (!hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            hostplayer namespace_f8065cafc523dba5::function_6fb380927695ee76();
            hostplayer namespace_f8065cafc523dba5::function_985b0973f29da4f8("<unknown string>");
            hostplayer cameraunlink();
            hostplayer disablephysicaldepthoffieldscripting();
            hostplayer cameradefault();
            hostplayer _freezelookcontrols(0);
            if (isdefined(self.var_2739b8c6b038ba5e)) {
                var_ec8d4d27d5467c43 = self.var_2739b8c6b038ba5e function_78dfe475a5d4f843(hostplayer);
                cameraangles = var_ec8d4d27d5467c43[1];
                var_3df9d9a1027fb9bc = var_ec8d4d27d5467c43[0];
                var_ec2e75eacaecc5a6 = var_3df9d9a1027fb9bc + (0, 0, -60);
                var_a6fd7eae18e63f8 = cameraangles;
                hostplayer setorigin(var_ec2e75eacaecc5a6);
                hostplayer setplayerangles(var_a6fd7eae18e63f8);
            }
            if (!hostplayer isufo()) {
                hostplayer ufo();
            }
            setdvar(@"hash_f94addedc8e87b69", 2);
            while (hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (hostplayer isufo()) {
                hostplayer ufo();
            }
            setdvar(@"hash_f94addedc8e87b69", 0);
            if (isdefined(self.var_2739b8c6b038ba5e)) {
                self.var_2739b8c6b038ba5e function_bda88f27a0337eaa(hostplayer, 1);
            }
            hostplayer namespace_f8065cafc523dba5::function_a593971d75d82113();
            hostplayer namespace_f8065cafc523dba5::function_379bb555405c16bb("<unknown string>");
            hostplayer enablephysicaldepthoffieldscripting();
            while (hostplayer buttonpressed("<unknown string>")) {
                waitframe();
            }
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x586f
// Size: 0x48
function private function_9384c9ed097bf7b9(player, var_1131de9c9b830e78) {
    /#
        while (player buttonpressed(var_1131de9c9b830e78) && function_136f4218b1d719b9()) {
            waitframe();
        }
        while (!player buttonpressed(var_1131de9c9b830e78) && function_136f4218b1d719b9()) {
            waitframe();
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x58be
// Size: 0xd2
function private function_a93a090c732f587b() {
    /#
        c130pathstruct = undefined;
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("<unknown string>")) {
            c130pathstruct = namespace_71073fa38f11492::runbrgametypefunc("<unknown string>");
        } else {
            c130pathstruct = namespace_ad389306d44fc6b4::createtestc130path(undefined, undefined);
        }
        level.infilstruct.c130pathstruct = c130pathstruct;
        namespace_ad389306d44fc6b4::spawnc130(level.infilstruct.var_fd05dc031a2e7283, level.infilstruct.var_30e653e12f358438, level.infilstruct.var_c3a4f4442070a8b5, level.infilstruct.c130pathstruct, level.infilstruct.var_a6547e85663b3bc2);
        level.infilstruct.c130 = level.br_ac130;
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5997
// Size: 0x7a
function private function_f50b1941591d7479() {
    /#
        if (isdefined(level.infilstruct.c130)) {
            if (isdefined(level.infilstruct.c130.innards)) {
                level.infilstruct.c130.innards delete();
            }
            level.infilstruct.c130 delete();
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a18
// Size: 0x2f9
function function_faabc6943f92e6ac() {
    /#
        hostplayer = namespace_d576b6dc7cef9c62::gethostplayer();
        if (!isdefined(hostplayer)) {
            return;
        }
        while (function_136f4218b1d719b9()) {
            function_9384c9ed097bf7b9(hostplayer, "<unknown string>");
            if (!function_136f4218b1d719b9()) {
                break;
            }
            if (!isdefined(level.infilstruct)) {
                level.infilstruct = spawnstruct();
            }
            level.infilstruct.players = [0:hostplayer];
            startorigin = hostplayer.origin;
            startangles = hostplayer getplayerangles();
            namespace_d9c77dc2a6fe29c6::enableoobimmunity(hostplayer);
            hostplayer thread [[ level.parachutetakeweaponscb ]]();
            function_fe85c23fc6fa8c2();
            function_a93a090c732f587b();
            animstruct = function_55f2480b4b819aea(level.infilstruct.c130);
            if (istrue(level.var_7647df14c1f116f7)) {
                hostplayer function_bc667001f9dd3808(level.infilstruct.var_3a6128a99dc22eb2);
                if (level.var_7647df14c1f116f7 && isdefined(level.infilstruct.var_6f0c032ec6e5d14)) {
                    [[ level.infilstruct.var_6f0c032ec6e5d14 ]](animstruct);
                }
                wait(1);
                animstruct thread function_8b74f71235297593(1);
                function_9384c9ed097bf7b9(hostplayer, "<unknown string>");
                hostplayer clearpredictedstreampos();
                foreach (player in level.players) {
                    player _freezelookcontrols(0);
                    player cameradefault();
                    player cameraunlink();
                    player function_8ff8fd7841f6eba2();
                    player lerpfov(65, 0.5);
                    if (istrue(player.var_1f0a019572c9f8e2)) {
                        player disablephysicaldepthoffieldscripting();
                        player setdof_default();
                        player.var_1f0a019572c9f8e2 = undefined;
                    }
                }
                wait(1);
                foreach (player in level.players) {
                    player setclientdvar(@"hash_df1dc712c4a91588", 65);
                    player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
                }
            } else {
                animstruct thread function_1c3d2f575360d8fa(1);
                animstruct function_3e9deb911031fc08();
                function_9384c9ed097bf7b9(hostplayer, "<unknown string>");
                animstruct function_c5c00974981e6e90();
            }
            if (isdefined(animstruct.cleanupfunc)) {
                animstruct [[ animstruct.cleanupfunc ]]();
            }
            function_f50b1941591d7479();
            hostplayer setorigin(startorigin);
            hostplayer setplayerangles(startangles);
            namespace_d9c77dc2a6fe29c6::disableoobimmunity(hostplayer);
            wait(0.5);
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d18
// Size: 0x16
function function_c43d732289ecf3e8() {
    /#
        return getdvarint(@"hash_35a8afc828c370cb", 0);
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d35
// Size: 0x17
function function_d8220f4960da76cd() {
    /#
        return getdvarint(@"hash_623aaa3d216921a", 4);
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d53
// Size: 0x107
function function_5ade9d48cec313b2() {
    /#
        setdevdvarifuninitialized(@"hash_223915c6339dbc10", (5500, 0, 2000));
        setdevdvarifuninitialized(@"hash_8545857262882e35", 0);
        setdevdvarifuninitialized(@"hash_2f5821f46995d1e2", "<unknown string>");
        setdevdvarifuninitialized(@"hash_441165c7b355dd1b", -1);
        setdevdvarifuninitialized(@"hash_35a8afc828c370cb", 0);
        setdevdvarifuninitialized(@"hash_623aaa3d216921a", 4);
        setdevdvarifuninitialized(@"hash_f6b3b7c2e066bf97", 0);
        setdevdvarifuninitialized(@"hash_5dd356944d2c0dc5", 0);
        setdevdvarifuninitialized(@"hash_783c8ff29b519ca5", 0);
        wait(1);
        while (1) {
            if (function_136f4218b1d719b9()) {
                function_faabc6943f92e6ac();
            } else if (getdvarint(@"hash_783c8ff29b519ca5", 0)) {
                setdvar(@"hash_783c8ff29b519ca5", 0);
                level.player thread [[ level.brlatespawnplayer ]]();
            }
            wait(0.25);
        }
    #/
}

// Namespace namespace_59982bac4da47c6f/namespace_56a3588493afc984
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e61
// Size: 0x16
function function_176ea5668fe41dad() {
    /#
        return getdvarint(@"hash_5dd356944d2c0dc5", 0);
    #/
}

