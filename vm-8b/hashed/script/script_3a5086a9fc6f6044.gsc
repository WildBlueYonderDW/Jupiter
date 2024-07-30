#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\lighting.gsc;

#namespace namespace_307ea521a979be65;

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd3
// Size: 0x11
function main() {
    thread lighting_setup_dvars();
    function_448f852a8710b8ea();
}

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec
// Size: 0x2
function lighting_setup_dvars() {
    
}

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6
// Size: 0x6e
function function_448f852a8710b8ea() {
    level.var_840b0efad7cd12bf = getentarray("light_crystal_obj", "targetname");
    foreach (var_827c2f92b949936 in level.var_840b0efad7cd12bf) {
        var_827c2f92b949936 function_88cd754a904f2c0a();
    }
}

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0x87
function function_bfd6485208f4b621(params) {
    if (istrue(level.var_4553a0f3520aab66)) {
        return;
    }
    level.var_4553a0f3520aab66 = 1;
    fade_time = 3;
    foreach (var_827c2f92b949936 in level.var_840b0efad7cd12bf) {
        var_827c2f92b949936 thread function_e05a4e827e4d647a(fade_time, 0);
    }
}

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1fb
// Size: 0x22
function private function_e05a4e827e4d647a(time, endintensity) {
    if (!isdefined(self)) {
        return;
    }
    function_70a9f70afd49dead(time, endintensity);
}

// Namespace namespace_307ea521a979be65 / namespace_1720479eedf969aa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x53
function function_88cd754a904f2c0a() {
    self.og_intensity = self getlightintensity();
    self.var_eb99fbea3747c2df = self getlightcolor();
    self.og_radius = self getlightradius();
    self.og_position = self.origin;
    self.og_rotation = self.angles;
}

