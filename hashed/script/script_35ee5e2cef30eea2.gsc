// mwiii decomp prototype
#using scripts\mp\utility\player.gsc;
#using script_32d93a194074fa6a;
#using script_3f8889c16399185c;
#using scripts\mp\flags.gsc;
#using script_58f20490049af6ac;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_436456c868c64f07;

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x250
// Size: 0x34
function function_67d00e6b876c5ee2(position, angles) {
    /#
        assert(isdefined(position));
    #/
    self setorigin(position);
    if (isdefined(angles)) {
        self setplayerangles(angles);
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x47
function function_a074c3f0d66ba8e0() {
    self endon("game_ended");
    self endon("clip_limited");
    while (1) {
        var_eb7f4869595f550 = self getcurrentweapon();
        if (self getweaponammoclip(var_eb7f4869595f550) <= 10) {
            self setweaponammoclip(var_eb7f4869595f550, 20);
        }
        wait(0.3);
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d9
// Size: 0x4b
function function_f83c33a014ee22fe() {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    while (1) {
        var_eb7f4869595f550 = self getcurrentweapon();
        if (self getweaponammostock(var_eb7f4869595f550) <= 30) {
            self setweaponammostock(var_eb7f4869595f550, 60);
        }
        wait(1);
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x47
function function_bbd25202175d7f6f(player, ally) {
    return isdefined(player) && isdefined(ally) && isalliedsentient(player, ally) && (istrue(ally.jailed) || istrue(ally.gulagarena));
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a
// Size: 0x3b
function function_78d176299d2e0714(player, var_e8f714bab38b613c) {
    ascenders = getentitylessscriptablearray(undefined, undefined, player.origin, var_e8f714bab38b613c, "ascender");
    return ascenders.size > 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd
// Size: 0x4a
function function_42f2ff6e724030d0(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_71e5a20019ec7f70));
    #/
    dist = params.var_71e5a20019ec7f70;
    return function_78d176299d2e0714(self, dist);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x40f
// Size: 0x2c
function function_866b54331a9baec7(player, var_e8f714bab38b613c) {
    return getentitylessscriptablearray(undefined, undefined, player.origin, var_e8f714bab38b613c, "ascender");
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x443
// Size: 0xa3
function function_e09fe43dabd5e4cf(player, ascenders) {
    if (ascenders.size > 0) {
        mindistance = distancesquared(ascenders[0].origin, player.origin);
        var_48476cf9cf37777e = ascenders[0];
        for (i = 0; i < ascenders.size; i++) {
            var_ae695132befabc19 = distancesquared(ascenders[i].origin, player.origin);
            if (var_ae695132befabc19 < mindistance) {
                mindistance = var_ae695132befabc19;
                var_48476cf9cf37777e = ascenders[i];
            }
        }
        return var_48476cf9cf37777e;
    }
    return undefined;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ee
// Size: 0x17
function function_bf0a1f8b03ea5c18(player) {
    return player.usingascender;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d
// Size: 0x1d
function function_d97f26cd24750946() {
    var_31675498774c0dc5 = function_bf0a1f8b03ea5c18(self);
    if (isdefined(var_31675498774c0dc5)) {
        return var_31675498774c0dc5;
    }
    return 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x532
// Size: 0x5c
function function_331e465c203522e0(var_6e8b41e0a5648f49) {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (1) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message) && message == "ftue_minimap_opened") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x595
// Size: 0x21
function function_152b922c52a79e9e(player) {
    player.var_6ab0fd4589f5aea5 = 1;
    function_7fd621b8ba80e652();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bd
// Size: 0x14
function function_506621f96f8313a5(var_6e8b41e0a5648f49) {
    function_c6c53ea9225f6fc2(var_6e8b41e0a5648f49);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d8
// Size: 0x5c
function function_c6c53ea9225f6fc2(var_6e8b41e0a5648f49) {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (1) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message) && message == "ftue_minimap_closed") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63b
// Size: 0x27
function function_f3fdf43101042f63(var_4b2538e850df3357) {
    if (isdefined(var_4b2538e850df3357) && var_4b2538e850df3357 == "gasMiniMapCloseTip") {
        self.var_64a66c71d00e6f50 = 1;
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x669
// Size: 0x5c
function function_b804651ee5f4e495(var_6e8b41e0a5648f49) {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (1) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message) && message == "scoreboard_open") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cc
// Size: 0x5c
function function_2c280502c93dcdf4(var_6e8b41e0a5648f49) {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (1) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message) && message == "scoreboard_close") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72f
// Size: 0x2f
function function_6fc17f2a58009875() {
    return isdefined(self.br_infil_type) && self.br_infil_type == "c130" && namespace_4b0406965e556711::gameflag("br_ready_to_jump");
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766
// Size: 0x3e
function function_d1518ce894dd64e7(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_be502a4377111804));
    #/
    return function_6fc17f2a58009875() == params.var_be502a4377111804;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ac
// Size: 0x16
function function_18fcd72dfea6cac1() {
    if (!self.var_ca031fd3734a1c62) {
        function_52974897ad9887a8();
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c9
// Size: 0x25
function function_52974897ad9887a8() {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (!self.var_ca031fd3734a1c62) {
        waitframe();
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f6
// Size: 0x17
function function_5c6c946f52be9a50(var_4b2538e850df3357) {
    self.var_ca031fd3734a1c62 = 1;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x814
// Size: 0x25
function function_914e9d5e71cc6efb() {
    self endon("disconnect");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    while (!self function_3c6bb30ae7106b7a()) {
        waitframe();
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x841
// Size: 0x12
function function_8584a8a9b5fa0463() {
    return namespace_bbc79db4c3949a5c::function_a465e3c1371d7dab(self.origin);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b
// Size: 0x12
function function_2f3ee72261187d51() {
    return namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(self.origin);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x875
// Size: 0x1c
function function_671c7049215ebc9c() {
    var_6cb069d7b1dfaae0 = function_8584a8a9b5fa0463();
    if (!isdefined(var_6cb069d7b1dfaae0)) {
        return 0;
    }
    return var_6cb069d7b1dfaae0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x899
// Size: 0x41
function function_256eaa0074efa7c2(params) {
    returnvalue = function_2f3ee72261187d51();
    if (isdefined(params) && isdefined(params.var_87c2a6b04de18b12)) {
        return (returnvalue == params.var_87c2a6b04de18b12);
    }
    return returnvalue;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x34
function function_4c16f440b2c0b804(minheight, maxheight) {
    return self.origin[2] < minheight || self.origin[2] > maxheight;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91e
// Size: 0x9c
function function_2fde996b20d64205(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.var_71dd2a61430c603f));
    #/
    /#
        assert(isdefined(params.minheight));
    #/
    /#
        assert(isdefined(params.maxheight));
    #/
    if (function_4c16f440b2c0b804(params.minheight, params.maxheight)) {
        return 0;
    }
    var_71dd2a61430c603f = function_8eb62efbab104b05();
    if (isdefined(var_71dd2a61430c603f)) {
        return (var_71dd2a61430c603f < params.var_71dd2a61430c603f);
    }
    return 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9c2
// Size: 0x36
function function_725b52f601c21a7a(maxdistance, mindistance) {
    var_71dd2a61430c603f = function_8eb62efbab104b05();
    if (isdefined(var_71dd2a61430c603f)) {
        return (var_71dd2a61430c603f < maxdistance && var_71dd2a61430c603f > mindistance);
    }
    return 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa00
// Size: 0x91
function function_8eb62efbab104b05() {
    dangercircleent = level.br_circle.dangercircleent;
    if (isdefined(dangercircleent)) {
        var_819edacdacb810e4 = (dangercircleent.origin[0], dangercircleent.origin[1], 0);
        var_e86632d645c137d0 = dangercircleent.origin[2];
        if (isdefined(var_819edacdacb810e4) && isdefined(var_e86632d645c137d0)) {
            var_e28b0fbabce791f1 = distance2d(self.origin, var_819edacdacb810e4);
            return (var_e86632d645c137d0 - var_e28b0fbabce791f1);
        }
    }
    return undefined;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa99
// Size: 0x27
function function_92a5f74f5acc64d9(callback) {
    level endon("game_ended");
    self endon("disconnect");
    self waittill("last_stand_start");
    self [[ callback ]]();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xac7
// Size: 0x9d
function function_af7551bf62570371(callback) {
    level endon("game_ended");
    self endon("disconnect");
    downed = undefined;
    while (downed == undefined) {
        foreach (player in level.players) {
            if (isalliedsentient(self, player) && !namespace_7e17181d03156026::isreallyalive(player)) {
                downed = player;
                break;
            }
        }
        waitframe();
    }
    [[ callback ]](downed);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6b
// Size: 0x1e
function function_ba481c5cd3c4f5b4(var_8cdf4ff04b7775ec, var_dad9b8459425c9d8) {
    thread function_c6cc9d3a7adfda0f(var_8cdf4ff04b7775ec, var_dad9b8459425c9d8);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb90
// Size: 0x62
function function_c6cc9d3a7adfda0f(var_8cdf4ff04b7775ec, var_dad9b8459425c9d8) {
    self endon("disconnect");
    level endon("game_ended");
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(var_8cdf4ff04b7775ec));
    #/
    if (isdefined(var_dad9b8459425c9d8)) {
        self [[ var_dad9b8459425c9d8 ]]();
    }
    while (!self isskydiving()) {
        waitframe();
    }
    self [[ var_8cdf4ff04b7775ec ]]();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xbfa
// Size: 0x30
function function_8c217f41a2b69bfe(var_a7bc06075641900e, var_c4bcd19c674b2b94, var_8cdf4ff04b7775ec, var_dad9b8459425c9d8) {
    thread function_632855e1721d2685(var_a7bc06075641900e, var_c4bcd19c674b2b94, var_8cdf4ff04b7775ec, var_dad9b8459425c9d8);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc31
// Size: 0x107
function function_632855e1721d2685(var_a7bc06075641900e, var_c4bcd19c674b2b94, var_8cdf4ff04b7775ec, var_dad9b8459425c9d8) {
    self endon("disconnect");
    level endon("game_ended");
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(var_8cdf4ff04b7775ec));
    #/
    var_d49294f78a5bd8b0 = 0;
    init_pos = self.origin;
    var_db1111b1b4c72b10 = self getplayerangles();
    while (!self function_3c6bb30ae7106b7a()) {
        waitframe();
    }
    if (isdefined(var_dad9b8459425c9d8)) {
        self [[ var_dad9b8459425c9d8 ]]();
    }
    while (self isparachuting()) {
        var_e4bf20377d250593 = distance((self.origin[0], self.origin[1], 0), (init_pos[0], init_pos[1], 0));
        var_98bf6d2e08a18443 = distance(self getplayerangles(), var_db1111b1b4c72b10);
        if (var_98bf6d2e08a18443 >= var_c4bcd19c674b2b94 && var_e4bf20377d250593 * 10 > var_a7bc06075641900e) {
            var_d49294f78a5bd8b0 = 1;
            break;
        }
        waitframe();
    }
    self [[ var_8cdf4ff04b7775ec ]](var_d49294f78a5bd8b0);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd40
// Size: 0xa
function function_6c19fa9b1a676fe5() {
    function_2ab50ae603bc51cc();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd51
// Size: 0x29
function function_2ab50ae603bc51cc() {
    self endon("disconnect");
    level endon("game_ended");
    /#
        assert(isdefined(self));
    #/
    while (self function_3c6bb30ae7106b7a()) {
        waitframe();
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd82
// Size: 0xbc
function function_ff62c3aabf4c0ba8(var_7ea2637582571067, var_dad9b8459425c9d8) {
    self endon("entitydeleted");
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        weapon = idflags = partname = tagname = modelname = type = point = direction_vec = attacker = damage = self waittill("damage");
        if (attacker != self && isdefined(var_7ea2637582571067)) {
            self [[ var_7ea2637582571067 ]]();
            return;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe45
// Size: 0x2f
function function_217fab64becd170a() {
    xp = self getplayerdata("common", "mpProgression", "playerLevel", "xp");
    return getrankforxp(xp);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7c
// Size: 0x10
function function_1e7a02ef17d58a96() {
    if (self function_e69d7896fa6e5d23()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe94
// Size: 0x15
function function_c3ff6825172b7e02(var_6e8b41e0a5648f49) {
    thread function_dc30e2f1a162d751(var_6e8b41e0a5648f49);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb0
// Size: 0x5c
function function_dc30e2f1a162d751(var_6e8b41e0a5648f49) {
    self endon("disconnect");
    /#
        assert(isdefined(self));
    #/
    while (1) {
        value = message = self waittill("luinotifyserver");
        if (isdefined(message) && message == "ftue_redeploy_button_clicked") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf13
// Size: 0x14
function function_f0027ce50e5ef437(callback) {
    function_f47edda71b7a6492(callback);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2e
// Size: 0x50
function function_f47edda71b7a6492(callback) {
    self endon("death");
    self endon("disconnect");
    while (1) {
        class = channel = self waittill("luinotifyserver");
        if (channel == "ftue_show_revive_ally_button") {
            self [[ callback ]]();
            return;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf85
// Size: 0x1d
function function_79ff3ea7e538a94a(teammate, callback) {
    function_952f091badfcdd5d(teammate, callback);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa9
// Size: 0x89
function function_952f091badfcdd5d(teammate, callback) {
    self endon("death");
    self endon("disconnect");
    while (!isdefined(teammate.inlaststand)) {
        waitframe();
    }
    var_3268df12a22d1a03 = teammate.inlaststand;
    while (1) {
        if (!isreallyalive(teammate)) {
            self [[ callback ]](0);
            return;
        }
        currentvalue = teammate.inlaststand;
        if (var_3268df12a22d1a03 != currentvalue) {
            self [[ callback ]](1);
            return;
        }
        waitframe();
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1039
// Size: 0x15
function function_9b8f4317c9bee442(var_6e8b41e0a5648f49) {
    thread function_cbf5df364d883f3d(var_6e8b41e0a5648f49);
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1055
// Size: 0x67
function function_cbf5df364d883f3d(var_6e8b41e0a5648f49) {
    /#
        assert(isdefined(self));
    #/
    self endon("disconnect");
    while (1) {
        var_1fa07999be486fb2 = value = message = self waittill("calloutmarkerping_notifyhandled");
        if (isdefined(message) && message == "calloutmarkerping_added") {
            self [[ var_6e8b41e0a5648f49 ]]();
            break;
        }
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c3
// Size: 0xe
function function_ebaaac95a9dd6() {
    return self.health > 0;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10d9
// Size: 0xa
function function_c104680edea6cf97() {
    return !function_ebaaac95a9dd6();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10eb
// Size: 0x2c
function function_a44b57cf475cf6c1(value) {
    if (istrue(value)) {
        level.modifyplayerdamage = &function_210da883891acd05;
    } else {
        level.modifyplayerdamage = undefined;
    }
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111e
// Size: 0x9
function function_fafeefcc0da64ee2() {
    return self isonground();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112f
// Size: 0x9
function function_f07edbf622eeb7d9() {
    return namespace_d3d40f75bb4e4c32::hasselfrevivetoken();
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1140
// Size: 0xf4
function function_210da883891acd05(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (!isbot(victim) || victim.team == level.player.team) {
        idamage = idamage * victim.health / 200;
        if (victim.health - idamage <= 0) {
            idamage = 0;
        }
    } else if (isbot(einflictor) && einflictor.team == level.player.team && smeansofdeath != "MOD_EXECUTION") {
        idamage = 0;
    }
    return idamage;
}

// Namespace namespace_436456c868c64f07/namespace_196a3629befb677e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123c
// Size: 0x17
function function_bb62ba82affdd5c7() {
    self endon("disconnect");
    while (!self ismantling()) {
        waitframe();
    }
}

