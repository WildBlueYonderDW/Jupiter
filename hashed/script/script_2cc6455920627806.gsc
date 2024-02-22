// mwiii decomp prototype
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
#using script_5def7af2a9f04234;
#using scripts\mp\flags.gsc;

#namespace dead_drop;

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6
// Size: 0x3cb
function function_476ba78d85b349ea() {
    if (getdvarint(@"hash_9a391afdca9a675d", 1) == 0) {
        return;
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body_dead_drop", &function_cf1b1f86951a9209);
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    level.var_ced78996bbf1b2d3 = [];
    var_23bb061a51e4a968 = getentitylessscriptablearray("scriptable_dmz_dead_drop", "classname");
    var_d7ee9ee56a05d38e = getstructarray("dead_drop", "targetname");
    foreach (var_5793a0cf9d352c92 in var_d7ee9ee56a05d38e) {
        var_96f03b58138c074b = "dmz_dead_drop";
        if (isdefined(var_5793a0cf9d352c92.var_89dadbbf1464c45e) && int(var_5793a0cf9d352c92.var_89dadbbf1464c45e) == 1) {
            var_96f03b58138c074b = "dmz_dead_drop_transaction_drawer";
        }
        scriptable = spawnscriptable(var_96f03b58138c074b, var_5793a0cf9d352c92.origin, var_5793a0cf9d352c92.angles);
        var_23bb061a51e4a968[var_23bb061a51e4a968.size] = scriptable;
    }
    var_23bb061a51e4a968 = array_randomize(var_23bb061a51e4a968);
    var_687e21d8e8ea30d9 = var_23bb061a51e4a968.size;
    if (level.mapname == "mp_bio_lab") {
        var_687e21d8e8ea30d9 = getdvarint(@"hash_b17c7dabc88f3082", 1);
    }
    if (namespace_36f464722d326bbe::function_7ee65fae13124702()) {
        var_35d8ff653f94a7ca = [0:(10021, 21237, 308), 1:(9406, 6453, 354), 2:(28068, -16832, 627), 3:(-14881, -34634, 530), 4:(-24077, -19468, 396), 5:(-34730, 20647, -397)];
        var_a7313b60400bb70 = [];
        foreach (loc in var_23bb061a51e4a968) {
            foreach (filter in var_35d8ff653f94a7ca) {
                if (distancesquared(loc.origin, filter) < 250000) {
                    namespace_cb965d2f71fefddc::loothide(loc, "body_dead_drop");
                    var_a7313b60400bb70[var_a7313b60400bb70.size] = loc;
                }
            }
        }
        var_23bb061a51e4a968 = array_remove_array(var_23bb061a51e4a968, var_a7313b60400bb70);
    }
    var_6ad079ac6ab5cdc3 = 0;
    foreach (var_5793a0cf9d352c92 in var_23bb061a51e4a968) {
        if (var_6ad079ac6ab5cdc3 >= var_687e21d8e8ea30d9) {
            namespace_cb965d2f71fefddc::loothide(var_5793a0cf9d352c92, "body_dead_drop");
        } else {
            var_5793a0cf9d352c92 setscriptablepartstate("body_dead_drop", "closed_usable");
            var_5793a0cf9d352c92.usedcallback = &function_be64875fae5bd1ce;
            var_5793a0cf9d352c92.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
            var_5793a0cf9d352c92.var_ceb543956c7203e7 = &function_a1cbb02f01a33768;
            var_5793a0cf9d352c92.var_febe9aacdd2e47b2 = !getdvarint(@"hash_6ee9465e13d271e5", 1);
            level.var_ced78996bbf1b2d3[level.var_ced78996bbf1b2d3.size] = var_5793a0cf9d352c92;
            var_6ad079ac6ab5cdc3++;
        }
    }
    /#
        thread function_dd5b2fd6714dfcc5();
        thread function_81caaaceb9608436();
        thread function_55fc171c5983769f(var_23bb061a51e4a968);
        thread function_6ac81ebed556d7dd(var_23bb061a51e4a968);
        thread function_625351669d6c9017();
    #/
    namespace_3c37cb17ade254d::flag_set("dead_drops_init");
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a8
// Size: 0x77
function function_be64875fae5bd1ce(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (instance getscriptablepartstate("body_dead_drop") != "partially_opening_unusable") {
        instance setscriptablepartstate("body_dead_drop", "partially_opening_unusable");
    }
    if (isdefined(instance.var_50657bcf5bb1ed14)) {
        [[ instance.var_50657bcf5bb1ed14 ]](player);
    }
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x726
// Size: 0xd7
function function_2463f61a8c4d7772(container, player, lootid, quantity, itemtype, itemindex, var_d54a79024c228770) {
    noextract = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("pmc_missions", "onAddItemToDeadDrop")) {
        var_57ac4dc40b2e376 = [[ namespace_3c37cb17ade254d::getsharedfunc("pmc_missions", "onAddItemToDeadDrop") ]](container, lootid);
        noextract = var_57ac4dc40b2e376[1];
        lootid = var_57ac4dc40b2e376[0];
    }
    var_dfab44d4d8d10b36 = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        var_dfab44d4d8d10b36 = player namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex);
    }
    if (!isdefined(itemtype)) {
        itemtype = 0;
    }
    if (!isdefined(itemindex)) {
        itemindex = 0;
    }
    player notify("item_added_to_cache", itemtype);
    return [0:lootid, 1:noextract];
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x805
// Size: 0xa17
function function_a1cbb02f01a33768(container, opener) {
    container setscriptablepartstate("body_dead_drop", "partially_closing_unusable");
    player = opener;
    if (!isdefined(player) || !isdefined(container)) {
        return;
    }
    if (isdefined(container.var_2bc73315bd31809c) && isdefined(container.var_2bc73315bd31809c[player.guid])) {
        container.var_2bc73315bd31809c[player.guid] = undefined;
    }
    var_e1cf43f3ae9d77e7 = function_564c579ae581a82d(container.var_556db0b72a96514e[player.guid].contents);
    if (isdefined(container.var_7ff4adf1a6c36a48)) {
        [[ container.var_7ff4adf1a6c36a48 ]](var_e1cf43f3ae9d77e7, opener);
    }
    var_bbac576aade31a1e = 0;
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
                var_bbac576aade31a1e = var_bbac576aade31a1e + item.quantity;
            } else if (getdvarint(@"hash_6d4fb2de66a0bd7", 1) || namespace_aead94004cf4c147::function_e25e584cac984a5d(itemtype)) {
                if (isdefined(var_25978461c6e4f61b) && isdefined(level.br_pickups.var_d93566a78e29d583[var_25978461c6e4f61b])) {
                    var_b87f7fae01ce754f = level.br_pickups.var_d93566a78e29d583[var_25978461c6e4f61b];
                    quantity = item.quantity;
                    if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(item.lootid)) {
                        quantity = 1;
                    }
                    var_bbac576aade31a1e = var_bbac576aade31a1e + quantity * var_b87f7fae01ce754f;
                }
            }
        }
    }
    weaponitem = undefined;
    if (!istrue(container.var_febe9aacdd2e47b2) && !istrue(container.var_556db0b72a96514e[player.guid].var_5a90d1a92f9af4e3)) {
        var_98f7ce981bb1f93c = player namespace_3f0ea7483345a2c0::function_d6a3266145bab76d("loot_container_weapon");
        if (istrue(var_98f7ce981bb1f93c)) {
            weaponitem = spawnstruct();
            weaponitem.lootid = var_98f7ce981bb1f93c;
            weaponitem.quantity = 1;
            weaponitem.var_e1147886ccf51970 = container.var_556db0b72a96514e[player.guid].var_275f4441ab7920c8;
            var_e1cf43f3ae9d77e7[var_e1cf43f3ae9d77e7.size] = weaponitem;
            var_bbac576aade31a1e = var_bbac576aade31a1e + getdvarint(@"hash_6bf1f5da160e1cc", 400);
        }
    }
    method = 0;
    method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"dead_drop"));
    poi = function_30b30561882a2477(container);
    if (!namespace_8361bad7391de074::function_6f6cc16c0528de5b(player) && !getdvarint(@"hash_c3da1a11f720d408", 0)) {
        return;
    }
    var_be59925f9891e2c1 = 0;
    foreach (index, item in container.var_556db0b72a96514e[player.guid].contents) {
        if (item["lootID"] == 0 || item["quantity"] == 0) {
            continue;
        }
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item["lootID"]);
        var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
        itemtype = undefined;
        if (isdefined(var_25978461c6e4f61b)) {
            itemtype = level.br_pickups.var_2d9176b507230cab[var_25978461c6e4f61b];
        }
        if (!istrue(container.var_556db0b72a96514e[player.guid].contents[index]["noExtract"])) {
            result = namespace_aad14af462a74d08::function_d24138b32084fc3e(player, container.var_556db0b72a96514e[player.guid].contents[index]["lootID"], itemtype, method, container.var_556db0b72a96514e[player.guid].contents[index]["quantity"], undefined, container.poi);
            var_be59925f9891e2c1 = istrue(result) || var_be59925f9891e2c1;
            if (!getdvarint(@"hash_6d4fb2de66a0bd7", 1) && !istrue(result) && !namespace_aead94004cf4c147::function_e25e584cac984a5d(itemtype)) {
                continue;
            }
            container.var_556db0b72a96514e[player.guid].contents[index]["lootID"] = 0;
            container.var_556db0b72a96514e[player.guid].contents[index]["quantity"] = 0;
        }
    }
    if (isdefined(weaponitem)) {
        lootsource = 0;
        if (isdefined(weaponitem.var_e1147886ccf51970) && isdefined(player.team) && weaponitem.var_e1147886ccf51970 != player.team) {
            lootsource = namespace_aad14af462a74d08::function_6d40f12a09494350(lootsource, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_570fd18b83e115ad", #"enemy_player"));
        }
        result = namespace_aad14af462a74d08::function_d24138b32084fc3e(player, weaponitem.lootid, "weapon", method, weaponitem.quantity, lootsource, container.poi);
        namespace_8361bad7391de074::function_44cb8b0c33cef670(player, container, container.var_556db0b72a96514e[player.guid].var_6fb67c8525b1d79e);
        var_be59925f9891e2c1 = istrue(result) || var_be59925f9891e2c1;
        player setclientomnvar("loot_container_weapon", 0);
        container.var_556db0b72a96514e[player.guid].var_4f6cde716e0c3d7 = 0;
        container.var_556db0b72a96514e[player.guid].var_6fb67c8525b1d79e = undefined;
        container.var_556db0b72a96514e[player.guid].var_275f4441ab7920c8 = undefined;
        container.var_556db0b72a96514e[player.guid].metadata = undefined;
        container.var_556db0b72a96514e[player.guid].var_5a90d1a92f9af4e3 = undefined;
    }
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        var_a123cdd3c38b7829 = namespace_a38a2e1fe7519183::function_80478f2ef8c8882f(player);
        var_3d437f1697570e9a = function_160a29300ce1e14(var_bbac576aade31a1e, player);
        if (var_3d437f1697570e9a > 0) {
            var_495e140c3eb9a557 = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
            var_500370e4f476faa9 = int(getdvarint(@"hash_fabc6973e3e762a1", 200) * var_bbac576aade31a1e / var_495e140c3eb9a557);
            player thread namespace_48a08c5037514e04::doscoreevent(#"dmz_dead_drop", undefined, var_500370e4f476faa9, var_500370e4f476faa9);
            if (istrue(var_a123cdd3c38b7829) && !istrue(var_be59925f9891e2c1)) {
                var_1cc0d36f156a181a = namespace_a38a2e1fe7519183::function_498ba9b391e5d087(player);
                if (!isdefined(var_1cc0d36f156a181a)) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_dead_drop_cooldown_finish", [0:player]);
                } else {
                    var_6f4690aa906c3f73 = var_1cc0d36f156a181a - getsystemtime();
                    if (var_6f4690aa906c3f73 < 1800) {
                        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_dead_drop_cooldown_low", [0:player]);
                    } else if (var_6f4690aa906c3f73 >= 1800 && var_6f4690aa906c3f73 < 3600) {
                        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_dead_drop_cooldown_medium", [0:player]);
                    } else {
                        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_dead_drop_cooldown_high", [0:player]);
                    }
                }
            }
            if (!isdefined(player.var_fd5c87130f304833)) {
                player.var_fd5c87130f304833 = 0;
            }
            player.var_fd5c87130f304833 = player.var_fd5c87130f304833 + var_500370e4f476faa9;
        }
        if (!isdefined(player.var_8ae6c90597daa60a)) {
            player.var_8ae6c90597daa60a = 0;
        }
        player.var_8ae6c90597daa60a = player.var_8ae6c90597daa60a + var_bbac576aade31a1e;
        if (!isdefined(player.var_ec9a1b9484844fbe)) {
            player.var_ec9a1b9484844fbe = 0;
        }
        player.var_ec9a1b9484844fbe = player.var_ec9a1b9484844fbe + var_3d437f1697570e9a;
    }
    if (istrue(var_be59925f9891e2c1)) {
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("player_item_dead_drop_taken", [0:player]);
    }
    /#
        if (getdvarint(@"hash_c3da1a11f720d408", 0) && !namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            var_495e140c3eb9a557 = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
            var_3d437f1697570e9a = int(getdvarint(@"hash_fabc6973e3e762a1", 200) * var_bbac576aade31a1e / var_495e140c3eb9a557);
            var_e96f64067bfc72b8 = getdvarint(@"hash_52618bf1bf36e20", 0);
            if (var_3d437f1697570e9a > 0) {
                var_500370e4f476faa9 = int(200 * var_bbac576aade31a1e / var_495e140c3eb9a557);
                player thread namespace_48a08c5037514e04::doscoreevent(#"dmz_dead_drop", undefined, var_500370e4f476faa9, var_500370e4f476faa9);
                if (var_e96f64067bfc72b8 == 0) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:player]);
                } else if (var_e96f64067bfc72b8 == 1) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:player]);
                } else if (var_e96f64067bfc72b8 == 2) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:player]);
                } else if (var_e96f64067bfc72b8 == 3) {
                    namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:player]);
                }
            }
            if (var_e96f64067bfc72b8 == 4) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("<unknown string>", [0:player]);
            }
        }
    #/
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1223
// Size: 0x5b
function function_160a29300ce1e14(var_bbac576aade31a1e, player, var_95338f9d8305c0cb) {
    var_95338f9d8305c0cb = namespace_3c37cb17ade254d::function_53c4c53197386572(var_95338f9d8305c0cb, 1);
    var_495e140c3eb9a557 = namespace_a38a2e1fe7519183::function_4e92b2a9e565aee();
    var_3d437f1697570e9a = int(3600 * var_bbac576aade31a1e / var_495e140c3eb9a557 * var_95338f9d8305c0cb);
    namespace_a38a2e1fe7519183::function_a9857977596563cd(player, var_3d437f1697570e9a);
    return var_3d437f1697570e9a;
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1286
// Size: 0x46
function function_30b30561882a2477(container) {
    if (!isdefined(container.poi)) {
        container.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(container.origin, 0, 1);
    }
    return container.poi;
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d4
// Size: 0x113
function function_dd5b2fd6714dfcc5() {
    /#
        level endon("<unknown string>");
        setdevdvar(@"hash_33a02069af06abbb", 0);
        level.var_c3e38887ceebe99c = [];
        while (1) {
            var_7006c5c506086629 = getdvarint(@"hash_33a02069af06abbb", 0);
            if (var_7006c5c506086629) {
                setdevdvar(@"hash_33a02069af06abbb", 0);
                item = spawnscriptable("<unknown string>", level.players[0].origin, level.players[0].angles);
                item setscriptablepartstate("<unknown string>", "<unknown string>");
                item.usedcallback = &function_be64875fae5bd1ce;
                item.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
                item.var_ceb543956c7203e7 = &function_a1cbb02f01a33768;
                item.var_febe9aacdd2e47b2 = !getdvarint(@"hash_6ee9465e13d271e5", 0);
                level.var_c3e38887ceebe99c[level.var_c3e38887ceebe99c.size] = item;
            }
            waitframe();
        }
    #/
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ee
// Size: 0x150
function function_81caaaceb9608436() {
    /#
        level endon("<unknown string>");
        setdevdvar(@"hash_1795f8de9b946d21", "<unknown string>");
        while (1) {
            var_19e1cb1a142bd70a = getdvar(@"hash_1795f8de9b946d21", "<unknown string>");
            if (var_19e1cb1a142bd70a != "<unknown string>") {
                setdevdvar(@"hash_1795f8de9b946d21", "<unknown string>");
                if (level.var_c3e38887ceebe99c.size == 0) {
                    continue;
                }
                foreach (var_5793a0cf9d352c92 in level.var_c3e38887ceebe99c) {
                    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_19e1cb1a142bd70a);
                    weaponobj = undefined;
                    quantity = undefined;
                    if (namespace_cb965d2f71fefddc::isweaponpickup(var_19e1cb1a142bd70a)) {
                        weaponobj = namespace_cb965d2f71fefddc::getfullweaponobjfromscriptablename(var_19e1cb1a142bd70a);
                        quantity = weaponclipsize(weaponobj);
                    } else {
                        quantity = level.br_pickups.counts[var_19e1cb1a142bd70a];
                    }
                    if (!isdefined(lootid) || !isdefined(quantity)) {
                        continue;
                    }
                    namespace_92fc655e328c1a9f::function_6207d6f728cee51d(level.players, var_5793a0cf9d352c92, lootid, quantity, weaponobj, 1, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1545
// Size: 0x137
function function_55fc171c5983769f(var_23bb061a51e4a968) {
    /#
        level endon("<unknown string>");
        setdevdvar(@"hash_e6fe6e130f8e354b", 0);
        while (1) {
            shoulddraw = getdvarint(@"hash_e6fe6e130f8e354b", 0);
            if (shoulddraw) {
                foreach (var_5793a0cf9d352c92 in level.var_ced78996bbf1b2d3) {
                    draw_circle(var_5793a0cf9d352c92.origin + (0, 0, 20), 50, (0, 1, 0), 1, 0, 1);
                }
                foreach (var_5793a0cf9d352c92 in var_23bb061a51e4a968) {
                    draw_circle(var_5793a0cf9d352c92.origin, 50, (1, 0, 0), 1, 0, 1);
                }
            }
            waitframe();
        }
    #/
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1683
// Size: 0x89
function function_6ac81ebed556d7dd(var_23bb061a51e4a968) {
    /#
        level endon("<unknown string>");
        if (!namespace_4b0406965e556711::gameflag("<unknown string>")) {
            level namespace_4b0406965e556711::gameflagwait("<unknown string>");
        }
        foreach (var_5793a0cf9d352c92 in var_23bb061a51e4a968) {
            level thread namespace_8361bad7391de074::function_955e6c9750ee6b5e(level.players, var_5793a0cf9d352c92);
        }
    #/
}

// Namespace dead_drop/namespace_b66505f20cbf2570
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1713
// Size: 0x182
function function_625351669d6c9017() {
    /#
        level endon("<unknown string>");
        if (!namespace_4b0406965e556711::gameflag("<unknown string>")) {
            level namespace_4b0406965e556711::gameflagwait("<unknown string>");
        }
        setdevdvar(@"hash_a064eaf3659203b1", 0);
        while (1) {
            if (!isdefined(level.var_c3e38887ceebe99c) || level.var_c3e38887ceebe99c.size <= 0) {
                waitframe();
                continue;
            }
            var_9b627432c7609925 = getdvarint(@"hash_a064eaf3659203b1", 0);
            if (var_9b627432c7609925) {
                setdevdvar(@"hash_a064eaf3659203b1", 0);
                var_a386920ecc63c52d = undefined;
                foreach (player in level.players) {
                    if (isbot(player) && isalive(player)) {
                        var_a386920ecc63c52d = player;
                        break;
                    }
                }
                if (!isdefined(var_a386920ecc63c52d)) {
                    waitframe();
                    continue;
                }
                var_5793a0cf9d352c92 = level.var_c3e38887ceebe99c[0];
                if (!isdefined(var_5793a0cf9d352c92)) {
                    waitframe();
                    continue;
                }
                forward = anglestoforward(var_5793a0cf9d352c92.angles);
                var_a386920ecc63c52d setorigin(var_5793a0cf9d352c92.origin + forward * 50);
                waitframe();
                var_a386920ecc63c52d botlookatpoint(var_5793a0cf9d352c92.origin, 10);
                waitframe();
                var_a386920ecc63c52d botpressbutton("<unknown string>", 1);
            }
            waitframe();
        }
    #/
}

