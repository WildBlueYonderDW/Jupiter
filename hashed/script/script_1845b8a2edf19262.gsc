// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_3ab210ea917601e7;
#using script_6617e2f2bb62b52b;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\hud_message.gsc;
#using script_7b2517368c79e5bc;
#using script_208955cb4d2c8fb3;
#using script_43971bbeefd98f05;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\anim.gsc;

#namespace namespace_733126084ca779c5;

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cd
// Size: 0xf1
function function_77a37b3f4896fc9b() {
    if (!istrue(level.var_adf7379f14500889)) {
        namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body", &function_37918fa831854a31);
        function_965a91ee1fe1a428();
        game["dialog"]["safecrack_safe_is_near"] = "dx_br_dmzo_cost_ovld_actualtoultra1target";
        game["dialog"]["safecrack_safe_bringing_heat"] = "dx_br_dmzo_cost_ovld_ultra1beadvisedthats";
        game["dialog"]["safecrack_enemies_incoming"] = "dx_br_dmzo_cost_ovld_ultra1yougothostiles";
        game["dialog"]["safecrack_enemies_alerted"] = "dx_br_dmzo_cost_ovld_headsupultra1thatsaf";
        game["dialog"]["safecrack_safe_is_open0"] = "dx_br_dmzo_cost_ovld_ultra1thesafeisopens";
        game["dialog"]["safecrack_safe_is_open1"] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu";
        game["dialog"]["safecrack_safe_is_open2"] = "dx_br_dmzo_cost_ovld_ultra1safeisopensecu_01";
        game["dialog"]["safecrack_enemies_at_safe"] = "dx_br_dmzo_cost_ovld_ultra1enemyoperators";
        game["dialog"]["safecrack_enemies_near_safe"] = "dx_br_dmzo_cost_ovld_actualtoultra1enemie";
        game["dialog"]["safecrack_enemies_opening_safe"] = "dx_br_dmzo_cost_ovld_ultra1hostilesareatt";
        level.var_adf7379f14500889 = 1;
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5
// Size: 0x1f2
function function_12920ead9cafd0e1(origin, angles) {
    safe = spawnscriptable("safecrack_safe", origin, angles);
    safe setscriptablepartstate("body", "usable_not_open");
    safe.activity = self;
    safe.poi = self.poi;
    safe.var_55bb3585d29af1be = &function_76ab1a108d9b14ef;
    safe.curorigin = safe.origin;
    safe.offset3d = (0, 0, 15);
    safe namespace_19b4203b51d56488::requestid(1, 1, undefined, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(safe.objidnum, "ui_map_icon_safe");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(safe.objidnum, 15);
    namespace_5a22b6f3a56f7e9b::update_objective_position(safe.objidnum, safe.origin + (0, 0, 15));
    namespace_5a22b6f3a56f7e9b::objective_pin_global(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(safe.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(safe.objidnum, 0);
    if (level.var_68fa4b22b3752b02.var_f73c5aa20a9c44d5) {
        namespace_5a22b6f3a56f7e9b::function_9cad42ac02eff950(safe.objidnum);
    } else {
        namespace_5a22b6f3a56f7e9b::function_a28e8535e00d34f3(safe.objidnum);
    }
    namespace_5a22b6f3a56f7e9b::function_6ae37618bb04ea60(safe.objidnum);
    safe.trigger = spawn("trigger_radius", safe.origin, 0, self.capture_radius, self.capture_radius);
    safe.trigger trigger_off();
    safe thread function_e210529ea288eb50();
    return safe;
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bf
// Size: 0x14
function private function_76ab1a108d9b14ef(instance, player) {
    
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9da
// Size: 0x21c
function private function_37918fa831854a31(safe, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (isdefined(player) && istrue(player.var_859654e0445a36d9)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP/DENY_USE_CARRY");
        return;
    }
    if (state == "usable_not_open") {
        thread function_70ff902643fc02d(safe, part, state, player);
    } else if (state == "open_usable") {
        if (safe getscriptableparthasstate(part, "fully_opening_unusable")) {
            safe setscriptablepartstate(part, "fully_opening_unusable");
        }
        if (!isdefined(safe.contents)) {
            safe notify("safe_looted");
            safe.var_46a3a8565ac0c17c = 4;
            safe.var_6a4915c949e9e77e = 1;
            items = namespace_2abc885019e1956::function_bc2f4857c90f5344(safe.activity.var_48c4ba670a4f33fc, safe.activity.var_614385c59920cb82);
            foreach (item in items) {
                var_770523006511b66b = item;
                if (function_35aa0ab850bda2a(var_770523006511b66b)) {
                    newitem = safe.key;
                    if (isdefined(newitem)) {
                        var_770523006511b66b = newitem;
                    } else {
                        var_54d38f1df370976a = namespace_ad1f398af6f48cb1::function_621b23491ba1db4d();
                        if (isdefined(var_54d38f1df370976a)) {
                            var_770523006511b66b = var_54d38f1df370976a.var_6fa7637317187a6a;
                        } else {
                            var_770523006511b66b = undefined;
                        }
                    }
                }
                if (isdefined(var_770523006511b66b)) {
                    namespace_3883e3399f2870b5::function_ff5a53c1d3232e2f(safe, 1, var_770523006511b66b);
                }
            }
        }
        namespace_3883e3399f2870b5::function_30f5ea60517f9e06(safe, player);
    } else if (isdefined(safe.contents) && state == "partially_open_usable") {
        if (safe getscriptableparthasstate(part, "fully_opening_unusable")) {
            safe setscriptablepartstate(part, "fully_opening_unusable");
        }
        namespace_3883e3399f2870b5::function_30f5ea60517f9e06(safe, player);
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfd
// Size: 0x17
function private function_35aa0ab850bda2a(item) {
    return issubstr(item, "human_fortress");
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc1c
// Size: 0x15f
function private function_70ff902643fc02d(safe, part, state, player) {
    safe setscriptablepartstate(part, "unusable");
    safe.var_b14a331ba425c286 = 0;
    safe thread function_4322c5f15901c02a(player);
    safe function_7c9992633ba2713f(player);
    if (istrue(safe.var_b14a331ba425c286)) {
        safe.teams = [0:player.team];
        safe.trigger trigger_on();
        function_bbdcd857d0c2a65e(safe.activity, player, "PlayerJoinedInteract");
        if (isdefined(safe.activity) && isdefined(safe.activity.var_f6bc8fb4bf53a955)) {
            safe [[ safe.activity.var_f6bc8fb4bf53a955 ]]();
        }
        safe notify("safe_unlocking");
        safe.var_208c5333afcd7102 = 1;
        namespace_5a22b6f3a56f7e9b::update_objective_state(safe.objidnum, "current");
        namespace_5a22b6f3a56f7e9b::objective_show_progress(safe.objidnum, 1);
        namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(safe.objidnum, player.team);
        safe thread function_b54d1f4a457190bd();
    } else {
        safe setscriptablepartstate(part, "usable_not_open");
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd82
// Size: 0x270
function private function_b54d1f4a457190bd() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.progress = 0;
    var_306804c6c85c36b0 = undefined;
    var_94947ef251bf06d8 = 0;
    var_90fb369a18926018 = [];
    capturetime = getdvarint(@"hash_f123359584819a3a", self.activity.capture_time);
    while (1) {
        if (isdefined(self.trigger) && !istrue(self.trigger.trigger_off)) {
            if (!isdefined(var_306804c6c85c36b0)) {
                var_306804c6c85c36b0 = [0:0, 1:capturetime / 4, 2:capturetime / 2, 3:capturetime / 100 * 75];
            }
            if (self.nearbyplayers.size > 0) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = min(capturetime, self.progress + level.framedurationseconds);
                namespace_5a22b6f3a56f7e9b::objective_pin_global(self.objidnum, 1);
            } else if (self.activity.var_e964223850a88d72) {
                var_f8527642ea162ae5 = self.progress;
                self.progress = max(0, self.progress - level.framedurationseconds * 0.5);
                namespace_5a22b6f3a56f7e9b::objective_pin_global(self.objidnum, 0);
            }
            progress = self.progress / capturetime;
            var_90fb369a18926018 = function_f64c5b47c182d6f2(self.nearbyplayers, var_90fb369a18926018, progress);
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
            if (self.progress >= capturetime) {
                thread function_77a40230d4dd9af0();
            } else if (self.nearbyplayers.size > 0 && isdefined(var_306804c6c85c36b0[var_94947ef251bf06d8]) && self.progress >= var_306804c6c85c36b0[var_94947ef251bf06d8]) {
                var_94947ef251bf06d8++;
                if (isdefined(self.activity) && isdefined(self.activity.var_999c4a8370c90a74)) {
                    self [[ self.activity.var_999c4a8370c90a74 ]]();
                }
                if (!istrue(self.var_d062a6468e65034e) && var_94947ef251bf06d8 == 2) {
                    self.shouldreinforce = 1;
                }
            } else if (self.nearbyplayers.size == 0 && var_94947ef251bf06d8 > 0) {
                var_94947ef251bf06d8 = 0;
            }
        }
        waitframe();
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xff9
// Size: 0x114
function private function_f64c5b47c182d6f2(nearbyplayers, var_90fb369a18926018, progress) {
    allplayers = array_combine(nearbyplayers, var_90fb369a18926018);
    var_f6fd7b0e73c3270c = var_90fb369a18926018;
    foreach (player in allplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!array_contains(var_90fb369a18926018, player) && array_contains(nearbyplayers, player)) {
            if (namespace_5a22b6f3a56f7e9b::function_ce702e5925e31fc9(self.objidnum, player, 1, 2, "MP_DMZ_MISSIONS/OPENING_SAFE")) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objidnum, player);
                var_f6fd7b0e73c3270c = array_add(var_f6fd7b0e73c3270c, player);
            }
        } else if (array_contains(var_90fb369a18926018, player) && !array_contains(nearbyplayers, player)) {
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            var_f6fd7b0e73c3270c = array_remove(var_f6fd7b0e73c3270c, player);
        }
    }
    return var_f6fd7b0e73c3270c;
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1115
// Size: 0x269
function private function_77a40230d4dd9af0() {
    if (!istrue(self.unlocked)) {
        self.unlocked = 1;
    }
    foreach (team in self.teams) {
        foreach (player in getteamdata(team, "players")) {
            namespace_5a22b6f3a56f7e9b::objective_unpin_player(self.objidnum, player);
            namespace_5a22b6f3a56f7e9b::function_26259bd38697b5ad(self.objidnum, player);
            if (!isdefined(player.var_6b41d67653e80c4b)) {
                player.var_6b41d67653e80c4b = 0;
            }
            player.var_6b41d67653e80c4b++;
            if (isdefined(player.var_d1e277c70c37ea5a)) {
                self.var_10505f0fb3d81db4 = 1;
            }
        }
        params = spawnstruct();
        params.safe = self;
        self.activity callback::callback("safe_opened", params);
        if (isdefined(self.var_10505f0fb3d81db4)) {
            self.var_208c5333afcd7102 = undefined;
        } else {
            self.activity function_1281c7fff9456e18("safecrack_unlocked", getteamdata(team, "players"));
        }
    }
    self setscriptablepartstate("body", "opening");
    if (isdefined(self.activity) && isdefined(self.activity.var_ed83b7d0440fb3b1)) {
        self [[ self.activity.var_ed83b7d0440fb3b1 ]]();
    }
    self.trigger delete();
    namespace_19b4203b51d56488::releaseid();
    self notify("safe_unlocked");
    var_d27680ff86693f5c = spawnstruct();
    var_d27680ff86693f5c.safe = self;
    foreach (player in self.nearbyplayers) {
        player callback::callback("safe_opened_nearby", var_d27680ff86693f5c);
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1385
// Size: 0xbe
function private function_e210529ea288eb50() {
    level endon("game_ended");
    self endon("safe_unlocked");
    self.nearbyplayers = [];
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isplayer(player) || array_contains(self.nearbyplayers, player)) {
            continue;
        }
        if (!array_contains(self.teams, player.team)) {
            self.teams[self.teams.size] = player.team;
        }
        self.nearbyplayers = array_add(self.nearbyplayers, player);
        childthread function_19aa45f456e9a8c5(player);
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x144a
// Size: 0x8c
function private function_19aa45f456e9a8c5(player) {
    while (isdefined(self.trigger) && isdefined(player) && isalive(player) && distancesquared(self.trigger.origin, player.origin) < 1.1 * self.activity.var_82fe1c44f0e59dd5) {
        wait(0.2);
    }
    self.nearbyplayers = array_remove(self.nearbyplayers, player);
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14dd
// Size: 0xc7
function private function_965a91ee1fe1a428() {
    level.scr_animtree["safe_drill_player"] = %script_model;
    level.scr_anim["safe_drill_player"]["safedrill_enter"] = script_model%iw9_dmz_safedrill_enter_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_enter"] = %"safedrill_enter";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_enter"] = "iw9_dmz_safedrill_enter_sdr";
    level.scr_anim["safe_drill_player"]["safedrill_exit"] = script_model%iw9_dmz_safedrill_exit_sdr;
    level.scr_eventanim["safe_drill_player"]["safedrill_exit"] = %"safedrill_exit";
    level.scr_viewmodelanim["safe_drill_player"]["safedrill_exit"] = "iw9_dmz_safedrill_exit_sdr";
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ab
// Size: 0x2c4
function private function_7c9992633ba2713f(player) {
    player endon("death_or_disconnect");
    player endon("enter_live_ragdoll");
    player endon("interact_interrupt");
    player function_e8369984e9eef428(0);
    var_a66fd1b124c32f51 = player getplayerangles();
    player.linktoent = player spawn_tag_origin(player.origin, player.var_a66fd1b124c32f51);
    player playerlinktodelta(player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 0, 1);
    goalpos = self.origin + rotatevector((50.586, -6.262, 0), self.angles);
    forward = (0, 0, 0) - anglestoforward(self.angles);
    up = (0, 0, 1);
    right = vectorcross(forward, up);
    goalangles = axistoangles(forward, right, up);
    var_57c87883ae437750 = 0.5;
    player.linktoent moveto(goalpos, var_57c87883ae437750, 0.1, 0.1);
    player.linktoent rotateto(goalangles, var_57c87883ae437750, 0.1, 0.1);
    player setstance("stand");
    var_cd9982adb17761a8 = gettime();
    player namespace_df5cfdbe6e2d3812::function_fc6a5b145563be33();
    var_698cc218e4ade75f = gettime();
    var_218f64cb035d54be = var_57c87883ae437750 - (var_698cc218e4ade75f - var_cd9982adb17761a8) / 1000;
    waittime = max(0, var_218f64cb035d54be);
    wait(waittime);
    player setorigin(goalpos);
    player setplayerangles(goalangles);
    player thread namespace_7624a117b05021c5::infil_player_rig_updated("safe_drill_player", player.origin, player.angles);
    player.player_rig showonlytoplayer(player);
    self setscriptablepartstate("body", "unusable_intro_drilling");
    namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "safedrill_enter");
    if (isreallyalive(player)) {
        namespace_4e680905778c0f0f::anim_player_solo(player, player.player_rig, "safedrill_exit");
    }
    if (isdefined(player) && isreallyalive(player)) {
        player notify("interact_finished");
    }
    waitframe();
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(player)) {
        player notify("remove_rig");
        if (isreallyalive(player)) {
            player function_e8369984e9eef428(1);
        }
    }
    self.var_b14a331ba425c286 = 1;
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1876
// Size: 0x129
function private function_e8369984e9eef428(isallowed) {
    if (!isallowed) {
        val::set("drilling", "allow_jump", 0);
        val::set("drilling", "gesture", 0);
        val::set("drilling", "melee", 0);
        val::set("drilling", "mantle", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "allow_movement", 0);
        val::set("drilling", "sprint", 0);
        val::set("drilling", "fire", 0);
        val::set("drilling", "reload", 0);
        val::set("drilling", "weapon_pickup", 0);
        val::set("drilling", "weapon_switch", 0);
        val::set("drilling", "offhand_weapons", 0);
        val::set("drilling", "execution_victim", 0);
        val::set("drilling", "vehicle_use", 0);
        self function_35501b42058d4de9();
    } else {
        val::function_c9d0b43701bdba00("drilling");
        self function_bb04491d50d9e43e();
    }
}

// Namespace namespace_733126084ca779c5/namespace_4a32b5725832011a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19a6
// Size: 0x7d
function private function_4322c5f15901c02a(player) {
    player endon("interact_finished");
    player namespace_3c37cb17ade254d::waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "last_stand_start");
    player notify("interact_interrupt");
    player stopanimscriptsceneevent();
    if (isdefined(player.linktoent)) {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }
    player notify("remove_rig");
    player function_e8369984e9eef428(1);
}

