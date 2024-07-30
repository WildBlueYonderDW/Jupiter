#using scripts\mp\loot.gsc;
#using script_48614492ef09b23;
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2d9d24f7c63ac143;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using script_b7a9ce0a2282b79;
#using scripts\mp\utility\points.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\poi.gsc;
#using scripts\mp\flags.gsc;

#namespace dead_drop;

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x3ca
function init_dead_drop() {
    if (getdvarint(@"hash_9a391afdca9a675d", 1) == 0) {
        return;
    }
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("body_dead_drop", &function_cf1b1f86951a9209);
    scripts\engine\utility::flag_wait("scriptables_ready");
    level.deaddrops = [];
    alldeaddrops = getentitylessscriptablearray("scriptable_dmz_dead_drop", "classname");
    var_d7ee9ee56a05d38e = getstructarray("dead_drop", "targetname");
    foreach (deaddrop in var_d7ee9ee56a05d38e) {
        defname = "dmz_dead_drop";
        if (isdefined(deaddrop.var_89dadbbf1464c45e) && int(deaddrop.var_89dadbbf1464c45e) == 1) {
            defname = "dmz_dead_drop_transaction_drawer";
        }
        scriptable = spawnscriptable(defname, deaddrop.origin, deaddrop.angles);
        alldeaddrops[alldeaddrops.size] = scriptable;
    }
    alldeaddrops = array_randomize(alldeaddrops);
    deaddropcount = alldeaddrops.size;
    if (level.mapname == "mp_bio_lab") {
        deaddropcount = getdvarint(@"hash_b17c7dabc88f3082", 1);
    }
    if (scripts\cp_mp\utility\game_utility::function_7ee65fae13124702()) {
        var_35d8ff653f94a7ca = [(10021, 21237, 308), (9406, 6453, 354), (28068, -16832, 627), (-14881, -34634, 530), (-24077, -19468, 396), (-34730, 20647, -397)];
        removedlocs = [];
        foreach (loc in alldeaddrops) {
            foreach (filter in var_35d8ff653f94a7ca) {
                if (distancesquared(loc.origin, filter) < 250000) {
                    scripts\mp\gametypes\br_pickups::loothide(loc, "body_dead_drop");
                    removedlocs[removedlocs.size] = loc;
                }
            }
        }
        alldeaddrops = array_remove_array(alldeaddrops, removedlocs);
    }
    var_6ad079ac6ab5cdc3 = 0;
    foreach (deaddrop in alldeaddrops) {
        if (var_6ad079ac6ab5cdc3 >= deaddropcount) {
            scripts\mp\gametypes\br_pickups::loothide(deaddrop, "body_dead_drop");
            continue;
        }
        deaddrop setscriptablepartstate("body_dead_drop", "closed_usable");
        deaddrop.usedcallback = &function_be64875fae5bd1ce;
        deaddrop.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
        deaddrop.var_ceb543956c7203e7 = &function_a1cbb02f01a33768;
        deaddrop.noweaponslot = !getdvarint(@"hash_6ee9465e13d271e5", 1);
        level.deaddrops[level.deaddrops.size] = deaddrop;
        var_6ad079ac6ab5cdc3++;
    }
    /#
        thread function_dd5b2fd6714dfcc5();
        thread function_81caaaceb9608436();
        thread function_55fc171c5983769f(alldeaddrops);
        thread function_6ac81ebed556d7dd(alldeaddrops);
        thread function_625351669d6c9017();
    #/
    scripts\engine\utility::flag_set("dead_drops_init");
}

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a8
// Size: 0x76
function function_be64875fae5bd1ce(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (instance getscriptablepartstate("body_dead_drop") != "partially_opening_unusable") {
        instance setscriptablepartstate("body_dead_drop", "partially_opening_unusable");
    }
    if (isdefined(instance.var_50657bcf5bb1ed14)) {
        [[ instance.var_50657bcf5bb1ed14 ]](player);
    }
}

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x726
// Size: 0xd6
function function_2463f61a8c4d7772(container, player, lootid, quantity, itemtype, itemindex, containerindex) {
    noextract = undefined;
    if (scripts\engine\utility::issharedfuncdefined("pmc_missions", "onAddItemToDeadDrop")) {
        var_57ac4dc40b2e376 = [[ scripts\engine\utility::getsharedfunc("pmc_missions", "onAddItemToDeadDrop") ]](container, lootid);
        noextract = var_57ac4dc40b2e376[1];
        lootid = var_57ac4dc40b2e376[0];
    }
    backpackquantity = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        backpackquantity = player namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex);
    }
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype, itemindex, lootid, backpackquantity);
    return [lootid, noextract];
}

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x805
// Size: 0xa16
function function_a1cbb02f01a33768(container, opener) {
    container setscriptablepartstate("body_dead_drop", "partially_closing_unusable");
    player = opener;
    if (!isdefined(player) || !isdefined(container)) {
        return;
    }
    if (isdefined(container.playeropen) && isdefined(container.playeropen[player.guid])) {
        container.playeropen[player.guid] = undefined;
    }
    var_e1cf43f3ae9d77e7 = function_564c579ae581a82d(container.playercontents[player.guid].contents);
    if (isdefined(container.var_7ff4adf1a6c36a48)) {
        [[ container.var_7ff4adf1a6c36a48 ]](var_e1cf43f3ae9d77e7, opener);
    }
    totalcash = 0;
    foreach (index, item in var_e1cf43f3ae9d77e7) {
        if (!isdefined(item.lootid)) {
            continue;
        }
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item.lootid);
        var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
        itemtype = undefined;
        if (isdefined(var_25978461c6e4f61b)) {
            itemtype = level.br_pickups.br_itemtype[var_25978461c6e4f61b];
        }
        if (isdefined(itemtype) && !istrue(item.noextract)) {
            if (itemtype == #"plunder") {
                totalcash += item.quantity;
                continue;
            }
            if (getdvarint(@"hash_6d4fb2de66a0bd7", 1) || namespace_aead94004cf4c147::function_e25e584cac984a5d(itemtype)) {
                if (isdefined(var_25978461c6e4f61b) && isdefined(level.br_pickups.br_value[var_25978461c6e4f61b])) {
                    cashvalue = level.br_pickups.br_value[var_25978461c6e4f61b];
                    quantity = item.quantity;
                    if (scripts\mp\gametypes\br_pickups::function_d345eec68e01361f(item.lootid)) {
                        quantity = 1;
                    }
                    totalcash += quantity * cashvalue;
                }
            }
        }
    }
    weaponitem = undefined;
    if (!istrue(container.noweaponslot) && !istrue(container.playercontents[player.guid].var_5a90d1a92f9af4e3)) {
        weaponslotid = player scripts\mp\loot::function_d6a3266145bab76d("loot_container_weapon");
        if (istrue(weaponslotid)) {
            weaponitem = spawnstruct();
            weaponitem.lootid = weaponslotid;
            weaponitem.quantity = 1;
            weaponitem.pastteam = container.playercontents[player.guid].var_275f4441ab7920c8;
            var_e1cf43f3ae9d77e7[var_e1cf43f3ae9d77e7.size] = weaponitem;
            totalcash += getdvarint(@"hash_6bf1f5da160e1cc", 400);
        }
    }
    method = 0;
    method = scripts\cp_mp\challenges::function_6d40f12a09494350(method, ae_utility::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"dead_drop"));
    poi = function_30b30561882a2477(container);
    if (!namespace_8361bad7391de074::function_6f6cc16c0528de5b(player) && !getdvarint(@"hash_c3da1a11f720d408", 0)) {
        return;
    }
    var_be59925f9891e2c1 = 0;
    foreach (index, item in container.playercontents[player.guid].contents) {
        if (item["lootID"] == 0 || item["quantity"] == 0) {
            continue;
        }
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item["lootID"]);
        var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
        itemtype = undefined;
        if (isdefined(var_25978461c6e4f61b)) {
            itemtype = level.br_pickups.var_2d9176b507230cab[var_25978461c6e4f61b];
        }
        if (!istrue(container.playercontents[player.guid].contents[index]["noExtract"])) {
            result = scripts\cp_mp\challenges::function_d24138b32084fc3e(player, container.playercontents[player.guid].contents[index]["lootID"], itemtype, method, container.playercontents[player.guid].contents[index]["quantity"], undefined, container.poi);
            var_be59925f9891e2c1 = istrue(result) || var_be59925f9891e2c1;
            if (!getdvarint(@"hash_6d4fb2de66a0bd7", 1) && !istrue(result) && !namespace_aead94004cf4c147::function_e25e584cac984a5d(itemtype)) {
                continue;
            }
            container.playercontents[player.guid].contents[index]["lootID"] = 0;
            container.playercontents[player.guid].contents[index]["quantity"] = 0;
        }
    }
    if (isdefined(weaponitem)) {
        lootsource = 0;
        if (isdefined(weaponitem.pastteam) && isdefined(player.team) && weaponitem.pastteam != player.team) {
            lootsource = scripts\cp_mp\challenges::function_6d40f12a09494350(lootsource, ae_utility::function_e2ff8f4b4e94f723(#"loot_source", #"enemy_player"));
        }
        result = scripts\cp_mp\challenges::function_d24138b32084fc3e(player, weaponitem.lootid, "weapon", method, weaponitem.quantity, lootsource, container.poi);
        namespace_8361bad7391de074::function_44cb8b0c33cef670(player, container, container.playercontents[player.guid].weaponslotobj);
        var_be59925f9891e2c1 = istrue(result) || var_be59925f9891e2c1;
        player setclientomnvar("loot_container_weapon", 0);
        container.playercontents[player.guid].weaponslotcontents = 0;
        container.playercontents[player.guid].weaponslotobj = undefined;
        container.playercontents[player.guid].var_275f4441ab7920c8 = undefined;
        container.playercontents[player.guid].metadata = undefined;
        container.playercontents[player.guid].var_5a90d1a92f9af4e3 = undefined;
    }
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        var_a123cdd3c38b7829 = namespace_a38a2e1fe7519183::function_80478f2ef8c8882f(player);
        var_3d437f1697570e9a = function_160a29300ce1e14(totalcash, player);
        if (var_3d437f1697570e9a > 0) {
            cooldownratio = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
            scoreoverride = int(getdvarint(@"hash_fabc6973e3e762a1", 200) * totalcash / cooldownratio);
            player thread scripts\mp\utility\points::doScoreEvent(#"dmz_dead_drop", undefined, scoreoverride, scoreoverride);
            if (istrue(var_a123cdd3c38b7829) && !istrue(var_be59925f9891e2c1)) {
                lowestcooldown = namespace_a38a2e1fe7519183::function_498ba9b391e5d087(player);
                if (!isdefined(lowestcooldown)) {
                    namespace_446fc987a980892f::playevent("player_dead_drop_cooldown_finish", [player]);
                } else {
                    tmpcooldown = lowestcooldown - getsystemtime();
                    if (tmpcooldown < 1800) {
                        namespace_446fc987a980892f::playevent("player_dead_drop_cooldown_low", [player]);
                    } else if (tmpcooldown >= 1800 && tmpcooldown < 3600) {
                        namespace_446fc987a980892f::playevent("player_dead_drop_cooldown_medium", [player]);
                    } else {
                        namespace_446fc987a980892f::playevent("player_dead_drop_cooldown_high", [player]);
                    }
                }
            }
            if (!isdefined(player.var_fd5c87130f304833)) {
                player.var_fd5c87130f304833 = 0;
            }
            player.var_fd5c87130f304833 += scoreoverride;
        }
        if (!isdefined(player.var_8ae6c90597daa60a)) {
            player.var_8ae6c90597daa60a = 0;
        }
        player.var_8ae6c90597daa60a += totalcash;
        if (!isdefined(player.var_ec9a1b9484844fbe)) {
            player.var_ec9a1b9484844fbe = 0;
        }
        player.var_ec9a1b9484844fbe += var_3d437f1697570e9a;
    }
    if (istrue(var_be59925f9891e2c1)) {
        namespace_446fc987a980892f::playevent("player_item_dead_drop_taken", [player]);
    }
    /#
        if (getdvarint(@"hash_c3da1a11f720d408", 0) && !namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            cooldownratio = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
            var_3d437f1697570e9a = int(getdvarint(@"hash_fabc6973e3e762a1", 200) * totalcash / cooldownratio);
            testval = getdvarint(@"hash_52618bf1bf36e20", 0);
            if (var_3d437f1697570e9a > 0) {
                scoreoverride = int(200 * totalcash / cooldownratio);
                player thread scripts\mp\utility\points::doScoreEvent(#"dmz_dead_drop", undefined, scoreoverride, scoreoverride);
                if (testval == 0) {
                    namespace_446fc987a980892f::playevent("<dev string:x1c>", [player]);
                } else if (testval == 1) {
                    namespace_446fc987a980892f::playevent("<dev string:x3d>", [player]);
                } else if (testval == 2) {
                    namespace_446fc987a980892f::playevent("<dev string:x5b>", [player]);
                } else if (testval == 3) {
                    namespace_446fc987a980892f::playevent("<dev string:x7c>", [player]);
                }
            }
            if (testval == 4) {
                namespace_446fc987a980892f::playevent("<dev string:x9b>", [player]);
            }
        }
    #/
}

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1223
// Size: 0x5a
function function_160a29300ce1e14(totalcash, player, reductionmodifier) {
    reductionmodifier = scripts\engine\utility::default_to(reductionmodifier, 1);
    cooldownratio = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
    var_3d437f1697570e9a = int(3600 * totalcash / cooldownratio * reductionmodifier);
    namespace_a38a2e1fe7519183::function_a9857977596563cd(player, var_3d437f1697570e9a);
    return var_3d437f1697570e9a;
}

// Namespace dead_drop / scripts\mp\gametypes\dead_drop
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1286
// Size: 0x45
function function_30b30561882a2477(container) {
    if (!isdefined(container.poi)) {
        container.poi = scripts\mp\poi::function_6cc445c02b5effac(container.origin, 0, 1);
    }
    return container.poi;
}

/#

    // Namespace dead_drop / scripts\mp\gametypes\dead_drop
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x12d4
    // Size: 0x112
    function function_dd5b2fd6714dfcc5() {
        level endon("<dev string:xb7>");
        setdevdvar(@"hash_33a02069af06abbb", 0);
        level.var_c3e38887ceebe99c = [];
        while (true) {
            spawndrop = getdvarint(@"hash_33a02069af06abbb", 0);
            if (spawndrop) {
                setdevdvar(@"hash_33a02069af06abbb", 0);
                item = spawnscriptable("<dev string:xc2>", level.players[0].origin, level.players[0].angles);
                item setscriptablepartstate("<dev string:xd0>", "<dev string:xdf>");
                item.usedcallback = &function_be64875fae5bd1ce;
                item.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
                item.var_ceb543956c7203e7 = &function_a1cbb02f01a33768;
                item.noweaponslot = !getdvarint(@"hash_6ee9465e13d271e5", 0);
                level.var_c3e38887ceebe99c[level.var_c3e38887ceebe99c.size] = item;
            }
            waitframe();
        }
    }

    // Namespace dead_drop / scripts\mp\gametypes\dead_drop
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x13ee
    // Size: 0x14f
    function function_81caaaceb9608436() {
        level endon("<dev string:xb7>");
        setdevdvar(@"hash_1795f8de9b946d21", "<dev string:xed>");
        while (true) {
            var_19e1cb1a142bd70a = getdvar(@"hash_1795f8de9b946d21", "<dev string:xed>");
            if (var_19e1cb1a142bd70a != "<dev string:xed>") {
                setdevdvar(@"hash_1795f8de9b946d21", "<dev string:xed>");
                if (level.var_c3e38887ceebe99c.size == 0) {
                    continue;
                }
                foreach (deaddrop in level.var_c3e38887ceebe99c) {
                    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_19e1cb1a142bd70a);
                    weaponobj = undefined;
                    quantity = undefined;
                    if (scripts\mp\gametypes\br_pickups::isweaponpickup(var_19e1cb1a142bd70a)) {
                        weaponobj = scripts\mp\gametypes\br_pickups::getfullweaponobjfromscriptablename(var_19e1cb1a142bd70a);
                        quantity = weaponclipsize(weaponobj);
                    } else {
                        quantity = level.br_pickups.counts[var_19e1cb1a142bd70a];
                    }
                    if (!isdefined(lootid) || !isdefined(quantity)) {
                        continue;
                    }
                    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(level.players, deaddrop, lootid, quantity, weaponobj, 1, 1);
                }
            }
            waitframe();
        }
    }

    // Namespace dead_drop / scripts\mp\gametypes\dead_drop
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1545
    // Size: 0x136
    function function_55fc171c5983769f(alldeaddrops) {
        level endon("<dev string:xb7>");
        setdevdvar(@"hash_e6fe6e130f8e354b", 0);
        while (true) {
            shoulddraw = getdvarint(@"hash_e6fe6e130f8e354b", 0);
            if (shoulddraw) {
                foreach (deaddrop in level.deaddrops) {
                    draw_circle(deaddrop.origin + (0, 0, 20), 50, (0, 1, 0), 1, 0, 1);
                }
                foreach (deaddrop in alldeaddrops) {
                    draw_circle(deaddrop.origin, 50, (1, 0, 0), 1, 0, 1);
                }
            }
            waitframe();
        }
    }

    // Namespace dead_drop / scripts\mp\gametypes\dead_drop
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1683
    // Size: 0x88
    function function_6ac81ebed556d7dd(alldeaddrops) {
        level endon("<dev string:xb7>");
        if (!scripts\mp\flags::gameflag("<dev string:xee>")) {
            level scripts\mp\flags::gameflagwait("<dev string:xee>");
        }
        foreach (deaddrop in alldeaddrops) {
            level thread namespace_8361bad7391de074::function_955e6c9750ee6b5e(level.players, deaddrop);
        }
    }

    // Namespace dead_drop / scripts\mp\gametypes\dead_drop
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1713
    // Size: 0x181
    function function_625351669d6c9017() {
        level endon("<dev string:xb7>");
        if (!scripts\mp\flags::gameflag("<dev string:xee>")) {
            level scripts\mp\flags::gameflagwait("<dev string:xee>");
        }
        setdevdvar(@"hash_a064eaf3659203b1", 0);
        while (true) {
            if (!isdefined(level.var_c3e38887ceebe99c) || level.var_c3e38887ceebe99c.size <= 0) {
                waitframe();
                continue;
            }
            botuse = getdvarint(@"hash_a064eaf3659203b1", 0);
            if (botuse) {
                setdevdvar(@"hash_a064eaf3659203b1", 0);
                selectedbot = undefined;
                foreach (player in level.players) {
                    if (isbot(player) && isalive(player)) {
                        selectedbot = player;
                        break;
                    }
                }
                if (!isdefined(selectedbot)) {
                    waitframe();
                    continue;
                }
                deaddrop = level.var_c3e38887ceebe99c[0];
                if (!isdefined(deaddrop)) {
                    waitframe();
                    continue;
                }
                forward = anglestoforward(deaddrop.angles);
                selectedbot setorigin(deaddrop.origin + forward * 50);
                waitframe();
                selectedbot botlookatpoint(deaddrop.origin, 10);
                waitframe();
                selectedbot botpressbutton("<dev string:xfc>", 1);
            }
            waitframe();
        }
    }

#/
