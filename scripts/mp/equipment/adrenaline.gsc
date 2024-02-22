// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\equipment.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_1174abedbefe9ada;
#using script_74b851b7aa1ef32d;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\supers\super_deadsilence.gsc;

#namespace adrenaline;

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0xdc
function function_22fd49689920fdb1() {
    level.var_151df843343d146 = 160;
    level.var_52a6b416b67aad73 = 0;
    var_6f4586deecb9973a = namespace_1a507865f681850e::function_2113b6f7cb462692("adrenaline_mp");
    if (isdefined(var_6f4586deecb9973a)) {
        level.var_151df843343d146 = function_53c4c53197386572(var_6f4586deecb9973a.var_1b96072ac8b3137e, 120);
        level.var_52a6b416b67aad73 = function_53c4c53197386572(var_6f4586deecb9973a.var_603039d101d23221, 0);
    }
    var_358d8a3d2c32cbe6 = getdvarint(@"hash_3b85029cf1af7129", -1);
    var_2eb18ada2bfe5edb = getdvarint(@"hash_d94cba8f8128ba00", -1);
    if (var_358d8a3d2c32cbe6 >= 0) {
        level.var_151df843343d146 = var_358d8a3d2c32cbe6;
    }
    if (var_2eb18ada2bfe5edb >= 0) {
        level.var_52a6b416b67aad73 = var_2eb18ada2bfe5edb;
    }
    level.var_289e4697f2efe65d = getdvarfloat(@"hash_16b5cecddf1fd9a2", 0.07);
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c1
// Size: 0x191
function useadrenaline() {
    self endon("disconnect");
    self endon("removeAdrenaline");
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "self_apply");
    wait(level.var_52a6b416b67aad73);
    if (self.health != self.maxhealth) {
        var_ffe0d0bdd9bd7d44 = 0;
        if (isdefined(self.attackers)) {
            foreach (attacker in self.attackers) {
                if (is_equal(attacker, self)) {
                    continue;
                }
                var_ffe0d0bdd9bd7d44 = 1;
                break;
            }
        }
        if (var_ffe0d0bdd9bd7d44 && (!namespace_36f464722d326bbe::isbrstylegametype() || !namespace_7789f919216d38a2::function_76ef3c8b8171d2d(self.origin))) {
            namespace_a850435086c88de3::doonactionscoreevent(0, "adrenalineHeal", 15);
        }
    }
    self notify("force_regeneration");
    namespace_d576b6dc7cef9c62::sethasdonecombat(self, 1);
    adrenaline_missiononuse();
    self.adrenalinepoweractive = 1;
    if (self.health > 0 && self.health < self.maxhealth * 0.5) {
        namespace_aad14af462a74d08::function_b0f754c8a379154e("equip_adrenaline", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        thread function_46920ff2cd83de61();
    }
    self refreshsprinttime();
    childthread adrenaline_removeonplayernotifies();
    childthread adrenaline_removeondamage();
    childthread adrenaline_removeongameend();
    return 1;
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x22
function removeadrenaline() {
    if (istrue(self.adrenalinepoweractive)) {
        self notify("removeAdrenaline");
        self.adrenalinepoweractive = undefined;
    }
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483
// Size: 0x1b
function onequipmenttaken(equipmentref, slot) {
    removeadrenaline();
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0x6d
function onequipmentfired(equipmentref, slot, objweapon) {
    if (self isthrowingbackgrenade()) {
        self function_9b5704d0633b87fa();
        if (isdefined(objweapon)) {
            ammo = self getweaponammoclip(objweapon);
            newammo = int(max(ammo - 1, 0));
            self setweaponammoclip(objweapon, newammo);
        }
    }
    useadrenaline();
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x519
// Size: 0xc
function gethealthpersec() {
    return level.var_151df843343d146;
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d
// Size: 0x1c
function adrenaline_removeonplayernotifies() {
    waittill_any_2("death", "healed");
    thread removeadrenaline();
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x550
// Size: 0xac
function adrenaline_removeondamage() {
    while (1) {
        objweapon = idflags = var_920ff4456ce9a2fc = var_1d3f20a69ced2dd5 = var_9e834fe6754a9c98 = smeansofdeath = vpoint = vdir = eattacker = idamage = self waittill("damage");
        if (namespace_36f464722d326bbe::isbrstylegametype() && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_UNKNOWN")) {
            continue;
        }
        thread removeadrenaline();
        return;
    }
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x603
// Size: 0x24
function adrenaline_removeongameend() {
    level waittill("game_ended");
    thread removeadrenaline();
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        thread removeadrenalinespeed();
    }
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e
// Size: 0x2c
function adrenaline_missiononuse() {
    if (self.health >= self.maxhealth) {
        self.usedadrenalineatfullhp = 1;
        thread adrenaline_missionondeaththink();
    }
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x661
// Size: 0x32
function adrenaline_missionondeaththink() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("adrenaline_missionOnDeathThink");
    self endon("adrenaline_missionOnDeathThink");
    self waittill("death");
    self.usedadrenalineatfullhp = undefined;
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69a
// Size: 0x22
function removeadrenalinespeed() {
    if (istrue(self.var_9aa499f0db2dcb35)) {
        self notify("removeAdrenalineSpeed");
        self.var_9aa499f0db2dcb35 = undefined;
    }
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c3
// Size: 0x13
function function_72775122d66e19f4() {
    self waittill("death");
    thread removeadrenalinespeed();
}

// Namespace adrenaline/namespace_82a12c9c6cef3538
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dd
// Size: 0xd3
function function_46920ff2cd83de61() {
    self endon("disconnect");
    level endon("game_ended");
    self.var_9aa499f0db2dcb35 = 0;
    self lerpfovbypreset("zombiedefault");
    self setclientomnvar("ui_speedboost_overlay", 0);
    for (i = 0; i < 5; i++) {
        self.var_9aa499f0db2dcb35 = self.var_9aa499f0db2dcb35 + level.var_289e4697f2efe65d;
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        wait(0.2);
    }
    wait(0.5);
    self lerpfovbypreset("default_2seconds");
    thread namespace_41cc735dabd45eb0::superdeadsilence_endhudsequence();
    for (i = 0; i < 5; i++) {
        self.var_9aa499f0db2dcb35 = self.var_9aa499f0db2dcb35 - level.var_289e4697f2efe65d;
        namespace_3bbb5a98b932c46f::updatemovespeedscale();
        wait(0.2);
    }
    self.var_9aa499f0db2dcb35 = 0;
}

