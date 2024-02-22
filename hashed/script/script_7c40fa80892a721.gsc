// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_189b67b2735b981d;
#using script_76cc264b397db9cb;
#using scripts\mp\utility\perk.gsc;
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1043
// Size: 0x1dc
function init() {
    /#
        level function_a123482f01487930();
    #/
    level.allowarmor = getdvarint(@"hash_a4d532f42d919827", 1) == 1;
    level.var_1f9a4d8f7e4586bb = getdvarint(@"hash_cce2d04880fe5113", 0);
    level.var_4b78859bacc88808 = getdvarint(@"hash_ea4fd87f53ec4456", 50);
    if (!getdvarint(@"hash_cd66a9bfc03ac479", 0)) {
        level.var_fb2b3c3db6061df5 = getmatchrulesdata("commonOption", "plateCarrierEnabled");
    }
    level.spawnarmor = getdvarint(@"hash_d75d5638785f3b09", 0);
    level.spawnarmorplates = getdvarint(@"hash_a6a3fd965485d4bc", 0);
    level.var_23500029f84b30d0 = getdvarint(@"hash_a729499d07bcd90a", 1) == 1;
    level.droparmorondeath = getdvarint(@"hash_8ad1ab9436bccca", 0);
    level.armordropamount = getdvarint(@"hash_28d450f7f28644b7", 0);
    level.var_611672c472b8c9a9 = getdvarint(@"hash_957847f02f2781a8", 0);
    level.var_6835a3d279520dc9 = getdvarint(@"hash_2bcfbe19dac56dd7", 3);
    level.var_699bb1fcae5b2eee = getdvarint(@"hash_be3a8d807c217559", 1);
    level.var_23960e36343a87a6 = getdvarint(@"hash_571f1ab18fcf566c", 1);
    level.var_1fe86bfc07eaa587 = getdvarint(@"hash_8b7eed58460969a6", 0);
    level.var_27720c0c325958c1 = getdvarint(@"hash_d2591f329d2ec7d4", 1) > 0;
    function_abfcdee8fda20a4();
    if (!istrue(level.allowarmor)) {
        return;
    }
    level.onhelmetsniped = &onhelmetsniped;
    callback::add("player_laststand", &function_5a97c5b79aaf7a5b);
    callback::add("player_spawned", &on_player_spawn);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1226
// Size: 0xf8
function function_a123482f01487930() {
    allowarmor = getdvarint(@"hash_4c8ec2fff0818a37", -1);
    spawnarmorplates = getdvarint(@"hash_d7b4016f72a67d64", -1);
    spawnarmor = getdvarint(@"hash_29060eb62a4bfb99", -1);
    droparmorondeath = getdvarint(@"hash_839ead624493a662", -1);
    armordropamount = getdvarint(@"hash_b8b95d553dfaa5a7", -1);
    if (allowarmor >= 0) {
        setdvar(@"hash_a4d532f42d919827", allowarmor);
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
    if (armordropamount >= 0) {
        setdvar(@"hash_28d450f7f28644b7", armordropamount);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1325
// Size: 0x9a
function function_13caa305c839a278(notification, var_e1d097c517c3af5b) {
    if (isdefined(notification) && notification == "try_use_heal_slot") {
        var_57d8f859dc2dd35d = var_e1d097c517c3af5b;
        var_c84cdf4dbd2b7b98 = 1;
        self.var_d26f815b7eb18327 = undefined;
        if (var_57d8f859dc2dd35d == 1) {
            var_c84cdf4dbd2b7b98 = self getammocount(function_46cd39650beb293f());
            self.var_d26f815b7eb18327 = 1;
        } else if (isdefined(self.armorqueued) && self.armorqueued > 0 && var_57d8f859dc2dd35d == 2) {
            var_c84cdf4dbd2b7b98 = 0;
        }
        thread function_9f1608bd570dd94c(var_c84cdf4dbd2b7b98);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c6
// Size: 0x41b
function initarmor(var_b5c8bc15f7117b19) {
    if (!istrue(level.allowarmor) || istrue(self.var_ec90d948cd9fe21e)) {
        return;
    }
    self.var_ec90d948cd9fe21e = 1;
    if (!istrue(var_b5c8bc15f7117b19)) {
        self.armorhealth = 0;
    }
    var_407c627fc7915153 = 150;
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
        var_407c627fc7915153 = 135 * var_2e1d1af8afe39ba8;
        self.var_bed158a6dfac230d = var_2e1d1af8afe39ba8;
        if (issharedfuncdefined("perk", "hasPerk") || istrue(self.var_163e87b7d147df4e)) {
            if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_increased_armor_health") || istrue(self.var_163e87b7d147df4e)) {
                var_407c627fc7915153 = 540;
            }
        }
        self.var_8790c077c95db752 = var_407c627fc7915153;
        if (istrue(var_b5c8bc15f7117b19)) {
            currentcount = self getammocount(function_46cd39650beb293f());
            function_7293fbe4c07e316f(currentcount);
            return;
        }
        function_2be3084f26829eac(0);
        setarmorhealth(0);
        return;
    }
    if (istrue(level.var_fb2b3c3db6061df5)) {
        var_2e1d1af8afe39ba8 = getmatchrulesdata("commonOption", "plateCarrierStartLevel");
        if (isdefined(level.gametype) && namespace_36f464722d326bbe::isbrstylegametype()) {
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
        if (namespace_36f464722d326bbe::isbrstylegametype()) {
            var_407c627fc7915153 = 50 * var_2e1d1af8afe39ba8;
            self.spawnarmor = var_407c627fc7915153;
        } else if (istrue(level.var_2136245d5bcae3e6) && isdefined(level.var_4b78859bacc88808)) {
            var_407c627fc7915153 = var_2e1d1af8afe39ba8 * level.var_4b78859bacc88808;
            self.spawnarmor = var_407c627fc7915153;
        }
    }
    self.var_8790c077c95db752 = getdvarint(@"hash_9c790ecb6ccef79a", var_407c627fc7915153);
    function_2be3084f26829eac(0);
    setarmorhealth(0, 1);
    if (isdefined(self.team)) {
        var_607da387f3617ed1 = level.teamdata[self.team]["players"];
        if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
            var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
        }
        foreach (player in var_607da387f3617ed1) {
            if (self != player) {
                player setarmoromnvars();
            }
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e8
// Size: 0x290
function givestartingarmor(var_d16569f10048fce9, var_10fd8ed3fed0e0ae, var_ac1d8e40765a422e) {
    if (!istrue(level.allowarmor)) {
        return;
    }
    if (istrue(level.var_1f9a4d8f7e4586bb)) {
        function_be5c0cdfa0202544();
        return;
    }
    if (!function_a024d9111228a85e()) {
        if (istrue(self.var_d4bfb0d4d797f448)) {
            self.var_d4bfb0d4d797f448 = undefined;
            return;
        }
        function_be5c0cdfa0202544();
        return;
    }
    initarmor(0);
    if (isdefined(level.var_3c8e175d92be01ea)) {
        var_57acbdc40b2f2db = [[ level.var_3c8e175d92be01ea ]](self);
        var_10fd8ed3fed0e0ae = var_57acbdc40b2f2db[1];
        var_d16569f10048fce9 = var_57acbdc40b2f2db[0];
    }
    if (!isdefined(var_d16569f10048fce9)) {
        var_d16569f10048fce9 = self.spawnarmor;
    }
    if (!isdefined(var_d16569f10048fce9)) {
        var_d16569f10048fce9 = level.spawnarmor;
    }
    setarmorhealth(var_d16569f10048fce9, 1);
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
    var_b44e627d6a911f55 = namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73();
    if (var_b44e627d6a911f55 && var_da17fcd71681c773 && isdefined(self.equipment)) {
        self.equipment["health"] = "equip_armorplate";
    }
    if (namespace_36f464722d326bbe::isbrstylegametype() && !istrue(level.var_595938569c3fe806)) {
        self.var_bed158a6dfac230d = getmatchrulesdata("commonOption", "plateCarrierStartLevel");
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "isInGulagCheck")) {
            var_1b7f5108008d55b6 = [[ namespace_3c37cb17ade254d::getsharedfunc("player", "isInGulagCheck") ]]();
            if (var_1b7f5108008d55b6) {
                var_10fd8ed3fed0e0ae = 0;
            }
        }
        setarmorhealth(var_d16569f10048fce9);
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        var_10fd8ed3fed0e0ae = var_10fd8ed3fed0e0ae + self.pers["armor_buy_plates"];
    }
    if (isdefined(self.var_d0205933322679a9)) {
        var_10fd8ed3fed0e0ae = var_10fd8ed3fed0e0ae + self.var_d0205933322679a9;
        self.var_d0205933322679a9 = undefined;
    }
    self giveweapon(function_46cd39650beb293f());
    self setclientomnvar("ui_equipment_id_health", 27);
    if (issharedfuncdefined("instanceInventory", "getNumStartUpgradePlates")) {
        var_10fd8ed3fed0e0ae = [[ getsharedfunc("instanceInventory", "getNumStartUpgradePlates") ]](self);
    }
    var_225cc3a0a507a66a = var_10fd8ed3fed0e0ae;
    if (namespace_36f464722d326bbe::isbrstylegametype() && !istrue(level.var_595938569c3fe806)) {
        var_225cc3a0a507a66a = var_ac1d8e40765a422e;
    }
    if (var_ac1d8e40765a422e < 0) {
        function_be5c0cdfa0202544();
        return;
    }
    function_7293fbe4c07e316f(var_225cc3a0a507a66a);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7f
// Size: 0x19
function function_be5c0cdfa0202544() {
    self setclientomnvar("ui_equipment_id_health", 27);
    function_7293fbe4c07e316f(0);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9f
// Size: 0x6d
function function_46cd39650beb293f() {
    if (isdefined(level.equipment.table["equip_armorplate"])) {
        return level.equipment.table["equip_armorplate"].objweapon;
    }
    if (!isdefined(level.var_ae24a96d67a946a9)) {
        level.var_ae24a96d67a946a9 = makeweapon("armorplate");
    }
    return level.var_ae24a96d67a946a9;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b14
// Size: 0x1c
function hasarmor() {
    return isdefined(self.armorhealth) && self.armorhealth > 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b38
// Size: 0x57
function function_9bca5c1d23a3e0b3() {
    if (!isdefined(self.armorhealth) || !isdefined(self.var_8790c077c95db752)) {
        return 0;
    }
    if (istrue(level.var_fb2b3c3db6061df5)) {
        return (int((self.armorhealth + 5) / level.var_4b78859bacc88808) >= 3);
    } else {
        return function_e47b13babb51a365();
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b96
// Size: 0x26
function function_ac266fc218266d08() {
    if (!istrue(level.allowarmor)) {
        return 0;
    }
    if (hasarmor()) {
        return self.armorhealth;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc4
// Size: 0x38
function function_11ae05e08cc74847(var_1c07ef7bc0e3723a) {
    if (!isdefined(var_1c07ef7bc0e3723a)) {
        var_1c07ef7bc0e3723a = self.armorhealth;
    }
    self.var_8790c077c95db752 = 50 * function_829e435158d419cf();
    setarmorhealth(var_1c07ef7bc0e3723a, 1);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c03
// Size: 0x6b
function setarmorhealth(value, var_5fb98290d356d5dd) {
    if (!isdefined(value)) {
        return;
    }
    self.armorhealth = int(clamp(value, 0, self.var_8790c077c95db752));
    if (issharedfuncdefined("player", "setArmorOmnvars")) {
        self [[ getsharedfunc("player", "setArmorOmnvars") ]](var_5fb98290d356d5dd);
    } else {
        setarmoromnvars(var_5fb98290d356d5dd);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c75
// Size: 0xf
function function_600f6cf462e983f() {
    return self getammocount(function_46cd39650beb293f());
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8c
// Size: 0x47
function function_77b7145c92102847(armorhealth) {
    if (level.var_4b78859bacc88808 > 0) {
        var_4970ac49ea82ab16 = float(armorhealth) / float(level.var_4b78859bacc88808);
        return int(ceil(var_4970ac49ea82ab16));
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cdb
// Size: 0x36
function function_9c6e9a6643b6c9a6(var_7bd6e41ea1e31283) {
    if (!isdefined(var_7bd6e41ea1e31283)) {
        var_7bd6e41ea1e31283 = 1;
    }
    current = self getammocount(function_46cd39650beb293f());
    function_7293fbe4c07e316f(current + var_7bd6e41ea1e31283);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d18
// Size: 0xa8
function function_47320a25b8ee003() {
    var_a81adeb0e1f89320 = 2;
    if (isdefined(level.var_4941fc1ee570d4cb) && istrue(level.var_fb2b3c3db6061df5)) {
        var_a81adeb0e1f89320 = [[ level.var_4941fc1ee570d4cb ]]();
        return var_a81adeb0e1f89320;
    }
    if (isdefined(level.var_62f6f7640e4431e3) && isdefined(level.var_62f6f7640e4431e3.var_2f37493dac81d735) && level.var_62f6f7640e4431e3.var_2f37493dac81d735 > 0) {
        var_a81adeb0e1f89320 = level.var_62f6f7640e4431e3.var_2f37493dac81d735;
    }
    if (istrue(self.hasplatepouch)) {
        var_a81adeb0e1f89320 = var_a81adeb0e1f89320 + level.var_6835a3d279520dc9;
    }
    return var_a81adeb0e1f89320;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc8
// Size: 0x5
function function_1348b97715104fe2() {
    return 50;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dd5
// Size: 0x2e
function function_79e0ab2aa0304a2c() {
    current = self getammocount(function_46cd39650beb293f());
    var_a81adeb0e1f89320 = function_47320a25b8ee003();
    return current >= var_a81adeb0e1f89320;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0b
// Size: 0x206
function damagearmor(damage, var_3773b3d5cce15dce, attacker, smeansofdeath, var_5fb98290d356d5dd) {
    if (!hasarmor()) {
        return damage;
    }
    if (isdefined(level.var_e8f60267621fda8d)) {
        var_787585d4e82e1e58 = self [[ level.var_e8f60267621fda8d ]](damage, attacker, smeansofdeath);
    } else {
        var_787585d4e82e1e58 = int(min(self.armorhealth, damage));
    }
    var_c022505db080ef7c = damage - var_787585d4e82e1e58;
    if (isdefined(level.var_49bf61396483bae7)) {
        var_787585d4e82e1e58 = self [[ level.var_49bf61396483bae7 ]](var_787585d4e82e1e58, attacker, smeansofdeath);
    }
    setarmorhealth(self.armorhealth - var_787585d4e82e1e58, var_5fb98290d356d5dd);
    params = {attacker:attacker, var_787585d4e82e1e58:var_787585d4e82e1e58, var_1e552ebd80199d84:self.var_8790c077c95db752, armorhealth:self.armorhealth};
    callback::callback("on_armor_damage", params);
    self notify("damage_armor", var_787585d4e82e1e58);
    if (isdefined(attacker)) {
        attacker notify("victim_armor_damaged", self);
    }
    if (self.armorhealth == 0 && var_787585d4e82e1e58 > 0) {
        if (!istrue(var_3773b3d5cce15dce)) {
            thread function_8832743697109f0d(attacker);
        }
        params = {attacker:attacker, var_787585d4e82e1e58:var_787585d4e82e1e58, var_1e552ebd80199d84:self.var_8790c077c95db752, armorhealth:self.armorhealth};
        callback::callback("on_armor_break", params);
    }
    if (self.armorhealth == 0 && isdefined(self.var_8c5c47f81a1869e5)) {
        [[ self.var_8c5c47f81a1869e5 ]](self, attacker);
    }
    if (isplayer(attacker) && self.armorhealth == 0 && var_787585d4e82e1e58 > 0) {
        attacker thread namespace_27c74152ccb91331::function_556866c3c047a8b8(self);
    }
    if (ent_flag("frenzied_guard_active") && self.armorhealth > 0) {
        var_c022505db080ef7c = 0;
    }
    return var_c022505db080ef7c;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2019
// Size: 0x73
function function_8832743697109f0d(attacker) {
    wait(0.2);
    if (isdefined(self) && isalive(self)) {
        if (isplayer(self)) {
            self playsoundtoplayer("hit_marker_armor_break_plr", self);
            self setscriptablepartstate("armor_break", "armor_break", 0);
        } else if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            self playsoundtoplayer("hit_marker_3d_armor_break", attacker, self);
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2093
// Size: 0x15
function breakarmor() {
    damagearmor(self.armorhealth, 1);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20af
// Size: 0x26
function function_3f8a6f9da782d418() {
    if (self.var_8790c077c95db752 == 0) {
        return 0;
    }
    return self.armorhealth / self.var_8790c077c95db752;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20dd
// Size: 0x87
function function_55811fc89cf705b5() {
    var_16da20e6451d7744 = [0:0.67, 1:0.34, 2:0];
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216c
// Size: 0x248
function setarmoromnvars(var_5fb98290d356d5dd) {
    if (!isplayer(self)) {
        return;
    }
    armorpercent = function_3f8a6f9da782d418();
    if (!istrue(var_5fb98290d356d5dd)) {
        if (isdefined(self.pers) && isdefined(self.pers["telemetry"]) && isdefined(self.pers["telemetry"].armor_destroyed)) {
            var_e9efe053d24b91d3 = function_55811fc89cf705b5();
            if (var_e9efe053d24b91d3 > 0) {
                self.pers["telemetry"].armor_destroyed = self.pers["telemetry"].armor_destroyed + var_e9efe053d24b91d3;
            }
        }
    }
    if (isdefined(level.var_ade00516ceb8b9dc) && istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = self [[ level.var_ade00516ceb8b9dc ]]();
        armorpercent = maxarmor != 0 ? self.armorhealth / self [[ level.var_ade00516ceb8b9dc ]]() : 0;
    }
    self setclientomnvar("ui_armor_percent", armorpercent);
    self setclientomnvar("ui_equipment_id_health", 27);
    if (isdefined(level.gametype) && level.gametype == "hvt") {
        mask = int(pow(2, 8)) - 1;
        var_64571e3aeccd1a07 = 8;
        var_e14c164e47469d5d = (int(self.armorhealth) & mask) << var_64571e3aeccd1a07;
        var_f8f977081d3da8b4 = ~(mask << var_64571e3aeccd1a07);
        var_ee27f3f198276535 = self.game_extrainfo;
        var_ed711aeaf5e8cb76 = var_ee27f3f198276535 & var_f8f977081d3da8b4;
        var_82a90e56e416fa55 = var_ed711aeaf5e8cb76 + var_e14c164e47469d5d;
        self.game_extrainfo = var_82a90e56e416fa55;
    }
    squadmemberindex = self.var_3f78c6a0862f9e25;
    if (!isdefined(squadmemberindex) || !isdefined(self.team) || squadmemberindex == -1) {
        return;
    }
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        squadmemberindex = 0;
        self setclientomnvar("ui_armor_squad_index_" + squadmemberindex, int(self.armorhealth));
    } else {
        function_1b593d5e688a409c();
    }
    function_dfac14bd66442dca();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23bb
// Size: 0x82
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
    } else {
        level.player setclientomnvar("ui_armor_warning", "no_armor");
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2444
// Size: 0x13
function haslowarmor() {
    return self.armorhealth <= lowarmorthreshold();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245f
// Size: 0x12
function lowarmorthreshold() {
    return self.var_8790c077c95db752 * 0.28;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2479
// Size: 0x2bd
function function_1b593d5e688a409c() {
    var_607da387f3617ed1 = level.teamdata[self.team]["players"];
    if (isdefined(level.squaddata) && isdefined(level.squaddata[self.team]) && isdefined(level.squaddata[self.team][self.var_ff97225579de16a])) {
        var_607da387f3617ed1 = level.squaddata[self.team][self.var_ff97225579de16a].players;
    }
    if (!isdefined(var_607da387f3617ed1)) {
        var_607da387f3617ed1 = level.players;
    }
    armorhealth = int(self.armorhealth);
    maxarmor = self.var_8790c077c95db752;
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
    /#
        assertex(squadmemberindex < namespace_9bb409deb69fb31d::function_9be60342a8babba5(), "Trying to set in setArmorValueForSquad a squadMemberIndex that is above the intended squad size : " + squadmemberindex + ". For team : " + self.team);
    #/
    if (isdefined(level.var_ade00516ceb8b9dc) && istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = [[ level.var_ade00516ceb8b9dc ]]();
        var_5524b1700566d195 = 512;
        var_8ed19fd39d6993cf = 131071;
    } else if (istrue(level.var_fb2b3c3db6061df5)) {
        maxarmor = 150;
        var_5524b1700566d195 = 512;
        var_8ed19fd39d6993cf = 131071;
    }
    var_cabc886d846dd979 = maxarmor != 0 ? int(armorhealth * maxarmor / maxarmor) : 0;
    if (istrue(level.var_fb2b3c3db6061df5)) {
        var_8f098991d1e07346 = function_829e435158d419cf() << 9;
        var_cabc886d846dd979 = var_cabc886d846dd979 + var_8f098991d1e07346;
        var_7610674e1f362875 = function_8775d4e6734630c0(self);
        var_6f0cfce91ba1feb3 = var_7610674e1f362875 << 12;
        var_cabc886d846dd979 = var_cabc886d846dd979 + var_6f0cfce91ba1feb3;
        if (istrue(self.var_28c033c3c5b37f1f)) {
            var_cabc886d846dd979 = var_cabc886d846dd979 + 32768;
        }
        if (istrue(self.var_cc09658e840807ae)) {
            var_cabc886d846dd979 = var_cabc886d846dd979 + 65536;
        }
    }
    if (!isdefined(var_cabc886d846dd979)) {
        var_cabc886d846dd979 = var_5524b1700566d195;
    } else {
        var_cabc886d846dd979 = int(clamp(var_cabc886d846dd979, var_5524b1700566d195, var_8ed19fd39d6993cf));
    }
    foreach (player in var_607da387f3617ed1) {
        if (isdefined(player)) {
            player setclientomnvar("ui_armor_squad_index_" + squadmemberindex, var_cabc886d846dd979);
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x273d
// Size: 0x19
function function_70edce5f0482fde7() {
    return 3 + (istrue(level.var_75c3b6e138fd717c) ? 1 : 0);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x275e
// Size: 0x20
function function_829e435158d419cf() {
    return self.var_bed158a6dfac230d + (istrue(level.var_75c3b6e138fd717c) ? 1 : 0);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2786
// Size: 0x14
function function_774133dc8df0ccd5(var_10fd8ed3fed0e0ae) {
    function_7293fbe4c07e316f(var_10fd8ed3fed0e0ae);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27a1
// Size: 0x20e
function private function_7293fbe4c07e316f(var_10fd8ed3fed0e0ae) {
    var_7eb0a2a2bedf8dfc = undefined;
    if (issharedfuncdefined("backpack", "isBackpackInventoryEnabled")) {
        var_7eb0a2a2bedf8dfc = [[ getsharedfunc("backpack", "isBackpackInventoryEnabled") ]]();
    }
    var_a81adeb0e1f89320 = function_47320a25b8ee003();
    if (!istrue(var_7eb0a2a2bedf8dfc) || !isdefined(var_7eb0a2a2bedf8dfc)) {
        var_10fd8ed3fed0e0ae = int(clamp(var_10fd8ed3fed0e0ae, 0, var_a81adeb0e1f89320));
    }
    if (istrue(var_7eb0a2a2bedf8dfc) || utility::iscp()) {
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
        var_19145e31fb2f7ced = function_46cd39650beb293f();
        if (!self hasweapon(var_19145e31fb2f7ced)) {
            self giveweapon(var_19145e31fb2f7ced);
        }
        self setweaponammoclip(var_19145e31fb2f7ced, var_1c9dc6c0f33953cd);
        self setclientomnvar("ui_equipment_id_health_numCharges", var_1c9dc6c0f33953cd);
    } else {
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
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b6
// Size: 0x10
function function_50deea7508dbf174() {
    function_7293fbe4c07e316f(function_600f6cf462e983f());
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29cd
// Size: 0x7c
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a50
// Size: 0x10f
function function_9f1608bd570dd94c(var_c84cdf4dbd2b7b98) {
    if (!istrue(level.allowarmor)) {
        return;
    }
    self endon("death_or_disconnect");
    self notify("try_use_heal_slot");
    if (!function_cf37789d18fbcc1b()) {
        if (iscp()) {
            level.player setclientomnvar("ui_armor_warning", "hide_armor");
            waitframe();
            if (self.armorhealth >= self.var_8790c077c95db752) {
                level.player setclientomnvar("ui_armor_warning", "max_armor");
            } else {
                var_276f41532514ddcc = self getammocount(function_46cd39650beb293f());
                if (var_276f41532514ddcc == 0) {
                    level.player setclientomnvar("ui_armor_warning", "no_armor");
                }
            }
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b66
// Size: 0xff
function function_2be3084f26829eac(var_d2a5ddc13d5ced30) {
    var_971d04134a431bfd = int(self.armorhealth / level.var_4b78859bacc88808);
    var_1688c3e909c6563f = self.var_8790c077c95db752 / level.var_4b78859bacc88808;
    var_a02589dfaaa6749 = var_1688c3e909c6563f - var_971d04134a431bfd;
    var_f18c4218c7058e95 = int((self.armorhealth + 5) / level.var_4b78859bacc88808);
    var_2d430af8e8aea492 = self.var_8790c077c95db752 - self.armorhealth > level.var_4b78859bacc88808;
    if (var_2d430af8e8aea492 && var_f18c4218c7058e95 > var_971d04134a431bfd) {
        var_a02589dfaaa6749 = var_1688c3e909c6563f - var_f18c4218c7058e95;
    }
    var_73bd1164e54e82ba = self getammocount(function_46cd39650beb293f());
    var_d2a5ddc13d5ced30 = clamp(var_d2a5ddc13d5ced30, 0, min(var_a02589dfaaa6749, var_73bd1164e54e82ba));
    self.armorqueued = var_d2a5ddc13d5ced30;
    self setclientomnvar("ui_armor_queued_count", int(var_d2a5ddc13d5ced30));
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c6c
// Size: 0xd7
function private function_7cb27dc2ce16cb4f() {
    if (getdvarint(@"hash_d48a0404793bfcfe", 0) == 1 || namespace_82dcd1d5ae30ff7::_hasperk("specialty_onehanded_plating") && namespace_36f464722d326bbe::isbrstylegametype()) {
        self.insertingarmorplate = 0;
        self.var_845334559a2fcaca = 0;
        self setclientomnvar("ui_inserting_armor_plate", 0);
        if (isdefined(level.equipment.table["equip_armor_onehanded"]) && isdefined(level.equipment.table["equip_armor_onehanded"].objweapon)) {
            armorweapon = level.equipment.table["equip_armor_onehanded"].objweapon;
            if (self hasweapon(armorweapon)) {
                _takeweapon(armorweapon);
            }
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d4a
// Size: 0x13
function private on_player_spawn(var_d27680ff86693f5c) {
    function_7cb27dc2ce16cb4f();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d64
// Size: 0x13
function private function_5a97c5b79aaf7a5b(var_d27680ff86693f5c) {
    function_7cb27dc2ce16cb4f();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d7e
// Size: 0x3e4
function private function_f2a4a5aed60e552d() {
    self endon("disconnect");
    self endon("death");
    self endon("last_stand_start");
    if (istrue(self.insertingarmorplate) || self isswitchingweapon()) {
        return;
    }
    if (getdvarint(@"hash_d48a0404793bfcfe", 0) == 1 || namespace_82dcd1d5ae30ff7::_hasperk("specialty_onehanded_plating") && namespace_36f464722d326bbe::isbrstylegametype()) {
        if (!isnullweapon(self getheldoffhand())) {
            if (issharedfuncdefined("supers", "getSuperRefForSuperOffhand")) {
                var_ebec497ff8b18a45 = self [[ getsharedfunc("supers", "getSuperRefForSuperOffhand") ]](self getheldoffhand());
                if (isdefined(var_ebec497ff8b18a45)) {
                    return;
                }
            }
            thread function_55c8966f39db409();
        }
        if (!function_cf37789d18fbcc1b() || istrue(self.var_845334559a2fcaca)) {
            return;
        }
        var_16c2d930984f2fef = self isreloading();
        if (var_16c2d930984f2fef) {
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
            var_5814d27874b48e54.var_c198f7ca473378fb = "EQUIP_ARMOR";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
        if (isdefined(level.equipment.table["equip_armor_onehanded"]) && isdefined(level.equipment.table["equip_armor_onehanded"].objweapon)) {
            armorweapon = level.equipment.table["equip_armor_onehanded"].objweapon;
            waittime = 1.1;
            if (namespace_3c37cb17ade254d::issharedfuncdefined("zombie_perks", "has_zombie_perk")) {
                if (self [[ namespace_3c37cb17ade254d::getsharedfunc("zombie_perks", "has_zombie_perk") ]]("specialty_speedcola")) {
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
                wait(waittime);
                usearmorplate();
                if (self hasweapon(armorweapon)) {
                    _takeweapon(armorweapon);
                }
                self.var_845334559a2fcaca = 1;
                wait(0.5);
                self.var_845334559a2fcaca = 0;
            }
            function_2be3084f26829eac(0);
            self.insertingarmorplate = 0;
            self.var_845334559a2fcaca = 0;
            self setclientomnvar("ui_inserting_armor_plate", 0);
            self notify("insertArmorComplete");
        }
    } else {
        var_16c2d930984f2fef = self isreloading();
        if (var_16c2d930984f2fef) {
            var_5814d27874b48e54 = spawnstruct();
            var_5814d27874b48e54.player = self;
            var_5814d27874b48e54.var_c739ba1eb6635b73 = getsystemtimeinmicroseconds();
            var_5814d27874b48e54.var_c198f7ca473378fb = "EQUIP_ARMOR";
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_reload_cancel", var_5814d27874b48e54);
        }
        weaponobj = makeweapon("iw9_armor_plate_deploy_mp");
        streakinfo = namespace_9abe40d2af041eb2::createstreakinfo("", self);
        streakinfo.armorweapon = weaponobj;
        streakinfo.var_9d7c6ee83f507a26 = val::get("weapon_switch") || val::get("script_weapon_switch");
        function_43d4382b6cea4df9(1);
        thread function_1240021a9c87bcdb();
        thread watchgameend(streakinfo);
        var_41bf9bf4918115ac = namespace_b3d24e921998a8b::switchtodeployweapon(weaponobj, streakinfo, &function_a86a98de3e7986b, undefined, undefined, undefined, undefined, 0);
        if (isdefined(var_41bf9bf4918115ac) && !istrue(var_41bf9bf4918115ac)) {
            self notify("try_armor_cancel", "switch_failed");
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3169
// Size: 0x204
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
        wait(0.05);
        if (issharedfuncdefined("equipment", "hasEquipment") && self [[ getsharedfunc("equipment", "hasEquipment") ]](equipmentref)) {
            _giveweapon(self.var_35a985f3820afb24);
            slot = self [[ getsharedfunc("equipment", "findEquipmentSlot") ]](equipmentref);
            /#
                assertex(isdefined(slot) && (slot == "primary" || slot == "secondary"), "armorTakeOffHand is trying to " + equipmentref + ", but its slot is invalid.");
            #/
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3374
// Size: 0x1c
function function_df0c4be0709e8116(equipmentref, slot, objweapon) {
    
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3397
// Size: 0x14
function function_dd4193b50e36fb2c(equipmentref, var_cbb2b3d05e48bd27) {
    
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33b2
// Size: 0x235
function private usearmorplate() {
    /#
        assert(isdefined(self.var_8790c077c95db752) && self.var_8790c077c95db752 > 0);
    #/
    if (isdefined(self.armorqueued)) {
        var_1d614448f6cac2d7 = self.armorqueued - 1;
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
        var_1c07ef7bc0e3723a = clamp(var_830009cefce35a66, 0, self.var_8790c077c95db752);
        var_43167c86311c997e = max(1, function_85e373bb15921966());
        var_1c07ef7bc0e3723a = int(var_1c07ef7bc0e3723a / var_43167c86311c997e) * var_43167c86311c997e + var_43167c86311c997e;
    }
    if (isdefined(self.pers["telemetry"]) && isdefined(self.pers["telemetry"].armor_equipped)) {
        self.pers["telemetry"].armor_equipped++;
    }
    setarmorhealth(var_1c07ef7bc0e3723a);
    currentcount = self getammocount(function_46cd39650beb293f());
    newcount = int(max(0, currentcount - 1));
    function_7293fbe4c07e316f(newcount);
    if (namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        self.pers["armor_buy_plates"] = newcount;
    }
    namespace_aad14af462a74d08::onuseitem("armor_plate");
    if (namespace_f8065cafc523dba5::function_eba2f2e094684b8f("specialty_reduce_regen_delay_on_plate") && namespace_36f464722d326bbe::isbrstylegametype() && level.var_1fe86bfc07eaa587) {
        namespace_f8d3520d3483c1::function_7f2cfc2ced509047();
        self notify("force_regeneration");
    }
    if (issharedfuncdefined("game", "onArmorPlateEquipped")) {
        function_f3bb4f4911a1beb2("game", "onArmorPlateEquipped");
    }
    self notify("armor_plate_inserted");
    if (function_ac266fc218266d08() == self.var_8790c077c95db752) {
        level notify("equiped_full_armor_" + self.team, self);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35ee
// Size: 0x33
function private function_7f2cfc2ced509047() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self notify("regenDelayReduce_delayedRegen");
    self endon("regenDelayReduce_delayedRegen");
    namespace_54a2eae43eaa8bf5::function_5457f0107a845374("regenDelayReduce_delayedRegen", 1, 140);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3628
// Size: 0x22
function function_763f5fb36de6d3df() {
    return floor((self.var_8790c077c95db752 - self.armorhealth) / function_85e373bb15921966());
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3652
// Size: 0xa0
function function_85e373bb15921966() {
    if (issharedfuncdefined("perk", "hasPerk") || istrue(self.var_163e87b7d147df4e)) {
        if (self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_increased_armor_health") || istrue(self.var_163e87b7d147df4e)) {
            return int(self.var_8790c077c95db752 / 3);
        } else if (istrue(level.var_7f3aafcf56c9ce14) && istrue(self.var_cc09658e840807ae) && isdefined(self.var_42294cc94c3bf2c3)) {
            return [[ self.var_42294cc94c3bf2c3 ]]();
        }
    }
    return level.var_4b78859bacc88808;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36fa
// Size: 0x11d
function private function_1240021a9c87bcdb() {
    self endon("insertArmorComplete");
    self endon("disconnect");
    function_451b277f45c6174f();
    thread function_a5e267fd4b705fd6();
    thread function_d9c269fb5751937b();
    self.stoparmorinsert = 0;
    while (1) {
        childthread function_ebbb01a971edd5b3();
        childthread function_8a7d870c4615a027();
        var_ad20d588bce2ce99 = var_e75f0523bc1dbde8 = self waittill("armor_cancel");
        self notify("armor_cancel_watch_stop");
        if (var_e75f0523bc1dbde8 == "try_armor_cancel" && self function_96f814cc20cbf3d5()) {
            self setclientomnvar("ui_armor_forced_notify", gettime());
            if (isdefined(self.armorqueued) && self.armorqueued > 1) {
                if (getdvarint(@"hash_c7714fe0d53c925c", 1) == 1) {
                    function_2be3084f26829eac(1);
                }
            }
        } else {
            if (!isbot(self) && istrue(self.var_b846f916af2f7782)) {
                function_9cda8706bc1d6a7d(var_e75f0523bc1dbde8, var_ad20d588bce2ce99);
            }
            break;
        }
    }
    self notify("cancel_all_killstreak_deployments");
    self.stoparmorinsert = 1;
    self.var_b846f916af2f7782 = 0;
    thread insertarmorcomplete();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x381e
// Size: 0x3b
function private watchgameend(streakinfo) {
    self endon("death");
    self endon("disconnect");
    self endon("armor_plate_done");
    level waittill("game_ended");
    namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(streakinfo.armorweapon);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3860
// Size: 0x3a
function private function_a5e267fd4b705fd6() {
    self endon("disconnect");
    self endon("insertArmorComplete");
    msg = waittill_any_return_3("player_switched_weapon", "player_switched_to_grenade", "player_interaction");
    self notify("try_armor_cancel", msg);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38a1
// Size: 0xd6
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x397e
// Size: 0x2b
function private function_ebbb01a971edd5b3() {
    self endon("armor_cancel_watch_stop");
    var_51b71f011305b016 = self waittill("try_armor_cancel");
    self notify("armor_cancel", "try_armor_cancel");
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39b0
// Size: 0x42
function private function_8a7d870c4615a027() {
    self endon("armor_cancel_watch_stop");
    msg = waittill_any_return_6("death", "mantle_start", "last_stand_start", "scr_change_swim_state", "special_weapon_fired", "armor_plate_done");
    self notify("armor_cancel", msg);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x39f9
// Size: 0x58
function private function_9cda8706bc1d6a7d(var_e75f0523bc1dbde8, var_ad20d588bce2ce99) {
    var_5814d27874b48e54 = spawnstruct();
    var_5814d27874b48e54.player = self;
    var_5814d27874b48e54.var_e75f0523bc1dbde8 = var_e75f0523bc1dbde8;
    var_5814d27874b48e54.var_ad20d588bce2ce99 = var_ad20d588bce2ce99;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_player_armor_auto_apply", var_5814d27874b48e54);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a58
// Size: 0xa
function private canqueuearmorbydefault() {
    return !is_player_gamepad_enabled();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3a6a
// Size: 0x135
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
        val::function_c9d0b43701bdba00("armor");
        self function_8b7829a01e6b58aa(1);
    }
    self.insertingarmorplate = var_e12d78c11d85d9c2;
    self setclientomnvar("ui_inserting_armor_plate", var_e12d78c11d85d9c2);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3ba6
// Size: 0x1cd
function private function_a86a98de3e7986b(streakinfo) {
    self endon("disconnect");
    self endon("insertArmorComplete");
    if (!function_cf37789d18fbcc1b() || istrue(self.stoparmorinsert)) {
        return;
    }
    currenttime = gettime();
    var_796ba59fc6c2ac9b = currenttime + 1300;
    var_3f536cbd3a3c3591 = 1567;
    var_fd3a2bb4c34a405c = 1300;
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
    var_4d5f2c05f11db0ec = (var_3f536cbd3a3c3591 - var_fd3a2bb4c34a405c) / 1000;
    wait(var_4d5f2c05f11db0ec);
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
        wait(var_cf97caf9e7ec424);
    }
    if (issharedfuncdefined("equipment", "autorefillequipmentammo")) {
        self [[ getsharedfunc("equipment", "autorefillequipmentammo") ]]("equip_armorplate");
    }
    self notify("armor_plate_done");
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d7a
// Size: 0xd5
function private insertarmorcomplete() {
    self endon("disconnect");
    self notify("insertArmorComplete");
    if (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
        namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(self.currentweapon);
    }
    function_25aae4d93a36c291();
    namespace_1cd9f6896754adb0::set("armor", "supers", 1);
    while (isdefined(self.currentweapon) && isdefined(self.currentweapon.basename) && self.currentweapon.basename == "iw9_armor_plate_deploy_mp") {
        waitframe();
    }
    waitframe();
    function_2be3084f26829eac(0);
    function_43d4382b6cea4df9(0);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e56
// Size: 0x13d
function function_cf37789d18fbcc1b() {
    if (!isalive(self) || self isparachuting() || self isskydiving() || self isonladder() || self function_9cc921a57ff4deb5()) {
        return 0;
    }
    if (self.armorhealth >= self.var_8790c077c95db752) {
        return 0;
    }
    if (!namespace_1cd9f6896754adb0::get("armor")) {
        return 0;
    }
    if (istrue(self.inlaststand) || isdefined(self.usingremote) || istrue(self.isdeploying) || istrue(self.usingascender) || namespace_f8065cafc523dba5::function_b7869f6d9d4242e3(self) || istrue(self.isjuggernaut) || istrue(self.var_859654e0445a36d9)) {
        return 0;
    }
    if (!istrue(self.var_4b6e638cb12a3e90) && isdefined(self.super) && istrue(self.super.isinuse) && !function_9719a1e79de2989f(self.super.staticdata.ref)) {
        return 0;
    }
    currentcount = self getammocount(function_46cd39650beb293f());
    if (currentcount == 0) {
        return 0;
    }
    return 1;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9b
// Size: 0xf3
function function_9719a1e79de2989f(var_5237a188ccda4d7b) {
    if (!isdefined(var_5237a188ccda4d7b)) {
        return 1;
    }
    if (isdefined(self.super.staticdata) && isdefined(self.super) && isdefined(self.super.staticdata.bundle) && istrue(self.super.staticdata.bundle.var_cf37789d18fbcc1b)) {
        return 1;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("supers", "superHasTimedUsage")) {
        if (self [[ namespace_3c37cb17ade254d::getsharedfunc("supers", "superHasTimedUsage") ]](self.super)) {
            return 1;
        }
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("supers", "superHasAmmoUsage")) {
        if (self [[ namespace_3c37cb17ade254d::getsharedfunc("supers", "superHasAmmoUsage") ]](self.super)) {
            return 1;
        }
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4096
// Size: 0x53
function private function_4e03f222ed8b54a1() {
    if (!function_cf37789d18fbcc1b()) {
        return 0;
    }
    var_a5ea2300efaaa6a7 = is_player_gamepad_enabled() && self weaponswitchbuttonpressed();
    var_1d20666098baa9f9 = isdefined(self.armorqueued) && self.armorqueued > 0;
    return var_a5ea2300efaaa6a7 || var_1d20666098baa9f9;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x40f1
// Size: 0xb6
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41ae
// Size: 0xb6
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426b
// Size: 0xd
function hashelmet() {
    return isdefined(self.br_helmetlevel);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4280
// Size: 0x1c
function function_47ad39003b16cf4c() {
    return isdefined(self.helmethealth) && self.helmethealth > 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42a4
// Size: 0x4c
function helmetitemtypeforlevel(var_9fb8a8ee3a677cea) {
    switch (var_9fb8a8ee3a677cea) {
    case 1:
        return "brloot_armor_helmet_1";
    case 2:
        return "brloot_armor_helmet_2";
    case 3:
        return "brloot_armor_helmet_3";
        break;
    }
    return undefined;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f8
// Size: 0x48
function takehelmet(var_73b1997698ae0deb, var_9fb8a8ee3a677cea) {
    self.br_helmetlevel = var_9fb8a8ee3a677cea;
    row = level.br_pickups.br_itemrow[var_73b1997698ae0deb.scriptablename];
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4347
// Size: 0x6f
function function_cd4a78b4a236ddc8(var_dbd090cc010cd89b) {
    var_9fb8a8ee3a677cea = 0;
    if (var_dbd090cc010cd89b == "equip_helmet_1") {
        var_9fb8a8ee3a677cea = 1;
    } else if (var_dbd090cc010cd89b == "equip_helmet_2") {
        var_9fb8a8ee3a677cea = 2;
    } else if (var_dbd090cc010cd89b == "equip_helmet_3") {
        var_9fb8a8ee3a677cea = 3;
    }
    if (var_9fb8a8ee3a677cea > 0) {
        if (!isdefined(self.br_helmetlevel) || self.br_helmetlevel < var_9fb8a8ee3a677cea) {
            return 1;
        }
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43be
// Size: 0x158
function function_e71f062243ea8827(damage, var_3773b3d5cce15dce, attacker) {
    if (!isdefined(self.helmethealth) || self.helmethealth <= 0) {
        return damage;
    }
    var_b9bc5879c1fd673 = damage - self.helmethealth;
    self.helmethealth = int(clamp(self.helmethealth - damage, 0, self.var_cfc69e5588a5bed6));
    if (istrue(self.var_895dae193cfaac3a) && !istrue(self.var_62e6d0c1bcceae79)) {
        if (self.helmethealth / self.var_cfc69e5588a5bed6 < 0.45 && !istrue(self.var_250a0d62e13c6e73)) {
            self setscriptablepartstate("helmet", "damaged");
            self.var_250a0d62e13c6e73 = 1;
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
        return var_b9bc5879c1fd673;
    }
    if (isdefined(attacker)) {
        attacker.hithelmet = gettime();
        thread function_908110bdfb8e8ba(attacker);
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x451e
// Size: 0x65
function function_908110bdfb8e8ba(attacker) {
    wait(0.15);
    if (isdefined(self) && isalive(self)) {
        if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            attacker playsoundtoplayer("bullet_plr_helmet_impact", attacker, self);
            self playsound("bullet_npc_helmet_impact", attacker, self);
        } else {
            self playsound("bullet_npc_helmet_impact");
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x458a
// Size: 0x65
function function_1d16645547af7d5b(attacker) {
    wait(0.15);
    if (isdefined(self) && isalive(self)) {
        if (isdefined(attacker) && isplayer(attacker) && isalive(attacker)) {
            attacker playsoundtoplayer("bullet_plr_helmet_break", attacker, self);
            self playsound("bullet_npc_helmet_break", attacker, self);
        } else {
            self playsound("bullet_npc_helmet_break");
        }
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f6
// Size: 0xbe
function damagehelmet(damage, var_ac4a1f6f548136ea, var_483b72bbc1109ab2) {
    if (!isdefined(var_ac4a1f6f548136ea) || !level.var_23500029f84b30d0) {
        var_ac4a1f6f548136ea = 0;
    }
    var_84872288b2e0ce95 = 1;
    switch (self.br_helmetlevel) {
    case 1:
        var_84872288b2e0ce95 = 0.85;
        break;
    case 2:
        var_84872288b2e0ce95 = 0.7;
        break;
    case 3:
        var_84872288b2e0ce95 = 0.7;
        break;
    default:
        break;
    }
    if (var_ac4a1f6f548136ea) {
        if (isdefined(level.onhelmetsniped)) {
            [[ level.onhelmetsniped ]](self, var_483b72bbc1109ab2);
        }
    }
    return var_84872288b2e0ce95;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46bc
// Size: 0x1b5
function private popoffhelmet(var_483b72bbc1109ab2, playerangles, playerorigin) {
    level endon("game_ended");
    var_332f92d26f25d2bc = self gettagorigin("j_helmet");
    if (!isdefined(var_332f92d26f25d2bc)) {
        var_332f92d26f25d2bc = playerorigin + (0, 0, 80);
    }
    helmet = spawn("script_model", self gettagorigin("j_helmet"));
    helmet setmodel("loot_helmet");
    helmet.angles = playerangles;
    up = anglestoup(playerangles);
    forward = var_483b72bbc1109ab2;
    vel = vectornormalize(forward + up) * 2500;
    helmet physicslaunchserver(helmet.origin, vel);
    var_73b1997698ae0deb = "brloot_armor_helmet_" + self.br_helmetlevel;
    var_29511a1c049e1067 = 15;
    var_f246e6dc812fbcfe = 0.1;
    var_29511a1c049e1067 = var_29511a1c049e1067 * 1 / var_f246e6dc812fbcfe;
    previousorigin = helmet.origin;
    for (i = 0; i < var_29511a1c049e1067; i++) {
        wait(var_f246e6dc812fbcfe);
        var_76a2ea10ccbc4c62 = previousorigin - helmet.origin;
        if (var_76a2ea10ccbc4c62[0] < 2 && var_76a2ea10ccbc4c62[1] < 2 && var_76a2ea10ccbc4c62[2] < 2 && var_76a2ea10ccbc4c62[0] > -2 && var_76a2ea10ccbc4c62[1] > -2 && var_76a2ea10ccbc4c62[2] > -2) {
            return;
        }
        previousorigin = helmet.origin;
    }
    helmet delete();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4878
// Size: 0x43
function private onhelmetsniped(victim, var_483b72bbc1109ab2) {
    if (isdefined(victim)) {
        victim thread popoffhelmet(var_483b72bbc1109ab2, victim.angles, victim.origin);
    }
    self.br_helmetlevel = undefined;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48c2
// Size: 0x50
function function_92fec40b905c5112() {
    if (isalive(self) && isdefined(self.armorhealth) && self.armorhealth < self.var_8790c077c95db752) {
        return 1;
    } else if (self.pers["armor_buy_plates_instant"] < 3) {
        return 1;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x491a
// Size: 0x76
function function_4f88731347251184() {
    level endon("game_ended");
    self notify("buy_armor_instant");
    self endon("buy_armor_instant");
    while (!isalive(self)) {
        waitframe();
    }
    waitframe();
    setarmorhealth(int(clamp(self.armorhealth + self.pers["armor_buy_plates_instant"] * level.var_4b78859bacc88808, 0, self.var_8790c077c95db752)));
    self.pers["armor_buy_plates_instant"] = 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4997
// Size: 0x7f6
function function_90ce8eb3ddaa4943(attacker, inflictor, victim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_be4285b26ed99ab1, var_69cfd14b4398c458, partname) {
    var_ed76db33212e6a92 = idamage;
    var_24df708f286b0562 = idamage;
    var_ae0f808555c671f9 = 0;
    var_99a81dc3a8deebd6 = 0;
    var_7820f81ee1adf7b9 = victim namespace_f8d3520d3483c1::hasarmor();
    if (isplayer(attacker)) {
        armorvest_clearhit(attacker);
        armorvest_clearbroke(attacker);
    }
    if (var_7820f81ee1adf7b9 || function_244067e915c0eabe() && !istrue(victim.inlaststand)) {
        var_e13e382321a8580b = shitloc == "shield" && smeansofdeath != "MOD_GRENADE_SPLASH" && !isdefined(victim.forcehitlocation);
        var_94974807c7dc3acf = function_343613187bdf786f(objweapon, smeansofdeath) || istrue(victim.inlaststand) || var_e13e382321a8580b || istrue(victim.var_7e5d64139d5dabb6);
        if (!istrue(var_94974807c7dc3acf) || function_244067e915c0eabe()) {
            var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            weapontype = weaponclass(objweapon);
            var_520f3f243189ca25 = function_ae24f0c0c8c6de2a(objweapon, var_49e6ef3edadd524e, weapontype);
            if (smeansofdeath == "MOD_RIFLE_BULLET" && !isgrenadeweapon(objweapon) && !function_23f2bcfe3327879b(objweapon)) {
                var_24df708f286b0562 = function_bdb257c83ae70586(attacker, victim, idflags, var_24df708f286b0562, objweapon, smeansofdeath, var_69cfd14b4398c458);
                if (function_55c156d63be9eba2(objweapon)) {
                    var_24df708f286b0562 = function_6e4490a9f0f4006b(idamage, var_24df708f286b0562, attacker, victim, idflags);
                } else {
                    var_24df708f286b0562 = function_b8f067334016ac40(objweapon, var_24df708f286b0562);
                }
            } else {
                if (namespace_d325722f2754c2c4::function_102d677621400199(objweapon) && function_ad6472280450c778(attacker, victim)) {
                    var_24df708f286b0562 = function_597e2eb3a04537cc(var_24df708f286b0562, var_49e6ef3edadd524e);
                }
                if (function_23f2bcfe3327879b(objweapon) && function_ad6472280450c778(attacker, victim) && objweapon.basename != "dragonsbreath_mp") {
                    var_24df708f286b0562 = function_dcc3b1093c9a295e(var_24df708f286b0562, var_49e6ef3edadd524e);
                }
                if (getdvarint(@"hash_b39c4bff0da4c703", 0) && var_49e6ef3edadd524e == "iw9_knifestab" && var_24df708f286b0562 > 135) {
                    var_24df708f286b0562 = 135;
                }
                if (var_49e6ef3edadd524e == "assault_drone_mp") {
                    var_24df708f286b0562 = namespace_8a82a4967e25efd4::function_571f1e65c43fb585(inflictor, victim, var_24df708f286b0562);
                    var_ed76db33212e6a92 = var_24df708f286b0562;
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
                                var_99a81dc3a8deebd6 = 1;
                            }
                            break;
                        }
                        if (!function_23f2bcfe3327879b(objweapon) && var_49e6ef3edadd524e != "assault_drone_mp" && smeansofdeath != "MOD_EXPLOSIVE_BULLET") {
                            var_24df708f286b0562 = var_24df708f286b0562 * function_3768b225bd3bcf44();
                            var_ed76db33212e6a92 = var_24df708f286b0562;
                        }
                    } else if (function_f1d312f6935bc2d2(smeansofdeath)) {
                        partname = function_edefa1e693dd3c7d(partname);
                        switch (var_49e6ef3edadd524e) {
                        case #"hash_34f28162f0f54c6e":
                            if (function_b656251147d7d40b(partname) || function_dcdde2598f1bdfc0(partname)) {
                                var_99a81dc3a8deebd6 = 1;
                            }
                            break;
                        case #"hash_617feab345ee4f01":
                            if (function_b656251147d7d40b(partname)) {
                                var_99a81dc3a8deebd6 = 1;
                            } else if (function_dcdde2598f1bdfc0(partname)) {
                                var_24df708f286b0562 = namespace_9cff5695f11e1c45::function_fc924820627e1c55();
                                var_24df708f286b0562 = var_24df708f286b0562 * function_3768b225bd3bcf44();
                                var_ed76db33212e6a92 = var_24df708f286b0562;
                            }
                            break;
                        }
                    }
                    var_32f6184d9170cf0d = istrue(var_99a81dc3a8deebd6) && (!istrue(victim.gulag) || istrue(victim.gulagarena));
                    if (var_32f6184d9170cf0d) {
                        var_24df708f286b0562 = victim namespace_f8d3520d3483c1::function_ac266fc218266d08() + victim.health + 100;
                        var_ed76db33212e6a92 = var_24df708f286b0562;
                    }
                }
            }
            if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
                var_ed76db33212e6a92 = var_24df708f286b0562;
                var_ed76db33212e6a92 = function_acb600e2132f092e(attacker, var_ed76db33212e6a92, objweapon, smeansofdeath);
            }
            if (smeansofdeath == "MOD_RIFLE_BULLET") {
                var_24df708f286b0562 = function_e5e4ad050998e4c1(attacker, objweapon, smeansofdeath, var_24df708f286b0562, var_be4285b26ed99ab1);
            }
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                var_24df708f286b0562 = function_7ee9d2852cedab94(var_24df708f286b0562, objweapon);
            }
            if (!var_94974807c7dc3acf) {
                var_b9bc5879c1fd673 = victim damagearmor(var_24df708f286b0562, function_49765aa03d634cab(), attacker, smeansofdeath);
            } else {
                var_b9bc5879c1fd673 = var_24df708f286b0562;
            }
            var_ae0f808555c671f9 = int(var_24df708f286b0562 - var_b9bc5879c1fd673);
            var_ed76db33212e6a92 = function_f2ec69546b32a636(var_ed76db33212e6a92, var_24df708f286b0562, var_b9bc5879c1fd673, var_ae0f808555c671f9);
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                var_ed76db33212e6a92 = var_ed76db33212e6a92 * function_f42bf3137eb74656();
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
                function_22b15671bbf7a54e(attacker, victim, idflags, var_24df708f286b0562, var_ed76db33212e6a92 + var_ae0f808555c671f9, objweapon);
            } else {
                var_4a101e7f1377c05d = istrue(function_43702519a3dc0854(smeansofdeath, objweapon, var_49e6ef3edadd524e, victim)) && var_ae0f808555c671f9 >= 150;
                var_b4a7d8cd8c4fb7da = isdefined(inflictor) && (isdefined(inflictor.stuckto) && inflictor.stuckto == victim || isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim);
                var_6339e40dffe69486 = istrue(var_b4a7d8cd8c4fb7da) && isexplosivedamagemod(smeansofdeath);
                var_2dc587f0e7d4d221 = istrue(var_6339e40dffe69486) && getdvarint(@"hash_5c2f4df8bafb4fc0", 1) && victim namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_blastshield") && var_ae0f808555c671f9 >= 130;
                var_6bbde8c52eb2a305 = istrue(level.var_fb2b3c3db6061df5) && isdefined(victim.var_bed158a6dfac230d) && victim function_829e435158d419cf() >= function_70edce5f0482fde7();
                var_2373e1b4830c807 = 0;
                if (var_6bbde8c52eb2a305) {
                    if (var_4a101e7f1377c05d) {
                        if (var_ed76db33212e6a92 >= victim.health && !istrue(var_520f3f243189ca25)) {
                            var_ed76db33212e6a92 = int(clamp(var_ed76db33212e6a92, 0, victim.health - 5));
                            var_2373e1b4830c807 = 1;
                        }
                    } else if (var_2dc587f0e7d4d221) {
                        if (var_ed76db33212e6a92 >= victim.health) {
                            var_ed76db33212e6a92 = int(clamp(var_ed76db33212e6a92, 0, victim.health - 15));
                            victim namespace_53fc9ddbb516e6e1::function_cc76abced8a70f47("specialty_eod");
                            var_2373e1b4830c807 = 1;
                        }
                    }
                    if (var_2373e1b4830c807) {
                        if (var_ed76db33212e6a92 < victim.health && isdefined(attacker) && isplayer(attacker) && attacker != victim && namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
                            if (isdefined(victim.var_4045f099f3da4bd) && victim.var_4045f099f3da4bd == "brloot_plate_carrier_tempered") {
                                attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]](#"hash_4caa4f3c52eaa383");
                            }
                        }
                    }
                }
            }
        }
    }
    return [0:var_ed76db33212e6a92, 1:var_ae0f808555c671f9];
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5195
// Size: 0x5e
function function_acb600e2132f092e(attacker, var_ed76db33212e6a92, objweapon, smeansofdeath) {
    if (smeansofdeath == "MOD_MELEE" && !istrue(objweapon.ismelee) && !attacker [[ getsharedfunc("perk", "hasPerk") ]]("specialty_gunmelee")) {
        return 70;
    }
    return var_ed76db33212e6a92;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51fb
// Size: 0x22
function function_3768b225bd3bcf44() {
    if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
        return 1.2;
    } else {
        return 1;
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5224
// Size: 0x22
function function_f42bf3137eb74656() {
    if (function_244067e915c0eabe() && function_ca2fbba0b1f55bbd()) {
        return 1.5;
    } else {
        return 1;
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x524d
// Size: 0x33
function isgrenadeweapon(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.classname) && objweapon.classname == "grenade";
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5288
// Size: 0x33
function function_23f2bcfe3327879b(objweapon) {
    return isdefined(objweapon) && isdefined(objweapon.inventorytype) && objweapon.inventorytype == "offhand";
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52c3
// Size: 0x66
function function_f2ec69546b32a636(idamage, var_24df708f286b0562, var_b9bc5879c1fd673, var_ae0f808555c671f9) {
    if (var_b9bc5879c1fd673 > 0) {
        if (var_24df708f286b0562 != 0) {
            var_10077c30c9a6ece0 = var_ae0f808555c671f9 / var_24df708f286b0562;
        } else {
            var_10077c30c9a6ece0 = 0;
        }
        modifieddamage = round(idamage * (1 - var_10077c30c9a6ece0), 1e-05);
    } else {
        modifieddamage = var_b9bc5879c1fd673;
    }
    return modifieddamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5331
// Size: 0x74
function function_6e4490a9f0f4006b(idamage, var_24df708f286b0562, eattacker, victim, idflags) {
    /#
        if (var_24df708f286b0562 < idamage) {
            /#
                assertmsg("on_armor_break");
            #/
        }
    #/
    if (var_24df708f286b0562 > idamage) {
        function_ad15087050f05b04(eattacker, victim, idflags, var_24df708f286b0562);
        var_79e0e4b77d93eef4 = var_24df708f286b0562 - idamage;
        var_79e0e4b77d93eef4 = function_1113fc99a0327d7d(eattacker, victim, idflags, var_79e0e4b77d93eef4);
        var_24df708f286b0562 = idamage + var_79e0e4b77d93eef4;
    }
    return var_24df708f286b0562;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53ad
// Size: 0x6a
function function_22b15671bbf7a54e(attacker, victim, idflags, var_24df708f286b0562, var_89be7633506fa104, objweapon) {
    /#
        if (var_89be7633506fa104 > var_24df708f286b0562) {
            /#
                assertmsg("bullet_npc_helmet_break" + objweapon.basename);
            #/
        }
    #/
    if (var_89be7633506fa104 < var_24df708f286b0562) {
        function_9665cbeba4d776f7(attacker, victim, idflags, var_89be7633506fa104 - var_24df708f286b0562);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x541e
// Size: 0x15b
function function_d8202c9300a4eef7(attacker, inflictor, victim, idamage, objweapon, smeansofdeath, shitloc, idflags, var_be4285b26ed99ab1, var_e93a0355b918aad5) {
    modifieddamage = idamage;
    var_25359c8e0b5022a5 = 0;
    hashelmet = victim namespace_f8d3520d3483c1::function_47ad39003b16cf4c();
    if (hashelmet) {
        var_94974807c7dc3acf = function_343613187bdf786f(objweapon, smeansofdeath);
        var_e13e382321a8580b = shitloc == "shield" && smeansofdeath != "MOD_GRENADE_SPLASH";
        if (!istrue(var_94974807c7dc3acf) && !istrue(victim.inlaststand) && !var_e13e382321a8580b) {
            var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            weapontype = weaponclass(objweapon);
            var_24df708f286b0562 = ter_op(istrue(var_e93a0355b918aad5), var_be4285b26ed99ab1, function_5145949f900334f0(attacker, idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath));
            var_b9bc5879c1fd673 = victim function_e71f062243ea8827(var_24df708f286b0562, function_49765aa03d634cab(), attacker);
            var_25359c8e0b5022a5 = int(var_24df708f286b0562 - var_b9bc5879c1fd673);
            modifieddamage = var_b9bc5879c1fd673;
        }
    }
    return [0:modifieddamage, 1:var_25359c8e0b5022a5];
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5581
// Size: 0x16
function isbulletpenetration(idflags) {
    return isdefined(idflags) && idflags & 8;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559f
// Size: 0x8c
function function_bdb257c83ae70586(attacker, victim, idflags, idamage, objweapon, smeansofdeath, var_69cfd14b4398c458) {
    if (!isdefined(var_69cfd14b4398c458)) {
        var_69cfd14b4398c458 = idamage;
    }
    idamage = function_72638ae79d782126(attacker, victim, idflags, idamage, objweapon, var_69cfd14b4398c458);
    idamage = function_5a1b7cfa5ac58688(idamage, objweapon, var_69cfd14b4398c458);
    if (issharedfuncdefined("damage", "handleAkimboDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAkimboDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5633
// Size: 0x84
function function_e5e4ad050998e4c1(attacker, objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1) {
    if (issharedfuncdefined("damage", "handleAPAmmoDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPAmmoDamage") ]](objweapon, smeansofdeath, idamage, var_be4285b26ed99ab1);
    }
    if (issharedfuncdefined("damage", "handleAPDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56bf
// Size: 0x99
function function_72638ae79d782126(attacker, victim, idflags, idamage, objweapon, var_69cfd14b4398c458) {
    var_960c2637064f97e9 = objweapon function_5be35054519da350();
    if (function_55c156d63be9eba2(objweapon) && var_960c2637064f97e9 > -1) {
        if (function_a3fc7ebc9fc3e9a3(attacker, victim, idflags)) {
            return idamage;
        }
    }
    var_1317052f37a9d4c3 = 0;
    if (var_69cfd14b4398c458 != 0) {
        var_1317052f37a9d4c3 = idamage / var_69cfd14b4398c458;
    } else {
        var_1317052f37a9d4c3 = 1;
    }
    if (var_960c2637064f97e9 > -1 && var_69cfd14b4398c458 < var_960c2637064f97e9) {
        idamage = var_960c2637064f97e9 * var_1317052f37a9d4c3;
    }
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5760
// Size: 0x73
function function_5a1b7cfa5ac58688(idamage, objweapon, var_69cfd14b4398c458) {
    var_c94bf7474b2b367b = objweapon function_957e87390fd5dba2();
    if (function_55c156d63be9eba2(objweapon) && var_c94bf7474b2b367b > 0) {
        /#
            assertmsg("spread weapon <" + objweapon.basename + "> found with maxDamageShelfClamp, this is not allowed by script.  All spread weapon maxDamageShelfClamp should be unmodified( -1 )");
        #/
        var_c94bf7474b2b367b = -1;
    }
    if (var_c94bf7474b2b367b > 0 && idamage > var_c94bf7474b2b367b) {
        idamage = var_c94bf7474b2b367b;
    }
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57db
// Size: 0x15
function function_b8f067334016ac40(objweapon, idamage) {
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x57f8
// Size: 0x65
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5865
// Size: 0x7a
function function_5145949f900334f0(attacker, idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath) {
    if (issharedfuncdefined("damage", "handleAPDamage")) {
        idamage = [[ getsharedfunc("damage", "handleAPDamage") ]](objweapon, smeansofdeath, idamage, attacker, self);
    }
    return idamage;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x58e7
// Size: 0x9b
function function_58a4d5ed666352ef(var_be4285b26ed99ab1, weapon, var_4efcc1874038117a) {
    var_e7ec701163e1b30c = 0;
    if (var_4efcc1874038117a == 4) {
        var_e7ec701163e1b30c = weapon getmid3damage();
    } else if (var_4efcc1874038117a == 3) {
        var_e7ec701163e1b30c = weapon getmid2damage();
    } else if (var_4efcc1874038117a == 2) {
        var_e7ec701163e1b30c = weapon getmid1damage();
    }
    if (var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.mindamage;
    }
    if (var_4efcc1874038117a == 1 || var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.maxdamage;
    }
    if (var_be4285b26ed99ab1 < var_e7ec701163e1b30c) {
        return int(var_e7ec701163e1b30c);
    } else {
        return var_be4285b26ed99ab1;
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5989
// Size: 0x9c
function function_343613187bdf786f(objweapon, smeansofdeath) {
    var_5c3f9357f11d2223 = objweapon.basename;
    if (isdefined(var_5c3f9357f11d2223) && var_5c3f9357f11d2223 == "danger_circle_br") {
        return 1;
    }
    if (smeansofdeath == "MOD_EXECUTION") {
        return 1;
    }
    if (smeansofdeath == "MOD_FALLING") {
        return 1;
    }
    if (smeansofdeath == "MOD_UNKNOWN") {
        return 1;
    }
    if (smeansofdeath == "MOD_SUICIDE") {
        return 1;
    }
    if (isdefined(var_5c3f9357f11d2223) && isdefined(level.var_e70ce1a0418791bd) && array_contains(level.var_e70ce1a0418791bd, var_5c3f9357f11d2223)) {
        return 1;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a2d
// Size: 0x2d
function armorvest_washit(attacker) {
    return isdefined(attacker.hitarmorvest) && gettime() == attacker.hitarmorvest;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a62
// Size: 0x1d
function armorvest_sethit(attacker) {
    attacker.hitarmorvest = gettime();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a86
// Size: 0x17
function armorvest_clearhit(attacker) {
    attacker.hitarmorvest = undefined;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aa4
// Size: 0x2d
function armorvest_wasbroke(attacker) {
    return isdefined(attacker.brokearmorvest) && gettime() == attacker.brokearmorvest;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ad9
// Size: 0x1d
function armorvest_setbroke(attacker) {
    attacker.brokearmorvest = gettime();
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5afd
// Size: 0x17
function armorvest_clearbroke(attacker) {
    attacker.brokearmorvest = undefined;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b1b
// Size: 0xd
function function_49765aa03d634cab() {
    return istrue(level.var_e4623740d9b51824);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b30
// Size: 0x1c
function function_a024d9111228a85e() {
    return !istrue(self.var_57c207fde9b78089) || istrue(level.var_843573804b98eb7e);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b54
// Size: 0x1d
function function_e47b13babb51a365() {
    if (self.armorhealth == self.var_8790c077c95db752) {
        return 1;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b79
// Size: 0x2a
function function_32bc8e85688648f4(var_5f6546312365b65c) {
    var_1c07ef7bc0e3723a = self.armorhealth + var_5f6546312365b65c;
    setarmorhealth(var_1c07ef7bc0e3723a);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5baa
// Size: 0x8d
function function_43702519a3dc0854(smeansofdeath, objweapon, var_49e6ef3edadd524e, victim) {
    if (smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET" || var_49e6ef3edadd524e == "assault_drone_mp") {
        return 1;
    }
    if (getdvarint(@"hash_6eba4697f8459b88", 0) && victim namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_blastshield") && namespace_d325722f2754c2c4::function_102d677621400199(objweapon)) {
        return 1;
    }
    if (objweapon.inventorytype == "offhand") {
        return 0;
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c3e
// Size: 0xc2
function function_ae24f0c0c8c6de2a(objweapon, var_49e6ef3edadd524e, weapontype) {
    if (isdefined(level.var_62f6f7640e4431e3.namekey) && (level.var_62f6f7640e4431e3.namekey == "br_ranked" || level.var_62f6f7640e4431e3.namekey == "resranked")) {
        return 0;
    } else {
        if (weapontype == "sniper" && var_49e6ef3edadd524e != "iw9_sn_limax" && function_f30a6d3194f97c09(objweapon, "specialty_explosivebullet")) {
            return 1;
        }
        if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
            return 1;
        }
        if (var_49e6ef3edadd524e == "jup_jp17_sn_hsierra") {
            return 1;
        }
        if (var_49e6ef3edadd524e == "jup_jp10_sn_cdelta50") {
            return 1;
        }
        return 0;
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d07
// Size: 0xf4
function function_7ee9d2852cedab94(var_24df708f286b0562, objweapon) {
    var_e91d6967b22e56a7 = "";
    foreach (i in objweapon.attachments) {
        if (issubstr(i, "ammo_bolt")) {
            var_e91d6967b22e56a7 = i;
        }
    }
    switch (var_e91d6967b22e56a7) {
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
    return int(var_24df708f286b0562 * modifier);
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e03
// Size: 0x95
function function_c49eb6797b9eec64() {
    self endon("death_or_disconnect");
    self endon("game_ended");
    self endon("armor_regen_end");
    if (isdefined(self.armorhealth) && isdefined(self.var_8790c077c95db752)) {
        childthread function_8820428e84e96143();
    }
    while (1) {
        waittill_any_2("damage", "damage_armor");
        if (!isdefined(self.armorhealth) || !isdefined(self.var_8790c077c95db752)) {
            continue;
        }
        if (self.armorhealth == self.var_8790c077c95db752) {
            continue;
        }
        childthread function_8820428e84e96143();
        waitframe();
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9f
// Size: 0xb8
function function_8820428e84e96143() {
    self notify("armor_regen_begin");
    self endon("armor_regen_begin");
    self endon("armor_regen_complete");
    var_c9d3262a60835c51 = getdvarfloat(@"hash_7d19a2300db06d4c", 2.3);
    regenrate = getdvarfloat(@"hash_3c4bba658371e89b", 0.175);
    regenamount = getdvarint(@"hash_d2eb87a7c2ed24e5", 1);
    wait(var_c9d3262a60835c51);
    timer = 0;
    while (1) {
        if (self.armorhealth >= self.var_8790c077c95db752) {
            self notify("armor_regen_complete");
        }
        setarmorhealth(self.armorhealth + regenamount);
        wait(regenrate);
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f5e
// Size: 0xe8
function function_dcc3b1093c9a295e(var_24df708f286b0562, var_49e6ef3edadd524e) {
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
        return int(var_24df708f286b0562 * modifier * 1.5);
    } else {
        return int(var_24df708f286b0562 * modifier * function_3768b225bd3bcf44());
    }
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x604d
// Size: 0xaf
function function_597e2eb3a04537cc(damage, var_49e6ef3edadd524e) {
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

// Namespace armor/namespace_f8d3520d3483c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6104
// Size: 0x2b
function function_ad6472280450c778(attacker, victim) {
    if (isplayer(attacker) && isplayer(victim)) {
        return 1;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6137
// Size: 0xbe
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
    case #"hash_da7d38f29eddc709":
        return 5;
    default:
        break;
    }
    return 0;
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61fd
// Size: 0x29
function function_55c156d63be9eba2(objweapon) {
    return isdefined(objweapon) && isdefined(weaponclass(objweapon)) && weaponclass(objweapon) == "spread";
}

// Namespace armor/namespace_f8d3520d3483c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x622e
// Size: 0xc
function function_ca2fbba0b1f55bbd() {
    return level.var_23960e36343a87a6;
}

