// mwiii decomp prototype
#using script_7b2517368c79e5bc;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_639bf783929acf9b;
#using script_3e2f8cc477d57433;
#using script_4c770a9a4ad7659c;
#using script_600b944a95c3a7bf;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;

#namespace namespace_59a9ea269513a828;

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427
// Size: 0x20a
function function_62aa9a67eff644db() {
    level.var_989093b9a969783 = spawnstruct();
    level.var_989093b9a969783.scriptables = [];
    level.br_armory_kiosk_enabled = 0;
    level.var_11a3973390a71e8 = "";
    if (isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_d651598a91f20ae3)) {
        level.br_armory_kiosk_enabled = istrue(level.var_62f6f7640e4431e3.var_a005e276e98e5ed8);
        level.var_11a3973390a71e8 = level.var_62f6f7640e4431e3.var_383d2fae80ff311e;
        setomnvar("ui_buy_mode", istrue(level.var_62f6f7640e4431e3.var_5880a79f0328330b));
    }
    if (level.br_armory_kiosk_enabled) {
        level.var_e7cee4fbb5b46ef2 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(level.var_11a3973390a71e8);
        namespace_17c25f0877bfb620::scriptable_addusedcallback(&armorykioskused);
        namespace_17c25f0877bfb620::scriptable_addautousecallback(&armorykioskused);
        function_9bc69c26770d9533(&onarmorykioskpurchase);
        level.var_d03e6ba38b56b4ab = getdvarint(@"hash_e77ab3a32453ae92", 1);
        level.var_e9f7702d839b262c = getdvarint(@"hash_624b1f6964c696d", 180);
        level.var_f454c63919420aa9 = getdvarint(@"hash_69c62cae4d7929c9", 10);
        level.var_fb60f0244999d528 = getdvarint(@"hash_9c3612143e0ad401", 1);
        instances = getallspawninstances();
        if (isdefined(level.var_738bfbedf3eeea26)) {
            [[ level.var_738bfbedf3eeea26 ]](instances);
        } else {
            setspawninstances(instances);
            foreach (instance in instances) {
                function_51f6eab92b227b84(instance);
            }
        }
        function_b38f5ffe645943c3(level.var_11a3973390a71e8);
        _parsepurchaseitemtables();
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638
// Size: 0xc1
function function_b38f5ffe645943c3(var_1bd79a12120f1848) {
    setdvar(@"hash_f8e5c3daa6c01012", var_1bd79a12120f1848);
    level.var_e7cee4fbb5b46ef2 = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_1bd79a12120f1848);
    if (!isdefined(level.var_6be7b375ec4a629c)) {
        level.var_6be7b375ec4a629c = [];
    }
    foreach (var_eb7139726cc569b5 in level.var_6be7b375ec4a629c) {
        if (var_eb7139726cc569b5["index"] == level.var_e7cee4fbb5b46ef2) {
            return;
        }
    }
    level.var_6be7b375ec4a629c[level.var_6be7b375ec4a629c.size] = function_d84cdb7463425ba(var_1bd79a12120f1848);
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x700
// Size: 0x2b
function getallspawninstances() {
    if (!level.br_armory_kiosk_enabled) {
        return;
    }
    var_1eb07a39ff244cd5 = getentitylessscriptablearray("scriptable_br_plunder_box", "classname");
    return var_1eb07a39ff244cd5;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x733
// Size: 0x30
function setspawninstances(instances) {
    /#
        assert(isarray(instances));
    #/
    level.var_989093b9a969783.scriptables = instances;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76a
// Size: 0x56
function function_51f6eab92b227b84(instance) {
    buystation = spawnscriptable("br_plunder_box", instance.origin, instance.angles);
    buystation setscriptablepartstate("br_plunder_box", "visible");
    buystation.visible = 1;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c7
// Size: 0x82
function function_3058b3e95a1bf984(instance, player) {
    if (istrue(level.gameended)) {
        return 0;
    }
    if ((!player namespace_f8065cafc523dba5::_isalive() || istrue(player.inlaststand)) && !namespace_36f464722d326bbe::function_9cdaadfddeda4d7a()) {
        return 0;
    }
    if (player namespace_448ccf1ca136fbbe::isusingremote()) {
        return 0;
    }
    if (player namespace_f8065cafc523dba5::isinvehicle()) {
        return 0;
    }
    if (istrue(player.iscarrying)) {
        player function_ced51005e26102fa("MP/FIELD_UPGRADE_CANNOT_USE");
        return 0;
    }
    return 1;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x851
// Size: 0x143
function armorykioskused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!function_1414925deba056bc(instance.type, "kiosk")) {
        return;
    }
    if (istrue(var_a5b2c541413aa895) && !function_7e0281196d6407c8()) {
        return;
    }
    if (!isdefined(player)) {
        player = self;
    }
    if (istrue(var_a5b2c541413aa895) && !isdefined(player.armorykioskpurchaseallowed)) {
        player.armorykioskpurchaseallowed = 0;
    }
    if (!function_3058b3e95a1bf984(instance, player)) {
        if (istrue(var_a5b2c541413aa895)) {
            player.armorykioskpurchaseallowed = 0;
        }
        return;
    }
    if (istrue(var_a5b2c541413aa895)) {
        if (!player.armorykioskpurchaseallowed) {
            function_28d837f720b03bfa(instance, player);
        }
    } else {
        if (istrue(player.insertingarmorplate)) {
            player notify("try_armor_cancel");
        }
        if (!isdefined(state)) {
            player thread _runpurchasemenu(instance);
        } else if (state == "visible") {
            if (isdefined(instance)) {
                instance setscriptablepartstate("br_plunder_box", "opening");
                instance thread kioskfixupproneplayers();
            }
            player thread _runpurchasemenu(instance);
        } else if (state == "opening" || state == "open") {
            player thread _runpurchasemenu(instance);
        }
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99b
// Size: 0x11c
function function_d84cdb7463425ba(var_9023cea8f03e72d2) {
    var_eb7139726cc569b5 = [];
    var_3d329ebb0d03d6db = namespace_38b993c4618e76cd::function_54b046aa3ba2678a(var_9023cea8f03e72d2);
    var_eb7139726cc569b5["index"] = var_3d329ebb0d03d6db;
    var_eb7139726cc569b5["ref"] = var_9023cea8f03e72d2;
    var_eb7139726cc569b5["items"] = [];
    var_904eefa8f06ceecb = tablelookuprownum("mp/buyStation/buyStationDefs.csv", 0, var_3d329ebb0d03d6db);
    var_c6c26123001b9460 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 3);
    itemindex = 0;
    while (var_c6c26123001b9460 != "") {
        var_730dd4e55dee0cbb = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 4 + 4 * itemindex);
        if (var_730dd4e55dee0cbb != "") {
            var_eb7139726cc569b5["items"][var_c6c26123001b9460] = int(var_730dd4e55dee0cbb);
        } else {
            var_eb7139726cc569b5["items"][var_c6c26123001b9460] = -1;
        }
        var_188ded2ca8751cee = function_93cabb608eabdb7c(var_c6c26123001b9460);
        var_eb7139726cc569b5["items"][var_c6c26123001b9460] = isdefined(var_188ded2ca8751cee) ? var_eb7139726cc569b5["items"][var_c6c26123001b9460] : var_188ded2ca8751cee;
        itemindex++;
        var_c6c26123001b9460 = tablelookupbyrow("mp/buyStation/buyStationDefs.csv", var_904eefa8f06ceecb, 3 + 4 * itemindex);
    }
    return var_eb7139726cc569b5;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x12
function function_7e0281196d6407c8() {
    return getdvarint(@"hash_1696df050ad70202", 0);
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad9
// Size: 0x2b1
function _parsepurchaseitemtables() {
    if (!isdefined(level.var_6be7b375ec4a629c)) {
        level.var_6be7b375ec4a629c = [];
    }
    var_8c0c54c9e01403ca = getdvar(@"hash_894c0b1c4e700989");
    if (isdefined(var_8c0c54c9e01403ca) && var_8c0c54c9e01403ca != "") {
        var_3d321e8859561813 = array_randomize(strtok(var_8c0c54c9e01403ca, ","));
        for (var_3d329ebb0d03d6db = 0; var_3d329ebb0d03d6db < var_3d321e8859561813.size; var_3d329ebb0d03d6db++) {
            level.var_6be7b375ec4a629c[level.var_6be7b375ec4a629c.size] = function_d84cdb7463425ba(var_3d321e8859561813[var_3d329ebb0d03d6db]);
        }
    } else {
        level.var_6be7b375ec4a629c[level.var_6be7b375ec4a629c.size] = function_d84cdb7463425ba(level.var_11a3973390a71e8);
    }
    level.var_989093b9a969783.items = [];
    numrows = tablelookupgetnumrows("mp/buyStation/buyStationItems.csv");
    for (row = 0; row < numrows; row++) {
        itemindex = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 0));
        /#
            assert(!isdefined(level.var_989093b9a969783.items[itemindex]));
        #/
        var_97642cc850f90ca0 = spawnstruct();
        var_cb325ddb4a764623 = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 3);
        var_97642cc850f90ca0.var_2ce272546e3ae7f0 = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 1);
        var_97642cc850f90ca0.type = tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 2);
        var_97642cc850f90ca0.ref = var_cb325ddb4a764623;
        var_97642cc850f90ca0.cost = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 4));
        var_97642cc850f90ca0.cost = function_53c4c53197386572(function_93cabb608eabdb7c(var_97642cc850f90ca0.var_2ce272546e3ae7f0), var_97642cc850f90ca0.cost);
        var_97642cc850f90ca0.firesalediscount = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 10));
        var_97642cc850f90ca0.firesalediscount = function_53c4c53197386572(function_57e6c79279b89596(var_97642cc850f90ca0.var_2ce272546e3ae7f0), var_97642cc850f90ca0.firesalediscount);
        var_97642cc850f90ca0.perkdiscount = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 11));
        var_97642cc850f90ca0.var_144769f518d71226 = int(tablelookupbyrow("mp/buyStation/buyStationItems.csv", row, 12));
        if (isdefined(var_97642cc850f90ca0.var_144769f518d71226) && var_97642cc850f90ca0.var_144769f518d71226 > 0) {
        }
        level.var_989093b9a969783.items[itemindex] = var_97642cc850f90ca0;
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd91
// Size: 0x116
function kioskfixupproneplayers() {
    if (!getdvarint(@"hash_636451c6314df097", 1)) {
        return;
    }
    radius = getdvarfloat(@"hash_3990f3347374d18e", 300);
    var_a427ded21077317 = sortbydistancecullbyradius(level.players, self.origin, radius);
    foreach (player in var_a427ded21077317) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        if (player getstance() != "prone") {
            continue;
        }
        halfsize = player getboundshalfsize();
        radius = halfsize[0];
        height = 2 * halfsize[2];
        if (capsuletracepassed(player.origin, radius, height, undefined, 0, 0)) {
            continue;
        }
        player setstance("crouch", 1);
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeae
// Size: 0x1b0
function _runpurchasemenu(kiosk) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player.var_59a9ea269513a828 = kiosk;
    if (isdefined(level.var_6beff7b631ab7e18)) {
        [[ level.var_6beff7b631ab7e18 ]](kiosk, player);
    }
    var_25fa7366933d59f2 = player function_87072b42853a9c58("specialty_br_cheaper_kiosk");
    var_19f9a8eac6699ca9 = getdvarint(@"hash_b0634929cd39973b", 1);
    if (!isint(kiosk) && isdefined(kiosk.var_7940dcde72827af7)) {
        level.var_e7cee4fbb5b46ef2 = kiosk.var_7940dcde72827af7;
        player setclientomnvar("ui_buystation_override", kiosk.var_7940dcde72827af7);
    } else if (isdefined(level.var_4b3d0771df2c44a9) && !istrue(player.var_e5b7a6a0ec2b440e)) {
        level.var_e7cee4fbb5b46ef2 = level.var_4b3d0771df2c44a9;
        player setclientomnvar("ui_buystation_override", level.var_4b3d0771df2c44a9);
    }
    player setclientomnvar("ui_buystation_purchase_response", 0);
    var_254f655d3a722a22 = 0;
    if (istrue(player.var_59a9ea269513a828.var_746c06c00cd6bdc5)) {
        var_254f655d3a722a22 = var_254f655d3a722a22 + 16;
    } else {
        var_254f655d3a722a22 = var_254f655d3a722a22 + 2;
    }
    var_d47b7f992ca8a91e = isdefined(player.var_59a9ea269513a828) && iskioskfiresaleactiveforplayer(player.var_59a9ea269513a828, player);
    if (var_d47b7f992ca8a91e) {
        var_254f655d3a722a22 = var_254f655d3a722a22 + 4;
    }
    player setclientomnvar("ui_buystation_open", var_254f655d3a722a22);
    player.armorykioskpurchaseallowed = 1;
    player thread _watchtoautoclosemenu(kiosk);
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1065
// Size: 0x61
function _watchtoautoclosemenu(kiosk) {
    player = self;
    player endon("disconnect");
    player notify("_watchToAutoCloseMenu_end");
    player endon("_watchToAutoCloseMenu_end");
    player childthread _proximitywatcher(kiosk);
    waittill_any_ents(player, "death", player, "last_stand_start", player, "pushed_too_far", level, "game_ended");
    player _closepurchasemenuwithresponse(2);
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10cd
// Size: 0x39
function function_28d837f720b03bfa(kiosk, player) {
    player.var_59a9ea269513a828 = kiosk;
    player.armorykioskpurchaseallowed = 1;
    player thread function_ab62cd6135dfe6(kiosk);
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110d
// Size: 0x5c
function function_ab62cd6135dfe6(kiosk) {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player endon("death");
    player childthread function_59e987d44a301ef5(kiosk);
    waittill_any_ents(player, "last_stand_start", player, "exit_quick_purchase_zone");
    if (isdefined(player)) {
        player.armorykioskpurchaseallowed = 0;
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1170
// Size: 0x80
function function_59e987d44a301ef5(kiosk) {
    player = self;
    var_525b03beaf285c54 = getdvarint(@"hash_c37f7e3bb9eca843", 0);
    maxdistsquared = var_525b03beaf285c54 * var_525b03beaf285c54;
    while (1) {
        if (!isdefined(kiosk) || distancesquared(player.origin, kiosk.origin) > maxdistsquared) {
            player notify("exit_quick_purchase_zone");
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f7
// Size: 0x95
function _proximitywatcher(kiosk) {
    player = self;
    var_23d839b7d0ace88a = 64;
    var_525b03beaf285c54 = getdvarfloat(@"hash_ecd52993b5dab130", 128) + var_23d839b7d0ace88a;
    maxdistsquared = var_525b03beaf285c54 * var_525b03beaf285c54;
    while (1) {
        wait(0.1);
        var_77c977c78b3f7d84 = distancesquared(player.origin, kiosk.origin);
        if (var_77c977c78b3f7d84 > maxdistsquared) {
            player notify("pushed_too_far");
            break;
        }
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1293
// Size: 0x9b
function _closepurchasemenuwithresponse(var_97aa74c2193a9dc6) {
    player = self;
    if (var_97aa74c2193a9dc6 == 1 && getdvarint(@"hash_ed6e4ffa933af621", 0)) {
        return;
    }
    player setclientomnvar("ui_buystation_purchase_response", var_97aa74c2193a9dc6);
    player setclientomnvar("ui_buystation_open", 1);
    player setclientomnvar("ui_buystation_override", -1);
    namespace_141c4634b6ea7b27::function_fed77cd5c54efe19(player.var_c77002478cdfd85f, player);
    player.var_59a9ea269513a828 = undefined;
    player.var_e5b7a6a0ec2b440e = undefined;
    player.var_c77002478cdfd85f = undefined;
    player.armorykioskpurchaseallowed = undefined;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1335
// Size: 0x1d
function _purchasemenuclosedbyclient(player) {
    player _closepurchasemenuwithresponse(0);
    player notify("_watchToAutoCloseMenu_end");
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1359
// Size: 0xf6
function function_65b2a9d69f873524(var_cb325ddb4a764623, player) {
    var_a675d5026ecc0030 = level.var_e7cee4fbb5b46ef2;
    if (isplayer(player) && isdefined(player.var_59a9ea269513a828) && isdefined(player.var_59a9ea269513a828.var_7940dcde72827af7)) {
        var_a675d5026ecc0030 = player.var_59a9ea269513a828.var_7940dcde72827af7;
    }
    foreach (var_eb7139726cc569b5 in level.var_6be7b375ec4a629c) {
        if (var_eb7139726cc569b5["index"] == var_a675d5026ecc0030) {
            if (isdefined(var_eb7139726cc569b5["items"][var_cb325ddb4a764623]) && var_eb7139726cc569b5["items"][var_cb325ddb4a764623] > 0) {
                return var_eb7139726cc569b5["items"][var_cb325ddb4a764623];
            } else {
                return undefined;
            }
        }
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1456
// Size: 0x103
function _getactualcost(player, itemdata) {
    var_d47b7f992ca8a91e = 0;
    if (isdefined(player.var_59a9ea269513a828)) {
        var_d47b7f992ca8a91e = iskioskfiresaleactiveforplayer(player.var_59a9ea269513a828, player);
    }
    var_25fa7366933d59f2 = player function_87072b42853a9c58("specialty_br_cheaper_kiosk");
    var_150663def4f4145a = itemdata.cost;
    var_bbd3ced9f1e6acbf = function_65b2a9d69f873524(itemdata.var_2ce272546e3ae7f0, player);
    if (isdefined(var_bbd3ced9f1e6acbf)) {
        var_150663def4f4145a = var_bbd3ced9f1e6acbf;
    }
    var_1a61fa389340ae66 = getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", itemdata.ref, "_cost_override"), 0);
    if (var_1a61fa389340ae66 != 0) {
        var_150663def4f4145a = var_1a61fa389340ae66;
    }
    if (var_d47b7f992ca8a91e) {
        return _applysalesdiscount(var_150663def4f4145a, itemdata.firesalediscount);
    } else if (istrue(var_25fa7366933d59f2)) {
        return _applysalesdiscount(var_150663def4f4145a, itemdata.perkdiscount);
    }
    return var_150663def4f4145a;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1561
// Size: 0x57
function _applysalesdiscount(var_9d384a51d5f0a3cf, var_5805a52ec044f672) {
    if (!isdefined(var_5805a52ec044f672) || var_5805a52ec044f672 == 0) {
        return var_9d384a51d5f0a3cf;
    } else if (var_5805a52ec044f672 == 100) {
        return 0;
    }
    fraction = (100 - var_5805a52ec044f672) * 0.01;
    return int(floor(var_9d384a51d5f0a3cf * fraction + 0.5));
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c0
// Size: 0x36
function iskioskfiresaleactiveforplayer(kiosk, player) {
    if (isdefined(level.var_8337ff60938f1ed5) && [[ level.var_8337ff60938f1ed5 ]](kiosk, player)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fe
// Size: 0x549
function onarmorykioskpurchase(channel, var_1657e74c9190d2a2) {
    player = self;
    kiosk = player.var_59a9ea269513a828;
    if (!istrue(player.armorykioskpurchaseallowed)) {
        return;
    }
    if (channel == "br_cancel_purchase") {
        _purchasemenuclosedbyclient(player);
    } else if (channel == "br_item_purchase") {
        itemindex = var_1657e74c9190d2a2;
        /#
            assert(isdefined(level.var_989093b9a969783.items[itemindex]));
        #/
        itemdata = level.var_989093b9a969783.items[itemindex];
        cost = player _getactualcost(player, itemdata);
        cost = cost * function_53c4c53197386572(level.var_62f6f7640e4431e3.var_dc7ab0a22b829f8b, 10);
        var_fbe1c496c49a42bc = function_53c4c53197386572(function_98aedb8cf660c612(itemdata.var_2ce272546e3ae7f0), "essence");
        var_7dc72c180df9143b = undefined;
        if (player function_bcc79745d547a99c(var_fbe1c496c49a42bc, cost)) {
            itemtype = itemdata.type;
            if (itemtype == "fieldupgrade") {
                itemtype = "super";
            } else if (itemdata.var_2ce272546e3ae7f0 == "armorBundle") {
                itemtype = "armor";
                var_f6b61ad6f51a3eda = player namespace_2abc885019e1956::function_cca8bbe88a39ad41(itemtype);
                if ([[ var_f6b61ad6f51a3eda.var_381daafc5fc31b7f ]]()) {
                    var_636981592f381ebf = spawnstruct();
                    var_636981592f381ebf.type = "brloot_armor_plate";
                    var_636981592f381ebf.count = 5;
                    var_636981592f381ebf.var_a6293f3144240b99 = 1;
                    player [[ var_f6b61ad6f51a3eda.usefunc ]](undefined, var_636981592f381ebf, 0);
                    var_fbe1c496c49a42bc = function_53c4c53197386572(function_98aedb8cf660c612(itemdata.var_2ce272546e3ae7f0), "essence");
                    player namespace_7dfc6454a70f3f39::function_a06aa3b8c98e131e(var_fbe1c496c49a42bc, cost, #"buystation", itemdata.var_2ce272546e3ae7f0);
                    if (!isdefined(self.pers["currency_spent"])) {
                        self.pers["currency_spent"] = cost;
                    } else {
                        self.pers["currency_spent"] = self.pers["currency_spent"] + cost;
                    }
                }
                return;
            } else if (itemdata.var_2ce272546e3ae7f0 == "reviveToken") {
                var_7dc72c180df9143b = "brloot_self_revive";
            }
            var_3719061529ddd848 = function_53c4c53197386572(var_7dc72c180df9143b, itemdata.ref);
            var_fbe755f0978c0369 = namespace_2abc885019e1956::function_61d960957fcf3ca0(var_3719061529ddd848);
            /#
                assertex(isdefined(var_fbe755f0978c0369), "An ItemSpawnEntry Bundle with ref " + var_3719061529ddd848 + " not found in global item list!");
            #/
            itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
            var_91839babd32261f4 = itembundle.scriptable;
            var_636981592f381ebf = spawnstruct();
            var_636981592f381ebf.type = var_91839babd32261f4;
            var_636981592f381ebf.count = 1;
            var_636981592f381ebf.var_a6293f3144240b99 = 1;
            if (isdefined(itembundle.spawncount)) {
                var_636981592f381ebf.count = itembundle.spawncount;
            }
            lootid = namespace_2abc885019e1956::function_6d15e119c2779a93(itembundle);
            var_84ab4c28dc11052d = player namespace_2abc885019e1956::function_576728d3d4486bd6(var_636981592f381ebf, 0, 1);
            if (!var_84ab4c28dc11052d) {
                player function_a2560fe66d697e02(itembundle, var_636981592f381ebf.count);
            }
            player dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:0, 2:"stowed", 3:0, 4:"equipped", 5:0, 6:"bought", 7:lootid, 8:"sold", 9:0, 10:"type", 11:itembundle.type, 12:"from_cache", 13:0, 14:"from_rift_reward", 15:0]);
            var_fbe1c496c49a42bc = function_53c4c53197386572(function_98aedb8cf660c612(itemdata.var_2ce272546e3ae7f0), "essence");
            player namespace_7dfc6454a70f3f39::function_a06aa3b8c98e131e(var_fbe1c496c49a42bc, cost, #"buystation", var_3719061529ddd848);
            if (!isdefined(self.pers["currency_spent"])) {
                self.pers["currency_spent"] = cost;
            } else {
                self.pers["currency_spent"] = self.pers["currency_spent"] + cost;
            }
        }
    } else if (channel == "br_team_revive") {
        if (isdefined(level.var_6d368866ba58bb04)) {
            player thread [[ level.var_6d368866ba58bb04 ]](var_1657e74c9190d2a2);
        }
    } else if (channel == "sell_item") {
        itemindex = namespace_feea61bc660e9e0f::function_4953ec8e37aa67b8(var_1657e74c9190d2a2);
        function_8e857ffadd6d1af2(self, itemindex);
    } else if (channel == "sell_all_item") {
        itemindex = namespace_feea61bc660e9e0f::function_4953ec8e37aa67b8(var_1657e74c9190d2a2);
        function_8e857ffadd6d1af2(self, itemindex, 1);
    } else if (channel == "sell_all_valuables") {
        for (itemindex = 0; itemindex < namespace_feea61bc660e9e0f::function_1b35b10884bd8d67(); itemindex++) {
            function_8e857ffadd6d1af2(self, itemindex, 1);
        }
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4e
// Size: 0xa3
function function_38859e49d1ac69a0(var_cb325ddb4a764623) {
    var_5ef3cbc8ae1f14da = namespace_7dfc6454a70f3f39::function_2e815a7b6d0bbcf6();
    if (isdefined(var_5ef3cbc8ae1f14da) && isdefined(var_5ef3cbc8ae1f14da.var_36a99886b712dcc3)) {
        foreach (var_4badbf1f7702e897 in var_5ef3cbc8ae1f14da.var_36a99886b712dcc3) {
            if (isdefined(var_4badbf1f7702e897.var_3fd8eff0621723c9) && var_4badbf1f7702e897.var_3fd8eff0621723c9 == var_cb325ddb4a764623) {
                return var_4badbf1f7702e897;
            }
        }
    }
}

// Namespace namespace_59a9ea269513a828/namespace_f6aa44081e6af0a8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf8
// Size: 0x26e
function function_8e857ffadd6d1af2(player, itemslotindex, var_5c31c74d6d007e20) {
    lootid = namespace_feea61bc660e9e0f::function_d870b2c45335bd88(itemslotindex);
    if (!isdefined(lootid) || lootid == 0) {
        return;
    }
    var_9fb3b576439ee3d = 1;
    quantity = namespace_feea61bc660e9e0f::function_5ce7fe3dca9c1a22(itemslotindex);
    if (istrue(var_5c31c74d6d007e20)) {
        var_9fb3b576439ee3d = quantity;
    }
    itembundle = namespace_2abc885019e1956::function_f4a303d532b044a7(lootid);
    if (!isdefined(itembundle)) {
        return;
    }
    var_cb325ddb4a764623 = itembundle.ref;
    var_b1f734ded9a2721a = function_38859e49d1ac69a0(var_cb325ddb4a764623);
    if (isdefined(var_cb325ddb4a764623) && isdefined(var_b1f734ded9a2721a) && isdefined(var_b1f734ded9a2721a.var_af40863a32d7792b)) {
        var_62f6f7640e4431e3 = function_90b5b6e99aef29d6();
        if (isdefined(var_62f6f7640e4431e3.var_dc7ab0a22b829f8b)) {
            goto LOC_00000123;
        }
        var_5e2bb202ae259b31 = 1;
        var_b87f7fae01ce754f = var_9fb3b576439ee3d * var_b1f734ded9a2721a.var_af40863a32d7792b * var_5e2bb202ae259b31;
        var_74806f0c4caa7e55 = var_9fb3b576439ee3d;
        player dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:0, 2:"stowed", 3:0, 4:"equipped", 5:0, 6:"bought", 7:0, 8:"sold", 9:lootid, 10:"type", 11:itembundle.type, 12:"from_cache", 13:0, 14:"from_rift_reward", 15:0]);
        var_3a170f7970116182 = namespace_7dfc6454a70f3f39::function_7714028270738890(var_b1f734ded9a2721a.var_38d055f24fe64e71);
        if (isdefined(var_3a170f7970116182)) {
            player namespace_7dfc6454a70f3f39::function_3036cef61495210f(var_3a170f7970116182.var_54d8fe06789b6851, var_b87f7fae01ce754f, #"sold");
        }
        player namespace_feea61bc660e9e0f::function_ca3bbb1070436540(itemslotindex, lootid, quantity - var_74806f0c4caa7e55);
        params = spawnstruct();
        params.bundle = function_f4a303d532b044a7(lootid);
        params.ref = var_cb325ddb4a764623;
        params.value = var_b87f7fae01ce754f;
        params.var_6d5e047412a465f6 = var_9fb3b576439ee3d;
        params.lootid = lootid;
        player callback::callback("kiosk_item_sold", params);
    }
}

