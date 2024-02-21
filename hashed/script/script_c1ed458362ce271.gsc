// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\common\ai.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_371b4c2ab5861e62;
#using script_7edf952f8921aa6b;
#using scripts\mp\weapons.gsc;
#using script_2669878cf5a1b6bc;

#namespace aether_blade;

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x392
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"aether_blade", undefined, undefined, &post_main);
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3b3
// Size: 0x88
function private post_main() {
    utility::registersharedfunc("aether_blade", "on_grenade_used", &function_cf74876710a7b4db);
    level._effect["aether_blade_trail"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_dark_aether_blade_trail.vfx");
    level._effect["aether_blade_impact"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_dark_aether_blade_impact.vfx");
    level._effect["aether_blade_ambient"] = loadfx("vfx/jup/ob/gameplay/zm_weapons/vfx_dark_aether_blade_ambient.vfx");
    function_b5e57408c7878df7(&function_22b8784cdb8fd331);
    function_9a024cd909d6e0a3(&function_22b8784cdb8fd331);
    level thread function_a8702248c4c1759f();
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442
// Size: 0x8b
function function_a8702248c4c1759f() {
    level endon("game_ended");
    while (1) {
        if (!isdefined(level.equipment) || !isdefined(level.equipment.callbacks)) {
            wait(5);
        } else {
            break;
        }
    }
    level.equipment.callbacks["equip_aether_blade"]["onGive"] = &function_a68e5603c7546cba;
    level.equipment.callbacks["equip_aether_blade"]["onTake"] = &function_e108b8d3ebf02f60;
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4
// Size: 0x62
function function_a68e5603c7546cba(equipmentref, var_cbb2b3d05e48bd27, variantid) {
    if (_hasperk("specialty_equip_throwingKnife")) {
        namespace_3bbb5a98b932c46f::function_ec132c173d4532ee("specialty_equip_throwingKnife");
    }
    self.throwingknifemelee = namespace_e0ee43ef2dddadaa::buildweapon_blueprint("iw9_knifestab_mp", "none", "none", 3);
    namespace_3bbb5a98b932c46f::function_dd1698252c31d637("specialty_equip_throwingKnife");
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53d
// Size: 0x38
function function_e108b8d3ebf02f60(equipmentref, var_cbb2b3d05e48bd27) {
    if (_hasperk("specialty_equip_throwingKnife")) {
        namespace_3bbb5a98b932c46f::function_ec132c173d4532ee("specialty_equip_throwingKnife");
    }
    self.throwingknifemelee = undefined;
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57c
// Size: 0x158
function private function_cf74876710a7b4db(grenade) {
    grenade endon("death");
    if (0) {
        grenade waittill("missile_stuck");
    } else {
        grenade waittill_notify_or_timeout("missile_stuck", 0.2);
    }
    self radiusdamage(grenade.origin, 10, 10, 10, self, "MOD_UNKNOWN", grenade.weapon_name);
    grenade hide();
    grenade function_ad9433aab9fcdf04(3, "death", &delete);
    var_dc9f68978ae89177 = spawn("script_model", grenade.origin);
    var_dc9f68978ae89177 setmodel("jup_2h_zmb_aether_knife");
    var_dc9f68978ae89177 show();
    var_dc9f68978ae89177.owner = self;
    var_dc9f68978ae89177.equipmentref = grenade.equipmentref;
    var_dc9f68978ae89177.weaponobj = grenade.weapon_object;
    var_dc9f68978ae89177 thread function_4c4fcfe9c8aa6aa8();
    fx = playfxontag(level._effect["aether_blade_trail"], var_dc9f68978ae89177, "tag_origin");
    var_a3a92835467a1be8 = playfxontag(level._effect["aether_blade_ambient"], var_dc9f68978ae89177, "tag_origin");
    var_dc9f68978ae89177 playloopsound("eqp_aether_blade_travel_lp");
    var_dc9f68978ae89177 thread function_24766c1e016e99e7(3, undefined, self.team);
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6db
// Size: 0x32
function private function_4c4fcfe9c8aa6aa8() {
    self endon("death");
    while (1) {
        self rotatepitch(self.angles[0] + 180, 0.25);
        wait(0.25);
    }
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x714
// Size: 0xa6
function private function_a089a977a3191071(is_melee) {
    var_fcb93b17ba232596 = 0;
    max_health = ter_op(isdefined(self.maxhealth), self.maxhealth, 100);
    if (ai::function_f6347c9c410226d3()) {
        if (isdefined(self.aicategory) && self.aicategory == "boss") {
            var_fcb93b17ba232596 = ter_op(is_melee, 0.01, 0.05);
        } else {
            var_fcb93b17ba232596 = ter_op(is_melee, 0.05, 0.1);
        }
    } else {
        var_fcb93b17ba232596 = ter_op(is_melee, 0.5, 1);
    }
    return max_health * var_fcb93b17ba232596;
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c2
// Size: 0x19f
function private function_24766c1e016e99e7(var_d57df9820eae8cf, last_target, player_team) {
    if (var_d57df9820eae8cf == 0) {
        thread function_9e47843c258164df();
        return;
    }
    var_88f52a15dfb77ad2 = getaiarrayinradius(self.origin, 300);
    var_4e83f2f535a21158 = [];
    foreach (ai in var_88f52a15dfb77ad2) {
        if (is_equal(ai.team, player_team) || isdefined(last_target) && ai == last_target) {
            continue;
        }
        var_4e83f2f535a21158 = array_add(var_4e83f2f535a21158, ai);
    }
    var_4e83f2f535a21158 = sortbydistance(var_4e83f2f535a21158, self.origin);
    var_ff9783cd193659bd = var_4e83f2f535a21158[0];
    if (isdefined(var_ff9783cd193659bd)) {
        end_point = function_549b33edb429d231(var_ff9783cd193659bd);
        var_9f36d6c51e1acc54 = distance(self.origin, end_point);
        self moveto(end_point, var_9f36d6c51e1acc54 / 1500);
        self waittill("movedone");
        playfxontag(level._effect["aether_blade_impact"], self, "tag_origin");
        var_ff9783cd193659bd dodamage(var_ff9783cd193659bd function_a089a977a3191071(0), self.origin, self.owner, self, "MOD_ELEMENTAL_ELEC", self.weaponobj, "none");
    } else {
        thread function_9e47843c258164df();
        return;
    }
    thread function_24766c1e016e99e7(var_d57df9820eae8cf - 1, var_ff9783cd193659bd, player_team);
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x968
// Size: 0xbf
function private function_9e47843c258164df() {
    end_point = function_45040fcdfcd2c447();
    if (!isdefined(end_point)) {
        self delete();
    }
    var_9f36d6c51e1acc54 = distance(self.origin, end_point);
    var_d214566710738392 = var_9f36d6c51e1acc54 / 1500;
    self moveto(end_point, var_d214566710738392);
    thread function_772ad3dc1621c404(var_d214566710738392);
    self waittill("movedone");
    if (isdefined(self.owner)) {
        self.owner playsoundtoplayer("eqp_aether_blade_plr_return", self.owner);
        self.owner function_2f62cf4de7c24634();
        self.owner thread function_faa63a4f3bcf6d02(self.equipmentref);
    }
    self delete();
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa2e
// Size: 0x1c
function private function_2f62cf4de7c24634() {
    utility::function_3677f2be30fdd581("aether_blade_fx", "on");
    thread function_4301f1a5fdb9c675();
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa51
// Size: 0x31
function private function_4301f1a5fdb9c675() {
    msg = waittill_any_timeout_1(1, "death");
    if (isdefined(self)) {
        utility::function_3677f2be30fdd581("aether_blade_fx", "off");
    }
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa89
// Size: 0x7c
function private function_772ad3dc1621c404(var_d214566710738392) {
    self endon("death");
    self endon("movedone");
    frame_duration = utility::function_53c4c53197386572(level.framedurationseconds, 0.05);
    var_5d3e12763f61bd3e = var_d214566710738392 - frame_duration;
    while (var_5d3e12763f61bd3e > 0) {
        waitframe();
        end_point = function_45040fcdfcd2c447();
        if (!isdefined(end_point)) {
            self delete();
        }
        self moveto(end_point, var_5d3e12763f61bd3e);
        var_5d3e12763f61bd3e = var_5d3e12763f61bd3e - frame_duration;
    }
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0c
// Size: 0x50
function private function_45040fcdfcd2c447() {
    if (!isalive(self.owner)) {
        return undefined;
    } else {
        var_dace4b70df8d5f18 = self.owner gettagorigin("j_spine4");
        var_dace4b70df8d5f18 = utility::function_53c4c53197386572(var_dace4b70df8d5f18, self.owner getcentroid());
        return var_dace4b70df8d5f18;
    }
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb63
// Size: 0x6c
function private function_1d982537b9dcb924(player) {
    if (!isplayer(player)) {
        return 0;
    }
    if (issharedfuncdefined("game", "isCommonItemEnabled")) {
        if (!function_f3bb4f4911a1beb2("game", "isCommonItemEnabled")) {
            return 0;
        }
        if (!(issharedfuncdefined("game", "obtainItemEquip") && issharedfuncdefined("game", "getItemBundleNameFromRef"))) {
            return 0;
        }
        return 1;
    }
    return 0;
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbd7
// Size: 0xb7
function private function_d87312a81b75742d(equipmentref) {
    if (!isdefined(equipmentref) || !isalive(self)) {
        return;
    }
    if (function_1d982537b9dcb924(self)) {
        var_fbe755f0978c0369 = function_f3bb4f4911a1beb2("game", "getItemBundleNameFromRef", equipmentref);
        if (!isdefined(var_fbe755f0978c0369)) {
            return;
        }
        itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
        var_636981592f381ebf = spawnstruct();
        var_636981592f381ebf.count = 1;
        var_636981592f381ebf.type = itembundle.scriptable;
        self playsoundtoplayer("eqp_aether_blade_plr_cooldown_end", self);
        function_f3bb4f4911a1beb2("game", "obtainItemEquip", var_636981592f381ebf, 0, 1);
    }
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc95
// Size: 0x37
function private function_549b33edb429d231(ai_target) {
    end_point = ai_target gettagorigin("J_SpineUpper", 1);
    if (!isdefined(end_point)) {
        end_point = ai_target.origin;
    }
    return end_point;
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x31
function private function_faa63a4f3bcf6d02(equipmentref) {
    self endon("death");
    wait(3);
    while (istrue(self.isjuggernaut)) {
        wait(1);
    }
    function_d87312a81b75742d(equipmentref);
}

// Namespace aether_blade/namespace_4b52342bc49793b3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd0c
// Size: 0x8f
function private function_22b8784cdb8fd331(params) {
    if (isplayer(params.eattacker) && isdefined(params.objweapon) && params.objweapon.basename == "iw9_knifestab_mp" && isdefined(params.objweapon.variantid) && params.objweapon.variantid == 3) {
        return function_a089a977a3191071(1);
    }
    return -1;
}

