// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using scripts\engine\scriptable.gsc;
#using scripts\common\interactive.gsc;
#using script_2669878cf5a1b6bc;

#namespace interaction;

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0x3c
function function_46d99e13bef7b7f8() {
    level.interacts = [];
    scriptable_addusedcallback(&function_cb6e7c567d06f936);
    scriptable_addautousecallback(&function_b13174d586e772a0);
    function_8daea885ec058271(&function_725b4f278c8bd980);
    /#
        thread function_7741d0cbf1a7820();
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b
// Size: 0xe8
function function_32645103f7520635(scriptable, on_use_function, var_81adce70ad13cf33, var_f3bf6e6da951239b) {
    /#
        assert(!array_contains(level.interacts, scriptable));
    #/
    scriptable.var_a4f3ccfb11edb890 = [];
    scriptable.var_9cc931ebdfbde990 = [];
    scriptable.var_b66a97fdba4776ac = [];
    if (isdefined(on_use_function)) {
        scriptable.var_a4f3ccfb11edb890 = array_add(scriptable.var_a4f3ccfb11edb890, on_use_function);
    }
    if (isdefined(var_81adce70ad13cf33)) {
        scriptable.var_9cc931ebdfbde990 = array_add(scriptable.var_9cc931ebdfbde990, var_81adce70ad13cf33);
    }
    if (isdefined(var_f3bf6e6da951239b)) {
        scriptable.var_b66a97fdba4776ac = array_add(scriptable.var_b66a97fdba4776ac, var_f3bf6e6da951239b);
    }
    level.interacts = array_add(level.interacts, scriptable);
    return scriptable;
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x159
function function_90472496b91b94b3(var_99da2e68c7b90661, radius, var_106d0dbf5f828006, hint_string, var_9555688dd3098f5b, var_746458e71e0663eb) {
    ent = undefined;
    if (isvector(var_99da2e68c7b90661)) {
        ent = spawn("script_model", var_99da2e68c7b90661);
        if (!isdefined(ent)) {
            /#
                print("<unknown string>");
            #/
            return undefined;
        }
        ent setmodel("tag_origin");
    } else {
        ent = var_99da2e68c7b90661;
    }
    /#
        assert(isent(ent));
    #/
    /#
        assert(!isdefined(var_106d0dbf5f828006) || isfunction(var_106d0dbf5f828006));
    #/
    ent makeusable();
    if (isvalidmissile(ent)) {
        ent enablemissilehint(1);
    }
    if (isdefined(hint_string)) {
        ent sethintstring(hint_string);
    }
    ent sethintstringparams(var_9555688dd3098f5b, var_746458e71e0663eb);
    if (!isdefined(radius)) {
        radius = 64;
    }
    ent setuserange(radius);
    ent.var_10a09b4e9dcdf2ed = radius;
    ent.var_a4f3ccfb11edb890 = [0:var_106d0dbf5f828006];
    ent thread function_25c9189dc624f33();
    ent setusefov(360);
    ent setcursorhint("HINT_NOICON");
    /#
        assertex(isarray(level.interacts), "scripts\cp_mp\interaction::init_interaction() needs to be run for this game mode or gametype before registering interacts");
    #/
    level.interacts = array_add(level.interacts, ent);
    return ent;
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45c
// Size: 0x37
function function_e6c63f16f2258b80(var_bc8ea267a7d17092) {
    if (isdefined(var_bc8ea267a7d17092)) {
        /#
            assert(isfunction(var_bc8ea267a7d17092));
        #/
        self.var_d19dfa5205fce031 = var_bc8ea267a7d17092;
    } else {
        self.var_d19dfa5205fce031 = undefined;
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49a
// Size: 0x37
function function_98fc2e3f04194a50(var_c6681d6b0c54e37e) {
    if (isdefined(var_c6681d6b0c54e37e)) {
        /#
            assert(isfunction(var_c6681d6b0c54e37e));
        #/
        self.var_ee69e6a611184cfb = var_c6681d6b0c54e37e;
    } else {
        self.var_ee69e6a611184cfb = undefined;
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d8
// Size: 0x41
function function_c2efffe46a3f99d2(hint_string, var_9555688dd3098f5b, var_746458e71e0663eb) {
    /#
        assert(self isusable());
    #/
    if (isdefined(hint_string)) {
        self sethintstring(hint_string);
    }
    self sethintstringparams(var_9555688dd3098f5b, var_746458e71e0663eb);
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x520
// Size: 0x32
function function_f62a6ba54b34e2bc(radius) {
    /#
        assert(self isusable());
    #/
    if (isdefined(radius)) {
        self setuserange(radius);
        self.var_10a09b4e9dcdf2ed = radius;
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559
// Size: 0xe
function function_9a0883b5a0999dac() {
    self.var_2b37e5554c33ef0b = 1;
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56e
// Size: 0x63
function private function_33d615753cbbb49c(player) {
    if (!isplayer(player)) {
        return 1;
    }
    if (!istrue(self.var_2b37e5554c33ef0b)) {
        return 1;
    }
    if (istrue(player.insertingarmorplate) || player isswitchingweapon()) {
        return 0;
    }
    currentweapon = player getcurrentweapon();
    if (istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(currentweapon))) {
        return 0;
    }
    return 1;
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5d9
// Size: 0x1ad
function private function_25c9189dc624f33() {
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (function_33d615753cbbb49c(player)) {
            var_73069b4add1e8094 = "none";
            poiname = "none";
            usetype = "none";
            if (isfunction(level.var_8241e0d86017df29)) {
                var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](self.origin);
            }
            if (issharedfuncdefined("poi", "get_poi_name_from_origin")) {
                poiname = function_f3bb4f4911a1beb2("poi", "get_poi_name_from_origin", self.origin);
            }
            if (isdefined(self.model)) {
                usetype = self.model;
            }
            player dlog_recordplayerevent("dlog_event_player_interaction", [0:"interaction_x", 1:self.origin[0], 2:"interaction_y", 3:self.origin[1], 4:"interaction_z", 5:self.origin[2], 6:"interaction_poi", 7:poiname, 8:"threat_level", 9:var_73069b4add1e8094, 10:"type", 11:usetype]);
            foreach (callback in self.var_a4f3ccfb11edb890) {
                if (isfunction(callback)) {
                    self [[ callback ]](player);
                }
            }
        }
        waitframe();
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x78d
// Size: 0x216
function private function_cb6e7c567d06f936(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    e_container = undefined;
    if (isdefined(instance) && array_contains(level.interacts, instance)) {
        e_container = instance;
    } else if (isdefined(instance) && isdefined(instance.entity) && array_contains(level.interacts, instance.entity)) {
        e_container = instance.entity;
    }
    if (!isdefined(e_container)) {
        return;
    }
    if (e_container function_33d615753cbbb49c(player)) {
        var_73069b4add1e8094 = "none";
        poiname = "none";
        if (isfunction(level.var_8241e0d86017df29)) {
            var_73069b4add1e8094 = [[ level.var_8241e0d86017df29 ]](e_container.origin);
        }
        if (issharedfuncdefined("poi", "get_poi_name_from_origin")) {
            poiname = function_f3bb4f4911a1beb2("poi", "get_poi_name_from_origin", e_container.origin);
        }
        player dlog_recordplayerevent("dlog_event_player_interaction", [0:"interaction_x", 1:e_container.origin[0], 2:"interaction_y", 3:e_container.origin[1], 4:"interaction_z", 5:e_container.origin[2], 6:"interaction_poi", 7:poiname, 8:"threat_level", 9:var_73069b4add1e8094, 10:"type", 11:var_cc38472e36be1b61]);
        foreach (callback in e_container.var_a4f3ccfb11edb890) {
            if (isfunction(callback)) {
                e_container [[ callback ]](player);
            }
        }
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9aa
// Size: 0x108
function private function_b13174d586e772a0(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    e_container = undefined;
    if (isdefined(instance) && array_contains(level.interacts, instance)) {
        e_container = instance;
    } else if (isdefined(instance) && isdefined(instance.entity) && array_contains(level.interacts, instance.entity)) {
        e_container = instance.entity;
    }
    if (!isdefined(e_container)) {
        return;
    }
    foreach (callback in e_container.var_9cc931ebdfbde990) {
        if (isfunction(callback)) {
            e_container [[ callback ]](player);
        }
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab9
// Size: 0x110
function private function_725b4f278c8bd980(instance, part, state, player, useduration) {
    e_container = undefined;
    if (isdefined(instance) && array_contains(level.interacts, instance)) {
        e_container = instance;
    } else if (isdefined(instance) && isdefined(instance.entity) && array_contains(level.interacts, instance.entity)) {
        e_container = instance.entity;
    }
    if (!isdefined(e_container) || !isdefined(e_container.var_b66a97fdba4776ac)) {
        return;
    }
    foreach (callback in e_container.var_b66a97fdba4776ac) {
        if (isfunction(callback)) {
            e_container [[ callback ]](player);
        }
    }
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbd0
// Size: 0x73
function private function_7741d0cbf1a7820() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7fbb580f18773f80, 1);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_1df05860f0b63778);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_8bb1a737fa8cb24f);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_fe3eefe62bf65fc7);
        function_fe953f000498048f();
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc4a
// Size: 0x3d
function private function_7fbb580f18773f80() {
    /#
        pos = function_9b4c82dba041b23d();
        interact = function_90472496b91b94b3(pos);
        interact function_c2efffe46a3f99d2("<unknown string>", "<unknown string>", 100);
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc8e
// Size: 0x51
function private function_1df05860f0b63778() {
    /#
        pos = function_9b4c82dba041b23d();
        item = spawnscriptable("<unknown string>", pos, (0, 0, 0));
        function_32645103f7520635(item, &function_7303c641ccd3c51f, &function_990edc4c3536146d, &function_6cdb3ee0ad65070d);
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xce6
// Size: 0x16
function private function_7303c641ccd3c51f(player) {
    /#
        self freescriptable();
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd03
// Size: 0x57
function private function_990edc4c3536146d(player) {
    /#
        recordline(self.origin, self.origin + (0, 0, 72));
        record3dtext("<unknown string>", self.origin + (0, 0, 72));
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd61
// Size: 0x57
function private function_6cdb3ee0ad65070d(player) {
    /#
        recordline(self.origin, self.origin + (0, 0, 72));
        record3dtext("<unknown string>", self.origin + (0, 0, 72));
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdbf
// Size: 0x36
function private function_8bb1a737fa8cb24f() {
    /#
        pos = function_9b4c82dba041b23d();
        interact = function_90472496b91b94b3(pos);
        interact function_e6c63f16f2258b80(&function_71322f3a8aa428ef);
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xdfc
// Size: 0x8b
function private function_71322f3a8aa428ef(usable, player) {
    /#
        current_weapon = player getcurrentweapon();
        if (istrue(current_weapon.ismelee)) {
            return {string:"<unknown string>", type:"<unknown string>"};
        } else {
            return {params:[0:0, 1:100], string:"<unknown string>", type:"<unknown string>"};
        }
    #/
}

// Namespace interaction/namespace_5775ad2badedbcaa
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe8e
// Size: 0xde
function private function_fe3eefe62bf65fc7() {
    /#
        level endon("<unknown string>");
        while (1) {
            waitframe();
            if (!isdefined(level.interacts)) {
                continue;
            }
            foreach (var_26ffc3a3e76a0e61 in level.interacts) {
                if (!isdefined(var_26ffc3a3e76a0e61)) {
                    continue;
                }
                if (isdefined(var_26ffc3a3e76a0e61.var_10a09b4e9dcdf2ed)) {
                    namespace_3c37cb17ade254d::draw_circle(var_26ffc3a3e76a0e61.origin, var_26ffc3a3e76a0e61.var_10a09b4e9dcdf2ed, (1, 0, 0), 1, 1, 1);
                }
                record3dtext("<unknown string>", var_26ffc3a3e76a0e61.origin + (0, 0, 32));
            }
        }
    #/
}

