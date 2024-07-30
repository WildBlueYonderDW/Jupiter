#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_7edf952f8921aa6b;
#using script_16ea1b94f0f381b3;

#namespace insta_kill;

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x181
// Size: 0x9
function autoexec main() {
    function_f9a50549e0b4a614();
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192
// Size: 0x61
function function_f9a50549e0b4a614() {
    register_powerup("insta_kill", &grab_insta_kill);
    function_b5e57408c7878df7(&function_bdbabfc99054986b);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x49>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x6a>", "<dev string:x87>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb
// Size: 0x7b
function grab_insta_kill(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player thread function_1eeed7712fef95ac();
    }
    level notify("zmb_insta_kill_level");
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e
// Size: 0x9c
function function_1eeed7712fef95ac() {
    self notify("powerup instakill_active");
    self endon("powerup instakill_active");
    ent_flag_set("powerup_insta_kill_active");
    root = function_ecdae672c660149e();
    n_lifetime = root.powerups["insta_kill"].var_f862e718db266e0a;
    if (isdefined(level.powerup_timeout_override)) {
        n_lifetime = self [[ level.powerup_timeout_override ]](n_lifetime);
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("insta_kill", n_lifetime);
    waittill_any_timeout_1(n_lifetime, "end_insta_kill");
    if (isdefined(self)) {
        ent_flag_clear("powerup_insta_kill_active");
    }
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x322
// Size: 0x6f
function function_bdbabfc99054986b(params) {
    if (isdefined(params.eattacker) && params.eattacker function_c88394be6941559a()) {
        return function_941a468f40ccf551(params.idamage, params.eattacker, params.smeansofdeath, params.shitloc, params.sweapon);
    }
    return -1;
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39a
// Size: 0x4a
function function_c88394be6941559a() {
    if (isplayer(self) && ent_flag("powerup_insta_kill_active")) {
        return true;
    }
    if (isplayer(self.owner) && self.owner ent_flag("powerup_insta_kill_active")) {
        return true;
    }
    return false;
}

// Namespace insta_kill / namespace_1c7bc099c74d5ecc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed
// Size: 0x18f
function function_941a468f40ccf551(idamage, eattacker, smeansofdeath, shitloc, sweapon) {
    if (istrue(level.headshots_only) && !("head" == shitloc || "helmet" == shitloc || "neck" == shitloc)) {
        return -1;
    }
    if (smeansofdeath == "MOD_GRENADE_SPLASH") {
        return -1;
    }
    if (isdefined(eattacker)) {
        damage = self.health;
        if (isdefined(self.aicategory)) {
            if (self.aicategory == "special") {
                damage = idamage * function_519d44e54a9b8ae5("insta_kill").var_8644a5332247a86d;
            } else if (self.aicategory == "elite") {
                damage = idamage * function_519d44e54a9b8ae5("insta_kill").var_153861ab87fea6ed;
            } else if (self.aicategory == "boss") {
                damage = idamage * function_519d44e54a9b8ae5("insta_kill").var_11f0257e902f772f;
            }
        }
        if (!istrue(self.takedamage)) {
            return -1;
        }
        if (isdefined(self.instakill_func)) {
            b_result = self [[ self.instakill_func ]](eattacker, smeansofdeath, shitloc);
            if (istrue(b_result)) {
                return -1;
            }
        }
        if (damage == self.health) {
            val::set("insta_kill", "kill_on_damage", 1);
            val::set("zm_allow_give_super_point", "allow_give_super_point", 0);
        }
        return damage;
    }
    return -1;
}

