#using script_4c543f01345a2c04;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_686729055b66c6e4;
#using script_a35012b9b75a996;

#namespace namespace_77480c5ad1d5553d;

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43b
// Size: 0xd7
function function_62b558b5d9acd974(taskid, params) {
    settings = function_5c5588646fd6ea24();
    if (self.entitydata.var_dcdfdb305b0c431c.size == 0 || settings.numlocations == 0) {
        function_4627f093a696bf5f(1);
        return anim.failure;
    }
    self function_3e89eb3d8e3f1811("in_lightning_strike", 1);
    self.var_730fcb57528054fb.starttime = gettime();
    if (!isdefined(self.var_730fcb57528054fb.var_c785f8f0a57bd3a9)) {
        self.var_730fcb57528054fb.var_c785f8f0a57bd3a9 = 0;
    }
    self.var_730fcb57528054fb.state = "start";
    return anim.success;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x51b
// Size: 0x1f4
function function_b2c69230002d223d(taskid, params) {
    settings = function_5c5588646fd6ea24();
    assert(self.entitydata.var_dcdfdb305b0c431c.size > 0);
    switch (settings.type) {
    case #"hash_6a36c93f02d6ebea": 
        self.var_730fcb57528054fb.var_604a388e9ca055ae = array_sort_with_func(self.entitydata.var_dcdfdb305b0c431c, &function_2623d68bf8490daf);
        break;
    case #"hash_41c7b70dbd510829": 
        self.var_730fcb57528054fb.var_604a388e9ca055ae = namespace_7d1d1a833a0da9d8::function_276a136594f3f693();
        if (self.var_730fcb57528054fb.var_604a388e9ca055ae.size < settings.numlocations) {
            var_83e10e4993c28a09 = array_randomize(self.entitydata.var_dcdfdb305b0c431c);
            index = 0;
            while (self.var_730fcb57528054fb.var_604a388e9ca055ae.size < settings.numlocations) {
                island = self.entitydata.var_dcdfdb305b0c431c[index];
                index++;
                if (!arraycontains(self.var_730fcb57528054fb.var_604a388e9ca055ae, island)) {
                    self.var_730fcb57528054fb.var_604a388e9ca055ae[self.var_730fcb57528054fb.var_604a388e9ca055ae.size] = island;
                }
            }
        }
        break;
    case #"hash_d950ebd1da4d0aa2":
    default: 
        var_83e10e4993c28a09 = array_randomize(self.entitydata.var_dcdfdb305b0c431c);
        self.var_730fcb57528054fb.var_604a388e9ca055ae = var_83e10e4993c28a09;
        break;
    }
    return anim.success;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x718
// Size: 0x459
function function_aebbe83f2fdc628(taskid, params) {
    settings = function_5c5588646fd6ea24();
    if (self function_11e2d4051ea44b35("in_lightning_strike") < 2) {
        return anim.running;
    }
    if (settings.numlocations == 0) {
        function_4627f093a696bf5f(1);
        return anim.success;
    }
    switch (self.var_730fcb57528054fb.state) {
    case #"hash_c6514c88e37149bf": 
        currenttime = gettime();
        if (!isdefined(self.var_730fcb57528054fb.var_1ee9d9d3881cb95e) || self.var_730fcb57528054fb.var_1ee9d9d3881cb95e + settings.var_700e02b386c08562 < currenttime) {
            self.var_730fcb57528054fb.var_1ee9d9d3881cb95e = currenttime;
            self.var_730fcb57528054fb.state = "charge";
            if (self.entitydata.phase == "phase2vul") {
                ent_flag_set("lightning_strike_ultimate_vo");
            } else {
                ent_flag_set("lightning_strike_vo");
            }
        }
        return anim.running;
    case #"hash_170b14ddee806d1": 
        assert(isdefined(self.var_730fcb57528054fb.var_604a388e9ca055ae) && self.var_730fcb57528054fb.var_604a388e9ca055ae.size > 0);
        if (!istrue(self.var_730fcb57528054fb.charging)) {
            function_f8e6f278dff1cd3f(self.var_730fcb57528054fb.var_604a388e9ca055ae);
            delaythread(settings.chargetime * 0.67 / 1000, &function_3dc41a713eedb5b1);
        }
        function_45a8518f6516735a();
        if (gettime() > self.var_730fcb57528054fb.var_1ee9d9d3881cb95e + settings.chargetime) {
            self.var_730fcb57528054fb.charging = 0;
            self.var_730fcb57528054fb.state = "pre-strike";
            self function_3e89eb3d8e3f1811("in_lightning_strike", 3);
            thread function_9f4da47d06d52394();
        }
        return anim.running;
    case #"hash_bc43085a8adecc3b": 
        if (ent_flag("strike_lightning")) {
            self.var_730fcb57528054fb.state = "strike";
            self notify("lightning_charge_end");
        }
        return anim.running;
    case #"hash_2ab24ece3b5380af": 
        index = 0;
        foreach (island in self.var_730fcb57528054fb.var_604a388e9ca055ae) {
            if (isdefined(island.var_e98ecb0e8f990265)) {
                foreach (var_e2acb53fb28f1400 in island.var_e98ecb0e8f990265) {
                    delaythread(0.1 * index, &function_c21d148c9c79271a, var_e2acb53fb28f1400);
                }
            } else {
                delaythread(0.1 * index, &function_c21d148c9c79271a, island);
            }
            index++;
        }
        self.var_730fcb57528054fb.var_c785f8f0a57bd3a9++;
        self.var_730fcb57528054fb.state = "complete";
        return anim.running;
    case #"hash_46ae47a56ec251e2": 
        self notify("lightning_charge_end");
        self notify("lightning_attack_end");
        ent_flag_clear("strike_lightning");
        if (self.var_730fcb57528054fb.var_c785f8f0a57bd3a9 >= settings.numstrikes) {
            function_4627f093a696bf5f(1);
            self.phasedata[self.entitydata.phaseindex].var_43e413695b603f76++;
        }
        return anim.success;
    }
    return anim.failure;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb7a
// Size: 0xe3
function function_4627f093a696bf5f(var_cd49914bf215b4f3) {
    self notify("lightning_charge_end");
    self notify("lightning_attack_end");
    self.var_730fcb57528054fb.var_c785f8f0a57bd3a9 = undefined;
    self.var_730fcb57528054fb.var_1ee9d9d3881cb95e = undefined;
    function_3a6476427404e5db();
    ent_flag_clear("lightning_strike_ultimate_vo");
    ent_flag_clear("lightning_strike_vo");
    ent_flag_clear("strike_lightning");
    if (istrue(var_cd49914bf215b4f3)) {
        settings = function_5c5588646fd6ea24();
        self.entitydata.var_f17581d76b08d302 = gettime() + settings.cooldown;
    }
    self.entitydata.var_1205963be798c1e3 = gettime();
    self function_3e89eb3d8e3f1811("in_lightning_strike", 0);
    self.entitydata.var_9adf21d0962a922b = 0;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc65
// Size: 0xef
function private function_f8e6f278dff1cd3f(var_ae5c9952fc39b03e) {
    settings = function_5c5588646fd6ea24();
    for (index = 0; index < settings.numlocations; index++) {
        island = var_ae5c9952fc39b03e[index];
        if (!isdefined(island)) {
            continue;
        }
        if (isdefined(island.var_e98ecb0e8f990265)) {
            foreach (var_e2acb53fb28f1400 in island.var_e98ecb0e8f990265) {
                delaythread(0.1 * index, &function_abb0f1f6d1d61ec2, var_e2acb53fb28f1400);
            }
            continue;
        }
        delaythread(0.1 * index, &function_abb0f1f6d1d61ec2, island);
    }
    self.var_730fcb57528054fb.charging = 1;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xd5c
// Size: 0xd8
function private function_abb0f1f6d1d61ec2(island) {
    self endon("death");
    level endon("game_ended");
    self endon("lightning_attack_end");
    self endon("lightning_charge_end");
    var_e935bc41ae8e04da = utility::spawn_model("tag_origin", island.origin);
    upvector = anglestoup(island.angles);
    testangles = vectortoangles(upvector);
    var_e935bc41ae8e04da rotateto(testangles, 0.05);
    thread function_5ee1730c2e122134(var_e935bc41ae8e04da, "lightning_charge_end");
    var_d705a4ae90ec3f37 = spawnfx(getfx("entity_lightning_charge_vfx"), island.origin, upvector);
    if (isdefined(var_d705a4ae90ec3f37)) {
        triggerfx(var_d705a4ae90ec3f37);
        var_d705a4ae90ec3f37 function_cea710f9d017694a(1);
        thread function_5ee1730c2e122134(var_d705a4ae90ec3f37, "lightning_charge_end");
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe3c
// Size: 0x147
function private function_45a8518f6516735a() {
    assert(isdefined(self.var_730fcb57528054fb.var_604a388e9ca055ae) && self.var_730fcb57528054fb.var_604a388e9ca055ae.size > 0);
    foreach (player in level.players) {
        var_d02ecf5a44aceba4 = 0;
        foreach (island in self.var_730fcb57528054fb.var_604a388e9ca055ae) {
            if (distancesquared(player.origin, island.origin) <= squared(island.radius)) {
                var_d02ecf5a44aceba4 = 1;
                break;
            }
        }
        if (var_d02ecf5a44aceba4) {
            player function_3ab9164ef76940fd("zombieEntityVFX", "lightning_strike_target");
            continue;
        }
        player function_3ab9164ef76940fd("zombieEntityVFX", "off");
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf8b
// Size: 0x60
function private function_3a6476427404e5db() {
    foreach (player in level.players) {
        player function_3ab9164ef76940fd("zombieEntityVFX", "off");
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xff3
// Size: 0x40
function private function_9f4da47d06d52394() {
    self notify("Entity_LightningStrike_Notify");
    self endon("Entity_LightningStrike_Notify");
    self endon("death");
    level endon("game_ended");
    self endon("lightning_attack_end");
    waittill_any_timeout_1(5, "strike_lightning");
    ent_flag_set("strike_lightning");
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x103b
// Size: 0x337
function private function_c21d148c9c79271a(island) {
    self endon("death");
    level endon("game_ended");
    function_3d8d8ad244283e65(#"hash_a919cccd58ef4626");
    settings = function_5c5588646fd6ea24();
    function_3a6476427404e5db();
    lightningpos = getrandomnavpoint(island.origin, 100);
    if (!isdefined(lightningpos)) {
        lightningpos = island.origin;
    }
    upvector = anglestoup(island.angles);
    var_85d4a0106b97123b = lightningpos + upvector * 2000;
    var_d9e80a671452617f = function_3b3825d7947867dd(getfx("entity_lightning_vfx"), var_85d4a0106b97123b, island.angles, lightningpos);
    playfx(getfx("entity_lightning_impact_vfx"), lightningpos);
    var_d9e80a671452617f thread function_10e846e7342fdb9c();
    if (function_a794fcf9545f2062()) {
        var_21fe9a8469d10e30 = function_b1eef70090b5b7b5(island.origin, island.radius, function_869ccb4e3451b8c6(["etype_ai", "etype_player"]), [], undefined);
        foreach (ent in var_21fe9a8469d10e30) {
            if (!isdefined(ent) || !isalive(ent) || istrue(ent.inlaststand)) {
                continue;
            }
            if (abs(ent.origin[2] - island.origin[2]) > settings.var_253536622d01ef2) {
                continue;
            }
            if (isplayer(ent)) {
                thread function_9814e47ea151e81e(ent);
                continue;
            }
            if (isagent(ent)) {
                if (ent.team == "team_two_hundred") {
                    thread function_36a6540fa9846b45(ent);
                }
            }
        }
    } else {
        nearbyplayers = getplayersinradius(island.origin, island.radius);
        foreach (player in nearbyplayers) {
            if (!isdefined(player) || !isalive(player) || istrue(player.inlaststand)) {
                continue;
            }
            thread function_9814e47ea151e81e(player);
        }
        nearbyzombies = getaiarrayinradius(island.origin, island.radius, "team_two_hundred");
        foreach (zombie in nearbyzombies) {
            if (!isdefined(zombie) || !isalive(zombie) || zombie == self) {
                continue;
            }
            thread function_36a6540fa9846b45(zombie);
        }
    }
    function_7f3923ed3d66f8ad();
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x137a
// Size: 0x13
function private function_10e846e7342fdb9c() {
    level endon("game_ended");
    wait 1;
    self delete();
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1395
// Size: 0x8c
function private Entity_Lightning_Strike_Tick_Damage(attacker, damage, ticktime, var_3a534a5beabefc87) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    attacker endon("death");
    self notify("Entity_Lightning_Strike_Tick_Damage");
    self endon("Entity_Lightning_Strike_Tick_Damage");
    currenttime = gettime();
    duration = currenttime + var_3a534a5beabefc87;
    while (duration >= gettime()) {
        self dodamage(damage, self.origin, attacker, attacker, "MOD_ELEMENTAL_ELEC");
        wait ticktime;
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1429
// Size: 0x12b
function private function_36a6540fa9846b45(zombie) {
    zombie endon("death");
    level endon("game_ended");
    settings = function_5c5588646fd6ea24();
    switch (settings.var_8992397197cec28a.type) {
    case #"hash_db714df2b8d2b246": 
        zombie utility::ent_flag_set("plasma_death");
        zombie kill(zombie.origin, self, self, "MOD_ELEMENTAL_ELEC");
        break;
    case #"hash_6a33c20e7b932184": 
        damage = zombie function_edc862d215e240f7();
        zombie function_a1796aa213a341b0(1);
        zombie dodamage(damage, zombie.origin, self, self, "MOD_ELEMENTAL_ELEC");
        break;
    case #"hash_bd41d5cc80144cb5": 
        damage = zombie function_edc862d215e240f7();
        zombie thread Entity_Lightning_Strike_Tick_Damage(self, damage, settings.var_8992397197cec28a.var_364c8f94aa59c799, settings.var_8992397197cec28a.var_c3d2c88493cb29b9);
        zombie function_a1796aa213a341b0(settings.var_8992397197cec28a.var_c3d2c88493cb29b9);
        break;
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x155c
// Size: 0x51
function private function_a1796aa213a341b0(duration) {
    namespace_ed7c38f3847343dc::function_2e4d3c67e63f83ac(duration);
    self setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    wait duration;
    if (isalive(self) && self getscriptablehaspart("shockStickVfx")) {
        self setscriptablepartstate("shockStickVfx", "off", 0);
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x15b5
// Size: 0xc4
function private function_edc862d215e240f7() {
    settings = function_5c5588646fd6ea24();
    damage = settings.var_8992397197cec28a.var_ef90ab33a3185784;
    if (is_equal(self.subclass, "zombie_hellhound_pet")) {
        damage = settings.var_8992397197cec28a.var_9f0ac38c596f3dc9;
    } else if (is_equal(self.aicategory, "special")) {
        damage = settings.var_8992397197cec28a.var_94fc2dd9f615fc2d;
    } else if (is_equal(self.aicategory, "elite")) {
        damage = settings.var_8992397197cec28a.var_970a23e2ff759401;
    }
    return damage;
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1682
// Size: 0x14b
function private function_9814e47ea151e81e(player) {
    self endon("death");
    player endon("death_or_disconnect");
    level endon("game_ended");
    settings = function_5c5588646fd6ea24();
    switch (settings.var_8992397197cec28a.type) {
    case #"hash_db714df2b8d2b246": 
        player dodamage(player.maxarmorhealth + player.maxhealth, player.origin, self, self, "MOD_ELEMENTAL_ELEC");
        break;
    case #"hash_bd41d5cc80144cb5": 
        damage = settings.var_8992397197cec28a.var_6ca1f1efc8215745;
        player thread Entity_Lightning_Strike_Tick_Damage(self, damage, settings.var_364c8f94aa59c799, settings.var_8992397197cec28a.var_c3d2c88493cb29b9);
        player function_825c5ed554766f7f(settings.var_8992397197cec28a.var_c3d2c88493cb29b9);
        break;
    case #"hash_6a33c20e7b932184": 
        player dodamage(settings.var_8992397197cec28a.var_6ca1f1efc8215745, player.origin, self, self, "MOD_ELEMENTAL_ELEC");
        player function_825c5ed554766f7f(1);
        break;
    }
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x17d5
// Size: 0x149
function private function_825c5ed554766f7f(duration) {
    if (!isplayer(self)) {
        return;
    }
    namespace_742e7eca5294ecdc::function_a9a57668997e3c85(1);
    if (istrue(self.revivingteammate)) {
        self.var_4a2f2f50a9020e2e = 1;
    }
    self setscriptablepartstate("shockStickVfx", "vfx_start", 0);
    self setscriptablepartstate("harvesterOrbSfx", "sfx_start", 0);
    gestureref = "vm_ges_shockstick_react";
    curweapon = self getcurrentweapon();
    if (curweapon != nullweapon()) {
        if (curweapon.basename == "iw9_me_fists_mp") {
            gestureref = "vm_ges_shockstick_react_fists";
        }
        while (!self isgestureplaying(gestureref)) {
            weapon = self getcurrentweapon();
            if (!isdefined(weapon)) {
                break;
            }
            self forceplaygestureviewmodel(gestureref);
            waitframe();
        }
    }
    self startforcedfire();
    namespace_742e7eca5294ecdc::function_600c7c4c73c6a773(1);
    self setmovespeedscale(0.8);
    self setempjammed(1);
    wait duration;
    namespace_742e7eca5294ecdc::function_a9a57668997e3c85(0);
    self stopgestureviewmodel(gestureref);
    self stopforcedfire();
    self setscriptablepartstate("shockStickVfx", "off", 0);
    self setscriptablepartstate("harvesterOrbSfx", "sfx_done", 0);
    namespace_742e7eca5294ecdc::function_600c7c4c73c6a773(0);
    self setmovespeedscale(1);
    self setempjammed(0);
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1926
// Size: 0x46
function private function_2623d68bf8490daf(var_a2adb76d7ea448b3, var_a2adb86d7ea44ae6) {
    return distancesquared(var_a2adb76d7ea448b3.origin, self.origin) <= distancesquared(var_a2adb86d7ea44ae6.origin, self.origin);
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1975
// Size: 0x29
function private function_5c5588646fd6ea24() {
    return self.var_730fcb57528054fb.phase[self.entitydata.phaseindex];
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a7
// Size: 0x47
function function_e72c887ec81b95a7() {
    namespace_742e7eca5294ecdc::function_a9a57668997e3c85(0);
    self setscriptablepartstate("shockStickVfx", "off", 0);
    self setscriptablepartstate("harvesterOrbSfx", "sfx_done", 0);
    namespace_742e7eca5294ecdc::function_600c7c4c73c6a773(0);
    function_3ab9164ef76940fd("zombieEntityVFX", "off");
}

// Namespace namespace_77480c5ad1d5553d / namespace_238e27c1b255539
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f6
// Size: 0xe
function function_3dc41a713eedb5b1() {
    self playsound("evt_ai_entity_lightning_strike_hold_warning");
}

