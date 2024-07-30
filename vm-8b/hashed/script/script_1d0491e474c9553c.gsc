#using script_7edf952f8921aa6b;
#using script_da0dce9d411d119;
#using script_6de180c937bb3129;
#using script_4c543f01345a2c04;
#using script_429c2a03090c1ea1;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;

#namespace zombie_entity;

// Namespace zombie_entity / namespace_75bb5b9aa3fc4820
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x101
// Size: 0x20
function autoexec main() {
    var_601bcee5d276f46d = "zombie_entity";
    function_d6736c5ef5ac2990(var_601bcee5d276f46d, &function_3d588dcd552b26db);
}

/#

    // Namespace zombie_entity / namespace_75bb5b9aa3fc4820
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x129
    // Size: 0x1d
    function function_fe9929b42e5a99e4() {
        setdvarifuninitialized(@"hash_9dd191a7e11820fd", 0);
        thread function_995a6309e572cf14();
    }

#/

// Namespace zombie_entity / namespace_75bb5b9aa3fc4820
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e
// Size: 0x101
function function_3d588dcd552b26db(params) {
    var_c02b1f6c1721c844 = params.var_c02b1f6c1721c844;
    index = function_f83b17b2b8d7a76d(var_c02b1f6c1721c844);
    if (index == -1) {
        return;
    }
    name = var_c02b1f6c1721c844 + "_weakpoint";
    utility::function_3677f2be30fdd581(name, "destroyed");
    self.entitydata.var_21544f0d5a3ef4d2 -= 1;
    self.entitydata.weakpoints[index].state = "destroyed";
    if (self.entitydata.var_21544f0d5a3ef4d2 <= 0) {
        function_f40c1634cd048cda(2);
        if (function_1017131041e2a7b()) {
            self.entitydata.var_8e3c8aea64b0ff9a = 1;
            self.var_e198ad98b4845f29.reason = "weakpoint";
        }
    }
}

/#

    // Namespace zombie_entity / namespace_75bb5b9aa3fc4820
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x257
    // Size: 0x111
    function private function_995a6309e572cf14() {
        self endon("<dev string:x1c>");
        while (true) {
            var_46a3e181e35f46ab = function_97fd256a244527b4(self.metabones.bundle_name);
            foreach (metabone in var_46a3e181e35f46ab.metabones) {
                foreach (tag in metabone.tags) {
                    is_active = function_6db512214e7e7009(metabone.name + "<dev string:x25>");
                    draw_tag(tag.tagname, tag.radius, is_active);
                }
            }
            waitframe();
        }
    }

    // Namespace zombie_entity / namespace_75bb5b9aa3fc4820
    // Params 3, eflags: 0x4
    // Checksum 0x0, Offset: 0x370
    // Size: 0x6d
    function private draw_tag(tagname, var_a3f61a062796e87e, is_active) {
        tag_origin = self gettagorigin(tagname);
        tag_angles = self gettagangles(tagname);
        function_ad6307798215e0be(tagname + "<dev string:x33>" + tag_angles[0] + "<dev string:x3a>" + tag_angles[1] + "<dev string:x3a>" + tag_angles[2], tag_origin, var_a3f61a062796e87e, is_active);
    }

    // Namespace zombie_entity / namespace_75bb5b9aa3fc4820
    // Params 4, eflags: 0x4
    // Checksum 0x0, Offset: 0x3e5
    // Size: 0xc3
    function private function_ad6307798215e0be(text, pos, radius, is_active) {
        var_30e3a3183c5891e8 = getdvarint(@"hash_9dd191a7e11820fd", 0);
        if (var_30e3a3183c5891e8 > 0) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            color = (1, 0, 0);
            if (is_active) {
                color = (0, 1, 0);
            }
            var_db334a0ef5cf7571 = var_30e3a3183c5891e8 == 1;
            if (!var_db334a0ef5cf7571) {
                var_db334a0ef5cf7571 = is_active;
            }
            if (var_db334a0ef5cf7571) {
                print3d(pos, "<dev string:x3f>" + text, color);
                sphere(pos, radius, color);
            }
        }
    }

#/
