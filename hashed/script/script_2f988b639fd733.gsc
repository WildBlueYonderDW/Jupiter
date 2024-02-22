// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_3214e6fcdce468a7;
#using script_38eb8f4be20d54f4;
#using script_7edf952f8921aa6b;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\supers.gsc;
#using script_38db8bccc9eb301f;
#using script_7c40fa80892a721;
#using script_9880b9dc28bc25e;
#using script_19c169a442d5975a;

#namespace namespace_458c9ac11f854403;

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d4
// Size: 0x1e2
function init() {
    namespace_85d036cb78063c4a::function_53110a12409d01da("super_frenzied_guard", undefined, undefined, &function_b230d73ba6f02512, &function_fbc03cda5116c3ae, undefined);
    level.var_f513e9d749fb81cd = function_e4c99b0f178ffb98("super_frenzied_guard", 2);
    var_6f0c028c94328ae3 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frenzied_guard", #"hash_8adcece6f9625090");
    var_9462543a62d56ae0 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frenzied_guard", #"hash_4a48365785177b20");
    var_21ecbfef71b4de59 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frenzied_guard", #"hash_44303def58ce1a91");
    /#
        function_6e7290c8ee4f558b("default_2seconds");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_a2fe753948998c89("<unknown string>", "<unknown string>");
        function_fe953f000498048f();
    #/
    level._effect["frenzied_guard_1p_effect"] = loadfx(function_53c4c53197386572(var_6f0c028c94328ae3, ""));
    level._effect["frenzied_guard_3p_head_effect"] = loadfx(function_53c4c53197386572(var_9462543a62d56ae0, ""));
    level._effect["frenzied_guard_3p_torso_effect"] = loadfx(function_53c4c53197386572(var_21ecbfef71b4de59, ""));
    var_7c7b046a6b9536fc = getscriptbundle(level.var_7c7b046a6b9536fc);
    foreach (super in var_7c7b046a6b9536fc.var_63b618614d288401) {
        if (super.ref == "super_frenzied_guard") {
            level.var_f04301db8ca5ecfa["super_frenzied_guard"] = getscriptbundle("super:" + super.bundle);
            break;
        }
    }
    level callback::add("on_ai_killed", &on_ai_killed);
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bd
// Size: 0xbf
function on_ai_killed(params) {
    if (isplayer(params.eattacker) && params.eattacker ent_flag("frenzied_guard_active")) {
        var_950a4c0355e0ab64 = function_53c4c53197386572(level.var_f04301db8ca5ecfa["super_frenzied_guard"].var_950a4c0355e0ab64, 0.25);
        var_6eb34aa70f42c2f2 = function_53c4c53197386572(level.var_f04301db8ca5ecfa["super_frenzied_guard"].var_6eb34aa70f42c2f2, 50);
        params.eattacker namespace_f8d3520d3483c1::setarmorhealth(params.eattacker.armorhealth + var_6eb34aa70f42c2f2 * var_950a4c0355e0ab64);
    }
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x583
// Size: 0x175
function function_b230d73ba6f02512() {
    if (isdefined(level.var_f04301db8ca5ecfa["super_frenzied_guard"])) {
        var_3a5535e47f5de9a3 = level.var_f04301db8ca5ecfa["super_frenzied_guard"].offhandweapon;
        var_d54d53eaf955518d = namespace_e23f629a8349dfaf::function_75abcff430ed00b7(var_3a5535e47f5de9a3);
        if (var_d54d53eaf955518d) {
            self setscriptablepartstate("wand_fx", "wand_on_frenzied_guard", 0);
            var_45b3d22c6cca7734 = namespace_e23f629a8349dfaf::function_dabbdf1761a23f5c();
            var_1fb5e9f820078d99 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frenzied_guard", #"hash_66e98430fa91d10e");
            var_1fb5e9f820078d99 = function_53c4c53197386572(var_1fb5e9f820078d99, 10);
            switch (var_45b3d22c6cca7734) {
            case 0:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            case 1:
            default:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            case 2:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            case 3:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            case 4:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            case 5:
                thread frenzied_guard_active(var_1fb5e9f820078d99);
                thread function_fbb31130e1db8a38();
                break;
            }
            return 1;
        }
    }
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ff
// Size: 0x35
function function_fbc03cda5116c3ae(var_fcef8d217a441961, attacker) {
    self notify("end_frenzied_guard");
    ent_flag_clear("field_upgrade_in_use");
    ent_flag_clear("frenzied_guard_active");
    return 0;
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73c
// Size: 0xf4
function frenzied_guard_active(n_duration) {
    self endon("disconnect");
    ent_flag_init("field_upgrade_in_use");
    ent_flag_set("field_upgrade_in_use");
    ent_flag_init("frenzied_guard_active");
    ent_flag_set("frenzied_guard_active");
    self.var_e7e1d9df2b8226a2 = [];
    var_5ffe26e8d50879f6 = namespace_85d036cb78063c4a::getcurrentsuper();
    var_5ffe26e8d50879f6.staticdata.usetime = n_duration;
    thread function_dd3e24972903398e(n_duration);
    playernum = self getentitynumber();
    var_90001396aba1b3e8 = "frenzied_guard_player_" + playernum;
    thread function_fd55871e70d0572e(n_duration, var_90001396aba1b3e8);
    s_waitresult = waittill_any_timeout_3(n_duration, "player_downed", "death", "end_frenzied_guard");
    function_1dcb61539c18f311(var_90001396aba1b3e8);
    thread function_ccc62e267507ffdc();
    ent_flag_clear("field_upgrade_in_use");
    ent_flag_clear("frenzied_guard_active");
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x837
// Size: 0x13
function function_fbb31130e1db8a38() {
    namespace_f8d3520d3483c1::setarmorhealth(self.var_8790c077c95db752);
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x851
// Size: 0x152
function function_1dcb61539c18f311(var_90001396aba1b3e8) {
    foreach (zombie in self.var_e7e1d9df2b8226a2) {
        if (isalive(zombie)) {
            zombie function_a047f71d0256058b(undefined, var_90001396aba1b3e8, 0);
            if (zombie getscriptablehaspart("frenzied_guard")) {
                zombie setscriptablepartstate("frenzied_guard", "frenzied_guard_off", 1);
            }
            zombie.favoriteenemy = undefined;
            zombie.var_d8d6b31e877461b4 = function_53c4c53197386572(zombie.var_d8d6b31e877461b4, []);
            foreach (var_c67af61827586b0f in zombie.var_d8d6b31e877461b4) {
                if (var_c67af61827586b0f.player == self) {
                    zombie namespace_5381a59d140f4df8::function_6e660434fe00b495(var_c67af61827586b0f.attractor);
                }
                zombie.var_d8d6b31e877461b4 = array_remove(zombie.var_d8d6b31e877461b4, var_c67af61827586b0f);
            }
        }
    }
    self.var_e7e1d9df2b8226a2 = undefined;
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aa
// Size: 0x40f
function function_fd55871e70d0572e(n_duration, var_90001396aba1b3e8) {
    self endon("death");
    self endon("player_downed");
    self endon("end_frenzied_guard");
    starttime = gettime();
    time = gettime();
    var_6ddfae6b147ffb95 = namespace_e23f629a8349dfaf::function_e7b6474ebd683537("super_frenzied_guard", #"hash_ff3573675daf9e80");
    var_6ddfae6b147ffb95 = function_53c4c53197386572(var_6ddfae6b147ffb95, 1000);
    while (time - starttime < n_duration * 1000) {
        foreach (zombie in self.var_e7e1d9df2b8226a2) {
            if (isalive(zombie) && distance2d(self.origin, zombie.origin) > var_6ddfae6b147ffb95) {
                zombie function_a047f71d0256058b(undefined, var_90001396aba1b3e8, 0);
                if (zombie getscriptablehaspart("frenzied_guard")) {
                    zombie setscriptablepartstate("frenzied_guard", "frenzied_guard_off", 1);
                }
                zombie.var_d8d6b31e877461b4 = function_53c4c53197386572(zombie.var_d8d6b31e877461b4, []);
                foreach (var_c67af61827586b0f in zombie.var_d8d6b31e877461b4) {
                    if (var_c67af61827586b0f.player == self) {
                        zombie namespace_5381a59d140f4df8::function_6e660434fe00b495(var_c67af61827586b0f.attractor);
                    }
                    zombie.var_d8d6b31e877461b4 = array_remove(zombie.var_d8d6b31e877461b4, var_c67af61827586b0f);
                }
            }
            zombie.var_e7e1d9df2b8226a2 = array_remove(self.var_e7e1d9df2b8226a2, zombie);
        }
        var_fb04a2e22cf56f22 = getaiarrayinradius(self.origin, var_6ddfae6b147ffb95);
        foreach (zombie in var_fb04a2e22cf56f22) {
            if (isalive(zombie) && zombie.type == "zombie" && zombie.team != self.team) {
                if (!isdefined(zombie.enemy) && flag("level_stealth_initialized")) {
                    zombie aieventlistenerevent("combat", self, self.origin);
                }
                self.var_e7e1d9df2b8226a2 = function_6d6af8144a5131f1(self.var_e7e1d9df2b8226a2, zombie);
                zombie function_a047f71d0256058b(self, var_90001396aba1b3e8, 9999);
                if (zombie getscriptablehaspart("frenzied_guard")) {
                    zombie setscriptablepartstate("frenzied_guard", "frenzied_guard_on", 1);
                }
                zombie.var_d8d6b31e877461b4 = function_53c4c53197386572(zombie.var_d8d6b31e877461b4, []);
                var_6926d9171198bd48 = 0;
                foreach (var_c67af61827586b0f in zombie.var_d8d6b31e877461b4) {
                    if (var_c67af61827586b0f.player == self) {
                        var_6926d9171198bd48 = 1;
                        break;
                    }
                }
                if (!var_6926d9171198bd48) {
                    var_c67af61827586b0f = zombie namespace_5381a59d140f4df8::function_c0d3ba0eab1acba0(self, 9999, var_6ddfae6b147ffb95, 1, undefined, undefined, 1);
                    var_2847bb496d0bf2d1 = spawnstruct();
                    var_2847bb496d0bf2d1.attractor = var_c67af61827586b0f;
                    var_2847bb496d0bf2d1.player = self;
                    zombie.var_d8d6b31e877461b4 = array_add(zombie.var_d8d6b31e877461b4, var_2847bb496d0bf2d1);
                }
            }
        }
        function_f632348cbb773537(level.var_f513e9d749fb81cd, self);
        time = gettime();
    }
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc0
// Size: 0x62
function function_dd3e24972903398e(n_duration) {
    thread function_9ffad06921ecb845(n_duration);
    visionset = level.var_f04301db8ca5ecfa["super_frenzied_guard"].var_2de362df81a9a62d;
    namespace_6c72573a48881070::function_27a921508cb04613(visionset, 0.5);
    waitframe();
    if (isalive(self)) {
        self setscriptablepartstate("frenzied_guard_fx", "super_fx_on", 0);
    }
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe29
// Size: 0x58
function function_9ffad06921ecb845(n_duration) {
    self endon("death_or_disconnect");
    self notify("applyFOVPresentation");
    self endon("applyFOVPresentation");
    self lerpfovbypreset("zombiedefault");
    waittill_any_timeout_no_endon_death_2(n_duration, "super_use_finished", "end_frenzied_guard");
    self lerpfovbypreset("default_2seconds");
    self playlocalsound("deadsilence_end");
}

// Namespace namespace_458c9ac11f854403/namespace_1eba3ff32243c3bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe88
// Size: 0x41
function function_ccc62e267507ffdc() {
    visionset = level.var_f04301db8ca5ecfa["super_frenzied_guard"].var_2de362df81a9a62d;
    namespace_6c72573a48881070::function_9a92ae402e209ecc(visionset);
    self setscriptablepartstate("frenzied_guard_fx", "super_fx_deactivate", 0);
}

