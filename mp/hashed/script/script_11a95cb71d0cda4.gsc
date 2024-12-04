#using scripts\engine\utility;
#using scripts\mp\gametypes\br_public;

#namespace br_headgear;

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1a0
// Size: 0x43
function autoexec headgear_init() {
    level.var_8472a7bd5d0e88f8 = spawnstruct();
    level.var_8472a7bd5d0e88f8.gear = [];
    utility::registersharedfunc("headgear", "registerHeadGear", &registerHeadGear);
    level notify("headgear_init");
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x44
function registerHeadGear(headGearType, var_8472a7bd5d0e88f8) {
    if (isdefined(level.var_8472a7bd5d0e88f8.gear[headGearType])) {
        return;
    }
    level.var_8472a7bd5d0e88f8.gear[headGearType] = var_8472a7bd5d0e88f8;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x237
// Size: 0x28
function function_27c9f3cd0731b4c0(headGearType) {
    if (isdefined(headGearType)) {
        return isdefined(level.var_8472a7bd5d0e88f8.gear[headGearType]);
    }
    return false;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x268
// Size: 0x63
function function_a34e6737707000de(headGearType, player, var_d13c72f4128a8c16, var_fcb952f595aa03ed, var_3ca4e0ab626847bc) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        player [[ var_8472a7bd5d0e88f8.var_f830d658f5f0af18 ]](var_d13c72f4128a8c16, var_fcb952f595aa03ed, var_3ca4e0ab626847bc);
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x85
function function_bfc15242950e692b(player) {
    var_ec1ccc1b4dba40f5 = 0;
    foreach (var_8472a7bd5d0e88f8 in level.var_8472a7bd5d0e88f8.gear) {
        var_ec1ccc1b4dba40f5 = [[ var_8472a7bd5d0e88f8.var_8965dea27a03f00f ]](player);
        if (istrue(var_ec1ccc1b4dba40f5)) {
            break;
        }
    }
    return var_ec1ccc1b4dba40f5;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x361
// Size: 0x85
function function_48c7a8ee781fbf56(player) {
    var_40155fb770719328 = 0;
    foreach (var_8472a7bd5d0e88f8 in level.var_8472a7bd5d0e88f8.gear) {
        var_40155fb770719328 = [[ var_8472a7bd5d0e88f8.var_4fe5d2ab2f7dbd0 ]](player);
        if (istrue(var_40155fb770719328)) {
            break;
        }
    }
    return var_40155fb770719328;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ef
// Size: 0x50
function hasheadgear(headGearType, player) {
    if (!isdefined(headGearType)) {
        return 0;
    }
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return [[ var_8472a7bd5d0e88f8.var_4fe5d2ab2f7dbd0 ]](player);
    }
    return 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x448
// Size: 0x49
function function_3e330e6a55dd4b3d(headGearType, player) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return [[ var_8472a7bd5d0e88f8.var_8965dea27a03f00f ]](player);
    }
    return 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49a
// Size: 0x41
function function_c210b50cd31a3bc2(headGearType) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return self [[ var_8472a7bd5d0e88f8.var_10b068badc49b1ad ]]();
    }
    return 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4e4
// Size: 0x49
function function_5ecd6df2572a5899(headGearType, player) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return [[ var_8472a7bd5d0e88f8.var_9b9af82c327f6a63 ]](player);
    }
    return undefined;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x536
// Size: 0x49
function function_5109f3947b0c7dfb(headGearType, player) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return [[ var_8472a7bd5d0e88f8.var_8928676cf7288c90 ]](player);
    }
    return 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x588
// Size: 0x52
function function_d036366985435d3(headGearType, player, pickup) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        return [[ var_8472a7bd5d0e88f8.var_d2148115f2c3c399 ]](player, pickup);
    }
    return 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e3
// Size: 0x48
function function_b606f6e492722fdb(headGearType, player) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        player [[ var_8472a7bd5d0e88f8.var_fe0fd9391666371 ]]();
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x633
// Size: 0x48
function function_72935b93ba0bbe17(headGearType, player) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8)) {
        player [[ var_8472a7bd5d0e88f8.var_bb61027a51ec1e05 ]]();
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x683
// Size: 0x15
function function_2bf7865c5a1937b3(player) {
    return istrue(self.var_46fa9025626f3183);
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a1
// Size: 0x51
function function_3ee77b6233481af9(headGearType, request) {
    if (!isdefined(self.var_d7a794d94a3269c6)) {
        self.var_d7a794d94a3269c6 = [];
    }
    if (isdefined(self.var_d7a794d94a3269c6[request])) {
        return;
    }
    self.var_d7a794d94a3269c6[request] = 1;
    thread function_1c4dbcfeb264cd9c(headGearType);
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa
// Size: 0x4e
function function_9f52e7f6c7bae335(headGearType, request) {
    if (!isdefined(self.var_d7a794d94a3269c6)) {
        self.var_d7a794d94a3269c6 = [];
    }
    if (!isdefined(self.var_d7a794d94a3269c6[request])) {
        return;
    }
    self.var_d7a794d94a3269c6[request] = undefined;
    thread function_1c4dbcfeb264cd9c(headGearType);
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x750
// Size: 0x139
function function_1c4dbcfeb264cd9c(headGearType) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (istrue(self.var_46fa9025626f3183)) {
        utility::waittill_notify_or_timeout("head_gear_swap_complete", 2);
        waitframe();
    }
    self notify("headGearUpdateOnOff");
    self endon("headGearUpdateOnOff");
    self.var_46fa9025626f3183 = 1;
    waittillframeend();
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    function_f4361ea8ce0fbca4();
    if (istrue(function_c210b50cd31a3bc2(headGearType))) {
        if (!istrue([[ var_8472a7bd5d0e88f8.var_8965dea27a03f00f ]](self))) {
            self setsoundsubmix("jup_wz_gasmask_nogas");
            thread function_7973b038d9f306f6(headGearType);
        } else {
            self clearsoundsubmix("jup_wz_gasmask_nogas");
            thread removeheadgear(headGearType);
        }
        return;
    }
    var_56b89cd79a0d240d = [[ var_8472a7bd5d0e88f8.var_8965dea27a03f00f ]](self);
    if (istrue(var_56b89cd79a0d240d) && (!isdefined(self.var_d7a794d94a3269c6) || !self.var_d7a794d94a3269c6.size)) {
        thread removeheadgear(headGearType);
        return;
    }
    if (!istrue(var_56b89cd79a0d240d) && isdefined(self.var_d7a794d94a3269c6) && self.var_d7a794d94a3269c6.size) {
        thread function_7973b038d9f306f6(headGearType);
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x891
// Size: 0x97
function function_7973b038d9f306f6(headGearType) {
    self endon("game_ended");
    self endon("death_or_disconnect");
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if ([[ var_8472a7bd5d0e88f8.var_8928676cf7288c90 ]](self) == 0) {
        self.var_46fa9025626f3183 = 0;
        return;
    }
    if (isdefined(var_8472a7bd5d0e88f8.var_a7d8d38f4018a344)) {
        self [[ var_8472a7bd5d0e88f8.var_a7d8d38f4018a344 ]]();
    }
    self notify("head_gear_swap_complete");
    self [[ var_8472a7bd5d0e88f8.var_4aeed0bec3628793 ]]();
    self.var_46fa9025626f3183 = 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x930
// Size: 0x79
function removeheadgear(headGearType) {
    self endon("game_ended");
    self endon("death_or_disconnect");
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    if (isdefined(var_8472a7bd5d0e88f8.var_2cb986fd5f1717f0)) {
        self [[ var_8472a7bd5d0e88f8.var_2cb986fd5f1717f0 ]]();
    }
    self notify("head_gear_swap_complete");
    self [[ var_8472a7bd5d0e88f8.var_573fe16545e70f6a ]]();
    self.var_46fa9025626f3183 = 0;
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b1
// Size: 0x72
function function_46a4f41002ccc37d(player, headGearType, request) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    player [[ var_8472a7bd5d0e88f8.var_573fe16545e70f6a ]]();
    player [[ var_8472a7bd5d0e88f8.var_bb61027a51ec1e05 ]]();
    if (isdefined(self.var_d7a794d94a3269c6)) {
        self.var_d7a794d94a3269c6[request] = undefined;
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa2b
// Size: 0x69
function breakHeadGear(headGearType, attacker) {
    var_8472a7bd5d0e88f8 = level.var_8472a7bd5d0e88f8.gear[headGearType];
    self [[ var_8472a7bd5d0e88f8.var_6969c6cefb309722 ]](attacker);
    if (![[ var_8472a7bd5d0e88f8.var_8965dea27a03f00f ]](self)) {
        self.var_d7a794d94a3269c6 = undefined;
        self.headGearType = undefined;
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa9c
// Size: 0x48
function function_f4361ea8ce0fbca4() {
    weapobj = makeweapon("iw8_ges_plyr_loot_pickup");
    if (self hasweapon(weapobj)) {
        if (self isgestureplaying("iw8_ges_pickup_br")) {
            self stopgestureviewmodel("iw8_ges_pickup_br", 0, 1);
        }
        self takeweapon(weapobj);
        waitframe();
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaec
// Size: 0x3c
function delayedattach(delaytime) {
    self endon("game_end");
    self endon("death_or_disconnect");
    if (isdefined(delaytime) && delaytime > 0) {
        wait delaytime;
    }
    self attach("hat_child_hadir_gas_mask_wm_br", "j_head");
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb30
// Size: 0x52
function delayeddetach(delaytime) {
    self endon("game_end");
    self endon("death_or_disconnect");
    if (isdefined(delaytime) && delaytime > 0) {
        wait delaytime;
    }
    if (self.gasmaskequipped) {
        self detach("hat_child_hadir_gas_mask_wm_br", "j_head");
        self.gasmaskequipped = 0;
    }
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8a
// Size: 0x1b
function function_ca27f3fd3dad0c1f() {
    self.var_ca27f3fd3dad0c1f = getdvarint(@"hash_eb228474021f803", 1);
}

// Namespace br_headgear / namespace_8beea18646ea4c36
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbad
// Size: 0xc
function resetGasMaskRemovalDelay() {
    self.var_ca27f3fd3dad0c1f = undefined;
}

