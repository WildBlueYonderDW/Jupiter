// mwiii decomp prototype
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_16ea1b94f0f381b3;
#using scripts\common\system.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\asm\asm_bb.gsc;

#namespace lightning_chain;

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x481
// Size: 0x1a
function private autoexec __init__system__() {
    system::register(#"lightning_chain", undefined, undefined, &post_main);
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a2
// Size: 0x1b
function private post_main() {
    function_c1d388ed5a83b643();
    utility::function_f3bb4f4911a1beb2("lightning_chain", "init");
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4c4
// Size: 0x1cc
function private function_c1d388ed5a83b643() {
    level._effect["tesla_bolt"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_elec_bolt_01.vfx");
    level._effect["tesla_shock"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_zmb.vfx");
    level._effect["tesla_shock_nonfatal"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_elec_bolt_01.vfx");
    level._effect["tesla_shock_eyes"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_eyes_zmb.vfx");
    level._effect["tesla_shock_ground"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_ground.vfx");
    level._effect["tesla_bolt_pap"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_elec_bolt_ug_01.vfx");
    level._effect["tesla_shock_pap"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_ug_zmb.vfx");
    level._effect["tesla_shock_nonfatal_pap"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_elec_bolt_ug_01.vfx");
    level._effect["tesla_shock_eyes_pap"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_eyes_ug_zmb.vfx");
    level._effect["tesla_shock_ground_pap"] = loadfx("vfx/jup/ob/gameplay/zm/vfx_tesla_shock_ug_ground.vfx");
    level callback::add("on_zombie_ai_damaged", &function_510d27a7b8d2bbcd);
    level callback::add("on_soldier_ai_damaged", &function_510d27a7b8d2bbcd);
    level.var_b0d02607ac2c9ec = [];
    level.var_b0d02607ac2c9ec[0] = 5000;
    level.var_b0d02607ac2c9ec[1] = 10000;
    level.var_b0d02607ac2c9ec[2] = 20000;
    level.var_b0d02607ac2c9ec[3] = 40000;
    utility::registersharedfunc("lightning_chain", "lc_expand", &lc_expand);
    utility::registersharedfunc("lightning_chain", "lc_stun_and_damage", &lc_stun_and_damage);
    utility::registersharedfunc("lightning_chain", "lc_damage_calculation", &lc_damage_calculation);
    utility::registersharedfunc("lightning_chain", "lc_play_stun_fx", &lc_play_stun_fx);
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x697
// Size: 0x7e
function create_lightning_chain_params(max_enemies_killed, radius, head_gib_chance, arc_travel_time, var_232825c32e606ba4) {
    lcp = spawnstruct();
    lcp.max_enemies_killed = max_enemies_killed;
    lcp.var_4c24a7220d2d2d46 = radius;
    lcp.head_gib_chance = head_gib_chance;
    lcp.arc_travel_time = arc_travel_time;
    lcp.var_232825c32e606ba4 = var_232825c32e606ba4;
    return lcp;
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71d
// Size: 0x76
function arc_damage(source_enemy, player, params) {
    if (!isdefined(params)) {
        return;
    }
    thread utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_stun_and_damage", 1, params);
    if (ai::function_f6347c9c410226d3()) {
        return;
    }
    var_e47555a8dc3f59cb = level function_ae21b7c8d9bf419c(source_enemy);
    level utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_expand", var_e47555a8dc3f59cb, params.max_enemies_killed - 1, params);
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79a
// Size: 0x71
function function_9754219dda9b7840(params) {
    if (istrue(self.var_248e34cf15fbe400) || is_equal(self.team, params.player.team) || isdefined(self.var_f1e5e96a3bd34fd1) && array_contains(self.var_f1e5e96a3bd34fd1, params.var_2ec028cae7b1cc0c)) {
        return 1;
    }
    return 0;
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x813
// Size: 0x17a
function private lc_expand(start_point, var_bd65c52e48385400, params) {
    var_ec235e528a1b6682 = int(min(params.var_232825c32e606ba4, var_bd65c52e48385400));
    var_88f52a15dfb77ad2 = getaiarrayinradius(start_point, params.var_4c24a7220d2d2d46);
    var_4e83f2f535a21158 = [];
    foreach (ai in var_88f52a15dfb77ad2) {
        if (istrue(ai function_9754219dda9b7840(params))) {
            continue;
        }
        var_4e83f2f535a21158 = array_add(var_4e83f2f535a21158, ai);
    }
    var_ec235e528a1b6682 = int(min(var_4e83f2f535a21158.size, var_ec235e528a1b6682));
    if (var_ec235e528a1b6682 == 0) {
        return 0;
    }
    var_4e83f2f535a21158 = sortbydistance(var_4e83f2f535a21158, start_point);
    for (i = 0; i < var_ec235e528a1b6682; i++) {
        level thread function_ba46a0d1e783a686(start_point, var_4e83f2f535a21158[i], params);
    }
    while (i > 0 && var_4e83f2f535a21158[i - 1] ai::function_f6347c9c410226d3()) {
        i--;
    }
    if (i == 0) {
        return;
    }
    var_224aee65a62dda42 = function_ae21b7c8d9bf419c(var_4e83f2f535a21158[i - 1]);
    var_bd65c52e48385400 = var_bd65c52e48385400 - var_ec235e528a1b6682;
    if (var_bd65c52e48385400 > 0) {
        level thread function_36230b878a401091(params.arc_travel_time + 0.1, var_224aee65a62dda42, var_bd65c52e48385400, params);
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x994
// Size: 0x3b
function function_36230b878a401091(waittime, start_point, var_bd65c52e48385400, params) {
    wait(waittime);
    level utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_expand", start_point, var_bd65c52e48385400, params);
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6
// Size: 0x37
function function_ae21b7c8d9bf419c(ai_target) {
    end_point = ai_target gettagorigin("J_SpineUpper", 1);
    if (!isdefined(end_point)) {
        end_point = ai_target.origin;
    }
    return end_point;
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa15
// Size: 0xe9
function function_ba46a0d1e783a686(start_point, ai_target, params) {
    end_point = function_ae21b7c8d9bf419c(ai_target);
    if (!isdefined(end_point)) {
        return;
    }
    var_d1624c8004bcaa3b = spawn_tag_origin(start_point);
    var_d1624c8004bcaa3b show();
    if (isdefined(params.var_cc8643dde5979643) && params.var_cc8643dde5979643 > 0) {
        var_9263c78bf54a1e69 = "tesla_bolt_pap";
    } else {
        var_9263c78bf54a1e69 = "tesla_bolt";
    }
    fx = playfxontag(level._effect[var_9263c78bf54a1e69], var_d1624c8004bcaa3b, "tag_origin");
    var_d1624c8004bcaa3b moveto(end_point, params.arc_travel_time);
    var_d1624c8004bcaa3b waittill("movedone");
    var_d1624c8004bcaa3b delete();
    if (isalive(ai_target)) {
        ai_target thread utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_stun_and_damage", 0, params);
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb05
// Size: 0xcc
function function_ca73f0d9e9cea887(duration) {
    level endon("game_ended");
    self endon("death");
    if (self.health > 0 && !namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        duration_ms = function_a5b14435e3229bed(duration);
        var_dce8146da743e9fa = gettime();
        self._blackboard.var_dc51d4ea36da3ae1 = var_dce8146da743e9fa;
        if (self asmhaspainstate(self.asmname)) {
            self asmevalpaintransition(self.asmname);
        }
        while (1) {
            time_now = gettime();
            if (time_now < var_dce8146da743e9fa + duration_ms) {
                self._blackboard.var_dc51d4ea36da3ae1 = time_now;
            } else {
                break;
            }
            wait(0.1);
        }
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbd8
// Size: 0x1f2
function private lc_stun_and_damage(var_6344ee17398456ea, params) {
    self endon("death");
    if (istrue(self.var_248e34cf15fbe400)) {
        return;
    }
    if (isdefined(params.var_795cf764ad7734f4)) {
        if (!self [[ params.var_795cf764ad7734f4 ]]()) {
            return;
        }
    } else if (ai::function_f6347c9c410226d3()) {
        lc_do_damage(params);
        if (!isdefined(self.var_f1e5e96a3bd34fd1)) {
            self.var_f1e5e96a3bd34fd1 = [];
        } else {
            self.var_f1e5e96a3bd34fd1 = function_6d6af8144a5131f1(self.var_f1e5e96a3bd34fd1, params.var_2ec028cae7b1cc0c);
        }
        return;
    }
    duration = function_53c4c53197386572(params.var_335349871f393012, 3) + (randomint(10) - 5) * 0.1;
    switch (self.type) {
    case #"hash_f695947f7a9ce23f":
        if (utility::issharedfuncdefined("zombie", "stunZombie")) {
            utility::function_f3bb4f4911a1beb2("zombie", "stunZombie", duration);
        }
        break;
    case #"hash_207629acc9a1e5a":
        thread function_ca73f0d9e9cea887(duration + 1);
        break;
    }
    self.var_248e34cf15fbe400 = 1;
    self.var_7cf353523b4c1663 = gettime() + function_a5b14435e3229bed(duration);
    self notify("zombie_lc_stunned");
    utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_play_stun_fx", var_6344ee17398456ea, params);
    if (isdefined(params.var_cc8643dde5979643) && params.var_cc8643dde5979643 > 0) {
        self.var_29a419c3cdeccf06 = 1;
        utility::function_3ab9164ef76940fd("shocked_lightning_chain", "shocked_on_paped");
    } else {
        self.var_29a419c3cdeccf06 = 0;
        utility::function_3ab9164ef76940fd("shocked_lightning_chain", "shocked_on");
    }
    thread function_1e814db14aa883bc(params, duration);
    wait(duration);
    self.var_248e34cf15fbe400 = 0;
    self.var_29a419c3cdeccf06 = 0;
    utility::function_3ab9164ef76940fd("shocked_lightning_chain", "shocked_off");
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd1
// Size: 0x64
function lc_do_damage(params) {
    var_3a87f89852f7a6a4 = utility::function_f3bb4f4911a1beb2("lightning_chain", "lc_damage_calculation", params);
    self dodamage(var_3a87f89852f7a6a4, self.origin, params.player, params.player, "MOD_ELEMENTAL_ELEC", params.weapon, "torso_upper");
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe3c
// Size: 0x42
function private lc_damage_calculation(params) {
    if (ai::function_f6347c9c410226d3()) {
        return level.var_b0d02607ac2c9ec[function_53c4c53197386572(params.var_cc8643dde5979643, 0)];
    } else {
        return (self.health + 100);
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe85
// Size: 0xab
function private function_1e814db14aa883bc(params, duration) {
    self endon("death");
    var_3a87f89852f7a6a4 = lc_damage_calculation(params);
    var_885efccb799e30cc = int(ceil(var_3a87f89852f7a6a4 / duration * 2));
    var_585785874daa275b = 0;
    while (var_585785874daa275b < duration + 1) {
        self dodamage(var_885efccb799e30cc, self.origin, params.player, params.player, "MOD_ELEMENTAL_ELEC", params.weapon, "torso_upper");
        wait(0.5);
        var_585785874daa275b = var_585785874daa275b + 0.1;
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf37
// Size: 0x187
function private lc_play_stun_fx(var_6344ee17398456ea, params) {
    if (isdefined(params.var_cc8643dde5979643) && params.var_cc8643dde5979643 > 0) {
        var_9188795b9c55b203 = 1;
    } else {
        var_9188795b9c55b203 = 0;
    }
    tag = "J_SpineUpper";
    if (var_9188795b9c55b203) {
        fx = "tesla_shock_pap";
    } else {
        fx = "tesla_shock";
    }
    if (istrue(var_6344ee17398456ea)) {
        if (var_9188795b9c55b203) {
            var_b8b4a5a567c222b1 = "tesla_shock_ground_pap";
        } else {
            var_b8b4a5a567c222b1 = "tesla_shock_ground";
        }
        playfxontag(level._effect[var_b8b4a5a567c222b1], self, "tag_origin");
    } else {
        fx = undefined;
    }
    if (isdefined(fx) && hastag(self.model, tag)) {
        playfxontag(level._effect[fx], self, tag);
    }
    if (istrue(params.var_c8046e4ee7289bb2) && isdefined(self.aicategory) && self.aicategory == "normal" && !istrue(self.head_gibbed)) {
        if (randomint(100) < params.head_gib_chance) {
            self.var_6315c8282142db0a = 1;
        } else if (self tagexists("J_Eyeball_LE")) {
            if (var_9188795b9c55b203) {
                var_c439e1ca5a6697a5 = "tesla_shock_eyes_pap";
            } else {
                var_c439e1ca5a6697a5 = "tesla_shock_eyes";
            }
            playfxontag(level._effect[var_c439e1ca5a6697a5], self, "J_Eyeball_LE");
        }
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10c5
// Size: 0x63
function private function_510d27a7b8d2bbcd(params) {
    if (params.idamage >= self.health && istrue(self.var_248e34cf15fbe400)) {
        self.health = int(params.idamage) + 2;
        if (!istrue(self.var_6cc1f9da4c747de)) {
            thread lc_wait_till_stun_end();
        }
    }
}

// Namespace lightning_chain/namespace_f64b54b5f003d870
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x112f
// Size: 0xcc
function private lc_wait_till_stun_end() {
    self notify("lc_wait_till_stun_end");
    self endon("lc_wait_till_stun_end");
    self endon("death");
    self.var_6cc1f9da4c747de = 1;
    while (istrue(self.var_248e34cf15fbe400)) {
        current_time = gettime();
        if (istrue(self.var_6315c8282142db0a) && !istrue(self.head_gibbed) && isdefined(self.var_7cf353523b4c1663) && self.var_7cf353523b4c1663 - current_time <= 500) {
            self.var_6315c8282142db0a = 0;
            if (utility::issharedfuncdefined("zombie_dismemberment", "dismemberHead")) {
                utility::function_f3bb4f4911a1beb2("zombie_dismemberment", "dismemberHead", 1);
            }
        }
        waitframe();
    }
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    self.var_6cc1f9da4c747de = 0;
}

