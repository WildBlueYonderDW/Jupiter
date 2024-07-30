#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\values.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_3badb8914eb5ac16;
#using script_7edf952f8921aa6b;
#using script_77be8cd2b6610d5;
#using scripts\asm\asm.gsc;
#using script_14fb718749afd7cf;
#using script_4c543f01345a2c04;
#using script_6270e40f05163497;
#using script_4947004a8b7efbdc;
#using script_76d74f5c3640ff80;
#using script_da0dce9d411d119;
#using script_6de180c937bb3129;
#using script_1d0491e474c9553c;
#using script_429c2a03090c1ea1;
#using script_371b4c2ab5861e62;

#namespace zombie_entity;

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ab
// Size: 0x26
function precache(params) {
    settings = function_cb7771bf461049eb(params);
    function_a53f4a78a75cbd41(params);
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5d9
// Size: 0x4b
function private function_1372e36a6ad0a766(params) {
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("killed_body_cloned", &function_92c6fa76cc65548f);
    callback::function_e7fddda1f0b46b5e(self.animsetname) callback::add("on_zombie_ai_damaged", &function_f60d15fbd257ffc5);
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62c
// Size: 0x130
function function_813f575ebec2810e(taskid) {
    assert(isdefined(self.zombieaisetting));
    function_7415ae9399ba8e75(self.zombieaisetting);
    assert(isdefined(self.zombieaisettings.var_e58a65b7a8f5973c));
    function_935d676c39ba68a3();
    callback::add("on_first_ai_init", &function_1372e36a6ad0a766);
    function_b5e57408c7878df7(&function_ea5fb4ade9e1f527);
    callback::add("on_ai_killed", &function_ade203ffe7b42a00);
    self forcenetfieldhighlod(1);
    self.var_256e6f5113f1d484 = self.zombieaisettings.var_e58a65b7a8f5973c.healthstatemodels;
    self.fnshouldplaypainanim = &function_76bf4ecde7d398cf;
    setdvar(@"hash_5ac1aab2783db731", 15000);
    setdvar(@"hash_5ac1a9b2783db4fe", 15000);
    setdvarifuninitialized(@"hash_52e1c16a2453da68", 0);
    function_a449d4ca4b975db5();
    thread function_ab8fa8a2c59b92c3();
    thread function_a552623c4db2acd7();
    thread function_ad2963f45580a1fe();
    thread function_424e5dab79ae37a6();
    thread function_d1b30a5bdb59508d();
    function_80a73d10d94ce693();
    return anim.success;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x765
// Size: 0x1cb
function private function_a449d4ca4b975db5() {
    self.entitydata = spawnstruct();
    self.entitydata.var_9adf21d0962a922b = 0;
    self.entitydata.var_1be563f374236c47 = 1;
    self.entitydata.phase = "spawn";
    self.entitydata.var_789ebd01f2585a11 = 0;
    self.entitydata.var_4195498e9121e409 = 0;
    self.entitydata.var_dcdfdb305b0c431c = [];
    self.phasedata = [];
    self.entitydata.var_37e9fcfa2a8f6a31 = gettime() + 2000;
    self.entitydata.var_f17581d76b08d302 = gettime() + 2000;
    self function_3e89eb3d8e3f1811("in_beam_attack", 0);
    self function_3e89eb3d8e3f1811("in_spawn", 0);
    self function_3e89eb3d8e3f1811("in_lightning_strike", 0);
    self function_3e89eb3d8e3f1811("in_teleport", 0);
    asm_setmoveplaybackrate(1);
    self.allowstrafe = 0;
    self.var_e23d72f180832aa = 1;
    self animmode("nogravity");
    ent_flag_init("entity_activate");
    ent_flag_init("entity_spawnanim_finished");
    ent_flag_init("entity_ready_for_lightbomb");
    ent_flag_init("entity_vulnerable");
    ent_flag_init("entity_not_vulnerable");
    ent_flag_set("entity_vulnerable");
    self notify("entity_vulnerable");
    ent_flag_init("beam_attack_vo");
    ent_flag_init("lightning_strike_vo");
    ent_flag_init("lightning_strike_ultimate_vo");
    ent_flag_init("strike_lightning");
    ent_flag_init("weakpoints_activate");
    function_b6851d5768e9130c();
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x938
// Size: 0x2e
function private function_ade203ffe7b42a00(params) {
    self.entitydata.var_7ea8679820315f67 = 0;
    function_a57246fc382ab57a();
    function_4f3f24a1ec972b0e();
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x96e
// Size: 0x53
function private function_92c6fa76cc65548f(params) {
    body = function_d8853db47f5b98e4(params);
    if (isdefined(body)) {
        body.origin = self.origin;
        wait 2.5;
        body = function_d8853db47f5b98e4(params);
        if (isdefined(body)) {
            body delete();
        }
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x9c9
// Size: 0x22e
function private function_f60d15fbd257ffc5(params) {
    if (istrue(self.entitydata.var_7ea8679820315f67)) {
        return;
    }
    if (istrue(self.var_4919d15787f01154)) {
        health = self.fake_health;
        maxhealth = self.max_fake_health;
        damage = 0;
        if (isdefined(params.var_b5c36875d3a4559c)) {
            damage = params.var_b5c36875d3a4559c;
        }
        if (damage > 0) {
            params.eattacker updateDamageFeedback_SharedFunc("hitarmor");
        }
    } else {
        health = self.health;
        maxhealth = self.maxhealth;
        damage = params.idamage;
    }
    if (damage > 0) {
        if (self.entitydata.var_9adf21d0962a922b != 1 && (!isdefined(self.entitydata.var_8e3c8aea64b0ff9a) || self.entitydata.var_8e3c8aea64b0ff9a != 1) && isdefined(self.var_e198ad98b4845f29)) {
            if (function_6b2e9906966d1148()) {
                potentialhealth = health - params.idamage;
                if (potentialhealth / maxhealth * 100 <= self.var_e198ad98b4845f29.var_184af0c1a8b292d2.var_de9f9409d3c691eb) {
                } else if ((self.var_e198ad98b4845f29.var_c9a5e91aaf4191d5 - potentialhealth) / self.maxhealth * 100 > self.var_e198ad98b4845f29.var_184af0c1a8b292d2.var_de9f9409d3c691eb) {
                    self.entitydata.var_8e3c8aea64b0ff9a = 1;
                    self.var_e198ad98b4845f29.reason = "damage";
                }
            }
        }
        self notify("damaged_recently");
    }
    if (istrue(self.var_4919d15787f01154)) {
        newhealth = self.fake_health - damage;
        self.fake_health = max(newhealth, 0);
        if (self.fake_health <= 0) {
            thread function_38215c6a48943458();
        }
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbff
// Size: 0x7a
function private function_ea5fb4ade9e1f527(params) {
    if (istrue(self.entitydata.var_7ea8679820315f67)) {
        return 0;
    }
    damage_taken = function_7a92abaf9289a974(params);
    if (damage_taken > 0) {
        if (getdvarint(@"hash_52e1c16a2453da68", 0) > 0) {
            damage_taken = self.maxhealth;
        }
    }
    if (istrue(self.var_4919d15787f01154)) {
        params.var_b5c36875d3a4559c = damage_taken;
        damage_taken = 0;
    }
    return damage_taken;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc82
// Size: 0x3
function function_a8c9248308033e4e() {
    return false;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xc8e
// Size: 0x8e
function private function_38215c6a48943458() {
    level endon("game_ended");
    self endon("death");
    self notify("Entity_Death_Starting");
    function_7410aa3c82ab4773();
    function_a57246fc382ab57a();
    self.entitydata.var_7ea8679820315f67 = 1;
    self visiblenotsolid();
    deathalias = "death" + "_" + self.entitydata.phase;
    if (asm_hasalias("animscripted", deathalias)) {
        animscripted_single(deathalias);
    }
    namespace_14d36171baccf528::function_7056963336f2bbec(1);
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd24
// Size: 0x84
function private function_80a73d10d94ce693() {
    foreach (player in level.players) {
        player callback::add("player_death", &function_1eb52fc1d7ca226a);
        player callback::add("exfil_success", &function_1eb52fc1d7ca226a);
        player callback::add("player_disconnect", &function_1eb52fc1d7ca226a);
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xdb0
// Size: 0x84
function private function_4f3f24a1ec972b0e() {
    foreach (player in level.players) {
        player callback::remove("player_death", &function_1eb52fc1d7ca226a);
        player callback::remove("exfil_success", &function_1eb52fc1d7ca226a);
        player callback::remove("player_disconnect", &function_1eb52fc1d7ca226a);
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe3c
// Size: 0xe2
function private function_ad2963f45580a1fe() {
    self endon("death");
    scripts\engine\utility::flag_wait("scriptables_ready");
    waitframe();
    utility::function_3ab9164ef76940fd("base", "base_on");
    utility::function_3ab9164ef76940fd("head", "normal");
    utility::function_3ab9164ef76940fd("palm", "off");
    utility::function_3ab9164ef76940fd("reactive_miscellaneous", "off");
    utility::function_3ab9164ef76940fd("VFX_Ambient_Black_Body_Smoke", "on");
    utility::function_3677f2be30fdd581("heart_weakpoint", "off");
    utility::function_3677f2be30fdd581("l_hand_weakpoint", "off");
    utility::function_3677f2be30fdd581("r_hand_weakpoint", "off");
    utility::function_3677f2be30fdd581("l_hip_weakpoint", "off");
    utility::function_3677f2be30fdd581("r_hip_weakpoint", "off");
    utility::function_3677f2be30fdd581("l_shoulder_weakpoint", "off");
    utility::function_3677f2be30fdd581("r_shoulder_weakpoint", "off");
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf26
// Size: 0x4e
function private function_a552623c4db2acd7() {
    self endon("death");
    self function_3e89eb3d8e3f1811("spawning", 1);
    val::set("spawn_fade_in", "damage", 0);
    ent_flag_wait("entity_spawnanim_finished");
    self function_3e89eb3d8e3f1811("spawning", 0);
    val::reset_all("spawn_fade_in");
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf7c
// Size: 0x6a
function private function_424e5dab79ae37a6() {
    self endon("death");
    level endon("game_ended");
    ent_flag_wait("entity_activate");
    function_b6851d5768e9130c(level.var_36e0429c9cc73b40);
    function_ba2c543e29fc803b();
    function_ae4bc364d68e0605();
    while (true) {
        if (self function_11e2d4051ea44b35("in_spawn") == 1) {
            ent_flag_set("entity_spawnanim_finished");
            break;
        }
        waitframe();
    }
    function_80e7f3c380360a74();
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfee
// Size: 0x17
function private function_208cd900e7da1bff() {
    function_b6851d5768e9130c(2);
    ent_flag_set("weakpoints_activate");
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x100d
// Size: 0xfd
function private function_b6851d5768e9130c(index) {
    self.entitydata.var_e23aa94ccc06e88f = self.entitydata.phaseindex;
    if (!isdefined(index)) {
        index = 0;
    }
    self.entitydata.phaseindex = index;
    switch (index) {
    case 0: 
        self.entitydata.phase = "phase1";
        break;
    case 1: 
        self.entitydata.phase = "phase2";
        break;
    case 2: 
        self.entitydata.phase = "phase2vul";
        break;
    default: 
        break;
    }
    if (isdefined(self.entitydata.var_e23aa94ccc06e88f)) {
        function_d8565ebf3d8932bc();
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1112
// Size: 0x12e
function private function_ba2c543e29fc803b() {
    assert(isdefined(self.entitydata.phaseindex));
    healthscriptbundle = self.phasedata[self.entitydata.phaseindex].healthscriptbundle;
    if (isdefined(healthscriptbundle)) {
        newmaxhealth = function_2611d163b331ae1d(healthscriptbundle, self.difficulty_round);
        if (isdefined(newmaxhealth) && newmaxhealth > 0) {
            scripts\common\ai::function_dd21d67ede8ba22(newmaxhealth);
            self.health = self.maxhealth;
        }
    }
    health_override = getdvarint(@"hash_8b06b42c36f1675a", 0);
    if (health_override > 0) {
        if (health_override >= 100) {
            self.maxhealth = health_override;
            self.health = health_override;
        } else {
            self.maxhealth = 1000;
            self.health = 1000;
        }
    }
    if (getdvarint(@"hash_ef4e23a85aecf083", 1)) {
        self.max_fake_health = self.maxhealth;
        self.fake_health = self.health;
        self.var_4919d15787f01154 = 1;
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1248
// Size: 0x8d
function function_eee3707179af0e1e(taskid, params) {
    assert(isdefined(self.entitydata.var_9adf21d0962a922b));
    switch (self.entitydata.var_9adf21d0962a922b) {
    case 1: 
        return "Entity_Teleport";
    case 2: 
        return "Entity_Attack";
    case 0:
    default: 
        return "Entity_Idle";
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12dd
// Size: 0x7b
function function_14b1a33f3c95f126(taskid, params) {
    assert(isdefined(self.entitydata.var_1be563f374236c47));
    switch (self.entitydata.var_1be563f374236c47) {
    case 0: 
        return "Entity_LightningStrike";
    case 1:
    default: 
        return "Entity_BeamAttack";
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1360
// Size: 0x23
function function_c0ebac5114260600(taskid, params) {
    function_6c621f76da4082c4();
    return anim.success;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x138c
// Size: 0x14e
function function_6c621f76da4082c4() {
    if (self.entitydata.phase == "spawn" || self function_11e2d4051ea44b35("in_spawn") == 0) {
        self.entitydata.var_37e9fcfa2a8f6a31 = gettime() + 2000;
        self.entitydata.var_f17581d76b08d302 = gettime() + 2000;
        return;
    }
    if (isdefined(self.entitydata.var_8e3c8aea64b0ff9a)) {
        switch (self.entitydata.var_8e3c8aea64b0ff9a) {
        case 1: 
            function_51af81c1aecc2e12();
            break;
        case 2: 
            function_9559ab46ef578e02();
            break;
        default: 
            break;
        }
        self.entitydata.var_8e3c8aea64b0ff9a = undefined;
        return;
    }
    function_faea99d818a8153b();
    if (function_6ead0d3f38711d70()) {
        self.entitydata.var_8e3c8aea64b0ff9a = 1;
        self.var_e198ad98b4845f29.reason = "cooldown";
        return;
    }
    if (function_4781e74511be107()) {
        self.entitydata.var_8e3c8aea64b0ff9a = 2;
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x14e2
// Size: 0xc7
function private function_4781e74511be107() {
    currenttime = gettime();
    if (getdvarint(@"hash_7765693228300a03", 0)) {
        return false;
    }
    if (isdefined(self.entitydata.var_8e3c8aea64b0ff9a) && self.entitydata.var_8e3c8aea64b0ff9a != 2) {
        return false;
    }
    if (isdefined(self.entitydata.var_1205963be798c1e3) && currenttime - self.entitydata.var_1205963be798c1e3 <= 2000) {
        return false;
    }
    if (currenttime > self.entitydata.var_37e9fcfa2a8f6a31) {
        return true;
    }
    if (currenttime > self.entitydata.var_f17581d76b08d302) {
        return true;
    }
    return false;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15b2
// Size: 0x147
function private function_9559ab46ef578e02() {
    if (!function_4781e74511be107()) {
        return false;
    }
    forcedstate = getdvar(@"hash_8c559f76d73ee6fb", "disabled");
    if (forcedstate == "disabled") {
        var_e94e67a354c63388 = function_43b5ce0cd4e8eec7();
        var_803cd82a9c2a736f = function_f161073ebaf14fec();
        var_b31135d1402eca12 = [];
        var_b31135d1402eca12[var_b31135d1402eca12.size] = 1;
        var_b31135d1402eca12[var_b31135d1402eca12.size] = 0;
        weights = [];
        weights[weights.size] = var_e94e67a354c63388 * 100;
        weights[weights.size] = var_803cd82a9c2a736f * 100;
        var_21e7f83a51e08f01 = random_weighted(var_b31135d1402eca12, weights);
        if (!isdefined(var_21e7f83a51e08f01)) {
            return false;
        }
        self.entitydata.var_9adf21d0962a922b = 2;
        self.entitydata.var_1be563f374236c47 = var_21e7f83a51e08f01;
    } else if (forcedstate == "lightning") {
        self.entitydata.var_9adf21d0962a922b = 2;
        self.entitydata.var_1be563f374236c47 = 0;
    } else if (forcedstate == "beam") {
        self.entitydata.var_9adf21d0962a922b = 2;
        self.entitydata.var_1be563f374236c47 = 1;
    } else {
        return false;
    }
    return true;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1702
// Size: 0x65
function private function_f52965bd9b20483b() {
    settings = self.var_a3d0ad660af72d52.var_b33910d3fd7718b1[self.entitydata.phaseindex];
    if (settings.disabled) {
        return false;
    }
    if (gettime() < self.entitydata.var_37e9fcfa2a8f6a31) {
        return false;
    }
    return true;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1770
// Size: 0x8d
function private function_43b5ce0cd4e8eec7() {
    if (!function_f52965bd9b20483b()) {
        return 0;
    }
    score = 0;
    centroid = function_58a28552bd8a726();
    if (!isdefined(centroid)) {
        return 0;
    }
    var_e1c153c48714127b = distance(centroid, self.origin);
    if (var_e1c153c48714127b >= self.var_c3cf0abdb853a4f9.var_9540d52e669b0713) {
        score += 10;
    } else {
        score += int(var_e1c153c48714127b * 10 / self.var_c3cf0abdb853a4f9.var_9540d52e669b0713);
    }
    return score;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1806
// Size: 0x80
function private function_c4fe9396d108f764() {
    settings = self.var_730fcb57528054fb.phase[self.entitydata.phaseindex];
    if (settings.disabled) {
        return false;
    }
    if (gettime() < self.entitydata.var_f17581d76b08d302) {
        return false;
    }
    if (self.entitydata.var_dcdfdb305b0c431c.size == 0) {
        return false;
    }
    return true;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x188f
// Size: 0xdf
function private function_f161073ebaf14fec() {
    if (!function_c4fe9396d108f764()) {
        return 0;
    }
    score = 0;
    closestplayer = function_370e89cf65df0b01();
    if (!isdefined(closestplayer)) {
        return 0;
    }
    if (distancesquared(closestplayer.origin, self.origin) <= squared(self.var_c3cf0abdb853a4f9.var_ea825821af5f56f1)) {
        score += 10;
    }
    centroid = function_58a28552bd8a726();
    if (!isdefined(centroid)) {
        return 0;
    }
    var_e1c153c48714127b = distance(centroid, self.origin);
    if (var_e1c153c48714127b <= self.var_c3cf0abdb853a4f9.var_9540d52e669b0713) {
        score += 10;
    } else {
        score += int(self.var_c3cf0abdb853a4f9.var_9540d52e669b0713 * 10 / var_e1c153c48714127b);
    }
    return score;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1977
// Size: 0x6a
function private function_76bf4ecde7d398cf() {
    assert(isdefined(self.entitydata.var_4195498e9121e409));
    assert(isdefined(self.entitydata.var_789ebd01f2585a11));
    if (self.entitydata.var_4195498e9121e409 > self.entitydata.var_789ebd01f2585a11) {
        return true;
    }
    return false;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19ea
// Size: 0x6f
function function_837df9b0b5a7b55c(taskid, params) {
    if (self.entitydata.var_4195498e9121e409 > self.entitydata.var_789ebd01f2585a11) {
        if (self.entitydata.var_9adf21d0962a922b != 0) {
            function_a57246fc382ab57a();
        }
        return anim.success;
    }
    return anim.failure;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1a62
// Size: 0xd4
function private function_c6e6b038af956555(damage) {
    potentialhealth = self.health - damage;
    healthpercentage = potentialhealth / self.maxhealth * 100;
    if (healthpercentage <= 0) {
        return false;
    }
    if (healthpercentage <= self.var_31a8be167672493a.var_3c0930bfc4705ac3) {
        self.entitydata.var_4195498e9121e409 = 3;
    } else if (healthpercentage <= self.var_31a8be167672493a.var_1407b1c49c260053) {
        self.entitydata.var_4195498e9121e409 = 2;
    } else if (healthpercentage <= self.var_31a8be167672493a.var_e69261597a83bfc0) {
        self.entitydata.var_4195498e9121e409 = 1;
    }
    return true;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3f
// Size: 0x1ec
function function_faea99d818a8153b() {
    if (getdvarint(@"hash_b807d15804e2e6c3", 0)) {
        if (self.entitydata.phase != "phase2vul") {
            self.entitydata.var_a70be298f40abc72 = 1;
            function_208cd900e7da1bff();
        }
        return;
    } else if (istrue(self.entitydata.var_a70be298f40abc72)) {
        function_b6851d5768e9130c(self.entitydata.var_e23aa94ccc06e88f);
        self.entitydata.var_a70be298f40abc72 = undefined;
    }
    if (self.entitydata.phase != "phase2vul") {
        if (!istrue(self.var_898e7a18e3c1354c.var_4127b260b9dcd21d)) {
            settings = function_c1ed91aedcab4bf5();
            if (settings.benabled) {
                var_e4fcde0d5862f55b = self.var_898e7a18e3c1354c.var_4e598e1797c70ad1 >= settings.var_a09d213a675c2bab;
                if (var_e4fcde0d5862f55b) {
                    self.var_e198ad98b4845f29.var_a478985793711972 = 1;
                    if (settings.var_3388296f048ada35) {
                        self.var_898e7a18e3c1354c.var_4127b260b9dcd21d = 1;
                        thread Entity_Vulnerability_FlagWatcher();
                    } else {
                        function_f40c1634cd048cda(3);
                        function_208cd900e7da1bff();
                    }
                }
            }
        }
        return;
    }
    if (self.phasedata[self.entitydata.phaseindex].var_43e413695b603f76 > 0 || !function_d892eaf3090c1d8e()) {
        self.entitydata.var_8e3c8aea64b0ff9a = 1;
        self.var_e198ad98b4845f29.reason = "cooldown";
        function_b6851d5768e9130c(self.entitydata.var_e23aa94ccc06e88f);
    }
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d33
// Size: 0x68
function Entity_Vulnerability_FlagWatcher() {
    level endon("game_ended");
    self endon("death");
    self notify("Entity_Vulnerability_FlagWatcher");
    self endon("Entity_Vulnerability_FlagWatcher");
    ent_flag_set("entity_ready_for_lightbomb");
    ent_flag_wait("entity_vulnerable");
    ent_flag_clear("entity_ready_for_lightbomb");
    function_f40c1634cd048cda(3);
    function_208cd900e7da1bff();
    self.var_898e7a18e3c1354c.var_4127b260b9dcd21d = 0;
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da3
// Size: 0x76
function function_d26fb1d7aab7d7d1() {
    self.var_898e7a18e3c1354c.var_4e598e1797c70ad1 = 0;
    if (self.entitydata.phase == "phase2") {
        ent_flag_clear("entity_vulnerable");
        ent_flag_set("entity_not_vulnerable");
        self notify("entity_invulnerable");
        return;
    }
    ent_flag_clear("entity_not_vulnerable");
    ent_flag_set("entity_vulnerable");
    self notify("entity_vulnerable");
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1e21
// Size: 0x29
function private function_c1ed91aedcab4bf5() {
    return self.var_898e7a18e3c1354c.phase[self.entitydata.phaseindex];
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1e53
// Size: 0x19
function private function_a57246fc382ab57a() {
    function_6b4f9e89f81383ea();
    function_4627f093a696bf5f(1);
    function_a497421f5acb0816();
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1e74
// Size: 0x12
function private function_1eb52fc1d7ca226a(params) {
    function_e72c887ec81b95a7();
}

// Namespace zombie_entity / namespace_39c7d29122ccedd3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1e8e
// Size: 0x4e
function private function_d8565ebf3d8932bc() {
    function_a57246fc382ab57a();
    function_d26fb1d7aab7d7d1();
    self.phasedata[self.entitydata.phaseindex].var_43e413695b603f76 = 0;
    self.var_e198ad98b4845f29.var_a478985793711972 = 0;
}

