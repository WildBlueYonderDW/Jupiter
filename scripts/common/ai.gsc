// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\asm\shared\utility.gsc;

#namespace ai;

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x599
// Size: 0xa0
function ai_init() {
    flag_name = self.var_ae3ea15396b65c1f + "_animsetname_init";
    if (!flag(flag_name)) {
        flag_set(flag_name);
        callback::callback("on_first_ai_init");
    }
    callback::function_d4f1fdfa332469ec(#"ai");
    callback::function_d4f1fdfa332469ec(self.type);
    callback::function_d4f1fdfa332469ec(self.var_ae3ea15396b65c1f);
    if (isdefined(self.subclass)) {
        callback::function_d4f1fdfa332469ec(self.subclass);
    }
    ent_flag_set("ai_init_complete");
    callback::callback("on_ai_init");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x640
// Size: 0x42
function function_67ec1df786cad61a() {
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        player function_d7edb8535850db35();
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x689
// Size: 0xa
function function_d7edb8535850db35() {
    self function_d068af002e4ecab5();
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69a
// Size: 0x73
function set_forcegoal() {
    if (isdefined(self.set_forcedgoal)) {
        return;
    }
    self.oldfightdist = self.pathenemyfightdist;
    self.oldmaxdist = self.pathenemylookahead;
    self.oldmaxsight = self.maxsightdistsqrd;
    self.pathenemyfightdist = 8;
    self.pathenemylookahead = 8;
    self.maxsightdistsqrd = 1;
    self.set_forcedgoal = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x714
// Size: 0x51
function unset_forcegoal() {
    if (!isdefined(self.set_forcedgoal)) {
        return;
    }
    self.pathenemyfightdist = self.oldfightdist;
    self.pathenemylookahead = self.oldmaxdist;
    self.maxsightdistsqrd = self.oldmaxsight;
    self.set_forcedgoal = undefined;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76c
// Size: 0xe
function disable_exits() {
    self.disableexits = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x781
// Size: 0xd
function enable_exits() {
    self.disableexits = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x795
// Size: 0xd
function disable_turnanims() {
    self.var_4cd89215083d17cd = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a9
// Size: 0xe
function enable_turnanims() {
    self.var_4cd89215083d17cd = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7be
// Size: 0xe
function disable_arrivals() {
    self.disablearrivals = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d3
// Size: 0x15
function enable_arrivals() {
    self endon("death");
    waittillframeend();
    self.disablearrivals = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ef
// Size: 0x21
function set_rebel(var_5b0a55b4e162fee3) {
    self._blackboard.var_96a8cbc0dfd31486 = var_5b0a55b4e162fee3;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x817
// Size: 0x21
function disable_long_death() {
    /#
        assertex(isalive(self), "Tried to disable long death on a non living thing");
    #/
    self.var_98add129a7ecb962 = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x83f
// Size: 0x22
function enable_long_death() {
    /#
        assertex(isalive(self), "Tried to enable long death on a non living thing");
    #/
    self.var_98add129a7ecb962 = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x868
// Size: 0x41
function enable_danger_react(duration) {
    duration = duration * 1000;
    /#
        assert(isai(self));
    #/
    self.dodangerreact = 1;
    self.dangerreactduration = duration;
    self.neversprintforvariation = undefined;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b0
// Size: 0x27
function disable_danger_react() {
    /#
        assert(isai(self));
    #/
    self.dodangerreact = 0;
    self.neversprintforvariation = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8de
// Size: 0xd
function disable_surprise() {
    self.newenemyreactiondistsq = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f2
// Size: 0x50
function spawn_failed(ent) {
    if (!isalive(ent)) {
        return 1;
    }
    if (utility::issp() && !isdefined(ent.finished_spawning)) {
        ent waittill_either("finished spawning", "death");
    }
    if (isalive(ent)) {
        return 0;
    }
    return 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94a
// Size: 0x92
function gun_remove() {
    if (isai(self)) {
        script_func("anim_placeweaponon", self.weapon, "none");
    } else if (isdefined(self.fake_weapon_models)) {
        gun_remove_fake();
        self.var_777e760679ae69c5 = 1;
    } else if (isweapon(self.weapon)) {
        weaponmodel = getweaponmodel(self.weapon);
        if (isdefined(weaponmodel) && weaponmodel != "") {
            self detach(weaponmodel, "tag_weapon_right");
        }
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e3
// Size: 0x70
function gun_remove_fake() {
    if (isdefined(self.fake_weapon_models)) {
        for (i = self.fake_weapon_models.size - 1; i >= 0; i--) {
            if (i == 0) {
                self detach(self.fake_weapon_models[i], "tag_weapon_right");
            } else {
                self detach(self.fake_weapon_models[i]);
            }
        }
        self.fake_weapon_models = undefined;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5a
// Size: 0xd1
function gun_create_fake(models) {
    foreach (model in models) {
        if (issubstr(model, "toprail") || issubstr(model, "railcust")) {
            if (models.size > 1) {
                models = array_remove(models, model);
                models = array_insert(models, model, 1);
            }
        }
    }
    for (i = 0; i < models.size; i++) {
        if (i == 0) {
            self attach(models[i], "tag_weapon_right");
        } else {
            self attach(models[i]);
        }
    }
    self.fake_weapon_models = models;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb32
// Size: 0xb6
function gun_recall() {
    if (isai(self)) {
        script_func("anim_placeweaponon", self.weapon, "right");
    } else {
        weaponobject = self.weapon;
        if (isweapon(self.weapon_object) && !isnullweapon(self.weapon_object) && isnullweapon(self.weapon)) {
            weaponobject = self.weapon_object;
        }
        if (istrue(self.var_777e760679ae69c5)) {
            gun_create_fake(getweaponattachmentworldmodels(weaponobject));
            self.var_777e760679ae69c5 = undefined;
        } else {
            self attach(getweaponmodel(weaponobject), "tag_weapon_right");
        }
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef
// Size: 0x93
function set_gunpose(type, gundiscipline) {
    /#
        var_50f938af0ffcde52["] has no choose_long_death state"] = 1;
        var_50f938af0ffcde52["scriptables_ready"] = 1;
        var_50f938af0ffcde52["70"] = 1;
        var_50f938af0ffcde52["stop_wind_debug"] = 1;
        var_50f938af0ffcde52["mglAddActiveSmoke() is called with unsupported smoke type"] = 1;
        /#
            assertex(isdefined(var_50f938af0ffcde52[type]), "warlord" + type + "<unknown string>");
        #/
    #/
    if (type == "automatic") {
        type = undefined;
    }
    self.gunposeoverride = type;
    self.gundiscipline = isdefined(gundiscipline) && gundiscipline;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc89
// Size: 0x18
function reset_gunpose() {
    self.gunposeoverride = undefined;
    self.gundiscipline = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xca8
// Size: 0x1d
function poi_enable(val, startstruct) {
    namespace_34bf5965727c0922::toggle_poi(val, startstruct);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccc
// Size: 0x38
function stop_use_turret() {
    self notify("stop_use_turret");
    self unlink();
    self._blackboard.requestedturret = undefined;
    self._blackboard.requestedturretpose = undefined;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0b
// Size: 0xe6
function magic_bullet_shield(var_7a28bdd1351dcbfb) {
    if (!isdefined(var_7a28bdd1351dcbfb)) {
        var_7a28bdd1351dcbfb = 0;
    }
    if (isai(self)) {
        /#
            assertex(isalive(self), "Tried to do magic_bullet_shield on a dead or undefined guy.");
        #/
        /#
            assertex(!self.delayeddeath, "Tried to do magic_bullet_shield on a guy about to die.");
        #/
        /#
            assertex(!isdefined(self.syncedmeleetarget) || !self.var_a97ac004f00c5df9, "Trying to turn on magic_bullet_shield while synced melee in progress (might be about to die).");
        #/
    } else {
        self.health = 100000;
    }
    /#
        assertex(!isdefined(self.magic_bullet_shield), "Can't call magic bullet shield on a character twice. Use make_hero and remove_heroes_from_array so that you don't end up with shielded guys in your logic.");
    #/
    if (isai(self)) {
        val::set("magic_bullet_shield", "attackeraccuracy", 0.1);
    }
    /#
        if (!var_7a28bdd1351dcbfb) {
            thread magic_bullet_death_detection();
        }
    #/
    val::set("magic_bullet_shield", "damageshield", 1);
    self.magic_bullet_shield = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf8
// Size: 0x46
function stop_magic_bullet_shield() {
    self notify("stop_magic_bullet_shield");
    /#
        assertex(isdefined(self.magic_bullet_shield) && self.magic_bullet_shield, "Tried to stop magic bullet shield on a guy without magic bulletshield");
    #/
    val::function_c9d0b43701bdba00("magic_bullet_shield");
    self.magic_bullet_shield = undefined;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe45
// Size: 0x73
function magic_bullet_death_detection() {
    /#
        self endon("<unknown string>");
        export = self.export;
        entnum = self getentitynumber();
        self waittill("<unknown string>");
        if (isdefined(self)) {
            /#
                assertex(0, "<unknown string>" + export + "<unknown string>");
            #/
        } else {
            /#
                assertex(0, "<unknown string>" + export + "<unknown string>");
            #/
        }
        export = export;
    #/
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xebf
// Size: 0x3c
function force_long_death_on_back_with_pistol(var_5fa1543fa4653811) {
    self.forcelongdeath = 4;
    if (istrue(var_5fa1543fa4653811)) {
        self.skipdyingbackcrawl = 1;
    }
    self asmsetstate(self.asmname, "choose_long_death");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf02
// Size: 0xbb
function function_a1404ef1116dbe2c(var_5fa1543fa4653811, var_f8fba28c44387fd8) {
    /#
        assertex(self asmhasstate(self.asmname, "choose_long_death"), "My current asm [" + self.asmname + "] has no choose_long_death state");
    #/
    var_535b99b940095f4 = [0:29, 1:31, 2:33, 3:35];
    var_f4cad9d2914c9deb = randomint(4);
    self.forcelongdeath = var_535b99b940095f4[var_f4cad9d2914c9deb];
    if (isdefined(var_f8fba28c44387fd8)) {
        self.var_d0bea6cf479a9c = var_f8fba28c44387fd8;
    }
    if (isdefined(var_5fa1543fa4653811)) {
        self.skipdyingbackcrawl = var_5fa1543fa4653811;
    }
    self asmsetstate(self.asmname, "choose_long_death");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc4
// Size: 0x52
function function_b9307a16e291255e(var_5fa1543fa4653811, var_f8fba28c44387fd8) {
    self.forcelongdeath = 37;
    if (isdefined(var_f8fba28c44387fd8)) {
        self.var_d0bea6cf479a9c = var_f8fba28c44387fd8;
    }
    if (isdefined(var_5fa1543fa4653811)) {
        self.skipdyingbackcrawl = var_5fa1543fa4653811;
    }
    self asmsetstate(self.asmname, "choose_long_death");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101d
// Size: 0xe
function force_long_death_crawling_away() {
    self.forcelongdeath = 3;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1032
// Size: 0xe
function force_long_death_stumbling() {
    self.forcelongdeath = 2;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1047
// Size: 0x14f
function find_and_teleport_to_cover(var_66fca63b388f049) {
    var_6cb7c526ca1b2907 = 0;
    frompoint = undefined;
    var_75d29d4786ae4b4d = 1;
    var_386c209c4be9e91 = self findbestcovernode(var_66fca63b388f049, var_6cb7c526ca1b2907, frompoint, var_75d29d4786ae4b4d);
    if (isdefined(var_386c209c4be9e91)) {
        var_d38a5eb1292b482c = var_386c209c4be9e91.angles;
        var_cee7a3c264a91076 = var_386c209c4be9e91.origin;
        if (!issubstr(var_386c209c4be9e91.type, "Prone")) {
            if (issubstr(var_386c209c4be9e91.type, "Left")) {
                var_d38a5eb1292b482c = var_d38a5eb1292b482c + (0, 90, 0);
            } else if (issubstr(var_386c209c4be9e91.type, "Right") || issubstr(var_386c209c4be9e91.type, "Cover Crouch") || issubstr(var_386c209c4be9e91.type, "Conceal") || issubstr(var_386c209c4be9e91.type, "Cover Stand")) {
                var_d38a5eb1292b482c = var_d38a5eb1292b482c - (0, 90, 0);
            }
        }
        self forceteleport(var_cee7a3c264a91076, var_d38a5eb1292b482c);
        self usecovernode(var_386c209c4be9e91, 1);
        self setgoalnode(var_386c209c4be9e91);
        return 1;
    }
    return 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x119e
// Size: 0x5a
function aigroundturret_requestmount(turret) {
    if (self._blackboard.aigroundturretstate == "none") {
        self._blackboard.aigroundturretstate = "turret_mount_requested";
        self._blackboard.aigroundturretref = turret;
        return 1;
    }
    return 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1200
// Size: 0x38
function aigroundturret_mountcompleted() {
    if (self._blackboard.aigroundturretstate == "turret_mount_requested") {
        self._blackboard.aigroundturretstate = "turret_mounted";
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123f
// Size: 0xa6
function aigroundturret_cancel() {
    if (self._blackboard.aigroundturretstate != "none") {
        if (self._blackboard.aigroundturretstate == "turret_mount_requested") {
            self._blackboard.aigroundturretstate = "none";
            self._blackboard.aigroundturretref = undefined;
            return 1;
        } else if (self._blackboard.aigroundturretstate == "turret_mounted") {
            self._blackboard.aigroundturretstate = "turret_dismount_requested";
            return 1;
        }
    }
    return 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ed
// Size: 0x4b
function aigroundturret_dismountcompleted() {
    if (self._blackboard.aigroundturretstate == "turret_dismount_requested") {
        self._blackboard.aigroundturretstate = "none";
        self._blackboard.aigroundturretref = undefined;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x133f
// Size: 0x58
function ai_operate_turret(turret_operator, turret) {
    if (!isdefined(turret_operator) || !isalive(turret_operator)) {
        return;
    }
    var_dcdf8390f44ee5ce = turret_operator aigroundturret_requestmount(turret);
    if (var_dcdf8390f44ee5ce) {
        turret_operator.ignoreall = 1;
        turret_operator.ignoreme = 1;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x139e
// Size: 0x4d
function ai_dismount_turret(turret_operator) {
    if (!isdefined(turret_operator) || !isalive(turret_operator)) {
        return;
    }
    canceled = turret_operator aigroundturret_cancel();
    if (canceled) {
        turret_operator.ignoreall = 0;
        turret_operator.ignoreme = 0;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13f2
// Size: 0x69
function function_e2368c53744b331c(var_34ea4b5a7b2a021b, var_f58c62635c797bfd, cooldown, var_c620cd5bd6b19ebf) {
    if (isai(self)) {
        if (isdefined(var_34ea4b5a7b2a021b)) {
            self.var_55a29022cf7abdad = var_34ea4b5a7b2a021b;
        }
        if (isdefined(var_f58c62635c797bfd)) {
            self.var_39887ba979a993ab = var_f58c62635c797bfd;
        }
        if (isdefined(cooldown)) {
            self.var_fc9b05ff80c7a4d6 = cooldown;
        }
        if (isdefined(var_c620cd5bd6b19ebf)) {
            self.var_edb88205b19560bd = var_c620cd5bd6b19ebf;
        }
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1462
// Size: 0x34
function function_1123c27b444d9b1f() {
    if (isai(self)) {
        self.var_55a29022cf7abdad = undefined;
        self.var_39887ba979a993ab = undefined;
        self.var_fc9b05ff80c7a4d6 = undefined;
        self.var_edb88205b19560bd = 0;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x341
function function_4dcca048a83a2f3c(strength) {
    setdvarifuninitialized(@"hash_8483522c1e47a279", 0);
    level.var_6bcbe686f8635184 = strength;
    flag_wait("scriptables_ready");
    while (gettime() < 3000) {
        wait(0.1);
    }
    guys = getaiarray();
    ents = getentarray();
    foreach (ent in ents) {
        if (istrue(ent.var_c8a1996a0bc3aee5)) {
            guys[guys.size] = ent;
        }
    }
    if (getdvarint(@"hash_8483522c1e47a279")) {
        array_thread(guys, &function_ee3867fafbad621b);
    }
    foreach (guy in guys) {
        if (!guy isscriptable()) {
            if (getdvarint(@"hash_8483522c1e47a279")) {
                /#
                    if (isdefined(guy.model)) {
                        println("<unknown string>" + guy.classname + "<unknown string>" + guy.model);
                    } else {
                        println("<unknown string>" + guy.classname);
                    }
                #/
            }
        } else {
            switch (level.var_6bcbe686f8635184) {
            case 0:
                guy setscriptablepartstate("wind", "0", 0);
                break;
            case 1:
                guy setscriptablepartstate("wind", "10", 0);
                break;
            case 2:
                guy setscriptablepartstate("wind", "20", 0);
                break;
            case 3:
                guy setscriptablepartstate("wind", "30", 0);
                break;
            case 4:
                guy setscriptablepartstate("wind", "40", 0);
                break;
            case 5:
                guy setscriptablepartstate("wind", "50", 0);
                break;
            case 6:
                guy setscriptablepartstate("wind", "60", 0);
                break;
            case 7:
                guy setscriptablepartstate("wind", "70", 0);
                break;
            case 8:
                guy setscriptablepartstate("wind", "80", 0);
                break;
            case 9:
                guy setscriptablepartstate("wind", "90", 0);
                break;
            case 10:
                guy setscriptablepartstate("wind", "100", 0);
                break;
            default:
                /#
                    assertmsg("Value of, " + level.var_6bcbe686f8635184 + " is incorrect!");
                #/
                break;
            }
        }
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e5
// Size: 0x56
function function_ee3867fafbad621b() {
    self endon("death");
    self notify("stop_wind_debug");
    self endon("stop_wind_debug");
    while (1) {
        /#
            print3d(self.origin, "<unknown string>", (1, 1, 1), 1, 0.25, 10, 1);
        #/
        wait(0.5);
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1842
// Size: 0x54
function set_deathanim(deathanim) {
    var_60ce35ef4ea0ccaa = undefined;
    if (isstring(deathanim)) {
        var_60ce35ef4ea0ccaa = getanim(deathanim);
    } else {
        var_60ce35ef4ea0ccaa = deathanim;
    }
    /#
        assert(isanimation(var_60ce35ef4ea0ccaa));
    #/
    self.deathanim = var_60ce35ef4ea0ccaa;
    self.var_2fa5eff1b71a2229 = 1;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189d
// Size: 0x17
function clear_deathanim() {
    self.deathanim = undefined;
    self.var_2fa5eff1b71a2229 = 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18bb
// Size: 0x33
function function_82a45e8aef44ce3f(death_func) {
    self.deathfunction = death_func;
    if (isdefined(death_func)) {
        self.var_334ab06981bc61aa = 1;
    } else {
        self.var_334ab06981bc61aa = 0;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f5
// Size: 0x37
function remove_blackboard_isburning(guy) {
    waitframe();
    if (!isdefined(guy)) {
        return;
    }
    if (isdefined(guy._blackboard)) {
        guy._blackboard.isburning = undefined;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1933
// Size: 0x112
function function_60daa23100a2b874(grenade, target) {
    if (isdefined(target.asmname) && target asmhaspainstate(target.asmname)) {
        target._blackboard.isburning = 1;
        target.burningtodeath = 0;
        target.burningdirection = undefined;
        target.semtexstuckto = 1;
        var_13e753f7fe12d1b = anglestoright(target.angles);
        var_f3982ee60fbba2ee = vectornormalize(grenade.origin - target.origin);
        if (vectordot(var_13e753f7fe12d1b, var_f3982ee60fbba2ee) > 0) {
            target.burningdirection = "right";
        } else {
            target.burningdirection = "left";
        }
        target asmevalpaintransition(target.asmname);
        level thread remove_blackboard_isburning(target);
        grenade.stucktoai = target;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4c
// Size: 0x108
function function_3bd08a7c5eba1671(num_points, var_76a360b8b32e7746, var_f920810d1461251f, outer_radius, inner_radius, var_ffc346403d7b087d, var_81eab9f4b9cb06da, var_33a8409ba292ca46) {
    level endon("game_ended");
    spawn_points = [];
    var_ffc346403d7b087d = function_53c4c53197386572(var_ffc346403d7b087d, 1);
    var_137fa8a8bdd21729 = 0;
    for (i = 0; i < num_points; i++) {
        var_5b269e6a457efb2f = 0;
        while (var_5b269e6a457efb2f < 5) {
            var_b94b44484ba8ad14 = var_76a360b8b32e7746 + (0, 0, var_f920810d1461251f);
            random_point = math::function_e70fb12ac4e8f91b(var_b94b44484ba8ad14, outer_radius, inner_radius, var_81eab9f4b9cb06da, var_33a8409ba292ca46);
            var_382ca5f6deca0f5f = namespace_3c37cb17ade254d::function_114e5c055b13dacf(random_point, 200);
            if (isdefined(var_382ca5f6deca0f5f)) {
                spawn_points[spawn_points.size] = var_382ca5f6deca0f5f;
                continue;
            } else {
                var_5b269e6a457efb2f++;
            }
            if (var_ffc346403d7b087d) {
                var_137fa8a8bdd21729++;
                if (var_137fa8a8bdd21729 % 3 == 0) {
                    waitframe();
                }
            }
        }
    }
    return spawn_points;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5c
// Size: 0x22
function function_dd21d67ede8ba22(max_health) {
    self.maxhealth = max_health;
    callback::callback("on_ai_set_max_health");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b85
// Size: 0xe8
function function_30dd4f3ef5f328ea(origin, team, species, subclass) {
    all_ai = [];
    if (isdefined(team) && isdefined(species)) {
        all_ai = getaispeciesarray(team, species);
    } else if (isdefined(team)) {
        all_ai = getaiarray(team);
    } else {
        all_ai = getaiarray();
    }
    var_f0d5deb356cc3016 = [];
    if (isdefined(subclass)) {
        foreach (ai in all_ai) {
            if (ai.subclass != subclass) {
                continue;
            }
            var_f0d5deb356cc3016 = array_add(var_f0d5deb356cc3016, ai);
        }
    } else {
        var_f0d5deb356cc3016 = all_ai;
    }
    return get_array_of_closest(origin, var_f0d5deb356cc3016)[0];
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c75
// Size: 0x5b
function function_8a09c0e5fa78a48c(var_eda7fdcec973dc54, duration, var_ca585e1e3aa156c2, var_aebfe2afccf39f9b) {
    if (!isdefined(duration)) {
        duration = 8.25;
    }
    if (!isdefined(var_ca585e1e3aa156c2)) {
        var_ca585e1e3aa156c2 = 250;
    }
    if (!isdefined(var_aebfe2afccf39f9b)) {
        var_aebfe2afccf39f9b = 150;
    }
    if (var_ca585e1e3aa156c2 < var_aebfe2afccf39f9b) {
        var_ca585e1e3aa156c2 = var_aebfe2afccf39f9b;
    }
    function_d002a41abea504bb(var_eda7fdcec973dc54, duration, var_ca585e1e3aa156c2, var_aebfe2afccf39f9b);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd7
// Size: 0x1de
function function_f8903387ea945165(var_eda7fdcec973dc54, var_651e92b77b0b6f82) {
    delay = 0;
    duration = undefined;
    var_8db63374ec6bc2f9 = undefined;
    var_7fb57e466f7f039a = undefined;
    switch (var_651e92b77b0b6f82) {
    case 0:
        delay = getdvarfloat(@"hash_3fc2c1569ac6d8e", 1);
        duration = getdvarfloat(@"hash_1a91f99ed9835cab", 3.5);
        var_8db63374ec6bc2f9 = getdvarint(@"hash_a29b7c7eac63a6b0", 200);
        var_7fb57e466f7f039a = getdvarint(@"hash_372e7fe80817d5e5", 150);
        break;
    case 1:
        delay = getdvarfloat(@"hash_f0dc25d5e4277d02", 0);
        duration = getdvarfloat(@"hash_314fdf30c2156f67", 8.25);
        var_8db63374ec6bc2f9 = getdvarint(@"hash_85175f3fbfc3ccc4", 250);
        var_7fb57e466f7f039a = getdvarint(@"hash_ce8793c0e589ab81", 150);
        break;
    case 2:
        delay = getdvarfloat(@"hash_ff93be3566f3591f", 0.25);
        duration = getdvarfloat(@"hash_b322661c8cdd2910", 1.4);
        var_8db63374ec6bc2f9 = getdvarint(@"hash_230d4f148436bcbf", 200);
        var_7fb57e466f7f039a = getdvarint(@"hash_25852663e024a0e6", 150);
        break;
    case 3:
        delay = getdvarfloat(@"hash_31266fe06e688a9", 0);
        duration = getdvarfloat(@"hash_48315e1f1bc3a24a", 18);
        var_8db63374ec6bc2f9 = getdvarint(@"hash_7ad30cecc84cb4d", 300);
        var_7fb57e466f7f039a = getdvarint(@"hash_2a401f3b20b48474", 250);
        break;
    default:
        /#
            assertmsg("mglAddActiveSmoke() is called with unsupported smoke type");
        #/
        break;
    }
    wait(delay);
    function_8a09c0e5fa78a48c(var_eda7fdcec973dc54, duration, var_8db63374ec6bc2f9, var_7fb57e466f7f039a);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebc
// Size: 0x8a
function ai_deathflag() {
    level.deathflags[self.script_deathflag]["ai"][self.unique_id] = self;
    ai_number = self.unique_id;
    deathflag = self.script_deathflag;
    if (isdefined(self.script_deathflag_longdeath)) {
        function_d3262c3e00795e21();
    } else {
        self waittill("death");
    }
    level.deathflags[deathflag]["ai"][ai_number] = undefined;
    update_deathflag(deathflag);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4d
// Size: 0x12
function function_d3262c3e00795e21() {
    self endon("death");
    self waittill("long_death");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f66
// Size: 0x84
function update_deathflag(deathflag) {
    level notify("updating_deathflag_" + deathflag);
    level endon("updating_deathflag_" + deathflag);
    waittillframeend();
    foreach (array in level.deathflags[deathflag]) {
        if (getarraykeys(array).size > 0) {
            return;
        }
    }
    flag_set(deathflag);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff1
// Size: 0x3a
function function_b571948011d94c21() {
    self endon("entitydeleted");
    if (!isalive(self)) {
        return;
    }
    if (self.health <= 1) {
        return;
    }
    self laserforceon();
    self waittill("death");
    self laserforceoff();
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2032
// Size: 0x27
function get_cover_volume_forward() {
    if (isdefined(self.goalvolumecoveryaw)) {
        return anglestoforward((0, self.goalvolumecoveryaw, 0));
    } else {
        return undefined;
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2060
// Size: 0x1a8
function set_goal_volume(volume) {
    if (isdefined(self.team) && self.team == "allies") {
        self.fixednode = 0;
    }
    if (!isdefined(volume)) {
        volume = level.goalvolumes[self.script_goalvolume];
        if (!isdefined(volume)) {
            return;
        }
    }
    goal = undefined;
    if (isdefined(volume.target)) {
        node = getnode(volume.target, "targetname");
        ent = getent(volume.target, "targetname");
        struct = getstruct(volume.target, "targetname");
        if (isdefined(node)) {
            goal = node;
            self setgoalnode(goal);
        } else if (isdefined(ent)) {
            goal = ent;
            self setgoalpos(goal.origin);
        } else if (isdefined(struct)) {
            goal = struct;
            self setgoalpos(goal.origin);
        }
        if (isdefined(goal)) {
            if (isdefined(goal.radius) && goal.radius != 0) {
                self.goalradius = goal.radius;
            }
            if (isdefined(goal.goalheight) && goal.goalheight != 0) {
                self.goalheight = goal.goalheight;
            }
        }
    }
    if (isdefined(goal)) {
        self setgoalvolume(volume);
    } else {
        self setgoalvolumeauto(volume, volume get_cover_volume_forward());
    }
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x220f
// Size: 0x39
function set_grenadeweapon(types) {
    offhands = strtok(types, " ");
    self.grenadeweapon = makeweapon(offhands[randomint(offhands.size)]);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224f
// Size: 0x35
function function_3e5ce428974325fb(name, var_befbe2d0cacee85d) {
    /#
        /#
            assert(isint(var_befbe2d0cacee85d));
        #/
    #/
    self function_3e89eb3d8e3f1811(name, gettime() + var_befbe2d0cacee85d);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228b
// Size: 0x3e
function function_5ad6396ef3963027(name) {
    var_986d7847260b3db7 = function_53c4c53197386572(self function_11e2d4051ea44b35(name), 0);
    cooldown = max(var_986d7847260b3db7 - gettime(), 0);
    return cooldown;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22d1
// Size: 0x3b
function function_19b9d658132ed54f(name, var_befbe2d0cacee85d) {
    /#
        /#
            assert(isint(var_befbe2d0cacee85d));
        #/
    #/
    function_3e5ce428974325fb(name, max(function_5ad6396ef3963027(name), var_befbe2d0cacee85d));
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2313
// Size: 0x3b
function function_6bb792058491579(name, var_befbe2d0cacee85d) {
    /#
        /#
            assert(isint(var_befbe2d0cacee85d));
        #/
    #/
    function_3e5ce428974325fb(name, min(function_5ad6396ef3963027(name), var_befbe2d0cacee85d));
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2355
// Size: 0x37
function function_2cd503a62cb7eb47(name, var_befbe2d0cacee85d) {
    /#
        /#
            assert(isint(var_befbe2d0cacee85d));
        #/
    #/
    function_3e5ce428974325fb(name, function_5ad6396ef3963027(name) - var_befbe2d0cacee85d);
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2393
// Size: 0x24
function function_74368588170b0497() {
    return isdefined(self.subclass) && issubstr(self.subclass, "warlord");
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23bf
// Size: 0x57
function function_f6347c9c410226d3() {
    if (isdefined(self.aicategory) && (self.aicategory == "special" || self.aicategory == "elite" || self.aicategory == "boss") || function_74368588170b0497()) {
        return 1;
    }
    return 0;
}

// Namespace ai/namespace_6205bc7c5e394598
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x241e
// Size: 0x234
function function_8cb35add373dee8a(var_e2a7566fb8a29355, node) {
    self endon("death");
    if (!istrue(node.var_97c8a15d77788e5a)) {
        if (isdefined(node.target)) {
            node.var_f8d4ed108521e632 = function_5d6132045b29baf5(node.target);
        }
        node.var_97c8a15d77788e5a = 1;
    }
    var_c2d822b2a2da6f25 = istrue(node.script_onlyidle) && self.var_e31ee88092e41cc8;
    if (isdefined(node.interaction) && !isdefined(node.var_f8d4ed108521e632)) {
        angles = node.angles;
        if (!isdefined(angles)) {
            angles = (0, 0, 0);
        }
        var_67e98c7ba275f170 = strtok(node.interaction, "+");
        interaction = random(var_67e98c7ba275f170);
        node.var_f8d4ed108521e632 = function_72066aa981916ecc(interaction, node.origin, angles);
    }
    self [[ var_e2a7566fb8a29355 ]](node);
    self waittill("goal");
    if (isdefined(node.var_f8d4ed108521e632)) {
        self._blackboard.idlenode = node;
        /#
            if (getdvarint(@"hash_75d5a192711fbacb", 0) != 0) {
                print3d(self.origin + (0, 0, randomintrange(40, 150)), "<unknown string>" + node.var_f8d4ed108521e632, (1, 1, 1), 1, 1, 1000);
            }
        #/
        var_f8d4ed108521e632 = self function_92435c7a6ae85c3c();
        if (!isdefined(var_f8d4ed108521e632)) {
            self function_76b3cfb91ef40b3b(node.var_f8d4ed108521e632);
            self.var_fdde0c446528ad74 = 1;
        }
        self waittill("bseq_user_deleted");
        self._blackboard.idlenode = undefined;
        if (isdefined(node.interaction) && isdefined(node.var_f8d4ed108521e632)) {
            function_2a627fa5fd1ce263(node.var_f8d4ed108521e632);
            node.var_f8d4ed108521e632 = undefined;
        }
    }
}

