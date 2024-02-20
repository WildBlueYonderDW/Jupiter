// mwiii decomp prototype
#using script_600b944a95c3a7bf;
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\scriptable.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\hud_message.gsc;
#using script_509a21c5f4cea6ae;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\flags.gsc;
#using script_744cad313ed0a87e;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using script_4c770a9a4ad7659c;
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_analytics.gsc;

#namespace br_lootcache;

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6d
// Size: 0x47
function brlootcache_init() {
    level.var_bd006676148e6c40 = [];
    level.var_a688dd9515c7def = [];
    level.var_344f2168e7b1bc8e = [];
    level.var_b00874d1374e4c38 = [];
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("body", &lootcacheused);
    /#
        thread function_8ca2f83c962d40d9();
    #/
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x106
function canspawnitemname(itemname, iscustomweapon) {
    if (istrue(iscustomweapon)) {
        itemname = namespace_e0ee43ef2dddadaa::getweaponrootname(itemname);
    }
    if (!isdefined(itemname)) {
        return 0;
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        if (isdefined(level.forbiddencachespawns) && isdefined(level.forbiddencachespawns[itemname])) {
            return 0;
        }
    }
    if (namespace_38b993c4618e76cd::function_9ca10c69808b00a5(itemname)) {
        return 0;
    }
    if (itemname == "brloot_respawn_token" && namespace_cb965d2f71fefddc::respawntokendisabled()) {
        return 0;
    }
    if (itemname == "brloot_gulag_token" && namespace_d3d40f75bb4e4c32::function_8b2396647673be50()) {
        return 0;
    }
    if ((itemname == "brloot_redeploy_token" || itemname == "brloot_gulag_token") && istrue(level.br_pickups.var_ec8acc2cb92ceaf7)) {
        return 0;
    }
    var_4ad7c03ec4fa687 = level.maxteamsize == 1 || istrue(level.brgametype.var_4ad7c03ec4fa687);
    if (itemname == "brloot_super_reinforcement_flare" && var_4ad7c03ec4fa687) {
        return 0;
    }
    if (itemname == "loot_multi_key_fortress") {
        return 0;
    }
    return 1;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc9
// Size: 0x2f1
function lootspawnitem(itemname, dropstruct, origin, angles, var_4eddedc3311ede0d, var_3f237137640bedce, var_3bbe1192172d43fd, var_77bd0639072486ac, var_cd2354197d18f1cd) {
    if (istrue(var_4eddedc3311ede0d)) {
        if (dropstruct.dropcount % 2 > 0) {
            yaw = 75;
        } else {
            yaw = 115;
        }
        if (isdefined(var_cd2354197d18f1cd)) {
            yaw = var_cd2354197d18f1cd;
            if (dropstruct.dropcount % 2 > 0) {
                yaw = yaw - 40;
            }
        }
        if (istrue(var_77bd0639072486ac)) {
            yaw = yaw + randomfloatrange(-1 * var_77bd0639072486ac, var_77bd0639072486ac);
        } else {
            yaw = yaw + randomfloatrange(-10, 10);
        }
        if (istrue(var_3bbe1192172d43fd)) {
            dist = 35 + dropstruct.dropcount / 2 * 25 + randomfloatrange(-1 * var_3bbe1192172d43fd, var_3bbe1192172d43fd);
        } else {
            dist = 35 + dropstruct.dropcount / 2 * 25 + randomfloatrange(-5, 5);
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, origin, angles, undefined, yaw, dist);
    } else {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, origin, angles);
    }
    var_eb545d149efbfd23 = undefined;
    var_37dda6c5e1dabefa = undefined;
    if (namespace_3bcd40a3005712ec::isvalidcustomweapon(itemname)) {
        if (namespace_3bcd40a3005712ec::function_4267b8888db52ea3(itemname)) {
            if (isdefined(level.var_58ffe6a7ac9f8fd4[itemname.basename])) {
                dropcount = namespace_3bcd40a3005712ec::br_getweaponstartingclipammo(itemname);
                var_eb545d149efbfd23 = level.var_58ffe6a7ac9f8fd4[itemname.basename];
            } else {
                dropcount = namespace_3bcd40a3005712ec::br_getweaponstartingclipammo(itemname);
            }
        } else {
            dropcount = namespace_3bcd40a3005712ec::br_getweaponstartingclipammo(itemname);
            if (isakimbo(itemname)) {
                var_eb545d149efbfd23 = dropcount;
            }
            if (itemname.hasalternate) {
                altweapon = itemname getaltweapon();
                var_37dda6c5e1dabefa = int(min(weaponclipsize(altweapon), dropcount));
            }
        }
        weaponname = getcompleteweaponname(itemname);
        pickupitem = namespace_cb965d2f71fefddc::spawnpickup(weaponname, var_cb4fad49263e20c4, dropcount, 1, itemname, undefined, var_eb545d149efbfd23, var_37dda6c5e1dabefa);
    } else {
        dropcount = level.br_pickups.counts[itemname];
        fullweaponobj = namespace_cb965d2f71fefddc::getfullweaponobjforscriptablepartname(itemname);
        if (isdefined(fullweaponobj)) {
            dropcount = namespace_3bcd40a3005712ec::br_getweaponstartingclipammo(fullweaponobj);
            if (isakimbo(fullweaponobj)) {
                var_eb545d149efbfd23 = dropcount;
            }
            if (fullweaponobj.hasalternate) {
                altweapon = fullweaponobj getaltweapon();
                var_37dda6c5e1dabefa = int(min(weaponclipsize(altweapon), dropcount));
            }
        }
        pickupitem = namespace_cb965d2f71fefddc::spawnpickup(itemname, var_cb4fad49263e20c4, dropcount, 1, undefined, undefined, var_eb545d149efbfd23, var_37dda6c5e1dabefa);
        var_a69fff5222862f26 = level.br_pickups.br_itemrarity[itemname];
    }
    if (var_3f237137640bedce) {
    }
    return pickupitem;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc2
// Size: 0x5f
function function_d683a60016231237(lootid, quantity, ref) {
    if (!isdefined(self.contents)) {
        self.contents = namespace_1b7e64f50cca9321::function_ec87b214cd429e96(getscriptablelootcachecontents(self));
    }
    self.contents = array_randomize(namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(self.contents, quantity, lootid, ref));
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1028
// Size: 0x71
function function_848e20cf1d6cab8f(contents, quantity, lootid, ref, var_a6f8d8115e0f1e79) {
    if (!isdefined(var_a6f8d8115e0f1e79)) {
        var_a6f8d8115e0f1e79 = contents.size;
    }
    contents[var_a6f8d8115e0f1e79] = [];
    contents[var_a6f8d8115e0f1e79]["quantity"] = int(quantity);
    contents[var_a6f8d8115e0f1e79]["lootID"] = lootid;
    if (isdefined(ref) && namespace_cb965d2f71fefddc::isweaponpickup(ref)) {
        contents[var_a6f8d8115e0f1e79]["ref"] = ref;
    }
    return contents;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a1
// Size: 0x17d
function function_ec87b214cd429e96(items, var_3d7259162c4253ea) {
    contents = [];
    if (isdefined(var_3d7259162c4253ea)) {
        contents = var_3d7259162c4253ea;
    }
    if (isdefined(items)) {
        var_48e9c0f948129a0c = contents.size;
        for (index = 0; index < items.size - var_48e9c0f948129a0c; index++) {
            item = items[index];
            lootid = function_fae5e1d3de32d3f7(item);
            quantity = 1;
            if (isdefined(level.br_pickups.counts[item])) {
                quantity = level.br_pickups.counts[item];
            }
            if (!isdefined(lootid)) {
                if (item == "brloot_armor_plate") {
                    lootid = function_a50b607d2500dda5("armor_plate");
                } else if (namespace_cb965d2f71fefddc::function_4294e9b331377c31(item)) {
                    lootid = function_a50b607d2500dda5("armor_satchel");
                } else if (namespace_cb965d2f71fefddc::isplunder(item)) {
                    lootid = function_a50b607d2500dda5("cash");
                    quantity = level.br_pickups.counts[item];
                } else if (namespace_d3d40f75bb4e4c32::isammo(item) || item == "brloot_self_revive") {
                    lootid = function_a50b607d2500dda5(item);
                    quantity = level.br_pickups.counts[item];
                }
            }
            contents = function_848e20cf1d6cab8f(contents, quantity, lootid, item);
            /#
                assertex(isdefined(lootid), "No loot ID found for: " + item);
            #/
        }
        contents = array_randomize(contents);
    }
    return contents;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1226
// Size: 0x122
function function_ec8712f07ed15e07(player, items, var_3d7259162c4253ea, container) {
    contents = function_ec87b214cd429e96(items, var_3d7259162c4253ea);
    if (isdefined(container.var_e0aea15595ecf1a9)) {
        foreach (guid, var_d89286db53d9fe8a in container.var_e0aea15595ecf1a9) {
            foreach (item in var_d89286db53d9fe8a) {
                contents = function_848e20cf1d6cab8f(contents, item["quantity"], item["lootID"], item["ref"]);
            }
            container.var_556db0b72a96514e[guid].contents = contents;
            container.var_e0aea15595ecf1a9[guid] = undefined;
        }
    }
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134f
// Size: 0x94
function function_9065b3738ac07df0(items, cache, player, contents) {
    if (namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, cache)) {
        function_ec8712f07ed15e07(player, items, contents, cache);
    } else {
        cache.contents = function_ec87b214cd429e96(items, contents);
    }
    var_400b0f96946b53 = namespace_3f0ea7483345a2c0::function_59b9c8081b873a10(player, cache);
    if (isdefined(var_400b0f96946b53.contents)) {
        cache.var_9632642b41dad704 = var_400b0f96946b53.contents;
    }
    namespace_3f0ea7483345a2c0::function_30f5ea60517f9e06(player, cache);
    return [];
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13eb
// Size: 0x72e
function lootspawnitemlist(dropstruct, items, var_a6293f3144240b99, player, var_3bbe1192172d43fd, var_77bd0639072486ac, var_60ec3549226ce8d) {
    var_e05413a53b5d9167 = [];
    var_17b34cf2dd66912f = 0;
    if (isdefined(items) && isdefined(items[0]) && isarray(items[0])) {
        newitems = [];
        foreach (item in items) {
            if (isdefined(item["lootID"])) {
                scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(item["lootID"]);
                newitems[newitems.size] = scriptable;
            }
        }
        items = newitems;
    }
    if (isdefined(self) && isdefined(self.type) && namespace_3c37cb17ade254d::issharedfuncdefined(self.type, "spawnLoot")) {
        var_eb061c2e39f5d6f7 = namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(self.type, "spawnLoot", player, dropstruct);
        if (isdefined(var_eb061c2e39f5d6f7)) {
            foreach (var_db009605fe48bc5e in var_eb061c2e39f5d6f7) {
                var_e05413a53b5d9167[var_e05413a53b5d9167.size] = var_db009605fe48bc5e;
            }
        }
    }
    var_4472b62c1fa150e5 = 0;
    var_7defd476665a5c0 = 0;
    var_1a51b8dd1e3a0296 = 0;
    var_7f6dc80424e55d7b = function_e1a934067bb5bc35(self);
    var_57acfdc40b2fba7 = function_cb377a5e11eef62c(self);
    var_96fe9d369e45b9de = var_57acfdc40b2fba7[1];
    var_822c11116211822f = var_57acfdc40b2fba7[0];
    var_96fe9d369e45b9de = ter_op(isdefined(var_96fe9d369e45b9de), var_96fe9d369e45b9de, self.origin);
    var_e88269f1e541967 = ter_op(isdefined(var_60ec3549226ce8d), var_60ec3549226ce8d, self.angles);
    foreach (itemname in items) {
        iscustomweapon = namespace_3bcd40a3005712ec::isvalidcustomweapon(itemname);
        if (canspawnitemname(itemname, iscustomweapon)) {
            if (var_7f6dc80424e55d7b && namespace_cb965d2f71fefddc::isplunder(itemname)) {
                amount = level.br_pickups.counts[itemname];
                if (isdefined(amount)) {
                    player namespace_c6ccccd95254983f::playerplunderpickup(amount, undefined, undefined, 1);
                    player namespace_c6ccccd95254983f::function_5a2284274d70f7d(0, amount);
                    var_1a51b8dd1e3a0296 = var_1a51b8dd1e3a0296 + amount;
                }
            } else {
                var_a69fff5222862f26 = undefined;
                if (!iscustomweapon) {
                    var_a69fff5222862f26 = level.br_pickups.br_itemrarity[itemname];
                }
                if (isdefined(var_a69fff5222862f26) && var_a69fff5222862f26 == 4 && var_17b34cf2dd66912f == 0) {
                    if (isdefined(var_3bbe1192172d43fd) || isdefined(var_77bd0639072486ac)) {
                        if (!isdefined(var_3bbe1192172d43fd)) {
                            var_3bbe1192172d43fd = 5;
                        }
                        if (!isdefined(var_77bd0639072486ac)) {
                            var_77bd0639072486ac = 10;
                        }
                        var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, var_96fe9d369e45b9de, var_e88269f1e541967, var_a6293f3144240b99, 1, var_3bbe1192172d43fd, var_77bd0639072486ac, var_822c11116211822f);
                        self.itemsdropped++;
                        var_17b34cf2dd66912f = 1;
                    } else {
                        var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, var_96fe9d369e45b9de, var_e88269f1e541967, var_a6293f3144240b99, 1, undefined, undefined, var_822c11116211822f);
                        self.itemsdropped++;
                        var_17b34cf2dd66912f = 1;
                    }
                } else if (isdefined(var_3bbe1192172d43fd) || isdefined(var_77bd0639072486ac)) {
                    if (!isdefined(var_3bbe1192172d43fd)) {
                        var_3bbe1192172d43fd = 5;
                    }
                    if (!isdefined(var_77bd0639072486ac)) {
                        var_77bd0639072486ac = 10;
                    }
                    var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, var_96fe9d369e45b9de, var_e88269f1e541967, var_a6293f3144240b99, 0, var_3bbe1192172d43fd, var_77bd0639072486ac, var_822c11116211822f);
                    self.itemsdropped++;
                } else {
                    var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, var_96fe9d369e45b9de, var_e88269f1e541967, var_a6293f3144240b99, 0, undefined, undefined, var_822c11116211822f);
                    self.itemsdropped++;
                }
                if (iscustomweapon) {
                    var_811abfdb6c33f17f = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(itemname);
                    if (isdefined(var_811abfdb6c33f17f)) {
                        var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(var_811abfdb6c33f17f, dropstruct, var_96fe9d369e45b9de, var_e88269f1e541967, var_a6293f3144240b99, 0, undefined, undefined, var_822c11116211822f);
                        self.itemsdropped++;
                    }
                    var_7defd476665a5c0 = 1;
                }
            }
        }
    }
    if (var_1a51b8dd1e3a0296 > 0 && istrue(level.var_9dd3ce936c1dec1d)) {
        plunder = spawnstruct();
        plunder.origin = player.origin;
        plunder.count = var_1a51b8dd1e3a0296;
        plunder.scriptablename = function_b88cfb4893ceedac("cash");
        if (isdefined(plunder.scriptablename)) {
            player namespace_cb965d2f71fefddc::function_efdddf60c5db058c(plunder, 0);
        }
    }
    if (namespace_1b7e64f50cca9321::function_8c57777a730ca632(self) && isdefined(self.owner)) {
        foreach (item in var_e05413a53b5d9167) {
            self.owner namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(item);
        }
        if (isdefined(self.var_4f6cde716e0c3d7) && isdefined(self.var_6fb67c8525b1d79e)) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, var_e88269f1e541967);
            var_c9614496b843196e = weaponspawn(self.var_6fb67c8525b1d79e, self.owner, var_cb4fad49263e20c4, 0, 1);
            if (isdefined(var_c9614496b843196e)) {
                ammotype = br_ammo_type_for_weapon(self.var_6fb67c8525b1d79e);
                var_c9614496b843196e.ammotype = ammotype;
                namespace_cb965d2f71fefddc::loot_setitemcount(var_c9614496b843196e, self.var_3ef503345dc57957, self.var_ad7897ecdbcb63, self.var_86b32aff94b5714e);
            }
            self.owner namespace_cb965d2f71fefddc::function_2f4e0022c686dbe6(var_c9614496b843196e);
            self.var_4f6cde716e0c3d7 = undefined;
            self.var_6fb67c8525b1d79e = undefined;
        }
        self.contents = [];
    }
    if (istrue(var_a6293f3144240b99) && isdefined(player)) {
        if (var_4472b62c1fa150e5) {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_f396d39fee1a8054");
            player playsoundtoplayer("uin_loot_container_open_epic", player);
        } else if (var_7defd476665a5c0) {
            foreach (teammember in namespace_54d20dd0dd79277f::getteamdata(player.team, "players")) {
                if (isalive(teammember) && distance2d(teammember.origin, player.origin) <= 1000) {
                    teammember thread namespace_48a08c5037514e04::doScoreEvent(#"hash_c01d7d8b6119d321");
                }
            }
            player playsoundtoplayer("uin_loot_container_open_epic", player);
        } else {
            player thread namespace_48a08c5037514e04::doScoreEvent(#"br_cacheOpen");
            player playsoundtoplayer("uin_loot_container_open_common", player);
        }
    }
    return var_e05413a53b5d9167;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b21
// Size: 0x53
function lootcachespawncontents(items, var_7a824904d97d59d7, player, contents) {
    if (var_7a824904d97d59d7) {
        return function_9065b3738ac07df0(items, self, player, contents);
    } else {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        return lootspawnitemlist(dropstruct, items, 1, player);
    }
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b7b
// Size: 0x65
function function_c56e597e3aa81261(instance, player) {
    if (!isdefined(instance) || !isdefined(player) || !isalive(player)) {
        return;
    }
    if (!instance getscriptableparthasstate("body", "closed_usable")) {
        return;
    }
    instance setscriptablepartstate("body", "closed_usable");
    lootcacheused(instance, "body", "closed_usable", player, 0, undefined);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be7
// Size: 0xbd7
function lootcacheused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, var_9f39a1d0187cefb8) {
    if (istrue(player namespace_71073fa38f11492::runbrgametypefunc("playerSkipLootPickup", instance))) {
        return;
    }
    var_64c59c08b4538d72 = namespace_3f0ea7483345a2c0::function_55b384ecb923003e() && !function_e91a96d043315490(instance) && namespace_3f0ea7483345a2c0::function_c929a8ad95b46fda(instance);
    if (istrue(player.isjuggernaut) && var_64c59c08b4538d72) {
        player namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.br_pickupdenyjuggernaut);
        return;
    }
    if (!istrue(var_9f39a1d0187cefb8)) {
        /#
            assert(part == "body");
        #/
    }
    if ((state == "closed_usable" || state == "closed_usable_no_collision") && !isdefined(instance.entity)) {
        if (namespace_e6e035262e5f01a2::function_3392f98172a332d7() && !isbot(player)) {
            player thread namespace_e6e035262e5f01a2::function_a23861c0f0635cf4(instance.type);
        }
        if (isdefined(instance.var_534e0cf170a981b7)) {
            result = [[ instance.var_534e0cf170a981b7 ]](instance, player);
            if (isdefined(result) && result == 0) {
                return;
            }
        }
        if (!namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance)) {
            if (var_64c59c08b4538d72 && instance getscriptableparthasstate(part, "partially_opening_unusable")) {
                instance setscriptablepartstate(part, "partially_opening_unusable");
            } else if (instance getscriptableparthasstate(part, "closed_to_fully_open_unusable")) {
                instance setscriptablepartstate(part, "closed_to_fully_open_unusable");
            } else if (instance getscriptableparthasstate(part, "fully_opening_unusable")) {
                instance setscriptablepartstate(part, "fully_opening_unusable");
            }
        }
        instance.itemsdropped = 0;
        var_e05413a53b5d9167 = [];
        items = undefined;
        if (isdefined(instance.type) && instance.type == "br_loot_cache_personal_supply") {
            var_2b751927c89f66b5 = [0:"custom1", 1:"custom2", 2:"custom3", 3:"custom4", 4:"custom5", 5:"custom6", 6:"custom7", 7:"custom8", 8:"custom9", 9:"custom10"];
            var_67765e10502fcd44 = player getplayerdata(level.loadoutsgroup, "customizationFavorites", "favoriteLoadoutIndex");
            if (isdefined(var_67765e10502fcd44)) {
                var_67765e10502fcd44 = var_2b751927c89f66b5[var_67765e10502fcd44];
                var_990bf19e67ec2d89 = player thread namespace_d20f8ef223912e12::function_4043e420432f59f0(var_67765e10502fcd44);
                var_dd8a980f1d3213e5 = player function_75e83820a58a07c9(var_990bf19e67ec2d89);
                items = [];
                foreach (weapon in var_dd8a980f1d3213e5) {
                    items[items.size] = weapon;
                }
            }
        } else if (namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance) && instance.var_556db0b72a96514e[player.guid].contents.size > 0) {
            items = namespace_3f0ea7483345a2c0::function_3c85cbbfd2d2a3da(player, instance);
        } else if (isdefined(instance.contents) && !function_ae639176fec476a6(instance)) {
            items = instance.contents;
        } else {
            items = getscriptablelootcachecontents(instance);
            if (!isdefined(items)) {
                /#
                    assertmsg("lootCacheUsed failed to get items from the scriptable loot cache.");
                #/
                return;
            }
            if (isdefined(instance.var_2e1a29fb688816d4)) {
                items[items.size] = instance.var_2e1a29fb688816d4;
            }
            instance.var_2e1a29fb688816d4 = undefined;
            items = function_728bdc627d7df6c2(items, instance);
            if (isdefined(instance.type) && namespace_3c37cb17ade254d::issharedfuncdefined(instance.type, "opened")) {
                items = instance namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2(instance.type, "opened", items, player);
            }
            if (namespace_71073fa38f11492::isbrgametypefuncdefined("lootCacheAdjustItems")) {
                items = namespace_71073fa38f11492::runbrgametypefunc("lootCacheAdjustItems", items, instance);
            }
            if (isdefined(level.var_91104c01620d26b0)) {
                foreach (var_412ede7964be742d in level.var_91104c01620d26b0) {
                    items = [[ var_412ede7964be742d ]](items, instance);
                }
            }
            /#
                items = function_6975415e57cd5a29(items, player);
            #/
            if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_br_extra_killstreak_chance")) {
                items = lootcontentsadjustkillchain(items, player);
            }
            brgametype = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
            if (getdvarint(@"hash_f925d53a2a478522", 1) && (brgametype == "plunder" || brgametype == "risk")) {
                if (namespace_4b0406965e556711::gameflag("placement_updates_allowed")) {
                    placement = game["teamPlacements"][player.team];
                    if (!isdefined(level.var_153f283bcbffa477)) {
                        namespace_54d20dd0dd79277f::calculatenumteamswithplayers();
                    }
                    var_777fc6d644bb8864 = 100 - 100 * placement / level.var_153f283bcbffa477;
                    if (isdefined(level.bottompercentagetoadjusteconomy) && var_777fc6d644bb8864 < level.bottompercentagetoadjusteconomy) {
                        items = lootcontentsadjusteconomy_bottomtier(instance, items);
                    } else if (isdefined(level.toppercentagetoadjusteconomy) && var_777fc6d644bb8864 > level.toppercentagetoadjusteconomy) {
                        items = lootcontentsadjusteconomy_toptier(instance, items);
                    }
                }
            }
            if (isdefined(level.maxaccesscardspawns_red)) {
                items = lootcontentsadjust_accesscardsred(items);
            }
            if (namespace_3c37cb17ade254d::issharedfuncdefined("br_lootcache", "adjustContents")) {
                items = [[ namespace_3c37cb17ade254d::getsharedfunc("br_lootcache", "adjustContents") ]](items, player, state);
            }
        }
        if (function_6759ff16e552aa94(instance) || function_8c57777a730ca632(instance)) {
            player playsoundtoplayer("open_backpack", player);
        }
        if (!isdefined(instance.var_46a3a8565ac0c17c)) {
            instance.var_46a3a8565ac0c17c = 3;
        }
        activeSupplySweeps = level.teamdata[player.team]["activeSupplySweeps"];
        if (isdefined(activeSupplySweeps)) {
            foreach (streakinfo in activeSupplySweeps) {
                if (isdefined(streakinfo) && streakinfo.owner != player) {
                    streakinfo.owner thread namespace_48a08c5037514e04::giveunifiedpoints("br_supply_sweep_assist", undefined, undefined, undefined, undefined, undefined, streakinfo);
                }
            }
        }
        var_3d7259162c4253ea = instance.contents;
        if (namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance)) {
            var_3d7259162c4253ea = namespace_3f0ea7483345a2c0::function_3c85cbbfd2d2a3da(player, instance);
        }
        var_e05413a53b5d9167 = instance lootcachespawncontents(items, var_64c59c08b4538d72, player, var_3d7259162c4253ea);
        instance.player = player;
        instance opencrate(items);
        var_2b48101ca8ad8249 = undefined;
        switch (instance.type) {
        case #"hash_417c605750c7baa5":
            var_2b48101ca8ad8249 = "cache";
            break;
        case #"hash_19ba8d41970911ad":
        case #"hash_1a4740585c33b169":
        case #"hash_ca40e4f432250696":
            var_2b48101ca8ad8249 = "cache_legendary";
            break;
        case #"hash_8944097b14faec32":
            var_2b48101ca8ad8249 = "cache_scavenger";
            break;
        case #"hash_5bbda41f2e59fbef":
            var_2b48101ca8ad8249 = "cache_secretstash";
            break;
        case #"hash_4ca1dc2e1b0de0d3":
            var_2b48101ca8ad8249 = "reusable_cache";
            instance thread function_bd5cc49be99997bd(part);
            instance.var_ab01afae3ce374e2 = player;
            break;
        case #"hash_bc13d03dc3f6d6e8":
            var_2b48101ca8ad8249 = "cache_personal_supply";
            break;
        case #"hash_9c5f01407ae504fc":
            namespace_bd614c3c2275579a::function_ec5e700fa41093a4(instance.fortress, instance);
            break;
        case #"hash_4654cfd269b6fc02":
            namespace_bd614c3c2275579a::function_ec5e700fa41093a4(instance.fortress, instance);
            break;
        default:
            if (namespace_71073fa38f11492::isbrgametypefuncdefined("getGametypeCacheType")) {
                items = namespace_71073fa38f11492::runbrgametypefunc("getGametypeCacheType", instance, part);
            }
            break;
        }
        if (isdefined(var_2b48101ca8ad8249)) {
            foreach (ent in var_e05413a53b5d9167) {
                ent.lootsource = var_2b48101ca8ad8249;
            }
            namespace_c6ccccd95254983f::modify_plunder_itemsinworld("br_loot_cache", -1);
            if (!isdefined(player.lootcachesopened)) {
                player.lootcachesopened = 1;
            } else {
                player.lootcachesopened++;
            }
            if (namespace_cd0b2d039510b38d::getsubgametype() == "risk" || namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
            }
            level notify("lootcache_opened_kill_callout" + instance.origin);
            level notify("open_loot_box_" + player.team, player);
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType() && isdefined(level.var_41f4bc9ee8c7c9c6)) {
            foreach (contract in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
                if (isdefined(contract.funcs["onCacheLooted"])) {
                    foreach (task in level.var_41f4bc9ee8c7c9c6.var_8e0f287a7b13da80) {
                        if (contract.ref == task.type.ref) {
                            task [[ contract.funcs["onCacheLooted"] ]](player, instance.var_46a3a8565ac0c17c);
                        }
                    }
                }
            }
        }
        player namespace_aad14af462a74d08::function_da9003df08944b01(instance);
        namespace_8361bad7391de074::function_68d841f5bc2dd2b6(player, instance);
    } else if (var_64c59c08b4538d72 && (isdefined(instance.contents) || namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance)) && state == "partially_open_usable") {
        if (!namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance)) {
            if (instance getscriptableparthasstate(part, "partially_reopen_in_use_unusable")) {
                instance setscriptablepartstate(part, "partially_reopen_in_use_unusable");
            } else if (instance getscriptableparthasstate(part, "partially_open_in_use_unusable")) {
                instance setscriptablepartstate(part, "partially_open_in_use_unusable");
            }
        }
        var_3d7259162c4253ea = instance.contents;
        if (namespace_3f0ea7483345a2c0::function_e3081772bbf7a51c(player, instance)) {
            var_3d7259162c4253ea = namespace_3f0ea7483345a2c0::function_3c85cbbfd2d2a3da(player, instance);
        }
        instance lootcachespawncontents(undefined, var_64c59c08b4538d72, player, var_3d7259162c4253ea);
    }
    var_e384a29fa99c895c = spawnstruct();
    var_e384a29fa99c895c.player = player;
    var_e384a29fa99c895c.instance = instance;
    var_e384a29fa99c895c.var_e05413a53b5d9167 = isdefined(var_e05413a53b5d9167) ? var_e05413a53b5d9167 : undefined;
    namespace_7f0bcee5d45a1dea::callback("cache_opened", var_e384a29fa99c895c);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27c5
// Size: 0x2d
function function_ae639176fec476a6(instance) {
    return instance.type == "br_reusable_loot_cache" && istrue(instance.var_1208f086f2985c55);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27fa
// Size: 0x5f
function function_e1a934067bb5bc35(container) {
    if (!istrue(level.var_e8fc7c00fd85a565)) {
        return 0;
    }
    if (isdefined(container) && isdefined(container.type)) {
        switch (container.type) {
        case #"hash_93553b29704c0d3":
        case #"hash_2808ce3c4558142d":
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2861
// Size: 0xfe
function function_bd5cc49be99997bd(part) {
    level endon("game_ended");
    self endon("death");
    self endon("closed");
    var_eb937f6d33835604 = getdvarint(@"hash_fd0c403fee9dc217", 90);
    var_18bba7f7b97e4f0c = var_eb937f6d33835604 / 3;
    self.var_1208f086f2985c55 = 1;
    wait(var_18bba7f7b97e4f0c);
    if (!isdefined(self)) {
        return;
    }
    self setscriptablepartstate(part, "fully_open_unusable_fx2");
    wait(var_18bba7f7b97e4f0c);
    if (!isdefined(self)) {
        return;
    }
    self setscriptablepartstate(part, "fully_open_unusable_fx3");
    wait(var_18bba7f7b97e4f0c);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.var_ab01afae3ce374e2) && isdefined(self.var_ab01afae3ce374e2.var_2fa5b49969def47) && self.var_ab01afae3ce374e2.var_2fa5b49969def47 == self) {
        self.var_ab01afae3ce374e2 setclientomnvar("loot_container_open", 0);
    }
    function_27f0aed354031248();
    removecrate();
    self setscriptablepartstate(part, "closing");
    self notify("closed");
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2966
// Size: 0x21
function function_e91a96d043315490(instance) {
    return namespace_1b7e64f50cca9321::function_8c57777a730ca632(instance) && istrue(level.var_4bc57ebffee174b);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298f
// Size: 0x33
function function_6759ff16e552aa94(container) {
    return isdefined(container) && isdefined(container.type) && container.type == "brloot_backpack";
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ca
// Size: 0x5d
function function_8c57777a730ca632(container) {
    return isdefined(container) && isdefined(container.type) && (container.type == "brloot_backpack_player_small" || container.type == "brloot_backpack_player_medium" || container.type == "brloot_backpack_player_large");
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2f
// Size: 0x1b2
function function_163d360c111caa16(contents, var_8bd50c7e994c7434, var_42be80ba01341305) {
    var_fec4228317afe4ff = 0;
    var_311064d4e2c10b88 = 0;
    foreach (item in contents) {
        if (namespace_cb965d2f71fefddc::function_34af0f77c1668dba(item["lootID"])) {
            var_fec4228317afe4ff = var_fec4228317afe4ff + item["quantity"];
            var_311064d4e2c10b88++;
        }
    }
    var_745bbde1234bc1e1 = 0;
    if (var_311064d4e2c10b88) {
        var_7f7dff1f5fd7ef9d = var_8bd50c7e994c7434 - var_fec4228317afe4ff;
        var_c1d5034790909c2e = 5 * int(var_7f7dff1f5fd7ef9d / var_311064d4e2c10b88 / 5);
        foreach (i, item in contents) {
            if (namespace_cb965d2f71fefddc::function_34af0f77c1668dba(item["lootID"]) && item["quantity"] < var_42be80ba01341305) {
                var_bbe29c12a0cbbb11 = max(item["quantity"] + var_c1d5034790909c2e - var_42be80ba01341305, 0);
                contents[i]["quantity"] = int(min(item["quantity"] + var_c1d5034790909c2e, var_42be80ba01341305));
                var_745bbde1234bc1e1 = var_745bbde1234bc1e1 + var_bbe29c12a0cbbb11;
            }
        }
    } else {
        var_745bbde1234bc1e1 = var_8bd50c7e994c7434;
    }
    while (var_745bbde1234bc1e1 > 0) {
        value = min(var_745bbde1234bc1e1, var_42be80ba01341305);
        contents = namespace_1b7e64f50cca9321::function_848e20cf1d6cab8f(contents, value, 8395);
        var_745bbde1234bc1e1 = var_745bbde1234bc1e1 - value;
    }
    return array_randomize(contents);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2be9
// Size: 0xe0
function function_728bdc627d7df6c2(items, instance) {
    if (instance.type != "br_loot_cache_lege") {
        return items;
    }
    ammotype = "brloot_ammo_762";
    foreach (item in items) {
        if (isdefined(level.br_lootiteminfo[item]) && isdefined(level.br_lootiteminfo[item].fullweaponobj) && namespace_cb965d2f71fefddc::isweaponpickup(item)) {
            ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(level.br_lootiteminfo[item].fullweaponobj);
            break;
        }
    }
    items[items.size] = ammotype;
    return array_randomize(items);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd1
// Size: 0xc7
function lootcontentsadjusteconomy_bottomtier(instance, items) {
    var_b059adaf8e5750f5 = [];
    foreach (item in items) {
        if (issubstr(item, "brloot_plunder")) {
            if (instance.type == "br_loot_cache_lege") {
                if (item != "brloot_plunder_cash_legendary_1" && namespace_3c37cb17ade254d::cointoss()) {
                    item = "brloot_plunder_cash_legendary_1";
                }
            } else if (item != "brloot_plunder_cash_epic_2" && namespace_3c37cb17ade254d::cointoss()) {
                item = "brloot_plunder_cash_epic_2";
            }
        }
        var_b059adaf8e5750f5[var_b059adaf8e5750f5.size] = item;
    }
    return var_b059adaf8e5750f5;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da0
// Size: 0xdd
function lootcontentsadjusteconomy_toptier(instance, items) {
    var_b059adaf8e5750f5 = [];
    foreach (item in items) {
        if (issubstr(item, "brloot_plunder")) {
            if (instance.type == "br_loot_cache_lege") {
                if ((item == "brloot_plunder_cash_epic_2" || item == "brloot_plunder_cash_legendary_1") && namespace_3c37cb17ade254d::cointoss()) {
                    item = "brloot_plunder_cash_epic_1";
                }
            } else if ((item == "brloot_plunder_cash_epic_2" || item == "brloot_plunder_cash_epic_1") && namespace_3c37cb17ade254d::cointoss()) {
                item = "brloot_plunder_cash_rare_2";
            }
        }
        var_b059adaf8e5750f5[var_b059adaf8e5750f5.size] = item;
    }
    return var_b059adaf8e5750f5;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e85
// Size: 0x97
function lootcontentsadjust_accesscardsred(items) {
    var_b059adaf8e5750f5 = [];
    foreach (item in items) {
        if (item != "brloot_access_card_red") {
            var_b059adaf8e5750f5[var_b059adaf8e5750f5.size] = item;
        } else if (level.maxaccesscardspawns_red > level.accesscardsspawned_red) {
            var_b059adaf8e5750f5[var_b059adaf8e5750f5.size] = item;
            level.accesscardsspawned_red++;
        }
    }
    return var_b059adaf8e5750f5;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f24
// Size: 0x162
function chooseandspawnitems(dropstruct, var_426ab5c68504f990, var_2860fa0f2247ccf0, var_e31187607ff31da2, var_d6379f1654c3dca3, angleoffset, originoffset) {
    var_e05413a53b5d9167 = [];
    var_17b34cf2dd66912f = 0;
    if (!isdefined(var_e31187607ff31da2)) {
        var_e31187607ff31da2 = "";
    }
    if (!isdefined(var_426ab5c68504f990)) {
        var_426ab5c68504f990 = 0;
    }
    var_6314e68d57b3349b = "mp/loot_set_cache_contents_base.csv";
    if (isdefined(var_d6379f1654c3dca3)) {
        var_6314e68d57b3349b = var_d6379f1654c3dca3;
    }
    for (var_ec877e0d3a90bcd3 = 0; var_ec877e0d3a90bcd3 < var_2860fa0f2247ccf0; var_ec877e0d3a90bcd3++) {
        itemname = pickscriptablelootitem(var_e31187607ff31da2, var_426ab5c68504f990, 0, var_6314e68d57b3349b);
        if (canspawnitemname(itemname)) {
            angles = self.angles;
            if (isdefined(angleoffset)) {
                angles = angles + angleoffset;
            }
            origin = self.origin;
            if (isdefined(originoffset)) {
                origin = origin + originoffset;
            }
            var_a69fff5222862f26 = level.br_pickups.br_itemrarity[itemname];
            if (isdefined(var_a69fff5222862f26) && var_a69fff5222862f26 == 4 && var_17b34cf2dd66912f == 0) {
                var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, origin, angles, undefined, 1);
                var_17b34cf2dd66912f = 1;
            } else {
                var_e05413a53b5d9167[var_e05413a53b5d9167.size] = lootspawnitem(itemname, dropstruct, origin, angles, undefined, 0);
            }
        }
    }
    return var_e05413a53b5d9167;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x308e
// Size: 0x138
function lootcontentsadjustkillchain(items, player) {
    if (!isdefined(player.brkillchainchance)) {
        player.brkillchainchance = 10;
    }
    var_8dd5fa3fd9854f26 = 0;
    foreach (item in items) {
        if (issubstr(item, "killstreak")) {
            var_8dd5fa3fd9854f26 = 1;
            break;
        }
    }
    if (!var_8dd5fa3fd9854f26) {
        var_281158b82d0291ba = player.killcountthislife * 0;
        if (randomint(100) < player.brkillchainchance + var_281158b82d0291ba) {
            var_d45c83148ef4cf67 = [0:"brloot_killstreak_clusterstrike", 1:"brloot_killstreak_precision_airstrike", 2:"brloot_killstreak_uav", 3:"brloot_killstreak_shieldturret"];
            items[items.size] = random(var_d45c83148ef4cf67);
            player.brkillchainchance = 10;
        } else {
            player.brkillchainchance = player.brkillchainchance + var_281158b82d0291ba + 15;
        }
    }
    return items;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ce
// Size: 0x40
function function_75e83820a58a07c9(var_990bf19e67ec2d89) {
    level endon("game_ended");
    weapons = [];
    weapons[weapons.size] = var_990bf19e67ec2d89.loadoutprimaryobject;
    weapons[weapons.size] = var_990bf19e67ec2d89.loadoutsecondaryobject;
    return weapons;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3216
// Size: 0x92
function function_a76b46f057488cc0(instance, team, var_57838bb4fae836f8, var_583832b5ec35dfbc) {
    var_5332cda4054641da = namespace_a38a2e1fe7519183::function_e860c1be7ff11f5b(team, var_57838bb4fae836f8);
    var_2bd6f23f3fe9d91e = var_5332cda4054641da * var_583832b5ec35dfbc;
    items = getscriptablelootcachecontents(instance);
    var_401049e104d6479c = array_randomize(getscriptablelootcachecontents(instance));
    for (i = 0; i < var_2bd6f23f3fe9d91e; i++) {
        items[items.size] = var_401049e104d6479c[i];
    }
    return items;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32b0
// Size: 0x63
function function_3acd6ff5bda75039(items) {
    foreach (item in items) {
        if (issubstr(item, "brloot_plunder")) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x331b
// Size: 0x6a
function function_6975415e57cd5a29(items, player) {
    /#
        var_a1093166de09e6b8 = getdvar(@"hash_4b9f1b5e62c2ac88", "custom3");
        var_83a29250079cfc9e = getdvarfloat(@"hash_19a50cd3f012388e", 0);
        if (var_83a29250079cfc9e > randomfloat(1)) {
            items[items.size] = var_a1093166de09e6b8;
        }
        return items;
    #/
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x338c
// Size: 0xb6
function spawnlootcache(origin, angles, type) {
    /#
        switch (type) {
        case 2:
            scriptable = spawnscriptable("custom4", origin, angles);
            break;
        case 3:
            scriptable = spawnscriptable("open_backpack", origin, angles);
            break;
        case 4:
            scriptable = spawnscriptable("fully_open_unusable_fx2", origin, angles);
            break;
        default:
            scriptable = spawnscriptable("<unknown string>", origin, angles);
            break;
        }
        scriptable setscriptablepartstate("<unknown string>", "<unknown string>");
    #/
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3449
// Size: 0x125
function function_8ca2f83c962d40d9() {
    /#
        while (1) {
            waitframe();
            if (getdvarint(@"hash_82b5f4eccb13d4d2", 0)) {
                caches = [];
                var_ea156f5f477a8792 = getlootspawnpointcount();
                for (i = 0; i < var_ea156f5f477a8792; i++) {
                    loot = getlootspawnpoint(i);
                    if (loot.type == 1) {
                        playerdist = distance2dsquared(level.players[0].origin, loot.origin);
                        if (playerdist <= 1e+08) {
                            caches[caches.size] = loot;
                        }
                    }
                }
                foreach (cache in caches) {
                    sphere(cache.origin, 25, (1, 0, 0), 0, 1);
                }
            }
        }
    #/
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3575
// Size: 0x48c
function function_cb377a5e11eef62c(container) {
    if (!getdvarint(@"hash_c38245858b3dcc0d", 1)) {
        return [0:undefined, 1:undefined];
    }
    if (!isdefined(container.type)) {
        return [0:undefined, 1:undefined];
    }
    forward = anglestoforward(container.angles);
    left = anglestoright(container.angles) * -1;
    up = anglestoup(container.angles);
    switch (container.type) {
    case #"hash_f5264031983561d3":
    case #"hash_f526413198356366":
        return [0:undefined, 1:container.origin + left * getdvarfloat(@"hash_90ce55a815605004", 16) + up * 30];
    case #"hash_1cb302e16a34b4dd":
        return [0:undefined, 1:container.origin + forward * getdvarfloat(@"hash_90ce55a815605004", 16)];
    case #"hash_15ffdff5c5e4cca2":
    case #"hash_6d3a7f28d4e30af0":
    case #"hash_8a31c0680349ff7b":
    case #"hash_bd0a50437d51e6e7":
    case #"hash_bd0a51437d51e87a":
    case #"hash_c82c626607f41c61":
    case #"hash_f086d807b107cbfd":
        return [0:0, 1:container.origin + forward * getdvarfloat(@"hash_90ce55a815605004", 16)];
    case #"hash_50e52e4dc37fb7a8":
        return [0:0, 1:container.origin + forward * getdvarfloat(@"hash_90ce55a815605004", 16) + up * -15];
    case #"hash_44904bb5898785d9":
        return [0:270, 1:undefined];
    case #"hash_1a50c41f80fb532b":
    case #"hash_39e3bc45cc6f31c1":
        return [0:270, 1:container.origin + up * 15];
    case #"hash_2cbf29aaf45c022d":
        return [0:undefined, 1:container.origin + left * 10 + up * -30];
    case #"hash_4c9cda73b7cb8b41":
        return [0:0, 1:container.origin + up * -15];
    case #"hash_93553b29704c0d3":
    case #"hash_2808ce3c4558142d":
    case #"hash_469a90a45e97eda9":
        return [0:0, 1:container.origin + forward * 15 + up * -15];
    case #"hash_acc339f27e6535d8":
    case #"hash_acc33cf27e653a91":
        return [0:0, 1:container.origin + forward * getdvarfloat(@"hash_90ce55a815605004", 16) + up * 30];
    case #"hash_622289dd129d2c26":
        return [0:undefined, 1:container.origin + left * 10 + up * 20];
    case #"hash_7125a4bce2d8c398":
    case #"hash_7adf06ad39cbadfa":
        return [0:0, 1:container.origin + forward * 8 + up * -10];
    case #"hash_7635d9926e3b434":
    case #"hash_763609926e3b8ed":
        return [0:undefined, 1:container.origin + forward * getdvarfloat(@"hash_90ce55a815605004", 16) + left * 16 + up * -5];
    case #"hash_a6fd900b15b2be21":
        return [0:0, 1:container.origin + forward * 25 + up * 20];
    case #"hash_a7972bf23ae4418b":
        return [0:undefined, 1:container.origin + up * 20];
    case #"hash_f5c9223af83f2f31":
        return [0:30, 1:container.origin + up * 10];
    case #"hash_86270620b8682388":
        return [0:30, 1:container.origin + forward * 10 + up * -20];
    default:
        return [0:undefined, 1:undefined];
        break;
    }
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a08
// Size: 0x1bc
function opencrate(items) {
    switch (self.type) {
    case #"hash_417c605750c7baa5":
        level.var_a688dd9515c7def = array_add(level.var_a688dd9515c7def, items);
        level.var_bd006676148e6c40 = array_add(level.var_bd006676148e6c40, self);
        break;
    case #"hash_19ba8d41970911ad":
        level.var_344f2168e7b1bc8e = array_add(level.var_344f2168e7b1bc8e, items);
        level.var_bd006676148e6c40 = array_add(level.var_bd006676148e6c40, self);
        break;
    case #"hash_4ca1dc2e1b0de0d3":
        if (!getdvarint(@"hash_e2833ccddfe41882", 1) || level.var_b00874d1374e4c38.size < 100 && !isdefined(self.contents)) {
            level.var_b00874d1374e4c38 = array_add(level.var_b00874d1374e4c38, items);
        }
        level.var_bd006676148e6c40 = array_add(level.var_bd006676148e6c40, self);
        break;
    case #"hash_4654cfd269b6fc02":
    case #"hash_9c5f01407ae504fc":
    case #"hash_bc13d03dc3f6d6e8":
        level.var_bd006676148e6c40 = array_add(level.var_bd006676148e6c40, self);
        break;
    case #"hash_5bbda41f2e59fbef":
    case #"hash_8944097b14faec32":
        break;
    default:
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("openGametypeCrate")) {
            namespace_71073fa38f11492::runbrgametypefunc("openGametypeCrate", self, items);
        }
        break;
    }
    namespace_a011fbf6d93f25e5::function_eb0f4a619dd99bba(self.type, self.origin, items, self.index);
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bcb
// Size: 0x2f
function removecrate() {
    if (array_contains(level.var_bd006676148e6c40, self)) {
        level.var_bd006676148e6c40 = array_remove(level.var_bd006676148e6c40, self);
    }
}

// Namespace br_lootcache/namespace_1b7e64f50cca9321
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c01
// Size: 0x8d
function function_27f0aed354031248() {
    if (!isdefined(level.var_b00874d1374e4c38) || level.var_b00874d1374e4c38.size <= 0) {
        return;
    }
    self.var_1208f086f2985c55 = 0;
    if (getdvarint(@"hash_e2833ccddfe41882", 1)) {
        self.contents = utility::function_7a2aaa4a09a4d250(level.var_b00874d1374e4c38);
    } else {
        randomindex = randomintrange(0, 99);
        newitems = getscriptcachecontents("sc_reusable_cache_restock", randomindex);
        self.contents = newitems;
    }
}

