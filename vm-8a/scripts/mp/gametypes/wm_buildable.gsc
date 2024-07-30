#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\wm_utility.gsc;
#using scripts\mp\gametypes\wm_buildable.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_29e75e5ebeca383d;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;

#namespace wm_buildable;

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa83
// Size: 0x4f
function function_e2344ec3f70a089c() {
    if (!function_87c403778d48f1b0()) {
        return false;
    }
    level.var_96c8e55e70edd512 = &function_96c8e55e70edd512;
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_Buildable_ToBuild", 1, "neutral", undefined, "ui_icon_minimap_warmode_buildable_empty");
    scripts\mp\gamelogic::setwaypointiconinfo("waypoint_Buildable_Built", 1, "neutral", undefined, "ui_icon_minimap_warmode_buildable_teardown");
    return true;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadb
// Size: 0xf
function function_87c403778d48f1b0() {
    return function_29227adb79acc568("buildableEnabled", 1);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf3
// Size: 0x3d
function function_96c8e55e70edd512(animname) {
    if (animname == "EarthenWall" || animname == "Hesco" || animname == "TankTrap" || animname == "Baffle") {
        return "slow";
    }
    return undefined;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb39
// Size: 0x4ea
function function_e20a97a059fba2ea(objname, triggerent, zonename, currentprogress, origin, angles) {
    if (!isdefined(level.buildables)) {
        level.buildables = [];
    }
    buildinfo = level.buildablepool[objname];
    buildable = spawnstruct();
    buildable.name = objname;
    buildable.triggerent = triggerent;
    buildable.triggeroutline = triggerent.outline;
    buildable.zonename = zonename;
    buildable.id = triggerent.script_label;
    useobject = function_ec8de485b310f295(triggerent, buildinfo.hintstring, buildinfo.buildusetime, buildinfo.buildteam, buildinfo.var_5d8933c950c9a154);
    buildable.useobj = useobject;
    useobject.buildable = buildable;
    buildable.gestureweapon = buildinfo.gestureweapon;
    buildable.var_32a2681a13f18cb1 = buildinfo.var_32a2681a13f18cb1;
    buildable.var_fc147a62066d05bd = buildinfo.var_fc147a62066d05bd;
    buildable.var_b3b899b146453c0c = buildinfo.var_b3b899b146453c0c;
    buildable.var_562da06e56403b2f = buildinfo.var_562da06e56403b2f;
    buildable.phases = [0, 1];
    if (isdefined(buildinfo.phases)) {
        buildable.phases = buildinfo.phases;
    }
    buildable.buildphase = 0;
    buildable.models = [];
    if (isdefined(buildinfo.models) && buildinfo.models.size > 0) {
        for (i = 0; i < buildinfo.models.size; i++) {
            model = spawn("script_model", origin);
            model setmodel(buildinfo.models[i]);
            model.angles = angles;
            buildable.models[i] = model;
            model notsolid();
            model connectpaths();
        }
        assert(buildable.phases.size - buildable.models.size == 1, objname + " Phases unpair, each phase should pair with a model, " + "Phase's count: " + buildable.phases.size - 1 + "Model's count: " + buildable.models.size);
    }
    buildable.var_5474cdc451625a5c = [];
    buildable.idleanimations = [];
    buildable.var_6c25aa98fdfa6d26 = [];
    if (isdefined(buildinfo.animations) && buildinfo.animations.size > 0) {
        animname = buildinfo.animations[0];
        var_5474cdc451625a5c = buildinfo.animations[1];
        idleanimations = buildinfo.animations[2];
        assert(var_5474cdc451625a5c.size == buildable.models.size, animname + " Animations unpair, each build animation should pair with a model, " + "Animation's count: " + var_5474cdc451625a5c.size + "Model's count: " + buildable.models.size);
        assert(var_5474cdc451625a5c.size == idleanimations.size, animname + " Animations unpair, each build animation should pair with an idle animation,  " + "Animation's count: " + var_5474cdc451625a5c.size + "Idle animation's count: " + idleanimations.size);
        buildable.animname = animname;
        for (i = 0; i < var_5474cdc451625a5c.size; i++) {
            buildable.models[i].animname = animname;
            buildable.models[i] scripts\common\anim::setanimtree();
            buildable.var_5474cdc451625a5c[i] = var_5474cdc451625a5c[i];
            buildable.idleanimations[i] = idleanimations[i];
        }
        var_6c25aa98fdfa6d26 = buildinfo.animations[3];
        if (isdefined(var_6c25aa98fdfa6d26)) {
            assertex(var_6c25aa98fdfa6d26.size == buildable.models.size, animname + " Animations unpair, each destroy animation should pair with a model, " + "Animation's count: " + var_6c25aa98fdfa6d26.size + "Model's count: " + buildable.models.size);
            for (i = 0; i < var_6c25aa98fdfa6d26.size; i++) {
                buildable.var_6c25aa98fdfa6d26[i] = var_6c25aa98fdfa6d26[i];
            }
        }
    }
    buildable updateprogress(undefined, currentprogress, 1);
    buildable thread function_4f45e256b6ed7a46();
    level.buildables[level.buildables.size] = buildable;
    return buildable;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102c
// Size: 0x130
function function_4f45e256b6ed7a46() {
    level endon("game_ended");
    if (isdefined(self.zonename)) {
        scripts\mp\flags::gameflagwait(self.zonename + "_objective_start");
        if (is_equal(self.zonename, level.zone.name)) {
            self.useobj.offset3d = (-20, 30, -30);
            self.useobj scripts\mp\gameobjects::requestid(1, 0);
            self.useobj scripts\mp\gameobjects::setobjectivestatusicons("waypoint_Buildable_ToBuild");
            self.useobj scripts\mp\gameobjects::setvisibleteam("any");
            scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(self.useobj.objidnum, 1);
        } else {
            self.useobj releaseid();
        }
    } else {
        assertmsg("There is no zoneName kvp for buildable:" + self.name + "at pos:" + self.origin);
        return;
    }
    scripts\mp\flags::gameflagwait(self.zonename + "_objective_end");
    self.useobj releaseid();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1164
// Size: 0x8c
function removebuildable(buildable) {
    foreach (model in buildable.models) {
        model delete();
    }
    level.buildables = array_remove(level.buildables, buildable);
    buildable.useobj releaseid();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f8
// Size: 0x66
function function_fec3326168e40898() {
    for (i = 0; i < self.phases.size; i++) {
        if (self.phases[i] == self.buildphase) {
            return i;
        }
    }
    assert(" Invalid PhaseIndex for buildable: " + self.name + ", BuildPhase: " + self.buildphase);
    return undefined;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1267
// Size: 0x6e
function function_f07123bb7b8f859c(phasesinfo, currentprogress) {
    buildphase = 0;
    foreach (phase in phasesinfo) {
        if (currentprogress >= phase) {
            buildphase = phase;
        }
    }
    return buildphase;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12de
// Size: 0x16f
function updateprogress(player, progress, isinit) {
    assert(progress >= 0, " Invalid progress for buildable " + self.name);
    buildphase = function_f07123bb7b8f859c(self.phases, progress);
    if (buildphase > self.buildphase) {
        if (istrue(isinit)) {
        } else {
            model = function_aa4e75eb0323bde0();
            if (isdefined(model)) {
                model solid();
                model disconnectpaths();
            }
        }
        self.buildphase = buildphase;
        if (self.buildphase >= 1 && isdefined(self.var_562da06e56403b2f)) {
            level [[ self.var_562da06e56403b2f ]](player, self);
            if (istrue(isinit)) {
                self.useobj function_309305a89c073495();
            } else {
                function_ca34b4eff8624dbb(player, "build");
            }
        } else if (isdefined(self.var_b3b899b146453c0c)) {
            level [[ self.var_b3b899b146453c0c ]](player, self, function_fec3326168e40898());
            function_ca34b4eff8624dbb(player, "build");
        }
        if (buildphase > 0) {
            if (istrue(isinit)) {
            } else {
                function_730668fddabb6225();
            }
        }
        return;
    }
    if (istrue(self.var_9cfe63aea32bf01e)) {
        if (isdefined(self.var_32a2681a13f18cb1)) {
            level [[ self.var_32a2681a13f18cb1 ]](player, self);
        }
        function_730668fddabb6225();
        return;
    }
    if (istrue(isinit)) {
        function_8cb0764ec504b898();
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1455
// Size: 0x12
function function_fad72d32ee97db4f() {
    return self.var_5474cdc451625a5c[function_fec3326168e40898()];
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1470
// Size: 0x12
function function_41164ff94605e5ff() {
    return self.idleanimations[function_fec3326168e40898()];
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148b
// Size: 0x12
function function_aa4e75eb0323bde0() {
    return self.models[function_fec3326168e40898()];
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a6
// Size: 0x64
function function_8cb0764ec504b898() {
    for (i = 0; i < self.idleanimations.size; i++) {
        idleanimname = self.idleanimations[i];
        model = self.models[i];
        if (isdefined(idleanimname) && isdefined(model)) {
            thread function_cb796e5e54e477f6(model, idleanimname);
        }
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1512
// Size: 0x3a
function function_cb796e5e54e477f6(model, animname) {
    model scripts\common\anim::anim_single_solo(model, animname);
    model clearanim(level.scr_anim[self.animname][animname], 0);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1554
// Size: 0xe6
function function_3b27c12823e5dc9() {
    if (isdefined(self.models[1]) && fxexists("wall_explode")) {
        playfxontag(getfx("wall_explode"), self.models[1], "tag_origin");
        playsoundatpos(self.models[1].origin, "jup_launchfacility_buildable_wall_destroyed");
    }
    for (i = 0; i < self.idleanimations.size; i++) {
        idleanimname = self.idleanimations[i];
        model = self.models[i];
        if (isdefined(idleanimname) && isdefined(model)) {
            if (i == self.idleanimations.size - 1) {
                model scripts\common\anim::anim_single_solo(model, idleanimname);
                continue;
            }
            model thread scripts\common\anim::anim_single_solo(model, idleanimname);
        }
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1642
// Size: 0x75
function function_a3395723ec35ab32() {
    if (self.buildphase < 0 || self.buildphase >= 1) {
        return;
    }
    idleanimname = function_41164ff94605e5ff();
    model = function_aa4e75eb0323bde0();
    if (isdefined(idleanimname) && isdefined(model)) {
        model scripts\common\anim::anim_single_solo(model, idleanimname);
        model clearanim(level.scr_anim[self.animname][idleanimname], 0);
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16bf
// Size: 0x59
function function_730668fddabb6225() {
    if (self.buildphase < 0 || self.buildphase >= 1) {
        return;
    }
    var_af23b5811572c735 = function_fad72d32ee97db4f();
    model = function_aa4e75eb0323bde0();
    if (isdefined(var_af23b5811572c735) && isdefined(model)) {
        model thread scripts\common\anim::anim_single_solo(model, var_af23b5811572c735);
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1720
// Size: 0x8c
function function_640f02a78c82e01e() {
    if (!isdefined(self.var_6c25aa98fdfa6d26)) {
        return;
    } else if (self.var_6c25aa98fdfa6d26.size == 0) {
        function_3b27c12823e5dc9();
        return;
    }
    for (i = 0; i < self.var_6c25aa98fdfa6d26.size; i++) {
        var_6c25aa98fdfa6d26 = self.var_6c25aa98fdfa6d26[i];
        model = self.models[i];
        if (isdefined(var_6c25aa98fdfa6d26) && isdefined(model)) {
            model scripts\common\anim::anim_single_solo(model, var_6c25aa98fdfa6d26);
        }
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b4
// Size: 0x1ba
function function_ec8de485b310f295(triggerent, hintstring, buildusetime, buildteam, var_5d8933c950c9a154) {
    useobj = scripts\mp\gameobjects::createuseobject(game["defenders"], triggerent, [], (0, 0, 0), 1, 1);
    if (isdefined(buildteam)) {
        if (buildteam == game["defenders"]) {
            useobj scripts\mp\gameobjects::allowuse("friendly");
        } else {
            useobj scripts\mp\gameobjects::allowuse("enemy");
        }
    }
    useobj.trigger makeusable();
    useobj.skiptouching = undefined;
    useobj.interactteam = "any";
    useobj.var_5d8933c950c9a154 = var_5d8933c950c9a154;
    useobj.id = "wm_buildable";
    useobj.waitforweapononuse = 0;
    useobj.trigger setusepriority(-1 - 1 - 1 - 1);
    useobj scripts\mp\gameobjects::setusetime(buildusetime);
    useobj.buildusetime = buildusetime;
    useobj scripts\mp\gameobjects::setusehinttext(hintstring);
    useobj.trigger setuseholdduration("duration_none");
    useobj.hintstring = hintstring;
    useobj.onbeginuse = &function_5163851170a11648;
    useobj.onenduse = &function_2d71060946497558;
    useobj.onuse = &function_79a41152cd2dc1f7;
    useobj.trigger setuserange(96);
    useobj.trigger setusefov(120);
    useobj.trigger sethintdisplayrange(96);
    useobj.trigger sethintdisplayfov(120);
    return useobj;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1977
// Size: 0x1f2
function function_310f1a814bf9c37c(buildable, triggerent, hintstring, destroyusetime, destroyteam, var_5f7f91ab6d5c8af9) {
    destroyobj = scripts\mp\gameobjects::createuseobject(game["defenders"], triggerent, [], (0, 0, 0), 1, 1);
    destroyobj.buildable = buildable;
    buildable.destroyobj = destroyobj;
    if (isdefined(destroyteam)) {
        if (destroyteam == game["defenders"]) {
            destroyobj scripts\mp\gameobjects::allowuse("friendly");
        } else {
            destroyobj scripts\mp\gameobjects::allowuse("enemy");
        }
    }
    destroyobj.gestureweapon = "jup_war_ges_c4_plant";
    destroyobj.countdowntime = 3;
    destroyobj.var_84de0ddcdac2ea86 = 5 - destroyusetime;
    destroyobj.trigger makeusable();
    destroyobj.skiptouching = undefined;
    destroyobj.interactteam = "any";
    destroyobj.id = "wm_buildable";
    destroyobj.waitforweapononuse = 0;
    destroyobj.trigger setusepriority(-1 - 1 - 1 - 1);
    destroyobj scripts\mp\gameobjects::setusetime(destroyusetime);
    destroyobj scripts\mp\gameobjects::setusehinttext(hintstring);
    destroyobj.trigger setuseholdduration("duration_none");
    destroyobj.onbeginuse = &function_f292eea00564d752;
    destroyobj.onenduse = &function_5d8ecf5ea5db5efa;
    destroyobj.onuse = &function_3164e1c4e7e2f49c;
    destroyobj.var_5f7f91ab6d5c8af9 = var_5f7f91ab6d5c8af9;
    destroyobj.trigger setuserange(96);
    destroyobj.trigger setusefov(120);
    destroyobj.trigger sethintdisplayrange(96);
    destroyobj.trigger sethintdisplayfov(120);
    return destroyobj;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b72
// Size: 0x15
function function_f6a64189578e480f(player) {
    return istrue(self.canusedestroy);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b90
// Size: 0x4d
function function_f292eea00564d752(player) {
    player function_70d8ab10eee1b4d5(0);
    if (isdefined(self.gestureweapon)) {
        player scripts\mp\gametypes\wm_utility::function_31325dbf3212f5ec(self.gestureweapon, 0.5);
    }
    scripts\mp\gametypes\wm_utility::function_e3cd4f9e858ab6ee(player, "destroy");
    thread function_a82088bc1fe748a9(player);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be5
// Size: 0x4f
function function_5d8ecf5ea5db5efa(team, player, result) {
    if (!istrue(result)) {
        if (isdefined(self.gestureweapon)) {
            player scripts\mp\gametypes\wm_utility::function_dac4b69b3dfb574e();
        }
        player function_70d8ab10eee1b4d5(1);
        scripts\mp\gametypes\wm_utility::function_c470fe81662c7d70(player);
    }
    self notify("watch_destroyed_by_splash");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3c
// Size: 0xc0
function function_3164e1c4e7e2f49c(player) {
    self.trigger makeunusable();
    if (isdefined(self.gestureweapon)) {
        player thread scripts\mp\gametypes\wm_utility::function_7fbb162293aff03(self.var_84de0ddcdac2ea86);
    }
    player function_70d8ab10eee1b4d5(1);
    scripts\mp\gametypes\wm_utility::function_c470fe81662c7d70(player);
    bombcountdown(player);
    var_7b1187f4780af448 = self.buildable;
    var_7b1187f4780af448 function_640f02a78c82e01e();
    var_7b1187f4780af448 function_ca34b4eff8624dbb(player, "destroy");
    if (isdefined(self.var_5f7f91ab6d5c8af9)) {
        self [[ self.var_5f7f91ab6d5c8af9 ]](player);
    }
    var_7b1187f4780af448 notify("buildableDestroyed");
    scripts\mp\gametypes\wm_buildable::removebuildable(var_7b1187f4780af448);
    player scripts\mp\gametypes\wm_buildable::function_2591bed1172e3c08(0);
    releaseid();
    self notify("deleted");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d04
// Size: 0x68
function function_62602b0ea1741bd2(model, notifystring) {
    level endon("game_ended");
    self endon("buildableDestroyed");
    model childthread scripts\mp\gametypes\wm_buildable::function_df66656601b04226();
    model waittillmatch("scriptableNotification", notifystring);
    model notify("destroyed");
    self.destroyobj notify("destroyed_by_splash");
    self.destroyobj function_578b25d258f0c8d9(model.var_c1438639b68b2538);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d74
// Size: 0x145
function function_df66656601b04226() {
    level endon("game_ended");
    self endon("destroyed");
    self endon("death");
    self setcandamage(1);
    self.var_c1438639b68b2538 = undefined;
    while (true) {
        if (!isdefined(self)) {
            break;
        }
        self.health = 99999;
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        self.var_c1438639b68b2538 = attacker;
        if (function_75a70b148e9541b7(meansofdeath) && isplayer(attacker)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                var_f56fb412974c87c8 = getsharedfunc("damage", "updateDamageFeedback");
                attacker thread [[ var_f56fb412974c87c8 ]]("hitequip");
            }
        }
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0x50
function function_75a70b148e9541b7(meansofdeath) {
    if (!isdefined(meansofdeath)) {
        return false;
    }
    return meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_EXPLOSIVE" || meansofdeath == "MOD_IMPACT";
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1a
// Size: 0x54
function function_a82088bc1fe748a9(player) {
    level endon("game_ended");
    self endon("deleted");
    self notify("watch_destroyed_by_splash");
    self endon("watch_destroyed_by_splash");
    self waittill("destroyed_by_splash");
    self.canusedestroy = 0;
    scripts\mp\gametypes\wm_utility::function_c470fe81662c7d70(player);
    player function_70d8ab10eee1b4d5(1);
    player scripts\mp\gametypes\wm_utility::function_dac4b69b3dfb574e();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f76
// Size: 0xfc
function function_578b25d258f0c8d9(attacker) {
    self.trigger makeunusable();
    var_7b1187f4780af448 = self.buildable;
    if (isdefined(var_7b1187f4780af448.c4)) {
        var_7b1187f4780af448.c4 setscriptablepartstate("body", "init");
    } else if (isdefined(var_7b1187f4780af448.c4forward) && isdefined(var_7b1187f4780af448.c4back)) {
        var_7b1187f4780af448.c4forward setscriptablepartstate("body", "init");
        var_7b1187f4780af448.c4back setscriptablepartstate("body", "init");
    }
    var_7b1187f4780af448 function_640f02a78c82e01e();
    if (isdefined(self.var_5f7f91ab6d5c8af9)) {
        self [[ self.var_5f7f91ab6d5c8af9 ]](attacker);
    }
    scripts\mp\gametypes\wm_buildable::removebuildable(var_7b1187f4780af448);
    if (isplayer(attacker)) {
        attacker scripts\mp\gametypes\wm_buildable::function_2591bed1172e3c08(0);
    }
    releaseid();
    self notify("deleted");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207a
// Size: 0x3b0
function bombcountdown(player) {
    if (!isdefined(self.buildable.c4)) {
        positionvec = player.origin - self.buildable.models[0].origin;
        var_5f6cefedf599151 = vectordot(positionvec, anglestoforward(self.buildable.models[0].angles));
        if (var_5f6cefedf599151 > 0) {
            self.buildable.c4 = self.buildable.c4forward;
            self.buildable.c4back setscriptablepartstate("body", "init");
            scripts\mp\utility\outline::outlinedisable(self.buildable.c4back.outlineid, self.buildable.c4back);
        } else {
            self.buildable.c4 = self.buildable.c4back;
            self.buildable.c4forward setscriptablepartstate("body", "init");
            scripts\mp\utility\outline::outlinedisable(self.buildable.c4forward.outlineid, self.buildable.c4forward);
        }
    }
    var_e1e93ae309da32ae = self.buildable.c4.origin;
    dangericonent = player scripts\mp\utility\weapon::_launchgrenade("safe_c4_danger_icon_mp", var_e1e93ae309da32ae, (0, 0, 0), 100, 1);
    dangericonent setmodel("tag_origin");
    dangericonent.weapon_object = makeweapon("safe_c4_danger_icon_mp");
    self.buildable.c4 setscriptablepartstate("body", "bomb_planted");
    scripts\mp\utility\outline::outlinedisable(self.buildable.c4.outlineid, self.buildable.c4);
    self.buildable.c4 thread namespace_cc15148f4ce22771::function_f0282e7dbd8851fd(self.countdowntime);
    result = waittill_notify_or_timeout_return("destroyed_by_splash", self.countdowntime);
    self.buildable.c4 setscriptablepartstate("body", "explode");
    if (isdefined(player)) {
        radiusdamage(self.buildable.c4.origin, 256, 200, 105, player, "MOD_EXPLOSIVE", "safe_c4_mp");
    } else {
        radiusdamage(self.buildable.c4.origin, 256, 200, 105, undefined, "MOD_EXPLOSIVE", "safe_c4_mp");
    }
    if (isdefined(dangericonent.headiconid)) {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon(dangericonent.headiconid);
    }
    if (isdefined(dangericonent)) {
        dangericonent delete();
    }
    self.buildable.c4 delaycall(0.2, &setscriptablepartstate, "body", "init");
    self.buildable.c4 notify("death");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2432
// Size: 0xdb
function function_5163851170a11648(player) {
    player function_70d8ab10eee1b4d5(0, self.buildable);
    if (self.buildable function_7c0f592dbb399d93()) {
        waitframe();
    }
    thread function_5b1ba5a4f573aaa3(player);
    function_52a5fcc80a1f8533(player);
    gestureweapon = self.buildable.gestureweapon;
    if (isdefined(player) && isdefined(gestureweapon)) {
        player scripts\mp\gametypes\wm_utility::function_31325dbf3212f5ec(gestureweapon, 0.5);
    }
    var_5d8933c950c9a154 = "build";
    if (isdefined(self.var_5d8933c950c9a154)) {
        var_5d8933c950c9a154 = self.var_5d8933c950c9a154;
    }
    thread scripts\mp\gametypes\wm_utility::function_e3cd4f9e858ab6ee(player, var_5d8933c950c9a154);
    if (isdefined(self.buildable.triggeroutline)) {
        self.buildable.triggeroutline showtoplayer(player);
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2515
// Size: 0xc2
function function_52a5fcc80a1f8533(player) {
    if (!isdefined(self.buildable.models[0])) {
        return;
    }
    self.buildable.models[0] makeusable();
    self.buildable.models[0] disableplayeruse(player);
    self.buildable.models[0] setusepriority(-1 - 1 - 1 - 1);
    self.buildable.models[0] setcursorhint("HINT_NOBUTTON");
    self.buildable.models[0] sethintstring(%MP_JUP_LAUNCHFACILITY/BEINGBUILT);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25df
// Size: 0x111
function function_5b1ba5a4f573aaa3(player) {
    self endon("stop_build");
    self endon("deleted");
    buildendtime = gettime() + (1 - self.buildable.buildphase) * self.usetime;
    progress = 1;
    self.buildable.var_9cfe63aea32bf01e = 1;
    while (progress > 0) {
        if (self.buildable function_7c0f592dbb399d93() && player scripts\mp\utility\weapon::grenadeinpullback()) {
            function_2d71060946497558(undefined, player, 0);
        }
        currenttime = gettime();
        var_b5a2aa5dd294274f = buildendtime - currenttime;
        progress = max(0, var_b5a2aa5dd294274f / self.usetime);
        self.curprogress = (1 - progress) * self.usetime;
        self.buildable updateprogress(player, 1 - progress, 0);
        self.buildable.var_9cfe63aea32bf01e = 0;
        waitframe();
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26f8
// Size: 0x149
function function_2d71060946497558(team, player, result) {
    if (!istrue(result)) {
        self notify("stop_build");
        self.trigger makeunusable();
        if (isdefined(self.buildable.gestureweapon)) {
            player scripts\mp\gametypes\wm_utility::function_dac4b69b3dfb574e();
            delaythread(player.var_3207c3128c689f62, &restoreusetrigger);
        } else {
            delaythread(0.5, &restoreusetrigger);
        }
        if (isdefined(self.buildable.var_fc147a62066d05bd)) {
            level [[ self.buildable.var_fc147a62066d05bd ]](player, self.buildable);
        }
        self.buildable function_a3395723ec35ab32();
    }
    if (isdefined(self.buildable.triggeroutline)) {
        self.buildable.triggeroutline hidefromplayer(player);
    }
    if (isdefined(self.buildable.models[0])) {
        self.buildable.models[0] makeunusable();
    }
    player function_70d8ab10eee1b4d5(1, self.buildable);
    scripts\mp\gametypes\wm_utility::function_c470fe81662c7d70(player);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2849
// Size: 0x4b
function restoreusetrigger() {
    self.trigger makeusable();
    self.trigger setusepriority(-1 - 1 - 1 - 1);
    scripts\mp\gameobjects::setusetime(self.buildusetime);
    scripts\mp\gameobjects::setusehinttext(self.hintstring);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x289c
// Size: 0x20
function function_309305a89c073495() {
    self.trigger makeunusable();
    releaseid();
    self notify("deleted");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c4
// Size: 0x17c
function function_79a41152cd2dc1f7(player) {
    self.trigger makeunusable();
    releaseid();
    if (isdefined(self.buildable.gestureweapon)) {
        player scripts\mp\gametypes\wm_utility::function_dac4b69b3dfb574e();
    }
    self.buildable updateprogress(player, 1, 0);
    if (isdefined(self.buildable.triggeroutline)) {
        self.buildable.triggeroutline hidefromplayer(player);
    }
    player function_70d8ab10eee1b4d5(1, self.buildable);
    scripts\mp\gametypes\wm_utility::function_c470fe81662c7d70(player);
    player function_2591bed1172e3c08(1);
    if (is_equal(self.buildable.zonename, level.zone.name)) {
        self.buildable.useobj releaseid();
        self.buildable.useobj scripts\mp\gameobjects::requestid(1, 0);
        self.buildable.useobj scripts\mp\gameobjects::setobjectivestatusicons("waypoint_Buildable_Built");
        self.buildable.useobj scripts\mp\gameobjects::setvisibleteam("any");
        scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(self.buildable.useobj.objidnum, 1);
    }
    self notify("deleted");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a48
// Size: 0x7c
function function_2591bed1172e3c08(isbuild) {
    assert(isdefined(isbuild));
    var_6a3bdc897ff96d90 = 30000;
    if (isdefined(self.var_4b72d5e8f9b39c0a) && gettime() - self.var_4b72d5e8f9b39c0a < var_6a3bdc897ff96d90) {
        return;
    }
    self.var_4b72d5e8f9b39c0a = gettime();
    if (isbuild) {
        scripts\mp\utility\points::doScoreEvent(#"wm_build");
        return;
    }
    scripts\mp\utility\points::doScoreEvent(#"wm_destroy");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2acc
// Size: 0xf8
function function_70d8ab10eee1b4d5(isallowed, buildable) {
    if (!isallowed) {
        val::set("building", "allow_jump", 0);
        val::set("building", "melee", 0);
        val::set("building", "mantle", 0);
        val::set("building", "sprint", 0);
        val::set("building", "fire", 0);
        val::set("building", "reload", 0);
        val::set("building", "weapon_pickup", 0);
        val::set("building", "execution_victim", 0);
        val::set("building", "supers", 0);
        if (isdefined(buildable) && buildable function_7c0f592dbb399d93()) {
            val::set("building", "offhand_weapons", 0);
        }
        self function_35501b42058d4de9();
        return;
    }
    val::reset_all("building");
    self function_bb04491d50d9e43e();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bcc
// Size: 0x1f
function function_7c0f592dbb399d93() {
    return isdefined(self.gestureweapon) && self.gestureweapon == "nothing_here";
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf4
// Size: 0x9e
function function_ca34b4eff8624dbb(player, eventname) {
    player dlog_recordplayerevent("dlog_event_wm_player_buildable_data", ["match_guid", function_94c7ae7049488358(), "map_name", level.script, "player_team", player.team, "buildable_id", self.id, "event_name", eventname, "round", "" + game["roundsPlayed"]]);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9a
// Size: 0x40
function function_91f9e0306d5d65a0(objname) {
    if (!isdefined(level.buildablepool)) {
        level.buildablepool = [];
    }
    buildinfo = spawnstruct();
    level.buildablepool[objname] = buildinfo;
    return buildinfo;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce3
// Size: 0x1fc
function function_e2f7c2b8cdaefdd7(triggerent, hintstring, destroyusetime, destroyteam, var_5f7f91ab6d5c8af9) {
    destroyobj = scripts\mp\gameobjects::createuseobject(game["defenders"], triggerent, [], (0, 0, 0), 1, 1);
    if (isdefined(destroyteam)) {
        if (destroyteam == game["defenders"]) {
            destroyobj scripts\mp\gameobjects::allowuse("friendly");
        } else {
            destroyobj scripts\mp\gameobjects::allowuse("enemy");
        }
    }
    destroyobj.gestureweapon = "jup_war_ges_c4_plant";
    destroyobj.countdowntime = 3;
    destroyobj.var_84de0ddcdac2ea86 = 5 - destroyusetime;
    destroyobj.trigger makeusable();
    destroyobj.skiptouching = undefined;
    destroyobj.interactteam = "any";
    destroyobj.checkuseconditioninthink = 1;
    destroyobj.canusedestroy = 1;
    destroyobj.id = "wm_buildable";
    destroyobj.waitforweapononuse = 0;
    destroyobj.trigger setusepriority(-1 - 1 - 1 - 1);
    destroyobj scripts\mp\gameobjects::setusetime(destroyusetime);
    destroyobj scripts\mp\gameobjects::setusehinttext(hintstring);
    destroyobj.trigger setuseholdduration("duration_none");
    destroyobj.onbeginuse = &function_f292eea00564d752;
    destroyobj.onenduse = &function_5d8ecf5ea5db5efa;
    destroyobj.onuse = &function_3164e1c4e7e2f49c;
    destroyobj.var_5f7f91ab6d5c8af9 = var_5f7f91ab6d5c8af9;
    destroyobj.usecondition = &function_f6a64189578e480f;
    destroyobj.trigger setuserange(96);
    destroyobj.trigger setusefov(120);
    destroyobj.trigger sethintdisplayrange(96);
    destroyobj.trigger sethintdisplayfov(120);
    return destroyobj;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x4f
function function_4009bbde647f8862(player, buildable) {
    scripts\mp\utility\outline::outlinedisable(buildable.turret.outlineid, buildable.turret);
    buildable.turret.outlineid = undefined;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f3f
// Size: 0x44
function function_8735b98397aaf042(player, buildable) {
    buildable.turret.outlineid = scripts\mp\utility\outline::outlineenableforall(buildable.turret, "shimmer_crafting_wm_buildable", "level_script");
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8b
// Size: 0x184
function function_723905cbc30e0b0a(player, buildable) {
    buildable.turret.outlineid = scripts\mp\utility\outline::outlineenableforall(buildable.turret, "shimmer_crafting_wm_buildable", "level_script");
    buildable.turret notify("turret_fixed");
    buildable.turret setdefaultdroppitch(0);
    buildable.turret setscriptablepartstate("shutdown", "off");
    buildable.turret.scriptable setscriptablepartstate("sfx", "completed");
    playfx(getfx("turret_fixed"), buildable.turret.origin);
    hinttag = "j_trigger";
    hintpos = buildable.turret gettagorigin(hinttag);
    buildable.turret.useobj = scripts\mp\gameobjects::createhintobject(hintpos, "HINT_BUTTON", "hud_icon_turret", %MP/USE_TURRET, undefined, "duration_none", undefined, undefined, undefined, 50);
    buildable.turret.useobj linkto(buildable.turret, hinttag);
    buildable.turret thread function_5da085c617056ddf();
    buildable.turret.maxhealth = 1650;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3117
// Size: 0x53
function function_eefc4642e9cfa7d2() {
    level endon("game_ended");
    self endon("turret_fixed");
    self endon("kill_turret");
    while (true) {
        self setscriptablepartstate("shutdown", "on");
        self playsound("jup_machine_gun_smoke");
        wait 2;
        self setscriptablepartstate("shutdown", "off");
        wait 1;
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3172
// Size: 0x3a
function function_c01e8dd2223036f6() {
    level endon("game_ended");
    self.turret waittill("kill_turret");
    self.useobj.trigger makeunusable();
    scripts\mp\gametypes\wm_buildable::removebuildable(self);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31b4
// Size: 0x1c1
function function_68c608676c867d5e(origin, angles) {
    turret = spawnturret("misc_turret", origin, "manual_turret_jup_mp", 0);
    turret.ammocount = 120;
    turret.health = 9999;
    turret.maxhealth = 1650;
    turret.team = "neutral";
    turret.angles = angles;
    turret setmodel("weapon_wm_mg_mobile_turret");
    turret makeunusable();
    turret setmode("sentry_offline");
    turret setsentryowner(undefined);
    turret setdefaultdroppitch(0);
    turret setturretmodechangewait(1);
    turret setnodeploy(1);
    turret thread function_488548e8c88863f6();
    turret thread scripts\mp\damage::monitordamage(turret.maxhealth, "hitequip", &function_3098fc5fbbf03d1a, &function_97dac16042181936, 0);
    turret scripts\cp_mp\emp_debuff::allow_emp(0);
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel.moverdoesnotkill = 1;
    turret.colmodel.turretparent = turret;
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret, "tag_aim_pivot");
    return turret;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x337e
// Size: 0x1ac
function function_5da085c617056ddf() {
    level endon("game_ended");
    self endon("kill_turret");
    while (true) {
        player = self.useobj waittill("trigger");
        if (!isalive(player) || istrue(self.inuse)) {
            continue;
        }
        self.inuse = 1;
        scripts\mp\utility\outline::outlinedisable(self.outlineid, self);
        player scripts\cp_mp\utility\weapon_utility::saveweaponstates();
        player scripts\cp_mp\utility\inventory_utility::_giveweapon("manual_turret_jup_mp", undefined, undefined, 1);
        result = player scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch("manual_turret_jup_mp", 1, 0, 1);
        if (distance2d(self.useobj.origin, player.origin) > 50) {
            result = 0;
        }
        if (!istrue(result)) {
            self.inuse = undefined;
            if (isdefined(player)) {
                if (isalive(player)) {
                    lastweaponobj = player scripts\cp_mp\utility\weapon_utility::restoreweaponstates(player.lastdroppableweaponobj);
                    player switchtoweaponimmediate(lastweaponobj);
                }
                player _takeweapon("manual_turret_jup_mp");
            }
            continue;
        }
        self setmode("manual");
        player controlturreton(self);
        self.owner = player;
        self.team = player.team;
        self.colmodel.owner = self.owner;
        self.colmodel.team = self.team;
        function_b051576de9e5c175(player);
        thread function_7aa3cf0550137f02(player);
        thread function_a37b6ca7eb2d6e8c(player);
        thread function_1fb0cef396256648(player);
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3532
// Size: 0x4d
function function_b051576de9e5c175(player) {
    player scripts\cp_mp\utility\killstreak_utility::_setvisibiilityomnvarforkillstreak("manual_turret", "on");
    player setclientomnvar("ui_killstreak_countdown", 0);
    player setclientomnvar("ui_mobile_turret_controls", 1);
    player setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3587
// Size: 0x2a
function function_68e5a6da697b6ff(player) {
    player scripts\cp_mp\utility\killstreak_utility::_setvisibiilityomnvarforkillstreak("manual_turret", "off");
    player setclientomnvar("ui_mobile_turret_controls", 0);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b9
// Size: 0xed
function function_7aa3cf0550137f02(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("end_turret_use");
    player endon("disconnect");
    player endon("death");
    self.hideammoindex = 1;
    var_83fb464c27e79a0e = weaponfiretime("manual_turret_jup_mp");
    assertex(isdefined(var_83fb464c27e79a0e) && var_83fb464c27e79a0e > 0, "turretFireDelay is either not defined or less than 0, make sure your turret weapon has a valid fire time");
    while (player isusingturret()) {
        while (player attackbuttonpressed()) {
            self.ammocount--;
            player setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
            if (self.ammocount <= 12) {
                self setscriptablepartstate("hide_ammo_" + self.hideammoindex, "on", 0);
                self.hideammoindex++;
            }
            if (self.ammocount <= 0) {
                self notify("kill_turret");
                break;
            }
            wait var_83fb464c27e79a0e;
        }
        waitframe();
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ae
// Size: 0xf5
function function_88a41bba2ebcecdc(player) {
    self.inuse = undefined;
    self.owner = undefined;
    self.team = "neutral";
    self.colmodel.owner = self.owner;
    self.colmodel.team = self.team;
    self setmode("sentry_offline");
    self.outlineid = scripts\mp\utility\outline::outlineenableforall(self, "shimmer_crafting_wm_buildable", "level_script");
    if (isdefined(player)) {
        player controlturretoff(self);
        function_68e5a6da697b6ff(player);
        if (isalive(player)) {
            lastweaponobj = player scripts\cp_mp\utility\weapon_utility::restoreweaponstates(player.lastdroppableweaponobj);
            player switchtoweaponimmediate(lastweaponobj);
            player setplayerangles(self.lastuserangles);
        }
        player _takeweapon("manual_turret_jup_mp");
        player notify("end_turret_use");
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ab
// Size: 0x6a
function function_a37b6ca7eb2d6e8c(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("disconnect");
    player endon("end_turret_use");
    while (player usebuttonpressed()) {
        waitframe();
    }
    while (true) {
        if (player usebuttonpressed() || player isinexecutionvictim()) {
            function_88a41bba2ebcecdc(player);
            break;
        }
        self.lastuserangles = player getplayerangles();
        waitframe();
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x381d
// Size: 0x3f
function function_1fb0cef396256648(player) {
    level endon("game_ended");
    self endon("kill_turret");
    player endon("end_turret_use");
    player waittill_any_3("death_or_disconnect", "last_stand_start", "death");
    function_88a41bba2ebcecdc(player);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3864
// Size: 0x22
function function_97dac16042181936(data) {
    modifieddamage = data.damage;
    return modifieddamage;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388f
// Size: 0xbe
function function_3098fc5fbbf03d1a(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage, attacker);
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3955
// Size: 0x109
function function_488548e8c88863f6() {
    level endon("game_ended");
    skipshutdown, killer = self waittill("kill_turret");
    function_88a41bba2ebcecdc(self.owner);
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    if (!istrue(skipshutdown)) {
        self playsound("jup_machine_gun_smoke");
        self setscriptablepartstate("shutdown", "on");
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(2);
        self setscriptablepartstate("explode", "regular");
    } else {
        self setscriptablepartstate("explode", "violent");
    }
    self playsound("jup_machine_gun_explode");
    if (isdefined(killer)) {
        if (isdefined(killer.owner) && isplayer(killer.owner)) {
            killer = killer.owner;
        }
        killer function_2591bed1172e3c08(0);
    }
    self.colmodel delete();
    wait 0.2;
    self delete();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a66
// Size: 0xe3
function function_17763afd915cc73c() {
    self notify("stop_get_progress");
    self endon("stop_get_progress");
    level endon("game_ended");
    pathnodes = getvehiclenodearray("tank_trap_pos", "script_noteworthy");
    pathnode = sortbydistance(pathnodes, self.origin)[0];
    scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
    distsquared = distance2dsquared(self.origin, pathnode.origin);
    if (distsquared > 3000) {
        assertmsg(distsquared + "Warning:  Disable the trap at " + self.origin + " , add a vehicle node at the position of tank trap in Radiant, and add script_noteworthy [tank_trap_pos]!!");
        self.buildable.useobj.trigger makeunusable();
    }
    self.progress = pathnode.progress;
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b51
// Size: 0x233
function function_a0f277273d13196a(zoneinfo) {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait(zoneinfo + "_objective_start");
    tank = level.escortvehicles[0];
    while (!isdefined(self.triggerent.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    var_31a72e6f2e39b666 = spawn("script_model", self.triggerent.origin);
    var_31a72e6f2e39b666.angles = self.triggerent.angles;
    var_31a72e6f2e39b666 makeusable();
    var_31a72e6f2e39b666 sethintdisplayrange(256);
    var_31a72e6f2e39b666 sethintdisplayfov(360);
    var_31a72e6f2e39b666 setuserange(256);
    var_31a72e6f2e39b666 setusefov(360);
    var_31a72e6f2e39b666 sethintonobstruction("show");
    var_31a72e6f2e39b666 setcursorhint("HINT_NOBUTTON");
    var_31a72e6f2e39b666 sethintstring(%MP/UNABLE_TO_BUILD_TRAP);
    while (self.buildphase == 0) {
        if (abs(self.triggerent.progress - tank.progress) > tank.var_56df20c41f5b3159 * 400) {
            self.useobj.trigger makeusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 disableplayeruse(player);
            }
        } else {
            self.useobj.trigger makeunusable();
            foreach (player in level.players) {
                var_31a72e6f2e39b666 enableplayeruse(player);
            }
        }
        waitframe();
    }
    var_31a72e6f2e39b666 delete();
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d8c
// Size: 0x1cb
function function_5907a34f5fb0bf04(zoneinfo) {
    level endon("game_ended");
    self endon("deleted");
    scripts\mp\flags::gameflagwait(zoneinfo + "_objective_start");
    ref = self.models[0] getentitynumber();
    tank = level.escortvehicles[0];
    while (!isdefined(self.triggerent.progress) || !isdefined(tank.progress) || !isdefined(tank.var_56df20c41f5b3159)) {
        waitframe();
    }
    while (true) {
        if (!istrue(tank.var_7150b8620d62148[ref]) && istrue(function_4671e4cafead83aa(tank.var_56df20c41f5b3159, self.triggerent.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 1;
            if (self.triggerent.progress > tank.progress) {
                tank.directionblocked[ref] = "forward";
            } else {
                tank.directionblocked[ref] = "backward";
            }
        }
        msg = waittill_notify_or_timeout_return("trap_destroyed", 0.2);
        if (msg == "trap_destroyed") {
            tank.var_7150b8620d62148[ref] = 0;
            break;
        }
        if (istrue(tank.var_7150b8620d62148[ref]) && !istrue(function_4671e4cafead83aa(tank.var_56df20c41f5b3159, self.triggerent.progress, tank.progress))) {
            tank.var_7150b8620d62148[ref] = 0;
        }
    }
}

// Namespace wm_buildable / scripts\mp\gametypes\wm_buildable
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5f
// Size: 0x32
function function_4671e4cafead83aa(var_56df20c41f5b3159, trapprogress, tankprogress) {
    return tankprogress - trapprogress > var_56df20c41f5b3159 * 170 * -1 && tankprogress - trapprogress < var_56df20c41f5b3159 * 210;
}

