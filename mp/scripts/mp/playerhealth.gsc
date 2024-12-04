#using script_19fd5b5d73d44c18;
#using script_372301af73968cb;
#using script_6a5d3bf7a5b7064a;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\engine\utility;
#using scripts\mp\analyticslog;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\damage;
#using scripts\mp\equipment\adrenaline;
#using scripts\mp\supers\laststand_heal;
#using scripts\mp\tweakables;
#using scripts\mp\utility\dvars;
#using scripts\mp\utility\game;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\spawn_event_aggregator;
#using scripts\mp\utility\stats;

#namespace playerhealth;

// Namespace playerhealth / scripts\mp\playerhealth
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x11f
function init() {
    healthregendelay = scripts\mp\utility\dvars::getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_healthregentime"), @"hash_2922210021914dd7");
    scripts\mp\tweakables::settweakablevalue("player", "healthregentime", healthregendelay);
    scripts\mp\tweakables::settweakablelastvalue("player", "healthregentime", healthregendelay);
    level.healthregendelay = scripts\mp\tweakables::gettweakablevalue("player", "healthregentime");
    level.healthregendisabled = level.healthregendelay <= 0;
    level.playerhealth_regularregendelay = level.healthregendelay;
    level.var_562530bdb8e83b66 = scripts\mp\utility\dvars::getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_deathsDoorEnterPct"), @"hash_e4f93d764d11874d");
    level.var_fdd1af3c4c6cbe86 = scripts\mp\utility\dvars::getoverridedvarfloatexceptmatchrulesvalues(hashcat(@"scr_", getgametype(), "_deathsDoorExitPct"), @"hash_b84edc242cc61abf");
    if (!isdefined(level.var_be39d6b46044f344)) {
        level.var_be39d6b46044f344 = 40;
    }
    scripts\mp\utility\spawn_event_aggregator::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace playerhealth / scripts\mp\playerhealth
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x312
// Size: 0x1f
function onplayerspawned() {
    thread namespace_54a2eae43eaa8bf5::manageplayerregen();
    self visionsetthermalforplayer(game["thermal_vision"]);
    namespace_4887422e77f3514e::function_9bc46d4b8891a740();
}

// Namespace playerhealth / scripts\mp\playerhealth
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x339
// Size: 0xb3
function onfullhealth(starthealth, var_823ca369fafd4a36, var_7f86cf029bef696d) {
    amounthealed = self.health - starthealth;
    if (var_7f86cf029bef696d) {
        scripts\mp\damage::combatrecordtacticalstat("equip_adrenaline", amounthealed);
        scripts\mp\utility\stats::incpersstat("stimDamageHealed", amounthealed);
        scripts\mp\analyticslog::logevent_playerhealed(self, amounthealed, self);
    } else if (!isai(self)) {
        scripts\mp\analyticslog::logevent_playerregen(self, amounthealed);
    }
    if (isdefined(self.pers["damageHealed"])) {
        amounthealed = self.health - starthealth;
        scripts\mp\utility\stats::incpersstat("damageHealed", amounthealed);
    }
    if (var_823ca369fafd4a36) {
        level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"hash_122e9b7f62bdb160");
    }
}

// Namespace playerhealth / scripts\mp\playerhealth
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f4
// Size: 0x13f
function getGametypeHealthPerFrame() {
    if (function_244067e915c0eabe()) {
        var_881fb15f4d296741 = level.playermaxhealth / 150;
    } else {
        var_881fb15f4d296741 = 1;
    }
    var_89e7b92573a50713 = level.var_be39d6b46044f344 * 0.05 * var_881fb15f4d296741;
    if (getdvarint(@"hash_b3d928c9f115218a", 0) > 0) {
        var_fbb0e274527f2097 = getdvarint(@"hash_b3d928c9f115218a", 0);
        var_89e7b92573a50713 = var_fbb0e274527f2097 * 0.05 * var_881fb15f4d296741;
    }
    if (istrue(self.var_808d06ddfc93a4e4) && getdvarint(@"hash_dc1416e8c8672f24", 0)) {
        var_194458c6687c5a07 = namespace_e6ac9d98b8876b98::function_7fa9c564c245f4e3() * 0.05 * var_881fb15f4d296741;
        var_89e7b92573a50713 = max(var_194458c6687c5a07, var_89e7b92573a50713);
    }
    if (istrue(self.adrenalinepoweractive)) {
        var_194458c6687c5a07 = scripts\mp\equipment\adrenaline::gethealthpersec() * 0.05 * var_881fb15f4d296741;
        var_89e7b92573a50713 = max(var_194458c6687c5a07, var_89e7b92573a50713);
    } else if (istrue(self.laststandhealisactive)) {
        var_194458c6687c5a07 = scripts\mp\supers\laststand_heal::laststandheal_gethealthperframe();
        var_89e7b92573a50713 = max(var_194458c6687c5a07, var_89e7b92573a50713);
    } else if (_hasperk("specialty_regenfaster")) {
        var_89e7b92573a50713 *= level.regenfasterhealthmod;
    }
    if (isdefined(level.regenhealthaddfunc)) {
        var_89e7b92573a50713 = [[ level.regenhealthaddfunc ]](var_89e7b92573a50713);
    }
    return var_89e7b92573a50713;
}

