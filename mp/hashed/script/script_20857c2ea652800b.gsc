#using script_16ea1b94f0f381b3;
#using script_1feb0785278dafea;
#using script_21bdef0c2290d3e2;
#using script_2669878cf5a1b6bc;
#using script_30fbbeb9a6251e9a;
#using script_371b4c2ab5861e62;
#using script_54be039c89fddc12;
#using script_638d701d263ee1ed;
#using script_6bffae1b97f70547;
#using script_7b2517368c79e5bc;
#using script_7c03ab87c5f9f420;
#using script_7edf952f8921aa6b;
#using scripts\asm\shared\mp\utility;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\cap;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;
#using scripts\mp\ai_behavior;
#using scripts\mp\flags;
#using scripts\mp\utility\perk;

#namespace namespace_aec225c929af7985;

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0x65
function function_f9574994ef82946e() {
    /#
        level thread function_7d77a58b06201f26();
    #/
    registersharedfunc("ob_warlord_schematic_upgrade", "applyWarlordSchematicUpgrade", &function_fa65c9601e64aeb8);
    registersharedfunc("ob_warlord_schematic_upgrade", "try_maestro_mod", &function_c528340bc6dfaa78);
    registersharedfunc("killstreak", "can_upgrade", &function_7fbc1ef6c7042b4d);
    /#
        setdvarifuninitialized(@"hash_1f9dc061da23ade", 300);
    #/
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x502
// Size: 0x3e
function function_7fbc1ef6c7042b4d(itembundle, item) {
    if (isdefined(itembundle) && isdefined(itembundle.ref)) {
        return issubstr(itembundle.ref, "jup_warlord_");
    }
    return 0;
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x549
// Size: 0x8f
function private function_fa65c9601e64aeb8(upgradetype) {
    switch (upgradetype) {
    case #"hash_5c9f46f4d6d3f82e":
        self.var_8a13c2b607afaae7 = 1;
        function_3fb94d3acc6c5bfa();
        break;
    case #"hash_95bcbe6629560647":
        self.var_7724569d0029dd40 = 1;
        self setclientomnvar("ui_ob_chemist_mask_active", 1);
        thread function_5d32bcc6d0b5be3b();
        thread function_23c5e586ede72b79();
        break;
    case #"hash_af53010ea8be5ceb":
        self.var_737ac766fe3a46e0 = 1;
        thread function_30bf0929c0733c83();
        break;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5e0
// Size: 0x25
function private function_3fb94d3acc6c5bfa() {
    namespace_c39580665208f0a4::function_c2afddb38bd47f6f();
    if (function_19c4400bfbd67af1()) {
        function_f6ada322b58319b0();
    }
    self playlocalsound("evt_ob_rr_red_beret_activate");
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x60d
// Size: 0x2f9
function function_df47984aec8fdb53() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.var_a0c81984c27cf26e)) {
        var_f191982a537bd94 = randomint(10);
        var_f191982a537bd94++;
        self.var_a0c81984c27cf26e = var_f191982a537bd94;
    } else {
        var_f191982a537bd94 = self.var_a0c81984c27cf26e;
    }
    var_f191982a537bd94 = "jup_ob_schematic_soldier_buddy_" + var_f191982a537bd94;
    var_66ae3e250803bed1 = self.origin - (30, 30, 0);
    buddy = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(var_f191982a537bd94, var_66ae3e250803bed1, self.angles, self.team);
    if (isalive(buddy)) {
        self.companion_type = 2;
        buddy.var_66c1831357048c02 = self;
        self.var_c5668dcaf32afbc3 = buddy;
        buddy scripts\common\ai::function_dd21d67ede8ba22(getdvarint(@"hash_eb6294a63fe5308a", 24000));
        buddy function_ca27630def7b7aad(self);
        buddy setgoalentity(self);
        buddy function_85e7c2baf116abf8(self);
        buddy setthreatbiasgroup("allied_with_mercs");
        buddy thread function_c6a00df0d39f8c5c();
        buddy thread function_882be57ee5bdc7fd();
        buddy thread function_63db37a0448d2f5b(self);
        buddy.var_526f1dcf41e8b261 = getdvarfloat(@"hash_e280783df9276e5e", 32);
        buddy.var_e7b2da70a1256fb1 = getdvarfloat(@"hash_3a2512a384255637", 14);
        buddy.var_fc8b605280dd80b0 = getdvarfloat(@"hash_5d67719b2bb8adfd", 10);
        buddy.dontsyncmelee = 1;
        buddy.baseaccuracy = getdvarfloat(@"hash_4348131663bf2724", 1.8);
        buddy.var_4268b42fc89d0be9 = 0.001;
        buddy.var_8a783f4c73c2ae91 = 4e-06;
        buddy.gameskillmisstimefrombehindoverride = 0.02;
        buddy.disablereload = 1;
        buddy.grenadeammo = 200;
        buddy.var_66c8cd2e51badc67 = 1;
        buddy.var_a32530404b862f7b = 1;
        if (namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.origin) == "difficulty_darkaether") {
            buddy.var_526f1dcf41e8b261 *= 1.5;
            buddy.var_e7b2da70a1256fb1 *= 1.5;
            buddy.var_fc8b605280dd80b0 *= 1.5;
        }
        buddy.headicon = createheadicon(buddy);
        setheadiconimage(buddy.headicon, "ui_jup_hud_hacking_complete_border");
        setheadicondrawinmap(buddy.headicon, 1);
        setheadiconzoffset(buddy.headicon, 20);
        function_51044b10b2b673df(buddy.headicon, "icon_small");
        buddy thread function_cefdd4787b8da6a5(self);
        buddy thread function_f9b02acbd7d93158();
        buddy thread function_1092bdd0a92a350c();
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90e
// Size: 0x17
function function_27e5f3c43590e3f9(person) {
    wait 5;
    thread function_fb7b619ca3bfb43a(person);
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x92d
// Size: 0x89
function private function_1092bdd0a92a350c() {
    level endon("game_ended");
    playerowner = self.var_66c1831357048c02;
    self waittill("death");
    if (isdefined(playerowner) && isplayer(playerowner) && (!isdefined(playerowner.var_c5668dcaf32afbc3) || playerowner.var_c5668dcaf32afbc3 == self)) {
        playerowner.var_c5668dcaf32afbc3 = undefined;
        if (!istrue(playerowner.var_ded04cdd264a7e00)) {
            playerowner.companion_type = 0;
            playerowner.var_a0c81984c27cf26e = undefined;
        }
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9be
// Size: 0xb7
function private function_f9b02acbd7d93158() {
    level endon("game_ended");
    self endon("death");
    while (true) {
        if (self.grenadeammo == 0) {
            self.grenadeammo++;
        }
        if (isdefined(self.enemy)) {
            var_79df85bae477af1f = 900;
            var_9c78488e0dcfeda = 3;
            if (getaiarrayinradius(self.enemy.origin, var_79df85bae477af1f).size > var_9c78488e0dcfeda) {
                namespace_14d36171baccf528::function_ae99616202575e39(self.enemy.origin, "thermobaric_grenade_jup_mp", 64);
                grenadecooldown = getdvarint(@"hash_85452cb0f9b27940", 25);
                wait grenadecooldown;
            }
        }
        wait 2;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa7d
// Size: 0x3b
function private function_cefdd4787b8da6a5(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death_or_disconnect");
    if (!function_ccb4e995b4be8323(player)) {
        function_dd07098dc0a67368(player);
    }
    thread function_89d2aa3b454550af(player);
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xac0
// Size: 0x72
function private function_ccb4e995b4be8323(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death_or_disconnect");
    waitframe();
    var_5c06b40c5ef1c545 = getdvarint(@"hash_1f9dc061da23ade", 300);
    targetpos = function_8023395e959b8113(player, var_5c06b40c5ef1c545);
    if (isdefined(targetpos)) {
        function_c789cc0bd60384c2(targetpos + (0, 0, 2000), targetpos, undefined, 0);
        return true;
    }
    return false;
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb3b
// Size: 0xa9
function private function_dd07098dc0a67368(player) {
    var_5c06b40c5ef1c545 = getdvarint(@"hash_1f9dc061da23ade", 300);
    forward = anglestoforward(player.angles);
    forward = vectornormalize(forward);
    targetorigin = player.origin + (forward[0] * -1, forward[1] * -1, 0) * var_5c06b40c5ef1c545;
    targetpos = drop_to_ground(targetorigin + (0, 0, 500));
    if (isdefined(targetpos)) {
        self forceteleport(targetpos, self.angles);
        return 1;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbec
// Size: 0x31
function private function_c6a00df0d39f8c5c() {
    self endon("death");
    if (isplayer(self.var_66c1831357048c02)) {
        self.var_66c1831357048c02 waittill("death_or_disconnect");
        self kill();
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc25
// Size: 0x58
function private function_89d2aa3b454550af(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death_or_disconnect");
    while (true) {
        if (distance2dsquared(self.origin, player.origin) > squared(1500)) {
            function_ccb4e995b4be8323(player);
        }
        wait 3;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xc85
// Size: 0x34
function private function_63db37a0448d2f5b(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death_or_disconnect");
    player waittill("disguise_ended");
    self setthreatbiasgroup("team_players");
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcc1
// Size: 0x114
function private function_882be57ee5bdc7fd() {
    level endon("game_ended");
    self endon("death");
    self.var_66c1831357048c02 endon("death_or_disconnect");
    player = self.var_66c1831357048c02;
    playerteam = player.team;
    playersquadindex = player.sessionsquadid;
    for (squadmembers = level.squaddata[playerteam][playersquadindex].players; true; squadmembers = level.squaddata[playerteam][playersquadindex].players) {
        foreach (member in squadmembers) {
            if (istrue(member.inlaststand) && !istrue(self.reviving)) {
                function_fb7b619ca3bfb43a(member);
                self.reviving = 0;
            }
        }
        wait 1;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xddd
// Size: 0x1d7
function private function_fb7b619ca3bfb43a(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death_or_disconnect");
    self.reviving = 1;
    self.ignoreall = 1;
    self.var_d28e54645050df58 = 0;
    self.script_pushable = 0;
    startorigin = function_8023395e959b8113(player, 27);
    if (isdefined(startorigin) && distancesquared(self.origin, startorigin) > squared(32)) {
        startangles = vectortoangles(player.origin - startorigin);
        playerteam = player.team;
        playersquadindex = player.sessionsquadid;
        self.revivetargetpos = startorigin;
        self setbtgoalpos(3, self.revivetargetpos);
        self.revivetargetangles = startangles;
        self.var_a41edf45bb0ff97 = self.revivetargetangles;
        self.var_c55c721292fdb08b = "crouch";
        self.var_26aa5cb1924a027 = 1;
        var_c70217358eddbeb2 = 4;
        result = waittill_any_timeout_1(var_c70217358eddbeb2, "bt_goal");
        while (istrue(self.arriving)) {
            waitframe();
        }
        self clearbtgoal(3);
        self.var_26aa5cb1924a027 = 0;
    }
    if (distancesquared(self.origin, self.revivetargetpos) < squared(32)) {
        if (istrue(player.inlaststand)) {
            scripts\common\cap::cap_start("cap_ai_revival", "caps/interactions/cap_ai_revival");
            wait 2;
            player namespace_f585f5e438cbdbc8::heal_player(self);
            wait 3;
            scripts\common\cap::cap_exit();
        }
    }
    self.ignoreall = 0;
    self.var_d28e54645050df58 = 1;
    self.script_pushable = 1;
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xfbc
// Size: 0x10a
function private function_8023395e959b8113(player, var_2d58e8aae155cc83) {
    forward = anglestoforward(player.angles);
    forward = vectornormalize(forward);
    var_b1b0c9608f1d6e22 = 150;
    if (isdefined(var_2d58e8aae155cc83)) {
        var_b1b0c9608f1d6e22 = var_2d58e8aae155cc83;
    }
    targetorigin = player.origin + (forward[0] * -1, forward[1] * -1, 0) * var_b1b0c9608f1d6e22;
    maxdist = squared(1500);
    safeorigin = self getclosestreachablepointonnavmesh(targetorigin, 0);
    if (!isdefined(safeorigin) || distance2dsquared(safeorigin, player.origin) > maxdist) {
        safeorigin = getclosestpointonnavmesh(targetorigin, self, undefined, undefined, 0);
        if (!isdefined(safeorigin) || distance2dsquared(safeorigin, player.origin) > maxdist) {
            safeorigin = undefined;
        }
    }
    if (isdefined(safeorigin)) {
        safeorigin = getgroundposition(safeorigin, 15);
        level thread scripts\cp_mp\utility\debug_utility::drawsphere(safeorigin, 15, 30, (1, 0, 1));
    }
    return safeorigin;
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10cf
// Size: 0xb4
function private function_5d32bcc6d0b5be3b() {
    if (namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(level.var_1515562147f27975) || namespace_8055140764bdf2f4::function_b27f0c7dafeadb3(level.var_479d8ef7f76a4df6) || isdefined(self.gasmasktype)) {
        hasgasmask = 1;
    }
    if (!istrue(hasgasmask)) {
        fakeitem = spawnstruct();
        item_entry = "ob_jup_item_gasmask";
        item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
        item_scriptable = item_bundle.scriptable;
        fakeitem.count = 1;
        namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
        self playlocalsound("evt_ob_rr_keres_mask_activate");
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x118b
// Size: 0xcb
function private function_23c5e586ede72b79() {
    self endon("death");
    level endon("game_ended");
    while (true) {
        if (isdefined(self.gasmaskhealth) && isdefined(self.gasmaskmaxhealth) && !istrue(self.gasmaskequipped)) {
            if (self.gasmaskhealth < self.gasmaskmaxhealth) {
                self.gasmaskhealth = clamp(self.gasmaskhealth + int(self.gasmaskmaxhealth / 12), 0, self.gasmaskmaxhealth);
                var_b8b6fa3d6f2f0b8c = self.gasmaskhealth / self.gasmaskmaxhealth;
                var_b8b6fa3d6f2f0b8c = clamp(var_b8b6fa3d6f2f0b8c, 0, 1);
                self setclientomnvar("ui_gasmask_damage", var_b8b6fa3d6f2f0b8c);
            }
        }
        wait 1;
    }
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x125e
// Size: 0x27
function private function_30bf0929c0733c83() {
    self endon("death");
    level endon("game_ended");
    self.var_737ac766fe3a46e0 = 1;
    self playlocalsound("evt_ob_rr_maestro_activate");
}

// Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x128d
// Size: 0x45a
function function_c528340bc6dfaa78(dmgstruct) {
    if (isdefined(dmgstruct) && isdefined(dmgstruct.eattacker) && isplayer(dmgstruct.eattacker) && istrue(dmgstruct.eattacker.var_737ac766fe3a46e0)) {
        if (dmgstruct.idamage <= 0) {
            return 0;
        }
        death = dmgstruct.idamage > self.health;
        if (!isexplosivedamagemod(dmgstruct.smeansofdeath)) {
            return 0;
        }
        if (dmgstruct.smeansofdeath == "MOD_EXPLOSIVE_BULLET") {
            return 0;
        }
        if (!namespace_dc2e59577d3a271f::function_efdce4b346c97324(dmgstruct.eattacker)) {
            return 0;
        }
        if (istrue(death) && !istrue(level.ammo_mods["deadwire"].occurs_on_death)) {
            return 0;
        }
        if (isdefined(dmgstruct.objweapon) && namespace_e0ee43ef2dddadaa::iswonderweapon(dmgstruct.objweapon)) {
            return 0;
        }
        if (isdefined(dmgstruct.einflictor) && is_equal(dmgstruct.einflictor.weapon_name, "hellhound_molotov")) {
            return 0;
        }
        if (!isdefined(self.basearchetype)) {
            return 0;
        }
        if (istrue(self.var_b9527ed408c69385)) {
            return 0;
        }
        if (ent_flag("turned")) {
            return 0;
        }
        if (istrue(level.ammo_mods["deadwire"].immune_trigger[self.basearchetype])) {
            return 0;
        }
        if (isdefined(level.ammo_mods["deadwire"].validation_func)) {
            if (![[ level.ammo_mods["deadwire"].validation_func ]]()) {
                return 0;
            }
        }
        success = 0;
        reroll_icon = undefined;
        var_207306346a548632 = 1;
        percentage = 0;
        if (islauncherweapon(dmgstruct.sweapon)) {
            var_d7dccd235591c151 = 1;
        }
        if (self.aicategory == "elite" || self.aicategory == "boss") {
            var_207306346a548632 = 0;
            percentage = ter_op(istrue(var_d7dccd235591c151), getdvarfloat(@"hash_9249a6db435898f2", 0), getdvarfloat(@"hash_35c1e5a8706bac8", 0));
        } else if (self.aicategory == "special") {
            percentage = ter_op(istrue(var_d7dccd235591c151), getdvarfloat(@"hash_2b7fe589a26a6476", 0.3), getdvarfloat(@"hash_fd5284e0f9295404", 0.5));
        } else {
            percentage = ter_op(istrue(var_d7dccd235591c151), getdvarfloat(@"hash_f3e4a8901a00ad20", 0.5), getdvarfloat(@"hash_b7b0782e561497fe", 1));
        }
        if (percentage >= randomfloat(1)) {
            success = 1;
        }
        if (!success) {
            return 0;
        }
        now = gettime() / 1000;
        level.ammo_mods["deadwire"].cooldown_time_global_start = now;
        dmgstruct.eattacker.var_1b9bba89a566cb5f["deadwire"] = now;
        self thread [[ level.ammo_mods["deadwire"].result_func ]](death, dmgstruct.eattacker, dmgstruct.smeansofdeath, dmgstruct.sweapon, dmgstruct.vpoint, dmgstruct.shitloc, dmgstruct.modelindex);
        sparams = spawnstruct();
        sparams.var_2632b2da60d34841 = "deadwire";
        sparams.var_19560ec564499c6c = 0;
        sparams.zombie = self;
        if (isdefined(self.aicategory) && self.aicategory == "special") {
            sparams.var_19560ec564499c6c = 1;
        }
        dmgstruct.eattacker callback::callback("ammomod_proc", sparams);
        if (isplayer(dmgstruct.eattacker)) {
            dmgstruct.eattacker playlocalsound("uin_ammomod_proc_to_player_2d");
        }
        return 1;
    }
}

/#

    // Namespace namespace_aec225c929af7985 / namespace_9bc9a222fe5ea105
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x16ef
    // Size: 0x9c
    function function_7d77a58b06201f26() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        devgui::function_b23a59dfb4ca49a1("<dev string:x34>", "<dev string:x46>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<dev string:x74>", "<dev string:x90>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<dev string:xd3>", "<dev string:xe8>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<dev string:x119>", "<dev string:x138>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<dev string:x17e>", "<dev string:x192>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1c2>", "<dev string:x1e0>", &namespace_2abc885019e1956::function_f8162124bbb6ece3);
        function_fe953f000498048f();
    }

#/
