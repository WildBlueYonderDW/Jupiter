// mwiii decomp prototype
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
#using script_3314add7998ab13;
#using scripts\engine\scriptable.gsc;
#using script_64acb6ce534155b7;
#using script_46cf752d93dc17b;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_9271e2e508a17556;

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26d
// Size: 0x42d
function function_80d68c9701e1aea5(data) {
    level.var_46c31e7ab1002ce0 = spawnstruct();
    level.var_46c31e7ab1002ce0.circleradius = getdvarint(@"hash_6d7d606a7067c098", 800);
    level.var_46c31e7ab1002ce0.var_b04566c546a49c20 = getdvarint(@"hash_8feb68c00da2144f", 3);
    level.var_46c31e7ab1002ce0.mindist = getdvarint(@"hash_daad8bc735aa6c40", 1000);
    level.var_46c31e7ab1002ce0.mindistsq = level.var_46c31e7ab1002ce0.mindist * level.var_46c31e7ab1002ce0.mindist;
    level.var_46c31e7ab1002ce0.maxdist = getdvarint(@"hash_7f634531ec47f4ae", 6000);
    level.var_46c31e7ab1002ce0.maxdistsq = level.var_46c31e7ab1002ce0.maxdist * level.var_46c31e7ab1002ce0.maxdist;
    level.var_51f143645abc8911 = [];
    var_25dd3020969aa0f6 = [];
    for (i = 0; i < 60; i++) {
        pos = (randomfloatrange(-40000, 40000), randomfloatrange(-40000, 40000), 0);
        z = getclosestpointonnavmesh(getgroundposition(pos, 15, 10000, 10000));
        struct = spawnstruct();
        struct.origin = z;
        struct.angles = (0, 0, 0);
        var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = struct;
    }
    foreach (node in var_25dd3020969aa0f6) {
        if (istrue(node.taken)) {
            continue;
        }
        node.taken = 1;
        node.nodes = [];
        for (i = 0; i < level.var_46c31e7ab1002ce0.var_b04566c546a49c20 - 1; i++) {
            foreach (othernode in var_25dd3020969aa0f6) {
                if (istrue(othernode.taken)) {
                    continue;
                }
                distsq = distance2dsquared(node.origin, othernode.origin);
                if (distsq > level.var_46c31e7ab1002ce0.mindistsq && distsq < level.var_46c31e7ab1002ce0.maxdistsq) {
                    node.nodes[node.nodes.size] = othernode;
                    othernode.taken = 1;
                    break;
                }
            }
        }
        if (node.nodes.size == level.var_46c31e7ab1002ce0.var_b04566c546a49c20 - 1) {
            level.var_51f143645abc8911[level.var_51f143645abc8911.size] = node;
        } else {
            node.taken = 0;
            foreach (othernode in node.nodes) {
                othernode.taken = 0;
            }
        }
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("dmz_flare_site_use", &function_e63f55869e4d74ed);
    level.var_ef63e063e320acfc["dmz_supply_drop"].onopenfunc = &function_d8352a33e10df5a8;
    function_b713f2d39b34540f(data, &function_f641a4efd6f76f39, level.var_51f143645abc8911);
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a1
// Size: 0xec
function function_f641a4efd6f76f39(activity, node) {
    task = function_5f6d9fd82bdd2d05(activity);
    task.funcs["onInit"] = &function_fa794f583171a19e;
    task.funcs["onTeamAssigned"] = &function_651ec6d76d0e7cd5;
    task.funcs["onPlayerJoined"] = &function_1db1eaa131875c8c;
    task.funcs["onPlayerRemoved"] = &function_5c452f9fb09a22cf;
    task.funcs["onTeamStart"] = &function_acf1fc6fec698927;
    task.funcs["onCancel"] = &function_20d0c1b71a58edee;
    task.node = node;
    task.ref = "dmz_supply_explore";
    task.var_30e8a65cff941c7a = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x795
// Size: 0x18d
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
    self.var_f42170ad6524cdc2 = 0;
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x929
// Size: 0xc
function function_1db1eaa131875c8c(player) {
    
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93c
// Size: 0x1c
function function_5c452f9fb09a22cf(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x11f
function function_651ec6d76d0e7cd5(teamname) {
    players = getteamdata(teamname, "players");
    function_e54df8560bf7dc64(teamname);
    self.var_8bd50c7e994c7434 = players.size * self.activity.var_723b8f7cb71ceb11;
    function_1759acfd39bb5edf("dmz_supply_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    foreach (node in self.nodes) {
        foreach (player in players) {
            node.site enablescriptableplayeruse(player);
        }
    }
    function_79057fbcbf8eed31();
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa85
// Size: 0xc
function function_acf1fc6fec698927(teamname) {
    
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98
// Size: 0x3b
function function_20d0c1b71a58edee(teamname) {
    players = getteamdata(teamname, "players");
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada
// Size: 0x15
function function_8250fd658e3aae32() {
    self.var_7ef0fa7a21303ccc = 1;
    function_629ed367d1393020();
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaf6
// Size: 0x3a
function private function_aaf82d7c71b92a61(teamname) {
    self notify("task_ended");
    function_8250fd658e3aae32();
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    task_ended(teamname);
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x19d
function function_e63f55869e4d74ed(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    instance setscriptablepartstate("dmz_flare_site_use", "unusable");
    instance setscriptablepartstate("dmz_flare_site", "dissipate");
    namespace_1eb3c4e0e28fac71::utilflare_shootflare(instance.origin, "dom");
    instance.task function_5314298e777e5688("dmz_supply_loot");
    if (isdefined(player.team)) {
        instance.task function_1759acfd39bb5edf("dmz_supply_fired", player.team);
    }
    crate = namespace_fd99f400a596934b::function_52f17e5fbec318a6(instance.origin, level.var_ef63e063e320acfc["dmz_supply_drop"]);
    if (isdefined(crate)) {
        crate.task = instance.task;
        crate.site = instance;
        crate unlink();
        force = (0, 0, 0);
        crate physicslaunchserver(crate.origin, (0, 0, 0));
        var_212a44a5393c3b34 = crate physics_getbodyid(0);
        physics_setbodycenterofmassnormal(var_212a44a5393c3b34, (0, 0, 0));
        crate.physicsactivated = 1;
        crate.usetime = 10;
        crate setscriptablepartstate("dmz_supply_drop", "usable");
    }
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcdb
// Size: 0x211
function private function_d8352a33e10df5a8(instance, player) {
    if (!isdefined(player) || !isdefined(player.team)) {
        return;
    }
    if (!isdefined(instance.contents)) {
        task = instance.entity.task;
        items = getscriptablelootcachecontents(instance);
        instance.var_46a3a8565ac0c17c = 3;
        instance.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(instance.entity.task.var_8bd50c7e994c7434 / level.var_46c31e7ab1002ce0.var_b04566c546a49c20);
        instance.contents = namespace_1b7e64f50cca9321::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
        instance.entity.site.node.opened = 1;
        if (player.team != task.teams[0]) {
            goto LOC_0000020f;
        }
        task.var_f42170ad6524cdc2++;
        if (task.var_f42170ad6524cdc2 >= level.var_46c31e7ab1002ce0.var_b04566c546a49c20) {
            task function_aaf82d7c71b92a61(player.team);
            task function_1759acfd39bb5edf("dmz_supply_secured", player.team);
        } else {
            if (level.var_46c31e7ab1002ce0.var_b04566c546a49c20 == 2) {
                splash = "dmz_supply_1_2";
            } else {
                splash = [0:"dmz_supply_1_3", 1:"dmz_supply_2_3"][task.var_f42170ad6524cdc2 - 1];
            }
            task function_1759acfd39bb5edf(splash, player.team);
            task function_79057fbcbf8eed31();
            task function_5314298e777e5688("dmz_supply_explore");
        LOC_0000020f:
        }
    LOC_0000020f:
    }
LOC_0000020f:
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef3
// Size: 0x1a5
function function_79057fbcbf8eed31() {
    if (!isdefined(self.teams[0])) {
        return;
    }
    players = getteamdata(self.teams[0], "players");
    var_f95feb63c772e28f = (0, 0, 0);
    numplayers = 0;
    foreach (player in players) {
        if (isdefined(player) && isdefined(player.origin)) {
            var_f95feb63c772e28f = var_f95feb63c772e28f + player.origin;
            numplayers++;
        }
    }
    var_f95feb63c772e28f = var_f95feb63c772e28f / max(numplayers, 1);
    var_64104068f7078b84 = 99999999999;
    var_d6eb01b1dc33ffdc = self.node;
    foreach (node in self.nodes) {
        if (istrue(node.opened)) {
            continue;
        }
        distsq = distancesquared(node.origin, var_f95feb63c772e28f);
        if (distsq < var_64104068f7078b84) {
            var_d6eb01b1dc33ffdc = node;
            var_64104068f7078b84 = distsq;
        }
    }
    namespace_f2c68794a1018c9d::function_cef2ed613a8338be(var_d6eb01b1dc33ffdc.origin + (0, 0, 50));
}

// Namespace namespace_9271e2e508a17556/namespace_20374f100d8c4183
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109f
// Size: 0x30
function function_b9a9ef982e2d12a1() {
    /#
        while (1) {
            sphere(self.origin, 50, (1, 1, 0), 0, 1);
            waitframe();
        }
    #/
}

