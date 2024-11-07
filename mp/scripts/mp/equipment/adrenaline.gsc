#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_1174abedbefe9ada;
#using script_74b851b7aa1ef32d;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\supers\super_deadsilence.gsc;

#namespace adrenaline;

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac
// Size: 0xda
function function_22fd49689920fdb1() {
    level.var_151df843343d146 = 160;
    level.var_52a6b416b67aad73 = 0;
    var_6f4586deecb9973a = equipment::function_2cbf1e7261f0c42a("equip_adrenaline");
    if (isdefined(var_6f4586deecb9973a)) {
        level.var_151df843343d146 = default_to(var_6f4586deecb9973a.var_1b96072ac8b3137e, 120);
        level.var_52a6b416b67aad73 = default_to(var_6f4586deecb9973a.var_603039d101d23221, 0);
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

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38e
// Size: 0x1fc
function useadrenaline(equipmentref) {
    self endon("disconnect");
    self endon("removeAdrenaline");
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "self_apply");
    wait level.var_52a6b416b67aad73;
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
        if (var_ffe0d0bdd9bd7d44 && (!scripts\cp_mp\utility\game_utility::isbrstylegametype() || !namespace_7789f919216d38a2::function_76ef3c8b8171d2d(self.origin))) {
            namespace_a850435086c88de3::doonactionscoreevent(0, "adrenalineHeal", 15);
        }
    }
    self notify("force_regeneration");
    scripts\mp\gamelogic::sethasdonecombat(self, 1);
    adrenaline_missiononuse();
    self.adrenalinepoweractive = 1;
    if (self.health > 0 && self.health < self.maxhealth) {
        scripts\cp_mp\challenges::function_b0f754c8a379154e("equip_adrenaline", self, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        thread function_46920ff2cd83de61();
    }
    self refreshsprinttime();
    childthread adrenaline_removeonplayernotifies();
    childthread adrenaline_removeondamage();
    childthread adrenaline_removeongameend();
    if (!istrue(self.var_ae0c9ad0db0fa6b8)) {
        var_6f4586deecb9973a = equipment::function_2cbf1e7261f0c42a("equip_adrenaline");
        if (!isdefined(var_6f4586deecb9973a)) {
            return true;
        }
        if (istrue(var_6f4586deecb9973a.var_773f79399f415050)) {
            rechargetime = isdefined(var_6f4586deecb9973a.var_d68b7235ae27c0ca) ? var_6f4586deecb9973a.var_d68b7235ae27c0ca : 30;
            thread adrenalineRecharge(rechargetime);
        }
    }
    return true;
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x593
// Size: 0x21
function removeadrenaline() {
    if (istrue(self.adrenalinepoweractive)) {
        self notify("removeAdrenaline");
        self.adrenalinepoweractive = undefined;
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bc
// Size: 0x1e5
function adrenalineRecharge(rechargetime) {
    self notify("adrenalineRecharge");
    self endon("disconnect");
    self endon("adrenalineRecharge");
    level endon("game_ended");
    while (true) {
        equipment = equipment::getcurrentequipment("secondary");
        if (!isdefined(equipment) || equipment != "equip_adrenaline") {
            return;
        }
        if (!isdefined(self.rechargeequipmentstate)) {
            self.rechargeequipmentstate = spawnstruct();
            self.rechargeequipmentstate.progress = [];
            self.rechargeequipmentstate.recharged = [];
        } else {
            self.rechargeequipmentstate.recharged["secondary"] = undefined;
        }
        ammo = equipment::getequipmentammo(equipment);
        ammomax = equipment::getequipmentmaxammo(equipment);
        state = self.rechargeequipmentstate;
        var_f4f42766799eae36 = 0.5 / rechargetime;
        if (!isdefined(state.progress["secondary"])) {
            state.progress["secondary"] = 0;
        }
        if (ammo < ammomax) {
            state.progress["secondary"] = state.progress["secondary"] + var_f4f42766799eae36;
        } else {
            state.progress["secondary"] = 0;
        }
        if (state.progress["secondary"] > 1 || abs(state.progress["secondary"] - 1) < 0.001) {
            equipment::incrementequipmentslotammo("secondary", 1);
            state.progress["secondary"] = 0;
            state.recharged["secondary"] = 1;
        }
        function_1a1fd182d2636f1f();
        wait 0.5;
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a9
// Size: 0x112
function function_1a1fd182d2636f1f() {
    tacticalprogress = 0;
    var_7732b71eb53c0af1 = -1;
    if (isdefined(self) && isdefined(self.rechargeequipmentstate)) {
        stats::initpersstat("restockCount");
        state = self.rechargeequipmentstate;
        if (isdefined(state.progress["secondary"])) {
            tacticalprogress = state.progress["secondary"];
        }
        foreach (slot, _ in state.recharged) {
            if (slot == "secondary") {
                var_7732b71eb53c0af1 += 2;
                self playlocalsound("ui_restock_tactical");
                stats::incpersstat("restockCount", 1);
            }
        }
    }
    self setclientomnvar("ui_tactical_recharge_progress", tacticalprogress);
    self setclientomnvar("ui_recharge_notify", var_7732b71eb53c0af1);
    self setpowerprogress("secondary", tacticalprogress);
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8c3
// Size: 0x1a
function onequipmenttaken(equipmentref, slot) {
    removeadrenaline();
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8e5
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
    useadrenaline(equipmentref);
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95a
// Size: 0xb
function gethealthpersec() {
    return level.var_151df843343d146;
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96e
// Size: 0x1b
function adrenaline_removeonplayernotifies() {
    waittill_any_2("death", "healed");
    thread removeadrenaline();
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x991
// Size: 0xa3
function adrenaline_removeondamage() {
    while (true) {
        self waittill("damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon);
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && (smeansofdeath == "MOD_TRIGGER_HURT" || smeansofdeath == "MOD_UNKNOWN")) {
            continue;
        }
        thread removeadrenaline();
        return;
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x23
function adrenaline_removeongameend() {
    level waittill("game_ended");
    thread removeadrenaline();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        thread removeAdrenalineSpeed();
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa67
// Size: 0x2b
function adrenaline_missiononuse() {
    if (self.health >= self.maxhealth) {
        self.usedadrenalineatfullhp = 1;
        thread adrenaline_missionondeaththink();
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9a
// Size: 0x31
function adrenaline_missionondeaththink() {
    self endon("disconnect");
    level endon("game_ended");
    self notify("adrenaline_missionOnDeathThink");
    self endon("adrenaline_missionOnDeathThink");
    self waittill("death");
    self.usedadrenalineatfullhp = undefined;
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad3
// Size: 0x21
function removeAdrenalineSpeed() {
    if (istrue(self.var_9aa499f0db2dcb35)) {
        self notify("removeAdrenalineSpeed");
        self.var_9aa499f0db2dcb35 = undefined;
    }
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafc
// Size: 0x12
function function_72775122d66e19f4() {
    self waittill("death");
    thread removeAdrenalineSpeed();
}

// Namespace adrenaline / scripts\mp\equipment\adrenaline
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb16
// Size: 0xd3
function function_46920ff2cd83de61() {
    self endon("disconnect");
    level endon("game_ended");
    self.var_9aa499f0db2dcb35 = 0;
    self lerpfovbypreset("zombiedefault");
    self setclientomnvar("ui_speedboost_overlay", 0);
    for (i = 0; i < 5; i++) {
        self.var_9aa499f0db2dcb35 += level.var_289e4697f2efe65d;
        scripts\mp\weapons::updatemovespeedscale();
        wait 0.2;
    }
    wait 0.5;
    self lerpfovbypreset("default_2seconds");
    thread scripts\mp\supers\super_deadsilence::superdeadsilence_endhudsequence();
    for (i = 0; i < 5; i++) {
        self.var_9aa499f0db2dcb35 -= level.var_289e4697f2efe65d;
        scripts\mp\weapons::updatemovespeedscale();
        wait 0.2;
    }
    self.var_9aa499f0db2dcb35 = 0;
}

