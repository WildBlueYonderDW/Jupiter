#using script_159f253f9bd2314e;
#using scripts\anim\utility_common;
#using scripts\asm\asm;
#using scripts\asm\soldier\death;
#using scripts\common\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace long_death;

// Namespace long_death / scripts\asm\soldier\long_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30d
// Size: 0x163
function preventpainforashorttime() {
    self endon("kill_long_death");
    self endon("death");
    self.flashbangimmunity = 1;
    self.longdeathstarting = 1;
    self.doinglongdeath = 1;
    self notify("long_death");
    self.health = 10000;
    self.threatbias -= 2000;
    function_58585bbaa46f6bba(gettime() + 3000);
    function_69e0176e97b04cc7(gettime() + 3000);
    wait 0.75;
    if (self.health > 1) {
        self.health = 1;
    }
    wait 0.05;
    self.longdeathstarting = undefined;
    self.a.mayonlydie = 1;
    wait 1;
    if (isdefined(level.player) && distancesquared(self.origin, level.player.origin) < 1048576) {
        function_9912fb866ada47d7(randomintrange(10, 30));
        function_58585bbaa46f6bba(gettime() + randomintrange(15000, 60000));
    } else {
        function_9912fb866ada47d7(randomintrange(5, 12));
        function_58585bbaa46f6bba(gettime() + randomintrange(5000, 25000));
    }
    function_69e0176e97b04cc7(gettime() + randomintrange(7000, 13000));
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x478
// Size: 0x1a4
function dyingcrawlbackaim(statename) {
    self endon("death");
    self notify("end_dying_crawl_back_aim");
    self endon("end_dying_crawl_back_aim");
    if (isagent(self)) {
        return;
    }
    aim4 = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_4"));
    aim6 = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_6"));
    aim4_knob = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_4_knob"));
    aim6_knob = asm_getxanim(statename, asm_lookupanimfromalias(statename, "aim_6_knob"));
    wait 0.05;
    self aisetanimlimited(aim4, 1, 0);
    self aisetanimlimited(aim6, 1, 0);
    prevyaw = 0;
    while (true) {
        aimyaw = getyawtoenemy();
        diff = angleclamp180(aimyaw - prevyaw);
        if (abs(diff) > 3) {
            diff = sign(diff) * 3;
        }
        aimyaw = angleclamp180(prevyaw + diff);
        if (aimyaw < 0) {
            if (aimyaw < -45) {
                aimyaw = -45;
            }
            weight = aimyaw / -45;
            self setanim(aim4_knob, weight, 0.05);
            self setanim(aim6_knob, 0, 0.05);
        } else {
            if (aimyaw > 45) {
                aimyaw = 45;
            }
            weight = aimyaw / 45;
            self setanim(aim6_knob, weight, 0.05);
            self setanim(aim4_knob, 0, 0.05);
        }
        prevyaw = aimyaw;
        wait 0.05;
    }
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x624
// Size: 0x67
function setupaiming(statename) {
    clearknob = asm_lookupanimfromalias(statename, "clear_knob");
    self aiclearanim(clearknob, 0.2);
    if (isdefined(self.a.bdyingbackidleandshootsetup)) {
        return;
    }
    thread dyingcrawlbackaim(statename);
    self.a.bdyingbackidleandshootsetup = 1;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x693
// Size: 0x113
function dodyingcrawlbloodsmear() {
    self endon("death");
    origintag = "J_SpineLower";
    angletag = "tag_origin";
    fx_rate = 6;
    fx = level._effect["crawling_death_blood_smear"];
    if (isdefined(self.a.crawl_fx_rate)) {
        fx_rate = self.a.crawl_fx_rate;
    }
    if (isdefined(self.a.crawl_fx)) {
        fx = level._effect[self.a.crawl_fx];
    }
    while (fx_rate) {
        org = self gettagorigin(origintag);
        angles = self gettagangles(angletag);
        forward = anglestoright(angles);
        up = anglestoforward((270, 0, 0));
        playfx(fx, org, up, forward);
        wait fx_rate;
    }
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae
// Size: 0x23
function iscrawldeltaallowed(thexanim) {
    if (self.force_num_crawls > 0) {
        return 1;
    }
    return isanimdeltaallowed(thexanim);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7da
// Size: 0x51
function startdyingcrawlbackaimsoon(statename) {
    self endon(statename + "_finished");
    wait 0.1;
    if (isdefined(self.a.bdyingbackidleandshootsetup)) {
        return;
    }
    thread dyingcrawlbackaim(statename);
    self.a.bdyingbackidleandshootsetup = 1;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x833
// Size: 0xbc
function handlebackcrawlnotetracks(statename, note, params) {
    return_value = 0;
    if (!isdefined(self.bdoingbloodsmear) && issubstr(note, "bodyfall")) {
        thread dodyingcrawlbloodsmear();
    } else if (note == "fire_spray") {
        if (!canseeenemy()) {
            return true;
        }
        if (!self function_9ca5b32676727f92()) {
            return true;
        }
        shootenemywrapper();
        return true;
    } else if (note == "pistol_pickup") {
        thread startdyingcrawlbackaimsoon(statename);
        return false;
    } else if (note == "fire") {
        shootenemywrapper();
        return true;
    } else if (note == "code_move") {
        return true;
    }
    return false;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8f8
// Size: 0x136
function playdyingcrawl(asmname, statename, params) {
    self endon(statename + "_finished");
    if (self.force_num_crawls > 0) {
        numcrawls = self.force_num_crawls;
    } else {
        numcrawls = randomintrange(1, 5);
    }
    animid = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, animid);
    assertex(animhasnotetrack(xanim, "<dev string:x1c>"), "<dev string:x29>" + xanim + "<dev string:x32>");
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, xanim);
    for (i = 0; i < numcrawls; i++) {
        if (!iscrawldeltaallowed(xanim)) {
            break;
        }
        if (isdefined(self.custom_crawl_sound)) {
            self playsound(self.custom_crawl_sound);
        }
        while (true) {
            endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
            if (endnote == "code_move") {
                break;
            }
        }
    }
    asm_fireevent(asmname, "dying_crawl_done");
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa36
// Size: 0x154
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
    crawlanim = asm_getanim(asmname, statename);
    crawlxanim = asm_getxanim(statename, crawlanim);
    assert(animhasnotetrack(crawlxanim, "<dev string:x1c>"));
    asm_playfacialanim(asmname, statename, crawlxanim);
    self aisetanim(statename, crawlanim);
    for (i = 0; i < numcrawls; i++) {
        if (!iscrawldeltaallowed(crawlxanim)) {
            break;
        }
        while (true) {
            endnote = asm_donotetrackswithinterceptor(asmname, statename, &handlebackcrawlnotetracks);
            if (endnote == "end") {
                break;
            }
        }
    }
    if (!istrue(self.var_d5e499e7fe2c490b)) {
        self.desiredtimeofdeath = gettime() + randomintrange(4000, 20000);
    }
    asm_fireevent(asmname, "dying_back_crawl_done");
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb92
// Size: 0x30
function playcrawlflipover(asmname, statename, params) {
    utility::lookatentity();
    asm_playanimstatewithnotetrackinterceptor(asmname, statename, &handlebackcrawlnotetracks);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xbca
// Size: 0x69
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

// Namespace long_death / scripts\asm\soldier\long_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3b
// Size: 0x44
function setearlyfinishtime() {
    if (!isdefined(self.asm.longdeathanims)) {
        self.asm.longdeathanims = spawnstruct();
    }
    self.var_4ad177ab3ddde8fd = gettime() + 2000;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc87
// Size: 0xaa
function playdyingbackshoot(asmname, statename, params) {
    self endon(statename + "_finished");
    setupaiming(statename);
    while (true) {
        animid = asm_getanim(asmname, statename);
        xanim = asm_getxanim(statename, animid);
        asm_playfacialanim(asmname, statename, xanim);
        self aisetanim(statename, animid);
        endnote = asm_donotetrackswithinterceptor(asmname, statename, &handlebackcrawlnotetracks);
        if (endnote == "end") {
            if (!asm_eventfired(asmname, "end")) {
                asm_fireevent(asmname, "end");
            }
        }
    }
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd39
// Size: 0x3e
function choosedyingbackidle(asmname, statename, params) {
    if (istrue(self.longdeathnoncombat)) {
        return asm_lookupanimfromalias(statename, "noncombat");
    }
    return asm_chooseanim(asmname, statename, params);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd80
// Size: 0xc4
function playdyingbackidle(asmname, statename, params) {
    self endon(statename + "_finished");
    if (!istrue(self.longdeathnoncombat)) {
        self.nextlongdeathshoottime = gettime() + randomintrange(500, 1000);
        setupaiming(statename);
    }
    prevanim = undefined;
    while (true) {
        animid = asm_getanim(asmname, statename);
        xanim = asm_getxanim(statename, animid);
        if (!isdefined(prevanim) || animid != prevanim) {
            self aisetanim(statename, animid);
            prevanim = animid;
        }
        asm_playfacialanim(asmname, statename, xanim);
        prevanim = animid;
        asm_donotetrackssingleloop(asmname, statename, xanim, asm_getnotehandler(asmname, statename));
    }
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe4c
// Size: 0x3a
function playstumblingpaintransition(asmname, statename, params) {
    thread preventpainforashorttime();
    setearlyfinishtime();
    utility::lookatentity();
    asm_playanimstate(asmname, statename);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe8e
// Size: 0x154
function playstumblingwander(asmname, statename, params) {
    self endon(statename + "_finished");
    animid = asm_getanim(asmname, statename);
    collapsestatename = "stumbling_pain_collapse_death";
    var_91bebedd6b5e41fe = asm_getanim(asmname, collapsestatename);
    collapsexanim = asm_getxanim(collapsestatename, var_91bebedd6b5e41fe);
    assert(isdefined(animid));
    xanim = asm_getxanim(statename, animid);
    if (!animhasnotetrack(xanim, "code_move")) {
        asm_fireevent(asmname, "pain_wander_done");
        return;
    }
    collapsedelta = getmovedelta(collapsexanim);
    var_9de3e590348729f6 = randomintrange(1, 3);
    self aisetanim(statename, animid);
    asm_playfacialanim(asmname, statename, xanim);
    while (var_9de3e590348729f6 > 0) {
        endpos = self localtoworldcoords(collapsedelta);
        if (!self maymovetopoint(endpos)) {
            break;
        }
        while (true) {
            endnote = asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
            if (endnote == "code_move") {
                break;
            }
        }
        var_9de3e590348729f6--;
    }
    asm_fireevent(asmname, "pain_wander_done");
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xfea
// Size: 0x2d
function hasbeenhitwithemp(asmname, statename, tostatename, params) {
    return istrue(self.isempd);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1020
// Size: 0xed
function shoulddodyingcrawl(asmname, statename, tostatename, params) {
    if (self.forcelongdeath == 4) {
        return true;
    }
    if (self.currentpose == "prone") {
        return true;
    }
    if (self.a.movement == "stop") {
        if (randomint(100) <= 20) {
            return true;
        } else if (abs(self.damageyaw) > 90) {
            return true;
        }
    } else if (abs(self getmotionangle()) > 90) {
        return true;
    }
    if (self.currentpose != "prone") {
        crawlanim = asm_getanim(asmname, tostatename);
        crawlxanim = asm_getxanim(tostatename, crawlanim);
        if (!iscrawldeltaallowed(crawlxanim)) {
            return false;
        }
    }
    return true;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1116
// Size: 0x8e
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

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x11ac
// Size: 0x5c
function function_c19267f99ab2ffe4(asmname, statename, params) {
    if (istrue(self.var_f4cd424dd91129f3)) {
        self.var_d5e499e7fe2c490b = self.var_f4cd424dd91129f3;
        self.var_f4cd424dd91129f3 = undefined;
        self.desiredtimeofdeath = gettime() + self.revive_bleedouttime;
    }
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1210
// Size: 0x25
function playlongdeathmercy(asmname, statename, params) {
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x123d
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

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12ed
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

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13aa
// Size: 0x24
function longdeathidlesingleloop(asmname, statename, params) {
    return playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13d7
// Size: 0x4c
function playlongdeathgrenade(asmname, statename, params) {
    self.var_9be065771308fab4 = gettime() + int(randomfloatrange(1.5, 1.9) * 1000);
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x142b
// Size: 0x48
function playlongdeathgrenadepull(asmname, statename, params) {
    self.asm.longdeathanims.onfinaldeathcallback = &onfinaldeathdropgrenade;
    playlongdeathanim(asmname, statename, 0);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x147b
// Size: 0x8a
function playlongdeathanim(asmname, statename, var_9d93fc2c06b1754f) {
    deathanim = asm_getanim(asmname, statename);
    deathxanim = asm_getxanim(statename, deathanim);
    if (self.forcelongdeath > 0 || var_9d93fc2c06b1754f || isanimdeltaallowed(deathxanim)) {
        asm_playfacialanim(asmname, statename, deathxanim);
        self aisetanim(statename, deathanim);
        asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    } else {
        return false;
    }
    return true;
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x150e
// Size: 0x8a
function isanimdeltaallowed(thexanim) {
    if (istrue(self.var_4b6c55151a620061)) {
        return 1;
    }
    var_51e5f0fcb88e95b2 = 30;
    delta = getmovedelta(thexanim, 0, 1);
    deltalength = length(delta);
    deltadirection = vectornormalize(delta);
    delta = deltadirection * (deltalength + var_51e5f0fcb88e95b2);
    endpoint = self localtoworldcoords(delta);
    if (!checkstairsoffsetpoint(endpoint)) {
        return 0;
    }
    return self maymovetopoint(endpoint);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a1
// Size: 0x12
function checkstairsoffsetpoint(endpoint) {
    return self isatvalidlongdeathspot(endpoint);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0x66
function playlongdeathfinaldeath(asmname, statename, params) {
    if (isdefined(self.asm.longdeathanims.onfinaldeathcallback)) {
        [[ self.asm.longdeathanims.onfinaldeathcallback ]]();
    }
    playdeathanim(asmname, statename, params);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162a
// Size: 0x141
function onfinaldeathdropgrenade() {
    if (!isdefined(self.var_c17bc31f4ef0a002)) {
        return;
    }
    velocity = (0, 0, 30) - anglestoright(self.angles) * 70;
    if (self.var_c17bc31f4ef0a002 == "tag_accessory_left") {
        velocity *= -1;
    }
    releasepoint = self gettagorigin(self.var_c17bc31f4ef0a002);
    var_67136a08e22e5888 = releasepoint + (0, 0, 20);
    var_3c9a8dda8c5b252 = releasepoint - (0, 0, 20);
    trace = scripts\engine\trace::ray_trace(var_67136a08e22e5888, var_3c9a8dda8c5b252, self, undefined, 1);
    if (trace["fraction"] < 0.5) {
        releasepoint = trace["position"];
    }
    surfacetype = "default";
    if (trace["surfacetype"] != "none") {
        surfacetype = trace["surfacetype"];
    }
    playsoundatpos(releasepoint, "grenade_bounce_heavy");
    self detach(getweaponmodel(self.grenadeweapon.basename), self.var_c17bc31f4ef0a002);
    self magicgrenademanual(releasepoint, velocity, randomfloatrange(2, 3));
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1773
// Size: 0x79
function longdeathgrenadepullnotetrackhandler(note) {
    if (note == "grenade_left") {
        self.var_c17bc31f4ef0a002 = "tag_accessory_left";
    } else if (note == "grenade_right") {
        self.var_c17bc31f4ef0a002 = "tag_accessory_right";
    }
    assert(isdefined(self.var_c17bc31f4ef0a002));
    self attach(getweaponmodel(self.grenadeweapon.basename), self.var_c17bc31f4ef0a002);
}

// Namespace long_death / scripts\asm\soldier\long_death
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x17f4
// Size: 0x9d
function function_633f7da4f34bba83(asmname, statename, tostatename, params) {
    if (!isdefined(self.grenadeweapon) || isnullweapon(self.grenadeweapon) || !isdefined(self.grenadeweapon.basename)) {
        return false;
    }
    var_f4375b9f3c948e26 = ["frag", "frag_grenade_mp"];
    if (!array_contains(var_f4375b9f3c948e26, self.grenadeweapon.basename)) {
        return false;
    }
    return true;
}

