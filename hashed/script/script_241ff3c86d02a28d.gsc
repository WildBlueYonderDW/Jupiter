// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using script_3314add7998ab13;
#using scripts\engine\scriptable.gsc;
#using script_64acb6ce534155b7;
#using script_4948cdf739393d2d;
#using script_5307834cd39b435c;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using script_6a8ec730b2bfa844;
#using script_15ca41a3fbb0e379;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\anim.gsc;
#using scripts\common\anim.gsc;
#using script_4b5b395ea0ea0fb;
#using scripts\common\elevator.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\juggernaut.gsc;
#using script_5def7af2a9f04234;
#using script_48814951e916af89;
#using script_10b6724c15a95e8;
#using script_24fbedba9a7a1ef4;
#using script_120270bd0a747a35;
#using script_371b4c2ab5861e62;
#using script_5d265b4fca61f070;
#using script_5c65d346ac65390c;
#using scripts\common\vehicle_paths.gsc;
#using scripts\mp\outofbounds.gsc;

#namespace namespace_ae2d053cbf559cee;

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1331
// Size: 0x140
function function_80d68c9701e1aea5(data) {
    level.var_af7d80856e5ae6c0 = spawnstruct();
    level.var_af7d80856e5ae6c0.circleradius = getdvarint(@"hash_d2585ec2c64a9f34", 300);
    level.var_af7d80856e5ae6c0.var_e3aa1de9d96e0086 = getdvarint(@"hash_1d6b7e1f5eab0397", 700);
    level.var_af7d80856e5ae6c0.bombtimer = getdvarfloat(@"hash_5670ae3dc42b22ff", 50);
    level.var_af7d80856e5ae6c0.var_ca7a26c1e01b30a = getdvarfloat(@"hash_11c996694ec6bc7d", 3);
    level.var_af7d80856e5ae6c0.var_7f494a83de6cfb1e = getdvarint(@"hash_152094cca50e086", 1);
    level.var_af7d80856e5ae6c0.var_82a01ce31b77ac5c = getdvarfloat(@"hash_4f66fa15a2fb52a5", 750);
    initanims();
    level._effect["hostage_bomb_explosion"] = loadfx("vfx/iw8_mp/gamemode/vfx_search_bombsite_destroy.vfx");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_hostage", &function_b7a8186b8098b13f);
    function_b713f2d39b34540f(data, &function_d871ffa09fd34efe, function_f0c7539dc72c3dfd());
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1478
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("lockMe", "bomb_defused");
    #/
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1496
// Size: 0x17a
function function_d871ffa09fd34efe(mission, node) {
    task = function_5f6d9fd82bdd2d05(mission);
    task.funcs["onInit"] = &function_c17a05d80baf63a8;
    task.funcs["onPlayerJoined"] = &function_15bd4f5a3da26fba;
    task.funcs["onPlayerRemoved"] = &function_64b4cc14af5fcbf9;
    task.funcs["onTeamAssigned"] = &function_48ef78129771c52b;
    task.funcs["onTeamStart"] = &function_497633646487b841;
    task.funcs["onCancel"] = &function_55cff0a19d87f7b0;
    task.ref = "dmz_hostage";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    task.node = node;
    fort = namespace_9823ee6035594d67::function_bbe42d7091bedfc5(node.origin, "hostage_forts");
    namespace_9823ee6035594d67::function_4e6dd86684152b17(fort, "hostage_door");
    namespace_9823ee6035594d67::function_5d8264355db47371(fort, 0, 1, 0, 0, undefined, undefined, undefined, undefined, 1, 0);
    task.fort = fort;
    task.helinode = node.helinode;
    node.helinode.info = namespace_25b25d188ef778c4::function_a4181028915c44fa(node.helinode, 0);
    return task;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1618
// Size: 0x16c
function function_c17a05d80baf63a8() {
    self.activity.origin = self.node.origin;
    self.node.inuse = 1;
    var_79b9c85900392ad6 = function_ab50f62a3a730400(self.fort.origin, level.var_af7d80856e5ae6c0.circleradius);
    function_325390edb051cd5d("Hostage_Dmz", [0:var_79b9c85900392ad6], level.var_af7d80856e5ae6c0.circleradius + level.var_af7d80856e5ae6c0.var_e3aa1de9d96e0086);
    self.curorigin = var_79b9c85900392ad6;
    self.offset3d = (0, 0, 750);
    function_c847bfd52c064289(self.curorigin + self.offset3d, "rescue");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.icon, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.icon, 0);
    self.door_opened = 0;
    self.var_65513ad5397a67ef = "hostage" + gettime();
    function_bd0bde6807000dae();
    function_b6b601986dcad85a();
    if (!isdefined(self.hostage)) {
        function_8250fd658e3aae32();
        task_ended();
        return;
    }
    function_14f7745b0a1250db();
    /#
        thread function_f2a1117679fc06d1();
    #/
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0x92
function function_15bd4f5a3da26fba(player) {
    player.var_65513ad5397a67ef = self.var_65513ad5397a67ef;
    players = getteamdata(player.team, "players");
    if (!isdefined(self.bombexploded)) {
        self.instance enablescriptableplayeruse(player);
    } else if (isdefined(self.carryingplayer)) {
        self.instance disablescriptableplayeruse(player);
    } else {
        self.instance enablescriptableplayeruse(player);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1824
// Size: 0x4c
function function_64b4cc14af5fcbf9(player) {
    player.var_65513ad5397a67ef = undefined;
    if (isdefined(self.carryingplayer) && self.carryingplayer == player) {
        drophostage(1);
    }
    self.instance disablescriptableplayeruse(player);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1877
// Size: 0x157
function function_48ef78129771c52b(teamname) {
    function_1759acfd39bb5edf("dmz_hostage_assigned", teamname);
    function_e54df8560bf7dc64(teamname);
    function_dffcbce998c9ee50(teamname);
    players = getteamdata(teamname, "players");
    self.instance setscriptablepartstate("dmz_hostage", "usable", 0);
    foreach (player in level.players) {
        self.instance disablescriptableplayeruse(player);
    }
    foreach (player in players) {
        self.instance enablescriptableplayeruse(player);
    }
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_hostage_start", 1.5, "dmz_hostage_start_classic");
    thread function_d2a6b6d52ac64120(teamname);
    /#
        if (getdvarint(@"hash_74041777d8dfea42", 0) == 1) {
            function_5511b411b075d27b();
        }
    #/
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d5
// Size: 0x31
function function_497633646487b841(teamname) {
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_approach", teamname, 2);
    function_c1fd3441ccfba6f8(teamname, "dmz_hostage_approach", 0);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x53
function function_55cff0a19d87f7b0(teamname) {
    self.failure = 1;
    function_8250fd658e3aae32();
    if (isdefined(self.carryingplayer)) {
        thread drophostage(1);
    }
    function_c1fd3441ccfba6f8(teamname, "dmz_hostage_rescue_failed", 1, "dmz_hostage_rescue_failed_classic");
    task_ended();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a67
// Size: 0x158
function function_8250fd658e3aae32() {
    if (istrue(self.completed)) {
        return;
    }
    self.completed = 1;
    if (!istrue(self.var_2f893d4a9cbf8a5c)) {
        if (isdefined(self.var_90fb369a18926018)) {
            foreach (player in self.var_90fb369a18926018) {
                namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
            }
        }
        function_2476daefa3384c5e();
        function_629ed367d1393020();
    }
    if (isdefined(self.instance)) {
        self.instance freescriptable();
    }
    if (isdefined(self.heli) && isdefined(self.heli.var_902a7ffcff8aa65)) {
        foreach (player in self.heli.var_902a7ffcff8aa65) {
            player namespace_25b25d188ef778c4::function_a9f268abd153b713();
        }
    }
    if (!istrue(self.var_2f893d4a9cbf8a5c)) {
        function_45bd3184ff146b46(self.teams[0]);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc6
// Size: 0xba
function function_cb2f74520e05756f(teamname) {
    function_8250fd658e3aae32();
    if (!istrue(self.var_2f893d4a9cbf8a5c)) {
        if (isdefined(teamname)) {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_hostage_exfil", teamname, 2);
            function_a1738a95d7aa8094("dmz_hostage_exfilled", "hostage", self.activity.var_723b8f7cb71ceb11, teamname);
            function_cd4f277cf0d6a560(teamname);
            function_c1fd3441ccfba6f8(teamname, "", 0);
            namespace_8361bad7391de074::function_496b109dc14fa57d(self);
        } else if (isdefined(self.teams[0])) {
            function_c1fd3441ccfba6f8(self.teams[0], "dmz_hostage_rescue_failed", 0, "dmz_hostage_rescue_failed_classic");
        }
        task_ended(teamname);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c87
// Size: 0xeb
function function_bd0bde6807000dae() {
    foreach (door in self.fort.var_e2cd8aa8b46d18ac) {
        door.task = self;
        door scriptabledoorclose();
        door.var_65513ad5397a67ef = self.var_65513ad5397a67ef;
        door.var_8e6ba9b12787eb1d = 1;
        /#
            namespace_d1a9ca87d78d9813::function_9533653868e59fb6("+weapnext", self.activity.name, undefined, undefined, undefined, undefined, self.activity.poi, door.origin);
        #/
    }
    namespace_9823ee6035594d67::function_68a6379d51e7dbc2(self.fort, undefined, &function_bf35c0838580cf50);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d79
// Size: 0x64
function function_bf35c0838580cf50(door, player) {
    if (isdefined(door.task)) {
        if (isdefined(door.node.script_noteworthy) && door.node.script_noteworthy == "lockMe") {
            door thread function_aa49ad82e62a035f();
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de4
// Size: 0x26
function function_aa49ad82e62a035f() {
    while (self scriptabledoorisclosed()) {
        waitframe();
    }
    self.task.door_opened = 1;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e11
// Size: 0x62
function function_d2a6b6d52ac64120(teamname) {
    self endon("task_ended");
    self endon("abort_rescue_timer");
    while (!istrue(self.door_opened)) {
        waitframe();
    }
    self.hostage.invulnerable = undefined;
    namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_loud", teamname);
    self.state = "player_entered_building";
    thread function_795b60c4ae5793a2(teamname);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e7a
// Size: 0x30a
function private function_795b60c4ae5793a2(teamname) {
    if (istrue(self.var_66b657ad4e581eda) || isdefined(self.bombexploded) && !self.bombexploded) {
        return;
    }
    self endon("task_ended");
    self endon("abort_rescue_timer");
    if (istrue(self.var_ad3ac58c52d589d7)) {
        return;
    }
    self.var_ad3ac58c52d589d7 = 1;
    timer = level.var_af7d80856e5ae6c0.bombtimer;
    function_c1fd3441ccfba6f8(teamname, "dmz_hostage_breach", 1, "dmz_hostage_breach_classic");
    thread function_68c8358014264e66(timer);
    namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.icon, 1);
    bombexploded = function_d0a5788403ac6ddf(timer);
    if (isdefined(bombexploded)) {
        self.bombexploded = bombexploded;
    }
    foreach (player in self.var_90fb369a18926018) {
        namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
        namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.icon, player);
    }
    if (isdefined(self.bombexploded) && self.bombexploded == 0) {
        namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.icon, 0);
    }
    if (istrue(self.bombexploded)) {
        self notify("bomb_exploded");
        if (isdefined(self.hostage) && self.hostage.health > 0) {
            self.hostage dodamage(1000, self.hostage.origin);
        }
        effect = "hostage_bomb_explosion";
        explosionpos = self.c4.origin + (0, 0, 50);
        explosioneffect = spawnfx(level._effect[effect], explosionpos);
        explosioneffect thread function_b4b04de87729a6f3(10);
        triggerfx(explosioneffect);
        physicsexplosionsphere(explosionpos, 200, 100, 3);
        playrumbleonposition("grenade_rumble", self.c4.origin);
        earthquake(0.25, 0.5, self.c4.origin, 500);
        playsoundatpos(explosionpos, "exp_bombsite_lr");
        radiusdamage(self.c4.origin + (0, 0, 50), 200, 500, 10, undefined, "MOD_EXPLOSIVE", "bomb_site_mp");
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_exploded", self.teams[0], 2);
    }
    if (isdefined(self.c4)) {
        self.c4 delete();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218b
// Size: 0x3d
function function_68c8358014264e66(timer) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("bomb_defused");
    wait(timer);
    self.instance setscriptablepartstate("dmz_hostage", "unusable", 0);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cf
// Size: 0x1e3
function function_d0a5788403ac6ddf(timer) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("bomb_defused");
    self endon("abort_rescue_timer");
    self.var_90fb369a18926018 = [];
    currenttime = gettime();
    offset = 1000 * level.var_af7d80856e5ae6c0.var_ca7a26c1e01b30a;
    var_f28399727742eb23 = int(currenttime + 1000 * timer + offset);
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    thread function_c98c343e42951ea2(var_f28399727742eb23, offset);
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 < 0) {
            break;
        }
        self.nearbyplayers = [];
        var_e2b2bbd9e6539f11 = getteamdata(self.teams[0], "players");
        foreach (player in var_e2b2bbd9e6539f11) {
            if (distance2dsquared(player.origin, self.fort.origin) < 1048576) {
                self.nearbyplayers[self.nearbyplayers.size] = player;
            }
        }
        progress = (var_c301d652d9a73075 - offset) / timer * 1000;
        if (progress > 0) {
            self.var_90fb369a18926018 = function_f69e0b0e05fd9b85(self.nearbyplayers, self.var_90fb369a18926018);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.icon, progress);
        } else {
            namespace_5a22b6f3a56f7e9b::function_17db39bd195cc5b1(self.icon);
            self.var_28275934186417c8 = 1;
        }
        waitframe();
    }
    return 1;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ba
// Size: 0x17a
function function_c98c343e42951ea2(var_f28399727742eb23, offset) {
    level endon("game_ended");
    self endon("task_ended");
    self endon("abort_rescue_timer");
    self endon("bomb_exploded");
    self endon("bomb_defused");
    currenttime = gettime();
    var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
    while (var_c301d652d9a73075 > 0) {
        currenttime = gettime();
        var_c301d652d9a73075 = var_f28399727742eb23 - currenttime;
        if (var_c301d652d9a73075 <= 0 + offset) {
            if (var_c301d652d9a73075 <= 250) {
                if (soundexists("hostage_warning_beep_05")) {
                    self.c4 playsound("hostage_warning_beep_05");
                }
            } else if (var_c301d652d9a73075 <= 750) {
                if (soundexists("hostage_warning_beep_04")) {
                    self.c4 playsound("hostage_warning_beep_04");
                }
            } else if (var_c301d652d9a73075 <= 1500) {
                if (soundexists("hostage_warning_beep_03")) {
                    self.c4 playsound("hostage_warning_beep_03");
                }
            } else if (soundexists("hostage_warning_beep_02")) {
                self.c4 playsound("hostage_warning_beep_02");
            }
            wait(0.25);
        } else if (var_c301d652d9a73075 <= 10000 + offset) {
            if (soundexists("hostage_warning_beep_02")) {
                self.c4 playsound("hostage_warning_beep_02");
            }
            wait(0.5);
        } else {
            if (soundexists("hostage_warning_beep_01")) {
                self.c4 playsound("hostage_warning_beep_01");
            }
            wait(1);
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x253b
// Size: 0x12a
function function_f69e0b0e05fd9b85(nearbyplayers, var_90fb369a18926018) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            if (namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.icon, player, 2, 2, "MP_DMZ_MISSIONS/HOSTAGE_BAR_TITLE")) {
                namespace_5a22b6f3a56f7e9b::objective_pin_player(self.icon, player);
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.icon, player);
                var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            }
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.icon, player);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x266d
// Size: 0x1a3
function private function_c0ccb94fcfe50916() {
    self endon("task_ended");
    self.hostage thread function_8dc13537721b3c2d();
    while (isdefined(self.hostage) && self.hostage.health > 0 && !istrue(self.bombexploded)) {
        waitframe();
    }
    if (istrue(self.failure)) {
        return;
    }
    self.failure = 1;
    if (isdefined(self.var_90758efde9b783b7)) {
        self.var_90758efde9b783b7 delete();
    }
    if (!istrue(self.var_2f893d4a9cbf8a5c)) {
        function_a1738a95d7aa8094("dmz_hostage_failure", "hostage", 0, self.teams[0]);
        if (isdefined(self.teams[0]) && !istrue(self.bombexploded)) {
            thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_shot", self.teams[0], 1.5);
        }
        if (isdefined(self.var_90fb369a18926018)) {
            foreach (player in self.var_90fb369a18926018) {
                namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.icon, player);
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.icon, player);
            }
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.icon);
        namespace_5a22b6f3a56f7e9b::objective_set_show_progress(self.icon, 0);
        self.var_b0f4bf8621b96c0a[0] function_4eaf685bc40a3b9();
    }
    thread function_cb2f74520e05756f();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2817
// Size: 0x775
function private function_b7a8186b8098b13f(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part != "dmz_hostage") {
        return;
    }
    if (!isdefined(instance.task)) {
        return;
    }
    if (!istrue(instance.task.var_2f893d4a9cbf8a5c) && (!isdefined(instance.task.teams[0]) || player.team != instance.task.teams[0])) {
        /#
            assertmsg("Somehow players not on the hostage contract are picking up the hostage!");
        #/
        return;
    }
    if (state == "usable" && isdefined(instance.hostage)) {
        if (isdefined(instance.task.task_ended)) {
            return;
        }
        instance setscriptablepartstate("dmz_hostage", "unusable");
        task = instance.task;
        task.c4 hide();
        bomb = task function_cadc5181c3b67e3f(player);
        thread function_d86771edadba8b4a(instance, task, player);
        buttontime = 0;
        while (buttontime < level.var_af7d80856e5ae6c0.var_ca7a26c1e01b30a) {
            if (!isdefined(instance) || instance.cancel || istrue(task.failure) || !namespace_7e17181d03156026::function_ad443bbcdcf37b85(player)) {
                if (isdefined(player)) {
                    player notifyonplayercommandremove("cancel", "+weapnext");
                }
                task function_db896f4486ca187(player, bomb);
                task.c4 show();
                if (!istrue(task.failure) && isdefined(instance)) {
                    instance setscriptablepartstate("dmz_hostage", "usable");
                    foreach (otherplayer in level.players) {
                        instance disablescriptableplayeruse(otherplayer);
                    }
                    teammates = getteamdata(instance.task.teams[0], "players");
                    foreach (teammate in teammates) {
                        instance enablescriptableplayeruse(teammate);
                    }
                }
                return 0;
            }
            buttontime = buttontime + level.framedurationseconds;
            waitframe();
        }
        if (isdefined(player)) {
            player notifyonplayercommandremove("cancel", "+weapnext");
        }
        if (istrue(instance.task.failure)) {
            instance.task function_db896f4486ca187(player, bomb);
            if (isdefined(task.c4)) {
                task.c4 delete();
            }
            return;
        }
        instance.task.state = "rescued";
        instance.hostage notify("play_dialog");
        instance.task.bombexploded = 0;
        instance.task notify("bomb_defused");
        if (isdefined(instance.task.var_90fb369a18926018)) {
            foreach (var_70abe2c111c6f7fb in instance.task.var_90fb369a18926018) {
                namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(instance.task.icon, var_70abe2c111c6f7fb);
                namespace_5a22b6f3a56f7e9b::objective_unpin_player(instance.task.icon, player);
            }
        }
        namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(instance.task.icon);
        instance.task function_db896f4486ca187(player, bomb);
        if (isdefined(task.c4)) {
            task.c4 delete();
        }
        if (istrue(task.failure)) {
            return;
        }
        player playsound("mp_dmz_hostage_unzip");
        instance.task.dropposition = instance.position;
        instance setscriptablepartstate("dmz_hostage", "remaining");
        foreach (guy in level.players) {
            instance disablescriptableplayeruse(guy);
        }
        teammates = getteamdata(instance.task.teams[0], "players");
        foreach (teammate in teammates) {
            instance enablescriptableplayeruse(teammate);
        }
        namespace_5a22b6f3a56f7e9b::update_objective_position(instance.task.icon, instance.task.hostage.origin + (0, 0, 30));
        instance.task.var_b0f4bf8621b96c0a[0] function_4eaf685bc40a3b9();
        instance.task.var_b0f4bf8621b96c0a[0] function_6e148c8da2e4db13(instance.task.helinode.origin);
        instance.task function_1759acfd39bb5edf("dmz_hostage_success", instance.task.teams[0]);
        thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_win", instance.task.teams[0], 2);
        instance.task thread function_df48d309a8bc55a();
        function_c1fd3441ccfba6f8(instance.task.teams[0], "dmz_hostage_rescue", 1, "dmz_hostage_rescue_classic");
    } else if (state == "remaining" && isdefined(instance.hostage)) {
        instance setscriptablepartstate("dmz_hostage", "unusable");
        instance.task function_6e98eeed96b1d4b2(player, instance.hostage);
    } else if (state == "following" && isdefined(instance.hostage)) {
        instance.task drophostage();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f93
// Size: 0x7f9
function initanims() {
    level.scr_animtree["player_pickup_hostage"] = %script_model;
    level.scr_anim["player_pickup_hostage"]["pickup_front_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_crouch"] = %"pickup_front_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_front_stand"] = script_model%iw9_mp_hostage_pickup_stand_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_stand"] = %"pickup_front_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_back_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_crouch"] = %"pickup_back_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_back_stand"] = script_model%iw9_mp_hostage_pickup_stand_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_stand"] = %"pickup_back_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_right_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_crouch"] = %"pickup_right_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_right_stand"] = script_model%iw9_mp_hostage_pickup_stand_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_stand"] = %"pickup_right_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_left_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_crouch"] = %"pickup_left_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_left_stand"] = script_model%iw9_mp_hostage_pickup_stand_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_stand"] = %"pickup_left_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_front_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_crouch_vm"] = %"pickup_front_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_front_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_stand_vm"] = %"pickup_front_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_back_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_crouch_vm"] = %"pickup_back_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_back_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_stand_vm"] = %"pickup_back_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_right_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_crouch_vm"] = %"pickup_right_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_right_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_stand_vm"] = %"pickup_right_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_left_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_crouch_vm"] = %"pickup_left_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_left_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_stand_vm"] = %"pickup_left_stand_vm";
    level.scr_animtree["hostage_pickup"] = %script_model;
    level.scr_anim["hostage_pickup"]["pickup_front_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_crouch"] = %"hash_67f23cafd452eaf";
    level.scr_anim["hostage_pickup"]["pickup_front_stand"] = script_model%iw9_mp_hostage_pickedup_stand_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_stand"] = %"hash_76c3c19b5cdc4957";
    level.scr_anim["hostage_pickup"]["pickup_back_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_crouch"] = %"hash_5b9b71e89b7aff69";
    level.scr_anim["hostage_pickup"]["pickup_back_stand"] = script_model%iw9_mp_hostage_pickedup_stand_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_stand"] = %"hash_6a3ae844da15c55d";
    level.scr_anim["hostage_pickup"]["pickup_right_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_crouch"] = %"hash_17c61661c4ba6d68";
    level.scr_anim["hostage_pickup"]["pickup_right_stand"] = script_model%iw9_mp_hostage_pickedup_stand_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_stand"] = %"hash_2c87d17e444be8d6";
    level.scr_anim["hostage_pickup"]["pickup_left_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_crouch"] = %"hash_763bf8b46b8f6ff";
    level.scr_anim["hostage_pickup"]["pickup_left_stand"] = script_model%iw9_mp_hostage_pickedup_stand_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_stand"] = %"hash_3c9d606392a88b87";
    level.scr_animtree["hostage_pickup_sm"] = %script_model;
    level.scr_anim["hostage_pickup_sm"]["pickup_front_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_8;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_front_crouch_vm"] = %"hash_2dfeef0aebdfeecd";
    level.scr_anim["hostage_pickup_sm"]["pickup_front_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_8;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_front_stand_vm"] = %"hash_7e016dd39eca5fe5";
    level.scr_anim["hostage_pickup_sm"]["pickup_back_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_2;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_back_crouch_vm"] = %"hash_1a414b9d05f157c3";
    level.scr_anim["hostage_pickup_sm"]["pickup_back_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_2;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_back_stand_vm"] = %"hash_242c761811d89107";
    level.scr_anim["hostage_pickup_sm"]["pickup_right_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_6;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_right_crouch_vm"] = %"hash_716be6cc83bf81c";
    level.scr_anim["hostage_pickup_sm"]["pickup_right_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_6;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_right_stand_vm"] = %"hash_4590693be6e310be";
    level.scr_anim["hostage_pickup_sm"]["pickup_left_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_4;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_left_crouch_vm"] = %"hash_1897e7f4cbc945fd";
    level.scr_anim["hostage_pickup_sm"]["pickup_left_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_4;
    level.scr_eventanim["hostage_pickup_sm"]["pickup_left_stand_vm"] = %"hash_39404f4bc2930c35";
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3793
// Size: 0x25c
function function_6e98eeed96b1d4b2(player, hostage) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("last_stand_start");
    level endon("game_ended");
    self.hostage endon("death");
    self endon("task_ended");
    if (!istrue(self.completed)) {
        self.carryingplayer = player;
        thread function_82ef6d194918247f(player);
        player.var_859654e0445a36d9 = 1;
        hostage unlink();
        self.instance scriptableclearparententity();
        hostage function_3b8913dc82881267(player);
        player notify("hostage_pickup_finished");
    }
    if (!istrue(self.completed)) {
        hostage hide();
        hostage.origin = hostage.origin + (0, 0, 100000);
        hostage.invulnerable = 1;
        self.carryingplayer setcarryobject(function_58ca3a35159054b1(hostage.model));
        function_f0c2012ae22ca0d6(self.carryingplayer);
        if (!istrue(self.var_2f893d4a9cbf8a5c)) {
            players = getteamdata(self.teams[0], "players");
            foreach (teammate in players) {
                self.var_b0f4bf8621b96c0a[0] function_cfd53c8f6878014f(teammate);
            }
            namespace_5a22b6f3a56f7e9b::update_objective_position(self.icon, self.helinode.origin);
        }
        self.instance setscriptablepartstate("dmz_hostage", "following");
        foreach (otherplayer in level.players) {
            self.instance disablescriptableplayeruse(otherplayer);
        }
        self.instance enablescriptableplayeruse(self.carryingplayer);
        thread function_eede562ce57290d3();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39f6
// Size: 0x68
function function_58ca3a35159054b1(model) {
    if (!isdefined(model)) {
        return "hostage_rescue";
    }
    switch (model) {
    case #"hash_e1b1040264d1aa90":
        return "hostage_civ_male_3_1";
    case #"hash_7c27bd492fe216bd":
        return "hostage_civ_male_3_2";
    case #"hash_2dc1b9fc9dd2ecc6":
        return "hostage_civ_male_3_3";
    default:
        return "hostage_rescue";
        break;
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a65
// Size: 0x158
function function_8f65ac94aafe5d3e(animname, spawnpos, var_b7850001037aa074, bodymodel, headmodel) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    var_fc77a3ee1c3e72b5 = spawn("script_model", spawnpos);
    var_fc77a3ee1c3e72b5.angles = var_b7850001037aa074;
    var_fc77a3ee1c3e72b5 setmodel(bodymodel);
    var_fc77a3ee1c3e72b5 notsolid();
    self.var_fc77a3ee1c3e72b5 = var_fc77a3ee1c3e72b5;
    self.var_fc77a3ee1c3e72b5.animname = animname;
    self.var_fc77a3ee1c3e72b5 useanimtree(%script_model);
    self.var_fc77a3ee1c3e72b5.updatedversion = 1;
    head = spawn("script_model", spawnpos);
    head setmodel(headmodel);
    head notsolid();
    self.var_fc77a3ee1c3e72b5.head = head;
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(head)) {
        head unlink();
        head delete();
    }
    if (isdefined(var_fc77a3ee1c3e72b5)) {
        var_fc77a3ee1c3e72b5 delete();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bc4
// Size: 0x13f
function function_8277f49f79bff530(animname, spawnpos, var_b7850001037aa074) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    if (isplayer(self)) {
        self function_b88c89bb7cd1ab8e(spawnpos);
    }
    var_e3bda5be1db297f = spawn("script_arms", spawnpos, 0, 0, self);
    var_e3bda5be1db297f.angles = var_b7850001037aa074;
    var_e3bda5be1db297f.player = self;
    self.var_e3bda5be1db297f = var_e3bda5be1db297f;
    self.var_e3bda5be1db297f.animname = animname;
    self.var_e3bda5be1db297f useanimtree(%script_model);
    self.var_e3bda5be1db297f.updatedversion = 1;
    self playerlinktoabsolute(self.var_e3bda5be1db297f, "tag_player", 1, 0, 0, 0, 0, 1);
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(var_e3bda5be1db297f)) {
        var_e3bda5be1db297f delete();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d0a
// Size: 0x13f
function function_a3a4a2cdca554483(animname, spawnpos, var_b7850001037aa074) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    if (isplayer(self)) {
        self function_b88c89bb7cd1ab8e(spawnpos);
    }
    var_54d7b76a2a71e284 = spawn("script_arms", spawnpos, 0, 0, self);
    var_54d7b76a2a71e284.angles = var_b7850001037aa074;
    var_54d7b76a2a71e284.player = self;
    self.var_54d7b76a2a71e284 = var_54d7b76a2a71e284;
    self.var_54d7b76a2a71e284.animname = animname;
    self.var_54d7b76a2a71e284 useanimtree(%script_model);
    self.var_54d7b76a2a71e284.updatedversion = 1;
    self playerlinktoabsolute(self.var_54d7b76a2a71e284, "tag_player", 1, 0, 0, 0, 0, 1);
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(var_54d7b76a2a71e284)) {
        var_54d7b76a2a71e284 delete();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e50
// Size: 0x889
function function_3b8913dc82881267(player) {
    self.var_44206360497f15c2 = 1;
    player val::set("carry", "vehicle_use", 0);
    player val::set("carry", "melee", 0);
    player val::set("carry", "weapon_switch", 0);
    player val::set("carry", "sprint", 0);
    player val::set("carry", "fire", 0);
    player val::set("carry", "reload", 0);
    player val::set("carry", "weapon_pickup", 0);
    player val::set("carry", "weapon_switch", 0);
    player val::set("carry", "allow_jump", 0);
    player val::set("carry", "gesture", 0);
    player function_35501b42058d4de9();
    player val::set("move_disable", "allow_movement", 0);
    if (istrue(player.insertingarmorplate)) {
        player notify("try_armor_cancel");
        while (isdefined(player.currentweapon) && isdefined(player.currentweapon.basename) && player.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
            waitframe();
        }
        waitframe();
    }
    animlength = 0;
    stance = player getstance();
    if (stance == "prone") {
        player setstance("crouch", 1, 1);
        stance = "crouch";
    }
    player.switchweapon = player getcurrentweapon();
    fists = makeweapon("iw9_gunless_mp");
    player giveweapon(fists);
    player.var_73f4b954751a8643 = fists;
    result = player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(fists, 1, 1);
    if (!istrue(result)) {
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(fists, 1, 1);
    }
    player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("move_disable");
    var_7c4e2c6a50914434 = (self.origin[0], self.origin[1], player.origin[2]);
    var_cebe2632e00d0e2d = vectornormalize(player.origin - var_7c4e2c6a50914434);
    var_82b4f01ce94ed444 = vectordot(var_cebe2632e00d0e2d, anglestoforward(self.angles));
    var_8288e81ce91e5c46 = vectordot(var_cebe2632e00d0e2d, anglestoright(self.angles));
    self.origin = player.origin + anglestoforward(player.angles) * 34.672;
    self.var_8ee3ff7543ac0b4 = stance;
    self.var_a1e9baabc1d61ae3 = undefined;
    anime = "pickup_back_stand";
    var_cf13edffb05efcd8 = "pickup_back_stand_vm";
    var_318eea579595b65e = undefined;
    if (var_82b4f01ce94ed444 >= 0.707) {
        self.var_a1e9baabc1d61ae3 = "front";
        anime = "pickup_front_" + stance;
        var_cf13edffb05efcd8 = "pickup_front_" + stance + "_vm";
        var_636ec99138e1950a = vectornormalize(player.origin - self.origin);
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_636ec99138e1950a, anglestoup(self.angles));
        self.angles = var_318eea579595b65e;
    } else if (var_82b4f01ce94ed444 <= -0.707) {
        self.var_a1e9baabc1d61ae3 = "back";
        anime = "pickup_back_" + stance;
        var_cf13edffb05efcd8 = "pickup_back_" + stance + "_vm";
        var_81554c014ce7839c = vectornormalize(self.origin - player.origin);
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_81554c014ce7839c, anglestoup(self.angles));
        self.angles = var_318eea579595b65e;
    } else if (var_8288e81ce91e5c46 >= 0.707) {
        self.var_a1e9baabc1d61ae3 = "right";
        anime = "pickup_right_" + stance;
        var_cf13edffb05efcd8 = "pickup_right_" + stance + "_vm";
        var_81554c014ce7839c = vectorcross(vectornormalize(self.origin - player.origin), anglestoup(self.angles));
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_81554c014ce7839c, anglestoup(self.angles));
        self.angles = var_318eea579595b65e;
    } else if (var_8288e81ce91e5c46 <= -0.707) {
        self.var_a1e9baabc1d61ae3 = "left";
        anime = "pickup_left_" + stance;
        var_cf13edffb05efcd8 = "pickup_left_" + stance + "_vm";
        var_636ec99138e1950a = vectorcross(vectornormalize(player.origin - self.origin), anglestoup(self.angles));
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_636ec99138e1950a, anglestoup(self.angles));
        self.angles = var_318eea579595b65e;
    }
    if (isdefined(var_318eea579595b65e)) {
        self orientmode("face angle 3d", var_318eea579595b65e);
    }
    player thread function_8277f49f79bff530("player_pickup_hostage", player.origin, player.angles);
    player.var_e3bda5be1db297f hide();
    player thread function_a3a4a2cdca554483("player_pickup_hostage", player.origin, player.angles);
    if (player getcamerathirdperson()) {
        player.var_54d7b76a2a71e284 hide();
    } else {
        player.var_54d7b76a2a71e284 showonlytoplayer(player);
    }
    var_d5b5ffad0eca8c36 = spawnstruct();
    var_d5b5ffad0eca8c36 thread function_8f65ac94aafe5d3e("hostage_pickup_sm", self.origin, self.angles, self.model, self.headmodel);
    var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5 hide();
    var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5 showonlytoplayer(player);
    if (isdefined(var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5.head)) {
        var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5.head hide();
        var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5.head showonlytoplayer(player);
        var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5.head linkto(var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5, "j_neck", (-9, 1, 0), (0, 0, 0));
    }
    self.var_d5b5ffad0eca8c36 = var_d5b5ffad0eca8c36;
    player.var_43e2c0fcf655ebac = var_d5b5ffad0eca8c36;
    self hidefromplayer(player);
    self.animname = "hostage_pickup";
    self useanimtree(level.scr_animtree["hostage_pickup"]);
    self._blackboard.var_7460b96395361857 = "getting_picked_up";
    animstruct = spawnstruct();
    animstruct.origin = player.origin;
    animstruct.angles = player.angles;
    var_f514603feaf5c1e2 = player getmovingplatformparent();
    if (isdefined(var_f514603feaf5c1e2) && namespace_9abe40d2af041eb2::function_63bdc8c411a85475(var_f514603feaf5c1e2)) {
        var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5 linkto(var_f514603feaf5c1e2);
        player.var_54d7b76a2a71e284 linkto(var_f514603feaf5c1e2);
        player playerlinkedoffsetenable();
    }
    animstruct thread namespace_4e680905778c0f0f::anim_player_solo(player, player.var_e3bda5be1db297f, anime);
    animstruct thread namespace_bc4a4b9456315863::anim_single_solo(player.var_54d7b76a2a71e284, var_cf13edffb05efcd8);
    var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5 thread namespace_bc4a4b9456315863::anim_single_solo(var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5, var_cf13edffb05efcd8);
    wait(getanimlength(level.scr_anim["player_pickup_hostage"][var_cf13edffb05efcd8]));
    var_f514603feaf5c1e2 = player getmovingplatformparent();
    if (isdefined(var_f514603feaf5c1e2) && namespace_9abe40d2af041eb2::function_63bdc8c411a85475(var_f514603feaf5c1e2)) {
        var_d5b5ffad0eca8c36.var_fc77a3ee1c3e72b5 unlink();
        player.var_54d7b76a2a71e284 unlink();
        player playerlinkedoffsetdisable();
    }
    player notify("remove_rig");
    var_d5b5ffad0eca8c36 notify("remove_rig");
    player.var_73f4b954751a8643 = undefined;
    player.var_43e2c0fcf655ebac = undefined;
    player takeweapon(fists);
    namespace_6d8fa3f81f071973::function_83dfc273b8e7efed(player);
    self.var_44206360497f15c2 = undefined;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46e0
// Size: 0xc6
function function_524f22fe698eeb0f(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    function_b7771cc818b41864(player);
    gunless = makeweapon("iw9_gunless_mp");
    player giveweapon(gunless);
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(gunless);
    if (isdefined(player.var_7ebbb0dc14346eaa)) {
        player takeweapon(player.var_7ebbb0dc14346eaa);
        player.var_7ebbb0dc14346eaa = undefined;
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(player.switchweapon);
    } else {
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(player.switchweapon);
    }
    if (isdefined(player.switchweapon)) {
        player.switchweapon = undefined;
    }
    player takeweapon(gunless);
    player resetcarryobject();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ad
// Size: 0x7e3
function drophostage(var_9768b22610b34d9d) {
    droporigin = undefined;
    dropangles = undefined;
    var_37252b7e9c614d8 = undefined;
    if (!isdefined(self.carryingplayer) || !isdefined(self.carryingplayer.origin) || !isdefined(self.carryingplayer.angles)) {
        droporigin = self.var_3d17023b5bfb92ce;
        dropangles = self.var_bff867759e490124;
        var_37252b7e9c614d8 = self.var_ab2a8c60478bdd5c;
    } else {
        droporigin = self.carryingplayer.origin;
        dropangles = self.carryingplayer.angles;
        var_37252b7e9c614d8 = self.carryingplayer getstance();
    }
    var_7fe2df4a925adffe = undefined;
    var_9fbc564d9bb976ed = undefined;
    var_741196a281686ee = physics_createcontents([0:"physicscontents_water"]);
    var_aa517194e54f048b = physics_getclosestpointtosphere(droporigin, 16, 0, var_741196a281686ee, [], "physicsquery_any");
    if (istrue(var_aa517194e54f048b)) {
        var_7fe2df4a925adffe = 1;
    }
    contents = physics_createcontents([0:"physicscontents_playerclip", 1:"physicscontents_glass"]);
    caststart = droporigin;
    castdir = (0, 0, -1);
    var_64b62cb5dc1e7af6 = 60;
    castend = caststart + castdir * var_64b62cb5dc1e7af6;
    ignorelist = [0:self.hostage, 1:self.carryingplayer];
    var_aa517194e54f048b = physics_capsulecast(caststart + (0, 0, 24), castend, 4, 40, (0, 0, 90), contents, ignorelist, "physicsquery_closest");
    if (!isdefined(var_aa517194e54f048b) || var_aa517194e54f048b.size <= 0) {
        function_e07d74d7e0452e2b(var_9768b22610b34d9d);
        return;
    }
    hitent = var_aa517194e54f048b[0]["entity"];
    if (isdefined(hitent) && istrue(hitent.var_e6e657a1fa139548)) {
        var_9fbc564d9bb976ed = 1;
    }
    if (isdefined(hitent) && !function_cf6e0046827d08c(hitent, droporigin) || istrue(var_7fe2df4a925adffe) && !istrue(var_9fbc564d9bb976ed)) {
        function_e07d74d7e0452e2b(var_9768b22610b34d9d);
        return;
    }
    var_c72145d539d8d1a1 = var_aa517194e54f048b[0]["shape_position"];
    hitpos = var_aa517194e54f048b[0]["position"];
    spawnpos = var_c72145d539d8d1a1 - (0, 0, 20);
    var_7a2d144a06a00b97 = function_a2a73e5d91d2aae4(hitent);
    if (!isdefined(var_7a2d144a06a00b97) && namespace_91671cfc18616400::function_d9d18dab18ebded(self.carryingplayer getmovingplatformparent())) {
        var_7a2d144a06a00b97 = self.carryingplayer getmovingplatformparent();
    }
    if (isdefined(var_7a2d144a06a00b97)) {
        self.hostage.origin = droporigin;
        self.hostage.angles = dropangles;
        self.hostage.var_8ee3ff7543ac0b4 = var_37252b7e9c614d8;
        var_a53033c7ec33a23f = coordtransformtranspose(droporigin, var_7a2d144a06a00b97.origin, var_7a2d144a06a00b97.angles);
        localangles = function_848155be2b7da2cb(dropangles, var_7a2d144a06a00b97.angles);
        if (!isdefined(self.var_90758efde9b783b7)) {
            self.var_90758efde9b783b7 = spawn("script_origin", droporigin);
        }
        self.var_90758efde9b783b7.origin = droporigin;
        ismovingplatform = namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(var_7a2d144a06a00b97);
        if (istrue(ismovingplatform)) {
            self.var_90758efde9b783b7 linkto(var_7a2d144a06a00b97);
        } else {
            self.var_90758efde9b783b7 linkto(var_7a2d144a06a00b97, "tag_origin", var_a53033c7ec33a23f, localangles);
        }
        self.hostage linkto(self.var_90758efde9b783b7);
        thread watchformovingentdeath(var_7a2d144a06a00b97);
    } else {
        self.hostage.origin = droporigin;
        self.hostage.angles = dropangles;
        self.hostage.var_8ee3ff7543ac0b4 = var_37252b7e9c614d8;
    }
    self.hostage show();
    self.hostage.invulnerable = 0;
    function_6b3ac788a12c0dda(self.carryingplayer);
    animlength = undefined;
    if (isdefined(self.hostage) && istrue(self.hostage.var_44206360497f15c2) || !isdefined(self.carryingplayer)) {
        self.var_44206360497f15c2 = undefined;
        if (isdefined(self.carryingplayer) && isdefined(self.carryingplayer.var_73f4b954751a8643)) {
            self.carryingplayer takeweapon(self.carryingplayer.var_73f4b954751a8643);
        }
        waitframe();
    }
    self.hostage._blackboard.var_7460b96395361857 = "getting_dropped";
    animlength = getanimlength(script_model%iw9_mp_hostage_dropped_stand);
    if (!istrue(self.failure)) {
        self.instance setscriptablepartstate("dmz_hostage", "unusable");
    }
    if (isdefined(animlength)) {
        wait(animlength);
    }
    if (!istrue(self.failure)) {
        self.instance setscriptablepartstate("dmz_hostage", "remaining");
        if (istrue(self.var_2f893d4a9cbf8a5c)) {
            foreach (player in level.players) {
                self.instance enablescriptableplayeruse(player);
            }
        } else {
            foreach (player in level.players) {
                self.instance disablescriptableplayeruse(player);
            }
            teammates = getteamdata(self.teams[0], "players");
            foreach (teammate in teammates) {
                self.instance enablescriptableplayeruse(teammate);
            }
        }
        self.hostage._blackboard.var_7460b96395361857 = "dropped";
        self.instance.origin = self.hostage.origin;
        self.instance scriptablesetparententity(self.hostage, (0, 0, 15), (0, 0, 0));
        if (!istrue(self.var_2f893d4a9cbf8a5c)) {
            namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(self.icon, 30);
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.icon, self.hostage);
            self.var_b0f4bf8621b96c0a[0] function_4eaf685bc40a3b9();
        }
        self.carryingplayer = undefined;
        if (isdefined(var_7a2d144a06a00b97) && isent(var_7a2d144a06a00b97) && var_7a2d144a06a00b97 namespace_1f188a13f7e79610::isvehicle() && var_7a2d144a06a00b97.vehiclename == "veh9_palfa") {
            function_7cfc061c84dd495a(var_7a2d144a06a00b97);
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f97
// Size: 0x8d
function function_333f22ba123f0470() {
    self.carryingplayer endon("hostage_pickup_finished");
    thread function_a29878fb7affbc16();
    while (1) {
        self.instance.origin = self.hostage.origin;
        if (!istrue(self.var_2f893d4a9cbf8a5c)) {
            namespace_5a22b6f3a56f7e9b::update_objective_position(self.objidnum, self.hostage.origin + (0, 0, 30));
        }
        wait(0.05);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x502b
// Size: 0x38
function function_a29878fb7affbc16() {
    level endon("disconnect");
    self.carryingplayer waittill("hostage_pickup_finished");
    self.var_90758efde9b783b7 unlink();
    self.hostage unlink();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x506a
// Size: 0x6c
function function_e07d74d7e0452e2b(var_9768b22610b34d9d) {
    if (istrue(var_9768b22610b34d9d)) {
        self.hostage show();
        self.hostage.invulnerable = 0;
        function_6b3ac788a12c0dda(self.carryingplayer);
        self.hostage kill();
    } else {
        self.carryingplayer namespace_44abc05161e2e2cb::showerrormessage("MP_DMZ_MISSIONS/HOSTAGE_PLACE_ERR");
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50dd
// Size: 0x133
function function_6b3ac788a12c0dda(player) {
    if (isreallyalive(player) && !namespace_7e17181d03156026::isinlaststand(player)) {
        player.playerstreakspeedscale = 0;
        player setmovespeedscale(1);
        thread namespace_6d8fa3f81f071973::function_524f22fe698eeb0f(player);
        player skydive_setdeploymentstatus(1);
        player skydive_setbasejumpingstatus(1);
    } else {
        function_b7771cc818b41864(player);
        if (isdefined(player.var_7ebbb0dc14346eaa)) {
            player takeweapon(player.var_7ebbb0dc14346eaa);
            player.var_7ebbb0dc14346eaa = undefined;
        }
        if (isdefined(player.switchweapon)) {
            if (namespace_7e17181d03156026::isinlaststand(player)) {
                player.laststandoldweaponobj = player.switchweapon;
            }
            player.switchweapon = undefined;
        }
        player resetcarryobject();
    }
    player.var_859654e0445a36d9 = 0;
    player stopanimscriptsceneevent();
    player notify("remove_rig");
    if (isdefined(self.hostage) && isdefined(self.hostage.var_d5b5ffad0eca8c36)) {
        self.hostage.var_d5b5ffad0eca8c36 notify("remove_rig");
    }
    if (isdefined(player)) {
        player notify("drop_hostage");
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5217
// Size: 0x164
function function_cf6e0046827d08c(ent, origin) {
    if (isplayer(ent)) {
        return 0;
    }
    if (ent getnonstick()) {
        return 0;
    }
    if (istrue(ent.mountmantlemodel)) {
        return 0;
    }
    if (isdefined(ent.cover) && isdefined(ent.cover.equipmentref) && ent.cover.equipmentref == "equip_tac_cover") {
        return 0;
    }
    if (ent.classname == "misc_turret") {
        return 0;
    }
    if (ent.classname == "script_vehicle") {
        if (isdefined(ent.vehiclename) && ent.vehiclename == "veh9_civ_lnd_dirt_bike") {
            return 0;
        }
        if (ent namespace_1fbd40990ee60ede::function_a24042975031e692()) {
            foreach (point in [0:origin, 1:origin + (0, 0, -10), 2:origin + (0, 0, -20)]) {
                if (ent namespace_1fbd40990ee60ede::function_4e4cf75e0f7e4184(point)) {
                    return 1;
                }
            }
            return 0;
        }
        return 1;
    }
    return 1;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5383
// Size: 0x2b
function function_a2a73e5d91d2aae4(hitent) {
    if (isdefined(hitent)) {
        if (namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(hitent) || hitent namespace_1f188a13f7e79610::isvehicle()) {
            return hitent;
        }
        return 0;
    }
    return undefined;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53b6
// Size: 0x1d9
function function_eede562ce57290d3() {
    self.carryingplayer endon("drop_hostage");
    while (1) {
        if (!isdefined(self.instance)) {
            return;
        }
        if (!isdefined(self.carryingplayer)) {
            return;
        }
        start = self.carryingplayer geteye();
        ignore = [0:self.carryingplayer];
        if (isdefined(self.heli)) {
            ignore[ignore.size] = self.heli;
        }
        passed = namespace_2a184fc4902783dc::sphere_trace_passed(start, start + (0, 0, -25), 25, ignore);
        if (self.carryingplayer isonground() && passed) {
            state = self.instance getscriptablepartstate("dmz_hostage");
            if (isdefined(state) && state != "following") {
                self.instance setscriptablepartstate("dmz_hostage", "following");
                foreach (player in level.players) {
                    self.instance disablescriptableplayeruse(player);
                }
                self.instance enablescriptableplayeruse(self.carryingplayer);
            }
            forward = 5 * anglestoforward(self.carryingplayer getplayerangles());
            self.instance.origin = start + forward * 0.1;
        } else {
            self.instance setscriptablepartstate("dmz_hostage", "unusable");
        }
        waitframe();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5596
// Size: 0x6f
function function_cf6e805ce234f5e(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("drop_hostage");
    self endon("task_ended");
    while (1) {
        self.var_3d17023b5bfb92ce = player.origin;
        self.var_bff867759e490124 = player.angles;
        self.var_ab2a8c60478bdd5c = player getstance();
        waitframe();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x560c
// Size: 0x5b
function watchformovingentdeath(ent) {
    self endon("hostage_pickup_finished");
    self.hostage endon("death");
    self notify("watchForMovingEntDeath");
    self endon("watchForMovingEntDeath");
    ent waittill("death");
    self.hostage kill(self.hostage.origin);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x566e
// Size: 0x43
function watchforplayerdeath(player) {
    player endon("drop_hostage");
    player waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    player stopanimscriptsceneevent();
    player notify("remove_rig");
    thread drophostage(1);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56b8
// Size: 0x7c
function function_5ac14a79b2a4db6(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("drop_hostage");
    self.hostage waittill("death");
    player stopanimscriptsceneevent();
    player notify("remove_rig");
    if (isdefined(player.var_43e2c0fcf655ebac)) {
        player.var_43e2c0fcf655ebac notify("remove_rig");
        player.var_43e2c0fcf655ebac = undefined;
    }
    function_6b3ac788a12c0dda(self.carryingplayer);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573b
// Size: 0x35
function function_82ef6d194918247f(player) {
    player endon("drop_hostage");
    player endon("hostage_pickup_finished");
    thread function_cf6e805ce234f5e(player);
    thread function_5ac14a79b2a4db6(player);
    thread watchforplayerdeath(player);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5777
// Size: 0x1d6
function function_f0c2012ae22ca0d6(player) {
    player val::function_c9d0b43701bdba00("carry");
    player val::set("carry", "prone", 0);
    player val::set("carry", "slide", 0);
    player val::set("carry", "supersprint", 0);
    player val::set("carry", "mount_side", 0);
    player val::set("carry", "mount_top", 0);
    player val::set("carry", "mantle", 0);
    player val::set("carry", "equipment_secondary", 0);
    player val::set("carry", "equipment_primary", 0);
    player val::set("carry", "supers", 0);
    player val::set("carry", "melee", 0);
    player val::set("carry", "weapon_switch", 0);
    player val::set("carry", "swimming_underwater", 0);
    player val::set("carry", "dtp", 0);
    player val::set("carry", "ladder", 0);
    player val::set("carry", "weapon_pickup", 0);
    player val::set("carry", "weapon_switch_clip", 0);
    player val::set("carry", "killstreaks", 0);
    player val::set("carry", "execution_attack", 0);
    player val::set("carry", "vehicle_use", 0);
    player val::set("carry", "ascender_use", 0);
    player val::set("carry", "ads", 1);
    player skydive_setdeploymentstatus(0);
    player skydive_setbasejumpingstatus(0);
    player.playerstreakspeedscale = -0.25;
    player setmovespeedscale(0.75);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5954
// Size: 0x41
function function_b7771cc818b41864(player) {
    player val::function_c9d0b43701bdba00("carry");
    player skydive_setdeploymentstatus(1);
    player skydive_setbasejumpingstatus(1);
    player.playerstreakspeedscale = 0;
    player setmovespeedscale(1);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x599c
// Size: 0x61
function private function_cadc5181c3b67e3f(player) {
    self.var_eda575e1c30414d1 = player;
    bomb = makeweapon("briefcase_bomb_mp");
    player namespace_df5cfdbe6e2d3812::_giveweapon(bomb, undefined, undefined, 0);
    player setweaponammostock(bomb, 0);
    player setweaponammoclip(bomb, 0);
    player thread namespace_19b4203b51d56488::switchtouseweapon(bomb, 1, 1);
    player function_bf9ec93bee75f88c(0);
    return bomb;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a05
// Size: 0x76
function private function_db896f4486ca187(player, bomb) {
    lastweaponobj = player namespace_92e4af149e72dc29::getlastweapon();
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        lastweaponobj = namespace_68f1873625691c6::jugg_getminigunweapon();
    } else if (!player hasweapon(lastweaponobj)) {
        lastweaponobj = player namespace_92e4af149e72dc29::getfirstprimaryweapon();
    }
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(lastweaponobj, 0, 1);
    player takeweapon(bomb);
    player function_bf9ec93bee75f88c(1);
    self.var_eda575e1c30414d1 = undefined;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a82
// Size: 0x118
function private function_bf9ec93bee75f88c(isallowed) {
    val::set("hostage_holding_bomb", "allow_movement", isallowed);
    val::set("hostage_holding_bomb", "script_weapon_switch", !isallowed);
    val::set("hostage_holding_bomb", "sprint", isallowed);
    val::set("hostage_holding_bomb", "fire", isallowed);
    val::set("hostage_holding_bomb", "reload", isallowed);
    val::set("hostage_holding_bomb", "weapon_pickup", isallowed);
    val::set("hostage_holding_bomb", "weapon_switch", isallowed);
    val::set("hostage_holding_bomb", "allow_jump", isallowed);
    val::set("hostage_holding_bomb", "gesture", isallowed);
    self function_35501b42058d4de9();
    if (isallowed) {
        waittill_any_timeout_1(0.8, "bomb_allow_offhands");
    }
    val::set("hostage_holding_bomb", "melee", isallowed);
    val::set("hostage_holding_bomb", "mantle", isallowed);
    val::set("hostage_holding_bomb", "offhand_weapons", isallowed);
    if (isallowed) {
        val::function_c9d0b43701bdba00("hostage_holding_bomb");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba1
// Size: 0x31c
function function_b6b601986dcad85a() {
    var_b586c70b173dd02b = getstructarray(self.node.target, "targetname");
    var_b586c70b173dd02b = array_randomize(var_b586c70b173dd02b);
    self.hostage = undefined;
    foreach (spawnloc in var_b586c70b173dd02b) {
        if (!isdefined(spawnloc.script_noteworthy) || spawnloc.script_noteworthy != "hostage") {
            continue;
        }
        poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(spawnloc.origin);
        ai = namespace_bfef6903bca5845d::ai_mp_requestspawnagent("civilian_mp_dmz_hostage", getclosestpointonnavmesh(spawnloc.origin), spawnloc.angles, "absolute", "mission", undefined, "civs", "civilian", undefined, poiname, 1, undefined, 0);
        if (!isdefined(ai)) {
            return;
        }
        ai.var_b582b10663b5b2a9 = 0;
        ai.ignoreme = 1;
        ai.health = 250;
        ai.maxhealth = 250;
        ai function_9f82c74eb1b7caf9(0);
        ai function_b661b022700ba72f("script", 1);
        ai.var_a4738c70736d3a61 = &function_164927827f9f0870;
        ai namespace_aebb27832287cd3a::cap_start("cap_hostage", "civilian_dmz_hostage");
        ai.var_950c1ab89c9c4e2a = 1;
        ai.task = self;
        self.hostage = ai;
        level.agent_funcs[ai.agent_type]["on_damaged"] = &namespace_bfef6903bca5845d::function_779b9979fd853e26;
        ai.invulnerable = 1;
        break;
    }
    if (!isdefined(self.hostage)) {
        return;
    }
    self.instance = spawnscriptable("dmz_hostage", self.hostage.origin, (0, 0, 0));
    self.instance.hostage = self.hostage;
    self.hostage.instance = self.instance;
    self.instance.task = self;
    self.instance setscriptablepartstate("dmz_hostage", "unusable", 0);
    if (!istrue(self.var_2f893d4a9cbf8a5c)) {
        var_cfc7e6fb663bd626 = self.hostage.origin + anglestoright(self.hostage.angles) * -20;
        self.c4 = spawn("script_model", var_cfc7e6fb663bd626);
        self.c4 setmodel("offhand_2h_wm_briefcase_bomb_v0");
        self.c4.issuper = 0;
    }
    thread function_c0ccb94fcfe50916();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec4
// Size: 0xe3
function function_164927827f9f0870(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon) {
    var_379485f96865db6d = isdefined(eattacker) && (isplayer(eattacker) || isdefined(eattacker.owner) && isplayer(eattacker.owner));
    if (istrue(var_379485f96865db6d) && istrue(level.var_af7d80856e5ae6c0.var_7f494a83de6cfb1e)) {
        return;
    }
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5fae
// Size: 0x62
function private function_5511b411b075d27b() {
    /#
        self.hostage.origin = level.players[0].origin;
        self.hostage.instance.origin = level.players[0].origin;
    #/
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6017
// Size: 0x1da
function private function_14f7745b0a1250db() {
    var_b586c70b173dd02b = getstructarray(self.fort.target, "targetname");
    self.var_896452c986f0513b = [];
    if (isdefined(self.hostage) && isdefined(self.hostage.origin)) {
        var_b586c70b173dd02b = sortbydistance(var_b586c70b173dd02b, self.hostage.origin);
    }
    for (i = 0; i < var_b586c70b173dd02b.size; i++) {
        if (self.var_896452c986f0513b.size >= 8) {
            break;
        }
        spawnloc = var_b586c70b173dd02b[i];
        if (!isdefined(spawnloc.script_noteworthy) || !issubstr(spawnloc.script_noteworthy, "guard")) {
            continue;
        }
        var_1439f86640d42e34 = "ar";
        if (i == 1) {
            var_1439f86640d42e34 = "shotgun";
        }
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, undefined, "ar", 3);
        enemy = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, spawnloc.origin, spawnloc.angles, "high", "mission", "hostageGuard", undefined, undefined, undefined, self.node.poi, 0, undefined, 0);
        if (isdefined(enemy)) {
            function_67f905dfb8137021(enemy, 1);
            enemy namespace_2000a83505151e5b::function_304da84d9a815c01(enemy.origin, 16);
            enemy.var_b582b10663b5b2a9 = 0;
            self.var_896452c986f0513b[self.var_896452c986f0513b.size] = enemy;
            if (issubstr(aitype, "shotgun")) {
                if (!isdefined(self.var_68c8d20b77d4c93)) {
                    self.var_68c8d20b77d4c93 = enemy;
                }
            }
            thread namespace_2000a83505151e5b::function_b11c1964f528574b(enemy);
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f8
// Size: 0x6b
function function_67f905dfb8137021(agent, var_6c149286380290a2) {
    var_a664aad02ee98bd2 = random([0:"concussion_grenade_mp", 1:"smoke_grenade_mp", 2:"flash_grenade_mp"]);
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, undefined, var_a664aad02ee98bd2, grenadeammo, undefined, undefined);
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626a
// Size: 0xd0
function function_8dc13537721b3c2d() {
    self.task endon("task_ended");
    self endon("death");
    level endon("game_ended");
    while (1) {
        if (!isdefined(self)) {
            return;
        }
        state = self.task.state;
        if (!isdefined(state)) {
            state = "";
        }
        var_b09b7afe082a9239 = ter_op(isdefined(level.var_b58c6275920edf51), level.var_b58c6275920edf51, "dmzc");
        alias = function_422546a862beb2c7(state, var_b09b7afe082a9239);
        thread namespace_71a239de73c38174::function_e7c1c9dee13137aa(alias);
        if (state == "rescued") {
            return;
        }
        length = lookupsoundlength(alias);
        waittill_notify_or_timeout("play_dialog", length / 1000 + 4);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6341
// Size: 0xc7
function function_422546a862beb2c7(state, prefix) {
    nationality = ter_op(isdefined(level.var_ce11405f66c0872e), level.var_ce11405f66c0872e, "cvm3");
    var_b4648963b1ef138c = undefined;
    switch (state) {
    case #"hash_56049e7ee0845631":
        var_b4648963b1ef138c = "_creb";
        break;
    case #"hash_5548a62ed50ac006":
        var_b4648963b1ef138c = "_crec";
        break;
    case #"hash_a152dd6f2d4b9918":
        var_b4648963b1ef138c = "_cref";
        break;
    default:
        var_b4648963b1ef138c = "_cire";
        break;
    }
    alias = "dx_br_" + prefix + "_hore_" + nationality + var_b4648963b1ef138c;
    return alias;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6410
// Size: 0x2df
function function_df48d309a8bc55a() {
    function_5314298e777e5688("dmz_hostage_transport");
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_rescue_heli_incoming", self.teams[0], 5);
    wait(5);
    if (!istrue(self.failure)) {
        path = namespace_e8fceb5cf6e8cdf8::function_ed11ae9fe1abdeb(self.helinode, self.helinode.origin);
        if (!isdefined(path)) {
            if (!istrue(self.failure)) {
                thread function_cb2f74520e05756f(self.teams[0]);
            }
            return;
        }
        var_a3010f9814a40c8d = undefined;
        players = getteamdata(self.teams[0], "players");
        if (!isdefined(players)) {
            function_cb2f74520e05756f();
            return;
        }
        for (i = 0; i < players.size && !isdefined(var_a3010f9814a40c8d); i++) {
            var_a3010f9814a40c8d = players[i];
        }
        if (!isdefined(var_a3010f9814a40c8d)) {
            function_cb2f74520e05756f();
            return;
        }
        team = var_a3010f9814a40c8d.team;
        self.heli = namespace_e8fceb5cf6e8cdf8::function_d05f47d864f18196(var_a3010f9814a40c8d, path.origin, self.helinode.angles);
        thread namespace_e8fceb5cf6e8cdf8::function_a5fc6e8f9df1ccea(self.heli, self.helinode.origin);
        namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(self.heli, team);
        self.heli.onstartriding = &function_8ebf38fbb99af797;
        self.heli.onendriding = &function_f6685fad77b7f64d;
        self.heli.task = self;
        self.heli.helinode = self.helinode;
        self.heli.var_6881781e87586753 = 1;
        self.heli.var_a2ba7043631b3392 = 1;
        self.heli thread function_364ab6a28426c5ce(path);
    } else {
        return;
    }
    if (!istrue(self.failure)) {
        function_21d5138d3f032dd4();
    }
    if (!isdefined(self.var_540e563bd70483a2)) {
        return;
    }
    if (!istrue(self.completed)) {
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(self.icon, self.var_540e563bd70483a2);
    }
    if (!istrue(self.failure)) {
        self.hostage.invulnerable = 1;
    }
    while (!istrue(self.var_540e563bd70483a2.var_94cf3a68b99ae841)) {
        self.var_540e563bd70483a2 waittill("exfil_path_started");
    }
    thread function_2d144609316a301e(self.var_540e563bd70483a2);
    if (!istrue(self.failure)) {
        thread function_cb2f74520e05756f(self.teams[0]);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66f6
// Size: 0xf1
function function_7cfc061c84dd495a(heli) {
    if (istrue(heli.var_a2ba7043631b3392)) {
        self.instance setscriptablepartstate("dmz_hostage", "unusable");
        if (!isdefined(self.var_90758efde9b783b7)) {
            self.var_90758efde9b783b7 = spawn("script_origin", self.hostage.origin);
        }
        self.var_90758efde9b783b7.origin = self.hostage.origin;
        self.var_90758efde9b783b7 linkto(heli);
        self.hostage linkto(self.var_90758efde9b783b7);
        self.hostage.invulnerable = 1;
        self.var_49ad1a873f5f008b = 1;
        self.var_540e563bd70483a2 = heli;
        heli notify("dmz_exfil_hostage_inside");
        self notify("dmz_hostage_inside_heli");
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67ee
// Size: 0x13e
function function_364ab6a28426c5ce(path) {
    self endon("death");
    namespace_3bb9da687f15383d::vehicle_paths_helicopter(path);
    if (!istrue(self.helinode.info.land)) {
        self sethoverparams(0, 0, 0);
    }
    if (!istrue(self.task.completed)) {
        self.task waittill_any_2("dmz_hostage_inside_heli", "task_ended");
    }
    if (istrue(self.task.failure)) {
        function_8c05501355cc8322();
    }
    self.var_94cf3a68b99ae841 = 1;
    self notify("exfil_path_started");
    namespace_e8fceb5cf6e8cdf8::function_18d68b06fa34264b(self);
    path = namespace_e8fceb5cf6e8cdf8::function_1093b8f392744e3b(self.helinode, self.helinode.origin, level.var_251923794d7ecf20.heliheight);
    thread namespace_3bb9da687f15383d::vehicle_paths_helicopter(path);
    wait(8);
    if (!istrue(self.failure)) {
        info = namespace_e8fceb5cf6e8cdf8::function_730c660d9fc6808e(self.var_878914b0358bc7b5, 0, 1, 0, 0);
        namespace_25b25d188ef778c4::function_309c0a11484cc0db(self.var_878914b0358bc7b5, info);
    }
    wait(15);
    thread namespace_e8fceb5cf6e8cdf8::function_ed686fcbc5363b3();
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6933
// Size: 0xfe
function function_8ebf38fbb99af797(player) {
    if (!array_contains_key(self.var_878914b0358bc7b5, player.guid)) {
        self.var_878914b0358bc7b5[player.guid] = player;
        namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
        if (!istrue(self.task.var_be20b95d97b75707)) {
            self.task.var_be20b95d97b75707 = 1;
            namespace_446fc987a980892f::function_9793a81bc3bc19e9("hostage_lower_heli", self.task.teams[0]);
        }
    }
    if (istrue(self.task.var_49ad1a873f5f008b) && isdefined(self.var_75adb7f3cbe5d522)) {
        if (!isdefined(player.var_a09b2cb47a28054a)) {
            self.var_902a7ffcff8aa65[self.var_902a7ffcff8aa65.size] = player;
            player thread namespace_25b25d188ef778c4::function_496941bf27af77b1(self.origin, self.var_75adb7f3cbe5d522, 2000);
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a38
// Size: 0x33
function function_f6685fad77b7f64d(player) {
    self.var_878914b0358bc7b5[player.guid] = undefined;
    if (namespace_d9c77dc2a6fe29c6::isoobimmune(player)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6a72
// Size: 0x16a
function function_662ca8c888b5eb6(startnode, heliheight, reverse) {
    if (!isdefined(reverse)) {
        reverse = 0;
    }
    var_3fb4a86293ed25a6 = 10;
    contents = create_contents(0, 1, 1, 1, 1, 0, 1, 1, 0);
    startpos = startnode.origin + (0, 0, heliheight + 600);
    var_3674d96c61e2dd0d = ter_op(reverse, startnode.angles[1] + 180, startnode.angles[1]);
    yaw = 0;
    while (yaw < 360) {
        var_3674d96c61e2dd0d = var_3674d96c61e2dd0d + yaw;
        testangles = (0, var_3674d96c61e2dd0d, 0);
        var_29006f80487a7787 = startpos;
        var_dd77d0a6d708ac18 = startpos + anglestoforward(testangles) * 18000;
        var_d4eb961f60968a16 = sphere_trace(var_29006f80487a7787, var_dd77d0a6d708ac18, 100, undefined, contents, 1);
        if (var_d4eb961f60968a16["fraction"] == 1) {
            /#
                line(var_29006f80487a7787, var_dd77d0a6d708ac18, (0, 1, 0), 1, 0, 2000);
            #/
            return var_dd77d0a6d708ac18;
        }
        /#
            line(var_29006f80487a7787, var_dd77d0a6d708ac18, (1, 0, 0), 1, 0, 2000);
        #/
        if (yaw % 3 == 0) {
            waitframe();
        }
        yaw = yaw + var_3fb4a86293ed25a6;
    }
    return undefined;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6be4
// Size: 0x22
function function_21d5138d3f032dd4() {
    self endon("task_ended");
    while (!isdefined(self.var_540e563bd70483a2)) {
        self waittill("dmz_hostage_inside_heli");
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c0d
// Size: 0xee
function function_9597b6c3f099d3d7() {
    self.task endon("task_ended");
    if (!istrue(self.var_49ad1a873f5f008b)) {
        self waittill("dmz_exfil_hostage_inside");
    }
    self.var_75adb7f3cbe5d522 = 5;
    foreach (player in self.var_878914b0358bc7b5) {
        if (!isdefined(player.var_a09b2cb47a28054a)) {
            self.var_902a7ffcff8aa65[self.var_902a7ffcff8aa65.size] = player;
            player thread namespace_25b25d188ef778c4::function_496941bf27af77b1(self.origin, self.var_75adb7f3cbe5d522, 2000);
        }
    }
    while (self.var_75adb7f3cbe5d522 > 0) {
        self.var_75adb7f3cbe5d522 = self.var_75adb7f3cbe5d522 - 1;
        wait(1);
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d02
// Size: 0xf9
function function_8c05501355cc8322() {
    self endon("death");
    level endon("game_ended");
    var_c82efe11c4073af4 = [];
    while (1) {
        wait(1);
        var_7408ed52662703d3 = utility::playersincylinder(self.origin, 665, undefined, 500);
        foreach (player in var_7408ed52662703d3) {
            if (!isdefined(var_c82efe11c4073af4[player.guid])) {
                var_c82efe11c4073af4[player.guid] = gettime();
            }
            if (gettime() - var_c82efe11c4073af4[player.guid] > 5000) {
                player namespace_44abc05161e2e2cb::showerrormessage("MP_DMZ_MISSIONS/HOSTAGE_HELI_MSG");
                var_c82efe11c4073af4[player.guid] = gettime();
            }
        }
        if (var_7408ed52662703d3.size == 0) {
            break;
        }
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e02
// Size: 0x6d
function function_2d144609316a301e(heli) {
    heli waittill("death");
    if (isdefined(self.hostage) && isalive(self.hostage) && istrue(self.var_49ad1a873f5f008b)) {
        self.hostage namespace_bfef6903bca5845d::function_28b90eb2b591003f();
    }
    if (isdefined(self.var_90758efde9b783b7)) {
        self.var_90758efde9b783b7 delete();
    }
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e76
// Size: 0x2ef
function function_f0c7539dc72c3dfd() {
    alllocations = array_randomize(getstructarray("hostage_setup", "targetname"));
    validlocations = [];
    var_a940c1ac967427fe = array_randomize(getstructarray("dmz_hostage_exfil", "script_noteworthy"));
    foreach (loc in alllocations) {
        isvalid = 1;
        if (!isdefined(loc.target)) {
            continue;
        }
        var_b586c70b173dd02b = getstructarray(loc.target, "targetname");
        foreach (spawnloc in var_b586c70b173dd02b) {
            if (isdefined(spawnloc.script_noteworthy) && spawnloc.script_noteworthy == "hostage") {
                pos = getclosestpointonnavmesh(spawnloc.origin);
                if (distance(pos, spawnloc.origin) > 100) {
                    isvalid = 0;
                    break;
                }
            }
        }
        if (!isvalid) {
            continue;
        }
        fortress = namespace_9823ee6035594d67::function_bbe42d7091bedfc5(loc.origin, "hostage_forts");
        if (!isdefined(fortress)) {
            continue;
        }
        if (distance2dsquared(fortress.origin, loc.origin) > level.var_af7d80856e5ae6c0.var_82a01ce31b77ac5c * level.var_af7d80856e5ae6c0.var_82a01ce31b77ac5c || array_contains(level.var_f1073fbd45b59a06.var_df987907a483df89, fortress)) {
            continue;
        }
        mindist = 12000;
        foreach (heli in var_a940c1ac967427fe) {
            dist = distance(loc.origin, heli.origin);
            if (!istrue(heli.chosen) && dist < mindist) {
                mindist = dist;
                loc.helinode = heli;
            }
        }
        if (isdefined(loc.helinode)) {
            loc.helinode.chosen = 1;
        } else {
            isvalid = 0;
        }
        if (isvalid) {
            validlocations[validlocations.size] = loc;
        }
    }
    return validlocations;
}

// Namespace namespace_ae2d053cbf559cee/namespace_232aeaeb467df5bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x716d
// Size: 0x47
function function_f2a1117679fc06d1() {
    /#
        while (1) {
            if (getdvarint(@"hash_c387ab1458383808", 0)) {
                setdvar(@"hash_c387ab1458383808", 0);
                if (isdefined(self.carryingplayer)) {
                    drophostage(1);
                }
            }
            waitframe();
        }
    #/
}

