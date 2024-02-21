// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_19c169a442d5975a;

#namespace namespace_437eaaae9f85f287;

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1d2
// Size: 0x19
function autoexec main() {
    level callback::add(#"hash_a8a01ea46bdd14d5", &function_4a702f9483c24663);
}

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2
// Size: 0x6c
function function_4a702f9483c24663(params) {
    bundle = level.var_a1ad2758fcbd2f5e["specialty_zombie_vision"];
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(params.var_65863a18b3d1ad87)) {
        level [[ params.var_65863a18b3d1ad87 ]]("specialty_zombie_vision", &function_3c74efe69198fbba, &function_6150aca67b81215f, [0:"specialty_tracker", 1:"specialty_sixth_sense"]);
    }
}

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x83
function function_3c74efe69198fbba() {
    self notify("zombie_vision_set");
    utility::function_f3bb4f4911a1beb2("battlerage", "suspendVisionSets");
    if (!istrue(self.var_44f34fe52ca32c0d)) {
        self.var_44f34fe52ca32c0d = 1;
        var_f0435c9deed2849d = isdefined(level.var_e131c739741e7b1f) ? level.var_e131c739741e7b1f : "hms_test_zombie";
        namespace_6c72573a48881070::function_27a921508cb04613(var_f0435c9deed2849d, 1);
    }
    self setscriptablepartstate("zombie", "zombie_vision");
    thread perk_think();
}

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0xb7
function function_6150aca67b81215f() {
    self notify("zombie_vision_unset");
    thread function_d0b2cdacbf5418ed();
    self setscriptablepartstate("zombie", "off");
    foreach (mark in self.var_806e4d4a1f287dd9) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](mark.outlineid, mark.ent);
        }
    }
    self.var_806e4d4a1f287dd9 = undefined;
}

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0x295
function perk_think() {
    self endon("zombie_vision_unset");
    self endon("death_or_disconnect");
    level endon("game_ended");
    bundle = level.var_a1ad2758fcbd2f5e["specialty_zombie_vision"];
    var_64051444a5c64bad = bundle.var_812d55e834ab0f19;
    var_59c3f51d1e895d18 = bundle.var_366e46ab53f445e8;
    self.var_806e4d4a1f287dd9 = [];
    /#
        /#
            assertex(issharedfuncdefined("<unknown string>", "<unknown string>"), "<unknown string>");
        #/
    #/
    /#
        /#
            assertex(issharedfuncdefined("<unknown string>", "<unknown string>"), "<unknown string>");
        #/
    #/
    while (1) {
        var_2de2822aa802a559 = function_143526130b12b2b6(self.origin, var_64051444a5c64bad);
        foreach (ent in var_2de2822aa802a559) {
            id = ent getentitynumber();
            if (isdefined(self.var_806e4d4a1f287dd9[id])) {
                self.var_806e4d4a1f287dd9[id].var_7ca5b6a6e229b54 = gettime();
            } else {
                var_307a5b9ab1d9c42e = ent.team == self.team ? "jup_zombie_vision_friendly" : "jup_zombie_vision_enemy";
                self.var_806e4d4a1f287dd9[id] = spawnstruct();
                self.var_806e4d4a1f287dd9[id].ent = ent;
                self.var_806e4d4a1f287dd9[id].outlineid = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](ent, self, var_307a5b9ab1d9c42e, "level_script");
                self.var_806e4d4a1f287dd9[id].var_7ca5b6a6e229b54 = gettime();
            }
        }
        foreach (index, mark in self.var_806e4d4a1f287dd9) {
            if (mark.var_7ca5b6a6e229b54 < gettime() - var_59c3f51d1e895d18) {
                [[ getsharedfunc("outline", "outlineDisable") ]](mark.outlineid, mark.ent);
                self.var_806e4d4a1f287dd9[index] = undefined;
            }
        }
        wait(0.25);
    }
}

// Namespace namespace_437eaaae9f85f287/namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649
// Size: 0x68
function function_d0b2cdacbf5418ed() {
    self endon("zombie_vision_set");
    self endon("death_or_disconnect");
    wait(1);
    utility::function_f3bb4f4911a1beb2("battlerage", "resumeVisionSets");
    self.var_44f34fe52ca32c0d = undefined;
    var_f0435c9deed2849d = isdefined(level.var_e131c739741e7b1f) ? level.var_e131c739741e7b1f : "hms_test_zombie";
    namespace_6c72573a48881070::function_9a92ae402e209ecc(var_f0435c9deed2849d, 1);
}

