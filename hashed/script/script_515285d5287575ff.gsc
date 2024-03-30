// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_371b4c2ab5861e62;
#using script_60dd6e3992c1f29;
#using script_22f1701e151b9d12;
#using script_2669878cf5a1b6bc;

#namespace namespace_c4032dde62b27b45;

// Namespace namespace_c4032dde62b27b45 / namespace_d7b9f3d899c5a909
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c
// Size: 0xa9
function function_6c78c4cdcb9d493() {
    if (isdefined(level.var_6d61d5fe48723aab)) {
        return;
    }
    level.var_6d61d5fe48723aab = 1;
    level thread function_272f7819479cfd8f();
    level.var_660d3f6e932dbe49 = "mimicproplist:jup_mimic_prop_list_default";
    function_2ad988fad3f5640a(1, &function_a0a440abb6e3a58c, &function_6a4f7e54f18ede06);
    if (!isdefined(level.var_f52f26854571caa1)) {
        aitypes = function_3290e192ac188e2d("zombie_mimic");
        level.var_f52f26854571caa1 = random(aitypes);
    }
    level callback::add("mimic_spawned", &function_8159c23277f3afe0);
    level callback::add("on_entity_hidden_in_prop", &function_385451540bf346eb);
    namespace_614554f86e52695c::function_e4a440552e4cf1f4(&function_746a157a8ec25790);
}

// Namespace namespace_c4032dde62b27b45 / namespace_d7b9f3d899c5a909
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x2b
function function_8159c23277f3afe0(params) {
    namespace_e0ee43ef2dddadaa::function_f30b8f5ee8f3e7f8("zombie_mimic", self.grenadeweapon.basename);
}

// Namespace namespace_c4032dde62b27b45 / namespace_d7b9f3d899c5a909
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x98
function function_6a4f7e54f18ede06(var_5af4453d13e66d3b) {
    if (var_5af4453d13e66d3b.interact function_df0afb02491cd0ef() || !var_5af4453d13e66d3b.interact isusableenabled() || !var_5af4453d13e66d3b.interact isusable()) {
        return false;
    }
    if (var_5af4453d13e66d3b.interact isscriptable() && var_5af4453d13e66d3b.interact getscriptablehaspart("base") && var_5af4453d13e66d3b.interact getscriptablepartstate("base") == "power_off") {
        return false;
    }
    return true;
}

// Namespace namespace_c4032dde62b27b45 / namespace_d7b9f3d899c5a909
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0x158
function function_746a157a8ec25790(zombie, requestid, data) {
    if (issubstr(zombie.subclass, "zombie_mimic")) {
        if (!istrue(data.alert) && istrue(data.ambient)) {
            var_96fbee94955db089 = function_3f1e49f4d09e7020(zombie.origin, 3000, 1, 1);
            valid_spawnpoints = [];
            prop_point = undefined;
            foreach (point in var_96fbee94955db089) {
                if (isdefined(point.script_noteworthy) && point.script_noteworthy == "ambient_mimic_spawn") {
                    valid_spawnpoints = array_add(valid_spawnpoints, point);
                }
            }
            if (isdefined(valid_spawnpoints.size) && valid_spawnpoints.size > 0) {
                random_index = randomint(valid_spawnpoints.size);
                prop_point = valid_spawnpoints[random_index];
            }
            if (isdefined(prop_point) && isdefined(prop_point.proplist)) {
                namespace_f35b248fe3d46dfb::function_7f3bb3916bbd189d([prop_point], zombie, undefined, prop_point.proplist);
            }
        }
    }
}

// Namespace namespace_c4032dde62b27b45 / namespace_d7b9f3d899c5a909
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d
// Size: 0xe4
function function_385451540bf346eb(params) {
    level endon("game_ended");
    self notify("despawn_clean_props_singleton");
    self endon("despawn_clean_props_singleton");
    var_86ca8e1c112dc232 = self.var_86ca8e1c112dc232;
    killer, meansofdeath = self waittill("death");
    if (!isdefined(meansofdeath) || meansofdeath != "MOD_DESPAWN") {
        return;
    }
    if (!isarray(var_86ca8e1c112dc232)) {
        return;
    }
    foreach (prop in var_86ca8e1c112dc232) {
        if (!isdefined(prop)) {
            continue;
        }
        if (isdefined(prop.var_a295306038aa1d4e)) {
            [[ prop.var_a295306038aa1d4e ]]();
        }
        level thread clean_up_prop(prop);
    }
}

