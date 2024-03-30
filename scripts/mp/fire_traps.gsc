// mwiii decomp prototype
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\poi.gsc;
#using scripts\mp\flags.gsc;

#namespace fire_traps;

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c2
// Size: 0x2b4
function init() {
    if (getdvarint(@"hash_1ce0fcc1847735a7", 1) == 0) {
        return;
    }
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    level.firetraps = spawnstruct();
    level.firetraps.traps = [];
    level.firetraps.var_325f9f15252b4928 = &function_7d27b7091e90ddfc;
    level.firetraps.nodesprocessed = 0;
    isactive = getdvarint(@"hash_70609fe5b82bd193", 1);
    level.firetraps.traps["fireBarrel"] = spawnstruct();
    level.firetraps.traps["fireBarrel"].spawnfunction = &function_be9b3ba9656f790b;
    level.firetraps.traps["fireBarrel"].isactive = isactive;
    level.firetraps.traps["fireBarrel"].var_c499fb71bd364bfc = 0;
    isactive = getdvarint(@"hash_2d32cef4a90c84a4", 1);
    level.firetraps.traps["gasPuddle"] = spawnstruct();
    level.firetraps.traps["gasPuddle"].spawnfunction = &function_abfa9fc534304bac;
    level.firetraps.traps["gasPuddle"].isactive = isactive;
    level.firetraps.traps["gasPuddle"].var_c499fb71bd364bfc = 10;
    level.firetraps.traps["gasPuddle"].burntime = getdvarint(@"hash_3ea718dbf08ff7fe", 60);
    isactive = getdvarint(@"hash_d02af883782d0eb9", 1);
    level.firetraps.traps["gasLeak"] = spawnstruct();
    level.firetraps.traps["gasLeak"].spawnfunction = &function_835640d85f3eb9c7;
    level.firetraps.traps["gasLeak"].isactive = isactive;
    level thread function_86e572a7a586ff11();
    scripts/engine/scriptable::scriptable_adddamagedcallback(&function_5413e583733d8000);
    /#
    #/
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47d
// Size: 0x71
function function_86e572a7a586ff11() {
    while (!flag_exist("create_script_initialized")) {
        waitframe();
    }
    flag_wait("create_script_initialized");
    waitframe();
    level.firetraps.activetraptypes = [];
    function_468ebe30ca565ce4("fireBarrel");
    function_468ebe30ca565ce4("gasPuddle");
    function_468ebe30ca565ce4("gasLeak");
    level.firetraps.nodesprocessed = 1;
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5
// Size: 0x18f
function function_468ebe30ca565ce4(traptype) {
    var_1642f84b31faa340 = scripts/mp/poi::function_47d356083884f913();
    if (var_1642f84b31faa340) {
        scripts/mp/poi::function_44739fe1cf82e29a(traptype);
    }
    if (function_b93f535898283956(traptype)) {
        level.firetraps.activetraptypes[level.firetraps.activetraptypes.size] = traptype;
        level.firetraps.traps[traptype].potentialspawns = [];
        var_746250914e0ad719 = getstructarray(traptype, "script_noteworthy");
        foreach (struct in var_746250914e0ad719) {
            if (isdefined(struct.targetname) && issubstr(struct.targetname, "auto")) {
                continue;
            }
            level.firetraps.traps[traptype].potentialspawns[level.firetraps.traps[traptype].potentialspawns.size] = struct;
            if (var_1642f84b31faa340) {
                if (!isdefined(struct.poi)) {
                    struct.poi = scripts/mp/poi::function_6cc445c02b5effac(struct.origin, 1, 1);
                }
                scripts/mp/poi::function_d0e7647e5538eb9d(struct.poi, traptype, struct);
            }
        }
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0xfb
function function_7d27b7091e90ddfc() {
    while (!level.firetraps.nodesprocessed) {
        waitframe();
    }
    foreach (traptype in level.firetraps.activetraptypes) {
        foreach (node in level.firetraps.traps[traptype].potentialspawns) {
            thread [[ level.firetraps.traps[traptype].spawnfunction ]](node);
        }
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78d
// Size: 0x2b
function function_b93f535898283956(traptype) {
    return level.firetraps.traps[traptype].isactive;
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c0
// Size: 0xa9
function function_be9b3ba9656f790b(node) {
    if (getdvarint(@"hash_1ce0fcc1847735a7", 1) == 0) {
        return;
    }
    if (!scripts/mp/flags::gameflagexists("prematch_done") || scripts/mp/flags::gameflagexists("prematch_done") && !scripts/mp/flags::gameflag("prematch_done")) {
        wait(level.firetraps.traps["fireBarrel"].var_c499fb71bd364bfc);
    }
    scriptable = spawnscriptable("decor_barrels_gameplay_flammable_noent", node.origin, node.angles);
    level thread function_a68fe4f7ab9386b4(scriptable);
    return scriptable;
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0xdc
function function_a68fe4f7ab9386b4(scriptable) {
    level endon("game_ended");
    exploded = 0;
    explosionradius = 206;
    while (!exploded) {
        scriptablestate = scriptable getscriptablepartstate("base");
        if (!isdefined(scriptablestate)) {
            return;
        }
        if (scriptablestate == "death") {
            if (isdefined(scriptable.fortress)) {
                scriptable.fortress notify("barrelExploded");
            }
            exploded = 1;
            if (isdefined(scriptable.lastattacker)) {
                attacker = scriptable.lastattacker;
            } else {
                attacker = level.var_cbe618f35b332990;
            }
            level.var_cbe618f35b332990 radiusdamage(scriptable.origin, explosionradius, 150, 50, attacker, "MOD_EXPLOSIVE", "molotov_mp");
        }
        waitframe();
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x954
// Size: 0x8e
function function_5413e583733d8000(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (isdefined(instance.type) && instance.type == "decor_barrels_gameplay_flammable_noent") {
        instance.lastattacker = eattacker;
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e9
// Size: 0x101
function function_abfa9fc534304bac(node) {
    if (getdvarint(@"hash_1ce0fcc1847735a7", 1) == 0) {
        return;
    }
    if (!scripts/mp/flags::gameflagexists("prematch_done") || scripts/mp/flags::gameflagexists("prematch_done") && !scripts/mp/flags::gameflag("prematch_done")) {
        wait(level.firetraps.traps["gasPuddle"].var_c499fb71bd364bfc);
    }
    scriptable = spawnscriptable("dmz_firetrap_gaspuddle", node.origin, node.angles + (0, 90, 0));
    scriptable.node = node;
    puddleradius = 75;
    prelit = undefined;
    if (isdefined(node.special_state)) {
        prelit = node.special_state == "prelit";
    }
    level thread function_9b60acd4b5af2d71(scriptable, puddleradius, prelit);
    return scriptable;
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf2
// Size: 0xbe
function function_9b60acd4b5af2d71(scriptable, radius, prelit) {
    level endon("game_ended");
    burning = 0;
    while (!burning) {
        if (istrue(prelit)) {
            waitframe();
            scriptable setscriptablepartstate("base", "death");
        }
        scriptablestate = scriptable getscriptablepartstate("base");
        if (scriptablestate == "death") {
            size = radius * 0.7;
            navobstacle = createnavobstaclebybounds(scriptable.origin, (size, size, size), scriptable.angles);
            level thread function_24ad6db34abe8024(scriptable, radius, prelit, navobstacle);
            burning = 1;
        }
        waitframe();
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb7
// Size: 0xd5
function function_24ad6db34abe8024(scriptable, radius, prelit, navobstacle) {
    level endon("game_ended");
    elapsedtime = 0;
    for (keepburning = 1; keepburning; keepburning = 0) {
        level.var_cbe618f35b332990 radiusdamage(scriptable.origin, radius, 5, 5, level.var_cbe618f35b332990, "MOD_FIRE", "molotov_mp", 0, 0);
        wait(1);
        if (!istrue(prelit)) {
            elapsedtime++;
            if (elapsedtime >= level.firetraps.traps["gasPuddle"].burntime) {
            }
        }
    }
    if (isdefined(navobstacle)) {
        destroynavobstacle(navobstacle);
    }
    scriptable setscriptablepartstate("base", "off");
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc93
// Size: 0xbd
function function_835640d85f3eb9c7(node) {
    if (getdvarint(@"hash_1ce0fcc1847735a7", 1) == 0) {
        return;
    }
    scriptable = spawnscriptable("dmz_firetrap_gasleak", node.origin, node.angles);
    scriptable.node = node;
    scriptable.state = "off";
    if (isdefined(node.poi) && node.poi == "saba_S5Reveal") {
        if (!isdefined(level.var_247b22e11b648f93)) {
            level.var_247b22e11b648f93 = [];
        }
        level.var_247b22e11b648f93[level.var_247b22e11b648f93.size] = scriptable;
    }
    return scriptable;
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd58
// Size: 0xb1
function function_53b4a8ace69c59ea() {
    switch (self.state) {
    case #"hash_3699ac6c262c25ea":
        self.state = "small";
        self setscriptablepartstate("base", "small");
        return self;
    case #"hash_5971965ed985a26c":
        self.state = "heavy";
        self setscriptablepartstate("base", "heavy");
        return self;
    case #"hash_2453c9ffec9f5c20":
        self.state = "damaging";
        self setscriptablepartstate("base", "damaging");
        thread function_45b0ef5d9cef9c8d();
        return self;
    case #"hash_b06b2bd0fb6506bb":
        return self;
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe10
// Size: 0x2f
function function_7fdb264c9e19b7b8() {
    if (self.state == "damaging") {
        return;
    }
    self setscriptablepartstate("base", "damaging");
    thread function_45b0ef5d9cef9c8d();
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe46
// Size: 0x73
function function_45b0ef5d9cef9c8d() {
    level endon("game_ended");
    damageorigin = self.origin + rotatevector((0, 120, 0), self.angles);
    while (true) {
        level.var_cbe618f35b332990 radiusdamage(damageorigin, 40, 4, 4, level.var_cbe618f35b332990, "MOD_FIRE", "molotov_mp", 0, 0);
        wait(0.2);
    }
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec0
// Size: 0xeb
function function_c6434d5c21b8f943() {
    wait(10);
    struct = spawnstruct();
    struct.origin = (974, 1932, 128);
    struct.angles = (0, 0, 0);
    function_be9b3ba9656f790b(struct);
    struct = spawnstruct();
    struct.origin = (990, 2135, 135);
    struct.angles = (0, 0, 0);
    function_abfa9fc534304bac(struct);
    struct = spawnstruct();
    struct.origin = (1230, 2339, 145);
    struct.angles = (0, 180, 0);
    struct.angles = (0, 0, 0);
    function_835640d85f3eb9c7(struct);
}

// Namespace fire_traps / scripts/mp/fire_traps
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb2
// Size: 0xad
function function_4ef3b2c51679f626() {
    level endon("game_ended");
    while (true) {
        if (getdvarint(@"hash_586023952faae9bc", 0)) {
            setdvar(@"hash_586023952faae9bc", 0);
            node = spawnstruct();
            node.origin = level.players[0].origin + anglestoforward(level.players[0].angles) * 100;
            node.angles = level.players[0].angles;
            function_be9b3ba9656f790b(node);
        }
        waitframe();
    }
}

