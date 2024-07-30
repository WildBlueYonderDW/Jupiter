#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using scripts\engine\scriptable.gsc;
#using script_64acb6ce534155b7;
#using script_46cf752d93dc17b;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_9271e2e508a17556;

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2de
// Size: 0x420
function function_80d68c9701e1aea5(data) {
    level.supplyprops = spawnstruct();
    level.supplyprops.circleradius = getdvarint(@"hash_6d7d606a7067c098", 800);
    level.supplyprops.numcaches = getdvarint(@"hash_8feb68c00da2144f", 3);
    level.supplyprops.mindist = getdvarint(@"hash_daad8bc735aa6c40", 1000);
    level.supplyprops.mindistsq = level.supplyprops.mindist * level.supplyprops.mindist;
    level.supplyprops.maxdist = getdvarint(@"hash_7f634531ec47f4ae", 6000);
    level.supplyprops.maxdistsq = level.supplyprops.maxdist * level.supplyprops.maxdist;
    level.var_51f143645abc8911 = [];
    potentialnodes = [];
    for (i = 0; i < 60; i++) {
        pos = (randomfloatrange(-40000, 40000), randomfloatrange(-40000, 40000), 0);
        z = getclosestpointonnavmesh(getgroundposition(pos, 15, 10000, 10000));
        struct = spawnstruct();
        struct.origin = z;
        struct.angles = (0, 0, 0);
        potentialnodes[potentialnodes.size] = struct;
    }
    foreach (node in potentialnodes) {
        if (istrue(node.taken)) {
            continue;
        }
        node.taken = 1;
        node.nodes = [];
        for (i = 0; i < level.supplyprops.numcaches - 1; i++) {
            foreach (othernode in potentialnodes) {
                if (istrue(othernode.taken)) {
                    continue;
                }
                distsq = distance2dsquared(node.origin, othernode.origin);
                if (distsq > level.supplyprops.mindistsq && distsq < level.supplyprops.maxdistsq) {
                    node.nodes[node.nodes.size] = othernode;
                    othernode.taken = 1;
                    break;
                }
            }
        }
        if (node.nodes.size == level.supplyprops.numcaches - 1) {
            level.var_51f143645abc8911[level.var_51f143645abc8911.size] = node;
            continue;
        }
        node.taken = 0;
        foreach (othernode in node.nodes) {
            othernode.taken = 0;
        }
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("dmz_flare_site_use", &function_e63f55869e4d74ed);
    level.supplydroptypes["dmz_supply_drop"].onOpenFunc = &function_d8352a33e10df5a8;
    function_b713f2d39b34540f(data, &function_f641a4efd6f76f39, level.var_51f143645abc8911);
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x706
// Size: 0xec
function function_f641a4efd6f76f39(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_fa794f583171a19e;
    task.funcs["onTeamAssigned"] = &function_651ec6d76d0e7cd5;
    task.funcs["onPlayerJoined"] = &function_1db1eaa131875c8c;
    task.funcs["onPlayerRemoved"] = &function_5c452f9fb09a22cf;
    task.funcs["onTeamStart"] = &function_acf1fc6fec698927;
    task.funcs["onCancel"] = &function_20d0c1b71a58edee;
    task.node = node;
    task.ref = "dmz_supply_explore";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7fb
// Size: 0x188
function function_fa794f583171a19e() {
    self.nodes = array_add(self.node.nodes, self.node);
    foreach (node in self.nodes) {
        node.site = spawnscriptable("dmz_flare_site", node.origin, node.angles);
        node.site.task = self;
        node.site.node = node;
        foreach (player in level.players) {
            node.site disablescriptableplayeruse(player);
        }
    }
    self.activity.origin = self.node.origin;
    function_c847bfd52c064289(self.node.origin + (0, 0, 50));
    self.cachesfound = 0;
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98b
// Size: 0xb
function function_1db1eaa131875c8c(player) {
    
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99e
// Size: 0x1b
function function_5c452f9fb09a22cf(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9c1
// Size: 0x119
function function_651ec6d76d0e7cd5(teamname) {
    players = getteamdata(teamname, "players");
    function_e54df8560bf7dc64(teamname);
    self.var_8bd50c7e994c7434 = players.size * self.activity.cashreward;
    function_1759acfd39bb5edf("dmz_supply_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    foreach (node in self.nodes) {
        foreach (player in players) {
            node.site enablescriptableplayeruse(player);
        }
    }
    function_79057fbcbf8eed31();
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae2
// Size: 0xb
function function_acf1fc6fec698927(teamname) {
    
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf5
// Size: 0x3b
function function_20d0c1b71a58edee(teamname) {
    players = getteamdata(teamname, "players");
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb38
// Size: 0x14
function function_8250fd658e3aae32() {
    self.taskended = 1;
    function_629ed367d1393020();
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb54
// Size: 0x39
function private function_aaf82d7c71b92a61(teamname) {
    self notify("task_ended");
    function_8250fd658e3aae32();
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    task_ended(teamname);
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xb95
// Size: 0x19b
function function_e63f55869e4d74ed(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    instance setscriptablepartstate("dmz_flare_site_use", "unusable");
    instance setscriptablepartstate("dmz_flare_site", "dissipate");
    namespace_1eb3c4e0e28fac71::utilflare_shootflare(instance.origin, "dom");
    instance.task function_5314298e777e5688("dmz_supply_loot");
    if (isdefined(player.team)) {
        instance.task function_1759acfd39bb5edf("dmz_supply_fired", player.team);
    }
    crate = namespace_fd99f400a596934b::function_52f17e5fbec318a6(instance.origin, level.supplydroptypes["dmz_supply_drop"]);
    if (isdefined(crate)) {
        crate.task = instance.task;
        crate.site = instance;
        crate unlink();
        force = (0, 0, 0);
        crate physicslaunchserver(crate.origin, (0, 0, 0));
        bodyid = crate physics_getbodyid(0);
        physics_setbodycenterofmassnormal(bodyid, (0, 0, 0));
        crate.physicsactivated = 1;
        crate.usetime = 10;
        crate setscriptablepartstate("dmz_supply_drop", "usable");
    }
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd38
// Size: 0x20e
function private function_d8352a33e10df5a8(instance, player) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!isdefined(instance.contents)) {
        task = instance.entity.task;
        items = getscriptablelootcachecontents(instance);
        instance.containertype = 3;
        instance.contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(instance.entity.task.var_8bd50c7e994c7434 / level.supplyprops.numcaches);
        instance.contents = scripts\mp\gametypes\br_lootcache::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
        instance.entity.site.node.opened = 1;
        if (player.team != task.teams[0]) {
            return;
        }
        task.cachesfound++;
        if (task.cachesfound >= level.supplyprops.numcaches) {
            task function_aaf82d7c71b92a61(player.team);
            task function_1759acfd39bb5edf("dmz_supply_secured", player.team);
            return;
        }
        if (level.supplyprops.numcaches == 2) {
            splash = "dmz_supply_1_2";
        } else {
            splash = ["dmz_supply_1_3", "dmz_supply_2_3"][task.cachesfound - 1];
        }
        task function_1759acfd39bb5edf(splash, player.team);
        task function_79057fbcbf8eed31();
        task function_5314298e777e5688("dmz_supply_explore");
    }
}

// Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf4e
// Size: 0x19a
function function_79057fbcbf8eed31() {
    if (!isdefined(self.teams[0])) {
        return;
    }
    players = getteamdata(self.teams[0], "players");
    avgpos = (0, 0, 0);
    numplayers = 0;
    foreach (player in players) {
        if (isdefined(player) && isdefined(player.origin)) {
            avgpos += player.origin;
            numplayers++;
        }
    }
    avgpos /= max(numplayers, 1);
    var_64104068f7078b84 = 99999999999;
    closestnode = self.node;
    foreach (node in self.nodes) {
        if (istrue(node.opened)) {
            continue;
        }
        distsq = distancesquared(node.origin, avgpos);
        if (distsq < var_64104068f7078b84) {
            closestnode = node;
            var_64104068f7078b84 = distsq;
        }
    }
    namespace_f2c68794a1018c9d::function_cef2ed613a8338be(closestnode.origin + (0, 0, 50));
}

/#

    // Namespace namespace_9271e2e508a17556 / namespace_20374f100d8c4183
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x10f0
    // Size: 0x2f
    function function_b9a9ef982e2d12a1() {
        while (true) {
            sphere(self.origin, 50, (1, 1, 0), 0, 1);
            waitframe();
        }
    }

#/
