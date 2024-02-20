// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_7e4d332e911e1b90;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_930a1e7bd882c1d;
#using script_72a196b6c7df2f38;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using script_51f5154861435b1e;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;

#namespace namespace_c65dff0327632a52;

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a
// Size: 0x77
function function_31325dbf3212f5ec(var_e8562c6f1c5aa36f, outtime) {
    if (!istrue(self.var_347d5ae936d746ca)) {
        self.var_347d5ae936d746ca = 1;
        self.var_45883368ef469ae1 = var_e8562c6f1c5aa36f;
        self.var_3207c3128c689f62 = outtime;
        if (var_e8562c6f1c5aa36f == "nothing_here") {
            namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
        } else {
            if (function_de1a3f69eddee923(var_e8562c6f1c5aa36f)) {
                self setclientomnvar("ui_wm_using_smart_phone", 1);
            }
            thread namespace_f87a4b6569ce73b2::function_b5216a6d7bd17210(var_e8562c6f1c5aa36f, 1);
        }
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b8
// Size: 0x8b
function function_dac4b69b3dfb574e() {
    self.var_347d5ae936d746ca = 0;
    if (isdefined(self.var_45883368ef469ae1)) {
        if (self.var_45883368ef469ae1 == "nothing_here") {
            namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
        } else {
            outtime = 0;
            if (isdefined(self.var_3207c3128c689f62)) {
                outtime = self.var_3207c3128c689f62;
            }
            self stopgestureviewmodel(self.var_45883368ef469ae1, outtime, 0);
            if (function_de1a3f69eddee923(self.var_45883368ef469ae1)) {
                self setclientomnvar("ui_wm_using_smart_phone", 0);
            }
        }
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54a
// Size: 0x25
function function_de1a3f69eddee923(var_e8562c6f1c5aa36f) {
    if (var_e8562c6f1c5aa36f == "jup_war_ges_phone_laser" || var_e8562c6f1c5aa36f == "jup_war_ges_phone_laser") {
        return 1;
    }
    return 0;
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x577
// Size: 0x38
function function_7fbb162293aff03(delaytime) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(delaytime) || delaytime <= 0) {
        function_dac4b69b3dfb574e();
        return;
    }
    wait(delaytime);
    function_dac4b69b3dfb574e();
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b6
// Size: 0x1c1
function function_a73751aa083ea6f8(groupname) {
    if (!isdefined(level.var_db436f956e7b261a)) {
        level.var_db436f956e7b261a = [];
        level.var_db436f956e7b261a["repair_tank"] = [0:1, 1:1];
        level.var_db436f956e7b261a["hacking_1_mp_jup_launchfacility"] = [0:2, 1:2];
        level.var_db436f956e7b261a["hacking_2_mp_jup_launchfacility"] = [0:3, 1:2];
        level.var_db436f956e7b261a["recovering_1_mp_jup_launchfacility"] = [0:2, 1:3];
        level.var_db436f956e7b261a["recovering_2_mp_jup_launchfacility"] = [0:3, 1:3];
        level.var_db436f956e7b261a["hacking_1_mp_jup_skydiving"] = [0:2, 1:8];
        level.var_db436f956e7b261a["hacking_2_mp_jup_skydiving"] = [0:3, 1:8];
        level.var_db436f956e7b261a["recovering_1_mp_jup_skydiving"] = [0:2, 1:9];
        level.var_db436f956e7b261a["recovering_2_mp_jup_skydiving"] = [0:3, 1:9];
        level.var_db436f956e7b261a["build"] = [0:0, 1:4];
        level.var_db436f956e7b261a["build_turret"] = [0:0, 1:1];
        level.var_db436f956e7b261a["destroy"] = [0:0, 1:5];
        level.var_db436f956e7b261a["planting"] = [0:4, 1:6];
        level.var_db436f956e7b261a["defusing"] = [0:5, 1:7];
    }
    return level.var_db436f956e7b261a[groupname];
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77f
// Size: 0x20
function function_e3cd4f9e858ab6ee(player, groupname) {
    thread function_c1374c6a7773817a(player, groupname, 1);
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0x1f
function function_3b593f41f5abb32b(player, groupname) {
    thread function_c1374c6a7773817a(player, groupname, 0);
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cc
// Size: 0x10a
function function_c1374c6a7773817a(player, groupname, var_5ce63c3cab218ff) {
    level endon("game_ended");
    self endon("deleted");
    self endon("hide_interact_progress");
    self notify("show_interact_progress");
    self endon("show_interact_progress");
    group = function_a73751aa083ea6f8(groupname);
    var_8946c3e2e95da2f8 = group[0];
    var_d21fbb4b1a8635a8 = group[1];
    if (isdefined(self.ownerteam)) {
        player setclientomnvar("ui_wm_objective_friendly_owner", player.team == self.ownerteam);
    }
    player setclientomnvar("ui_wm_interacting_icon", var_8946c3e2e95da2f8);
    player setclientomnvar("ui_wm_interacting_string", var_d21fbb4b1a8635a8);
    progress = undefined;
    while (1) {
        if (istrue(var_5ce63c3cab218ff)) {
            progress = self.curprogress / self.usetime;
        } else {
            progress = self.var_e9c36927989c0cb3;
        }
        if (isdefined(progress)) {
            player setclientomnvar("ui_wm_interacting_progress", progress);
        }
        waitframe();
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dd
// Size: 0x21
function function_c470fe81662c7d70(player) {
    self notify("hide_interact_progress");
    player setclientomnvar("ui_wm_interacting_progress", 0);
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x905
// Size: 0xec
function function_58adcd73bec6efe9(zone, eventname, var_c99f96abc50e7cd6, delaytime, context, var_dd01b0197289588a, var_a86ac46ef036b2b6) {
    if (!isdefined(zone) || !isdefined(level.var_e0c2583425a6613b[zone])) {
        /#
            assertmsg("wrong zone name!");
        #/
        return;
    }
    event = spawnstruct();
    event.zone = zone;
    event.eventname = eventname;
    event.var_57b9b5a4757c3b88 = var_c99f96abc50e7cd6;
    event.delaytime = delaytime;
    event.context = context;
    event.var_dd01b0197289588a = var_dd01b0197289588a;
    event.var_a86ac46ef036b2b6 = var_a86ac46ef036b2b6;
    level.var_e0c2583425a6613b[zone][level.var_e0c2583425a6613b[zone].size] = event;
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f8
// Size: 0x75
function function_d2957f8c3bb2978(var_6ab393f73d49c853) {
    level endon("game_ended");
    level endon(var_6ab393f73d49c853 + "_objective_end");
    if (isdefined(self.var_a86ac46ef036b2b6)) {
        level endon(self.var_a86ac46ef036b2b6);
    }
    if (isdefined(self.var_dd01b0197289588a)) {
        self [[ self.var_dd01b0197289588a ]]();
    } else {
        wait(self.delaytime);
    }
    if (isdefined(self.var_57b9b5a4757c3b88)) {
        self [[ self.var_57b9b5a4757c3b88 ]]();
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa74
// Size: 0xd5
function function_b3f327a076ec28fc() {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    foreach (var_6ab393f73d49c853 in level.var_320406591b4dc0fc) {
        namespace_4b0406965e556711::gameflagwait(var_6ab393f73d49c853 + "_objective_start");
        if (isdefined(level.var_e0c2583425a6613b[var_6ab393f73d49c853])) {
            foreach (event in level.var_e0c2583425a6613b[var_6ab393f73d49c853]) {
                event thread function_d2957f8c3bb2978(var_6ab393f73d49c853);
            }
        }
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb50
// Size: 0x1cc
function function_df6579cb4cbfbcfd(animstruct) {
    level.brspawnplayersending = 1;
    level notify("brSpawnPlayersEnding");
    foreach (player in level.players) {
        player painvisionoff();
        player notify("ending_cinematic");
        player function_b88c89bb7cd1ab8e(animstruct.origin);
        player utility::hidehudenable();
        player setcinematicmotionoverride("disabled");
        player setclientomnvar("ui_hide_hud", 1);
        if (isdefined(player.sessionstate)) {
            if (player.sessionstate == "intermission") {
                player namespace_7e17181d03156026::updatesessionstate("spectator");
            }
            if (player.sessionstate == "spectator") {
                player setspectatedefaults(animstruct.cam.origin, animstruct.cam.angles);
                player spawn(animstruct.cam.origin, animstruct.cam.angles);
            } else {
                player setorigin(animstruct.origin);
            }
        }
    }
    foreach (player in level.players) {
        player playerlinkto(animstruct.cam, "tag_player");
        player playerhide();
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd23
// Size: 0x7b
function function_9a2fc80f0c0ef3b0() {
    player = self;
    if (!isreallyalive(player)) {
        player.alreadyaddedtoalivecount = 1;
        player namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    }
    player cameraunlink();
    player _freezecontrols(1);
    player namespace_81156089ff1fe819::endprematchskydiving();
    player painvisionoff();
    player notify("ending_cinematic");
    player utility::hidehudenable();
    player setcinematicmotionoverride("disabled");
    player setclientomnvar("ui_hide_hud", 1);
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda5
// Size: 0x7d
function function_e31fc10a143fc19() {
    var_24a5853aafd26ce8 = namespace_32d725839544d40a::function_8a37fe423de2b9db();
    scenelength = 0;
    foreach (name in var_24a5853aafd26ce8) {
        second = namespace_32d725839544d40a::function_d9be975d8d1c9db3(name);
        scenelength = scenelength + second;
    }
    return scenelength;
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2a
// Size: 0x15e
function function_204ff26efb937261(showhint, origin, team, var_1daf42081ed5d776, fov, hintstring) {
    if (istrue(showhint) && !isdefined(hintstring)) {
        return;
    }
    if (!isdefined(self.var_4476c803cafcc218)) {
        self.var_4476c803cafcc218 = spawn("script_model", origin);
    }
    trigger = self.var_4476c803cafcc218;
    if (istrue(showhint)) {
        trigger makeusable();
        trigger sethintdisplayrange(var_1daf42081ed5d776);
        trigger sethintdisplayfov(fov);
        trigger setuserange(var_1daf42081ed5d776);
        trigger setusefov(fov);
        trigger sethintonobstruction("show");
        trigger setcursorhint("HINT_NOBUTTON");
        trigger sethintstring(hintstring);
        trigger setusepriority(-1 - 1 - 1 - 1);
        foreach (player in level.players) {
            if (!is_equal(player.pers["team"], team)) {
                trigger disableplayeruse(player);
            } else {
                trigger enableplayeruse(player);
            }
        }
    } else {
        trigger makeunusable();
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8f
// Size: 0x5e
function function_6b73db5099aa7a56() {
    foreach (player in level.players) {
        player setclientomnvar("ui_wm_objective_show_match_status", 1);
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff4
// Size: 0x5d
function function_798f8bdeee7f862f() {
    foreach (player in level.players) {
        player setclientomnvar("ui_wm_objective_show_match_status", 0);
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1058
// Size: 0x7e
function function_134331ffde3c261a() {
    if (!isdefined(level.tacinserts)) {
        return;
    }
    foreach (tacinsert in level.tacinserts) {
        if (isdefined(tacinsert) && !istrue(tacinsert.isdestroyed)) {
            tacinsert thread namespace_add8ab90fc53d7f7::tacinsert_destroy(1);
        }
    }
}

// Namespace namespace_c65dff0327632a52/namespace_4d0d143cd3171cd5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10dd
// Size: 0x12a
function function_51039de6a7a95d10(ents) {
    var_c50f59673b4204a1 = self;
    foreach (ent in ents) {
        if (isdefined(ent) && !istrue(ent.markedfordelete) && ent istouching(var_c50f59673b4204a1)) {
            if (isdefined(ent.equipmentref)) {
                if (ent.equipmentref == "equip_tac_cover") {
                    ent namespace_e76aa51cbf8812ee::tac_cover_destroy(undefined, 0);
                } else if (ent.equipmentref == "equip_tac_camera") {
                    ent namespace_ec12f2e19aa34cc8::function_fb4a392282a75942();
                }
            } else if (isdefined(ent.streakinfo) && isdefined(ent.streakinfo.var_ebec497ff8b18a45)) {
                if (ent.streakinfo.var_ebec497ff8b18a45 == "super_recon_drone") {
                    ent namespace_bba8bc8532aa4913::function_ba1c5496f8fc5f67(undefined);
                }
            }
            ent.markedfordelete = 1;
        }
    }
}

