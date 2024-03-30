// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_16ea1b94f0f381b3;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_3e2f8cc477d57433;
#using script_600b944a95c3a7bf;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\math.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_43971bbeefd98f05;

#namespace common_cache;

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x106
function init_cache() {
    var_1d7913d6165ec9e5 = getdvarint(@"hash_340f31675ef2e702", 50);
    var_26f109b5a85a74cf = getdvarint(@"hash_adc3757de4a4f0b9", 10);
    level.var_1d7913d6165ec9e5 = var_1d7913d6165ec9e5 * var_1d7913d6165ec9e5;
    level.var_26f109b5a85a74cf = var_26f109b5a85a74cf * var_26f109b5a85a74cf;
    level.var_c028bd4d695c8c45 = getdvarint(@"hash_22ef27debe529bf8", 20);
    level.var_2edc664b9fb97443 = getdvarint(@"hash_819b6e8500e6044c", 4);
    scripts/engine/scriptable::scriptable_addusedcallback(&function_ba99ee1ab267e97f);
    scripts/engine/scriptable::scriptable_addautousecallback(&function_ba99ee1ab267e97f);
    namespace_53fc9ddbb516e6e1::function_9bc69c26770d9533(&function_f87690347a82844d);
    utility::registersharedfunc("container", "isContainerEmpty", &isContainerEmpty);
    utility::registersharedfunc("container", "getIndexForLootIDInContainer", &function_d1703475e83c17fb);
    utility::registersharedfunc("container", "getLoadoutDoubleBackpackLootID", undefined);
    utility::registersharedfunc("container", "getLootIDAtContainerIndex", &getLootIDAtContainerIndex);
    /#
        thread setup_devgui();
    #/
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa68
// Size: 0x183
function function_ba99ee1ab267e97f(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!function_1414925deba056bc(instance.type, "cache")) {
        return;
    }
    if (isdefined(instance.var_55bb3585d29af1be)) {
        [[ instance.var_55bb3585d29af1be ]](instance, player);
        return;
    }
    /#
        assert(part == "body");
    #/
    if ((state == "closed_usable" || state == "closed_usable_no_collision") && !isdefined(instance.entity)) {
        if (instance getscriptableparthasstate(part, "fully_opening_unusable")) {
            instance setscriptablepartstate(part, "fully_opening_unusable");
        }
        if (isdefined(instance.var_534e0cf170a981b7)) {
            [[ instance.var_534e0cf170a981b7 ]](instance, player);
        }
        if (!isdefined(instance.contents)) {
            itemnames = getscriptablelootcachecontents(instance);
            if (!isdefined(itemnames)) {
                /#
                    assertmsg("onCacheUsed failed to get items from the scriptable loot cache.");
                #/
                return;
            }
            function_bcb843e937613416(instance, itemnames);
        }
        if (!isdefined(instance.containertype)) {
            instance.containertype = 3;
        }
    } else if (isdefined(instance.contents) && state == "partially_open_usable") {
        if (instance getscriptableparthasstate(part, "fully_opening_unusable")) {
            instance setscriptablepartstate(part, "fully_opening_unusable");
        }
    }
    function_30f5ea60517f9e06(instance, player);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf2
// Size: 0x381
function function_30f5ea60517f9e06(container, opener) {
    if (isdefined(container.containertype) && container.containertype == 13) {
        container.contents = opener.ballooncontents.contents;
    }
    function_87ad4454c9d2b995(opener, container);
    function_6830225d0b087bec(opener, container);
    items = container.contents;
    opener.var_2fa5b49969def47 = container;
    opener.var_f2aa9ae949179907 = opener.origin;
    if (container.type == "activity_reward_cache_lootcache") {
        foreach (item in items) {
            item.fromriftreward = 1;
        }
    }
    params = spawnstruct();
    params.cacheinstance = container;
    params.items = items;
    opener callback::callback("lootcache_looted", params);
    container.openedbefore = 1;
    if (isdefined(container.containertype) && container.containertype == 13) {
        opener.ballooncontents.contents = items;
    }
    if (isdefined(container.linkedparent)) {
        opener.var_f2aa9ae949179907 = rotatevectorinverted(opener.origin - container.linkedparent.origin, container.linkedparent.angles);
    }
    /#
        if (items.size > 10) {
            println("disconnect" + items.size + "<unknown string>" + 10 + "<unknown string>");
        }
    #/
    for (itemindex = 0; itemindex < 10; itemindex++) {
        if (function_a5aedf9af5af1c7f(opener, container, itemindex)) {
            function_446c7ad7bcc70992(opener, itemindex, items[itemindex].lootid, function_b8bfea9514c89a77(items[itemindex].quantity), items[itemindex].weapondata);
            continue;
        }
        function_c7294f5b9b5006d5(opener, itemindex);
    }
    if (isdefined(container.weaponslotcontents)) {
        opener setclientomnvar("loot_container_weapon", container.weaponslotcontents);
    } else {
        opener setclientomnvar("loot_container_weapon", 0);
    }
    opener setclientomnvar("loot_container_min_slots", isdefined(container.minimumslots) ? container.minimumslots : level.var_2edc664b9fb97443);
    if (!isdefined(container.containertype)) {
        container.containertype = 1;
    }
    opener setclientomnvar("loot_container_open", container.containertype);
    if (istrue(level.var_a101059dea76957c) && !istrue(container.previouslyopened) && container.containertype != 13) {
        container.previouslyopened = 1;
    }
    container thread function_7f6dc80424e55d7b(opener);
    container thread function_71a59f067d5fe986(opener);
    container thread function_47b931d76ffd028f(opener);
    opener scripts/cp_mp/calloutmarkerping::function_faa3cbec7243fe72();
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7a
// Size: 0x142
function function_87ad4454c9d2b995(opener, container) {
    nextweaponindex = 0;
    for (itemindex = 0; itemindex < container.contents.size; itemindex++) {
        if (function_a5aedf9af5af1c7f(opener, container, itemindex)) {
            itembundlename = function_fc925a153c7fd55c(container.contents[itemindex].lootid);
            if (!isdefined(itembundlename)) {
                /#
                    assertmsg("Could not retrieve the item bundle for the lootID " + container.contents[itemindex].lootid + ". The item might not have been included in the Item Include List field of ItemSpawnZoneList");
                #/
                continue;
            }
            itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
            if (isdefined(itembundle.type) && itembundle.type == "weapon") {
                if (itemindex != nextweaponindex) {
                    replaceditem = undefined;
                    if (function_a5aedf9af5af1c7f(opener, container, nextweaponindex)) {
                        replaceditem = container.contents[nextweaponindex];
                    }
                    container.contents[nextweaponindex] = container.contents[itemindex];
                    container.contents[itemindex] = replaceditem;
                }
                nextweaponindex++;
            }
        }
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c3
// Size: 0x19a
function function_6830225d0b087bec(opener, container) {
    for (itemindex = 0; itemindex < container.contents.size; itemindex++) {
        if (!function_a5aedf9af5af1c7f(opener, container, itemindex)) {
            continue;
        }
        item = container.contents[itemindex];
        itembundlename = function_fc925a153c7fd55c(item.lootid);
        if (!isdefined(itembundlename)) {
            /#
                assertmsg("Could not retrieve the item bundle for the lootID " + item.lootid + ". The item might not have been included in the Item Include List field of ItemSpawnZoneList");
            #/
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        if (isdefined(itembundle) && isdefined(itembundle.type) && itembundle.type == "weapon") {
            if (itembundle.type == "weapon") {
                clipammo = 0;
                stockammo = 0;
                if (isdefined(item.var_4f74f0aef2b2a8bf)) {
                    weaponobj = function_7d4684238ed31570(itembundle, item);
                    if (isdefined(weaponobj)) {
                        clipammo = weaponclipsize(weaponobj);
                        stockammo = weaponmaxammo(weaponobj);
                    }
                }
                if (clipammo <= 0 && isdefined(itembundle.baseweapon)) {
                    clipammo = weaponclipsize(itembundle.baseweapon);
                    stockammo = weaponmaxammo(itembundle.baseweapon);
                }
                item.quantity = function_7209c8cd4b2e3afd(clipammo + stockammo);
            }
        }
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1264
// Size: 0x1ed
function function_68085c72d7b628ec(container, opener) {
    if (!isdefined(container) || !isdefined(opener)) {
        /#
            assertmsg("CommonCacheERROR: Undefined container or opener.");
        #/
        return;
    }
    /#
        if (isdefined(level.var_61e6e1b83a8f3486) && isdefined(level.var_61e6e1b83a8f3486.var_9549d82a3fba4746) && container == level.var_61e6e1b83a8f3486.var_9549d82a3fba4746) {
            opener setclientomnvar("<unknown string>", 0);
            opener.var_2fa5b49969def47 = undefined;
            container notify("<unknown string>");
            return;
        }
    #/
    opener setclientomnvar("loot_container_open", 0);
    function_d53393379858d253(opener);
    if (!istrue(container.var_978407de904a5fd1)) {
        partname = container function_ec5f4851431f3382();
        if (opener isContainerEmpty(container)) {
            if (container getscriptableparthasstate(partname, "fully_opening_unusable")) {
                container setscriptablepartstate(partname, "fully_opening_unusable");
            }
        } else if ((!isdefined(container.containertype) || container.containertype != 4 || container.containertype == 4 && istrue(container.var_6a4915c949e9e77e)) && container getscriptableparthasstate(partname, "partially_open_usable")) {
            state = container getscriptablepartstate(partname);
            if (state == "fully_open_unusable") {
                container setscriptablepartstate(partname, "partially_open_usable");
            } else if (state == "fully_opening_unusable") {
                container thread function_d3e618521013c7eb();
            } else {
                /#
                    assert(0, "Attempted to close a lootable container that wasn't in either fully_open_unusable or fully_opening_unusable");
                #/
            }
        }
    }
    if (istrue(opener.var_7f15935a89ea5b13)) {
        opener.var_7f15935a89ea5b13 = undefined;
    }
    opener.var_2fa5b49969def47 = undefined;
    params = spawnstruct();
    params.opener = opener;
    container callback::callback("on_cache_closed", params);
    container notify("closed");
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1458
// Size: 0x171
function function_71a59f067d5fe986(opener) {
    self endon("death");
    self endon("closed");
    level endon("game_ended");
    opener endon("disconnect");
    var_ec64eecddf1178af = anglestoforward(opener getplayerangles());
    framesstill = 0;
    while (opener scripts/cp_mp/utility/player_utility::_isalive() && !istrue(opener.isdisconnecting) && isdefined(opener.origin) && !function_139b3fe10930a6a5(self, opener, framesstill) && !function_35a189c66e8d51f0(opener, var_ec64eecddf1178af) && opener playerads() < 0.5) {
        if (getdvarint(@"hash_419fd2f09b23942a", 1)) {
            if (lengthsquared(opener getvelocity()) == 0) {
                if (framesstill == 0) {
                    if (isdefined(self.linkedparent)) {
                        opener.var_f2aa9ae949179907 = rotatevectorinverted(opener.origin - self.linkedparent.origin, self.linkedparent.angles);
                    } else {
                        opener.var_f2aa9ae949179907 = opener.origin;
                    }
                }
                framesstill++;
                framesstill = int(min(framesstill, getdvarint(@"hash_aea0716d0a0f790a", 6)));
            } else {
                framesstill--;
                framesstill = int(max(framesstill, 0));
            }
        }
        waitframe();
    }
    function_68085c72d7b628ec(self, opener);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d0
// Size: 0x46
function function_47b931d76ffd028f(opener) {
    self endon("death");
    level endon("game_ended");
    self endon("closed");
    opener scripts/engine/utility::waittill_any_4("close_container", "flashbang", "concussed", "weapon_fired");
    function_68085c72d7b628ec(self, opener);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161d
// Size: 0x300
function function_7f6dc80424e55d7b(opener) {
    self endon("death");
    level endon("game_ended");
    self endon("closed");
    wait(0.5);
    if (!isdefined(self.contents)) {
        /#
            assertmsg("CommonCacheERROR: Auto-looting was attempted on a container with undefined contents.");
        #/
        return;
    }
    contents = self.contents;
    for (i = 0; i < contents.size; i++) {
        if (!isdefined(contents[i])) {
            continue;
        }
        lootid = contents[i].lootid;
        quantity = contents[i].quantity;
        itembundlename = function_fc925a153c7fd55c(lootid);
        if (!isdefined(itembundlename)) {
            if (quantity > 0) {
                /#
                    assertmsg("CommonCacheERROR: unable to find itemBundleName for lootID [ " + lootid + " ] in cache, even though it has a quantity larger than 0.");
                #/
            }
            continue;
        }
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        if (!istrue(itembundle.var_13fc3679e0d849db)) {
            continue;
        }
        fakeitem = spawnstruct();
        fakeitem.type = itembundle.scriptable;
        fakeitem.count = quantity;
        var_4cf8737a4d987265 = opener common_item::function_576728d3d4486bd6(fakeitem, 1);
        if (var_4cf8737a4d987265) {
            function_eff2aed88a59ccfd(opener, i, 0, 0);
            function_56b776a926446950(opener, lootid);
            if (isdefined(self.var_139629996ea22b5)) {
                foreach (pingdata in self.var_139629996ea22b5) {
                    if (isdefined(pingdata.lootid) && pingdata.lootid == lootid) {
                        deleteping = 1;
                        for (index = 0; index < contents.size; index++) {
                            if (index != i && isdefined(contents[index]) && isdefined(contents[index].lootid) && contents[index].lootid == lootid) {
                                deleteping = 0;
                                break;
                            }
                        }
                        if (deleteping) {
                            pingdata.pingowner scripts/cp_mp/calloutmarkerping::calloutmarkerping_removecallout(pingdata.pingindex);
                        }
                        waitframe();
                    }
                }
            }
            wait(0.5);
        }
    }
    if (opener isContainerEmpty(self) && self.containertype != 15 && self.containertype != 18 && self.containertype != 19) {
        container = self;
        function_68085c72d7b628ec(self, opener);
        if (isdefined(container.var_1498604de9cf5016) && !istrue(container.var_1498604de9cf5016)) {
            container notify("death");
            container freescriptable();
        }
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1924
// Size: 0x44
function function_d3e618521013c7eb() {
    self endon("death");
    level endon("game_ended");
    partname = self function_ec5f4851431f3382();
    waitframe();
    while (self getscriptablepartstate(partname) == "fully_opening_unusable") {
        waitframe();
    }
    self setscriptablepartstate(partname, "partially_open_usable");
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196f
// Size: 0x21a
function function_446c7ad7bcc70992(player, index, lootid, quantity, weapondata) {
    /#
        assert(isdefined(lootid) && isdefined(quantity));
    #/
    if (!isdefined(lootid) || lootid == 0 || !isdefined(quantity) || quantity == 0) {
        function_c7294f5b9b5006d5(player, index);
        return;
    }
    typename = loot::function_282cf83c9eeda744(lootid);
    if (!isdefined(typename)) {
        /#
            assertmsg("CommonCacheERROR: Could not find type for lootID [" + lootid + "].");
        #/
        return;
    }
    typedata = level.lootmaster[typename];
    if (!isdefined(typedata)) {
        /#
            assertmsg("CommonCacheERROR: Could not find type data for loot type [" + typename + "].");
        #/
        return;
    }
    typeindex = typedata.typevalue;
    if (typename == "weapon" && isdefined(weapondata)) {
        itembundle = common_item::function_f4a303d532b044a7(lootid);
        if (isdefined(itembundle) && isdefined(itembundle.baseweapon)) {
            weaponobj = undefined;
            var_49e6ef3edadd524e = weapon::getweaponrootname(itembundle.baseweapon);
            if (isdefined(weapondata.variantid) && weapondata.variantid != 0) {
                blueprintcamo = function_c7771194200d360e(lootid);
                weaponobj = weapon::buildweapon_blueprint(var_49e6ef3edadd524e, blueprintcamo, undefined, weapondata.variantid);
            } else {
                weaponobj = weapon::buildweapon(var_49e6ef3edadd524e, weapondata.attachments);
            }
            var_8eb93a779d9df6f7 = function_3c67455f0dcec331(player, weaponobj);
            lootid = function_5b832267ff976432(lootid, var_8eb93a779d9df6f7);
        }
        typeindex = isdefined(weapondata.rarity) ? weapondata.rarity : 0;
    }
    player setclientomnvar("loot_container_item_" + index, lootid);
    player setclientomnvar("loot_container_quantity_" + index, quantity);
    player setclientomnvar("loot_container_type_" + index, typeindex);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b90
// Size: 0x41
function function_c7294f5b9b5006d5(player, index) {
    player setclientomnvar("loot_container_item_" + index, 0);
    player setclientomnvar("loot_container_quantity_" + index, 0);
    player setclientomnvar("loot_container_type_" + index, 0);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd8
// Size: 0x50
function function_35a189c66e8d51f0(opener, var_ec64eecddf1178af) {
    if (!isdefined(opener) || !isdefined(opener getplayerangles())) {
        return true;
    }
    var_87782b21920f1be6 = anglestoforward(opener getplayerangles());
    return math::anglebetweenvectors(var_ec64eecddf1178af, var_87782b21920f1be6) > level.var_c028bd4d695c8c45;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c30
// Size: 0xe7
function isContainerEmpty(container) {
    if (!isdefined(container.contents)) {
        return true;
    }
    foreach (content in container.contents) {
        if (!isdefined(content.lootid) || !isdefined(content.quantity)) {
            continue;
        }
        if (content.lootid > 0 && function_b8bfea9514c89a77(content.quantity) > 0) {
            return false;
        }
    }
    if (isdefined(container.weaponslotcontents)) {
        containerweapon = self getclientomnvar("loot_container_weapon");
        if (istrue(containerweapon)) {
            return false;
        }
    }
    return true;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1f
// Size: 0xfd
function function_139b3fe10930a6a5(container, opener, framesstill) {
    if (!isdefined(opener.var_f2aa9ae949179907)) {
        return true;
    }
    movedistancesquared = level.var_1d7913d6165ec9e5;
    if (framesstill > 2 && getdvarint(@"hash_419fd2f09b23942a", 1)) {
        movedistancesquared = level.var_26f109b5a85a74cf;
    }
    if (isdefined(container.linkedparent)) {
        newoffset = rotatevectorinverted(opener.origin - container.linkedparent.origin, container.linkedparent.angles);
        if (distancesquared(opener.var_f2aa9ae949179907, newoffset) > movedistancesquared) {
            return true;
        }
    } else if (distancesquared(opener.var_f2aa9ae949179907, opener.origin) > movedistancesquared) {
        return true;
    }
    return false;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e24
// Size: 0x96
function function_a5aedf9af5af1c7f(opener, container, itemindex) {
    if (!isdefined(container.contents[itemindex])) {
        return false;
    }
    item = container.contents[itemindex];
    lootid = item.lootid;
    quantity = function_b8bfea9514c89a77(item.quantity);
    if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0) {
        return true;
    }
    return false;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec2
// Size: 0x3f9
function function_f87690347a82844d(notification, slotindex) {
    result = 0;
    if (isdefined(notification)) {
        cache = self.var_2fa5b49969def47;
        if (!isdefined(cache)) {
            return;
        }
        if (!function_d6041f45fee8083d()) {
            return;
        }
        switch (notification) {
        case #"hash_31a47c100531f34f":
            result = function_f4fda26d9ae6dbe0(self, slotindex, "lootcache_obtaintype_stow", 1, cache);
            break;
        case #"hash_b7e2e7e659da3043":
            result = function_f4fda26d9ae6dbe0(self, slotindex, "lootcache_obtaintype_stow", undefined, cache);
            break;
        case #"hash_453445f0e586a78e":
            if (!istrue(cache.var_978407de904a5fd1)) {
                result = function_f4fda26d9ae6dbe0(self, slotindex, "lootcache_obtaintype_equip", undefined, cache);
            } else {
                if (cache.var_9c44eb334c225d45 == 1 && !namespace_3883e3399f2870b5::isContainerEmpty(cache)) {
                    lootid = cache.contents[0].lootid;
                    quantity = cache.contents[0].quantity;
                    function_b9d2aee928c46b5f(lootid, quantity, undefined, undefined, 1);
                    function_eff2aed88a59ccfd(self, 0, 0, 0);
                }
                function_cc518f9c6e1d9543(cache);
            }
            break;
        case #"hash_fb84b605789df05e":
            function_68085c72d7b628ec(cache, self);
            return;
        case #"hash_10217053947e341b":
            cacheindex = slotindex >> 8;
            backpackindex = slotindex & 255;
            lootid = cache.contents[cacheindex].lootid;
            quantity = cache.contents[cacheindex].quantity;
            function_2d05d3354917445b(backpackindex, lootid, quantity);
            itembundlename = function_fc925a153c7fd55c(lootid);
            if (isdefined(itembundlename)) {
                itembundle = function_50f8a8f765bad85e("itemspawnentry:" + itembundlename, [#"pickupsfx", #"raritydef", #"type", #"ref", #"subtype"]);
                params = spawnstruct();
                params.item = cache;
                params.itembundlename = itembundlename;
                params.itembundle = itembundle;
                params.tobackpack = 1;
                callback::callback("player_item_pickup", params);
            }
            function_eff2aed88a59ccfd(self, cacheindex, 0, 0);
            function_56b776a926446950(self, lootid);
            if (istrue(cache.var_978407de904a5fd1)) {
                function_cc518f9c6e1d9543(cache);
            } else if (isContainerEmpty(cache)) {
                function_68085c72d7b628ec(cache, self);
            }
            break;
        default:
            return;
        }
    }
    if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.onitemtaken)) {
        [[ self.var_2fa5b49969def47.onitemtaken ]](self.var_2fa5b49969def47, self);
    }
    if (istrue(result) && isdefined(self.var_2fa5b49969def47) && isContainerEmpty(self.var_2fa5b49969def47) && self.var_2fa5b49969def47.containertype != 15 && self.var_2fa5b49969def47.containertype != 18 && self.var_2fa5b49969def47.containertype != 19) {
        container = self.var_2fa5b49969def47;
        function_68085c72d7b628ec(self.var_2fa5b49969def47, self);
        if (isdefined(container.var_1498604de9cf5016) && !istrue(container.var_1498604de9cf5016)) {
            container notify("death");
            container freescriptable();
        }
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c2
// Size: 0x10
function function_d6041f45fee8083d() {
    return self getclientomnvar("loot_container_open") > 0;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22da
// Size: 0x516
function function_f4fda26d9ae6dbe0(player, index, obtaintype, var_a1803fc19dffd729, cache) {
    if (!isdefined(cache) || !isdefined(cache.contents) || !isdefined(cache.contents[index])) {
        /#
            assertmsg("CommonCacheERROR: Invalid cache contents at index [" + index + "].");
        #/
        return 0;
    }
    fromriftreward = isdefined(cache.contents[index].fromriftreward) ? cache.contents[index].fromriftreward : 0;
    lootid = cache.contents[index].lootid;
    cachequantity = cache.contents[index].quantity;
    weapondata = cache.contents[index].weapondata;
    if (!isdefined(lootid) || lootid == 0 || !isdefined(cachequantity) || cachequantity == 0) {
        /#
            assertmsg("CommonCacheERROR: Attempted to loot from an empty/invalid container slot at index [" + index + "].");
        #/
        return 0;
    }
    if (!isdefined(var_a1803fc19dffd729)) {
        var_a1803fc19dffd729 = cachequantity;
    }
    if (var_a1803fc19dffd729 > cachequantity) {
        var_a1803fc19dffd729 = cachequantity;
        /#
            assertmsg("CommonCacheERROR: Attempted to loot a higher quantity than what is available.");
        #/
    }
    itembundlename = undefined;
    itembundle = undefined;
    if (isdefined(weapondata) && isdefined(weapondata.baseweapon)) {
        itembundlename = namespace_736197e4d378b91b::function_46423e80a0fa8f2(weapondata.baseweapon, 0, weapondata.variantid);
        itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
        /#
            /#
                assert(isdefined(itembundle), "<unknown string>" + itembundlename + "<unknown string>");
            #/
        #/
    } else {
        itembundlename = function_fc925a153c7fd55c(lootid);
        itembundle = function_f4a303d532b044a7(lootid);
    }
    if (!isdefined(itembundle)) {
        return 0;
    }
    if (function_633f07e180b6ec8f("itemspawnentry:" + itembundlename)) {
        return 0;
    }
    item = spawnstruct();
    item.type = itembundle.scriptable;
    item.count = function_7209c8cd4b2e3afd(var_a1803fc19dffd729);
    item.fromcache = 1;
    item.fromriftreward = fromriftreward;
    if (isdefined(weapondata) && isdefined(itembundle.baseweapon)) {
        item.var_4f74f0aef2b2a8bf = spawnstruct();
        item.var_4f74f0aef2b2a8bf.itembundlename = itembundlename;
        item.var_4f74f0aef2b2a8bf.baseweapon = itembundle.baseweapon;
        item.var_4f74f0aef2b2a8bf.attachments = weapondata.attachments;
        item.var_4f74f0aef2b2a8bf.rarity = weapondata.rarity;
        item.var_4f74f0aef2b2a8bf.variantid = weapondata.variantid;
        item.var_4f74f0aef2b2a8bf.camo = weapondata.camo;
    }
    if (isdefined(cache.var_139629996ea22b5)) {
        foreach (pingdata in cache.var_139629996ea22b5) {
            if (isdefined(pingdata.lootid) && pingdata.lootid == lootid) {
                deleteping = 1;
                for (i = 0; i < cache.contents.size; i++) {
                    if (i != index && isdefined(cache.contents[i]) && isdefined(cache.contents[i].lootid) && cache.contents[i].lootid == lootid) {
                        deleteping = 0;
                        break;
                    }
                }
                if (deleteping) {
                    pingdata.pingowner scripts/cp_mp/calloutmarkerping::calloutmarkerping_removecallout(pingdata.pingindex);
                }
                waitframe();
            }
        }
    }
    switch (obtaintype) {
    case #"hash_e6ef587f08f8234e":
        function_de489fa2ffdb7f2d(item, 0);
        break;
    case #"hash_93aad3e0afb4b617":
        function_10e55eeb4c15dd5a(item);
        break;
    default:
        return;
    }
    newquantity = 0;
    if (isdefined(item)) {
        newquantity = function_b8bfea9514c89a77(item.count);
    }
    function_eff2aed88a59ccfd(player, index, lootid, newquantity, weapondata);
    if (newquantity < var_a1803fc19dffd729) {
        function_56b776a926446950(player, lootid);
    }
    return newquantity == 0;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f8
// Size: 0x11c
function function_d1703475e83c17fb(container, lootid, player) {
    if (!isdefined(container) || !isdefined(container.contents) || !isdefined(lootid) || !isint(lootid)) {
        /#
            if (!isdefined(container) || !isdefined(container.contents)) {
                /#
                    assertmsg("<unknown string>");
                #/
            } else if (!isdefined(lootid) || !isint(lootid)) {
                /#
                    assertmsg("<unknown string>");
                #/
            }
        #/
        return [undefined, undefined];
    }
    for (containerindex = 0; containerindex < container.contents.size; containerindex = containerindex + 1) {
        if (isdefined(container.contents[containerindex]) && isdefined(container.contents[containerindex].lootid) && lootid == container.contents[containerindex].lootid) {
            return [containerindex, 0];
        }
    }
    return [undefined, undefined];
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291c
// Size: 0x49
function getLootIDAtContainerIndex(player, index) {
    packedslotid = player getclientomnvar("loot_container_item_" + index);
    slotiddata = function_217ab517f98c6fab(packedslotid);
    return slotiddata.lootid;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296d
// Size: 0x21
function function_8e5978971b5dcd16(player, index) {
    return player getclientomnvar("loot_container_quantity_" + index);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2996
// Size: 0xbf
function function_eff2aed88a59ccfd(player, index, newlootid, newquantity, newweapondata) {
    if (isdefined(player.var_2fa5b49969def47)) {
        player.var_2fa5b49969def47.contents[index].quantity = function_7209c8cd4b2e3afd(newquantity);
        if (newquantity <= 0) {
            newlootid = 0;
            player.var_2fa5b49969def47.contents[index].lootid = newlootid;
        }
        player.var_2fa5b49969def47.contents[index].weapondata = newweapondata;
    }
    function_446c7ad7bcc70992(player, index, newlootid, newquantity, newweapondata);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5c
// Size: 0x3d
function function_56b776a926446950(player, lootid) {
    if (isdefined(player) && isdefined(player.var_2fa5b49969def47)) {
        player.var_2fa5b49969def47 notify("cache_item_looted", lootid);
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aa0
// Size: 0xa8
function function_bcb843e937613416(instance, itemnames) {
    if (!isdefined(instance) || !isdefined(itemnames) || itemnames.size <= 0) {
        return;
    }
    instance.contents = [];
    foreach (itemname in itemnames) {
        itembundlename = function_2cdc55ba39d97d70(itemname);
        if (!isdefined(itembundlename)) {
            itembundlename = itemname;
        }
        if (!isdefined(itembundlename)) {
            continue;
        }
        function_ff5a53c1d3232e2f(instance, 1, itembundlename);
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4f
// Size: 0xb9
function function_6eee0ede493b44e8(instance, quantity, lootid) {
    if (!isdefined(instance.contents)) {
        instance.contents = [];
    }
    if (!isdefined(lootid) || lootid == 0 || !isdefined(quantity) || quantity == 0) {
        instance.contents[instance.contents.size] = {quantity:0, lootid:0};
        return;
    }
    itembundlename = function_fc925a153c7fd55c(lootid);
    if (!isdefined(itembundlename)) {
        /#
            assertmsg("CommonCacheERROR: Attempted to add an item with an invalid lootID [" + lootid + "] to a cache.");
        #/
        return;
    }
    function_ff5a53c1d3232e2f(instance, quantity, itembundlename);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0f
// Size: 0x289
function function_ff5a53c1d3232e2f(instance, quantity, itembundlename) {
    if (!isdefined(itembundlename)) {
        /#
            assertmsg("CommonCacheERROR: Attempted to add an undefined item to a cache.");
        #/
        return;
    }
    if (!isdefined(instance.contents)) {
        instance.contents = [];
    }
    if (!isdefined(quantity) || quantity == 0) {
        instance.contents[instance.contents.size] = {quantity:0, lootid:0};
        return;
    }
    var_b91e11f33e2a122d = function_50f8a8f765bad85e("itemspawnentry:" + itembundlename, [#"spawncount", #"rarity", #"type", #"ref", #"scriptable"]);
    if (!isdefined(var_b91e11f33e2a122d)) {
        /#
            assertmsg("CommonItemERROR: Script bundle not found for itemspawnentry [" + itembundlename + "]");
        #/
        return;
    }
    item = spawnstruct();
    item.lootid = function_6d15e119c2779a93(var_b91e11f33e2a122d);
    if (!isdefined(item.lootid)) {
        /#
            assertmsg("CommonCacheERROR: Attempted to add an item [" + itembundlename + "] with an invalid lootID to a cache.");
        #/
        return;
    }
    item.quantity = quantity;
    if (isdefined(var_b91e11f33e2a122d.spawncount)) {
        item.quantity = var_b91e11f33e2a122d.spawncount;
    }
    if (isdefined(var_b91e11f33e2a122d.type) && var_b91e11f33e2a122d.type == "weapon") {
        itemweapondata = spawnstruct();
        itemweapondata.rarity = var_b91e11f33e2a122d.rarity;
        itemweapondata.variantid = namespace_736197e4d378b91b::function_ce5e32676f572482(var_b91e11f33e2a122d);
        if (itemweapondata.variantid == 0) {
            attachments = function_c9fa4fbe86fb1c75(itembundlename);
            if (isdefined(attachments) && attachments.size > 0) {
                itemweapondata.attachments = attachments;
            }
        } else {
            itemweapondata.camo = function_c7771194200d360e(item.lootid);
        }
        if (isdefined(itemweapondata.rarity) || isdefined(itemweapondata.attachments) || itemweapondata.variantid != 0) {
            item.weapondata = itemweapondata;
        }
    }
    instance.contents[instance.contents.size] = item;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9f
// Size: 0x38
function function_d71a41afca697376(instance, listbundlename, count) {
    itemnames = common_item::function_bc2f4857c90f5344(listbundlename, count);
    function_bcb843e937613416(instance, itemnames);
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ede
// Size: 0x1a5
function cache_spawncache(scriptkey, origin, angles, forcedstate) {
    var_e62511cd09a9b71f = function_1a5ef09ec005ebf(origin, [#"hash_2de21e1dd759eb92"]);
    if (!isdefined(var_e62511cd09a9b71f)) {
        /#
            assertmsg("CommonCacheERROR: Attempting to spawn cache with script key [" + function_3c8848a3a11b2553(scriptkey) + "] at origin [" + origin + "] but failed to find a zoneDef for location.");
        #/
        return;
    }
    foreach (cacheentry in var_e62511cd09a9b71f.var_9e5e8749b0f570be) {
        if (cacheentry.scriptkey == scriptkey) {
            cachebundlename = cacheentry.var_afbb6e9b90b03af;
            var_42b0b62a5ff326bc = function_50f8a8f765bad85e("itemspawnentry:" + cachebundlename, [#"scriptable"]);
            if (!isdefined(var_42b0b62a5ff326bc)) {
                /#
                    assertmsg("CommonCacheERROR: Attempting to spawn cache with script key [" + function_3c8848a3a11b2553(scriptkey) + "] at origin [" + origin + "] but failed to find the itemspawnentry bundle for cache [" + cachebundlename + "]");
                #/
                return;
            }
            cache = spawnscriptable(var_42b0b62a5ff326bc.scriptable, origin, angles);
            state = "closed_usable";
            if (isdefined(forcedstate)) {
                state = forcedstate;
            }
            cache setscriptablepartstate("body", state);
            function_d71a41afca697376(cache, cacheentry.cacheitemspawnlist, cacheentry.var_b312af7d766b0713);
            return cache;
        }
    }
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x308a
// Size: 0x84
function private function_3c67455f0dcec331(player, weaponobj) {
    if (isweapon(weaponobj)) {
        var_8eb93a779d9df6f7 = function_51f396445baa7fa6(%"hash_15004fe9e3a7c88a", weaponobj);
        if (isdefined(var_8eb93a779d9df6f7) && var_8eb93a779d9df6f7 != 0) {
            if (isdefined(player.var_d6b4193c04f80551)) {
                player.var_d6b4193c04f80551[player.var_d6b4193c04f80551.size] = var_8eb93a779d9df6f7;
            } else {
                player.var_d6b4193c04f80551 = [var_8eb93a779d9df6f7];
            }
            return var_8eb93a779d9df6f7;
        }
    }
    return 0;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3116
// Size: 0x7f
function private function_d53393379858d253(player) {
    if (!isdefined(player.var_d6b4193c04f80551)) {
        return;
    }
    foreach (var_8eb93a779d9df6f7 in player.var_d6b4193c04f80551) {
        function_a1054a8c2bc6c36d(var_8eb93a779d9df6f7);
    }
    player.var_d6b4193c04f80551 = [];
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x319c
// Size: 0x8c
function private function_5b832267ff976432(lootid, extrapayload) {
    bitsused = 31;
    if (bitsused > 31) {
        /#
            assertmsg("CommonCacheERROR: Not enough bits in container slot ID omnvars to pack/unpack values.");
        #/
        return 0;
    }
    if (!isdefined(lootid)) {
        lootid = 0;
    }
    /#
        assert(lootid >= 0 && lootid < 1048576);
    #/
    if (!isdefined(extrapayload)) {
        extrapayload = 0;
    }
    /#
        assert(extrapayload >= 0 && extrapayload < 2048);
    #/
    var_8db5472153ea4811 = extrapayload;
    var_8db5472153ea4811 = var_8db5472153ea4811 << 20;
    var_8db5472153ea4811 = var_8db5472153ea4811 | lootid;
    return var_8db5472153ea4811;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3230
// Size: 0x9b
function private function_217ab517f98c6fab(var_8db5472153ea4811) {
    bitsused = 31;
    if (bitsused > 31) {
        /#
            assertmsg("CommonCacheERROR: Not enough bits in container slot ID omnvars to pack/unpack values.");
        #/
        return undefined;
    }
    var_25cdf28fdb105d24 = spawnstruct();
    lootidmask = 1048576 - 1;
    var_25cdf28fdb105d24.lootid = lootidmask & var_8db5472153ea4811;
    var_8db5472153ea4811 = var_8db5472153ea4811 >> 20;
    var_b1a98c6b10f6e8c1 = 2048 - 1;
    var_25cdf28fdb105d24.extrapayload = var_b1a98c6b10f6e8c1 & var_8db5472153ea4811;
    var_8db5472153ea4811 = var_8db5472153ea4811 >> 11;
    /#
        assert(var_8db5472153ea4811 == 0);
    #/
    return var_25cdf28fdb105d24;
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x32d3
// Size: 0x4e1
function private setup_devgui() {
    /#
        if (!isdefined(level.gametypebundle.var_328f56c2f24c4831) || getdvarint(@"hash_10f0811105fc2f93", 0) == 0) {
            return;
        }
        zonelist = getscriptbundle("<unknown string>" + level.gametypebundle.var_328f56c2f24c4831);
        if (!isdefined(zonelist)) {
            return;
        }
        var_2db9da2642048a13 = [];
        foreach (var_8bfddc20fd955e32 in zonelist.zonedefs) {
            if (isdefined(var_8bfddc20fd955e32.zonedef) && !isdefined(var_2db9da2642048a13[var_8bfddc20fd955e32.zonedef])) {
                var_2db9da2642048a13[var_8bfddc20fd955e32.zonedef] = getscriptbundle("<unknown string>" + var_8bfddc20fd955e32.zonedef);
            }
        }
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_fda80ec40b57c4cf);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        foreach (var_e20693215273eb59, var_a91353c4805838d2 in var_2db9da2642048a13) {
            foreach (entry in var_a91353c4805838d2.var_280b92209c904804) {
                if (isdefined(entry.var_b312af7d766b0713) && isdefined(entry.cacheitemspawnlist) && isdefined(entry.var_afbb6e9b90b03af)) {
                    devgui::function_b23a59dfb4ca49a1(var_e20693215273eb59 + "<unknown string>" + entry.var_afbb6e9b90b03af, "<unknown string>" + entry.var_afbb6e9b90b03af + "<unknown string>" + entry.cacheitemspawnlist + "<unknown string>" + entry.var_b312af7d766b0713, &function_35b40f5e98dc4ee4, 0);
                }
            }
            foreach (entry in var_a91353c4805838d2.var_d13f1f3566674f10) {
                if (isdefined(entry.var_b312af7d766b0713) && isdefined(entry.cacheitemspawnlist) && isdefined(entry.var_afbb6e9b90b03af)) {
                    devgui::function_b23a59dfb4ca49a1(var_e20693215273eb59 + "<unknown string>" + entry.var_afbb6e9b90b03af, "<unknown string>" + entry.var_afbb6e9b90b03af + "<unknown string>" + entry.cacheitemspawnlist + "<unknown string>" + entry.var_b312af7d766b0713, &function_35b40f5e98dc4ee4, 0);
                }
            }
            foreach (entry in var_a91353c4805838d2.var_9e5e8749b0f570be) {
                if (isdefined(entry.scriptkey) && isdefined(entry.var_b312af7d766b0713) && isdefined(entry.cacheitemspawnlist) && isdefined(entry.var_afbb6e9b90b03af)) {
                    devgui::function_b23a59dfb4ca49a1(var_e20693215273eb59 + "<unknown string>" + function_3c8848a3a11b2553(entry.scriptkey), "<unknown string>" + entry.var_afbb6e9b90b03af + "<unknown string>" + entry.cacheitemspawnlist + "<unknown string>" + entry.var_b312af7d766b0713, &function_35b40f5e98dc4ee4, 0);
                }
            }
        }
        devgui::function_fe953f000498048f();
    #/
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37bb
// Size: 0x20
function function_fda80ec40b57c4cf(params) {
    /#
        level.var_2edc664b9fb97443 = int(params[0]);
    #/
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37e2
// Size: 0xbc
function function_7029bab8ebd74e1d(contents) {
    /#
        if (!isdefined(level.var_61e6e1b83a8f3486)) {
            level.var_61e6e1b83a8f3486 = spawnstruct();
        }
        if (!isdefined(level.var_61e6e1b83a8f3486.var_9549d82a3fba4746)) {
            level.var_61e6e1b83a8f3486.var_9549d82a3fba4746 = spawnstruct();
            level.var_61e6e1b83a8f3486.var_9549d82a3fba4746.type = "<unknown string>";
            level.var_61e6e1b83a8f3486.var_9549d82a3fba4746.var_1498604de9cf5016 = 1;
        }
        level.var_61e6e1b83a8f3486.var_9549d82a3fba4746.contents = contents;
    #/
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38a5
// Size: 0xd6
function function_803e6cfa13174264() {
    /#
        foreach (player in level.players) {
            if (isdefined(player function_d6041f45fee8083d())) {
                function_68085c72d7b628ec(level.var_61e6e1b83a8f3486.var_9549d82a3fba4746, player);
            }
            level.var_61e6e1b83a8f3486.var_9549d82a3fba4746.origin = player geteye() + 32 * vectornormalize(anglestoforward(player getplayerangles()));
            utility::delaythread(0.1, &function_30f5ea60517f9e06, level.var_61e6e1b83a8f3486.var_9549d82a3fba4746, player);
        }
    #/
}

// Namespace common_cache / namespace_3883e3399f2870b5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3982
// Size: 0x6b
function function_35b40f5e98dc4ee4(params) {
    /#
        cachebundlename = params[0];
        listbundlename = params[1];
        quantity = int(params[2]);
        function_7029bab8ebd74e1d(undefined);
        function_d71a41afca697376(level.var_61e6e1b83a8f3486.var_9549d82a3fba4746, listbundlename, quantity);
        function_803e6cfa13174264();
    #/
}

