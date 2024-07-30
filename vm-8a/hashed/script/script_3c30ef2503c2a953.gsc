#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\engine\throttle.gsc;
#using script_5a4a5d9ba343ff8f;
#using scripts\common\values.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_fd7d952a8a7decb8;

// Namespace namespace_fd7d952a8a7decb8 / namespace_a56834c83a5b0f07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225
// Size: 0x2a
function function_84c0e1e271bafa7b() {
    level callback::add("player_connect", &function_3894840410c9bf11);
    level.var_55ea2b11378ae8dd = throttle_initialize("zombie_health_bar_update", 2);
}

// Namespace namespace_fd7d952a8a7decb8 / namespace_a56834c83a5b0f07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x13
function function_3894840410c9bf11(params) {
    thread watch_target_health();
}

// Namespace namespace_fd7d952a8a7decb8 / namespace_a56834c83a5b0f07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272
// Size: 0xaf
function update_target_health_variable(var_e9d476a3809cb3f1, value, var_2be1ff56b5ef7757, var_79720293f809096b) {
    if (!isdefined(value)) {
        return;
    }
    var_e177082c5a0cb686 = isdefined(self.targethealthinfo[var_e9d476a3809cb3f1]);
    var_547e3f9765be80bd = var_e177082c5a0cb686 && value != self.targethealthinfo[var_e9d476a3809cb3f1];
    if (!var_e177082c5a0cb686 || var_547e3f9765be80bd) {
        self setclientomnvar(var_e9d476a3809cb3f1, value);
        if (isdefined(var_2be1ff56b5ef7757) && isdefined(var_79720293f809096b) && var_547e3f9765be80bd && var_79720293f809096b == self.targethealthinfo["ui_target_entity_num"]) {
            self setclientomnvar(var_2be1ff56b5ef7757, gettime());
        }
        self.targethealthinfo[var_e9d476a3809cb3f1] = value;
    }
}

// Namespace namespace_fd7d952a8a7decb8 / namespace_a56834c83a5b0f07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329
// Size: 0x620
function watch_target_health() {
    self endon("disconnect");
    self.targethealthinfo = [];
    var_6f54922d8787736 = 0;
    var_cdbda03ce3d658b4 = 0;
    var_b933d4f13b0f6da2 = 0;
    savedentity = undefined;
    var_e2056d3211d33280 = 0;
    var_e167ed7a36b5375e = cos(30);
    setdvarifuninitialized(@"hash_6d6c52eb3ebea9e6", 1000);
    var_578bc39651a16e6 = getdvarint(@"hash_6d6c52eb3ebea9e6");
    while (true) {
        if (self.sessionstate != "playing") {
            waitframe();
            continue;
        }
        tracestart = self geteye();
        if (self GetCameraThirdPerson()) {
            tracestart = self GetCameraThirdPersonOrigin();
        }
        playerangles = self getplayerangles();
        playerlookdir = anglestoforward(playerangles);
        playerlookdir = vectornormalize(playerlookdir);
        tracedist = 2500;
        if (self playerads() || isdefined(savedentity) && istrue(savedentity.var_1d6756d9fe7a5156)) {
            tracedist = 7500;
        }
        traceend = tracestart + playerlookdir * tracedist;
        traceradius = distance(tracestart, traceend);
        var_674bc7989105ce9 = 0;
        var_22aad45998b73e2a = function_b1eef70090b5b7b5(tracestart, traceradius, function_869ccb4e3451b8c6(["etype_ai", "etype_vehicle", "etype_turret"]), [self]);
        foreach (ent in var_22aad45998b73e2a) {
            if (!istrue(ent.var_1e0eb63ecb3f1e2) || !ent val::get("show_healthbar")) {
                continue;
            }
            if (vectordot(playerlookdir, vectornormalize(ent.origin - self.origin)) > var_e167ed7a36b5375e) {
                var_674bc7989105ce9 = 1;
                break;
            }
        }
        waitframe();
        if (var_674bc7989105ce9) {
            ignoreents = [];
            ignoreents[ignoreents.size] = self;
            tracecontents = scripts\engine\trace::create_contents(1, 0, 0, 0, 1, 1, 1, 0, 0);
            results = scripts\engine\trace::ray_trace(tracestart, traceend, ignoreents, tracecontents, 0, 0, 1);
            hitentity = results["entity"];
            frametime = gettime();
            showentity = isdefined(hitentity) && istrue(hitentity.var_1e0eb63ecb3f1e2) && hitentity val::get("show_healthbar");
            if (showentity) {
                var_6f54922d8787736 = 1;
            } else if (isdefined(savedentity)) {
                if (var_6f54922d8787736) {
                    var_e2056d3211d33280 = frametime;
                    var_6f54922d8787736 = 0;
                    var_cdbda03ce3d658b4 = 1;
                }
                if (var_e2056d3211d33280 + var_578bc39651a16e6 > frametime) {
                    hitentity = savedentity;
                    showentity = 1;
                }
            }
            if (showentity) {
                if (isdefined(hitentity.var_4919d15787f01154)) {
                    assert(!isdefined(hitentity.fake_health) || hitentity.fake_health <= 3000000);
                    assert(!isdefined(hitentity.max_fake_health) || hitentity.max_fake_health <= 3000000);
                } else {
                    assert(!isdefined(hitentity.health) || hitentity.health <= 3000000);
                    assert(!isdefined(hitentity.maxhealth) || hitentity.maxhealth <= 3000000);
                }
                difficultyid = -1;
                if (isdefined(hitentity.difficulty)) {
                    difficultyid = level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593[hitentity.difficulty];
                }
                stateid = 0;
                if (istrue(hitentity ent_flag("turned")) || hitentity function_8ce7894f1a52fb77("charm")) {
                    stateid = 1;
                }
                typeid = default_to(hitentity.aitypeid, -1);
                nameindexid = default_to(hitentity.nameindex, 0);
                entitynum = hitentity getentitynumber();
                update_target_health_variable("ui_target_enemy_type", typeid);
                update_target_health_variable("ui_target_enemy_difficulty", difficultyid);
                update_target_health_variable("ui_target_enemy_name_index", nameindexid);
                update_target_health_variable("ui_target_enemy_state", stateid, "ui_target_state_notify", entitynum);
                if (isdefined(hitentity.var_4919d15787f01154)) {
                    update_target_health_variable("ui_target_max_health", hitentity.max_fake_health, "ui_target_health_notify", entitynum);
                    update_target_health_variable("ui_target_health", hitentity.fake_health, "ui_target_health_notify", entitynum);
                } else {
                    update_target_health_variable("ui_target_max_health", hitentity.maxhealth, "ui_target_health_notify", entitynum);
                    update_target_health_variable("ui_target_health", hitentity.health, "ui_target_health_notify", entitynum);
                }
                update_target_health_variable("ui_target_healthbar_vis", 1);
                update_target_health_variable("ui_target_entity_num", entitynum);
                savedentity = hitentity;
            } else if (var_cdbda03ce3d658b4) {
                update_target_health_variable("ui_target_healthbar_vis", 0);
                update_target_health_variable("ui_target_entity_num", -1);
                var_cdbda03ce3d658b4 = 0;
            }
            if (isdefined(hitentity) && istrue(hitentity.var_9f009877c3bea958)) {
                function_cb0c83ad449f616(hitentity);
                var_b933d4f13b0f6da2 = 1;
            } else if (var_b933d4f13b0f6da2) {
                update_target_health_variable("ui_target_nameplate_vis", 0);
                var_b933d4f13b0f6da2 = 0;
            }
        } else if (isdefined(self.targethealthinfo["ui_target_entity_num"]) && self.targethealthinfo["ui_target_entity_num"] != -1) {
            update_target_health_variable("ui_target_healthbar_vis", 0);
            update_target_health_variable("ui_target_entity_num", -1);
        }
        function_f632348cbb773537(level.var_55ea2b11378ae8dd, self);
    }
}

// Namespace namespace_fd7d952a8a7decb8 / namespace_a56834c83a5b0f07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951
// Size: 0x8c
function function_cb0c83ad449f616(hitentity) {
    typeid = default_to(hitentity.aitypeid, -1);
    nameindexid = default_to(hitentity.nameindex, 0);
    entitynum = hitentity getentitynumber();
    update_target_health_variable("ui_target_enemy_type", typeid);
    update_target_health_variable("ui_target_enemy_name_index", nameindexid);
    update_target_health_variable("ui_target_entity_num", entitynum);
    update_target_health_variable("ui_target_nameplate_vis", 1);
}

