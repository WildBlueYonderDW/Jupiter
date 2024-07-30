#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_293ba44c408fef1;
#using scripts\mp\killstreaks\killstreaks.gsc;

#namespace namespace_e196770be001157d;

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4c2
// Size: 0x2c1
function autoexec main() {
    if (function_8cc09267ba72c7f7()) {
        function_4862ad097a85e6b8(1, 38187, 780);
        function_4862ad097a85e6b8(3, 38188, 1200);
        function_4862ad097a85e6b8(2, 38187, 6250);
        function_4862ad097a85e6b8(5, 38189, 1560);
        function_4862ad097a85e6b8(4, 38188, 9350);
        level.var_7fb91ca0ab6978c0 = &function_7fb91ca0ab6978c0;
        level.var_7b14f9938e117d29 = &onplayerconnect;
        utility::registersharedfunc("game", "mutationModeAchievementStateFetched", &function_7fb91ca0ab6978c0);
        level callback::add("player_connect", &onplayerconnect);
        level callback::add("player_death", &function_2ee91f207f07f84e);
        level callback::add("player_damaged", &function_5aa0301754c24686);
        registersharedfunc("game", "setMutationModePerk01", &setMutationModePerk01);
        registersharedfunc("game", "setMutationModePerk02", &setMutationModePerk02);
        registersharedfunc("game", "setMutationModePerk03", &setMutationModePerk03);
        registersharedfunc("game", "setMutationModePerk04", &setMutationModePerk04);
        registersharedfunc("game", "setMutationModePerk05", &setMutationModePerk05);
        registersharedfunc("game", "unsetMutationModePerk01", &unsetMutationModePerk01);
        registersharedfunc("game", "unsetMutationModePerk02", &unsetMutationModePerk02);
        registersharedfunc("game", "unsetMutationModePerk03", &unsetMutationModePerk03);
        registersharedfunc("game", "unsetMutationModePerk04", &unsetMutationModePerk04);
        registersharedfunc("game", "unsetMutationModePerk05", &unsetMutationModePerk05);
        registersharedfunc("game", "hasMutationModePerk01", &hasMutationModePerk01);
        registersharedfunc("game", "hasMutationModePerk02", &hasMutationModePerk02);
        registersharedfunc("game", "hasMutationModePerk03", &hasMutationModePerk03);
        registersharedfunc("game", "hasMutationModePerk04", &hasMutationModePerk04);
        registersharedfunc("game", "hasMutationModePerk05", &hasMutationModePerk05);
        registersharedfunc("game", "activateMutationModePerk01", &activateMutationModePerk01);
        registersharedfunc("game", "activateMutationModePerk02", &activateMutationModePerk02);
        registersharedfunc("game", "activateMutationModePerk03", &activateMutationModePerk03);
        registersharedfunc("game", "activateMutationModePerk04", &activateMutationModePerk04);
        registersharedfunc("game", "activateMutationModePerk05", &activateMutationModePerk05);
        utility::registersharedfunc("game", "mutationModeGiveEarnedPerks", &mutationModeGiveEarnedPerks);
        setdvarifuninitialized(@"hash_75aeac9bdf42867", 0);
        setdvarifuninitialized(@"hash_2c41f83a90ac7dcf", 1);
        setdvarifuninitialized(@"hash_ef09092a12a6e8c8", 3);
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x78b
// Size: 0xb2
function function_4862ad097a85e6b8(perkslot, achievementid, var_7ab6dba5e9adbffb) {
    if (!isdefined(level.var_8230c93fcd42a213)) {
        level.var_8230c93fcd42a213 = [];
    }
    if (!isdefined(level.var_8230c93fcd42a213[achievementid])) {
        level.var_8230c93fcd42a213[achievementid] = [];
    }
    if (!isdefined(level.var_8230c93fcd42a213[achievementid][perkslot])) {
        level.var_8230c93fcd42a213[achievementid][perkslot] = spawnstruct();
    }
    struct = level.var_8230c93fcd42a213[achievementid][perkslot];
    struct.perkslot = perkslot;
    struct.achievementid = achievementid;
    struct.var_7ab6dba5e9adbffb = var_7ab6dba5e9adbffb;
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x845
// Size: 0x7d
function onplayerconnect(params) {
    player = self;
    if (!matchmakinggame()) {
        player thread function_539593ba238cc26c();
    }
    foreach (achievementid, struct in level.var_8230c93fcd42a213) {
        namespace_c8d5de7d515ce477::getstate(player, achievementid);
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ca
// Size: 0x132
function function_539593ba238cc26c() {
    player = self;
    player endon("disconnect");
    if (getdvarint(@"hash_75aeac9bdf42867", 0) == 1) {
        var_57acddc40b2f741 = function_5ba9e679fe13fe5e(38187, 780);
        progressdata = var_57acddc40b2f741[1];
        achievementid = var_57acddc40b2f741[0];
        player function_7fb91ca0ab6978c0(achievementid, progressdata);
        var_57acadc40b2f0a8 = function_5ba9e679fe13fe5e(38187, 6250);
        progressdata = var_57acadc40b2f0a8[1];
        achievementid = var_57acadc40b2f0a8[0];
        player function_7fb91ca0ab6978c0(achievementid, progressdata);
        var_57acbdc40b2f2db = function_5ba9e679fe13fe5e(38188, 1200);
        progressdata = var_57acbdc40b2f2db[1];
        achievementid = var_57acbdc40b2f2db[0];
        player function_7fb91ca0ab6978c0(achievementid, progressdata);
        var_57ad0dc40b2fdda = function_5ba9e679fe13fe5e(38188, 9350);
        progressdata = var_57ad0dc40b2fdda[1];
        achievementid = var_57ad0dc40b2fdda[0];
        player function_7fb91ca0ab6978c0(achievementid, progressdata);
        var_57ad1dc40b3000d = function_5ba9e679fe13fe5e(38189, 1560);
        progressdata = var_57ad1dc40b3000d[1];
        achievementid = var_57ad1dc40b3000d[0];
        player function_7fb91ca0ab6978c0(achievementid, progressdata);
        if (function_6c88a48a9e942c3d()) {
            mutationModeGiveEarnedPerks();
        }
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa04
// Size: 0x19e
function function_7fb91ca0ab6978c0(achievementid, progressdata) {
    player = self;
    if (!isdefined(player.var_212091c46501637b)) {
        player.var_212091c46501637b = [];
    }
    if (!isdefined(level.var_8230c93fcd42a213[achievementid])) {
        return;
    }
    var_d5f1c80151eeba85 = namespace_c8d5de7d515ce477::function_691880160b33d133("progress");
    progress = 0;
    for (index = 0; index < progressdata.progress_values.size; index++) {
        progress_id = progressdata.progress_values[index].progress_id;
        if (is_equal(var_d5f1c80151eeba85, progress_id)) {
            progress = progressdata.progress_values[index].progress;
            break;
        }
    }
    if (progress > 0) {
        var_369138f6272b4142 = level.var_8230c93fcd42a213[achievementid];
        foreach (perkslot, var_fae1cc711373d0d4 in var_369138f6272b4142) {
            if (progress < var_369138f6272b4142[perkslot].var_7ab6dba5e9adbffb) {
                continue;
            }
            perk = "specialty_mutation_mode_bonus_0" + perkslot;
            if (!array_contains(player.var_212091c46501637b, perk)) {
                player.var_212091c46501637b = array_add(player.var_212091c46501637b, perk);
            }
        }
        player thread packAndSendPerkInfoBits();
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbaa
// Size: 0xeb
function packAndSendPerkInfoBits() {
    player = self;
    player notify("packAndSendPerkInfoBits");
    player endon("packAndSendPerkInfoBits");
    player endon("disconnect");
    waitframe();
    var_79ed6a2e232ea341 = [];
    var_79ed6a2e232ea341[var_79ed6a2e232ea341.size] = 1;
    var_79ed6a2e232ea341[var_79ed6a2e232ea341.size] = 2;
    var_79ed6a2e232ea341[var_79ed6a2e232ea341.size] = 4;
    var_79ed6a2e232ea341[var_79ed6a2e232ea341.size] = 8;
    var_79ed6a2e232ea341[var_79ed6a2e232ea341.size] = 16;
    data = 0;
    foreach (perk in player.var_212091c46501637b) {
        perkslot = int(perk[perk.size - 1]);
        bitfield = var_79ed6a2e232ea341[perkslot - 1];
        data |= bitfield;
    }
    self setclientomnvar("ui_mutation_bonus_perks_unlocked", data);
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9d
// Size: 0x77
function mutationModeGiveEarnedPerks() {
    if (isdefined(self.var_212091c46501637b) && function_6c88a48a9e942c3d()) {
        foreach (perk in self.var_212091c46501637b) {
            if (!_hasperk(perk)) {
                giveperk(perk);
            }
        }
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd1c
// Size: 0x8b
function function_5ba9e679fe13fe5e(achievementid, var_51c6029a1deceecf) {
    progressdata = spawnstruct();
    progressdata.progress_values = [];
    progressdata.progress_values[0] = spawnstruct();
    progressdata.progress_values[0].progress_id = namespace_c8d5de7d515ce477::function_691880160b33d133("progress");
    progressdata.progress_values[0].progress = var_51c6029a1deceecf;
    return [achievementid, progressdata];
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdb0
// Size: 0xc
function setMutationModePerk01() {
    self.var_747fc410433aa51c = 0;
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdc4
// Size: 0x2
function setMutationModePerk02() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdce
// Size: 0x2
function setMutationModePerk03() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd8
// Size: 0x9
function setMutationModePerk04() {
    activateMutationModePerk04();
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde9
// Size: 0x9
function setMutationModePerk05() {
    activateMutationModePerk05();
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdfa
// Size: 0x2
function unsetMutationModePerk01() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe04
// Size: 0x2
function unsetMutationModePerk02() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0e
// Size: 0xc
function unsetMutationModePerk03() {
    self.var_5651e2b694c25c8b = undefined;
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe22
// Size: 0x2
function unsetMutationModePerk04() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe2c
// Size: 0x2
function unsetMutationModePerk05() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe36
// Size: 0x2
function hasMutationModePerk01() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe40
// Size: 0xd
function hasMutationModePerk02() {
    return _hasperk("specialty_mutation_mode_bonus_02");
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe56
// Size: 0xd
function hasMutationModePerk03() {
    return _hasperk("specialty_mutation_mode_bonus_03");
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6c
// Size: 0x2
function hasMutationModePerk04() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe76
// Size: 0xd
function hasMutationModePerk05() {
    return _hasperk("specialty_mutation_mode_bonus_05");
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8c
// Size: 0x2
function activateMutationModePerk01() {
    
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe96
// Size: 0x97
function activateMutationModePerk02() {
    if (!istrue(self.var_1a7940ce78dd1720)) {
        fwd = vectornormalize(anglestoforward(flat_angle(self.angles)));
        grenadeorigin = self.origin + fwd * 16 + (0, 0, 4);
        gren = magicgrenademanual("jup_mutant_leap_impact_mp", grenadeorigin, (0, 0, 0), 0.1);
        gren.var_f08578daebccf4a2 = 1;
        gren detonate(self);
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf35
// Size: 0x81
function function_2ee91f207f07f84e(params) {
    if (!isdefined(params.attacker)) {
        return;
    }
    if (!isplayer(params.attacker)) {
        return;
    }
    if (!isalive(params.attacker)) {
        return;
    }
    attacker = params.attacker;
    if (!function_150d67ea1dfd1f31(params.objweapon)) {
        return;
    }
    if (attacker hasMutationModePerk03()) {
        attacker activateMutationModePerk03();
    }
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbe
// Size: 0x55
function function_150d67ea1dfd1f31(objweapon) {
    if (!isdefined(objweapon)) {
        return false;
    }
    if (!isdefined(objweapon.basename)) {
        return false;
    }
    if (objweapon.basename == "jup_mutant_emp_ball") {
        return false;
    }
    if (issubstr(objweapon.basename, "iw9_me_fists_mp_zmb")) {
        return false;
    }
    return true;
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101c
// Size: 0xd
function activateMutationModePerk03() {
    self.var_5651e2b694c25c8b = 1;
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1031
// Size: 0x14
function activateMutationModePerk04() {
    scripts\mp\killstreaks\killstreaks::givestreakpoints(#"kill", 1);
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104d
// Size: 0x18
function activateMutationModePerk05() {
    self.var_db2bc93f2ccf1f0b = 0;
    giveperk("specialty_eod_vest");
}

// Namespace namespace_e196770be001157d / namespace_d4da1707235a4d96
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106d
// Size: 0x119
function function_5aa0301754c24686(params) {
    if (!isdefined(params.victim)) {
        return;
    }
    if (!isplayer(params.victim)) {
        return;
    }
    if (!isalive(params.victim)) {
        return;
    }
    if (!params.victim [[ getsharedfunc("escort", "isZombie") ]]()) {
        return;
    }
    if (!params.victim hasMutationModePerk05()) {
        return;
    }
    damagetype = utility::getdamagetype(params.smeansofdeath);
    if (!is_equal(damagetype, "splash")) {
        return;
    }
    victim = params.victim;
    victim.var_db2bc93f2ccf1f0b++;
    var_47be5d95802807c9 = getdvarint(@"hash_ef09092a12a6e8c8", 3);
    if (victim hasMutationModePerk05() && victim _hasperk("specialty_eod_vest") && victim.var_db2bc93f2ccf1f0b >= var_47be5d95802807c9) {
        victim removeperk("specialty_eod_vest");
    }
}

