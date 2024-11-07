#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\mp_agent_damage.gsc;
#using scripts\common\values.gsc;
#using script_5762ac2f22202ba2;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\debug.gsc;
#using script_3b78d23dad7ec5be;
#using scripts\common\devgui.gsc;
#using scripts\engine\math.gsc;

#namespace namespace_286a4af3c2345b36;

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x81f
// Size: 0x50
function main() {
    callback::add("player_connect", &function_c917ac9167d1aec0);
    level._effect["crystal_impact"] = loadfx("vfx/jup/ob/gameplay/riftrun/s5_5/launch_pads/vfx_red_crystal_impact.vfx");
    level._effect["zombie_explosion"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_obelisk_blast.vfx");
    level thread function_92b7e5b324465b68();
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x877
// Size: 0x2af
function function_92b7e5b324465b68(params) {
    flag_wait("create_script_initialized");
    setdvarifuninitialized(@"hash_cb729b2d50151b5a", 0);
    setdvarifuninitialized(@"hash_ef377c514d75b06f", 128);
    setdvarifuninitialized(@"hash_cf4dacccd7acb0f6", 64);
    setdvarifuninitialized(@"hash_163d35b2bfad5d11", 14);
    setdvarifuninitialized(@"hash_393af4a8a9128536", 850);
    setdvarifuninitialized(@"hash_b4e52282f217c0ae", 1000);
    setdvarifuninitialized(@"hash_9025e7af6f59575d", 1);
    if (getdvarint(@"hash_9025e7af6f59575d", 1)) {
        level.var_e75d27acd726fe9c = 1;
    } else {
        level.var_84956ead4b0ba962 = function_869ccb4e3451b8c6(["etype_ai", "etype_vehicle", "etype_turret", "etype_scriptmover"]);
    }
    setdvarifuninitialized(@"hash_a98666aab2a20f50", 1);
    setdvarifuninitialized(@"hash_8c6980cc1eec0687", 750);
    setdvarifuninitialized(@"hash_90a082c8af3ac59b", 1400);
    setdvarifuninitialized(@"hash_82e34749b3f546a4", 1);
    setdvarifuninitialized(@"hash_2e35fa4edb6c24ed", 0.15);
    setdvarifuninitialized(@"hash_2e12e44edb45acd3", 1);
    setdvarifuninitialized(@"hash_2770a0f3f75c755f", 1);
    setdvarifuninitialized(@"hash_ce56b1cbc245ce62", 3);
    setdvarifuninitialized(@"hash_d1b4357cefdb73fe", 3);
    setdvarifuninitialized(@"hash_de3a12b335032b2f", 1024);
    level.var_cdec40a0d6ec935f = gettime();
    /#
        setdevdvarifuninitialized(@"hash_be597103cc8aad5f", 0);
        setdevdvarifuninitialized(@"hash_1ea16fecf27895e6", 0);
        setdevdvarifuninitialized(@"hash_e6d0f35a459f1461", 0);
        level thread debug_init();
    #/
    flag_wait("scriptables_ready");
    var_e405301bcb385ef5 = getstructarray("launch_pad", "script_noteworthy");
    var_201462e035644875 = function_f159c10d5cf8f0b4("launch_pad", "script_noteworthy");
    var_a48e67061c191a79 = array_combine(var_e405301bcb385ef5, var_201462e035644875);
    var_762cb2950158b8be = getdvarint(@"hash_7661484c77058395", 0);
    foreach (pad in var_a48e67061c191a79) {
        level thread function_ffb92f39c6c65fa3(pad, var_762cb2950158b8be);
    }
    level.var_a48e67061c191a79 = var_a48e67061c191a79;
    scripts\engine\scriptable::scriptable_adddamagedcallback(&function_feb0aac1dbef2f07);
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb2e
// Size: 0x24
function function_c917ac9167d1aec0(params) {
    if (getdvarint(@"hash_9025e7af6f59575d")) {
        thread function_4d1c61defe847197();
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5a
// Size: 0x142
function function_4d1c61defe847197() {
    self endon("death");
    self endon("disconnect");
    self.var_aae3feeeecfdc77f = [];
    while (true) {
        var_cd7cb9a43134951c = [];
        if (self.sessionstate != "playing") {
            if (self.var_aae3feeeecfdc77f.size > 0) {
                self.var_aae3feeeecfdc77f = var_cd7cb9a43134951c;
            }
            waitframe();
            continue;
        }
        tracedist = self playerads() ? 7500 : 2500;
        tracedistsq = squared(tracedist);
        foreach (pad in level.var_a48e67061c191a79) {
            if (istrue(pad.enabled)) {
                continue;
            }
            if (!isdefined(pad.crystal)) {
                continue;
            }
            if (distancesquared(self.origin, pad.crystal.origin) > tracedistsq) {
                continue;
            }
            var_cd7cb9a43134951c = array_add(var_cd7cb9a43134951c, pad.crystal);
        }
        self.var_aae3feeeecfdc77f = var_cd7cb9a43134951c;
        waitframe();
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xca4
// Size: 0xb07
function function_ffb92f39c6c65fa3(pad, var_762cb2950158b8be) {
    pad.can_chain = 0;
    pad.require_activate = 0;
    pad.no_air_control_boost = 0;
    pad.var_b155ab098e0ee6d5 = 0;
    pad.destination = undefined;
    pad.var_e8efeb4fa13af0f9 = undefined;
    pad.var_d256331647493133 = undefined;
    pad.var_aeed84026a08bfc4 = undefined;
    pad.force_use_cs_crystal = 0;
    if (isdefined(pad.target)) {
        destinations = getstructarray(pad.target, "targetname");
        if (destinations.size == 0) {
            destinations = function_f159c10d5cf8f0b4(pad.target, "targetname");
        }
        if (destinations.size > 0) {
            pad.destination = destinations[0];
        }
    }
    if (isdefined(pad.targetname)) {
        var_1f24992830bc93d3 = getstructarray(pad.targetname, "target");
        foreach (str in var_1f24992830bc93d3) {
            if (is_equal(str.script_label, "crystal") || is_equal(str.script_noteworthy, "crystal")) {
                pad.var_e8efeb4fa13af0f9 = str;
                continue;
            }
            if (is_equal(str.script_noteworthy, "vfx_pos")) {
                pad.var_d256331647493133 = str;
            }
        }
    }
    if (isdefined(pad.script_parameters)) {
        toks = strtok(pad.script_parameters, ",");
        foreach (tok in toks) {
            if (tok == "can_chain") {
                pad.can_chain = 1;
                continue;
            }
            if (tok == "require_activate") {
                pad.require_activate = 1;
                continue;
            }
            if (tok == "no_air_control_boost" || tok == "no_air_control_booster") {
                pad.no_air_control_boost = 1;
                pad.no_sprint_boost = 1;
                continue;
            }
            if (tok == "no_sprint_boost") {
                pad.no_sprint_boost = 1;
                continue;
            }
            if (tok == "no_ai_fling") {
                pad.no_ai_fling = 1;
                continue;
            }
            if (tok == "no_ai_damage_on_player_fling") {
                pad.no_ai_damage_on_player_fling = 1;
                continue;
            }
            if (tok == "force_use_cs_crystal") {
                pad.force_use_cs_crystal = 1;
            }
        }
    }
    if (getdvarint(@"hash_1ea16fecf27895e6", 1)) {
        pad.require_activate = 0;
    }
    if (1 && !istrue(pad.force_use_cs_crystal)) {
        if (!isdefined(pad.var_e8efeb4fa13af0f9) || isdefined(pad.var_e8efeb4fa13af0f9) && false) {
            var_d969bd0640ce4701 = getentitylessscriptablearray("launch_pad_crystal_baked", "script_noteworthy", pad.origin, 120);
            var_2e8606cf196a2a01 = [];
            if (isdefined(var_d969bd0640ce4701) && var_d969bd0640ce4701.size > 0) {
                if (var_d969bd0640ce4701.size > 1) {
                    var_2c7301e750e84bca = sortbydistance(var_d969bd0640ce4701, pad.origin);
                    foreach (crystal in var_2c7301e750e84bca) {
                        var_6749af23947056dd = crystal.script_parameters;
                        if (!isdefined(var_6749af23947056dd) || is_equal(var_6749af23947056dd, "boss") || is_equal(var_6749af23947056dd, "rr") && istrue(var_762cb2950158b8be) || is_equal(var_6749af23947056dd, "story") && !istrue(var_762cb2950158b8be)) {
                            var_2e8606cf196a2a01 = array_add(var_2e8606cf196a2a01, crystal);
                        }
                    }
                } else {
                    var_2e8606cf196a2a01 = var_d969bd0640ce4701;
                }
                if (var_2e8606cf196a2a01.size > 1) {
                    assertmsg("<dev string:x1c>" + pad.origin);
                }
                pad.var_e8efeb4fa13af0f9 = var_2e8606cf196a2a01[0];
                pad.crystal = pad.var_e8efeb4fa13af0f9;
                pad.var_b155ab098e0ee6d5 = 1;
            }
        }
    }
    if (isstruct(pad)) {
        pad.radius = int(isdefined(pad.radius) ? pad.radius : getdvarint(@"hash_ef377c514d75b06f", 128));
        pad.height = int(isdefined(pad.height) ? pad.height : getdvarint(@"hash_cf4dacccd7acb0f6", 64));
        pad.trigger = spawn("noent_volume_trigger_radius", pad.origin, 0, pad.radius, pad.height);
    } else {
        pad.trigger = pad;
        if (isdefined(pad.struct) && isdefined(pad.struct.velocity)) {
            pad.velocity = int(pad.struct.velocity);
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.time)) {
            pad.time = float(pad.struct.time);
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.var_665ce2741465d5ea)) {
            pad.var_665ce2741465d5ea = float(pad.struct.var_665ce2741465d5ea);
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.var_8c3312a23a3b6bf4)) {
            pad.var_8c3312a23a3b6bf4 = float(pad.struct.var_8c3312a23a3b6bf4);
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.script_flag)) {
            pad.script_flag = pad.struct.script_flag;
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.script_flag_wait)) {
            pad.script_flag_wait = pad.struct.script_flag_wait;
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.script_flag_set)) {
            pad.script_flag_set = pad.struct.script_flag_set;
        }
        if (isdefined(pad.struct) && isdefined(pad.struct.script_flag_waitopen)) {
            pad.script_flag_waitopen = pad.struct.script_flag_waitopen;
        }
    }
    if (!isdefined(pad.destination)) {
        dest = spawnstruct();
        dest.origin = pad.origin + (0, 0, 1000);
        pad.destination = dest;
    }
    foreach (ent in getentarray("launch_pad_base", "targetname")) {
        ent setmodel("red::jup_gate_crystal_jump_pad_base_01_gameplay_notsolid_limbo_mode");
    }
    var_1883a3edc5b15f80 = getentitylessscriptablearray("launch_pad_base", "targetname", pad.origin, 300);
    if (isdefined(var_1883a3edc5b15f80) && var_1883a3edc5b15f80.size > 0) {
        pad.var_8f5934865c417974 = var_1883a3edc5b15f80.size == 1 ? var_1883a3edc5b15f80[0] : getclosest(pad.origin, var_1883a3edc5b15f80);
        start_state = istrue(pad.require_activate) ? "inactive" : "active";
        pad.var_8f5934865c417974 setscriptablepartstate("body", start_state);
        if (isdefined(pad.var_8f5934865c417974.target)) {
            vfx_pos = getstruct(pad.var_8f5934865c417974.target, "targetname");
            if (is_equal(vfx_pos.script_noteworthy, "vfx_pos")) {
                pad.var_d256331647493133 = vfx_pos;
            }
        }
    }
    var_23396a15c68d0c7a = isdefined(pad.var_d256331647493133) && isdefined(pad.var_d256331647493133.origin) ? pad.var_d256331647493133.origin : pad.origin;
    var_ce5e44158927d56c = isdefined(pad.var_d256331647493133) && isdefined(pad.var_d256331647493133.angles) ? pad.var_d256331647493133.angles : pad.angles;
    if (!isdefined(var_ce5e44158927d56c)) {
        var_ce5e44158927d56c = (0, 0, 0);
    }
    pad.var_ac5a476d3b686b35 = spawnscriptable("jup_zm_launch_pad_vfx", var_23396a15c68d0c7a, var_ce5e44158927d56c);
    pad.var_ac5a476d3b686b35 setscriptablepartstate("pad", "off");
    if (isdefined(pad.var_e8efeb4fa13af0f9)) {
        level thread function_7071d8c4fc9f0c3e(pad);
    }
    pad.enabled = !pad.require_activate;
    pad function_c7dfae8ed27c166();
    level thread function_7a4c5fa476b8c295(pad);
    /#
        level thread function_d0c3315a161351be(pad);
    #/
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17b3
// Size: 0x21c
function private function_7a4c5fa476b8c295(pad) {
    pad endon("death");
    if (isdefined(pad.script_flag_wait)) {
        flag_wait(pad.script_flag_wait);
    }
    if (isdefined(pad.script_flag)) {
        flag_wait(pad.script_flag);
    }
    if (isdefined(pad.script_flag_waitopen)) {
        flag_waitopen(pad.script_flag_waitopen);
    }
    while (true) {
        pad.trigger waittill("trigger", ent);
        if (!isplayer(ent) && !isagent(ent)) {
            continue;
        }
        if (!istrue(pad.enabled)) {
            continue;
        }
        if (isplayer(ent)) {
            if (!scripts\mp\utility\player::function_ad443bbcdcf37b85(ent)) {
                continue;
            }
            if (!ent function_bef665ddd5cdfb93(pad)) {
                continue;
            }
            ent thread function_851c837c906cfd56(pad);
            if (isdefined(pad.script_flag_set) && !flag(pad.script_flag_set)) {
                flag_set(pad.script_flag_set);
            }
            continue;
        }
        if (istrue(pad.no_ai_fling)) {
            continue;
        }
        if (isdefined(ent.team) && ent.team != "team_two_hundred") {
            continue;
        }
        if (!isalive(ent) || istrue(ent.marked_for_death)) {
            continue;
        }
        if (isdefined(ent.subclass) && ent.subclass != "zombie_base" && ent.subclass != "zombie_base_armored_light") {
            continue;
        }
        if (!isdefined(ent.enemy)) {
            continue;
        }
        cooldown_time = getdvarfloat(@"hash_d1b4357cefdb73fe", 3) * 1000;
        if (gettime() - level.var_cdec40a0d6ec935f <= cooldown_time) {
            continue;
        }
        if (!function_c1e510e4c0f48890(ent)) {
            continue;
        }
        level thread function_46370600079f45f1(pad, ent);
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d7
// Size: 0x9e
function function_c1e510e4c0f48890(ent) {
    var_6374b1da251db470 = getdvarfloat(@"hash_de3a12b335032b2f", 1024);
    var_6374b1da251db470 = squared(var_6374b1da251db470);
    foreach (player in level.players) {
        if (distancesquared(player.origin, ent.origin) <= var_6374b1da251db470) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7e
// Size: 0x4d
function function_b100b9f08fe3c844() {
    if (!isdefined(self.crystal)) {
        return;
    }
    if (istrue(self.crystal.destroyed)) {
        return;
    }
    function_fdd909210aed2c21(self);
    self.crystal.health = 0;
    level notify("crystal_shattered");
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad3
// Size: 0x30
function function_28eb14a92896c8e7() {
    if (!isdefined(self.crystal)) {
        return;
    }
    if (!istrue(self.crystal.destroyed)) {
        return;
    }
    function_e28c755fe898008(self);
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0b
// Size: 0x1e
function function_d1b703c9ebf2b990(var_6273bae8074b4bf) {
    self.falldamageprotection = ter_op(var_6273bae8074b4bf, 1, undefined);
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1b31
// Size: 0x2
function private function_f36bcdcbdb462548() {
    
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3b
// Size: 0x31f
function function_7071d8c4fc9f0c3e(pad) {
    if (!isdefined(pad)) {
        return;
    }
    require_activate = pad.require_activate;
    if (1 && istrue(pad.var_b155ab098e0ee6d5) && !istrue(pad.force_use_cs_crystal)) {
    } else if (getdvarint(@"hash_cb729b2d50151b5a", 1)) {
        pad.crystal = spawn("script_model", pad.var_e8efeb4fa13af0f9.origin);
        if (require_activate) {
            pad.crystal setmodel("jup_gate_crystal_jump_pad_crystal_01_gameplay_ent");
        } else {
            pad.crystal setmodel("jup_gate_crystal_jump_pad_crystal_01_broken_gp_ent");
        }
        pad.crystal.angles = pad.var_e8efeb4fa13af0f9.angles;
        pad.crystal.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5356baae9d04fe17");
        pad.crystal.var_534e788bc498be9f = getscriptbundle(%"hash_7dd4801342ba19c4");
        pad.crystal.var_1e0eb63ecb3f1e2 = 1;
        pad.crystal.var_4919d15787f01154 = 1;
        health = getdvarint(@"hash_b4e52282f217c0ae");
        pad.crystal.fake_health = health;
        pad.crystal.max_fake_health = health;
        pad.crystal.health = health;
    } else {
        pad.crystal = spawnscriptable("jup_zm_launch_pad_crystal_limbo", pad.var_e8efeb4fa13af0f9.origin, pad.var_e8efeb4fa13af0f9.angles);
        wait 5;
    }
    pad.crystal.objname = pad.script_noteworthy;
    pad.crystal.struct = pad;
    if (require_activate) {
        pad.crystal setscriptablepartstate("body", "imbued");
        if (isent(pad.crystal)) {
            pad.crystal setcandamage(1);
        } else {
            function_ed60b416bc63b926(pad);
        }
    } else {
        function_fdd909210aed2c21(pad, 1);
    }
    if (isdefined(pad.script_flag_wait)) {
        pad.crystal.script_flag = pad.script_flag_wait;
    } else if (isdefined(pad.script_flag)) {
        pad.crystal.script_flag = pad.script_flag;
    }
    pad.crystal.vulnerable = require_activate;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e62
// Size: 0x274
function function_ed60b416bc63b926(pad) {
    health = getdvarint(@"hash_b4e52282f217c0ae");
    pad.crystal.health = health;
    if (getdvarint(@"hash_9025e7af6f59575d")) {
        pad.crystal.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5356baae9d04fe17");
        pad.crystal.var_534e788bc498be9f = getscriptbundle(%"hash_7dd4801342ba19c4");
        pad.crystal.var_1e0eb63ecb3f1e2 = 1;
        pad.crystal.var_4919d15787f01154 = 1;
        pad.crystal.fake_health = health;
        pad.crystal.max_fake_health = health;
        return;
    }
    pad.crystal.invis = spawn("script_model", pad.crystal.origin);
    pad.crystal.invis setmodel("jup_gate_crystal_jump_pad_crystal_01_gameplay_invis");
    pad.crystal.invis.angles = pad.crystal.angles;
    pad.crystal.invis.aitypeid = function_2336488258354fbc(#"aitype", %"hash_5356baae9d04fe17");
    pad.crystal.invis.var_534e788bc498be9f = getscriptbundle(%"hash_7dd4801342ba19c4");
    pad.crystal.invis.var_1e0eb63ecb3f1e2 = 1;
    pad.crystal.invis.var_4919d15787f01154 = 1;
    pad.crystal.invis.fake_health = health;
    pad.crystal.invis.max_fake_health = health;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20de
// Size: 0x1a
function function_83571c0607011124() {
    return isent(self) || getdvarint(@"hash_9025e7af6f59575d");
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x2101
// Size: 0x378
function function_feb0aac1dbef2f07(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!is_equal(instance.type, "jup_zm_launch_pad_crystal_limbo") && !is_equal(instance.type, "jup_zm_launch_pad_crystal_merged")) {
        return;
    }
    if (isdefined(instance.entity)) {
        crystal = instance.entity;
    } else {
        crystal = instance;
    }
    if (crystal function_83571c0607011124()) {
        if (isdefined(crystal.fake_health) && crystal.health != crystal.fake_health) {
            crystal.health = int(crystal.fake_health);
        }
    }
    if (istrue(crystal.vulnerable) && !istrue(crystal.destroyed)) {
        max_health = getdvarint(@"hash_b4e52282f217c0ae");
        if (weapon::iswonderweapon(objweapon)) {
            if (objweapon.basename == "jup_la_plasmagun_mp" || objweapon.basename == "jup_la_humangun_mp") {
                idamage = max_health;
            } else if (is_equal(crystal.var_f3e89f9924fb5b0d, gettime())) {
                idamage = 0;
            } else {
                idamage = int(max_health / 3) + 1;
            }
        }
        if (is_equal(smeansofdeath, "MOD_MELEE")) {
            idamage = int(max_health / 3) + 1;
        }
        if (isdefined(crystal.health)) {
            crystal.health -= idamage;
            if (isplayer(eattacker)) {
                instance.var_f49149402765ecae = function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
                if (mp_agent_damage::function_87c3b43d00319847()) {
                    mp_agent_damage::function_c54b2cc2e762c201(eattacker, crystal.eidentifier, "none", smeansofdeath, objweapon, int(idamage), undefined, 0, undefined, 0, 0);
                }
                eattacker damagefeedback::updatehitmarker("standard", crystal.health <= 0, 0, 0, undefined);
                playfx(level._effect["crystal_impact"], shitloc, vdir);
            }
            if (crystal function_83571c0607011124()) {
                crystal.fake_health = int(max(0, crystal.health));
            }
            if (crystal.health <= 0) {
                thread function_5b8e527be2dda1e8(crystal.origin, 256);
                thread function_fdd909210aed2c21(crystal.struct);
                if (crystal function_83571c0607011124()) {
                    crystal.var_1e0eb63ecb3f1e2 = 0;
                    crystal.var_15d70cf838211daf = 1;
                }
                level notify("crystal_shattered");
                return;
            }
            if (crystal function_83571c0607011124()) {
                crystal.fake_health = int(max(0, crystal.health));
            } else {
                crystal.invis.fake_health = crystal.health;
            }
            crystal.var_f3e89f9924fb5b0d = gettime();
        }
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2481
// Size: 0x15d
function function_e28c755fe898008(pad) {
    if (isent(pad.crystal)) {
        pad.crystal setmodel("jup_gate_crystal_jump_pad_crystal_01_gameplay_ent");
        pad.crystal setcandamage(1);
        pad.crystal.var_1e0eb63ecb3f1e2 = 1;
    } else if (getdvarint(@"hash_9025e7af6f59575d")) {
        pad.crystal.var_1e0eb63ecb3f1e2 = 1;
    }
    pad.crystal setscriptablepartstate("body", "imbued");
    pad.crystal setscriptablepartstate("health", "damage_detect");
    if (isdefined(pad.var_ac5a476d3b686b35)) {
        pad.var_ac5a476d3b686b35 setscriptablepartstate("pad", "off");
    }
    if (!isdefined(pad.crystal.invis) && !isent(pad.crystal)) {
        function_ed60b416bc63b926(pad);
    }
    pad.crystal.destroyed = 0;
    pad.crystal.vulnerable = 1;
    pad.enabled = 0;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25e6
// Size: 0x1ec
function function_fdd909210aed2c21(pad, var_30260849d77ff5e6) {
    pad.crystal.destroyed = 1;
    pad.crystal.vulnerable = 0;
    if (pad.crystal function_83571c0607011124()) {
        pad.crystal.var_1e0eb63ecb3f1e2 = 0;
        if (!istrue(var_30260849d77ff5e6) && !getdvarint(@"hash_9025e7af6f59575d")) {
            waittillframeend();
            pad.crystal setmodel("jup_gate_crystal_jump_pad_crystal_01_broken_gp_ent");
            pad.crystal setcandamage(0);
        }
    }
    pad.crystal setscriptablepartstate("body", "destroyed");
    if (!isent(pad.crystal)) {
        pad.crystal setscriptablepartstate("health", "ignore_damage");
    }
    earthquake(0.4, 1, pad.crystal.origin, 384);
    if (isdefined(pad.var_ac5a476d3b686b35)) {
        pad.var_ac5a476d3b686b35 setscriptablepartstate("pad", "on");
    }
    pad.enabled = 1;
    if (!isent(pad.crystal) && isdefined(pad.crystal.invis)) {
        pad.crystal.invis.var_1e0eb63ecb3f1e2 = 0;
        waitframe();
        pad.crystal.invis delete();
    }
    if (isdefined(pad.var_8f5934865c417974)) {
        pad.var_8f5934865c417974 setscriptablepartstate("body", "active");
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x27da
// Size: 0xbd
function private function_5b8e527be2dda1e8(location, radius) {
    level endon("game_ended");
    waitframe();
    explosionzombies = getaiarrayinradius(location, radius, "team_two_hundred");
    foreach (zombie in explosionzombies) {
        if (isalive(zombie)) {
            zombie.marked_for_death = 1;
            zombie.nuked = 1;
            zombie.full_gib = 1;
            zombie.var_745cd904c1ec804c = 1;
            zombie kill();
        }
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x289f
// Size: 0x2
function private function_db1cce22f95a04fa() {
    
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28a9
// Size: 0x20f
function function_bef665ddd5cdfb93(pad) {
    var_c2f6d3d2a27931c8 = 0;
    if (self function_9cc921a57ff4deb5()) {
        return false;
    }
    if (self isonladder()) {
        return false;
    }
    if (self ishanging()) {
        return false;
    }
    if (self isswimming()) {
        return false;
    }
    if (self function_c36cfe1c6acaef46()) {
        return false;
    }
    if (self isinfreefall()) {
        return false;
    }
    if (scripts\mp\utility\killstreak::isjuggernaut()) {
        return false;
    }
    if (self isparachuting()) {
        if (!isdefined(self.var_7cae9150f1ef36d7) || isdefined(self.var_7cae9150f1ef36d7) && self.var_7cae9150f1ef36d7 != pad) {
            self.var_7cae9150f1ef36d7 = pad;
            thread function_f9e7516d6af85d6f(pad);
        }
        return false;
    }
    if (is_equal(self.var_7cae9150f1ef36d7, pad)) {
        return false;
    }
    if (!self isonground() && !istrue(pad.can_chain)) {
        return false;
    }
    if (self isinexecutionattack() || self isinexecutionvictim()) {
        return false;
    }
    if (self ismantling()) {
        return false;
    }
    if (self issprintsliding()) {
        var_c2f6d3d2a27931c8 = 1;
    }
    if (!scripts\mp\utility\player::function_ad443bbcdcf37b85(self)) {
        return false;
    }
    if (self getstance() == "prone") {
        return false;
    }
    if (isdefined(self.carryobject)) {
        return false;
    }
    if (scripts\cp_mp\utility\player_utility::function_b7869f6d9d4242e3(self)) {
        return false;
    }
    raystart = scripts\mp\utility\player::getstancetop();
    rayend = raystart + anglestoup(self.angles) * 100;
    radius = getdvarint(@"hash_163d35b2bfad5d11", 14);
    contents = scripts\engine\trace::create_default_contents(1);
    /#
        if (getdvarint(@"hash_be597103cc8aad5f") > 0) {
            level thread scripts\mp\utility\debug::drawsphere(raystart, radius, 10, (0, 1, 0));
            level thread scripts\mp\utility\debug::drawsphere(rayend, radius, 10, (0, 1, 0));
        }
    #/
    if (!scripts\engine\trace::sphere_trace_passed(raystart, rayend, radius, self, contents)) {
        return false;
    }
    if (var_c2f6d3d2a27931c8) {
        scripts\common\values::set("ob_launch_pad", "slide", 0);
    }
    return true;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac1
// Size: 0xa6
function function_f9e7516d6af85d6f(pad) {
    self notify("launch_pad_para_cooldown");
    self endon("launch_pad_para_cooldown");
    self endon("fling_start");
    pad endon("fling_start");
    while (self istouching(pad.trigger) && !self isonground()) {
        waitframe();
    }
    if (!is_equal(self.var_7cae9150f1ef36d7, pad)) {
        return;
    }
    if (!self istouching(pad.trigger)) {
        self.var_7cae9150f1ef36d7 = undefined;
        return;
    }
    wait 0.5;
    if (is_equal(self.var_7cae9150f1ef36d7, pad)) {
        self.var_7cae9150f1ef36d7 = undefined;
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6f
// Size: 0x140
function function_851c837c906cfd56(pad) {
    if (isdefined(self.var_52a7a56d7c5a9dc6) && !istrue(pad.can_chain)) {
        return;
    }
    self.var_52a7a56d7c5a9dc6 = undefined;
    self.var_52a7a56d7c5a9dc6 = spawnstruct();
    self notify("fling_start");
    pad notify("fling_start");
    self.var_7cae9150f1ef36d7 = undefined;
    if (!ent_flag("used_launch_pad")) {
        ent_flag_set("used_launch_pad");
    }
    function_d1b703c9ebf2b990(1);
    self setscriptablepartstate("launchPadVfx", "jump_begin_lrg", 0);
    self playsoundtoplayer("evt_ob_story_launch_pad_whoosh", self);
    self playsoundtoteam("evt_ob_story_launch_pad_whoosh_npc", self.team, self, self);
    scripts\common\values::set("ob_launch_pad", "allow_jump", 0);
    self skydive_setdeploymentstatus(0);
    thread function_66d7e0a40cf7fec1();
    if (!istrue(self.no_ai_damage_on_player_fling)) {
        thread function_aa2c4d38046f6c4d(pad);
    }
    function_83e096e15c7127a2(pad);
    if (getdvarint(@"hash_a98666aab2a20f50", 1) && !pad.no_air_control_boost) {
        thread function_65bbdbb02e708c66(pad);
    }
    function_9c5bc8ae78b3d9bc();
    self.var_52a7a56d7c5a9dc6 = undefined;
    function_d1b703c9ebf2b990(0);
    self notify("fling_end");
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb7
// Size: 0x2e
function function_66d7e0a40cf7fec1() {
    self notify("flinger_delay_base_jump_allow");
    self endon("flinger_delay_base_jump_allow");
    self endon("death_or_disconnect");
    self endon("fling_end");
    wait 0.25;
    self skydive_setdeploymentstatus(1);
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ced
// Size: 0x16d
function function_aa2c4d38046f6c4d(pad) {
    knockdown = 1;
    var_6d2fd18830e36fde = 150;
    if (knockdown) {
        if (isdefined(pad.radius)) {
            var_6d2fd18830e36fde = pad.radius + 150;
        }
    }
    nearby_zombies = getaiarrayinradius(pad.origin, var_6d2fd18830e36fde, "team_two_hundred");
    foreach (zombie in nearby_zombies) {
        if (isdefined(zombie.team) && zombie.team == self.team) {
            continue;
        }
        if (!isalive(zombie)) {
            continue;
        }
        if (istrue(zombie.marked_for_death)) {
            continue;
        }
        if (isdefined(zombie.subclass) && zombie.subclass != "zombie_base" && zombie.subclass != "zombie_base_armored_light" && zombie.subclass != "zombie_base_armored_heavy") {
            continue;
        }
        if (knockdown) {
            zombie namespace_db1ce2c035564e2c::function_e96aac065abbec4e(pad.origin);
            continue;
        }
        level thread function_46370600079f45f1(pad, zombie);
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e62
// Size: 0xcc
function function_83e096e15c7127a2(pad) {
    var_4cc439aaf334aa4d = isdefined(pad.time) ? pad.time : undefined;
    speed_override = isdefined(pad.velocity) ? pad.velocity : undefined;
    var_a78ffefa785281da = function_cac1f36baae94d71(self.origin, pad.destination.origin, var_4cc439aaf334aa4d, speed_override);
    self setvelocity((0, 0, 0));
    self setorigin(self.origin + (0, 0, 32), 1, 1);
    waittillframeend();
    self setvelocity(var_a78ffefa785281da);
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f36
// Size: 0x9e
function function_c7dfae8ed27c166() {
    pad = self;
    var_4cc439aaf334aa4d = isdefined(pad.time) ? pad.time : undefined;
    speed_override = isdefined(pad.velocity) ? pad.velocity : undefined;
    var_a78ffefa785281da = function_cac1f36baae94d71(pad.origin, pad.destination.origin, var_4cc439aaf334aa4d, speed_override);
    pad.var_dbeb9f1e480c9872 = var_a78ffefa785281da;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdc
// Size: 0xc9
function function_cac1f36baae94d71(start_pos, end_pos, var_b5cfefcc1a4db88, speed_override) {
    gravity = getdvarint(@"bg_gravity", 800) * -1;
    var_4fe0d6d913d802c0 = (0, 0, gravity);
    max_speed = getdvarfloat(@"hash_393af4a8a9128536", 850);
    var_1b7cec4cc41b92f9 = float(isdefined(speed_override) ? speed_override : max_speed);
    dist = distance(start_pos, end_pos);
    time = isdefined(var_b5cfefcc1a4db88) ? var_b5cfefcc1a4db88 : dist / var_1b7cec4cc41b92f9;
    var_a78ffefa785281da = trajectorycalculateinitialvelocity(start_pos, end_pos, var_4fe0d6d913d802c0, time);
    return var_a78ffefa785281da;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30ae
// Size: 0x2ba
function function_9c5bc8ae78b3d9bc() {
    self endon("death_or_disconnect");
    self endon("fling_end");
    level endon("game_ended");
    if (!isdefined(self.var_52a7a56d7c5a9dc6)) {
        return;
    }
    self.var_52a7a56d7c5a9dc6.airtime = 0;
    self.var_52a7a56d7c5a9dc6.var_95970a85747a82d9 = 1;
    self.var_52a7a56d7c5a9dc6.var_bed7e3bad8b86623 = gettime();
    var_bb822bf25ecdbd33 = 0;
    var_62601c1642480674 = 0;
    var_d74307128f89df80 = 0;
    var_ade6c63e715944b5 = 0;
    waitframe();
    while (isdefined(self.var_52a7a56d7c5a9dc6)) {
        if (self isonground() || self isparachuting()) {
            if (!var_62601c1642480674) {
                var_62601c1642480674 = 1;
                scripts\common\values::set("ob_launch_pad", "usability", 1);
                scripts\common\values::set("ob_launch_pad", "allow_jump", 1);
                scripts\common\values::set("ob_launch_pad", "slide", 1);
            }
            if (self isparachuting() && !istrue(var_ade6c63e715944b5)) {
                var_ade6c63e715944b5 = 1;
            }
            if (self isonground() && getdvarint(@"hash_2770a0f3f75c755f", 1) && !istrue(var_d74307128f89df80) && !istrue(var_ade6c63e715944b5) && self.var_52a7a56d7c5a9dc6.airtime >= 0.25) {
                thread function_434f4f316f6b5984();
                self.var_52a7a56d7c5a9dc6.airtime = 0;
                break;
            }
            if (self.var_52a7a56d7c5a9dc6.airtime > 0 && var_bb822bf25ecdbd33 >= 3) {
                self.var_52a7a56d7c5a9dc6.airtime = 0;
                break;
            } else if (var_bb822bf25ecdbd33 >= 10) {
                break;
            } else {
                var_bb822bf25ecdbd33++;
            }
            waitframe();
            continue;
        } else if (ent_flag_exist("teleporting") && ent_flag("teleporting") && !istrue(var_d74307128f89df80)) {
            var_d74307128f89df80 = 1;
        } else {
            var_bb822bf25ecdbd33 = 0;
            self.var_52a7a56d7c5a9dc6.airtime += level.framedurationseconds;
            if (var_62601c1642480674) {
                var_62601c1642480674 = 0;
                scripts\common\values::set("ob_launch_pad", "usability", 0);
                scripts\common\values::set("ob_launch_pad", "allow_jump", 0);
                scripts\common\values::set("ob_launch_pad", "slide", 0);
            }
        }
        waitframe();
    }
    scripts\common\values::set("ob_launch_pad", "usability", 1);
    scripts\common\values::set("ob_launch_pad", "allow_jump", 1);
    scripts\common\values::set("ob_launch_pad", "slide", 1);
    self skydive_setdeploymentstatus(1);
    self.var_52a7a56d7c5a9dc6.var_95970a85747a82d9 = 0;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3370
// Size: 0x267
function function_65bbdbb02e708c66(pad) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("fling_aircontrol_boost_start");
    self endon("fling_aircontrol_boost_start");
    self endon("fling_end");
    var_4992594dd7ee57b6 = float(isdefined(pad.var_665ce2741465d5ea) ? pad.var_665ce2741465d5ea : getdvarfloat(@"hash_8c6980cc1eec0687", 750));
    if (var_4992594dd7ee57b6 <= 0) {
        return;
    }
    maxspeed = float(isdefined(pad.var_8c3312a23a3b6bf4) ? pad.var_8c3312a23a3b6bf4 : getdvarfloat(@"hash_90a082c8af3ac59b", 1400));
    wait 0.2;
    var_7c92c8000eb99c1a = getdvarint(@"hash_82e34749b3f546a4", 1);
    var_2e0dc114c5798e3c = getdvarfloat(@"hash_2e12e44edb45acd3", 1);
    var_a57800dd9c005dd6 = getdvarfloat(@"hash_2e35fa4edb6c24ed", 0.15);
    while (isdefined(self.var_52a7a56d7c5a9dc6) && istrue(self.var_52a7a56d7c5a9dc6.var_95970a85747a82d9)) {
        movementinput = self getnormalizedmovement();
        if (length(movementinput) > 0) {
            worlddir = rotatevector((movementinput[0], -1 * movementinput[1], 0), self.angles);
            if (var_7c92c8000eb99c1a) {
                todest = pad.destination.origin - self.origin;
                var_cc9b94b9fe4f5772 = vectordot2(todest, worlddir, 1);
                var_67158aa7418fe400 = clamp(1 - abs(var_cc9b94b9fe4f5772), var_a57800dd9c005dd6, var_2e0dc114c5798e3c);
            } else {
                var_67158aa7418fe400 = 1;
            }
            velocity = self getvelocity();
            speed = length(velocity);
            var_3b61b63c7e59f697 = worlddir * var_4992594dd7ee57b6 * level.framedurationseconds;
            newvel = velocity + var_3b61b63c7e59f697 * var_67158aa7418fe400;
            newspeed = length(newvel);
            if (newspeed <= maxspeed) {
                self setvelocity(newvel);
            } else if (speed < maxspeed) {
                newvel = vectornormalize(newvel) * maxspeed;
                self setvelocity(newvel);
            }
        }
        waitframe();
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35df
// Size: 0x30
function function_434f4f316f6b5984() {
    self radiusdamage(self.origin, 256, function_52bbd31a09224e8e(), 50, self, "MOD_CRUSH", "high_jump_mp");
    thread function_79029536ae439038();
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3617
// Size: 0x7a
function function_52bbd31a09224e8e() {
    var_5712f5f091e168f4 = getdvarfloat(@"hash_ce56b1cbc245ce62", 3);
    if (!isdefined(self.var_52a7a56d7c5a9dc6) || !isdefined(self.var_52a7a56d7c5a9dc6.airtime) || var_5712f5f091e168f4 == 0) {
        return 50;
    }
    multfactor = clamp(self.var_52a7a56d7c5a9dc6.airtime / var_5712f5f091e168f4, 0, 1);
    return 500 * multfactor;
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x369a
// Size: 0x37
function function_79029536ae439038() {
    self endon("disconnect");
    level endon("game_ended");
    self setscriptablepartstate("launchPadVfx", "impact", 0);
    wait 1;
    self setscriptablepartstate("launchPadVfx", "off", 0);
}

/#

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x36d9
    // Size: 0x5
    function private function_b1eab7c7fda1fb57() {
        
    }

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x36e6
    // Size: 0x1f
    function private debug_init() {
        level waittill("<dev string:x4c>");
        level thread function_db5c75f2a84ff03d();
        level thread function_8791d428b8124c1d();
    }

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x370d
    // Size: 0x13e
    function private function_db5c75f2a84ff03d() {
        scripts\common\devgui::function_6e7290c8ee4f558b("<dev string:x5e>");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x71>", @"hash_be597103cc8aad5f");
        scripts\common\devgui::function_b2159fbbd7ac094e("<dev string:x7a>", @"hash_1ea16fecf27895e6");
        scripts\common\devgui::function_b2159fbbd7ac094e("<dev string:x92>", @"hash_e6d0f35a459f1461");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:xac>", @"hash_393af4a8a9128536");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:xbb>", @"hash_163d35b2bfad5d11");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:xd2>", @"hash_b4e52282f217c0ae");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:xe4>", @"hash_a98666aab2a20f50");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x107>", @"hash_8c6980cc1eec0687");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x129>", @"hash_90a082c8af3ac59b");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x14e>", @"hash_82e34749b3f546a4");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x183>", @"hash_2e35fa4edb6c24ed");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x1b4>", @"hash_2e12e44edb45acd3");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x1e5>", @"hash_2770a0f3f75c755f");
        scripts\common\devgui::function_df648211d66cd3dd("<dev string:x20a>", @"hash_ce56b1cbc245ce62");
        scripts\common\devgui::function_fe953f000498048f();
    }

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x3853
    // Size: 0x10f
    function private function_8791d428b8124c1d() {
        while (true) {
            if (getdvarint(@"hash_1ea16fecf27895e6")) {
                foreach (pad in level.var_a48e67061c191a79) {
                    if (!istrue(pad.enabled)) {
                        pad function_b100b9f08fe3c844();
                    }
                }
                setdvar(@"hash_1ea16fecf27895e6", 0);
            } else if (getdvarint(@"hash_e6d0f35a459f1461")) {
                foreach (pad in level.var_a48e67061c191a79) {
                    if (istrue(pad.enabled)) {
                        pad function_28eb14a92896c8e7();
                    }
                }
                setdvar(@"hash_e6d0f35a459f1461", 0);
            }
            waitframe();
        }
    }

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 1, eflags: 0x4
    // Checksum 0x0, Offset: 0x396a
    // Size: 0x1b8
    function private function_d0c3315a161351be(pad) {
        pad.trigger endon("<dev string:x23f>");
        while (true) {
            if (getdvarint(@"hash_be597103cc8aad5f") > 0) {
                if (getdvarint(@"hash_be597103cc8aad5f") == 2) {
                    if (isdefined(level.players[0]) && distancesquared(level.players[0].origin, pad.origin) > 9000000 && distancesquared(level.players[0].origin, pad.destination.origin) > 9000000) {
                        wait 1;
                        continue;
                    }
                }
                enabled = 1;
                if (isdefined(pad.script_flag_wait) && !flag(pad.script_flag_wait) || isdefined(pad.script_flag) && !flag(pad.script_flag) || isdefined(pad.script_flag_waitopen) && flag(pad.script_flag_waitopen) || !istrue(pad.enabled)) {
                    enabled = 0;
                }
                color = istrue(enabled) ? (0, 1, 0) : (1, 0, 0);
                function_61501f938d933fe1(pad.trigger, color, undefined, 30);
                if (isdefined(pad.destination)) {
                    function_a28332914799904(pad, enabled, 30);
                }
            }
            wait 1;
        }
    }

    // Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x3b2a
    // Size: 0x23a
    function private function_a28332914799904(pad, enabled, frames) {
        start_pos = pad.origin + (0, 0, 20);
        end_pos = pad.destination.origin;
        color = istrue(enabled) ? (0, 1, 0) : (1, 0, 0);
        var_49e536000014a0b4 = 0;
        sphere(end_pos, 4, color);
        if (var_49e536000014a0b4) {
            line(start_pos, end_pos, color);
            return;
        }
        gravity = getdvarint(@"bg_gravity", 800) * 1;
        var_1b7cec4cc41b92f9 = float(isdefined(pad.velocity) ? pad.velocity : getdvarfloat(@"hash_393af4a8a9128536", 850));
        dist = distance(start_pos, end_pos);
        time = dist / var_1b7cec4cc41b92f9;
        if (isdefined(pad.time)) {
            time = float(pad.time);
        }
        var_d610f95947234a0e = trajectorycomputedeltaheightattime(pad.var_dbeb9f1e480c9872[2], gravity, 0.5 * time);
        var_f3515361f8c7d96b = 32;
        time_interval = time / var_f3515361f8c7d96b;
        var_40000469741b7575 = start_pos;
        for (i = 1; i <= var_f3515361f8c7d96b; i++) {
            var_a2e3df99acffe2ec = i * time_interval / time;
            var_a20514fa823e804a = scripts\engine\math::get_point_on_parabola(start_pos, end_pos, abs(var_d610f95947234a0e), var_a2e3df99acffe2ec);
            if (getdvarint(@"hash_be597103cc8aad5f") == 2 && isdefined(pad.radius)) {
                cylinder(var_40000469741b7575, var_a20514fa823e804a, pad.radius, color, 0, frames);
            } else {
                line(var_40000469741b7575, var_a20514fa823e804a, color, 1, 0, frames);
            }
            var_40000469741b7575 = var_a20514fa823e804a;
        }
    }

#/

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3d6c
// Size: 0x2
function private function_4b22a2959a7c7bd3() {
    
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d76
// Size: 0x67
function function_e7464c84b604e286() {
    var_d0218d23e13f7b52 = randomintrange(0, 4);
    switch (var_d0218d23e13f7b52) {
    case 0:
        return "left_foot";
    case 1:
        return "right_foot";
    case 2:
        return "left_hand";
    case 3:
        return "right_hand";
    }
}

// Namespace namespace_286a4af3c2345b36 / namespace_156887a0efffbfeb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3de5
// Size: 0xa7
function function_46370600079f45f1(pad, ent) {
    var_6aae96c5753a676d = function_e7464c84b604e286();
    ent.no_powerups = 1;
    ent.marked_for_death = 1;
    ent kill();
    waitframe();
    corpse = ent getcorpseentity();
    if (isdefined(corpse)) {
        corpse startragdollfromimpact(var_6aae96c5753a676d, pad.var_dbeb9f1e480c9872 * 13000);
        level.var_cdec40a0d6ec935f = gettime();
        playsoundatpos(ent.origin + (0, 0, 40), "evt_ob_story_launch_pad_whoosh_npc");
    }
}

