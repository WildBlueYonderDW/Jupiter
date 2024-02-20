// mwiii decomp prototype
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2669878cf5a1b6bc;

#namespace superDeploy;

// Namespace superDeploy/namespace_49492dacb8708592
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x571
// Size: 0x20a
function function_cfec51cac79ca4e6(var_19163e14365d9264, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, var_f6a32dcc4b19aad9, var_67a06b4ea269058e, waittime, skipfirstraise, var_6a94cf09aa6e486e) {
    level endon("game_ended");
    self endon("disconnect");
    if (self isonladder()) {
        return 0;
    }
    if (self ismantling()) {
        return 0;
    }
    if (isusingremote()) {
        return 0;
    }
    var_5c3f9357f11d2223 = "super_remote_device_mp";
    if (isdefined(var_f6a32dcc4b19aad9)) {
        var_5c3f9357f11d2223 = var_f6a32dcc4b19aad9;
    }
    weaponobj = makeweapon(var_5c3f9357f11d2223);
    deployanim = script_model%vm_ks_tablet_super_remote_raise;
    var_2ed8c4e06182fd14 = getanimlength(deployanim) - getdvarfloat(@"hash_8416696fd33ebf85", 0.433);
    if (isdefined(waittime)) {
        var_2ed8c4e06182fd14 = waittime;
    }
    function_4f203f286301b4ae(var_19163e14365d9264);
    val::set("superDeploy", "allow_movement", 0);
    val::set("superDeploy", "allow_jump", 0);
    val::set("superDeploy", "usability", 0);
    val::set("superDeploy", "melee", 0);
    val::set("superDeploy", "offhand_weapons", 0);
    val::set("superDeploy", "supers", 0);
    val::set("superDeploy", "killstreaks", 0);
    var_41bf9bf4918115ac = function_323489241ce4764a(weaponobj, var_19163e14365d9264, &function_f3e423ce0923187e, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, skipfirstraise, var_6a94cf09aa6e486e);
    if (isdefined(self) && _isalive()) {
        val::function_c9d0b43701bdba00("superDeploy");
    }
    if (!istrue(var_41bf9bf4918115ac)) {
        function_7cc79842967d7ae0(var_19163e14365d9264);
        if (isdefined(self)) {
            namespace_9abe40d2af041eb2::stoptabletscreen(var_19163e14365d9264.staticdata.ref);
        }
        return 0;
    }
    var_eabf81b5be8ddb5 = function_342f97880f848caa(var_19163e14365d9264, var_2ed8c4e06182fd14, var_67a06b4ea269058e);
    function_7cc79842967d7ae0(var_19163e14365d9264);
    return istrue(var_eabf81b5be8ddb5);
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x783
// Size: 0x19b
function function_f3a5a94b1d50ed38(var_19163e14365d9264, weaponobj, firednotify, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_97ee9768f7229838, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (!self isonground() && !self isswimming()) {
        return 0;
    }
    if (self isonladder()) {
        return 0;
    }
    if (istrue(self.super.isdeploying)) {
        return 0;
    }
    function_4f203f286301b4ae(var_19163e14365d9264);
    /#
        assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Field Upgrade "" + var_19163e14365d9264.staticdata.ref + "" trying to do a weapon-switch deploy, but has an invalid weapon");
    #/
    var_41bf9bf4918115ac = function_323489241ce4764a(weaponobj, var_19163e14365d9264, &function_f3e423ce0923187e, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_41bf9bf4918115ac)) {
        function_7cc79842967d7ae0(var_19163e14365d9264);
        return 0;
    }
    if (isdefined(var_19163e14365d9264) && isdefined(var_19163e14365d9264.var_fb58a31c756db4cc)) {
        namespace_1cd9f6896754adb0::function_3633b947164be4f3(var_19163e14365d9264.var_fb58a31c756db4cc, 0);
        var_9cf1d5b97d062b8a = function_e92aaca7f2fd7e8(var_19163e14365d9264, firednotify, weaponobj, var_97ee9768f7229838);
        namespace_1cd9f6896754adb0::function_588f2307a3040610(var_19163e14365d9264.var_fb58a31c756db4cc);
    } else {
        namespace_1cd9f6896754adb0::set("firedDeploy", "offhand_weapons", 0);
        var_9cf1d5b97d062b8a = function_e92aaca7f2fd7e8(var_19163e14365d9264, firednotify, weaponobj, var_97ee9768f7229838);
        namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("firedDeploy");
    }
    function_7cc79842967d7ae0(var_19163e14365d9264);
    return istrue(var_9cf1d5b97d062b8a);
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x926
// Size: 0xda
function function_8300ec48c43363d6(var_19163e14365d9264, weaponobj, keepweapon, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b) {
    /#
        assertex(isdefined(weaponobj) && weaponobj.basename != "none", "Field Upgrade "" + var_19163e14365d9264.staticdata.ref + "" trying to do a weapon-switch deploy, but has an invalid weapon");
    #/
    function_4f203f286301b4ae(var_19163e14365d9264);
    var_819c14e9dc86b8c8 = ter_op(istrue(keepweapon), &function_f3e423ce0923187e, undefined);
    var_41bf9bf4918115ac = function_323489241ce4764a(weaponobj, var_19163e14365d9264, var_819c14e9dc86b8c8, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b);
    if (!istrue(var_41bf9bf4918115ac)) {
        function_7cc79842967d7ae0(var_19163e14365d9264);
        return 0;
    } else {
        function_7cc79842967d7ae0(var_19163e14365d9264);
        return 1;
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa07
// Size: 0x1de
function private function_342f97880f848caa(var_19163e14365d9264, animlength, var_67a06b4ea269058e) {
    level endon("game_ended");
    self endon("disconnect");
    if (!isdefined(var_67a06b4ea269058e)) {
        var_67a06b4ea269058e = 1;
    }
    alias = "iw9_killstreak_tablet_gear";
    self playlocalsound(alias);
    setusingremote(var_19163e14365d9264.staticdata.ref);
    if (issharedfuncdefined("game", "objectiveUnPinPlayer") && isdefined(self.pinnedobjid)) {
        [[ getsharedfunc("game", "objectiveUnPinPlayer") ]](self.pinnedobjid, self);
        self.remoteunpinned = 1;
    }
    _freezecontrols(1, undefined, "superDeploy");
    thread function_c46ce93718743bf6();
    if (istrue(var_67a06b4ea269058e)) {
        thread function_a74d2cee7557d7b1(animlength - 0.3);
    }
    thread function_b351e53752cdb017(var_19163e14365d9264);
    thread function_1a0d50cc1357bdae();
    if (animlength > 0) {
        namespace_9abe40d2af041eb2::starttabletscreen(var_19163e14365d9264.staticdata.ref, 0.05);
    }
    result = waittill_any_timeout_3(animlength, "death", "weapon_change", "cancel_all_super_deployments");
    self notify("super_freeze_end");
    _freezecontrols(0, undefined, "superDeploy");
    var_143705e9ee3a624a = !self isonground() && !function_d474b372046544b0() || self isonladder() || self isinfreefall() || self isparachuting();
    if (!isdefined(result) || result != "timeout" || var_143705e9ee3a624a) {
        self notify("super_finished_with_deploy_weapon");
        self stoplocalsound("mp_killstreak_tablet_gear");
        namespace_9abe40d2af041eb2::stoptabletscreen(var_19163e14365d9264.staticdata.ref);
        self notify("cancel_remote_sequence");
        return 0;
    }
    self notify("deploy_weapon_anim_successful");
    return 1;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbed
// Size: 0x34
function private function_b351e53752cdb017(var_19163e14365d9264) {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("super_finished_with_deploy_weapon");
    if (isusingremote()) {
        clearusingremote(1);
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc28
// Size: 0x47
function private function_1a0d50cc1357bdae() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("deploy_weapon_anim_successful");
    self endon("cancel_remote_sequence");
    while (1) {
        if (!self isonground() && !function_d474b372046544b0()) {
            self notify("cancel_all_super_deployments");
            break;
        }
        waitframe();
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0xa1
function private function_a74d2cee7557d7b1(timedelay) {
    self endon("disconnect");
    result = waittill_any_timeout_1(timedelay, "cancel_remote_sequence");
    if (!isdefined(result) || result == "cancel_remote_sequence") {
        return;
    }
    if (_isalive()) {
        self playlocalsound("mp_killstreak_transition_whoosh");
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0.3);
        result = waittill_any_timeout_1(0.7, "death");
        if (!isdefined(result) || result == "death") {
            self stoplocalsound("mp_killstreak_transition_whoosh");
        }
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.3);
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd1e
// Size: 0x25
function private function_7cc79842967d7ae0(var_19163e14365d9264) {
    var_19163e14365d9264.isdeploying = 0;
    val::function_c9d0b43701bdba00("deployStart");
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd4a
// Size: 0x27
function private function_c46ce93718743bf6() {
    self endon("disconnect");
    self endon("super_freeze_end");
    level waittill("round_switch");
    _freezecontrols(0, undefined, "superDeploy");
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd78
// Size: 0x150
function function_323489241ce4764a(deployweaponobj, var_19163e14365d9264, var_819c14e9dc86b8c8, var_bdffc63c4171c131, var_8fd4d93dd619da88, var_91f739c2c51347d4, var_d55d8445518099b, skipfirstraise, var_6a94cf09aa6e486e) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    if (self hasweapon(deployweaponobj)) {
        return 0;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
            self notify("switched_from_minigun");
            while (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
                waitframe();
            }
        }
    }
    if (!isdefined(skipfirstraise)) {
        skipfirstraise = 1;
    }
    _giveweapon(deployweaponobj, 0, 0, skipfirstraise);
    var_137e8ca1e47954dc = function_dfc98a2de8e662a6(var_19163e14365d9264, var_bdffc63c4171c131);
    if (!istrue(var_137e8ca1e47954dc)) {
        _takeweapon(deployweaponobj);
        return 0;
    }
    thread function_12bd106b0dd9b11d(var_19163e14365d9264, deployweaponobj);
    thread function_6ce6b67d4d0ff91b(var_19163e14365d9264, deployweaponobj);
    var_41bf9bf4918115ac = domonitoredweaponswitch(deployweaponobj, istrue(var_6a94cf09aa6e486e));
    var_19163e14365d9264 notify("deploy_weapon_switch_ended");
    if (isdefined(var_8fd4d93dd619da88)) {
        self thread [[ var_8fd4d93dd619da88 ]](var_19163e14365d9264, var_41bf9bf4918115ac);
    }
    waitframe();
    if (!var_41bf9bf4918115ac) {
        var_819c14e9dc86b8c8 = undefined;
    }
    if (!_isalive()) {
        return 0;
    }
    thread function_e65b31e6948c503(var_41bf9bf4918115ac, var_19163e14365d9264, deployweaponobj, var_819c14e9dc86b8c8, var_91f739c2c51347d4, var_d55d8445518099b);
    return var_41bf9bf4918115ac;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed0
// Size: 0x147
function private function_e65b31e6948c503(var_41bf9bf4918115ac, var_19163e14365d9264, deployweaponobj, var_819c14e9dc86b8c8, var_91f739c2c51347d4, var_d55d8445518099b) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (isdefined(var_819c14e9dc86b8c8)) {
        self [[ var_819c14e9dc86b8c8 ]](var_19163e14365d9264);
    }
    if (self hasweapon(deployweaponobj)) {
        var_cd5c5ac9105ab0d7 = function_b04cbd5db8951229(deployweaponobj.basename);
        val::set("cleanupDeployWeapon", "melee", 0);
        val::set("cleanupDeployWeapon", "offhand_weapons", 0);
        if (var_cd5c5ac9105ab0d7) {
            val::set("cleanupDeployWeapon", "mantle", 0);
            val::set("cleanupDeployWeapon", "allow_movement", 0);
            var_524d5d1e26c664c5 = 0.5;
            if (!isreallyalive(self)) {
                var_524d5d1e26c664c5 = 0;
            }
            namespace_9abe40d2af041eb2::stoptabletscreen(var_19163e14365d9264.staticdata.ref, var_524d5d1e26c664c5, 1);
            _freezelookcontrols(1);
        }
        if (isdefined(var_91f739c2c51347d4)) {
            self [[ var_91f739c2c51347d4 ]](var_19163e14365d9264, var_41bf9bf4918115ac, deployweaponobj);
        } else {
            function_b22d2e6d02d50b21(deployweaponobj);
        }
        val::function_c9d0b43701bdba00("cleanupDeployWeapon");
        if (var_cd5c5ac9105ab0d7) {
            _freezelookcontrols(0);
        }
    }
    if (isdefined(var_d55d8445518099b)) {
        self [[ var_d55d8445518099b ]](var_19163e14365d9264);
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x101e
// Size: 0x54
function private function_b22d2e6d02d50b21(deployweaponobj) {
    getridofweapon(deployweaponobj, istrue(self.var_4a2f2f50a9020e2e));
    self.var_4a2f2f50a9020e2e = undefined;
    currentweapon = self getcurrentweapon();
    if (currentweapon.basename == "none") {
        forcevalidweapon();
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1079
// Size: 0x4a
function private function_12bd106b0dd9b11d(var_19163e14365d9264, deployweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    var_19163e14365d9264 endon("deploy_weapon_switch_ended");
    self waittill("cancel_all_super_deployments");
    if (isswitchingtoweaponwithmonitoring(deployweaponobj)) {
        abortmonitoredweaponswitch(deployweaponobj);
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ca
// Size: 0x35
function function_b04cbd5db8951229(weaponname) {
    var_cd5c5ac9105ab0d7 = 0;
    switch (weaponname) {
    case #"hash_288bc6291d670eaa":
        var_cd5c5ac9105ab0d7 = 1;
        break;
    }
    return var_cd5c5ac9105ab0d7;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1107
// Size: 0x66
function private function_6ce6b67d4d0ff91b(var_19163e14365d9264, deployweaponobj) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    var_19163e14365d9264 endon("deploy_weapon_switch_ended");
    self waittill("melee_swipe_start");
    if (isswitchingtoweaponwithmonitoring(deployweaponobj)) {
        abortmonitoredweaponswitch(deployweaponobj);
    } else {
        _takeweapon(deployweaponobj);
        thread domonitoredweaponswitch(self.lastdroppableweaponobj);
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x75
function private function_4f203f286301b4ae(var_19163e14365d9264) {
    /#
        assertex(!istrue(var_19163e14365d9264.isdeploying), "Scripter error: " + var_19163e14365d9264.staticdata.ref + " trying to deploy while it's already deploying");
    #/
    var_19163e14365d9264.isdeploying = 1;
    val::set("deployStart", "crate_use", 0);
    val::set("deployStart", "ascender_use", 0);
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11f0
// Size: 0x3d
function private function_dfc98a2de8e662a6(var_19163e14365d9264, var_bdffc63c4171c131) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("cancel_all_super_deployments");
    if (isdefined(var_bdffc63c4171c131)) {
        return self [[ var_bdffc63c4171c131 ]](var_19163e14365d9264);
    }
    return 1;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1235
// Size: 0x7e
function private function_f3e423ce0923187e(var_19163e14365d9264) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    childthread function_afb1be43e272a00a(self, "super_finished_with_deploy_weapon");
    childthread function_afb1be43e272a00a(self, "cancel_all_super_deployments");
    childthread function_afb1be43e272a00a(self, "weapon_change");
    while (1) {
        result = self waittill("super_finished_with_deploy_weapon");
        if (isdefined(result) && result == "weapon_change") {
            if (isusingremote()) {
                continue;
            }
        }
        break;
    }
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ba
// Size: 0x28
function private function_afb1be43e272a00a(ent, var_f36c0162774a45fa) {
    self endon("super_finished_with_deploy_weapon");
    ent waittill(var_f36c0162774a45fa);
    self notify("super_finished_with_deploy_weapon", var_f36c0162774a45fa);
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e9
// Size: 0x8f
function function_fceaa660b4da1c2b(weapon) {
    if (!isdefined(weapon)) {
        /#
            /#
                assertmsg("deployStart");
            #/
        #/
        return 0;
    }
    weaponname = undefined;
    if (isweapon(weapon)) {
        weaponname = weapon.basename;
    } else {
        weaponname = namespace_e0ee43ef2dddadaa::function_72376783a92be46(weapon);
        if (!isdefined(weaponname)) {
            weaponname = weapon;
        }
    }
    var_1880d2298e9e948a = 0;
    switch (weaponname) {
    case #"hash_288bc6291d670eaa":
    case #"hash_c94fd51fe359fdfe":
        var_1880d2298e9e948a = 1;
        break;
    }
    return var_1880d2298e9e948a;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1380
// Size: 0x29
function issuperweapon(weapon) {
    if (!isdefined(weapon)) {
        /#
            assertmsg("isSuperWeapon called without a weapon name passed in");
        #/
        return 0;
    }
    return isdefined(getsuperrefforsuperweapon(weapon));
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b1
// Size: 0xa1
function getsuperrefforsuperweapon(weapon) {
    if (!isdefined(level.superglobals)) {
        return undefined;
    }
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    var_1f2530c9fc4163fb = getsuperrefforsuperuseweapon(weapon);
    if (isdefined(var_1f2530c9fc4163fb)) {
        return var_1f2530c9fc4163fb;
    }
    var_6733de10d9782c78 = getsuperrefforsuperoffhand(weapon);
    if (isdefined(var_6733de10d9782c78)) {
        return var_6733de10d9782c78;
    }
    var_6733de10d9782c78 = getsuperrefforsuperextraweapon(weapon);
    if (isdefined(var_6733de10d9782c78)) {
        return var_6733de10d9782c78;
    }
    switch (weapon) {
    case #"hash_1a30d3a1753a5b6":
        return "super_tac_insert";
    case #"hash_e2c74e289201361":
        return "super_loadout_drop";
        break;
    }
    return undefined;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145a
// Size: 0x83
function getsuperrefforsuperuseweapon(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals) || !isdefined(level.superglobals.superweapons) || !isdefined(level.superglobals.superweapons[weapon])) {
        return undefined;
    }
    return level.superglobals.superweapons[weapon].ref;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e5
// Size: 0x5c
function getsuperrefforsuperoffhand(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals.supersbyoffhand[weapon])) {
        return undefined;
    }
    return level.superglobals.supersbyoffhand[weapon].ref;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1549
// Size: 0x75
function getsuperrefforsuperextraweapon(weapon) {
    if (!isstring(weapon)) {
        weapon = weapon.basename;
    }
    if (!isdefined(level.superglobals.supersbyextraweapon) || !isdefined(level.superglobals.supersbyextraweapon[weapon])) {
        return undefined;
    }
    return level.superglobals.supersbyextraweapon[weapon].ref;
}

// Namespace superDeploy/namespace_49492dacb8708592
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c6
// Size: 0x13e
function function_e92aaca7f2fd7e8(var_19163e14365d9264, firednotify, var_4ef1099365450bae, var_97ee9768f7229838) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self endon("weapon_change");
    self endon("cancel_all_super_deployments");
    while (1) {
        var_a9dd4e8c5e5c7178 = undefined;
        var_b663fbbcbb2f5780 = undefined;
        switch (firednotify) {
        case #"hash_21a23ad4b32e4f8e":
            var_a9dd4e8c5e5c7178 = self waittill(firednotify);
            break;
        case #"hash_77f5cb8818a754f0":
            var_a9dd4e8c5e5c7178 = self waittill(firednotify);
            break;
        case #"hash_3989359e2b52d1ba":
            var_a9dd4e8c5e5c7178 = var_b663fbbcbb2f5780 = self waittill(firednotify);
            break;
        default:
            self waittill(firednotify);
            break;
        }
        if (var_a9dd4e8c5e5c7178 == var_4ef1099365450bae) {
            if (isdefined(var_97ee9768f7229838)) {
                var_9cf1d5b97d062b8a = [[ var_97ee9768f7229838 ]](var_19163e14365d9264, var_a9dd4e8c5e5c7178, var_b663fbbcbb2f5780);
                if (!isdefined(var_9cf1d5b97d062b8a)) {
                    /#
                        assertex(isdefined(var_9cf1d5b97d062b8a), "weaponFiredCallback returned undefined, please make sure it returns success || failure || continue");
                    #/
                    return 0;
                } else if (var_9cf1d5b97d062b8a == "failure") {
                    return 0;
                } else if (var_9cf1d5b97d062b8a == "continue") {
                    continue;
                } else if (var_9cf1d5b97d062b8a == "success") {
                    return 1;
                } else {
                    /#
                        assertmsg("weaponFiredCallback returned an unrecognized string value.  Please make sure it returns success || failure || continue");
                    #/
                    return 0;
                }
            }
            return 1;
        }
    }
    return 0;
}

