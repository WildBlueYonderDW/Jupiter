// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\dialog_utility.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_64acb6ce534155b7;

#namespace circle_peek;

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0x60
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("circle_peek", &function_b1e60c0ec801b93b, undefined, &function_7023d0a9e3e7c419);
    var_d653377138d5eff2 = "circle_peak";
    game["dialog"]["use_" + "circle_peek"] = var_d653377138d5eff2 + "_use";
    game["dialog"]["timeout_" + "circle_peek"] = var_d653377138d5eff2 + "_timeout";
}

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0xe
function weapongivenchoppergunner(streakinfo) {
    return 1;
}

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8
// Size: 0x21
function function_36d2eb075443f6ca() {
    streakinfo = createstreakinfo("circle_peek", self);
    return function_b1e60c0ec801b93b(streakinfo);
}

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221
// Size: 0x31
function function_7023d0a9e3e7c419() {
    streakinfo = createstreakinfo("circle_peek", self);
    streakinfo.skipequippedstreakcheck = 1;
    return function_b1e60c0ec801b93b(streakinfo, 1);
}

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a
// Size: 0x15b
function function_b1e60c0ec801b93b(streakinfo, var_1ca10fe3ae6b2083) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (!istrue(var_1ca10fe3ae6b2083)) {
        deployweaponobj = makeweapon("ks_gesture_phone_mp");
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_dogesturedeploy(streakinfo, deployweaponobj);
        if (!istrue(var_9b1deb5e9d32bbe3)) {
            return 0;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    wait(0.45);
    result = function_f93df988a9f72f5c(streakinfo);
    if (!istrue(result)) {
        return result;
    }
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.streakname, self.origin);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_" + streakinfo.streakname, self);
    }
    thread playkillstreakoperatordialog("circle_peek", "use_" + "circle_peek", 1);
    if (istrue(var_1ca10fe3ae6b2083)) {
        namespace_9abe40d2af041eb2::playkillstreakusedialog(streakinfo.streakname);
    }
    return 1;
}

// Namespace circle_peek/namespace_5c7553a2489c3374
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd
// Size: 0xf3
function function_f93df988a9f72f5c(streakinfo) {
    if (!isdefined(level.teamswithcirclepeek)) {
        /#
            self iprintlnbold("<unknown string>");
        #/
        return 0;
    }
    if (!isdefined(level.br_circle.circleindex)) {
        /#
            self iprintlnbold("<unknown string>");
        #/
        return 0;
    }
    if (!isdefined(level.teamswithcirclepeek[self.team])) {
        level.teamswithcirclepeek[self.team] = 0;
    }
    var_2c18d9be706d7ad7 = level.teamswithcirclepeek[self.team] + level.br_circle.circleindex + 1;
    setomnvar("ui_minimap_pulse", 2);
    for (i = var_2c18d9be706d7ad7; i < level.circlepeeks.size; i++) {
        namespace_1eb3c4e0e28fac71::questrewardcirclepeek(self.team);
    }
    return 1;
}

