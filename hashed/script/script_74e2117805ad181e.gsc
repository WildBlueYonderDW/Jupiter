// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_19c169a442d5975a;

#namespace zombievision;

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1d2
// Size: 0x19
function autoexec main() {
    level callback::add(#"register_perk", &perk_register);
}

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2
// Size: 0x6c
function perk_register(params) {
    bundle = level.perkbundles["specialty_zombie_vision"];
    if (!isdefined(bundle)) {
        return;
    }
    if (isdefined(params.var_65863a18b3d1ad87)) {
        level [[ params.var_65863a18b3d1ad87 ]]("specialty_zombie_vision", &perk_set, &perk_unset, ["specialty_tracker", "specialty_sixth_sense"]);
    }
}

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x83
function perk_set() {
    self notify("zombie_vision_set");
    utility::function_f3bb4f4911a1beb2("battlerage", "suspendVisionSets");
    if (!istrue(self.var_44f34fe52ca32c0d)) {
        self.var_44f34fe52ca32c0d = 1;
        zombievisionset = isdefined(level.var_e131c739741e7b1f) ? level.var_e131c739741e7b1f : "hms_test_zombie";
        namespace_6c72573a48881070::function_27a921508cb04613(zombievisionset, 1);
    }
    self setscriptablepartstate("zombie", "zombie_vision");
    thread perk_think();
}

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0xb7
function perk_unset() {
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

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ad
// Size: 0x295
function perk_think() {
    self endon("zombie_vision_unset");
    self endon("death_or_disconnect");
    level endon("game_ended");
    bundle = level.perkbundles["specialty_zombie_vision"];
    detectionrange = bundle.var_812d55e834ab0f19;
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
    while (true) {
        entsinrange = function_143526130b12b2b6(self.origin, detectionrange);
        foreach (ent in entsinrange) {
            id = ent getentitynumber();
            if (isdefined(self.var_806e4d4a1f287dd9[id])) {
                self.var_806e4d4a1f287dd9[id].lastupdate = gettime();
                continue;
            }
            var_307a5b9ab1d9c42e = ent.team == self.team ? "jup_zombie_vision_friendly" : "jup_zombie_vision_enemy";
            self.var_806e4d4a1f287dd9[id] = spawnstruct();
            self.var_806e4d4a1f287dd9[id].ent = ent;
            self.var_806e4d4a1f287dd9[id].outlineid = [[ getsharedfunc("outline", "outlineEnableForPlayer") ]](ent, self, var_307a5b9ab1d9c42e, "level_script");
            self.var_806e4d4a1f287dd9[id].lastupdate = gettime();
        }
        foreach (index, mark in self.var_806e4d4a1f287dd9) {
            if (mark.lastupdate < gettime() - var_59c3f51d1e895d18) {
                [[ getsharedfunc("outline", "outlineDisable") ]](mark.outlineid, mark.ent);
                self.var_806e4d4a1f287dd9[index] = undefined;
            }
        }
        wait(0.25);
    }
}

// Namespace zombievision / namespace_d38eb6855979bbcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649
// Size: 0x68
function function_d0b2cdacbf5418ed() {
    self endon("zombie_vision_set");
    self endon("death_or_disconnect");
    wait(1);
    utility::function_f3bb4f4911a1beb2("battlerage", "resumeVisionSets");
    self.var_44f34fe52ca32c0d = undefined;
    zombievisionset = isdefined(level.var_e131c739741e7b1f) ? level.var_e131c739741e7b1f : "hms_test_zombie";
    namespace_6c72573a48881070::function_9a92ae402e209ecc(zombievisionset, 1);
}

