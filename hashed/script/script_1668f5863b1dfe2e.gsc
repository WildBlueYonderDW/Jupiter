// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;

#namespace namespace_2ee8541e6d1eae06;

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x18d
// Size: 0x19
function autoexec main() {
    registersharedfunc("super_launcher", "init", &function_ac4e5642f4a76765);
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad
// Size: 0x71
function function_ac4e5642f4a76765() {
    namespace_3c37cb17ade254d::registersharedfunc("super_launcher", "launcher_set", &function_cd7adfeda90090ea);
    namespace_3c37cb17ade254d::registersharedfunc("super_launcher", "launcher_unset", &function_ab826319b54a872f);
    namespace_3c37cb17ade254d::registersharedfunc("super_launcher", "launcher_begin_use", &function_b175b0e761ee083d);
    namespace_3c37cb17ade254d::registersharedfunc("super_launcher", "launcher_end_use", &function_9152d073564d3361);
    namespace_3c37cb17ade254d::registersharedfunc("super_launcher", "launcher_repeat", &function_c31358a51d2e2031);
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225
// Size: 0x154
function function_c31358a51d2e2031() {
    if (!issharedfuncdefined("supers", "setSuperIsActive") || !issharedfuncdefined("supers", "getCurrentSuper") || !issharedfuncdefined("supers", "tryGiveUseWeapon")) {
        return;
    }
    self [[ getsharedfunc("supers", "setSuperIsActive") ]](1);
    var_19163e14365d9264 = self [[ getsharedfunc("supers", "getCurrentSuper") ]]();
    clipammo = var_19163e14365d9264.staticdata.useweaponclipammo;
    stockammo = var_19163e14365d9264.staticdata.useweaponstockammo;
    if (isdefined(var_19163e14365d9264.var_3d2b63c4e181029d)) {
        clipammo = var_19163e14365d9264.var_3d2b63c4e181029d;
    }
    if (isdefined(var_19163e14365d9264.var_b9ef26fa33686273)) {
        stockammo = var_19163e14365d9264.var_b9ef26fa33686273;
    }
    result = [[ getsharedfunc("supers", "tryGiveUseWeapon") ]](var_19163e14365d9264.staticdata.useweapon, clipammo, stockammo);
    if (istrue(result)) {
        self [[ getsharedfunc("supers", "setSuperIsActive") ]](1);
    } else {
        self [[ getsharedfunc("supers", "setSuperIsActive") ]](0);
    }
    return result;
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381
// Size: 0x15
function function_b175b0e761ee083d() {
    function_7b092f96be9a26d9(0);
    thread function_51cf80cea7c30793();
    return 1;
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e
// Size: 0x15
function function_9152d073564d3361(var_fcef8d217a441961) {
    function_7b092f96be9a26d9(1);
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba
// Size: 0x11
function function_cd7adfeda90090ea() {
    self setclientomnvar("ui_block_fu_not_ready_error", 1);
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x24
function function_ab826319b54a872f() {
    self setclientomnvar("ui_block_fu_not_ready_error", 0);
    self.var_b24e609023ce8208 = undefined;
    self.var_98d31d9ce04b2b81 = undefined;
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd
// Size: 0x29
function function_7b092f96be9a26d9(b_value) {
    if (!isdefined(b_value)) {
        b_value = 0;
    }
    if (b_value) {
        self enableweaponpickup();
    } else {
        self disableweaponpickup();
    }
}

// Namespace namespace_2ee8541e6d1eae06/namespace_3bde511432bd1898
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d
// Size: 0x62
function function_51cf80cea7c30793() {
    self endon("death_or_disconnect");
    self endon("super_use_finish");
    self endon("end_super_select");
    if (!istrue(self.perkpackagedata.istwomode)) {
        return;
    }
    self waittill("weapon_change");
    self [[ getsharedfunc("supers", "setSuperIsActive") ]](0);
    self [[ getsharedfunc("supers", "setSuperIsInUse") ]](0);
}

