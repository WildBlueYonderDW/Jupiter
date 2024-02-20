// mwiii decomp prototype
#using script_2ed63158b46a6d6f;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6775ad452d13858;

#namespace seasonalevents;

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x191
// Size: 0x29
function private function_2c4ebdb018587662(var_f34bb8addd5efb2b, var_310ffc2dc3da6985) {
    return function_2ef675c13ca1c4af(@"hash_4489457facd70c28", var_f34bb8addd5efb2b, "_", var_310ffc2dc3da6985);
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c2
// Size: 0x10
function private function_4220cd9603b993a8(i) {
    return i + 1;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1da
// Size: 0x26
function private function_b0de9e7b2bc4b4d5(currenttime, starttime, endtime) {
    return currenttime >= starttime && currenttime < endtime;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x208
// Size: 0xb9
function private function_d68e2fd9a635c0cd() {
    systemtime = getsystemtime();
    currenttime = systemtime;
    if (level.var_c5f55642efa61b9c) {
        foreach (player in level.players) {
            timeWarpOffsetSeconds = player getplayerdata(level.var_5d69837cf4db0407, "timeWarpOffsetSeconds");
            if (!isdefined(timeWarpOffsetSeconds)) {
                timeWarpOffsetSeconds = 0;
            }
            var_fe847d14a45f3270 = systemtime + timeWarpOffsetSeconds;
            if (var_fe847d14a45f3270 > currenttime) {
                currenttime = var_fe847d14a45f3270;
            }
        }
    }
    return currenttime;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c9
// Size: 0x459
function private function_e3f4b08018abdbaf() {
    if (isdefined(level.seasonalevents)) {
        return;
    }
    level.var_c5f55642efa61b9c = getdvarint(@"hash_dec5cd614ac064d", 0);
    seasonalevents = [];
    var_fe50eb1b16b6a9dd = undefined;
    if (getdvarint(@"hash_75ee328744735d6a", 0)) {
        var_fe50eb1b16b6a9dd = getscriptbundle(%"hash_3d06516d47cafe56");
    } else {
        var_fe50eb1b16b6a9dd = getscriptbundle(%"hash_1e670630bf9f818");
    }
    if (isdefined(var_fe50eb1b16b6a9dd)) {
        foreach (assetref in var_fe50eb1b16b6a9dd.events) {
            if (!isdefined(assetref.eventdata)) {
                continue;
            }
            bundlename = function_2ef675c13ca1c4af(%"hash_380349b348ddab0c", assetref.eventdata);
            var_a3f7381340cf06d9 = getscriptbundle(bundlename);
            if (!isdefined(var_a3f7381340cf06d9)) {
                continue;
            }
            eventDisabled = getdvarint(function_2c4ebdb018587662("eventDisabled", var_a3f7381340cf06d9.var_310ffc2dc3da6985));
            if (istrue(eventDisabled)) {
                continue;
            }
            starttime = getdvar(function_2c4ebdb018587662("startTime", var_a3f7381340cf06d9.var_310ffc2dc3da6985), var_a3f7381340cf06d9.starttime);
            endtime = getdvar(function_2c4ebdb018587662("endTime", var_a3f7381340cf06d9.var_310ffc2dc3da6985), var_a3f7381340cf06d9.endtime);
            starttime = ter_op(!string::function_46b9c00bb0535aa3(starttime), int(starttime), 0);
            endtime = ter_op(!string::function_46b9c00bb0535aa3(endtime), int(endtime), 1800000000);
            var_b7022e210caea585 = function_b0de9e7b2bc4b4d5(getsystemtime(), starttime, endtime);
            var_56651c25de2e68b5 = [];
            for (i = 0; i < var_a3f7381340cf06d9.var_7d7e19a33bddbf31.size; i++) {
                var_40caf2a6f1d81104 = var_a3f7381340cf06d9.var_7d7e19a33bddbf31[i].var_f19cc806e12f53b7;
                var_40caf2a6f1d81104 = getdvar(function_2c4ebdb018587662("featuredItemLootID_" + function_4220cd9603b993a8(i), var_a3f7381340cf06d9.var_310ffc2dc3da6985), var_40caf2a6f1d81104);
                var_40caf2a6f1d81104 = ter_op(!string::function_46b9c00bb0535aa3(var_40caf2a6f1d81104), int(var_40caf2a6f1d81104), 0);
                var_56651c25de2e68b5[var_56651c25de2e68b5.size] = var_40caf2a6f1d81104;
            }
            var_6237ccb1f3a8c682 = [];
            for (i = 0; i < var_a3f7381340cf06d9.var_5e42ba3bc94d58ff.var_c1d8c1d953c02016.var_6237ccb1f3a8c682.size; i++) {
                key = var_a3f7381340cf06d9.var_5e42ba3bc94d58ff.var_c1d8c1d953c02016.var_6237ccb1f3a8c682[i].key;
                key = getdvar(function_2c4ebdb018587662("pointsCategoryKey_" + function_4220cd9603b993a8(i), var_a3f7381340cf06d9.var_310ffc2dc3da6985), key);
                var_6237ccb1f3a8c682[var_6237ccb1f3a8c682.size] = key;
            }
            var_9301e90474add74a = 0;
            var_66508a1499448043 = 0;
            if (var_a3f7381340cf06d9.template == "POINTS") {
                var_9301e90474add74a = 1;
                operatorSkinDisabled = getdvarint(function_2c4ebdb018587662("operatorSkinDisabled", var_a3f7381340cf06d9.var_310ffc2dc3da6985));
                if (!istrue(operatorSkinDisabled)) {
                    if (var_56651c25de2e68b5.size >= 1 && var_56651c25de2e68b5[0] != 0) {
                        var_66508a1499448043 = var_56651c25de2e68b5[0];
                    }
                }
            }
            eventdata = spawnstruct();
            eventdata.template = var_a3f7381340cf06d9.template;
            eventdata.var_310ffc2dc3da6985 = var_a3f7381340cf06d9.var_310ffc2dc3da6985;
            eventdata.starttime = starttime;
            eventdata.endtime = endtime;
            eventdata.var_b7022e210caea585 = var_b7022e210caea585;
            eventdata.var_56651c25de2e68b5 = var_56651c25de2e68b5;
            eventdata.var_6237ccb1f3a8c682 = var_6237ccb1f3a8c682;
            eventdata.var_9301e90474add74a = var_9301e90474add74a;
            eventdata.var_66508a1499448043 = var_66508a1499448043;
            seasonalevents[seasonalevents.size] = eventdata;
        }
    }
    level.seasonalevents = seasonalevents;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x729
// Size: 0xc6
function private function_af3371400730e514() {
    /#
        assert(isdefined(level.seasonalevents));
    #/
    if (isdefined(level.var_a6fdfb1454ce258e)) {
        return;
    }
    var_a6fdfb1454ce258e = spawnstruct();
    var_a6fdfb1454ce258e.var_b7022e210caea585 = 0;
    foreach (event in level.seasonalevents) {
        if (event.var_9301e90474add74a && event.var_b7022e210caea585) {
            var_a6fdfb1454ce258e.var_b7022e210caea585 = 1;
            break;
        }
    }
    level.var_a6fdfb1454ce258e = var_a6fdfb1454ce258e;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x7f6
// Size: 0x45
function autoexec function_b9ac0d0975647ba() {
    registersharedfunc("seasonalevents", "init", &init);
    registersharedfunc("seasonalevents", "getFieldRepEventActive", &getFieldRepEventActive);
    registersharedfunc("seasonalevents", "hasFieldRepOperatorSkinEquipped", &hasFieldRepOperatorSkinEquipped);
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x842
// Size: 0x11
function private init() {
    function_e3f4b08018abdbaf();
    function_af3371400730e514();
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x85a
// Size: 0xd9
function private getFieldRepEventActive() {
    /#
        assert(isdefined(level.var_a6fdfb1454ce258e));
    #/
    /#
        assert(isdefined(level.seasonalevents));
    #/
    if (level.var_c5f55642efa61b9c) {
        currenttime = function_d68e2fd9a635c0cd();
        foreach (event in level.seasonalevents) {
            if (event.var_9301e90474add74a) {
                if (function_b0de9e7b2bc4b4d5(currenttime, event.starttime, event.endtime)) {
                    return 1;
                }
            }
        }
        return 0;
    }
    return level.var_a6fdfb1454ce258e.var_b7022e210caea585;
}

// Namespace seasonalevents/namespace_9ebb57ff3634ecc7
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x266
function private hasFieldRepOperatorSkinEquipped() {
    /#
        assert(isdefined(level.seasonalevents));
    #/
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    player = self;
    var_650b47766000d829 = undefined;
    var_48c6afe9d308416c = undefined;
    var_1c6922a7d061f276 = undefined;
    if (isdefined(player.operatorcustomization.var_d947b7e87c7243ab)) {
        var_650b47766000d829 = player.operatorcustomization.var_d947b7e87c7243ab;
    }
    var_fd476bda738b0d05 = namespace_448ccf1ca136fbbe::ismp() && !isBRStyleGameType() && getgametype() != "ob";
    if (var_fd476bda738b0d05) {
        var_f5cf62a90611b64d = player getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", 0);
        if (!string::function_46b9c00bb0535aa3(var_f5cf62a90611b64d) && namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_f5cf62a90611b64d)) {
            var_48c6afe9d308416c = player getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", var_f5cf62a90611b64d, "skin");
        }
        var_d36f855c0bf1a4f7 = player getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", 1);
        if (!string::function_46b9c00bb0535aa3(var_d36f855c0bf1a4f7) && namespace_465d40bb08a5337a::function_54240a5fc41f6590(var_d36f855c0bf1a4f7)) {
            var_1c6922a7d061f276 = player getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorCustomization", var_d36f855c0bf1a4f7, "skin");
        }
    }
    currenttime = function_d68e2fd9a635c0cd();
    foreach (event in level.seasonalevents) {
        if (event.var_9301e90474add74a) {
            if (function_b0de9e7b2bc4b4d5(currenttime, event.starttime, event.endtime)) {
                if (event.var_66508a1499448043 != 0) {
                    if (isdefined(var_650b47766000d829) && var_650b47766000d829 == event.var_66508a1499448043) {
                        return 1;
                    }
                    if (isdefined(var_48c6afe9d308416c) && var_48c6afe9d308416c == event.var_66508a1499448043) {
                        return 1;
                    }
                    if (isdefined(var_1c6922a7d061f276) && var_1c6922a7d061f276 == event.var_66508a1499448043) {
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}

