#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_48814951e916af89;
#using scripts\mp\poi.gsc;
#using script_744cad313ed0a87e;
#using script_6172179f6bd0769e;

#namespace br_bosses;

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff
// Size: 0x1dd
function initbosses() {
    level endon("game_ended");
    if (namespace_bd614c3c2275579a::function_a9b26d3ed078e149()) {
        level waittill("spawn_brStrongholdSpawn");
    } else {
        while (!isdefined(level.var_f1073fbd45b59a06) || !istrue(level.var_f1073fbd45b59a06.var_9b87fdb80920f442)) {
            waitframe();
        }
    }
    level.bosses = [];
    namespace_817a152f5a5554f8::function_4c60c607a6e7b9ae();
    if (isdefined(level.var_a115c1f5c15fdf08)) {
        foreach (var_bfefcc82d904a282 in level.var_a115c1f5c15fdf08) {
            [[ var_bfefcc82d904a282 ]]();
        }
    }
    foreach (boss in level.bosses) {
        if (getdvarint(hashcat(@"hash_d98c82b5a26dc973", boss.name, "_disabled"), 0) > 0) {
            boss.disabled = 1;
            continue;
        }
        if (isdefined(boss.initfunc)) {
            [[ boss.initfunc ]](boss);
        }
    }
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    /#
        level thread function_3d2ccd7ee2e32ebc();
    #/
    foreach (boss in level.bosses) {
        if (!istrue(boss.disabled) && isdefined(boss.var_4ea49a8926593523)) {
            level thread [[ boss.var_4ea49a8926593523 ]]();
        }
    }
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4
// Size: 0x3e
function function_874978ae364dd63(funcpointer) {
    if (!isdefined(funcpointer)) {
        return;
    }
    if (!isdefined(level.var_a115c1f5c15fdf08)) {
        level.var_a115c1f5c15fdf08 = [];
    }
    level.var_a115c1f5c15fdf08[level.var_a115c1f5c15fdf08.size] = funcpointer;
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x22
function registerboss(detailsstruct) {
    level.bosses[detailsstruct.name] = detailsstruct;
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x354
// Size: 0x2b
function spawnboss(name, node) {
    return [[ level.bosses[name].spawnfunc ]](node);
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x388
// Size: 0x121
function function_c0d4fda4400b5a08(name) {
    if (!istrue(level.var_3d652c7cd2f573b8)) {
        return;
    }
    foreach (fortress in level.var_f1073fbd45b59a06.var_df987907a483df89) {
        if (!isdefined(fortress.boss)) {
            continue;
        }
        if (isdefined(fortress.boss) && fortress.boss.size == 0) {
            continue;
        }
        if (randomfloat(1) <= level.var_97430573e62d0760) {
            node = fortress.boss[randomint(fortress.boss.size)];
            boss = spawnboss(name, node);
            if (isdefined(boss)) {
                fortress.var_837c4b569aa8a376[fortress.var_837c4b569aa8a376.size] = boss;
                boss.fortress = fortress;
            }
        }
    }
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1
// Size: 0x65
function function_720c3b7abf4baac8(name, var_b700d8d067b3eedb) {
    self.var_b582b10663b5b2a9 = 0;
    self.var_685390c6753c2cc7 = istrue(var_b700d8d067b3eedb);
    if (getdvarint(@"hash_b3a452dbb8a7c28", 0) > 0) {
        self function_3de79443c911d4a5(1, 4, level.bosses[name].uiname);
    }
    thread function_2676819f01ae14ed(name);
}

// Namespace br_bosses / scripts\mp\gametypes\br_bosses
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x51e
// Size: 0x26
function function_2676819f01ae14ed(name) {
    level endon("game_ended");
    killer = self waittill("death");
}

/#

    // Namespace br_bosses / scripts\mp\gametypes\br_bosses
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x54c
    // Size: 0x12e
    function function_3d2ccd7ee2e32ebc() {
        level endon("<dev string:x1c>");
        while (true) {
            node = spawnstruct();
            node.origin = getclosestpointonnavmesh(level.players[0].origin + anglestoforward(level.players[0].angles) * 128);
            node.angles = level.players[0].angles;
            foreach (boss in level.bosses) {
                if (getdvarint(hashcat(@"hash_99aa34f6e7fd419b", boss.name), 0)) {
                    level thread function_565fbc2a83508f2d(boss.name, node);
                    setdvar(hashcat(@"hash_99aa34f6e7fd419b", boss.name), 0);
                }
            }
            wait 1;
        }
    }

    // Namespace br_bosses / scripts\mp\gametypes\br_bosses
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x682
    // Size: 0x172
    function function_565fbc2a83508f2d(name, node) {
        level endon("<dev string:x2a>");
        boss = [[ level.bosses[name].var_e68429b39c75b6ee ]](node);
        boss.var_2d670e4d288c86fb = 1;
        boss.var_7d606bec79308eb5 = 350;
        boss.var_85a0f6383a5dd784 = 150;
        boss.goalheight = 80;
        boss.var_98add129a7ecb962 = 1;
        boss.maxhealth = int(level.var_e34d534debb61eda * level.var_63d0544474ed373);
        boss.health = int(level.var_e34d534debb61eda * level.var_63d0544474ed373);
        boss.maxarmorhealth = int(level.var_2e0a0145252b7f6a * level.var_48d50c4fdd3feb83);
        boss.armorhealth = int(level.var_2e0a0145252b7f6a * level.var_48d50c4fdd3feb83);
        boss.var_cfc69e5588a5bed6 = int(level.var_134d393a2d69b578 * level.var_8a45fbdabac853fd);
        boss.helmethealth = int(level.var_134d393a2d69b578 * level.var_8a45fbdabac853fd);
        level thread function_41684af1362b3f50(boss);
        level notify("<dev string:x2a>");
    }

    // Namespace br_bosses / scripts\mp\gametypes\br_bosses
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7fc
    // Size: 0x125
    function function_41684af1362b3f50(boss) {
        boss endon("<dev string:x48>");
        while (true) {
            waitframe();
            if (isdefined(boss)) {
                debugstar(boss.origin + (0, 0, 60), (0, 1, 0), 1, "<dev string:x51>" + boss.helmethealth + "<dev string:x62>" + boss.var_cfc69e5588a5bed6, 0.3);
                debugstar(boss.origin + (0, 0, 40), (0, 1, 0), 1, "<dev string:x67>" + boss.armorhealth + "<dev string:x62>" + boss.maxarmorhealth, 0.3);
                debugstar(boss.origin + (0, 0, 20), (0, 1, 0), 1, "<dev string:x77>" + boss.health + "<dev string:x62>" + boss.maxhealth, 0.3);
            }
        }
    }

#/
