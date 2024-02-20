// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using script_38c251115537f16e;
#using script_3b78d23dad7ec5be;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\weaponlist.gsc;
#using scripts\anim\utility_common.gsc;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_1e2b21a2f6c06fac;
#using script_310397f2ad072bde;
#using script_16ea1b94f0f381b3;
#using script_5a4a5d9ba343ff8f;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\engine\trace.gsc;
#using script_23b580b08abe064f;
#using scripts\mp\rank.gsc;

#namespace zombie_hellhound;

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x14
function precache(params) {
    function_b527524106e2d980(params);
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x48b
// Size: 0x164
function private function_f49a30f92555b827(params) {
    function_842e17022dab63c3();
    function_8e401d26d58bc32d();
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_turned", &function_e809d2e0583ea302);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked", &function_c8bbb80c04cd9a37);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("shocked_end", &function_deadba29b36b687d);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned", &function_bf0fe7b30fa14180);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("burned_end", &function_788a3fa28ef17f52);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned", &function_dbb5710ec418627e);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("napalm_burned_end", &function_afa5ec2deb3f62a0);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("killed_body_cloned", &function_c8c10b313b3fcf09);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("spawn_animscripted", &function_6b324dd53aa590da);
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("zombie_melee", &function_619c067c56623b02);
    /#
        function_c9e001e49a9899b9();
    #/
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f6
// Size: 0x150
function function_e62bc0179274066c(taskid) {
    /#
        assert(isdefined(self.var_570908460ede5c13));
    #/
    function_7415ae9399ba8e75(self.var_570908460ede5c13);
    /#
        assert(isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c));
    #/
    callback::add("on_first_ai_init", &function_f49a30f92555b827);
    function_1fc0eb1eb90c8dd0("walk", 64);
    function_1fc0eb1eb90c8dd0("run", 160);
    function_1fc0eb1eb90c8dd0("sprint", 220);
    function_1fc0eb1eb90c8dd0("super_sprint", 220);
    self.var_c3554a26521188a8 = &function_a8c9248308033e4e;
    function_b5e57408c7878df7(&function_cb228ad4c8cfdff4);
    self.allowstrafe = 0;
    self.var_a0a21e4139ad1af4 = 1;
    if (getdvarint(@"hash_e21e718cfe10e8c2") == 1) {
        if (istrue(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b112b67eaeb72d71)) {
            if (isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b58f5e5cc320f1f6)) {
                thread function_afdad8871fb07c66();
            }
        }
    }
    function_bf2be6d286aa478();
    function_265e0e58c950559();
    function_8f8cff4c91f6845b();
    thread initscriptable();
    thread function_c15f0cdbdebc41b4();
    return anim.success;
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e
// Size: 0x68
function initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    waitframe();
    if (self isscriptable()) {
        var_2586c4df00068e74 = 0;
        if (self getscriptablehaspart("cryofreeze") && self getscriptablepartstate("cryofreeze") == "cryofreeze_on") {
            var_2586c4df00068e74 = 1;
        }
        if (!var_2586c4df00068e74) {
            utility::function_3ab9164ef76940fd("base", "base_on");
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7bd
// Size: 0x76
function private function_b527524106e2d980(params) {
    var_47399212b3052720 = getscriptbundle("zombieaisettings:" + params.var_570908460ede5c13);
    var_e3e671a2814c8f79 = getscriptbundle(var_47399212b3052720.var_fef5d84db3c8e7f7);
    utility::add_fx("hellhound_spawn_flash_fx", var_e3e671a2814c8f79.var_72e8f6018c6615a0);
    utility::add_fx("hellhound_spawn_in_fx", var_e3e671a2814c8f79.var_848dc4e5882f3b52);
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83a
// Size: 0xc7
function private function_c8c10b313b3fcf09(params) {
    if (istrue(ent_flag("burned"))) {
        if (isdefined(params.body)) {
            params.body utility::function_3ab9164ef76940fd("burned", "burned_on");
            params.body thread function_d13d798c34386976();
        }
    } else if (istrue(ent_flag("napalm_burned"))) {
        if (isdefined(params.body)) {
            params.body utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
            params.body thread function_c14610f0b3bdffe6();
        }
    }
    thread death_explode(params.body, params.eattacker);
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x908
// Size: 0x1f
function private function_d13d798c34386976() {
    wait(3);
    if (isdefined(self)) {
        utility::function_3677f2be30fdd581("burned", "burned_off");
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x92e
// Size: 0x1f
function private function_c14610f0b3bdffe6() {
    wait(3);
    if (isdefined(self)) {
        utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x954
// Size: 0x1d
function private function_c8bbb80c04cd9a37(var_a21093610d4de2ed) {
    utility::function_3ab9164ef76940fd("shocked", "shocked_on");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x1d
function private function_deadba29b36b687d(var_a21093610d4de2ed) {
    utility::function_3677f2be30fdd581("shocked", "shocked_off");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x99c
// Size: 0x1d
function private function_bf0fe7b30fa14180(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("burned", "burned_on");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9c0
// Size: 0x1d
function private function_788a3fa28ef17f52(var_12c084a213d7ad2) {
    utility::function_3677f2be30fdd581("burned", "burned_off");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9e4
// Size: 0x1d
function private function_dbb5710ec418627e(var_12c084a213d7ad2) {
    utility::function_3ab9164ef76940fd("napalm_burned", "napalm_burned_on");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa08
// Size: 0x29
function private function_afa5ec2deb3f62a0(var_12c084a213d7ad2) {
    ent_flag_clear("napalm_burned");
    utility::function_3677f2be30fdd581("napalm_burned", "napalm_burned_off");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0x46
function private function_e809d2e0583ea302(var_8c62cb683d643eb7) {
    function_f1e5805da192a1ef("sprint", "turned", 25);
    utility::function_3ab9164ef76940fd("brainrot", "brainrot_on");
    self._blackboard.var_8d19c6ba087e7a86 = 1;
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85
// Size: 0x5
function function_a8c9248308033e4e() {
    return 1;
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa92
// Size: 0x317
function private death_explode(body, attacker) {
    level endon("game_ended");
    utility::function_3ab9164ef76940fd("base", "base_off");
    body utility::function_3ab9164ef76940fd("base", "base_on");
    var_71af80ce6cd07376 = 0.5;
    if (isdefined(self.asmname)) {
        statename = self asmgetcurrentstate(self.asmname);
        var_2c8936d08f85c5c1 = asm_getanim(self.asmname, statename);
        xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
        animlength = getanimlength(xanim);
        if (animhasnotetrack(xanim, "zombie_dog_explode")) {
            var_a647f347e70842c6 = getnotetracktimes(xanim, "zombie_dog_explode")[0];
            var_71af80ce6cd07376 = animlength * var_a647f347e70842c6;
        }
    }
    var_d898a8c29f73d814 = spawnstruct();
    var_d898a8c29f73d814.var_6f31a7068904c04a = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_afaf1e2ffb9ece69;
    var_d898a8c29f73d814.var_1ef1cf7ab37370f3 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_9d3a40c028602d2e;
    var_d898a8c29f73d814.var_93f824ae56e54ef3 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_65d26f6523498490;
    var_d898a8c29f73d814.var_f3b2a4f4f0587a21 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_6ce768c397dee41c;
    var_d898a8c29f73d814.round_number = function_2201d3f3d7ab07a7();
    wait(var_71af80ce6cd07376);
    if (isdefined(body)) {
        blast_radius = 65;
        var_d7daf7298f4b8f1a = 17;
        var_537db625234e9bb3 = 7;
        var_951f208ecf500c87 = 0.1;
        body utility::function_3ab9164ef76940fd("death", "explode_on");
        tag = "j_spine2";
        var_3181e24a7353d0f9 = body gettagorigin(tag);
        var_3181e24a7353d0f9 = utility::groundpos(var_3181e24a7353d0f9);
        var_6560aa9bd5b55dab = spawn("script_model", var_3181e24a7353d0f9);
        if (!isdefined(var_6560aa9bd5b55dab)) {
            var_6560aa9bd5b55dab = body;
            body setcorpseremovetimer(var_d898a8c29f73d814.var_f3b2a4f4f0587a21 + var_951f208ecf500c87);
        }
        var_6560aa9bd5b55dab.owner = attacker;
        var_6560aa9bd5b55dab.weapon_name = "hellhound_molotov";
        var_6560aa9bd5b55dab.var_ee4c6b12c2b086d6 = 1;
        var_6560aa9bd5b55dab.var_6f3cee3c008da525 = &function_6f3cee3c008da525;
        level thread function_ddb55358dcda86f1(var_3181e24a7353d0f9, blast_radius, var_d7daf7298f4b8f1a, var_537db625234e9bb3, attacker, body, "MOD_EXPLOSIVE", var_d898a8c29f73d814, var_6560aa9bd5b55dab);
        level thread function_bc1804ee62065417(var_3181e24a7353d0f9, blast_radius, body);
        body thread function_78b13007be57d581(var_3181e24a7353d0f9, var_d898a8c29f73d814.var_f3b2a4f4f0587a21, attacker, var_6560aa9bd5b55dab);
        wait(var_951f208ecf500c87);
        if (!isdefined(body)) {
            return;
        }
        body hide();
        wait(var_d898a8c29f73d814.var_f3b2a4f4f0587a21);
        if (isdefined(body)) {
            body delete();
        }
        if (isdefined(var_6560aa9bd5b55dab)) {
            var_6560aa9bd5b55dab delete();
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdb0
// Size: 0x25f
function private function_ddb55358dcda86f1(origin, radius, inner_damage, outer_damage, attacker, exploder, means_of_death, var_d898a8c29f73d814, var_6560aa9bd5b55dab) {
    level endon("game_ended");
    potential_targets = [];
    potential_targets = getaiarrayinradius(origin, radius);
    if (isdefined(exploder.team)) {
        players = getplayersinradius(origin, radius);
        var_a9f54610f4cdaa88 = [];
        foreach (player in players) {
            if (exploder.team != player.team) {
                var_a9f54610f4cdaa88[var_a9f54610f4cdaa88.size] = player;
            }
        }
        if (var_a9f54610f4cdaa88.size) {
            potential_targets = array_combine(potential_targets, var_a9f54610f4cdaa88);
        }
    }
    if (!isdefined(attacker)) {
        attacker = var_6560aa9bd5b55dab;
    }
    foreach (target in potential_targets) {
        if (!isalive(target) || target == exploder) {
            continue;
        }
        var_4724784e2530a13f = mapfloat(0, radius, inner_damage, outer_damage, distance(target.origin, origin));
        if (isai(target)) {
            n_round = var_d898a8c29f73d814.round_number;
            if (n_round >= var_d898a8c29f73d814.var_6f31a7068904c04a) {
                if (n_round > var_d898a8c29f73d814.var_1ef1cf7ab37370f3) {
                    n_round = var_d898a8c29f73d814.var_1ef1cf7ab37370f3;
                }
                var_59334bb1b83f7052 = n_round - var_d898a8c29f73d814.var_6f31a7068904c04a + 1;
                var_a0398afc5013afdf = 1 + var_d898a8c29f73d814.var_93f824ae56e54ef3;
                var_ee7508144d16292c = pow(var_a0398afc5013afdf, var_59334bb1b83f7052);
                var_4724784e2530a13f = int(var_4724784e2530a13f * var_ee7508144d16292c);
            }
        }
        var_4724784e2530a13f = int(var_4724784e2530a13f);
        target dodamage(var_4724784e2530a13f, origin, attacker, var_6560aa9bd5b55dab, means_of_death, undefined, "torso_lower");
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1016
// Size: 0x9c
function private function_bc1804ee62065417(origin, radius, exploder) {
    potential_targets = getaiarrayinradius(origin, radius);
    foreach (target in potential_targets) {
        if (!isalive(target) || target == exploder) {
            continue;
        }
        if (!target function_e67a89537ae7d4b7()) {
            target function_e96aac065abbec4e(origin);
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10b9
// Size: 0x121
function private function_78b13007be57d581(var_2e8d19333da1819, duration, attacker, var_6560aa9bd5b55dab) {
    if (!isdefined(attacker)) {
        return;
    }
    var_3a472c52fa6ced24 = spawnstruct();
    var_3a472c52fa6ced24.var_e0cf068ccab49e34 = 2;
    var_3a472c52fa6ced24.var_81c84c326caec1d2 = 2;
    var_3a472c52fa6ced24.var_74fbf35a2265fa59 = 2;
    var_3a472c52fa6ced24.var_439885d26a2f9bf5 = 0.2;
    var_6560aa9bd5b55dab.var_e569b726ededed94 = var_3a472c52fa6ced24;
    if (isdefined(level.equipment.table["equip_molotov"])) {
        var_424cc047d8a818b6 = level.equipment.table["equip_molotov"];
        if (isdefined(var_424cc047d8a818b6.objweapon)) {
            var_3a472c52fa6ced24.useweapon = var_424cc047d8a818b6.objweapon;
        }
    }
    thread namespace_df478cc572a311d3::molotov_simulate_impact(var_6560aa9bd5b55dab, var_2e8d19333da1819, (0, 0, 1), undefined, (0, 0, 100), gettime(), "equip_molotov_hellhound_pool_mp_p");
    thread function_6e86bd36fa3acc99(var_2e8d19333da1819);
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e1
// Size: 0x80
function private function_6e86bd36fa3acc99(position) {
    self endon("death");
    ignore = undefined;
    if (isalive(ignore)) {
        ignore = self;
    }
    trace = namespace_2a184fc4902783dc::_bullet_trace(position + (0, 0, 20), position, 0, ignore);
    var_ab30035086d89685 = trace["surfacetype"] == "surftype_water";
    if (!var_ab30035086d89685) {
        if (isdefined(self)) {
            utility::function_3ab9164ef76940fd("death_impact", "impact_on");
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1268
// Size: 0x78
function private function_cb228ad4c8cfdff4(params) {
    if (isdefined(params.einflictor) && is_equal(params.einflictor.weapon_name, "hellhound_molotov")) {
        return 0;
    }
    if (isdefined(self.var_182bc385bd9c0c1d)) {
        newdamage = self [[ self.var_182bc385bd9c0c1d ]](params);
        if (isdefined(newdamage)) {
            return newdamage;
        }
    }
    return params.idamage;
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12e8
// Size: 0x1c7
function private function_6b324dd53aa590da(params) {
    level endon("game_ended");
    self endon("death");
    var_b6a017ab1b344adf = "show_hound";
    self hide();
    thread function_cc4e2461ddaebfd7();
    scriptable = undefined;
    if (isdefined(self.var_47399212b3052720.var_e58a65b7a8f5973c.spawnscriptable)) {
        scriptable = spawnscriptable(self.var_47399212b3052720.var_e58a65b7a8f5973c.spawnscriptable, self.origin + (0, 0, 90), self.angles);
        scriptable setscriptablepartstate("spawn_fx", "spawn_loop");
    }
    thread function_56d21bc47a25d617(scriptable, var_b6a017ab1b344adf);
    waitframe();
    var_a640a83e8797dc44 = 2;
    if (isdefined(self.asmname)) {
        var_9e6f85cd125e3f9a = undefined;
        if (isdefined(params) && isdefined(params.aliasname)) {
            var_9e6f85cd125e3f9a = [0:params.aliasname];
        }
        statename = self asmgetcurrentstate(self.asmname);
        var_2c8936d08f85c5c1 = asm_getanim(self.asmname, statename, var_9e6f85cd125e3f9a);
        xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
        animlength = getanimlength(xanim);
        if (animhasnotetrack(xanim, var_b6a017ab1b344adf)) {
            frac = getnotetracktimes(xanim, var_b6a017ab1b344adf)[0];
            var_a640a83e8797dc44 = animlength * frac;
        }
    }
    wait(var_a640a83e8797dc44);
    self notify(var_b6a017ab1b344adf);
    if (isalive(self)) {
        self notify("show_hellhound");
        thread function_37e7327e560b34b6();
        if (isalive(self)) {
            self show();
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14b7
// Size: 0x16
function private function_cc4e2461ddaebfd7() {
    wait(10);
    if (isalive(self)) {
        self show();
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14d4
// Size: 0x34
function private function_56d21bc47a25d617(scriptable, var_cb2d96186dccc98b) {
    level endon("game_ended");
    waittill_either(var_cb2d96186dccc98b, "death");
    if (isdefined(scriptable)) {
        scriptable freescriptable();
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x150f
// Size: 0x14
function private function_37e7327e560b34b6() {
    utility::function_3ab9164ef76940fd("spawn_fx", "spawn_flash");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152a
// Size: 0x130
function function_afca3201208900fb(item_count) {
    self endon("death");
    level endon("game_ended");
    if (!isdefined(item_count)) {
        item_count = 1;
    }
    thread Animscripted_SharedFunc("dig", "hellhound_dig_complete", undefined, undefined, undefined);
    utility::function_3ab9164ef76940fd("digging", "digging_on");
    self waittill("hellhound_dig_complete");
    utility::function_3ab9164ef76940fd("digging", "digging_off");
    if (isdefined(self.var_941802a0997e0c42)) {
        closestplayer = namespace_99b160f0b52a4db::function_874f6b6d8f270d36();
        if (distancesquared(closestplayer.origin, self.origin) > 40000) {
            self waittill("hellhound_pet_player_reached");
        }
        wait(0.75);
        head_pos = self gettagorigin("j_head");
        item = function_aa6b52df8080cac7(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b58f5e5cc320f1f6, item_count, head_pos);
    } else {
        item = function_aa6b52df8080cac7(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b58f5e5cc320f1f6, item_count, self.origin);
    }
    self.var_5ca8d731d2144bd2 = 0;
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1661
// Size: 0xd0
function private function_afdad8871fb07c66() {
    self endon("death");
    level endon("game_ended");
    self.var_5ca8d731d2144bd2 = 0;
    var_bec7f3fc751ac711 = 30;
    while (1) {
        wait(randomfloat(var_bec7f3fc751ac711));
        if (randomfloat(1) < 0.5) {
            is_turned = 0;
            if (namespace_c56b0b75fd51eab1::function_8ce7894f1a52fb77("charm")) {
                is_turned = 1;
            }
            if (!self.var_5ca8d731d2144bd2) {
                if (is_turned) {
                    if (!isdefined(self.enemy) && !istrue(self.petting)) {
                        self.var_5ca8d731d2144bd2 = 1;
                        thread function_afca3201208900fb(1);
                    }
                } else if (!isdefined(self.enemy)) {
                    self.var_5ca8d731d2144bd2 = 1;
                    thread function_afca3201208900fb(1);
                }
            }
        }
        wait(var_bec7f3fc751ac711);
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1738
// Size: 0x29
function private function_c15f0cdbdebc41b4() {
    self endon("death");
    level endon("game_ended");
    while (1) {
        self waittill("bmeleeended");
        thread function_5825d55253f004b2();
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1768
// Size: 0x52
function private function_5825d55253f004b2() {
    var_c95d96659ab72b55 = 1;
    level endon("game_ended");
    self endon("death");
    self notify("start_chase_slowdown");
    self endon("start_chase_slowdown");
    function_f1e5805da192a1ef("walk", "chase_slowdown", 15);
    wait(var_c95d96659ab72b55);
    function_f1e5805da192a1ef(undefined, "chase_slowdown");
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17c1
// Size: 0x4b
function private function_619c067c56623b02(params) {
    if (isdefined(params.var_5e9b4f251304521d) && isplayer(params.var_5e9b4f251304521d)) {
        params.var_5e9b4f251304521d utility::function_3ab9164ef76940fd("hellhoundMeleeVFX", "hit_fx");
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1813
// Size: 0x5a
function private function_6f3cee3c008da525() {
    attacker = self.owner;
    if (!isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (!isdefined(self.kill_count)) {
        self.kill_count = 0;
    }
    self.kill_count++;
    attacker function_b8e70cc126c2fd5c(self.kill_count);
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1874
// Size: 0x59
function private function_b8e70cc126c2fd5c(kill_count) {
    attacker = self;
    if (isplayer(attacker) && kill_count == 5) {
        points = namespace_62c556437da28f50::getscoreinfovalue(#"hash_b937bf9fd26f15f1");
        if (isdefined(points)) {
            attacker function_e800498086e36c29(#"hash_b937bf9fd26f15f1");
        }
    }
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x18d4
// Size: 0x30
function private function_c9e001e49a9899b9() {
    /#
        waitframe();
        function_6e7290c8ee4f558b("shocked_on");
        function_a9a864379a098ad6("surftype_water", "<unknown string>", &function_2400186ca86b8b7d);
        function_fe953f000498048f();
    #/
}

// Namespace zombie_hellhound/namespace_66aa06755cfb5bdd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x190b
// Size: 0xeb
function private function_2400186ca86b8b7d(params) {
    /#
        player = level.players[0];
        ai_array = getaiarrayinradius(player.origin, 500);
        foreach (ai in ai_array) {
            if (!isalive(ai) || isdefined(ai.subclass) && !issubstr(ai.subclass, "<unknown string>")) {
                continue;
            }
            if (ai asmhasstate(ai.asmname, "<unknown string>")) {
                ai function_360874d9808f0724();
                ai function_ac90fa5cc0a80298("<unknown string>");
            }
        }
    #/
}

