#using script_4a6760982b403bad;
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_df8619195fc40564;

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x38d
// Size: 0x14
function autoexec main() {
    if (function_966592fd716d49c7()) {
        level thread init();
    }
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9
// Size: 0x230
function init() {
    scripts\engine\utility::flag_wait("StartGameTypeCallbackFinished");
    level.brgametype.funcs["gametype_playerSkipLootPickup"] = function_66547e66a2b08887();
    br_gametypes::registerbrgametypefunc("playerSkipLootPickup", &function_f63e1b41fa5a17c2);
    scripts\common\callbacks::add("player_laststand", &function_58d9289c9acdaeea);
    namespace_c45ac99c4997e722::function_aacbbe63c26687ae("callback_on_player_disconnect", &function_4db3546069329f65);
    data = {#var_5906e41821492604:getdvarfloat(@"hash_37a735f07dd52591", 30), #var_7f690041736d1745:getdvarint(@"hash_2a96a526539660d9", 1), #var_7f68ff41736d1512:getdvarint(@"hash_2a96a42653965ea6", 1), #var_7f68fe41736d12df:getdvarint(@"hash_2a96a32653965c73", 1), #var_418ff618f3c6dc2b:getdvarint(@"hash_386426fc418b587", 70), #var_be7622c02935a66a:getdvarint(@"hash_d9c75527a8a3b196", 35), #var_16630219f522fbfd:getdvarint(@"hash_16e59a25821b3959", 18), #var_e8edf587848c8dc8:getdvarfloat(@"hash_578a68f695a05de1", 1), #var_4c4983e0f968f962:getdvarfloat(@"hash_2c8d0365dcf561b9", 1)};
    data.total_weight = data.var_7f68fe41736d12df + data.var_7f68ff41736d1512 + data.var_7f690041736d1745;
    data.var_4627e239ff61c3a4 = data.var_7f68fe41736d12df;
    data.var_9c1ac3ff672f6aeb = data.var_4627e239ff61c3a4 + data.var_7f68ff41736d1512;
    data.var_a4ebea363984ff0a = data.var_9c1ac3ff672f6aeb + data.var_7f690041736d1745;
    if (data.var_4c4983e0f968f962 > 0 || data.var_e8edf587848c8dc8 > 0) {
        level scripts\common\callbacks::add("cache_opened", &function_82dd024933a0589b);
    }
    data.var_4f46572d79619f08 = [];
    level.brgametype.var_43e5bc47c95e5eaa = data;
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e1
// Size: 0x2b
function function_66547e66a2b08887() {
    func = br_gametypes::function_ac438828015a7653("playerSkipLootPickup");
    if (isdefined(func)) {
        br_gametypes::function_ec416fa15d5fa6af("playerSkipLootPickup");
    }
    return func;
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x615
// Size: 0x83
function function_f63e1b41fa5a17c2(instance, var_a5b2c541413aa895) {
    if (function_62ce99100d3b18d7(instance)) {
        var_4a37328f1e38526f = {#stackable:1, #instance:instance, #var_858c2336404e0adb:instance.var_139a5104ce9ea08, #scriptablename:instance.type};
        thread function_1811cb2925fd547f(var_4a37328f1e38526f, self);
        return true;
    }
    if (function_942c15c40dfc67c5(instance, var_a5b2c541413aa895)) {
        return true;
    }
    return false;
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a1
// Size: 0x34
function function_62ce99100d3b18d7(instance) {
    if (!isdefined(instance)) {
        return false;
    }
    if (!isdefined(instance.type)) {
        return false;
    }
    return instance.type == "brloot_jup_trickrtreat_loot_br";
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6de
// Size: 0x44
function function_942c15c40dfc67c5(instance, var_a5b2c541413aa895) {
    var_3813ae19f235166e = level.brgametype.funcs["gametype_playerSkipLootPickup"];
    if (!isdefined(var_3813ae19f235166e)) {
        return 0;
    }
    return [[ var_3813ae19f235166e ]](instance, var_a5b2c541413aa895);
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x72b
// Size: 0x2cb
function function_1811cb2925fd547f(pickupent, player) {
    if (!isdefined(pickupent.var_858c2336404e0adb)) {
        return;
    }
    if (isdefined(pickupent.instance)) {
        pickupent.instance notify("trick_r_treat_item_grabbed");
    }
    switch (pickupent.var_858c2336404e0adb) {
    case 1:
        var_c7f73e2e97e4e242 = "event_trick_r_treat_pickup_size_1";
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_16630219f522fbfd;
        if (!isdefined(level.var_ee9bfea6c204ee1b)) {
            level.var_ee9bfea6c204ee1b = 0;
        }
        if (!isdefined(level.var_bc629c5fff0af845)) {
            level.var_bc629c5fff0af845 = 0;
        }
        level.var_ee9bfea6c204ee1b += 1;
        level.var_bc629c5fff0af845 += var_37c686d832361fe;
        break;
    case 2:
        var_c7f73e2e97e4e242 = "event_trick_r_treat_pickup_size_2";
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_be7622c02935a66a;
        if (!isdefined(level.var_35f93f47b6c8e7d6)) {
            level.var_35f93f47b6c8e7d6 = 0;
        }
        if (!isdefined(level.var_64479d98631b7f44)) {
            level.var_64479d98631b7f44 = 0;
        }
        level.var_35f93f47b6c8e7d6 += 1;
        level.var_64479d98631b7f44 += var_37c686d832361fe;
        break;
    case 3:
        var_c7f73e2e97e4e242 = "event_trick_r_treat_pickup_size_3";
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_418ff618f3c6dc2b;
        if (!isdefined(level.var_de86cab269eaee61)) {
            level.var_de86cab269eaee61 = 0;
        }
        if (!isdefined(level.var_ea4ec8e5a8b097ab)) {
            level.var_ea4ec8e5a8b097ab = 0;
        }
        level.var_de86cab269eaee61 += 1;
        level.var_ea4ec8e5a8b097ab += var_37c686d832361fe;
        break;
    default:
        return;
    }
    player playsoundtoplayer("mp_trickrtreat_candy_pickup_player", player);
    foreach (member in teams::getteamdata(player.team, "players")) {
        member challenges::function_8359cadd253f9604(member, "event_trt_candy", var_37c686d832361fe);
        member function_f4ece2f5710ac25d(var_c7f73e2e97e4e242, var_37c686d832361fe);
        member function_1ac58bbf0d8016e0(var_c7f73e2e97e4e242, var_37c686d832361fe);
    }
    pickupent.count = var_37c686d832361fe;
    player thread br_pickups::updatelootsplash(pickupent);
    pickupent.instance function_9164434410455503();
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe
// Size: 0x16a
function function_1ac58bbf0d8016e0(var_c7f73e2e97e4e242, var_37c686d832361fe) {
    switch (var_c7f73e2e97e4e242) {
    case #"hash_81b8cc01a2cfddb6":
        if (!isdefined(self.var_ee9bfea6c204ee1b)) {
            self.var_ee9bfea6c204ee1b = 0;
        }
        if (!isdefined(self.var_bc629c5fff0af845)) {
            self.var_bc629c5fff0af845 = 0;
        }
        self.var_ee9bfea6c204ee1b += 1;
        self.var_bc629c5fff0af845 += var_37c686d832361fe;
        break;
    case #"hash_81b8cb01a2cfdc23":
        if (!isdefined(self.var_35f93f47b6c8e7d6)) {
            self.var_35f93f47b6c8e7d6 = 0;
        }
        if (!isdefined(self.var_64479d98631b7f44)) {
            self.var_64479d98631b7f44 = 0;
        }
        self.var_35f93f47b6c8e7d6 += 1;
        self.var_64479d98631b7f44 += var_37c686d832361fe;
        break;
    case #"hash_81b8ca01a2cfda90":
        if (!isdefined(self.var_de86cab269eaee61)) {
            self.var_de86cab269eaee61 = 0;
        }
        if (!isdefined(self.var_ea4ec8e5a8b097ab)) {
            self.var_ea4ec8e5a8b097ab = 0;
        }
        self.var_de86cab269eaee61 += 1;
        self.var_ea4ec8e5a8b097ab += var_37c686d832361fe;
        break;
    default:
        assertmsg("<dev string:x1c>" + var_c7f73e2e97e4e242);
        break;
    }
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb70
// Size: 0xb5
function function_f4ece2f5710ac25d(var_c7f73e2e97e4e242, var_37c686d832361fe) {
    if (!isdefined(self.pers["event_collectables"])) {
        self.pers["event_collectables"] = [];
    }
    if (!isdefined(self.pers["event_collectables"]["total_collectable_1"])) {
        self.pers["event_collectables"]["total_collectable_1"] = 0;
    }
    self.pers["event_collectables"]["total_collectable_1"] = self.pers["event_collectables"]["total_collectable_1"] + var_37c686d832361fe;
    self setclientomnvar("ui_collectable_1", self.pers["event_collectables"]["total_collectable_1"]);
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc2d
// Size: 0xa3
function function_82dd024933a0589b(params) {
    if (!isdefined(params.instance) || !isdefined(params.instance.type)) {
        return;
    }
    cache = params.instance;
    if (cache.type == "cache_cash_register" || cache.type == "cache_cash_register_clean") {
        return;
    }
    if (cache.type == "br_loot_cache_lege") {
        cache thread function_f1a38fadc58ab58e(1);
        return;
    }
    cache thread function_f1a38fadc58ab58e(0);
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcd8
// Size: 0x3ba
function function_f1a38fadc58ab58e(var_ae6997ab375ec9b9) {
    item_type = function_87e6f229c311f09d(var_ae6997ab375ec9b9);
    if (!isdefined(item_type)) {
        return;
    }
    item_name = "brloot_jup_trickrtreat_loot_br";
    itemcount = function_8714ed6e53659d09(item_type);
    origin_offset = level.br_pickups.translationoffset[item_name];
    var_57acadc40b2f0a8 = scripts\mp\gametypes\br_lootcache::function_cb377a5e11eef62c(self);
    var_76dab7c9f7071d23 = var_57acadc40b2f0a8[1];
    var_9068aa2452d21e44 = var_57acadc40b2f0a8[0];
    var_9068aa2452d21e44 = isdefined(var_9068aa2452d21e44) ? var_9068aa2452d21e44 : 90;
    var_76dab7c9f7071d23 = isdefined(var_76dab7c9f7071d23) ? var_76dab7c9f7071d23 : self.origin;
    drop_struct = br_pickups::function_7b9f3966a7a42003();
    drop_info = br_pickups::getitemdroporiginandangles(drop_struct, var_76dab7c9f7071d23 + origin_offset, self.angles, undefined, var_9068aa2452d21e44, 65);
    item = scripts\mp\gametypes\br_pickups::spawnpickup(item_name, drop_info, itemcount, undefined, undefined, 1);
    item function_3f2db024d45c9b77(item_type);
    item.var_139a5104ce9ea08 = item_type;
    if (!isdefined(item)) {
        return;
    }
    switch (item.var_139a5104ce9ea08) {
    case 1:
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_16630219f522fbfd;
        if (!isdefined(level.var_509a4e442b1026ae)) {
            level.var_509a4e442b1026ae = 0;
        }
        if (!isdefined(level.var_3d9321fad7de61fc)) {
            level.var_3d9321fad7de61fc = 0;
        }
        level.var_509a4e442b1026ae += 1;
        level.var_3d9321fad7de61fc += var_37c686d832361fe;
        break;
    case 2:
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_be7622c02935a66a;
        if (!isdefined(level.var_ef645306c7d37997)) {
            level.var_ef645306c7d37997 = 0;
        }
        if (!isdefined(level.var_a57db3076bd3b939)) {
            level.var_a57db3076bd3b939 = 0;
        }
        level.var_ef645306c7d37997 += 1;
        level.var_a57db3076bd3b939 += var_37c686d832361fe;
        break;
    case 3:
        var_37c686d832361fe = level.brgametype.var_43e5bc47c95e5eaa.var_418ff618f3c6dc2b;
        if (!isdefined(level.var_f32504269cbbbe30)) {
            level.var_f32504269cbbbe30 = 0;
        }
        if (!isdefined(level.var_4870c7ef3543bfe)) {
            level.var_4870c7ef3543bfe = 0;
        }
        level.var_f32504269cbbbe30 += 1;
        level.var_4870c7ef3543bfe += var_37c686d832361fe;
        break;
    default:
        return;
    }
    if (isdefined(drop_info.groundentity)) {
        switch (item.var_139a5104ce9ea08) {
        case 1:
            item setscriptablepartstate(item_name, "small_no_hover");
            break;
        case 2:
            item setscriptablepartstate(item_name, "medium_no_hover");
            break;
        case 3:
            item setscriptablepartstate(item_name, "large_no_hover");
            break;
        default:
            return;
        }
    }
    level.brgametype.var_43e5bc47c95e5eaa.var_4f46572d79619f08 = utility::array_add(level.brgametype.var_43e5bc47c95e5eaa.var_4f46572d79619f08, item);
    item.removecallback = &function_9164434410455503;
    item thread function_f63a9b7a5777ae20();
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109a
// Size: 0xc8
function function_87e6f229c311f09d(var_3f5eb02b04381c62) {
    data = level.brgametype.var_43e5bc47c95e5eaa;
    var_a784bbbf991f4ad5 = data.var_4c4983e0f968f962;
    if (istrue(var_3f5eb02b04381c62)) {
        var_a784bbbf991f4ad5 = data.var_e8edf587848c8dc8;
    }
    drop = randomfloat(1);
    if (drop <= var_a784bbbf991f4ad5) {
        drop = randomfloat(data.total_weight);
        if (drop <= data.var_4627e239ff61c3a4) {
            item_type = 1;
        } else if (drop > data.var_4627e239ff61c3a4 && drop <= data.var_9c1ac3ff672f6aeb) {
            item_type = 2;
        } else {
            item_type = 3;
        }
        return item_type;
    }
    return undefined;
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x116b
// Size: 0x91
function function_f63a9b7a5777ae20() {
    level endon("game_ended");
    self endon("trick_r_treat_item_grabbed");
    self endon("deleted");
    var_216ef833814cb51f = level.brgametype.var_43e5bc47c95e5eaa.var_5906e41821492604 - 5 - 1;
    for (i = 0; i < level.brgametype.var_43e5bc47c95e5eaa.var_5906e41821492604; i++) {
        if (i > var_216ef833814cb51f) {
            wait 0.5;
            wait 0.5;
            continue;
        }
        wait 1;
    }
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1204
// Size: 0x158
function function_58d9289c9acdaeea(params) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("laststand_revived");
    while (true) {
        var_e8e917654ca10e45 = sortbydistancecullbyradius(level.brgametype.var_43e5bc47c95e5eaa.var_4f46572d79619f08, self.origin, 256);
        var_43e18ab9cf2b459a = [];
        foreach (item in var_e8e917654ca10e45) {
            if (isdefined(item)) {
                if (distancesquared(self.origin, item.origin) <= squared(50)) {
                    var_43e18ab9cf2b459a[var_43e18ab9cf2b459a.size] = item;
                }
            }
        }
        foreach (item in var_43e18ab9cf2b459a) {
            if (isdefined(item)) {
                var_4a37328f1e38526f = {#instance:item, #var_858c2336404e0adb:item.var_139a5104ce9ea08};
                function_1811cb2925fd547f(var_4a37328f1e38526f, self);
            }
        }
        wait 0.2;
    }
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1364
// Size: 0xb
function function_4db3546069329f65(data) {
    
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1377
// Size: 0x92
function function_8714ed6e53659d09(itemsize) {
    switch (itemsize) {
    case 1:
        return level.brgametype.var_43e5bc47c95e5eaa.var_16630219f522fbfd;
    case 2:
        return level.brgametype.var_43e5bc47c95e5eaa.var_be7622c02935a66a;
    case 3:
        return level.brgametype.var_43e5bc47c95e5eaa.var_418ff618f3c6dc2b;
    }
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1411
// Size: 0x5b
function function_9164434410455503() {
    level.brgametype.var_43e5bc47c95e5eaa.var_4f46572d79619f08 = utility::array_remove(level.brgametype.var_43e5bc47c95e5eaa.var_4f46572d79619f08, self);
    deregisterscriptableinstance(self);
    self notify("deleted");
    self freescriptable();
}

// Namespace namespace_df8619195fc40564 / namespace_cf7203615547a87b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1474
// Size: 0x5e
function function_3f2db024d45c9b77(reward) {
    scriptablename = "brloot_jup_trickrtreat_loot_br";
    if (reward == 1) {
        self setscriptablepartstate(scriptablename, "small");
        return;
    }
    if (reward == 2) {
        self setscriptablepartstate(scriptablename, "medium");
        return;
    }
    if (reward == 3) {
        self setscriptablepartstate(scriptablename, "large");
    }
}

