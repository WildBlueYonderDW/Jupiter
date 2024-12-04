#using script_2d9d24f7c63ac143;
#using script_479e458f6f530f0d;
#using script_4948cdf739393d2d;
#using script_57d3850a12cf1d8f;
#using script_600b944a95c3a7bf;
#using script_64acb6ce534155b7;
#using script_6c4e8cea70bf4b6d;
#using script_728ffcee8cbf30ee;
#using scripts\common\utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;
#using scripts\mp\equipment;
#using scripts\mp\gametypes\br_bunker_utility;
#using scripts\mp\gametypes\br_circle;
#using scripts\mp\gametypes\br_lootcache;
#using scripts\mp\gametypes\br_public;
#using scripts\mp\gametypes\br_scavenger_quest;
#using scripts\mp\hud_message;
#using scripts\mp\utility\game;
#using scripts\mp\utility\player;
#using scripts\mp\utility\stats;
#using scripts\mp\utility\teams;
#using scripts\mp\utility\weapon;

#namespace namespace_f8748144e4bafbac;

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x382
// Size: 0x2f5
function getcontractdata(data) {
    level.var_6d6a6fcd9e67bc58 = spawnstruct();
    level.var_6d6a6fcd9e67bc58.circleradius = getdvarint(@"hash_1d40039c44b8ad97", 3000);
    level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086 = getdvarint(@"hash_cac42315ea0f8822", 250);
    level.var_6d6a6fcd9e67bc58.numcaches = getdvarint(@"hash_4178b1ff014a2222", 1);
    level.var_6d6a6fcd9e67bc58.multicounter = getdvarint(@"hash_834e3a87f7224a66", 1);
    level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b = getdvarint(@"hash_8afa4a88bfe03241", 4000);
    level.var_6d6a6fcd9e67bc58.maxseparation = getdvarint(@"hash_223f9b902afa5a5b", 8000);
    level.var_6d6a6fcd9e67bc58.minneardist = getdvarint(@"hash_9d75874f6eaef13b", 10000);
    level.var_6d6a6fcd9e67bc58.maxneardist = getdvarint(@"hash_e7bb53f3d22046ad", 20000);
    level.var_6d6a6fcd9e67bc58.var_29649c452dda3ef5 = level.var_6d6a6fcd9e67bc58.minneardist * level.var_6d6a6fcd9e67bc58.minneardist;
    level.var_6d6a6fcd9e67bc58.var_457613c63130b3ef = level.var_6d6a6fcd9e67bc58.maxneardist * level.var_6d6a6fcd9e67bc58.maxneardist;
    level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb = level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b * level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b;
    level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989 = level.var_6d6a6fcd9e67bc58.maxseparation * level.var_6d6a6fcd9e67bc58.maxseparation;
    level.var_6d6a6fcd9e67bc58.splashenabled = getdvarint(@"hash_f1152b3ca355c77", 0);
    function_58bf160252f94e21();
    data.funcs["onInit"] = &function_c38468bd270a39b1;
    data.funcs["onTeamAssigned"] = &function_e5878a249845a03e;
    data.funcs["onPlayerAssimilated"] = &function_7e7efeb119b54de3;
    data.funcs["onPlayerTearDown"] = &function_13ada44a0a060212;
    data.funcs["onCancel"] = &function_cda2d113e8f2bea1;
    data.funcs["onEliteTearDown"] = &function_9087e808d8cab8d2;
    data.funcs["onPlayerRespawn"] = &namespace_2d7f47b19ccdb41d::function_dcf3929e77fe1de9;
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67f
// Size: 0x301
function function_c38468bd270a39b1() {
    missionnode = function_f642dae0d375aef();
    if (!isdefined(missionnode)) {
        return false;
    }
    self.node = missionnode;
    self.nodes = self.node.allnodes;
    self.caches = [];
    circlelocations = [];
    foreach (index, node in self.nodes) {
        cache = spawnscriptable("br_loot_cache_yellow_quiet", node.origin, node.angles);
        cache.var_534e0cf170a981b7 = &function_e03f18a25a3eaea1;
        cache.task = self;
        cache.cacheindex = index;
        cache setscriptablepartstate("body", "closed_usable");
        circlelocations[circlelocations.size] = function_ab50f62a3a730400(cache.origin, level.var_6d6a6fcd9e67bc58.circleradius);
        function_f0d61e14dfde9ccd(cache);
        self.caches[index] = cache;
        disablelootspawnpoint(node.index);
    }
    function_325390edb051cd5d("Elite_Geiger", circlelocations, level.var_6d6a6fcd9e67bc58.circleradius + level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086);
    pos = (0, 0, 0);
    foreach (loc in circlelocations) {
        pos += loc;
    }
    pos /= circlelocations.size;
    function_c847bfd52c064289(pos + (0, 0, 750), "elite_geiger");
    objective_setdescription(self.icon, %BR_ELITE_BROKEN_ARROW/LOCATE_ELEM);
    objective_setbackground(self.icon, 1);
    function_11cbcb8303075da(self.icon, 246, 192, 72);
    self.cachesfound = 0;
    if (self.caches.size < level.var_6d6a6fcd9e67bc58.numcaches) {
        function_fa5f8f9ae368d2f4();
        return false;
    }
    self.var_30eb0d4adcaafed9 = self.node.var_30eb0d4adcaafed9;
    if (!function_63a35ce4ab7603bf(self.var_30eb0d4adcaafed9)) {
        function_fa5f8f9ae368d2f4();
        return false;
    }
    self.var_a161875f61a76bf1 = self.node.var_30eb0d4adcaafed9;
    self.var_a161875f61a76bf1.var_534e0cf170a981b7 = &function_12d53123e4d46ebc;
    self.var_a161875f61a76bf1.task = self;
    return true;
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x989
// Size: 0x53e
function function_f642dae0d375aef() {
    potentialnodes = [];
    var_308d8c8ca5731e79 = [];
    var_bcbdafc8078f225b = namespace_1eb3c4e0e28fac71::function_bef688acd85ee3a3(self.tablet.origin, level.var_6d6a6fcd9e67bc58.var_29649c452dda3ef5, level.var_6d6a6fcd9e67bc58.var_457613c63130b3ef, 1, 1);
    potentialnodes[0] = var_bcbdafc8078f225b;
    nodegroups = [];
    foreach (node in potentialnodes) {
        if (istrue(node.picked)) {
            continue;
        }
        node.allnodes = [node];
        for (cache = 1; cache < level.var_6d6a6fcd9e67bc58.numcaches; cache++) {
            for (idx = 0; idx < potentialnodes.size; idx++) {
                possiblenode = potentialnodes[idx];
                if (istrue(possiblenode.picked)) {
                    continue;
                }
                inrange = 1;
                foreach (var_cadd946c5c39fbf7 in node.allnodes) {
                    dist = distance2dsquared(possiblenode.origin, var_cadd946c5c39fbf7.origin);
                    if (dist < level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb || dist > level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989) {
                        inrange = 0;
                        break;
                    }
                }
                if (inrange) {
                    node.allnodes[node.allnodes.size] = possiblenode;
                    break;
                }
            }
        }
        if (node.allnodes.size == level.var_6d6a6fcd9e67bc58.numcaches) {
            nodegroups[nodegroups.size] = node;
            foreach (var_cadd946c5c39fbf7 in node.allnodes) {
                var_cadd946c5c39fbf7.picked = 1;
            }
        }
    }
    bags1 = getentitylessscriptablearray("scriptable_cache_duffel_bag_01", "classname");
    bags2 = getentitylessscriptablearray("scriptable_cache_duffel_bag_02", "classname");
    var_6f29584a4e484b7d = array_combine(bags1, bags2);
    var_7cdeb95190a02620 = [];
    var_318a8876ce9550b1 = getdvarint(@"hash_638b5231a4cec66", 1);
    circlecenter = scripts\mp\gametypes\br_circle::getnextsafecircleorigin();
    circleradius = scripts\mp\gametypes\br_circle::getnextsafecircleradius();
    foreach (node in nodegroups) {
        if (var_6f29584a4e484b7d.size) {
            bestcache = undefined;
            foreach (cache in var_6f29584a4e484b7d) {
                if (istrue(cache.chosen)) {
                    continue;
                }
                if (var_318a8876ce9550b1 && cache getscriptablepartstate("body") != "closed_usable") {
                    continue;
                }
                if (namespace_9823ee6035594d67::function_2cde636a73aead3d(cache.origin)) {
                    continue;
                }
                if (scripts\mp\gametypes\br_scavenger_quest::function_c096a9a3d859cfce(cache.origin)) {
                    continue;
                }
                if (scripts\mp\gametypes\br_bunker_utility::function_5581450b830e0245(cache.origin)) {
                    continue;
                }
                if (namespace_58dcf42cf567f34f::function_64332f29e2409e55(cache.origin)) {
                    continue;
                }
                if (isdefined(circlecenter) && isdefined(circleradius)) {
                    if (distance2dsquared(circlecenter, cache.origin) > circleradius * circleradius) {
                        continue;
                    }
                }
                var_7cdeb95190a02620[var_7cdeb95190a02620.size] = cache;
                dist = distance2dsquared(node.origin, cache.origin);
                if (dist > level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb && dist < level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989) {
                    bestcache = cache;
                    break;
                }
            }
            if (!isdefined(bestcache)) {
                if (var_7cdeb95190a02620.size > 0) {
                    bestcache = var_7cdeb95190a02620[randomint(var_7cdeb95190a02620.size)];
                }
                if (!isdefined(bestcache)) {
                    bestcache = var_6f29584a4e484b7d[randomint(var_6f29584a4e484b7d.size)];
                }
                if (var_318a8876ce9550b1 && bestcache getscriptablepartstate("body") != "closed_usable") {
                    bestcache setscriptablepartstate("body", "closed_usable");
                }
            }
            node.var_30eb0d4adcaafed9 = bestcache;
            bestcache.chosen = 1;
            var_308d8c8ca5731e79[var_308d8c8ca5731e79.size] = node;
            break;
        }
    }
    return var_308d8c8ca5731e79[0];
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xed0
// Size: 0x5f
function function_7e7efeb119b54de3(player) {
    foreach (cache in self.caches) {
        cache enablescriptableplayeruse(player);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf37
// Size: 0x9c
function function_13ada44a0a060212(player, oldteam, newteam) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_629ed367d1393020();
    }
    foreach (cache in self.caches) {
        cache disablescriptableplayeruse(player);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfdb
// Size: 0x48d
function function_e5878a249845a03e() {
    self.category = "elite_geiger";
    players = getteamdata(self.teams[0], "players");
    var_8edc62019d327b86 = function_cf1d5d7a0843d442();
    if (!isdefined(self.var_a161875f61a76bf1.contents)) {
        items = getscriptablelootcachecontents(self.var_a161875f61a76bf1);
        self.var_a161875f61a76bf1.containertype = 3;
        self.var_a161875f61a76bf1.contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(items, undefined);
        lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
        lootcount = level.var_6d6a6fcd9e67bc58.multicounter ? var_8edc62019d327b86 : 1;
        for (i = 0; i < lootcount; i++) {
            self.var_a161875f61a76bf1.contents = scripts\mp\gametypes\br_lootcache::function_848e20cf1d6cab8f(self.var_a161875f61a76bf1.contents, 1, lootid);
        }
    }
    if (var_8edc62019d327b86) {
        index = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_loot");
        function_cef2ed613a8338be(self.var_a161875f61a76bf1.origin + (0, 0, 15));
        self.cacheicon = spawnstruct();
        self.cacheicon namespace_f2c68794a1018c9d::function_c847bfd52c064289(function_6278ee3d4b9427e(), "elite_geiger");
        objective_setdescription(self.cacheicon.icon, %BR_ELITE_BROKEN_ARROW/LOCATE_ELEM);
        objective_setbackground(self.cacheicon.icon, 1);
        function_11cbcb8303075da(self.cacheicon.icon, 246, 192, 72);
        foreach (player in players) {
            if (player function_bc2a272d0d7e5425()) {
                function_1851e9cfb7687f68(player);
                function_7e7900a1b5338836(player);
                function_ca1a1eac33e9eeb9(player);
                continue;
            }
            function_556fb3a465f0e978(player);
            function_5ae48a091056d6ff(player);
            function_b43e9536b7e60884(player, index);
        }
    } else {
        foreach (player in players) {
            player.var_6947d1a323fd968b = 1;
        }
        function_e54df8560bf7dc64(self.teams[0]);
    }
    self.var_8bd50c7e994c7434 = 500;
    foreach (cache in self.caches) {
        cache setscriptablepartstate("body", "closed_usable");
        foreach (player in level.players) {
            cache disablescriptableplayeruse(player);
        }
        foreach (player in players) {
            cache enablescriptableplayeruse(player);
        }
    }
    if (level.var_6d6a6fcd9e67bc58.splashenabled) {
        function_1759acfd39bb5edf("br_elite_geiger_start", self.teams[0]);
    }
    level thread scripts\mp\gametypes\br_public::brleaderdialogteam("arrow_start_geiger", self.teams[0], undefined, 2);
    foreach (player in players) {
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.numcaches - self.cachesfound);
    }
    thread function_da9d50cdb172311b(self.teams[0]);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1470
// Size: 0xc0
function function_cda2d113e8f2bea1(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        foreach (cache in self.caches) {
            cache disablescriptableplayeruse(player);
        }
    }
    function_fa5f8f9ae368d2f4();
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0x3f
function task_cleanup() {
    self.taskended = 1;
    function_629ed367d1393020();
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_629ed367d1393020();
    }
    function_2476daefa3384c5e();
    function_a8fd5e614c159b0f();
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x157f
// Size: 0x35
function private function_fa5f8f9ae368d2f4(success) {
    self notify("task_ended");
    task_cleanup();
    endcontract(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15bc
// Size: 0x71
function function_bc2a272d0d7e5425() {
    curr = scripts\mp\equipment::getcurrentequipment("secondary");
    equipammo = scripts\mp\equipment::getequipmentslotammo("secondary");
    lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
    count = namespace_aead94004cf4c147::getTotalItemCountInBag(lootid);
    return isdefined(curr) && curr == "equip_geigercounter" && equipammo || isdefined(count) && count;
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1636
// Size: 0x82
function function_cf1d5d7a0843d442() {
    teammates = getteamdata(self.teams[0], "players");
    var_9df31b4639d9eed8 = 0;
    foreach (teammate in teammates) {
        if (teammate function_bc2a272d0d7e5425()) {
            continue;
        }
        var_9df31b4639d9eed8++;
    }
    return var_9df31b4639d9eed8;
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16c1
// Size: 0x2d
function function_63a35ce4ab7603bf(cache) {
    return !namespace_9823ee6035594d67::function_f59f68adc71d49b3(cache.origin) && !istrue(cache.islockedcache);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16f7
// Size: 0x107
function function_12d53123e4d46ebc(instance, player) {
    if (!isdefined(instance.task) || !isdefined(instance.task.teams[0]) || player.team != instance.task.teams[0] || istrue(instance.task.taskended)) {
        player scripts\mp\hud_message::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.containertype = 3;
        instance.contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(items, undefined);
        lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
        instance.contents = scripts\mp\gametypes\br_lootcache::function_848e20cf1d6cab8f(instance.contents, 1, lootid);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1806
// Size: 0x109
function private function_e03f18a25a3eaea1(instance, player) {
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.containertype = 3;
        instance.contents = scripts\mp\gametypes\br_lootcache::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(instance.task.var_8bd50c7e994c7434 / level.var_6d6a6fcd9e67bc58.numcaches);
        instance.contents = scripts\mp\gametypes\br_lootcache::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
    }
    team = instance.task.teams[0];
    element = namespace_6c622b52017c6808::function_f517a8eefb0eb61a(team);
    namespace_6c622b52017c6808::function_cc25131864fa213c(team, instance.origin, instance.angles, element);
    function_94a70845b30a3761(instance, player);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1917
// Size: 0x134
function function_94a70845b30a3761(instance, player) {
    if (isdefined(player) && isdefined(instance)) {
        cache = instance;
        task = cache.task;
        task function_4e927bfe9b585059(cache.cacheindex);
        task.cachesfound++;
        cache.found = 1;
        function_a67007b5af86ff0b(cache);
        players = getteamdata(task.teams[0], "players");
        foreach (player in players) {
            player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.numcaches - task.cachesfound);
        }
        if (level.var_6d6a6fcd9e67bc58.splashenabled) {
            task namespace_1eb3c4e0e28fac71::displayteamsplash(task.teams[0], "br_elite_geiger_end");
        }
        task function_fa5f8f9ae368d2f4(1);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a53
// Size: 0x15f
function function_6278ee3d4b9427e() {
    pos = (0, 0, 0);
    foreach (circle in self.questcircles) {
        if (isdefined(circle) && isdefined(circle.mapcircle)) {
            pos += circle.mapcircle.origin;
        }
    }
    var_d20aaeee28502da1 = max(1, level.var_6d6a6fcd9e67bc58.numcaches - self.cachesfound);
    pos /= var_d20aaeee28502da1;
    height = 0;
    foreach (cache in self.caches) {
        if (!istrue(cache.found)) {
            height += cache.origin[2];
        }
    }
    height /= var_d20aaeee28502da1;
    pos = (pos[0], pos[1], height);
    return pos + (0, 0, 750);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bbb
// Size: 0x3d
function function_a50dd79d5679b079() {
    pos = function_6278ee3d4b9427e();
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_cef2ed613a8338be(pos);
        return;
    }
    function_cef2ed613a8338be(pos);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c00
// Size: 0x34
function function_7e7900a1b5338836(player) {
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_fbf23ae15945ee5a(player);
        return;
    }
    function_fbf23ae15945ee5a(player);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3c
// Size: 0x34
function function_5ae48a091056d6ff(player) {
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_401535e3fa9e171c(player);
        return;
    }
    function_401535e3fa9e171c(player);
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c78
// Size: 0x20
function function_6b3aa264866cfaba(player) {
    if (isdefined(self.cacheicon)) {
        function_fbf23ae15945ee5a(player);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ca0
// Size: 0x20
function function_ca1a1eac33e9eeb9(player) {
    if (isdefined(self.cacheicon)) {
        function_401535e3fa9e171c(player);
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc8
// Size: 0x286
function function_da9d50cdb172311b(teamname) {
    self endon("task_ended");
    wait 5;
    var_44937005a0f57f50 = 0;
    incircleindex = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_search");
    outcircleindex = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_explore");
    var_1660a3b7fcffb869 = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_loot");
    while (true) {
        if (isdefined(self.cacheicon)) {
            var_9df31b4639d9eed8 = function_cf1d5d7a0843d442();
            if (var_9df31b4639d9eed8 == 0) {
                function_cef2ed613a8338be(self.cacheicon.iconorigin);
                self.cacheicon function_629ed367d1393020();
                self.cacheicon = undefined;
            }
        }
        players = getteamdata(teamname, "players");
        mindistsq = 10000000000;
        minorigin = (0, 0, 0);
        foreach (player in players) {
            if (!player scripts\cp_mp\utility\player_utility::_isalive()) {
                continue;
            }
            if (!player function_bc2a272d0d7e5425() && isdefined(self.cacheicon)) {
                function_b43e9536b7e60884(player, var_1660a3b7fcffb869);
                function_5ae48a091056d6ff(player);
                function_6b3aa264866cfaba(player);
                function_556fb3a465f0e978(player);
                continue;
            } else {
                function_ca1a1eac33e9eeb9(player);
                function_1851e9cfb7687f68(player);
            }
            foreach (circle in self.questcircles) {
                if (!isdefined(circle)) {
                    continue;
                }
                distsq = distance2dsquared(circle.mapcircle.origin, player.origin);
                if (distsq < level.var_6d6a6fcd9e67bc58.circleradius * level.var_6d6a6fcd9e67bc58.circleradius) {
                    function_b43e9536b7e60884(player, incircleindex);
                    function_5ae48a091056d6ff(player);
                    continue;
                }
                function_b43e9536b7e60884(player, outcircleindex);
                function_7e7900a1b5338836(player);
            }
        }
        wait 1;
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f56
// Size: 0xcf
function private function_a8fd5e614c159b0f() {
    players = getteamdata(self.teams[0], "players");
    foreach (player in players) {
        if (isdefined(player.equipment["secondary"]) && player.equipment["secondary"] == "equip_geigercounter") {
            player scripts\mp\equipment::takeequipment("secondary");
        }
        lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
        while (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(lootid)) {
            player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid);
        }
    }
}

// Namespace namespace_f8748144e4bafbac / namespace_522ef15f95ed6589
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x202d
// Size: 0x110
function function_9087e808d8cab8d2(team) {
    task = self;
    teammates = getteamdata(team, "players");
    foreach (player in teammates) {
        foreach (cache in task.caches) {
            cache disablescriptableplayeruse(player);
        }
    }
    task.taskended = 1;
    task function_629ed367d1393020();
    if (isdefined(task.cacheicon)) {
        task.cacheicon function_629ed367d1393020();
    }
    task function_2476daefa3384c5e();
    task function_a8fd5e614c159b0f();
}

