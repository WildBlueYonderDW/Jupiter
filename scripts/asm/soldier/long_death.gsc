// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\soldier\death.gsc;
#using script_159f253f9bd2314e;
#using scripts\engine\trace.gsc;

#namespace long_death;

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x164
function preventpainforashorttime() {
    self endon("kill_long_death");
    self endon("death");
    self.flashbangimmunity = 1;
    self.longdeathstarting = 1;
    self.doinglongdeath = 1;
    self notify("long_death");
    self.health = 10000;
    self.threatbias = self.threatbias - 2000;
    function_58585bbaa46f6bba(gettime() + 3000);
    function_69e0176e97b04cc7(gettime() + 3000);
    wait(0.75);
    if (self.health > 1) {
        self.health = 1;
    }
    wait(0.05);
    self.longdeathstarting = undefined;
    self.a.mayonlydie = 1;
    wait(1);
    if (isdefined(level.player) && distancesquared(self.origin, level.player.origin) < 1048576) {
        function_9912fb866ada47d7(randomintrange(10, 30));
        function_58585bbaa46f6bba(gettime() + randomintrange(15000, 60000));
    } else {
        function_9912fb866ada47d7(randomintrange(5, 12));
        function_58585bbaa46f6bba(gettime() + randomintrange(5000, 25000));
    }
    function_69e0176e97b04cc7(gettime() + randomintrange(7000, 13000));
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c
// Size: 0x1ab
function dyingcrawlbackaim(statename) {
    self endon("death");
    self notify("end_dying_crawl_back_aim");
    self endon("end_dying_crawl_back_aim");
    if (isagent(self)) {
        return;
    }
    var_91017dfe29604942 = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_4"));
    var_91017bfe296044dc = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_6"));
    var_1cb7910504a15713 = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_4_knob"));
    var_bd00098fd9227f05 = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_6_knob"));
    wait(0.05);
    self aisetanimlimited(var_91017dfe29604942, 1, 0);
    self aisetanimlimited(var_91017bfe296044dc, 1, 0);
    var_b26b2dc165a4c077 = 0;
    while (1) {
        var_dd8dcdcf226ad155 = getyawtoenemy();
        diff = angleclamp180(var_dd8dcdcf226ad155 - var_b26b2dc165a4c077);
        if (abs(diff) > 3) {
            diff = sign(diff) * 3;
        }
        var_dd8dcdcf226ad155 = angleclamp180(var_b26b2dc165a4c077 + diff);
        if (var_dd8dcdcf226ad155 < 0) {
            if (var_dd8dcdcf226ad155 < -45) {
                var_dd8dcdcf226ad155 = -45;
            }
            weight = var_dd8dcdcf226ad155 / -45;
            self setanim(var_1cb7910504a15713, weight, 0.05);
            self setanim(var_bd00098fd9227f05, 0, 0.05);
        } else {
            if (var_dd8dcdcf226ad155 > 45) {
                var_dd8dcdcf226ad155 = 45;
            }
            weight = var_dd8dcdcf226ad155 / 45;
            self setanim(var_bd00098fd9227f05, weight, 0.05);
            self setanim(var_1cb7910504a15713, 0, 0.05);
        }
        var_b26b2dc165a4c077 = var_dd8dcdcf226ad155;
        wait(0.05);
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x67
function setupaiming(statename) {
    var_4d85574313bc89da = asm_lookupanimfromalias(statename, "clear_knob");
    self aiclearanim(var_4d85574313bc89da, 0.2);
    if (isdefined(self.a.bdyingbackidleandshootsetup)) {
        return;
    }
    thread dyingcrawlbackaim(statename);
    self.a.bdyingbackidleandshootsetup = 1;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62c
// Size: 0x11a
function dodyingcrawlbloodsmear() {
    self endon("death");
    var_e42c947dbeb4c361 = "J_SpineLower";
    var_5a737be8b98f48f4 = "tag_origin";
    var_7b2d455c047c521a = 6;
    fx = level._effect["crawling_death_blood_smear"];
    if (isdefined(self.a.crawl_fx_rate)) {
        var_7b2d455c047c521a = self.a.crawl_fx_rate;
    }
    if (isdefined(self.a.crawl_fx)) {
        fx = level._effect[self.a.crawl_fx];
    }
    while (var_7b2d455c047c521a) {
        org = self gettagorigin(var_e42c947dbeb4c361);
        angles = self gettagangles(var_5a737be8b98f48f4);
        forward = anglestoright(angles);
        up = anglestoforward((270, 0, 0));
        playfx(fx, org, up, forward);
        wait(var_7b2d455c047c521a);
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d
// Size: 0x24
function iscrawldeltaallowed(var_509e0922ea1ede0d) {
    if (self.force_num_crawls > 0) {
        return 1;
    }
    return isanimdeltaallowed(var_509e0922ea1ede0d);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x779
// Size: 0x52
function startdyingcrawlbackaimsoon(statename) {
    self endon(statename + "_finished");
    wait(0.1);
    if (isdefined(self.a.bdyingbackidleandshootsetup)) {
        return;
    }
    thread dyingcrawlbackaim(statename);
    self.a.bdyingbackidleandshootsetup = 1;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d2
// Size: 0xbc
function handlebackcrawlnotetracks(statename, note, params) {
    var_748a5b6e1eb008f5 = 0;
    if (!isdefined(self.bdoingbloodsmear) && issubstr(note, "bodyfall")) {
        thread dodyingcrawlbloodsmear();
    } else if (note == "fire_spray") {
        if (!canseeenemy()) {
            return 1;
        }
        if (!self function_9ca5b32676727f92()) {
            return 1;
        }
        shootenemywrapper();
        return 1;
    } else if (note == "pistol_pickup") {
        thread startdyingcrawlbackaimsoon(statename);
        return 0;
    } else if (note == "fire") {
        shootenemywrapper();
        return 1;
    } else if (note == "code_move") {
        return 1;
    }
    return 0;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x896
// Size: 0x13a
function playdyingcrawl(asmname, statename, params) {
    self endon(statename + "_finished");
    if (self.force_num_crawls > 0) {
        numcrawls = self.force_num_crawls;
    } else {
        numcrawls = randomintrange(1, 5);
    }
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    /#
        assertex(animhasnotetrack(xanim, "code_move"), "Anim " + xanim + " is missing code move notetrack");
    #/
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    for (i = 0; i < numcrawls; i++) {
        if (!iscrawldeltaallowed(xanim)) {
            break;
        }
        if (isdefined(self.custom_crawl_sound)) {
            self playsound(self.custom_crawl_sound);
        }
        while (1) {
            endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
            if (endnote == "code_move") {
                continue;
            }
        }
    }
    asm_fireevent(asmname, "dying_crawl_done");
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9d7
// Size: 0x158
function playdyingcrawlback(asmname, statename, params) {
    self endon(statename + "_finished");
    if (isdefined(self.enemy)) {
        utility::lookatentity(self.enemy);
    }
    if (self.force_num_crawls > 0) {
        numcrawls = self.force_num_crawls;
    } else {
        numcrawls = randomintrange(1, 5);
    }
    setupaiming(statename);
    var_b33f88434cd7cde9 = asm_getanim(asmname, statename);
    var_c1f650ba5cb83399 = asm_getxanim(statename, var_b33f88434cd7cde9);
    /#
        assert(animhasnotetrack(var_c1f650ba5cb83399, "code_move"));
    #/
    asm_playfacialanim(asmname, statename, var_c1f650ba5cb83399);
    self aisetanim(statename, var_b33f88434cd7cde9);
    for (i = 0; i < numcrawls; i++) {
        if (!iscrawldeltaallowed(var_c1f650ba5cb83399)) {
            break;
        }
        while (1) {
            endnote = asm_donotetrackswithinterceptor(asmname, statename, &handlebackcrawlnotetracks);
            if (endnote == "end") {
                continue;
            }
        }
    }
    if (!istrue(self.var_d5e499e7fe2c490b)) {
        self.desiredtimeofdeath = gettime() + randomintrange(4000, 20000);
    }
    asm_fireevent(asmname, "dying_back_crawl_done");
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb36
// Size: 0x31
function playcrawlflipover(asmname, statename, params) {
    utility::lookatentity();
    asm_playanimstatewithnotetrackinterceptor(asmname, statename, &handlebackcrawlnotetracks);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb6e
// Size: 0x6a
function playcrawlingpaintransition(asmname, statename, params) {
    setearlyfinishtime();
    if (istrue(self.forcelongdeathskipintroanim)) {
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
        return;
    }
    thread preventpainforashorttime();
    utility::lookatentity();
    asm_playanimstatewithnotetrackinterceptor(asmname, statename, &handlebackcrawlnotetracks);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdf
// Size: 0x45
function setearlyfinishtime() {
    if (!isdefined(self.asm.longdeathanims)) {
        self.asm.longdeathanims = spawnstruct();
    }
    self.var_4ad177ab3ddde8fd = gettime() + 2000;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc2b
// Size: 0xac
function playdyingbackshoot(asmname, statename, params) {
    self endon(statename + "_finished");
    setupaiming(statename);
    while (1) {
        var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
        xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
        asm_playfacialanim(asmname, statename, xanim);
        self aisetanim(statename, var_2c8936d08f85c5c1);
        endnote = asm_donotetrackswithinterceptor(asmname, statename, &handlebackcrawlnotetracks);
        if (endnote == "end") {
            if (!asm_eventfired(asmname, "end")) {
                asm_fireevent(asmname, "end");
            }
        }
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcde
// Size: 0x3f
function choosedyingbackidle(asmname, statename, params) {
    if (istrue(self.longdeathnoncombat)) {
        return asm_lookupanimfromalias(statename, "noncombat");
    }
    return asm_chooseanim(asmname, statename, params);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd25
// Size: 0xc6
function playdyingbackidle(asmname, statename, params) {
    self endon(statename + "_finished");
    if (!istrue(self.longdeathnoncombat)) {
        self.nextlongdeathshoottime = gettime() + randomintrange(500, 1000);
        setupaiming(statename);
    }
    prevanim = undefined;
    while (1) {
        var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
        xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
        if (!isdefined(prevanim) || var_2c8936d08f85c5c1 != prevanim) {
            self aisetanim(statename, var_2c8936d08f85c5c1);
            prevanim = var_2c8936d08f85c5c1;
        }
        asm_playfacialanim(asmname, statename, xanim);
        prevanim = var_2c8936d08f85c5c1;
        asm_donotetrackssingleloop(asmname, statename, xanim, asm_getnotehandler(asmname, statename));
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xdf2
// Size: 0x3b
function playstumblingpaintransition(asmname, statename, params) {
    thread preventpainforashorttime();
    setearlyfinishtime();
    utility::lookatentity();
    asm_playanimstate(asmname, statename);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe34
// Size: 0x15c
function playstumblingwander(asmname, statename, params) {
    self endon(statename + "_finished");
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    var_9b86c1c6f674531c = "stumbling_pain_collapse_death";
    var_91bebedd6b5e41fe = asm_getanim(asmname, var_9b86c1c6f674531c);
    var_d0304cfb3abcc42f = asm_getxanim(var_9b86c1c6f674531c, var_91bebedd6b5e41fe);
    /#
        assert(isdefined(var_2c8936d08f85c5c1));
    #/
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    if (!animhasnotetrack(xanim, "code_move")) {
        asm_fireevent(asmname, "pain_wander_done");
        return;
    }
    var_957dd9db9cc2ad1c = getmovedelta(var_d0304cfb3abcc42f);
    var_9de3e590348729f6 = randomintrange(1, 3);
    self aisetanim(statename, var_2c8936d08f85c5c1);
    asm_playfacialanim(asmname, statename, xanim);
    while (var_9de3e590348729f6 > 0) {
        endpos = self localtoworldcoords(var_957dd9db9cc2ad1c);
        if (!self maymovetopoint(endpos)) {
            break;
        }
        while (1) {
            endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
            if (endnote == "code_move") {
                break;
            }
        }
        var_9de3e590348729f6--;
    }
    asm_fireevent(asmname, "pain_wander_done");
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf97
// Size: 0x2e
function hasbeenhitwithemp(asmname, statename, var_f2b19b25d457c2a6, params) {
    return istrue(self.isempd);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfcd
// Size: 0xee
function shoulddodyingcrawl(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (self.forcelongdeath == 4) {
        return 1;
    }
    if (self.currentpose == "prone") {
        return 1;
    }
    if (self.a.movement == "stop") {
        if (randomint(100) <= 20) {
            return 1;
        } else if (abs(self.damageyaw) > 90) {
            return 1;
        }
    } else if (abs(self getmotionangle()) > 90) {
        return 1;
    }
    if (self.currentpose != "prone") {
        var_b33f88434cd7cde9 = asm_getanim(asmname, var_f2b19b25d457c2a6);
        var_c1f650ba5cb83399 = asm_getxanim(var_f2b19b25d457c2a6, var_b33f88434cd7cde9);
        if (!iscrawldeltaallowed(var_c1f650ba5cb83399)) {
            return 0;
        }
    }
    return 1;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10c3
// Size: 0x8f
function playlongdeathintro(asmname, statename, params) {
    thread preventpainforashorttime();
    if (self.var_d5e499e7fe2c490b) {
        self.var_f4cd424dd91129f3 = self.var_d5e499e7fe2c490b;
        self.var_d5e499e7fe2c490b = 0;
    }
    stop_sounds();
    if (istrue(self.forcelongdeathskipintroanim)) {
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
        return;
    }
    setearlyfinishtime();
    playlongdeathanim(asmname, statename, 1);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1159
// Size: 0x5d
function function_c19267f99ab2ffe4(asmname, statename, params) {
    if (istrue(self.var_f4cd424dd91129f3)) {
        self.var_d5e499e7fe2c490b = self.var_f4cd424dd91129f3;
        self.var_f4cd424dd91129f3 = undefined;
        self.desiredtimeofdeath = gettime() + self.var_1544c20e168d97c0;
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11bd
// Size: 0x26
function playlongdeathmercy(asmname, statename, params) {
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11ea
// Size: 0xa8
function playlongdeathidle(asmname, statename, params) {
    if (istrue(self.var_78e092f48b4948ba)) {
        self.var_10d76540f58c6628 = gettime() + self.var_961a07dc03c517ee;
    }
    if (isdefined(self.var_a4988b7f91bf1ac1)) {
        self.var_af13941e84bb5b2e = gettime() + self.var_a4988b7f91bf1ac1;
    }
    var_e5e43f791ae4dcae = longdeathidlesingleloop(asmname, statename, params);
    if (!var_e5e43f791ae4dcae) {
        self.var_af13941e84bb5b2e = gettime();
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1299
// Size: 0xb5
function playshootinglongdeathidle(asmname, statename, params) {
    if (!isdefined(self.desiredtimeofdeath)) {
        self.desiredtimeofdeath = gettime() + randomintrange(4000, 20000);
    }
    self.nextlongdeathshoottime = gettime() + randomintrange(500, 1000);
    self.timestartwaitingtoshoot = gettime();
    setupaiming(statename);
    var_e5e43f791ae4dcae = longdeathidlesingleloop(asmname, statename, params);
    if (!var_e5e43f791ae4dcae) {
        self.var_af13941e84bb5b2e = gettime();
        if (!asm_eventfired(asmname, "end")) {
            asm_fireevent(asmname, "end");
        }
    }
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1355
// Size: 0x25
function longdeathidlesingleloop(asmname, statename, params) {
    return playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1382
// Size: 0x4d
function playlongdeathgrenade(asmname, statename, params) {
    self.var_9be065771308fab4 = gettime() + int(randomfloatrange(1.5, 1.9) * 1000);
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13d6
// Size: 0x49
function playlongdeathgrenadepull(asmname, statename, params) {
    self.asm.longdeathanims.onfinaldeathcallback = &onfinaldeathdropgrenade;
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1426
// Size: 0x8b
function playlongdeathanim(asmname, statename, var_9d93fc2c06b1754f) {
    deathanim = asm_getanim(asmname, statename);
    var_60ce35ef4ea0ccaa = asm_getxanim(statename, deathanim);
    if (self.forcelongdeath > 0 || var_9d93fc2c06b1754f || isanimdeltaallowed(var_60ce35ef4ea0ccaa)) {
        asm_playfacialanim(asmname, statename, var_60ce35ef4ea0ccaa);
        self aisetanim(statename, deathanim);
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    } else {
        return 0;
    }
    return 1;
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b9
// Size: 0x8e
function isanimdeltaallowed(var_509e0922ea1ede0d) {
    if (istrue(self.var_4b6c55151a620061)) {
        return 1;
    }
    var_51e5f0fcb88e95b2 = 30;
    delta = getmovedelta(var_509e0922ea1ede0d, 0, 1);
    var_35e47a94b2620c35 = length(delta);
    var_dfddba6c5a8a43aa = vectornormalize(delta);
    delta = var_dfddba6c5a8a43aa * (var_35e47a94b2620c35 + var_51e5f0fcb88e95b2);
    endpoint = self localtoworldcoords(delta);
    if (!checkstairsoffsetpoint(endpoint)) {
        return 0;
    }
    return self maymovetopoint(endpoint);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154f
// Size: 0x13
function checkstairsoffsetpoint(endpoint) {
    return self isatvalidlongdeathspot(endpoint);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x156a
// Size: 0x67
function playlongdeathfinaldeath(asmname, statename, params) {
    if (isdefined(self.asm.longdeathanims.onfinaldeathcallback)) {
        [[ self.asm.longdeathanims.onfinaldeathcallback ]]();
    }
    playdeathanim(asmname, statename, params);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d8
// Size: 0x146
function onfinaldeathdropgrenade() {
    if (!isdefined(self.var_c17bc31f4ef0a002)) {
        return;
    }
    velocity = (0, 0, 30) - anglestoright(self.angles) * 70;
    if (self.var_c17bc31f4ef0a002 == "tag_accessory_left") {
        velocity = velocity * -1;
    }
    var_6475f779a2c0a2c4 = self gettagorigin(self.var_c17bc31f4ef0a002);
    var_67136a08e22e5888 = var_6475f779a2c0a2c4 + (0, 0, 20);
    var_3c9a8dda8c5b252 = var_6475f779a2c0a2c4 - (0, 0, 20);
    trace = namespace_2a184fc4902783dc::ray_trace(var_67136a08e22e5888, var_3c9a8dda8c5b252, self, undefined, 1);
    if (trace["fraction"] < 0.5) {
        var_6475f779a2c0a2c4 = trace["position"];
    }
    surfacetype = "default";
    if (trace["surfacetype"] != "none") {
        surfacetype = trace["surfacetype"];
    }
    playsoundatpos(var_6475f779a2c0a2c4, "grenade_bounce_heavy");
    self detach(getweaponmodel(self.grenadeweapon.basename), self.var_c17bc31f4ef0a002);
    self magicgrenademanual(var_6475f779a2c0a2c4, velocity, randomfloatrange(2, 3));
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1725
// Size: 0x7a
function longdeathgrenadepullnotetrackhandler(note) {
    if (note == "grenade_left") {
        self.var_c17bc31f4ef0a002 = "tag_accessory_left";
    } else if (note == "grenade_right") {
        self.var_c17bc31f4ef0a002 = "tag_accessory_right";
    }
    /#
        assert(isdefined(self.var_c17bc31f4ef0a002));
    #/
    self attach(getweaponmodel(self.grenadeweapon.basename), self.var_c17bc31f4ef0a002);
}

// Namespace long_death/namespace_41bd8db0b3771ee8
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17a6
// Size: 0x9d
function function_633f7da4f34bba83(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.grenadeweapon) || isnullweapon(self.grenadeweapon) || !isdefined(self.grenadeweapon.basename)) {
        return 0;
    }
    var_f4375b9f3c948e26 = [0:"frag", 1:"frag_grenade_mp"];
    if (!array_contains(var_f4375b9f3c948e26, self.grenadeweapon.basename)) {
        return 0;
    }
    return 1;
}

