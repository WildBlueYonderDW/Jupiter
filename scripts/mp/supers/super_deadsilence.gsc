// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\supers.gsc;
#using script_1ed1214969b5eba7;
#using script_74b851b7aa1ef32d;
#using script_189b67b2735b981d;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\analyticslog.gsc;

#namespace super_deadsilence;

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1
// Size: 0x15
function superdeadsilence_beginsuper() {
    result = function_ef312894c6cae23();
    return result;
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fe
// Size: 0x58
function private function_ef312894c6cae23() {
    if (getdvarint(@"hash_88050a1ca3a6c70f", 0) == 1) {
        return 1;
    }
    objweapon = makeweapon("deadsilence_device_mp");
    var_d54d53eaf955518d = namespace_d325722f2754c2c4::function_f19f8b4cf085ecbd(objweapon);
    if (istrue(var_d54d53eaf955518d)) {
        return function_2649cdb548d89c04();
    } else {
        namespace_85d036cb78063c4a::refundsuper();
    }
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35d
// Size: 0x16e
function private function_2649cdb548d89c04() {
    giveperk("specialty_quieter");
    giveperk("specialty_no_battle_chatter");
    var_19c643069b108770 = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_deadsilence");
    if (istrue(var_19c643069b108770.var_276cc6fc594df489)) {
        self setplayerghost(1);
    }
    self.deadsilencekills = 0;
    self.super.isactive = 1;
    if (isdefined(self.pers["deadSilenceTime"])) {
        self.var_2cf78151a82050fb = gettime();
    }
    self playlocalsound("deadsilence_start");
    namespace_a850435086c88de3::doonactionscoreevent(1, "deadSilenceUsed");
    superdeadsilence_updateuistate(0);
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "equipment_deployed");
    thread applyfovpresentation();
    thread superdeadsilence_watchforgameended();
    agents = getaiarrayinradius(self.origin, 2048);
    foreach (agent in agents) {
        if (agent getthreatsight(self) >= 1) {
            agent setthreatsight(self, 0);
        }
    }
    namespace_aad14af462a74d08::function_d997435895422ecc("super_deadsilence", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    thread function_43eba8eb08bb6edc();
    return 1;
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3
// Size: 0x192
function superdeadsilence_endsuper(var_fcef8d217a441961) {
    if (getdvarint(@"hash_88050a1ca3a6c70f", 0) == 1) {
        return 0;
    }
    self setscriptablepartstate("deadSilenceFX", "end", 0);
    removeperk("specialty_quieter");
    removeperk("specialty_no_battle_chatter");
    var_19c643069b108770 = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_deadsilence");
    if (istrue(var_19c643069b108770.var_276cc6fc594df489) && !istrue(self.var_3b1bdaaf4482717c)) {
        self setplayerghost(0);
    }
    self.super.isactive = 0;
    if (isdefined(self.pers["deadSilenceTime"])) {
        currenttime = gettime();
        var_57a6268fb3df10d0 = currenttime - self.var_2cf78151a82050fb;
        namespace_3c5a4254f2b957ea::incpersstat("deadSilenceTime", var_57a6268fb3df10d0);
    }
    if (getgametype() != "infect") {
        namespace_bd0162aedd8c8594::logevent_fieldupgradeexpired(self, level.superglobals.staticsuperdata["super_deadsilence"].id, self.deadsilencekills, istrue(var_fcef8d217a441961));
    }
    thread superdeadsilence_endhudsequence();
    if (namespace_3c37cb17ade254d::issharedfuncdefined("br", "superSlotCleanUp")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("br", "superSlotCleanUp") ]](self);
    }
    if (isdefined(self.var_1bb565e508ac38a5)) {
        namespace_aad14af462a74d08::function_d997435895422ecc("super_deadsilence", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.var_8c1b3c647dc1c8ca);
    }
    return 0;
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66d
// Size: 0xb7
function superdeadsilence_onkill() {
    if (getdvarint(@"hash_88050a1ca3a6c70f", 0) == 1) {
        return;
    }
    if (getgametype() != "infect") {
        namespace_3c5a4254f2b957ea::incpersstat("deadSilenceKills", 1);
        namespace_85d036cb78063c4a::combatrecordsuperkill("super_deadsilence");
        self.deadsilencekills++;
        var_f8627bc73976807c = namespace_85d036cb78063c4a::getcombatrecordsupermisc("super_deadsilence");
        if (self.deadsilencekills > var_f8627bc73976807c) {
            increment = self.deadsilencekills - var_f8627bc73976807c;
            namespace_85d036cb78063c4a::combatrecordsupermisc("super_deadsilence", increment);
        }
    }
    self playlocalsound("deadsilence_start");
    superdeadsilence_updateuistate(1);
    namespace_85d036cb78063c4a::resetsuperusepercent();
    thread applyfovpresentation();
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72b
// Size: 0x1f
function superdeadsilence_endhudsequence() {
    self endon("disconnect");
    superdeadsilence_updateuistate(2);
    wait(1);
    superdeadsilence_updateuistate(-1);
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x751
// Size: 0x23
function superdeadsilence_updateuistate(newstate) {
    self.deadsilenceuistate = newstate;
    self setclientomnvar("ui_deadsilence_overlay", newstate);
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77b
// Size: 0xa6
function applyfovpresentation() {
    self endon("death_or_disconnect");
    self notify("applyFOVPresentation");
    self endon("applyFOVPresentation");
    self setscriptablepartstate("deadSilenceFX", "neutral", 0);
    waitframe();
    self lerpfovbypreset("zombiedefault");
    self playlocalsound("deadsilence_end");
    self setscriptablepartstate("deadSilenceFX", "start", 0);
    duration = self.super.staticdata.usetime;
    var_ecf8ff7b7b97525c = duration - 2;
    waittill_any_timeout_no_endon_death_1(var_ecf8ff7b7b97525c, "super_use_finished");
    self lerpfovbypreset("default_2seconds");
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x3a
function superdeadsilence_watchforgameended() {
    self endon("death_or_disconnect");
    self endon("super_use_finished");
    self notify("superDeadsilence_watchForGameEnded");
    self endon("superDeadsilence_watchForGameEnded");
    level waittill_any_2("game_ended", "prematch_cleanup");
    thread namespace_85d036cb78063c4a::superusefinished();
}

// Namespace super_deadsilence/namespace_41cc735dabd45eb0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x869
// Size: 0xc3
function function_43eba8eb08bb6edc() {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    self endon("super_use_finished");
    self.var_8c1b3c647dc1c8ca = 0;
    var_6468f56d9f67c8bf = 39.3701;
    var_bb9e3661d7b1ff9d = self.origin;
    var_e48200809888835a = 0;
    while (isdefined(self.super) && self.super.isactive) {
        if (1) {
            var_cb1505ffb6643abe = self.origin;
            var_e48200809888835a = var_e48200809888835a + distance(var_cb1505ffb6643abe, var_bb9e3661d7b1ff9d);
            var_bb9e3661d7b1ff9d = var_cb1505ffb6643abe;
            self.var_8c1b3c647dc1c8ca = int(round(var_e48200809888835a / var_6468f56d9f67c8bf));
        }
        wait(0.1);
    }
}

