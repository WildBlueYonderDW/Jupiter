#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_189b67b2735b981d;
#using script_4a6760982b403bad;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_7c40fa80892a721;
#using script_372301af73968cb;
#using script_2669878cf5a1b6bc;
#using script_249f45d992af1114;
#using script_52d91cb28006a5bd;
#using script_16ea1b94f0f381b3;

#namespace armor;

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf4f
// Size: 0x1db
function init() {
    /#
        level function_a123482f01487930();
    #/
    level.var_d73697030c5d4e05 = getdvarint(@"hash_a4d532f42d919827", 1) == 1;
    level.var_1f9a4d8f7e4586bb = getdvarint(@"hash_cce2d04880fe5113", 0);
    level.var_4b78859bacc88808 = getdvarint(@"hash_ea4fd87f53ec4456", 50);
    if (!getdvarint(@"hash_cd66a9bfc03ac479", 0)) {
        level.var_fb2b3c3db6061df5 = getmatchrulesdata("commonOption", "plateCarrierEnabled");
    }
    level.spawnarmor = getdvarint(@"hash_d75d5638785f3b09", 0);
    level.spawnarmorplates = getdvarint(@"hash_a6a3fd965485d4bc", 0);
    level.var_23500029f84b30d0 = getdvarint(@"hash_a729499d07bcd90a", 1) == 1;
    level.droparmorondeath = getdvarint(@"hash_8ad1ab9436bccca", 0);
    level.var_2b27ff18b10ad519 = getdvarint(@"hash_28d450f7f28644b7", 0);
    level.var_611672c472b8c9a9 = getdvarint(@"hash_957847f02f2781a8", 0);
    level.var_6835a3d279520dc9 = getdvarint(@"hash_2bcfbe19dac56dd7", 3);
    level.var_699bb1fcae5b2eee = getdvarint(@"hash_be3a8d807c217559", 1);
    level.var_23960e36343a87a6 = getdvarint(@"hash_571f1ab18fcf566c", 1);
    level.var_1fe86bfc07eaa587 = getdvarint(@"hash_8b7eed58460969a6", 0);
    level.var_27720c0c325958c1 = getdvarint(@"hash_d2591f329d2ec7d4", 1) > 0;
    function_abfcdee8fda20a4();
    if (!istrue(level.var_d73697030c5d4e05)) {
        return;
    }
    level.onhelmetsniped = &onhelmetsniped;
    callback::add("player_laststand", &function_5a97c5b79aaf7a5b);
    callback::add("player_spawned", &on_player_spawn);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1132
// Size: 0xf7
function function_a123482f01487930() {
    var_d73697030c5d4e05 = getdvarint(@"hash_4c8ec2fff0818a37", -1);
    spawnarmorplates = getdvarint(@"hash_d7b4016f72a67d64", -1);
    spawnarmor = getdvarint(@"hash_29060eb62a4bfb99", -1);
    droparmorondeath = getdvarint(@"hash_839ead624493a662", -1);
    var_2b27ff18b10ad519 = getdvarint(@"hash_b8b95d553dfaa5a7", -1);
    if (var_d73697030c5d4e05 >= 0) {
        setdvar(@"hash_a4d532f42d919827", var_d73697030c5d4e05);
    }
    if (spawnarmorplates >= 0) {
        setdvar(@"hash_a6a3fd965485d4bc", spawnarmorplates);
    }
    if (spawnarmor >= 0) {
        setdvar(@"hash_d75d5638785f3b09", spawnarmor);
    }
    if (droparmorondeath >= 0) {
        setdvar(@"hash_8ad1ab9436bccca", droparmorondeath);
    }
    if (var_2b27ff18b10ad519 >= 0) {
        setdvar(@"hash_28d450f7f28644b7", var_2b27ff18b10ad519);
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1231
// Size: 0xb1
function function_13caa305c839a278(notification, slotindex) {
    if (isdefined(notification) && notification == "try_use_heal_slot") {
        var_57d8f859dc2dd35d = slotindex;
        var_c84cdf4dbd2b7b98 = 1;
        self.var_d26f815b7eb18327 = undefined;
        if (getdvarint(@"hash_d48a0404793bfcfe", 0) == 1) {
            var_57d8f859dc2dd35d = 0;
        }
        if (var_57d8f859dc2dd35d == 1) {
            var_c84cdf4dbd2b7b98 = self getammocount(function_46cd39650beb293f());
            self.var_d26f815b7eb18327 = 1;
        } else if (isdefined(self.armorqueued) && self.armorqueued > 0 && var_57d8f859dc2dd35d == 2) {
            var_c84cdf4dbd2b7b98 = 0;
        }
        thread function_9f1608bd570dd94c(var_c84cdf4dbd2b7b98);
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12ea
// Size: 0x416
function initarmor(var_b5c8bc15f7117b19) {
    if (!istrue(level.var_d73697030c5d4e05) || istrue(self.armorinitialized)) {
        return;
    }
    self.armorinitialized = 1;
    if (!istrue(var_b5c8bc15f7117b19)) {
        self.armorhealth = 0;
    }
    defaultmaxarmor = 150;
    if (level.gametype == "dungeons") {
        if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_extra_armor")) {
            var_2e1d1af8afe39ba8 = 3;
        } else if (istrue(level.var_fb2b3c3db6061df5)) {
            if (isdefined(level.var_3c8e175d92be01ea)) {
                var_57accdc40b2f50e = [[ level.var_3c8e175d92be01ea ]]();
                self.spawnarmor = var_57accdc40b2f50e[0];
                var_2e1d1af8afe39ba8 = int(self.spawnarmor / 135);
            } else {
                var_2e1d1af8afe39ba8 = getmatchrulesdata("commonOption", "plateCarrierStartLevel");
            }
        } else {
            var_2e1d1af8afe39ba8 = 3;
        }
        defaultmaxarmor = 135 * var_2e1d1af8afe39ba8;
        self.var_bed158a6dfac230d = var_2e1d1af8afe39ba8;
        if (issharedfuncdefined("perk", "hasPerk") || istrue(self.var_163e87b7d147df4e)) {
            if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_increased_armor_health") || istrue(self.var_163e87b7d147df4e)) {
                defaultmaxarmor = 540;
            }
        }
        self.maxarmorhealth = defaultmaxarmor;
        if (istrue(var_b5c8bc15f7117b19)) {
            currentcount = self getammocount(function_46cd39650beb293f());
            function_7293fbe4c07e316f(currentcount);
            return;
        }
        function_2be3084f26829eac(0);
        function_ac7803d45979135c(0);
        return;
    }
    if (istrue(level.var_fb2b3c3db6061df5)) {
        var_2e1d1af8afe39ba8 = getmatchrulesdata("commonOption", "plateCarrierStartLevel");
        if (isdefined(level.gametype) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            if (istrue(level.var_595938569c3fe806)) {
                if (issharedfuncdefined("instanceInventory", "restorePlateCarrier")) {
                    [[ getsharedfunc("instanceInventory", "restorePlateCarrier") ]](self);
                }
                if (isbot(self)) {
                    var_2e1d1af8afe39ba8 = getdvarint(@"hash_734001c752ad4a12", 2);
                } else {
                    var_2e1d1af8afe39ba8 = self getplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel");
                }
                var_cb44a7b7edd34bd = getdvarint(@"hash_8f2b4d22dcdc9934", -1);
                if (var_cb44a7b7edd34bd != -1) {
                    var_2e1d1af8afe39ba8 = var_cb44a7b7edd34bd;
                }
            } else {
                function_7293fbe4c07e316f(var_2e1d1af8afe39ba8);
            }
            if (istrue(level.var_7f3aafcf56c9ce14) && !isdefined(self.var_4045f099f3da4bd) && var_2e1d1af8afe39ba8 > 1) {
                self.var_4045f099f3da4bd = "brloot_plate_carrier_" + var_2e1d1af8afe39ba8;
            }
        }
        self.var_bed158a6dfac230d = var_2e1d1af8afe39ba8;
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            defaultmaxarmor = 50 * var_2e1d1af8afe39ba8;
            self.spawnarmor = defaultmaxarmor;
        } else if (istrue(level.var_2136245d5bcae3e6) && isdefined(level.var_4b78859bacc88808)) {
            defaultmaxarmor = var_2e1d1af8afe39ba8 * level.var_4b78859bacc88808;
            self.spawnarmor = defaultmaxarmor;
        }
    }
    self.maxarmorhealth = getdvarint(@"hash_9c790ecb6ccef79a", defaultmaxarmor);
    function_2be3084f26829eac(0);
    function_ac7803d45979135c(0, 1);
    if (isdefined(self.team)) {
        squadmates = level.teamdata[self.team]["players"];
        if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.sessionsquadid])) {
            squadmates = level.squaddata[self.team][self.sessionsquadid].players;
        }
        foreach (player in squadmates) {
            if (self != player) {
                player setarmoromnvars();
            }
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1708
// Size: 0x28d
function givestartingarmor(armorvalue, var_10fd8ed3fed0e0ae, var_ac1d8e40765a422e) {
    if (!istrue(level.var_d73697030c5d4e05)) {
        return;
    }
    if (getdvarint(@"hash_3b4a48911ecb759e", 0) == 1) {
        return;
    }
    if (istrue(level.var_1f9a4d8f7e4586bb)) {
        function_be5c0cdfa0202544();
        return;
    }
    if (!function_a024d9111228a85e()) {
        function_be5c0cdfa0202544();
        return;
    }
    initarmor(0);
    if (isdefined(level.var_3c8e175d92be01ea)) {
        var_57acbdc40b2f2db = [[ level.var_3c8e175d92be01ea ]](self);
        var_10fd8ed3fed0e0ae = var_57acbdc40b2f2db[1];
        armorvalue = var_57acbdc40b2f2db[0];
    }
    if (!isdefined(armorvalue)) {
        armorvalue = self.spawnarmor;
    }
    if (!isdefined(armorvalue)) {
        armorvalue = level.spawnarmor;
    }
    function_ac7803d45979135c(armorvalue, 1);
    if (istrue(self.var_57c207fde9b78089)) {
        self.var_57c207fde9b78089 = undefined;
    }
    if (!isdefined(var_10fd8ed3fed0e0ae)) {
        var_10fd8ed3fed0e0ae = level.spawnarmorplates;
    }
    if (!isdefined(var_ac1d8e40765a422e)) {
        var_ac1d8e40765a422e = var_10fd8ed3fed0e0ae;
    }
    var_da17fcd71681c773 = isdefined(self.gulaguses) && self.gulaguses > 0;
    var_b44e627d6a911f55 = scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73();
    if (var_b44e627d6a911f55 && var_da17fcd71681c773 && isdefined(self.equipment)) {
        self.equipment["health"] = "equip_armorplate";
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !istrue(level.var_595938569c3fe806)) {
        self.var_bed158a6dfac230d = getmatchrulesdata("commonOption", "plateCarrierStartLevel");
        if (scripts\engine\utility::issharedfuncdefined("player", "isInGulagCheck")) {
            isingulag = [[ scripts\engine\utility::getsharedfunc("player", "isInGulagCheck") ]]();
            if (isingulag) {
                var_10fd8ed3fed0e0ae = 0;
            }
        }
        function_ac7803d45979135c(armorvalue);
    }
    if (scripts\cp_mp\utility\game_utility::function_9cdaadfddeda4d7a()) {
        var_10fd8ed3fed0e0ae += self.pers["armor_buy_plates"];
    }
    if (isdefined(self.var_d0205933322679a9)) {
        var_10fd8ed3fed0e0ae += self.var_d0205933322679a9;
        self.var_d0205933322679a9 = undefined;
    }
    self giveweapon(function_46cd39650beb293f());
    self setclientomnvar("ui_equipment_id_health", 27);
    if (issharedfuncdefined("instanceInventory", "getNumStartUpgradePlates")) {
        var_10fd8ed3fed0e0ae = [[ getsharedfunc("instanceInventory", "getNumStartUpgradePlates") ]](self);
    }
    var_225cc3a0a507a66a = var_10fd8ed3fed0e0ae;
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !istrue(level.var_595938569c3fe806)) {
        var_225cc3a0a507a66a = var_ac1d8e40765a422e;
    }
    if (var_ac1d8e40765a422e < 0) {
        function_be5c0cdfa0202544();
        return;
    }
    function_7293fbe4c07e316f(var_225cc3a0a507a66a);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x199d
// Size: 0x18
function function_be5c0cdfa0202544() {
    self setclientomnvar("ui_equipment_id_health", 27);
    function_7293fbe4c07e316f(0);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19bd
// Size: 0x6c
function function_46cd39650beb293f() {
    if (isdefined(level.equipment.table["equip_armorplate"])) {
        return level.equipment.table["equip_armorplate"].objweapon;
    }
    if (!isdefined(level.var_ae24a96d67a946a9)) {
        level.var_ae24a96d67a946a9 = makeweapon("armorplate");
    }
    return level.var_ae24a96d67a946a9;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a32
// Size: 0x1b
function hasarmor() {
    return isdefined(self.armorhealth) && self.armorhealth > 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a56
// Size: 0x56
function function_9bca5c1d23a3e0b3() {
    if (!isdefined(self.armorhealth) || !isdefined(self.maxarmorhealth)) {
        return 0;
    }
    if (istrue(level.var_fb2b3c3db6061df5)) {
        return (int((self.armorhealth + 5) / level.var_4b78859bacc88808) >= 3);
    }
    return function_e47b13babb51a365();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab4
// Size: 0x25
function function_ac266fc218266d08() {
    if (!istrue(level.var_d73697030c5d4e05)) {
        return 0;
    }
    if (hasarmor()) {
        return self.armorhealth;
    }
    return 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae2
// Size: 0x6a
function function_ac7803d45979135c(value, var_5fb98290d356d5dd) {
    if (!isdefined(value)) {
        return;
    }
    self.armorhealth = int(clamp(value, 0, self.maxarmorhealth));
    if (issharedfuncdefined("player", "setArmorOmnvars")) {
        self [[ getsharedfunc("player", "setArmorOmnvars") ]](var_5fb98290d356d5dd);
        return;
    }
    setarmoromnvars(var_5fb98290d356d5dd);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b54
// Size: 0xe
function function_600f6cf462e983f() {
    return self getammocount(function_46cd39650beb293f());
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6b
// Size: 0x46
function function_77b7145c92102847(armorhealth) {
    if (level.var_4b78859bacc88808 > 0) {
        platecount = float(armorhealth) / float(level.var_4b78859bacc88808);
        return int(ceil(platecount));
    }
    return 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bba
// Size: 0x35
function function_9c6e9a6643b6c9a6(var_7bd6e41ea1e31283) {
    if (!isdefined(var_7bd6e41ea1e31283)) {
        var_7bd6e41ea1e31283 = 1;
    }
    current = self getammocount(function_46cd39650beb293f());
    function_7293fbe4c07e316f(current + var_7bd6e41ea1e31283);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf7
// Size: 0xa7
function function_47320a25b8ee003() {
    var_a81adeb0e1f89320 = 2;
    if (isdefined(level.var_4941fc1ee570d4cb) && istrue(level.var_fb2b3c3db6061df5)) {
        var_a81adeb0e1f89320 = [[ level.var_4941fc1ee570d4cb ]]();
        return var_a81adeb0e1f89320;
    }
    if (isdefined(level.gametypebundle) && isdefined(level.gametypebundle.var_2f37493dac81d735) && level.gametypebundle.var_2f37493dac81d735 > 0) {
        var_a81adeb0e1f89320 = level.gametypebundle.var_2f37493dac81d735;
    }
    if (istrue(self.hasplatepouch)) {
        var_a81adeb0e1f89320 += level.var_6835a3d279520dc9;
    }
    return var_a81adeb0e1f89320;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca7
// Size: 0x4
function function_1348b97715104fe2() {
    return 50;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb4
// Size: 0x2d
function function_79e0ab2aa0304a2c() {
    current = self getammocount(function_46cd39650beb293f());
    var_a81adeb0e1f89320 = function_47320a25b8ee003();
    return current >= var_a81adeb0e1f89320;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1cea
// Size: 0x205
function damagearmor(damage, var_3773b3d5cce15dce, attacker, smeansofdeath, var_5fb98290d356d5dd) {
    if (!hasarmor()) {
        return damage;
    }
    if (isdefined(level.var_e8f60267621fda8d)) {
        var_787585d4e82e1e58 = self [[ level.var_e8f60267621fda8d ]](damage, attacker, smeansofdeath);
    } else {
        var_787585d4e82e1e58 = int(min(self.armorhealth, damage));
    }
    damagepassed = damage - var_787585d4e82e1e58;
    if (isdefined(level.var_49bf61396483bae7)) {
        var_787585d4e82e1e58 = self [[ level.var_49bf61396483bae7 ]](var_787585d4e82e1e58, attacker, smeansofdeath);
    }
    function_ac7803d45979135c(self.armorhealth - var_787585d4e82e1e58, var_5fb98290d356d5dd);
    params = {#attacker:attacker, #var_787585d4e82e1e58:var_787585d4e82e1e58, #armormaxhealth:self.maxarmorhealth, #armorhealth:self.armorhealth};
    callback::callback("on_armor_damage", params);
    self notify("damage_armor", var_787585d4e82e1e58, attacker);
    if (isdefined(attacker)) {
        attacker notify("victim_armor_damaged", self, attacker, damage);
    }
    if (self.armorhealth == 0 && var_787585d4e82e1e58 > 0) {
        if (!istrue(var_3773b3d5cce15dce)) {
            thread function_8832743697109f0d(attacker);
        }
        params = {#attacker:attacker, #var_787585d4e82e1e58:var_787585d4e82e1e58, #armormaxhealth:self.maxarmorhealth, #armorhealth:self.armorhealth};
        callback::callback("on_armor_break", params);
    }
    if (self.armorhealth == 0 && isdefined(self.var_8c5c47f81a1869e5)) {
        [[ self.var_8c5c47f81a1869e5 ]](self, attacker);
    }
    if (isplayer(attacker) && self.armorhealth == 0 && var_787585d4e82e1e58 > 0) {
        attacker thread namespace_27c74152ccb91331::function_556866c3c047a8b8(self);
    }
    if (ent_flag("frenzied_guard_active") && self.armorhealth > 0) {
        damagepassed = 0;
    }
    return damagepassed;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef8
// Size: 0x72
function function_8832743697109f0d(attacker) {
    wait 0.2;
    if (isdefined(self) && isalive(self)) {
        if (isplayer(self)) {
            self playsoundtoplayer("hit_marker_armor_break_plr", self);
            self setscriptablepartstate("armor_break", "armor_break", 0);
            return;
        }
        if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            self playsoundtoplayer("hit_marker_3d_armor_break", attacker, self);
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f72
// Size: 0x14
function breakarmor() {
    damagearmor(self.armorhealth, 1);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f8e
// Size: 0x4c
function function_3f8a6f9da782d418() {
    if (self.maxarmorhealth == 0) {
        return 0;
    }
    armorpercent = self.armorhealth / self.maxarmorhealth;
    if (istrue(level.var_fb2b3c3db6061df5)) {
        armorpercent = self.armorhealth / 150;
    }
    return armorpercent;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe3
// Size: 0x86
function function_55811fc89cf705b5() {
    var_16da20e6451d7744 = [0.67, 0.34, 0];
    var_424327452369b290 = self getclientomnvar("ui_armor_percent");
    var_f0c90b3263cc3702 = function_3f8a6f9da782d418();
    var_e9efe053d24b91d3 = 0;
    for (i = 0; i < var_16da20e6451d7744.size; i++) {
        if (var_424327452369b290 > var_16da20e6451d7744[i] && var_f0c90b3263cc3702 <= var_16da20e6451d7744[i]) {
            var_e9efe053d24b91d3++;
        }
    }
    return var_e9efe053d24b91d3;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2072
// Size: 0x278
function setarmoromnvars(var_5fb98290d356d5dd) {
    if (!isplayer(self)) {
        return;
    }
    armorpercent = function_3f8a6f9da782d418();
    if (!istrue(var_5fb98290d356d5dd)) {
        if (isdefined(self.pers) && isdefined(self.pers["telemetry"]) && isdefined(self.pers["telemetry"].var_5e444dba2b86c3ac)) {
            var_e9efe053d24b91d3 = function_55811fc89cf705b5();
            if (var_e9efe053d24b91d3 > 0) {
                self.pers["telemetry"].var_5e444dba2b86c3ac = self.pers["telemetry"].var_5e444dba2b86c3ac + var_e9efe053d24b91d3;
            }
        }
    }
    if (isdefined(level.var_ade00516ceb8b9dc) && istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = self [[ level.var_ade00516ceb8b9dc ]]();
        armorpercent = maxarmor != 0 ? self.armorhealth / self [[ level.var_ade00516ceb8b9dc ]]() : 0;
    } else if (istrue(level.var_fb2b3c3db6061df5) && !(level.gametype == "dungeons")) {
        armorpercent = self.armorhealth / 150;
    }
    self setclientomnvar("ui_armor_percent", armorpercent);
    self setclientomnvar("ui_equipment_id_health", 27);
    if (isdefined(level.gametype) && level.gametype == "hvt") {
        mask = int(pow(2, 8)) - 1;
        bitoffset = 8;
        var_e14c164e47469d5d = (int(self.armorhealth) & mask) << bitoffset;
        var_f8f977081d3da8b4 = ~(mask << bitoffset);
        prevvalue = self.game_extrainfo;
        cleanedbase = prevvalue & var_f8f977081d3da8b4;
        var_82a90e56e416fa55 = cleanedbase + var_e14c164e47469d5d;
        self.game_extrainfo = var_82a90e56e416fa55;
    }
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team) || squadmemberindex == -1) {
        return;
    }
    if (scripts\cp_mp\utility\game_utility::function_9cdaadfddeda4d7a()) {
        squadmemberindex = 0;
        self setclientomnvar("ui_armor_squad_index_" + squadmemberindex, int(self.armorhealth));
    } else {
        function_1b593d5e688a409c();
    }
    function_dfac14bd66442dca();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f2
// Size: 0x81
function function_dfac14bd66442dca() {
    if (!function_ccf98e6391dd38b9()) {
        return;
    }
    if (level.player hasarmor()) {
        if (level.player haslowarmor()) {
            level.player setclientomnvar("ui_armor_warning", "low_armor");
        } else {
            level.player setclientomnvar("ui_armor_warning", "hide_armor");
        }
        return;
    }
    level.player setclientomnvar("ui_armor_warning", "no_armor");
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x237b
// Size: 0x12
function haslowarmor() {
    return self.armorhealth <= lowarmorthreshold();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2396
// Size: 0x11
function lowarmorthreshold() {
    return self.maxarmorhealth * 0.28;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b0
// Size: 0x276
function function_1b593d5e688a409c() {
    squadmates = level.teamdata[self.team]["players"];
    if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.sessionsquadid])) {
        squadmates = level.squaddata[self.team][self.sessionsquadid].players;
    }
    if (!isdefined(squadmates)) {
        squadmates = level.players;
    }
    armorhealth = int(self.armorhealth);
    maxarmor = self.maxarmorhealth;
    if (!(level.gametype == "dungeons")) {
        var_5524b1700566d195 = 0;
        var_8ed19fd39d6993cf = 150;
    } else {
        var_5524b1700566d195 = 0;
        var_8ed19fd39d6993cf = maxarmor;
    }
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (squadmemberindex == -1) {
        return;
    }
    if (isdefined(level.var_ade00516ceb8b9dc) && istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = [[ level.var_ade00516ceb8b9dc ]]();
        var_5524b1700566d195 = 512;
        var_8ed19fd39d6993cf = 26262;
    } else if (istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = 150;
        var_5524b1700566d195 = 512;
        var_8ed19fd39d6993cf = 26262;
    }
    var_cabc886d846dd979 = maxarmor != 0 ? int(armorhealth * maxarmor / maxarmor) : 0;
    if (istrue(level.var_fb2b3c3db6061df5)) {
        var_8f098991d1e07346 = self.var_bed158a6dfac230d << 9;
        var_cabc886d846dd979 += var_8f098991d1e07346;
        typebits = function_8775d4e6734630c0(self);
        var_6f0cfce91ba1feb3 = typebits << 11;
        var_cabc886d846dd979 += var_6f0cfce91ba1feb3;
        if (istrue(self.var_28c033c3c5b37f1f)) {
            var_cabc886d846dd979 += 16384;
        }
    }
    if (!isdefined(var_cabc886d846dd979)) {
        var_cabc886d846dd979 = var_5524b1700566d195;
    } else {
        var_cabc886d846dd979 = int(clamp(var_cabc886d846dd979, var_5524b1700566d195, var_8ed19fd39d6993cf));
    }
    foreach (player in squadmates) {
        if (isdefined(player)) {
            player setclientomnvar("ui_armor_squad_index_" + squadmemberindex, var_cabc886d846dd979);
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x262e
// Size: 0x13
function function_774133dc8df0ccd5(var_10fd8ed3fed0e0ae) {
    function_7293fbe4c07e316f(var_10fd8ed3fed0e0ae);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2649
// Size: 0x20d
function private function_7293fbe4c07e316f(var_10fd8ed3fed0e0ae) {
    backpackenabled = undefined;
    if (issharedfuncdefined("backpack", "isBackpackInventoryEnabled")) {
        backpackenabled = [[ getsharedfunc("backpack", "isBackpackInventoryEnabled") ]]();
    }
    var_a81adeb0e1f89320 = function_47320a25b8ee003();
    if (!istrue(backpackenabled) || !isdefined(backpackenabled)) {
        var_10fd8ed3fed0e0ae = int(clamp(var_10fd8ed3fed0e0ae, 0, var_a81adeb0e1f89320));
    }
    if (istrue(backpackenabled) || utility::iscp()) {
        var_2c86af91e7e20602 = 0;
        var_ca0b74003e73b2dd = var_a81adeb0e1f89320 - var_10fd8ed3fed0e0ae;
        if (var_ca0b74003e73b2dd > 0 && issharedfuncdefined("backpack", "removeSmallestItemStackBackpack")) {
            var_2c86af91e7e20602 = [[ getsharedfunc("backpack", "removeSmallestItemStackBackpack") ]]("brloot_armor_plate", var_ca0b74003e73b2dd);
        } else if (var_ca0b74003e73b2dd < 0 && issharedfuncdefined("backpack", "addItemToBackpack")) {
            [[ getsharedfunc("backpack", "addItemToBackpackByRef") ]]("brloot_armor_plate", "consumable", var_ca0b74003e73b2dd * -1);
        }
        if (isdefined(self.equipment)) {
            self.equipment["health"] = "equip_armorplate";
        }
        var_1c9dc6c0f33953cd = int(min(var_a81adeb0e1f89320, var_a81adeb0e1f89320 - var_2c86af91e7e20602));
        armorobj = function_46cd39650beb293f();
        if (!self hasweapon(armorobj)) {
            self giveweapon(armorobj);
        }
        self setweaponammoclip(armorobj, var_1c9dc6c0f33953cd);
        self setclientomnvar("ui_equipment_id_health_numCharges", var_1c9dc6c0f33953cd);
        return;
    }
    if (level.gametype == "dungeons" || getdvarint(@"hash_8ad1ab9436bccca", 0) || getdvarint(@"hash_5afa341109e3a9f4", 0)) {
        if (isdefined(self.equipment)) {
            self.equipment["health"] = "equip_armorplate";
        }
    }
    var_a81adeb0e1f89320 = function_47320a25b8ee003();
    var_10fd8ed3fed0e0ae = int(clamp(var_10fd8ed3fed0e0ae, 0, var_a81adeb0e1f89320));
    self setweaponammoclip(function_46cd39650beb293f(), var_10fd8ed3fed0e0ae);
    self setclientomnvar("ui_equipment_id_health_numCharges", var_10fd8ed3fed0e0ae);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x285e
// Size: 0x7b
function function_ef6d8b8c2ed89e8a(count) {
    if (self function_e8e6d2926fd6d61e()) {
        if (!self function_4a13111b050f0b72() || !istrue(self.var_b43706cbb600fe5a)) {
            waitframe();
            amount = 1;
            if (isdefined(count)) {
                amount = count;
            }
            if (self function_6adb0980232f3eff()) {
                amount = self getammocount(function_46cd39650beb293f());
            }
            if (amount) {
                self.var_b846f916af2f7782 = 1;
                function_9f1608bd570dd94c(amount);
                self.var_b43706cbb600fe5a = 1;
            }
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28e1
// Size: 0x105
function function_9f1608bd570dd94c(var_c84cdf4dbd2b7b98) {
    if (!istrue(level.var_d73697030c5d4e05)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("try_use_heal_slot");
    if (!function_cf37789d18fbcc1b()) {
        level.player setclientomnvar("ui_armor_warning", "hide_armor");
        waitframe();
        if (self.armorhealth >= self.maxarmorhealth) {
            level.player setclientomnvar("ui_armor_warning", "max_armor");
            return;
        }
        var_276f41532514ddcc = self getammocount(function_46cd39650beb293f());
        if (var_276f41532514ddcc == 0) {
            level.player setclientomnvar("ui_armor_warning", "no_armor");
        }
        return;
    }
    if (!isdefined(var_c84cdf4dbd2b7b98)) {
        var_c84cdf4dbd2b7b98 = 1;
    }
    if (istrue(self.insertingarmorplate)) {
        if (canqueuearmorbydefault()) {
            function_2be3084f26829eac(self.armorqueued + var_c84cdf4dbd2b7b98);
        }
    } else {
        function_2be3084f26829eac(var_c84cdf4dbd2b7b98);
    }
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "use_armor");
    thread function_f2a4a5aed60e552d();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29ee
// Size: 0xfe
function function_2be3084f26829eac(var_d2a5ddc13d5ced30) {
    var_971d04134a431bfd = int(self.armorhealth / level.var_4b78859bacc88808);
    var_1688c3e909c6563f = self.maxarmorhealth / level.var_4b78859bacc88808;
    var_a02589dfaaa6749 = var_1688c3e909c6563f - var_971d04134a431bfd;
    var_f18c4218c7058e95 = int((self.armorhealth + 5) / level.var_4b78859bacc88808);
    var_2d430af8e8aea492 = self.maxarmorhealth - self.armorhealth > level.var_4b78859bacc88808;
    if (var_2d430af8e8aea492 && var_f18c4218c7058e95 > var_971d04134a431bfd) {
        var_a02589dfaaa6749 = var_1688c3e909c6563f - var_f18c4218c7058e95;
    }
    var_73bd1164e54e82ba = self getammocount(function_46cd39650beb293f());
    var_d2a5ddc13d5ced30 = clamp(var_d2a5ddc13d5ced30, 0, min(var_a02589dfaaa6749, var_73bd1164e54e82ba));
    self.armorqueued = var_d2a5ddc13d5ced30;
    self setclientomnvar("ui_armor_queued_count", int(var_d2a5ddc13d5ced30));
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2af4
// Size: 0xb3
function private function_7cb27dc2ce16cb4f() {
    if (getdvarint(@"hash_d48a0404793bfcfe", 0) == 1) {
        self.insertingarmorplate = 0;
        self setclientomnvar("ui_inserting_armor_plate", 0);
        if (isdefined(level.equipment.table["equip_armor_onehanded"]) && isdefined(level.equipment.table["equip_armor_onehanded"].objweapon)) {
            armorweapon = level.equipment.table["equip_armor_onehanded"].objweapon;
            if (self hasweapon(armorweapon)) {
                _takeweapon(armorweapon);
            }
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2baf
// Size: 0x12
function private on_player_spawn(sparams) {
    function_7cb27dc2ce16cb4f();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x2bc9
// Size: 0x12
function private function_5a97c5b79aaf7a5b(sparams) {
    function_7cb27dc2ce16cb4f();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2be3
// Size: 0x3c3
function private function_f2a4a5aed60e552d() {
    self endon("disconnect");
    self endon("death");
    self endon("last_stand_start");
    if (istrue(self.insertingarmorplate) || self isswitchingweapon()) {
        return;
    }
    if (getdvarint(@"hash_d48a0404793bfcfe", 0) == 1) {
        if (!isnullweapon(self getheldoffhand())) {
            if (issharedfuncdefined("supers", "getSuperRefForSuperOffhand")) {
                superref = self [[ getsharedfunc("supers", "getSuperRefForSuperOffhand") ]](self getheldoffhand());
                if (isdefined(superref)) {
                    return;
                }
            }
            thread function_55c8966f39db409();
        }
        if (!function_cf37789d18fbcc1b() || istrue(self.stoparmorinsert)) {
            return;
        }
        isplayerreloading = self isreloading();
        if (isplayerreloading) {
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.reloadcanceltime = getsystemtimeinmicroseconds();
            var_5814d27874b48e54.cancelreason = "EQUIP_ARMOR";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
        if (isdefined(level.equipment.table["equip_armor_onehanded"]) && isdefined(level.equipment.table["equip_armor_onehanded"].objweapon)) {
            armorweapon = level.equipment.table["equip_armor_onehanded"].objweapon;
            waittime = 1.1;
            if (scripts\engine\utility::issharedfuncdefined("zombie_perks", "has_zombie_perk")) {
                if (self [[ scripts\engine\utility::getsharedfunc("zombie_perks", "has_zombie_perk") ]]("specialty_speedcola")) {
                    if (isdefined(level.equipment.table["equip_armor_onehanded_quick"]) && isdefined(level.equipment.table["equip_armor_onehanded_quick"].objweapon)) {
                        waittime = 0.5;
                        armorweapon = level.equipment.table["equip_armor_onehanded_quick"].objweapon;
                    }
                }
            }
            self.insertingarmorplate = 1;
            self setclientomnvar("ui_inserting_armor_plate", 1);
            while (function_4e03f222ed8b54a1()) {
                self giveandfireoffhand(armorweapon);
                wait waittime;
                usearmorplate();
                if (self hasweapon(armorweapon)) {
                    _takeweapon(armorweapon);
                }
                var_cf97caf9e7ec424 = (1000 - 900) / 1000;
                wait var_cf97caf9e7ec424;
            }
            function_2be3084f26829eac(0);
            self.insertingarmorplate = 0;
            self setclientomnvar("ui_inserting_armor_plate", 0);
            self notify("insertArmorComplete");
        }
        return;
    }
    isplayerreloading = self isreloading();
    if (isplayerreloading) {
        var_5814d27874b48e54 = spawnstruct();
        var_5814d27874b48e54.player = self;
        var_5814d27874b48e54.reloadcanceltime = getsystemtimeinmicroseconds();
        var_5814d27874b48e54.cancelreason = "EQUIP_ARMOR";
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
    }
    weaponobj = makeweapon("iw9_armor_plate_deploy_mp");
    streakinfo = scripts\cp_mp\utility\killstreak_utility::createstreakinfo("", self);
    streakinfo.armorweapon = weaponobj;
    streakinfo.var_9d7c6ee83f507a26 = val::get("weapon_switch") || val::get("script_weapon_switch");
    function_43d4382b6cea4df9(1);
    thread function_1240021a9c87bcdb();
    thread watchgameend(streakinfo);
    switchresult = scripts\cp_mp\killstreaks\killstreakdeploy::switchtodeployweapon(weaponobj, streakinfo, &insertarmor, undefined, undefined, undefined, undefined, 0);
    if (isdefined(switchresult) && !istrue(switchresult)) {
        self notify("try_armor_cancel", "switch_failed");
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fae
// Size: 0x203
function function_55c8966f39db409() {
    self endon("armor_restoreHeldOffhand");
    self endon("death_or_disconnect");
    self.var_35a985f3820afb24 = self getheldoffhand();
    if (!isdefined(self.var_35a985f3820afb24) || isnullweapon(self.var_35a985f3820afb24)) {
        return;
    }
    equipmentref = undefined;
    if (issharedfuncdefined("equipment", "getEquipmentRefFromWeapon")) {
        equipmentref = self [[ getsharedfunc("equipment", "getEquipmentRefFromWeapon") ]](self.var_35a985f3820afb24);
    }
    if (!isdefined(equipmentref)) {
        return;
    }
    if (issharedfuncdefined("equipment", "hasEquipment") && self [[ getsharedfunc("equipment", "hasEquipment") ]](equipmentref)) {
        self.var_f776293f974ba32a = 1;
        if (issharedfuncdefined("equipment", "getEquipmentAmmo")) {
            self.var_f776293f974ba32a = self [[ getsharedfunc("equipment", "getEquipmentAmmo") ]](equipmentref);
        }
        _takeweapon(self.var_35a985f3820afb24);
        wait 0.05;
        if (issharedfuncdefined("equipment", "hasEquipment") && self [[ getsharedfunc("equipment", "hasEquipment") ]](equipmentref)) {
            _giveweapon(self.var_35a985f3820afb24);
            slot = self [[ getsharedfunc("equipment", "findEquipmentSlot") ]](equipmentref);
            assertex(isdefined(slot) && (slot == "primary" || slot == "secondary"), "armorTakeOffHand is trying to " + equipmentref + ", but its slot is invalid.");
            if (slot == "primary") {
                self assignweaponoffhandprimary(self.var_35a985f3820afb24);
            } else if (slot == "secondary") {
                self assignweaponoffhandsecondary(self.var_35a985f3820afb24);
            }
            if (issharedfuncdefined("equipment", "setEquipmentAmmo")) {
                self [[ getsharedfunc("equipment", "setEquipmentAmmo") ]](equipmentref, self.var_f776293f974ba32a);
            }
            self.var_35a985f3820afb24 = undefined;
            self.var_f776293f974ba32a = undefined;
        }
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31b9
// Size: 0x1b
function function_df0c4be0709e8116(equipmentref, slot, objweapon) {
    
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31dc
// Size: 0x13
function function_dd4193b50e36fb2c(equipmentref, equipmentslot) {
    
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x31f7
// Size: 0x252
function private usearmorplate() {
    assert(isdefined(self.maxarmorhealth) && self.maxarmorhealth > 0);
    if (isdefined(self.armorqueued)) {
        var_1d614448f6cac2d7 = self.armorqueued - 1;
        if (getdvarint(@"hash_d48a0404793bfcfe", 0) != 1) {
            if (istrue(self.var_d26f815b7eb18327)) {
                var_1d614448f6cac2d7 = 1;
            }
        }
        function_2be3084f26829eac(var_1d614448f6cac2d7);
    }
    var_1c07ef7bc0e3723a = 0;
    if (isdefined(level.var_3daf6a38c04a7dd)) {
        var_1c07ef7bc0e3723a = self [[ level.var_3daf6a38c04a7dd ]]();
    } else if (level.var_699bb1fcae5b2eee == 1) {
        var_43167c86311c997e = max(1, function_85e373bb15921966());
        var_1c07ef7bc0e3723a = int(self.armorhealth + var_43167c86311c997e);
    } else {
        var_830009cefce35a66 = self.armorhealth + 5;
        var_1c07ef7bc0e3723a = clamp(var_830009cefce35a66, 0, self.maxarmorhealth);
        var_43167c86311c997e = max(1, function_85e373bb15921966());
        var_1c07ef7bc0e3723a = int(var_1c07ef7bc0e3723a / var_43167c86311c997e) * var_43167c86311c997e + var_43167c86311c997e;
    }
    if (isdefined(self.pers["telemetry"]) && isdefined(self.pers["telemetry"].var_9bc5683c9fe914f0)) {
        self.pers["telemetry"].var_9bc5683c9fe914f0++;
    }
    function_ac7803d45979135c(var_1c07ef7bc0e3723a);
    currentcount = self getammocount(function_46cd39650beb293f());
    newcount = int(max(0, currentcount - 1));
    function_7293fbe4c07e316f(newcount);
    if (scripts\cp_mp\utility\game_utility::function_9cdaadfddeda4d7a()) {
        self.pers["armor_buy_plates"] = newcount;
    }
    scripts\cp_mp\challenges::onuseitem("armor_plate");
    if (scripts\cp_mp\utility\player_utility::player_hasperk("specialty_reduce_regen_delay_on_plate") && scripts\cp_mp\utility\game_utility::isbrstylegametype() && level.var_1fe86bfc07eaa587) {
        namespace_f8d3520d3483c1::function_7f2cfc2ced509047();
    }
    if (issharedfuncdefined("game", "onArmorPlateEquipped")) {
        function_f3bb4f4911a1beb2("game", "onArmorPlateEquipped");
    }
    self notify("armor_plate_inserted");
    if (function_ac266fc218266d08() == self.maxarmorhealth) {
        level notify("equiped_full_armor_" + self.team, self);
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3451
// Size: 0x32
function private function_7f2cfc2ced509047() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("regenDelayReduce_delayedRegen");
    self endon("regenDelayReduce_delayedRegen");
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("regenDelayReduce_delayedRegen", 1, 140);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x348b
// Size: 0xab
function function_85e373bb15921966() {
    if (issharedfuncdefined("perk", "hasPerk") || istrue(self.var_163e87b7d147df4e)) {
        if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_increased_armor_health") || istrue(self.var_163e87b7d147df4e)) {
            return int(self.maxarmorhealth / 3);
        } else if (istrue(level.var_7f3aafcf56c9ce14) && self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_pc_tempered") && isdefined(self.var_42294cc94c3bf2c3)) {
            return self.var_42294cc94c3bf2c3;
        }
    }
    return level.var_4b78859bacc88808;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x353f
// Size: 0x11c
function private function_1240021a9c87bcdb() {
    self endon("insertArmorComplete");
    self endon("disconnect");
    function_451b277f45c6174f();
    thread function_a5e267fd4b705fd6();
    thread function_d9c269fb5751937b();
    self.stoparmorinsert = 0;
    while (true) {
        childthread function_ebbb01a971edd5b3();
        childthread function_8a7d870c4615a027();
        self waittill("armor_cancel", mainreason, specificreason);
        self notify("armor_cancel_watch_stop");
        if (mainreason == "try_armor_cancel" && self function_96f814cc20cbf3d5()) {
            self setclientomnvar("ui_armor_forced_notify", gettime());
            if (isdefined(self.armorqueued) && self.armorqueued > 1) {
                if (getdvarint(@"hash_c7714fe0d53c925c", 1) == 1) {
                    function_2be3084f26829eac(1);
                }
            }
            continue;
        }
        if (!isbot(self) && istrue(self.var_b846f916af2f7782)) {
            function_9cda8706bc1d6a7d(mainreason, specificreason);
        }
        break;
    }
    self notify("cancel_all_killstreak_deployments");
    self.stoparmorinsert = 1;
    self.var_b846f916af2f7782 = 0;
    thread insertArmorComplete();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3663
// Size: 0x3a
function private watchgameend(streakinfo) {
    self endon("death");
    self endon("disconnect");
    self endon("armor_plate_done");
    level waittill("game_ended");
    scripts\cp_mp\killstreaks\killstreakdeploy::getridofkillstreakdeployweapon(streakinfo.armorweapon);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x36a5
// Size: 0x39
function private function_a5e267fd4b705fd6() {
    self endon("disconnect");
    self endon("insertArmorComplete");
    msg = waittill_any_return_3("player_switched_weapon", "player_switched_to_grenade", "player_interaction");
    self notify("try_armor_cancel", msg);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x36e6
// Size: 0xd5
function private function_d9c269fb5751937b() {
    self endon("disconnect");
    self endon("insertArmorComplete");
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename != "iw9_armor_plate_deploy_mp") {
        if (self isonladder()) {
            self notify("try_armor_cancel", "ladder_used");
        }
        waitframe();
    }
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
        if (self isonladder()) {
            self notify("try_armor_cancel", "ladder_used");
        }
        waitframe();
    }
    self notify("try_armor_cancel", "armor_unselected");
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x37c3
// Size: 0x2a
function private function_ebbb01a971edd5b3() {
    self endon("armor_cancel_watch_stop");
    self waittill("try_armor_cancel", var_51b71f011305b016);
    self notify("armor_cancel", "try_armor_cancel", var_51b71f011305b016);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x37f5
// Size: 0x41
function private function_8a7d870c4615a027() {
    self endon("armor_cancel_watch_stop");
    msg = waittill_any_return_6("death", "mantle_start", "last_stand_start", "scr_change_swim_state", "special_weapon_fired", "armor_plate_done");
    self notify("armor_cancel", msg);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x383e
// Size: 0x57
function private function_9cda8706bc1d6a7d(mainreason, specificreason) {
    var_5814d27874b48e54 = spawnstruct();
    var_5814d27874b48e54.player = self;
    var_5814d27874b48e54.mainreason = mainreason;
    var_5814d27874b48e54.specificreason = specificreason;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_armor_auto_apply", var_5814d27874b48e54);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x389d
// Size: 0x9
function private canqueuearmorbydefault() {
    return !is_player_gamepad_enabled();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x38af
// Size: 0x134
function private function_43d4382b6cea4df9(var_e12d78c11d85d9c2) {
    if (var_e12d78c11d85d9c2) {
        if (self function_96f814cc20cbf3d5()) {
            val::set("armor", "weapon_switch", 0);
            val::set("armor", "script_weapon_switch", 0);
            val::set("armor", "mantle", 0);
        }
        val::set("armor", "melee", 0);
        val::set("armor", "killstreaks", 0);
        val::set("armor", "supers", 0);
        val::set("armor", "crate_use", 0);
        val::set("armor", "offhand_weapons", 0);
        val::set("armor", "offhand_throwback", 0);
        val::set("armor", "offhand_weapons", 0);
        val::set("armor", "supersprint", 0);
        if (!istrue(level.var_27720c0c325958c1)) {
            val::set("armor", "sprint", 0);
        }
        self function_8b7829a01e6b58aa(0);
    } else {
        val::reset_all("armor");
        self function_8b7829a01e6b58aa(1);
    }
    self.insertingarmorplate = var_e12d78c11d85d9c2;
    self setclientomnvar("ui_inserting_armor_plate", var_e12d78c11d85d9c2);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x39eb
// Size: 0x1cc
function private insertarmor(streakinfo) {
    self endon("disconnect");
    self endon("insertArmorComplete");
    if (!function_cf37789d18fbcc1b() || istrue(self.stoparmorinsert)) {
        return;
    }
    currenttime = gettime();
    var_796ba59fc6c2ac9b = currenttime + 1300;
    var_3f536cbd3a3c3591 = 1567;
    armorendtime = 1300;
    var_48115c25c4a06354 = 0;
    self setclientomnvar("ui_inserting_armor_plate_timer", 1567);
    while (currenttime < var_796ba59fc6c2ac9b) {
        if (!isdefined(streakinfo.armorweapon) || streakinfo.armorweapon != self getcurrentweapon()) {
            return;
        }
        waitframe();
        currenttime = gettime();
    }
    usearmorplate();
    self setclientomnvar("ui_inserting_armor_plate_timer", 0);
    var_4d5f2c05f11db0ec = (var_3f536cbd3a3c3591 - armorendtime) / 1000;
    wait var_4d5f2c05f11db0ec;
    while (function_4e03f222ed8b54a1()) {
        var_bef0447316d92bfd = gettime() + 900;
        self setclientomnvar("ui_inserting_armor_plate_timer", 1000);
        while (gettime() < var_bef0447316d92bfd) {
            if (!isdefined(streakinfo.armorweapon) || streakinfo.armorweapon != self getcurrentweapon()) {
                return;
            }
            waitframe();
        }
        usearmorplate();
        self setclientomnvar("ui_inserting_armor_plate_timer", 0);
        var_cf97caf9e7ec424 = (1000 - 900) / 1000;
        if (iscp()) {
            var_cf97caf9e7ec424 = var_4d5f2c05f11db0ec;
        }
        wait var_cf97caf9e7ec424;
    }
    if (issharedfuncdefined("equipment", "autorefillequipmentammo")) {
        self [[ getsharedfunc("equipment", "autorefillequipmentammo") ]]("equip_armorplate");
    }
    self notify("armor_plate_done");
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3bbf
// Size: 0x82
function private insertArmorComplete() {
    self endon("disconnect");
    self notify("insertArmorComplete");
    function_25aae4d93a36c291();
    scripts\common\values::set("armor", "supers", 1);
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
        waitframe();
    }
    waitframe();
    function_2be3084f26829eac(0);
    function_43d4382b6cea4df9(0);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c49
// Size: 0x13c
function function_cf37789d18fbcc1b() {
    if (!isalive(self) || self isparachuting() || self isskydiving() || self isonladder() || self function_9cc921a57ff4deb5()) {
        return false;
    }
    if (self.armorhealth >= self.maxarmorhealth) {
        return false;
    }
    if (!scripts\common\values::get("armor")) {
        return false;
    }
    if (istrue(self.inlaststand) || isdefined(self.usingremote) || istrue(self.isdeploying) || istrue(self.usingascender) || scripts\cp_mp\utility\player_utility::function_b7869f6d9d4242e3(self) || istrue(self.isjuggernaut) || istrue(self.var_859654e0445a36d9)) {
        return false;
    }
    if (!istrue(self.var_4b6e638cb12a3e90) && isdefined(self.super) && istrue(self.super.isinuse) && !function_9719a1e79de2989f(self.super.staticdata.ref)) {
        return false;
    }
    currentcount = self getammocount(function_46cd39650beb293f());
    if (currentcount == 0) {
        return false;
    }
    return true;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d8e
// Size: 0xf2
function function_9719a1e79de2989f(supername) {
    if (!isdefined(supername)) {
        return true;
    }
    if (isdefined(self.super.staticdata) && isdefined(self.super) && isdefined(self.super.staticdata.bundle) && istrue(self.super.staticdata.bundle.var_cf37789d18fbcc1b)) {
        return true;
    }
    if (scripts\engine\utility::issharedfuncdefined("supers", "superHasTimedUsage")) {
        if (self [[ scripts\engine\utility::getsharedfunc("supers", "superHasTimedUsage") ]](self.super)) {
            return true;
        }
    }
    if (scripts\engine\utility::issharedfuncdefined("supers", "superHasAmmoUsage")) {
        if (self [[ scripts\engine\utility::getsharedfunc("supers", "superHasAmmoUsage") ]](self.super)) {
            return true;
        }
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e89
// Size: 0x52
function private function_4e03f222ed8b54a1() {
    if (!function_cf37789d18fbcc1b()) {
        return false;
    }
    var_a5ea2300efaaa6a7 = is_player_gamepad_enabled() && self weaponswitchbuttonpressed();
    hasarmorqueue = isdefined(self.armorqueued) && self.armorqueued > 0;
    return var_a5ea2300efaaa6a7 || hasarmorqueue;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3ee4
// Size: 0xb5
function private function_451b277f45c6174f() {
    if (!isbot(self)) {
        self notifyonplayercommand("player_switched_weapon", "+weapnext");
        self notifyonplayercommand("player_switched_weapon", "+weapprev");
        self notifyonplayercommand("player_switched_weapon", "selectweapon1");
        self notifyonplayercommand("player_switched_weapon", "selectweapon2");
        self notifyonplayercommand("player_switched_weapon", "selectweapon3");
        self notifyonplayercommand("player_interaction", "+ads_attack");
    }
    self notifyonplayercommand("player_interaction", "+attack");
    self notifyonplayercommand("player_switched_to_grenade", "+smoke");
    self notifyonplayercommand("player_switched_to_grenade", "+frag");
    self notifyonplayercommand("player_interaction", "+melee_zoom");
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3fa1
// Size: 0xb5
function private function_25aae4d93a36c291() {
    if (!isbot(self)) {
        self notifyonplayercommandremove("player_switched_weapon", "+weapnext");
        self notifyonplayercommandremove("player_switched_weapon", "+weapprev");
        self notifyonplayercommandremove("player_switched_weapon", "selectweapon1");
        self notifyonplayercommandremove("player_switched_weapon", "selectweapon2");
        self notifyonplayercommandremove("player_switched_weapon", "selectweapon3");
        self notifyonplayercommandremove("player_interaction", "+ads_attack");
    }
    self notifyonplayercommandremove("player_interaction", "+attack");
    self notifyonplayercommandremove("player_switched_to_grenade", "+smoke");
    self notifyonplayercommandremove("player_switched_to_grenade", "+frag");
    self notifyonplayercommandremove("player_interaction", "+melee_zoom");
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x405e
// Size: 0xc
function hashelmet() {
    return isdefined(self.br_helmetlevel);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4073
// Size: 0x1b
function function_47ad39003b16cf4c() {
    return isdefined(self.helmethealth) && self.helmethealth > 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4097
// Size: 0x4b
function helmetitemtypeforlevel(helmetlevel) {
    switch (helmetlevel) {
    case 1:
        return "brloot_armor_helmet_1";
    case 2:
        return "brloot_armor_helmet_2";
    case 3:
        return "brloot_armor_helmet_3";
    }
    return undefined;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40eb
// Size: 0x47
function takehelmet(helmetitem, helmetlevel) {
    self.br_helmetlevel = helmetlevel;
    row = level.br_pickups.br_itemrow[helmetitem.scriptablename];
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x413a
// Size: 0x6e
function function_cd4a78b4a236ddc8(armorname) {
    helmetlevel = 0;
    if (armorname == "equip_helmet_1") {
        helmetlevel = 1;
    } else if (armorname == "equip_helmet_2") {
        helmetlevel = 2;
    } else if (armorname == "equip_helmet_3") {
        helmetlevel = 3;
    }
    if (helmetlevel > 0) {
        if (!isdefined(self.br_helmetlevel) || self.br_helmetlevel < helmetlevel) {
            return true;
        }
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41b1
// Size: 0x149
function function_e71f062243ea8827(damage, var_3773b3d5cce15dce, attacker) {
    if (!isdefined(self.helmethealth) || self.helmethealth <= 0) {
        return damage;
    }
    excessdamage = damage - self.helmethealth;
    self.helmethealth = int(clamp(self.helmethealth - damage, 0, self.var_cfc69e5588a5bed6));
    if (istrue(self.var_895dae193cfaac3a)) {
        if (self.helmethealth / self.var_cfc69e5588a5bed6 < 0.45 && !istrue(self.helmetdamaged)) {
            self setscriptablepartstate("helmet", "damaged");
            self.helmetdamaged = 1;
        }
    }
    if (self.helmethealth == 0) {
        if (isdefined(self.var_cd6a3a50f09688b9)) {
            [[ self.var_cd6a3a50f09688b9 ]](self, attacker);
        }
        if (!istrue(var_3773b3d5cce15dce)) {
            thread function_1d16645547af7d5b(attacker);
        }
        if (isdefined(attacker)) {
            attacker.brokehelmet = gettime();
        }
        if (istrue(self.var_89610e737d06f12e)) {
            return 0;
        }
        return excessdamage;
    }
    if (isdefined(attacker)) {
        attacker.hithelmet = gettime();
        thread function_908110bdfb8e8ba(attacker);
    }
    return 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4303
// Size: 0x64
function function_908110bdfb8e8ba(attacker) {
    wait 0.15;
    if (isdefined(self) && isalive(self)) {
        if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            attacker playsoundtoplayer("bullet_plr_helmet_impact", attacker, self);
            self playsound("bullet_npc_helmet_impact", attacker, self);
            return;
        }
        self playsound("bullet_npc_helmet_impact");
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x436f
// Size: 0x64
function function_1d16645547af7d5b(attacker) {
    wait 0.15;
    if (isdefined(self) && isalive(self)) {
        if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            attacker playsoundtoplayer("bullet_plr_helmet_break", attacker, self);
            self playsound("bullet_npc_helmet_break", attacker, self);
            return;
        }
        self playsound("bullet_npc_helmet_break");
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43db
// Size: 0xbd
function damagehelmet(damage, snipershot, impactdir) {
    if (!isdefined(snipershot) || !level.var_23500029f84b30d0) {
        snipershot = 0;
    }
    damagereduction = 1;
    switch (self.br_helmetlevel) {
    case 1:
        damagereduction = 0.85;
        break;
    case 2:
        damagereduction = 0.7;
        break;
    case 3:
        damagereduction = 0.7;
        break;
    default:
        break;
    }
    if (snipershot) {
        if (isdefined(level.onhelmetsniped)) {
            [[ level.onhelmetsniped ]](self, impactdir);
        }
    }
    return damagereduction;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x44a1
// Size: 0x1b4
function private popoffhelmet(impactdir, playerangles, playerorigin) {
    level endon("game_ended");
    helmettag = self gettagorigin("j_helmet");
    if (!isdefined(helmettag)) {
        helmettag = playerorigin + (0, 0, 80);
    }
    helmet = spawn("script_model", self gettagorigin("j_helmet"));
    helmet setmodel("loot_helmet");
    helmet.angles = playerangles;
    up = anglestoup(playerangles);
    forward = impactdir;
    vel = vectornormalize(forward + up) * 2500;
    helmet physicslaunchserver(helmet.origin, vel);
    helmetitem = "brloot_armor_helmet_" + self.br_helmetlevel;
    var_29511a1c049e1067 = 15;
    var_f246e6dc812fbcfe = 0.1;
    var_29511a1c049e1067 *= 1 / var_f246e6dc812fbcfe;
    previousorigin = helmet.origin;
    for (i = 0; i < var_29511a1c049e1067; i++) {
        wait var_f246e6dc812fbcfe;
        compareorigin = previousorigin - helmet.origin;
        if (compareorigin[0] < 2 && compareorigin[1] < 2 && compareorigin[2] < 2 && compareorigin[0] > -2 && compareorigin[1] > -2 && compareorigin[2] > -2) {
            return;
        }
        previousorigin = helmet.origin;
    }
    helmet delete();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x465d
// Size: 0x42
function private onhelmetsniped(victim, impactdir) {
    if (isdefined(victim)) {
        victim thread popoffhelmet(impactdir, victim.angles, victim.origin);
    }
    self.br_helmetlevel = undefined;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46a7
// Size: 0x4f
function function_92fec40b905c5112() {
    if (isalive(self) && isdefined(self.armorhealth) && self.armorhealth < self.maxarmorhealth) {
        return true;
    } else if (self.pers["armor_buy_plates_instant"] < 3) {
        return true;
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46ff
// Size: 0x75
function function_4f88731347251184() {
    level endon("game_ended");
    self notify("buy_armor_instant");
    self endon("buy_armor_instant");
    while (!isalive(self)) {
        waitframe();
    }
    waitframe();
    function_ac7803d45979135c(int(clamp(self.armorhealth + self.pers["armor_buy_plates_instant"] * level.var_4b78859bacc88808, 0, self.maxarmorhealth)));
    self.pers["armor_buy_plates_instant"] = 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x477c
// Size: 0x7d9
function function_90ce8eb3ddaa4943(attacker, inflictor, victim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_be4285b26ed99ab1, unmodifieddamage, partname) {
    healthdamage = idamage;
    scaleddamage = idamage;
    armordamage = 0;
    lethaldamage = 0;
    var_7820f81ee1adf7b9 = victim namespace_f8d3520d3483c1::hasarmor();
    if (isplayer(attacker)) {
        armorvest_clearhit(attacker);
        armorvest_clearbroke(attacker);
    }
    if (var_7820f81ee1adf7b9 || function_244067e915c0eabe() && !istrue(victim.inlaststand)) {
        hitshield = shitloc == "shield" && smeansofdeath != "MOD_GRENADE_SPLASH" && !isdefined(victim.forcehitlocation);
        var_94974807c7dc3acf = function_343613187bdf786f(objweapon, smeansofdeath) || istrue(victim.inlaststand) || hitshield;
        if (!istrue(var_94974807c7dc3acf) || function_244067e915c0eabe()) {
            var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            weapontype = weaponclass(objweapon);
            var_520f3f243189ca25 = function_ae24f0c0c8c6de2a(objweapon, var_49e6ef3edadd524e, weapontype);
            if (smeansofdeath == "MOD_RIFLE_BULLET" && !isgrenadeweapon(objweapon) && !isoffhandweapon(objweapon)) {
                scaleddamage = function_bdb257c83ae70586(attacker, victim, idflags, scaleddamage, objweapon, smeansofdeath, unmodifieddamage);
                if (function_55c156d63be9eba2(objweapon)) {
                    scaleddamage = function_6e4490a9f0f4006b(idamage, scaleddamage, attacker, victim, idflags);
                } else {
                    scaleddamage = function_b8f067334016ac40(objweapon, scaleddamage);
                }
            } else {
                if (scripts\cp_mp\utility\weapon_utility::islauncherweapon(objweapon) && function_ad6472280450c778(attacker, victim)) {
                    scaleddamage = launcherdamagemod(scaleddamage, var_49e6ef3edadd524e);
                }
                if (isoffhandweapon(objweapon) && function_ad6472280450c778(attacker, victim) && objweapon.basename != "dragonsbreath_mp") {
                    scaleddamage = equipmentdamagemod(scaleddamage, var_49e6ef3edadd524e);
                }
                if (var_49e6ef3edadd524e == "assault_drone_mp") {
                    scaleddamage = namespace_8a82a4967e25efd4::function_571f1e65c43fb585(inflictor, victim, scaleddamage);
                    healthdamage = scaleddamage;
                } else if (isplayer(victim)) {
                    var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
                    if (isexplosivedamagemod(smeansofdeath)) {
                        switch (var_49e6ef3edadd524e) {
                        case #"hash_4b87af60037f526f":
                        case #"hash_6547ec525f1340da":
                        case #"hash_a009d256608f52ce":
                        case #"hash_c4b9b21ecac2ced4":
                        case #"hash_d6565ec12efca627":
                            if (istrue(var_b4a7d8cd8c4fb7da)) {
                                lethaldamage = 1;
                            }
                            break;
                        }
                        if (!isoffhandweapon(objweapon) && var_49e6ef3edadd524e != "assault_drone_mp" && smeansofdeath != "MOD_EXPLOSIVE_BULLET") {
                            scaleddamage *= function_3768b225bd3bcf44();
                            healthdamage = scaleddamage;
                        }
                    } else if (isimpactdamage(smeansofdeath)) {
                        partname = function_edefa1e693dd3c7d(partname);
                        switch (var_49e6ef3edadd524e) {
                        case #"hash_34f28162f0f54c6e":
                            if (function_b656251147d7d40b(partname) || function_dcdde2598f1bdfc0(partname)) {
                                lethaldamage = 1;
                            }
                            break;
                        case #"hash_617feab345ee4f01":
                            if (function_b656251147d7d40b(partname)) {
                                lethaldamage = 1;
                            } else if (function_dcdde2598f1bdfc0(partname)) {
                                scaleddamage = namespace_9cff5695f11e1c45::function_fc924820627e1c55();
                                scaleddamage *= function_3768b225bd3bcf44();
                                healthdamage = scaleddamage;
                            }
                            break;
                        }
                    }
                    var_32f6184d9170cf0d = istrue(lethaldamage) && (!istrue(victim.gulag) || istrue(victim.gulagarena));
                    if (var_32f6184d9170cf0d) {
                        scaleddamage = victim namespace_f8d3520d3483c1::function_ac266fc218266d08() + victim.health + 100;
                        healthdamage = scaleddamage;
                    }
                }
            }
            if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
                healthdamage = scaleddamage;
                healthdamage = function_acb600e2132f092e(attacker, healthdamage, objweapon, smeansofdeath);
            }
            if (smeansofdeath == "MOD_RIFLE_BULLET") {
                scaleddamage = function_e5e4ad050998e4c1(attacker, objweapon, smeansofdeath, scaleddamage, var_be4285b26ed99ab1);
            }
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                scaleddamage = crossbowdamagemod(scaleddamage, objweapon);
            }
            if (!var_94974807c7dc3acf) {
                excessdamage = victim damagearmor(scaleddamage, function_49765aa03d634cab(), attacker, smeansofdeath);
            } else {
                excessdamage = scaleddamage;
            }
            armordamage = int(scaleddamage - excessdamage);
            healthdamage = function_f2ec69546b32a636(healthdamage, scaleddamage, excessdamage, armordamage);
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                healthdamage *= function_f42bf3137eb74656();
            }
            if (var_7820f81ee1adf7b9) {
                victim.tookvesthit = 1;
                if (isdefined(attacker) && !isplayer(attacker) && isdefined(attacker.owner) && isdefined(inflictor) && isdefined(inflictor.streakinfo)) {
                    attacker = attacker.owner;
                }
                if (isplayer(attacker)) {
                    armorvest_sethit(attacker);
                    if (!victim namespace_f8d3520d3483c1::hasarmor()) {
                        armorvest_setbroke(attacker);
                    }
                }
            }
            if (function_55c156d63be9eba2(objweapon) && smeansofdeath == "MOD_RIFLE_BULLET") {
                function_22b15671bbf7a54e(attacker, victim, idflags, scaleddamage, healthdamage + armordamage);
            } else {
                var_4a101e7f1377c05d = istrue(function_43702519a3dc0854(smeansofdeath, objweapon, var_49e6ef3edadd524e, victim)) && armordamage >= 150;
                var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
                stuckexplosive = istrue(var_b4a7d8cd8c4fb7da) && isexplosivedamagemod(smeansofdeath);
                var_2dc587f0e7d4d221 = istrue(stuckexplosive) && getdvarint(@"hash_5c2f4df8bafb4fc0", 1) && victim namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_blastshield") && armordamage >= 130;
                var_84b2b2a1586de527 = istrue(level.var_fb2b3c3db6061df5) && isdefined(victim.var_bed158a6dfac230d) && victim.var_bed158a6dfac230d >= 3;
                doscoreevents = 0;
                if (var_84b2b2a1586de527) {
                    if (var_4a101e7f1377c05d) {
                        if (healthdamage >= victim.health && !istrue(var_520f3f243189ca25)) {
                            healthdamage = int(clamp(healthdamage, 0, victim.health - 5));
                            doscoreevents = 1;
                        }
                    } else if (var_2dc587f0e7d4d221) {
                        if (healthdamage >= victim.health) {
                            healthdamage = int(clamp(healthdamage, 0, victim.health - 15));
                            victim namespace_53fc9ddbb516e6e1::function_cc76abced8a70f47("specialty_eod");
                            doscoreevents = 1;
                        }
                    }
                    if (doscoreevents) {
                        if (healthdamage < victim.health && isdefined(attacker) && isplayer(attacker) && attacker != victim && scripts\engine\utility::issharedfuncdefined("player", "doScoreEvent")) {
                            if (isdefined(victim.var_4045f099f3da4bd) && victim.var_4045f099f3da4bd == "brloot_plate_carrier_tempered") {
                                attacker thread [[ scripts\engine\utility::getsharedfunc("player", "doScoreEvent") ]](#"hash_4caa4f3c52eaa383");
                            } else {
                                attacker thread [[ scripts\engine\utility::getsharedfunc("player", "doScoreEvent") ]](#"hash_676aa7832878d5ef");
                            }
                        }
                    }
                }
            }
        }
    }
    return [healthdamage, armordamage];
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4f5e
// Size: 0x5d
function function_acb600e2132f092e(attacker, healthdamage, objweapon, smeansofdeath) {
    if (smeansofdeath == "MOD_MELEE" && !istrue(objweapon.ismelee) && !attacker [[ getsharedfunc("perk", "hasPerk") ]]("specialty_gunmelee")) {
        return 70;
    }
    return healthdamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fc4
// Size: 0x21
function function_3768b225bd3bcf44() {
    if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
        return 1.2;
    }
    return 1;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4fed
// Size: 0x21
function function_f42bf3137eb74656() {
    if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
        return 1.5;
    }
    return 1;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5016
// Size: 0x32
function isgrenadeweapon(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.classname) && objweapon.classname == "grenade";
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5051
// Size: 0x32
function isoffhandweapon(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.inventorytype) && objweapon.inventorytype == "offhand";
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x508c
// Size: 0x65
function function_f2ec69546b32a636(idamage, scaleddamage, excessdamage, armordamage) {
    if (excessdamage > 0) {
        if (scaleddamage != 0) {
            var_10077c30c9a6ece0 = armordamage / scaleddamage;
        } else {
            var_10077c30c9a6ece0 = 0;
        }
        modifieddamage = round(idamage * (1 - var_10077c30c9a6ece0), 1e-05);
    } else {
        modifieddamage = excessdamage;
    }
    return modifieddamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x50fa
// Size: 0x73
function function_6e4490a9f0f4006b(idamage, scaleddamage, eattacker, victim, idflags) {
    /#
        if (scaleddamage < idamage) {
            assertmsg("<dev string:x1c>");
        }
    #/
    if (scaleddamage > idamage) {
        function_ad15087050f05b04(eattacker, victim, idflags, scaleddamage);
        var_79e0e4b77d93eef4 = scaleddamage - idamage;
        var_79e0e4b77d93eef4 = function_1113fc99a0327d7d(eattacker, victim, idflags, var_79e0e4b77d93eef4);
        scaleddamage = idamage + var_79e0e4b77d93eef4;
    }
    return scaleddamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5176
// Size: 0x55
function function_22b15671bbf7a54e(attacker, victim, idflags, scaleddamage, actualdamagedealt) {
    /#
        if (actualdamagedealt > scaleddamage) {
            assertmsg("<dev string:x90>");
        }
    #/
    if (actualdamagedealt < scaleddamage) {
        function_9665cbeba4d776f7(attacker, victim, idflags, actualdamagedealt - scaleddamage);
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x51d3
// Size: 0x15a
function function_d8202c9300a4eef7(attacker, inflictor, victim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_be4285b26ed99ab1, skipclamp) {
    modifieddamage = idamage;
    helmetdamage = 0;
    hashelmet = victim namespace_f8d3520d3483c1::function_47ad39003b16cf4c();
    if (hashelmet) {
        var_94974807c7dc3acf = function_343613187bdf786f(objweapon, smeansofdeath);
        hitshield = shitloc == "shield" && smeansofdeath != "MOD_GRENADE_SPLASH";
        if (!istrue(var_94974807c7dc3acf) && !istrue(victim.inlaststand) && !hitshield) {
            var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            weapontype = weaponclass(objweapon);
            scaleddamage = ter_op(istrue(skipclamp), var_be4285b26ed99ab1, function_5145949f900334f0(attacker, idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath));
            excessdamage = victim function_e71f062243ea8827(scaleddamage, function_49765aa03d634cab(), attacker);
            helmetdamage = int(scaleddamage - excessdamage);
            modifieddamage = excessdamage;
        }
    }
    return [modifieddamage, helmetdamage];
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5336
// Size: 0x15
function isbulletpenetration(idflags) {
    return isdefined(idflags) && idflags & 8;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x5354
// Size: 0x8b
function function_bdb257c83ae70586(attacker, victim, idflags, idamage, objweapon, smeansofdeath, unmodifieddamage) {
    if (!isdefined(unmodifieddamage)) {
        unmodifieddamage = idamage;
    }
    idamage = function_72638ae79d782126(attacker, victim, idflags, idamage, objweapon, unmodifieddamage);
    idamage = function_5a1b7cfa5ac58688(idamage, objweapon, unmodifieddamage);
    if (issharedfuncdefined("damage", "handleAkimboDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAkimboDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x53e8
// Size: 0x83
function function_e5e4ad050998e4c1(attacker, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1) {
    if (issharedfuncdefined("damage", "handleAPAmmoDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPAmmoDamage") ]](objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1);
    }
    if (issharedfuncdefined("damage", "handleAPDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5474
// Size: 0x98
function function_72638ae79d782126(attacker, victim, idflags, idamage, objweapon, unmodifieddamage) {
    var_960c2637064f97e9 = objweapon function_5be35054519da350();
    if (function_55c156d63be9eba2(objweapon) && var_960c2637064f97e9 > -1) {
        if (function_a3fc7ebc9fc3e9a3(attacker, victim, idflags)) {
            return idamage;
        }
    }
    modifieddamagescale = 0;
    if (unmodifieddamage != 0) {
        modifieddamagescale = idamage / unmodifieddamage;
    } else {
        modifieddamagescale = 1;
    }
    if (var_960c2637064f97e9 > -1 && unmodifieddamage < var_960c2637064f97e9) {
        idamage = var_960c2637064f97e9 * modifieddamagescale;
    }
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5515
// Size: 0x72
function function_5a1b7cfa5ac58688(idamage, objweapon, unmodifieddamage) {
    maxarmorclamp = objweapon function_957e87390fd5dba2();
    if (function_55c156d63be9eba2(objweapon) && maxarmorclamp > 0) {
        assertmsg("spread weapon <" + objweapon.basename + "> found with maxDamageShelfClamp, this is not allowed by script.  All spread weapon maxDamageShelfClamp should be unmodified( -1 )");
        maxarmorclamp = -1;
    }
    if (maxarmorclamp > 0 && idamage > maxarmorclamp) {
        idamage = maxarmorclamp;
    }
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5590
// Size: 0x14
function function_b8f067334016ac40(objweapon, idamage) {
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x55ad
// Size: 0x64
function function_48870325db7e028(idamage, number) {
    if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
        var_504126e76d4acb79 = 150 + self.maxhealth;
    } else {
        var_504126e76d4acb79 = 150;
    }
    var_ff7309dd24b65641 = ceil(var_504126e76d4acb79 / idamage);
    idamage = ceil(var_504126e76d4acb79 / (var_ff7309dd24b65641 + number));
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x561a
// Size: 0x79
function function_5145949f900334f0(attacker, idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath) {
    if (issharedfuncdefined("damage", "handleAPDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x569c
// Size: 0x9a
function function_58a4d5ed666352ef(var_be4285b26ed99ab1, weapon, stepclamp) {
    var_e7ec701163e1b30c = 0;
    if (stepclamp == 4) {
        var_e7ec701163e1b30c = weapon getmid3damage();
    } else if (stepclamp == 3) {
        var_e7ec701163e1b30c = weapon getmid2damage();
    } else if (stepclamp == 2) {
        var_e7ec701163e1b30c = weapon getmid1damage();
    }
    if (var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.mindamage;
    }
    if (stepclamp == 1 || var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.maxdamage;
    }
    if (var_be4285b26ed99ab1 < var_e7ec701163e1b30c) {
        return int(var_e7ec701163e1b30c);
    }
    return var_be4285b26ed99ab1;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x573e
// Size: 0x9b
function function_343613187bdf786f(objweapon, smeansofdeath) {
    weaponbasename = objweapon.basename;
    if (isdefined(weaponbasename) && weaponbasename == "danger_circle_br") {
        return true;
    }
    if (smeansofdeath == "MOD_EXECUTION") {
        return true;
    }
    if (smeansofdeath == "MOD_FALLING") {
        return true;
    }
    if (smeansofdeath == "MOD_UNKNOWN") {
        return true;
    }
    if (smeansofdeath == "MOD_SUICIDE") {
        return true;
    }
    if (isdefined(weaponbasename) && isdefined(level.var_e70ce1a0418791bd) && array_contains(level.var_e70ce1a0418791bd, weaponbasename)) {
        return true;
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57e2
// Size: 0x2c
function armorvest_washit(attacker) {
    return isdefined(attacker.hitarmorvest) && gettime() == attacker.hitarmorvest;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5817
// Size: 0x68
function function_75c4f7172e4ef3f5(attacker, victim, var_1da1a66b5c6a06a7) {
    return isdefined(victim) && isdefined(victim.var_bed158a6dfac230d) && victim.var_bed158a6dfac230d >= 2 && var_1da1a66b5c6a06a7 > 0 && isdefined(victim.armorhealth) && victim.armorhealth > 50;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5888
// Size: 0x72
function function_3f09a25cb8c206ff(attacker, victim, var_1da1a66b5c6a06a7) {
    return isdefined(victim) && isdefined(victim.var_bed158a6dfac230d) && isdefined(level.var_4b78859bacc88808) && victim.var_bed158a6dfac230d >= 3 && var_1da1a66b5c6a06a7 > 0 && victim.armorhealth + var_1da1a66b5c6a06a7 > level.var_4b78859bacc88808 * 2;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5903
// Size: 0x1c
function armorvest_sethit(attacker) {
    attacker.hitarmorvest = gettime();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5927
// Size: 0x16
function armorvest_clearhit(attacker) {
    attacker.hitarmorvest = undefined;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5945
// Size: 0x2c
function armorvest_wasbroke(attacker) {
    return isdefined(attacker.brokearmorvest) && gettime() == attacker.brokearmorvest;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x597a
// Size: 0x6e
function function_78ea9ac6c9ab7305(attacker, victim, idamage, var_1da1a66b5c6a06a7) {
    return isdefined(victim) && isdefined(victim.var_bed158a6dfac230d) && victim.var_bed158a6dfac230d >= 3 && armorvest_wasbroke(attacker) && idamage == victim.maxhealth - 10 && var_1da1a66b5c6a06a7 > 100;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59f1
// Size: 0x1c
function armorvest_setbroke(attacker) {
    attacker.brokearmorvest = gettime();
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a15
// Size: 0x16
function armorvest_clearbroke(attacker) {
    attacker.brokearmorvest = undefined;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a33
// Size: 0xc
function function_49765aa03d634cab() {
    return istrue(level.var_e4623740d9b51824);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a48
// Size: 0x1b
function function_a024d9111228a85e() {
    return !istrue(self.var_57c207fde9b78089) || istrue(level.var_843573804b98eb7e);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6c
// Size: 0x1c
function function_e47b13babb51a365() {
    if (self.armorhealth == self.maxarmorhealth) {
        return true;
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a91
// Size: 0x29
function repair_armor(amountrepair) {
    var_1c07ef7bc0e3723a = self.armorhealth + amountrepair;
    function_ac7803d45979135c(var_1c07ef7bc0e3723a);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5ac2
// Size: 0x8c
function function_43702519a3dc0854(smeansofdeath, objweapon, var_49e6ef3edadd524e, victim) {
    if (smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET" || var_49e6ef3edadd524e == "assault_drone_mp") {
        return 1;
    }
    if (getdvarint(@"hash_6eba4697f8459b88", 0) && victim namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_blastshield") && scripts\cp_mp\utility\weapon_utility::islauncherweapon(objweapon)) {
        return 1;
    }
    if (objweapon.inventorytype == "offhand") {
        return 0;
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b56
// Size: 0x5d
function function_ae24f0c0c8c6de2a(objweapon, var_49e6ef3edadd524e, weapontype) {
    if (weapontype == "sniper" && var_49e6ef3edadd524e != "iw9_sn_limax" && getweaponhasperk(objweapon, "specialty_explosivebullet")) {
        return true;
    }
    if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
        return true;
    }
    if (var_49e6ef3edadd524e == "jup_jp17_sn_hsierra") {
        return true;
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5bbc
// Size: 0xef
function crossbowdamagemod(scaleddamage, objweapon) {
    equippedbolt = "";
    foreach (i in objweapon.attachments) {
        if (issubstr(i, "ammo_bolt")) {
            equippedbolt = i;
        }
    }
    switch (equippedbolt) {
    case #"hash_135ed917fe85f086":
        modifier = 1.9;
        break;
    case #"hash_1384dc17fea40a53":
        modifier = 1.21;
        break;
    case #"hash_19baf8c5b7e79ee1":
        modifier = 1.9;
        break;
    default:
        modifier = 2;
        break;
    }
    return int(scaleddamage * modifier);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5cb4
// Size: 0x94
function function_c49eb6797b9eec64() {
    self endon("death_or_disconnect");
    self endon("game_ended");
    self endon("armor_regen_end");
    if (isdefined(self.armorhealth) && isdefined(self.maxarmorhealth)) {
        childthread function_8820428e84e96143();
    }
    while (true) {
        waittill_any_2("damage", "damage_armor");
        if (!isdefined(self.armorhealth) || !isdefined(self.maxarmorhealth)) {
            continue;
        }
        if (self.armorhealth == self.maxarmorhealth) {
            continue;
        }
        childthread function_8820428e84e96143();
        waitframe();
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d50
// Size: 0xb7
function function_8820428e84e96143() {
    self notify("armor_regen_begin");
    self endon("armor_regen_begin");
    self endon("armor_regen_complete");
    regendelay = getdvarfloat(@"hash_7d19a2300db06d4c", 2.3);
    regenrate = getdvarfloat(@"hash_3c4bba658371e89b", 0.175);
    regenamount = getdvarint(@"hash_d2eb87a7c2ed24e5", 1);
    wait regendelay;
    timer = 0;
    while (true) {
        if (self.armorhealth >= self.maxarmorhealth) {
            self notify("armor_regen_complete");
        }
        function_ac7803d45979135c(self.armorhealth + regenamount);
        wait regenrate;
    }
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e0f
// Size: 0xe7
function equipmentdamagemod(scaleddamage, var_49e6ef3edadd524e) {
    switch (var_49e6ef3edadd524e) {
    case #"hash_6a2e4f9c54756dc7":
        modifier = 0.9;
        break;
    case #"hash_5701898d598fdb27":
        modifier = 0.9;
        break;
    case #"hash_34f28162f0f54c6e":
        modifier = 0.8;
        break;
    case #"hash_4b87af60037f526f":
        modifier = 1.43;
        break;
    case #"hash_f4d2562ef860c1c0":
        modifier = 0.6;
        break;
    case #"hash_6547ec525f1340da":
        modifier = 0.75;
        break;
    default:
        modifier = 1;
        break;
    }
    if (isbrstylegametype()) {
        return int(scaleddamage * modifier * 1.5);
    }
    return int(scaleddamage * modifier * function_3768b225bd3bcf44());
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5efe
// Size: 0xae
function launcherdamagemod(damage, var_49e6ef3edadd524e) {
    switch (var_49e6ef3edadd524e) {
    case #"hash_390ba811ad3f09bc":
        modifier = 0.91;
        break;
    case #"hash_aa607c134dcb8620":
        modifier = 0.86;
        break;
    case #"hash_607145e68712971c":
        modifier = 0.93;
        break;
    case #"hash_326dc2026394652a":
        modifier = 0.95;
        break;
    case #"hash_60bbbd68c3990680":
        modifier = 0.97;
        break;
    default:
        modifier = 1;
        break;
    }
    return int(damage * modifier);
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5fb5
// Size: 0x2a
function function_ad6472280450c778(attacker, victim) {
    if (isplayer(attacker) && isplayer(victim)) {
        return true;
    }
    return false;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe8
// Size: 0xae
function function_8775d4e6734630c0(player) {
    if (!istrue(level.var_7f3aafcf56c9ce14)) {
        return 0;
    }
    if (!isdefined(player.var_4045f099f3da4bd)) {
        return 0;
    }
    switch (player.var_4045f099f3da4bd) {
    case #"hash_49abfc464753a72c":
        return 1;
    case #"hash_5eaf58877df11b20":
    case #"hash_fbae0f57891595ff":
        return 3;
    case #"hash_4c062079f36e03d6":
    case #"hash_7a904628e42163fd":
        return 2;
    case #"hash_e0c249ab38dcf963":
    case #"hash_ed2b8ec873f222c8":
        return 4;
    default:
        break;
    }
    return 0;
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x609f
// Size: 0x28
function function_55c156d63be9eba2(objweapon) {
    return isdefined(objweapon) && isdefined(weaponclass(objweapon)) && weaponclass(objweapon) == "spread";
}

// Namespace armor / namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60d0
// Size: 0xb
function function_ca2fbba0b1f55bbd() {
    return level.var_23960e36343a87a6;
}

