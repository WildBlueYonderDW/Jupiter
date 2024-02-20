// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_479e458f6f530f0d;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_64acb6ce534155b7;
#using script_4948cdf739393d2d;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\equipment.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\hud_message.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_f8748144e4bafbac;

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x2c8
function function_fb7271d5ee18b98d(data) {
    level.var_6d6a6fcd9e67bc58 = spawnstruct();
    level.var_6d6a6fcd9e67bc58.circleradius = getdvarint(@"hash_1d40039c44b8ad97", 3000);
    level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086 = getdvarint(@"hash_cac42315ea0f8822", 250);
    level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20 = getdvarint(@"hash_4178b1ff014a2222", 1);
    level.var_6d6a6fcd9e67bc58.var_15725dd697a56ab6 = getdvarint(@"hash_834e3a87f7224a66", 1);
    level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b = getdvarint(@"hash_8afa4a88bfe03241", 4000);
    level.var_6d6a6fcd9e67bc58.maxseparation = getdvarint(@"hash_223f9b902afa5a5b", 8000);
    level.var_6d6a6fcd9e67bc58.var_5e886596ec2b4ad1 = getdvarint(@"hash_9d75874f6eaef13b", 10000);
    level.var_6d6a6fcd9e67bc58.var_146bea0f8889943f = getdvarint(@"hash_e7bb53f3d22046ad", 20000);
    level.var_6d6a6fcd9e67bc58.var_29649c452dda3ef5 = level.var_6d6a6fcd9e67bc58.var_5e886596ec2b4ad1 * level.var_6d6a6fcd9e67bc58.var_5e886596ec2b4ad1;
    level.var_6d6a6fcd9e67bc58.var_457613c63130b3ef = level.var_6d6a6fcd9e67bc58.var_146bea0f8889943f * level.var_6d6a6fcd9e67bc58.var_146bea0f8889943f;
    level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb = level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b * level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b;
    level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989 = level.var_6d6a6fcd9e67bc58.maxseparation * level.var_6d6a6fcd9e67bc58.maxseparation;
    level.var_6d6a6fcd9e67bc58.var_2dcb144daab3c487 = getdvarint(@"hash_f1152b3ca355c77", 0);
    function_58bf160252f94e21();
    data.funcs["onInit"] = &function_c38468bd270a39b1;
    data.funcs["onTeamAssigned"] = &function_e5878a249845a03e;
    data.funcs["onPlayerAssimilated"] = &function_7e7efeb119b54de3;
    data.funcs["onPlayerTearDown"] = &function_13ada44a0a060212;
    data.funcs["onCancel"] = &function_cda2d113e8f2bea1;
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a9
// Size: 0x30a
function function_c38468bd270a39b1() {
    var_55d64703cf4c4f2d = function_f642dae0d375aef();
    if (!isdefined(var_55d64703cf4c4f2d)) {
        return 0;
    }
    self.node = var_55d64703cf4c4f2d;
    self.nodes = self.node.allnodes;
    self.caches = [];
    var_ecbe40bb7db8c8df = [];
    foreach (index, node in self.nodes) {
        cache = spawnscriptable("br_loot_cache_yellow_quiet", node.origin, node.angles);
        cache.var_534e0cf170a981b7 = &function_e03f18a25a3eaea1;
        cache.task = self;
        cache.var_4b1dc74724995fb7 = index;
        cache setscriptablepartstate("body", "closed_usable");
        var_ecbe40bb7db8c8df[var_ecbe40bb7db8c8df.size] = function_ab50f62a3a730400(cache.origin, level.var_6d6a6fcd9e67bc58.circleradius);
        function_f0d61e14dfde9ccd(cache);
        self.caches[index] = cache;
        disablelootspawnpoint(node.index);
    }
    function_325390edb051cd5d("Elite_Geiger", var_ecbe40bb7db8c8df, level.var_6d6a6fcd9e67bc58.circleradius + level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086);
    pos = (0, 0, 0);
    foreach (loc in var_ecbe40bb7db8c8df) {
        pos = pos + loc;
    }
    pos = pos / var_ecbe40bb7db8c8df.size;
    function_c847bfd52c064289(pos + (0, 0, 750), "elite_geiger");
    objective_setdescription(self.icon, "BR_ELITE_BROKEN_ARROW/LOCATE_ELEM");
    objective_setbackground(self.icon, 1);
    function_11cbcb8303075da(self.icon, 246, 192, 72);
    self.var_f42170ad6524cdc2 = 0;
    if (self.caches.size < level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20) {
        function_fa5f8f9ae368d2f4();
        return 0;
    }
    self.var_30eb0d4adcaafed9 = self.node.var_30eb0d4adcaafed9;
    if (!function_63a35ce4ab7603bf(self.var_30eb0d4adcaafed9)) {
        function_fa5f8f9ae368d2f4();
        return 0;
    }
    self.var_a161875f61a76bf1 = self.node.var_30eb0d4adcaafed9;
    self.var_a161875f61a76bf1.var_534e0cf170a981b7 = &function_12d53123e4d46ebc;
    self.var_a161875f61a76bf1.task = self;
    return 1;
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8bb
// Size: 0x58b
function function_f642dae0d375aef() {
    allnodes = getunusedlootcachepoints();
    var_25dd3020969aa0f6 = [];
    var_308d8c8ca5731e79 = [];
    circlecenter = namespace_c5622898120e827f::getnextsafecircleorigin();
    circleradius = namespace_c5622898120e827f::getnextsafecircleradius();
    foreach (node in allnodes) {
        if (namespace_1eb3c4e0e28fac71::function_60094dbeee6e39b0(node.origin)) {
            continue;
        }
        if (namespace_9823ee6035594d67::function_f59f68adc71d49b3(node.origin)) {
            continue;
        }
        if (isdefined(circlecenter) && isdefined(circleradius)) {
            jumpiffalse(distance2dsquared(circlecenter, node.origin) > circleradius * circleradius) LOC_0000019e;
        } else {
        LOC_0000019e:
            dist = distance2dsquared(self.tablet.origin, node.origin);
            if (dist > level.var_6d6a6fcd9e67bc58.var_29649c452dda3ef5 && dist < level.var_6d6a6fcd9e67bc58.var_457613c63130b3ef) {
                var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = node;
                break;
            }
        }
    }
    if (var_25dd3020969aa0f6.size == 0) {
        var_25dd3020969aa0f6[var_25dd3020969aa0f6.size] = allnodes[randomint(allnodes.size)];
    }
    var_a7409edf90c03e79 = [];
    foreach (node in var_25dd3020969aa0f6) {
        if (istrue(node.var_32b1048db382c805)) {
            continue;
        }
        node.allnodes = [0:node];
        for (cache = 1; cache < level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20; cache++) {
            for (idx = 0; idx < var_25dd3020969aa0f6.size; idx++) {
                var_196d1cc990d1bdba = var_25dd3020969aa0f6[idx];
                if (istrue(var_196d1cc990d1bdba.var_32b1048db382c805)) {
                    continue;
                }
                inrange = 1;
                foreach (var_cadd946c5c39fbf7 in node.allnodes) {
                    dist = distance2dsquared(var_196d1cc990d1bdba.origin, var_cadd946c5c39fbf7.origin);
                    if (dist < level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb || dist > level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989) {
                        inrange = 0;
                        break;
                    }
                }
                if (inrange) {
                    node.allnodes[node.allnodes.size] = var_196d1cc990d1bdba;
                    continue;
                }
            }
        }
        if (node.allnodes.size == level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20) {
            var_a7409edf90c03e79[var_a7409edf90c03e79.size] = node;
            foreach (var_cadd946c5c39fbf7 in node.allnodes) {
                var_cadd946c5c39fbf7.var_32b1048db382c805 = 1;
            }
        }
    }
    var_d9835582d03aa691 = getentitylessscriptablearray("scriptable_cache_duffel_bag_01", "classname");
    var_d9835282d03a9ff8 = getentitylessscriptablearray("scriptable_cache_duffel_bag_02", "classname");
    var_6f29584a4e484b7d = array_combine(var_d9835582d03aa691, var_d9835282d03a9ff8);
    var_318a8876ce9550b1 = getdvarint(@"hash_638b5231a4cec66", 1);
    foreach (node in var_a7409edf90c03e79) {
        if (var_6f29584a4e484b7d.size) {
            var_1dca92bb81d1ffe7 = undefined;
            foreach (cache in var_6f29584a4e484b7d) {
                if (istrue(cache.chosen)) {
                    continue;
                }
                if (var_318a8876ce9550b1 && cache getscriptablepartstate("body") != "closed_usable") {
                    continue;
                }
                if (namespace_9823ee6035594d67::function_f59f68adc71d49b3(cache.origin)) {
                    continue;
                }
                dist = distance2dsquared(node.origin, cache.origin);
                if (dist > level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb && dist < level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989) {
                    var_1dca92bb81d1ffe7 = cache;
                    break;
                }
            }
            if (!isdefined(var_1dca92bb81d1ffe7)) {
                var_1dca92bb81d1ffe7 = var_6f29584a4e484b7d[randomint(var_6f29584a4e484b7d.size)];
                if (var_318a8876ce9550b1 && var_1dca92bb81d1ffe7 getscriptablepartstate("body") != "closed_usable") {
                    var_1dca92bb81d1ffe7 setscriptablepartstate("body", "closed_usable");
                }
            }
            node.var_30eb0d4adcaafed9 = var_1dca92bb81d1ffe7;
            var_1dca92bb81d1ffe7.chosen = 1;
            var_308d8c8ca5731e79[var_308d8c8ca5731e79.size] = node;
            break;
        }
    }
    return var_308d8c8ca5731e79[0];
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4e
// Size: 0x61
function function_7e7efeb119b54de3(player) {
    foreach (cache in self.caches) {
        cache enablescriptableplayeruse(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x9e
function function_13ada44a0a060212(player, oldteam, newteam) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
    if (isdefined(self.var_77b131ef0e51d26c)) {
        self.var_77b131ef0e51d26c function_629ed367d1393020();
    }
    foreach (cache in self.caches) {
        cache disablescriptableplayeruse(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5b
// Size: 0x4a1
function function_e5878a249845a03e() {
    self.category = "elite_geiger";
    players = getteamdata(self.teams[0], "players");
    var_8edc62019d327b86 = function_cf1d5d7a0843d442();
    if (!isdefined(self.var_a161875f61a76bf1.contents)) {
        items = getscriptablelootcachecontents(self.var_a161875f61a76bf1);
        self.var_a161875f61a76bf1.var_46a3a8565ac0c17c = 3;
        self.var_a161875f61a76bf1.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("equip_geigercounter");
        if (level.var_6d6a6fcd9e67bc58.var_15725dd697a56ab6) {
            goto LOC_00000170;
        }
        var_ea156f5f477a8792 = 1;
        for (i = 0; i < var_ea156f5f477a8792; i++) {
            self.var_a161875f61a76bf1.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(self.var_a161875f61a76bf1.contents, 1, lootid);
        }
    }
    if (var_8edc62019d327b86) {
        index = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_loot");
        function_cef2ed613a8338be(self.var_a161875f61a76bf1.origin + (0, 0, 15));
        self.var_77b131ef0e51d26c = spawnstruct();
        self.var_77b131ef0e51d26c namespace_f2c68794a1018c9d::function_c847bfd52c064289(function_6278ee3d4b9427e(), "elite_geiger");
        objective_setdescription(self.var_77b131ef0e51d26c.icon, "BR_ELITE_BROKEN_ARROW/LOCATE_ELEM");
        objective_setbackground(self.var_77b131ef0e51d26c.icon, 1);
        function_11cbcb8303075da(self.var_77b131ef0e51d26c.icon, 246, 192, 72);
        foreach (player in players) {
            if (player function_bc2a272d0d7e5425()) {
                function_1851e9cfb7687f68(player);
                function_7e7900a1b5338836(player);
                function_ca1a1eac33e9eeb9(player);
            } else {
                function_556fb3a465f0e978(player);
                function_5ae48a091056d6ff(player);
                function_b43e9536b7e60884(player, index);
            }
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
    if (level.var_6d6a6fcd9e67bc58.var_2dcb144daab3c487) {
        function_1759acfd39bb5edf("br_elite_geiger_start", self.teams[0]);
    }
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("arrow_start_geiger", self.teams[0], undefined, 2);
    foreach (player in players) {
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20 - self.var_f42170ad6524cdc2);
    }
    thread function_da9d50cdb172311b(self.teams[0]);
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1403
// Size: 0xc6
function function_cda2d113e8f2bea1(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        foreach (cache in self.caches) {
            cache disablescriptableplayeruse(player);
        }
    }
    function_fa5f8f9ae368d2f4();
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d0
// Size: 0x40
function task_cleanup() {
    self.var_7ef0fa7a21303ccc = 1;
    function_629ed367d1393020();
    if (isdefined(self.var_77b131ef0e51d26c)) {
        self.var_77b131ef0e51d26c function_629ed367d1393020();
    }
    function_2476daefa3384c5e();
    function_a8fd5e614c159b0f();
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1517
// Size: 0x36
function private function_fa5f8f9ae368d2f4(success) {
    self notify("task_ended");
    task_cleanup();
    function_93663fe58d95f174(ter_op(istrue(success), self.teams[0], undefined));
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1554
// Size: 0x74
function function_bc2a272d0d7e5425() {
    curr = namespace_1a507865f681850e::getcurrentequipment("secondary");
    var_c89f07da007ff0d = namespace_1a507865f681850e::getequipmentslotammo("secondary");
    lootid = namespace_38b993c4618e76cd::getLootIDFromRef("equip_geigercounter");
    count = namespace_aead94004cf4c147::getTotalItemCountInBag(lootid);
    return isdefined(curr) && curr == "equip_geigercounter" && var_c89f07da007ff0d || isdefined(count) && count;
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d0
// Size: 0x86
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

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165e
// Size: 0x2e
function function_63a35ce4ab7603bf(cache) {
    return !namespace_9823ee6035594d67::function_f59f68adc71d49b3(cache.origin) && !istrue(cache.var_3e5d613e6f4d92e3);
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1694
// Size: 0x108
function function_12d53123e4d46ebc(instance, player) {
    if (!isdefined(instance.task) || !isdefined(instance.task.teams[0]) || player.team != instance.task.teams[0] || istrue(instance.task.var_7ef0fa7a21303ccc)) {
        player namespace_44abc05161e2e2cb::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.var_46a3a8565ac0c17c = 3;
        instance.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("equip_geigercounter");
        instance.contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(instance.contents, 1, lootid);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17a3
// Size: 0x10c
function private function_e03f18a25a3eaea1(instance, player) {
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.var_46a3a8565ac0c17c = 3;
        instance.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(instance.task.var_8bd50c7e994c7434 / level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20);
        instance.contents = namespace_1b7e64f50cca9321::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
    }
    team = instance.task.teams[0];
    element = namespace_6c622b52017c6808::function_f517a8eefb0eb61a(team);
    namespace_6c622b52017c6808::function_cc25131864fa213c(team, instance.origin, instance.angles, element);
    function_94a70845b30a3761(instance, player);
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b6
// Size: 0x138
function function_94a70845b30a3761(instance, player) {
    if (isdefined(player) && isdefined(instance)) {
        cache = instance;
        task = cache.task;
        task function_4e927bfe9b585059(cache.var_4b1dc74724995fb7);
        task.var_f42170ad6524cdc2++;
        cache.found = 1;
        function_a67007b5af86ff0b(cache);
        players = getteamdata(task.teams[0], "players");
        foreach (player in players) {
            player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20 - task.var_f42170ad6524cdc2);
        }
        if (level.var_6d6a6fcd9e67bc58.var_2dcb144daab3c487) {
            task namespace_1eb3c4e0e28fac71::displayteamsplash(task.teams[0], "br_elite_geiger_end");
        }
        task function_fa5f8f9ae368d2f4(1);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f5
// Size: 0x167
function function_6278ee3d4b9427e() {
    pos = (0, 0, 0);
    foreach (circle in self.var_b0f4bf8621b96c0a) {
        if (isdefined(circle) && isdefined(circle.mapcircle)) {
            pos = pos + circle.mapcircle.origin;
        }
    }
    var_d20aaeee28502da1 = max(1, level.var_6d6a6fcd9e67bc58.var_b04566c546a49c20 - self.var_f42170ad6524cdc2);
    pos = pos / var_d20aaeee28502da1;
    height = 0;
    foreach (cache in self.caches) {
        if (!istrue(cache.found)) {
            height = height + cache.origin[2];
        }
    }
    height = height / var_d20aaeee28502da1;
    pos = (pos[0], pos[1], height);
    return pos + (0, 0, 750);
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b64
// Size: 0x3d
function function_a50dd79d5679b079() {
    pos = function_6278ee3d4b9427e();
    if (isdefined(self.var_77b131ef0e51d26c)) {
        self.var_77b131ef0e51d26c function_cef2ed613a8338be(pos);
    } else {
        function_cef2ed613a8338be(pos);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba8
// Size: 0x35
function function_7e7900a1b5338836(player) {
    if (isdefined(self.var_77b131ef0e51d26c)) {
        self.var_77b131ef0e51d26c function_fbf23ae15945ee5a(player);
    } else {
        function_fbf23ae15945ee5a(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be4
// Size: 0x35
function function_5ae48a091056d6ff(player) {
    if (isdefined(self.var_77b131ef0e51d26c)) {
        self.var_77b131ef0e51d26c function_401535e3fa9e171c(player);
    } else {
        function_401535e3fa9e171c(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c20
// Size: 0x21
function function_6b3aa264866cfaba(player) {
    if (isdefined(self.var_77b131ef0e51d26c)) {
        function_fbf23ae15945ee5a(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c48
// Size: 0x21
function function_ca1a1eac33e9eeb9(player) {
    if (isdefined(self.var_77b131ef0e51d26c)) {
        function_401535e3fa9e171c(player);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c70
// Size: 0x294
function function_da9d50cdb172311b(teamname) {
    self endon("task_ended");
    wait(5);
    var_44937005a0f57f50 = 0;
    var_f8ebe9cfc6be863e = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_search");
    var_a69fcd2fca613429 = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_explore");
    var_1660a3b7fcffb869 = namespace_1eb3c4e0e28fac71::getquesttableindex("elite_geiger_loot");
    while (1) {
        if (isdefined(self.var_77b131ef0e51d26c)) {
            var_9df31b4639d9eed8 = function_cf1d5d7a0843d442();
            if (var_9df31b4639d9eed8 == 0) {
                function_cef2ed613a8338be(self.var_77b131ef0e51d26c.var_7919c8f3a10feb86);
                self.var_77b131ef0e51d26c function_629ed367d1393020();
                self.var_77b131ef0e51d26c = undefined;
            }
        }
        players = getteamdata(teamname, "players");
        mindistsq = 10000000000;
        var_fa73c7e2d99fa15 = (0, 0, 0);
        foreach (player in players) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (!player function_bc2a272d0d7e5425() && isdefined(self.var_77b131ef0e51d26c)) {
                function_b43e9536b7e60884(player, var_1660a3b7fcffb869);
                function_5ae48a091056d6ff(player);
                function_6b3aa264866cfaba(player);
                function_556fb3a465f0e978(player);
                continue;
            } else {
                function_ca1a1eac33e9eeb9(player);
                function_1851e9cfb7687f68(player);
            }
            foreach (circle in self.var_b0f4bf8621b96c0a) {
                if (!isdefined(circle)) {
                    continue;
                }
                distsq = distance2dsquared(circle.mapcircle.origin, player.origin);
                if (distsq < level.var_6d6a6fcd9e67bc58.circleradius * level.var_6d6a6fcd9e67bc58.circleradius) {
                    function_b43e9536b7e60884(player, var_f8ebe9cfc6be863e);
                    function_5ae48a091056d6ff(player);
                } else {
                    function_b43e9536b7e60884(player, var_a69fcd2fca613429);
                    function_7e7900a1b5338836(player);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_f8748144e4bafbac/namespace_522ef15f95ed6589
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f0b
// Size: 0xd3
function private function_a8fd5e614c159b0f() {
    players = getteamdata(self.teams[0], "players");
    foreach (player in players) {
        if (isdefined(player.equipment["secondary"]) && player.equipment["secondary"] == "equip_geigercounter") {
            player namespace_1a507865f681850e::takeequipment("secondary");
        }
        lootid = namespace_38b993c4618e76cd::getLootIDFromRef("equip_geigercounter");
        while (player namespace_aead94004cf4c147::function_d63a7299c6203bf9(lootid)) {
            player namespace_aead94004cf4c147::function_6f39f9916649ac48(lootid);
        }
    }
}

