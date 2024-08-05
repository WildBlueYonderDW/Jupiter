#using script_3212cc02a2700260;
#using scripts\common\utility.gsc;
#using scripts\stealth\manager.gsc;
#using script_26265e158b27bdda;
#using scripts\sp\utility.gsc;
#using script_35de402efc5acfb3;
#using scripts\sp\anim.gsc;
#using scripts\sp\stealth\player.gsc;
#using scripts\engine\utility.gsc;

#namespace manager;

// Namespace manager / scripts\sp\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x1c2
function main() {
    scripts\stealth\manager::main();
    level.player thread scripts\stealth\manager::update_stealth_spotted_thread();
    level thread scripts\stealth\manager::manager_thread();
    if (getdvarint(@"hash_6109644d57e1122e")) {
        namespace_2ab3cc97bdf86f18::stealth_suspicious_doors_init();
    }
    assertex(isdefined(level.stealth), "level.stealth should have been defined in scriptsstealthmanager::main()");
    level.stealth.fnplayerlootenabled = &scripts\sp\utility::playerlootenabled;
    level.stealth.fnsetbattlechatter = &utility::set_battlechatter;
    level.stealth.fnaddeventplaybcs = &namespace_378f8281e2d12ced::addeventplaybcs;
    level.stealth.fnanimgenericcustomanimmode = &scripts\sp\anim::anim_generic_custom_animmode;
    level.stealth.fnthreatsightplayersightaudio = &threat_sight_player_sight_audio;
    level.stealth.var_585390079b597cd6 = &function_9b25540da1b89219;
    level notify("threat_sight_audio_enabled");
    level.stealth.var_ed06a52046d9f7a1 = &function_82079fb63bda0995;
    level.stealth.var_45cffb1cb64f32c7 = &function_e4eaeef9e706471e;
    level.stealth.fnsetstealthmode = &set_stealth_mode_sp;
    setdvarifuninitialized(@"hash_50363b4004713d67", 1);
    setdvarifuninitialized(@"hash_82eb856681438f08", 1);
    setdvarifuninitialized(@"hash_3a810db500922b6c", 0);
    if (getdvarint(@"hash_50363b4004713d67")) {
        level.stealth.fnsixthsense = &scripts\sp\stealth\player::sixthsense_init;
    }
    function_f35cc6439852ee86([level.player]);
    bctable_setfiles("stealth", "sp/stealth_chatter_base.csv", "sp/stealth_chatter_ambient.csv");
}

// Namespace manager / scripts\sp\stealth\manager
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0xbe
function set_stealth_mode_sp(enabled, musichidden, musicspotted) {
    if (enabled) {
        foreach (player in level.players) {
            player thread scripts\sp\stealth\player::ambient_player_thread();
        }
        return;
    }
    foreach (player in level.players) {
        player thread scripts\sp\stealth\player::ambient_player_stop();
    }
}

// Namespace manager / scripts\sp\stealth\manager
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ae
// Size: 0x7bd
function threat_sight_player_sight_audio(anycansee, maxthreat, var_67e8151f4dfc690b) {
    self endon("disconnect");
    self endon("death");
    self notify("threat_sight_player_sight_audio");
    self endon("threat_sight_player_sight_audio");
    level endon("threat_sight_audio_disabled");
    /#
        if (!isdefined(var_67e8151f4dfc690b)) {
            var_67e8151f4dfc690b = 0;
        }
    #/
    aliases = ["ui_stealth_threat_low_lp", "ui_stealth_threat_med_lp", "ui_stealth_threat_high_lp"];
    rumble = "damage_light";
    if (!getdvarint(@"hash_21b72d8c9ff7a1b3", 0)) {
        maxthreat = 0;
    }
    if (!isdefined(self.stealth.threat_sight_snd_ent) && anycansee && maxthreat > 0) {
        self.stealth.threat_sight_snd_ent = [];
        self.stealth.threat_sight_snd_vol = 0;
        self.stealth.threat_sight_snd_threat = 0;
        foreach (index, alias in aliases) {
            snd_ent = spawn("script_origin", self.origin);
            if (!isplayer(self)) {
                thread scripts\engine\utility::delete_on_death(snd_ent);
            }
            snd_ent linkto(self);
            snd_ent scalevolume(0, 0);
            snd_ent.isplaying = 0;
            self.stealth.threat_sight_snd_ent[alias] = snd_ent;
        }
    }
    /#
        if (var_67e8151f4dfc690b) {
            printtoscreen2d(32, 492, "<dev string:x1c>" + maxthreat + "<dev string:x2a>" + anycansee + "<dev string:x2d>", (1, 1, 1), 1.5);
        }
    #/
    if (isdefined(self.stealth.threat_sight_snd_ent)) {
        self.stealth.threat_sight_snd_threat -= self.stealth.threat_sight_snd_threat * 0.125;
        self.stealth.threat_sight_snd_threat += maxthreat * 0.125;
        if (self.stealth.threat_sight_snd_threat < 0.0001) {
            self.stealth.threat_sight_snd_threat = 0;
        }
        maxthreat = self.stealth.threat_sight_snd_threat;
    }
    while (isdefined(self.stealth.threat_sight_snd_ent)) {
        index = 0;
        var_cfaeeea72851152d = 0;
        if (maxthreat > 0) {
            var_1cda86eccb821ec6 = function_8ba164c5a84fbb48(self);
            if (maxthreat < 0.05) {
                var_2df1b1f3e5b6238c = clamp(maxthreat, 0, 0.05);
                mu = var_2df1b1f3e5b6238c / 0.05;
                vol_delta = 0.99;
                vol_lerp = 0.01 + vol_delta * mu;
                self.stealth.threat_sight_snd_vol = vol_lerp;
            } else {
                self.stealth.threat_sight_snd_vol = 1;
            }
        } else {
            self.stealth.threat_sight_snd_vol = 0;
            self.stealth.threat_sight_snd_threat = 0;
        }
        self.stealth.threat_sight_snd_vol = clamp(self.stealth.threat_sight_snd_vol, 0, 1);
        /#
            if (var_67e8151f4dfc690b) {
                printtoscreen2d(32, 508, "<dev string:x2f>" + self.stealth.threat_sight_snd_threat, (1, 1, 1), 1.5);
            }
            if (var_67e8151f4dfc690b) {
                printtoscreen2d(32, 524, "<dev string:x3d>" + self.stealth.threat_sight_snd_vol, (1, 1, 1), 1.5);
            }
        #/
        foreach (alias, snd_ent in self.stealth.threat_sight_snd_ent) {
            coef = 1;
            switch (index) {
            case 0: 
                if (maxthreat < 0.75) {
                    coef = cos(180 * maxthreat * 0.666);
                } else {
                    coef = 0;
                }
                break;
            case 1: 
                if (maxthreat < 0.75) {
                    coef = sin(180 * maxthreat * 0.666);
                } else if (maxthreat < 1) {
                    coef = sin(180 * (1 - maxthreat) * 2);
                } else {
                    coef = 0;
                }
                break;
            case 2: 
                if (maxthreat < 0.75) {
                    coef = 0;
                } else {
                    coef = cos(180 * (1 - maxthreat) * 2);
                }
                break;
            }
            vol = clamp(self.stealth.threat_sight_snd_vol * coef, 0, 1);
            if (vol > 0) {
                var_cfaeeea72851152d = 1;
                if (snd_ent.isplaying == 0) {
                    snd_ent scalevolume(0, 0);
                    mapname = getdvar(@"hash_687fb8f9b7a23245");
                    if (mapname != "marina") {
                        snd_ent scripts\engine\utility::delaycall(0.05, &playloopsound, alias);
                    }
                    snd_ent.isplaying = 1;
                }
                snd_ent scalevolume(vol, 0.05);
                snd_ent scripts\engine\utility::delaycall(0, &scalevolume, vol, 0.05);
            } else if (snd_ent.isplaying == 1) {
                snd_ent scalevolume(0, 0.05);
                snd_ent scripts\engine\utility::delaycall(0.05, &stoploopsound);
                snd_ent.isplaying = 0;
            }
            /#
                if (var_67e8151f4dfc690b) {
                    printtoscreen2d(32, 540 + index * 16, "<dev string:x4b>" + index + "<dev string:x52>" + vol, (1, 1, 1), 1.5);
                }
                if (var_67e8151f4dfc690b) {
                    printtoscreen2d(384, 540 + index * 16, "<dev string:x59>" + coef, (1, 1, 1), 1.5);
                }
            #/
            index++;
        }
        if (!var_cfaeeea72851152d) {
            foreach (alias, snd_ent in self.stealth.threat_sight_snd_ent) {
                snd_ent scalevolume(0, 0.05);
                snd_ent stoploopsound();
                snd_ent scripts\engine\utility::delaycall(0.05, &delete);
            }
            self.stealth.threat_sight_snd_ent = undefined;
            self.stealth.threat_sight_snd_vol = undefined;
            self.stealth.threat_sight_snd_threat = undefined;
        }
        wait 0.05;
    }
}

// Namespace manager / scripts\sp\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc73
// Size: 0xfc
function function_9b25540da1b89219() {
    if (isdefined(self.stealth.threat_sight_snd_ent)) {
        fade_time = self.stealth.threat_sight_snd_threat / 0.125;
        foreach (snd_ent in self.stealth.threat_sight_snd_ent) {
            snd_ent scalevolume(0, fade_time);
            snd_ent scripts\engine\utility::delaycall(fade_time, &stoploopsound);
            snd_ent scripts\engine\utility::delaycall(fade_time + 0.05, &delete);
        }
        self stoprumble("damage_light");
        self.stealth.threat_sight_snd_ent = undefined;
        self.stealth.threat_sight_snd_vol = undefined;
        self.stealth.threat_sight_snd_threat = undefined;
    }
}

// Namespace manager / scripts\sp\stealth\manager
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd77
// Size: 0x127
function function_82079fb63bda0995(anycansee, maxthreat) {
    if ((!isdefined(level.stealth.var_a87c21e5a33857a6) || level.stealth.var_a87c21e5a33857a6 <= 0) && maxthreat > 0 && maxthreat < 1) {
        self playrumblelooponentity("damage_light");
    } else if (isdefined(level.stealth.var_a87c21e5a33857a6) && level.stealth.var_a87c21e5a33857a6 > 0 && maxthreat <= 0) {
        self stoprumble("damage_light");
    } else if ((!isdefined(level.stealth.var_a87c21e5a33857a6) || isdefined(level.stealth.var_a87c21e5a33857a6) && level.stealth.var_a87c21e5a33857a6 < 1) && maxthreat >= 1) {
        self stoprumble("damage_light");
        self playrumbleonentity("damage_heavy");
    }
    level.stealth.var_a87c21e5a33857a6 = maxthreat;
}

// Namespace manager / scripts\sp\stealth\manager
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xea6
// Size: 0xe
function function_e4eaeef9e706471e() {
    self stoprumble("damage_light");
}

