#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using script_294dda4a4b00ffe3;
#using scripts\mp\gametypes\br_public.gsc;
#using script_744cad313ed0a87e;

#namespace namespace_7c55f7a9d44ffaab;

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1a4
// Size: 0x13
function autoexec main() {
    scripts\mp\gametypes\br_publicevents::function_dbc8f6cb3760cd82("restock", &init);
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf
// Size: 0xe9
function init(config) {
    eventinfo = spawnstruct();
    eventinfo.weight = config.weight;
    eventinfo.validatefunc = &validatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.activatefunc = &activatefunc;
    eventinfo.deactivatefunc = &deactivatefunc;
    eventinfo.postinitfunc = &postinitfunc;
    eventinfo.var_d72a1842c5b57d1d = config.maxtimes;
    eventinfo.circleeventweights = scripts\mp\gametypes\br_publicevents::function_8fc51a5af06412cf(config.circleweights);
    eventinfo.var_b9b56551e1acfee2 = namespace_c711384b1335919::function_8be9bae8228a91f7("restock");
    scripts\mp\gametypes\br_publicevents::function_5b7d8ca93f8705f1(eventinfo, "restock");
    scripts\mp\gametypes\br_publicevents::registerpublicevent(7, eventinfo);
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0
// Size: 0x33
function postinitfunc() {
    game["dialog"]["power_up_field_resupply"] = "pblc_grav_rsnd";
    level.var_bd006676148e6c40 = [];
    level.var_a688dd9515c7def = [];
    level.var_344f2168e7b1bc8e = [];
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb
// Size: 0x4
function validatefunc() {
    return true;
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8
// Size: 0x10
function waitfunc() {
    level endon("game_ended");
    level endon("cancel_public_event");
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0xb9
function activatefunc() {
    level endon("game_ended");
    scripts\mp\gametypes\br_publicevents::showsplashtoall("br_pe_restock_active");
    scripts\mp\gametypes\br_public::brleaderdialog("power_up_field_resupply", 1, undefined, undefined, 1);
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

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1
// Size: 0x2
function deactivatefunc() {
    
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3db
// Size: 0xbe
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

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a1
// Size: 0x58
function function_8cd3ae6cb0d422dc() {
    if (!isdefined(level.var_a688dd9515c7def) || level.var_a688dd9515c7def.size <= 0) {
        return;
    }
    index = level.var_a688dd9515c7def.size - 1;
    self.contents = level.var_a688dd9515c7def[index];
    level.var_a688dd9515c7def[index] = undefined;
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x501
// Size: 0x58
function function_c7076b566f348b22() {
    if (!isdefined(level.var_344f2168e7b1bc8e) || level.var_344f2168e7b1bc8e.size <= 0) {
        return;
    }
    index = level.var_344f2168e7b1bc8e.size - 1;
    self.contents = level.var_344f2168e7b1bc8e[index];
    level.var_344f2168e7b1bc8e[index] = undefined;
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x561
// Size: 0x22
function function_ec86e04eb404ce02() {
    if (!isdefined(self.originalcontents)) {
        return;
    }
    self.contents = self.originalcontents;
}

// Namespace namespace_7c55f7a9d44ffaab / namespace_fb5c3efdbb4b6584
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58b
// Size: 0x2d
function function_a5cbf2004ced4597() {
    return istrue(level.var_b06bb395c37b7ab8) && getdvarfloat(@"hash_a5f3589998da80ae", 0) || istrue(level.var_337628ae96a92ff2);
}

