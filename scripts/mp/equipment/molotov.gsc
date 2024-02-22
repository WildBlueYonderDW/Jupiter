// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_5f903436642211af;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\utility\debug.gsc;

#namespace molotov;

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x641
// Size: 0x167
function molotov_init() {
    /#
        assertex(!isdefined(level.molotov), "molotov_init() was called more than once.");
    #/
    leveldata = spawnstruct();
    level.molotov = leveldata;
    level.molotovdamagethrottle = function_e4c99b0f178ffb98("molotovDamageThrottle", 4, 0.05);
    leveldata.maxpools = getdvarint(@"hash_541e147e1379b35e", 100);
    leveldata.maxcastsperframe = getdvarint(@"hash_3b54ad814e59b401", 8);
    leveldata.immediatecleanup = getdvarint(@"hash_ec13dc5b3ae7d79c", 1) > 0;
    leveldata.uniquepoolid = 0;
    leveldata.poolids = [];
    leveldata.scriptables = [];
    leveldata.triggers = [];
    leveldata.frametimestamp = 0;
    leveldata.caststhisframe = 0;
    level.g_effect["vfx_burn_med_low"] = loadfx("vfx/iw8/weap/_fire/molotov/vfx_mtov_ontag_med_low.vfx");
    level.g_effect["vfx_burn_sml_low"] = loadfx("vfx/iw8/weap/_fire/molotov/vfx_mtov_ontag_sml_low.vfx");
    level.g_effect["vfx_burn_sml_head_low"] = loadfx("vfx/iw8/weap/_fire/molotov/vfx_mtov_ontag_head_low.vfx");
    molotov_init_cast_data();
    molotov_init_pool_data();
    registersharedfunc("molotov", "molotov_simulate_impact", &molotov_simulate_impact);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7af
// Size: 0x22e
function molotov_init_cast_data() {
    leveldata = molotov_get_level_data();
    castdata = leveldata.castdata;
    if (!isdefined(castdata)) {
        castdata = spawnstruct();
        leveldata.castdata = castdata;
    }
    castdata.distforward = [];
    castdata.distdown = [];
    castdata.distup = [];
    castdata.maxcasts = [];
    castdata.maxfails = [];
    castdata.maxents = [];
    castdata.firstforwarddist = [];
    castdata.firstforwardmindist = [];
    castdata.firstforwardmodanglesfunc = [];
    id = 4;
    castdata.distforward[id] = undefined;
    castdata.distdown[id] = undefined;
    castdata.distup[id] = undefined;
    castdata.maxcasts[id] = undefined;
    castdata.maxfails[id] = undefined;
    castdata.maxents[id] = 1;
    id = 8;
    castdata.distforward[id] = 50;
    castdata.distdown[id] = 50;
    castdata.distup[id] = 25;
    castdata.maxcasts[id] = 4;
    castdata.maxfails[id] = 3;
    castdata.maxents[id] = 1;
    castdata.distforwardwall[id] = 25;
    id = 16;
    castdata.distforward[id] = 15;
    castdata.distdown[id] = 50;
    castdata.distup[id] = 25;
    castdata.maxcasts[id] = 17;
    castdata.maxfails[id] = 3;
    castdata.maxents[id] = 3;
    castdata.firstforwarddist[id] = 85;
    castdata.firstforwardmindist[id] = 8;
    castdata.distforwardwall[id] = 8;
    castdata.firstforwarddistwall[id] = 44;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e4
// Size: 0x152
function molotov_init_pool_data() {
    leveldata = molotov_get_level_data();
    pooldata = leveldata.pooldata;
    if (!isdefined(pooldata)) {
        pooldata = spawnstruct();
        leveldata.pooldata = pooldata;
    }
    pooldata.triggerradius = [];
    pooldata.triggerheight = [];
    pooldata.triggeroffset = [];
    pooldata.startdelayms = [];
    id = 4;
    pooldata.triggerradius[id] = 30;
    pooldata.triggerheight[id] = 55;
    pooldata.triggeroffset[id] = 15;
    pooldata.startdelayms[id] = 0;
    id = 8;
    pooldata.triggerradius[id] = 30;
    pooldata.triggerheight[id] = 55;
    pooldata.triggeroffset[id] = 15;
    pooldata.startdelayms[id] = 100;
    id = 16;
    pooldata.triggerradius[id] = 10;
    pooldata.triggerheight[id] = 55;
    pooldata.triggeroffset[id] = 15;
    pooldata.startdelayms[id] = 100;
    molotov_init_pool_mask();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3d
// Size: 0x190
function molotov_init_pool_mask() {
    var_dcf9401f976e906f = molotov_get_pool_level_data();
    var_6f6efec7e89387e8 = [];
    var_6f6efec7e89387e8[4] = "coreCenter";
    var_6f6efec7e89387e8[8] = "core";
    var_6f6efec7e89387e8[16] = "tendril";
    var_6f6efec7e89387e8[1] = "";
    var_6f6efec7e89387e8[2] = "DieDown";
    var_6f6efec7e89387e8[32] = "";
    var_6f6efec7e89387e8[64] = "Wall";
    var_6f6efec7e89387e8[128] = "Ceil";
    scriptablestates = [];
    var_e42c4a59211c25aa = (1 | 2) ^ (1 | 2) & (1 | 2) - 1;
    var_a56ffa08fd7c6e21 = (4 | 8 | 16) ^ (4 | 8 | 16) & (4 | 8 | 16) - 1;
    var_880b6bd9b71c4abc = (32 | 64 | 128) ^ (32 | 64 | 128) & (32 | 64 | 128) - 1;
    var_dfcfa94f575db98d = var_e42c4a59211c25aa;
    while ((var_dfcfa94f575db98d & (1 | 2)) > 0) {
        var_5ee7711499bf12c4 = var_a56ffa08fd7c6e21;
        while ((var_5ee7711499bf12c4 & (4 | 8 | 16)) > 0) {
            var_ebb5a5e5f2fafc4b = var_880b6bd9b71c4abc;
            while ((var_ebb5a5e5f2fafc4b & (32 | 64 | 128)) > 0) {
                mask = var_dfcfa94f575db98d | var_5ee7711499bf12c4 | var_ebb5a5e5f2fafc4b;
                scriptablestates[mask] = var_6f6efec7e89387e8[var_5ee7711499bf12c4] + var_6f6efec7e89387e8[var_dfcfa94f575db98d] + var_6f6efec7e89387e8[var_ebb5a5e5f2fafc4b];
                mask = var_5ee7711499bf12c4 | var_ebb5a5e5f2fafc4b;
                scriptablestates[mask] = "neutral";
                var_ebb5a5e5f2fafc4b = var_ebb5a5e5f2fafc4b << 1;
            }
            var_5ee7711499bf12c4 = var_5ee7711499bf12c4 << 1;
        }
        var_dfcfa94f575db98d = var_dfcfa94f575db98d << 1;
    }
    var_dcf9401f976e906f.scriptablestates = scriptablestates;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x24
function molotov_on_give(equipmentref, slot, variantid) {
    thread molotov_watch_fx();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff
// Size: 0x1c
function molotov_on_take(equipmentref, slot) {
    self notify("molotov_taken");
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd22
// Size: 0x112
function molotov_used(grenade) {
    grenade endon("death");
    grenade endon("molotov_water_impact");
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        grenade endon("missile_water_impact");
        thread function_e56975d29612c12a(grenade);
    }
    var_6951cf1f43bc8ebe = self getgunangles();
    var_8011cffb839e8243 = gettime();
    launchvelocity = anglestoforward(var_6951cf1f43bc8ebe) * 940 + anglestoup(var_6951cf1f43bc8ebe) * 120;
    thread molotov_cleanup_grenade(grenade);
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(level.gamemodemolotovfunc)) {
        [[ level.gamemodemolotovfunc ]](grenade, self);
    }
    traveltime = (gettime() - var_8011cffb839e8243) / 1000;
    var_ceab23e7a7e95404 = launchvelocity + (0, 0, -800 * traveltime);
    if (isdefined(stuckto) && (isplayer(stuckto) || isagent(stuckto))) {
        thread molotov_stuck_player(grenade, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    } else {
        thread molotov_stuck(grenade, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3b
// Size: 0x29
function function_e56975d29612c12a(grenade) {
    grenade endon("explode");
    self endon("death");
    grenade waittill("missile_water_impact");
    grenade delete();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6b
// Size: 0x136
function molotov_stuck(grenade, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    angles = undefined;
    forward = vectornormalize(var_ceab23e7a7e95404);
    up = anglestoup(grenade.angles);
    right = anglestoright(var_6951cf1f43bc8ebe);
    if (abs(vectordot(forward, up)) >= 0.9848) {
        angles = molotov_rebuild_angles_up_right(up, right);
    } else {
        angles = molotov_rebuild_angles_up_forward(up, forward);
    }
    grenade.angles = angles;
    grenade.exploding = 1;
    grenade setscriptablepartstate("effects", "explode", 0);
    grenade missilehidetrail();
    grenade.var_ee4c6b12c2b086d6 = 1;
    grenade notify("death");
    var_79fe84c0e97de2eb = undefined;
    bundle = function_d89c621ce916f11e();
    if (isdefined(bundle)) {
        var_79fe84c0e97de2eb = bundle.var_1731b5299dbc3a45;
    }
    molotov_simulate_impact(grenade, grenade.origin, angles, stuckto, var_ceab23e7a7e95404, gettime(), var_79fe84c0e97de2eb);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa8
// Size: 0x211
function molotov_stuck_player(grenade, stuckto, var_6951cf1f43bc8ebe, var_ceab23e7a7e95404) {
    grenadestuckto(grenade, stuckto);
    stuckto thread molotov_burn_for_time(6, self, grenade, grenade);
    grenade.exploding = 1;
    grenade setscriptablepartstate("effects", "explode", 0);
    grenade missilehidetrail();
    var_ceab23e7a7e95404 = var_ceab23e7a7e95404 * (0, 0, 1);
    caststart = grenade.origin;
    castdir = (0, 0, -1);
    castend = caststart + castdir * 128;
    contents = molotov_get_cast_contents();
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, grenade, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"];
        var_a95d04f8f906e839 = var_e021c2744cc7ed68[0]["normal"];
        var_8d3dd4e0ca9bb1c0 = var_e021c2744cc7ed68[0]["entity"];
        castend = castend - var_a95d04f8f906e839 * 1;
        d = vectordot(castend - caststart, castdir);
        t = sqrt(2 * d / -1 * -800);
        up = var_a95d04f8f906e839;
        right = anglestoright(var_6951cf1f43bc8ebe);
        var_4b65413211af7033 = molotov_rebuild_angles_up_right(up, right);
        grenade.var_ee4c6b12c2b086d6 = 1;
        var_79fe84c0e97de2eb = undefined;
        bundle = function_d89c621ce916f11e();
        if (isdefined(bundle)) {
            var_79fe84c0e97de2eb = bundle.var_1731b5299dbc3a45;
        }
        thread molotov_simulate_impact(grenade, castend, var_4b65413211af7033, var_8d3dd4e0ca9bb1c0, var_ceab23e7a7e95404, gettime() + t * 1000, var_79fe84c0e97de2eb);
        return;
    }
    grenade notify("death");
    waitframe();
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c0
// Size: 0x88
function molotovbadplace(var_183bdcc9e630d8dd) {
    if (!namespace_c52269d70f989750::bot_bots_enabled_or_added() && !namespace_448ccf1ca136fbbe::function_a10967d736dc56e5()) {
        return;
    }
    if (isdefined(level.var_85f0faee1e7958bb)) {
        badplace = function_619cdac2efb21978(var_183bdcc9e630d8dd, (128, 128, 100), (0, 0, 0), level.var_85f0faee1e7958bb);
    } else {
        badplace = createnavbadplacebybounds(var_183bdcc9e630d8dd, (128, 128, 100), (0, 0, 0));
    }
    return badplace;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1250
// Size: 0x717
function molotov_simulate_impact(grenade, var_183bdcc9e630d8dd, var_4b65413211af7033, var_3ae043bbb7b2fdf0, var_ceab23e7a7e95404, impacttime, var_54c186a6b8a2ae1) {
    owner = grenade.owner;
    if (!istrue(level.dangerzoneskipequipment)) {
        var_a53fbeeb744eae5c = ter_op(level.players.size > 15, 10, 20);
        namespace_b2d5aa2baf2b5701::addspawndangerzone(var_183bdcc9e630d8dd - (0, 0, 128), 225, 256, owner.team, var_a53fbeeb744eae5c, owner, 1);
    }
    impactnormal = anglestoup(var_4b65413211af7033);
    caststart = var_183bdcc9e630d8dd + impactnormal * 1;
    castend = caststart + impactnormal * 25;
    contents = molotov_get_cast_contents();
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, grenade, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"] - impactnormal * 1;
    }
    var_a862bfa81aee2a1b = castend;
    burnsource = grenade;
    burnsource thread molotov_cleanup_burn_source();
    burnid = molotov_get_next_burning_id();
    var_e24e63386230e04 = 0;
    var_483380bbc108cdce = vectordot(vectornormalize(var_ceab23e7a7e95404), -1 * impactnormal);
    if (var_483380bbc108cdce < 0.96593) {
        var_e24e63386230e04 = 1;
    }
    shareddata = molotov_create_shared_data(owner, impacttime, burnsource, burnid);
    shareddata.badplace = molotovbadplace(var_183bdcc9e630d8dd);
    shareddata thread molotov_cleanup();
    grenade function_49197cd063a740ea(&function_946f8ebb6c6efd92);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            if (isarray(elevators)) {
                foreach (var_187f85ddb118861e in elevators) {
                    var_187f85ddb118861e thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
                }
            } else {
                elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(grenade);
            }
        }
    }
    id = 4;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_183bdcc9e630d8dd, var_4b65413211af7033, var_3ae043bbb7b2fdf0);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    var_6f2b46872df538de = 25;
    var_df64badccf60fd69 = 65;
    var_144e6d19329167bd = 115;
    var_911981ae29f681e9 = gettime() + pooldata.startdelayms;
    id = 8;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = &molotov_branch_create_forward_tendril_cone;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_4b65413211af7033, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    forward = anglestoforward(var_4b65413211af7033);
    right = anglestoright(var_4b65413211af7033);
    up = anglestoup(var_4b65413211af7033);
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_17f0969ab028c296 = forward * -1;
    bright = right * -1;
    var_b644a203c149f9ac = up;
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = undefined;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, var_df64badccf60fd69);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = &molotov_branch_create_right_tendril_cone;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, -1 * var_df64badccf60fd69);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = &molotov_branch_create_left_tendril_cone;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, var_144e6d19329167bd);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = undefined;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    var_17f0969ab028c296 = rotatepointaroundvector(up, forward, -1 * var_144e6d19329167bd);
    bright = vectornormalize(vectorcross(var_17f0969ab028c296, up));
    var_b644a203c149f9ac = vectorcross(bright, forward);
    var_106f27f1bc233c55 = axistoangles(var_17f0969ab028c296, bright, var_b644a203c149f9ac);
    oncompletedfunc = &molotov_branch_create_tendril_radial;
    if (var_e24e63386230e04) {
        oncompletedfunc = undefined;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, undefined, var_a862bfa81aee2a1b, var_106f27f1bc233c55, var_3ae043bbb7b2fdf0, 0, var_911981ae29f681e9, oncompletedfunc);
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    molotov_register_cast(shareddata);
    foreach (var_8d01e03c5c561b39 in shareddata.branches) {
        var_8d01e03c5c561b39 thread molotov_start_branch(var_54c186a6b8a2ae1);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x196e
// Size: 0xbf
function molotov_cleanup() {
    self.burnsource waittill_notify_or_timeout("entitydeleted", 6.75);
    while (1) {
        var_3f9251d8cd3164a0 = 1;
        foreach (var_8d01e03c5c561b39 in self.branches) {
            if (!istrue(var_8d01e03c5c561b39.iscomplete)) {
                var_3f9251d8cd3164a0 = 0;
                break;
            }
            if (!var_3f9251d8cd3164a0) {
                break;
            }
        }
        if (var_3f9251d8cd3164a0) {
            break;
        }
        waitframe();
    }
    if (isdefined(self.badplace)) {
        destroynavobstacle(self.badplace);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a34
// Size: 0x111
function molotov_create_shared_data(owner, impacttime, burnsource, burnid) {
    shareddata = spawnstruct();
    shareddata.owner = owner;
    shareddata.team = owner.team;
    shareddata.impacttime = impacttime;
    shareddata.burnsource = burnsource;
    shareddata.burnid = burnid;
    shareddata.branches = [];
    shareddata.scriptablecount = 0;
    shareddata.caststotal = 0;
    shareddata.caststhisframe = 0;
    shareddata.frametimestamp = gettime();
    shareddata.castcontents = physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
    burnsource.shareddata = shareddata;
    return shareddata;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4d
// Size: 0x52
function molotov_register_cast(shareddata) {
    shareddata.caststotal++;
    shareddata.caststhisframe++;
    shareddata.frametimestamp = gettime();
    leveldata = molotov_get_level_data();
    leveldata.caststhisframe++;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ba6
// Size: 0x95
function molotov_register_scriptable(shareddata) {
    /#
        assertex(isdefined(self.id), "pool.ID must be set to a unique id before it is registered.  See molotov_get_unique_pool_id().");
    #/
    shareddata.scriptablecount++;
    leveldata = molotov_get_level_data();
    leveldata.scriptables[self.id] = self;
    /#
        println("entity" + leveldata.scriptables.size);
    #/
    if (leveldata.scriptables.size > leveldata.maxpools) {
        molotov_delete_oldest_scriptable();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c42
// Size: 0x7e
function molotov_register_trigger(trigger) {
    leveldata = molotov_get_level_data();
    leveldata.triggers[self.id] = self;
    /#
        println("<unknown string>" + self getentitynumber() + "<unknown string>" + leveldata.triggers.size);
    #/
    if (leveldata.triggers.size > leveldata.maxpools) {
        molotov_delete_oldest_trigger();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc7
// Size: 0x83
function molotov_delete_scriptable() {
    leveldata = molotov_get_level_data();
    leveldata.scriptables[self.id] = undefined;
    trigger = leveldata.triggers[self.id];
    if (!isdefined(trigger)) {
        leveldata.poolids = array_remove(leveldata.poolids, self.id);
    }
    self notify("death");
    self freescriptable();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d51
// Size: 0xa3
function molotov_delete_trigger() {
    leveldata = molotov_get_level_data();
    leveldata.triggers[self.id] = undefined;
    scriptable = leveldata.scriptables[self.id];
    if (!isdefined(scriptable)) {
        leveldata.poolids = array_remove(leveldata.poolids, self.id);
    }
    /#
        println("<unknown string>" + self getentitynumber() + "<unknown string>" + leveldata.triggers.size);
    #/
    self delete();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfb
// Size: 0xda
function molotov_delete_oldest_scriptable(immediate) {
    leveldata = molotov_get_level_data();
    scriptable = undefined;
    id = undefined;
    foreach (id in leveldata.poolids) {
        scriptable = leveldata.scriptables[id];
        if (isdefined(scriptable)) {
            break;
        }
    }
    immediate = istrue(immediate) || leveldata.immediatecleanup;
    if (getdvarint(@"hash_7dfd0d2d59762b9e", 1) == 1) {
        if (isdefined(scriptable)) {
            molotov_delete_pool_by_id(id, immediate);
        }
    } else if (!isdefined(scriptable)) {
        molotov_delete_pool_by_id(id, immediate);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1edc
// Size: 0xb3
function molotov_delete_oldest_trigger(immediate) {
    leveldata = molotov_get_level_data();
    trigger = undefined;
    id = undefined;
    foreach (id in leveldata.poolids) {
        trigger = leveldata.triggers[id];
        if (isdefined(trigger)) {
            break;
        }
    }
    immediate = istrue(immediate) || leveldata.immediatecleanup;
    if (isdefined(trigger)) {
        molotov_delete_pool_by_id(id, immediate);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f96
// Size: 0xee
function molotov_delete_pool_by_id(id, immediate) {
    leveldata = molotov_get_level_data();
    scriptable = leveldata.scriptables[id];
    if (isdefined(scriptable)) {
        if (!istrue(immediate)) {
            leveldata.scriptables[id] = undefined;
            leveldata.triggers[id] = undefined;
            leveldata.poolids = array_remove(leveldata.poolids, id);
            scriptable thread molotov_pool_end();
            /#
                println("<unknown string>" + leveldata.scriptables.size);
            #/
            return;
        }
        scriptable thread molotov_delete_scriptable();
        /#
            println("<unknown string>" + leveldata.scriptables.size);
        #/
    }
    trigger = leveldata.triggers[id];
    if (isdefined(trigger)) {
        trigger thread molotov_delete_trigger();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208b
// Size: 0xb2
function molotov_can_cast_this_frame(shareddata) {
    if (shareddata.frametimestamp < gettime()) {
        shareddata.frametimestamp = gettime();
        shareddata.caststhisframe = 0;
    }
    if (shareddata.caststhisframe >= 3) {
        return 0;
    }
    leveldata = molotov_get_level_data();
    if (leveldata.frametimestamp < gettime()) {
        leveldata.frametimestamp = gettime();
        leveldata.caststhisframe = 0;
    }
    if (leveldata.caststhisframe >= leveldata.maxcastsperframe) {
        return 0;
    }
    return 1;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2145
// Size: 0xfb
function molotov_shared_data_is_complete(var_af8745e2185687a8) {
    iscomplete = 0;
    maxcasts = 60;
    maxents = 20;
    if (self.caststotal >= maxcasts) {
        iscomplete = 1;
    } else if (self.scriptablecount >= maxents) {
        iscomplete = 1;
    } else if (istrue(var_af8745e2185687a8)) {
        var_3ce5d6eb962629fa = 1;
        foreach (var_8d01e03c5c561b39 in self.branches) {
            if (!var_8d01e03c5c561b39 molotov_branch_is_complete(1, 1)) {
                var_3ce5d6eb962629fa = 0;
                break;
            }
        }
        if (var_3ce5d6eb962629fa) {
            iscomplete = 1;
        }
    }
    if (iscomplete) {
        self.iscomplete = 1;
        molotov_store_branch_ents();
        self.branches = [];
    }
    return iscomplete;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2248
// Size: 0xfe
function molotov_store_branch_ents() {
    shareddata = self;
    if (isdefined(self.shareddata)) {
        shareddata = self.shareddata;
    }
    if (!isdefined(shareddata.oldbranchents)) {
        shareddata.oldbranchents = [];
    }
    foreach (var_8d01e03c5c561b39 in self.branches) {
        foreach (ent in var_8d01e03c5c561b39.ents) {
            if (isdefined(ent)) {
                shareddata.oldbranchents[shareddata.oldbranchents.size] = ent;
            }
        }
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234d
// Size: 0x12c
function molotov_create_branch(shareddata, castdata, pooldata, parent, startingorigin, startingangles, startingstuckto, startingcasttype, preventstarttime, oncompletedfunc) {
    var_8d01e03c5c561b39 = spawnstruct();
    var_8d01e03c5c561b39.shareddata = shareddata;
    var_8d01e03c5c561b39.castdata = castdata;
    var_8d01e03c5c561b39.pooldata = pooldata;
    var_8d01e03c5c561b39.startingorigin = startingorigin;
    var_8d01e03c5c561b39.startingangles = startingangles;
    var_8d01e03c5c561b39.startingstuckto = startingstuckto;
    var_8d01e03c5c561b39.startingcasttype = startingcasttype;
    var_8d01e03c5c561b39.oncompletedfunc = oncompletedfunc;
    var_8d01e03c5c561b39.ents = [];
    var_8d01e03c5c561b39.branches = [];
    var_8d01e03c5c561b39.hitpositions = [];
    var_8d01e03c5c561b39.hittypes = [];
    var_8d01e03c5c561b39.casts = 0;
    var_8d01e03c5c561b39.castfails = 0;
    var_8d01e03c5c561b39.preventstarttime = preventstarttime;
    return var_8d01e03c5c561b39;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2481
// Size: 0x7a1
function molotov_start_branch(var_54c186a6b8a2ae1) {
    self endon("cleanup_branch");
    /#
        thread molotov_branch_draw_hits();
    #/
    if (!isdefined(self.preventstarttime)) {
        self.preventstarttime = gettime();
    }
    if (!isdefined(self.startingcasttype)) {
        if (!self.shareddata molotov_shared_data_is_complete()) {
            pool = molotov_branch_create_pool(self.startingorigin, self.startingangles, self.startingstuckto, var_54c186a6b8a2ae1);
            pool = pool thread molotov_pool_start();
            self.iscomplete = 1;
            self.shareddata molotov_shared_data_is_complete(1);
            /#
                self.hitpositions[self.hitpositions.size] = self.startingorigin;
                self.hittypes[self.hittypes.size] = 1;
            #/
        }
    } else {
        self.caststart = self.startingorigin;
        self.castend = undefined;
        self.castangles = self.startingangles;
        self.castdir = undefined;
        self.casttype = self.startingcasttype;
        self.startingorigin = undefined;
        self.startingangles = undefined;
        self.startingcasttype = undefined;
        while (1) {
            if (self.shareddata molotov_shared_data_is_complete()) {
                break;
            }
            if (molotov_branch_is_complete(undefined, 1, var_54c186a6b8a2ae1)) {
                break;
            }
            if (!molotov_can_cast_this_frame(self.shareddata)) {
                waitframe();
                continue;
            }
            if (self.casttype == 0) {
                firstforwardmodanglesfunc = self.castdata.firstforwardmodanglesfunc;
                if (isdefined(firstforwardmodanglesfunc)) {
                    self.castangles = [[ firstforwardmodanglesfunc ]](self.castangles);
                    self.castdata.firstforwardmodanglesfunc = undefined;
                    self.castdata.iswallcast = undefined;
                }
            }
            if (!isdefined(self.iswallcast)) {
                var_89e70a63b116955b = vectordot(anglestoup(self.castangles), (0, 0, 1));
                self.iswallcast = var_89e70a63b116955b > -0.81915 && var_89e70a63b116955b <= 0.5;
                if (isdefined(self.castdata.firstforwarddist)) {
                    if (self.iswallcast && isdefined(self.castdata.firstforwarddistwall)) {
                        self.castdata.firstforwarddist = self.castdata.firstforwarddistwall;
                        self.castdata.firstforwarddistwall = undefined;
                    } else {
                        self.castdata.firstforwarddistwall = undefined;
                    }
                }
            }
            self.castdir = molotov_get_cast_dir(self.castangles, self.casttype);
            self.castend = self.caststart + self.castdir * molotov_get_cast_dist(self.casttype, self.castdata, self.iswallcast);
            var_10cfd730ad727443 = undefined;
            var_488ae8e1536d02b3 = undefined;
            var_a95d04f8f906e839 = undefined;
            var_8d3dd4e0ca9bb1c0 = undefined;
            var_d27f9a12a82f66e3 = undefined;
            var_e021c2744cc7ed68 = physics_raycast(self.caststart, self.castend, self.shareddata.castcontents, undefined, 1, "physicsquery_closest", 1);
            if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
                var_10cfd730ad727443 = 1;
                var_488ae8e1536d02b3 = var_e021c2744cc7ed68[0]["position"];
                var_a95d04f8f906e839 = var_e021c2744cc7ed68[0]["normal"];
                var_8d3dd4e0ca9bb1c0 = var_e021c2744cc7ed68[0]["entity"];
            }
            switch (self.casttype) {
            case 0:
                if (istrue(var_10cfd730ad727443)) {
                    molotov_branch_register_cast(self.casttype, 0, var_488ae8e1536d02b3);
                    var_1ddc516959ef26a0 = 1;
                    if (isdefined(self.castdata.firstforwarddist)) {
                        var_d0914e2fc24e75f8 = var_488ae8e1536d02b3 - self.caststart;
                        var_64b62cb5dc1e7af6 = vectordot(var_d0914e2fc24e75f8, self.castdir);
                        self.castdata.firstforwarddist = self.castdata.firstforwarddist - var_64b62cb5dc1e7af6;
                        if (self.castdata.firstforwarddist > self.castdata.firstforwardmindist) {
                            var_1ddc516959ef26a0 = 0;
                        } else {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    var_d27f9a12a82f66e3 = molotov_rebuild_angles_up_right(var_a95d04f8f906e839, anglestoright(self.castangles));
                    if (var_1ddc516959ef26a0) {
                        ent = molotov_branch_create_pool(var_488ae8e1536d02b3, var_d27f9a12a82f66e3, var_8d3dd4e0ca9bb1c0, var_54c186a6b8a2ae1);
                        ent thread molotov_pool_start();
                    }
                    self.casttype = 2;
                    self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                    self.castangles = var_d27f9a12a82f66e3;
                    self.iswallcast = undefined;
                } else {
                    molotov_branch_register_cast(self.casttype, undefined, undefined);
                    if (isdefined(self.castdata.firstforwarddist)) {
                        var_d0914e2fc24e75f8 = self.castend - self.caststart;
                        var_64b62cb5dc1e7af6 = vectordot(var_d0914e2fc24e75f8, self.castdir);
                        self.castdata.firstforwarddist = self.castdata.firstforwarddist - var_64b62cb5dc1e7af6;
                        if (self.castdata.firstforwarddist <= self.castdata.firstforwardmindist) {
                            self.castdata.firstforwarddist = undefined;
                        }
                    }
                    self.casttype = 1;
                    self.caststart = self.castend;
                }
                break;
            case 1:
                if (istrue(var_10cfd730ad727443)) {
                    var_d27f9a12a82f66e3 = molotov_rebuild_angles_up_right(var_a95d04f8f906e839, anglestoright(self.castangles));
                    ent = molotov_branch_create_pool(var_488ae8e1536d02b3, var_d27f9a12a82f66e3, var_8d3dd4e0ca9bb1c0, var_54c186a6b8a2ae1);
                    ent thread molotov_pool_start();
                    var_970f97cb88d6b89e = vectordot(anglestoup(self.castangles), var_a95d04f8f906e839);
                    if (var_970f97cb88d6b89e < 0.9848) {
                        molotov_branch_register_cast(self.casttype, 2, var_488ae8e1536d02b3);
                        self.casttype = 2;
                        self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                        self.castangles = var_d27f9a12a82f66e3;
                    } else {
                        molotov_branch_register_cast(self.casttype, 1, var_488ae8e1536d02b3);
                        self.casttype = 0;
                    }
                } else {
                    molotov_branch_register_cast(self.casttype, undefined, undefined);
                    self.caststart = self.castend;
                }
                break;
            case 2:
                if (istrue(var_10cfd730ad727443)) {
                    molotov_branch_register_cast(self.casttype, 3, var_488ae8e1536d02b3);
                    self.casttype = 0;
                    self.caststart = var_488ae8e1536d02b3 + var_a95d04f8f906e839 * 1;
                } else {
                    molotov_branch_register_cast(self.casttype, undefined, undefined);
                    self.casttype = 0;
                }
                break;
            }
            waittillframeend();
        }
        self.iscomplete = 1;
        self.shareddata molotov_shared_data_is_complete(1);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c29
// Size: 0x286
function molotov_branch_is_complete(var_af8745e2185687a8, var_f7d3f0b0605b5824, var_54c186a6b8a2ae1) {
    iscomplete = 0;
    var_3ce5d6eb962629fa = undefined;
    if (!istrue(var_f7d3f0b0605b5824)) {
        iscomplete = self.shareddata molotov_shared_data_is_complete();
    }
    if (!iscomplete) {
        if (isdefined(self.castdata) && isdefined(self.castdata.maxfails) && self.castfails >= self.castdata.maxfails) {
            iscomplete = 1;
        } else if (isdefined(self.castdata) && isdefined(self.castdata.maxcasts) && self.casts >= self.castdata.maxcasts) {
            iscomplete = 1;
        } else if (isdefined(self.castdata) && isdefined(self.castdata.maxents) && self.ents.size >= self.castdata.maxents) {
            iscomplete = 1;
        } else if (istrue(var_af8745e2185687a8) && self.branches.size > 0) {
            var_3ce5d6eb962629fa = 1;
            foreach (var_8d01e03c5c561b39 in self.branches) {
                if (!var_8d01e03c5c561b39 molotov_branch_is_complete(var_af8745e2185687a8, var_f7d3f0b0605b5824)) {
                    var_3ce5d6eb962629fa = 0;
                    break;
                }
            }
            if (var_3ce5d6eb962629fa) {
                iscomplete = 1;
            }
        }
    }
    if (iscomplete && !istrue(self.iscomplete)) {
        oncompletedfunc = self.oncompletedfunc;
        self.oncompletedfunc = undefined;
        if (isdefined(oncompletedfunc)) {
            self [[ oncompletedfunc ]](var_54c186a6b8a2ae1);
        }
        if (istrue(var_3ce5d6eb962629fa)) {
            iscomplete = 0;
            foreach (var_8d01e03c5c561b39 in self.branches) {
                if (!var_8d01e03c5c561b39 molotov_branch_is_complete(1, var_f7d3f0b0605b5824)) {
                    var_3ce5d6eb962629fa = 0;
                    break;
                }
            }
            if (var_3ce5d6eb962629fa) {
                iscomplete = 1;
            }
        }
    }
    if (iscomplete) {
        self.iscomplete = 1;
        molotov_store_branch_ents();
        self.branches = [];
    }
    return iscomplete;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2eb7
// Size: 0x17a
function molotov_branch_register_cast(casttype, var_8e87ebe279cdfcfb, hitposition) {
    molotov_register_cast(self.shareddata);
    self.casts++;
    if (isdefined(var_8e87ebe279cdfcfb)) {
        if (var_8e87ebe279cdfcfb == 0 || var_8e87ebe279cdfcfb == 1 || var_8e87ebe279cdfcfb == 2) {
            self.castfails = 0;
        }
    } else if (casttype == 1) {
        self.castfails++;
    }
    /#
        var_14efa638229efbd5 = undefined;
        if (isdefined(var_8e87ebe279cdfcfb)) {
            var_14efa638229efbd5 = undefined;
            switch (var_8e87ebe279cdfcfb) {
            case 0:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 1:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 2:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 3:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            }
            self.hitpositions[self.hitpositions.size] = hitposition;
            self.hittypes[self.hittypes.size] = var_8e87ebe279cdfcfb;
        } else {
            switch (casttype) {
            case 0:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 1:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            case 2:
                var_14efa638229efbd5 = "<unknown string>";
                break;
            }
        }
        if (istrue(level.var_4482770c326f1498)) {
            if (isdefined(var_14efa638229efbd5)) {
                println(var_14efa638229efbd5);
            }
        }
    #/
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3038
// Size: 0x189
function molotov_create_pool(origin, angles, stuckto, owner, burnsource, burnid, starttime, pooldata, poolmask, id, var_54c186a6b8a2ae1) {
    scriptablename = function_53c4c53197386572(var_54c186a6b8a2ae1, "equip_molotov_pool_mp_p");
    if (isdefined(burnsource.weapon_name) && burnsource.weapon_name == "gas_can_mp") {
        scriptablename = "equip_propane_tank_pool_br";
    }
    scriptable = spawnscriptable(scriptablename, origin, angles);
    scriptable.stuckto = stuckto;
    scriptable.owner = owner;
    scriptable.burnsource = burnsource;
    scriptable.burnid = burnid;
    scriptable.starttime = starttime;
    scriptable.pooldata = pooldata;
    scriptable.poolmask = poolmask;
    scriptable.id = id;
    if (isdefined(stuckto)) {
        offset = rotatevectorinverted(origin - stuckto.origin, stuckto.angles);
        angleoffset = combineangles(invertangles(stuckto.angles), angles);
        scriptable utility::function_6e506f39f121ea8a(stuckto, offset, angleoffset);
    }
    scriptable thread molotov_watch_cleanup_pool();
    return scriptable;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c9
// Size: 0x167
function molotov_branch_create_pool(origin, angles, stuckto, var_54c186a6b8a2ae1) {
    poolmask = self.pooldata.typeid;
    up = anglestoup(angles);
    dot = vectordot(up, (0, 0, 1));
    if (dot <= -0.81915) {
        poolmask = poolmask | 128;
    } else if (dot <= 0.5) {
        poolmask = poolmask | 64;
    } else {
        poolmask = poolmask | 32;
    }
    starttime = self.preventstarttime + self.pooldata.startdelayms;
    scriptable = molotov_create_pool(origin, angles, stuckto, self.shareddata.owner, self.shareddata.burnsource, self.shareddata.burnid, starttime, self.pooldata, poolmask, undefined, var_54c186a6b8a2ae1);
    self.preventstarttime = starttime;
    self.ents[self.ents.size] = scriptable;
    scriptable.id = molotov_get_unique_pool_id();
    scriptable molotov_register_scriptable(self.shareddata);
    return scriptable;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3338
// Size: 0x59
function molotov_pool_start() {
    if (istrue(self.started)) {
        return;
    }
    self.started = 1;
    self endon("death");
    self endon("molotov_pool_end");
    while (gettime() < self.starttime) {
        waitframe();
    }
    self.ended = 0;
    molotov_watch_pool();
    thread molotov_pool_end();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3398
// Size: 0x14e
function molotov_watch_pool() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    if (isdefined(self.stuckto)) {
        self.stuckto endon("death");
    }
    self notify("molotov_pool_watch");
    self.trigger = molotov_create_pool_trigger(self.pooldata.triggerradius, self.pooldata.triggerheight, self.pooldata.triggeroffset);
    self.poolmask = self.poolmask | 1;
    molotov_pool_update_scriptable();
    if (isdefined(self.burnsource.var_e569b726ededed94)) {
        var_53c09eb3450b400e = function_53c4c53197386572(self.burnsource.var_e569b726ededed94.var_2d8b92ed79acc178, 6.5);
        var_539d90b344e4d98c = function_53c4c53197386572(self.burnsource.var_e569b726ededed94.var_f9e916cb313e0dbe, 6.75);
        var_8fc4600d9c0cbb6 = randomfloatrange(var_53c09eb3450b400e, var_539d90b344e4d98c);
    } else {
        var_8fc4600d9c0cbb6 = randomfloatrange(6.5, 6.75);
    }
    wait(var_8fc4600d9c0cbb6);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ed
// Size: 0x9f
function molotov_pool_end(immediate) {
    self endon("death");
    if (istrue(self.ended)) {
        return;
    }
    self notify("molotov_pool_end");
    self.ended = 1;
    self.poolmask = self.poolmask & ~1;
    self.poolmask = self.poolmask | 2;
    molotov_pool_update_scriptable();
    if (!istrue(immediate)) {
        wait(1);
    }
    if (isdefined(self.trigger)) {
        self.trigger thread molotov_delete_trigger();
    }
    if (!istrue(immediate)) {
        wait(3.5);
    }
    thread molotov_delete_scriptable();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3593
// Size: 0x19
function molotov_watch_cleanup_pool() {
    self endon("death");
    molotov_watch_cleanup_pool_internal();
    thread molotov_delete_scriptable();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b3
// Size: 0x45
function molotov_watch_cleanup_pool_internal() {
    self.owner endon("disconnect");
    self.owner endon("joined_team");
    if (isdefined(self.stuckto)) {
        self.stuckto endon("death");
    }
    self waittill("forever");
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ff
// Size: 0x198
function molotov_create_pool_trigger(triggerradius, triggerheight, triggeroffset) {
    origin = self.origin - anglestoup(self.angles) * triggeroffset;
    trigger = spawn("trigger_rotatable_radius", origin, 0, triggerradius, triggerheight);
    trigger.angles = self.angles;
    trigger.id = self.id;
    if (isdefined(self.stuckto) && (!isai(self.stuckto) || isalive(self.stuckto))) {
        trigger enablelinkto();
        trigger linkto(self.stuckto);
    }
    trigger hide();
    struct = spawnstruct();
    struct.trigger = trigger;
    struct.attacker = self.owner;
    struct.inflictor = self.burnsource;
    struct.killcament = self.burnsource;
    struct.burnid = self.burnid;
    struct.stuckto = self.stuckto;
    struct.playersintrigger = [];
    trigger.struct = struct;
    struct thread molotov_watch_pool_trigger_enter();
    struct thread molotov_watch_pool_trigger_exit();
    struct thread molotov_cleanup_pool_trigger();
    trigger molotov_register_trigger();
    return trigger;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379f
// Size: 0x15d
function molotov_watch_pool_trigger_enter() {
    if (isdefined(self.inflictor)) {
        self.inflictor endon("death");
    }
    level endon("game_ended");
    self.trigger endon("death");
    self.attacker endon("disconnect");
    self.attacker endon("joined_team");
    while (1) {
        player = self.trigger waittill("trigger");
        if (!isplayer(player) && !isagent(player)) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        playerowner = ter_op(isdefined(player.owner), player.owner, player);
        if (playerowner != self.attacker && !istrue(namespace_f8065cafc523dba5::playersareenemies(playerowner, self.attacker)) && !istrue(self.inflictor.var_88fe704adf00eadf)) {
            continue;
        }
        entnum = player getentitynumber();
        if (isdefined(self.playersintrigger[entnum])) {
            continue;
        }
        self.playersintrigger[entnum] = player;
        player molotov_start_burning(self.attacker, self.inflictor, self.killcament, self.burnid);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3903
// Size: 0xb5
function molotov_watch_pool_trigger_exit() {
    level endon("game_ended");
    self.trigger endon("death");
    while (1) {
        foreach (id, player in self.playersintrigger) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isreallyalive(player)) {
                continue;
            }
            if (player istouching(self.trigger)) {
                continue;
            }
            self.playersintrigger[id] = undefined;
            player molotov_stop_burning(self.burnid);
        }
        waitframe();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bf
// Size: 0x92
function molotov_cleanup_pool_trigger() {
    level endon("game_ended");
    molotov_cleanup_pool_trigger_end_early();
    foreach (player in self.playersintrigger) {
        if (isdefined(player)) {
            player molotov_stop_burning(self.burnid);
        }
    }
    if (isdefined(self.trigger)) {
        self.trigger thread molotov_delete_trigger();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a58
// Size: 0x55
function molotov_cleanup_pool_trigger_end_early() {
    self.trigger endon("death");
    self.attacker endon("disconnect");
    self.attacker endon("joined_team");
    if (isdefined(self.stuckto)) {
        self.stuckto endon("death");
    }
    while (1) {
        waitframe();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab4
// Size: 0x42
function molotov_pool_update_scriptable() {
    var_dcf9401f976e906f = molotov_get_pool_level_data();
    state = var_dcf9401f976e906f.scriptablestates[self.poolmask];
    self setscriptablepartstate("effects", state, 0);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3afd
// Size: 0x1dc
function molotov_branch_create_sub_branch(id, starttime, firstforwarddist, firstforwardmindist, firstforwardmodanglesfunc, firstforwarddistwall, maxcasts, maxents, var_94b720a60991d4db, var_54c186a6b8a2ae1) {
    shareddata = self.shareddata;
    castdata = molotov_get_cast_data(id);
    pooldata = molotov_get_pool_data(id);
    if (isdefined(self.castdata)) {
        if (self.castfails > self.castdata.maxfails) {
            return;
        }
        if (self.castfails > castdata.maxfails) {
            return;
        }
    }
    if (isdefined(firstforwarddist)) {
        castdata.firstforwarddist = firstforwarddist;
    }
    if (isdefined(firstforwardmindist)) {
        castdata.firstforwardmindist = firstforwardmindist;
    }
    if (isdefined(firstforwardmodanglesfunc)) {
        castdata.firstforwardmodanglesfunc = firstforwardmodanglesfunc;
    }
    if (isdefined(firstforwarddistwall)) {
        castdata.firstforwarddistwall = firstforwarddistwall;
    }
    if (isdefined(maxcasts)) {
        castdata.maxcasts = maxcasts;
    }
    if (isdefined(maxents)) {
        castdata.maxents = maxents;
    }
    var_8d01e03c5c561b39 = molotov_create_branch(shareddata, castdata, pooldata, self, self.caststart, self.castangles, undefined, self.casttype, self.preventstarttime);
    var_8d01e03c5c561b39.castfails = self.castfails;
    self.branches[self.branches.size] = var_8d01e03c5c561b39;
    shareddata.branches[shareddata.branches.size] = var_8d01e03c5c561b39;
    if (istrue(var_94b720a60991d4db)) {
        var_8d01e03c5c561b39 thread molotov_start_branch(var_54c186a6b8a2ae1);
    }
    return var_8d01e03c5c561b39;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce1
// Size: 0x34
function molotov_branch_create_forward_tendril_cone(var_54c186a6b8a2ae1) {
    var_8d01e03c5c561b39 = molotov_branch_create_sub_branch(16, self.preventstarttime, 35, 8, undefined, 44, undefined, undefined, 1, var_54c186a6b8a2ae1);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1c
// Size: 0x38
function molotov_branch_create_left_tendril_cone(var_54c186a6b8a2ae1) {
    var_8d01e03c5c561b39 = molotov_branch_create_sub_branch(16, self.preventstarttime, 35, 8, &molotov_left_tendril_mod_angles, 44, undefined, undefined, 1, var_54c186a6b8a2ae1);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5b
// Size: 0x38
function molotov_branch_create_right_tendril_cone(var_54c186a6b8a2ae1) {
    var_8d01e03c5c561b39 = molotov_branch_create_sub_branch(16, self.preventstarttime, 35, 8, &molotov_right_tendril_mod_angles, 44, undefined, undefined, 1, var_54c186a6b8a2ae1);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d9a
// Size: 0x3a
function molotov_branch_create_tendril_radial(var_54c186a6b8a2ae1) {
    var_8d01e03c5c561b39 = molotov_branch_create_sub_branch(16, self.preventstarttime, 35, 8, &molotov_tendril_mod_angles_radial, 44, 6, 1, 1, var_54c186a6b8a2ae1);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ddb
// Size: 0x6b
function molotov_rotate_angles_about_up(angles, amount) {
    forward = anglestoforward(angles);
    up = anglestoup(angles);
    right = undefined;
    forward = rotatepointaroundvector(up, forward, amount);
    right = vectornormalize(vectorcross(forward, up));
    up = vectorcross(right, forward);
    return axistoangles(forward, right, up);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e4e
// Size: 0x28
function molotov_left_tendril_mod_angles(angles) {
    amount = randomfloatrange(50, 75);
    return molotov_rotate_angles_about_up(angles, amount);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7e
// Size: 0x2b
function molotov_right_tendril_mod_angles(angles) {
    amount = -1 * randomfloatrange(50, 75);
    return molotov_rotate_angles_about_up(angles, amount);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb1
// Size: 0x28
function molotov_tendril_mod_angles_radial(angles) {
    amount = randomfloatrange(-60, 60);
    return molotov_rotate_angles_about_up(angles, amount);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee1
// Size: 0x14
function molotov_cleanup_burn_source() {
    self endon("death");
    wait(20);
    self delete();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3efc
// Size: 0x2b
function molotov_cleanup_grenade(grenade) {
    grenade endon("death");
    waittill_any_2("disconnect", "joined_team");
    grenade delete();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f2e
// Size: 0x24
function molotov_get_level_data() {
    /#
        assertex(isdefined(level.molotov), "molotov_init_pool_data() called before molotov_init().");
    #/
    return level.molotov;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f5a
// Size: 0x3b
function molotov_get_pool_level_data() {
    leveldata = molotov_get_level_data();
    var_dcf9401f976e906f = leveldata.pooldata;
    /#
        assertex(isdefined(var_dcf9401f976e906f), "molotov_get_pool_level_data() called before molotov_init_pool_data().");
    #/
    return var_dcf9401f976e906f;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9d
// Size: 0x3b
function molotov_get_cast_level_data() {
    leveldata = molotov_get_level_data();
    var_ab59026cfe871548 = leveldata.castdata;
    /#
        assertex(isdefined(var_ab59026cfe871548), "molotov_get_cast_level_data() called before molotov_init_pool_data().");
    #/
    return var_ab59026cfe871548;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe0
// Size: 0x55
function molotov_get_unique_pool_id() {
    leveldata = molotov_get_level_data();
    uniquepoolid = leveldata.uniquepoolid;
    leveldata.uniquepoolid++;
    leveldata.poolids = array_add(leveldata.poolids, uniquepoolid);
    return uniquepoolid;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403d
// Size: 0x163
function molotov_get_cast_data(var_2c6848d386785d9f) {
    var_ab59026cfe871548 = molotov_get_cast_level_data();
    castdata = spawnstruct();
    castdata.distforward = var_ab59026cfe871548.distforward[var_2c6848d386785d9f];
    castdata.distdown = var_ab59026cfe871548.distdown[var_2c6848d386785d9f];
    castdata.distup = var_ab59026cfe871548.distup[var_2c6848d386785d9f];
    castdata.maxcasts = var_ab59026cfe871548.maxcasts[var_2c6848d386785d9f];
    castdata.maxfails = var_ab59026cfe871548.maxfails[var_2c6848d386785d9f];
    castdata.maxents = var_ab59026cfe871548.maxents[var_2c6848d386785d9f];
    castdata.distforwardwall = var_ab59026cfe871548.distforwardwall[var_2c6848d386785d9f];
    if (isdefined(var_ab59026cfe871548.firstforwarddist[var_2c6848d386785d9f])) {
        castdata.firstforwarddist = var_ab59026cfe871548.firstforwarddist[var_2c6848d386785d9f];
        castdata.firstforwardmindist = var_ab59026cfe871548.firstforwardmindist[var_2c6848d386785d9f];
        castdata.firstforwardmodanglesfunc = var_ab59026cfe871548.firstforwardmodanglesfunc[var_2c6848d386785d9f];
        if (isdefined(var_ab59026cfe871548.firstforwarddistwall[var_2c6848d386785d9f])) {
            castdata.firstforwarddistwall = var_ab59026cfe871548.firstforwarddistwall[var_2c6848d386785d9f];
        }
    }
    return castdata;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a8
// Size: 0x9f
function molotov_get_pool_data(typeid) {
    var_dcf9401f976e906f = molotov_get_pool_level_data();
    pooldata = spawnstruct();
    pooldata.typeid = typeid;
    pooldata.triggerradius = var_dcf9401f976e906f.triggerradius[typeid];
    pooldata.triggerheight = var_dcf9401f976e906f.triggerheight[typeid];
    pooldata.triggeroffset = var_dcf9401f976e906f.triggeroffset[typeid];
    pooldata.startdelayms = var_dcf9401f976e906f.startdelayms[typeid];
    return pooldata;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424f
// Size: 0x5a
function molotov_get_cast_dir(angles, casttype) {
    switch (casttype) {
    case 0:
        return anglestoforward(angles);
    case 1:
        return (-1 * anglestoup(angles));
    case 2:
        return anglestoup(angles);
        break;
    }
    return undefined;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42b1
// Size: 0xaf
function molotov_get_cast_dist(casttype, castdata, iswallcast) {
    switch (casttype) {
    case 0:
        if (isdefined(castdata.firstforwarddist)) {
            return castdata.firstforwarddist;
            goto LOC_0000006d;
        }
        if (iswallcast && isdefined(castdata.distforwardwall)) {
            return castdata.distforwardwall;
            goto LOC_0000006d;
        }
        return castdata.distforward;
    case 1:
    LOC_0000006d:
        return castdata.distdown;
    case 2:
        return castdata.distup;
        break;
    }
    return undefined;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4368
// Size: 0x36
function molotov_get_cast_contents() {
    return physics_createcontents([0:"physicscontents_missileclip", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_item", 4:"physicscontents_vehicle"]);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a6
// Size: 0x3c
function molotov_rebuild_angles_up_right(up, right) {
    forward = vectornormalize(vectorcross(up, right));
    right = vectorcross(forward, up);
    return axistoangles(forward, right, up);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43ea
// Size: 0x3c
function molotov_rebuild_angles_up_forward(up, forward) {
    right = vectornormalize(vectorcross(forward, up));
    forward = vectorcross(up, right);
    return axistoangles(forward, right, up);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x442e
// Size: 0xa7
function function_d89c621ce916f11e() {
    var_711624163e30b22b = undefined;
    if (!isdefined(level)) {
        return var_711624163e30b22b;
    }
    if (!isdefined(level.molotov)) {
        return var_711624163e30b22b;
    }
    if (!isdefined(level.molotov.var_a3f7381340cf06d9)) {
        var_a3f7381340cf06d9 = namespace_1a507865f681850e::function_2113b6f7cb462692("molotov_mp");
        if (!isdefined(var_a3f7381340cf06d9)) {
            var_a3f7381340cf06d9 = level.equipment.table["equip_molotov"].bundle;
        }
        level.molotov.var_a3f7381340cf06d9 = var_a3f7381340cf06d9;
    }
    var_711624163e30b22b = level.molotov.var_a3f7381340cf06d9;
    return var_711624163e30b22b;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44dd
// Size: 0x10e
function molotov_start_burning(attacker, inflictor, killcament, id) {
    if (self function_6f55d55ccff20d14()) {
        return;
    }
    if (namespace_448ccf1ca136fbbe::function_ec40425fb125f6cf("molotov", attacker.team)) {
        return;
    }
    if (!isdefined(id)) {
        /#
            assertmsg(isdefined(attacker), "molotov_start_burning() attacker must be defined if ID is not.");
        #/
    }
    info = molotov_get_burning_info(1);
    if (!isdefined(id)) {
        id = molotov_get_next_burning_id();
    }
    source = molotov_get_burning_source(attacker, inflictor, killcament, info, id, 1);
    if (isplayer(self) && isdefined(inflictor.var_e569b726ededed94)) {
        source.bundle = inflictor.var_e569b726ededed94;
    }
    codcastersetplayerstatuseffect("fire", -1);
    var_20ab5a5656202253 = 0;
    if (source.count <= 0) {
        var_20ab5a5656202253 = 1;
    }
    source.count++;
    if (var_20ab5a5656202253) {
        thread molotov_update_burning(source);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f2
// Size: 0x89
function molotov_stop_burning(id) {
    info = molotov_get_burning_info();
    if (!isdefined(info)) {
        return;
    }
    source = molotov_get_burning_source(undefined, undefined, undefined, info, id, 0);
    if (isdefined(source)) {
        if (source.count > 0) {
            var_20ab5a5656202253 = 0;
            if (source.count == 1) {
                var_20ab5a5656202253 = 1;
            }
            source.count--;
            if (var_20ab5a5656202253) {
                thread molotov_update_burning(source);
            }
        }
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4682
// Size: 0x58
function molotov_burn_for_time(time, attacker, inflictor, killcament) {
    self endon("death_or_disconnect");
    self endon("clear_burning");
    id = molotov_get_next_burning_id();
    molotov_start_burning(attacker, inflictor, killcament, id);
    wait(time);
    molotov_stop_burning(id);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e1
// Size: 0xc6
function molotov_clear_burning(immediate) {
    self notify("clear_burning");
    if (isdefined(self.burninginfo) && isdefined(self.burninginfo.sources)) {
        foreach (source in self.burninginfo.sources) {
            self.burninginfo.sources[source.id] = undefined;
        }
    }
    codcastersetplayerstatuseffect("fire", 0);
    self.burninginfo = undefined;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ae
// Size: 0x44a
function molotov_update_burning(var_7295d69f42136921) {
    self endon("death_or_disconnect");
    self endon("clear_burning");
    level endon("game_ended");
    self notify("update_burning");
    self endon("update_burning");
    thread molotov_cleanup_burning();
    info = molotov_get_burning_info();
    if (gettime() <= info.updatetimestamp) {
        waitframe();
    }
    while (1) {
        info = molotov_get_burning_info();
        var_1cc80627b9bdb202 = undefined;
        if (self function_6f55d55ccff20d14()) {
            thread molotov_clear_burning();
        }
        foreach (source in info.sources) {
            if (source molotov_burning_source_is_valid()) {
                if (!isdefined(var_1cc80627b9bdb202) || source.id > var_1cc80627b9bdb202) {
                    var_1cc80627b9bdb202 = source.id;
                }
            } else {
                info.sources[source.id] = undefined;
            }
        }
        if (isdefined(var_1cc80627b9bdb202)) {
            info.timeoff = 0;
            info.timeon = info.timeon + 0.05;
            source = info.sources[var_1cc80627b9bdb202];
            if (isdefined(var_7295d69f42136921) && isdefined(var_7295d69f42136921.bundle)) {
                var_3a472c52fa6ced24 = var_7295d69f42136921.bundle;
            } else {
                var_3a472c52fa6ced24 = function_d89c621ce916f11e();
            }
            var_6d3f04f7e314cf47 = function_53c4c53197386572(var_3a472c52fa6ced24.var_1b01e583ecc2fb9a, 1.5);
            var_2bb09e77ee4c7b38 = function_53c4c53197386572(var_3a472c52fa6ced24.var_9369d29bfd0aec71, 0.5);
            damage = function_53c4c53197386572(var_3a472c52fa6ced24.var_e0cf068ccab49e34, 15);
            if (info.timeon > var_6d3f04f7e314cf47) {
                damage = function_53c4c53197386572(var_3a472c52fa6ced24.var_81c84c326caec1d2, 30);
            } else if (info.timeon > var_2bb09e77ee4c7b38) {
                damage = function_53c4c53197386572(var_3a472c52fa6ced24.var_74fbf35a2265fa59, 25);
            }
            damageweapon = function_53c4c53197386572(var_3a472c52fa6ced24.useweapon, "molotov_mp");
            inflictor = undefined;
            damageorigin = source.attacker.origin;
            if (isdefined(source.inflictor)) {
                inflictor = source.inflictor;
                damageorigin = source.inflictor.origin;
            }
            meansofdeath = function_53c4c53197386572(var_3a472c52fa6ced24.means_of_death, "MOD_EXPLOSIVE");
            if (istrue(var_3a472c52fa6ced24.var_ff298245b12a34fa) && damage >= self.health) {
                function_f632348cbb773537(level.molotovdamagethrottle, self);
            }
            if (info.timetodamage <= 0) {
                self.var_604d21c5b1326910 = gettime();
                self dodamage(damage, damageorigin, source.attacker, inflictor, meansofdeath, damageweapon, "none", undefined, 65536);
                info.firstdamagedone = 1;
                info.timetodamage = function_53c4c53197386572(var_3a472c52fa6ced24.var_439885d26a2f9bf5, 0.25);
            } else {
                if (!istrue(info.firstdamagedone)) {
                    self.var_604d21c5b1326910 = gettime();
                    self dodamage(damage, damageorigin, source.attacker, inflictor, meansofdeath, damageweapon, "none", undefined, 65536);
                    info.firstdamagedone = 1;
                }
                info.timetodamage = info.timetodamage - 0.05;
            }
        } else {
            info.timeoff = info.timeoff + 0.05;
            if (info.timeoff >= 0.25) {
                thread molotov_clear_burning();
            }
        }
        info.updatetimestamp = gettime();
        wait(0.05);
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bff
// Size: 0x28
function molotov_is_burning() {
    info = molotov_get_burning_info();
    return isdefined(info) && info.sources.size > 0;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c2f
// Size: 0x9d
function molotov_get_burning_info(create) {
    info = self.burninginfo;
    if (!isdefined(info) && istrue(create)) {
        info = spawnstruct();
        info.timeon = 0;
        info.timeoff = 0;
        info.timetodamage = 0.25;
        info.updatetimestamp = 0;
        info.victim = self;
        info.sources = [];
        info.firstdamagedone = 0;
        self.burninginfo = info;
    }
    return info;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd4
// Size: 0xca
function molotov_get_burning_source(attacker, inflictor, killcament, info, id, var_e5ea290eaea85d2) {
    source = info.sources[id];
    if (!isdefined(source)) {
        if (istrue(var_e5ea290eaea85d2)) {
            source = spawnstruct();
            source.attacker = attacker;
            source.inflictor = inflictor;
            source.hasinflictor = isdefined(inflictor);
            source.killcament = killcament;
            source.info = info;
            source.id = id;
            source.count = 0;
            info.sources[id] = source;
        }
    }
    return source;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4da6
// Size: 0xe6
function molotov_burning_source_is_valid() {
    if (!isdefined(self.attacker)) {
        return 0;
    }
    if (!isdefined(self.info.victim)) {
        return 0;
    }
    if (!isreallyalive(self.info.victim)) {
        return 0;
    }
    if (self.attacker != self.info.victim && !istrue(namespace_f8065cafc523dba5::playersareenemies(self.attacker, self.info.victim)) && isdefined(self.inflictor) && !istrue(self.inflictor.var_88fe704adf00eadf)) {
        return 0;
    }
    if (self.hasinflictor && !isdefined(self.inflictor)) {
        return 0;
    }
    if (self.count <= 0) {
        return 0;
    }
    return 1;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e94
// Size: 0x53
function molotov_get_next_burning_id() {
    leveldata = molotov_get_level_data();
    if (!isdefined(leveldata.burningid)) {
        leveldata.burningid = 0;
    }
    id = leveldata.burningid;
    leveldata.burningid++;
    return id;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eef
// Size: 0x22
function molotov_cleanup_burning() {
    self notify("cleanup_burning");
    self endon("cleanup_burning");
    childthread molotov_cleanup_burning_on_death();
    childthread molotov_cleanup_burning_on_game_end();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f18
// Size: 0x2a
function molotov_cleanup_burning_on_death() {
    self endon("disconnect");
    self endon("clear_burning");
    level endon("game_ended");
    self waittill("death");
    thread molotov_clear_burning(1);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f49
// Size: 0x21
function molotov_cleanup_burning_on_game_end() {
    self endon("death_or_disconnect");
    self endon("clear_burning");
    level waittill("game_ended");
    thread molotov_clear_burning();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f71
// Size: 0x9f
function molotov_on_player_damaged(data) {
    if (data.meansofdeath == "MOD_IMPACT") {
        return 1;
    }
    data.victim.var_aaa78716e99a2760 = 0;
    if (isdefined(data.inflictor) && is_equal(data.inflictor.weapon_name, "molotov_mp")) {
        data.victim.var_aaa78716e99a2760 = 1;
    }
    data.victim thread namespace_3bbb5a98b932c46f::enableburnfxfortime(0.5);
    return 1;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5018
// Size: 0x96
function molotov_watch_fx() {
    self notify("molotov_clear_fx");
    self endon("molotov_clear_fx");
    self endon("death_or_disconnect");
    var_8e784b7cb7322eb = 0;
    while (1) {
        var_b818f06c051b78f0 = 0;
        objweapon = self getheldoffhand();
        if (!isnullweapon(objweapon) && objweapon.basename == "molotov_mp") {
            var_b818f06c051b78f0 = 1;
        }
        if (var_b818f06c051b78f0 && !var_8e784b7cb7322eb) {
            thread molotov_begin_fx();
        } else if (var_8e784b7cb7322eb && !var_b818f06c051b78f0) {
            thread molotov_end_fx();
        }
        var_8e784b7cb7322eb = var_b818f06c051b78f0;
        waitframe();
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50b5
// Size: 0x75
function molotov_begin_fx() {
    self endon("death_or_disconnect");
    self endon("molotov_end_fx");
    self.playingmolotovwickfx = 1;
    self setscriptablepartstate("equipMtovFXWorld", "neutral", 0);
    self setscriptablepartstate("equipMtovFXView", "active", 0);
    waittime = 0.4;
    wait(waittime);
    self setscriptablepartstate("equipMtovFXWorld", "active", 0);
    self waittill("offhand_fired");
    waitframe();
    thread molotov_end_fx();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5131
// Size: 0x46
function molotov_end_fx() {
    self notify("molotov_end_fx");
    if (istrue(self.playingmolotovwickfx)) {
        self setscriptablepartstate("equipMtovFXWorld", "neutral", 0);
        self setscriptablepartstate("equipMtovFXView", "neutral", 0);
    }
    self.playingmolotovwickfx = undefined;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x517e
// Size: 0x13
function molotov_clear_fx() {
    self notify("molotov_clear_fx");
    thread molotov_end_fx();
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5198
// Size: 0x89
function molotov_cleanup_branch(var_8d01e03c5c561b39, immediate) {
    var_8d01e03c5c561b39 notify("cleanup_branch");
    if (isdefined(var_8d01e03c5c561b39.ents)) {
        foreach (scriptable in var_8d01e03c5c561b39.ents) {
            if (isdefined(scriptable)) {
                scriptable thread molotov_pool_end(immediate);
            }
        }
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5228
// Size: 0x121
function molotov_cleanup_pool(grenade, immediate) {
    if (isdefined(grenade.shareddata)) {
        if (isdefined(grenade.shareddata.branches)) {
            foreach (var_8d01e03c5c561b39 in grenade.shareddata.branches) {
                molotov_cleanup_branch(var_8d01e03c5c561b39, immediate);
            }
        }
        if (isdefined(grenade.shareddata.oldbranchents)) {
            foreach (scriptable in grenade.shareddata.oldbranchents) {
                if (isdefined(scriptable)) {
                    scriptable thread molotov_pool_end(immediate);
                }
            }
        }
    }
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5350
// Size: 0x25
function function_946f8ebb6c6efd92() {
    self.shareddata.burnsource delete();
    molotov_cleanup_pool(self, 0);
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537c
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5399
// Size: 0x167
function molotov_branch_draw_hits() {
    /#
        while (1) {
            if (istrue(self.shareddata.iscomplete)) {
                break;
            }
            if (istrue(self.iscomplete)) {
                break;
            }
            if (istrue(level.dbgmolodrawhits)) {
                ids = getarraykeys(self.hitpositions);
                foreach (id in ids) {
                    hitposition = self.hitpositions[id];
                    hittype = self.hittypes[id];
                    function_5ac76a3e234f3e1a(hitposition, hittype, 0.05);
                }
            }
            wait(0.05);
        }
        if (istrue(level.dbgmolodrawhits)) {
            ids = getarraykeys(self.hitpositions);
            foreach (id in ids) {
                hitposition = self.hitpositions[id];
                hittype = self.hittypes[id];
                function_5ac76a3e234f3e1a(hitposition, hittype, 5);
            }
        }
    #/
}

// Namespace molotov/namespace_df478cc572a311d3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5507
// Size: 0xb9
function function_5ac76a3e234f3e1a(hitposition, hittype, duration) {
    /#
        color = undefined;
        switch (hittype) {
        case 0:
            color = (1, 1, 0);
            break;
        case 2:
            color = (1, 0, 0);
            break;
        case 3:
            color = (0, 0, 1);
            break;
        default:
            color = (1, 1, 1);
            break;
        }
        thread namespace_d028276791d9cff6::drawsphere(hitposition, 2, duration, color);
    #/
}

