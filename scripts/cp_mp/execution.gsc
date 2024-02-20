// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_6775ad452d13858;

#namespace execution;

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2
// Size: 0x37
function function_1ea3e44fd8a18d1() {
    if (!isdefined(self)) {
        return 0;
    }
    if (isbot(self) && getdvarint(@"hash_eb038ca43332e718", 0) == 0) {
        return 0;
    }
    if (istestclient(self)) {
        return 0;
    }
    return 1;
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x301
// Size: 0x170
function _giveexecution(ref, isfirstperson) {
    if (!function_1ea3e44fd8a18d1()) {
        return;
    }
    thread function_e3eeff0e08c5bcd4();
    if (function_3b6961b424a382f()) {
        var_25a38dfaf37fc298 = tolower(getdvar(@"hash_88ba4ca6e5ff9d5a", ""));
        if (isdefined(level.execution.table[var_25a38dfaf37fc298])) {
            ref = var_25a38dfaf37fc298;
        }
    }
    _clearexecution(istrue(isfirstperson));
    propweapon = execution_getpropweaponbyref(ref);
    if (ref == "execution_062" && self.operatorcustomization.operatorref == "inarius_western") {
        propweapon = level.execution.table[ref].var_d0b793bc71140446;
    }
    execution = execution_getexecutionbyref(ref);
    /#
        /#
            assertex(isdefined(execution), "execution_victim" + ref);
        #/
    #/
    if (!isdefined(execution)) {
        return;
    }
    if (isdefined(propweapon)) {
        self giveweapon(propweapon);
        self giveexecution(execution, propweapon, istrue(isfirstperson));
    } else {
        self giveexecution(execution, undefined, istrue(isfirstperson));
    }
    if (istrue(function_700277400dcb7857(ref))) {
        function_43a90e553f84c31c();
    }
    self.executionref = ref;
    if (issharedfuncdefined("game", "lpcFeatureGated") && ![[ getsharedfunc("game", "lpcFeatureGated") ]]()) {
        thread watchinexecution();
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x478
// Size: 0x94
function _clearexecution(isfirstperson) {
    if (isdefined(self.executionref)) {
        self clearexecution(istrue(isfirstperson));
        propweapon = execution_getpropweaponbyref(self.executionref);
        if (self.executionref == "execution_062" && self.operatorcustomization.operatorref == "inarius_western") {
            propweapon = "iw9_execution_spear_wings";
        }
        if (isdefined(propweapon) && self hasweapon(propweapon)) {
            self takeweapon(propweapon);
        }
        self.executionref = undefined;
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513
// Size: 0xd
function hasexecution() {
    return isdefined(self.executionref);
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x528
// Size: 0xc8
function function_e3eeff0e08c5bcd4() {
    self notify("exec_monitor_request");
    self endon("exec_monitor_request");
    while (1) {
        var_3b77b9fd262214be = self waittill("execution_begin");
        if (isdefined(self.executionref) && isdefined(self.suit)) {
            var_6fab8d17004374f6 = "mus_" + self.suit + "_" + self.executionref;
            if (soundexists(var_6fab8d17004374f6)) {
                self playlocalsound(var_6fab8d17004374f6);
                var_3b77b9fd262214be playlocalsound(var_6fab8d17004374f6);
            }
        }
        if (isdefined(var_3b77b9fd262214be)) {
            if (isdefined(var_3b77b9fd262214be.basearchetype) && var_3b77b9fd262214be.basearchetype == "zombie_base") {
                var_3b77b9fd262214be setentitysoundcontext("gender", "zombie");
            }
        }
        wait(2);
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f7
// Size: 0x8f
function execution_init() {
    /#
        assertex(!isdefined(level.execution), "execution_init was called more than once.");
    #/
    level.execution = spawnstruct();
    level.enableexecutionattackfunc = &enableexecutionattackwrapper;
    level.disableexecutionattackfunc = &disableexecutionattackwrapper;
    level.enableexecutionvictimfunc = &enableexecutionvictimwrapper;
    level.disableexecutionvictimfunc = &disableexecutionvictimwrapper;
    execution_loadtable();
    if (issharedfuncdefined("execution", "init")) {
        [[ getsharedfunc("execution", "init") ]]();
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68d
// Size: 0xa
function enableexecutionattackwrapper() {
    self enableexecutionattack();
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69e
// Size: 0xa
function disableexecutionattackwrapper() {
    self disableexecutionattack();
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af
// Size: 0xa
function enableexecutionvictimwrapper() {
    self enableexecutionvictim();
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c0
// Size: 0xa
function disableexecutionvictimwrapper() {
    self disableexecutionvictim();
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d1
// Size: 0x1a8
function execution_loadtable() {
    level.execution.table = [];
    foreach (executionref in namespace_465d40bb08a5337a::function_232a4826a2bd2bfd()) {
        struct = spawnstruct();
        struct.ref = executionref;
        id = namespace_465d40bb08a5337a::function_3daf6bb451cf826e(executionref);
        /#
            assertex(isdefined(id), "Executions error -  "" + executionref + "" has no id.");
        #/
        struct.id = int(id);
        execution = namespace_465d40bb08a5337a::function_75322d3c8f9c9ccb(executionref);
        /#
            assertex(isdefined(execution) && execution != "", "Executions error -  "" + executionref + "" has no execution.");
        #/
        if (execution != "none") {
            struct.execution = execution;
        }
        propweapon = namespace_465d40bb08a5337a::function_3bd82b573b8f64f3(executionref);
        /#
            assertex(isdefined(propweapon) && propweapon != "", "Executions error -  "" + executionref + "" has no prop weapon.");
        #/
        if (propweapon != "none") {
            struct.propweapon = makeweapon(propweapon);
            if (execution == "execution_062") {
                struct.var_d0b793bc71140446 = "iw9_execution_spear_wings";
            }
            jumpiffalse(isnullweapon(struct.propweapon)) LOC_0000017c;
        } else {
        LOC_0000017c:
            level.execution.table[executionref] = struct;
        }
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880
// Size: 0x56
function execution_getexecutionbyref(ref) {
    /#
        assertex(isdefined(level.execution), "execution_getExecutionByRef called before execution_init.");
    #/
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.execution;
    }
    return undefined;
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de
// Size: 0x56
function execution_getpropweaponbyref(ref) {
    /#
        assertex(isdefined(level.execution), "execution_getPropWeaponByRef called before execution_init.");
    #/
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.propweapon;
    }
    return undefined;
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x17
function execution_getrefbyplayer(player) {
    return player.executionref;
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x55
function execution_getidbyref(ref) {
    /#
        assertex(isdefined(level.execution), "execution_getIDByRef called before execution_init.");
    #/
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return struct.id;
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0x5d
function function_700277400dcb7857(ref) {
    /#
        assertex(isdefined(level.execution), "execution_getIDByRef called before execution_init.");
    #/
    if (!isdefined(ref)) {
        return 0;
    }
    struct = level.execution.table[ref];
    if (isdefined(struct)) {
        return istrue(struct.var_c5af638225c7ddef);
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1b
// Size: 0x16
function function_43a90e553f84c31c() {
    namespace_1cd9f6896754adb0::set("pet_execution", "hide_operator_backpack", 1);
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0x6e
function execution_blockladders() {
    if (self isonladder()) {
        if (!istrue(self.ladderexecutionblocked)) {
            val::set("ladderExecution", "execution_attack", 0);
            val::set("ladderExecution", "execution_victim", 0);
            self.ladderexecutionblocked = 1;
        }
    } else if (istrue(self.ladderexecutionblocked)) {
        val::function_c9d0b43701bdba00("ladderExecution");
        self.ladderexecutionblocked = undefined;
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaad
// Size: 0x83
function watchinexecution() {
    self endon("disconnect");
    self notify("watchInExecution");
    self endon("watchInExecution");
    var_a9ee87cc06bd6b39 = 0;
    while (1) {
        var_350e6177ac9228d0 = self isinexecutionattack() || self isinexecutionvictim();
        if (var_350e6177ac9228d0 != var_a9ee87cc06bd6b39 && !namespace_448ccf1ca136fbbe::isusingremote()) {
            if (var_350e6177ac9228d0) {
                self enablephysicaldepthoffieldscripting();
                self setphysicaldepthoffield(2.5, 60, 20, 20);
            } else {
                self disablephysicaldepthoffieldscripting();
            }
        }
        var_a9ee87cc06bd6b39 = var_350e6177ac9228d0;
        waitframe();
    }
}

// Namespace execution/namespace_f446f6030ca8cff8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x13
function is_in_takedown() {
    return self isinexecutionvictim() || self isinexecutionattack();
}

