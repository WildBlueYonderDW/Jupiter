// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;

#namespace namespace_ab4bb52668162033;

// Namespace namespace_ab4bb52668162033 / namespace_3c98c19fa38eba9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x23
function function_96f220b689167b22() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_damaged", &function_ce8c7137ccfd571e);
}

// Namespace namespace_ab4bb52668162033 / namespace_3c98c19fa38eba9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a
// Size: 0xef
function function_ce8c7137ccfd571e(params) {
    if (params.smeansofdeath == "MOD_CRUSH" && isdefined(params.einflictor) && params.einflictor.classname == "script_vehicle") {
        forward_vec = anglestoforward(self.angles);
        if (vectordot(params.vpoint - self.origin, forward_vec) < 0) {
            return;
        }
        if (isdefined(self.var_bf971c68459203a3) && !time_has_passed(self.var_bf971c68459203a3, 5)) {
            return;
        }
        if (params.einflictor vehicle_getspeed() < 15) {
            return;
        }
        if (!istrue(self.var_3bf23e7f7a47ea2a)) {
            self.var_3bf23e7f7a47ea2a = 1;
            function_ac90fa5cc0a80298("vehicle_impact_pass_in");
        }
        thread function_f5e6c56d802dc975();
    }
}

// Namespace namespace_ab4bb52668162033 / namespace_3c98c19fa38eba9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210
// Size: 0x75
function function_f5e6c56d802dc975() {
    self notify("handle_vehicle_impact_anim_singleton");
    self endon("handle_vehicle_impact_anim_singleton");
    while (isalive(self)) {
        waittill_any_timeout_1(0.1, "death");
        if (!isdefined(self.var_64c4f7086b0c04f4) || time_has_passed(self.var_64c4f7086b0c04f4, 0.1)) {
            break;
        }
    }
    self.var_bf971c68459203a3 = gettime();
    if (isdefined(self)) {
        self.var_3bf23e7f7a47ea2a = undefined;
    }
}

// Namespace namespace_ab4bb52668162033 / namespace_3c98c19fa38eba9b
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x2e
function function_8bcd44e8a5b0f6ea(asmname, statename, tostatename, params) {
    return istrue(self.var_3bf23e7f7a47ea2a);
}

