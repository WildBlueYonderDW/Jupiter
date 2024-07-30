#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\common\devgui.gsc;
#using script_7c40fa80892a721;

#namespace ob_armor;

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112
// Size: 0x40
function function_876c219bf2b0fbd7() {
    level.var_e8f60267621fda8d = &function_c71dfd42d05c80b1;
    level.var_49bf61396483bae7 = &function_1260ae7112d01f9c;
    registersharedfunc("ob_armor", "set_golden_armor", &set_golden_armor);
    /#
        level thread function_e54948c0841f1fd5();
    #/
}

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a
// Size: 0x1c
function set_golden_armor() {
    self.var_28c033c3c5b37f1f = 1;
    thread function_fdb99149ef6e3583();
    namespace_f8d3520d3483c1::setarmoromnvars();
}

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x13
function function_ed2a0bbe317941f6() {
    self.var_28c033c3c5b37f1f = undefined;
    namespace_f8d3520d3483c1::setarmoromnvars();
}

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0xb1
function function_fdb99149ef6e3583() {
    level endon("game_ended");
    self endon("death");
    self.var_740c24af54388791 = 0;
    while (istrue(self.var_28c033c3c5b37f1f)) {
        if (self.var_740c24af54388791 > 0) {
            self.var_740c24af54388791--;
        }
        if (self.var_740c24af54388791 <= 0) {
            self.var_740c24af54388791 = 4;
            if (self.armorhealth < self.maxarmorhealth) {
                var_1df09d4f31ef52f1 = function_ac266fc218266d08();
                var_1df09d4f31ef52f1 += int(self.maxarmorhealth / 3);
                setArmorHealth(var_1df09d4f31ef52f1);
                self playsoundevent("sndevent_golden_armor_restore");
            }
        }
        wait 1;
    }
}

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252
// Size: 0x51
function function_c71dfd42d05c80b1(damage, eattacker, smeansofdeath) {
    self.var_740c24af54388791 = 4;
    if (isplayer(self)) {
        return damage;
    }
    if (isdefined(self.armorhealth)) {
        return min(self.armorhealth, damage);
    }
}

// Namespace ob_armor / namespace_c7a286c0a621f184
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0xb9
function function_1260ae7112d01f9c(damage, eattacker, smeansofdeath) {
    if (istrue(self.var_28c033c3c5b37f1f) && isdefined(smeansofdeath)) {
        if (smeansofdeath == "MOD_EXPLOSIVE") {
            damage *= 0.5;
        } else if (smeansofdeath == "MOD_FIRE") {
            damage *= 0.5;
        } else if (smeansofdeath == "MOD_RADIATION") {
            damage *= 0.5;
        }
    }
    aitype = "none";
    if (isdefined(eattacker) && isdefined(eattacker.type)) {
        aitype = eattacker.type;
    }
    if (isdefined(aitype) && aitype == "zombie") {
        damage *= 0.5;
    }
    return damage;
}

/#

    // Namespace ob_armor / namespace_c7a286c0a621f184
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x36d
    // Size: 0x73
    function function_e54948c0841f1fd5() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x26>", "<dev string:x35>", &function_b24d8b90edce1cf8, 0);
        function_b23a59dfb4ca49a1("<dev string:x45>", "<dev string:x54>", &function_b24d8b90edce1cf8, 0);
        function_b23a59dfb4ca49a1("<dev string:x64>", "<dev string:x73>", &function_b24d8b90edce1cf8, 0);
        function_a9a864379a098ad6("<dev string:x83>", "<dev string:x95>", &function_1e66cdd3c32a9cd9);
        function_fe953f000498048f();
    }

    // Namespace ob_armor / namespace_c7a286c0a621f184
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3e8
    // Size: 0x5a
    function function_1e66cdd3c32a9cd9() {
        foreach (player in level.players) {
            player set_golden_armor();
        }
    }

    // Namespace ob_armor / namespace_c7a286c0a621f184
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x44a
    // Size: 0x77
    function function_b24d8b90edce1cf8(params) {
        armor_level = int(params[0]);
        foreach (player in level.players) {
            player function_f9dabaa1b39d496c(armor_level);
        }
    }

    // Namespace ob_armor / namespace_c7a286c0a621f184
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4c9
    // Size: 0x3e
    function function_f9dabaa1b39d496c(var_bed158a6dfac230d) {
        self.var_bed158a6dfac230d = var_bed158a6dfac230d;
        self.maxarmorhealth = var_bed158a6dfac230d * level.var_4b78859bacc88808;
        setArmorHealth(var_bed158a6dfac230d * level.var_4b78859bacc88808);
    }

#/
