// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_372301af73968cb;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_19fd5b5d73d44c18;
#using scripts\mp\equipment\adrenaline.gsc;
#using scripts\mp\supers\laststand_heal.gsc;

#namespace playerhealth;

// Namespace playerhealth/namespace_35979fbc98ad96b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa
// Size: 0x11f
function init() {
    healthregendelay = namespace_296c793a004e81b3::getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_healthregentime"), @"hash_2922210021914dd7");
    namespace_775507ba36294dfb::settweakablevalue("player", "healthregentime", healthregendelay);
    namespace_775507ba36294dfb::settweakablelastvalue("player", "healthregentime", healthregendelay);
    level.healthregendelay = namespace_775507ba36294dfb::gettweakablevalue("player", "healthregentime");
    level.healthregendisabled = level.healthregendelay <= 0;
    level.playerhealth_regularregendelay = level.healthregendelay;
    level.var_562530bdb8e83b66 = namespace_296c793a004e81b3::getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_deathsDoorEnterPct"), @"hash_e4f93d764d11874d");
    level.var_fdd1af3c4c6cbe86 = namespace_296c793a004e81b3::getoverridedvarfloatexceptmatchrulesvalues(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_deathsDoorExitPct"), @"hash_b84edc242cc61abf");
    if (!isdefined(level.var_be39d6b46044f344)) {
        level.var_be39d6b46044f344 = 40;
    }
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
}

// Namespace playerhealth/namespace_35979fbc98ad96b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0
// Size: 0x20
function onplayerspawned() {
    thread namespace_54a2eae43eaa8bf5::manageplayerregen();
    self visionsetthermalforplayer(game["thermal_vision"]);
    namespace_4887422e77f3514e::function_9bc46d4b8891a740();
}

// Namespace playerhealth/namespace_35979fbc98ad96b9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0xb3
function onfullhealth(var_4a2ae12522ad9d95, var_823ca369fafd4a36, var_7f86cf029bef696d) {
    var_e394e626ca540132 = self.health - var_4a2ae12522ad9d95;
    if (var_7f86cf029bef696d) {
        namespace_3e725f3cc58bddd3::combatrecordtacticalstat("equip_adrenaline", var_e394e626ca540132);
        namespace_3c5a4254f2b957ea::incpersstat("stimDamageHealed", var_e394e626ca540132);
        namespace_bd0162aedd8c8594::logevent_playerhealed(self, var_e394e626ca540132, self);
    } else if (!isai(self)) {
        namespace_bd0162aedd8c8594::logevent_playerregen(self, var_e394e626ca540132);
    }
    if (isdefined(self.pers["damageHealed"])) {
        var_e394e626ca540132 = self.health - var_4a2ae12522ad9d95;
        namespace_3c5a4254f2b957ea::incpersstat("damageHealed", var_e394e626ca540132);
    }
    if (var_823ca369fafd4a36) {
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_122e9b7f62bdb160");
    }
}

// Namespace playerhealth/namespace_35979fbc98ad96b9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b1
// Size: 0x142
function getgametypehealthperframe() {
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
        var_194458c6687c5a07 = namespace_82a12c9c6cef3538::gethealthpersec() * 0.05 * var_881fb15f4d296741;
        var_89e7b92573a50713 = max(var_194458c6687c5a07, var_89e7b92573a50713);
    } else if (istrue(self.laststandhealisactive)) {
        var_194458c6687c5a07 = namespace_d9b268ea32202144::laststandheal_gethealthperframe();
        var_89e7b92573a50713 = max(var_194458c6687c5a07, var_89e7b92573a50713);
    } else if (_hasperk("specialty_regenfaster")) {
        var_89e7b92573a50713 = var_89e7b92573a50713 * level.regenfasterhealthmod;
    }
    if (isdefined(level.regenhealthaddfunc)) {
        var_89e7b92573a50713 = [[ level.regenhealthaddfunc ]](var_89e7b92573a50713);
    }
    return var_89e7b92573a50713;
}

