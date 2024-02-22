// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_261e315c49e5e4ef;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\utility\game.gsc;
#using script_46cf752d93dc17b;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_d2cdf0e410334eae;

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x382
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("lootcratedrop", &function_a84cf6614b8b31e);
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0xde
function function_a84cf6614b8b31e(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.validatefunc = &function_a78763ea0cf7510e;
    var_7ec7671a1e0c788f.activatefunc = &function_71b5f57cd836a45d;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_e85cf8591ec416e4;
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("plunder_crate");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "plunder_crate");
    namespace_3c37cb17ade254d::registersharedfunc("br_cashcrate", "cashCrate_onCrateUse", &function_fc6fffaed5b50c85);
    namespace_d76af9f804655767::registerpublicevent(11, var_7ec7671a1e0c788f);
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x482
// Size: 0xc
function function_18219ca9d9602f6(config) {
    
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x495
// Size: 0xc
function function_51c524af89207cd5(config) {
    
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0x12
function function_e85cf8591ec416e4() {
    thread function_fae94a598dce531e();
    function_c9e871d29702e8cf();
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c1
// Size: 0xa
function function_87e6691e7d8c03ac() {
    function_c9e871d29702e8cf();
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2
// Size: 0xa
function function_a77e39e3a8937837() {
    function_c9e871d29702e8cf();
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e3
// Size: 0x6f
function function_c9e871d29702e8cf() {
    if (isdefined(level.var_9b34d707b8d9d76)) {
        return;
    }
    level.var_9b34d707b8d9d76 = 1;
    game["dialog"]["cash_drop"] = "cash_grav_ncmn";
    game["dialog"]["weapon_drop"] = "drop_resupply";
    game["dialog"]["medical_drop"] = "medical_announcement";
    level.conf_fx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559
// Size: 0x5
function function_a78763ea0cf7510e() {
    return 1;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x566
// Size: 0x5
function function_1d60c987a31953a6() {
    return 1;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x573
// Size: 0x5
function function_599c8b86b0fede65() {
    return 1;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580
// Size: 0xc
function function_71b5f57cd836a45d() {
    function_be12b3d2a01e1295(3);
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x593
// Size: 0xc
function function_183f7f5ceb7a8f3b() {
    function_be12b3d2a01e1295(1);
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a6
// Size: 0xc
function function_921e8477fdbb38ba() {
    function_be12b3d2a01e1295(2);
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b9
// Size: 0x1e1
function function_be12b3d2a01e1295(var_afb1e307ca3c0ed7) {
    level.var_6a7847bed8f16264 = getdvarfloat(@"hash_302f97714cae9d45", 1);
    var_7ce5358b6afbdf68 = spawnstruct();
    switch (var_afb1e307ca3c0ed7) {
    case 3:
        level.var_eaf636cc14e840ae = getdvarint(@"hash_73e1b59a77872e46", 15000);
        level thread namespace_479f2912131dabfc::init();
        level thread namespace_6c578d6ef48f10ef::function_53a94fee5954af57();
        var_7ce5358b6afbdf68.var_b5af62407c69adc9 = "battle_royale_cash_crate";
        var_7ce5358b6afbdf68.var_5411956fb9cdc64d = "active";
        var_7ce5358b6afbdf68.var_cf327c477c7cd3f0 = "cashdrop_common_world";
        var_7ce5358b6afbdf68.var_2833481bef266a60 = "on";
        var_7ce5358b6afbdf68.var_73028fdd377ed0c4 = "br_plunder_pe_cash_drop_active";
        var_7ce5358b6afbdf68.var_548d317a24c84e75 = "splash_list_jup_br";
        var_7ce5358b6afbdf68.var_7a39e7c938990279 = "cash_drop";
        level.var_2831ff636b688bf5 = 0;
        break;
    }
    leveldata = namespace_6c578d6ef48f10ef::getleveldata(var_7ce5358b6afbdf68.var_b5af62407c69adc9);
    leveldata.capturestring = "MP/GENERIC_LOOT_CRATE_CAPTURE";
    leveldata.minimapicon = undefined;
    if (isdefined(leveldata.var_c9042cdfe65fb49d)) {
        var_7ce5358b6afbdf68.var_5411956fb9cdc64d = leveldata.var_c9042cdfe65fb49d;
    }
    if (!istrue(leveldata.var_a07a6cc29e3b5458) && isdefined(var_7ce5358b6afbdf68.var_73028fdd377ed0c4)) {
        namespace_d76af9f804655767::showsplashtoall(var_7ce5358b6afbdf68.var_73028fdd377ed0c4, var_7ce5358b6afbdf68.var_548d317a24c84e75);
    }
    namespace_d3d40f75bb4e4c32::brleaderdialog(var_7ce5358b6afbdf68.var_7a39e7c938990279, 1);
    numcrates = getdvarint(@"hash_3cb6406502812dc6", 10);
    level.var_2a89743460772ea0 = [];
    namespace_f51c41a139e03299::function_607167c18661377b([0:1], "pe_crate_drop");
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a1
// Size: 0x30e
function function_1e632783fe9d057d(var_8ee83e2cbd3d747d, dropstruct) {
    leveldata = namespace_6c578d6ef48f10ef::getleveldata("battle_royale_cash_crate");
    var_5d11a6a17e49fdb3 = undefined;
    var_8df771dfd9cc0975 = undefined;
    cratetype = "battle_royale_cash_crate";
    var_ed2c1553ca1bd30b = (var_8ee83e2cbd3d747d[0], var_8ee83e2cbd3d747d[1], 0) + (0, 0, level.var_5d2af95280a3cf58);
    var_90d4fe050e6864d4 = (0, randomfloat(360), 0);
    var_ddb9d36f435ad444 = var_8ee83e2cbd3d747d;
    crate = namespace_6c578d6ef48f10ef::dropcrate(var_5d11a6a17e49fdb3, var_8df771dfd9cc0975, cratetype, var_ed2c1553ca1bd30b, var_90d4fe050e6864d4, var_ddb9d36f435ad444);
    if (!isdefined(crate)) {
        return;
    }
    if (!istrue(leveldata.var_9ea9e33fa2a90171)) {
        crate setscriptablepartstate("trail", "active", 0);
        crate.smokesignal = spawn("script_model", var_ed2c1553ca1bd30b + (0, 0, 58));
        crate.smokesignal setmodel("ks_airdrop_crate_br");
        crate.smokesignal linkto(crate);
        crate.smokesignal setscriptablepartstate("smoke_trail", "on");
    }
    var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(crate);
    var_ef5d5141fdb51174.usetimeoverride = level.var_6a7847bed8f16264;
    objid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    if (objid != -1) {
        crate setscriptablepartstate("objective_map", "hidden");
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "current", crate.origin, "ui_map_icon_cash_drop");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 5);
        namespace_5a22b6f3a56f7e9b::function_d7e3c4a08682c1b9(objid, 1);
        namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, crate);
        namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(objid, 75);
        namespace_5a22b6f3a56f7e9b::function_2946e9eb07acb3f1(objid, "MP_BR_INGAME/CASH_DROP");
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
        namespace_5a22b6f3a56f7e9b::function_98ba077848896a3(objid, 1);
        var_fbe99be3716910ed = getdvarint(@"hash_db57480d855ab212", 20000);
        namespace_5a22b6f3a56f7e9b::function_f21e9b2e78de984b(objid, var_fbe99be3716910ed, var_fbe99be3716910ed + 1000);
        namespace_5a22b6f3a56f7e9b::function_846c2acd91309cd8(objid, 151, 171, 128);
        foreach (player in level.players) {
            if (isalive(player) && !isbot(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
            }
        }
        crate.var_7b5e5c2bbc8f9f79 = objid;
    } else {
        crate setscriptablepartstate("objective_map", "cashdrop_common_world");
    }
    crate.nevertimeout = 1;
    crate.var_13ba232eee7e6069 = "ks_airdrop_crate_br";
    level.var_2a89743460772ea0[level.var_2a89743460772ea0.size] = crate;
    return crate;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab7
// Size: 0x137
function function_fc6fffaed5b50c85(player) {
    self.itemsdropped = 0;
    if (!isdefined(level.var_87252118c429bd32)) {
        level.var_87252118c429bd32 = 0;
    } else {
        level.var_87252118c429bd32 = (level.var_87252118c429bd32 + 1) % 10;
    }
    items = getscriptcachecontents("pe_crate_drop", level.var_87252118c429bd32);
    if (isdefined(items) && player namespace_82dcd1d5ae30ff7::_hasperk("specialty_br_extra_killstreak_chance")) {
        items = namespace_1b7e64f50cca9321::lootcontentsadjustkillchain(items, player);
    }
    if (isdefined(items)) {
        var_e05413a53b5d9167 = namespace_1b7e64f50cca9321::lootcachespawncontents(items, 0, player);
    }
    if (!isdefined(player.lootcachesopened)) {
        player.lootcachesopened = 1;
    } else {
        player.lootcachesopened++;
    }
    if (isdefined(self.var_7b5e5c2bbc8f9f79)) {
        objective_delete(self.var_7b5e5c2bbc8f9f79);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.var_7b5e5c2bbc8f9f79);
        self.var_7b5e5c2bbc8f9f79 = undefined;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "risk" || namespace_cd0b2d039510b38d::getsubgametype() == "plunder") {
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("lootCachesOpened", player.lootcachesopened);
    }
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf5
// Size: 0xbd
function function_fae94a598dce531e() {
    level waittill("br_supply_drops_init");
    dropstruct = namespace_fd99f400a596934b::function_69b2e5235bfb7998("pe_crate_drop", "military_carepackage_03_br", undefined, &function_fc6fffaed5b50c85);
    dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("pe_crate_drop", "spawnDropCrate", &function_1e632783fe9d057d);
    dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("pe_crate_drop", "onPlayerEnterGulag", &function_ae1a3e74689d656a);
    dropstruct namespace_fd99f400a596934b::function_80e49e34fc8d70b8("pe_crate_drop", "onPlayerRespawn", &onplayerrespawn);
    dropstruct.var_30daf66a65a215e7 = 1;
    var_22d14235b5749883 = getdvarint(@"hash_6e2a7271b0aaecd4", 8000);
    dropstruct.var_81986b2d8e843970 = var_22d14235b5749883 * var_22d14235b5749883;
    game["dialog"]["dropbag_incoming"] = "drpb_grav_gmst";
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb9
// Size: 0xd5
function deactivate() {
    foreach (crate in level.var_2a89743460772ea0) {
        if (!isdefined(crate)) {
            continue;
        }
        playfx(level.conf_fx["vanish"], crate.origin);
        if (isdefined(crate.smokesignal)) {
            crate.smokesignal setscriptablepartstate("smoke_signal", "off", 0);
            crate.smokesignal delete();
        }
        crate namespace_6c578d6ef48f10ef::deletecrateimmediate();
        level.var_2a89743460772ea0 = array_remove(level.var_2a89743460772ea0, crate);
    }
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd95
// Size: 0x71
function function_a7b6924c27b24419(var_3aab229635e84ae1) {
    var_c35d9f1adc6b131f = 0;
    foreach (circle in var_3aab229635e84ae1) {
        var_c35d9f1adc6b131f = var_c35d9f1adc6b131f + circle.radius;
    }
    return var_c35d9f1adc6b131f;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe0e
// Size: 0x81
function function_33edfefab8f13307(var_3aab229635e84ae1, var_3163d28d241d4273) {
    var_c35d9f1adc6b131f = 0;
    foreach (circle in var_3aab229635e84ae1) {
        var_c35d9f1adc6b131f = var_c35d9f1adc6b131f + circle.radius;
        if (var_3163d28d241d4273 <= var_c35d9f1adc6b131f) {
            return circle;
        }
    }
    return undefined;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe97
// Size: 0x62
function function_24d2f715eea2a268(var_819edacdacb810e4, var_1062ad70c2ee0fd1, var_5cae8dadbf316a7d) {
    var_dcb13e0878fb0dd4 = function_fcc289142135e1a4(var_819edacdacb810e4, var_1062ad70c2ee0fd1, var_5cae8dadbf316a7d);
    droppoint = namespace_c5622898120e827f::getrandompointinboundscircle(var_dcb13e0878fb0dd4.origin, var_dcb13e0878fb0dd4.radius, 0, 0.85, 1, 1);
    return droppoint;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf01
// Size: 0xe2
function function_fcc289142135e1a4(var_819edacdacb810e4, var_1062ad70c2ee0fd1, var_5cae8dadbf316a7d) {
    var_a372a079062548cc = distance2d(var_819edacdacb810e4, var_1062ad70c2ee0fd1);
    var_bbe4c8002c4744ea = int(var_5cae8dadbf316a7d / 2);
    if (var_a372a079062548cc != 0) {
        var_b7f1626973b3920b = int(var_1062ad70c2ee0fd1[0] - var_bbe4c8002c4744ea / var_a372a079062548cc * (var_1062ad70c2ee0fd1[0] - var_819edacdacb810e4[0]));
        var_b7f1616973b38fd8 = int(var_1062ad70c2ee0fd1[1] - var_bbe4c8002c4744ea / var_a372a079062548cc * (var_1062ad70c2ee0fd1[1] - var_819edacdacb810e4[1]));
    } else {
        var_b7f1626973b3920b = int(var_819edacdacb810e4[0]);
        var_b7f1616973b38fd8 = int(var_819edacdacb810e4[1]);
    }
    var_b7f1646973b39671 = 0;
    var_dcb13e0878fb0dd4 = spawnstruct();
    var_dcb13e0878fb0dd4.origin = (var_b7f1626973b3920b, var_b7f1616973b38fd8, var_b7f1646973b39671);
    var_dcb13e0878fb0dd4.radius = var_bbe4c8002c4744ea;
    return var_dcb13e0878fb0dd4;
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfeb
// Size: 0x91
function function_ae1a3e74689d656a() {
    if (!isdefined(self) || !isdefined(level.var_2a89743460772ea0)) {
        return;
    }
    foreach (crate in level.var_2a89743460772ea0) {
        if (!isdefined(crate) || !isdefined(crate.var_7b5e5c2bbc8f9f79)) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(crate.var_7b5e5c2bbc8f9f79, self);
    }
}

// Namespace namespace_d2cdf0e410334eae/namespace_633a83e541ee30e5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1083
// Size: 0x91
function onplayerrespawn() {
    if (!isdefined(self) || !isdefined(level.var_2a89743460772ea0)) {
        return;
    }
    foreach (crate in level.var_2a89743460772ea0) {
        if (!isdefined(crate) || !isdefined(crate.var_7b5e5c2bbc8f9f79)) {
            continue;
        }
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(crate.var_7b5e5c2bbc8f9f79, self);
    }
}

