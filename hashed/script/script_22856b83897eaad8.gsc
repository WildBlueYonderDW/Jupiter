// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_6a5d3bf7a5b7064a;
#using script_38eb8f4be20d54f4;
#using script_7c40fa80892a721;

#namespace ob_armor;

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112
// Size: 0x41
function function_876c219bf2b0fbd7() {
    level.var_e8f60267621fda8d = &function_c71dfd42d05c80b1;
    level.var_49bf61396483bae7 = &function_1260ae7112d01f9c;
    registersharedfunc("ob_armor", "set_golden_armor", &set_golden_armor);
    /#
        level thread function_e54948c0841f1fd5();
    #/
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a
// Size: 0x1d
function set_golden_armor() {
    self.var_28c033c3c5b37f1f = 1;
    thread function_fdb99149ef6e3583();
    namespace_f8d3520d3483c1::setarmoromnvars();
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x14
function function_ed2a0bbe317941f6() {
    self.var_28c033c3c5b37f1f = undefined;
    namespace_f8d3520d3483c1::setarmoromnvars();
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0xb2
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
            if (self.armorhealth < self.var_8790c077c95db752) {
                var_1df09d4f31ef52f1 = function_ac266fc218266d08();
                var_1df09d4f31ef52f1 = var_1df09d4f31ef52f1 + int(self.var_8790c077c95db752 / 3);
                setarmorhealth(var_1df09d4f31ef52f1);
                self function_c664a2459d6f3eaa("sndevent_golden_armor_restore");
            }
        }
        wait(1);
    }
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252
// Size: 0x52
function function_c71dfd42d05c80b1(damage, eattacker, smeansofdeath) {
    self.var_740c24af54388791 = 4;
    if (isplayer(self)) {
        return damage;
    } else if (isdefined(self.armorhealth)) {
        return min(self.armorhealth, damage);
    }
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab
// Size: 0xba
function function_1260ae7112d01f9c(damage, eattacker, smeansofdeath) {
    if (istrue(self.var_28c033c3c5b37f1f) && isdefined(smeansofdeath)) {
        if (smeansofdeath == "MOD_EXPLOSIVE") {
            damage = damage * 0.5;
        } else if (smeansofdeath == "MOD_FIRE") {
            damage = damage * 0.5;
        } else if (smeansofdeath == "MOD_RADIATION") {
            damage = damage * 0.5;
        }
    }
    aitype = "none";
    if (isdefined(eattacker) && isdefined(eattacker.type)) {
        aitype = eattacker.type;
    }
    if (isdefined(aitype) && aitype == "zombie") {
        damage = damage * 0.5;
    }
    return damage;
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36d
// Size: 0x74
function function_e54948c0841f1fd5() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_b24d8b90edce1cf8, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_b24d8b90edce1cf8, 0);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_b24d8b90edce1cf8, 0);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_1e66cdd3c32a9cd9);
        function_fe953f000498048f();
    #/
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e8
// Size: 0x5b
function function_1e66cdd3c32a9cd9() {
    /#
        foreach (player in level.players) {
            player set_golden_armor();
        }
    #/
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44a
// Size: 0x78
function function_b24d8b90edce1cf8(params) {
    /#
        var_8b18ae60e8ff603d = int(params[0]);
        foreach (player in level.players) {
            player function_f9dabaa1b39d496c(var_8b18ae60e8ff603d);
        }
    #/
}

// Namespace ob_armor/namespace_c7a286c0a621f184
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4c9
// Size: 0x3f
function function_f9dabaa1b39d496c(var_bed158a6dfac230d) {
    /#
        self.var_bed158a6dfac230d = var_bed158a6dfac230d;
        self.var_8790c077c95db752 = var_bed158a6dfac230d * level.var_4b78859bacc88808;
        setarmorhealth(var_bed158a6dfac230d * level.var_4b78859bacc88808);
    #/
}

