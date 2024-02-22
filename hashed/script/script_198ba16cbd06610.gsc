// mwiii decomp prototype
#using script_247745a526421ba7;
#using script_43971bbeefd98f05;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_5640d32580c6bc7d;
#using script_4c770a9a4ad7659c;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\utility.gsc;
#using script_5def7af2a9f04234;

#namespace dead_drop;

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0x110
function function_476ba78d85b349ea() {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body_dead_drop", &function_cf1b1f86951a9209);
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    level.var_ced78996bbf1b2d3 = [];
    foreach (var_5793a0cf9d352c92 in getentitylessscriptablearray("scriptable_dmz_dead_drop", "classname")) {
        var_5793a0cf9d352c92 callback::add("on_cache_closed", &function_a1cbb02f01a33768);
        var_5793a0cf9d352c92 setscriptablepartstate("body_dead_drop", "closed_usable");
        var_5793a0cf9d352c92.var_6978a4b328fd33b3 = &function_2463f61a8c4d7772;
        var_5793a0cf9d352c92.var_febe9aacdd2e47b2 = !getdvarint(@"hash_6ee9465e13d271e5", 0);
        var_5793a0cf9d352c92.var_532eac3c428e5b9b = 1;
        level.var_ced78996bbf1b2d3[level.var_ced78996bbf1b2d3.size] = var_5793a0cf9d352c92;
    }
    /#
        thread function_dd5b2fd6714dfcc5();
        thread function_81caaaceb9608436();
    #/
    namespace_3c37cb17ade254d::flag_set("dead_drops_init");
}

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x8c
function function_2463f61a8c4d7772(container, player, lootid, quantity, itemtype, itemindex) {
    noextract = undefined;
    var_dfab44d4d8d10b36 = quantity;
    if (isdefined(itemtype) && itemtype == 10) {
        var_dfab44d4d8d10b36 = function_8e5978971b5dcd16(player, itemindex);
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

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32f
// Size: 0x32d
function function_a1cbb02f01a33768(params) {
    opener = params.opener;
    container = self;
    container setscriptablepartstate("body_dead_drop", "partially_closing_unusable");
    foreach (player in container.var_2bc73315bd31809c) {
        var_e1cf43f3ae9d77e7 = container.contents;
        var_bbac576aade31a1e = 0;
        foreach (index, item in var_e1cf43f3ae9d77e7) {
            if (!isdefined(item.lootid) || item.lootid == 0) {
                continue;
            }
            bundlename = function_fc925a153c7fd55c(item.lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            scriptablename = itembundle.scriptable;
            itemtype = itembundle.type;
            if (isdefined(itemtype) && !istrue(item.noextract)) {
                if (itemtype == "plunder") {
                    var_bbac576aade31a1e = var_bbac576aade31a1e + item.quantity;
                }
            }
        }
        weaponitem = undefined;
        var_98f7ce981bb1f93c = player getclientomnvar("loot_container_weapon");
        if (istrue(var_98f7ce981bb1f93c)) {
            weaponitem = spawnstruct();
            weaponitem.lootid = var_98f7ce981bb1f93c;
            weaponitem.quantity = 1;
            var_e1cf43f3ae9d77e7[var_e1cf43f3ae9d77e7.size] = weaponitem;
        }
        if (!isdefined(container.poi)) {
            container.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(container.origin, 0, 1);
        }
        foreach (index, item in container.contents) {
            if (item.lootid == 0 || item.quantity == 0) {
                continue;
            }
            bundlename = function_fc925a153c7fd55c(item.lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            scriptablename = itembundle.scriptable;
            itemtype = itembundle.type;
            if (!istrue(container.contents[index].noextract)) {
                container.contents[index].lootid = 0;
                container.contents[index].quantity = 0;
            }
        }
        var_a1435989fbd8395 = function_2c836ad05e5f634c("cash");
    }
}

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x663
// Size: 0x1c
function function_160a29300ce1e14(var_bbac576aade31a1e, player, var_95338f9d8305c0cb) {
    
}

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x686
// Size: 0xf2
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
                item callback::add("<unknown string>", &function_a1cbb02f01a33768);
                item.var_febe9aacdd2e47b2 = !getdvarint(@"hash_6ee9465e13d271e5", 0);
                level.var_c3e38887ceebe99c[level.var_c3e38887ceebe99c.size] = item;
            }
            waitframe();
        }
    #/
}

// Namespace dead_drop/namespace_a3da42c0149be2d4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77f
// Size: 0x136
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
                    itembundle = getscriptbundle("<unknown string>" + var_19e1cb1a142bd70a);
                    lootid = function_6d15e119c2779a93(itembundle);
                    weaponobj = undefined;
                    quantity = undefined;
                    quantity = 1;
                    if (!isdefined(lootid) || !isdefined(quantity)) {
                        continue;
                    }
                    function_4df3c8d739c4b460(level.players[0], var_5793a0cf9d352c92, lootid, quantity, weaponobj, 1, 1);
                }
            }
            waitframe();
        }
    #/
}

