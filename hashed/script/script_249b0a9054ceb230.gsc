// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_16ea1b94f0f381b3;
#using scripts\common\utility.gsc;
#using script_42982ffd0134f28e;
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using script_9880b9dc28bc25e;
#using script_7edf952f8921aa6b;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_5640d32580c6bc7d;
#using script_7b2517368c79e5bc;
#using script_5753ba9c28794a65;
#using script_4ef01fe6151dde4d;
#using script_79deab1955343d5d;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_64351208cb856df9;
#using scripts\asm\shared\mp\utility.gsc;
#using script_3e31016b9c11a616;
#using script_43971bbeefd98f05;
#using script_6bffae1b97f70547;
#using script_38eb8f4be20d54f4;

#namespace namespace_a5c2977d842bbf87;

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x579
// Size: 0xb2
function function_3d88cdeba8222b15() {
    /#
        thread function_3153056f9a15760f();
    #/
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 0, &function_1d591bf930d61bc2);
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 1, &function_b2cc205c275b5365);
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 2, &function_d5e1eb6208782ae5);
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 3, &function_f42737a99169f63c);
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 4, &function_1388a2815d6f3111);
    function_89384091f7a2dbd("REV_OB_TURRET_TRAP", 5, &function_9a183acf062c5062);
    function_8b5b2a3392fc7e2a("PlayerJoin", &function_1531bbf5cff97dc0, "REV_OB_TURRET_TRAP");
    function_8b5b2a3392fc7e2a("PlayerLeave", &function_5c651df8cfad0810, "REV_OB_TURRET_TRAP");
    namespace_8ef157d888576350::function_610dfcbf191b189b();
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x632
// Size: 0x62
function function_1d591bf930d61bc2() {
    self.var_7fef38b419e7c59a = function_b9c4aa88ad97ee68(self);
    self.var_a1ac32f04bfb9e82 = "s_" + tolower(self.var_626b45032e1892da);
    var_a89e77c759b91ae0 = getstructarray(self.var_a1ac32f04bfb9e82, "targetname");
    self.var_996796f4b15a2737 = var_a89e77c759b91ae0[0];
    function_b8562e9bc1648ad1();
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69b
// Size: 0xf7
function function_b8562e9bc1648ad1() {
    var_f0a73224e2b13518 = getstructarray(self.var_a1ac32f04bfb9e82, "target");
    self.var_79b4bb874f4580f3 = [];
    foreach (content_struct in var_f0a73224e2b13518) {
        if (!isdefined(content_struct.script_noteworthy)) {
            continue;
        }
        self.var_79b4bb874f4580f3[content_struct.script_noteworthy] = function_53c4c53197386572(self.var_79b4bb874f4580f3[content_struct.script_noteworthy], []);
        self.var_79b4bb874f4580f3[content_struct.script_noteworthy] = array_add(self.var_79b4bb874f4580f3[content_struct.script_noteworthy], content_struct);
    }
    thread function_577419b6760f20e();
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x799
// Size: 0x2d4
function function_577419b6760f20e() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    var_bef27830fe6f66c6 = spawnstruct();
    var_bef27830fe6f66c6.origin = self.var_79b4bb874f4580f3["turret_trap_spawn"][0].origin;
    var_bef27830fe6f66c6.angles = self.var_79b4bb874f4580f3["turret_trap_spawn"][0].angles + (0, -90, 0);
    var_bef27830fe6f66c6.turrettype = function_c160909504e47884(var_bef27830fe6f66c6);
    var_bef27830fe6f66c6.invulnerable = 1;
    player_owner = level.players[0];
    if (isplayer(self.var_8356321c5f5eb4c3)) {
        player_owner = self.var_8356321c5f5eb4c3;
    }
    turret_team = "allies";
    if (isplayer(player_owner) && isdefined(player_owner.team)) {
        turret_team = function_53c4c53197386572(player_owner.team, "allies");
    }
    var_bef27830fe6f66c6.team = turret_team;
    var_bef27830fe6f66c6.owner = player_owner;
    var_bef27830fe6f66c6.var_6d9f48354b1ae939 = 1;
    var_bef27830fe6f66c6.var_12c37b454baa515d = 1;
    var_bef27830fe6f66c6.var_12e39261f1ccd13c = 1;
    self.turret = namespace_8ef157d888576350::sentryturret_create(var_bef27830fe6f66c6);
    namespace_8ef157d888576350::sentryturret_setinactive(self.turret);
    createnavobstaclebyent(self.turret);
    self.turret.var_2f5d509d7b71ce9a = self;
    var_1fe0a3ddc9b60566 = self.var_79b4bb874f4580f3["turret_trap_panel"][0];
    var_63d1536124d2024d = self.var_79b4bb874f4580f3["turret_trap_spawn"][0].origin - self.var_79b4bb874f4580f3["turret_trap_panel"][0].origin;
    self.turret_trap_panel = spawnscriptable("ob_jup_turret_trap_panel", var_1fe0a3ddc9b60566.origin, var_1fe0a3ddc9b60566.angles);
    self.turret_trap_panel.var_2f5d509d7b71ce9a = self;
    self.turret_trap_panel.var_532eac3c428e5b9b = 1;
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body_turret_trap_panel", &function_cf1b1f86951a9209);
    self.turret_trap_panel.var_55bb3585d29af1be = &function_d52be86cf922bec2;
    self.turret_trap_panel callback::add("on_cache_closed", &function_beffaa7f40862259);
    self.turret_trap_panel.var_6978a4b328fd33b3 = &function_245e4c4f2c8f50df;
    self.turret_trap_panel.var_febe9aacdd2e47b2 = 1;
    self.turret_trap_panel.var_46a3a8565ac0c17c = 18;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa74
// Size: 0x14
function function_d52be86cf922bec2(instance, player) {
    
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xa8f
// Size: 0x6a
function function_a3bc9a96e7494b90(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_ace73c6f69026c0b(instance.type)) {
        return;
    }
    if (isdefined(instance.var_c3c8e6401e8264be)) {
        instance.var_c3c8e6401e8264be notify("turret_trap_interact");
    }
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb00
// Size: 0x19
function function_ace73c6f69026c0b(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "ob_jup_turret_trap_panel";
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb21
// Size: 0x90
function function_245e4c4f2c8f50df(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    var_dfab44d4d8d10b36 = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        var_dfab44d4d8d10b36 = namespace_3883e3399f2870b5::function_8e5978971b5dcd16(player, itemindex);
    }
    var_dfab44d4d8d10b36 = 1;
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype);
    return [0:lootid, 1:noextract];
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb9
// Size: 0x2a7
function function_1459744b58026a21(var_6af53690bed297a6, owner) {
    self.turret_trap_panel setscriptablepartstate("body_turret_trap_panel", "closed_unusable");
    function_2b164bf1240548cd(self.turret, owner);
    var_f96e4256f03c5f42 = "jup_ui_map_icon_poi_turret_trap";
    if (issharedfuncdefined("game", "createObjective")) {
        self.turret.minimapid = self.turret [[ getsharedfunc("game", "createObjective") ]](var_f96e4256f03c5f42, self.turret.team, undefined, 0, 1);
    }
    waitframe();
    var_3ed7a98ec0ab4a48 = self.turret getturretweaponinfo();
    var_5a5520aa86c1e979 = 1;
    self.turret.owner namespace_dc2e59577d3a271f::function_b4da81e43557ada1(var_3ed7a98ec0ab4a48);
    switch (var_6af53690bed297a6) {
    case #"hash_c99f80fc7285c624":
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_3ed7a98ec0ab4a48, "brainrot");
        break;
    case #"hash_406a9b154cc52cae":
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_3ed7a98ec0ab4a48, "deadwire");
        break;
    case #"hash_4263a081cbbc42cb":
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_3ed7a98ec0ab4a48, "cryofreeze");
        break;
    case #"hash_5caf5c606cbae692":
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_3ed7a98ec0ab4a48, "napalmburst");
        break;
    case #"hash_fb7fb4f322446308":
        self.turret.owner namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_3ed7a98ec0ab4a48, "shatterblast");
        break;
    default:
        self.turret.owner namespace_dc2e59577d3a271f::function_b4da81e43557ada1(var_3ed7a98ec0ab4a48);
        var_5a5520aa86c1e979 = 0;
        break;
    }
    if (!istrue(self.var_9cc74ce986b31dfb)) {
        self.var_9cc74ce986b31dfb = 1;
        if (isdefined(self.playerlist)) {
            foreach (player in self.playerlist) {
                player callback::callback("on_turret_trap_circuit_added");
            }
        } else {
            owner callback::callback("on_turret_trap_circuit_added");
        }
    }
    thread function_bd241b99658cd3c8(owner);
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe67
// Size: 0x53
function function_bd241b99658cd3c8(owner) {
    wait(120);
    params = spawnstruct();
    params.opener = owner;
    var_ed7e928d501f5e63 = self.turret_trap_panel function_beffaa7f40862259(params);
    if (!istrue(var_ed7e928d501f5e63)) {
        function_cea4bfa4bc0fabf6();
    }
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec1
// Size: 0x99
function function_cea4bfa4bc0fabf6() {
    self.turret_trap_panel setscriptablepartstate("body_turret_trap_panel", "closed_usable");
    if (isdefined(self.turret.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](self.turret.minimapid);
        }
        self.turret.minimapid = undefined;
    }
    self.var_9cc74ce986b31dfb = 0;
    sentryturret_setinactive(self.turret);
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf61
// Size: 0x175
function function_beffaa7f40862259(params) {
    opener = params.opener;
    self setscriptablepartstate("body_turret_trap_panel", "closed_usable");
    foreach (index, item in self.contents) {
        if (!isdefined(item.lootid) || item.lootid == 0) {
            continue;
        }
        bundlename = function_fc925a153c7fd55c(item.lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        itemtype = itembundle.type;
        if (isdefined(self.var_2f5d509d7b71ce9a) && self.var_2f5d509d7b71ce9a function_3712c4e725d18962(bundlename)) {
            if (item.quantity > 1) {
                item.quantity--;
            } else {
                self.contents = array_remove_index(self.contents, index);
            }
            self.var_2f5d509d7b71ce9a function_1459744b58026a21(bundlename, opener);
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10de
// Size: 0x75
function function_3712c4e725d18962(var_6af53690bed297a6) {
    if (!isdefined(var_6af53690bed297a6)) {
        return 0;
    }
    switch (var_6af53690bed297a6) {
    case #"hash_406a9b154cc52cae":
    case #"hash_4263a081cbbc42cb":
    case #"hash_5caf5c606cbae692":
    case #"hash_9b06adbbfd096664":
    case #"hash_c99f80fc7285c624":
    case #"hash_fb7fb4f322446308":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115a
// Size: 0x11c
function function_4e53c739bf22ff46(params) {
    if (!isdefined(params)) {
        return 0;
    }
    if (is_equal(params.turrettype, "defend_turret") || is_equal(params.turrettype, "defend_turret_green") || is_equal(params.turrettype, "defend_turret_yellow") || is_equal(params.turrettype, "defend_turret_orange") || is_equal(params.turrettype, "defend_turret_red")) {
        return 1;
    }
    if (is_equal(params.basename, "jup_ob_defend_turret") || is_equal(params.basename, "jup_ob_defend_turret_green") || is_equal(params.basename, "jup_ob_defend_turret_yellow") || is_equal(params.basename, "jup_ob_defend_turret_orange") || is_equal(params.basename, "jup_ob_defend_turret_red")) {
        return 1;
    }
    return 0;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127e
// Size: 0x3
function function_b2cc205c275b5365() {
    
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1288
// Size: 0x3
function function_d5e1eb6208782ae5() {
    
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1292
// Size: 0x3
function function_f42737a99169f63c() {
    
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x5b
function function_1388a2815d6f3111() {
    if (!isdefined(self.var_996796f4b15a2737)) {
        var_4fc079a0d192b315 = getstructarray("s_" + tolower(self.var_626b45032e1892da), "targetname");
        return var_4fc079a0d192b315[0].origin;
    }
    return self.var_996796f4b15a2737.origin;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ff
// Size: 0x36
function function_9a183acf062c5062() {
    var_38c6a2e10b4e4e2b = getstructarray("s_" + tolower(self.var_626b45032e1892da) + "_reward", "targetname");
    return var_38c6a2e10b4e4e2b[0];
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133d
// Size: 0xa4
function function_c160909504e47884(spawn_struct) {
    difficulty_region = "";
    if (isdefined(level.var_fac39a693f085779)) {
        difficulty_region = [[ level.var_fac39a693f085779 ]](spawn_struct.origin);
    }
    switch (difficulty_region) {
    case #"hash_7bb2cd766703d463":
        return "defend_turret_green";
    case #"hash_af83e47edfa8900a":
        return "defend_turret_yellow";
    case #"hash_5343b465e56ec9a4":
        return "defend_turret_orange";
    case #"hash_651f76c0ad6741ec":
        return "defend_turret_red";
    default:
        return "defend_turret_green";
        break;
    }
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e8
// Size: 0x38
function function_1531bbf5cff97dc0(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
    var_a83ac3549acc2da2 = var_b381b0883bcd4847.var_b494ea8c4b70490;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1427
// Size: 0x22
function function_5c651df8cfad0810(var_b381b0883bcd4847) {
    var_2a29b237dcc66fe5 = var_b381b0883bcd4847.playerlist;
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1450
// Size: 0x13d
function function_3153056f9a15760f(params) {
    /#
        wait(5);
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_de07a0000b48b33, 1);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
        namespace_b032b0cc17b10064::function_6e7290c8ee4f558b("itemspawnentry:");
        namespace_b032b0cc17b10064::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_6565310170d18089);
        namespace_b032b0cc17b10064::function_fe953f000498048f();
    #/
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1594
// Size: 0x1cf
function function_de07a0000b48b33(params) {
    /#
        if (!isdefined(params[0]) || is_equal(params[0], "<unknown string>")) {
            return;
        }
        switch (params[0]) {
        case #"hash_588b588d16332e1d":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
        case #"hash_afaaf053b2461f8a":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
        case #"hash_41d942d30dd3f804":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
        case #"hash_4f5cd54aaf7f106":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
        case #"hash_fe0fd5228eda0f07":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
        case #"hash_853faa00a9ff1020":
            function_38e113a4c30f6c0d("<unknown string>", level.players[0].origin);
            return;
        }
        spawn_point = level.players[0].origin;
        var_317e5132733169cb = getclosestpointonnavmesh((level.players[0].origin[0] + 64, level.players[0].origin[1] + 64, level.players[0].origin[2]));
        if (isdefined(var_317e5132733169cb)) {
            spawn_point = var_317e5132733169cb;
        }
    #/
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x176a
// Size: 0x8c
function function_6565310170d18089(a_params) {
    /#
        player = level.players[0];
        spawn_origin = player.origin + (200, 0, 0);
        ground_pos = getgroundposition(player.origin + (200, 0, 100), 10);
        function_936a5eebf22b23e1("<unknown string>", ground_pos, player.angles);
    #/
}

// Namespace namespace_a5c2977d842bbf87/namespace_47d96238dd467828
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17fd
// Size: 0x1b1
function function_936a5eebf22b23e1(var_876f59936796f945, spawn_origin, spawn_angles, var_99690cc21e22d9bc, var_71f996a057e5ffe) {
    if (!isdefined(level.var_cee1e495e30eb18a)) {
        level.var_cee1e495e30eb18a = [];
    }
    if (isdefined(level.var_cee1e495e30eb18a[var_876f59936796f945])) {
        return;
    }
    var_c0c7c0983ff152bb = spawnstruct();
    var_c0c7c0983ff152bb.var_a1ac32f04bfb9e82 = "s_" + tolower(var_876f59936796f945);
    spawn_struct = spawnstruct();
    spawn_struct.origin = spawn_origin;
    spawn_struct.angles = spawn_angles;
    var_7a8bc054779c119f = spawnstruct();
    if (!isdefined(var_99690cc21e22d9bc)) {
        var_4ae8132ef88c6f62 = vectornormalize(anglestoforward(spawn_angles));
        offset = (var_4ae8132ef88c6f62[0] * 20, var_4ae8132ef88c6f62[1] * 20, 50);
        var_99690cc21e22d9bc = spawn_origin + offset;
        var_71f996a057e5ffe = spawn_angles;
    }
    var_7a8bc054779c119f.origin = function_53c4c53197386572(var_99690cc21e22d9bc, (0, 0, 0));
    var_7a8bc054779c119f.angles = function_53c4c53197386572(var_71f996a057e5ffe, (0, 0, 0));
    var_c0c7c0983ff152bb.var_79b4bb874f4580f3 = [];
    var_c0c7c0983ff152bb.var_79b4bb874f4580f3["turret_trap_spawn"] = [];
    var_c0c7c0983ff152bb.var_79b4bb874f4580f3["turret_trap_panel"] = [];
    var_c0c7c0983ff152bb.var_79b4bb874f4580f3["turret_trap_spawn"][0] = spawn_struct;
    var_c0c7c0983ff152bb.var_79b4bb874f4580f3["turret_trap_panel"][0] = var_7a8bc054779c119f;
    var_c0c7c0983ff152bb thread function_577419b6760f20e();
    level.var_cee1e495e30eb18a[var_876f59936796f945] = var_c0c7c0983ff152bb;
    return var_c0c7c0983ff152bb;
}

