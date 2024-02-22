// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\team_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\common\exploder.gsc;
#using script_7ab5b649fa408138;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using script_71d72171d22c1e1e;

#namespace emp;

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x721
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("emp"), &init);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x741
// Size: 0xf6
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("emp", &tryuseemp);
    }
    if (issharedfuncdefined("emp", "init")) {
        [[ getsharedfunc("emp", "init") ]]();
    }
    registersharedfunc("emp", "setEMP_Applied_Callback", &setemp_applied_callback);
    registersharedfunc("emp", "setEMP_Started_Callback", &setemp_started_callback);
    registersharedfunc("emp", "setEMP_Cleared_Callback", &setemp_cleared_callback);
    registersharedfunc("emp", "setEMP_Cleared_callback", &watch_checkforlauncherweapons);
    function_a4f524ed48312204();
    level.var_2c73f3bef5a3079 = [];
    level._effect["emp_shockwave"] = loadfx("vfx/iw8_mp/perk/vfx_emp_drone_exp_fieldupgrades.vfx");
    level._effect["predator_pod_break"] = loadfx("vfx/iw8_mp/killstreak/vfx_cruise_predator_explosion.vfx");
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e
// Size: 0x1c
function function_a4f524ed48312204() {
    game["dialog"]["emp_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x26
function tryuseemp(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("emp", self);
    }
    return tryuseempfromstruct(streakinfo);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88f
// Size: 0x1fe
function tryuseempfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.var_2c73f3bef5a3079[self.team])) {
        if (level.var_2c73f3bef5a3079[self.team] > 0) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/FRIENDLY_EMP_ACTIVE");
            }
            return 0;
        }
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_phone_mp"));
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    if (isplayer(self)) {
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
            var_52a5be2e2f91d710 = 2.5;
        }
        thread playkillstreakoperatordialog(streakinfo.streakname, streakinfo.streakname + "_use", 1, var_52a5be2e2f91d710);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + streakinfo.streakname, self);
        if (isdefined(level.var_2c73f3bef5a3079[self.team])) {
            level.var_2c73f3bef5a3079[self.team]++;
        } else if (!isdefined(level.var_2c73f3bef5a3079[self.team])) {
            level.var_2c73f3bef5a3079[self.team] = 1;
        }
    }
    result = function_3f5928ab9073266c(streakinfo);
    function_f1aed36ab4598ea("kls_jup_emp");
    return 1;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa95
// Size: 0x309
function function_3f5928ab9073266c(streakinfo) {
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = 6000;
    var_4eba8b5ab3b85e92 = 8000;
    targetoffset = 5000;
    var_d38145343175dde9 = level.mapcenter;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["emp"];
    if (istrue(bundle.var_602f50872af4ba48)) {
        var_d38145343175dde9 = self.origin;
        var_4eba8b5ab3b85e92 = 400;
    }
    forwardvector = anglestoforward((0, randomint(360), 0));
    var_6f4bf7ffa758489e = (0, var_4eba8b5ab3b85e92, heightoffset);
    switch (randomint(8)) {
    case 1:
        var_6f4bf7ffa758489e = (var_4eba8b5ab3b85e92, 0, heightoffset);
        break;
    case 2:
        var_6f4bf7ffa758489e = (0, var_4eba8b5ab3b85e92, heightoffset);
        break;
    case 3:
        var_6f4bf7ffa758489e = (var_4eba8b5ab3b85e92 / 2, var_4eba8b5ab3b85e92 / 2, heightoffset);
        break;
    case 4:
        var_6f4bf7ffa758489e = (-1 * var_4eba8b5ab3b85e92, 0, heightoffset);
        break;
    case 5:
        var_6f4bf7ffa758489e = (0, -1 * var_4eba8b5ab3b85e92, heightoffset);
        break;
    case 6:
        var_6f4bf7ffa758489e = (-1 * var_4eba8b5ab3b85e92 / 2, -1 * var_4eba8b5ab3b85e92 / 2, heightoffset);
        break;
    case 7:
        var_6f4bf7ffa758489e = (-1 * var_4eba8b5ab3b85e92 / 2, var_4eba8b5ab3b85e92 / 2, heightoffset);
        break;
    case 8:
        var_6f4bf7ffa758489e = (var_4eba8b5ab3b85e92 / 2, -1 * var_4eba8b5ab3b85e92 / 2, heightoffset);
        break;
    default:
        var_6f4bf7ffa758489e = (0, var_4eba8b5ab3b85e92, heightoffset);
        break;
    }
    targetpos = var_d38145343175dde9 + (0, 0, targetoffset);
    var_9806e3c29658cc34 = targetpos + var_6f4bf7ffa758489e;
    startpos = var_9806e3c29658cc34 - forwardvector * 3000;
    var_b8ee7ddd93755f86 = spawn("script_model", startpos);
    var_b8ee7ddd93755f86 setmodel("wmd_vm_missile_cruise_mp");
    var_b8ee7ddd93755f86.owner = self;
    var_b8ee7ddd93755f86.origin = startpos;
    var_b8ee7ddd93755f86.angles = vectortoangles(targetpos - startpos);
    var_b8ee7ddd93755f86.type = "remote";
    var_b8ee7ddd93755f86.team = self.team;
    var_b8ee7ddd93755f86.entitynumber = var_b8ee7ddd93755f86 getentitynumber();
    var_b8ee7ddd93755f86.streakinfo = streakinfo;
    var_b8ee7ddd93755f86.duration = 30;
    var_b8ee7ddd93755f86.animstate = "pod_flying";
    self.restoreangles = self.angles;
    level.rockets[var_b8ee7ddd93755f86.entitynumber] = var_b8ee7ddd93755f86;
    level.remotemissileinprogress = 1;
    result = function_4fa820930b2857d6(var_b8ee7ddd93755f86, targetpos, streakinfo);
    return result;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda6
// Size: 0x1ba
function function_4fa820930b2857d6(pod, var_8929d2c10beb2fde, streakinfo) {
    var_7b7bc27e7e8b05e2 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "wingtrails");
    var_2cf1418bd3474069 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "shell_break");
    var_9e0fa77c44b24bf9 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "second_missile_thruster");
    var_6431d9c900610f5b = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "anim_end");
    var_3b5e0765d72be907 = var_7b7bc27e7e8b05e2;
    var_421e2f527a382fb4 = var_2cf1418bd3474069 - var_7b7bc27e7e8b05e2;
    var_169c111fab319da1 = var_9e0fa77c44b24bf9 - var_2cf1418bd3474069;
    var_a2f273df08e79256 = var_6431d9c900610f5b - var_9e0fa77c44b24bf9;
    var_620f959ec25a2c58 = "mp_cruise_missile_move_intro";
    pod scriptmodelplayanimdeltamotion(var_620f959ec25a2c58);
    pod setscriptablepartstate("main_emp_thruster", "on", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_3b5e0765d72be907);
    pod setscriptablepartstate("wing_trails", "on");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_421e2f527a382fb4);
    pod.animstate = "pod_break";
    pod setscriptablepartstate("wing_trails", "off");
    pod setscriptablepartstate("main_emp_thruster", "off", 0);
    playfxontag(getfx("predator_pod_break"), pod, "tag_missile");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_169c111fab319da1);
    pod.animstate = "missile_thrusters";
    pod setscriptablepartstate("sub_thruster", "on", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_a2f273df08e79256 - 0.05);
    thread function_861e303c08602058(pod, streakinfo, var_8929d2c10beb2fde);
    return 1;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68
// Size: 0x231
function function_861e303c08602058(pod, streakinfo, targetpos) {
    pod endon("death");
    self endon("disconnect");
    level endon("game_ended");
    pod setscriptablepartstate("sub_thruster", "off", 0);
    missile = spawn("script_model", pod gettagorigin("tag_missile"));
    missile.angles = pod.angles;
    missile setmodel("wmd_vm_missile_cruise_warhead_mp");
    missile.team = self.team;
    missile.streakinfo = streakinfo;
    missile.owner = self;
    missile.lifetime = 10;
    missile.weapon_name = "cruise_proj_mp";
    streakinfo.shots_fired++;
    missile setscriptablepartstate("warhead_emp_thruster", "on", 0);
    missile thread function_ecc8ce9e6c65dae6();
    missile thread function_f292f763187b6ac5();
    missile endon("death");
    fxent = spawn("script_model", missile gettagorigin("tag_fx"));
    fxent setmodel("ks_cruise_predator_mp");
    fxent.angles = missile gettagangles("tag_fx");
    fxent.team = missile.team;
    fxent.owner = missile.owner;
    fxent.streakinfo = missile.streakinfo;
    fxent linkto(missile, "tag_fx");
    fxent setscriptablepartstate("fake_trail_emp", "on", 0);
    fxent setotherent(self);
    fxent thread function_11126110d38cf99e(missile, streakinfo);
    fxent thread function_7750c53508718dbd(missile);
    fxent thread function_9d55bde0bcef1158(missile);
    missile thread function_9814fc51454dfe88("disconnect");
    missile thread function_9814fc51454dfe88("joined_team");
    missile thread function_9814fc51454dfe88("joined_spectators");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    missile thread function_6c9d4dd877455600(self);
    missile thread function_76178b6493ecf6d7(self, targetpos);
    waitframe();
    if (isdefined(pod)) {
        pod delete();
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a0
// Size: 0x11d
function function_ecc8ce9e6c65dae6() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
        objid = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID") ]](99);
        self.var_49be89641b10a107 = objid;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", self.origin, "hud_icon_minimap_killstreak_cruise_missile", "icon_medium");
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
        foreach (player in level.players) {
            if (!isdefined(player) || isbot(player) || player == self) {
                continue;
            }
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
        }
        namespace_5a22b6f3a56f7e9b::update_objective_onentitywithrotation(objid, self);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
        if (level.teambased) {
            namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, self.team);
        } else {
            namespace_5a22b6f3a56f7e9b::update_objective_ownerclient(objid, self);
        }
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c4
// Size: 0x43
function function_f292f763187b6ac5() {
    destpoint = self.origin + anglestoforward(self.angles) * 50000;
    var_51d0f6bb7cd5219f = 16.6667;
    self moveto(destpoint, var_51d0f6bb7cd5219f);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e
// Size: 0x6f
function function_76178b6493ecf6d7(rider, targetpos) {
    self endon("death");
    rider endon("disconnect");
    level endon("game_ended");
    while (1) {
        var_1d9b2df64a70f35a = self gettagorigin("tag_missile");
        var_7a7468a3f3fd54b = distancesquared(targetpos, var_1d9b2df64a70f35a);
        if (var_7a7468a3f3fd54b <= 10000) {
            self notify("explode");
            break;
        }
        waitframe();
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1384
// Size: 0x5e
function function_11126110d38cf99e(missile, streakinfo) {
    missile endon("death");
    missile endon("cruise_missile_explode");
    self endon("death");
    self.owner endon("disconnect");
    level waittill_any_2("start_game_ended", "game_ended");
    missile notify("cruise_missile_force_eject");
    if (isdefined(missile)) {
        missile delete();
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e9
// Size: 0x44
function function_7750c53508718dbd(missile) {
    self endon("death");
    while (1) {
        self.missilelastpos = missile.origin;
        self.missilelastangle = missile.angles;
        waitframe();
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1434
// Size: 0x234
function function_9d55bde0bcef1158(missile) {
    missile endon("cruise_missile_force_eject");
    explodepos = undefined;
    var_d0b12377bc0ec26f = undefined;
    streakinfo = missile.streakinfo;
    var_df4b15ee230bf93a = undefined;
    while (1) {
        var_df4b15ee230bf93a = missile function_db4cffecf38064e7("collision", "explode", "death", "disowned", "emp_defused", "trophy_blocked");
        if (isdefined(var_df4b15ee230bf93a.msg) && var_df4b15ee230bf93a.msg == "collision") {
            surface = physics_getsurfacetypefromflags(var_df4b15ee230bf93a.param4);
            surfacetype = getsubstr(surface["name"], 9);
            var_716d785156e6ffb2 = getdvarint(@"hash_b1fa07a51b801b6b", 0);
            /#
                if (var_716d785156e6ffb2) {
                    iprintln("script_model" + surfacetype);
                    continue;
                }
            #/
            if (surfacetype == "glass_pane") {
                continue;
            }
        }
        break;
    }
    if (isdefined(missile)) {
        missile setscriptablepartstate("warhead_emp_thruster", "off", 0);
        missile notify("cruise_missile_explode");
        namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("game", "returnObjectiveID", missile.var_49be89641b10a107);
    }
    if (isdefined(self)) {
        self setscriptablepartstate("fake_trail_emp", "off", 0);
        explodepos = self.missilelastpos;
        var_d0b12377bc0ec26f = self.missilelastangle;
        if (isdefined(missile)) {
            missile delete();
        }
        if (!isdefined(var_df4b15ee230bf93a) || var_df4b15ee230bf93a.msg != "emp_defused" && var_df4b15ee230bf93a.msg != "trophy_blocked") {
            explosionradius = 600;
            var_5d28f39073721e59 = "MOD_EXPLOSIVE";
            var_23f8c678bd9d023e = "cruise_proj_mp";
        }
        if (issharedfuncdefined("shellshock", "artillery_earthQuake")) {
            [[ getsharedfunc("shellshock", "artillery_earthQuake") ]](explodepos);
        }
        thread function_d09b046309c9310(var_df4b15ee230bf93a, missile.owner);
        thread function_597149e92e028cc();
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166f
// Size: 0x1af
function function_db4cffecf38064e7(var_e127af0eab592c1a, var_e127ae0eab5929e7, var_e127ad0eab5927b4, var_e127ac0eab592581, var_e127ab0eab59234e, var_e127aa0eab59211b) {
    ent = spawnstruct();
    if (isdefined(var_e127af0eab592c1a)) {
        thread waittill_explodestring(var_e127af0eab592c1a, ent);
    }
    if (isdefined(var_e127ae0eab5929e7)) {
        thread waittill_explodestring(var_e127ae0eab5929e7, ent);
    }
    if (isdefined(var_e127ad0eab5927b4)) {
        thread waittill_explodestring(var_e127ad0eab5927b4, ent);
    }
    if (isdefined(var_e127ac0eab592581)) {
        thread waittill_explodestring(var_e127ac0eab592581, ent);
    }
    if (isdefined(var_e127ab0eab59234e)) {
        thread waittill_explodestring(var_e127ab0eab59234e, ent);
    }
    if (isdefined(var_e127aa0eab59211b)) {
        thread waittill_explodestring(var_e127aa0eab59211b, ent);
    }
    param8 = param7 = param6 = param5 = param4 = param3 = param2 = param1 = msg = ent waittill("returned");
    ent notify("die");
    var_df4b15ee230bf93a = spawnstruct();
    var_df4b15ee230bf93a.msg = msg;
    var_df4b15ee230bf93a.param1 = param1;
    var_df4b15ee230bf93a.param2 = param2;
    var_df4b15ee230bf93a.param3 = param3;
    var_df4b15ee230bf93a.param4 = param4;
    var_df4b15ee230bf93a.param5 = param5;
    var_df4b15ee230bf93a.param6 = param6;
    var_df4b15ee230bf93a.param7 = param7;
    var_df4b15ee230bf93a.param8 = param8;
    return var_df4b15ee230bf93a;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1826
// Size: 0x7b
function waittill_explodestring(msg, ent) {
    self endon("death");
    ent endon("die");
    param6 = param5 = param4 = param3 = param2 = param1 = self waittill(msg);
    ent notify("returned", msg);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a8
// Size: 0xd
function function_597149e92e028cc() {
    exploder(777);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bc
// Size: 0x165
function function_d09b046309c9310(var_df4b15ee230bf93a, owner) {
    self endon("death");
    self unlink();
    if (!isdefined(var_df4b15ee230bf93a) || var_df4b15ee230bf93a.msg == "explode" || var_df4b15ee230bf93a.msg == "disowned" || var_df4b15ee230bf93a.msg == "emp_defused" || var_df4b15ee230bf93a.msg == "trophy_blocked") {
        self setscriptablepartstate("emp_air_explosion", "on", 0);
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.2);
        owner thread function_ef236a24af5b02ee();
        owner applyemp(self.origin);
        self delete();
    }
    worldup = (0, 0, 1);
    surfacenormal = var_df4b15ee230bf93a.param6;
    self.angles = vectortoangles(surfacenormal);
    var_75fb158dc4a7d84d = vectordot(surfacenormal, worldup);
    if (var_75fb158dc4a7d84d >= 0.7) {
        self setscriptablepartstate("emp_ground_explosion", "on", 0);
    } else {
        self setscriptablepartstate("emp_air_explosion", "on", 0);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    owner thread function_ef236a24af5b02ee();
    owner applyemp(self.origin);
    self delete();
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a28
// Size: 0x85
function function_ef236a24af5b02ee() {
    var_da8cec9bce12f9cb = self.pers["team"];
    var_817b24cc21ede559 = function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
    character = namespace_d2b94521fd636348::function_309f1876dda94360("Character", var_817b24cc21ede559);
    dialogalias = "dx_mp_core_anno_" + character + "_cege";
    self queuedialogforplayer(dialogalias, "emp_detonated", 1);
    self.currentkillstreakopvo = "emp_detonated";
    thread clearstoredkillstreakoperatordialog(5);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab4
// Size: 0x41
function function_9814fc51454dfe88(action) {
    self endon("death");
    self endon("disowned");
    level endon("game_ended");
    var_4084c95c19c7937a = self.owner;
    var_4084c95c19c7937a waittill(action);
    self notify("disowned");
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1afc
// Size: 0x32
function function_43bec35d6ecff18b() {
    self endon("death");
    self endon("cruise_missile_explode");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.75);
    self vehphys_enablecollisioncallback(1);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1.25);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b35
// Size: 0x30
function function_6c9d4dd877455600(rider) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(500.1);
    self notify("explode", self.origin);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6c
// Size: 0x293
function applyemp(var_d0bb62c0804a01e1) {
    level endon("game_ended");
    myteam = self.team;
    enemyplayers = getenemyplayers(myteam, 1);
    empduration = 45;
    /#
        empduration = getdvarfloat(@"hash_35492017c44a48a5", 45);
    #/
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["emp"];
    if (istrue(bundle.var_602f50872af4ba48)) {
        thread function_429c035df406caf8(var_d0bb62c0804a01e1, empduration);
    }
    if (isdefined(enemyplayers)) {
        if (istrue(bundle.var_602f50872af4ba48)) {
            var_4b6187af7c46d276 = function_53c4c53197386572(bundle.var_34716d4fdcd275ed, 3000);
            var_388aeb1962fad84a = var_4b6187af7c46d276 * var_4b6187af7c46d276;
            var_caa88de527c0f931 = [];
            foreach (enemy in enemyplayers) {
                if (!isdefined(enemy)) {
                    continue;
                }
                if (distance_2d_squared(var_d0bb62c0804a01e1, enemy.origin) < var_388aeb1962fad84a) {
                    var_caa88de527c0f931[var_caa88de527c0f931.size] = enemy;
                }
            }
            enemyplayers = var_caa88de527c0f931;
        }
        foreach (enemy in enemyplayers) {
            enemy thread function_a3d62c450f8fb932(enemy.team, self, var_d0bb62c0804a01e1);
            if (!istrue(bundle.var_602f50872af4ba48)) {
                thread function_a488516398cf6ae3(enemy.team, self, var_d0bb62c0804a01e1, empduration);
            }
        }
        wait(empduration);
        foreach (enemy in enemyplayers) {
            enemy thread function_33b7f0d067af5e39();
            if (!istrue(bundle.var_602f50872af4ba48)) {
                thread function_dc8d8685a0b3a582(enemy.team, self, var_d0bb62c0804a01e1, empduration);
            }
        }
    }
    level.var_2c73f3bef5a3079[self.team]--;
    if (level.var_2c73f3bef5a3079[self.team] <= 0) {
        level.var_2c73f3bef5a3079[self.team] = undefined;
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e06
// Size: 0x8f
function function_429c035df406caf8(var_d0bb62c0804a01e1, empduration) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["emp"];
    /#
        assert(istrue(bundle.var_602f50872af4ba48));
    #/
    var_4b6187af7c46d276 = function_53c4c53197386572(bundle.var_34716d4fdcd275ed, 3000);
    var_34ca454bbec477f1 = function_a488516398cf6ae3(undefined, self, var_d0bb62c0804a01e1, empduration, var_4b6187af7c46d276);
    wait(empduration);
    function_e0c2272bd4e5c0f(var_34ca454bbec477f1, self, var_d0bb62c0804a01e1, empduration);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9c
// Size: 0x679
function function_a488516398cf6ae3(victimteam, attacker, var_d0bb62c0804a01e1, empduration, var_4b6187af7c46d276) {
    var_6c845d64be969ce8 = level.activekillstreaks;
    var_98fa4b76d957b210 = [[ level.getactiveequipmentarray ]]();
    var_5b037ec7465246f3 = undefined;
    if (isdefined(victimteam)) {
        var_5b037ec7465246f3 = level.var_d381da74cc527ec5["tacticalCameraList"][victimteam];
    }
    var_dec749c32138b943 = level.recondronesupers;
    var_20e441421ce5b1cb = level.mines;
    var_6416b99a514e17ee = level.allsupportboxes;
    vehiclearray = level.vehicle.interact.vehicles;
    objweapon = makeweapon("emp");
    var_34ca454bbec477f1 = [];
    if (isdefined(var_6c845d64be969ce8)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_6c845d64be969ce8);
    }
    if (isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_98fa4b76d957b210);
    }
    if (isdefined(var_5b037ec7465246f3)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_5b037ec7465246f3);
    }
    if (isdefined(var_dec749c32138b943)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_dec749c32138b943);
    }
    if (isdefined(var_20e441421ce5b1cb)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_20e441421ce5b1cb);
    }
    if (isdefined(var_6416b99a514e17ee)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_6416b99a514e17ee);
    }
    if (isdefined(vehiclearray)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, vehiclearray);
    }
    if (!isdefined(victimteam)) {
        foreach (team in level.teamnamelist) {
            if (team != attacker.team) {
                var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, level.var_d381da74cc527ec5["tacticalCameraList"][team]);
            }
        }
    }
    if (isdefined(level.var_dac66bb7e0b0f8a5) && istrue(level.var_dac66bb7e0b0f8a5.var_be644fc4b0bd2cd9)) {
        foreach (stronghold in level.var_f1073fbd45b59a06.var_df987907a483df89) {
            if (isdefined(stronghold.task.var_54f5e15c58954932)) {
                var_34ca454bbec477f1[var_34ca454bbec477f1.size] = stronghold.task.var_54f5e15c58954932.trigger;
            }
        }
    }
    if (istrue(level.var_684d782689230a50)) {
        foreach (var_73bdebbc7da468a3 in level.var_a1141d47ab94d2a1) {
            if (isdefined(var_73bdebbc7da468a3) && isdefined(var_73bdebbc7da468a3.var_107d6e8fc82a82a8)) {
                var_34ca454bbec477f1[var_34ca454bbec477f1.size] = var_73bdebbc7da468a3.var_107d6e8fc82a82a8;
            }
        }
    }
    if (isdefined(var_34ca454bbec477f1)) {
        if (isdefined(var_4b6187af7c46d276)) {
            var_388aeb1962fad84a = var_4b6187af7c46d276 * var_4b6187af7c46d276;
            var_dbf11c896f66e089 = [];
            foreach (object in var_34ca454bbec477f1) {
                if (!isdefined(object)) {
                    continue;
                }
                if (distance_2d_squared(var_d0bb62c0804a01e1, object.origin) < var_388aeb1962fad84a) {
                    var_dbf11c896f66e089[var_dbf11c896f66e089.size] = object;
                }
            }
            var_34ca454bbec477f1 = var_dbf11c896f66e089;
        }
        foreach (object in var_34ca454bbec477f1) {
            if (isdefined(object)) {
                if (isdefined(object.team)) {
                    jumpiffalse(object.team == attacker.team) LOC_00000437;
                } else if (isdefined(object.ownerteam)) {
                    jumpiffalse(object.ownerteam == attacker.team) LOC_00000463;
                } else if (isdefined(object.var_73bdebbc7da468a3) && isdefined(object.var_73bdebbc7da468a3.var_107d6e8fc82a82a8)) {
                    jumpiffalse(isdefined(object.var_73bdebbc7da468a3.var_107d6e8fc82a82a8.var_dcc5f31ec71d6d8a) && istrue(object.var_73bdebbc7da468a3.var_107d6e8fc82a82a8.var_dcc5f31ec71d6d8a == attacker.team)) LOC_000004e2;
                } else if (isdefined(object.stronghold) && isdefined(object.stronghold.var_4756733ecc825a2)) {
                    jumpiffalse(istrue(object.stronghold.var_4756733ecc825a2 == attacker.team)) LOC_00000533;
                } else {
                LOC_00000533:
                    if (isdefined(object.var_3545410459b16762)) {
                        data = packdamagedata(attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, var_d0bb62c0804a01e1);
                        data.time = empduration;
                        data.reason = "EMP_KS";
                        object thread [[ object.var_3545410459b16762 ]](data);
                        object notify("emp_started");
                        if (!isdefined(object.var_5d67315cdcf62026)) {
                            if (isdefined(object.empcount)) {
                                object.empcount++;
                            } else {
                                object.empcount = 1;
                            }
                            object.var_65219c911f198c95 = 1;
                        }
                    }
                    if (isdefined(object.var_5d67315cdcf62026)) {
                        data = packdamagedata(attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, var_d0bb62c0804a01e1);
                        data.ksemp = 1;
                        object thread [[ object.var_5d67315cdcf62026 ]](data);
                        object notify("emp_applied");
                        if (isdefined(object.empcount)) {
                            object.empcount++;
                        } else {
                            object.empcount = 1;
                        }
                        object.var_65219c911f198c95 = 1;
                    }
                }
            }
        }
    }
    return var_34ca454bbec477f1;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x251d
// Size: 0x15c
function function_dc8d8685a0b3a582(victimteam, attacker, var_d0bb62c0804a01e1, empduration) {
    var_6c845d64be969ce8 = level.activekillstreaks;
    var_98fa4b76d957b210 = [[ level.getactiveequipmentarray ]]();
    if (isdefined(victimteam)) {
        var_5b037ec7465246f3 = level.var_d381da74cc527ec5["tacticalCameraList"][victimteam];
    }
    var_dec749c32138b943 = level.recondronesupers;
    var_20e441421ce5b1cb = level.mines;
    var_6416b99a514e17ee = level.allsupportboxes;
    vehiclearray = level.vehicle.interact.vehicles;
    var_34ca454bbec477f1 = [];
    if (isdefined(var_6c845d64be969ce8)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_6c845d64be969ce8);
    }
    if (isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_98fa4b76d957b210);
    }
    if (isdefined(var_5b037ec7465246f3)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_5b037ec7465246f3);
    }
    if (isdefined(var_dec749c32138b943)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_dec749c32138b943);
    }
    if (isdefined(var_20e441421ce5b1cb)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_20e441421ce5b1cb);
    }
    if (isdefined(var_6416b99a514e17ee)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, var_6416b99a514e17ee);
    }
    if (isdefined(vehiclearray)) {
        var_34ca454bbec477f1 = array_combine_unique(var_34ca454bbec477f1, vehiclearray);
    }
    function_e0c2272bd4e5c0f(var_34ca454bbec477f1, attacker, var_d0bb62c0804a01e1, empduration);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2680
// Size: 0xfd
function function_e0c2272bd4e5c0f(var_34ca454bbec477f1, attacker, var_d0bb62c0804a01e1, empduration) {
    if (isdefined(var_34ca454bbec477f1)) {
        objweapon = makeweapon("emp");
        foreach (object in var_34ca454bbec477f1) {
            if (object namespace_5a51aa78ea0b1b9f::is_empd() || istrue(object.var_65219c911f198c95)) {
                if (isdefined(object.var_2ba749157b05bad7)) {
                    data = packdamagedata(attacker, object, 1, objweapon, "MOD_EXPLOSIVE", attacker, var_d0bb62c0804a01e1);
                    object thread [[ object.var_2ba749157b05bad7 ]](data);
                }
                object.empcount = undefined;
                object.var_65219c911f198c95 = undefined;
                object notify("emp_cleared");
            }
        }
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2784
// Size: 0xff
function function_a3d62c450f8fb932(victimteam, attacker, var_d0bb62c0804a01e1) {
    if (issharedfuncdefined("perk", "hasPerk") && (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_emp_immunity") || self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_empimmune"))) {
        return;
    }
    objweapon = makeweapon("emp");
    var_8c8f491e49bdeef9 = packdamagedata(attacker, self, 1, objweapon, "MOD_EXPLOSIVE", attacker, var_d0bb62c0804a01e1);
    self.var_5c079aa1be2b9bb = var_8c8f491e49bdeef9;
    if (isdefined(self.empcount)) {
        self.empcount++;
        self.var_65219c911f198c95 = 1;
    } else {
        self.var_65219c911f198c95 = 1;
        self.empcount = 1;
    }
    self notify("emp_started");
    self notify("emp_applied");
    thread function_377c97bfdd963952();
    thread watch_checkforlauncherweapons();
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288a
// Size: 0x4a
function function_377c97bfdd963952() {
    val::set("ksEMP", "killstreaks", 0);
    namespace_5a51aa78ea0b1b9f::play_emp_scramble(3);
    self playsoundtoplayer("kls_emp_hud_deactivate", self);
    wait(2);
    self setempjammed(1);
    utility::hidehudenable();
    namespace_5a51aa78ea0b1b9f::stop_emp_scramble(3);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28db
// Size: 0x85
function function_8887420281f3ff3f() {
    if (istrue(self.var_3570f4b5b40c02e4)) {
        self.var_3570f4b5b40c02e4 = undefined;
        thread namespace_5a51aa78ea0b1b9f::stop_emp_scramble(4);
    }
    self setempjammed(0);
    if (isdefined(self.hidehudenabled) && self.hidehudenabled > 0) {
        utility::hidehuddisable();
    }
    val::reset("ksEMP", "killstreaks");
    namespace_5a51aa78ea0b1b9f::play_emp_scramble(3);
    self playsoundtoplayer("kls_emp_hud_activate", self);
    wait(2);
    namespace_5a51aa78ea0b1b9f::stop_emp_scramble(3);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2967
// Size: 0x8c
function watch_checkforlauncherweapons() {
    self endon("death_or_disconnect");
    self endon("stopLauncherCheck");
    level endon("game_ended");
    while (1) {
        currentweapon = self getcurrentweapon();
        currentweaponname = currentweapon.basename;
        if (currentweaponname == "iw9_la_gromeo_mp" || currentweaponname == "iw9_la_juliet_mp" || currentweaponname == "iw9_la_kgolf_mp" || currentweaponname == "jup_jp22_la_dromeo_mp") {
            namespace_d325722f2754c2c4::function_605b121f1fadd46c(0);
        } else {
            namespace_d325722f2754c2c4::function_605b121f1fadd46c(1);
        }
        wait(1);
    }
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fa
// Size: 0x53
function function_33b7f0d067af5e39() {
    self notify("emp_cleared");
    self notify("stopLauncherCheck");
    self.empcount = undefined;
    self.var_65219c911f198c95 = undefined;
    self.var_5c079aa1be2b9bb = undefined;
    thread function_8887420281f3ff3f();
    thread namespace_37686d23b558ac76::function_56fe93fec9438968();
    self allowfire(1);
    namespace_d325722f2754c2c4::function_605b121f1fadd46c(1);
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a54
// Size: 0x16
function setemp_applied_callback(var_9b9a9fd5c7f44af0) {
    self.var_5d67315cdcf62026 = var_9b9a9fd5c7f44af0;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a71
// Size: 0x16
function setemp_cleared_callback(var_a92c68f274cd0239) {
    self.var_2ba749157b05bad7 = var_a92c68f274cd0239;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8e
// Size: 0x16
function setemp_started_callback(startcallback) {
    self.var_3545410459b16762 = startcallback;
}

// Namespace emp/namespace_37686d23b558ac76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aab
// Size: 0x12
function function_56fe93fec9438968() {
    wait(5);
    function_f4e0ff5cb899686d("kls_jup_emp");
}

