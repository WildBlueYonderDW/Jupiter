// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\devgui.gsc;
#using script_429c2a03090c1ea1;
#using script_7edf952f8921aa6b;
#using script_5df4adf33e9f704;
#using script_570cdb4e38f0225b;
#using scripts\asm\asm.gsc;

#namespace namespace_207a1269d42456e7;

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d
// Size: 0x23
function function_e21b71f0f396bb06() {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_damaged", &function_3b8499d83d52380e);
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x23
function function_688e6bf6742914c0() {
    function_b5e57408c7878df7(&function_fc8dd3d00ebca77b);
    self.var_ebd8439d96ec5a19 = 0;
    /#
        function_14b998b3a980d6fe();
    #/
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1
// Size: 0x42
function function_f042d86bacba063b() {
    if (isdefined(self.var_ebd8439d96ec5a19)) {
        var_179bf7d9d8c893b1 = gettime() - self.var_ebd8439d96ec5a19;
        var_f1f1c1b020be2bec = 5000;
        if (var_179bf7d9d8c893b1 < var_f1f1c1b020be2bec) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22b
// Size: 0x14
function private function_3b8499d83d52380e(dmg_struct) {
    function_f9f0c202070afb63(dmg_struct);
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x246
// Size: 0x110
function private function_f9f0c202070afb63(dmg_struct) {
    meansofdeath = dmg_struct.smeansofdeath;
    if (meansofdeath != "MOD_IMPACT") {
        return;
    }
    weapon_obj = dmg_struct.sweapon;
    if (!isdefined(weapon_obj) || weapon_obj.classname != "grenade") {
        /#
            function_2cb1324178d89dec("<unknown string>");
        #/
        return;
    }
    var_357455e188e9e3b8 = dmg_struct.metabonename;
    if (!isdefined(var_357455e188e9e3b8)) {
        /#
            function_2cb1324178d89dec("<unknown string>");
        #/
        return;
    }
    head_index = namespace_8c27fa2259102300::function_e5db29e6fd6f6a88(var_357455e188e9e3b8);
    if (!isdefined(head_index)) {
        /#
            function_2cb1324178d89dec("<unknown string>" + var_357455e188e9e3b8);
        #/
        return;
    }
    head_state = namespace_560a8871429928df::function_2945ff43fceb0fc8(self, head_index);
    if (head_state != 2) {
        /#
            function_2cb1324178d89dec("<unknown string>" + head_state);
        #/
        return;
    }
    if (function_f042d86bacba063b()) {
        /#
            function_2cb1324178d89dec("<unknown string>");
        #/
        return;
    }
    abom_swallow(dmg_struct, head_index);
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35d
// Size: 0x177
function private abom_swallow(dmg_struct, head_index) {
    grenade = dmg_struct.einflictor;
    if (!isdefined(grenade)) {
        /#
            function_2cb1324178d89dec("<unknown string>");
        #/
        return;
    }
    /#
        assert(isdefined(head_index));
    #/
    self.var_ebd8439d96ec5a19 = gettime();
    var_8fa538a1d4db452c = "swallow_in";
    if (isdefined(grenade.equipmentref)) {
        if (grenade.equipmentref == "equip_monkey_bomb") {
            self setscriptablepartstate("audio_monkeybomb_swallow", "on");
        }
    }
    scripts/asm/asm::asm_setstate(var_8fa538a1d4db452c);
    tag = "j_" + level.var_28e4ea2998e3439b[head_index];
    grenade linkto(self, tag, (0, 0, 0), (0, 0, 0));
    grenade ent_flag_set("abom_swallowed");
    grenade.var_59d004d14d13b52b = head_index;
    grenade notify("missile_stuck");
    self.var_739e0470ae2ed359 = spawnstruct();
    self.var_739e0470ae2ed359.head_index = head_index;
    self.var_739e0470ae2ed359.eattacker = dmg_struct.eattacker;
    self.var_739e0470ae2ed359.time = gettime();
    wait(2);
    if (isdefined(self) && isdefined(grenade)) {
        grenade notify("detonateExplosive", self);
    }
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0x35d
function private function_fc8dd3d00ebca77b(dmg_struct) {
    var_c02b1f6c1721c844 = undefined;
    if (isdefined(dmg_struct.einflictor)) {
        if (!isdefined(dmg_struct.einflictor.var_59d004d14d13b52b) || !dmg_struct.einflictor ent_flag("abom_swallowed")) {
            return -1;
        }
        /#
            function_2cb1324178d89dec("<unknown string>");
        #/
        var_c02b1f6c1721c844 = level.var_28e4ea2998e3439b[dmg_struct.einflictor.var_59d004d14d13b52b];
    } else {
        if (!isdefined(self.var_739e0470ae2ed359)) {
            return -1;
        }
        var_179bf7d9d8c893b1 = gettime() - self.var_739e0470ae2ed359.time;
        if (var_179bf7d9d8c893b1 > 3500) {
            /#
                function_2cb1324178d89dec("<unknown string>" + var_179bf7d9d8c893b1);
            #/
            self.var_739e0470ae2ed359 = undefined;
            return -1;
        }
        if (self.var_739e0470ae2ed359.eattacker != dmg_struct.eattacker || dmg_struct.sweapon.classname != "grenade" || dmg_struct.smeansofdeath != "MOD_GRENADE_SPLASH" && dmg_struct.smeansofdeath != "MOD_EXPLOSIVE") {
            /#
                if (self.var_739e0470ae2ed359.eattacker != dmg_struct.eattacker) {
                    function_2cb1324178d89dec("<unknown string>");
                } else {
                    function_2cb1324178d89dec("<unknown string>" + dmg_struct.sweapon.classname + "<unknown string>" + dmg_struct.smeansofdeath);
                }
            #/
            return -1;
        }
        var_c02b1f6c1721c844 = level.var_28e4ea2998e3439b[self.var_739e0470ae2ed359.head_index];
        if (!isdefined(dmg_struct.metabonename) || dmg_struct.metabonename != var_c02b1f6c1721c844) {
            tag = "j_" + var_c02b1f6c1721c844;
            tag_origin = self gettagorigin(tag);
            var_35391e999d5450b1 = lengthsquared(tag_origin - dmg_struct.vpoint);
            if (var_35391e999d5450b1 > 100) {
                /#
                    function_2cb1324178d89dec("<unknown string>" + var_c02b1f6c1721c844 + "<unknown string>" + sqrt(var_35391e999d5450b1));
                #/
                return -1;
            }
        }
    }
    self.var_739e0470ae2ed359 = undefined;
    if (!isdefined(var_c02b1f6c1721c844)) {
        return -1;
    }
    increased_damage = dmg_struct.idamage * 20;
    head_health = function_8c1f2f897dfe5982(var_c02b1f6c1721c844, "open");
    if (head_health <= 0) {
        return -1;
    }
    new_damage = max(increased_damage, dmg_struct.idamage);
    new_damage = min(new_damage, head_health);
    dmg_struct.damagemaxhealthcap = max(dmg_struct.damagemaxhealthcap, 1);
    dmg_struct.var_14edc6d1db3695bc = 1;
    function_dfd6d030978a7650(var_c02b1f6c1721c844, new_damage, "open", dmg_struct.eattacker, dmg_struct.einflictor);
    params = spawnstruct();
    params.incomingdamage = new_damage;
    callback::callback("abomination_swallow_grenade");
    return new_damage;
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x840
// Size: 0x2f
function private function_14b998b3a980d6fe() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_dce8d747fc906ca1);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x876
// Size: 0x1b
function private function_dce8d747fc906ca1() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_e6612e812211addd");
    #/
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x898
// Size: 0x18
function private function_502e2f61c14586cc() {
    /#
        return getdvarint(@"hash_e6612e812211addd", 0) > 0;
    #/
}

// Namespace namespace_207a1269d42456e7 / namespace_b7bf31c295ba24ab
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x8b7
// Size: 0x5b
function private function_2cb1324178d89dec(text, pos) {
    /#
        if (function_502e2f61c14586cc()) {
            pos = default_to(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

