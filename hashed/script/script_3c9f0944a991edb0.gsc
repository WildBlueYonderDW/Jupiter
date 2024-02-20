// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4b87f2871b6b025c;
#using script_1b4114093cd44368;

#namespace namespace_d875d52eb6581a5f;

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193
// Size: 0x74
function init() {
    namespace_3c37cb17ade254d::registersharedfunc("oxygenmask", "onUnusable", &function_afb7a317198d0688);
    namespace_3c37cb17ade254d::registersharedfunc("oxygenmask", "onEquip", &function_5320a46c0e139cb5);
    namespace_3c37cb17ade254d::registersharedfunc("oxygenmask", "onUse", &function_c6f7c3926e6e4522);
    namespace_3c37cb17ade254d::registersharedfunc("oxygenmask", "onUseComplete", &function_cad73059babfbe29);
    level.var_f6bad8618358a031.var_3d605bc71c5d48e3 = "iw9_oxygenmask_mp";
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20e
// Size: 0x7b
function function_afb7a317198d0688() {
    self endon("death_or_disconnect");
    msg = undefined;
    if (istrue(self function_635e39fc16a64657())) {
        msg = "MP/DISABLED_WHILE_SWIM_SPRINT";
    } else if (!istrue(self function_6f55d55ccff20d14())) {
        msg = "MP/DISABLED_WHILE_NOT_SWIMMING";
    }
    if (isdefined(msg) && function_a387d51c1bace19(msg)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]](msg);
            function_c3adccf5abf65331(msg);
        }
    }
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x44
function function_c3adccf5abf65331(var_5b67bcf1fffa8112) {
    var_19163e14365d9264 = self.super;
    if (!isdefined(var_19163e14365d9264)) {
        return;
    }
    var_19163e14365d9264.var_e8378b57e2e5177e = gettime();
    var_19163e14365d9264.var_65f670fb7cc70326 = var_5b67bcf1fffa8112;
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2db
// Size: 0x84
function function_a387d51c1bace19(var_b5bf99952e022dbe) {
    var_19163e14365d9264 = self.super;
    if (!isdefined(var_19163e14365d9264)) {
        return 0;
    }
    if (isdefined(var_19163e14365d9264.var_65f670fb7cc70326) && var_19163e14365d9264.var_65f670fb7cc70326 == var_b5bf99952e022dbe) {
        if (!isdefined(var_19163e14365d9264.var_e8378b57e2e5177e)) {
            return 1;
        } else if (gettime() > var_19163e14365d9264.var_e8378b57e2e5177e + 1500) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 1;
    }
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x366
// Size: 0xb
function function_5320a46c0e139cb5() {
    childthread function_824af6d3bd562a89();
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x85
function function_824af6d3bd562a89() {
    while (1) {
        self waittill("weapon_fired");
        currentweapon = self getcurrentweapon();
        if (isdefined(currentweapon.basename) && currentweapon.basename != level.var_f6bad8618358a031.var_3d605bc71c5d48e3) {
            return;
        }
        stockammo = self getweaponammostock(currentweapon);
        if (stockammo > 0) {
            self setweaponammoclip(currentweapon, 1);
            self setweaponammostock(currentweapon, stockammo - 1);
        }
    }
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x404
// Size: 0x3b
function function_c6f7c3926e6e4522() {
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(1);
    thread function_58611da8ae346833();
    thread function_5a7760580acb149c("death");
    thread function_5a7760580acb149c("weapon_change");
    thread function_5a7760580acb149c("offhand_pullback");
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446
// Size: 0x2f
function function_58611da8ae346833() {
    self endon("disconnect");
    level endon("game_ended");
    self endon("weapon_fired");
    self waittill("oxygenmask_fail");
    namespace_86d0d418da518a0e::function_9ac10cec8e7b9d40();
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(0);
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x34
function function_5a7760580acb149c(var_c7488bc8f0ef820) {
    self endon("disconnect");
    self endon("oxygenmask_fired");
    self endon("oxygenmask_fail");
    level endon("game_ended");
    self waittill(var_c7488bc8f0ef820);
    self notify("oxygenmask_fail");
}

// Namespace namespace_d875d52eb6581a5f/namespace_1919d42246c620fa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b7
// Size: 0xb
function function_cad73059babfbe29() {
    namespace_8ade6bdb04213c12::function_9368fff2b3156346(0);
}

