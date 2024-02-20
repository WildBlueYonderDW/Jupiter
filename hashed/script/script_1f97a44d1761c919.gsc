// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using script_1f97a44d1761c919;

#namespace overlord;

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7
// Size: 0xc4
function init() {
    if (!function_1ad4a4e87bd92ba8()) {
        return;
    }
    level.overlord = spawnstruct();
    level.overlord.events = [];
    level.overlord.var_d40c3acc6cab104b = [];
    level.var_60fc087bc7deaadc = &function_60fc087bc7deaadc;
    level thread function_2b7b925f1037e020();
    level.overlord.var_f122d73bb796754c = getdvarint(@"hash_99ee36f514cfdc16", 3);
    if (getdvarint(@"hash_b1dbb741da6aa657", 0) == 1) {
        level thread function_96e4f7ac9d0f56e4();
    }
    if (getdvarint(@"hash_859fb74d1557c0b1", 1) && utility::ismp()) {
        level thread function_b0c21eabffce3fd4();
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x382
// Size: 0x47
function function_1ad4a4e87bd92ba8() {
    if (isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_21499b682c5b3a47)) {
        return 1;
    }
    if (utility::ismp()) {
        if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() != "dmz") {
            return 0;
        }
    }
    return 1;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1
// Size: 0x34c
function function_2b7b925f1037e020() {
    csv = function_6c9808b9b419ed7e();
    namespace_4b0406965e556711::levelflaginit("overlord_csv_init", 0);
    for (row = 0; 1; row++) {
        ref = tablelookupbyrow(csv, row, 0);
        if (ref == "") {
            break;
        }
        alias = tablelookupbyrow(csv, row, 1);
        priority = int(tablelookupbyrow(csv, row, 2));
        cooldown = int(tablelookupbyrow(csv, row, 3));
        timeout = lookupsoundlength(alias, 1) / 1000 + 2;
        function_780b7b802e71fd94(ref, alias, priority, cooldown, timeout);
    }
    str_bundle = function_867b48f5536f373e();
    if (isdefined(str_bundle)) {
        s_bundle = getscriptbundle("dialogueoverlord:" + str_bundle);
        if (isdefined(s_bundle)) {
            foreach (var_87fc95d97eb08ba9 in s_bundle.var_423f1766afe848b9) {
                if (isdefined(var_87fc95d97eb08ba9.alias)) {
                    timeout = lookupsoundlength(var_87fc95d97eb08ba9.alias, 1) / 1000 + 0.25;
                    function_780b7b802e71fd94(var_87fc95d97eb08ba9.ref, var_87fc95d97eb08ba9.alias, var_87fc95d97eb08ba9.priority, var_87fc95d97eb08ba9.cooldown, timeout, var_87fc95d97eb08ba9.var_7ce636b3f644e502, var_87fc95d97eb08ba9.var_ddcfe8a7903b687f, var_87fc95d97eb08ba9.var_f8bb032673fdf9ee);
                }
            }
            foreach (var_a0c5c58390c08ec4 in s_bundle.var_d40c3acc6cab104b) {
                level.overlord.var_d40c3acc6cab104b[var_a0c5c58390c08ec4.var_ae0a62f4009b941] = var_a0c5c58390c08ec4;
                foreach (var_84e41716d3779c0e in var_a0c5c58390c08ec4.soundevents) {
                    if (isdefined(var_84e41716d3779c0e.alias)) {
                        eventref = var_84e41716d3779c0e.alias;
                        if (!isdefined(level.overlord.events[eventref])) {
                            function_780b7b802e71fd94(eventref, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.priority, var_84e41716d3779c0e.cooldown, function_c89ed1840c8d0f0f(lookupsoundlength(var_84e41716d3779c0e.alias, 1)) + 0.25, var_84e41716d3779c0e.var_7ce636b3f644e502, var_84e41716d3779c0e.var_ddcfe8a7903b687f, var_84e41716d3779c0e.var_f8bb032673fdf9ee);
                        }
                    }
                }
            }
        }
    }
    namespace_4b0406965e556711::levelflagset("overlord_csv_init");
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724
// Size: 0x93
function function_6c9808b9b419ed7e() {
    if (isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_21499b682c5b3a47)) {
        if (isdefined(level.var_1a2b600a06ec21f4.var_4def6c2024945408)) {
            return level.var_1a2b600a06ec21f4.var_4def6c2024945408;
        } else if (!isdefined(function_867b48f5536f373e())) {
            /#
                assertmsg("overlord::getOverlordCSV: gameModeBundle or level.str_overlord_event_bundle override missing definition for 'Overlord Events', using '" + "mp_cp/overlord_dmz.csv" + "' as a default.");
            #/
            return "mp_cp/overlord_dmz.csv";
        }
    }
    return getdvar(@"hash_97efde55df4bcccd", "mp_cp/overlord_dmz.csv");
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf
// Size: 0x4b
function function_867b48f5536f373e() {
    if (isdefined(level.var_1a2b600a06ec21f4) && istrue(level.var_1a2b600a06ec21f4.var_21499b682c5b3a47)) {
        return function_53c4c53197386572(level.var_af35f8ccfc5f7a70, level.var_1a2b600a06ec21f4.var_74ff2a0df7caa848);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x811
// Size: 0x7d
function function_96e4f7ac9d0f56e4() {
    namespace_4b0406965e556711::levelflagwait("overlord_csv_init");
    while (1) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_civ_kill_third_warning", [0:level.players[0]]);
        wait(1);
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_civ_kill_frst_warning", [0:level.players[0]]);
        wait(1);
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_civ_kill_second_warning", [0:level.players[0]]);
        wait(5);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895
// Size: 0xe6
function function_780b7b802e71fd94(ref, alias, priority, cooldown, timeout, var_7ce636b3f644e502, var_ddcfe8a7903b687f, var_f8bb032673fdf9ee) {
    event = spawnstruct();
    event.ref = ref;
    event.alias = alias;
    event.priority = isdefined(priority) ? 75 : priority;
    event.cooldown = cooldown * 1000;
    event.timeout = timeout;
    event.var_7ce636b3f644e502 = var_7ce636b3f644e502;
    event.var_ddcfe8a7903b687f = var_ddcfe8a7903b687f;
    event.var_f8bb032673fdf9ee = var_f8bb032673fdf9ee;
    level.overlord.events[ref] = event;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x982
// Size: 0xc6
function function_9b411de07c46bddc(eventref, players, var_3be94fc7d74bc059, var_f84decb7822f8442) {
    if (!isdefined(level.overlord)) {
        return 0;
    }
    if (!isdefined(eventref) || !isdefined(var_f84decb7822f8442)) {
        return 0;
    }
    event = level.overlord.events[eventref];
    if (!isdefined(event)) {
        return 0;
    }
    if (!isdefined(event.var_541c17101791b119)) {
        event.var_541c17101791b119 = [];
    }
    if (istrue(event.var_541c17101791b119[var_f84decb7822f8442])) {
        return 0;
    }
    var_196edafa8094cc58 = function_d87d5deb069bf8e5(eventref, players, 0, var_3be94fc7d74bc059, 0);
    if (istrue(var_196edafa8094cc58)) {
        event.var_541c17101791b119[var_f84decb7822f8442] = 1;
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4f
// Size: 0x44c
function function_d87d5deb069bf8e5(eventref, players, delay, var_3be94fc7d74bc059, var_fe8102d7751b9184) {
    if (!isdefined(level.overlord)) {
        return 0;
    }
    if (isdefined(delay)) {
        wait(delay);
    }
    event = level.overlord.events[eventref];
    if (!isdefined(event)) {
        return 0;
    }
    if (!soundexists(event.alias)) {
        return 0;
    }
    if (getdvarint(@"hash_ec5ffe1a34b9c8a3", 0)) {
        var_a0fcdf5e4bc1d7d7 = 0;
        var_219dd70e40560a41 = 0;
        foreach (player in players) {
            if (player function_4c025df9ec965ae2() || player function_7fcbb3b96e848adf()) {
                var_a0fcdf5e4bc1d7d7 = 1;
            }
            if (var_a0fcdf5e4bc1d7d7) {
                var_219dd70e40560a41 = player function_17c324959b47a339(event);
                break;
            }
        }
        if (var_a0fcdf5e4bc1d7d7 && !var_219dd70e40560a41) {
            function_32dc596da0d9c6ba(players);
        }
        waittillframeend();
    }
    if (!isdefined(event.var_ddcfe8a7903b687f)) {
        goto LOC_000001c7;
    }
    var_96a3e1f4a902ce20 = event.var_ddcfe8a7903b687f;
    if (!isdefined(event.var_f8bb032673fdf9ee)) {
        goto LOC_000001e7;
    }
    var_d0cdb1f76a8e19e5 = event.var_f8bb032673fdf9ee;
    if (!isdefined(event.timeout)) {
        goto LOC_00000207;
    }
    var_7d6cbcc0d0fc852b = event.timeout;
    var_bc255b263fb442b9 = var_96a3e1f4a902ce20 + var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5;
    foreach (player in players) {
        if (isdefined(player)) {
            player.var_8c0af45aa43f34fc = {eventref:eventref, priority:event.priority, endtime:gettime() + var_bc255b263fb442b9 * 1000, starttime:gettime()};
        }
    }
    if (var_96a3e1f4a902ce20 > 0) {
        wait(var_96a3e1f4a902ce20);
    }
    foreach (player in players) {
        player endon(eventref + "_endon");
        player function_d453707f6b8f2c6d();
        var_a98fc745a78358c9 = player function_17c324959b47a339(event) || istrue(var_219dd70e40560a41);
        var_6313cac4d3f01dab = event.timeout;
        if (!var_a98fc745a78358c9 && !getdvarint(@"hash_ec5ffe1a34b9c8a3", 0)) {
            foreach (var_f1ded4f36c028507, n_start_time in player.var_5a2916f745d4389a) {
                var_6313cac4d3f01dab = var_6313cac4d3f01dab + level.overlord.events[var_f1ded4f36c028507].timeout;
            }
        }
        player queuedialogforplayer(event.alias, event.alias, var_6313cac4d3f01dab, "overlord", var_a98fc745a78358c9, undefined, event.timeout);
        player.var_5a2916f745d4389a[eventref] = gettime();
        player function_df4b8b09952c7066(eventref, event.alias, event.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5);
        player function_f9a207358d70923c(var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5, [0:"disconnect"], &function_625670c3d05d51f5, event.alias, event.var_7ce636b3f644e502);
    LOC_0000041b:
    }
    if (istrue(var_fe8102d7751b9184) && var_7d6cbcc0d0fc852b > 0) {
        wait(var_7d6cbcc0d0fc852b);
    }
    if (var_d0cdb1f76a8e19e5 > 0) {
        wait(var_d0cdb1f76a8e19e5);
    }
    return 1;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea3
// Size: 0x27
function private function_625670c3d05d51f5(str_vo_alias, var_a57cf0fe1f517f38) {
    function_46bfb80c1913ab1f(str_vo_alias, var_a57cf0fe1f517f38);
    self.var_8c0af45aa43f34fc = undefined;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed1
// Size: 0xc5
function private function_32dc596da0d9c6ba(players) {
    while (1) {
        var_46a0ea7b6c5542d2 = 1;
        foreach (player in players) {
            if (player function_7fcbb3b96e848adf() && gettime() < player.var_8c0af45aa43f34fc.endtime || player function_4c025df9ec965ae2() && gettime() < player.var_db2dce013db69c33.endtime) {
                var_46a0ea7b6c5542d2 = 0;
                break;
            }
        }
        if (var_46a0ea7b6c5542d2) {
            return;
        }
        waitframe();
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9d
// Size: 0x699
function function_c1c677ed7a1b1128(var_ae0a62f4009b941, players, var_7b76e64b846c00d, var_8b6798cc35c82e07, location, group) {
    players = isdefined(players) ? level.players : players;
    var_8b6798cc35c82e07 = isdefined(var_8b6798cc35c82e07) ? 0 : var_8b6798cc35c82e07;
    group = isdefined(group) ? "overlord" : group;
    var_639e5c983d7f8508 = group == "overlord_intel";
    if (isdefined(var_7b76e64b846c00d)) {
        wait(var_7b76e64b846c00d);
    }
    var_a0c5c58390c08ec4 = level.overlord.var_d40c3acc6cab104b[var_ae0a62f4009b941];
    if (isdefined(var_a0c5c58390c08ec4)) {
        var_7999d4cf9ced773e = 0;
        foreach (soundevent in var_a0c5c58390c08ec4.soundevents) {
            var_7999d4cf9ced773e = var_7999d4cf9ced773e + (isdefined(soundevent.priority) ? 75 : soundevent.priority);
        }
        var_8db2db14e6223851 = var_7999d4cf9ced773e / var_a0c5c58390c08ec4.soundevents.size;
        var_a0fcdf5e4bc1d7d7 = 0;
        var_cfafedd3745af93c = -1;
        foreach (player in players) {
            if (player function_4c025df9ec965ae2()) {
                var_a0fcdf5e4bc1d7d7 = 1;
                var_cfafedd3745af93c = player.var_db2dce013db69c33.priority;
                break;
            } else if (player function_7fcbb3b96e848adf()) {
                var_a0fcdf5e4bc1d7d7 = 1;
                var_cfafedd3745af93c = player.var_8c0af45aa43f34fc.priority;
            }
        }
        if (!var_639e5c983d7f8508 && var_a0fcdf5e4bc1d7d7 && var_8db2db14e6223851 <= var_cfafedd3745af93c && !var_8b6798cc35c82e07) {
            function_32dc596da0d9c6ba(players);
        } else {
            var_8b6798cc35c82e07 = 1;
            foreach (player in players) {
                if (player function_4c025df9ec965ae2()) {
                    player function_2569e8e725c5d5f4();
                } else if (player function_7fcbb3b96e848adf()) {
                    player end_overlord_event();
                }
            }
            waittillframeend();
        }
        var_d685948acd304ff2 = 0;
        foreach (var_84e41716d3779c0e in var_a0c5c58390c08ec4.soundevents) {
            if (isdefined(var_84e41716d3779c0e.var_ddcfe8a7903b687f)) {
                var_d685948acd304ff2 = var_d685948acd304ff2 + var_84e41716d3779c0e.var_ddcfe8a7903b687f;
            }
            if (isdefined(var_84e41716d3779c0e.alias)) {
                eventref = var_84e41716d3779c0e.alias;
                if (!isdefined(level.overlord.events[eventref])) {
                    function_780b7b802e71fd94(eventref, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.priority, var_84e41716d3779c0e.cooldown, function_c89ed1840c8d0f0f(lookupsoundlength(var_84e41716d3779c0e.alias, 1)) + 0.25, var_84e41716d3779c0e.var_7ce636b3f644e502, var_84e41716d3779c0e.var_ddcfe8a7903b687f, var_84e41716d3779c0e.var_f8bb032673fdf9ee);
                }
                var_d685948acd304ff2 = var_d685948acd304ff2 + level.overlord.events[eventref].timeout;
            }
            if (isdefined(var_84e41716d3779c0e.var_f8bb032673fdf9ee)) {
                var_d685948acd304ff2 = var_d685948acd304ff2 + var_84e41716d3779c0e.var_f8bb032673fdf9ee;
            }
        }
        foreach (player in players) {
            if (isdefined(player)) {
                player.var_db2dce013db69c33 = {var_ae0a62f4009b941:var_ae0a62f4009b941, priority:var_8db2db14e6223851, endtime:gettime() + var_d685948acd304ff2 * 1000, starttime:gettime()};
            }
        }
        foreach (n_event, var_84e41716d3779c0e in var_a0c5c58390c08ec4.soundevents) {
            if (!isdefined(var_84e41716d3779c0e.alias)) {
                continue;
            }
            if (isdefined(var_84e41716d3779c0e.var_ddcfe8a7903b687f)) {
                wait(var_84e41716d3779c0e.var_ddcfe8a7903b687f);
            }
            eventref = var_84e41716d3779c0e.alias;
            var_7d6cbcc0d0fc852b = level.overlord.events[eventref].timeout;
            var_d0cdb1f76a8e19e5 = isdefined(var_84e41716d3779c0e.var_f8bb032673fdf9ee) ? 0 : var_84e41716d3779c0e.var_f8bb032673fdf9ee;
            if (!var_639e5c983d7f8508) {
                foreach (player in players) {
                    if (isdefined(player)) {
                        player endon(var_ae0a62f4009b941 + "_endon");
                        player function_d453707f6b8f2c6d();
                        player function_df4b8b09952c7066(var_ae0a62f4009b941, var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5);
                        player queuedialogforplayer(var_84e41716d3779c0e.alias, var_84e41716d3779c0e.alias, var_7d6cbcc0d0fc852b, group, var_8b6798cc35c82e07, location, var_7d6cbcc0d0fc852b);
                    }
                }
                wait(var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5);
                foreach (player in players) {
                    if (isdefined(player)) {
                        player function_46bfb80c1913ab1f(var_84e41716d3779c0e.alias, var_84e41716d3779c0e.var_7ce636b3f644e502);
                        if (n_event >= var_a0c5c58390c08ec4.soundevents.size - 1) {
                            player.var_db2dce013db69c33 = undefined;
                        }
                    }
                }
            } else if (isdefined(location)) {
                playsoundatpos(location, var_84e41716d3779c0e.alias);
                wait(var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5);
            }
        }
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x163d
// Size: 0x9f
function private function_df4b8b09952c7066(var_2346def1907e460d, str_vo_alias, var_cf8b5ceaf91df155, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5) {
    if (!isdefined(self.var_21ac8f8640fd349b)) {
        self.var_21ac8f8640fd349b = [];
    }
    if (!isdefined(self.var_f999e836125feb34)) {
        self.var_f999e836125feb34 = [];
    }
    self.var_21ac8f8640fd349b[self.var_21ac8f8640fd349b.size] = str_vo_alias;
    if (isdefined(var_cf8b5ceaf91df155)) {
        self.var_f999e836125feb34[self.var_f999e836125feb34.size] = var_cf8b5ceaf91df155;
    }
    thread function_6e668b096a66ef44(var_2346def1907e460d, str_vo_alias, var_cf8b5ceaf91df155, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5);
    function_39d7d599ffe62b19();
}

// Namespace overlord/namespace_446fc987a980892f
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16e3
// Size: 0xe9
function private function_6e668b096a66ef44(var_2346def1907e460d, str_vo_alias, var_a57cf0fe1f517f38, var_7d6cbcc0d0fc852b, var_d0cdb1f76a8e19e5) {
    if (!isdefined(var_d0cdb1f76a8e19e5)) {
        var_d0cdb1f76a8e19e5 = 0;
    }
    self endon(str_vo_alias + "_endon");
    msg = waittill_any_timeout_3(var_7d6cbcc0d0fc852b + var_d0cdb1f76a8e19e5 + level.framedurationseconds, var_2346def1907e460d + "_endon", "end_overlord_event", "disconnect");
    if (isdefined(self)) {
        if (isdefined(self.var_db2dce013db69c33) && is_equal(self.var_db2dce013db69c33.var_ae0a62f4009b941, var_2346def1907e460d)) {
            self.var_db2dce013db69c33 = undefined;
        } else if (isdefined(self.var_8c0af45aa43f34fc) && is_equal(self.var_8c0af45aa43f34fc.eventref, var_2346def1907e460d)) {
            self.var_8c0af45aa43f34fc = undefined;
        }
        thread function_46bfb80c1913ab1f(str_vo_alias, var_a57cf0fe1f517f38);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17d3
// Size: 0x5c
function private function_46bfb80c1913ab1f(str_vo_alias, var_cf8b5ceaf91df155) {
    self notify(str_vo_alias + "_endon");
    self.var_21ac8f8640fd349b = array_remove(self.var_21ac8f8640fd349b, str_vo_alias);
    if (isdefined(var_cf8b5ceaf91df155)) {
        self.var_f999e836125feb34 = array_remove(self.var_f999e836125feb34, var_cf8b5ceaf91df155);
    }
    function_39d7d599ffe62b19();
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1836
// Size: 0x32
function private function_2569e8e725c5d5f4() {
    if (function_4c025df9ec965ae2()) {
        self notify(self.var_db2dce013db69c33.var_ae0a62f4009b941 + "_endon");
        self.var_db2dce013db69c33 = undefined;
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x186f
// Size: 0x32
function private end_overlord_event() {
    if (function_7fcbb3b96e848adf()) {
        self notify(self.var_8c0af45aa43f34fc.eventref + "_endon");
        self.var_8c0af45aa43f34fc = undefined;
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18a8
// Size: 0x6e
function private function_39d7d599ffe62b19() {
    var_a57cf0fe1f517f38 = self.var_f999e836125feb34[self.var_f999e836125feb34.size - 1];
    if (!isdefined(var_a57cf0fe1f517f38) || var_a57cf0fe1f517f38 == "") {
        if (isdefined(level.var_673320093d434d55)) {
            self [[ level.var_673320093d434d55 ]]();
        }
    } else if (isdefined(level.var_237eaf521a80c304)) {
        self [[ level.var_237eaf521a80c304 ]](var_a57cf0fe1f517f38);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x191d
// Size: 0x19
function private function_4c025df9ec965ae2() {
    if (isdefined(self) && isdefined(self.var_db2dce013db69c33)) {
        return 1;
    }
    return 0;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x193e
// Size: 0x19
function private function_7fcbb3b96e848adf() {
    if (isdefined(self) && isdefined(self.var_8c0af45aa43f34fc)) {
        return 1;
    }
    return 0;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195f
// Size: 0x72
function function_9793a81bc3bc19e9(eventref, team, delay) {
    if (isdefined(delay)) {
        wait(delay);
    }
    players = level.players;
    if (isdefined(team)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
            players = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](team, "players");
        }
    }
    function_d87d5deb069bf8e5(eventref, players);
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d8
// Size: 0x59
function function_8c3011dccace47c4(eventref) {
    if (isdefined(self.var_36c21c8d1ae71882) && level.overlord.events[eventref].priority < self.var_36c21c8d1ae71882) {
        return 0;
    }
    return !namespace_3c37cb17ade254d::array_contains_key(self.var_5a2916f745d4389a, eventref);
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a39
// Size: 0x13c
function function_d453707f6b8f2c6d() {
    if (!isdefined(self.var_5a2916f745d4389a)) {
        self.var_5a2916f745d4389a = [];
        return;
    }
    var_8685876230b8771d = [];
    currenttime = gettime();
    foreach (eventref, n_start_time in self.var_5a2916f745d4389a) {
        if (!isdefined(level.overlord.events[eventref])) {
            continue;
        }
        var_d2154b40b980d7d6 = n_start_time + function_a5b14435e3229bed(level.overlord.events[eventref].timeout) + level.overlord.events[eventref].cooldown;
        if (var_d2154b40b980d7d6 < currenttime) {
            var_8685876230b8771d[eventref] = n_start_time;
        }
    }
    foreach (eventref, n_start_time in var_8685876230b8771d) {
        self.var_5a2916f745d4389a[eventref] = undefined;
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7c
// Size: 0xcf
function function_50ebf0029301be3f(player, eventref) {
    if (!isdefined(player.var_5a2916f745d4389a)) {
        return 0;
    }
    if (!isdefined(player.var_5a2916f745d4389a[eventref])) {
        return 0;
    }
    if (!isdefined(level.overlord.events[eventref])) {
        return 0;
    }
    if (!isdefined(level.overlord.events[eventref].cooldown)) {
        return 0;
    }
    lasttime = player.var_5a2916f745d4389a[eventref];
    cooldowntime = level.overlord.events[eventref].cooldown;
    currenttime = gettime();
    return lasttime + cooldowntime >= currenttime;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c53
// Size: 0x127
function function_17c324959b47a339(event) {
    if (function_4c025df9ec965ae2()) {
        if (event.priority > self.var_db2dce013db69c33.priority) {
            function_2569e8e725c5d5f4();
            return 1;
        } else if (getdvarint(@"hash_ec5ffe1a34b9c8a3", 0)) {
            return 0;
        }
    }
    if (getdvarint(@"hash_ec5ffe1a34b9c8a3", 0)) {
        if (function_7fcbb3b96e848adf() && event.priority > self.var_8c0af45aa43f34fc.priority) {
            end_overlord_event();
            return 1;
        } else {
            return 0;
        }
    } else {
        foreach (eventref, n_start_time in self.var_5a2916f745d4389a) {
            if (event.priority <= level.overlord.events[eventref].priority) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d82
// Size: 0x26
function private function_4831c2aa1655ce23(player) {
    var_d90809392748e640 = player namespace_2b1145f62aa835b8::function_87072b42853a9c58("specialty_pc_stealth");
    return !istrue(var_d90809392748e640);
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1db0
// Size: 0x98
function private isvalidplayer(player) {
    var_d1b01ca13019c169 = 1;
    if (isdefined(level.var_76eba5facacd254b) && isfunction(level.var_76eba5facacd254b)) {
        var_d1b01ca13019c169 = [[ level.var_76eba5facacd254b ]](player);
    }
    return isdefined(player) && isdefined(player.team) && isdefined(player.origin) && isalive(player) && !isdefined(player.fauxdead) && !istrue(player.delayedspawnedplayernotify) && istrue(var_d1b01ca13019c169);
}

// Namespace overlord/namespace_446fc987a980892f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e50
// Size: 0x394
function function_b0c21eabffce3fd4() {
    var_deb4634ff3cff859 = getdvarint(@"hash_57797986a6d60476", 4096);
    var_deb4634ff3cff859 = var_deb4634ff3cff859 * var_deb4634ff3cff859;
    var_5cc086a792b04fce = getdvarfloat(@"hash_32244d6acf101808", 60);
    trackedTeams = [];
    foreach (team in level.teamnamelist) {
        trackedTeams[team] = [];
    }
    while (1) {
        validplayers = [];
        foreach (player in level.players) {
            if (isvalidplayer(player)) {
                validplayers[validplayers.size] = player;
            }
        }
        partition = function_21a6a1c613b50a28(validplayers, 2500);
        foreach (player in validplayers) {
            if (!isvalidplayer(player)) {
                continue;
            }
            foreach (var_bab0d10e51188531 in partition function_df633f460888a47(player.origin)) {
                foreach (var_f7632b4589b2bed4 in var_bab0d10e51188531) {
                    if (!isvalidplayer(var_f7632b4589b2bed4) || !function_4831c2aa1655ce23(var_f7632b4589b2bed4)) {
                        continue;
                    }
                    if (player.team == var_f7632b4589b2bed4.team || distancesquared(player.origin, var_f7632b4589b2bed4.origin) > var_deb4634ff3cff859) {
                        continue;
                    }
                    var_ba24b605d8b9c100 = function_f240c299b9341e8f(player, var_f7632b4589b2bed4, trackedTeams, var_5cc086a792b04fce);
                    if (var_ba24b605d8b9c100) {
                        var_c1d6d0edd4194945 = namespace_2b1145f62aa835b8::function_9563f2d4e690856d(var_f7632b4589b2bed4.team, "players");
                        var_83f8bfe8c7a7ee0b = namespace_2b1145f62aa835b8::function_9563f2d4e690856d(player.team, "players");
                        var_571aeaf27dbb7e22 = [];
                        foreach (player in var_83f8bfe8c7a7ee0b) {
                            if (getdvarint(@"hash_c53afaea3f55391a", 0) && player namespace_2b1145f62aa835b8::function_87072b42853a9c58("specialty_pc_comms")) {
                                continue;
                            }
                            var_571aeaf27dbb7e22[var_571aeaf27dbb7e22.size] = player;
                        }
                        function_d87d5deb069bf8e5(ter_op(var_c1d6d0edd4194945.size > level.overlord.var_f122d73bb796754c, "nearby_big_team", "player_enemy_player_nearby"), var_571aeaf27dbb7e22);
                        trackedTeams[player.team][var_f7632b4589b2bed4.team] = gettime();
                    }
                }
            }
            waitframe();
        }
        wait(3);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21eb
// Size: 0x33d
function function_aea00c3815b226da(player) {
    player notify("monitor_enemy_prox");
    player endon("disconnect");
    player endon("death");
    level endon("game_ended");
    player endon("monitor_enemy_prox");
    var_deb4634ff3cff859 = getdvarint(@"hash_57797986a6d60476", 4096);
    var_deb4634ff3cff859 = var_deb4634ff3cff859 * var_deb4634ff3cff859;
    var_5cc086a792b04fce = getdvarfloat(@"hash_32244d6acf101808", 60);
    trackedTeams = [];
    foreach (team in level.teamnamelist) {
        trackedTeams[team] = [];
    }
    while (1) {
        validplayers = [];
        foreach (validplayer in level.players) {
            if (isvalidplayer(validplayer)) {
                validplayers[validplayers.size] = validplayer;
            }
        }
        partition = function_21a6a1c613b50a28(validplayers, 2500);
        foreach (var_bab0d10e51188531 in partition function_df633f460888a47(player.origin)) {
            foreach (var_f7632b4589b2bed4 in var_bab0d10e51188531) {
                if (!isvalidplayer(var_f7632b4589b2bed4) || !function_4831c2aa1655ce23(var_f7632b4589b2bed4)) {
                    continue;
                }
                if (player.team == var_f7632b4589b2bed4.team || distancesquared(player.origin, var_f7632b4589b2bed4.origin) > var_deb4634ff3cff859) {
                    continue;
                }
                var_ba24b605d8b9c100 = !isdefined(trackedTeams[player.team][var_f7632b4589b2bed4.team]) || (gettime() - trackedTeams[player.team][var_f7632b4589b2bed4.team]) / 1000 > var_5cc086a792b04fce;
                if (var_ba24b605d8b9c100) {
                    if (isdefined(level.var_38ae0db9542b127c)) {
                        [[ level.var_38ae0db9542b127c ]](player, var_f7632b4589b2bed4);
                    } else {
                        var_c1d6d0edd4194945 = namespace_53fc9ddbb516e6e1::function_9563f2d4e690856d(var_f7632b4589b2bed4.team, "players");
                        function_d87d5deb069bf8e5(ter_op(var_c1d6d0edd4194945.size > level.overlord.var_f122d73bb796754c, "nearby_big_team", "player_enemy_player_nearby"), [0:player]);
                    }
                    trackedTeams[player.team][var_f7632b4589b2bed4.team] = gettime();
                }
            }
        }
        wait(3);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252f
// Size: 0x16
function function_60fc087bc7deaadc(val) {
    self.var_36c21c8d1ae71882 = val;
}

// Namespace overlord/namespace_446fc987a980892f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x254c
// Size: 0x70
function function_2c722a2ef9574e87(players, tag, priority) {
    foreach (player in players) {
        player val::set(tag, "overlord_locked_priority", priority);
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c3
// Size: 0x67
function function_70979c1eabf04180(players, tag) {
    foreach (player in players) {
        player val::reset(tag, "overlord_locked_priority");
    }
}

// Namespace overlord/namespace_446fc987a980892f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2631
// Size: 0xc3
function function_f240c299b9341e8f(player, var_f7632b4589b2bed4, trackedTeams, var_5cc086a792b04fce) {
    var_ba24b605d8b9c100 = !isdefined(trackedTeams[player.team][var_f7632b4589b2bed4.team]) || (gettime() - trackedTeams[player.team][var_f7632b4589b2bed4.team]) / 1000 > var_5cc086a792b04fce;
    if (getdvarint(@"hash_c53afaea3f55391a", 0)) {
        var_c1d6d0edd4194945 = namespace_2b1145f62aa835b8::function_9563f2d4e690856d(var_f7632b4589b2bed4.team, "players");
        return (var_ba24b605d8b9c100 && var_c1d6d0edd4194945.size > level.overlord.var_f122d73bb796754c);
    }
    return var_ba24b605d8b9c100;
}

