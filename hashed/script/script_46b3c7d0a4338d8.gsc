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
#using script_65f58f3c394dcf9a;
#using script_6c4e8cea70bf4b6d;
#using scripts\mp\gametypes\activity_manager.gsc;
#using script_1174abedbefe9ada;
#using script_64acb6ce534155b7;
#using script_15ca41a3fbb0e379;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\loot.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\equipment.gsc;
#using script_2d9d24f7c63ac143;
#using script_4948cdf739393d2d;
#using script_57d3850a12cf1d8f;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\poi.gsc;

#namespace namespace_2af4ac0005b4066b;

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x632
function function_80d68c9701e1aea5(data) {
    level.var_6d6a6fcd9e67bc58 = spawnstruct();
    level.var_6d6a6fcd9e67bc58.circleradius = getdvarint(@"hash_9cbb7d15274d1400", 2000);
    level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086 = getdvarint(@"hash_22afe1c9474c402b", 250);
    level.var_6d6a6fcd9e67bc58.numcaches = getdvarint(@"hash_a4e9af7f9b4f5f27", 3);
    level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b = getdvarint(@"hash_a238c865cc6af24c", 3500);
    level.var_6d6a6fcd9e67bc58.maxseparation = getdvarint(@"hash_4eef3124e0eeba7e", 6000);
    level.var_6d6a6fcd9e67bc58.neardist = getdvarint(@"hash_7ec9710223dce350", 1750);
    level.var_6d6a6fcd9e67bc58.neardistsq = level.var_6d6a6fcd9e67bc58.neardist * level.var_6d6a6fcd9e67bc58.neardist;
    level.var_6d6a6fcd9e67bc58.var_60a7f94f444a39bb = level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b * level.var_6d6a6fcd9e67bc58.var_b5c92b054a1fed4b;
    level.var_6d6a6fcd9e67bc58.var_60c5fe5ca7547989 = level.var_6d6a6fcd9e67bc58.maxseparation * level.var_6d6a6fcd9e67bc58.maxseparation;
    function_58bf160252f94e21();
    level.var_308d8c8ca5731e79 = [];
    allnodes = array_randomize(getstructarray("dmz_hidden_container", "script_noteworthy"));
    potentialnodes = [];
    foreach (node in allnodes) {
        if (namespace_7789f919216d38a2::function_cdcab1374db7f007(node.origin)) {
            continue;
        }
        potentialnodes[potentialnodes.size] = node;
    }
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
    foreach (node in nodegroups) {
        var_b5fc2bfa7eeeeed5 = getentitylessscriptablearray("scriptable_cache_toolbox", "classname", node.origin, 7500);
        if (var_b5fc2bfa7eeeeed5.size) {
            idealdist = 1500;
            bestdiff = 999999999;
            bestcache = undefined;
            foreach (cache in var_b5fc2bfa7eeeeed5) {
                if (istrue(cache.choosen) || !function_47b72e9dfbabd1da(cache)) {
                    continue;
                }
                diff = abs(distance(node.origin, cache.origin) - idealdist);
                if (diff < bestdiff) {
                    bestdiff = diff;
                    bestcache = cache;
                    if (bestdiff < 300) {
                        break;
                    }
                }
            }
            if (isdefined(bestcache)) {
                node.var_30eb0d4adcaafed9 = bestcache;
                bestcache.choosen = 1;
                level.var_308d8c8ca5731e79[level.var_308d8c8ca5731e79.size] = node;
            }
        }
    }
    level.var_d8db1602c8bf473e["brloot_valuable_fuelrods"] = &function_18db3205a09f3d50;
    level.var_5635125e56693c8["brloot_valuable_fuelrods"] = &function_4bc551d2a91831ac;
    thread function_9a1fde02233cb33a();
    function_b713f2d39b34540f(data, &function_c52467737f03e091, level.var_308d8c8ca5731e79);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa9
// Size: 0x17
function function_a07f7c4c0c4ef8e3() {
    /#
        return getstructarray("secondary", "<unknown string>");
    #/
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac7
// Size: 0x103
function function_c52467737f03e091(activity, node) {
    task = task_create(activity);
    task.funcs["onInit"] = &function_ab806e73f41ed0a2;
    task.funcs["onTeamAssigned"] = &function_1ed4e13220736831;
    task.funcs["onPlayerJoined"] = &function_235fe34454b16940;
    task.funcs["onPlayerRemoved"] = &function_9e6a1fc8c2bdf24b;
    task.funcs["onTeamStart"] = &function_4b5d3d286d6dac3b;
    task.funcs["onCancel"] = &function_599ce16653da505a;
    task.node = node;
    task.nodes = node.allnodes;
    task.ref = "dmz_geiger_search_explore";
    task.refindex = namespace_1eb3c4e0e28fac71::getquesttableindex(task.ref);
    return task;
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd2
// Size: 0x2f5
function function_ab806e73f41ed0a2() {
    self.caches = [];
    circlelocations = [];
    foreach (index, node in self.nodes) {
        cache = spawnscriptable("dmz_hidden_container", node.origin, node.angles);
        cache.var_534e0cf170a981b7 = &function_d8352a33e10df5a8;
        self.caches[index] = cache;
        cache.task = self;
        circlelocations[circlelocations.size] = function_ab50f62a3a730400(cache.origin, level.var_6d6a6fcd9e67bc58.circleradius);
        cache.cacheindex = index;
        cache setscriptablepartstate("body", "closed_unusable");
        /#
            namespace_d1a9ca87d78d9813::function_9533653868e59fb6("<unknown string>", self.activity.name, undefined, "secondary", undefined, undefined, self.activity.poi, node.origin);
        #/
        function_f0d61e14dfde9ccd(cache);
    }
    self.activity.origin = self.nodes[0].origin;
    function_325390edb051cd5d("Explore_Dmz", circlelocations, level.var_6d6a6fcd9e67bc58.circleradius + level.var_6d6a6fcd9e67bc58.var_e3aa1de9d96e0086);
    pos = (0, 0, 0);
    foreach (loc in circlelocations) {
        pos = pos + loc;
    }
    pos = pos / circlelocations.size;
    function_c847bfd52c064289(pos + (0, 0, 750));
    self.cachesfound = 0;
    if (self.caches.size < level.var_6d6a6fcd9e67bc58.numcaches) {
        function_8250fd658e3aae32();
        task_ended();
        return;
    }
    self.var_30eb0d4adcaafed9 = self.node.var_30eb0d4adcaafed9;
    if (!function_47b72e9dfbabd1da(self.var_30eb0d4adcaafed9)) {
        function_8250fd658e3aae32();
        task_ended();
        return;
    }
    self.var_a161875f61a76bf1 = self.node.var_30eb0d4adcaafed9;
    self.var_a161875f61a76bf1.var_534e0cf170a981b7 = &function_6df202b999c40a49;
    self.var_a161875f61a76bf1.task = self;
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xece
// Size: 0xfe
function function_235fe34454b16940(player) {
    if (!isdefined(self.var_a161875f61a76bf1.playercontents) || !isdefined(self.var_a161875f61a76bf1.playercontents[player.guid])) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
        var_5731e7b66522f308 = scripts/mp/gametypes/br_lootcache::function_848e20cf1d6cab8f([], 1, lootid);
        scripts/mp/loot::function_618f897065a12122(player, self.var_a161875f61a76bf1, var_5731e7b66522f308);
        scripts/mp/loot::function_618f897065a12122(player, self.var_a161875f61a76bf1, self.var_a161875f61a76bf1.contents);
    }
    foreach (cache in self.caches) {
        cache enablescriptableplayeruse(player);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd3
// Size: 0x8e
function function_9e6a1fc8c2bdf24b(player) {
    function_556fb3a465f0e978(player);
    function_401535e3fa9e171c(player);
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_629ed367d1393020();
    }
    foreach (cache in self.caches) {
        cache disablescriptableplayeruse(player);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1068
// Size: 0x47b
function function_1ed4e13220736831(teamname) {
    players = getteamdata(teamname, "players");
    if (!isdefined(self.var_a161875f61a76bf1.contents)) {
        items = getscriptablelootcachecontents(self.var_a161875f61a76bf1);
        self.var_a161875f61a76bf1.containertype = 3;
        self.var_a161875f61a76bf1.contents = scripts/mp/gametypes/br_lootcache::function_ec87b214cd429e96(items, undefined);
    }
    foreach (player in players) {
        if (!isdefined(self.var_a161875f61a76bf1.playercontents) || !isdefined(self.var_a161875f61a76bf1.playercontents[player.guid])) {
            lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
            var_5731e7b66522f308 = scripts/mp/gametypes/br_lootcache::function_848e20cf1d6cab8f([], 1, lootid);
            scripts/mp/loot::function_618f897065a12122(player, self.var_a161875f61a76bf1, var_5731e7b66522f308);
            scripts/mp/loot::function_618f897065a12122(player, self.var_a161875f61a76bf1, self.var_a161875f61a76bf1.contents);
        }
    }
    var_8edc62019d327b86 = function_c80f253020916751();
    if (var_8edc62019d327b86) {
        index = namespace_1eb3c4e0e28fac71::getquesttableindex("dmz_geiger_search_loot");
        function_cef2ed613a8338be(self.var_a161875f61a76bf1.origin + (0, 0, 15));
        self.cacheicon = spawnstruct();
        self.cacheicon namespace_f2c68794a1018c9d::function_c847bfd52c064289(function_3aa6a56ad7ab8aa7(), "recon");
        foreach (player in players) {
            if (player function_26e5198328580b5a()) {
                function_1851e9cfb7687f68(player);
                function_55be392e685e2721(player);
                function_d327e41f5eef4f64(player);
                continue;
            }
            function_556fb3a465f0e978(player);
            function_75903b3c87d79ddc(player);
            function_b43e9536b7e60884(player, index);
        }
    } else {
        foreach (player in players) {
            player.var_6947d1a323fd968b = 1;
        }
        function_e54df8560bf7dc64(teamname);
    }
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("geiger_search_assigned", teamname, 3);
    self.var_8bd50c7e994c7434 = function_9c6ab63c4b6bd08b(teamname);
    foreach (cache in self.caches) {
        cache setscriptablepartstate("body", "closed_usable");
        foreach (player in level.players) {
            cache disablescriptableplayeruse(player);
        }
        foreach (player in players) {
            cache enablescriptableplayeruse(player);
        }
    }
    function_1759acfd39bb5edf("dmz_geiger_assigned", teamname);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_start", 1.5, "dmz_activity_start_classic");
    foreach (player in players) {
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.numcaches - self.cachesfound);
    }
    thread function_b75b0cf7005c5f7(teamname);
    thread function_c373f127dafc389a(teamname);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ea
// Size: 0xc
function function_4b5d3d286d6dac3b(teamname) {
    
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14fd
// Size: 0xd8
function function_599ce16653da505a(teamname) {
    players = getteamdata(teamname, "players");
    foreach (player in players) {
        foreach (cache in self.caches) {
            cache disablescriptableplayeruse(player);
        }
    }
    function_c1fd3441ccfba6f8(teamname, undefined, undefined);
    function_8250fd658e3aae32();
    task_ended();
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15dc
// Size: 0x39
function function_8250fd658e3aae32() {
    self.taskended = 1;
    function_629ed367d1393020();
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_629ed367d1393020();
    }
    function_2476daefa3384c5e();
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x161c
// Size: 0x4d
function private function_ca27dbc903d08245(teamname) {
    self notify("task_ended");
    function_8250fd658e3aae32();
    thread namespace_446fc987a980892f::function_9793a81bc3bc19e9("geiger_search_win", teamname, 3);
    function_c1fd3441ccfba6f8(teamname, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
    task_ended(teamname);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1670
// Size: 0x74
function function_26e5198328580b5a() {
    curr = scripts/mp/equipment::getcurrentequipment("secondary");
    equipammo = scripts/mp/equipment::getequipmentslotammo("secondary");
    lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
    count = namespace_aead94004cf4c147::getTotalItemCountInBag(lootid);
    return isdefined(curr) && curr == "equip_geigercounter" && equipammo || isdefined(count) && count;
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ec
// Size: 0x86
function function_c80f253020916751() {
    teammates = getteamdata(self.teams[0], "players");
    var_9df31b4639d9eed8 = 0;
    foreach (teammate in teammates) {
        if (teammate function_26e5198328580b5a()) {
            continue;
        }
        var_9df31b4639d9eed8++;
    }
    return var_9df31b4639d9eed8;
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177a
// Size: 0x43
function function_47b72e9dfbabd1da(cache) {
    return !namespace_9823ee6035594d67::function_f59f68adc71d49b3(cache.origin) && !namespace_58dcf42cf567f34f::function_64332f29e2409e55(cache.origin) && !istrue(cache.islockedcache);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c5
// Size: 0x133
function function_6df202b999c40a49(instance, player) {
    if (!isdefined(instance.task) || !isdefined(instance.task.teams[0]) || player.team != instance.task.teams[0] || istrue(instance.task.taskended)) {
        player scripts/mp/hud_message::showerrormessage("MP_DMZ_MISSIONS/GEIGER_SEARCH_GC_CACHE_ERR");
        return 0;
    }
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.containertype = 3;
        instance.contents = scripts/mp/gametypes/br_lootcache::function_ec87b214cd429e96(items, undefined);
    }
    if (!isdefined(instance.playercontents) || !isdefined(instance.playercontents[player.guid])) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("equip_geigercounter");
        var_5731e7b66522f308 = scripts/mp/gametypes/br_lootcache::function_848e20cf1d6cab8f([], 1, lootid);
        scripts/mp/loot::function_618f897065a12122(player, instance, var_5731e7b66522f308);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18ff
// Size: 0xb5
function private function_d8352a33e10df5a8(instance, player) {
    if (!isdefined(instance.contents)) {
        items = getscriptablelootcachecontents(instance);
        instance.containertype = 3;
        instance.contents = scripts/mp/gametypes/br_lootcache::function_ec87b214cd429e96(items, undefined);
        var_8bd50c7e994c7434 = int(ceil(instance.task.var_8bd50c7e994c7434 / level.var_6d6a6fcd9e67bc58.numcaches));
        instance.contents = scripts/mp/gametypes/br_lootcache::function_163d360c111caa16(instance.contents, var_8bd50c7e994c7434, 500);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19bb
// Size: 0xb0
function private function_18db3205a09f3d50(instance, player) {
    if (isdefined(player.var_2fa5b49969def47) && isdefined(player.var_2fa5b49969def47.task)) {
        cache = player.var_2fa5b49969def47;
        task = cache.task;
        if (istrue(task.taskended)) {
            return 34;
        }
        result = undefined;
        if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
            return player scripts/mp/gametypes/br_pickups::function_cbbf9bf3544dc456(instance);
        }
        return 34;
    }
    if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
        return player scripts/mp/gametypes/br_pickups::function_cbbf9bf3544dc456(instance);
    }
    return 34;
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a73
// Size: 0x2ce
function function_4bc551d2a91831ac(pickup, player) {
    if (isdefined(player.var_2fa5b49969def47) && isdefined(player.var_2fa5b49969def47.task)) {
        cache = player.var_2fa5b49969def47;
        task = cache.task;
        task function_4e927bfe9b585059(cache.cacheindex);
        task.cachesfound++;
        cache.found = 1;
        function_a67007b5af86ff0b(cache);
        players = getteamdata(task.teams[0], "players");
        foreach (player in players) {
            player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(level.var_6d6a6fcd9e67bc58.numcaches - task.cachesfound);
        }
        splash = undefined;
        if (level.var_6d6a6fcd9e67bc58.numcaches == 1) {
            splash = "dmz_geiger_complete";
        }
        if (level.var_6d6a6fcd9e67bc58.numcaches == 2) {
            c = ["dmz_geiger_first_found_out_of_two", "dmz_geiger_complete"];
            splash = c[task.cachesfound - 1];
        }
        if (level.var_6d6a6fcd9e67bc58.numcaches == 3) {
            c = ["dmz_geiger_first_found", "dmz_geiger_second_found", "dmz_geiger_complete"];
            splash = c[task.cachesfound - 1];
        }
        if (task.cachesfound == level.var_6d6a6fcd9e67bc58.numcaches) {
            task function_a1738a95d7aa8094(splash, "geiger", task.activity.cashreward, player.team);
            task function_ca27dbc903d08245(player.team);
            function_c1fd3441ccfba6f8(player.team, "dmz_activity_win", 1.5, "dmz_activity_win_classic");
            return;
        }
        scripts/mp/gametypes/br_gametype_dmz::showdmzsplash(splash, getteamdata(player.team, "players"));
        task function_fce203bf90070ff0();
        function_c1fd3441ccfba6f8(player.team, "dmz_geigersearch_pickups", 0, "dmz_geigersearch_pickups_classic");
        function_c1fd3441ccfba6f8(player.team, "", 8);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d48
// Size: 0x167
function function_3aa6a56ad7ab8aa7() {
    pos = (0, 0, 0);
    foreach (circle in self.questcircles) {
        if (isdefined(circle) && isdefined(circle.mapcircle)) {
            pos = pos + circle.mapcircle.origin;
        }
    }
    var_d20aaeee28502da1 = max(1, level.var_6d6a6fcd9e67bc58.numcaches - self.cachesfound);
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

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb7
// Size: 0x3d
function function_fce203bf90070ff0() {
    pos = function_3aa6a56ad7ab8aa7();
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_cef2ed613a8338be(pos);
        return;
    }
    function_cef2ed613a8338be(pos);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1efb
// Size: 0x35
function function_55be392e685e2721(player) {
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_fbf23ae15945ee5a(player);
        return;
    }
    function_fbf23ae15945ee5a(player);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f37
// Size: 0x35
function function_75903b3c87d79ddc(player) {
    if (isdefined(self.cacheicon)) {
        self.cacheicon function_401535e3fa9e171c(player);
        return;
    }
    function_401535e3fa9e171c(player);
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f73
// Size: 0x21
function function_3c9248d849f9ffd7(player) {
    if (isdefined(self.cacheicon)) {
        function_fbf23ae15945ee5a(player);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f9b
// Size: 0x21
function function_d327e41f5eef4f64(player) {
    if (isdefined(self.cacheicon)) {
        function_401535e3fa9e171c(player);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc3
// Size: 0xda
function function_b75b0cf7005c5f7(teamname) {
    level endon("game_ended");
    self endon("task_ended");
    while (true) {
        players = getteamdata(teamname, "players");
        foreach (player in players) {
            if (isdefined(player.var_bcb3e1f6f7cd3cb7) && isdefined(player.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e) && player.var_bcb3e1f6f7cd3cb7.var_f458338f4188859e < 0.8) {
                namespace_446fc987a980892f::function_9793a81bc3bc19e9("geiger_search_detected", teamname);
                return;
            }
        }
        wait(1);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a4
// Size: 0x2f4
function function_c373f127dafc389a(teamname) {
    self endon("task_ended");
    wait(5);
    var_44937005a0f57f50 = 0;
    incircleindex = namespace_1eb3c4e0e28fac71::getquesttableindex("dmz_geiger_search");
    outcircleindex = namespace_1eb3c4e0e28fac71::getquesttableindex("dmz_geiger_search_explore");
    var_1660a3b7fcffb869 = namespace_1eb3c4e0e28fac71::getquesttableindex("dmz_geiger_search_loot");
    while (true) {
        if (isdefined(self.cacheicon)) {
            var_9df31b4639d9eed8 = function_c80f253020916751();
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
            if (!player scripts/cp_mp/utility/player_utility::_isalive()) {
                continue;
            }
            if (!player function_26e5198328580b5a() && isdefined(self.cacheicon)) {
                function_b43e9536b7e60884(player, var_1660a3b7fcffb869);
                function_75903b3c87d79ddc(player);
                function_3c9248d849f9ffd7(player);
                function_556fb3a465f0e978(player);
                continue;
            } else {
                function_d327e41f5eef4f64(player);
                function_1851e9cfb7687f68(player);
            }
            foreach (circle in self.questcircles) {
                if (!isdefined(circle)) {
                    continue;
                }
                distsq = distance2dsquared(circle.mapcircle.origin, player.origin);
                if (distsq < level.var_6d6a6fcd9e67bc58.circleradius * level.var_6d6a6fcd9e67bc58.circleradius) {
                    function_b43e9536b7e60884(player, incircleindex);
                    function_75903b3c87d79ddc(player);
                } else {
                    function_b43e9536b7e60884(player, outcircleindex);
                    function_55be392e685e2721(player);
                }
                if (!var_44937005a0f57f50 && distsq < level.var_6d6a6fcd9e67bc58.circleradius * level.var_6d6a6fcd9e67bc58.circleradius) {
                    namespace_446fc987a980892f::function_9793a81bc3bc19e9("geiger_search_approach", teamname);
                    function_c1fd3441ccfba6f8(teamname, "dmz_activity_tension", 0, "dmz_activity_tension_classic");
                    var_44937005a0f57f50 = 1;
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239f
// Size: 0x1c2
function function_9a1fde02233cb33a() {
    if (getdvarint(@"hash_e3673b8854e11b40", 0)) {
        index = 0;
        nodes = getstructarray("dmz_hidden_container", "script_noteworthy");
        lastcache = undefined;
        while (true) {
            poi = getdvar(@"hash_d4dd9c7f6eecaf23");
            if (getdvarint(@"hash_be93c6177feb6077", 0)) {
                setdvar(@"hash_be93c6177feb6077", 0);
                node = undefined;
                while (index < nodes.size) {
                    node = nodes[index];
                    index++;
                    if (isdefined(poi) && poi != "") {
                        if (!isdefined(node.poi)) {
                            node.poi = scripts/mp/poi::function_6cc445c02b5effac(node.origin);
                        }
                        if (node.poi == poi) {
                            break;
                        }
                        continue;
                    }
                    break;
                }
                if (!isdefined(node)) {
                    /#
                        printtoscreen2d(50, 50, "<unknown string>");
                    #/
                    index = 0;
                    continue;
                }
                if (isdefined(lastcache)) {
                    lastcache freescriptable();
                }
                lastcache = spawnscriptable("dmz_hidden_container", node.origin, node.angles);
                lastcache setscriptablepartstate("body", "closed_usable");
                origin = node.origin + (0, 0, 75);
                angles = vectortoangles(node.origin - origin);
                level.players[0] setorigin(origin);
                level.players[0] setplayerangles(angles);
            }
            waitframe();
        }
    }
}

// Namespace namespace_2af4ac0005b4066b / namespace_4f4cbea0f5b0bdb8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2568
// Size: 0x30
function function_12a716196c05eca1() {
    /#
        while (true) {
            sphere(self.origin, 50, (1, 1, 0), 0, 1);
            waitframe();
        }
    #/
}

