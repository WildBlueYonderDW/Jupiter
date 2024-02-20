// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_compass.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\mp\flags.gsc;

#namespace namespace_6f311b9f78e8e82;

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x141
// Size: 0xb3
function autoexec main() {
    /#
        namespace_e4c20df2c9115a56::registerhandlecommand(&function_c96d7535862e245c);
    #/
    flag_wait("wztrain_array_set");
    if (getdvarint(@"hash_c15b52558ebc810a", 1)) {
        foreach (train in level.wztrain_info.var_c3604781a9d33a7a) {
            var_9fe9065ceed7d314 = train[0];
            if (var_9fe9065ceed7d314.linked_model isvehicle()) {
                var_9fe9065ceed7d314 thread function_5f65af64b995ff82();
            }
        }
    }
}

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fb
// Size: 0x94
function function_eb14f1e1637f1482(var_bd437e647db702f9, spawndata) {
    var_808591e7e173f240 = "v000";
    var_84d08597070fa23c = getdvar(@"hash_fbbc1781e1b34506", var_808591e7e173f240);
    if (var_84d08597070fa23c != var_808591e7e173f240) {
        spawndata.mtx = getdvar(@"hash_fbbc1781e1b34506", var_84d08597070fa23c);
    }
    vehicle = vehicle_spawn(var_bd437e647db702f9, spawndata);
    vehicle_compass::vehicle_compass_hide(vehicle);
    vehicle vehicleshowonminimap(0);
    vehicle vehicle_damage::vehicle_damage_setcandamage(0);
    vehicle_tracking_deregisterinstance(vehicle);
    return vehicle;
}

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x297
// Size: 0x5e
function private function_5f65af64b995ff82() {
    traincar = self;
    traincar endon("train_mtx_applied");
    while (1) {
        success = var_a1a45f30ec897602 = part = traincar waittill("train_control_used");
        if (success) {
            function_cc178534ef642e6f(var_a1a45f30ec897602, traincar.linked_model);
        }
    }
}

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x27
function private function_1210b86df14de182(vehicle) {
    return namespace_4b0406965e556711::gameflag("prematch_fade_done") && !isdefined(vehicle.mtx);
}

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x9d
function private function_cc178534ef642e6f(player, vehicle) {
    if (!function_1210b86df14de182(vehicle)) {
        return;
    }
    if (isdefined(player.vehiclecustomization)) {
        var_7731adef63e19b0c = vehicle function_d93ec4635290febd();
        if (!isdefined(vehicle.mtx) && !istrue(vehicle.var_7ee6203c5532a9e6)) {
            mtx = function_471cde1983a05f66(player, var_7731adef63e19b0c);
            function_4201160d49c885a7(vehicle, mtx);
            if (isdefined(vehicle.mtx)) {
                vehicle.linked_brush notify("train_mtx_applied");
            }
        }
    }
}

// Namespace namespace_6f311b9f78e8e82/namespace_e829e38302f8f85d
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3cf
// Size: 0x1c2
function private function_c96d7535862e245c(command, args) {
    var_967cb1a144269ab6 = "cargo_train";
    firstplayer = level.players[0];
    if (!isdefined(firstplayer)) {
        return;
    }
    switch (command) {
    case #"hash_2899e5a679a1e049":
        if (!isdefined(args[0])) {
            break;
        }
        switch (args[0]) {
        case #"hash_2871e46c1eee9774":
            if (!isdefined(args[1])) {
                break;
            }
            switch (args[1]) {
            case #"hash_b9c0ff6cd406fe0f":
                announcement(string(namespace_1f188a13f7e79610::function_fa537f1ab52a76d1("veh_jup_nuclear_locomotive")));
                break;
            case #"hash_334c896e25dc8345":
                var_a46d9cfec2e2ca35 = function_86f6f784630b11fb("veh_jup_nuclear_locomotive");
                dummy = 0;
                break;
            case #"hash_6ad13f0635bc091b":
                vehicle = level.wztrain_info.var_c3604781a9d33a7a[var_967cb1a144269ab6][0].linked_model;
                function_cc178534ef642e6f(firstplayer, vehicle);
                break;
            case #"hash_819aac6f5ae2fb78":
                var_bd437e647db702f9 = args[2];
                if (!isdefined(var_bd437e647db702f9)) {
                    break;
                }
                traincar = level.wztrain_info.var_c3604781a9d33a7a[var_967cb1a144269ab6][0];
                spawndata = spawnstruct();
                spawndata.origin = traincar.origin + (0, 200, 0);
                vehicle = namespace_1f188a13f7e79610::vehicle_spawn(var_bd437e647db702f9, spawndata);
                vehicle linkto(traincar);
                break;
            }
            break;
        }
        break;
    }
}

