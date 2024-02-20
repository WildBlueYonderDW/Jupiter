// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_47a7dd805c87b33f;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_ending.gsc;
#using scripts\mp\gamelogic.gsc;

#namespace namespace_af9589a759e3ad0c;

// Namespace namespace_af9589a759e3ad0c/namespace_5813d3044f504bad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0
// Size: 0x20f
function function_1748039e0a11f61b() {
    if (!isdefined(level.player) || !isdefined(level.var_3896bf00e9c5ca00)) {
        return;
    }
    level.blackoverlay = function_c0e79dfb73eaae6a("black", 0);
    level.blackoverlay.alpha = 1;
    level.player setstance("stand");
    level.var_3896bf00e9c5ca00 setstance("stand");
    level.blackoverlay fadeovertime(0.5);
    level.blackoverlay.alpha = 0;
    level.player setplayerangles((0, 50, 0));
    level.player function_33010a90bcf48db4("wz_gulag_player_acknowledge_r_xcam", 0, level.player.origin, (0, 55, 0));
    level.player playanimscriptsceneevent("scripted_scene", "wz_gulag_player_acknowledge_r_pistol");
    level.var_3896bf00e9c5ca00 playanimscriptsceneevent("scripted_scene", "wz_gulag_player_acknowledge_l");
    wait(4);
    level.blackoverlay fadeovertime(0.5);
    level.blackoverlay.alpha = 1;
    wait(0.5);
    level.player function_8ff8fd7841f6eba2();
    level.player stopanimscriptsceneevent();
    level.player setplayerangles(level.ftueData.var_9d94e563e4be46b8);
    level.player setstance(level.ftueData.var_396891c2565891d8);
    level.var_3896bf00e9c5ca00 stopanimscriptsceneevent();
    level.var_3896bf00e9c5ca00 setstance(level.ftueData.var_8c5da83724fd450b);
    waitframe();
    level.blackoverlay fadeovertime(0.5);
    level.blackoverlay.alpha = 0;
}

// Namespace namespace_af9589a759e3ad0c/namespace_5813d3044f504bad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6
// Size: 0x131
function function_c155068cdb5d5105() {
    level endon("endingSceneStop");
    if (istrue(level.var_409e991baf3101bb)) {
        return;
    }
    level.var_409e991baf3101bb = 1;
    level thread function_5a0fd2fe14b493f9();
    foreach (operator in level.players) {
        if (operator != level.players[0]) {
            operator function_a593971d75d82113();
            operator function_379bb555405c16bb("ftue_infilexfil::ftue_exfilLaunch()");
        }
    }
    level thread namespace_d20f8ef223912e12::handleendgamesplash(level.player.team, 0);
    level.player setclientomnvar("ui_br_player_position", 1);
    wait(2);
    winners = [];
    winners = array_add(winners, level.player);
    level.var_d81f9416f44ab4ba = spawnstruct();
    level.var_d81f9416f44ab4ba.var_747d19faf68a7748 = "mgl_ftue_tutorial";
    namespace_d92c3c983abee514::play_ending(winners);
    waitframe();
    function_c73f942aa663ad4a();
    level notify("endingSceneDone");
}

// Namespace namespace_af9589a759e3ad0c/namespace_5813d3044f504bad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50e
// Size: 0x64
function function_5a0fd2fe14b493f9() {
    level endon("endingSceneDone");
    hostplayer = namespace_d576b6dc7cef9c62::gethostplayer();
    if (!isdefined(hostplayer)) {
        return;
    }
    while (hostplayer buttonpressed("DPAD_LEFT")) {
        waitframe();
    }
    while (!hostplayer buttonpressed("DPAD_LEFT")) {
        waitframe();
    }
    level notify("endingSceneStop");
    namespace_d92c3c983abee514::function_9d9d6ecb7d1fd8e3(level.br_ending);
    function_c73f942aa663ad4a();
}

// Namespace namespace_af9589a759e3ad0c/namespace_5813d3044f504bad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x579
// Size: 0x16e
function function_c73f942aa663ad4a() {
    setomnvarforallclients("ui_world_fade", 1);
    setomnvarforallclients("ui_br_end_game_splash_type", 0);
    namespace_d92c3c983abee514::function_e50b941afd09e62e([]);
    foreach (player in level.players) {
        if (isdefined(player.hidehudenabled) && player.hidehudenabled > 0) {
            player utility::hidehuddisable();
        }
        player cameraunlink();
        player function_8ff8fd7841f6eba2();
        player unlink();
        if (isdefined(player.player_rig)) {
            player.player_rig delete();
        }
        if (isdefined(player.__ending_origin)) {
            player setorigin(player.__ending_origin);
        }
        player namespace_d92c3c983abee514::player_abilities_enable();
        player.plotarmor = undefined;
        player.oobimmunity = undefined;
    }
    if (isdefined(level.br_ending)) {
        if (isdefined(level.br_ending.transientname)) {
            unloadinfiltransient(level.br_ending.transientname);
        }
        namespace_d92c3c983abee514::function_9d9d6ecb7d1fd8e3(level.br_ending);
        level.br_ending = undefined;
    }
    level.var_409e991baf3101bb = 0;
}

