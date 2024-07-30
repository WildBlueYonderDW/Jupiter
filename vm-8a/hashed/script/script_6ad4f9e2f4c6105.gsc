#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\engine\math.gsc;
#using script_5fd79768b8941cfb;
#using scripts\mp\gametypes\br_dev.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_collision.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment\at_mine.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using script_1cf2ed809496bf4e;
#using script_669760f0500e4358;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\engine\flags.gsc;
#using scripts\engine\scriptable.gsc;
#using script_3aacf02225ca0da5;
#using script_662cbac61c1ae7e2;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\poi.gsc;
#using script_48814951e916af89;
#using script_2bc0b0102f9b7751;
#using scripts\engine\trace.gsc;
#using scripts\common\vehicle_paths.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\player.gsc;
#using script_7ab5b649fa408138;
#using script_65f58f3c394dcf9a;
#using script_2573174416494cb1;
#using script_371b4c2ab5861e62;
#using scripts\mp\gametypes\br_public.gsc;

#namespace br_movingtrain;

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1396
// Size: 0xe2
function init(forceidle) {
    level endon("game_ended");
    if (!isdefined(level.wztrain_info)) {
        level.wztrain_info = spawnstruct();
    }
    flag_init("wztrain_array_set");
    flag_init("wztrain_processed_track");
    flag_init("wztrain_spawn_started");
    flag_init("wztrain_anim_playing");
    registersharedfunc("br_movingtrain", "predictCargoTrainPositions", &predictCargoTrainPositions);
    registersharedfunc("br_movingtrain", "changeCargoTrainSpeed", &changeCargoTrainSpeed);
    level.wztrain_info.var_d17ae48dc6e221d3 = &function_a4e20b4dc4ebd306;
    if (!level init_train_arrays(forceidle)) {
        println("<dev string:x1c>");
        return 0;
    }
    level thread wait_for_sequence_start(forceidle);
    scripts\engine\scriptable::scriptable_addusedcallback(&function_a93a6d7f562fdfcc);
    /#
        scripts\mp\gametypes\br_dev::registerhandlecommand(&function_c96d7535862e245c);
    #/
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1480
// Size: 0x7e
function wait_for_sequence_start(forceidle) {
    /#
        level thread warp_player_debug();
    #/
    if (tolower(getdvar(@"hash_f644e90eb9a008cf")) != "mp_train_wz") {
        level thread traincar_wait_until_shown("br_prematchEnded");
        level waittill("br_prematchEnded");
        if (istrue(level.helltrain)) {
            namespace_bfef6903bca5845d::function_af3034a7c69d7edb(namespace_14d36171baccf528::function_30a0d7ca3fae40cc("merc"));
            wait 1;
        }
    }
    if (!scripts\mp\gametypes\br_public::function_57244bfdbe157401()) {
        return;
    }
    level thread play_train_sequence();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1506
// Size: 0x216
function train_wzcircle_override() {
    if (getdvarfloat(@"hash_b1243debdeb65967", 0) == 0) {
        return;
    }
    var_af1bfad61d056875 = getdvarfloat(@"hash_b1243debdeb65967", 0);
    if (var_af1bfad61d056875 != 1) {
        if (randomint(100) < var_af1bfad61d056875 * 100) {
            return;
        }
    }
    var_7c21d374dadb257f = array_combine(level.br_level.br_circleclosetimes, level.br_level.br_circledelaytimes);
    totalroundtime = 0;
    for (i = 0; i < var_7c21d374dadb257f.size; i++) {
        totalroundtime += var_7c21d374dadb257f[i];
    }
    if (totalroundtime <= 0) {
        return;
    }
    totalroundtime = train_wzcircle_time_subtractfrom(totalroundtime);
    xanim = script_model%iw9_mp_train_saba_a_cw;
    xanimlength = getanimlength(xanim);
    if (!isdefined(xanimlength) || xanimlength <= 0) {
        return;
    }
    lengthmod = totalroundtime / xanimlength;
    lengthdelta = lengthmod - int(lengthmod);
    circleposattime = getoriginforanimtime((0, 0, 13), (0, 0, 0), xanim, lengthdelta);
    level.wztrain_info.circletimestruct = spawnstruct();
    level.wztrain_info.circletimestruct.xanimlength = xanimlength;
    level.wztrain_info.circletimestruct.lengthmod = lengthmod;
    level.wztrain_info.circletimestruct.lengthdelta = lengthdelta;
    level.wztrain_info.circletimestruct.totalroundtime = totalroundtime;
    level.wztrain_info.circletimestruct.circleposattime = circleposattime;
    setdvar(@"hash_eb589c6bd2884bbb", circleposattime);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1724
// Size: 0xb5
function train_wzcircle_time_subtractfrom(totalroundtime) {
    var_95035071e6650a79 = 425;
    if (getdvarint(@"hash_b2e704499feadf68", 425) != 425) {
        var_95035071e6650a79 = getdvarint(@"hash_b2e704499feadf68", 425);
    }
    if (getdvarint(@"hash_b35edec538a597b0", 75) > 0) {
        input = getdvarint(@"hash_b35edec538a597b0", 75);
        var_95035071e6650a79 += randomint(input);
    }
    incrementcheck = 10;
    for (i = 0; i < var_95035071e6650a79 - incrementcheck; i += incrementcheck) {
        if (totalroundtime - incrementcheck > 0) {
            totalroundtime -= incrementcheck;
        }
    }
    return totalroundtime;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e2
// Size: 0x954
function init_train_arrays(forceidle) {
    level.wztrain_info.train_array = [];
    level.wztrain_info.trains = [];
    level.wztrain_info.var_aa90aa9c1017c831 = [];
    level.wztrain_info.var_1a30b87276ed28e5 = [];
    level.wztrain_info.var_738f809bac14ae04 = 0;
    if (isdefined(level.wztrain_info.var_b330d787646fc2f)) {
        foreach (index, train_callback in level.wztrain_info.var_b330d787646fc2f) {
            train_name = level.wztrain_info.train_names[index];
            train_array = [[ train_callback ]]();
            foreach (traincar in train_array) {
                traincar.train_name = train_name;
            }
            level.wztrain_info.trains[train_name] = train_array;
            level.wztrain_info.train_array = array_combine(level.wztrain_info.train_array, train_array);
        }
        level.wztrain_info.var_738f809bac14ae04 = level.wztrain_info.var_b330d787646fc2f.size > 1;
    } else {
        level.wztrain_info.train_names = ["cargo_train"];
        if (isdefined(getent("train_car_0", "script_noteworthy"))) {
            level.wztrain_info.trains[level.wztrain_info.train_names[0]] = [getent("train_car_0", "script_noteworthy"), getent("train_car_1", "script_noteworthy"), getent("train_car_2", "script_noteworthy"), getent("train_car_3", "script_noteworthy"), getent("train_car_4", "script_noteworthy"), getent("train_car_5", "script_noteworthy"), getent("train_car_6", "script_noteworthy"), getent("train_car_7", "script_noteworthy")];
            if (istrue(level.helltrain)) {
                var_2240ffa1b0f295b6 = [getent("train_car_8", "script_noteworthy"), getent("train_car_9", "script_noteworthy"), getent("train_car_10", "script_noteworthy"), getent("train_car_11", "script_noteworthy"), getent("train_car_12", "script_noteworthy")];
                level.wztrain_info.trains[level.wztrain_info.train_names[0]] = array_combine(level.wztrain_info.trains[level.wztrain_info.train_names[0]], var_2240ffa1b0f295b6);
            }
        } else {
            level.wztrain_info.trains[level.wztrain_info.train_names[0]] = [getent("train_car_18", "script_noteworthy"), getent("train_car_17", "script_noteworthy"), getent("train_car_16", "script_noteworthy"), getent("train_car_15", "script_noteworthy"), getent("train_car_14", "script_noteworthy"), getent("train_car_13", "script_noteworthy"), getent("train_car_12", "script_noteworthy"), getent("train_car_11", "script_noteworthy")];
        }
        level.wztrain_info.var_738f809bac14ae04 = isdefined(getent("train_car_20", "script_noteworthy"));
        if (level.wztrain_info.var_738f809bac14ae04) {
            level.wztrain_info.train_names = array_add(level.wztrain_info.train_names, "br_passenger_train");
            level.wztrain_info.trains[level.wztrain_info.train_names[1]] = [getent("train_car_20", "script_noteworthy"), getent("train_car_21", "script_noteworthy"), getent("train_car_22", "script_noteworthy"), getent("train_car_23", "script_noteworthy"), getent("train_car_24", "script_noteworthy"), getent("train_car_25", "script_noteworthy"), getent("train_car_26", "script_noteworthy"), getent("train_car_27", "script_noteworthy")];
            level.wztrain_info.train_array = [];
            foreach (trainname in level.wztrain_info.train_names) {
                foreach (traincar in level.wztrain_info.trains[trainname]) {
                    level.wztrain_info.train_array[level.wztrain_info.train_array.size] = traincar;
                }
            }
        } else {
            level.wztrain_info.train_array = level.wztrain_info.trains[level.wztrain_info.train_names[0]];
        }
    }
    foreach (traincar in level.wztrain_info.train_array) {
        if (!isent(traincar)) {
            /#
                var_31ad45832836c740 = "<dev string:x3b>";
                foreach (var_6e67ea0e643a5279 in level.wztrain_info.train_array) {
                    if (isdefined(var_6e67ea0e643a5279) && isdefined(var_6e67ea0e643a5279.script_noteworthy)) {
                        var_31ad45832836c740 += "<dev string:x3c>" + var_6e67ea0e643a5279.script_noteworthy;
                    }
                }
                println("<dev string:x3e>" + var_31ad45832836c740);
            #/
            return false;
        }
    }
    if (isdefined(level.wztrain_info.var_fbe0974b7eb3c519)) {
        [[ level.wztrain_info.var_fbe0974b7eb3c519 ]]();
    }
    train_wzcircle_override();
    train_play_anim_init();
    train_attach_player_hurts();
    train_associate_models_with_brushes();
    train_attach_brushes_to_models();
    train_attach_models_to_assembly();
    function_b91ff337122b31fe();
    if (isdefined(level.wztrain_info.var_2afe24ee912ab8a1)) {
        [[ level.wztrain_info.var_2afe24ee912ab8a1 ]]();
    }
    if (isdefined(level.wztrain_info.var_3079813e25479249)) {
        level thread [[ level.wztrain_info.var_3079813e25479249 ]]();
    } else {
        level thread train_vfx_init();
    }
    level thread train_sfx_init();
    level thread function_85a3956c7630ea05();
    level thread train_handle_collide_mines();
    function_a4fa12bce9b083c4();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        foreach (spawntype, spawndata in level.wztrain_info.spawndata.configs) {
            if (getdvarint(hashcat(@"hash_82213c16d0a252f0", spawntype), 1)) {
                level thread function_c1c6070579e999cb(level.wztrain_info.train_array, spawntype);
            }
        }
    }
    flag_set("wztrain_array_set");
    return true;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213f
// Size: 0x246
function train_associate_models_with_brushes() {
    var_59ef9ff0d44b7d97 = "train_car_model_";
    if (isdefined(level.wztrain_info.var_ecf7a389446fc63e)) {
        var_59ef9ff0d44b7d97 = [[ level.wztrain_info.var_ecf7a389446fc63e ]]();
    }
    for (i = 0; i < level.wztrain_info.train_array.size; i++) {
        traincar_model = undefined;
        var_eae7ee50d1f67572 = level.wztrain_info.train_array[i];
        script_noteworthy = undefined;
        if (isarray(var_59ef9ff0d44b7d97)) {
            script_noteworthy = var_59ef9ff0d44b7d97[i];
        } else {
            var_c6273ba32a3bfb6e = strtok(var_eae7ee50d1f67572.script_noteworthy, "_");
            var_1e136f70344dc06f = var_c6273ba32a3bfb6e[var_c6273ba32a3bfb6e.size - 1];
            script_noteworthy = var_59ef9ff0d44b7d97 + var_1e136f70344dc06f;
        }
        var_1857048d180fe014 = getentarray(script_noteworthy, "script_noteworthy");
        if (getdvarint(@"hash_bcfe79955df6639b", 1) > 0 && isdefined(var_1857048d180fe014)) {
            var_1857048d180fe014 = var_eae7ee50d1f67572 array_sort_with_func(var_1857048d180fe014, &function_eae41bc5dc33624b);
        }
        if (isdefined(var_1857048d180fe014)) {
            traincar_model = var_1857048d180fe014[0];
        }
        var_5f0b0e4335ee6f67 = traincar_model;
        is_vehicle = isdefined(var_eae7ee50d1f67572.var_4f1ca43ddcf85dbd);
        if (is_vehicle) {
            old_model = traincar_model;
            spawndata = spawnstruct();
            spawndata.origin = old_model.origin;
            spawndata.angles = old_model.angles;
            spawndata.var_b6ffe24870282af2 = 1;
            traincar_model = namespace_6f311b9f78e8e82::function_eb14f1e1637f1482(var_eae7ee50d1f67572.var_4f1ca43ddcf85dbd, spawndata);
            traincar_model.script_noteworthy = script_noteworthy;
            old_model setmodel("tag_origin");
        }
        if (isdefined(var_5f0b0e4335ee6f67) && isent(var_5f0b0e4335ee6f67)) {
            var_eae7ee50d1f67572.linked_mover = var_5f0b0e4335ee6f67;
            var_eae7ee50d1f67572.linked_mover markkeyframedmover();
        }
        if (isdefined(traincar_model) && isent(traincar_model)) {
            var_eae7ee50d1f67572.linked_model = traincar_model;
            traincar_model.linked_brush = var_eae7ee50d1f67572;
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238d
// Size: 0x46
function function_eae41bc5dc33624b(modela, modelb) {
    return distancesquared(modela.origin, self.origin) < distancesquared(modelb.origin, self.origin);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23dc
// Size: 0x8e
function train_attach_brushes_to_models() {
    for (i = 0; i < level.wztrain_info.train_array.size; i++) {
        var_eae7ee50d1f67572 = level.wztrain_info.train_array[i];
        train_init_as_vehicle(var_eae7ee50d1f67572);
        var_eae7ee50d1f67572 forcenetfieldhighlod(1);
        var_eae7ee50d1f67572 setmoveroptimized(1);
        var_eae7ee50d1f67572 setmoverantilagged(1);
        var_eae7ee50d1f67572 linkto(var_eae7ee50d1f67572.linked_mover);
        var_eae7ee50d1f67572 function_3e71a76b50a93e05("movingplatform_rotator");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2472
// Size: 0x1c9
function train_attach_models_to_assembly() {
    foreach (train, array in level.wztrain_info.trains) {
        animent = level.wztrain_info.animent[train];
        for (i = 0; i < array.size; i++) {
            traincar = array[i];
            thistag = level.wztrain_info.train_tag_array[i];
            tagorigin = animent gettagorigin(thistag);
            tagoffset = level.wztrain_info.train_tagoffset_array[i];
            traincar.linked_model forcenetfieldhighlod(1);
            traincar.linked_model setmoveroptimized(1);
            traincar.linked_model setmoverantilagged(1);
            traincar.linked_model.origin = tagorigin;
            traincar.linked_mover forcenetfieldhighlod(1);
            traincar.linked_mover setmoveroptimized(1);
            traincar.linked_mover setmoverantilagged(1);
            traincar.linked_mover.origin = tagorigin;
            if (getdvarint(@"hash_f524d127e4ba82c4", 0) > 0) {
                traincar.linked_mover linkto(animent, thistag, tagoffset, (0, 0, 0));
            }
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2643
// Size: 0x6a
function function_76471a1d0597c6d(array) {
    if (!isdefined(array) || array.size <= 3) {
        return array;
    }
    lastindex = array.size - 1;
    slice = array_slice(array, 1, lastindex);
    shuffle = array_randomize(slice);
    return array_combine([array[0]], shuffle, [array[lastindex]]);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26b6
// Size: 0x93
function train_init_as_vehicle(vehicle) {
    vehiclename = "cargo_train";
    if (isdefined(vehicle.linked_model.vehiclename)) {
        vehiclename = vehicle.linked_model.vehiclename;
    }
    vehicle.vehiclename = vehiclename;
    vehicle.linked_model.vehiclename = vehiclename;
    train_initcollision(vehiclename);
    vehicle thread function_e549e7bb5a16c3bc();
    vehicle.linked_model thread function_e549e7bb5a16c3bc();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2751
// Size: 0xa
function train_stop() {
    level notify("obj_stop_train");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2763
// Size: 0x25
function traincar_wait_until_shown(wait_for) {
    level endon("game_ended");
    waitframe();
    train_elements_disable();
    level waittill(wait_for);
    train_elements_enable();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2790
// Size: 0x82
function function_a4b4d45fdcc959d8(enable_hurt) {
    traincar = self;
    if (isdefined(traincar.var_f285d73b82ca4c5c)) {
        foreach (traincar_hurt in traincar.var_f285d73b82ca4c5c) {
            traincar_hurt.hurt_enabled = enable_hurt;
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x281a
// Size: 0x6b
function train_elements_enable() {
    foreach (train in level.wztrain_info.animent) {
        function_9dd6a5882c62dd6(train.animname);
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288d
// Size: 0x111
function function_9dd6a5882c62dd6(specific_train) {
    if (array_contains(level.wztrain_info.var_1a30b87276ed28e5, specific_train)) {
        level.wztrain_info.var_1a30b87276ed28e5 = array_remove(level.wztrain_info.var_1a30b87276ed28e5, specific_train);
        foreach (traincar in level.wztrain_info.train_array) {
            if (isdefined(traincar.linked_model)) {
                traincar.linked_model show();
                traincar.linked_model solid();
                traincar solid();
                traincar function_a4b4d45fdcc959d8(1);
                if (isdefined(traincar.ammo_restock)) {
                    traincar.ammo_restock thread function_5a1ebf95de1ad6c9();
                }
            }
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x29a6
// Size: 0x6b
function private function_5a1ebf95de1ad6c9() {
    wait 3;
    part = "military_ammo_restock";
    if (!self getscriptablehaspart(part)) {
        return;
    }
    var_ce0b801d8b163d83 = "useable_on_no_collision";
    state_fallback = "useable_on";
    if (self getscriptableparthasstate(part, var_ce0b801d8b163d83)) {
        self setscriptablepartstate(part, var_ce0b801d8b163d83);
        return;
    }
    if (self getscriptableparthasstate(part, state_fallback)) {
        self setscriptablepartstate(part, state_fallback);
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a19
// Size: 0x6b
function train_elements_disable() {
    foreach (train in level.wztrain_info.animent) {
        function_e7a82d389007737b(train.animname);
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a8c
// Size: 0x157
function function_e7a82d389007737b(specific_train) {
    if (!array_contains(level.wztrain_info.var_1a30b87276ed28e5, specific_train)) {
        train = level.wztrain_info.trains[specific_train];
        level.wztrain_info.var_1a30b87276ed28e5 = array_add(level.wztrain_info.var_1a30b87276ed28e5, specific_train);
        foreach (traincar in train) {
            if (isdefined(traincar.linked_model)) {
                traincar.linked_model hide();
                traincar.linked_model notsolid();
                traincar notsolid();
                traincar function_a4b4d45fdcc959d8(0);
                if (isdefined(traincar.ammo_restock)) {
                    traincar.ammo_restock setscriptablepartstate("military_ammo_restock", "useable_on");
                }
                if (traincar.linked_model isscriptable()) {
                    level notify("forced_kill_callout_" + traincar.linked_model.script_noteworthy);
                }
            }
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2beb
// Size: 0x1fc
function function_3bbb7d783f45035e(train_name) {
    var_26f757527d21f859 = 2000;
    level endon("game_ended");
    flag_wait("wztrain_array_set");
    animent = level.wztrain_info.animent[train_name];
    animent notify("watch_nearby");
    animent endon("watch_nearby");
    var_43dd126faa05f6be = level.wztrain_info.trains[train_name];
    while (true) {
        train_center = vectorlerp(var_43dd126faa05f6be[0].origin, var_43dd126faa05f6be[var_43dd126faa05f6be.size - 1].origin, 0.5);
        var_4b15590cf2140316 = distance(var_43dd126faa05f6be[0].origin, train_center) + var_26f757527d21f859;
        nearby = sortbydistancecullbyradius(level.players, train_center, var_4b15590cf2140316);
        for (i = nearby.size - 1; i >= 0; i--) {
            player = nearby[i];
            is_near = 0;
            foreach (traincar in [var_43dd126faa05f6be[0], var_43dd126faa05f6be[int((var_43dd126faa05f6be.size - 1) / 2)], var_43dd126faa05f6be[var_43dd126faa05f6be.size - 1]]) {
                if (isdefined(player.origin) && distancesquared(traincar.origin, player.origin) <= var_26f757527d21f859 * var_26f757527d21f859) {
                    is_near = 1;
                    break;
                }
            }
            if (!is_near) {
                nearby[i] = undefined;
            }
        }
        level.wztrain_info.var_aa90aa9c1017c831[train_name] = nearby;
        wait 2;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2def
// Size: 0x4f
function train_initcollision(vehicle_ref, forceidle) {
    if (istrue(forceidle)) {
        return;
    }
    var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle_collision::vehicle_collision_getleveldataforvehicle(vehicle_ref, 1);
    var_e2818ad39a3341b4.handleeventcallback = &handle_train_veh_collision;
    var_e2818ad39a3341b4.class = "immovable";
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e46
// Size: 0x7f
function handle_train_veh_collision(vehicle1, vehicle2, position, normal, normalspeed) {
    collisionresult = function_84114acff04cfccb(vehicle1, vehicle2, "cargo_train", 1);
    if (isdefined(collisionresult)) {
        if (collisionresult.vehicle scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_isburningdown() || collisionresult.isvehicledestroyed) {
            namespace_8361bad7391de074::function_719e931249c15652(collisionresult.vehicle);
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ecd
// Size: 0x308
function train_handle_collide_mines() {
    level endon("game_ended");
    level endon("obj_stop_train");
    if (!isdefined(level.mines)) {
        level.mines = [];
    }
    var_513dd84d5f0143d5 = [];
    foreach (train_array in level.wztrain_info.trains) {
        var_513dd84d5f0143d5[var_513dd84d5f0143d5.size] = train_array[0];
    }
    var_f8266ab10167447f = 150;
    if (getdvarfloat(@"hash_731567d6c424394d", 150) != 150) {
        var_f8266ab10167447f = getdvarfloat(@"hash_731567d6c424394d", 150);
    }
    maxdist = var_f8266ab10167447f - 25;
    maxdistsq = maxdist * maxdist;
    while (true) {
        all_mines = level.mines;
        if (all_mines.size > 0) {
            foreach (train_engine in var_513dd84d5f0143d5) {
                var_863c619037f3ac74 = train_engine.origin + rotatevector((375, 0, -100), train_engine.angles);
                foreach (mine in all_mines) {
                    if (!isdefined(mine)) {
                        continue;
                    }
                    if (istrue(mine.markedfordelete)) {
                        continue;
                    }
                    if (distance2dsquared(mine.origin, var_863c619037f3ac74) > maxdistsq) {
                        continue;
                    }
                    if (distancesquared(mine.origin, var_863c619037f3ac74) > maxdistsq) {
                        continue;
                    }
                    if (isdefined(mine.weapon_name)) {
                        if (mine.weapon_name == "trophy_mp") {
                            mine scripts\mp\equipment\trophy_system::sweeptrophy();
                            mine.markedfordelete = 1;
                            continue;
                        }
                        if (mine.weapon_name == "claymore_mp") {
                            mine scripts\mp\equipment\claymore::sweepclaymore();
                            mine.markedfordelete = 1;
                            continue;
                        }
                        if (mine.weapon_name == "at_mine_mp") {
                            mine scripts\mp\equipment\at_mine::at_mine_destroy();
                            mine.markedfordelete = 1;
                            continue;
                        }
                        if (mine.weapon_name == "tac_insert_trigger") {
                            mine scripts\mp\equipment\tac_insert::deletetacinsert();
                            mine.markedfordelete = 1;
                            continue;
                        }
                        if (mine.weapon_name == "deployed_decoy_mp") {
                            mine namespace_861236fa8235a2ba::function_183a7478c53fd2f2();
                            mine.markedfordelete = 1;
                        }
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31dd
// Size: 0xa0
function play_train_sequence() {
    level endon("game_ended");
    flag_set("wztrain_spawn_started");
    foreach (train, array in level.wztrain_info.trains) {
        level thread train_play_anim(train, array);
    }
    level thread function_e079d6a3354cecbe();
    /#
        if (getdvarint(@"hash_e7014031cbb7e017", 0)) {
            announcement("<dev string:x5a>");
        }
    #/
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3285
// Size: 0xa9
function function_e079d6a3354cecbe() {
    flag_wait("wztrain_anim_playing");
    wait 2;
    for (i = 0; i < level.wztrain_info.train_array.size; i++) {
        trainmodel = level.wztrain_info.train_array[i].linked_model;
        if (isdefined(trainmodel) && trainmodel isscriptable() && trainmodel getscriptablehaspart("icon") && trainmodel getscriptableparthasstate("icon", "visible")) {
            trainmodel setscriptablepartstate("icon", "visible");
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3336
// Size: 0x22
function private function_a772944222db6641() {
    return !flag("wztrain_scriptables_init_done") && getdvarint(@"hash_85b2dc73cdc711df", 1);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3361
// Size: 0xf0
function function_b5fa61da19d13e6f(type) {
    if (!isdefined(type)) {
        return undefined;
    }
    if (type == "br_loot_cache") {
        if (level.wztrain_info.var_1dcb906ad3a2524c > level.wztrain_info.totaltrainlootcrates - level.wztrain_info.var_4483132e24522a93) {
            if (level.wztrain_info.var_344bd4a74aa0d27f < level.wztrain_info.var_4483132e24522a93) {
                level.wztrain_info.var_344bd4a74aa0d27f++;
                return "br_loot_cache_lege";
            }
        } else if (level.wztrain_info.var_344bd4a74aa0d27f < level.wztrain_info.var_4483132e24522a93 && cointoss()) {
            level.wztrain_info.var_344bd4a74aa0d27f++;
            return "br_loot_cache_lege";
        }
    }
    return type;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345a
// Size: 0xe0
function function_18c8df150f3cdc88(type, traincar) {
    scriptable = self;
    initialstate = undefined;
    if (scriptable getscriptableisloot()) {
        initialstate = function_6f817b71c98d6307(function_40fd49171fad19d3(type));
    }
    isinvisible = isdefined(initialstate) && initialstate == #"inactive_invisible";
    if (!isinvisible && scriptable getscriptablehaspart("body") && scriptable getscriptableparthasstate("body", "closed_usable_no_collision")) {
        scriptable setscriptablepartstate("body", "closed_usable_no_collision");
    } else if (isdefined(initialstate) && scriptable getscriptablehaspart("body") && scriptable getscriptableparthasstate("body", initialstate)) {
        scriptable setscriptablepartstate("body", initialstate);
    }
    if (function_a772944222db6641()) {
        namespace_67eb9cdced4f7767::function_80c06497397ed757(scriptable, "military_loot_crate_01_br_nogeometry");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3542
// Size: 0xb1
function private function_2a98ae0039aaf2a7(type, origin, angles, traincar) {
    if (!function_fcd65de73a5fd25()) {
        return spawnstruct();
    }
    while (!isdefined(level.uavtowers)) {
        waitframe();
    }
    towerstruct = spawnstruct();
    towerstruct.origin = origin;
    towerstruct.angles = angles;
    scriptable = namespace_872204d77e9872c0::function_a517440c8faa2939(towerstruct, "dmz_uav_tower_short");
    towerstruct.poi = "jup_bigmap_train site_124";
    towerstruct.var_62bd5c5aa7a876db = 1;
    traincar.var_db03bf8e1712fd09 = 0;
    return scriptable;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35fc
// Size: 0x24
function private function_ed521f04d8dc3364(type, traincar) {
    self setscriptablepartstate("dmz_uav_tower", "reset");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3628
// Size: 0x87
function private function_17ed33f7d92c5f9a(type, origin, angles, traincar) {
    stationstruct = spawnstruct();
    stationstruct.origin = origin;
    stationstruct.angles = angles;
    stationstruct.var_4041cda36a5951ff = "br_plunder_box_nocollision";
    scriptable = namespace_67eb9cdced4f7767::function_863b4187f0955e66(stationstruct);
    if (function_a772944222db6641()) {
        function_80c06497397ed757(scriptable, "military_purchase_kiosk_02_nogeometry");
    }
    return scriptable;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x36b8
// Size: 0x140
function private function_8b56636541be6a77(type, origin, angles, traincar) {
    scriptable = undefined;
    if (type == "military_ammo_restock") {
        model_name = "military_ammo_restock_location";
        if (function_a772944222db6641()) {
            model_name = "military_ammo_restock_location_solid_mp";
        }
        model = spawn("script_model", traincar.origin);
        model setmodel(model_name);
        model.angles = angles;
        if (getdvarint(@"hash_8066b3a35a1021cc", 0)) {
            model linkto(traincar.linked_model, "tag_origin", origin, angles);
        } else {
            model linkto(traincar.linked_model, "tag_origin", origin + (0, 0, 90), angles);
        }
        model markkeyframedmover();
        model forcenetfieldhighlod(1);
        model setmoveroptimized(1);
        model setmoverantilagged(1);
        scriptable = model getlinkedscriptableinstance();
        scriptable.linkedparent = traincar.linked_model;
    } else {
        scriptable = spawnscriptable(type, traincar.origin + origin, angles);
    }
    return scriptable;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3801
// Size: 0x20
function private function_5a2d0337756ce274(type, traincar) {
    traincar.ammo_restock = self;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3829
// Size: 0xd1
function private function_e669b734cd168643(type, origin, angles, traincar) {
    if (type == "palfa_fuel_spawn") {
        struct = spawnstruct();
        struct.origin = origin;
        struct.angles = angles;
        struct.traincar = traincar;
        level.var_7d2577fb3be5a656 = struct;
        return struct;
    }
    var_eca672da2770dfaf = isdefined(level.wztrain_info.trains["cargo_train"]) && array_contains(level.wztrain_info.trains["cargo_train"], traincar);
    if (type == "military_ammo_restock_noent" && var_eca672da2770dfaf) {
        return function_b002d10bd710cc12(origin, traincar);
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x59f
function function_a4fa12bce9b083c4() {
    function_db060d9aac85790f();
    if (isdefined(level.wztrain_info.trains["cargo_train"]) && getdvarint(@"hash_8066b3a35a1021cc", 0)) {
        var_be55e00f00db802b = level.wztrain_info.trains["cargo_train"] function_5226a0cd6878ac46(1);
        var_be55e10f00db825e = level.wztrain_info.trains["cargo_train"] function_5226a0cd6878ac46(-2);
        kiosk_offset = (-30, 75, -30);
        function_fa04a5bfe00504bc(var_be55e00f00db802b, "kiosk", "br_plunder_box", kiosk_offset, (0, -90, 0));
        function_fa04a5bfe00504bc(var_be55e10f00db825e, "kiosk", "br_plunder_box", rotatevector(kiosk_offset, (0, 180, 0)), (0, 90, 0));
        cache_offset = (32.5, 65, -30);
        function_fa04a5bfe00504bc(var_be55e00f00db802b, "loot", "br_reusable_loot_cache", cache_offset, (0, 180, 0));
        function_fa04a5bfe00504bc(var_be55e10f00db825e, "loot", "br_reusable_loot_cache", rotatevector(cache_offset, (0, 180, 0)), (0, 0, 0));
        ammo_offset = (-150, -48, 45);
        function_fa04a5bfe00504bc(var_be55e00f00db802b, "ammo", "military_ammo_restock", ammo_offset, (0, 90, 0));
        function_fa04a5bfe00504bc(var_be55e10f00db825e, "ammo", "military_ammo_restock", rotatevector(ammo_offset, (0, 180, 0)), (0, -90, 0));
        var_939c5aaee2bf2b49 = level.wztrain_info.trains["cargo_train"] function_5226a0cd6878ac46(3);
        function_fa04a5bfe00504bc(var_939c5aaee2bf2b49, "uav", "dmz_uav_tower", (0, -50, -30), (0, 90, 0));
    }
    if (getdvarint(@"hash_3882ef385d4a919a", 0) == 1) {
        train_engine = level.wztrain_info.trains["cargo_train"][0];
        var_c4837817d97cc836 = (-23, 0, -85);
        presents = spawnscriptable("veh_jup_military_train_nuclear_cab_blocking_holiday", train_engine localtoworldcoords(var_c4837817d97cc836));
        presents setscriptablepartstate("presents", "visible");
        presents thread function_edcebaee73e9929(undefined, train_engine, var_c4837817d97cc836, (0, 0, 0), undefined);
    }
    if (isdefined(level.wztrain_info.var_2a581c73d9e11aa0)) {
        foreach (callback in level.wztrain_info.var_2a581c73d9e11aa0) {
            [[ callback ]]();
        }
    }
    if (getdvarint(@"hash_e619c4c384b28bb7", 1) <= 0) {
        function_fa04a5bfe00504bc(level.wztrain_info.train_array[1], "ammo", "military_ammo_restock_train", (20, 0, 5), (0, 90, 0));
    }
    foreach (spawntype, spawndata in level.wztrain_info.spawndata.configs) {
        function_6b27e38d8a44794d(level.wztrain_info.train_array, spawntype);
    }
    var_251e39f07f8bcb3f = 0;
    foreach (traincar in level.wztrain_info.train_array) {
        if (isdefined(traincar.spawn_info) && isdefined(traincar.spawn_info["loot"])) {
            var_251e39f07f8bcb3f += traincar.spawn_info["loot"].count;
        }
    }
    level.wztrain_info.totaltrainlootcrates = var_251e39f07f8bcb3f;
    level.wztrain_info.var_4483132e24522a93 = 4;
    level.wztrain_info.var_344bd4a74aa0d27f = 0;
    level.wztrain_info.var_1dcb906ad3a2524c = 0;
    if (getdvarint(@"hash_30a292c132a583ba", -1) >= 0) {
        level.wztrain_info.var_4483132e24522a93 = getdvarint(@"hash_30a292c132a583ba", 0);
    }
    if (level.wztrain_info.var_4483132e24522a93 > level.wztrain_info.totaltrainlootcrates) {
        level.wztrain_info.var_4483132e24522a93 = level.wztrain_info.totaltrainlootcrates;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ea9
// Size: 0x6d
function function_3ca2a4be197dfa5b(callback) {
    if (!isdefined(level.wztrain_info.var_2a581c73d9e11aa0)) {
        level.wztrain_info.var_2a581c73d9e11aa0 = [];
    }
    size = level.wztrain_info.var_2a581c73d9e11aa0.size;
    level.wztrain_info.var_2a581c73d9e11aa0[size] = callback;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1e
// Size: 0xaa
function function_fa04a5bfe00504bc(traincar, spawn_type, var_91839babd32261f4, offset, angles) {
    noteworthy = traincar.script_noteworthy;
    spawn_names = noteworthy + "_" + spawn_type;
    var_6fb83f7279969479 = spawnstruct();
    var_6fb83f7279969479.script_noteworthy = spawn_names;
    var_6fb83f7279969479.origin = traincar localtoworldcoords(offset);
    var_6fb83f7279969479.angles = angles;
    var_6fb83f7279969479.targetname = var_91839babd32261f4;
    addstruct(var_6fb83f7279969479);
    return var_6fb83f7279969479;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd1
// Size: 0xf7
function function_db060d9aac85790f() {
    lootspawndata = function_3b5a11ea11e271c3("loot");
    if (getdvarint(@"hash_f252952942ac1731", 0) == 1) {
        lootspawndata.var_2f0395c820ddb30 = &function_b5fa61da19d13e6f;
    }
    lootspawndata.var_20792ee55e7cef4b = &function_18c8df150f3cdc88;
    lootspawndata.spawncallback = &function_e669b734cd168643;
    ammospawndata = function_3b5a11ea11e271c3("ammo");
    ammospawndata.spawncallback = &function_8b56636541be6a77;
    ammospawndata.var_20792ee55e7cef4b = &function_5a2d0337756ce274;
    kioskspawndata = function_3b5a11ea11e271c3("kiosk");
    kioskspawndata.spawncallback = &function_17ed33f7d92c5f9a;
    uavspawndata = function_3b5a11ea11e271c3("uav");
    uavspawndata.spawncallback = &function_2a98ae0039aaf2a7;
    uavspawndata.var_20792ee55e7cef4b = &function_ed521f04d8dc3364;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d0
// Size: 0xd8
function function_3b5a11ea11e271c3(spawntype) {
    if (!isdefined(level.wztrain_info.spawndata)) {
        spawndata = spawnstruct();
        spawndata.configs = [];
        spawndata.scriptables = [];
        level.wztrain_info.spawndata = spawndata;
    }
    spawndata = level.wztrain_info.spawndata.configs[spawntype];
    if (!isdefined(spawndata)) {
        spawndata = function_3f3f25512adf8649();
        spawndata.maxcount = getdvarint(hashcat(@"hash_cbf441b8b33ab2bb", spawntype, "_max_count"), -1);
        level.wztrain_info.spawndata.configs[spawntype] = spawndata;
    }
    return spawndata;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b1
// Size: 0x42
function function_3f3f25512adf8649() {
    spawndata = spawnstruct();
    spawndata.maxcount = -1;
    spawndata.var_2f0395c820ddb30 = undefined;
    spawndata.spawncallback = undefined;
    spawndata.var_20792ee55e7cef4b = undefined;
    return spawndata;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41fc
// Size: 0x20e
function function_6b27e38d8a44794d(train_array, spawn_type) {
    scripts\mp\gametypes\br::function_15fa5f9b3a2b7a52();
    foreach (traincar in train_array) {
        noteworthy = traincar.script_noteworthy;
        spawn_names = noteworthy + "_" + spawn_type;
        var_48c792c1662791fe = getstructarray(spawn_names, "script_noteworthy");
        if (noteworthy == "train_jup_13" && spawn_type == "safe") {
            var_48c792c1662791fe = getstructarray("train_jup_model_13_safe", "script_noteworthy");
        }
        if (noteworthy == "train_car_14") {
            var_e2d874ab09c5165a = getstructarray("train_car_14", "script_noteworthy");
            if (var_e2d874ab09c5165a.size > 0) {
                var_48c792c1662791fe = var_e2d874ab09c5165a;
            }
        }
        if (var_48c792c1662791fe.size > 0) {
            traincar.spawned_objects[spawn_type] = [];
            traincar.spawn_info[spawn_type] = spawnstruct();
            traincar.spawn_info[spawn_type].count = var_48c792c1662791fe.size;
        }
        for (i = 0; i < var_48c792c1662791fe.size; i++) {
            var_c35e1c74aefb4992 = var_48c792c1662791fe[i].origin - traincar.origin;
            offset = rotatevectorinverted(var_c35e1c74aefb4992, traincar.angles);
            traincar.spawn_info[spawn_type].offsets[i] = offset;
            traincar.spawn_info[spawn_type].angles[i] = var_48c792c1662791fe[i].angles;
            traincar.spawn_info[spawn_type].type[i] = var_48c792c1662791fe[i].targetname;
        }
    }
    scripts\mp\gametypes\br::function_84e10866b5154784();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4412
// Size: 0x38f
function function_c1c6070579e999cb(train_array, spawn_type) {
    level endon("game_ended");
    flag_wait("wztrain_array_set");
    flag_wait("br_armory_kiosk_initialized");
    foreach (traincar in train_array) {
        if (!isdefined(traincar.spawn_info)) {
            continue;
        }
        spawn_info = traincar.spawn_info[spawn_type];
        spawn_data = function_3b5a11ea11e271c3(spawn_type);
        if (!isdefined(spawn_info) || !isdefined(spawn_info.count)) {
            continue;
        }
        for (i = 0; i < spawn_info.count; i++) {
            type = spawn_info.type[i];
            offset = spawn_info.offsets[i];
            angles = spawn_info.angles[i];
            if (isdefined(spawn_data.var_2f0395c820ddb30) && isfunction(spawn_data.var_2f0395c820ddb30)) {
                type = [[ spawn_data.var_2f0395c820ddb30 ]](type);
            }
            if (!isdefined(type)) {
                continue;
            } else if (type == "weapon_vm_mg_sentry_turret_train" || type == "equipment_wm_tripwire_train" || type == "lm_offhand_wm_at_mine_train" || type == "offhand_2h_wm_decoy_mine_dummy01_v0_train") {
                continue;
            }
            scriptable = undefined;
            if (isdefined(spawn_data.spawncallback)) {
                scriptable = [[ spawn_data.spawncallback ]](type, offset, angles, traincar);
            }
            if (type == "palfa_fuel_spawn") {
                continue;
            }
            if (!isdefined(scriptable)) {
                scriptable = spawnscriptable(type, traincar.origin + offset, angles);
            }
            scriptable.var_ce5c1024bca39998 = 1;
            if (!isdefined(traincar.spawned_objects[spawn_type][type])) {
                traincar.spawned_objects[spawn_type][type] = [];
            }
            array_add(traincar.spawned_objects[spawn_type][type], scriptable);
            initialstate = undefined;
            if (scriptable getscriptableisloot()) {
                initialstate = function_6f817b71c98d6307(function_40fd49171fad19d3(type));
            }
            isinvisible = isdefined(initialstate) && initialstate == #"inactive_invisible";
            if (!isinvisible && scriptable getscriptablehaspart("body") && scriptable getscriptableparthasstate("body", "closed_usable_no_collision")) {
                scriptable setscriptablepartstate("body", "closed_usable_no_collision");
            } else if (type == "dmz_crate_wood" && isinvisible) {
                scriptable setscriptablepartstate("body", "closed_unusable_no_collision");
            } else if (isdefined(initialstate) && scriptable getscriptablehaspart("body") && scriptable getscriptableparthasstate("body", initialstate)) {
                scriptable setscriptablepartstate("body", initialstate);
            }
            if (type == "military_ammo_restock_noent") {
                scriptable setscriptablepartstate("military_ammo_restock", "useable_on_no_icon");
                traincar.ammo_restock = scriptable;
            }
            if (scriptable function_73cc0f04c4c5001d()) {
                scriptable thread function_edcebaee73e9929(type, traincar, offset, angles, spawn_data.var_20792ee55e7cef4b);
            }
            /#
                if (getdvarint(@"hash_6c41679db3595674", 0)) {
                    scriptable thread function_a7ab86374cb78aa9();
                }
            #/
        }
    }
    flag_set("wztrain_scriptables_spawned");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47a9
// Size: 0x6f
function function_edcebaee73e9929(type, traincar, offset, angles, var_20792ee55e7cef4b) {
    level endon("game_ended");
    wait 1;
    if (!isdefined(self.linkedparent)) {
        utility::function_6e506f39f121ea8a(traincar, offset, angles);
    }
    if (isdefined(var_20792ee55e7cef4b) && isfunction(var_20792ee55e7cef4b)) {
        self [[ var_20792ee55e7cef4b ]](type, traincar);
    }
    waitframe();
    flag_set("wztrain_scriptables_init_done");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4820
// Size: 0x54
function private function_dacf28437ad9a90(train, lootstruct) {
    return lootstruct.targetname == "military_ammo_restock_noent" && train == "cargo_train" && scripts\mp\utility\game::getsubgametype() == "dmz" && lootstruct.script_noteworthy != "train_car_3_loot";
}

/#

    // Namespace br_movingtrain / namespace_1dc5e8f629864665
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x487d
    // Size: 0xa6
    function private function_a7ab86374cb78aa9() {
        rs = [100, 5000];
        while (true) {
            waitframe();
            foreach (r in rs) {
                draw_capsule(self.origin + (0, 0, r * -1), r, r * 2, (0, 0, 0), (1, 0, 0), 0, 1);
            }
        }
    }

#/

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492b
// Size: 0x1f2
function train_attach_player_hurts() {
    foreach (train in level.wztrain_info.trains) {
        engine = train[0];
        foreach (traincar in train) {
            noteworthy = traincar.script_noteworthy;
            hurt_name = noteworthy + "_train_front_hurt";
            var_1d3171ff707190b5 = noteworthy + "_train_rear_hurt";
            if (isdefined(level.wztrain_info.var_4f0382615a2a1259)) {
                hurt_name = noteworthy + level.wztrain_info.var_4f0382615a2a1259;
            }
            var_f285d73b82ca4c5c = getentarray(hurt_name, "script_noteworthy");
            var_ec410345540b3a6f = getentarray(var_1d3171ff707190b5, "script_noteworthy");
            var_f285d73b82ca4c5c = array_combine(var_f285d73b82ca4c5c, var_ec410345540b3a6f);
            traincar.var_f285d73b82ca4c5c = [];
            traincar.var_ec410345540b3a6f = [];
            foreach (traincar_hurt in var_f285d73b82ca4c5c) {
                if (isent(traincar_hurt)) {
                    traincar.var_f285d73b82ca4c5c = array_add(traincar.var_f285d73b82ca4c5c, traincar_hurt);
                    traincar_hurt enablelinkto();
                    traincar_hurt linkto(traincar);
                    traincar_hurt thread train_hurt_damage_watcher(traincar, engine);
                }
            }
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b25
// Size: 0x202
function train_hurt_damage_watcher(traincar, engine) {
    level endon("game_ended");
    self endon("death");
    damage = 1000;
    if (getdvarfloat(@"hash_a214649db8d870f6", -1) != -1) {
        damage = getdvarfloat(@"hash_a214649db8d870f6", -1);
    }
    modifier = 1;
    if (getdvarfloat(@"hash_baeaa14065be0bf2", -1) != -1) {
        modifier = getdvarfloat(@"hash_baeaa14065be0bf2", -1);
    }
    self.hurt_enabled = 1;
    self.iswztrain = 1;
    self.var_9c675043198097a3 = &function_51da224c93d325f3;
    self.engine = engine;
    while (true) {
        hitent = self waittill("trigger");
        if (!istrue(self.hurt_enabled)) {
            continue;
        }
        if ((isplayer(hitent) || isagent(hitent)) && isalive(hitent) && length(engine.velocity) > 10 && vectordot(traincar.velocity, hitent.origin - traincar.origin) > 0 && (istrue(hitent.inlaststand) || isagent(hitent) || hitent istouching(traincar) || hitent istouching(traincar.linked_model) || traincar function_28e551f1c8b6bf8d(hitent))) {
            damagemodifier = modifier;
            if (isdefined(level.wztrain_info.var_b9649a005a3b8740)) {
                callbackmodifier = [[ level.wztrain_info.var_b9649a005a3b8740 ]](traincar);
                damagemodifier *= callbackmodifier;
            }
            hitent dodamage((hitent.health + damage) * damagemodifier, self.origin, self, self, "MOD_TRIGGER_HURT");
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d2f
// Size: 0x4f
function function_28e551f1c8b6bf8d(hitent) {
    localorigin = coordtransformtranspose(hitent.origin, self.origin, self.angles);
    return localorigin[0] < 385 && abs(localorigin[1]) < 95;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d87
// Size: 0xa3
function function_fa60abd0913d1578(train_name, rate) {
    animent = level.wztrain_info.animent[train_name];
    animtoplay = animent.anim_override;
    animref = level.scr_anim[train_name][animtoplay];
    if (isarray(animref)) {
        animref = level.scr_anim[train_name][animtoplay][0];
    }
    animent setanimrate(animref, rate);
    level.wztrain_info.animrate[train_name] = rate;
    function_68b05555719c93ed(train_name);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e32
// Size: 0xf5
function function_a2865fbe60ae30a8(train_name, accelerationrate, targetrate) {
    currentrate = level.wztrain_info.animrate[train_name];
    if (!isdefined(currentrate)) {
        return;
    }
    acceleration = 1;
    if (targetrate < currentrate) {
        acceleration = -1;
    }
    animent = level.wztrain_info.animent[train_name];
    animtoplay = animent.anim_override;
    animref = level.scr_anim[train_name][animtoplay];
    if (isarray(animref)) {
        animref = level.scr_anim[train_name][animtoplay][0];
    }
    currentrate = function_dbf72252b51c25af(animent, animref, acceleration, accelerationrate, currentrate, targetrate);
    level.wztrain_info.animrate[train_name] = currentrate;
    function_68b05555719c93ed(train_name);
    return currentrate;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f30
// Size: 0x6d
function function_e3c620206b7b1178(callback) {
    if (!isdefined(level.wztrain_info.var_7c63b5e7a9e6dee4)) {
        level.wztrain_info.var_7c63b5e7a9e6dee4 = [];
    }
    size = level.wztrain_info.var_7c63b5e7a9e6dee4.size;
    level.wztrain_info.var_7c63b5e7a9e6dee4[size] = callback;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fa5
// Size: 0x2be
function private function_68b05555719c93ed(train_name) {
    if (!isdefined(level.wztrain_info.var_164f7d6ed6e374a9)) {
        return;
    }
    controls = level.wztrain_info.var_164f7d6ed6e374a9[train_name];
    if (!isdefined(controls)) {
        return;
    }
    var_15777982c0909b37 = level.wztrain_info.trains[train_name];
    currentspeed = abs(level.wztrain_info.animrate[train_name]);
    is_moving = currentspeed > 0;
    speed_state = "stopped";
    if (currentspeed > 0) {
        speed_state = "moving";
    }
    if (currentspeed > 0.5) {
        speed_state = "fast";
    }
    foreach (traincar in var_15777982c0909b37) {
        if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("train_speed_vfx")) {
            traincar.linked_model setscriptablepartstate("train_speed_vfx", speed_state);
        }
    }
    for (i = 0; i < var_15777982c0909b37.size; i += 2) {
        traincar = var_15777982c0909b37[i];
        if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("train_speed_vfx")) {
            traincar.linked_model setscriptablepartstate("train_speed_vfx", speed_state);
        }
    }
    if (speed_state == "stopped") {
        function_52f0e88e892f960a(train_name);
    } else {
        function_838743a143d39b3c(train_name);
    }
    var_74b04be09bf7704a = var_15777982c0909b37[var_15777982c0909b37.size - 1];
    if (var_74b04be09bf7704a.linked_model isscriptable() && var_74b04be09bf7704a.linked_model getscriptablehaspart("train_rear_sfx")) {
        var_74b04be09bf7704a.linked_model setscriptablepartstate("train_rear_sfx", ter_op(is_moving, "moving", "default"), 1);
    }
    if (isdefined(level.wztrain_info.var_7c63b5e7a9e6dee4)) {
        foreach (callback in level.wztrain_info.var_7c63b5e7a9e6dee4) {
            [[ callback ]](train_name);
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x526b
// Size: 0xb9
function train_vfx_init() {
    level endon("game_ended");
    flag_wait("wztrain_anim_playing");
    wait 0.1;
    foreach (traincar in level.wztrain_info.train_array) {
        if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("train_part")) {
            traincar.linked_model setscriptablepartstate("train_part", "moving");
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532c
// Size: 0xac
function train_sfx_init() {
    level endon("game_ended");
    flag_wait("wztrain_anim_playing");
    wait 0.1;
    foreach (train_name in level.wztrain_info.train_names) {
        if (!isdefined(level.wztrain_info.var_164f7d6ed6e374a9) || !isdefined(level.wztrain_info.var_164f7d6ed6e374a9[train_name])) {
            function_838743a143d39b3c(train_name);
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53e0
// Size: 0x18
function function_838743a143d39b3c(train_name) {
    function_383124ed9c938589(train_name, "train_moving");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5400
// Size: 0x18
function function_52f0e88e892f960a(train_name) {
    function_383124ed9c938589(train_name, "train_stopped");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5420
// Size: 0x14d
function function_383124ed9c938589(train_name, loop_state) {
    var_15777982c0909b37 = level.wztrain_info.trains[train_name];
    assertex(isarray(var_15777982c0909b37), "train_sfx_scriptable: car_array is not an array");
    if (!isarray(level.wztrain_info.var_639a013e56247a03)) {
        level.wztrain_info.var_639a013e56247a03 = [];
    }
    train_state = level.wztrain_info.var_639a013e56247a03[train_name];
    if (isstring(train_state) && train_state == loop_state) {
        return;
    } else {
        level.wztrain_info.var_639a013e56247a03[train_name] = loop_state;
    }
    foreach (traincar in var_15777982c0909b37) {
        if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("train_control_loop_sfx")) {
            traincar.linked_model setscriptablepartstate("train_control_loop_sfx", loop_state);
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5575
// Size: 0x1b
function function_85a3956c7630ea05() {
    level endon("game_ended");
    flag_wait("wztrain_array_set");
    wait 0.1;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5598
// Size: 0xc0
function function_6bc539be97b1fd75(train_ent1, train_ent2) {
    var_5418be00d083eaa2 = getent("br_passenger_train_prob_1", "script_noteworthy");
    var_5418bd00d083e86f = getent("br_passenger_train_prob_2", "script_noteworthy");
    if (!isdefined(var_5418be00d083eaa2) || !isdefined(var_5418bd00d083e86f)) {
        return;
    }
    var_5418be00d083eaa2.origin = train_ent1.origin;
    var_5418be00d083eaa2.angles = train_ent1.angles;
    var_5418be00d083eaa2 linkto(train_ent1);
    var_5418bd00d083e86f.origin = train_ent2.origin;
    var_5418bd00d083e86f.angles = train_ent2.angles;
    var_5418bd00d083e86f linkto(train_ent2);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5660
// Size: 0x1c
function function_7af6d73425acffca(train) {
    function_6ec6dbd953660756("cargo_train", "veh_jup_horn_cargotrain");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5684
// Size: 0x1c
function function_692fc55669413d6e(train) {
    function_6ec6dbd953660756("br_passenger_train", "veh_horn_passtrain");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a8
// Size: 0xcd
function function_6ec6dbd953660756(train_name, sfx_name, var_3330cf34f575b3ea) {
    train_array = level.wztrain_info.trains[train_name];
    if (!isdefined(train_array)) {
        return false;
    }
    var_69383545ada0cc16 = train_array[0].linked_model;
    if (!soundexists(sfx_name)) {
        return false;
    }
    if (isdefined(var_3330cf34f575b3ea) && var_3330cf34f575b3ea) {
        foreach (traincar in train_array) {
            traincar playsoundonmovingent(sfx_name);
        }
    } else {
        var_69383545ada0cc16 playsoundonmovingent(sfx_name);
    }
    return true;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x577e
// Size: 0x10d
function br_pass_train_stop(train) {
    var_69383545ada0cc16 = level.wztrain_info.trains["br_passenger_train"][0].linked_model;
    var_69383545ada0cc16 playsoundonmovingent("veh_passtrain_engine_stop");
    var_917cafbf6eebf7c0 = level.wztrain_info.trains["br_passenger_train"][2].linked_model;
    var_917cafbf6eebf7c0 playsoundonmovingent("veh_passtrain_car1_stop");
    var_71bb78d27f1fb46 = level.wztrain_info.trains["br_passenger_train"][4].linked_model;
    var_71bb78d27f1fb46 playsoundonmovingent("veh_passtrain_car2_stop");
    var_1437b0cc477207c = level.wztrain_info.trains["br_passenger_train"][6].linked_model;
    var_1437b0cc477207c playsoundonmovingent("veh_passtrain_car1_stop");
    wait 2;
    var_69383545ada0cc16 playloopsound("veh_passtrain_engine_idle_lp");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5893
// Size: 0x10d
function br_pass_train_start(train) {
    var_69383545ada0cc16 = level.wztrain_info.trains["br_passenger_train"][0].linked_model;
    var_69383545ada0cc16 playsoundonmovingent("veh_passtrain_engine_start");
    var_917cafbf6eebf7c0 = level.wztrain_info.trains["br_passenger_train"][2].linked_model;
    var_917cafbf6eebf7c0 playsoundonmovingent("veh_passtrain_car1_start");
    var_71bb78d27f1fb46 = level.wztrain_info.trains["br_passenger_train"][4].linked_model;
    var_71bb78d27f1fb46 playsoundonmovingent("veh_passtrain_car2_start");
    var_1437b0cc477207c = level.wztrain_info.trains["br_passenger_train"][6].linked_model;
    var_1437b0cc477207c playsoundonmovingent("veh_passtrain_car1_start");
    wait 2;
    var_69383545ada0cc16 stoploopsound("veh_passtrain_engine_idle_lp");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a8
// Size: 0x4f
function br_pass_train_tnnl(train) {
    soundent = spawn("script_origin", (-4669, 21728, 78));
    soundent playsound("veh_train_pass_overhead");
    exploder("tunnel_train");
    wait 31;
    soundent delete();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ff
// Size: 0x9af
function train_play_anim(train, array) {
    level endon("game_ended");
    introdelay = getdvarint(@"hash_6b1f502cc55903cc", 0);
    if (introdelay > 0) {
        wait introdelay;
    }
    level.wztrain_info.minrate[train] = 0.25;
    level.wztrain_info.maxrate[train] = ter_op(train == "br_passenger_train", 0.35, 0.5);
    accelerationtime = getdvarfloat(@"hash_940d6b55a5dbcf45", 5);
    level.wztrain_info.var_3033f7cb13be4dc7[train] = squared(getdvarfloat(@"hash_74b035e736b98642", 4000));
    level.wztrain_info.var_1017ff8c77611217[train] = squared(getdvarfloat(@"hash_b2d8f4192a5928ea", 1800));
    var_de7f7608bb03095 = train != "br_passenger_train";
    var_de7f7608bb03095 = getdvarint(@"hash_4ec068e522fadc85", var_de7f7608bb03095);
    level.wztrain_info.minrate[train] = getdvarfloat(@"hash_2763c64cc1b357f5", level.wztrain_info.minrate[train]);
    level.wztrain_info.maxrate[train] = getdvarfloat(@"hash_12140bfeb0a869f3", level.wztrain_info.maxrate[train]);
    level.wztrain_info.minrate[train] = getdvarfloat(hashcat(@"hash_d98c82b5a26dc973", train, "_minRate"), level.wztrain_info.minrate[train]);
    level.wztrain_info.maxrate[train] = getdvarfloat(hashcat(@"hash_d98c82b5a26dc973", train, "_maxRate"), level.wztrain_info.maxrate[train]);
    accelerationrate = (level.wztrain_info.maxrate[train] - level.wztrain_info.minrate[train]) / accelerationtime;
    targetrate = level.wztrain_info.maxrate[train];
    animent = level.wztrain_info.animent[train];
    animstruct = level.wztrain_info.animstruct[train];
    animpos = animstruct.origin;
    var_8c94765ca587f86c = animstruct.angles;
    animent.isplayinganim = 1;
    animent notsolid();
    animent dontinterpolate();
    if (isdefined(level.br_level.var_572a1674797a9fa8) && train == "cargo_train") {
        animent.backwards = 1;
    }
    animtoplay = animent.anim_override;
    if (isdefined(level.wztrain_info.var_80bf76189fa2acfe)) {
        level thread [[ level.wztrain_info.var_80bf76189fa2acfe ]](train);
    } else {
        animstruct thread scripts\common\anim::anim_loop_solo(animent, animtoplay);
    }
    if (isdefined(level.wztrain_info.var_a474378e909e8412)) {
        [[ level.wztrain_info.var_a474378e909e8412 ]](train, targetrate);
    }
    function_9198b91b6a2f839e(train, animstruct.initialtime);
    /#
        level thread function_97e7d25127fb07b2(train);
    #/
    if (isdefined(level.br_level.var_572a1674797a9fa8) && train == "cargo_train") {
        function_fa60abd0913d1578(train, 0);
    } else {
        function_fa60abd0913d1578(train, targetrate);
    }
    acceleration = 1;
    dist = undefined;
    closest_stop = undefined;
    level.wztrain_info.train_stops[train] = [];
    level.wztrain_info.var_b7325fd9b510c3ae[train] = [];
    if (isdefined(level.wztrain_info.var_a086219602817dca)) {
        [[ level.wztrain_info.var_a086219602817dca ]](train);
    } else if (scripts\cp_mp\utility\game_utility::function_7ee65fae13124702() || scripts\cp_mp\utility\game_utility::function_da8c49606d8aa048() || level.mapname == "mp_br_mechanics" || level.mapname == "mp_saba_st_dev") {
        level.wztrain_info.train_stops[train]["al_mazrah_city_station"] = (14270, 17197, 560.113);
        level.wztrain_info.train_stops[train]["ahkdar_station"] = (11421, -30213, 1032);
        level.wztrain_info.train_stops[train]["hafid_port"] = (-40724, -19572.6, 254.025);
        if (train == "cargo_train") {
            level.wztrain_info.train_stops[train]["oilfield"] = (-26700, 25058, -254.101);
            level.wztrain_info.var_b7325fd9b510c3ae[train]["al_mazrah_city_station"] = "ahkdar_station";
            level.wztrain_info.var_b7325fd9b510c3ae[train]["ahkdar_station"] = "hafid_port";
            level.wztrain_info.var_b7325fd9b510c3ae[train]["hafid_port"] = "oilfield";
            level.wztrain_info.var_b7325fd9b510c3ae[train]["oilfield"] = "al_mazrah_city_station";
        } else {
            level.wztrain_info.var_b7325fd9b510c3ae[train]["al_mazrah_city_station"] = "hafid_port";
            level.wztrain_info.var_b7325fd9b510c3ae[train]["hafid_port"] = "ahkdar_station";
            level.wztrain_info.var_b7325fd9b510c3ae[train]["ahkdar_station"] = "al_mazrah_city_station";
        }
    }
    var_c00e3362499a32bf = function_10587aaf16f21c55(animent.origin, level.wztrain_info.train_stops[train]);
    closest_stop = var_c00e3362499a32bf[1];
    dist = var_c00e3362499a32bf[0];
    if (isdefined(closest_stop)) {
        foreach (traincar in array) {
            if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("nearby_station")) {
                traincar.linked_model setscriptablepartstate("nearby_station", closest_stop);
            }
        }
    }
    flag_set("wztrain_anim_playing");
    isstopped = 0;
    var_18fa1f5329787e8e = gettime();
    var_ca998c8b5eb91036 = 1400;
    var_ff7b2459994d2ded = [];
    var_3a2b7935e76c0be = [array function_5226a0cd6878ac46(1), array function_5226a0cd6878ac46(-3)];
    if (isdefined(level.wztrain_info.var_73981f12d7941cde)) {
        var_c00e2e62499a27c0 = [[ level.wztrain_info.var_73981f12d7941cde ]](array);
        var_3a2b7935e76c0be = var_c00e2e62499a27c0[1];
        var_ca998c8b5eb91036 = var_c00e2e62499a27c0[0];
    }
    if (getdvarint(@"hash_f524d127e4ba82c4", 0) == 0) {
        while (true) {
            if (gettime() > var_18fa1f5329787e8e) {
                var_18fa1f5329787e8e = gettime() + 2000;
                foreach (repulsorname in var_ff7b2459994d2ded) {
                    destroynavrepulsor(repulsorname);
                }
                var_ff7b2459994d2ded = [];
                foreach (traincar in var_3a2b7935e76c0be) {
                    createnavrepulsor(traincar.unique_id + "train_badplace", -1, traincar.origin, var_ca998c8b5eb91036, 1);
                    var_ff7b2459994d2ded[var_ff7b2459994d2ded.size] = traincar.unique_id + "train_badplace";
                }
            }
            if (isdefined(level.wztrain_info.train_stops[train]) && level.wztrain_info.train_stops[train].size > 0 && var_de7f7608bb03095) {
                var_c00e3b62499a4457 = function_3ebe5a3de48d68b9(dist, targetrate, acceleration, train);
                acceleration = var_c00e3b62499a4457[2];
                targetrate = var_c00e3b62499a4457[1];
                dist = var_c00e3b62499a4457[0];
                if (!array_contains(level.wztrain_info.var_1a30b87276ed28e5, train) && var_de7f7608bb03095) {
                    function_a2865fbe60ae30a8(train, accelerationrate, targetrate);
                }
            }
            function_b97f8e8fd722397(train, 0.1);
            waitframe();
            waittillframeend();
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63b6
// Size: 0x1fa
function function_b97f8e8fd722397(train, lerpfraction) {
    if (getdvarint(@"hash_f524d127e4ba82c4", 0)) {
        return;
    }
    animent = level.wztrain_info.animent[train];
    trainarray = level.wztrain_info.trains[train];
    for (i = 0; i < trainarray.size; i++) {
        thistag = level.wztrain_info.train_tag_array[i];
        targetorigin = animent gettagorigin(thistag);
        targetangles = animent gettagangles(thistag);
        if (istrue(trainarray[i].invertrotation)) {
            targetangles = function_82b691da7415de2a(targetangles);
        }
        tagoffset = level.wztrain_info.train_tagoffset_array[i];
        if (tagoffset != (0, 0, 0)) {
            mtx = anglestoaxis(targetangles);
            targetorigin += mtx["forward"] * tagoffset[0];
            targetorigin += mtx["right"] * tagoffset[1];
            targetorigin += mtx["up"] * tagoffset[2];
        }
        targetorigin = vectorlerp(trainarray[i].linked_mover.origin, targetorigin, lerpfraction);
        targetangles = anglelerpquatfrac(trainarray[i].linked_mover.angles, targetangles, lerpfraction);
        if (isdefined(trainarray[i].linked_model.vehicletype)) {
            trainarray[i].linked_model vehicle_teleport(targetorigin, targetangles, 1);
        }
        trainarray[i].linked_mover.origin = targetorigin;
        trainarray[i].linked_mover.angles = targetangles;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65b8
// Size: 0x25a
function function_3ebe5a3de48d68b9(dist, targetrate, acceleration, train) {
    var_c012b862499f4d15 = function_10587aaf16f21c55(level.wztrain_info.animent[train].origin, level.wztrain_info.train_stops[train]);
    closest_stop = var_c012b862499f4d15[1];
    newdist = var_c012b862499f4d15[0];
    if (isdefined(newdist)) {
        approaching = newdist < dist;
        dist = newdist;
        if (approaching && acceleration == 1 && dist < level.wztrain_info.var_3033f7cb13be4dc7[train]) {
            acceleration = -1;
            targetrate = level.wztrain_info.minrate[train];
            if (isdefined(level.wztrain_info.var_3baa47599dd64511)) {
                thread [[ level.wztrain_info.var_3baa47599dd64511 ]](train, closest_stop);
            }
        } else if (!approaching && acceleration == -1 && dist > level.wztrain_info.var_1017ff8c77611217[train]) {
            acceleration = 1;
            targetrate = level.wztrain_info.maxrate[train];
            if (isdefined(level.wztrain_info.var_1256d82c90a0d4dc)) {
                thread [[ level.wztrain_info.var_1256d82c90a0d4dc ]](train);
            }
            foreach (traincar in level.wztrain_info.trains[train]) {
                if (traincar.linked_model isscriptable() && traincar.linked_model getscriptablehaspart("nearby_station")) {
                    traincar.linked_model setscriptablepartstate("nearby_station", level.wztrain_info.var_b7325fd9b510c3ae[train][closest_stop]);
                }
            }
        }
    }
    return [dist, targetrate, acceleration];
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x681b
// Size: 0x17
function function_82b691da7415de2a(targetangles) {
    return targetangles + (-2 * targetangles[0], 180, 0);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x683b
// Size: 0x11c
function function_10587aaf16f21c55(trainorigin, trainstops) {
    mindist = undefined;
    closestname = undefined;
    var_819edacdacb810e4 = undefined;
    dangercircleradius = undefined;
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        var_819edacdacb810e4 = scripts\mp\gametypes\br_circle::getdangercircleorigin();
        dangercircleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
    }
    foreach (var_343b2d4bfaaf4f1e, var_d54ddf1a95edd0c7 in trainstops) {
        if (getdvarint(@"hash_e614a3b36e6d3fca", 0) > 0) {
            if (isdefined(var_819edacdacb810e4) && scripts\mp\gametypes\br_circle::function_24c5a8d31ae262f(var_d54ddf1a95edd0c7, var_819edacdacb810e4, dangercircleradius)) {
                continue;
            }
        }
        dist = distance2dsquared(var_d54ddf1a95edd0c7, trainorigin);
        if (!isdefined(mindist) || dist < mindist) {
            mindist = dist;
            closestname = var_343b2d4bfaaf4f1e;
        }
    }
    return [mindist, closestname];
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6960
// Size: 0x61
function private function_b91ff337122b31fe() {
    foreach (traincar in level.wztrain_info.train_array) {
        traincar scripts\engine\flags::assign_unique_id();
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x69c9
// Size: 0x681
function train_play_anim_init() {
    level.scr_animtree["cargo_train"] = %script_model;
    level.scr_animtree["br_passenger_train"] = %script_model;
    if (isdefined(level.wztrain_info.var_799babd43d318d4b)) {
        [[ level.wztrain_info.var_799babd43d318d4b ]]();
    } else {
        level.scr_anim["cargo_train"]["full_anim_290"][0] = script_model%iw9_mp_train_saba_a_cw;
        level.scr_anim["br_passenger_train"]["full_anim_290"][0] = script_model%iw9_mp_train_saba_b_ccw;
        scripts\common\anim::addnotetrack_customfunction("cargo_train", "br_train_horn", &function_7af6d73425acffca);
        scripts\common\anim::addnotetrack_customfunction("br_passenger_train", "br_pass_train_horn", &function_692fc55669413d6e);
        scripts\common\anim::addnotetrack_customfunction("br_passenger_train", "br_pass_train_start", &br_pass_train_start);
        scripts\common\anim::addnotetrack_customfunction("br_passenger_train", "br_pass_train_stop", &br_pass_train_stop);
        scripts\common\anim::addnotetrack_customfunction("br_passenger_train", "br_pass_train_tnnl", &br_pass_train_tnnl);
    }
    level.wztrain_info.train_tag_array = [];
    if (isdefined(level.wztrain_info.var_ed3ce45ae9f6b34)) {
        level.wztrain_info.train_tag_array = [[ level.wztrain_info.var_ed3ce45ae9f6b34 ]]();
    } else {
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "engine_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train1_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train2_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train3_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train4_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train5_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train6_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train7_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train8_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train9_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train10_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train11_tag_origin_animate";
        level.wztrain_info.train_tag_array[level.wztrain_info.train_tag_array.size] = "saba01_train12_tag_origin_animate";
    }
    level.wztrain_info.train_tagoffset_array = [];
    for (i = 0; i < level.wztrain_info.train_tag_array.size; i++) {
        level.wztrain_info.train_tagoffset_array[i] = (0, 0, 0);
    }
    waitframe();
    spawnposition = (0, 0, 13);
    spawnangles = (0, 0, 0);
    if (isdefined(level.wztrain_info.anim_spawnposition_override)) {
        spawnposition = level.wztrain_info.anim_spawnposition_override;
    }
    level.wztrain_info.animstruct = [];
    level.wztrain_info.animent = [];
    level.wztrain_info.animrate = [];
    foreach (train, array in level.wztrain_info.trains) {
        animstruct = spawnstruct();
        level.wztrain_info.animstruct[train] = animstruct;
        animstruct.origin = spawnposition;
        animstruct.angles = spawnangles;
        animstruct.initialtime = function_93af86ad9b1b6c90(train);
        animent = spawn("script_model", animstruct.origin);
        level.wztrain_info.animent[train] = animent;
        modelname = "veh9_civ_lnd_train_assembly";
        if (isdefined(level.wztrain_info.var_e52ccb14a1aae9)) {
            modelname = [[ level.wztrain_info.var_e52ccb14a1aae9 ]]();
        }
        animent setmodel(modelname);
        assertex(animent.model != "", "Didn't find train assembly model: " + modelname + "  - check fastfiles.");
        animent.angles = animstruct.angles;
        animent.animname = train;
        animent useanimtree(level.scr_animtree[train]);
        animent forcenetfieldhighlod(1);
        animent setmoveroptimized(1);
        animent setmoverantilagged(1);
        animent.anim_override = default_to(level.wztrain_info.var_ddc55fbcfa86d44, "full_anim_290");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7052
// Size: 0xa6
function function_93af86ad9b1b6c90(train) {
    presettime = getdvar(hashcat(@"hash_d98c82b5a26dc973", train, "_initial_anim_time"), "");
    pickrandom = getdvarint(hashcat(@"hash_d98c82b5a26dc973", train, "_randomize_anim_time"), 1);
    var_9ca76e66f5dbff6c = 0;
    if (pickrandom) {
        var_9ca76e66f5dbff6c = randomfloat(1);
    } else if (presettime != "") {
        var_9ca76e66f5dbff6c = clamp(float(presettime), 0, 1);
    }
    logstring("[br_movingtrain] Will spawn '" + train + "' with initial anim time = " + var_9ca76e66f5dbff6c);
    return var_9ca76e66f5dbff6c;
}

/#

    // Namespace br_movingtrain / namespace_1dc5e8f629864665
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7101
    // Size: 0x65
    function function_97e7d25127fb07b2(train) {
        while (true) {
            if (getdvarint(@"hash_6b8bb4531a9ded3a", 0)) {
                initialtime = function_93af86ad9b1b6c90(train);
                function_9198b91b6a2f839e(train, initialtime);
                level.wztrain_info.animstruct[train].initialtime = initialtime;
            }
            waitframe();
        }
    }

#/

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716e
// Size: 0x94
function function_9198b91b6a2f839e(train, animtime) {
    animent = level.wztrain_info.animent[train];
    if (isdefined(animent)) {
        animtoplay = animent.anim_override;
        animref = level.scr_anim[train][animtoplay];
        if (isarray(animref)) {
            animref = level.scr_anim[train][animtoplay][0];
        }
        animent setanimtime(animref, animtime);
        level thread train_teleport_to_animtime(train, animent);
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x720a
// Size: 0xca
function train_teleport_to_animtime(train, animent) {
    level endon("game_ended");
    animent notify("train_teleport_to_animtime");
    animent endon("train_teleport_to_animtime");
    animent dontinterpolate();
    waitframe();
    function_b97f8e8fd722397(train, 1);
    foreach (traincar in level.wztrain_info.trains[train]) {
        traincar dontinterpolate();
        if (isdefined(traincar.linked_mover)) {
            traincar.linked_mover dontinterpolate();
        }
    }
    waitframe();
    animent.animtimeset = 1;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72dc
// Size: 0x93
function function_51da224c93d325f3(einflictor) {
    self playsound("train_veh_impact_body");
    if (isdefined(einflictor) && isdefined(einflictor.engine)) {
        if (isdefined(einflictor.engine.script_noteworthy) && einflictor.engine.script_noteworthy == "train_car_20") {
            einflictor.engine playsoundonmovingent("veh_horn_passtrain");
            return;
        }
        einflictor.engine playsoundonmovingent("veh_jup_horn_cargotrain");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7377
// Size: 0x221
function predictCargoTrainPositions(delays, animrates, accelerationrate, startrate) {
    if (!isdefined(startrate)) {
        startrate = 0;
    }
    assertex(flag("wztrain_array_set"), "Train arrays not yet configured!");
    assertex(accelerationrate > 0, "Invalid acceleration rate, must be positive! ");
    animlength = getanimlength(script_model%iw9_br_train_jup_a);
    startref = level.wztrain_info.animstruct["cargo_train"];
    if (flag("wztrain_anim_playing")) {
        cargotrain = level.wztrain_info.animent["cargo_train"];
        animoffset = cargotrain getanimtime(script_model%iw9_br_train_jup_a);
    } else {
        animoffset = level.wztrain_info.animstruct["cargo_train"].initialtime;
    }
    prevanimrate = startrate;
    var_683c6158805fbd44 = animoffset;
    trainpositions = [];
    for (index = 0; index < delays.size; index++) {
        animrate = animrates[index];
        if (isdefined(animrate)) {
            accelerationtime = abs(animrate - prevanimrate) / accelerationrate;
            if (accelerationtime > delays[index]) {
                animrate = lerp(prevanimrate, animrate, delays[index] / accelerationtime);
                accelerationtime = delays[index];
                if (!isdefined(animrates[index + 1])) {
                    animrates[index + 1] = animrates[index];
                }
            }
            var_aca0961c6b483ec5 = function_bc6bbd377f04b278(prevanimrate, animrate, accelerationtime);
            remainingdelay = delays[index] - accelerationtime;
            var_683c6158805fbd44 += (var_aca0961c6b483ec5 + animrate * remainingdelay) / animlength;
            prevanimrate = animrate;
        } else {
            var_683c6158805fbd44 += prevanimrate * delays[index] / animlength;
        }
        var_683c6158805fbd44 -= floor(var_683c6158805fbd44);
        trainpositions[index] = getoriginforanimtime(startref.origin, startref.angles, script_model%iw9_br_train_jup_a, var_683c6158805fbd44);
    }
    return trainpositions;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a1
// Size: 0x75
function changeCargoTrainSpeed(targetrate, accelerationrate) {
    level endon("game_ended");
    level notify("cargo_train_change_speed");
    level endon("cargo_train_change_speed");
    currentrate = level.wztrain_info.animrate["cargo_train"];
    if (currentrate == targetrate) {
        return;
    }
    while (true) {
        currentrate = function_a2865fbe60ae30a8("cargo_train", accelerationrate, targetrate);
        if (currentrate == targetrate) {
            break;
        }
        waitframe();
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x761e
// Size: 0x40
function crate_follow_text() {
    level endon("game_ended");
    while (true) {
        /#
            print3d(self.origin, "<dev string:x6f>", (1, 0, 0), 1, 2, 99, 1);
        #/
        wait 1;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7666
// Size: 0x7a
function any_player_nearby(origin, dist_sqr) {
    foreach (player in level.players) {
        if (distancesquared(player.origin, origin) < dist_sqr) {
            return true;
        }
    }
    return false;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76e9
// Size: 0xc0
function warp_player_debug() {
    level endon("game_ended");
    if (getdvarint(@"hash_dd6e65ec80098e72", 0) == 0) {
        return;
    }
    while (!isdefined(level.player) || !isalive(level.player)) {
        wait 0.1;
    }
    level.player endon("death_or_disconnect");
    wait 1;
    level thread debug_warpplayer_monitor();
    level.player waittill("skydive_deployparachute");
    wait 0.5;
    start_pos = level.wztrain_info.train_array[0].origin;
    level.player setorigin(start_pos + (0, 0, 4096));
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x77b1
// Size: 0xd8
function debug_warpplayer_monitor() {
    level endon("game_ended");
    level.player endon("disconnect");
    level.player notifyonplayercommand("dpad_left_press", "+actionslot 3");
    while (true) {
        level.player waittill("dpad_left_press");
        start_pos = level.wztrain_info.train_array[1].origin;
        foreach (player in level.players) {
            player setorigin(start_pos + (0, 0, 200));
        }
        waitframe();
    }
}

/#

    // Namespace br_movingtrain / namespace_1dc5e8f629864665
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x7891
    // Size: 0x58
    function debug_display_veh_hit(eventdata, damage) {
        if (vectordot(eventdata.velnormals[0], eventdata.velnormals[1]) > 0) {
            announcement("<dev string:x71>" + damage);
            return;
        }
        announcement("<dev string:x81>" + damage);
    }

#/

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78f1
// Size: 0xde
function blink_train_test() {
    level endon("game_ended");
    while (true) {
        wait 1;
        foreach (traincar in level.wztrain_info.train_array) {
            traincar.linked_model hide();
        }
        wait 1;
        foreach (traincar in level.wztrain_info.train_array) {
            traincar.linked_model show();
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x79d7
// Size: 0x16a
function private function_b002d10bd710cc12(offset, traincar) {
    if (!istrue(level.var_70b4bb4cd9143462)) {
        scripts\engine\scriptable::scriptable_addusedcallbackbypart("train_safe", &function_7c5eefd0cbce6520);
    }
    level.var_70b4bb4cd9143462 = 1;
    offset += (0, 0, 43);
    safe = spawn("script_model", traincar.linked_model.origin + offset);
    safe setmodel("dmz_train_safe");
    safe.angles = (0, 0, 0);
    safe linkto(traincar.linked_model);
    safe.linkedparent = traincar.linked_model;
    safe.musicplayers = [];
    scriptable = safe getlinkedscriptableinstance();
    scriptable.linkedparent = traincar.linked_model;
    scriptable.var_ceb543956c7203e7 = &function_9618cc73546d253d;
    safe setscriptablepartstate("train_safe", "usable_not_open");
    if (namespace_a8b2b88699fc40fb::function_94b502046c767cd1() == "train") {
        safe scripts\cp_mp\utility\game_utility::function_6b6b6273f8180522("Boss_Focus_SM_Dmz", self.origin, 3000);
        safe scripts\cp_mp\utility\game_utility::function_6988310081de7b45();
        safe.mapcircle linkto(safe);
        safe thread function_8a7bb55abdee8269();
    }
    return safe;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b4a
// Size: 0x31
function private function_9618cc73546d253d(container, player) {
    if (!isdefined(container) || !isdefined(player)) {
        return;
    }
    container setscriptablepartstate("train_safe", "open_usable");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b83
// Size: 0x1fc
function private function_7c5eefd0cbce6520(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (state == "usable_not_open") {
        instance setscriptablepartstate(part, "unusable");
        instance.successfuluse = 0;
        instance thread namespace_abc7ed0cde8527d4::function_24765a7aabf0093e(player);
        instance.entity namespace_abc7ed0cde8527d4::function_7f10e8e120314f4b(player, part);
        if (istrue(instance.entity.successfuluse)) {
            scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_train_safe_defend_started", level.players);
            safe_setmusicstate(instance.entity, "drill", player);
            wait 1;
            instance.entity thread safecapture();
        } else {
            instance setscriptablepartstate(part, "usable_not_open");
        }
        return;
    }
    if (state == "open_usable") {
        if (instance getscriptableparthasstate(part, "unusable")) {
            instance setscriptablepartstate(part, "unusable");
        }
        if (!isdefined(instance.contents)) {
            items = getscriptcachecontents("train_safe");
            if (namespace_a8b2b88699fc40fb::function_94b502046c767cd1() == "train") {
                namespace_a8b2b88699fc40fb::function_f9ec88c3d71324cd();
            } else {
                items = array_remove(items, "brloot_weaponcase");
            }
            items[items.size] = "brloot_aq_train_manifest";
            items = array_randomize(items);
            instance.containertype = 4;
            instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(items, 1, player, instance.contents);
        } else {
            instance scripts\mp\gametypes\br_lootcache::lootcachespawncontents(undefined, 1, player, instance.contents);
        }
        return;
    }
    if (state == "usable_drilling") {
        instance.entity.paused = 0;
        safe_setmusicstate(instance.entity, "drill", player);
        instance setscriptablepartstate("train_safe", "unusable_drilling");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7d87
// Size: 0x26
function private safecapture() {
    thread watchnearby();
    thread watchprogress();
    thread callheli();
    if (false) {
        thread function_3950f666f426e1a4();
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7db5
// Size: 0x5c0
function private watchnearby() {
    self endon("captured");
    self.curorigin = self.origin;
    self.offset3d = (0, 0, 70);
    scripts\mp\gameobjects::requestid(1, 0, undefined, 1);
    globalobjid = self.objidnum;
    self.globalobjid = globalobjid;
    objective_setpings(globalobjid, 1);
    objective_setzoffset(globalobjid, 70);
    objective_icon(globalobjid, "ui_map_icon_safe");
    objective_setbackground(globalobjid, 1);
    objective_state(globalobjid, "current");
    scripts\mp\objidpoolmanager::update_objective_onentity(globalobjid, self);
    objective_setownerteam(globalobjid, undefined);
    objective_setprogressteam(globalobjid, undefined);
    scripts\mp\objidpoolmanager::function_79a1a16de6b22b2d(globalobjid, 16);
    scripts\mp\objidpoolmanager::objective_set_play_intro(globalobjid, 1);
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(globalobjid);
    scripts\mp\gameobjects::requestid(1, 0, undefined, 1);
    progressobjid = self.objidnum;
    self.progressobjid = progressobjid;
    scripts\mp\objidpoolmanager::update_objective_icon(progressobjid, "ui_map_icon_safe");
    scripts\mp\objidpoolmanager::update_objective_setbackground(progressobjid, 1);
    scripts\mp\objidpoolmanager::objective_pin_global(progressobjid, 1);
    scripts\mp\objidpoolmanager::function_d7e3c4a08682c1b9(progressobjid, 1);
    scripts\mp\objidpoolmanager::objective_set_play_intro(progressobjid, 0);
    scripts\mp\objidpoolmanager::objective_playermask_showtoall(progressobjid);
    scripts\mp\objidpoolmanager::update_objective_onentity(progressobjid, self);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(progressobjid, 70);
    scripts\mp\objidpoolmanager::update_objective_state(progressobjid, "invisible");
    objective_setshowprogress(progressobjid, 1);
    self.nearbyplayers = [];
    self.abandoned = 0;
    var_d83aa4b44eff7b60 = gettime();
    lastpaused = 0;
    while (true) {
        nearby = [];
        foreach (player in level.players) {
            if (isdefined(player.origin) && distancesquared(self.origin, player.origin) < 640000) {
                trainname = player scripts\cp_mp\utility\train_utility::function_31156831afc882ad();
                if (isdefined(trainname) && trainname == "cargo_train") {
                    nearby[nearby.size] = player;
                }
            }
        }
        if (nearby.size > 0) {
            var_d83aa4b44eff7b60 = gettime();
        }
        newabandoned = gettime() - var_d83aa4b44eff7b60 > 20000;
        if (self.abandoned && !newabandoned && istrue(self.var_2847f8d00aee9dc7) && isdefined(self.heli)) {
            self.heli notify("newpath");
        }
        self.abandoned = newabandoned;
        newnearby = array_difference(nearby, self.nearbyplayers);
        var_ea6b4eeeaea5cdc3 = array_difference(self.nearbyplayers, nearby);
        if (istrue(self.paused) != lastpaused) {
            foreach (player in self.nearbyplayers) {
                if (isdefined(player)) {
                    scripts\mp\objidpoolmanager::function_26259bd38697b5ad(progressobjid, player);
                    scripts\mp\objidpoolmanager::objective_playermask_hidefrom(progressobjid, player);
                }
            }
            self.nearbyplayers = [];
            lastpaused = istrue(self.paused);
            waitframe();
            continue;
        }
        lastpaused = istrue(self.paused);
        progressbar = ter_op(lastpaused, %MP_DMZ_MISSIONS/SAFE_PAUSED, %MP_DMZ_MISSIONS/OPENING_SAFE);
        foreach (player in newnearby) {
            if (isdefined(player)) {
                scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(progressobjid, player);
                scripts\mp\objidpoolmanager::function_ce702e5925e31fc9(progressobjid, player, 2, 2, progressbar);
            }
        }
        foreach (player in var_ea6b4eeeaea5cdc3) {
            if (isdefined(player)) {
                scripts\mp\objidpoolmanager::function_26259bd38697b5ad(progressobjid, player);
                scripts\mp\objidpoolmanager::objective_playermask_hidefrom(progressobjid, player);
            }
        }
        self.nearbyplayers = nearby;
        teamcounts = [];
        foreach (player in nearby) {
            if (!isdefined(player.team)) {
                continue;
            }
            if (!isdefined(teamcounts[player.team])) {
                teamcounts[player.team] = 0;
            }
            teamcounts[player.team] = teamcounts[player.team] + 1;
        }
        max = 0;
        captureteam = "team_hundred_ninety_five";
        foreach (team, count in teamcounts) {
            if (count > max) {
                captureteam = team;
                max = count;
                continue;
            }
            if (count == max) {
                captureteam = "team_hundred_ninety_five";
            }
        }
        objective_setownerteam(progressobjid, captureteam);
        objective_setprogressteam(progressobjid, captureteam);
        objective_setownerteam(globalobjid, captureteam);
        objective_setprogressteam(globalobjid, captureteam);
        objective_setpulsate(globalobjid, 1);
        wait 1;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x837d
// Size: 0x2a
function private function_8a7bb55abdee8269() {
    level waittill("interuptWeaponCaseShow");
    self.objidnum = self.globalobjid;
    scripts\mp\gameobjects::releaseid();
    scripts\cp_mp\utility\game_utility::function_af5604ce591768e1();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x83af
// Size: 0x1ad
function private watchprogress() {
    objid = self.progressobjid;
    self.progress = 0;
    capturetime = getdvarint(@"hash_6c7f918cf6eec58c", 180);
    while (self.progress < 1) {
        if (self.nearbyplayers.size > 0 && !istrue(self.paused)) {
            newprogress = clamp(self.progress + level.framedurationseconds / capturetime, 0, 1);
            if (newprogress > 0.33 && self.progress < 0.33 || newprogress > 0.67 && self.progress < 0.67) {
                self.paused = 1;
                scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_train_safe_paused", self.nearbyplayers);
                self setscriptablepartstate("train_safe", "usable_drilling");
            }
            self.progress = newprogress;
            scripts\mp\objidpoolmanager::objective_set_progress(objid, self.progress);
        } else if (!istrue(self.paused)) {
            min = 0;
            if (self.progress > 0.67) {
                min = 0.671;
            } else if (self.progress > 0.33) {
                min = 0.331;
            }
            self.progress = clamp(self.progress - level.framedurationseconds / 3 * 60, min, 1);
            scripts\mp\objidpoolmanager::objective_set_progress(objid, self.progress);
        }
        waitframe();
    }
    opensafe();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8564
// Size: 0x1cd
function private callheli() {
    self endon("captured");
    spawndata = spawnstruct();
    spawndata.origin = gethelispawn();
    spawndata.initai = 1;
    spawndata.team = "team_hundred_ninety_five";
    heli = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("little_bird", spawndata);
    self.heli = heli;
    heli.var_6df468049c1f41dc = 1;
    scripts\cp_mp\vehicles\vehicle_interact::vehicle_interact_makeunusable(heli);
    poi = scripts\mp\poi::function_6cc445c02b5effac(self.origin);
    origin = ter_op(isdefined(level.var_f0872e42daf6d4d5), level.var_f0872e42daf6d4d5, spawndata.origin);
    riders = [];
    for (i = 2; i < 8; i++) {
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, poi, undefined, random(["sniper", "ar", "lmg"]), 3);
        rider = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, (0, 0, 0), "absolute", "reinforcements", "train_safe", undefined, undefined, undefined, "bossArea", 1, undefined, 0);
        if (!isdefined(rider)) {
            continue;
        }
        riders[i] = rider;
        rider thread function_6da65222586132f5(heli);
        namespace_bfef6903bca5845d::function_c9b9fe3f7f739586(rider);
    }
    namespace_7ae25d9e5d5a28ef::function_7045fb761a4998e3(heli);
    heli scripts\cp_mp\vehicles\vehicle::function_f92faaaf5c5077c6(riders, 1, 1);
    thread heliai(heli);
    heli waittill("death");
    wait 10;
    while (istrue(self.abandoned)) {
        wait 3;
    }
    callheli();
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8739
// Size: 0xeb
function private function_3950f666f426e1a4() {
    while (true) {
        foreach (offset in [(1500, 600, 600), (2400, -430, 450), (2400, 430, 450), (1200, -600, 500), (500, 0, 400)]) {
            /#
                sphere(self.linkedparent.origin + rotatevector(offset, self.linkedparent.angles), 200, (0, 0, 1), 0);
            #/
        }
        waitframe();
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x882c
// Size: 0x58
function private function_6da65222586132f5(heli) {
    heli endon("death");
    killer, meansofdeath = self waittill("death");
    heli dodamage(int(heli.maxhealth / 7), killer.origin, killer, killer, meansofdeath);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x888c
// Size: 0x3b
function private gethelispawn() {
    return self.linkedparent.origin + rotatevector((-1000, 0, 5000), self.linkedparent.angles);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d0
// Size: 0x146
function private function_8f1aefe1e8750f84(heli) {
    goal = random([(1500, 600, 600), (2400, -430, 450), (2400, 430, 450), (1200, -600, 500), (500, 0, 400)]);
    goalstruct = spawnstruct();
    goalstruct.origin = self.linkedparent.origin + rotatevector(goal, self.linkedparent.angles);
    goalstruct.speed = 60;
    goalstruct.radius = 150;
    trace = scripts\engine\trace::sphere_trace(heli.origin, goalstruct.origin, 200, undefined, scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0));
    if (trace["fraction"] < 1) {
        goalstruct.origin += (0, 0, 1500);
    }
    return goalstruct;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a1f
// Size: 0x74
function private function_bde42941fc546c67() {
    goalstruct = spawnstruct();
    goalstruct.origin = self.linkedparent.origin + rotatevector((-1000, 0, 7000), self.linkedparent.angles);
    goalstruct.speed = 60;
    goalstruct.radius = 200;
    return goalstruct;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8a9c
// Size: 0x90
function private heliai(heli) {
    heli endon("death");
    while (true) {
        self.var_2847f8d00aee9dc7 = 0;
        if (istrue(self.captured) || istrue(self.abandoned)) {
            self.var_2847f8d00aee9dc7 = 1;
            heli scripts\common\vehicle_paths::vehicle_paths_helicopter(function_bde42941fc546c67());
            if (istrue(self.captured) || istrue(self.abandoned)) {
                heli thread scripts\cp_mp\vehicles\vehicle::vehicle_death(heli);
                return;
            }
            continue;
        }
        heli scripts\common\vehicle_paths::vehicle_paths_helicopter(function_8f1aefe1e8750f84(heli));
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b34
// Size: 0x1f7
function private opensafe() {
    self notify("captured");
    self.captured = 1;
    uniqueteams = [];
    foreach (player in self.nearbyplayers) {
        scripts\mp\objidpoolmanager::objective_unpin_player(self.progressobjid, player);
        scripts\mp\objidpoolmanager::function_26259bd38697b5ad(self.progressobjid, player);
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.progressobjid, player);
        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.globalobjid, player);
        if (!isdefined(player.var_35b94c88cc1cea97)) {
            player.var_35b94c88cc1cea97 = 0;
        }
        player.var_35b94c88cc1cea97++;
        player scripts\mp\utility\points::doScoreEvent(#"hash_c02c8c802f07c908");
        if (isdefined(player) && isdefined(player.team) && !isdefined(uniqueteams[player.team])) {
            uniqueteams[player.team] = 1;
        }
    }
    foreach (team, value in uniqueteams) {
        namespace_8361bad7391de074::function_a9f8fa06a358585b(team, "train_safe", 1, undefined, 1);
    }
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_train_safe_defend_unlocked", self.nearbyplayers);
    safe_setmusicstate(self, "open", self.nearbyplayers);
    self.objidnum = self.progressobjid;
    scripts\mp\gameobjects::releaseid();
    if (namespace_a8b2b88699fc40fb::function_94b502046c767cd1() != "train") {
        self.objidnum = self.globalobjid;
        scripts\mp\gameobjects::releaseid();
    }
    self setscriptablepartstate("train_safe", "opening");
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d33
// Size: 0x7c
function function_82563367aa26cd19(array) {
    newarray = [];
    foreach (member in array) {
        var_b30b086ebfeb7f53 = scripts\mp\utility\player::isreallyalive(member);
        if (!var_b30b086ebfeb7f53) {
            continue;
        }
        newarray[newarray.size] = member;
    }
    return newarray;
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8db8
// Size: 0x1bf
function function_1533ffc339e9487f(radius) {
    safe = self;
    assertex(isent(safe) && isarray(safe.musicplayers), "safe_WatchMusicPlayers: unexpected safe");
    assertex(isnumber(radius), "safe_WatchMusicPlayers: unexpected radius");
    level endon("game_ended");
    safe endon("captured");
    safe notify("stop_watching_music_players");
    safe endon("stop_watching_music_players");
    while (istrue(self.captured) == 0) {
        var_eb6088e47e4f1402 = namespace_e688cd9db0404268::function_d6fe092bc83da45b(safe.origin, radius);
        var_cad5df321a29fdda = array_difference(safe.musicplayers, var_eb6088e47e4f1402);
        var_e45dfef528956315 = function_82563367aa26cd19(var_eb6088e47e4f1402);
        var_3c67775afd800950 = array_difference(var_eb6088e47e4f1402, var_e45dfef528956315);
        var_496eb519d6161eca = array_combine(var_cad5df321a29fdda, var_3c67775afd800950);
        if (isarray(var_496eb519d6161eca) && var_496eb519d6161eca.size > 0) {
            namespace_b1b96b070bb1349c::function_caeaf68ab0e87565(var_496eb519d6161eca, "", 0.5);
            foreach (player in var_496eb519d6161eca) {
                playerentnum = player getentitynumber();
                safe.musicplayers[playerentnum] = undefined;
            }
        }
        waitcount = randomintrange(2, 20);
        waittime = waitcount * 0.05;
        safe waittill_any_timeout_1(waittime, "captured");
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f7f
// Size: 0x2c5
function safe_setmusicstate(safe, statename, var_a663b5760127728d) {
    assertex(isent(safe) && isarray(safe.musicplayers), "safe_SetMusicState: unexpected safe");
    assertex(isstring(statename), "safe_SetMusicState: unexpected stateName");
    var_20abc022843b0c15 = isplayer(var_a663b5760127728d);
    isplayers = isarray(var_a663b5760127728d);
    musicdist = getdvarint(@"hash_1dcf60c7d07dee2e", 4725);
    switch (statename) {
    default: 
        assertmsg("safe_SetMusicState: unexpected state");
        break;
    case #"hash_ce4d7f20e14acf7e": 
        if (istrue(var_20abc022843b0c15)) {
            player = var_a663b5760127728d;
            teamplayers = namespace_e688cd9db0404268::function_d6fe092bc83da45b(player, musicdist, var_a663b5760127728d.team);
            if (isarray(teamplayers) && teamplayers.size > 0) {
                namespace_b1b96b070bb1349c::function_caeaf68ab0e87565(teamplayers, "dmz_train_safe_drill", 0.5);
                foreach (player in teamplayers) {
                    playerentnum = player getentitynumber();
                    safe.musicplayers[playerentnum] = player;
                }
            }
        }
        break;
    case #"hash_af80d61e7df698bb": 
        if (istrue(var_20abc022843b0c15)) {
            player = var_a663b5760127728d;
            namespace_b1b96b070bb1349c::function_caeaf68ab0e87565([player], "", 0.5);
            playerentnum = player getentitynumber();
            safe.musicplayers[playerentnum] = undefined;
        } else if (istrue(isplayers) && isarray(var_a663b5760127728d) && var_a663b5760127728d.size > 0) {
            players = var_a663b5760127728d;
            namespace_b1b96b070bb1349c::function_caeaf68ab0e87565(players, "", 0.5);
            foreach (player in players) {
                playerentnum = player getentitynumber();
                safe.musicplayers[playerentnum] = undefined;
            }
        }
        break;
    case #"hash_d747fa3ff1b78b29": 
        if (isarray(safe.musicplayers) && safe.musicplayers.size > 0) {
            namespace_b1b96b070bb1349c::function_caeaf68ab0e87565(safe.musicplayers, "", 1.5);
            safe.musicplayers = [];
        }
        break;
    }
    safe thread function_1533ffc339e9487f(musicdist);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x924c
// Size: 0x13c
function function_a93a6d7f562fdfcc(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (istrue(instance.var_ce5c1024bca39998)) {
        if (isdefined(instance.type)) {
            switch (instance.type) {
            case #"hash_19ba8d41970911ad":
            case #"hash_417c605750c7baa5":
            case #"hash_4ca1dc2e1b0de0d3": 
                player function_39b5cec1323e813e(0, 0, 0, 0, 1);
                break;
            case #"hash_2e2fee3e581b3db3": 
                player function_39b5cec1323e813e(0, 0, 0, 0, 0, 0, 0, 1);
                break;
            case #"hash_9f164ed5d992e2e0": 
                player function_39b5cec1323e813e(0, 0, 0, 0, 0, 0, 1);
                break;
            case #"hash_880e2a62f3d5d335":
            case #"hash_abcd47843c1e0b18": 
                player function_39b5cec1323e813e(0, 0, 0, 0, 0, 1);
                break;
            default: 
                break;
            }
            return;
        }
        if (isdefined(part) && part == "brloot_gascan_palfa") {
            player function_39b5cec1323e813e(0, 0, 0, 0, 0, 0, 0, 0, 0, "", 1);
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9390
// Size: 0x13c
function function_a4e20b4dc4ebd306(player, attacker, smeansofdeath) {
    groundent = player getgroundentity();
    if (!isdefined(groundent) || !isdefined(level.wztrain_info.trains)) {
        return;
    }
    foreach (train in level.wztrain_info.trains) {
        if (isdefined(train)) {
            foreach (traincar in train) {
                if (isdefined(traincar)) {
                    if (groundent == traincar) {
                        death_by_player = ter_op(isdefined(attacker) && isplayer(attacker) && attacker != player, 1, 0);
                        player function_39b5cec1323e813e(0, 0, 0, 0, 0, 0, 0, 0, death_by_player, smeansofdeath);
                        return;
                    }
                }
            }
        }
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 12, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94d4
// Size: 0x26a
function function_39b5cec1323e813e(direction_control_used, speed_control_used, horn_control_used, handbrake_control_used, loot_cache_used, uav_tower_used, buy_station_used, ammo_depot_used, death_by_player, death_other, palfa_fuel_used, reset_control_timer) {
    if (!isdefined(direction_control_used)) {
        direction_control_used = 0;
    }
    if (!isdefined(speed_control_used)) {
        speed_control_used = 0;
    }
    if (!isdefined(horn_control_used)) {
        horn_control_used = 0;
    }
    if (!isdefined(handbrake_control_used)) {
        handbrake_control_used = 0;
    }
    if (!isdefined(loot_cache_used)) {
        loot_cache_used = 0;
    }
    if (!isdefined(uav_tower_used)) {
        uav_tower_used = 0;
    }
    if (!isdefined(buy_station_used)) {
        buy_station_used = 0;
    }
    if (!isdefined(ammo_depot_used)) {
        ammo_depot_used = 0;
    }
    if (!isdefined(death_by_player)) {
        death_by_player = 0;
    }
    if (!isdefined(death_other)) {
        death_other = "";
    }
    if (!isdefined(palfa_fuel_used)) {
        palfa_fuel_used = 0;
    }
    if (!isdefined(reset_control_timer)) {
        reset_control_timer = 0;
    }
    eventparams = [];
    eventparams[eventparams.size] = "direction_control_used";
    eventparams[eventparams.size] = direction_control_used;
    eventparams[eventparams.size] = "speed_control_used";
    eventparams[eventparams.size] = speed_control_used;
    eventparams[eventparams.size] = "horn_control_used";
    eventparams[eventparams.size] = horn_control_used;
    eventparams[eventparams.size] = "handbrake_control_used";
    eventparams[eventparams.size] = handbrake_control_used;
    eventparams[eventparams.size] = "loot_cache_used";
    eventparams[eventparams.size] = loot_cache_used;
    eventparams[eventparams.size] = "uav_tower_used";
    eventparams[eventparams.size] = uav_tower_used;
    eventparams[eventparams.size] = "buy_station_used";
    eventparams[eventparams.size] = buy_station_used;
    eventparams[eventparams.size] = "ammo_depot_used";
    eventparams[eventparams.size] = ammo_depot_used;
    eventparams[eventparams.size] = "death_by_player";
    eventparams[eventparams.size] = death_by_player;
    eventparams[eventparams.size] = "death_other";
    eventparams[eventparams.size] = death_other;
    eventparams[eventparams.size] = "palfa_fuel_used";
    eventparams[eventparams.size] = palfa_fuel_used;
    eventparams[eventparams.size] = "team_name";
    team_name = ter_op(isdefined(self) && isdefined(self.team), self.team, "");
    eventparams[eventparams.size] = team_name;
    eventparams[eventparams.size] = "circle_index";
    var_22ffd1330f7be8f8 = ter_op(isdefined(level.br_circle), level.br_circle.circleindex + 1, -1);
    eventparams[eventparams.size] = var_22ffd1330f7be8f8;
    playlistid = getplaylistid();
    eventparams[eventparams.size] = "playlist_name";
    playlist_name = getplaylistname(playlistid);
    eventparams[eventparams.size] = playlist_name;
    eventparams[eventparams.size] = "control_timer_reset";
    eventparams[eventparams.size] = reset_control_timer;
    self dlog_recordplayerevent("dlog_event_br_moving_train", eventparams);
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x9746
// Size: 0x2f6
function private function_c96d7535862e245c(command, args) {
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
        case #"hash_8d85f40f19fbd646": 
            train_entities = level.wztrain_info.trains["cargo_train"];
            if (!isdefined(train_entities)) {
                announcement("Train: " + "cargo_train" + " does not exist.");
                break;
            }
            var_3958030c57e72a46 = 0;
            if (isdefined(args[1])) {
                var_3958030c57e72a46 = int(args[1]);
            }
            firstplayer setorigin(train_entities[var_3958030c57e72a46].origin + (0, 0, 200));
            break;
        case #"hash_9ccea7ed14568475": 
            foreach (traincar in level.wztrain_info.train_array) {
                hasparts = 0;
                if (traincar.linked_model isscriptable()) {
                    hasparts += traincar.linked_model getscriptablehaspart("train_speed_sfx");
                    hasparts += traincar.linked_model getscriptablehaspart("train_speed_vfx");
                    hasparts += traincar.linked_model getscriptablehaspart("train_control_sfx");
                    hasparts += traincar.linked_model getscriptablehaspart("train_brakes_vfx");
                }
                color = [(1, 0, 0), (1, 1, 0), (1, 1, 0), (1, 1, 0), (0, 1, 0)][hasparts];
                utility::draw_capsule(traincar.origin, 100, 200, (0, 0, 0), color, 0, 200);
            }
            break;
        case #"hash_a94f895bbd927e65": 
            if (!isdefined(args[1])) {
                break;
            }
            collider = spawn("script_model", firstplayer.origin);
            collider setmodel(args[1]);
            r = 100;
            draw_capsule(collider.origin + (0, 0, r * -1), r, r * 2, (0, 0, 0), (1, 0, 0), 0, 20000);
            break;
        }
        break;
    }
}

// Namespace br_movingtrain / namespace_1dc5e8f629864665
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9a44
// Size: 0x4b
function private function_5226a0cd6878ac46(index) {
    if (self.size == 0) {
        return undefined;
    }
    if (index < 0) {
        return self[int(clamp(self.size + index, 0, self.size - 1))];
    }
    return self[int(clamp(index, 0, self.size - 1))];
}

