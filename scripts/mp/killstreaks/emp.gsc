// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;

#namespace emp;

// Namespace emp/namespace_c12dccead8978d78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179
// Size: 0x14
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("emp", &tryuseempfromstruct);
}

// Namespace emp/namespace_c12dccead8978d78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194
// Size: 0x21
function tryuseemp() {
    streakinfo = createstreakinfo("emp", self);
    return tryuseempfromstruct(streakinfo);
}

// Namespace emp/namespace_c12dccead8978d78
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bd
// Size: 0xa5
function tryuseempfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, makeweapon("ks_gesture_generic_mp"));
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    thread startemp();
    level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    return 1;
}

// Namespace emp/namespace_c12dccead8978d78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a
// Size: 0x161
function startemp() {
    level endon("game_ended");
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = 3000;
    if (isdefined(var_5fa1e1697a302583)) {
        heightoffset = var_5fa1e1697a302583.origin[2] + 500;
    }
    var_79ad84b5f137afa8 = level.mapcenter * (1, 1, 0) + (0, 0, heightoffset);
    playfx(getfx("emp_shockwave"), var_79ad84b5f137afa8);
    self playsound("jammer_drone_shockwave");
    foreach (player in level.players) {
        if (!isreallyalive(player)) {
            continue;
        }
        player thread applyempshellshock();
    }
    var_b0c33d224b825287 = getenemyteams(self.owner.team);
    foreach (entry in var_b0c33d224b825287) {
        destroyactiveobjects(entry, self);
    }
}

// Namespace emp/namespace_c12dccead8978d78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d2
// Size: 0x59
function applyempshellshock() {
    self setscriptablepartstate("emped", "active", 0);
    self playloopsound("emp_nade_lp");
    thread applyempshellshockvisionset();
    wait(0.5);
    self setscriptablepartstate("emped", "neutral", 0);
    self playsound("emp_nade_lp_end");
    self stoploopsound("emp_nade_lp");
}

// Namespace emp/namespace_c12dccead8978d78
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x432
// Size: 0x30
function applyempshellshockvisionset() {
    visionsetnaked("coup_sunblind", 0.05);
    waitframe();
    visionsetnaked("coup_sunblind", 0);
    visionsetnaked("", 0.5);
}

// Namespace emp/namespace_c12dccead8978d78
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x469
// Size: 0xf7
function destroyactiveobjects(team, owner) {
    weapon = "nuke_mp";
    var_6c845d64be969ce8 = level.activekillstreaks;
    var_98fa4b76d957b210 = [[ level.getactiveequipmentarray ]]();
    var_34ca454bbec477f1 = undefined;
    if (isdefined(var_6c845d64be969ce8) && isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = array_combine_unique(var_6c845d64be969ce8, var_98fa4b76d957b210);
    } else if (isdefined(var_6c845d64be969ce8)) {
        var_34ca454bbec477f1 = var_6c845d64be969ce8;
    } else if (isdefined(var_98fa4b76d957b210)) {
        var_34ca454bbec477f1 = var_98fa4b76d957b210;
    }
    if (isdefined(var_34ca454bbec477f1)) {
        foreach (object in var_34ca454bbec477f1) {
            if (isdefined(object)) {
                object dodamagetokillstreak(10000, owner, owner, team, object.origin, "MOD_EXPLOSIVE", weapon);
            }
        }
    }
}

