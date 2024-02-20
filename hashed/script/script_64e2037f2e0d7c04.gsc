// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_public.gsc;
#using script_744cad313ed0a87e;

#namespace namespace_7c55f7a9d44ffaab;

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1a4
// Size: 0x14
function autoexec main() {
    namespace_d76af9f804655767::function_dbc8f6cb3760cd82("restock", &init);
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0xea
function init(config) {
    var_7ec7671a1e0c788f = spawnstruct();
    var_7ec7671a1e0c788f.weight = config.weight;
    var_7ec7671a1e0c788f.validatefunc = &validatefunc;
    var_7ec7671a1e0c788f.waitfunc = &waitfunc;
    var_7ec7671a1e0c788f.activatefunc = &activatefunc;
    var_7ec7671a1e0c788f.var_f4fd1f55ec89ded = &function_f4fd1f55ec89ded;
    var_7ec7671a1e0c788f.var_c9e871d29702e8cf = &function_c9e871d29702e8cf;
    var_7ec7671a1e0c788f.var_d72a1842c5b57d1d = config.var_ce4b48e2a63b3705;
    var_7ec7671a1e0c788f.var_f0f6529c88a18128 = namespace_d76af9f804655767::function_8fc51a5af06412cf(config.var_2b5e23900f3a692e);
    var_7ec7671a1e0c788f.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("restock");
    namespace_d76af9f804655767::function_5b7d8ca93f8705f1(var_7ec7671a1e0c788f, "restock");
    namespace_d76af9f804655767::registerpublicevent(7, var_7ec7671a1e0c788f);
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0x34
function function_c9e871d29702e8cf() {
    game["dialog"]["power_up_field_resupply"] = "pblc_grav_rsnd";
    level.var_bd006676148e6c40 = [];
    level.var_a688dd9515c7def = [];
    level.var_344f2168e7b1bc8e = [];
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0x5
function validatefunc() {
    return 1;
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8
// Size: 0x11
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0xba
function activatefunc() {
    level endon("game_ended");
    namespace_d76af9f804655767::showsplashtoall("br_pe_restock_active");
    namespace_d3d40f75bb4e4c32::brleaderdialog("power_up_field_resupply", 1, undefined, undefined, 1);
    if (isdefined(level.var_ea7c6955bb1589bd)) {
        [[ level.var_ea7c6955bb1589bd ]]();
    }
    foreach (instance in level.var_bd006676148e6c40) {
        if (!isdefined(instance)) {
            continue;
        }
        instance setscriptablepartstate("body", "closing");
        instance function_f929dbb719836091();
        instance br_lootcache::removecrate();
    }
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1
// Size: 0x3
function function_f4fd1f55ec89ded() {
    
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db
// Size: 0xbf
function function_f929dbb719836091() {
    level endon("game_ended");
    self endon("death");
    switch (self.type) {
    case #"hash_417c605750c7baa5":
        function_8cd3ae6cb0d422dc();
        break;
    case #"hash_19ba8d41970911ad":
        function_c7076b566f348b22();
        break;
    case #"hash_4ca1dc2e1b0de0d3":
        br_lootcache::function_27f0aed354031248();
        break;
    case #"hash_4654cfd269b6fc02":
    case #"hash_9c5f01407ae504fc":
    case #"hash_bc13d03dc3f6d6e8":
        break;
    default:
        function_ec86e04eb404ce02();
        break;
    }
    if (isdefined(self.fortress)) {
        namespace_bd614c3c2275579a::function_df20d77fc7d6103c(self.fortress, self);
    }
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0x59
function function_8cd3ae6cb0d422dc() {
    if (!isdefined(level.var_a688dd9515c7def) || level.var_a688dd9515c7def.size <= 0) {
        return;
    }
    index = level.var_a688dd9515c7def.size - 1;
    self.contents = level.var_a688dd9515c7def[index];
    level.var_a688dd9515c7def[index] = undefined;
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0x59
function function_c7076b566f348b22() {
    if (!isdefined(level.var_344f2168e7b1bc8e) || level.var_344f2168e7b1bc8e.size <= 0) {
        return;
    }
    index = level.var_344f2168e7b1bc8e.size - 1;
    self.contents = level.var_344f2168e7b1bc8e[index];
    level.var_344f2168e7b1bc8e[index] = undefined;
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561
// Size: 0x23
function function_ec86e04eb404ce02() {
    if (!isdefined(self.var_9632642b41dad704)) {
        return;
    }
    self.contents = self.var_9632642b41dad704;
}

// Namespace namespace_7c55f7a9d44ffaab/namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58b
// Size: 0x2e
function function_a5cbf2004ced4597() {
    return istrue(level.var_b06bb395c37b7ab8) && getdvarfloat(@"hash_a5f3589998da80ae", 0) || istrue(level.var_337628ae96a92ff2);
}

