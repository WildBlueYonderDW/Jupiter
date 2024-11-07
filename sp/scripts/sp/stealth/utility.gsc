#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\anim.gsc;
#using scripts\stealth\debug.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using script_35de402efc5acfb3;
#using scripts\stealth\player.gsc;

#namespace utility;

// Namespace utility / scripts\sp\stealth\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x704
// Size: 0x88
function try_announce_sound(snd, delaytime, eventstruct) {
    if (isalive(self) && !should_sound_take_priority(snd)) {
        return 0;
    }
    self notify("try_announce_sound_" + snd);
    self endon("try_announce_sound_" + snd);
    self endon("death");
    self endon("long_death");
    if (isdefined(delaytime) && delaytime > 0) {
        wait delaytime;
    }
    if (!can_announce_sound(snd)) {
        self.stealth.current_requested_snd = undefined;
        return 0;
    }
    return play_stealth_vo(snd, undefined, eventstruct);
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x795
// Size: 0x77
function should_sound_take_priority(snd) {
    if (!isdefined(self.stealth.current_requested_snd)) {
        self.stealth.current_requested_snd = snd;
        return true;
    }
    if (get_snd_priority(snd) < get_snd_priority(self.stealth.current_requested_snd)) {
        self.stealth.current_requested_snd = snd;
        return true;
    }
    return false;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x815
// Size: 0x15e
function get_snd_priority(snd) {
    switch (snd) {
    case #"hash_1d0022d9b49074c0":
    case #"hash_412938e72fd9ab35":
    case #"hash_4b0ca4ada825424a":
    case #"hash_9567f12963cd5717":
    case #"hash_f4eac828cdfe2da9":
        return 1;
    case #"hash_184bba7053cc1c15":
    case #"hash_5ee535013b151894":
    case #"hash_7ba904b9ea76ffca":
    case #"hash_a10f8380ee2f93c0":
    case #"hash_ea5a333788b85a6b":
        return 2;
    case #"hash_42197ed1ee6aca75":
    case #"hash_4bfca0c6798b2ca8":
    case #"hash_acae7c77d0d3323d":
    case #"hash_c9585df770639ae7":
    case #"hash_e229e5eb3ca60422":
        return 3;
    case #"hash_5567fda2832cbf6e":
    case #"hash_9ef2596c4c4ce657":
    case #"hash_c5c143ba1ce58744":
        return 4;
    case #"hash_54ef1367f3b7f44c":
    case #"hash_be58fabf4815ede6":
    case #"hash_d90155acf1b84c47":
    case #"hash_d90156acf1b84dda":
    case #"hash_ebe703549b311e56":
    case #"hash_f3cf146b324c8eb7":
        return 5;
    default:
        iprintln("Can't get priority for snd " + snd);
        return undefined;
    }
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x97b
// Size: 0xa5
function can_announce_sound(snd) {
    if (!isalive(self)) {
        return false;
    }
    if (istrue(self.in_melee_death)) {
        return false;
    }
    if (!isdefined(level.stealth.next_sound_time) || !isdefined(level.stealth.next_sound_time[snd])) {
        level.stealth.next_sound_time[snd] = -10;
    }
    time = gettime();
    if (time < level.stealth.next_sound_time[snd]) {
        return false;
    }
    add_announce_debounce(snd);
    return true;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa29
// Size: 0xd3
function add_announce_debounce(snd, delaytime) {
    self endon("death");
    if (isdefined(delaytime) && delaytime > 0) {
        wait delaytime;
    }
    if (isarray(snd)) {
        foreach (var_ad31d3f4297a5bab in snd) {
            level.stealth.next_sound_time[var_ad31d3f4297a5bab] = gettime() + level.stealth.next_sound_wait;
        }
        return;
    }
    level.stealth.next_sound_time[snd] = gettime() + level.stealth.next_sound_wait;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb04
// Size: 0x70d
function play_stealth_vo(snd, var_63eab21a30b0ace, eventstruct) {
    result = 0;
    var_2fbd15f53beeba71 = undefined;
    if (!isdefined(self.stealth.voiceid)) {
        return 0;
    }
    prefix = "dx_bcs_";
    if (istrue(var_63eab21a30b0ace)) {
        prefix = get_country_prefix();
    }
    switch (snd) {
    case #"hash_184bba7053cc1c15":
        snd = "_movein_" + randomintrange(1, 4);
        break;
    case #"hash_c9585df770639ae7":
        snd = "_searchcont_" + randomintrange(1, 5);
        break;
    case #"hash_acae7c77d0d3323d":
        if (distance(self.origin, level.player.origin) < 450) {
            vol = "low";
        } else {
            vol = "high";
        }
        if (cointoss()) {
            snd = "_losloss_" + vol + "_" + randomintrange(1, 4);
        } else {
            snd = "_enemylost_" + randomintrange(1, 7) + "_" + vol;
        }
        break;
    case #"hash_ea5a333788b85a6b":
        snd = "_dronefound_" + randomintrange(1, 4);
        break;
    case #"hash_d90156acf1b84dda":
        snd = "_enemyalerted";
        break;
    case #"hash_ebe703549b311e56":
        snd = "_backtopatrol";
        break;
    case #"hash_d90155acf1b84c47":
        snd = "_enemysearch";
        break;
    case #"hash_a10f8380ee2f93c0":
        snd = "_enemybackup";
        break;
    case #"hash_5ee535013b151894":
        snd = "_hunting_" + randomintrange(1, 5);
        break;
    case #"hash_f3cf146b324c8eb7":
        if (self.stealth.voiceid == "sf1") {
            snd = "_reinforcements_" + randomintrange(1, 7);
            if (isdefined(eventstruct) && isdefined(eventstruct.entity) && isai(eventstruct.entity) && isalive(eventstruct.entity) && distance2d(self.origin, eventstruct.entity.origin) >= 350) {
                var_2fbd15f53beeba71 = eventstruct.entity;
            }
        } else {
            snd = "_reinforcements";
        }
        break;
    case #"hash_7ba904b9ea76ffca":
        if (cointoss()) {
            snd = "_targetfound";
        } else {
            snd = "_contact";
        }
        break;
    case #"hash_4bfca0c6798b2ca8":
    case #"hash_e229e5eb3ca60422":
        if (self.alertlevelint > 2) {
            self.stealth.current_requested_snd = undefined;
            return 0;
        }
        snd = "_enemyfindplayer";
        if (isdefined(level.stealth.candidatesvoice) && level.stealth.candidatesvoice.size > 1) {
            foreach (guy in level.stealth.candidatesvoice) {
                if (isalive(guy) && distance(self.origin, guy.origin) > 550) {
                    var_2fbd15f53beeba71 = guy;
                    break;
                }
            }
        }
        break;
    case #"hash_9ef2596c4c4ce657":
        snd = "_enemyalerted";
        break;
    case #"hash_c5c143ba1ce58744":
        snd = "_corpsefound";
        break;
    case #"hash_1d0022d9b49074c0":
        if (cointoss()) {
            snd = "_noisealert";
        } else {
            snd = "_suprised";
        }
        break;
    case #"hash_42197ed1ee6aca75":
        snd = "_enemysweep";
        break;
    case #"hash_412938e72fd9ab35":
    case #"hash_9567f12963cd5717":
        if (cointoss() && isdefined(eventstruct.origin)) {
            snd = try_cardinal_gunshot(eventstruct);
        } else {
            snd = random(["_gunshot_4", "_gunshot_7", "_gunshot_9", "_gunshot_10"]);
        }
        break;
    case #"hash_4b0ca4ada825424a":
        if (cointoss() && isdefined(eventstruct.origin)) {
            snd = try_cardinal_gunshot(eventstruct);
        } else {
            snd = random(["_gunshot_1", "_gunshot_2", "_gunshot_3", "_gunshot_5", "_gunshot_6", "_gunshot_8"]);
        }
        break;
    case #"hash_54ef1367f3b7f44c":
        snd = try_cardinal_patrol_update("low");
        if (!isdefined(snd)) {
            snd = random(["_areasecure_n_1_low", "_areasecure_s_1_low", "_areasecure_e_1_low", "_areasecure_w_1_low"]);
        }
        if (isdefined(level.stealth.candidatesvoice) && level.stealth.candidatesvoice.size > 1) {
            foreach (guy in level.stealth.candidatesvoice) {
                if (isalive(guy) && distance(self.origin, guy.origin) > 550) {
                    var_2fbd15f53beeba71 = guy;
                    break;
                }
            }
        }
        break;
    case #"hash_be58fabf4815ede6":
        snd = try_cardinal_patrol_update("high");
        if (!isdefined(snd)) {
            snd = random(["_areasecure_n_1_high", "_areasecure_s_1_high", "_areasecure_e_1_high", "_areasecure_w_1_high"]);
        }
        break;
    case #"hash_5567fda2832cbf6e":
        if (isdefined(eventstruct) && isdefined(eventstruct.typeorig) && eventstruct.typeorig == "unresponsive_teammate" && isdefined(eventstruct.origin)) {
            snd = "_searchreport_" + randomintrange(1, 7);
            var_2fbd15f53beeba71 = eventstruct.origin;
        } else {
            snd = "_searchreport";
        }
        break;
    case #"hash_f4eac828cdfe2da9":
        snd = "_mandown";
        break;
    }
    alias = prefix + self.stealth.voiceid + snd;
    result = play_stealth_vo_alias(alias, var_2fbd15f53beeba71);
    return result;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121a
// Size: 0x5a
function get_country_prefix() {
    if (!isdefined(anim.countryids)) {
        return "";
    }
    if (!isdefined(self.voice) || !isdefined(anim.countryids[self.voice])) {
        return "";
    }
    return anim.countryids[self.voice] + "_";
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x127d
// Size: 0x1d5
function try_cardinal_patrol_update(volume) {
    var_5049ea3dcc6ed882 = namespace_378f8281e2d12ced::getdirectioncompass(self.origin, (0, 0, 0));
    if (isdefined(var_5049ea3dcc6ed882) && var_5049ea3dcc6ed882 == "impossible") {
        return undefined;
    }
    volume = ter_op(isdefined(volume), "_" + volume, "_low");
    num = randomintrange(1, 5);
    switch (var_5049ea3dcc6ed882) {
    case #"hash_b9ff0a9f617355e4":
        alias = "_areasecure_n_" + num + volume;
        break;
    case #"hash_b66b59dcd06dfad3":
        if (cointoss()) {
            alias = "_areasecure_n_" + num + volume;
        } else {
            alias = "_areasecure_w_" + num + volume;
        }
        break;
    case #"hash_493bfd7122639b31":
        if (cointoss()) {
            alias = "_areasecure_n_" + num + volume;
        } else {
            alias = "_areasecure_e_" + num + volume;
        }
        break;
    case #"hash_fbd39e4f5634905a":
        alias = "_areasecure_s_" + num + volume;
        break;
    case #"hash_abed5ad834825ff1":
        if (cointoss()) {
            alias = "_areasecure_s_" + num + volume;
        } else {
            alias = "_areasecure_w_" + num + volume;
        }
        break;
    case #"hash_8856b747c93e7793":
        if (cointoss()) {
            alias = "_areasecure_s_" + num + volume;
        } else {
            alias = "_areasecure_e_" + num + volume;
        }
        break;
    case #"hash_22ce3b03c1e51a9c":
        alias = "_areasecure_e_" + num + volume;
        break;
    case #"hash_a1e9b77432f55b0e":
        alias = "_areasecure_w_" + num + volume;
        break;
    default:
        iprintln("No cardinal direction returned");
        alias = undefined;
        break;
    }
    assert(isdefined(alias));
    return alias;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x145b
// Size: 0x16d
function play_stealth_vo_alias(alias, var_2fbd15f53beeba71) {
    result = 0;
    self.stealth.current_requested_snd = undefined;
    if (soundexists(alias)) {
        if (!isdefined(self.stealth_vo_ent)) {
            self.stealth_vo_ent = spawn("script_origin", self.origin);
        }
        if (isdefined(self.stealth_vo_ent)) {
            if (isdefined(self.model) && hastag(self.model, "j_head")) {
                self.stealth_vo_ent linkto(self, "j_head", (0, 0, 0), (0, 0, 0));
            }
            self.stealth_vo_ent playsound(alias, "stealth_vo", 1);
            if (isdefined(var_2fbd15f53beeba71)) {
                delaythread(0.3, &playradiotransmission, alias, var_2fbd15f53beeba71);
            }
            if (should_try_generic_radio_confirmation(alias) && !isdefined(var_2fbd15f53beeba71)) {
                thread generic_radio_confrimation();
            }
        }
        if (isdefined(self.stealth)) {
            self.stealth.last_sound_time = gettime();
        }
        result = 1;
        /#
            thread function_48c141571ea55421("<dev string:x1c>" + alias);
        #/
    } else {
        /#
            thread function_48c141571ea55421("<dev string:x1c>" + alias, undefined, undefined, (1, 0, 0));
        #/
    }
    return result;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d1
// Size: 0x89
function should_try_generic_radio_confirmation(alias) {
    if (randomint(100) > 60) {
        return 0;
    }
    aliasarray = strtok(alias, "_");
    switch (aliasarray[2]) {
    case #"hash_184bba7053cc1c15":
    case #"hash_4b0ca4ada825424a":
    case #"hash_4bfca0c6798b2ca8":
    case #"hash_74df1ed0d203fcdd":
    case #"hash_886e06f1c2006f3c":
        return 1;
    default:
        return 0;
    }
}

// Namespace utility / scripts\sp\stealth\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1662
// Size: 0x50
function generic_radio_confrimation() {
    self endon("death");
    self notify("generic_radio_confrimation");
    self endon("generic_radio_confrimation");
    self.stealth_vo_ent waittill("stealth_vo");
    wait randomfloatrange(0.2, 0.4);
    alias = "dx_bcs_sf1_radioconf";
    play_sound_on_entity(alias);
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ba
// Size: 0xc4
function announce_spotted_acknowledge(guy) {
    origin = guy.origin;
    prefix = guy get_country_prefix();
    wait 1.5;
    if (isdefined(guy) && isdefined(guy.stealth.voiceid)) {
        num = guy.stealth.voiceid;
        origin = guy.origin + (0, 0, 45);
    } else {
        num = randomint(3);
    }
    alias = prefix + num + "_stealth_alert_r";
    /#
        guy thread function_48c141571ea55421("<dev string:x22>");
    #/
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1786
// Size: 0x1a4
function try_cardinal_gunshot(eventstruct) {
    var_5049ea3dcc6ed882 = namespace_378f8281e2d12ced::getdirectioncompass(self.origin, eventstruct.origin);
    if (isdefined(var_5049ea3dcc6ed882) && var_5049ea3dcc6ed882 == "impossible") {
        return;
    }
    num = randomintrange(1, 4);
    switch (var_5049ea3dcc6ed882) {
    case #"hash_b9ff0a9f617355e4":
        alias = "_gunshot_n_" + num;
        break;
    case #"hash_b66b59dcd06dfad3":
        if (cointoss()) {
            alias = "_gunshot_n_" + num;
        } else {
            alias = "_gunshot_w_" + num;
        }
        break;
    case #"hash_493bfd7122639b31":
        if (cointoss()) {
            alias = "_gunshot_n_" + num;
        } else {
            alias = "_gunshot_e_" + num;
        }
        break;
    case #"hash_fbd39e4f5634905a":
        alias = "_gunshot_s_" + num;
        break;
    case #"hash_abed5ad834825ff1":
        if (cointoss()) {
            alias = "_gunshot_s_" + num;
        } else {
            alias = "_gunshot_w_" + num;
        }
        break;
    case #"hash_8856b747c93e7793":
        if (cointoss()) {
            alias = "_gunshot_s_" + num;
        } else {
            alias = "_gunshot_e_" + num;
        }
        break;
    case #"hash_22ce3b03c1e51a9c":
        alias = "_gunshot_e_" + num;
        break;
    case #"hash_a1e9b77432f55b0e":
        alias = "_gunshot_w_" + num;
        break;
    default:
        iprintln("No cardinal direction returned");
        alias = undefined;
        break;
    }
    assert(isdefined(alias));
    return alias;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1933
// Size: 0x89
function play_commander_response() {
    self endon("death");
    self.stealth_vo_ent waittill("stealth_vo");
    response = random(array_randomize(["dx_bcs_rul_contsweep_1", "dx_bcs_rul_contsweep_2", "dx_bcs_rul_contsweep_3", "dx_bcs_rul_contsweep_n_1", "dx_bcs_rul_contsweep_e_1", "dx_bcs_rul_contsweep_s_1", "dx_bcs_rul_contsweep_w_1"]));
    wait randomfloatrange(0.15, 0.25);
    thread play_sound_on_entity(response);
}

// Namespace utility / scripts\sp\stealth\utility
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19c4
// Size: 0xec
function playradiotransmission(alias, var_905c88a5a40fc724) {
    if (isai(var_905c88a5a40fc724)) {
        if (!isalive(var_905c88a5a40fc724)) {
            return;
        }
        temp = var_905c88a5a40fc724 scripts\engine\utility::spawn_script_origin();
        var_905c88a5a40fc724 thread scripts\engine\utility::delete_on_death(temp);
        var_905c88a5a40fc724 endon("death");
        temp linkto(var_905c88a5a40fc724, "tag_eye", (0, 0, 0), (0, 0, 0));
        temp setentitysoundcontext("atmosphere", "helmet");
        temp playsound(alias, "sound_done");
        temp waittill("sound_done");
        temp delete();
        return;
    }
    if (isvector(var_905c88a5a40fc724)) {
        temp = scripts\engine\utility::spawn_script_origin(var_905c88a5a40fc724, (0, 0, 0));
        temp setentitysoundcontext("atmosphere", "helmet");
        temp playsound(alias, "sound_done");
        temp waittill("sound_done");
        temp delete();
    }
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab8
// Size: 0x8a
function function_c8ec064357e0c742(aliasto) {
    assert(isplayer(self));
    if (!isdefined(self.stealth)) {
        thread scripts\stealth\player::main();
    }
    if (!isdefined(self.var_bd670c1e0f4290da)) {
        self.var_bd670c1e0f4290da = "init";
    }
    if (!isdefined(aliasto)) {
        setmusicstate("");
        self.var_bd670c1e0f4290da = "";
        return;
    }
    if (aliasto != self.var_bd670c1e0f4290da) {
        self.var_bd670c1e0f4290da = aliasto;
        setmusicstate(aliasto);
    }
}

// Namespace utility / scripts\sp\stealth\utility
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4a
// Size: 0x3b
function function_f905efbbe81ccd7d() {
    if (!isdefined(level.player.var_bd670c1e0f4290da)) {
        return false;
    }
    if (level.player.var_bd670c1e0f4290da == "init") {
        return false;
    }
    return true;
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8e
// Size: 0x2fc
function stealth_music_transition_sp(aliasto) {
    self notify("stealth_music_transition");
    self endon("stealth_music_transition");
    self endon("disconnect");
    assert(isplayer(self));
    if (!isdefined(self.stealth)) {
        thread scripts\stealth\player::main();
    }
    transitiontime = 1;
    frametime = 0.05;
    if (!isdefined(self.stealth.music_ent)) {
        self.stealth.music_ent = [];
    }
    alias = aliasto;
    if (isdefined(alias) && !isdefined(self.stealth.music_ent[alias])) {
        self.stealth.music_ent[alias] = spawn("script_model", self.origin);
        self.stealth.music_ent[alias] linkto(self);
        self.stealth.music_ent[alias].cur_vol = 0;
        self.stealth.music_ent[alias] scalevolume(0);
        self.stealth.music_ent[alias] playloopsound(alias);
    }
    while (true) {
        wait frametime;
        var_5e8903d4bdb17d48 = 0;
        foreach (alias, ent in self.stealth.music_ent) {
            target = undefined;
            if (isdefined(aliasto) && alias == aliasto) {
                ent.cur_vol = min(1, ent.cur_vol + frametime / transitiontime);
                target = 1;
            } else {
                ent.cur_vol = max(0, ent.cur_vol - frametime / transitiontime);
                target = 0;
            }
            ent scalevolume(ent.cur_vol);
            if (ent.cur_vol == target) {
                var_5e8903d4bdb17d48++;
            }
        }
        if (var_5e8903d4bdb17d48 == self.stealth.music_ent.size) {
            foreach (alias, ent in self.stealth.music_ent) {
                if (!isdefined(aliasto) || alias != aliasto) {
                    self.stealth.music_ent[alias] delete();
                    self.stealth.music_ent[alias] = undefined;
                }
            }
            return;
        }
    }
}

// Namespace utility / scripts\sp\stealth\utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e92
// Size: 0x55
function function_5d3533b9142557d7(bool) {
    if (!isdefined(bool)) {
        bool = 1;
    }
    assert(isdefined(level.player.sixthsense), "Tried to enable sixth sense but it does not exist! Use scr_sixthSense_enabled");
    level.player.sixthsense.active = bool;
}

