// mwiii decomp prototype
#namespace ai;

// Namespace ai/namespace_90b27065dcb82e64
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7
// Size: 0x1e9
function free_expendable() {
    if (!isdefined(self.spawner) || !isdefined(self.script_suspend)) {
        return;
    }
    spawner = self.spawner;
    struct = spawnstruct();
    struct.origin = self.origin;
    struct.angles = self.angles;
    struct.suspendtime = gettime();
    if (isdefined(self.suspendvars)) {
        struct.suspendvars = self.suspendvars;
    } else {
        struct.suspendvars = spawnstruct();
    }
    if (isdefined(self.stealth)) {
        struct.stealth = spawnstruct();
        struct.stealth.bsmstate = self.var_fe5ebefa740c7106;
        if (isdefined(self.var_743f5eeb386835f5)) {
            struct.stealth.investigateevent = self [[ self.var_743f5eeb386835f5 ]]();
        }
    }
    if (isdefined(self.node)) {
        if (isdefined(self.using_goto_node)) {
            if (isdefined(self.node.targetname)) {
                struct.target = self.node.targetname;
            }
            struct.node = self.node;
        }
        struct.target = self.node.targetname;
    }
    spawner.suspended_ai = struct;
    if (isdefined(self.script_suspend_group) && !isdefined(self.script_free)) {
        free_groupname(self.script_suspend_group);
    }
    /#
        spawner thread function_1ef621491ffaeede();
    #/
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a7
// Size: 0x10e
function free_groupname(groupname) {
    if (!isdefined(level.processfreegroupname)) {
        level.processfreegroupname = [];
    }
    if (isdefined(level.processfreegroupname[groupname])) {
        return;
    }
    level.processfreegroupname[groupname] = 1;
    aiarray = getaiarray();
    foreach (ai in aiarray) {
        if (ai == self) {
            continue;
        }
        if (!isdefined(ai.script_suspend_group)) {
            continue;
        }
        if (ai.script_suspend_group != groupname) {
            continue;
        }
        ai.script_free = 1;
        ai free_expendable();
        /#
            println("cover_right_crouch_stand" + groupname + "ai_jailer_settings_default_script" + ai.origin);
        #/
        ai delete();
    }
    level.processfreegroupname[groupname] = undefined;
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bc
// Size: 0xaa
function function_1ef621491ffaeede(spawner) {
    /#
        self endon("background");
        if (!isdefined(level.func)) {
            return;
        }
        if (!isdefined(level.func["<unknown string>"])) {
            return;
        }
        while (1) {
            waitframe();
            if (!isdefined(self.suspended_ai)) {
                return;
            }
            if (getdvarint(@"hash_6efeeea168f0a561") == 0) {
                continue;
            }
            [[ level.func["<unknown string>"] ]](self.suspended_ai.origin, self.suspended_ai.angles, (1, 0.5, 0.25));
        }
    #/
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x86d
// Size: 0xf6
function create_weapon_in_script(weaponarray, var_e46130a1f1555462) {
    if (!isdefined(level.fnscriptedweaponassignment)) {
        self.usescriptedweapon = undefined;
        if (!isdefined(weaponarray)) {
            weapon = nullweapon();
        } else if (!isarray(weaponarray) && weaponarray == "") {
            weapon = nullweapon();
        } else if (isarray(weaponarray)) {
            weapon = makeweapon(weaponarray[randomint(weaponarray.size)]);
        } else {
            weapon = makeweapon(weaponarray);
        }
        if (!isnullweapon(weapon)) {
            self.scriptedweaponfailed = 1;
            if (isdefined(var_e46130a1f1555462) && var_e46130a1f1555462 == "sidearm") {
                self.scriptedweaponfailed_sidearmarray = weaponarray;
            } else {
                self.scriptedweaponfailed_primaryarray = weaponarray;
            }
        }
        /#
            println("<unknown string>" + self getentitynumber() + "<unknown string>" + getweaponbasename(weapon));
        #/
        return weapon;
    } else {
        return [[ level.fnscriptedweaponassignment ]](weaponarray, var_e46130a1f1555462);
    }
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96a
// Size: 0x77
function function_3a249a1f1aecbb0e(callbackname, ai, param1, param2, param3, param4) {
    result = undefined;
    if (isdefined(level.stealth.var_e376d807bb8ce93b)) {
        result = ai [[ level.stealth.var_e376d807bb8ce93b ]](callbackname, param1, param2, param3, param4);
    }
    return istrue(result);
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e9
// Size: 0x38
function function_9aead378ca03cb28(charactertype, position, var_93a30e5888017bae) {
    if (isdefined(level.var_74e9c02b56e4ba52)) {
        [[ level.var_74e9c02b56e4ba52 ]](charactertype, position, var_93a30e5888017bae);
    }
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa28
// Size: 0x2f
function function_41ff5020f8762668(ent, var_93a30e5888017bae) {
    if (isdefined(level.var_8a42b71f799936ad)) {
        [[ level.var_8a42b71f799936ad ]](ent, var_93a30e5888017bae);
    }
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5e
// Size: 0x28
function function_d5ee270afc41e925(var_93a30e5888017bae) {
    if (isdefined(level.var_19ef4572543c12c1)) {
        return [[ level.var_19ef4572543c12c1 ]](var_93a30e5888017bae);
    }
    return 1;
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8e
// Size: 0x38
function function_8ff6b395c2615881(callbackname, requestid, data) {
    if (isdefined(level.var_3ae5f7de11d142f)) {
        return [[ level.var_3ae5f7de11d142f ]](callbackname, requestid, data);
    }
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0x34
function function_2c18f4deacb75a6d(ent, state) {
    if (isdefined(ent.var_82420c8df7f30a5b)) {
        ent thread [[ ent.var_82420c8df7f30a5b ]](state);
    }
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb08
// Size: 0x3
function function_2392636ed67e9fed() {
    
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb12
// Size: 0x8
function function_56543479237033c3() {
    return &function_2392636ed67e9fed;
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb22
// Size: 0xa
function function_74939cb3d7c3057b() {
    function_87dc2db63d1cfe13();
}

// Namespace ai/namespace_90b27065dcb82e64
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb33
// Size: 0x20a3
function function_87dc2db63d1cfe13() {
    if (1) {
        var_5960b342a6ef48d = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[0] = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[0].name = "default";
        var_5960b342a6ef48d.var_73d903554c10ec93[0].query = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[0].query;
        obj.var_9efb032663ad97c1[0] = 64;
        obj.var_3d5cc1a409a98fd0 = 300;
        obj.var_63173b6856e415e7 = 130;
        obj.var_94cf3022fca2b151 = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[0] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[0];
        obj.types = "aim_only";
        obj.var_b12d12beace49802 = spawnstruct();
        obj.var_b12d12beace49802.speed = 80;
        obj.var_b12d12beace49802.types = "aim_only";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_d40d255ab3b9623b = 90;
        obj.action.var_fb95ad1022e86854 = 90;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.validation = spawnstruct();
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 70;
        obj.validation.var_fb95ad1022e86854 = 70;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 300;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[1] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[1];
        obj.types = "strafe_only";
        obj.var_b12d12beace49802 = spawnstruct();
        obj.var_b12d12beace49802.speed = 60;
        obj.var_b12d12beace49802.types = "strafe_only";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_d40d255ab3b9623b = 180;
        obj.action.var_fb95ad1022e86854 = 120;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.action.var_2efd5c4e05ac0023 = 0.5;
        obj.validation = spawnstruct();
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 90;
        obj.validation.var_fb95ad1022e86854 = 90;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[2] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[0].combined[2];
        obj.types = "shallow";
        obj.var_b12d12beace49802 = spawnstruct();
        obj.var_b12d12beace49802.speed = 49;
        obj.var_b12d12beace49802.var_b9f5df1b7d672272 = 75;
        obj.var_b12d12beace49802.types = "shallow";
        obj.action = spawnstruct();
        obj.action.var_c84c06a4463ee99c = 24;
        obj.action.var_1373755bb3b8c41 = 32;
        obj.var_9a0ef637629e8188 = spawnstruct();
        obj.var_9a0ef637629e8188.var_832c9aa8484af5bb = 48;
        obj.validation = spawnstruct();
        obj.validation.var_26e073f24350c158 = 40;
        obj.validation.var_d1e64a8da97c5f9a = 135;
        obj.validation.maxspeed = 50;
        obj.validation.asmstatename = "cautious_shallow_corner_check";
        obj.validation.var_1373755bb3b8c41 = 32;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_8ab8aa563abb4083[0] = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_8ab8aa563abb4083[0].types = "shallow";
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_8ab8aa563abb4083[0].speed = 80;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_8ab8aa563abb4083[0].var_47044115b7fa1278 = 75;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_1afd01823bb3d66f[0] = spawnstruct();
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[0].var_1afd01823bb3d66f[0];
        obj.types = "shallow";
        obj.asmstatename = "cornercheck_shallow_fast";
        obj.maxspeed = 90;
        obj.minspeed = 75;
        obj.var_26e073f24350c158 = 40;
        obj.var_d1e64a8da97c5f9a = 135;
        var_5960b342a6ef48d.var_73d903554c10ec93[0].var_3951cabc31d342f = 6;
        var_5960b342a6ef48d.var_73d903554c10ec93[1] = function_7e7b315fcb2b9159(var_5960b342a6ef48d.var_73d903554c10ec93[0], 1);
        var_5960b342a6ef48d.var_73d903554c10ec93[1].name = "nightwar_start";
        var_5960b342a6ef48d.var_73d903554c10ec93[1].var_f4d3813e43115b14 = "shallow";
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[0].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[0].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[0].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[1].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[1].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[1].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[2].visibility = spawnstruct();
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[2].visibility.var_6bb8b086cbae934 = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[1].combined[2].visibility.var_5f5e6a9e5b0d045f = 0;
        var_5960b342a6ef48d.var_73d903554c10ec93[2] = function_7e7b315fcb2b9159(var_5960b342a6ef48d.var_73d903554c10ec93[0], 1);
        var_5960b342a6ef48d.var_73d903554c10ec93[2].name = "soldier_paranoid";
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[2].query;
        obj.var_9efb032663ad97c1[0] = 64;
        obj.var_9efb032663ad97c1[1] = 164;
        obj.var_3d5cc1a409a98fd0 = 300;
        obj.var_63173b6856e415e7 = 130;
        obj.var_94cf3022fca2b151 = 200;
        obj.var_f2801301f3d1c032 = 200;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[2].combined[0];
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 70;
        obj.validation.var_fb95ad1022e86854 = 70;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 300;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[2].combined[1];
        obj.validation.var_d1e64a8da97c5f9a = 170;
        obj.validation.var_d40d255ab3b9623b = 90;
        obj.validation.var_fb95ad1022e86854 = 90;
        obj.validation.var_1373755bb3b8c41 = 32;
        obj.validation.var_c2866d21d8ade257 = 60;
        obj.validation.var_6af25e49ed56b1cc = 200;
        var_5960b342a6ef48d.var_73d903554c10ec93[3] = function_7e7b315fcb2b9159(var_5960b342a6ef48d.var_73d903554c10ec93[0], 1);
        var_5960b342a6ef48d.var_73d903554c10ec93[3].name = "combat_default";
        var_5960b342a6ef48d.var_73d903554c10ec93[3].var_1afd01823bb3d66f[0].var_6573e88bcd4acac9 = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[3].combined[0];
        obj.var_b12d12beace49802.types = "";
        obj.validation.var_6573e88bcd4acac9 = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[3].combined[1];
        obj.var_b12d12beace49802.types = "";
        obj.validation.var_6573e88bcd4acac9 = 1;
        obj = var_5960b342a6ef48d.var_73d903554c10ec93[3].combined[2];
        obj.var_b12d12beace49802.types = "";
        obj.validation.var_6573e88bcd4acac9 = 1;
        function_6b4ab6c856a01415("component", var_5960b342a6ef48d, "ai_cornercheck_behaviors", "ai_cornercheck_behaviors_default_script");
    }
    if (1) {
        var_62193d5aea59930f = spawnstruct();
        var_62193d5aea59930f.var_ec5d24a985f94861 = "simple";
        var_daf5681b8a09c71c = spawnstruct();
        var_daf5681b8a09c71c.var_73d903554c10ec93[0] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[0];
        obj.name = "cover_right";
        obj.var_8acf2c9c4f6d6a58 = 15;
        obj.var_4f8a7cc0bdea8a8d = 30;
        obj.var_90f2fb36d1e4fbb8 = 20;
        obj.var_56b54f5705cd766d = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[1] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[1];
        obj.name = "cover_left";
        obj.var_8acf2c9c4f6d6a58 = 60;
        obj.var_4f8a7cc0bdea8a8d = 15;
        obj.var_90f2fb36d1e4fbb8 = 20;
        obj.var_56b54f5705cd766d = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[2] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[2];
        obj.name = "cover_crouch";
        obj.var_8acf2c9c4f6d6a58 = 15;
        obj.var_4f8a7cc0bdea8a8d = 45;
        obj.var_90f2fb36d1e4fbb8 = 20;
        obj.var_56b54f5705cd766d = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[3] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[3];
        obj.name = "exposed";
        obj.var_8acf2c9c4f6d6a58 = 45;
        obj.var_4f8a7cc0bdea8a8d = 45;
        obj.var_90f2fb36d1e4fbb8 = 30;
        obj.var_56b54f5705cd766d = 30;
        var_daf5681b8a09c71c.var_73d903554c10ec93[4] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[4];
        obj.name = "default";
        obj.var_8acf2c9c4f6d6a58 = 60;
        obj.var_4f8a7cc0bdea8a8d = 60;
        obj.var_90f2fb36d1e4fbb8 = 45;
        obj.var_56b54f5705cd766d = 45;
        var_daf5681b8a09c71c.var_73d903554c10ec93[5] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[5];
        obj.name = "exposed_aim";
        obj.var_8acf2c9c4f6d6a58 = 20;
        obj.var_4f8a7cc0bdea8a8d = 20;
        obj.var_90f2fb36d1e4fbb8 = 30;
        obj.var_56b54f5705cd766d = 10;
        var_daf5681b8a09c71c.var_73d903554c10ec93[6] = function_7e7b315fcb2b9159(var_daf5681b8a09c71c.var_73d903554c10ec93[4], 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[6];
        obj.name = "advanced_default";
        obj.var_ec5d24a985f94861 = "advanced_default";
        obj.var_8acf2c9c4f6d6a58 = 120;
        obj.var_4f8a7cc0bdea8a8d = 120;
        obj.var_90f2fb36d1e4fbb8 = 80;
        obj.var_56b54f5705cd766d = 80;
        var_daf5681b8a09c71c.var_73d903554c10ec93[7] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[7];
        obj.name = "tight_with_player";
        obj.var_8acf2c9c4f6d6a58 = 60;
        obj.var_4f8a7cc0bdea8a8d = 60;
        obj.var_90f2fb36d1e4fbb8 = 45;
        obj.var_56b54f5705cd766d = 45;
        obj.var_2b8d11e619e0b8ee = 100;
        obj.var_6f341aa6029aa6a6 = 0;
        var_daf5681b8a09c71c.var_73d903554c10ec93[8] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[8];
        obj.name = "default_no_spine";
        obj.var_8acf2c9c4f6d6a58 = 60;
        obj.var_4f8a7cc0bdea8a8d = 60;
        obj.var_90f2fb36d1e4fbb8 = 45;
        obj.var_56b54f5705cd766d = 45;
        obj.var_ece6263298ae714 = 1;
        var_daf5681b8a09c71c.var_73d903554c10ec93[9] = function_7e7b315fcb2b9159(var_62193d5aea59930f, 1);
        obj = var_daf5681b8a09c71c.var_73d903554c10ec93[9];
        obj.name = "animscripted_with_player";
        obj.var_8acf2c9c4f6d6a58 = 100;
        obj.var_4f8a7cc0bdea8a8d = 100;
        obj.var_90f2fb36d1e4fbb8 = 45;
        obj.var_56b54f5705cd766d = 45;
        obj.var_fe3d05a9f4ea87e = 1;
        obj.var_cb96e471adcd131 = 0;
        function_6b4ab6c856a01415("component", var_daf5681b8a09c71c, "ai_lookat_behaviors", "ai_lookat_behaviors_default_script");
    }
    if (1) {
        var_3f42592f8e297ea = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[0] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[0].var_de94e5d776cdc165 = "cover_right";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[0].var_a3476363ca654e1c[0] = "cover_right_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[0].var_a3476363ca654e1c[1] = "cover_right";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[1] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[1].var_de94e5d776cdc165 = "cover_left";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[1].var_a3476363ca654e1c[0] = "cover_left_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[1].var_a3476363ca654e1c[1] = "cover_left";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[2] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[2].var_de94e5d776cdc165 = "cover_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[2].var_a3476363ca654e1c[0] = "cover_crouch";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[3] = spawnstruct();
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[3].var_de94e5d776cdc165 = "exposed";
        arr[0] = "cover_right_crouch_stand";
        arr[arr.size] = "cover_right_crouch_exposed_left";
        arr[arr.size] = "cover_right_crouch_exposed_right";
        arr[arr.size] = "cover_left_crouch_stand";
        arr[arr.size] = "cover_left_crouch_exposed_left";
        arr[arr.size] = "cover_left_crouch_exposed_right";
        arr[arr.size] = "cover_left_crouch_exposed_a";
        arr[arr.size] = "cover_left_crouch_exposed_b";
        arr[arr.size] = "cover_right_crouch_exposed_a";
        arr[arr.size] = "cover_right_crouch_exposed_b";
        arr[arr.size] = "cover_left_exposed_a";
        arr[arr.size] = "cover_left_exposed_b";
        arr[arr.size] = "cover_right_exposed_a";
        arr[arr.size] = "cover_right_exposed_b";
        arr[arr.size] = "exposed_idle";
        arr[arr.size] = "cover_stand";
        var_3f42592f8e297ea.var_21c27c0ac99d29ed[3].var_a3476363ca654e1c = arr;
        function_6b4ab6c856a01415("component", var_3f42592f8e297ea, "ai_lookat_anim_mappings", "ai_lookat_anim_mappings_default_script");
    }
    if (1) {
        var_b8c784bb7e525fcf = spawnstruct();
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0] = spawnstruct();
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].name = "default";
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_af4bdc6f4521ecba = getdvarfloat(@"hash_f8240d5c0c37ac7e", 0.4);
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_71ab7138c82e0414 = getdvarfloat(@"hash_960bb94e318db890", 1.2);
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_6ff73a4c2decc237 = 55;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_93185d472b55082 = 120;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_8b7a4dc6e1256321 = 200;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].acceleration = 300;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_acdfcbf564707132 = -300;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_26e7c5c27c4a71a5 = 200;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_810f84117b47d883 = 300;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_97184e9f093ea3a0 = 550;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_12fa7e4bf627b292 = 700;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_8756726934e12803 = 1000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_3afd9cf782198639 = 0;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_c50883e1120a978e = 20;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_3facd58886dfd323 = 1500;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_6358e5c58d47f837 = 1000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_f1b25456120283f0 = 3000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_4ab749aad99e7631 = 4000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_63bc3f012ac7583e = 2000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_e1283f20324cb7dd = 100;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_2b44a72e6286cae7 = 4000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_2efb9de526add856 = 10000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_c6e764480e140c79 = 512;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_f5f29f48bf54f95e = 0.86;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_e773207de29064c4 = 200;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_73849610029138d6 = 2500;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_e3462e8bcc2c2bbb = 7000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_91adc28ce868e001 = 8000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_d6c13152ac9aa81d = 1000;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_ee7e07bdbdae989b = 1250;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_f5d9e4cdce6fc2f9 = 200;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_f23d7d041b2acfb3 = 300;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_fa40aef304cab126 = 600;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_db66dd499f459cda = 50;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_dafbef1cc10672c0 = 100;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_97d83c01d694ebef = 200;
        var_b8c784bb7e525fcf.var_65411979a9f55a1c[0].var_4ddfc5d089928b41 = 300;
        function_6b4ab6c856a01415("component", var_b8c784bb7e525fcf, "ai_jailer_settings", "ai_jailer_settings_default_script");
    }
    if (1) {
        var_6d75cadebb718bde = spawnstruct();
        var_6d75cadebb718bde.var_51112681bd4d019b[0] = spawnstruct();
        var_62e48c98467466c = var_6d75cadebb718bde.var_51112681bd4d019b[0];
        var_62e48c98467466c.name = "default";
        var_62e48c98467466c.var_4b83a6c557f7c86f[0] = spawnstruct();
        obj = var_62e48c98467466c.var_4b83a6c557f7c86f[0];
        obj.name = "default";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "default";
        obj.var_1d868cc67f9dd5bb = "default";
        var_62e48c98467466c.var_4b83a6c557f7c86f[1] = spawnstruct();
        obj = var_62e48c98467466c.var_4b83a6c557f7c86f[1];
        obj.name = "panic";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "default";
        obj.var_1d868cc67f9dd5bb = "default";
        var_62e48c98467466c.var_4b83a6c557f7c86f[2] = spawnstruct();
        obj = var_62e48c98467466c.var_4b83a6c557f7c86f[2];
        obj.name = "civ_default";
        obj.var_bcc1548fdc16ad48 = "look_glance";
        obj.var_c749ad488c6d5e09 = "aim_default";
        obj.var_f834d1a05586efc = "default";
        obj.var_b7960a38a0297273 = "no_aim";
        obj.var_1d868cc67f9dd5bb = "default";
        var_62e48c98467466c.var_89df35098e4c90a2[0] = spawnstruct();
        obj = var_62e48c98467466c.var_89df35098e4c90a2[0];
        obj.name = "default";
        obj.var_22366064e4b2b3ff = -1;
        obj.var_22136e64e48c8b11 = -1;
        obj.var_d8306289a5a3547b = 1000;
        obj.var_d80d5889a57cf6c5 = 2000;
        obj.var_2c42dba8ffe8e4d6 = 1500;
        obj.var_2c65cda9000f0dc4 = 3000;
        obj.var_c89e2d1e53b941ee = 1000;
        obj.var_ecbe7a4cf4c2babe = 4000;
        obj.var_ae27a0f08d1cf26d = 1500;
        var_62e48c98467466c.var_89df35098e4c90a2[1] = spawnstruct();
        obj = var_62e48c98467466c.var_89df35098e4c90a2[1];
        obj.name = "no_aim";
        obj.var_666ecd86b0ae49e3 = "none";
        var_62e48c98467466c.var_c371c157a0ead74a[0] = spawnstruct();
        obj = var_62e48c98467466c.var_c371c157a0ead74a[0];
        obj.name = "default";
        obj.var_22366064e4b2b3ff = 1500;
        obj.var_22136e64e48c8b11 = 3000;
        obj.var_d8306289a5a3547b = 1000;
        obj.var_d80d5889a57cf6c5 = 2000;
        obj.var_2c42dba8ffe8e4d6 = 1500;
        obj.var_2c65cda9000f0dc4 = 3000;
        obj.var_c89e2d1e53b941ee = 500;
        obj.var_ecbe7a4cf4c2babe = 500;
        obj.var_ae27a0f08d1cf26d = 1500;
        var_62e48c98467466c.var_c371c157a0ead74a[1] = spawnstruct();
        obj = var_62e48c98467466c.var_c371c157a0ead74a[1];
        obj.name = "no_look";
        obj.var_666ecd86b0ae49e3 = "none";
        var_62e48c98467466c.var_fd50e6db62ce8cc5[0] = spawnstruct();
        obj = var_62e48c98467466c.var_fd50e6db62ce8cc5[0];
        obj.name = "look_glance";
        obj.var_666ecd86b0ae49e3 = "all";
        obj.var_1550743f6e9673a5 = 60;
        obj.var_15737e3f6ebcd15b = 90;
        obj.var_b0a66dd50dd2c471 = 10;
        obj.var_e16f134ab2dba426 = 60;
        obj.maxyaw = 90;
        obj.mindistance = 0;
        obj.maxdistance = 9999;
        var_62e48c98467466c.var_fd50e6db62ce8cc5[1] = spawnstruct();
        obj = var_62e48c98467466c.var_fd50e6db62ce8cc5[1];
        obj.name = "aim_default";
        obj.var_666ecd86b0ae49e3 = "all";
        obj.var_1550743f6e9673a5 = 0;
        obj.var_15737e3f6ebcd15b = 90;
        obj.var_b0a66dd50dd2c471 = 10;
        obj.var_e16f134ab2dba426 = 60;
        obj.maxyaw = 90;
        obj.mindistance = 0;
        obj.maxdistance = 9999;
        var_62e48c98467466c.var_726cbdb5ce313d64[0] = spawnstruct();
        var_5633f53fdfce6e15 = var_62e48c98467466c.var_726cbdb5ce313d64[0];
        var_5633f53fdfce6e15.name = "default";
        var_5633f53fdfce6e15.var_40d773ffebb9d944[0] = spawnstruct();
        var_5633f23fdfce677c = var_5633f53fdfce6e15.var_40d773ffebb9d944[0];
        var_5633f23fdfce677c.sources = "all";
        var_5633f23fdfce677c.mindistance = 0;
        var_5633f23fdfce677c.maxdistance = 512;
        var_5633f23fdfce677c.minangle = -90;
        var_5633f23fdfce677c.maxangle = 90;
        var_5633f23fdfce677c.var_3821d46c3a4c58af = "default";
        var_62e48c98467466c.var_2c9fecf790dd3de3[0] = spawnstruct();
        obj = var_62e48c98467466c.var_2c9fecf790dd3de3[0];
        obj.name = "default";
        obj.var_85713fb87e308a83 = 0;
        obj.var_d628c443c1ece758 = 700;
        obj.var_d64bda43c2135f72 = 1400;
        obj.var_a4ab7e2116dad865 = 2000;
        obj.var_a4cf88211703691b = 3000;
        obj.timeout = 5000;
        obj.priority = "background";
        function_6b4ab6c856a01415("component", var_6d75cadebb718bde, "ai_focus_behaviors", "ai_focus_behaviors_default_script");
    }
}

