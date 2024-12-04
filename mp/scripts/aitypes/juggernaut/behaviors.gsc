#using scripts\aitypes\bt_util;
#using scripts\anim\utility_common;
#using scripts\anim\weaponlist;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\shared\utility;
#using scripts\common\cap;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace behaviors;

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
// Size: 0x2aa
function juggernaut_init(taskid) {
    self.spec = "juggernaut";
    self.wearing_helmet = 1;
    self allowedstances("stand");
    self.juggernaut = 1;
    self.dontmeleeme = 1;
    self.minpaindamage = 1000;
    self.grenadeammo = 0;
    self.doorflashchance = 0.05;
    self.aggressivemode = 1;
    self.ignoresuppression = 1;
    self.disablepistol = 1;
    self.var_6ae27d6eff2fb98f = 1;
    self.meleechargedistvsplayer = 120;
    self.meleechargedist = 120;
    self.meleestopattackdistsq = 14400;
    self.meleedamageoverride = 400;
    self.meleemaxzdiff = 500;
    self.meleetargetallowedoffmeshdistsq = 2500;
    self.meleetryhard = 0;
    self.meleeignorefinalzdiff = 0;
    self.meleeignoreplayerstance = 1;
    self.dontsyncmelee = 1;
    self.disablebulletwhizbyreaction = 1;
    self function_9f82c74eb1b7caf9(0, "entity");
    self.disablerunngun = 1;
    self.disabledodge = 1;
    self.pathenemyfightdist = 0;
    self.var_274d3a7704e351ef = 1;
    self.var_98add129a7ecb962 = 0;
    self.var_9440dc8a2aa90aed = 3000;
    self.var_7d606bec79308eb5 = 750;
    self.var_85a0f6383a5dd784 = 300;
    self.var_a67833fea11a521c = 750;
    self.var_427cbd3288a2f59 = 300;
    self.var_5e7d402b7b6e5c12 = 25;
    self.var_20833644cc82839f = 200;
    self.goalheight = 80;
    self.usechokepoints = 0;
    self.cautiousnavigation = 0;
    self.var_b29c3655b12e292d = 0;
    self.var_717eb05b8fb85cff = 40;
    self.var_e2b553399f5ff8a3 = 1000;
    self.var_e2d849399f862a5d = 2000;
    self.var_7878ef8b36bc3525 = 1000;
    self.var_789bf98b36e292db = 2000;
    self.var_2d670e4d288c86fb = 1;
    self.combat_func_active = 1;
    self function_ae41fbf799ba43f(1, "entity");
    self function_8bbcaeb23a1512ef("all", 0, "bt");
    self function_5847240c0f9900f2(0);
    if (!issp() && !is_equal(level.gametype, "trial")) {
        self giveweapon("iw9_lm_dblmg_execution_mp");
        self giveexecution("jug_execution_000_stand_8", "iw9_lm_dblmg_execution_mp");
    }
    /#
        setdvarifuninitialized(@"hash_45b89b729718bd15", 0);
        setdvarifuninitialized(@"hash_55cdffcdb283c0cd", -1);
    #/
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x481
// Size: 0x125
function juggernaut_shouldexecute(taskid) {
    var_dc17de3aad9b4859 = 10000;
    var_fd17b339e3ecf73c = 1;
    /#
        if (getdvarint(@"hash_45b89b729718bd15")) {
            var_fd17b339e3ecf73c = 0;
        }
    #/
    if (var_fd17b339e3ecf73c && !istrue(self.ballowexecutions)) {
        return anim.failure;
    }
    if (isdefined(self.timeoflastexecute) && gettime() - self.timeoflastexecute < var_dc17de3aad9b4859) {
        return anim.failure;
    }
    if (istrue(self.onlyexecutefromthefront)) {
        assert(isdefined(self.enemy));
        var_79b0b08b6461b1ff = self.origin - self.enemy.origin;
        var_f38131fb9a95561a = vectortoyaw(var_79b0b08b6461b1ff);
        angledelta = angleclamp180(var_f38131fb9a95561a - self.enemy.angles[1]);
        if (angledelta < -45 || angledelta > 45) {
            return anim.failure;
        }
    }
    return anim.success;
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x188
function juggernaut_setupexecute(taskid) {
    self.timeoflastexecute = gettime();
    assert(isdefined(self.enemy));
    var_79b0b08b6461b1ff = self.origin - self.enemy.origin;
    var_f38131fb9a95561a = vectortoyaw(var_79b0b08b6461b1ff);
    angledelta = angleclamp180(var_f38131fb9a95561a - self.enemy.angles[1]);
    var_4ea1b715cf150e33 = "jug_execution_";
    var_8c1a95a9abce46d8 = "_stand_";
    var_2b33b2a868985889 = "00";
    dir = "8";
    if (angledelta < 45 && angledelta > -45) {
        var_433fa147fa57a371 = randomint(4);
        var_2b33b2a868985889 += var_433fa147fa57a371;
    } else {
        var_433fa147fa57a371 = randomint(2);
        var_2b33b2a868985889 += var_433fa147fa57a371;
        if (angledelta < -135 || angledelta > 135) {
            dir = "2";
        } else if (angledelta >= 45) {
            dir = "4";
        } else {
            dir = "6";
        }
    }
    /#
        var_e8e714db27e6c44c = getdvarint(@"hash_55cdffcdb283c0cd");
        if (var_e8e714db27e6c44c >= 0) {
            var_2b33b2a868985889 = "<dev string:x1c>" + var_e8e714db27e6c44c;
        }
    #/
    var_c5d77fd3c0f3bddb = var_4ea1b715cf150e33 + var_2b33b2a868985889 + var_8c1a95a9abce46d8 + dir;
    self giveexecution(var_c5d77fd3c0f3bddb, "iw9_lm_dblmg_execution_mp");
    return anim.success;
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x740
// Size: 0x68
function function_aad2563e98827b23(taskid) {
    self.var_f8c080be8d680a2e = 1;
    if (self pathdisttogoal() > 256 && self aigetdesiredspeed() > 70) {
        self.var_8b54fc69d81b03cf = 1;
    }
    self._blackboard.var_7460b96395361857 = undefined;
    thread scripts\common\cap::cap_start("cap_jugg_sweep", "caps/common/cap_jugg_sweep");
    thread function_9db78f7b52b4ad06();
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b0
// Size: 0x2b
function function_c082b9efbf242464(taskid) {
    if (isdefined(self.var_f8c080be8d680a2e)) {
        return anim.running;
    }
    return anim.success;
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e4
// Size: 0x52
function function_e1138cce8b2f28d4(taskid) {
    if (isdefined(self.var_f8c080be8d680a2e)) {
        self.var_f8c080be8d680a2e = undefined;
        if (!isdefined(self._blackboard.var_7460b96395361857)) {
            self._blackboard.var_7460b96395361857 = "abort";
        }
    }
}

// Namespace behaviors / scripts\aitypes\juggernaut\behaviors
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83e
// Size: 0x1b
function function_9db78f7b52b4ad06() {
    self endon("death");
    self waittill("cap_exit_completed");
    self.var_f8c080be8d680a2e = undefined;
}

