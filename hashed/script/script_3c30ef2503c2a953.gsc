// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_3214e6fcdce468a7;
#using script_5a4a5d9ba343ff8f;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;

#namespace namespace_fd7d952a8a7decb8;

// Namespace namespace_fd7d952a8a7decb8/namespace_a56834c83a5b0f07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225
// Size: 0x2b
function function_84c0e1e271bafa7b() {
    level callback::add("player_connect", &function_3894840410c9bf11);
    level.var_55ea2b11378ae8dd = function_e4c99b0f178ffb98("zombie_health_bar_update", 2);
}

// Namespace namespace_fd7d952a8a7decb8/namespace_a56834c83a5b0f07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x257
// Size: 0x14
function function_3894840410c9bf11(params) {
    thread watch_target_health();
}

// Namespace namespace_fd7d952a8a7decb8/namespace_a56834c83a5b0f07
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272
// Size: 0xb0
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

// Namespace namespace_fd7d952a8a7decb8/namespace_a56834c83a5b0f07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329
// Size: 0x621
function watch_target_health() {
    self endon("disconnect");
    self.targethealthinfo = [];
    var_6f54922d8787736 = 0;
    var_cdbda03ce3d658b4 = 0;
    var_b933d4f13b0f6da2 = 0;
    var_8a0cdead74fe133b = undefined;
    var_e2056d3211d33280 = 0;
    var_e167ed7a36b5375e = cos(30);
    setdvarifuninitialized(@"hash_6d6c52eb3ebea9e6", 1000);
    var_578bc39651a16e6 = getdvarint(@"hash_6d6c52eb3ebea9e6");
    while (1) {
        if (self.sessionstate != "playing") {
            waitframe();
            continue;
        }
        tracestart = self geteye();
        if (self GetCameraThirdPerson()) {
            tracestart = self GetCameraThirdPersonOrigin();
        }
        playerangles = self getplayerangles();
        var_898f508242fa99f6 = anglestoforward(playerangles);
        var_898f508242fa99f6 = vectornormalize(var_898f508242fa99f6);
        tracedist = 2500;
        if (self playerads() || isdefined(var_8a0cdead74fe133b) && istrue(var_8a0cdead74fe133b.var_1d6756d9fe7a5156)) {
            tracedist = 7500;
        }
        traceend = tracestart + var_898f508242fa99f6 * tracedist;
        var_451e9c8586b874b0 = distance(tracestart, traceend);
        var_674bc7989105ce9 = 0;
        var_22aad45998b73e2a = function_b1eef70090b5b7b5(tracestart, var_451e9c8586b874b0, function_869ccb4e3451b8c6([0:"etype_ai", 1:"etype_vehicle", 2:"etype_turret"]), [0:self]);
        foreach (ent in var_22aad45998b73e2a) {
            if (!istrue(ent.var_1e0eb63ecb3f1e2) || !ent val::get("show_healthbar")) {
                continue;
            }
            if (vectordot(var_898f508242fa99f6, vectornormalize(ent.origin - self.origin)) > var_e167ed7a36b5375e) {
                var_674bc7989105ce9 = 1;
                break;
            }
        }
        waitframe();
        if (var_674bc7989105ce9) {
            ignoreents = [];
            ignoreents[ignoreents.size] = self;
            var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(1, 0, 0, 0, 1, 1, 1, 0, 0);
            results = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8, 0, 0, 1);
            var_9595f9643c69a295 = results["entity"];
            frametime = gettime();
            var_c3dbf4f52dfdda03 = isdefined(var_9595f9643c69a295) && istrue(var_9595f9643c69a295.var_1e0eb63ecb3f1e2) && var_9595f9643c69a295 val::get("show_healthbar");
            if (var_c3dbf4f52dfdda03) {
                var_6f54922d8787736 = 1;
            } else if (isdefined(var_8a0cdead74fe133b)) {
                if (var_6f54922d8787736) {
                    var_e2056d3211d33280 = frametime;
                    var_6f54922d8787736 = 0;
                    var_cdbda03ce3d658b4 = 1;
                }
                if (var_e2056d3211d33280 + var_578bc39651a16e6 > frametime) {
                    var_9595f9643c69a295 = var_8a0cdead74fe133b;
                    var_c3dbf4f52dfdda03 = 1;
                }
            }
            if (var_c3dbf4f52dfdda03) {
                if (isdefined(var_9595f9643c69a295.var_4919d15787f01154)) {
                    /#
                        assert(!isdefined(var_9595f9643c69a295.fake_health) || var_9595f9643c69a295.fake_health <= 3000000);
                    #/
                    /#
                        assert(!isdefined(var_9595f9643c69a295.max_fake_health) || var_9595f9643c69a295.max_fake_health <= 3000000);
                    #/
                } else {
                    /#
                        assert(!isdefined(var_9595f9643c69a295.health) || var_9595f9643c69a295.health <= 3000000);
                    #/
                    /#
                        assert(!isdefined(var_9595f9643c69a295.maxhealth) || var_9595f9643c69a295.maxhealth <= 3000000);
                    #/
                }
                var_f8bc4db18d63fe71 = -1;
                if (isdefined(var_9595f9643c69a295.difficulty)) {
                    var_f8bc4db18d63fe71 = level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593[var_9595f9643c69a295.difficulty];
                }
                stateid = 0;
                if (istrue(var_9595f9643c69a295 ent_flag("turned")) || var_9595f9643c69a295 function_8ce7894f1a52fb77("charm")) {
                    stateid = 1;
                }
                typeid = function_53c4c53197386572(var_9595f9643c69a295.var_9d26ac1e325367ce, -1);
                var_31f1ceee4b368ce3 = function_53c4c53197386572(var_9595f9643c69a295.nameindex, 0);
                entitynum = var_9595f9643c69a295 getentitynumber();
                update_target_health_variable("ui_target_enemy_type", typeid);
                update_target_health_variable("ui_target_enemy_difficulty", var_f8bc4db18d63fe71);
                update_target_health_variable("ui_target_enemy_name_index", var_31f1ceee4b368ce3);
                update_target_health_variable("ui_target_enemy_state", stateid, "ui_target_state_notify", entitynum);
                if (isdefined(var_9595f9643c69a295.var_4919d15787f01154)) {
                    update_target_health_variable("ui_target_max_health", var_9595f9643c69a295.max_fake_health, "ui_target_health_notify", entitynum);
                    update_target_health_variable("ui_target_health", var_9595f9643c69a295.fake_health, "ui_target_health_notify", entitynum);
                } else {
                    update_target_health_variable("ui_target_max_health", var_9595f9643c69a295.maxhealth, "ui_target_health_notify", entitynum);
                    update_target_health_variable("ui_target_health", var_9595f9643c69a295.health, "ui_target_health_notify", entitynum);
                }
                update_target_health_variable("ui_target_healthbar_vis", 1);
                update_target_health_variable("ui_target_entity_num", entitynum);
                var_8a0cdead74fe133b = var_9595f9643c69a295;
            } else if (var_cdbda03ce3d658b4) {
                update_target_health_variable("ui_target_healthbar_vis", 0);
                update_target_health_variable("ui_target_entity_num", -1);
                var_cdbda03ce3d658b4 = 0;
            }
            if (isdefined(var_9595f9643c69a295) && istrue(var_9595f9643c69a295.var_9f009877c3bea958)) {
                function_cb0c83ad449f616(var_9595f9643c69a295);
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

// Namespace namespace_fd7d952a8a7decb8/namespace_a56834c83a5b0f07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951
// Size: 0x8d
function function_cb0c83ad449f616(var_9595f9643c69a295) {
    typeid = function_53c4c53197386572(var_9595f9643c69a295.var_9d26ac1e325367ce, -1);
    var_31f1ceee4b368ce3 = function_53c4c53197386572(var_9595f9643c69a295.nameindex, 0);
    entitynum = var_9595f9643c69a295 getentitynumber();
    update_target_health_variable("ui_target_enemy_type", typeid);
    update_target_health_variable("ui_target_enemy_name_index", var_31f1ceee4b368ce3);
    update_target_health_variable("ui_target_entity_num", entitynum);
    update_target_health_variable("ui_target_nameplate_vis", 1);
}

