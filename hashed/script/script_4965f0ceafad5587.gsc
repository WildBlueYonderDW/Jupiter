// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using script_38eb8f4be20d54f4;
#using script_41387eecc35b88bf;
#using script_3e2f8cc477d57433;
#using script_58be75c518bf0d40;
#using script_638d701d263ee1ed;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace ob_achievements;

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x311
// Size: 0x126
function init() {
    callback::add("on_ai_killed", &on_ai_killed);
    callback::add("ob_exfil_success", &ob_exfil_success);
    callback::add("zm_perk_obtained", &function_d46f3d95c0a6c68e);
    callback::add("on_tombstone_used_cache", &on_tombstone_used_cache);
    callback::add("player_revived", &on_player_revived);
    callback::add("player_team_revived", &on_player_revived);
    callback::add(#"hash_83238eee27237eeb", &on_player_revived);
    callback::add("on_hellhound_petted", &on_hellhound_petted);
    callback::add("ob_act3_completed", &ob_act3_completed);
    callback::add("ActivitySuccess", &function_618308f7a88d3d10);
    level.var_b9d0664093495a01 = getdvarint(@"hash_43d8974a0ee14c9f", 1);
    level.var_b2be94493bac612e = getdvarfloat(@"hash_6610d94e63d88554", 1);
    if (istrue(level.var_b9d0664093495a01)) {
        callback::add("player_connect", &on_player_connect);
    }
    level.var_9e70fbe6be476d54 = throttle::function_e4c99b0f178ffb98("ob_achievements", 2);
    /#
        level thread function_c9e6fc61ad0c665f();
    #/
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x43e
// Size: 0x1b0
function private function_c9e6fc61ad0c665f() {
    /#
        var_f041094a76e3b231 = [0:"jup_ob_conqueror", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>", 8:"<unknown string>", 9:"<unknown string>", 10:"<unknown string>", 11:"<unknown string>", 12:"<unknown string>"];
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        foreach (var_45191fa57864b212 in var_f041094a76e3b231) {
            n_required = function_a08380cd8b1316e5(var_45191fa57864b212);
            if (isdefined(n_required)) {
                var_cbbc62a23ead5290 = "<unknown string>" + var_45191fa57864b212;
                devgui::function_b23a59dfb4ca49a1(var_45191fa57864b212, var_cbbc62a23ead5290, &function_e07c698369eb6f3e);
            }
        }
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        foreach (var_45191fa57864b212 in var_f041094a76e3b231) {
            n_required = function_a08380cd8b1316e5(var_45191fa57864b212);
            if (isdefined(n_required)) {
                var_8d08f244175aa0ac = "<unknown string>" + var_45191fa57864b212 + "<unknown string>" + n_required;
            } else {
                var_8d08f244175aa0ac = "<unknown string>" + var_45191fa57864b212;
            }
            devgui::function_b23a59dfb4ca49a1(var_45191fa57864b212, var_8d08f244175aa0ac, &function_f497beeb72b05f82);
        }
        devgui::function_fe953f000498048f();
    #/
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5f5
// Size: 0x63
function private function_e07c698369eb6f3e(params) {
    /#
        var_45191fa57864b212 = params[0];
        n_increment = params[1];
        n_required = function_a08380cd8b1316e5(var_45191fa57864b212);
        if (isdefined(n_required) && n_required > 1) {
            level.players[0] function_82b80153d3189adc(var_45191fa57864b212, 1, 1, n_required);
        }
    #/
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x65f
// Size: 0x73
function private function_f497beeb72b05f82(params) {
    /#
        var_45191fa57864b212 = params[0];
        n_required = params[1];
        if (isdefined(n_required)) {
            n_required = int(n_required);
        }
        if (isdefined(n_required) && n_required > 1) {
            level.players[0] function_82b80153d3189adc(var_45191fa57864b212, 1, n_required, n_required);
        } else {
            level.players[0] function_82b80153d3189adc(var_45191fa57864b212);
        }
    #/
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d9
// Size: 0xda
function private function_a08380cd8b1316e5(var_45191fa57864b212) {
    switch (var_45191fa57864b212) {
    case #"hash_c668de0e0aa7b10b":
        break;
    case #"hash_19ef00f30250a013":
        break;
    case #"hash_6e9a2470687663d3":
        break;
    case #"hash_7651423ef91c37d3":
        break;
    case #"hash_575532a7b068d9cb":
        break;
    case #"hash_313cf9d5eb4cd33d":
        return 20;
    case #"hash_b50213bb983d6f05":
        break;
    case #"hash_90cba3b822c4768f":
        break;
    case #"hash_52522f4303268b93":
        break;
    case #"hash_678e72fa0bb96fba":
        return 50000;
    case #"hash_3c317b7614468e55":
        break;
    case #"hash_b8a06661976052bd":
        return 500;
    case #"hash_27bde0f50a43f4b0":
        break;
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ba
// Size: 0x4e
function private ob_act3_completed(params) {
    function_82b80153d3189adc("jup_ob_theend");
    var_c9b69aecc5c631ed = namespace_ca7b90256548aa40::getsquadmembers();
    if (var_c9b69aecc5c631ed.size >= 6 || level.players.size >= 6) {
        function_82b80153d3189adc("jup_ob_oneagainstall");
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80f
// Size: 0x121
function private function_618308f7a88d3d10(params) {
    activity = self;
    playerlist = params.playerlist;
    if (isdefined(playerlist) && isdefined(activity) && isdefined(activity.category) && activity.category == "Contract") {
        foreach (player in playerlist) {
            player function_82b80153d3189adc("jup_ob_hiredgun", 1, 1, 20);
            str_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(player.origin);
            if (str_difficulty == "difficulty_hard") {
                if (!isdefined(player.var_5c45109a6a105ff4)) {
                    player.var_5c45109a6a105ff4 = 0;
                }
                player.var_5c45109a6a105ff4++;
                if (player.var_5c45109a6a105ff4 == 5) {
                    player function_82b80153d3189adc("jup_ob_seeingred");
                }
            }
        }
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x937
// Size: 0x6e
function private function_386de0e32b56c00d(var_45191fa57864b212) {
    if (istrue(level.var_b9d0664093495a01)) {
        if (!isdefined(self.var_9a27e17e83d266c8)) {
            self.var_9a27e17e83d266c8 = [];
        }
        if (!isdefined(self.var_9a27e17e83d266c8[var_45191fa57864b212])) {
            self.var_9a27e17e83d266c8[var_45191fa57864b212] = 0;
        }
        self.var_9a27e17e83d266c8[var_45191fa57864b212]++;
    } else {
        function_82b80153d3189adc(var_45191fa57864b212, 1, 1, function_a08380cd8b1316e5(var_45191fa57864b212));
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9ac
// Size: 0xa1
function private on_player_connect(params) {
    self endon("disconnect");
    self.var_9a27e17e83d266c8 = [];
    while (1) {
        foreach (var_45191fa57864b212, n_kill_count in self.var_9a27e17e83d266c8) {
            if (n_kill_count > 0) {
                function_82b80153d3189adc(var_45191fa57864b212, 1, n_kill_count, function_a08380cd8b1316e5(var_45191fa57864b212));
                self.var_9a27e17e83d266c8[var_45191fa57864b212] = 0;
            }
        }
        wait(level.var_b2be94493bac612e);
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa54
// Size: 0x18
function private on_hellhound_petted(params) {
    function_82b80153d3189adc("jup_ob_youcanpetthedog");
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa73
// Size: 0x6c
function private on_player_revived(params) {
    reviver = params.reviver;
    if (isplayer(reviver)) {
        var_9b0dd04874627a99 = reviver namespace_ca7b90256548aa40::getsquadmembers();
        if (!function_fc64178f71375137(var_9b0dd04874627a99, self) && self != reviver || istrue(params.var_26ac2a3a59347b9e)) {
            reviver function_82b80153d3189adc("jup_ob_helpfulstranger");
        }
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xae6
// Size: 0x18
function private on_tombstone_used_cache(params) {
    function_82b80153d3189adc("jup_ob_backfromthedead");
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0x28
function private function_d46f3d95c0a6c68e(params) {
    if (self.perks_active.size == 9) {
        function_82b80153d3189adc("jup_ob_perkaholic");
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb34
// Size: 0x18
function private ob_exfil_success(params) {
    function_82b80153d3189adc("jup_ob_andsoitbegins");
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb53
// Size: 0x24b
function private on_ai_killed(params) {
    player = params.eattacker;
    if (isdefined(player) && !isplayer(player) && isplayer(player.owner)) {
        player = player.owner;
    }
    if (isplayer(player)) {
        player function_386de0e32b56c00d("jup_ob_slaughterhouse");
        currentweapon = params.sweapon;
        if (player namespace_fe9526a81c458d8f::function_852cd6dd29c274bd(currentweapon)) {
            player function_386de0e32b56c00d("jup_ob_writeoff");
        }
        if (isdefined(params.einflictor) && params.einflictor namespace_1f188a13f7e79610::isvehicle()) {
            if (!isdefined(player.var_b0980987caa20fe4)) {
                player.var_b0980987caa20fe4 = 0;
            }
            player.var_b0980987caa20fe4++;
            if (player.var_b0980987caa20fe4 == 100) {
                player function_82b80153d3189adc("jup_ob_gravestone");
            }
        }
        if (isdefined(self.subclass)) {
            if (self.subclass == "zombie_deathworm") {
                if (isarray(self.var_21a8839dd03e31cd)) {
                    foreach (player in self.var_21a8839dd03e31cd) {
                        if (isplayer(player)) {
                            var_c9b69aecc5c631ed = player namespace_ca7b90256548aa40::getsquadmembers();
                            if (var_c9b69aecc5c631ed.size >= 6 || var_c9b69aecc5c631ed.size >= getdvarint(@"hash_340b01b20673c44e", 6)) {
                                player function_82b80153d3189adc("jup_ob_oneagainstall");
                            }
                        }
                    }
                }
            } else if (issubstr(self.subclass, "warlord")) {
                if (isarray(self.var_21a8839dd03e31cd)) {
                    foreach (player in self.var_21a8839dd03e31cd) {
                        if (isplayer(player)) {
                            player function_82b80153d3189adc("jup_ob_conqueror");
                        }
                    }
                }
            }
        }
    }
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda5
// Size: 0x39
function private function_82b80153d3189adc(var_45191fa57864b212, var_f9da27eee32186cd, n_increment, n_required) {
    if (!isdefined(var_f9da27eee32186cd)) {
        var_f9da27eee32186cd = 0;
    }
    thread function_cd2135758f3d9f79(var_45191fa57864b212, var_f9da27eee32186cd, n_increment, n_required);
}

// Namespace ob_achievements/namespace_15c1ca6387c6a341
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde5
// Size: 0x14a
function private function_cd2135758f3d9f79(var_45191fa57864b212, var_f9da27eee32186cd, n_increment, n_required) {
    if (!isdefined(var_f9da27eee32186cd)) {
        var_f9da27eee32186cd = 0;
    }
    self endon("disconnect");
    if (getdvarint(@"hash_53c8688bfb276373", 1)) {
        throttle::function_f632348cbb773537(level.var_9e70fbe6be476d54, self);
        if (var_f9da27eee32186cd) {
            var_27bcd76455d26c2b = self getplayerdata(level.var_5d69837cf4db0407, var_45191fa57864b212);
            var_29afdcc23a1e855f = var_27bcd76455d26c2b + n_increment;
            self setplayerdata(level.var_5d69837cf4db0407, var_45191fa57864b212, var_29afdcc23a1e855f);
            self function_6a369480dbaf1090(var_45191fa57864b212, var_29afdcc23a1e855f);
            var_5724a7d91348b937 = "==OB UpdateAchievementProgress " + var_45191fa57864b212 + ": " + var_29afdcc23a1e855f + " of " + n_required + " Required, by " + self.name;
            logstring(var_5724a7d91348b937);
        } else {
            self giveachievement(var_45191fa57864b212);
            var_436b70922a7eb005 = "==OB GiveAchievement " + var_45191fa57864b212 + " completed by " + self.name;
            logstring(var_436b70922a7eb005);
        }
    }
    /#
        if (getdvarint(@"hash_6ac2c4ff3a214246", 0)) {
            if (var_f9da27eee32186cd && isdefined(var_5724a7d91348b937)) {
                iprintlnbold(var_5724a7d91348b937);
            } else if (isdefined(var_436b70922a7eb005)) {
                iprintlnbold(var_436b70922a7eb005);
            }
        }
    #/
}

