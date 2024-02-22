// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_58be75c518bf0d40;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\common\elevator.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace namespace_8319cdbe938cd234;

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf29
// Size: 0x14e
function createstreakinfo(streakname, owner) {
    streakinfo = spawnstruct();
    streakinfo.streakname = streakname;
    streakinfo.owner = owner;
    if (isdefined(owner)) {
        streakinfo.id = getuniquekillstreakid(owner);
        streakinfo.lifeid = owner getcurrentplayerlifeidforkillstreak();
    } else {
        /#
            iprintln("killstreakSetPreModDamageCallback");
        #/
        streakinfo.id = 0;
        streakinfo.lifeid = 0;
    }
    streakinfo.score = 0;
    streakinfo.shots_fired = 0;
    streakinfo.hits = 0;
    streakinfo.damage = 0;
    streakinfo.kills = 0;
    if (issharedfuncdefined("killstreak", "createCustomStreakData")) {
        streakinfo = [[ getsharedfunc("killstreak", "createCustomStreakData") ]](streakinfo, streakname);
    }
    if (isdefined(streakname) && isdefined(level.var_b23156d776b1d85)) {
        streakindex = level.var_b23156d776b1d85.var_2150da9328528bb9[streakname];
    } else {
        streakindex = 0;
    }
    if (!isdefined(streakindex)) {
        streakindex = -1;
    }
    streakinfo.streakindex = streakindex;
    return streakinfo;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x107f
// Size: 0xa1
function function_cfc5e3633ef950fd(damagestate, damageamount, var_d3cbdf6df967d53b) {
    if (!isdefined(self.var_a7cfe37c95fb9196)) {
        self.var_a7cfe37c95fb9196 = [];
        self.currentdamagestate = 0;
    }
    if (array_contains_key(self.var_a7cfe37c95fb9196, damagestate)) {
        /#
            /#
                assertmsg("_teamleader_enemy_inbound");
            #/
        #/
        return;
    }
    self.var_a7cfe37c95fb9196[damagestate] = spawnstruct();
    self.var_a7cfe37c95fb9196[damagestate].damageamount = damageamount;
    self.var_a7cfe37c95fb9196[damagestate].var_d3cbdf6df967d53b = var_d3cbdf6df967d53b;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1127
// Size: 0x14b
function killstreak_updatedamagestate(currenthealth) {
    damagestate = undefined;
    var_9ae1415763bd6518 = undefined;
    var_149dfe048badbf65 = undefined;
    states = self.var_a7cfe37c95fb9196;
    if (isdefined(states)) {
        if (currenthealth <= states[3].damageamount) {
            if (self.currentdamagestate != 3) {
                damagestate = 3;
            }
        } else if (currenthealth <= states[2].damageamount) {
            if (self.currentdamagestate != 2) {
                damagestate = 2;
            }
        } else if (currenthealth <= states[1].damageamount) {
            if (self.currentdamagestate != 1) {
                damagestate = 1;
            }
        }
    }
    if (isdefined(damagestate)) {
        if (isdefined(self.owner) && istrue(self.ispiloted)) {
            self.owner setclientomnvar("ui_killstreak_damage_state", damagestate);
        }
        self [[ states[damagestate].var_d3cbdf6df967d53b ]]();
        self.currentdamagestate = damagestate;
    }
    if (isdefined(self.owner) && istrue(self.ispiloted)) {
        self.owner setclientomnvar("ui_killstreak_health", currenthealth / self.maxhealth);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1279
// Size: 0x63
function getuniquekillstreakid(player) {
    if (!isdefined(player.pers["nextKillstreakID"])) {
        player.pers["nextKillstreakID"] = 0;
    }
    uniqueid = player.pers["nextKillstreakID"];
    player.pers["nextKillstreakID"]++;
    return uniqueid;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e4
// Size: 0x36
function getcurrentplayerlifeidforkillstreak() {
    if (!isdefined(self.pers) || !isdefined(self.pers["deaths"])) {
        return 0;
    }
    return self.pers["deaths"];
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1322
// Size: 0x80
function getkillstreaklifeid(streakname) {
    var_16efcf27e6efcbe8 = undefined;
    for (killstreakindex = 1; killstreakindex <= 3; killstreakindex++) {
        var_3a14cf5127d18576 = self.streakdata.streaks[killstreakindex];
        if (isdefined(var_3a14cf5127d18576) && var_3a14cf5127d18576.streakname == streakname) {
            var_16efcf27e6efcbe8 = var_3a14cf5127d18576;
            break;
        }
    }
    if (isdefined(var_16efcf27e6efcbe8)) {
        return var_16efcf27e6efcbe8.lifeid;
    }
    return undefined;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13aa
// Size: 0x98
function killstreak_setmainvision(visionsetname) {
    if (visionsetname == "") {
        self visionsetthermalforplayer("");
        self visionsetkillstreakforplayer("");
    } else {
        var_91aaff4f33c3af2f = function_3de44eb7cdde2614(visionsetname);
        if (!isdefined(var_91aaff4f33c3af2f)) {
            return;
        }
        fadeintime = var_91aaff4f33c3af2f.fadeintime;
        if (isdefined(var_91aaff4f33c3af2f.type) && var_91aaff4f33c3af2f.type == "thermal") {
            self visionsetthermalforplayer(visionsetname, fadeintime);
        } else {
            self visionsetkillstreakforplayer(visionsetname, fadeintime);
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1449
// Size: 0xbb
function killstreak_setsubvision(var_91aaff4f33c3af2f) {
    self endon("disconnect");
    self notify("playing_killstreak_subvision");
    self endon("playing_killstreak_subvision");
    visionsetname = var_91aaff4f33c3af2f.name;
    fadeintime = var_91aaff4f33c3af2f.fadeintime;
    var_e3c85f91f65e524e = var_91aaff4f33c3af2f.var_e3c85f91f65e524e;
    fadeouttime = var_91aaff4f33c3af2f.fadeouttime;
    self visionsetfadetoblackforplayer(visionsetname, fadeintime);
    result = waittill_any_timeout_1(var_e3c85f91f65e524e, "returning_killstreak_player");
    if (!isdefined(result) || result != "timeout") {
        fadeouttime = 0;
    }
    self visionsetfadetoblackforplayer("", fadeouttime);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150b
// Size: 0x156
function registervisibilityomnvarforkillstreak(streakname, var_3e99c59055b3de67, var_5c9ddcf56d36f133) {
    if (!isdefined(level.killstreak_visbilityomnvarlist)) {
        level.killstreak_visbilityomnvarlist = [];
    }
    /#
        assertex(isdefined(var_3e99c59055b3de67) && var_3e99c59055b3de67 != "off", "registerVisibilityOmnvarForKillstreak: Cannot override the off state.  That is always set to 0");
    #/
    if (isdefined(level.killstreak_visbilityomnvarlist[streakname]) && isdefined(level.killstreak_visbilityomnvarlist[streakname][var_3e99c59055b3de67])) {
        /#
            assertmsg("registerVisibilityOmnvarForKillstreak: omnvarID already exists for this killstreak");
        #/
        return;
    }
    var_e5636e6c071107e3 = 0;
    foreach (var_6aa208d035887bb8 in level.killstreak_visbilityomnvarlist) {
        foreach (var_fecb32b716cba349 in var_6aa208d035887bb8) {
            if (var_5c9ddcf56d36f133 == var_fecb32b716cba349) {
                var_e5636e6c071107e3 = 1;
                break;
            }
        }
        if (istrue(var_e5636e6c071107e3)) {
            /#
                assertmsg("registerVisibilityOmnvarForKillstreak: omnvarValue already exists, please check the comment for ui_killstreak_controls to see what ranges are already reserved");
            #/
            return;
        }
    }
    level.killstreak_visbilityomnvarlist[streakname][var_3e99c59055b3de67] = var_5c9ddcf56d36f133;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1668
// Size: 0x68
function _setvisibiilityomnvarforkillstreak(streakname, var_b677bbe2241c4e3f) {
    var_5c9ddcf56d36f133 = undefined;
    if (var_b677bbe2241c4e3f == "off") {
        var_5c9ddcf56d36f133 = 0;
    } else {
        /#
            assertex(isdefined(level.killstreak_visbilityomnvarlist[streakname][var_b677bbe2241c4e3f]), "_setVisibiilityOmnvarForKillstreak: Killstreak is not registered, or Omnvar state is not registered");
        #/
        var_5c9ddcf56d36f133 = level.killstreak_visbilityomnvarlist[streakname][var_b677bbe2241c4e3f];
    }
    self setclientomnvar("ui_killstreak_controls", var_5c9ddcf56d36f133);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d7
// Size: 0x86
function killstreakcanbeusedatroundstart(streakname) {
    switch (streakname) {
    case #"hash_10e585c25e7e9f60":
    case #"hash_27002778019fb447":
    case #"hash_634b246c3da5c56f":
    case #"hash_6d23e850410bc518":
    case #"hash_c1082193805af873":
    case #"hash_e171e5b86ef0a4cc":
    case #"hash_e3a2a26462a4fbc8":
    case #"hash_f64c697bfb4c6b54":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1764
// Size: 0x16
function function_ce1a9c6c9043809f(streakname) {
    return getkillstreakindex(streakname) != -1;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1782
// Size: 0x35
function getkillstreakindex(streakname) {
    streakindex = level.var_b23156d776b1d85.var_2150da9328528bb9[streakname];
    if (!isdefined(streakindex)) {
        return -1;
    }
    return streakindex;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bf
// Size: 0x6e
function isridekillstreak(streakname) {
    switch (streakname) {
    case #"hash_28d0236400e33fd0":
    case #"hash_349713b5ad494dda":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_cf0ef5bef19a311b":
    case #"hash_e40585107590f016":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1834
// Size: 0x7a
function ismapselectkillstreak(streakname) {
    switch (streakname) {
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_195360490caa3220":
    case #"hash_4220be38a5f150b8":
    case #"hash_62810d05099e0103":
    case #"hash_b161e185f1b8e117":
    case #"hash_de3d319cd367bcba":
    case #"hash_e6bea339d3cbd3e8":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b5
// Size: 0x3e
function function_3c5423f8416220de(streakname) {
    switch (streakname) {
    case #"hash_4d5aa76e8707f47b":
    case #"hash_52d9b7ed584bec3e":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18fa
// Size: 0x9e
function function_d57fb9abf76f9515(streakname) {
    switch (streakname) {
    case #"hash_2289ec11d77bce8f":
    case #"hash_27002778019fb447":
    case #"hash_4ad475e6e15635bd":
    case #"hash_4d35eb58f9d545f0":
    case #"hash_56979e0566996b2e":
    case #"hash_634b246c3da5c56f":
    case #"hash_887ad77192b9c4fb":
    case #"hash_8c766d6477287bb6":
    case #"hash_b4ac3581c343a029":
    case #"hash_e171e5b86ef0a4cc":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199f
// Size: 0x2b
function function_9f1dc821e9a8506() {
    return getdvarint(@"hash_773df58204678ff3", 0) == 1 && getdvarint(@"hash_708473a41b11b061", 0) == 1;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d2
// Size: 0x61
function function_708853c5d755f72() {
    bundle = undefined;
    if (isdefined(level.var_1a2b600a06ec21f4)) {
        bundlename = level.var_1a2b600a06ec21f4.var_386a08793af08e6c;
        if (isstring(bundlename)) {
            bundle = function_2ef675c13ca1c4af(%"killstreaklist:", bundlename);
        }
    }
    if (!isdefined(bundle)) {
        return function_79e77793fa726dd8();
    }
    return bundle;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a3b
// Size: 0x7b
function private function_79e77793fa726dd8() {
    if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        /#
            utility::function_631451c08249b9d2("<unknown string>", "<unknown string>");
        #/
        return "killstreaklist:killstreak_list_t10_mp";
    } else if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) > 0) {
        /#
            utility::function_631451c08249b9d2("<unknown string>", "<unknown string>");
        #/
        return "killstreaklist:killstreak_list_mgl_mp";
    }
    /#
        utility::function_631451c08249b9d2("<unknown string>", "<unknown string>");
    #/
    return "killstreaklist:killstreak_list_iw9_mp";
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1abe
// Size: 0x4d
function isremotekillstreaktabletweapon(weaponname) {
    var_cd5c5ac9105ab0d7 = 0;
    switch (weaponname) {
    case #"hash_70c33644073da94f":
    case #"hash_a5ecbf4077755d5e":
    case #"hash_b43c2e4c05fafc4b":
        var_cd5c5ac9105ab0d7 = 1;
        break;
    }
    return var_cd5c5ac9105ab0d7;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b13
// Size: 0x61
function starttabletscreen(streakname, var_efc34e190209c88d, var_a6b5eeb69fa71f8d) {
    var_becd2b16f168c845 = function_b6fda02e36d883d8(streakname);
    if (!isdefined(var_becd2b16f168c845)) {
        return;
    }
    thread function_7b5ca7323de6426e(var_becd2b16f168c845.omnvar, var_becd2b16f168c845.index);
    if (!istrue(var_a6b5eeb69fa71f8d)) {
        thread tabletdofset(var_efc34e190209c88d, 0);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x61
function stoptabletscreen(streakname, var_375181444841ad, var_bfd205538a66591a) {
    var_becd2b16f168c845 = function_b6fda02e36d883d8(streakname);
    if (!isdefined(var_becd2b16f168c845)) {
        return;
    }
    if (istrue(var_bfd205538a66591a)) {
        function_d88996aa85eb88bf();
    }
    thread function_7b5ca7323de6426e(var_becd2b16f168c845.omnvar, -1, var_375181444841ad);
    thread tabletdofset(var_375181444841ad, 1);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be3
// Size: 0x4f
function function_7b5ca7323de6426e(omnvar, var_cabc886d846dd979, var_cd42af66561fad0d) {
    self endon("disconnect");
    self notify("omnvar_set_tablet");
    self endon("omnvar_set_tablet");
    if (isdefined(var_cd42af66561fad0d) && var_cd42af66561fad0d > 0) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_cd42af66561fad0d);
    }
    self setclientomnvar(omnvar, var_cabc886d846dd979);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c39
// Size: 0xd7
function function_b6fda02e36d883d8(streakname) {
    if (!isdefined(streakname)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    if (isdefined(streakname) && isdefined(level.var_b23156d776b1d85)) {
        var_24134a74ffe1614b = level.var_b23156d776b1d85.var_2150da9328528bb9[streakname];
    } else {
        var_24134a74ffe1614b = 0;
    }
    var_66acf4d59df5fe5e = "ui_remote_control_sequence";
    if (!isdefined(var_24134a74ffe1614b)) {
        var_24134a74ffe1614b = level.superglobals.staticsuperdata[streakname].id;
        var_66acf4d59df5fe5e = "ui_super_tablet_sequence";
        if (!isdefined(var_24134a74ffe1614b)) {
            /#
                iprintlnbold("<unknown string>" + streakname);
            #/
            return;
        }
    }
    tabletinfo = spawnstruct();
    tabletinfo.index = var_24134a74ffe1614b;
    tabletinfo.omnvar = var_66acf4d59df5fe5e;
    return tabletinfo;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d18
// Size: 0x8f
function tabletdofset(var_524d5d1e26c664c5, var_f764ff5de97d58d2) {
    self endon("disconnect");
    self notify("dof_set_tablet");
    self endon("dof_set_tablet");
    if (isdefined(level.var_affc75ae2955c39f)) {
        val::function_3633b947164be4f3(level.var_affc75ae2955c39f, 0);
    }
    if (isdefined(var_524d5d1e26c664c5) && var_524d5d1e26c664c5 > 0) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_524d5d1e26c664c5);
    }
    if (istrue(var_f764ff5de97d58d2)) {
        function_178aa80b91f36bf4();
    } else {
        function_d88996aa85eb88bf();
    }
    if (isdefined(level.var_affc75ae2955c39f)) {
        val::function_588f2307a3040610(level.var_affc75ae2955c39f);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dae
// Size: 0x23
function function_d88996aa85eb88bf() {
    self enablephysicaldepthoffieldscripting();
    self setphysicaldepthoffield(0.125, 0);
    self setphysicalviewmodeldepthoffield(30, 256);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd8
// Size: 0xa
function function_178aa80b91f36bf4() {
    self disablephysicaldepthoffieldscripting();
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de9
// Size: 0x41
function function_36e63b8636445465(streakname) {
    streakindex = level.var_b23156d776b1d85.var_2150da9328528bb9[streakname];
    self setclientomnvar("ui_remote_control_sequence", streakindex);
    thread function_894dba22489fc8df();
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e31
// Size: 0x32
function function_894dba22489fc8df() {
    self endon("disconnect");
    level endon("game_ended");
    animlength = 1;
    waittill_any_timeout_1(animlength, "death");
    function_c914f562171b9817();
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6a
// Size: 0x11
function function_c914f562171b9817() {
    self setclientomnvar("ui_remote_control_sequence", -1);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e82
// Size: 0x11a
function killstreak_setupvehicledamagefunctionality(streakname, var_e25f9b0de2cc7b81, scorepopup, vodestroyed, destroyedsplash, var_8dfc256103cce53e, var_191284e2e2837328, var_bacc6dd14316758c, var_7da88d9c69433487, deathcallback) {
    if (isdefined(var_8dfc256103cce53e)) {
        [[ var_8dfc256103cce53e ]](streakname);
    }
    if (isdefined(var_191284e2e2837328)) {
        [[ var_191284e2e2837328 ]](streakname);
    }
    if (issharedfuncdefined("killstreak", "killstreakMakeVehicle")) {
        var_e25f9b0de2cc7b81 [[ getsharedfunc("killstreak", "killstreakMakeVehicle") ]](streakname, scorepopup, vodestroyed, destroyedsplash);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPreModDamageCallback")) {
        var_e25f9b0de2cc7b81 [[ getsharedfunc("killstreak", "killstreakSetPreModDamageCallback") ]](streakname, var_bacc6dd14316758c);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetPostModDamageCallback")) {
        var_e25f9b0de2cc7b81 [[ getsharedfunc("killstreak", "killstreakSetPostModDamageCallback") ]](streakname, var_7da88d9c69433487);
    }
    if (issharedfuncdefined("killstreak", "killstreakSetDeathCallback")) {
        var_e25f9b0de2cc7b81 [[ getsharedfunc("killstreak", "killstreakSetDeathCallback") ]](streakname, deathcallback);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa3
// Size: 0x3e
function function_86ff095469a70cd2() {
    var_a45b81b69aa779eb = self.owner;
    if (istrue(self.oob)) {
        var_a45b81b69aa779eb setclientomnvar("ui_out_of_bounds_type", 0);
        var_a45b81b69aa779eb setclientomnvar("ui_out_of_bounds_countdown", 0);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe8
// Size: 0xb2
function function_a91ebb0263d086f3() {
    var_754414b883a90065 = self.owner;
    var_4a3cc04781d25c6f = undefined;
    oobtimeleft = undefined;
    if (isdefined(self.oob) && isdefined(self.oobendtime) && isdefined(self.var_4a3cc04781d25c6f)) {
        var_4a3cc04781d25c6f = self.var_4a3cc04781d25c6f;
        oobtimeleft = int(max(0, self.oobendtime - gettime()));
        oobtimeleft = int(gettime() + oobtimeleft);
    }
    if (istrue(var_4a3cc04781d25c6f) && isdefined(oobtimeleft)) {
        var_754414b883a90065 setclientomnvar("ui_out_of_bounds_type", var_4a3cc04781d25c6f);
        var_754414b883a90065 setclientomnvar("ui_out_of_bounds_countdown", oobtimeleft);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a1
// Size: 0x6e
function function_44e0bd95b98288ab() {
    var_93b54405fda960c = "killstreak_thermal";
    if (isdefined(level.var_49071332a2a99c1e)) {
        var_93b54405fda960c = level.var_49071332a2a99c1e;
    }
    if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries"))) {
        var_93b54405fda960c = "killstreak_thermal_fog";
    }
    return var_93b54405fda960c;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2117
// Size: 0x18e
function function_5a9772411551e56e(streakname, var_be776ca84bc2eb95) {
    if (istrue(level.disableannouncer)) {
        return;
    }
    ent = self;
    if (isdefined(self.owner)) {
        ent = self.owner;
    }
    if (!isdefined(streakname)) {
        streakname = "chopper_gunner";
    }
    if (isplayer(ent)) {
        var_da8cec9bce12f9cb = ent.pers["team"];
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "brGetOperatorTeam")) {
                var_da8cec9bce12f9cb = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "brGetOperatorTeam") ]](ent);
            }
        }
        var_9e06d56df7f6385f = "mp";
        var_8406c878f4fc7dda = "mp_killstreak";
        var_127d392e2057f2b0 = streakname;
        dialog = streakname + "_static_crash";
        eventref = game["dialog"][dialog];
        if (!isdefined(eventref)) {
            game["dialog"][dialog] = "killstreak_remote_operator_static";
            eventref = "killstreak_remote_operator_static";
        }
        charactertype = streakname;
        if (isdefined(var_be776ca84bc2eb95)) {
            charactertype = streakname + "_" + var_be776ca84bc2eb95;
        }
        var_817b24cc21ede559 = function_c1309ee7d6ecc444(charactertype, var_da8cec9bce12f9cb);
        if (!isdefined(var_817b24cc21ede559)) {
            /#
                iprintln("<unknown string>");
            #/
            return;
        }
        dialogalias = function_b847c6a9ca912337(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref);
        dialogalias = tolower(dialogalias);
        ent queuedialogforplayer(dialogalias, dialog, 1);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ac
// Size: 0x234
function playkillstreakoperatordialog(streakname, dialog, var_db68eeda63af9504, delaytime, var_be776ca84bc2eb95) {
    if (istrue(level.disableannouncer)) {
        return;
    }
    if (!isdefined(game["dialog"][dialog])) {
        /#
            iprintln("<unknown string>" + dialog + "<unknown string>");
        #/
        return;
    }
    var_8e40f8e8dcc635a6 = undefined;
    if (isplayer(self)) {
        var_8e40f8e8dcc635a6 = self;
    } else if (isdefined(self.owner)) {
        var_8e40f8e8dcc635a6 = self.owner;
    }
    if (isdefined(delaytime) && delaytime > 0) {
        var_8e40f8e8dcc635a6 endon("disconnect");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    if (isdefined(var_8e40f8e8dcc635a6)) {
        if (istrue(var_8e40f8e8dcc635a6.var_30dc7dfd9be2a276)) {
            return;
        }
        if (!isdefined(var_8e40f8e8dcc635a6.currentkillstreakopvo) || istrue(var_db68eeda63af9504)) {
            var_da8cec9bce12f9cb = var_8e40f8e8dcc635a6.pers["team"];
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "brGetOperatorTeam")) {
                    var_da8cec9bce12f9cb = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "brGetOperatorTeam") ]](var_8e40f8e8dcc635a6);
                }
            }
            if (streakname == "emp") {
                streakname = "emp_plane";
            }
            var_9e06d56df7f6385f = "mp";
            var_8406c878f4fc7dda = function_bbb77dc4e14dcfcc(streakname);
            var_127d392e2057f2b0 = streakname;
            eventref = game["dialog"][dialog];
            var_817b24cc21ede559 = streakname;
            if (isdefined(var_be776ca84bc2eb95)) {
                var_817b24cc21ede559 = streakname + "_" + var_be776ca84bc2eb95;
            }
            var_817b24cc21ede559 = function_c1309ee7d6ecc444(var_817b24cc21ede559, var_da8cec9bce12f9cb);
            if (!isdefined(var_817b24cc21ede559)) {
                /#
                    iprintln("<unknown string>");
                #/
                return;
            }
            dialogalias = function_b847c6a9ca912337(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref);
            if (getdvarint(@"hash_cda8c6774f4bd53c", 1) && function_5b0451cdda5803e8(streakname)) {
                dialogalias = function_cb073025f309906a(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref);
            }
            dialogalias = tolower(dialogalias);
            var_8e40f8e8dcc635a6 queuedialogforplayer(dialogalias, dialog, 1);
            var_8e40f8e8dcc635a6.currentkillstreakopvo = dialog;
            var_8e40f8e8dcc635a6 thread clearstoredkillstreakoperatordialog(5);
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x24e7
// Size: 0x63
function private function_b700e27df756bafb(team) {
    var_4fdf99c19de6454 = isdefined(team) && array_contains(level.teamnamelist, team);
    if (!istrue(var_4fdf99c19de6454)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    var_45b199a5b0c05e80 = "SpecGru";
    if (team == "axis") {
        var_45b199a5b0c05e80 = "KorTac";
    }
    return var_45b199a5b0c05e80;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2552
// Size: 0x21a
function private function_c1309ee7d6ecc444(charactertype, var_da8cec9bce12f9cb) {
    teamref = function_b700e27df756bafb(var_da8cec9bce12f9cb);
    if (!isdefined(teamref)) {
        return;
    }
    var_702e4071a6ba1825 = undefined;
    switch (charactertype) {
    case #"hash_27002778019fb447":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
    case #"hash_e51f2e3d5cdd8ed8":
        var_702e4071a6ba1825 = "UAV Operator";
        break;
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_2289ec11d77bce8f":
    case #"hash_28d0236400e33fd0":
    case #"hash_4ad475e6e15635bd":
    case #"hash_56979e0566996b2e":
    case #"hash_887ad77192b9c4fb":
    case #"hash_de3d319cd367bcba":
        var_702e4071a6ba1825 = "Helo Pilot";
        break;
    case #"hash_7a687f6a4d685110":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_a1031216158c7882":
    case #"hash_cf0ef5bef19a311b":
        var_702e4071a6ba1825 = "Drone Pilot";
        break;
    case #"hash_4220be38a5f150b8":
    case #"hash_8c766d6477287bb6":
    case #"hash_b161e185f1b8e117":
        var_702e4071a6ba1825 = "Airstrike Pilot";
        break;
    case #"hash_5735de454adee67b":
        var_702e4071a6ba1825 = "Chopper Pilot";
        break;
    case #"hash_349713b5ad494dda":
        var_702e4071a6ba1825 = "Chopper Gunner";
        break;
    case #"hash_659acc60bd11cb8e":
        var_702e4071a6ba1825 = "Gunship Pilot";
        break;
    case #"hash_4a2b7af7e8ddbb45":
        var_702e4071a6ba1825 = "Gunship Nav";
        break;
    case #"hash_413c38e72fe8b5bf":
        var_702e4071a6ba1825 = "Gunship Sensor";
        break;
    case #"hash_b4ac3581c343a029":
        var_702e4071a6ba1825 = "Mortar Gunner";
        break;
    case #"hash_49b9f9219b968090":
    case #"hash_ed469a6bfff6b265":
        var_702e4071a6ba1825 = "EMP Plane Pilot";
        break;
    case #"hash_6362d6aae3e5a62e":
        var_702e4071a6ba1825 = "Drone Swarm Operator";
        break;
    }
    var_d5c2e956cfeeea74 = undefined;
    if (isdefined(var_702e4071a6ba1825)) {
        var_d5c2e956cfeeea74 = teamref + " " + var_702e4071a6ba1825;
    }
    return var_d5c2e956cfeeea74;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2774
// Size: 0x2cb
function function_8959c1606f65e65(streakname, dialog) {
    if (istrue(level.disableannouncer)) {
        return;
    }
    if (istrue(level.showingfinalkillcam)) {
        return;
    }
    if (isdefined(level.gulag) && istrue(level.gulag.var_7d2261a38e79508d) && isdefined(self) && (istrue(self.jailed) || istrue(self.gulagarena) || istrue(self.gulag))) {
        return;
    }
    if (!isdefined(game["dialog"][dialog])) {
        /#
            iprintln("<unknown string>" + dialog + "<unknown string>");
        #/
        return;
    }
    var_33bd3e1da831f24b = self;
    if (!isplayer(self)) {
        if (isdefined(self.owner)) {
            var_33bd3e1da831f24b = self.owner;
        } else {
            return;
        }
    }
    if (isdefined(var_33bd3e1da831f24b)) {
        if (istrue(var_33bd3e1da831f24b.var_30dc7dfd9be2a276)) {
            return;
        }
        var_da8cec9bce12f9cb = var_33bd3e1da831f24b.pers["team"];
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "brGetOperatorTeam")) {
                var_da8cec9bce12f9cb = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "brGetOperatorTeam") ]](var_33bd3e1da831f24b);
            }
        }
        var_9e06d56df7f6385f = "mp";
        var_8406c878f4fc7dda = function_bbb77dc4e14dcfcc(streakname);
        var_127d392e2057f2b0 = streakname;
        eventref = game["dialog"][dialog];
        var_817b24cc21ede559 = function_d3c62d251d2af8e6(var_da8cec9bce12f9cb);
        if (!isdefined(var_817b24cc21ede559) || !function_3f64deb57a4966b2(var_817b24cc21ede559)) {
            /#
                iprintln("<unknown string>");
            #/
            return;
        }
        if (streakname == "remote_turret") {
            var_127d392e2057f2b0 = "sentry_gun";
        }
        dialogalias = function_b847c6a9ca912337(var_9e06d56df7f6385f, var_8406c878f4fc7dda, var_127d392e2057f2b0, var_817b24cc21ede559, eventref);
        dialogalias = tolower(dialogalias);
        if (streakname == "emp") {
            character = tolower(namespace_d2b94521fd636348::function_309f1876dda94360("Character", var_817b24cc21ede559));
            if (eventref == "killstreak_team_leader_earned") {
                dialogalias = "dx_mp_core_anno_" + character + "_cere";
            } else if (dialog == "emp_teamleader_enemy_inbound") {
                dialogalias = "dx_mp_core_anno_" + character + "_ceho";
            }
        } else if (streakname == "drone_swarm" && dialog == "drone_swarm_teamleader_enemy_inbound") {
            character = tolower(namespace_d2b94521fd636348::function_309f1876dda94360("Character", var_817b24cc21ede559));
            dialogalias = "dx_mp_core_anno_" + character + "_cdre";
            if (character == "spet") {
                dialogalias = dialogalias + "_01";
            }
        }
        group = undefined;
        if (function_d03495fe6418377b(dialog)) {
            group = "killstreak_earned";
            dialog = function_f28fd66285fa2c9(dialog);
        }
        var_33bd3e1da831f24b queuedialogforplayer(dialogalias, dialog, 2, group);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a46
// Size: 0x2e
function private function_bbb77dc4e14dcfcc(streakname) {
    var_8406c878f4fc7dda = "mp_killstreak";
    if (streakname == "radar_drone_recon") {
        var_8406c878f4fc7dda = "mp_fieldupgrade";
    }
    return var_8406c878f4fc7dda;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a7c
// Size: 0x3b
function private clearstoredkillstreakoperatordialog(delaytime) {
    self endon("disconnect");
    self notify("clear_stored_dialog");
    self endon("clear_stored_dialog");
    wait(delaytime);
    if (isdefined(self.currentkillstreakopvo)) {
        self.currentkillstreakopvo = undefined;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abe
// Size: 0x37c
function playkillstreakusedialog(streakname) {
    if (istrue(level.disableannouncer)) {
        return;
    }
    var_8e40f8e8dcc635a6 = undefined;
    if (isplayer(self)) {
        var_8e40f8e8dcc635a6 = self;
    } else if (isdefined(self.owner)) {
        var_8e40f8e8dcc635a6 = self.owner;
    }
    var_18f54c6ea626767c = var_8e40f8e8dcc635a6.pers["team"];
    if (level.teambased) {
        if (isdefined(level.killstreakactivatedtime[streakname])) {
            if (isdefined(level.killstreakactivatedtime[streakname][var_18f54c6ea626767c])) {
                if (gettime() < level.killstreakactivatedtime[streakname][var_18f54c6ea626767c]) {
                    return;
                }
            }
        }
        if (isdefined(level.killstreakactivatedtime[streakname])) {
            level.killstreakactivatedtime[streakname][var_18f54c6ea626767c] = gettime() + 10000;
        }
    }
    excludelist = [0:var_8e40f8e8dcc635a6];
    var_fb21d338e5d7b128 = level.players;
    if (level.teambased) {
        var_391f9e326c32fa8a = var_8e40f8e8dcc635a6 getothersplitscreenplayer();
        if (isdefined(var_391f9e326c32fa8a)) {
            excludelist[excludelist.size] = var_391f9e326c32fa8a;
        }
        var_cd8547bf474ab0c4 = canplaykillstreakdialog(streakname, 1);
        var_53934037d8efc459 = canplaykillstreakdialog(streakname);
        if (istrue(var_cd8547bf474ab0c4)) {
            if (istrue(level.var_e1e56c150c2dbc72)) {
                var_fb21d338e5d7b128 = var_8e40f8e8dcc635a6 namespace_ca7b90256548aa40::getsquadmembers(undefined, 1);
            } else if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
                var_fb21d338e5d7b128 = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](var_18f54c6ea626767c, "players");
            }
            foreach (player in var_fb21d338e5d7b128) {
                if (array_contains(excludelist, player)) {
                    excludelist = array_remove(excludelist, player);
                } else {
                    player function_8959c1606f65e65(streakname, streakname + "_teamleader_friendly_inbound");
                }
            }
        }
        if (istrue(var_53934037d8efc459)) {
            foreach (entry in level.teamnamelist) {
                if (entry == var_18f54c6ea626767c) {
                    continue;
                }
                if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getTeamData")) {
                    var_fb21d338e5d7b128 = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getTeamData") ]](entry, "players");
                }
                foreach (player in var_fb21d338e5d7b128) {
                    if (isdefined(excludelist) && array_contains(excludelist, player)) {
                        excludelist = array_remove(excludelist, player);
                    } else {
                        player function_8959c1606f65e65(streakname, streakname + "_teamleader_enemy_inbound");
                    }
                }
            }
        }
    } else {
        foreach (player in var_fb21d338e5d7b128) {
            if (array_contains(excludelist, player)) {
                continue;
            }
            player function_8959c1606f65e65(streakname, streakname + "_teamleader_enemy_inbound");
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e41
// Size: 0x1c1
function canplaykillstreakdialog(streakname, friendly) {
    var_bff1e3c9ba212857 = 1;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        if (istrue(friendly)) {
            switch (streakname) {
            case #"hash_4d35eb58f9d545f0":
            case #"hash_4d5aa76e8707f47b":
            case #"hash_56979e0566996b2e":
            case #"hash_9e36e3bd3a9dd00d":
                var_bff1e3c9ba212857 = 0;
                break;
            }
        } else {
            switch (streakname) {
            case #"hash_27002778019fb447":
            case #"hash_4d35eb58f9d545f0":
            case #"hash_4d5aa76e8707f47b":
            case #"hash_56979e0566996b2e":
            case #"hash_634b246c3da5c56f":
            case #"hash_8c766d6477287bb6":
            case #"hash_9e36e3bd3a9dd00d":
            case #"hash_b4ac3581c343a029":
            case #"hash_e171e5b86ef0a4cc":
            case #"hash_e40585107590f016":
                var_bff1e3c9ba212857 = 0;
                break;
            }
        }
    } else if (namespace_36f464722d326bbe::function_22cd3d64fdb05892()) {
        if (istrue(friendly)) {
            switch (streakname) {
            case #"hash_4d35eb58f9d545f0":
            case #"hash_4d5aa76e8707f47b":
            case #"hash_56979e0566996b2e":
            case #"hash_9e36e3bd3a9dd00d":
                var_bff1e3c9ba212857 = 0;
                break;
            }
        } else {
            switch (streakname) {
            case #"hash_4d35eb58f9d545f0":
            case #"hash_56979e0566996b2e":
            case #"hash_9e36e3bd3a9dd00d":
            case #"hash_b161e185f1b8e117":
            case #"hash_e40585107590f016":
                var_bff1e3c9ba212857 = 0;
                break;
            }
        }
    } else if (istrue(friendly)) {
        var_bff1e3c9ba212857 = 1;
    } else {
        switch (streakname) {
        case #"hash_b161e185f1b8e117":
            var_bff1e3c9ba212857 = 0;
            break;
        }
    }
    return var_bff1e3c9ba212857;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x300a
// Size: 0x5
function getkillstreakdialogcooldown() {
    return 10;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3017
// Size: 0x3f
function function_ac7849e6c5020da0(streakname) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[streakname];
    if (!isdefined(bundle)) {
        return 0;
    }
    return istrue(bundle.var_e408b79ae78f84bc);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x305e
// Size: 0x323
function killstreak_dangernotifyplayersinrange(owner, ownerteam, range, streakname, location) {
    if (!isdefined(streakname)) {
        return;
    }
    var_817c84503edead03 = function_7813d0917a42fb04(streakname);
    if (!var_817c84503edead03) {
        return;
    }
    /#
        if (getdvarint(@"hash_d218c959e1a09e1d", 0)) {
            start = location + (0, 0, 1000);
            end = location + (0, 0, -1000);
            cylinder(start, end, range, (1, 0, 0), 1, 500);
        }
    #/
    var_6e7b34fc3e0f199 = 0;
    if (streakname == "uav" || streakname == "directional_uav") {
        var_6e7b34fc3e0f199 = 1;
    }
    var_d937d9fbfeed2e24 = namespace_36f464722d326bbe::isbrstylegametype();
    if (var_d937d9fbfeed2e24 && (streakname == "uav" || streakname == "directional_uav")) {
        var_494960b847d2b593 = [];
        if (!isdefined(location)) {
            location = owner.origin;
        }
        var_65f126647dd20813 = level.teamdata[ownerteam]["alivePlayers"];
        foreach (p in var_65f126647dd20813) {
            if (p != owner) {
                var_494960b847d2b593[var_494960b847d2b593.size] = p;
            }
        }
        var_e7c0ffd00e9cfe51 = utility::playersincylinder(location, range, var_494960b847d2b593);
        foreach (p in var_e7c0ffd00e9cfe51) {
            var_494960b847d2b593[var_494960b847d2b593.size] = p;
        }
        foreach (p in var_494960b847d2b593) {
            if (!isdefined(p) || isagent(p) || !p _isalive() || p _isalive() && istrue(p.gulag)) {
                continue;
            }
            if (issharedfuncdefined("killstreak", "dangerNotifyPlayer")) {
                [[ getsharedfunc("killstreak", "dangerNotifyPlayer") ]](p, streakname, undefined, p.team == owner.team);
            }
        }
    } else {
        playersinrange = function_c1236c65472ee948(owner, ownerteam, location, range, var_6e7b34fc3e0f199, streakname);
        foreach (player in playersinrange) {
            function_7abec5ff1c445e2b(player, streakname);
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3388
// Size: 0x54
function function_266521b0b26cc543(owner, player, streakname) {
    if (!isdefined(streakname)) {
        return;
    }
    var_817c84503edead03 = function_7813d0917a42fb04(streakname);
    if (!var_817c84503edead03) {
        return;
    }
    if (owner == player && !function_55a9c42f477b156(streakname)) {
        return;
    }
    function_7abec5ff1c445e2b(player, streakname);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33e3
// Size: 0x10e
function private function_7813d0917a42fb04(streakname) {
    var_817c84503edead03 = 0;
    var_d937d9fbfeed2e24 = namespace_36f464722d326bbe::isbrstylegametype();
    var_490dc70d342b04a2 = namespace_36f464722d326bbe::function_22cd3d64fdb05892();
    if (var_d937d9fbfeed2e24) {
        switch (streakname) {
        case #"hash_27002778019fb447":
        case #"hash_4d35eb58f9d545f0":
        case #"hash_4d5aa76e8707f47b":
        case #"hash_634b246c3da5c56f":
        case #"hash_80c5f88142053bf4":
        case #"hash_8c766d6477287bb6":
        case #"hash_9e36e3bd3a9dd00d":
        case #"hash_b4ac3581c343a029":
        case #"hash_e171e5b86ef0a4cc":
        case #"hash_e40585107590f016":
            var_817c84503edead03 = 1;
            break;
        }
    } else if (var_490dc70d342b04a2) {
        switch (streakname) {
        case #"hash_4d35eb58f9d545f0":
        case #"hash_9e36e3bd3a9dd00d":
        case #"hash_e40585107590f016":
            var_817c84503edead03 = 1;
            break;
        }
    } else {
        var_817c84503edead03 = function_ac7849e6c5020da0(streakname);
    }
    return var_817c84503edead03;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34f9
// Size: 0x68
function private function_7abec5ff1c445e2b(player, streakname) {
    var_d937d9fbfeed2e24 = namespace_36f464722d326bbe::isbrstylegametype();
    if (var_d937d9fbfeed2e24 || function_ac7849e6c5020da0(streakname)) {
        if (issharedfuncdefined("killstreak", "dangerNotifyPlayer")) {
            [[ getsharedfunc("killstreak", "dangerNotifyPlayer") ]](player, streakname);
        }
    } else {
        function_7585eeda84603d89(player, streakname);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3568
// Size: 0xdf
function function_7585eeda84603d89(player, var_1022173ea86a7090) {
    var_beb9e876857446fc = 1;
    if (isdefined(level.var_5a81cd5a6ae1c552) && isdefined(level.var_ed3bbed90e848793)) {
        if (isdefined(level.var_ed3bbed90e848793[var_1022173ea86a7090]) && isdefined(level.var_ed3bbed90e848793[var_1022173ea86a7090][player.guid]) && gettime() < level.var_ed3bbed90e848793[var_1022173ea86a7090][player.guid]) {
            var_beb9e876857446fc = 0;
        } else {
            level.var_ed3bbed90e848793[var_1022173ea86a7090][player.guid] = gettime() + level.var_5a81cd5a6ae1c552 * 1000;
        }
    }
    if (istrue(var_beb9e876857446fc) && isdefined(var_1022173ea86a7090) && function_ce1a9c6c9043809f(var_1022173ea86a7090)) {
        player namespace_9abe40d2af041eb2::function_8959c1606f65e65(var_1022173ea86a7090, var_1022173ea86a7090 + "_teamleader_enemy_inbound");
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x364e
// Size: 0x46
function private function_55a9c42f477b156(streakname) {
    if (!isdefined(streakname)) {
        return 0;
    }
    if (!istrue(level.var_6e488f8ea3d98872)) {
        return 0;
    }
    if (streakname == "toma_strike" || streakname == "precision_airstrike" || streakname == "bunker_buster") {
        return 1;
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x369c
// Size: 0x1c2
function private function_c1236c65472ee948(owner, ownerteam, location, range, var_6e7b34fc3e0f199, streakname) {
    var_4f152ad6a2c5331f = [];
    var_926ed5f85fdb6b34 = [];
    if (!isdefined(range)) {
        range = 5000;
    }
    if (isdefined(owner)) {
        if (!function_55a9c42f477b156(streakname)) {
            var_926ed5f85fdb6b34 = [0:owner];
        }
        if (level.teambased) {
            if (function_55a9c42f477b156(streakname)) {
                var_926ed5f85fdb6b34 = [];
                foreach (player in level.teamdata[ownerteam]["players"]) {
                    if (player != owner) {
                        var_926ed5f85fdb6b34[var_926ed5f85fdb6b34.size] = player;
                    }
                }
            } else {
                var_926ed5f85fdb6b34 = level.teamdata[ownerteam]["players"];
            }
        }
        if (!isdefined(location)) {
            location = owner.origin;
        }
        if (istrue(var_6e7b34fc3e0f199)) {
            foreach (player in var_926ed5f85fdb6b34) {
                var_399dead7db0f7ab = function_7fbde10147e5b269(player.origin, range, var_926ed5f85fdb6b34, var_4f152ad6a2c5331f);
                var_4f152ad6a2c5331f = array_combine(var_4f152ad6a2c5331f, var_399dead7db0f7ab);
            }
        } else {
            var_4f152ad6a2c5331f = function_7fbde10147e5b269(location, range, var_926ed5f85fdb6b34);
        }
    } else {
        if (!isdefined(location)) {
            /#
                iprintln("<unknown string>");
            #/
            return var_4f152ad6a2c5331f;
        }
        var_4f152ad6a2c5331f = function_7fbde10147e5b269(location, range);
    }
    return var_4f152ad6a2c5331f;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3866
// Size: 0xe4
function function_7fbde10147e5b269(location, range, var_926ed5f85fdb6b34, var_3bfcc99e8967473f) {
    var_37d7886608227391 = [];
    var_e7c0ffd00e9cfe51 = utility::playersincylinder(location, range, var_926ed5f85fdb6b34);
    foreach (enemyplayer in var_e7c0ffd00e9cfe51) {
        if (!isdefined(enemyplayer) || isbot(enemyplayer) || isagent(enemyplayer) || !enemyplayer _isalive() || enemyplayer _isalive() && istrue(enemyplayer.gulag)) {
            continue;
        }
        if (function_f62830c98ee6a880(enemyplayer, var_3bfcc99e8967473f)) {
            continue;
        }
        var_37d7886608227391[var_37d7886608227391.size] = enemyplayer;
    }
    return var_37d7886608227391;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3952
// Size: 0x89
function private function_f62830c98ee6a880(enemyplayer, var_3bfcc99e8967473f) {
    if (!isdefined(var_3bfcc99e8967473f) || var_3bfcc99e8967473f.size == 0) {
        return 0;
    }
    var_84021bc9dbe22e9 = 0;
    foreach (var_fffcb11a16d147f6 in var_3bfcc99e8967473f) {
        if (isdefined(var_fffcb11a16d147f6) && var_fffcb11a16d147f6 == enemyplayer) {
            var_84021bc9dbe22e9 = 1;
            break;
        }
    }
    return var_84021bc9dbe22e9;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e3
// Size: 0xd9
function killstreak_createdangerzone(location, radius, height, timeout, owner, team) {
    if (issharedfuncdefined("game", "lpcFeatureGated") && [[ getsharedfunc("game", "lpcFeatureGated") ]]()) {
        return;
    }
    killstreak_destroydangerzone();
    dangerzoneid = undefined;
    if (isdefined(owner) && isdefined(team)) {
        dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](location, radius, height, team, timeout, owner, 1);
    } else if (isdefined(team)) {
        dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](location, radius, height, team, timeout, undefined, 1);
    } else {
        dangerzoneid = killstreak_spawnuniversaldangerzone(location, radius, height, timeout);
    }
    self.dangerzoneid = dangerzoneid;
    return dangerzoneid;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac4
// Size: 0x80
function killstreak_spawnuniversaldangerzone(location, radius, height, timeout) {
    if (!issharedfuncdefined("spawn", "addSpawnDangerZone")) {
        return;
    }
    dangerzoneid = [[ getsharedfunc("spawn", "addSpawnDangerZone") ]](location, radius, height, undefined, timeout, level.players[randomint(level.players.size)], 1);
    self.dangerzoneid = dangerzoneid;
    return dangerzoneid;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4c
// Size: 0x94
function killstreak_destroydangerzone(dangerzoneid) {
    if (!isdefined(dangerzoneid) && !isdefined(self.dangerzoneid)) {
        return;
    }
    if (!issharedfuncdefined("spawn", "isSpawnDangerZoneAlive") || !issharedfuncdefined("spawn", "removeSpawnDangerZone")) {
        return;
    }
    if (!isdefined(dangerzoneid)) {
        dangerzoneid = self.dangerzoneid;
    }
    if (isdefined(dangerzoneid) && [[ getsharedfunc("spawn", "isSpawnDangerZoneAlive") ]](dangerzoneid)) {
        [[ getsharedfunc("spawn", "removeSpawnDangerZone") ]](dangerzoneid);
    }
    self.dangerzoneid = undefined;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x3be7
// Size: 0x116
function function_b68537eebdc298f1(var_7b59b41b01684053, iconname, owner, zoffset, lifetime, scriptablename) {
    var_49c86a2f36f739a0 = spawn("script_model", var_7b59b41b01684053);
    var_49c86a2f36f739a0.icon = iconname;
    var_49c86a2f36f739a0.owner = owner;
    if (!isdefined(zoffset)) {
        zoffset = 50;
    }
    var_49c86a2f36f739a0.zoffset = zoffset;
    if (!isdefined(lifetime)) {
        lifetime = 5;
    }
    var_49c86a2f36f739a0.lifetime = lifetime;
    modelname = "tag_origin";
    if (isdefined(scriptablename)) {
        modelname = scriptablename;
        var_49c86a2f36f739a0.scriptable = scriptablename;
    }
    var_49c86a2f36f739a0 setmodel(modelname);
    var_49c86a2f36f739a0 setotherent(owner);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
        var_49c86a2f36f739a0.objidnum = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID") ]](99);
    }
    var_49c86a2f36f739a0 function_f834e6b9fb11e9c0(var_49c86a2f36f739a0.objidnum);
    var_49c86a2f36f739a0 thread function_a6801238f6a7b430();
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d04
// Size: 0xbd
function private function_f834e6b9fb11e9c0(objid) {
    icon = self.icon;
    owner = self.owner;
    zoffset = self.zoffset;
    objective_icon(objid, icon);
    objective_showtoplayersinmask(objid);
    objective_addclienttomask(objid, owner);
    objective_onentity(objid, self);
    objective_setzoffset(objid, zoffset);
    objective_setplayintro(objid, 0);
    objective_setplayoutro(objid, 0);
    objective_setbackground(objid, 1);
    if (level.teambased) {
        objective_setownerteam(objid, owner.team);
    } else {
        objective_setownerclient(objid, owner);
    }
    objective_state(objid, "current");
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dc8
// Size: 0x80
function private function_a6801238f6a7b430() {
    self endon("death");
    lifetime = self.lifetime;
    if (isdefined(self.scriptable)) {
        self setscriptablepartstate("target", "on", 0);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(lifetime);
    if (isdefined(self)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](self.objidnum);
        }
        self delete();
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e4f
// Size: 0x54
function streakcanseetarget(startpos, endpos, ignorelist) {
    var_27b697504d9397d = 0;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0);
    if (namespace_2a184fc4902783dc::ray_trace_passed(startpos, endpos, ignorelist, contents)) {
        var_27b697504d9397d = 1;
    }
    return var_27b697504d9397d;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eab
// Size: 0x390
function function_999fe3838d6b6f8c(var_cdbb4a9588abef59, startingangles, var_4d5392d9a61722c2, var_90006566b6c97518) {
    setdvarifuninitialized(@"hash_313823a110b35022", 0);
    var_fda870b32ab92c1f = (0, startingangles[1], 0);
    var_546c919e9a86216b = anglestoforward(var_fda870b32ab92c1f);
    var_ca8604d07949e4ec = anglestoright(var_fda870b32ab92c1f);
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    if (!isdefined(var_90006566b6c97518)) {
        var_90006566b6c97518 = 15000;
    }
    var_f74f18c717b149e2 = [0:var_cdbb4a9588abef59 - var_546c919e9a86216b * var_90006566b6c97518, 1:var_cdbb4a9588abef59 + var_546c919e9a86216b * var_90006566b6c97518, 2:var_cdbb4a9588abef59 + var_ca8604d07949e4ec * var_90006566b6c97518, 3:var_cdbb4a9588abef59 - var_ca8604d07949e4ec * var_90006566b6c97518, 4:var_cdbb4a9588abef59 + (var_546c919e9a86216b + var_ca8604d07949e4ec) * var_90006566b6c97518, 5:var_cdbb4a9588abef59 + (var_546c919e9a86216b - var_ca8604d07949e4ec) * var_90006566b6c97518, 6:var_cdbb4a9588abef59 + (var_ca8604d07949e4ec - var_546c919e9a86216b) * var_90006566b6c97518, 7:var_cdbb4a9588abef59 + (-1 * var_546c919e9a86216b - var_ca8604d07949e4ec) * var_90006566b6c97518];
    if (!isdefined(var_4d5392d9a61722c2)) {
        var_4d5392d9a61722c2 = 512;
    }
    flightpath = spawnstruct();
    flightpath.start = var_cdbb4a9588abef59;
    flightpath.end = undefined;
    flightpath.angles = undefined;
    var_b1756ac4c804ebd5 = getdvarint(@"hash_313823a110b35022", 0);
    foreach (var_f9567f37db523f7a in var_f74f18c717b149e2) {
        var_7a7426e42e674e40 = vectornormalize(var_f9567f37db523f7a - var_cdbb4a9588abef59);
        var_d0a37479b866d030 = var_cdbb4a9588abef59 + var_7a7426e42e674e40 * var_90006566b6c97518;
        traceresult = namespace_2a184fc4902783dc::sphere_trace(var_cdbb4a9588abef59, var_d0a37479b866d030, var_4d5392d9a61722c2, undefined, contents);
        if (isdefined(traceresult) && isdefined(traceresult["hittype"]) && traceresult["hittype"] != "hittype_none") {
            var_5ff285f0d96242c7 = traceresult["position"];
            var_5f6a36f9c4145ee6 = var_90006566b6c97518 * 0.75;
            var_85e2353ae8a81b3a = var_5f6a36f9c4145ee6 * var_5f6a36f9c4145ee6;
            if (distance2dsquared(var_cdbb4a9588abef59, var_5ff285f0d96242c7) >= var_85e2353ae8a81b3a) {
                var_fda870b32ab92c1f = vectortoangles(var_f9567f37db523f7a - var_cdbb4a9588abef59);
                forwarddir = anglestoforward(var_fda870b32ab92c1f);
                var_abad2d1e0b91c9ba = distance2d(var_f9567f37db523f7a, var_5ff285f0d96242c7);
                flightpath.end = var_f9567f37db523f7a - forwarddir * var_abad2d1e0b91c9ba;
                flightpath.angles = var_fda870b32ab92c1f;
                /#
                    if (var_b1756ac4c804ebd5) {
                        level thread namespace_f2ffc0540883e1ad::drawline(var_cdbb4a9588abef59, var_f9567f37db523f7a, 30, (1, 1, 0));
                        level thread namespace_f2ffc0540883e1ad::drawsphere(var_5ff285f0d96242c7, 50, 30, (1, 1, 0));
                        level thread namespace_f2ffc0540883e1ad::drawsphere(flightpath.end, 50, 30, (0, 1, 0));
                    }
                #/
                break;
            }
            /#
                if (var_b1756ac4c804ebd5) {
                    level thread namespace_f2ffc0540883e1ad::drawline(var_cdbb4a9588abef59, var_f9567f37db523f7a, 30, (1, 0, 0));
                    level thread namespace_f2ffc0540883e1ad::drawsphere(var_5ff285f0d96242c7, 50, 30, (1, 0, 0));
                }
            #/
            continue;
        } else {
            /#
                if (var_b1756ac4c804ebd5) {
                    level thread namespace_f2ffc0540883e1ad::drawline(var_cdbb4a9588abef59, var_f9567f37db523f7a, 30, (0, 1, 0));
                }
            #/
        }
        flightpath.end = var_f9567f37db523f7a;
        flightpath.angles = vectortoangles(var_f9567f37db523f7a - var_cdbb4a9588abef59);
        break;
    }
    return flightpath;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4243
// Size: 0x1c0
function function_e68434bdb941ed1e(streakname, var_9cbbc426be64a21a, hintstring, var_13c7df650c45a90b, var_efe526bf6a23d275) {
    if (!isdefined(self.owner)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    if (!isdefined(var_9cbbc426be64a21a.var_c112b4aeaf6ce9ae)) {
        var_9cbbc426be64a21a.var_c112b4aeaf6ce9ae = [];
        level thread function_5180e13c7ef6e8e2(var_9cbbc426be64a21a);
    }
    if (!isdefined(function_ba2553e1d254532e(streakname, var_9cbbc426be64a21a))) {
        useobj = spawn("script_model", self.origin);
        useobj setmodel("tag_origin");
        useobj linkto(self, function_8e620817af96d5e(streakname), (0, 0, 0), (0, 0, 0));
        useobj.owner = var_9cbbc426be64a21a;
        useobj.streakname = streakname;
        useobj.var_83b25e20c32fd3e9 = 0;
        useobj.parentent = self;
        useobj.var_59f4b576f611fb4a = 0;
        useobj.var_89530ba56809ec76 = 0;
        if (istrue(var_13c7df650c45a90b)) {
            useobj.var_89530ba56809ec76 = 1;
        }
        if (issharedfuncdefined("killstreak", "setKillstreakControlPriority")) {
            useobj [[ getsharedfunc("killstreak", "setKillstreakControlPriority") ]](var_9cbbc426be64a21a, hintstring, 360, 360, 65535, 65535, 1, 1);
        }
        var_9cbbc426be64a21a.var_c112b4aeaf6ce9ae[streakname] = useobj;
        if (streakname == "hover_jet") {
            if (!istrue(var_9cbbc426be64a21a.var_3b28db27cbdbc523)) {
                function_6ada614d8209afb0(useobj);
            }
        } else {
            function_6ada614d8209afb0(useobj);
        }
        level thread function_8b29ae6ad84b5bf2(useobj);
        level thread function_cdeddff1537455f5(useobj);
        self.useobj = useobj;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x440a
// Size: 0x14b
function private function_5180e13c7ef6e8e2(owner) {
    owner endon("disconnect");
    level endon("game_ended");
    /#
        setdevdvarifuninitialized(@"hash_c2417142804c1c76", 0);
    #/
    var_a0a13709b751ba26 = getdvarint(@"hash_c2417142804c1c76", 0);
    if (!istrue(var_a0a13709b751ba26)) {
        return;
    }
    while (1) {
        var_99cd5e83081cf893 = owner.var_c112b4aeaf6ce9ae;
        var_2e6169ddef8528bc = undefined;
        bestdistance = undefined;
        foreach (useobj in var_99cd5e83081cf893) {
            if (isdefined(useobj)) {
                if (function_d21cbd391e26dc69(useobj)) {
                    if (!isdefined(bestdistance)) {
                        bestdistance = distance2dsquared(useobj.origin, owner getvieworigin());
                        var_2e6169ddef8528bc = useobj;
                    } else {
                        var_1003b817e555135a = distance2dsquared(useobj.origin, owner getvieworigin());
                        if (var_1003b817e555135a < bestdistance) {
                            bestdistance = var_1003b817e555135a;
                            var_2e6169ddef8528bc = useobj;
                        }
                    }
                }
            }
        }
        if (isdefined(var_2e6169ddef8528bc)) {
            if (!function_c2917d8b2264d8ac(var_2e6169ddef8528bc)) {
                function_6ada614d8209afb0(var_2e6169ddef8528bc, 1);
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x455c
// Size: 0xe0
function private function_6ada614d8209afb0(useobj, highlight) {
    if (isdefined(useobj)) {
        owner = useobj.owner;
        if (isdefined(owner)) {
            function_8119afac7789ef49(owner);
            if (owner namespace_53fc9ddbb516e6e1::function_c4d8558fc1592cd6()) {
                var_ad1bd6904a1e2ee6 = function_e36773e138b55c8d(owner);
                if (isdefined(var_ad1bd6904a1e2ee6)) {
                    var_ad1bd6904a1e2ee6.var_59f4b576f611fb4a = 0;
                    var_ad1bd6904a1e2ee6 notify("clear_suspended_use_object");
                }
                if (!istrue(useobj.var_89530ba56809ec76)) {
                    function_3f55c1fb553a4775(owner, useobj);
                } else {
                    function_7d36b03e034c2ab1(useobj, highlight);
                }
            } else if (istrue(owner.inlaststand)) {
                var_ad1bd6904a1e2ee6 = function_e36773e138b55c8d(owner);
                if (isdefined(var_ad1bd6904a1e2ee6)) {
                    var_ad1bd6904a1e2ee6.var_59f4b576f611fb4a = 0;
                    var_ad1bd6904a1e2ee6 notify("clear_suspended_use_object");
                }
                function_3f55c1fb553a4775(owner, useobj);
            } else {
                function_7d36b03e034c2ab1(useobj, highlight);
            }
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4643
// Size: 0x2b
function private function_8119afac7789ef49(owner) {
    var_ddb5066d38ba2842 = function_bb606c9e5540fd7c(owner);
    if (isdefined(var_ddb5066d38ba2842)) {
        function_d41c2beeb4ef154e(var_ddb5066d38ba2842);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4675
// Size: 0x41
function private function_7d36b03e034c2ab1(useobj, highlight) {
    useobj enableplayeruse(useobj.owner);
    useobj.var_83b25e20c32fd3e9 = 1;
    if (istrue(highlight)) {
        useobj notify("useObj_start_highlight");
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46bd
// Size: 0x2b
function private function_d41c2beeb4ef154e(useobj) {
    useobj disableplayeruse(useobj.owner);
    useobj.var_83b25e20c32fd3e9 = 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46ef
// Size: 0x3e
function function_3f55c1fb553a4775(owner, var_80578339c2d89fe5) {
    if (!isdefined(owner) || !isplayer(owner)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    level thread function_e01c5830af200d33(owner, var_80578339c2d89fe5);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4734
// Size: 0x9f
function private function_e01c5830af200d33(owner, var_80578339c2d89fe5) {
    level endon("game_ended");
    var_ddb5066d38ba2842 = function_bb606c9e5540fd7c(owner);
    if (isdefined(var_80578339c2d89fe5)) {
        var_ddb5066d38ba2842 = var_80578339c2d89fe5;
    }
    if (isdefined(var_ddb5066d38ba2842)) {
        if (istrue(var_ddb5066d38ba2842.var_89530ba56809ec76) && owner namespace_53fc9ddbb516e6e1::function_c4d8558fc1592cd6()) {
            return;
        }
        owner endon("disconnect");
        var_ddb5066d38ba2842 notify("start_suspended_use_object");
        var_ddb5066d38ba2842 endon("start_suspended_use_object");
        var_ddb5066d38ba2842 endon("clear_suspended_use_object");
        var_ddb5066d38ba2842 endon("death");
        var_ddb5066d38ba2842.var_59f4b576f611fb4a = 1;
        function_d41c2beeb4ef154e(var_ddb5066d38ba2842);
        var_ddb5066d38ba2842 waittill("restore_global_use_object");
        function_7d36b03e034c2ab1(var_ddb5066d38ba2842);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47da
// Size: 0x38
function function_17576a4cdcd447a7(owner) {
    var_ed247742b7c53a61 = function_e36773e138b55c8d(owner);
    if (isdefined(var_ed247742b7c53a61)) {
        var_ed247742b7c53a61.var_59f4b576f611fb4a = 0;
        var_ed247742b7c53a61 notify("restore_global_use_object");
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4819
// Size: 0xc6
function private function_8b29ae6ad84b5bf2(useobj) {
    useobj endon("death");
    var_a0a13709b751ba26 = getdvarint(@"hash_c2417142804c1c76", 0);
    if (!istrue(var_a0a13709b751ba26)) {
        return;
    }
    var_2619f56748f3be6e = "outline_nodepth_useobj_";
    function_c4daa28ff838e59c(useobj, var_2619f56748f3be6e + "default");
    while (1) {
        result = useobj waittill_any_return_2("useObj_start_highlight", "useObj_stop_highlight");
        if (result == "useObj_start_highlight") {
            useobj.highlighted = 1;
            function_c4daa28ff838e59c(useobj, var_2619f56748f3be6e + "highlight");
            level childthread function_93cafec896797c8c(useobj);
        } else {
            useobj.highlighted = 0;
            function_c4daa28ff838e59c(useobj, var_2619f56748f3be6e + "default");
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x48e6
// Size: 0x69
function private function_c4daa28ff838e59c(useobj, var_4430b08d5a2d47bf) {
    function_904bace0562c3a7b(useobj);
    if (issharedfuncdefined("outline", "outlineEnableForPlayer")) {
        useobj.outlineid = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](useobj.parentent, useobj.owner, var_4430b08d5a2d47bf, "killstreak");
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4956
// Size: 0x57
function private function_904bace0562c3a7b(useobj) {
    if (isdefined(useobj.outlineid)) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](useobj.outlineid, useobj.parentent);
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49b4
// Size: 0x22
function private function_93cafec896797c8c(useobj) {
    while (function_d21cbd391e26dc69(useobj)) {
        waitframe();
    }
    useobj notify("useObj_stop_highlight");
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49dd
// Size: 0x2b
function private function_d21cbd391e26dc69(useobj) {
    return useobj.owner worldpointinreticle_circle(useobj.origin, 80, 200);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a10
// Size: 0x18
function private function_c2917d8b2264d8ac(useobj) {
    return istrue(useobj.highlighted);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a30
// Size: 0x14e
function private function_cdeddff1537455f5(useobj) {
    level endon("game_ended");
    result = useobj.parentent waittill_any_return_4("death", "explode", "leaving", "crashing");
    if (isdefined(useobj.owner)) {
        function_904bace0562c3a7b(useobj);
        useobj.owner.var_c112b4aeaf6ce9ae = array_remove_index(useobj.owner.var_c112b4aeaf6ce9ae, useobj.streakname, 1);
        if (function_926aeeddaaa0e670(useobj)) {
            var_34ca454bbec477f1 = useobj.owner.var_c112b4aeaf6ce9ae;
            if (var_34ca454bbec477f1.size > 0) {
                var_4b77dd2f3608e421 = undefined;
                foreach (var_43a69f6a01195d68 in var_34ca454bbec477f1) {
                    if (isdefined(var_43a69f6a01195d68)) {
                        var_4b77dd2f3608e421 = var_43a69f6a01195d68;
                        break;
                    }
                }
                if (isdefined(var_4b77dd2f3608e421)) {
                    function_6ada614d8209afb0(var_4b77dd2f3608e421);
                }
            }
        } else {
            function_d41c2beeb4ef154e(useobj);
        }
    }
    if (isdefined(useobj)) {
        useobj delete();
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b85
// Size: 0x59
function private function_ba2553e1d254532e(streakname, owner) {
    if (!isdefined(owner) || !isdefined(owner.var_c112b4aeaf6ce9ae)) {
        return undefined;
    }
    useobject = undefined;
    if (isdefined(owner.var_c112b4aeaf6ce9ae[streakname])) {
        useobject = owner.var_c112b4aeaf6ce9ae[streakname];
    }
    return useobject;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4be6
// Size: 0x95
function private function_bb606c9e5540fd7c(owner) {
    if (!isdefined(owner) || !isdefined(owner.var_c112b4aeaf6ce9ae)) {
        return undefined;
    }
    var_df5af15b843b92f = undefined;
    foreach (useobj in owner.var_c112b4aeaf6ce9ae) {
        if (istrue(useobj.var_83b25e20c32fd3e9)) {
            var_df5af15b843b92f = useobj;
            break;
        }
    }
    return var_df5af15b843b92f;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c83
// Size: 0x95
function private function_e36773e138b55c8d(owner) {
    if (!isdefined(owner) || !isdefined(owner.var_c112b4aeaf6ce9ae)) {
        return undefined;
    }
    var_ad1bd6904a1e2ee6 = undefined;
    foreach (useobj in owner.var_c112b4aeaf6ce9ae) {
        if (istrue(useobj.var_59f4b576f611fb4a)) {
            var_ad1bd6904a1e2ee6 = useobj;
            break;
        }
    }
    return var_ad1bd6904a1e2ee6;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d20
// Size: 0x18
function private function_926aeeddaaa0e670(useobj) {
    return istrue(useobj.var_83b25e20c32fd3e9);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d40
// Size: 0x70
function private function_8e620817af96d5e(streakname) {
    var_54100ca480291b0c = "tag_origin";
    switch (streakname) {
    case #"hash_bf2f9adbd2b41d5":
        break;
    case #"hash_cf0ef5bef19a311b":
        var_54100ca480291b0c = "tag_body";
        break;
    case #"hash_ab5712e297cd430e":
        var_54100ca480291b0c = "tag_aim_pivot";
        break;
    default:
        break;
    }
    return var_54100ca480291b0c;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4db8
// Size: 0x41
function private function_26066f7700410eaf() {
    /#
        self endon("<unknown string>");
        while (1) {
            level thread namespace_f2ffc0540883e1ad::drawsphere(self.origin, 10, 0.05, (0, 1, 0));
            wait(0.05);
        }
    #/
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e00
// Size: 0x21
function function_13276a05f9b52006(streakname) {
    return level.var_b23156d776b1d85.var_2150da9328528bb9[streakname];
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e29
// Size: 0x42
function function_d13d2a81214fbfb8(var_7eb265bced9cc450, var_a6ceb04e31f575e0) {
    self endon("disconnect");
    if (istrue(var_a6ceb04e31f575e0)) {
        thread function_af095e506de21f93();
        wait(0.05);
    }
    if (!isdefined(var_7eb265bced9cc450)) {
        var_7eb265bced9cc450 = "80_instant_noscale";
    }
    self lerpfovbypreset(var_7eb265bced9cc450);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4e72
// Size: 0x39
function private function_af095e506de21f93() {
    self endon("disconnect");
    self notify("unset_fov_scalefactor");
    self endon("unset_fov_scalefactor");
    self lerpfovscalefactor(0, 0);
    level waittill("start_game_ended");
    function_8b676f496920e2ab();
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb2
// Size: 0x29
function function_8b676f496920e2ab() {
    self notify("unset_fov_scalefactor");
    thread function_d13d2a81214fbfb8("default");
    self lerpfovscalefactor(1, 0);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee2
// Size: 0x16c
function function_ee93617532d8a679(vehicle, owner, cleanupfunc, var_246614ea27a2e126, var_2e71b592d8fbf3aa) {
    if (!isdefined(vehicle)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    vehicle function_bcb138d52b53d94d(0);
    if (istrue(var_2e71b592d8fbf3aa)) {
        return;
    }
    if (isdefined(owner)) {
        owner endon("disconnect");
    }
    vehicle endon("death");
    vehicle endon("explode");
    level endon("game_ended");
    if (!isdefined(cleanupfunc)) {
        /#
            iprintln("<unknown string>");
        #/
        return;
    }
    /#
        var_81171bb2c078f3b7 = getdvarint(@"hash_5fbef6e1f0b6624c", 0);
        if (istrue(var_81171bb2c078f3b7)) {
            var_246614ea27a2e126 = 1;
        }
    #/
    var_3098bbcd22d0e052 = spawnstruct();
    var_3098bbcd22d0e052.cleanupfunc = cleanupfunc;
    var_3098bbcd22d0e052.var_2efc43f3f9071bc7 = &function_37ba16da99bc142a;
    var_3098bbcd22d0e052.var_1adc2ea2615fdb8d = istrue(var_246614ea27a2e126);
    vehicle.var_3098bbcd22d0e052 = var_3098bbcd22d0e052;
    /#
        while (1) {
            var_dafb327821fab8f = getdvarint(@"hash_873b7ff40bb2a37e", 0);
            if (var_dafb327821fab8f > 0) {
                var_44f1c37d516c2acb = [0:vehicle];
                level notify("<unknown string>", var_44f1c37d516c2acb);
                if (var_dafb327821fab8f == 1) {
                    setdvar(@"hash_873b7ff40bb2a37e", 0);
                    wait(1);
                } else {
                    wait(5);
                }
                vehicle.var_54db093819e08a57 = undefined;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5055
// Size: 0xc4
function private function_37ba16da99bc142a(reason) {
    self endon("death");
    self endon("explode");
    level endon("game_ended");
    if (istrue(self.var_54db093819e08a57)) {
        return;
    }
    self.var_54db093819e08a57 = 1;
    var_b1e2dc0593d7ca82 = self.var_3098bbcd22d0e052;
    if (istrue(self.iscrashing) || istrue(self.isleaving)) {
        self thread [[ var_b1e2dc0593d7ca82.cleanupfunc ]]();
    } else {
        if (!istrue(var_b1e2dc0593d7ca82.var_1adc2ea2615fdb8d)) {
            return;
        }
        result = function_f503427294d91f80(self, 500);
        if (!istrue(result)) {
            /#
                iprintln("<unknown string>");
            #/
            self thread [[ var_b1e2dc0593d7ca82.cleanupfunc ]]();
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5120
// Size: 0x22b
function function_f503427294d91f80(vehicle, var_7df47e090af4ffb9) {
    vehicle endon("death");
    vehicle endon("explode");
    vehicle endon("leaving");
    vehicle endon("crashing");
    level endon("game_ended");
    var_6f3a90a6b2b8799d = vehicle.origin;
    forward = anglestoforward(vehicle.angles);
    right = anglestoright(vehicle.angles);
    up = anglestoup(vehicle.angles);
    contents = namespace_2a184fc4902783dc::create_default_contents(1);
    ignore = vehicle;
    var_1af7b0ad468a64cb = [0:var_6f3a90a6b2b8799d + forward * var_7df47e090af4ffb9, 1:var_6f3a90a6b2b8799d - forward * var_7df47e090af4ffb9, 2:var_6f3a90a6b2b8799d + right * var_7df47e090af4ffb9, 3:var_6f3a90a6b2b8799d - right * var_7df47e090af4ffb9, 4:var_6f3a90a6b2b8799d + up * var_7df47e090af4ffb9, 5:var_6f3a90a6b2b8799d - up * var_7df47e090af4ffb9, 6:var_6f3a90a6b2b8799d + 0.707 * (forward + right) * var_7df47e090af4ffb9, 7:var_6f3a90a6b2b8799d + 0.707 * (forward - right) * var_7df47e090af4ffb9, 8:var_6f3a90a6b2b8799d + 0.707 * (right - forward) * var_7df47e090af4ffb9, 9:var_6f3a90a6b2b8799d + 0.707 * (-1 * forward - right) * var_7df47e090af4ffb9];
    var_62538cb75db14e85 = 0;
    foreach (var_42c3ddaae2ed9962 in var_1af7b0ad468a64cb) {
        if (namespace_2a184fc4902783dc::sphere_trace_passed(var_6f3a90a6b2b8799d, var_42c3ddaae2ed9962, 300, ignore, contents)) {
            /#
                level thread namespace_f2ffc0540883e1ad::drawline(var_6f3a90a6b2b8799d, var_42c3ddaae2ed9962, 30, (0, 1, 0));
                level thread namespace_f2ffc0540883e1ad::drawsphere(var_42c3ddaae2ed9962, 25, 30, (0, 1, 0));
            #/
            vehicle vehicle_teleport(var_42c3ddaae2ed9962, vehicle.angles);
            var_62538cb75db14e85 = 1;
            break;
        }
        wait(0.05);
    }
    return var_62538cb75db14e85;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5353
// Size: 0x1b0
function teamhasuav(team) {
    foreach (entry in level.teamnamelist) {
        if (entry == team) {
            continue;
        }
        if (isdefined(level.uavmodels) && isdefined(level.uavmodels[entry]) && level.uavmodels[entry].size > 0) {
            foreach (uav in level.uavmodels[entry]) {
                if (!isdefined(uav)) {
                    continue;
                }
                if (uav.uavtype == "counter_uav") {
                    return 0;
                }
            }
        }
    }
    if (isdefined(level.uavmodels) && isdefined(level.uavmodels[team]) && level.uavmodels[team].size > 0) {
        foreach (uav in level.uavmodels[team]) {
            if (!isdefined(uav)) {
                continue;
            }
            if (uav.uavtype == "uav" || uav.uavtype == "directional_uav") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550b
// Size: 0xbf
function teamhasuav_ignorecuav(team) {
    if (isdefined(level.uavmodels) && isdefined(level.uavmodels[team]) && level.uavmodels[team].size > 0) {
        foreach (uav in level.uavmodels[team]) {
            if (!isdefined(uav)) {
                continue;
            }
            if (uav.uavtype == "uav" || uav.uavtype == "directional_uav") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x55d2
// Size: 0xae
function enemyhascuav(team) {
    if (isdefined(level.supportdrones) && level.supportdrones.size > 0) {
        foreach (drone in level.supportdrones) {
            if (level.teambased && drone.team == team) {
                continue;
            }
            if (drone.helperdronetype == "scrambler_drone_guard") {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5688
// Size: 0x3a
function isuavactiveforteam(team) {
    if (!isdefined(level.uavmodels)) {
        return 0;
    }
    if (!isdefined(level.uavmodels[team])) {
        return 0;
    }
    return level.uavmodels[team].size > 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56ca
// Size: 0x213
function getkillstreakdeployweapon(streakname) {
    deployweapon = undefined;
    switch (streakname) {
    case #"hash_2289ec11d77bce8f":
    case #"hash_56979e0566996b2e":
    case #"hash_887ad77192b9c4fb":
        deployweapon = "deploy_airdrop_mp";
        break;
    case #"hash_4ad475e6e15635bd":
    case #"hash_e65b15f734e5ab84":
        deployweapon = "deploy_juggernaut_mp";
        break;
    case #"hash_9e36e3bd3a9dd00d":
        if (utility::iscp()) {
            deployweapon = "ks_assault_drone_cp";
            break;
        }
        deployweapon = "ks_assault_drone_mp";
        break;
    case #"hash_691f39dddd9116b8":
    case #"hash_e477c24ee18bb2f6":
    case #"hash_f64c697bfb4c6b54":
        deployweapon = "ks_gesture_generic_mp";
        break;
    case #"hash_27002778019fb447":
    case #"hash_634b246c3da5c56f":
    case #"hash_e171e5b86ef0a4cc":
        deployweapon = "ks_gesture_phone_mp";
        break;
    case #"hash_b4ac3581c343a029":
        deployweapon = "iw9_laser_large_ir_mp";
        break;
    case #"hash_8c766d6477287bb6":
        deployweapon = "iw9_spotter_scope_mp";
        break;
    case #"hash_28d0236400e33fd0":
    case #"hash_349713b5ad494dda":
    case #"hash_413c38e72fe8b5bf":
    case #"hash_6362d6aae3e5a62e":
    case #"hash_cf0ef5bef19a311b":
    case #"hash_ed469a6bfff6b265":
        deployweapon = "ks_remote_device_mp";
        break;
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_4220be38a5f150b8":
    case #"hash_a1031216158c7882":
    case #"hash_b161e185f1b8e117":
    case #"hash_e6bea339d3cbd3e8":
        deployweapon = "ks_remote_map_mp";
        break;
    case #"hash_52d9b7ed584bec3e":
        deployweapon = "deploy_manual_turret_mp";
        break;
    case #"hash_4d5aa76e8707f47b":
        deployweapon = "deploy_sentry_mp";
        break;
    case #"hash_ab5712e297cd430e":
        deployweapon = "deploy_remote_turret_mp";
        break;
    case #"hash_195360490caa3220":
        deployweapon = "ks_remote_nuke_mp";
        break;
    }
    return deployweapon;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58e5
// Size: 0x11f
function iskillstreakdeployweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = namespace_e0ee43ef2dddadaa::function_72376783a92be46(weapon);
        if (!isdefined(weaponname)) {
            weaponname = weapon;
        }
    }
    var_1880d2298e9e948a = 0;
    switch (weaponname) {
    case #"hash_14ab8140c657b518":
    case #"hash_1898ea54a0bc6404":
    case #"hash_33c7f389fa9d6dd5":
    case #"hash_405f9521b5ee8402":
    case #"hash_448b7248104bfa9c":
    case #"hash_45e409945333f912":
    case #"hash_807ae3204119bd41":
    case #"hash_879b8ea58093f02c":
    case #"hash_aacdf3a6d5b91585":
    case #"hash_b43c2e4c05fafc4b":
    case #"hash_c280a34cde90f5eb":
    case #"hash_d9266153a899a37c":
    case #"hash_f194befae42e3476":
    case #"hash_f19acafae432c488":
        var_1880d2298e9e948a = 1;
        break;
    }
    return var_1880d2298e9e948a;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a0c
// Size: 0x57
function function_6c58c6fdcc87e387(weaponobj) {
    var_efa92dcc03a312b9 = 0;
    if (!isdefined(weaponobj) || !isdefined(weaponobj.basename)) {
        return var_efa92dcc03a312b9;
    }
    switch (weaponobj.basename) {
    case #"hash_b43c2e4c05fafc4b":
        var_efa92dcc03a312b9 = 1;
        break;
    }
    return var_efa92dcc03a312b9;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a6b
// Size: 0x57
function function_9deb86c4684340e1(weaponobj) {
    var_d707a33007a42777 = 0;
    if (!isdefined(weaponobj) || !isdefined(weaponobj.basename)) {
        return var_d707a33007a42777;
    }
    switch (weaponobj.basename) {
    case #"hash_33c7f389fa9d6dd5":
        var_d707a33007a42777 = 1;
        break;
    }
    return var_d707a33007a42777;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aca
// Size: 0x6f
function function_3ffc7fd85f5754e9(weaponobj) {
    var_ffb48d5f685a491b = 0;
    if (!isdefined(weaponobj) || !isdefined(weaponobj.basename)) {
        return var_ffb48d5f685a491b;
    }
    switch (weaponobj.basename) {
    case #"hash_5f2ad7140f378ee1":
    case #"hash_f194befae42e3476":
    case #"hash_f19acafae432c488":
        var_ffb48d5f685a491b = 1;
        break;
    }
    return var_ffb48d5f685a491b;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b41
// Size: 0x63
function function_92ab1470f48812c2(weaponobj) {
    var_70167de558c1c864 = 0;
    if (!isdefined(weaponobj) || !isdefined(weaponobj.basename)) {
        return var_70167de558c1c864;
    }
    switch (weaponobj.basename) {
    case #"hash_c280a34cde90f5eb":
    case #"hash_d9266153a899a37c":
        var_70167de558c1c864 = 1;
        break;
    }
    return var_70167de558c1c864;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bac
// Size: 0xa0
function getkillstreakgameweapons(streakname) {
    var_10008c3679d9645 = [];
    switch (streakname) {
    case #"hash_4ad475e6e15635bd":
        var_10008c3679d9645 = [0:"iw9_minigunksjugg_mp", 1:"iw9_minigunksjugg_reload_mp", 2:"iw9_lm_dblmg2_cp"];
        break;
    case #"hash_52d9b7ed584bec3e":
        var_10008c3679d9645 = [0:"manual_turret_mp"];
        break;
    case #"hash_4d5aa76e8707f47b":
        var_10008c3679d9645 = [0:"sentry_turret_mp"];
        break;
    case #"hash_ab5712e297cd430e":
        var_10008c3679d9645 = [0:"remote_turret_mp"];
        break;
    }
    return var_10008c3679d9645;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c54
// Size: 0x79
function getnumactivekillstreakperteam(team, var_3b3d45fbc518a5a8) {
    var_815bc3b6c43677e1 = 0;
    foreach (var_d7eea22a14a52fd0 in var_3b3d45fbc518a5a8) {
        if (var_d7eea22a14a52fd0.team == team) {
            var_815bc3b6c43677e1++;
        }
    }
    return var_815bc3b6c43677e1;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cd5
// Size: 0x4c
function getkillstreakairstrikeheightent() {
    if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
        return namespace_36f464722d326bbe::getlocaleent("airstrikeheight");
    }
    var_237503f7f9ee10ef = getentarray("airstrikeheight", "targetname");
    if (var_237503f7f9ee10ef.size > 1) {
        /#
            iprintlnbold("<unknown string>");
        #/
    }
    return var_237503f7f9ee10ef[0];
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d29
// Size: 0xaf
function function_3f76336d7d0b7587(weaponref) {
    speedscale = 1;
    if (isdefined(weaponref)) {
        weaponname = undefined;
        if (isweapon(weaponref)) {
            weaponname = weaponref.basename;
        } else {
            weaponname = namespace_e0ee43ef2dddadaa::function_72376783a92be46(weaponref);
            if (!isdefined(weaponname)) {
                weaponname = weaponref;
            }
        }
        switch (weaponname) {
        case #"hash_1898ea54a0bc6404":
        case #"hash_879b8ea58093f02c":
            speedscale = 0.78;
            break;
        case #"hash_f4d2562ef860c1c0":
            speedscale = 0.87;
            break;
        case #"hash_448b7248104bfa9c":
            speedscale = 0.91;
            break;
        }
    }
    return speedscale;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5de0
// Size: 0x98
function restorekillstreakplayerangles(player) {
    player endon("death_or_disconnect");
    level endon("game_ended");
    if (!player _isalive()) {
        return;
    }
    restorepitch = 0;
    var_3091aada55546bfe = 0;
    wait(0.05);
    var_7500ec3e41c123ab = player getplayerangles();
    var_aca8796e2dfc14c8 = var_7500ec3e41c123ab[1];
    if (isdefined(player.restoreangles) && !function_f8789f15330de751(player)) {
        var_aca8796e2dfc14c8 = player.restoreangles[1];
    }
    player setplayerangles((restorepitch, var_aca8796e2dfc14c8, var_3091aada55546bfe));
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7f
// Size: 0x19c
function recordkillstreakendstats(streakinfo) {
    if (issharedfuncdefined("challenges", "onKillStreakEnd")) {
        var_16efcf27e6efcbe8 = streakinfo.mpstreaksysteminfo;
        if (isdefined(var_16efcf27e6efcbe8)) {
            name = var_16efcf27e6efcbe8.streakname;
            totalkills = streakinfo.kills;
            self [[ getsharedfunc("challenges", "onKillStreakEnd") ]](name, totalkills);
        }
    }
    if (issharedfuncdefined("dlog", "killStreakExpired")) {
        var_16efcf27e6efcbe8 = streakinfo.mpstreaksysteminfo;
        if (isdefined(var_16efcf27e6efcbe8)) {
            lifeid = var_16efcf27e6efcbe8.streakmatchlifeid;
            killstreakname = var_16efcf27e6efcbe8.streakname;
            pickedup = var_16efcf27e6efcbe8.isgimme;
            matchtime = gettime();
            playerpos = self.origin;
            expiredbydeath = istrue(streakinfo.expiredbydeath);
            shotsfired = streakinfo.shots_fired;
            var_8f52823e77aca0d3 = streakinfo.hits;
            var_f5ff9a2f5217b3ec = streakinfo.kills;
            var_7e6dbb913989cf29 = streakinfo.score;
            [[ getsharedfunc("dlog", "killStreakExpired") ]](self, lifeid, killstreakname, pickedup, matchtime, playerpos, expiredbydeath, shotsfired, var_8f52823e77aca0d3, var_f5ff9a2f5217b3ec, var_7e6dbb913989cf29);
        }
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6022
// Size: 0x73
function playerkillstreakgetownerlookatignoreents() {
    ignoreents = undefined;
    if (isdefined(self.vehicle)) {
        ignoreents = [0:self.vehicle];
    } else {
        groundent = self getgroundentity();
        if (isdefined(groundent) && isdefined(groundent.classname) && groundent.classname == "script_vehicle") {
            ignoreents = [0:groundent];
        }
    }
    return ignoreents;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x609d
// Size: 0x5e
function movingplatform_playerlink(player) {
    if (getdvarint(@"hash_82ce3832ac5efa6d", 0) == 0) {
        return;
    }
    var_a2731e6d9af15254 = player getmovingplatformparent();
    if (isdefined(var_a2731e6d9af15254) && function_63bdc8c411a85475(var_a2731e6d9af15254)) {
        player playerlinkto(var_a2731e6d9af15254);
        player playerlinkedoffsetenable();
        player.movingplatforment = var_a2731e6d9af15254;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6102
// Size: 0x8f
function function_63bdc8c411a85475(var_a2731e6d9af15254) {
    if (namespace_9db09f982acd35b4::is_moving_platform_train(var_a2731e6d9af15254)) {
        return 1;
    }
    if (namespace_91671cfc18616400::function_d9d18dab18ebded(var_a2731e6d9af15254)) {
        return 1;
    }
    if (isarray(level.var_a3810b14039a0e7d)) {
        foreach (callback in level.var_a3810b14039a0e7d) {
            if ([[ callback ]](var_a2731e6d9af15254)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6199
// Size: 0x8f
function function_3c5c5d86ef14420e(var_a2731e6d9af15254) {
    if (namespace_9db09f982acd35b4::is_moving_platform_train(var_a2731e6d9af15254)) {
        return 1;
    }
    if (namespace_91671cfc18616400::function_d9d18dab18ebded(var_a2731e6d9af15254)) {
        return 1;
    }
    if (isarray(level.var_6b5eff480d2f1fac)) {
        foreach (callback in level.var_6b5eff480d2f1fac) {
            if ([[ callback ]](var_a2731e6d9af15254)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6230
// Size: 0x2d
function movingplatform_playerunlink(player) {
    if (isdefined(player.movingplatforment)) {
        player.movingplatforment = undefined;
        player unlink();
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6264
// Size: 0x3d
function function_6db9b45f6855dee1(callback) {
    if (!isarray(level.var_a3810b14039a0e7d)) {
        level.var_a3810b14039a0e7d = [];
    }
    level.var_a3810b14039a0e7d[level.var_a3810b14039a0e7d.size] = callback;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62a8
// Size: 0x3d
function function_2c70bfb1b580e8e0(callback) {
    if (!isarray(level.var_6b5eff480d2f1fac)) {
        level.var_6b5eff480d2f1fac = [];
    }
    level.var_6b5eff480d2f1fac[level.var_6b5eff480d2f1fac.size] = callback;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62ec
// Size: 0x9c
function killstreak_registerminimapinfo(bundle, killstreak) {
    if (isdefined(bundle) && isdefined(bundle.minimapicon)) {
        createfunc = undefined;
        enemyobjid = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjectiveEngineer")) {
            createfunc = namespace_3c37cb17ade254d::getsharedfunc("game", "createObjectiveEngineer");
        }
        if (isdefined(createfunc)) {
            enemyobjid = self [[ createfunc ]](bundle.minimapicon, 1, 1, "icon_regular");
        }
        if (isdefined(killstreak) && isdefined(enemyobjid)) {
            level function_17f94c860028d1d(killstreak, enemyobjid, self);
        }
        return;
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638f
// Size: 0x133
function function_17f94c860028d1d(killstreak, var_6e0dca850237b45, var_f3197128bec08768) {
    if (isdefined(self.var_2a83795d29778aea) && !isdefined(self.var_2a83795d29778aea[killstreak])) {
        return;
    }
    if (!isdefined(self.var_44007c283e07f7c2)) {
        self.var_44007c283e07f7c2 = [];
    }
    if (!isdefined(self.var_9f193d1d87e8636f)) {
        self.var_9f193d1d87e8636f = [];
    }
    if (!isdefined(self.var_932b68e7ca895a9f)) {
        self.var_932b68e7ca895a9f = [];
    }
    self.var_44007c283e07f7c2[killstreak] = var_6e0dca850237b45;
    self.var_9f193d1d87e8636f[killstreak] = var_f3197128bec08768.owner;
    self.var_932b68e7ca895a9f[var_6e0dca850237b45] = killstreak;
    if (isdefined(self.var_1a439e77dde46982)) {
        foreach (player in self.var_1a439e77dde46982) {
            if (istrue(playersareenemies(player, var_f3197128bec08768.owner))) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(var_6e0dca850237b45, player);
            }
        }
    }
    var_f3197128bec08768 thread function_cd63e30445520ec(killstreak);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64c9
// Size: 0x25
function function_cd63e30445520ec(killstreak) {
    self endon("killstreakUnregistered");
    self waittill("death");
    level function_4c8add74b15a9f8(killstreak, self);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f5
// Size: 0xc0
function function_4c8add74b15a9f8(killstreak, var_f3197128bec08768) {
    if (!isdefined(self.var_44007c283e07f7c2[killstreak]) || !isdefined(self.var_9f193d1d87e8636f[killstreak])) {
        return;
    }
    if (isdefined(self.var_1a439e77dde46982)) {
        foreach (player in self.var_1a439e77dde46982) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.var_44007c283e07f7c2[killstreak], player);
        }
    }
    self.var_44007c283e07f7c2[killstreak] = undefined;
    self.var_9f193d1d87e8636f[killstreak] = undefined;
    var_f3197128bec08768 notify("killstreakUnregistered");
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65bc
// Size: 0x29
function function_ef9490796efaf574(streakinfo, var_41bf9bf4918115ac, weaponobj) {
    if (!istrue(var_41bf9bf4918115ac)) {
        namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65ec
// Size: 0xdd
function function_6aa895b8483b9b10(streakinfo, deployweapon, var_6152d24062d26039, var_2f3d13488b96f966, var_4575958c3645cb9f, var_7735163648f2b6da, var_99514d9b932ce768) {
    wait(var_4575958c3645cb9f);
    marker = undefined;
    if (issharedfuncdefined("killstreak", "getTargetMarker")) {
        marker = [[ getsharedfunc("killstreak", "getTargetMarker") ]](streakinfo, var_6152d24062d26039, var_99514d9b932ce768);
    }
    if (!isdefined(self) || !_isalive()) {
        return undefined;
    }
    if (!isdefined(marker) || !isdefined(marker.location)) {
        function_8608f39517786dab(deployweapon);
        return undefined;
    }
    if (var_2f3d13488b96f966) {
        self freezecontrols(1);
    }
    if (self hasweapon(deployweapon)) {
        thread function_8608f39517786dab(deployweapon, 1, 1);
    }
    wait(var_7735163648f2b6da);
    if (var_2f3d13488b96f966) {
        self freezecontrols(0);
    }
    return marker;
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d1
// Size: 0xb0
function function_8608f39517786dab(deployweapon, var_eaf9953fb1b05ac6, var_829a6cb8a7de0cab) {
    if (isdefined(var_829a6cb8a7de0cab) && var_829a6cb8a7de0cab > 0) {
        self endon("death_or_disconnect");
        level endon("game_ended");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_829a6cb8a7de0cab);
    }
    lastweaponobj = namespace_d325722f2754c2c4::restoreweaponstates(self.lastdroppableweaponobj);
    if (!isdefined(lastweaponobj) || !self hasweapon(lastweaponobj)) {
        if (isdefined(self.lastnormalweaponobj)) {
            lastweaponobj = self.lastnormalweaponobj;
        } else {
            lastweaponobj = makeweapon("iw9_fists_mp");
        }
    }
    if (istrue(var_eaf9953fb1b05ac6)) {
        _switchtoweaponimmediate(lastweaponobj);
    } else {
        _switchtoweapon(lastweaponobj);
    }
    _takeweapon(deployweapon);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6788
// Size: 0x141
function function_36c90c54c1002132(owner, var_5e8eb3c31f9c265c, var_6e6bc0afbb34621a) {
    var_963953c3478bf4fe = self gettagorigin(var_5e8eb3c31f9c265c);
    if (!isdefined(self.useownerobj)) {
        if (issharedfuncdefined("game", "createHintObject")) {
            self.useownerobj = [[ getsharedfunc("game", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", undefined, var_6e6bc0afbb34621a, undefined, undefined, "show");
        }
    } else {
        var_963953c3478bf4fe = self gettagorigin(var_5e8eb3c31f9c265c);
        self.useownerobj function_dfb78b3e724ad620(1);
        self.useownerobj dontinterpolate();
        self.useownerobj.origin = var_963953c3478bf4fe;
    }
    foreach (player in level.players) {
        if (player != owner) {
            self.useownerobj disableplayeruse(player);
        } else {
            self.useownerobj enableplayeruse(player);
        }
    }
    self.useownerobj linkto(self, var_5e8eb3c31f9c265c);
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d0
// Size: 0x80
function function_b3a0eefb6e0c3947(streakinfo, var_df627292446e06cb) {
    self endon("death");
    level endon("game_ended");
    while (1) {
        player = self.useownerobj waittill("trigger");
        if (isdefined(player) && !self.owner function_4f19c068fd5214b2(player)) {
            continue;
        }
        self.useownerobj function_dfb78b3e724ad620(0);
        self.owner [[ var_df627292446e06cb ]](self, streakinfo);
    }
}

// Namespace namespace_8319cdbe938cd234/namespace_9abe40d2af041eb2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6957
// Size: 0x53
function private function_4f19c068fd5214b2(player) {
    if (player != self) {
        return 0;
    }
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        }
        return 0;
    }
    return 1;
}

