#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_7edf952f8921aa6b;
#using script_9880b9dc28bc25e;
#using script_4a8c20678bd6a83e;
#using scripts\mp\objidpoolmanager.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\ai_behavior.gsc;
#using scripts\common\debug.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\stealth\friendly.gsc;
#using scripts\common\ai.gsc;
#using scripts\asm\asm.gsc;
#using script_371b4c2ab5861e62;
#using scripts\common\cap.gsc;
#using scripts\asm\cap.gsc;
#using scripts\mp\utility\player.gsc;
#using script_58be75c518bf0d40;
#using script_3433ee6b63c7e243;
#using scripts\asm\asm_bb.gsc;
#using script_3b78d23dad7ec5be;
#using scripts\common\devgui.gsc;

#namespace namespace_bc50cc28d0217818;

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa00
// Size: 0x121
function function_b21b3b439cfd8877() {
    level.var_dd864fc4e733d2e3 = [];
    level.var_71fd23ea9c43067e = [];
    level.var_d1f6a7b06a6a195c = [];
    level._effect["ava_teleport_out"] = loadfx("vfx/jup/ob/gameplay/riftrun/s5_5/story_mission/vfx_teleportation_out.vfx");
    level._effect["ava_teleport_in"] = loadfx("vfx/jup/ob/gameplay/riftrun/s5_5/story_mission/vfx_teleportation_spawn_in.vfx");
    level._effect["ava_cleanse_loop"] = loadfx("vfx/jup/ob/gameplay/riftrun/s5_5/story_mission/vfx_cleanse_ava_light_bomb.vfx");
    setdvarifuninitialized(@"hash_e20f21c6b6c6bbc0", 1200);
    setdvarifuninitialized(@"hash_78f245466a6f872a", 300);
    setdvarifuninitialized(@"hash_16ea79a56a6a8d2b", 200);
    setdvarifuninitialized(@"hash_f95d36af2068b554", 0);
    setdvarifuninitialized(@"hash_53a9e906fd90b075", 10);
    setdvarifuninitialized(@"hash_f83b4bb301618098", 1);
    /#
        setdevdvarifuninitialized(@"hash_4d02ead68eeb1146", 0);
        setdevdvarifuninitialized(@"hash_d7bebf9f14461660", 0);
        setdevdvarifuninitialized(@"hash_856e10cf5b2862d1", 0);
        setdevdvarifuninitialized(@"hash_9ce840e709d39b71", 0);
        level thread function_4e6a1f223393c32e();
    #/
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb29
// Size: 0x10a
function ravenov_spawn(var_aaba4f8d5fa7fcb9) {
    if (isdefined(var_aaba4f8d5fa7fcb9)) {
        var_2de6b144694b16ce = var_aaba4f8d5fa7fcb9;
    } else {
        var_2de6b144694b16ce = getstruct("ally_spawn_ravenov", "script_noteworthy");
    }
    if (!isdefined(var_2de6b144694b16ce)) {
        return undefined;
    }
    if (isdefined(level.var_1da22412ed7ad03b) && istrue(level.var_1da22412ed7ad03b.var_8f825bd739498693)) {
        level.var_1da22412ed7ad03b function_9f44d0edaa30d584();
        level.var_1da22412ed7ad03b = undefined;
        waitframe();
    } else {
        level.var_1da22412ed7ad03b = undefined;
    }
    ravenov = undefined;
    while (!isdefined(ravenov)) {
        ravenov = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_ally_ravenov_base", var_2de6b144694b16ce.origin, var_2de6b144694b16ce.angles);
        waitframe();
    }
    ravenov setoverridearchetype("animscript", "agent_mp_jup_ob_ravenov", 1);
    ravenov function_1a735ee97f484ff5("ravenov");
    level.var_1da22412ed7ad03b = ravenov;
    level.var_1da22412ed7ad03b.var_8f825bd739498693 = 1;
    flag_set("flag_ravenov_follower_spawned");
    return ravenov;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc3c
// Size: 0x18e
function ava_spawn(var_aaba4f8d5fa7fcb9) {
    if (isdefined(var_aaba4f8d5fa7fcb9)) {
        s_ava = var_aaba4f8d5fa7fcb9;
    } else {
        s_ava = getstruct("ally_spawn_ava", "script_noteworthy");
    }
    if (!isdefined(s_ava)) {
        return undefined;
    }
    if (isdefined(level.var_2ada333c838a2316) && istrue(level.var_2ada333c838a2316.var_9c7b54b172c87654)) {
        level.var_2ada333c838a2316 function_9f44d0edaa30d584();
        level.var_2ada333c838a2316 = undefined;
        waitframe();
    } else {
        level.var_2ada333c838a2316 = undefined;
    }
    ava = undefined;
    while (!isdefined(ava)) {
        ava = scripts\mp\mp_agent::spawnnewagentaitype("jup_ob_ally_ava_base", s_ava.origin, s_ava.angles);
        waitframe();
    }
    ava setoverridearchetype("animscript", "agent_mp_jup_ob_ava", 1);
    ava function_1a735ee97f484ff5("ava");
    ava val::set("ava_buddy", "ignoreme", 1);
    if (!ava ent_flag_exist("ent_flag_cleanse_cap_started")) {
        ava ent_flag_init("ent_flag_cleanse_cap_started");
    }
    if (!ava ent_flag_exist("ent_flag_cleanse_cap_enter_finished")) {
        ava ent_flag_init("ent_flag_cleanse_cap_enter_finished");
    }
    if (!ava ent_flag_exist("ent_flag_cleanse_cap_loop_done")) {
        ava ent_flag_init("ent_flag_cleanse_cap_loop_done");
    }
    if (!ava ent_flag_exist("ent_flag_cleanse_cap_exit_finished")) {
        ava ent_flag_init("ent_flag_cleanse_cap_exit_finished");
    }
    level.var_2ada333c838a2316 = ava;
    level.var_2ada333c838a2316.var_9c7b54b172c87654 = 1;
    flag_set("flag_ava_follower_spawned");
    return ava;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd3
// Size: 0x73
function function_cff9b0608bc49bfc() {
    self endon("death");
    flag_wait_all("ava_intro_complete", "rav_intro_complete");
    self.headicon = createheadicon(self);
    setheadiconimage(self.headicon, "ui_jup_hud_hacking_complete_border");
    setheadicondrawinmap(self.headicon, 1);
    setheadiconzoffset(self.headicon, 20);
    function_51044b10b2b673df(self.headicon, "icon_small");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe4e
// Size: 0x36b
function function_1a735ee97f484ff5(var_90a13a0855079abe) {
    self.rift_run = spawnstruct();
    self.animname = self.animsetname;
    self.var_90a13a0855079abe = var_90a13a0855079abe;
    var_91363db0fa8a40a6 = getdvarint(@"hash_8072b5d9a8b538f8", 200);
    if (!isdefined(self.stealth)) {
        thread scripts\stealth\friendly::main();
        ent_flag_wait("stealth_enabled");
        self.stealth_enabled = 1;
    }
    if (isdefined(self.fnsetstealthstate)) {
        self [[ self.fnsetstealthstate ]]("combat");
        self aisetdesiredspeed(var_91363db0fa8a40a6);
    }
    self function_e99626add202fe1a(1);
    scripts\common\utility::set_battlechatter(1);
    self.battlechatter.stateoverride = "combat";
    self.var_5323a94889eff1de = 1;
    self.var_3056d8c9bd11f1f2 = 1;
    self.var_cbd87a0bc497b778 = 1;
    self.var_69b049cf4b18c73b = 1;
    self.var_9f009877c3bea958 = 1;
    self.dontgrenademe = 1;
    self.dontmeleeme = 1;
    self.var_d8a098b0872bb2cb = 1;
    self.aggressivemode = 1;
    self.baseaccuracy = 1.75;
    self.var_4268b42fc89d0be9 = 0.001;
    self.var_8a783f4c73c2ae91 = 4e-06;
    self.var_e89cb8048a26c2c5 = 0.02;
    self.var_a32530404b862f7b = 1;
    self.disablereload = 1;
    self.dontsyncmelee = 1;
    self.var_fc8b605280dd80b0 = 1.2;
    self forcenetfieldhighlod(1);
    if (getdvarint(@"hash_f83b4bb301618098")) {
        thread function_cff9b0608bc49bfc();
    }
    if (!threatbiasgroupexists("allies")) {
        createthreatbiasgroup("allies");
    }
    self setthreatbiasgroup("allies");
    setthreatbias("team_two_hundred", "allies", -2000);
    scripts\common\ai::magic_bullet_shield();
    self.health = 1000;
    self.var_c13146701c692a16 = undefined;
    ent_flag_init("waiting_on_state_change");
    if (isdefined(level.players[0])) {
        self.team = level.players[0].team;
    }
    /#
        thread function_4e540622337b5900();
    #/
    var_561323284fba2f2b = "jup_ob_s5_teleport_out";
    var_be1c4125e3830c7a = "jup_ob_s5_teleport_in";
    var_a0c021150798d387 = scripts\asm\asm::asm_lookupanimfromalias("animscripted", var_561323284fba2f2b);
    var_abdcc31f53aaeb21 = scripts\asm\asm::asm_getxanim("animscripted", var_a0c021150798d387);
    self.var_a0e0a070ddf27453 = getanimlength(var_abdcc31f53aaeb21);
    var_41581ba4cfc62392 = scripts\asm\asm::asm_lookupanimfromalias("animscripted", var_be1c4125e3830c7a);
    var_244b47a473bc2cf8 = scripts\asm\asm::asm_getxanim("animscripted", var_41581ba4cfc62392);
    self.var_9dc2e12ad70fc632 = getanimlength(var_244b47a473bc2cf8);
    val::set(var_90a13a0855079abe + "_buddy", "ignoresuppression", 1);
    grenadeweaponhash = "jup_blackhole_bomb_ob";
    if (!isdefined(level.var_67b54180a55f70e1[grenadeweaponhash])) {
        level.var_67b54180a55f70e1[grenadeweaponhash] = makeweapon("jup_blackhole_bomb_ob");
    }
    self.grenadeweapon = level.var_67b54180a55f70e1[grenadeweaponhash];
    self.grenadeammo = 0;
    level.var_dd864fc4e733d2e3 = function_6d6af8144a5131f1(level.var_dd864fc4e733d2e3, self);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11c1
// Size: 0x3f
function function_9f44d0edaa30d584() {
    self.nocorpse = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.dropweapon = 0;
    if (istrue(self.magic_bullet_shield)) {
        scripts\common\ai::stop_magic_bullet_shield();
    }
    namespace_14d36171baccf528::function_7056963336f2bbec(1);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1208
// Size: 0x265
function function_c75b149451e69c1(var_38f5f2e6f45246b5) {
    self notify("new_behavior_requested", var_38f5f2e6f45246b5);
    self.var_f9cf5abd786ef489 = var_38f5f2e6f45246b5;
    var_697da0da3a228bb7 = 0;
    if (isdefined(self.var_c13146701c692a16)) {
        if (self.var_c13146701c692a16 == 0) {
        } else if (self.var_c13146701c692a16 == 1) {
        } else if (self.var_c13146701c692a16 == 2 || self.var_c13146701c692a16 == 3) {
            if (ent_flag("waiting_on_state_change")) {
                self notify("cancel_behavior_change");
            }
            ent_flag_set("waiting_on_state_change");
            msg = waittill_any_return_2("cleanse_finished", "cancel_behavior_change");
            if (is_equal(msg, "cancel_behavior_change")) {
                var_697da0da3a228bb7 = 1;
            }
            waittillframeend();
        }
    }
    if (istrue(var_697da0da3a228bb7) || isdefined(var_38f5f2e6f45246b5) && isdefined(self.var_f9cf5abd786ef489) && self.var_f9cf5abd786ef489 != var_38f5f2e6f45246b5) {
        return false;
    }
    if (istrue(self.teleporting)) {
        timeout = self.var_9dc2e12ad70fc632 + self.var_a0e0a070ddf27453 + 0.5;
        ent_flag_set("waiting_on_state_change");
        msg = waittill_any_timeout_2(timeout, "follower_teleported", "cancel_behavior_change");
        if (is_equal(msg, "timeout")) {
            /#
                if (getdvarint(@"hash_4d02ead68eeb1146")) {
                    assertmsg("<dev string:x1c>");
                }
            #/
            scripts\asm\shared\mp\utility::animscripted_clear();
            self notify("spawn_end", "end");
            ent_flag_clear("follower_teleporting");
            self.teleporting = 0;
        } else if (is_equal(msg, "cancel_behavior_change")) {
            var_697da0da3a228bb7 = 1;
        }
    }
    if (istrue(var_697da0da3a228bb7) || isdefined(var_38f5f2e6f45246b5) && isdefined(self.var_f9cf5abd786ef489) && self.var_f9cf5abd786ef489 != var_38f5f2e6f45246b5) {
        return false;
    }
    if (ent_flag("waiting_on_state_change")) {
        ent_flag_clear("waiting_on_state_change");
    }
    self notify("new_behavior_set", var_38f5f2e6f45246b5);
    function_383eed2b2dd31df3();
    val::set("cleanse_ignore", "ignoreall", 0);
    val::set("catchup_ignoreall", "ignoreall", 0);
    val::set(self.var_90a13a0855079abe + "_buddy", "ignoreall", 0);
    self function_9322f3cb1cd4111a();
    self.var_f9cf5abd786ef489 = undefined;
    self.var_c13146701c692a16 = undefined;
    return true;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1476
// Size: 0x1a
function function_a69c5fbb27c17133(var_edd3b3116f7af2a1) {
    if (!isdefined(var_edd3b3116f7af2a1)) {
        var_edd3b3116f7af2a1 = 0;
    }
    return function_e9658b73a53783aa(var_edd3b3116f7af2a1);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1499
// Size: 0xae
function function_d6e4c5c74c55fe0(dest_origin, var_276fea0dbb461536, on_navmesh, var_2950ab8950f6485d) {
    if (!isdefined(on_navmesh)) {
        on_navmesh = 1;
    }
    if (!isdefined(var_2950ab8950f6485d)) {
        var_2950ab8950f6485d = 1;
    }
    level endon("game_ended");
    self endon("death");
    safeorigin = istrue(on_navmesh) ? getclosestpointonnavmesh(dest_origin, self) : dest_origin;
    success = 0;
    if (isdefined(safeorigin)) {
        function_a2e85f09c67b4877(safeorigin, var_276fea0dbb461536);
        success = 1;
    }
    if (istrue(var_2950ab8950f6485d) && (!success || distancesquared(self.origin, safeorigin) > squared(768))) {
        self.origin = dest_origin;
    }
    return success;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1550
// Size: 0x151
function function_b6b46d9505a84f4(points, dist_override, volume) {
    if (!isarray(points)) {
        points = [points];
    }
    foreach (dest in points) {
        if (isdefined(volume)) {
            dest.var_27f1962622d2c17f = isarray(volume) ? volume : [volume];
        } else if (isdefined(dest.target)) {
            var_27f1962622d2c17f = getentarray(dest.target, "targetname");
            var_1e1d1f49fb0632b5 = function_f159c10d5cf8f0b4(dest.target, "targetname");
            dest.var_27f1962622d2c17f = array_combine(var_27f1962622d2c17f, var_1e1d1f49fb0632b5);
        }
        if (isdefined(dist_override)) {
            dest.dist_override = dist_override;
        } else if (isdefined(dest.radius)) {
            dest.dist_override = dest.radius;
        }
        level.var_71fd23ea9c43067e = array_add(level.var_71fd23ea9c43067e, dest);
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a9
// Size: 0x35
function function_24d79fd9489d13bc(points) {
    if (!isarray(points)) {
        points = [points];
    }
    level.var_71fd23ea9c43067e = array_remove_array(level.var_71fd23ea9c43067e, points);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16e6
// Size: 0xa9
function function_e85bdef1c036b3a2(volumes) {
    if (!isarray(volumes)) {
        volumes = [volumes];
    }
    /#
        if (getdvarint(@"hash_9ce840e709d39b71", 0)) {
            foreach (volume in volumes) {
                function_61501f938d933fe1(volume, (1, 0, 0), 1, 999999);
            }
        }
    #/
    level.var_d1f6a7b06a6a195c = array_combine_unique(level.var_d1f6a7b06a6a195c, volumes);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1797
// Size: 0x35
function function_1d928d544041c1f7(volumes) {
    if (!isarray(volumes)) {
        volumes = [volumes];
    }
    level.var_d1f6a7b06a6a195c = array_remove_array(level.var_d1f6a7b06a6a195c, volumes);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17d4
// Size: 0x2
function private function_e419e5a4ed9971b5() {
    
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x17de
// Size: 0x149
function function_a4f2de37b22bd9f9(guard_location, strict, var_a2c18caefeb31362, variance, var_fec582974e88db3d) {
    success = function_c75b149451e69c1(1);
    if (!success) {
        return;
    }
    if (!isdefined(strict)) {
        strict = 0;
    }
    if (!isdefined(variance)) {
        variance = 10;
    }
    var_70c3d87c43660dcf = undefined;
    if (!isdefined(guard_location)) {
        var_70c3d87c43660dcf = self.origin;
    } else if (isstruct(guard_location)) {
        if (isdefined(guard_location.origin)) {
            var_70c3d87c43660dcf = guard_location.origin;
        }
        if (isdefined(guard_location.radius) && !isdefined(var_a2c18caefeb31362)) {
            var_a2c18caefeb31362 = guard_location.radius;
        }
    } else if (isvector(guard_location)) {
        var_70c3d87c43660dcf = guard_location;
    } else if (isdefined(guard_location.origin)) {
        var_70c3d87c43660dcf = guard_location.origin;
    }
    if (!isdefined(var_a2c18caefeb31362)) {
        var_a2c18caefeb31362 = 25;
    }
    if (istrue(var_fec582974e88db3d) && distancesquared(self.origin, var_70c3d87c43660dcf) > squared(1200)) {
        success = function_d6e4c5c74c55fe0(var_70c3d87c43660dcf);
    }
    self notify("guard_start");
    self function_65cdab0fc78aba8f(var_70c3d87c43660dcf, 3000);
    self.var_c13146701c692a16 = 1;
    thread function_4c35bda0f32cd8a7(var_70c3d87c43660dcf, strict, var_a2c18caefeb31362, variance);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x192f
// Size: 0x73
function function_4c35bda0f32cd8a7(var_70c3d87c43660dcf, strict, var_a2c18caefeb31362, variance) {
    self endon("death");
    self endon("new_behavior_requested");
    self endon("new_behavior_set");
    self setgoalpos(var_70c3d87c43660dcf, 16);
    if (distance2dsquared(var_70c3d87c43660dcf, self.origin) > squared(32)) {
        self waittill("goal");
    }
    if (!istrue(strict)) {
        function_e38f21e33b0ba200(var_70c3d87c43660dcf, var_a2c18caefeb31362, variance);
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19aa
// Size: 0x11e
function function_e38f21e33b0ba200(var_70c3d87c43660dcf, var_a2c18caefeb31362, variance) {
    self endon("death");
    self endon("new_behavior_requested");
    self endon("new_behavior_set");
    self notify("guardWander");
    self endon("guardWander");
    min = var_a2c18caefeb31362 - variance;
    max = var_a2c18caefeb31362 + variance;
    while (true) {
        random_x = randomfloatrange(min, max) * scripts\engine\utility::ter_op(randomint(100) > 50, 1, -1);
        random_y = randomfloatrange(min, max) * scripts\engine\utility::ter_op(randomint(100) > 50, 1, -1);
        var_52101416fe063026 = (var_70c3d87c43660dcf[0] + random_x, var_70c3d87c43660dcf[1] + random_y, var_70c3d87c43660dcf[2]);
        if (distance2d(self.origin, var_52101416fe063026) > 20) {
            self setgoalpos(var_52101416fe063026, 8);
            thread function_9c5262d8e15697fa();
            waittill_any_2("goal", "refreshGoalPos");
        }
        wait randomfloatrange(7.5, 10.5);
    }
    self setgoalpos(var_70c3d87c43660dcf, 8);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad0
// Size: 0x4e
function function_9c5262d8e15697fa(time) {
    self endon("goal");
    self endon("death");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    self endon("guardWander");
    waittime = 5;
    if (isdefined(time)) {
        waittime = time;
    }
    wait waittime;
    self notify("refreshGoalPos");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b26
// Size: 0x2
function private function_55f6a1c4d4a6b5d1() {
    
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1b30
// Size: 0x465
function function_df24f38b60071783(var_cd6ff234987c6436, var_35a893de7e9c2736, var_9cb1161b203daf49, var_9f0d03d1b41551c5, var_32cbd929103fc202) {
    success = function_c75b149451e69c1(2);
    if (!success) {
        return;
    }
    if (!isdefined(var_35a893de7e9c2736)) {
        var_35a893de7e9c2736 = 256;
    }
    if (!isdefined(var_32cbd929103fc202)) {
        var_32cbd929103fc202 = 5;
    }
    self.var_c13146701c692a16 = 2;
    var_6cfdc573eedd6043 = undefined;
    var_3583f37480e80b11 = (0, 0, 0);
    if (!isdefined(var_cd6ff234987c6436)) {
        var_6cfdc573eedd6043 = self.origin;
    } else if (isvector(var_cd6ff234987c6436)) {
        var_6cfdc573eedd6043 = var_cd6ff234987c6436;
    } else {
        var_6cfdc573eedd6043 = var_cd6ff234987c6436.origin;
        var_3583f37480e80b11 = var_cd6ff234987c6436.angles;
    }
    if (isdefined(var_9f0d03d1b41551c5) && flag(var_9f0d03d1b41551c5)) {
        return;
    }
    var_9554c076d87d7d17 = anglestoforward(var_3583f37480e80b11);
    if (ent_flag("ent_flag_cleanse_cap_started")) {
        ent_flag_clear("ent_flag_cleanse_cap_started");
    }
    if (ent_flag("ent_flag_cleanse_cap_enter_finished")) {
        ent_flag_clear("ent_flag_cleanse_cap_enter_finished");
    }
    if (ent_flag("ent_flag_cleanse_cap_loop_done")) {
        ent_flag_clear("ent_flag_cleanse_cap_loop_done");
    }
    if (ent_flag("ent_flag_cleanse_cap_exit_finished")) {
        ent_flag_clear("ent_flag_cleanse_cap_exit_finished");
    }
    var_3633b6cdc644db83 = var_6cfdc573eedd6043;
    look_at_ent = undefined;
    self notify("cleanse_start");
    val::set("cleanse_ignore", "ignoreall", 1);
    dist = distancesquared(var_6cfdc573eedd6043, self.origin);
    ai_behavior::function_c6930ac29fe6ff53(8);
    self setgoalpos(var_6cfdc573eedd6043, 8);
    var_3633b6cdc644db83 = var_6cfdc573eedd6043 + var_9554c076d87d7d17 * 64 + (0, 0, 64);
    self.var_b95239f29466ec7d = var_3633b6cdc644db83;
    self.forcenextpathfindimmediate = 1;
    self orientmode("face point", self.var_b95239f29466ec7d);
    abort = 0;
    tele = 0;
    if (var_35a893de7e9c2736 < 32 || dist >= squared(var_35a893de7e9c2736)) {
        tele = 1;
    } else if (dist > 1024) {
        thread function_5c504279f87e227f(var_6cfdc573eedd6043, var_3583f37480e80b11);
        msg = waittill_any_timeout_4(var_32cbd929103fc202, "anim_reach_complete", "anim_reach_aborted", "new_behavior_set", "new_behavior_requested");
        if (function_5b7e9a4c946f3a13(msg, ["timeout", "anim_reach_aborted"])) {
            tele = 1;
        } else if (function_5b7e9a4c946f3a13(msg, ["new_behavior_set", "new_behavior_requested"])) {
            abort = 1;
        }
    }
    if (abort || isdefined(var_9f0d03d1b41551c5) && flag(var_9f0d03d1b41551c5)) {
        val::set("cleanse_ignore", "ignoreall", 0);
        self setoverridearchetype("animscript", "agent_mp_jup_ob_ava", 1);
        if (self.var_c13146701c692a16 == 2) {
            self.var_c13146701c692a16 = undefined;
        }
        self notify("cleanse_finished");
        return;
    }
    if (tele) {
        teleport_location = var_6cfdc573eedd6043 + var_9554c076d87d7d17 * -32;
        function_d6e4c5c74c55fe0(teleport_location, var_3583f37480e80b11);
        self notify("cleanse_force_teleported");
        waitframe();
        waitframe();
    }
    self notify("cleanse_loc_reached");
    var_7d01a745d66adeab = spawn("script_model", self gettagorigin("j_wrist_le"));
    var_7d01a745d66adeab setmodel("tag_origin");
    var_7d01a745d66adeab linkto(self, "j_wrist_le", (5, 0, -5), (0, 0, 0));
    thread function_78c9a316a9a714f3(var_7d01a745d66adeab);
    if (self isinscriptedstate()) {
        /#
            if (getdvarint(@"hash_4d02ead68eeb1146")) {
                iprintlnbold("<dev string:x83>");
            }
        #/
        scripts\asm\shared\mp\utility::animscripted_clear();
        waitframe();
    }
    thread scripts\common\cap::cap_start("jup_ob_relic_cleanse", "caps/outbreak/cap_ava_s5");
    ent_flag_wait("ent_flag_cleanse_cap_enter_finished");
    self notify("cleanse_start_ready");
    waitframe();
    function_2c0fe3e76c30595(var_9cb1161b203daf49, var_9f0d03d1b41551c5);
    thread function_2b49eeb75c9e6a4f(var_7d01a745d66adeab);
    self.var_c13146701c692a16 = 3;
    ent_flag_set("ent_flag_cleanse_cap_loop_done");
    ent_flag_wait("ent_flag_cleanse_cap_exit_finished");
    self setoverridearchetype("animscript", "agent_mp_jup_ob_ava", 1);
    val::set("cleanse_ignore", "ignoreall", 0);
    if (self.var_c13146701c692a16 == 3) {
        self.var_c13146701c692a16 = undefined;
    }
    self notify("cleanse_finished");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f9d
// Size: 0x139
function function_dc51232de9554c90(startorg, startangles) {
    self pushplayer(1);
    self.nododgemove = 1;
    self.doavoidanceblocking = 0;
    self.fixednodewason = self.fixednode;
    self.fixednode = 0;
    self.var_a4700673c6ef6c4 = self.var_b29c3655b12e292d;
    self.var_b29c3655b12e292d = 0;
    self.oldpathenemyfightdist = self.pathenemyfightdist;
    self.oldpathenemylookahead = self.pathenemylookahead;
    self.pathenemyfightdist = 0;
    self.pathenemylookahead = 128;
    if (!isdefined(self.scriptedarrivalent)) {
        self.old_disablearrivals = self.disablearrivals;
        self.disablearrivals = 1;
    } else {
        self.scriptedarrivalent.angles = startangles;
        self.scriptedarrivalent.origin = startorg;
    }
    self.oldgoalradius = self.goalradius;
    self.reach_goal_pos = undefined;
    self.reach_goal_pos = startorg;
    self.goalradius = 0;
    self.stopanimdistsq = squared(120);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20de
// Size: 0x159
function function_fe21cc6e65f85e7f() {
    self pushplayer(0);
    self.nododgemove = 0;
    self.doavoidanceblocking = 1;
    if (isdefined(self.fixednodewason)) {
        self.fixednode = self.fixednodewason;
    }
    if (isdefined(self.var_a4700673c6ef6c4)) {
        self.var_b29c3655b12e292d = self.var_a4700673c6ef6c4;
    }
    if (isdefined(self.oldpathenemyfightdist)) {
        self.pathenemyfightdist = self.oldpathenemyfightdist;
    }
    if (isdefined(self.oldpathenemylookahead)) {
        self.pathenemylookahead = self.oldpathenemylookahead;
    }
    if (isdefined(self.old_disablearrivals)) {
        self.disablearrivals = self.old_disablearrivals;
    }
    if (isdefined(self.oldgoalradius)) {
        self.goalradius = self.oldgoalradius;
    }
    if (isdefined(self.scriptedarrivalent)) {
        self.scriptedarrivalent delete();
    }
    self.stopanimdistsq = 0;
    self.fixednodewason = undefined;
    self.var_a4700673c6ef6c4 = undefined;
    self.scriptedarrivalent = undefined;
    self.oldgoalradius = undefined;
    self.old_disablearrivals = undefined;
    self.oldpathenemyfightdist = undefined;
    self.oldpathenemylookahead = undefined;
    self.var_a4700673c6ef6c4 = undefined;
    self.old_disablearrivals = undefined;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x223f
// Size: 0x168
function function_5c504279f87e227f(startorg, startangles) {
    self endon("death");
    self notify("new_anim_reach");
    self endon("new_anim_reach");
    self endon("cleanse_force_teleported");
    self endon("cleanse_finished");
    function_dc51232de9554c90(startorg, startangles);
    points = [];
    var_d53ac287d9031788 = 50;
    var_76b92aaf2604bd71 = 2500;
    if ((!isdefined(self.scriptedarrivalent) || !isdefined(self.scriptedarrivalent.type)) && distance2dsquared(startorg, self.origin) > var_76b92aaf2604bd71) {
        forward = anglestoforward(startangles);
        var_b88bb2e631bcc2b3 = startorg - forward * var_d53ac287d9031788;
        if (navisstraightlinereachable(startorg, var_b88bb2e631bcc2b3, self)) {
            points[points.size] = var_b88bb2e631bcc2b3;
        }
    }
    points[points.size] = startorg;
    self setgoalpos(points[0]);
    self waittill("goal");
    if (isdefined(self.var_b95239f29466ec7d)) {
        self orientmode("face point", self.var_b95239f29466ec7d);
    }
    self setgoalpos(points[points.size - 1]);
    msg = waittill_notify_or_timeout_return("goal", 5);
    function_fe21cc6e65f85e7f();
    if (is_equal(msg, "timeout")) {
        self notify("anim_reach_aborted");
        return;
    }
    self notify("reach_notify");
    self notify("anim_reach_complete");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23af
// Size: 0x30
function function_78c9a316a9a714f3(var_7d01a745d66adeab) {
    wait 1;
    var_435846b18ad211c9 = playfxontag(getfx("ava_cleanse_loop"), var_7d01a745d66adeab, "tag_origin");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23e7
// Size: 0x2c
function function_2b49eeb75c9e6a4f(var_7d01a745d66adeab) {
    wait 2;
    stopfxontag(getfx("ava_cleanse_loop"), var_7d01a745d66adeab, "tag_origin");
    var_7d01a745d66adeab delete();
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x241b
// Size: 0x53
function function_9edbc512aeed073f(asmname, statename, params) {
    if (isdefined(self.var_b95239f29466ec7d)) {
        self orientmode("face point", self.var_b95239f29466ec7d);
    }
    scripts\asm\cap::cap_init(asmname, statename, params);
    ent_flag_set("ent_flag_cleanse_cap_started");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2476
// Size: 0x31
function function_95e4400513ea51cc(asmname, statename, params) {
    ent_flag_set("ent_flag_cleanse_cap_enter_finished");
    scripts\asm\cap::function_c6f62de5c6e04207(asmname, statename, params);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x24af
// Size: 0x39
function function_69de6a4f3628cd5e(asmname, statename, tostatename, params) {
    if (ent_flag("ent_flag_cleanse_cap_loop_done")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x24f0
// Size: 0x31
function function_435b9abadb237961(asmname, statename, params) {
    scripts\asm\cap::cap_exit(asmname, statename, params);
    ent_flag_set("ent_flag_cleanse_cap_exit_finished");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2529
// Size: 0x53
function private function_2c0fe3e76c30595(var_9cb1161b203daf49, var_9f0d03d1b41551c5) {
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    if (isdefined(var_9cb1161b203daf49) && isdefined(var_9f0d03d1b41551c5)) {
        level endon(var_9cb1161b203daf49);
        flag_wait(var_9f0d03d1b41551c5);
        return;
    }
    if (isdefined(var_9cb1161b203daf49)) {
        level waittill(var_9cb1161b203daf49);
        return;
    }
    if (isdefined(var_9f0d03d1b41551c5)) {
        flag_wait(var_9f0d03d1b41551c5);
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2584
// Size: 0x2
function private function_a4c995add3b3612d() {
    
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258e
// Size: 0x9f
function function_101b97bce06bef4() {
    success = function_c75b149451e69c1(0);
    if (!success) {
        return;
    }
    self.var_c13146701c692a16 = 0;
    self.var_93c47f074dc58a0b = 1;
    self.var_6728c500721755da = getdvarint(@"hash_53a9e906fd90b075", 10);
    self.var_3cdcc135bfd71914 = 20;
    self.var_ded207268b2c2c7d = function_d8135cbde5f2da03();
    self.var_7d0dc3f83c9944e9 = 1;
    self.teleporting = 0;
    self setgoalpos(self.origin);
    thread function_9aa3008e7fbe849b();
    thread function_1d0414c10e226e6e();
    thread function_dc6f3ac4406ba3b2();
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2635
// Size: 0x12a
function private function_d8135cbde5f2da03() {
    aliveplayers = [];
    var_5e7be3a99a2fb3e8 = 0;
    squadleader = undefined;
    foreach (player in level.players) {
        if (isplayer(player) && scripts\mp\utility\player::isreallyalive(player)) {
            aliveplayers[var_5e7be3a99a2fb3e8] = player;
        }
        var_5e7be3a99a2fb3e8++;
    }
    if (istrue(level.usesquadleader)) {
        foreach (player in aliveplayers) {
            if (isdefined(player.sessionsquadid)) {
                squadleader = namespace_ca7b90256548aa40::getsquadleader(player.team, player.sessionsquadid);
                if (isdefined(squadleader)) {
                    break;
                }
            }
        }
    }
    if (isdefined(squadleader)) {
        var_8850d9f771525016 = squadleader;
    } else {
        var_8850d9f771525016 = random(aliveplayers);
    }
    return var_8850d9f771525016;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2768
// Size: 0x1f7
function private function_1d0414c10e226e6e() {
    level endon("game_ended");
    self endon("death");
    self endon("follower_stop_follow");
    self endon("new_behavior_set");
    wait 1;
    wait_time = 1;
    thread function_9ab7fa2dfa6daf0d();
    self function_85e7c2baf116abf8(self.var_ded207268b2c2c7d);
    self function_741a41cd8e7cacd0(256);
    var_ff72655c03e66a5b = squared(getdvarint(@"hash_e20f21c6b6c6bbc0", 1200));
    var_adf2b2cf877e0f93 = getdvarint(@"hash_53a9e906fd90b075", 10);
    var_66c9ee8c1db06e21 = squared(getdvarint(@"hash_78f245466a6f872a", 300));
    var_59b05038888543f1 = squared(5000);
    while (isalive(self)) {
        if (!isdefined(self.var_ded207268b2c2c7d)) {
            self setgoalpos(self.origin, 4);
            wait 2;
            continue;
        }
        if (istrue(self.var_ded207268b2c2c7d.var_68b9486f4adbcb62)) {
            function_85db367a92c42f23();
            waitframe();
            continue;
        }
        if (self isinscriptedstate()) {
            wait 1;
            continue;
        }
        var_38aa31573fab99b5 = distancesquared(self.var_ded207268b2c2c7d.origin, self.origin);
        if (istrue(self.var_7d0dc3f83c9944e9) && !istrue(self.var_ded207268b2c2c7d.inlaststand) && self.var_6728c500721755da >= var_adf2b2cf877e0f93 && var_38aa31573fab99b5 >= var_ff72655c03e66a5b) {
            if (self.var_ded207268b2c2c7d isparachuting() || !self.var_ded207268b2c2c7d isonground()) {
                waitframe();
                continue;
            }
            success = function_e9658b73a53783aa();
            if (success) {
                continue;
            } else {
                wait 1;
                continue;
            }
        }
        if (var_38aa31573fab99b5 > var_66c9ee8c1db06e21) {
            if (var_38aa31573fab99b5 > var_59b05038888543f1) {
                wait 1;
                continue;
            }
            function_f02d595592be2688(self.var_ded207268b2c2c7d);
        }
        wait 1;
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2967
// Size: 0x153
function private function_9ab7fa2dfa6daf0d() {
    self notify("stay_near_target");
    self endon("stay_near_target");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    self endon("game_ended");
    val::set("catchup_ignoreall", "ignoreall", 0);
    self.var_a0bbdca278732f45 = 0;
    while (true) {
        if (getdvarint(@"hash_f95d36af2068b554", 0)) {
            if (isdefined(self.var_ded207268b2c2c7d)) {
                distsq = distancesquared(self.var_ded207268b2c2c7d.origin, self.origin);
                if (distsq > 360000 && !istrue(self.var_a0bbdca278732f45)) {
                    self.dontmelee = 1;
                    self.var_a0bbdca278732f45 = 1;
                } else if (istrue(self.var_a0bbdca278732f45) && distsq <= 90000) {
                    self.dontmelee = 0;
                    self.var_a0bbdca278732f45 = 0;
                }
            } else if (istrue(self.var_a0bbdca278732f45)) {
                self.dontmelee = 0;
                self.var_a0bbdca278732f45 = 0;
            }
        } else if (istrue(self.var_a0bbdca278732f45)) {
            val::set("catchup_ignoreall", "ignoreall", 0);
            self.dontmelee = 0;
            self.var_a0bbdca278732f45 = 0;
        }
        wait 0.3;
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2ac2
// Size: 0x349
function private function_f02d595592be2688(player) {
    level endon("game_ended");
    self endon("death");
    self endon("follower_stop_follow");
    self endon("new_behavior_set");
    if (!isplayer(player)) {
        return false;
    }
    if (istrue(player.var_68b9486f4adbcb62)) {
        return false;
    }
    if (self isinscriptedstate()) {
        return false;
    }
    safeorigin = undefined;
    failcount = 0;
    self clearbtgoal(2);
    var_f9f96ee79aa6f5fe = getdvarint(@"hash_16ea79a56a6a8d2b", 200);
    var_83c53a630f2c9423 = squared(var_f9f96ee79aa6f5fe);
    var_10f7a09e5689bf68 = squared(getdvarint(@"hash_e20f21c6b6c6bbc0", 1200));
    var_adf2b2cf877e0f93 = getdvarint(@"hash_53a9e906fd90b075", 10);
    ai_behavior::function_c6930ac29fe6ff53(var_f9f96ee79aa6f5fe);
    self.var_f79f774d8b98ab5 = self._blackboard.movetype;
    function_f1e5805da192a1ef("run", "turned", 25);
    safeorigin = function_571bf9f6769577e0(player);
    if (isdefined(safeorigin)) {
        function_7d323596701836e(safeorigin);
        var_95b51daa0fb10c76 = player.origin;
        reached_goal = 0;
        waitframe();
        while (true) {
            if (!isdefined(self)) {
                return false;
            }
            if (istrue(player.var_68b9486f4adbcb62)) {
                function_383eed2b2dd31df3();
                return false;
            }
            if (!isalive(player) || istrue(player.inlaststand)) {
                function_383eed2b2dd31df3();
                return false;
            }
            if (!isdefined(self.goalpos) || self function_1fde453596ea559c() > 2000) {
                function_383eed2b2dd31df3();
                return false;
            }
            var_3486e799824b565f = self isinscriptedstate();
            if (!var_3486e799824b565f && isdefined(self.goalpos) && distancesquared(self.goalpos, safeorigin) > 1024) {
                failcount++;
                if (failcount >= 5) {
                    var_623eee4b19010d1d = function_571bf9f6769577e0(player);
                    if (isdefined(var_623eee4b19010d1d)) {
                        safeorigin = var_623eee4b19010d1d;
                    }
                }
                function_7d323596701836e(safeorigin);
                waitframe();
                continue;
            }
            if (distancesquared(player.origin, var_95b51daa0fb10c76) > 2304 && distancesquared(player.origin, self.origin) < var_10f7a09e5689bf68) {
                safeorigin = function_571bf9f6769577e0(player);
                var_95b51daa0fb10c76 = player.origin;
                if (isdefined(safeorigin)) {
                    function_7d323596701836e(safeorigin);
                }
                waitframe();
                continue;
            } else if (distancesquared(player.origin, self.origin) >= var_10f7a09e5689bf68 && self.var_6728c500721755da >= var_adf2b2cf877e0f93 && istrue(self.var_7d0dc3f83c9944e9)) {
                if (player isparachuting() || !player isonground() || var_3486e799824b565f) {
                    waitframe();
                    continue;
                }
                success = function_e9658b73a53783aa();
                function_383eed2b2dd31df3();
                if (success) {
                    break;
                } else {
                    wait 1;
                    continue;
                }
            }
            if (distancesquared(self.goalpos, self.origin) < var_83c53a630f2c9423) {
                reached_goal = 1;
            }
            if (reached_goal && !var_3486e799824b565f) {
                function_383eed2b2dd31df3();
                break;
            }
            waitframe();
        }
    }
    self notify("follower_player_reached");
    return true;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2e14
// Size: 0x23
function private function_7d323596701836e(goalpos) {
    self setgoalpos(goalpos, getdvarint(@"hash_16ea79a56a6a8d2b", 200));
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2e3f
// Size: 0x45
function private function_383eed2b2dd31df3() {
    if (isdefined(self.goalpos) && distance2dsquared(self.goalpos, self.origin) >= squared(256)) {
        self setgoalpos(self.origin, 4);
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2e8c
// Size: 0xce
function private function_571bf9f6769577e0(player, var_6f7c8a746930e7b) {
    if (!isdefined(var_6f7c8a746930e7b)) {
        var_6f7c8a746930e7b = 0;
    }
    forward = self.origin - player.origin;
    forward = vectornormalize(forward);
    targetorigin = player.origin + (forward[0], forward[1], 0) * getdvarint(@"hash_16ea79a56a6a8d2b", 200);
    if (var_6f7c8a746930e7b) {
        safeorigin = getclosestpointonnavmesh(targetorigin, self);
    } else {
        safeorigin = self getclosestreachablepointonnavmesh(targetorigin);
    }
    safeorigin = getgroundposition(safeorigin, 15);
    /#
        if (getdvarint(@"hash_4d02ead68eeb1146")) {
            debug::debug_sphere(safeorigin, 15, (1, 0.75, 0.75), 3);
        }
    #/
    return safeorigin;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f63
// Size: 0xe7
function private function_dc6f3ac4406ba3b2() {
    level endon("game_ended");
    self endon("death");
    self endon("follower_stop_follow");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    self.var_ded207268b2c2c7d endon("death_or_disconnect");
    self function_65cdab0fc78aba8f(self.var_ded207268b2c2c7d.origin, 700);
    var_e82887f4e9e2c5ec = undefined;
    while (true) {
        if (isdefined(self.var_ded207268b2c2c7d)) {
            if (!isdefined(var_e82887f4e9e2c5ec)) {
                var_e82887f4e9e2c5ec = self.var_ded207268b2c2c7d.origin;
            } else if (distancesquared(var_e82887f4e9e2c5ec, self.var_ded207268b2c2c7d.origin) >= 90000) {
                self function_65cdab0fc78aba8f(self.var_ded207268b2c2c7d.origin, 700);
                var_e82887f4e9e2c5ec = self.var_ded207268b2c2c7d.origin;
            }
        }
        wait 1;
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3052
// Size: 0xb4
function function_a98eebbfaba2311e(weapon, position, activeweapon) {
    if (isagent(self)) {
        if (is_equal(position, "none") && !istrue(self.var_c3839981de5e0932)) {
            self.stowed_weapon = self.weapon;
            self.weapon = nullweapon();
            self.var_c3839981de5e0932 = 1;
            return;
        } else if (is_equal(position, "right") && istrue(self.var_c3839981de5e0932)) {
            self.weapon = self.stowed_weapon;
            self.var_c3839981de5e0932 = undefined;
            return;
        }
    }
    namespace_223959d3e5206cfb::placeweaponon(weapon, position, activeweapon);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x310e
// Size: 0x12e
function private function_85db367a92c42f23() {
    self endon("death");
    self endon("follower_stop_follow");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    player = self.var_ded207268b2c2c7d;
    if (isalive(player)) {
        player endon("endon_enter_walkable_vehicle");
        player endon("death_or_disconnect");
    }
    if (isdefined(player.var_cac91eb6521df629) && isdefined(player.var_cac91eb6521df629.var_751df20fceaee5)) {
        player.var_cac91eb6521df629.var_751df20fceaee5 waittill("exfil_complete_timeout");
        var_576f57af0204c38c = player.var_cac91eb6521df629;
        if (isdefined(var_576f57af0204c38c)) {
            forward_angles = anglestoforward(var_576f57af0204c38c.angles);
            var_fddd053c4a7fdd39 = invertangles(forward_angles);
            teleport_origin = var_fddd053c4a7fdd39 * 1200 + var_576f57af0204c38c.origin;
            function_d6e4c5c74c55fe0(teleport_origin);
            function_a55b3d6929d24cf7(self.origin, 2);
            player waittill_notify_or_timeout("exfil_fully_completed", 20);
            if (isalive(self)) {
                function_383eed2b2dd31df3();
                function_9f44d0edaa30d584();
            }
        }
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3244
// Size: 0xb3
function private function_9aa3008e7fbe849b() {
    self endon("death");
    self endon("follower_stop_follow");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    while (true) {
        if (isdefined(self.var_ded207268b2c2c7d) && isplayer(self.var_ded207268b2c2c7d)) {
            msg = self.var_ded207268b2c2c7d waittill_any_return_no_endon_death_4("death", "disconnect", "remove_from_alive_count", "br_pass_squad_leader");
            self.var_ded207268b2c2c7d = function_d8135cbde5f2da03();
            if (isdefined(self.var_ded207268b2c2c7d) && isplayer(self.var_ded207268b2c2c7d)) {
                self function_85e7c2baf116abf8(self.var_ded207268b2c2c7d);
            }
        }
        waitframe();
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x32ff
// Size: 0x2
function private function_a7e1a4da25f229fb() {
    
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3309
// Size: 0x87b
function private function_e5a3f2c29fdaae31(var_edd3b3116f7af2a1) {
    if (!isdefined(var_edd3b3116f7af2a1)) {
        var_edd3b3116f7af2a1 = 0;
    }
    var_2dddc7551413a2f4 = self.var_ded207268b2c2c7d.origin;
    var_6f297cc46daab003 = [];
    var_50490404815fe72c = undefined;
    var_783962ed4d483dab = [];
    nearby_zombies = [];
    var_28eaecce814122cf = 0;
    if (level.var_71fd23ea9c43067e.size > 0) {
        var_6f297cc46daab003 = function_b9c091ea4a8178b8(var_2dddc7551413a2f4);
        var_3623418c36a696c1 = undefined;
        if (var_6f297cc46daab003.size > 0) {
            var_d568e723cd967a6e = sortbydistance(var_6f297cc46daab003, var_2dddc7551413a2f4);
            var_3623418c36a696c1 = random(var_6f297cc46daab003);
            var_50490404815fe72c = var_3623418c36a696c1.origin;
            var_7202e9cb93e139d8 = isdefined(var_3623418c36a696c1.angles) ? var_3623418c36a696c1.angles : self.angles;
            /#
                if (getdvarint(@"hash_d7bebf9f14461660", 0) > 0) {
                    debugaxis(var_50490404815fe72c, var_7202e9cb93e139d8, undefined, undefined, undefined, 100);
                }
            #/
            return [var_50490404815fe72c, var_7202e9cb93e139d8];
        }
    }
    safeorigin = getclosestpointonnavmesh(var_2dddc7551413a2f4, self);
    if (!isdefined(safeorigin)) {
        return undefined;
    }
    var_50490404815fe72c = safeorigin;
    if (false) {
        if (!isdefined(self.var_3cdcc135bfd71914) || isdefined(self.var_3cdcc135bfd71914) && self.var_3cdcc135bfd71914 >= 20) {
            var_783962ed4d483dab = function_ed30bbb46a90106b();
        }
    }
    /#
        if (getdvarint(@"hash_d7bebf9f14461660", 0) == 2) {
            debug::debug_sphere(safeorigin, undefined, (0, 1, 0), 5);
        }
    #/
    if (distancesquared(self.var_ded207268b2c2c7d.origin, safeorigin) > 16384) {
        var_ae06d0024f2af165 = [safeorigin];
    } else {
        var_e792a521d6f038c9 = self.var_ded207268b2c2c7d getplayerangles();
        var_321aa8bca49e8d52 = anglestoforward(var_e792a521d6f038c9);
        var_c08e499e99a24d2d = anglestoright(var_e792a521d6f038c9);
        var_f385d12e310de178 = var_c08e499e99a24d2d * -1;
        var_1f6c51703330f52a = var_321aa8bca49e8d52 * -1;
        if (istrue(var_edd3b3116f7af2a1)) {
            var_ae06d0024f2af165 = [safeorigin + var_321aa8bca49e8d52 * 196];
        } else if (var_28eaecce814122cf) {
            var_ae06d0024f2af165 = [safeorigin + (0.25 * var_f385d12e310de178 + var_321aa8bca49e8d52) * randomfloatrange(0.75, 1) * 196, safeorigin + (0.25 * var_f385d12e310de178 + var_321aa8bca49e8d52) * randomfloatrange(1.25, 1.75) * 196, safeorigin + var_321aa8bca49e8d52 * randomfloatrange(1.5, 2.5) * 196, safeorigin + (0.25 * var_c08e499e99a24d2d + var_321aa8bca49e8d52) * randomfloatrange(0.75, 1) * 196, safeorigin + (0.25 * var_c08e499e99a24d2d + var_321aa8bca49e8d52) * randomfloatrange(1.25, 1.75) * 196];
        } else {
            var_ae06d0024f2af165 = [safeorigin + (0.5 * var_f385d12e310de178 + var_321aa8bca49e8d52) * randomfloatrange(0.75, 1) * 196, safeorigin + (0.5 * var_f385d12e310de178 + var_321aa8bca49e8d52) * randomfloatrange(0.25, 0.75) * 196, safeorigin + var_321aa8bca49e8d52 * randomfloatrange(1.5, 2.5) * 196, safeorigin + (0.5 * var_c08e499e99a24d2d + var_321aa8bca49e8d52) * randomfloatrange(0.75, 1) * 196, safeorigin + (0.5 * var_c08e499e99a24d2d + var_321aa8bca49e8d52) * randomfloatrange(0.25, 0.75) * 196, safeorigin + var_f385d12e310de178 * randomfloatrange(0.25, 1) * 196, safeorigin + var_c08e499e99a24d2d * randomfloatrange(0.25, 1) * 196, safeorigin + (0.5 * var_f385d12e310de178 + var_1f6c51703330f52a) * randomfloatrange(0.75, 1) * 196, safeorigin + var_1f6c51703330f52a * randomfloatrange(0.25, 0.5) * 196, safeorigin + (0.5 * var_c08e499e99a24d2d + var_1f6c51703330f52a) * randomfloatrange(0.75, 1) * 196];
        }
    }
    foreach (loc in var_ae06d0024f2af165) {
        var_2d0d7fc92ca6c8e9 = getclosestpointonnavmesh(loc, self, undefined, 1);
        if (isdefined(var_2d0d7fc92ca6c8e9)) {
            clear = 1;
            valid = 1;
            trace = undefined;
            var_d1373acd42443e37 = getgroundposition(var_2d0d7fc92ca6c8e9, 18);
            foreach (follower in level.var_dd864fc4e733d2e3) {
                if (follower == self) {
                    continue;
                }
                if (isdefined(follower.var_fe4676964217a04b) && distance2dsquared(follower.var_fe4676964217a04b, var_2d0d7fc92ca6c8e9) < squared(32)) {
                    valid = 0;
                    break;
                }
            }
            if (!valid) {
                continue;
            }
            if (isdefined(level.var_a48e67061c191a79)) {
                foreach (pad in level.var_a48e67061c191a79) {
                    if (isdefined(pad.origin)) {
                        dist = distance2dsquared(pad.origin, var_2d0d7fc92ca6c8e9);
                        var_daead71f4fe29e4f = 128;
                        if (isdefined(pad.radius) && pad.radius > var_daead71f4fe29e4f) {
                            var_daead71f4fe29e4f = pad.radius;
                        }
                        if (dist < squared(var_daead71f4fe29e4f)) {
                            valid = 0;
                            break;
                        }
                        if (isdefined(pad.struct) && ispointinvolume(var_2d0d7fc92ca6c8e9, pad.trigger)) {
                            valid = 0;
                            break;
                        }
                    }
                }
            }
            if (!valid) {
                continue;
            }
            if (level.var_d1f6a7b06a6a195c.size > 0) {
                foreach (vol in level.var_d1f6a7b06a6a195c) {
                    if (ispointinvolume(var_2d0d7fc92ca6c8e9, vol)) {
                        valid = 0;
                        break;
                    }
                }
            }
            if (!valid) {
                continue;
            }
            /#
                if (getdvarint(@"hash_d7bebf9f14461660", 0) == 2) {
                    trace = scripts\engine\trace::ai_trace(var_d1373acd42443e37, var_2d0d7fc92ca6c8e9 + (0, 0, 32), undefined, [self, self.var_ded207268b2c2c7d]);
                }
            #/
            clear = scripts\engine\trace::ai_trace_passed(var_d1373acd42443e37, var_2d0d7fc92ca6c8e9 + (0, 0, 32), undefined, [self, self.var_ded207268b2c2c7d]);
            if (istrue(clear)) {
                var_6f297cc46daab003 = array_add(var_6f297cc46daab003, var_d1373acd42443e37);
            }
            /#
                if (getdvarint(@"hash_d7bebf9f14461660", 0) == 2) {
                    color = istrue(clear) ? (0, 1, 0) : (1, 0, 0);
                    debug::debug_sphere(var_d1373acd42443e37, undefined, color, 5);
                    if (isdefined(trace)) {
                        level thread scripts\engine\trace::draw_trace(trace, color, undefined, 100);
                    }
                }
            #/
        }
    }
    if (0 && var_783962ed4d483dab.size > 0) {
        var_50490404815fe72c = random(var_783962ed4d483dab);
    } else if (var_6f297cc46daab003.size > 0) {
        var_50490404815fe72c = random(var_6f297cc46daab003);
    } else {
        /#
            if (getdvarint(@"hash_d7bebf9f14461660", 0) > 0) {
                iprintlnbold("<dev string:xd4>");
            }
        #/
        return [];
    }
    /#
        if (getdvarint(@"hash_d7bebf9f14461660", 0) > 0 && isdefined(var_50490404815fe72c)) {
            debugaxis(isai(var_50490404815fe72c) ? var_50490404815fe72c.origin : var_50490404815fe72c, self.angles, undefined, undefined, undefined, 100);
        }
    #/
    return [var_50490404815fe72c, self.angles];
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3b8d
// Size: 0x1a5
function private function_ed30bbb46a90106b() {
    var_783962ed4d483dab = [];
    nearby_zombies = getaiarrayinradius(self.var_ded207268b2c2c7d.origin, 196);
    foreach (zombie in nearby_zombies) {
        valid = 1;
        if (isdefined(zombie.team) && zombie.team == self.team) {
            continue;
        }
        if (!isalive(zombie)) {
            continue;
        }
        if (zombie namespace_49a23839f1dcc76a::is_traversing()) {
            continue;
        }
        if (isdefined(zombie.subclass) && zombie.subclass != "zombie_base" && zombie.subclass != "zombie_base_armored_light" && zombie.subclass != "zombie_base_armored_heavy") {
            continue;
        }
        foreach (follower in level.var_dd864fc4e733d2e3) {
            if (follower == self) {
                continue;
            }
            if (isdefined(follower.var_e94fca72a2789b21) && follower.var_e94fca72a2789b21 == zombie) {
                valid = 0;
            }
        }
        if (!valid) {
            continue;
        }
        var_783962ed4d483dab = array_add(var_783962ed4d483dab, zombie);
    }
    return var_783962ed4d483dab;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3d3b
// Size: 0x1b8
function private function_b9c091ea4a8178b8(var_2dddc7551413a2f4) {
    var_6f297cc46daab003 = [];
    foreach (var_b209c20302ddf249 in level.var_71fd23ea9c43067e) {
        valid = 0;
        if (isdefined(var_b209c20302ddf249.var_27f1962622d2c17f)) {
            foreach (vol in var_b209c20302ddf249.var_27f1962622d2c17f) {
                if (ispointinvolume(var_2dddc7551413a2f4 + (0, 0, 10), vol)) {
                    valid = 1;
                }
            }
        } else {
            var_e9582e298d5b23c6 = isdefined(var_b209c20302ddf249.dist_override) ? var_b209c20302ddf249.dist_override : 512;
            if (distancesquared(var_2dddc7551413a2f4, var_b209c20302ddf249.origin) <= squared(var_e9582e298d5b23c6)) {
                valid = 1;
            }
        }
        /#
            if (getdvarint(@"hash_d7bebf9f14461660", 0) > 0) {
                color = istrue(valid) ? (0, 1, 0) : (1, 0, 0);
                orientedbox(var_b209c20302ddf249.origin, (8, 8, 8), (0, 0, 0), color, undefined, 500);
            }
        #/
        if (istrue(valid)) {
            var_6f297cc46daab003 = function_6d6af8144a5131f1(var_6f297cc46daab003, var_b209c20302ddf249);
        }
    }
    return var_6f297cc46daab003;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3efc
// Size: 0x71
function private function_e9658b73a53783aa(var_edd3b3116f7af2a1) {
    level endon("game_ended");
    self endon("death");
    var_bffcbe6249872714 = function_e5a3f2c29fdaae31(var_edd3b3116f7af2a1);
    var_5bc0a5433f38e831 = var_bffcbe6249872714[1];
    var_79645149e1c263d0 = var_bffcbe6249872714[0];
    if (isdefined(var_79645149e1c263d0)) {
        function_a2e85f09c67b4877(var_79645149e1c263d0, var_5bc0a5433f38e831);
        self notify("follower_teleport_finish", 1);
        return 1;
    }
    self notify("follower_teleport_finish", 0);
    return 0;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3f75
// Size: 0x1b1
function private function_a2e85f09c67b4877(dest, var_276fea0dbb461536) {
    level endon("game_ended");
    self endon("death");
    var_42a5a182b3e44ccb = isai(dest);
    var_23417fe4beda588f = undefined;
    var_6f33443052eec825 = 0;
    if (var_42a5a182b3e44ccb) {
        var_23417fe4beda588f = dest;
        dest = var_23417fe4beda588f.origin;
    }
    while (istrue(self.teleporting)) {
        waitframe();
    }
    if (istrue(self.var_9c7b54b172c87654) && isdefined(self.animsetname) && self.animsetname != "agent_mp_jup_ob_ava") {
        self setoverridearchetype("animscript", "agent_mp_jup_ob_ava", 1);
    }
    self.teleporting = 1;
    self.var_fe4676964217a04b = dest;
    self.var_e94fca72a2789b21 = var_23417fe4beda588f;
    var_de962f804d5fc980 = 0.3;
    thread function_57fad116d05589fc(self.origin, "jup_ob_s5_teleport_out", 0);
    wait self.var_a0e0a070ddf27453 - var_de962f804d5fc980;
    function_155681a503af0b02();
    wait var_de962f804d5fc980 - 0.1;
    function_5f191ad77b4c61a1(dest);
    wait 0.1;
    waitframe();
    waittillframeend();
    self forceteleport(dest, var_276fea0dbb461536, 9999999, 1);
    thread function_57fad116d05589fc(dest, "jup_ob_s5_teleport_in", 1, var_276fea0dbb461536);
    thread function_b989c788b85f3f90(var_23417fe4beda588f);
    wait self.var_9dc2e12ad70fc632;
    self notify("follower_teleported");
    self.var_6728c500721755da = 0;
    thread function_aee7cedae949e77f();
    if (var_42a5a182b3e44ccb) {
        self notify("follower_exchanged");
        self.var_3cdcc135bfd71914 = 0;
        thread function_abd547aa14fc81a5();
    }
    self notify("follower_player_reached");
    self.teleporting = 0;
    self.var_fe4676964217a04b = undefined;
    self.var_e94fca72a2789b21 = undefined;
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x412e
// Size: 0x142
function private function_57fad116d05589fc(dest, animstr, var_df7e93915748c217, var_276fea0dbb461536) {
    self endon("death");
    ent_flag_set("follower_teleporting");
    assertex(isalive(self), "<dev string:x10e>");
    if (!isalive(self)) {
        return;
    }
    statename = "animscripted";
    if (istrue(var_df7e93915748c217)) {
        self animmode("gravity");
    } else {
        self animmode("noclip");
    }
    if (isdefined(var_276fea0dbb461536)) {
        self orientmode("face angle", var_276fea0dbb461536[1]);
    } else {
        self orientmode("face angle", self.angles[1]);
    }
    scripts\asm\asm::asm_clearfacialanim();
    scripts\asm\asm_bb::bb_setanimscripted();
    self asmsetstate(self.asmname, statename);
    self scriptedanimstarted();
    animindex = scripts\asm\asm::asm_lookupanimfromalias(statename, animstr);
    xanim = scripts\asm\asm::asm_getxanim(statename, animindex);
    self dontinterpolate();
    self aisetanim(statename, animindex);
    animlength = getanimlength(xanim);
    wait animlength;
    scripts\asm\shared\mp\utility::animscripted_clear();
    self notify("spawn_end", "end");
    ent_flag_clear("follower_teleporting");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4278
// Size: 0x1bb
function private function_b989c788b85f3f90(var_23417fe4beda588f) {
    if (isdefined(var_23417fe4beda588f)) {
        var_23417fe4beda588f.marked_for_death = 1;
        var_23417fe4beda588f.nuked = 1;
        var_23417fe4beda588f.full_gib = 1;
        var_23417fe4beda588f.var_745cd904c1ec804c = 1;
        var_23417fe4beda588f kill();
    }
    nearby_zombies = getaiarrayinradius(self.origin, 128, "team_two_hundred");
    foreach (zombie in nearby_zombies) {
        if (isdefined(zombie.team) && zombie.team == self.team) {
            continue;
        }
        if (!isalive(zombie)) {
            continue;
        }
        if (is_equal(zombie, var_23417fe4beda588f)) {
            continue;
        }
        if (isdefined(zombie.subclass) && zombie.subclass != "zombie_base" && zombie.subclass != "zombie_base_armored_light" && zombie.subclass != "zombie_base_armored_heavy") {
            continue;
        }
        if (distancesquared(self.origin, zombie.origin) < 1024) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
            continue;
        }
        zombie namespace_db1ce2c035564e2c::function_e96aac065abbec4e(self.origin);
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x443b
// Size: 0x5a
function private function_aee7cedae949e77f() {
    level endon("game_ended");
    self endon("death");
    self endon("follower_teleported");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    while (true) {
        if (self.var_6728c500721755da >= getdvarint(@"hash_53a9e906fd90b075", 10)) {
            break;
        }
        self.var_6728c500721755da++;
        wait 1;
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x449d
// Size: 0x4c
function private function_abd547aa14fc81a5() {
    level endon("game_ended");
    self endon("death");
    self endon("follower_exchanged");
    self endon("new_behavior_set");
    self endon("new_behavior_requested");
    while (true) {
        if (self.var_3cdcc135bfd71914 >= 20) {
            break;
        }
        self.var_3cdcc135bfd71914++;
        wait 1;
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44f1
// Size: 0x68
function function_5f191ad77b4c61a1(destination, var_5d15ca124b72cd78) {
    if (!isdefined(destination)) {
        destination = self.origin + (0, 0, 20);
    } else if (!istrue(var_5d15ca124b72cd78)) {
        destination += (0, 0, 20);
    }
    playfx(getfx("ava_teleport_in"), destination);
    playsoundatpos(destination, "evt_ob_story_jansen_teleport_in");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4561
// Size: 0x7f
function function_155681a503af0b02(var_60e0cc4534c73607) {
    var_90416d079805b8a5 = anglestoforward(self.angles);
    var_9c88b027175facbd = -1 * var_90416d079805b8a5;
    fx_pos = self.origin + (0, 0, 56) + var_9c88b027175facbd * 32;
    if (isdefined(var_60e0cc4534c73607)) {
        fx_pos = var_60e0cc4534c73607;
    }
    playfx(getfx("ava_teleport_out"), fx_pos);
    playsoundatpos(fx_pos, "evt_ob_story_jansen_teleport_out");
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x45e8
// Size: 0x106
function private function_5ce519fe3007b95a(var_c267e11700c27e3b, var_8e3702e01a95fcfb) {
    if (!isdefined(var_c267e11700c27e3b)) {
        var_c267e11700c27e3b = 1;
    }
    if (!isdefined(var_8e3702e01a95fcfb)) {
        var_8e3702e01a95fcfb = 1;
    }
    possibleplayers = [];
    foreach (player in level.players) {
        if (var_c267e11700c27e3b && (!isalive(player) || isdefined(player.fauxdead) || istrue(player.delayedspawnedplayernotify))) {
            continue;
        }
        if (var_8e3702e01a95fcfb && istrue(player.inlaststand)) {
            continue;
        }
        possibleplayers[possibleplayers.size] = player;
    }
    testorigin = self.origin;
    if (possibleplayers.size == 0) {
        return undefined;
    }
    if (possibleplayers.size == 1) {
        return possibleplayers[0];
    }
    return sortbydistance(possibleplayers, testorigin)[0];
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x46f6
// Size: 0x83
function rift_run_animscripted_oneshot(animstring, org, var_8c94765ca587f86c) {
    level endon("game_ended");
    self notify("rift_run_animscripted_oneshot");
    self endon("rift_run_animscripted_oneshot");
    self endon("death");
    self endon("rift_run_animscripted_loop_end");
    if (isdefined(org)) {
        anim_node = spawnstruct();
        anim_node.origin = org;
        anim_node.angles = var_8c94765ca587f86c;
        animscripted_single_relative(animstring, anim_node);
        return;
    }
    animscripted_single(animstring);
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4781
// Size: 0x8c
function rift_run_animscripted_loop(animstring, org, var_8c94765ca587f86c) {
    level endon("game_ended");
    self notify("rift_run_animscripted_loop");
    self endon("rift_run_animscripted_loop");
    self endon("death");
    self endon("rift_run_animscripted_loop_end");
    if (isdefined(org)) {
        anim_node = spawnstruct();
        anim_node.origin = org;
        anim_node.angles = var_8c94765ca587f86c;
        animscripted_loop_relative(animstring, anim_node);
    } else {
        animscripted_loop(animstring);
    }
    while (true) {
        waitframe();
    }
}

// Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4815
// Size: 0x29
function rift_run_animscripted_loop_end(animstring) {
    level endon("game_ended");
    self endon("death");
    self notify("rift_run_animscripted_loop_end");
    animscripted_clear();
    waitframe();
}

/#

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4846
    // Size: 0x5
    function private function_b1eab7c7fda1fb57() {
        
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4853
    // Size: 0xed
    function private function_4e6a1f223393c32e() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x14a>");
        scripts\common\devgui::function_b2159fbbd7ac094e("<dev string:x16c>", @"hash_4d02ead68eeb1146");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x17c>", @"hash_d7bebf9f14461660");
        scripts\common\devgui::function_b2159fbbd7ac094e("<dev string:x18e>", @"hash_856e10cf5b2862d1");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x1a4>", "<dev string:x1c2>", &function_ac9dd578f628f3bb);
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x1dd>", "<dev string:x210>", &function_245a25d44896a0f3);
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x234>", @"hash_53a9e906fd90b075");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x249>", @"hash_16ea79a56a6a8d2b");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x258>", @"hash_78f245466a6f872a");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x26f>", @"hash_e20f21c6b6c6bbc0");
        scripts\common\devgui::function_a9a864379a098ad6("<dev string:x280>", "<dev string:x28d>", &function_627e72114f122f34);
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4948
    // Size: 0xcf
    function private function_627e72114f122f34() {
        if (isdefined(level.var_2ada333c838a2316)) {
            if (!isdefined(level.var_2ada333c838a2316.ignoreme)) {
                level.var_2ada333c838a2316.ignoreme = 1;
            } else {
                level.var_2ada333c838a2316.ignoreme = !level.var_2ada333c838a2316.ignoreme;
            }
        }
        if (isdefined(level.var_1da22412ed7ad03b)) {
            if (!isdefined(level.var_1da22412ed7ad03b.ignoreme)) {
                level.var_1da22412ed7ad03b.ignoreme = 1;
                return;
            }
            level.var_1da22412ed7ad03b.ignoreme = !level.var_1da22412ed7ad03b.ignoreme;
        }
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4a1f
    // Size: 0x80
    function private function_acff8fd2b816986e() {
        if (!isdefined(self.var_c13146701c692a16)) {
            return "<dev string:x2a2>";
        }
        if (self.var_c13146701c692a16 == 2) {
            return "<dev string:x2af>";
        }
        if (self.var_c13146701c692a16 == 3) {
            return "<dev string:x2bc>";
        }
        if (self.var_c13146701c692a16 == 0) {
            return "<dev string:x2d1>";
        }
        if (self.var_c13146701c692a16 == 1) {
            return "<dev string:x2de>";
        }
        return "<dev string:x2ea>";
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4aa7
    // Size: 0x265
    function private function_4e540622337b5900() {
        self endon("<dev string:x2fb>");
        var_26bda875884c2f7 = 0;
        var_b6af1e770549dacd = 0.25;
        var_695b693233fad445 = getdvarint(@"hash_53a9e906fd90b075", 10);
        while (true) {
            if (getdvarint(@"hash_4d02ead68eeb1146")) {
                print3d(self.origin + (0, 0, 96), "<dev string:x304>" + function_acff8fd2b816986e(), undefined, undefined, var_b6af1e770549dacd);
                print3d(self.origin + (0, 0, 92), "<dev string:x30f>" + (isdefined(self.var_6728c500721755da) ? var_695b693233fad445 - self.var_6728c500721755da : "<dev string:x322>"), undefined, undefined, var_b6af1e770549dacd);
                print3d(self.origin + (0, 0, 88), "<dev string:x329>" + (istrue(self.var_a0bbdca278732f45) ? "<dev string:x338>" : "<dev string:x340>"), undefined, undefined, var_b6af1e770549dacd);
                print3d(self.origin + (0, 0, 84), "<dev string:x349>" + (istrue(self isinscriptedstate()) ? "<dev string:x338>" : "<dev string:x340>"), undefined, undefined, var_b6af1e770549dacd);
                print3d(self.origin + (0, 0, 80), "<dev string:x35d>" + (istrue(self.ignoreall) ? "<dev string:x338>" : "<dev string:x340>"), istrue(self.ignoreall) ? (1, 0, 0) : (0, 1, 0), undefined, var_b6af1e770549dacd);
                print3d(self.origin + (0, 0, 76), "<dev string:x36d>" + (istrue(self.ignoreme) ? "<dev string:x338>" : "<dev string:x340>"), istrue(self.ignoreme) ? (1, 0, 0) : (0, 1, 0), undefined, var_b6af1e770549dacd);
            }
            if (getdvarint(@"hash_856e10cf5b2862d1") || getdvarint(@"hash_4d02ead68eeb1146")) {
                if (!var_26bda875884c2f7) {
                    self hudoutlineenable("<dev string:x37c>");
                    var_26bda875884c2f7 = 1;
                }
            } else if (var_26bda875884c2f7) {
                self hudoutlinedisable();
                var_26bda875884c2f7 = 0;
            }
            waitframe();
        }
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4d14
    // Size: 0x71
    function private function_ac9dd578f628f3bb() {
        if (isdefined(level.var_2ada333c838a2316) && !istrue(level.var_2ada333c838a2316.teleporting)) {
            level.var_2ada333c838a2316 thread function_a69c5fbb27c17133();
        }
        if (isdefined(level.var_1da22412ed7ad03b) && !istrue(level.var_1da22412ed7ad03b.teleporting)) {
            level.var_1da22412ed7ad03b thread function_a69c5fbb27c17133();
        }
    }

    // Namespace namespace_bc50cc28d0217818 / namespace_60bff5112336ce6
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4d8d
    // Size: 0x3d
    function private function_245a25d44896a0f3() {
        if (isdefined(level.var_2ada333c838a2316) && !istrue(level.var_2ada333c838a2316.teleporting)) {
            level.var_2ada333c838a2316 thread function_a69c5fbb27c17133(1);
        }
    }

#/
