// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\gametypes\br_ai_encounters_util.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_respawn.gsc;
#using scripts\mp\utility\script.gsc;

#namespace namespace_dbfadc7694f6be4b;

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8
// Size: 0x94
function init() {
    setdvarifuninitialized(@"hash_66a4f62fefc77efd", 0);
    if (!getdvarint(@"hash_66a4f62fefc77efd", 0)) {
        return;
    }
    setdvarifuninitialized(@"hash_ab50f58bb9979459", 30);
    var_29f57a3bc4e1ec72 = spawnstruct();
    /#
        var_29f57a3bc4e1ec72.debugtype = "icon_regular";
    #/
    var_29f57a3bc4e1ec72 init_encounters();
    var_29f57a3bc4e1ec72 init_locations();
    var_29f57a3bc4e1ec72 thread encounter_manager();
    level.disableinitplayergameobjects = 0;
    /#
        level.var_1f7714c919e8f106 = var_29f57a3bc4e1ec72;
        var_29f57a3bc4e1ec72 thread function_172af363664b6357();
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd73
// Size: 0x22
function add_encounter_start_condition(func, params) {
    add_condition("encounter", func, params);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9c
// Size: 0x22
function add_location_start_condition(func, params) {
    add_condition("location", func, params);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc5
// Size: 0x88
function add_condition(category, func, params) {
    if (!isdefined(self.startconditions[category])) {
        self.startconditions[category] = [];
    }
    condition = spawnstruct();
    condition.func = func;
    condition.params = params;
    count = self.startconditions[category].size;
    self.startconditions[category][count] = condition;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x34
function add_encounter_start_function(func) {
    /#
        function_1535016662214ec5();
    #/
    /#
        assert(!isdefined(self.func_encounterstart));
    #/
    self.func_encounterstart = func;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x325
function init_encounters() {
    self.encounters = [];
    self.allencounters = [];
    root = init_encounter("root");
    /#
        root add_encounter_start_condition(&condition_debugpaused);
    #/
    root add_encounter_start_condition(&condition_prematchdone);
    root add_encounter_start_condition(&condition_mintimepassed, 60);
    root add_encounter_start_condition(&condition_maxaliveplayers, 70);
    root add_encounter_start_condition(&condition_maxactivelocations, 1);
    root add_encounter_start_condition(&condition_lastencounterstarttime, 30);
    root add_location_start_condition(&condition_stateis, 0);
    root add_location_start_condition(&condition_insafecircle);
    root add_encounter_start_condition(&condition_circlecount, 2);
    root add_encounter_start_condition(&condition_circlesremaining, 2);
    root add_location_start_condition(&condition_anyplayerinsideradius, 7500);
    root add_encounter_start_function(&root_ecounterstart);
    root_ai = init_encounter("root_ai", root);
    root_ai add_encounter_start_function(&rootai_ecounterstart);
    bank = init_encounter("bank", root_ai);
    bank add_location_start_condition(&condition_allplayersoutsideradius, 3000);
    bank add_encounter_start_function(&bank_ecounterstart);
    airport = init_encounter("airport", root_ai);
    airport add_location_start_condition(&condition_allplayersoutsideradius, 3000);
    airport add_encounter_start_function(&airport_ecounterstart);
    truck = init_encounter("truck", root_ai);
    truck add_location_start_condition(&condition_allplayersoutsideradius, 3000);
    truck add_encounter_start_function(&truck_encounterstart);
    crate_guard = init_encounter("crate_guard", root_ai);
    crate_guard add_location_start_condition(&condition_allplayersoutsideradius, 3000);
    crate_guard add_encounter_start_function(&crateguard_encounterstart);
    jugg = init_encounter("jugg", root_ai);
    jugg add_location_start_condition(&condition_allplayersoutsideradius, 1000);
    jugg add_encounter_start_condition(&condition_disabled);
    test = init_encounter("test", root_ai);
    test add_encounter_start_condition(&condition_disabled);
    test add_encounter_start_function(&test_ecounterstart);
    root_non_ai = init_encounter("root_non_ai", root);
    root_non_ai add_location_start_condition(&condition_allplayersoutsideradius, 2000);
    root_non_ai add_encounter_start_function(&rootnonai_ecounterstart);
    dom = init_encounter("dom", root_non_ai);
    dom add_encounter_start_function(&dom_encounterstart);
    bomb_plant = init_encounter("bomb_plant", root_non_ai);
    bomb_plant add_encounter_start_function(&bombplant_encounterstart);
    extraction = init_encounter("extraction", root_non_ai);
    extraction add_encounter_start_function(&extraction_encounterstart);
    extraction add_encounter_start_condition(&condition_disabled);
    destruction = init_encounter("destruction", root_non_ai);
    destruction add_encounter_start_function(&destruction_encounterstart);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb
// Size: 0xef
function init_encounter(name, parent) {
    encounter = spawnstruct();
    encounter.name = name;
    encounter.info = self;
    encounter.parentencounter = parent;
    encounter.encounters = [];
    encounter.startconditions = [];
    encounter.locations = [];
    /#
        encounter.debugtype = "brloot_killstreak_clusterstrike";
    #/
    /#
        assertex(!isdefined(self.allencounters[name]), "Encounter type " + name + " already exists");
    #/
    self.allencounters[name] = encounter;
    if (isdefined(parent)) {
        parent.encounters[parent.encounters.size] = encounter;
    } else {
        self.encounters[self.encounters.size] = encounter;
    }
    return encounter;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b2
// Size: 0x89
function init_locations() {
    /#
        function_674facc5e1cb84c();
    #/
    self.alllocations = [];
    self.activelocations = [];
    locations = getstructarray("ai_encounters", "targetname");
    foreach (location in locations) {
        init_location(location);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342
// Size: 0x117
function init_location(location) {
    /#
        function_674facc5e1cb84c();
    #/
    location.name = location.script_noteworthy;
    /#
        location.debugtype = "BR_AI_ENCOUNTERS/OBJ_LABEL_REWARD";
    #/
    /#
        assertex(isdefined(location.name), "AI Location must have a script_noteworthy defined");
    #/
    /#
        assertex(isdefined(self.allencounters[location.name]), "Unknown encounter type for location '" + location.name + "'");
    #/
    encounter = self.allencounters[location.name];
    encounter.locations[encounter.locations.size] = location;
    location.encounter = encounter;
    location.state = 0;
    var_703cfcf7f6d5d0a1 = self.alllocations.size;
    /#
        location.var_2613246720524878 = var_703cfcf7f6d5d0a1;
    #/
    self.alllocations[var_703cfcf7f6d5d0a1] = location;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1460
// Size: 0x64
function encounter_manager() {
    /#
        function_674facc5e1cb84c();
    #/
    while (1) {
        self.validlocations = [];
        update_conditions(self.encounters);
        if (self.validlocations.size) {
            location = random(self.validlocations);
            encounter_start(location);
        }
        wait(0.05);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cb
// Size: 0xe3
function update_conditions(encounters) {
    foreach (encounter in encounters) {
        if (!encounter check_encounter_start_conditions()) {
            continue;
        }
        update_conditions(encounter.encounters);
        foreach (location in encounter.locations) {
            if (!location check_location_start_conditions()) {
                continue;
            }
            self.validlocations[self.validlocations.size] = location;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b5
// Size: 0x1a
function check_encounter_start_conditions() {
    /#
        function_1535016662214ec5();
    #/
    return check_start_conditions(self, "encounter", 0);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d7
// Size: 0x23
function check_location_start_conditions() {
    /#
        function_2f6185a84b023517();
    #/
    return check_start_conditions(self.encounter, "location", 1);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1602
// Size: 0xf8
function check_start_conditions(encounter, var_6ce38f522a4b3d32, var_dd61ff0f315b80ed) {
    if (var_dd61ff0f315b80ed && isdefined(encounter.parentencounter)) {
        if (!check_start_conditions(encounter.parentencounter, var_6ce38f522a4b3d32, var_dd61ff0f315b80ed)) {
            return 0;
        }
    }
    if (!isdefined(encounter.startconditions[var_6ce38f522a4b3d32])) {
        return 1;
    }
    for (i = 0; i < encounter.startconditions[var_6ce38f522a4b3d32].size; i++) {
        condition = encounter.startconditions[var_6ce38f522a4b3d32][i];
        if (isdefined(condition.params)) {
            result = self [[ condition.func ]](condition.params);
        } else {
            result = self [[ condition.func ]]();
        }
        /#
            if (result) {
                function_5bb507603ca9de76(undefined);
            }
        #/
        if (!result) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1702
// Size: 0x59
function encounter_start(location) {
    location.state = 1;
    self.activelocations[self.activelocations.size] = location;
    location.starttime = gettime();
    /#
        location.var_2253a634b70fcd12 = [];
    #/
    encounter_location_start_functions(location);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1762
// Size: 0x1f
function encounter_location_start_functions(location) {
    location encounter_start_functions(location.encounter);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1788
// Size: 0x55
function encounter_start_functions(encounter) {
    /#
        function_2f6185a84b023517();
    #/
    if (isdefined(encounter.parentencounter)) {
        encounter_start_functions(encounter.parentencounter);
    }
    if (isdefined(encounter.func_encounterstart)) {
        self [[ encounter.func_encounterstart ]]();
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e4
// Size: 0x124
function encounter_end(success, var_fe593ba7d0935bb5) {
    if (success) {
        self.state = 2;
    } else {
        self.state = 3;
    }
    self.endtime = gettime();
    self.duration = self.endtime - self.starttime;
    /#
        self.var_2253a634b70fcd12 = undefined;
    #/
    info = self.encounter.info;
    info.activelocations = array_remove(info.activelocations, self);
    info.lastencounter = self;
    if (self.usesai) {
        foreach (agent in self.agents) {
            if (isalive(agent)) {
                agent suicide();
            }
        }
    }
    self notify("encounter_end", success);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190f
// Size: 0x26
function condition_disabled(encounter) {
    /#
        function_1535016662214ec5();
    #/
    /#
        function_5bb507603ca9de76("death");
    #/
    return 0;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193d
// Size: 0x55
function condition_stateis(state) {
    /#
        function_2f6185a84b023517();
    #/
    if (self.state != state) {
        /#
            function_5bb507603ca9de76("wave_01_overrun_trig" + function_5443af46fa933222(self.state) + "vault_door_clip" + function_5443af46fa933222(state));
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199a
// Size: 0xc4
function condition_anyplayerinsideradius(radius) {
    /#
        function_2f6185a84b023517();
    #/
    radiussqr = radius * radius;
    sortedplayers = sortbydistance(level.players, self.origin);
    for (i = 0; i < sortedplayers.size; i++) {
        player = sortedplayers[i];
        if (!isalive(player)) {
            continue;
        }
        var_f95436827e16d133 = distance2dsquared(player.origin, self.origin);
        if (var_f95436827e16d133 < radiussqr) {
            return 1;
        } else {
            break;
        }
    }
    /#
        function_5bb507603ca9de76("airport_smoke_toss_pos" + radius + "cigarette_lit");
    #/
    return 0;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a66
// Size: 0xd6
function condition_allplayersoutsideradius(radius) {
    /#
        function_2f6185a84b023517();
    #/
    radiussqr = radius * radius;
    sortedplayers = sortbydistance(level.players, self.origin);
    for (i = 0; i < sortedplayers.size; i++) {
        player = sortedplayers[i];
        if (!isalive(player)) {
            continue;
        }
        var_f95436827e16d133 = distance2dsquared(player.origin, self.origin);
        if (var_f95436827e16d133 < radiussqr) {
            /#
                function_5bb507603ca9de76("cigarette_lit_toss" + player.name + "stand_cellphone_loop" + radius + "cigarette_lit");
            #/
            return 0;
        } else {
            break;
        }
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b44
// Size: 0xab
function condition_insafecircle() {
    /#
        function_2f6185a84b023517();
    #/
    if (istrue(level.br_circle_disabled)) {
        return 1;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.safecircleent)) {
        /#
            function_5bb507603ca9de76("waypoint_capture_br");
        #/
        return 0;
    }
    circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
    circleradius = namespace_c5622898120e827f::getsafecircleradius();
    var_4aae5f1a6dc74da0 = distance2dsquared(self.origin, circleorigin);
    if (var_4aae5f1a6dc74da0 > circleradius * circleradius) {
        /#
            function_5bb507603ca9de76("MP_INGAME_ONLY/OBJ_TARGET_CAPS");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x95
function condition_circlecount(var_8a7d4aa442793440) {
    /#
        function_1535016662214ec5();
    #/
    if (istrue(level.br_circle_disabled)) {
        return 1;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.safecircleent)) {
        /#
            function_5bb507603ca9de76("waypoint_capture_br");
        #/
        return 0;
    }
    var_264e3329827f2da3 = getomnvar("ui_br_circle_num");
    if (var_264e3329827f2da3 < var_8a7d4aa442793440) {
        /#
            function_5bb507603ca9de76("<unknown string>" + var_264e3329827f2da3 + "<unknown string>" + var_8a7d4aa442793440);
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c94
// Size: 0xc1
function condition_circlesremaining(var_8a7d4aa442793440) {
    /#
        function_1535016662214ec5();
    #/
    if (istrue(level.br_circle_disabled)) {
        return 1;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.circleindex)) {
        /#
            function_5bb507603ca9de76("<unknown string>" + var_8a7d4aa442793440);
        #/
        return 0;
    }
    var_5cd0d923d30c3182 = level.br_level.br_circledelaytimes.size;
    var_d6cadf9cbbf1f862 = var_5cd0d923d30c3182 - level.br_circle.circleindex;
    if (var_d6cadf9cbbf1f862 < var_8a7d4aa442793440) {
        /#
            function_5bb507603ca9de76("<unknown string>" + var_d6cadf9cbbf1f862 + "<unknown string>" + var_8a7d4aa442793440);
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5d
// Size: 0xc1
function condition_maxaliveplayers(var_a488b9199457e184) {
    /#
        function_1535016662214ec5();
    #/
    if (!isdefined(level.teamdata)) {
        /#
            function_5bb507603ca9de76("<unknown string>");
        #/
        return 0;
    }
    count = 0;
    foreach (teaminfo in level.teamdata) {
        count = count + teaminfo["aliveCount"];
    }
    if (count > var_a488b9199457e184) {
        /#
            function_5bb507603ca9de76("<unknown string>" + count + "<unknown string>" + var_a488b9199457e184 + "cigarette_lit");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e26
// Size: 0x4a
function condition_maxactivelocations(var_a075796c11e1b0df) {
    /#
        function_1535016662214ec5();
    #/
    if (self.info.activelocations.size >= var_a075796c11e1b0df) {
        /#
            function_5bb507603ca9de76("<unknown string>" + var_a075796c11e1b0df + "<unknown string>");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e78
// Size: 0x4f
function condition_mintimepassed(timesec) {
    /#
        function_1535016662214ec5();
    #/
    passedtime = namespace_cd0b2d039510b38d::getsecondspassed();
    if (passedtime < timesec) {
        /#
            function_5bb507603ca9de76("<unknown string>" + floor(passedtime) + "<unknown string>" + timesec);
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ecf
// Size: 0x8b
function condition_lastencounterstarttime(timesec) {
    /#
        function_1535016662214ec5();
    #/
    info = self.info;
    if (isdefined(info.lastencounter)) {
        var_9c7a4f6c4f5640e3 = (gettime() - info.lastencounter.endtime) / 1000;
        if (var_9c7a4f6c4f5640e3 < timesec) {
            /#
                function_5bb507603ca9de76("<unknown string>" + floor(var_9c7a4f6c4f5640e3) + "<unknown string>" + timesec);
            #/
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f62
// Size: 0x50
function condition_prematchdone() {
    /#
        function_1535016662214ec5();
    #/
    if (!isdefined(game["flags"]["prematch_done"])) {
        /#
            function_5bb507603ca9de76("<unknown string>");
        #/
        return 0;
    }
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        return 1;
    }
    /#
        function_5bb507603ca9de76("<unknown string>");
    #/
    return 0;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fba
// Size: 0x36
function condition_debugpaused() {
    /#
        function_1535016662214ec5();
    #/
    if (getdvarint(@"hash_a163377bb1005bf5", 0)) {
        /#
            function_5bb507603ca9de76(@"hash_a163377bb1005bf5");
        #/
        return 0;
    }
    return 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff8
// Size: 0x3a
function successcondition_enemykills(numkills) {
    self endon("encounter_end");
    while (1) {
        self waittill("agent_killed");
        if (self.agentskilled >= numkills) {
            encounter_end(1);
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2039
// Size: 0x82
function failcondition_noplayersinengagedradius(timesec) {
    self endon("encounter_end");
    /#
        function_2f6185a84b023517();
    #/
    timesec = int(timesec);
    var_231ae15deb765ec1 = timesec;
    while (1) {
        wait(1);
        if (self.playersinengagedradius.size > 0) {
            timesec = var_231ae15deb765ec1;
        } else {
            timesec--;
            if (timesec <= 0) {
                encounter_end(0);
            }
        }
        /#
            self.var_2253a634b70fcd12["<unknown string>"] = "<unknown string>" + timesec + "<unknown string>";
        #/
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c2
// Size: 0xe2
function failcondition_outsidedangercircle() {
    self endon("encounter_end");
    /#
        function_2f6185a84b023517();
    #/
    while (1) {
        wait(1);
        if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleent)) {
            continue;
        }
        circleorigin = namespace_c5622898120e827f::getdangercircleorigin();
        circleradius = namespace_c5622898120e827f::getdangercircleradius();
        var_4aae5f1a6dc74da0 = distance2dsquared(self.origin, circleorigin);
        if (var_4aae5f1a6dc74da0 > circleradius * circleradius) {
            if (self.playersinengagedradius.size > 0) {
                /#
                    self.var_2253a634b70fcd12["<unknown string>"] = "<unknown string>";
                #/
            } else {
                encounter_end(0);
            }
        } else {
            /#
                self.var_2253a634b70fcd12["<unknown string>"] = "<unknown string>" + circleradius - sqrt(var_4aae5f1a6dc74da0);
            #/
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ab
// Size: 0xab
function targetstart_spawner(target) {
    targetstart_spawner_init(target);
    agent = spawn_agent(target);
    if (isdefined(agent)) {
        if (isdefined(target.goalnodes)) {
            goalnode = random(target.goalnodes);
            agent setgoalnode(goalnode);
        }
        if (isdefined(target.goalvolumes)) {
            goalvolume = random(target.goalvolumes);
            if (goalvolume.auto) {
                agent setgoalvolumeauto(goalvolume);
            } else {
                agent setgoalvolume(goalvolume);
            }
        }
    }
    return agent;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225e
// Size: 0x118
function targetstart_spawner_init(spawner) {
    spawner.team = get_ai_team();
    spawner.aitype = [[ self.func_getspawneraitype ]](spawner);
    targets = spawner get_targets();
    foreach (target in targets) {
        if (!isdefined(target.script_noteworthy)) {
            continue;
        }
        switch (target.script_noteworthy) {
        case #"hash_8079f40c9ac24495":
            targetstart_spawner_volume(spawner, target, 0);
            break;
        case #"hash_ab087df0efd0561":
            targetstart_spawner_volume(spawner, target, 1);
            break;
        case #"hash_6450733d0f02003b":
        case #"hash_8d43150f19c69bd6":
            targetstart_spawner_node(spawner, target);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237d
// Size: 0x4a
function targetstart_spawner_node(spawner, node) {
    if (!isdefined(spawner.goalnodes)) {
        spawner.goalnodes = [];
    }
    spawner.goalnodes[spawner.goalnodes.size] = node;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ce
// Size: 0x5f
function targetstart_spawner_volume(spawner, volume, auto) {
    if (!isdefined(spawner.goalvolumes)) {
        spawner.goalvolumes = [];
    }
    volume.auto = auto;
    spawner.goalvolumes[spawner.goalvolumes.size] = volume;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2434
// Size: 0x82
function targetstart_icon(var_cd73bc5a9cbda8cd) {
    id = namespace_5a22b6f3a56f7e9b::requestobjectiveid(0);
    namespace_5a22b6f3a56f7e9b::objective_add_objective(id, "current", var_cd73bc5a9cbda8cd.origin, "icon_waypoint_objective_general", "icon_regular");
    objective_setshowoncompass(id, 1);
    objective_setplayintro(id, 1);
    objective_setlabel(id, self.iconlabel);
    thread icon_update_visibility(id);
    self waittill("encounter_end");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(id);
    objective_delete(id);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24bd
// Size: 0x1a3
function targetstart_reward(var_c058970a10d37d8b) {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    var_fe593ba7d0935bb5 = success = self waittill("encounter_end");
    if (!success) {
        return;
    }
    var_de19f33cb691869d = rewardspawn(var_c058970a10d37d8b);
    if (!isdefined(var_de19f33cb691869d)) {
        return;
    }
    if (isdefined(var_fe593ba7d0935bb5)) {
        var_eeae97cadd2906ce = [];
        otherplayers = [];
        foreach (guid, lasttime in self.playersinnotifyradius) {
            player = self.guidtoplayer[guid];
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == var_fe593ba7d0935bb5) {
                var_eeae97cadd2906ce[var_eeae97cadd2906ce.size] = player;
            } else {
                otherplayers[otherplayers.size] = player;
            }
        }
        thread rewardicon(var_de19f33cb691869d, "icon_waypoint_unlocked", var_eeae97cadd2906ce);
        thread rewardicon(var_de19f33cb691869d, "icon_waypoint_locked", otherplayers);
        rewardobjectlock(var_de19f33cb691869d, var_eeae97cadd2906ce, otherplayers);
    } else {
        var_be4e32b47ad61c7d = [];
        foreach (guid, lasttime in self.playersinnotifyradius) {
            player = self.guidtoplayer[guid];
            if (!isdefined(player)) {
                continue;
            }
            var_be4e32b47ad61c7d[var_be4e32b47ad61c7d.size] = player;
        }
        thread rewardicon(var_de19f33cb691869d, "icon_waypoint_unlocked", var_be4e32b47ad61c7d);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2667
// Size: 0xa5
function targetstart_reward_prespawn(var_c058970a10d37d8b) {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    var_de19f33cb691869d = rewardspawn(var_c058970a10d37d8b);
    disablescriptableplayeruseall(var_de19f33cb691869d);
    navobstacleid = createnavobstaclebybounds(var_de19f33cb691869d.origin, (30, 15, 10), var_de19f33cb691869d.angles);
    success = self waittill("encounter_end");
    destroynavobstacle(navobstacleid);
    if (isdefined(var_de19f33cb691869d)) {
        if (success) {
            enablescriptableplayeruseall(var_de19f33cb691869d);
            rewardicon(var_de19f33cb691869d, "icon_waypoint_unlocked");
        } else {
            var_de19f33cb691869d freescriptable();
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2713
// Size: 0xd6
function rewardspawn(var_c058970a10d37d8b, modifier) {
    rewardtype = var_c058970a10d37d8b.script_parameters;
    if (!isdefined(rewardtype)) {
        rewardtype = "brloot_killstreak_clusterstrike";
    }
    var_de19f33cb691869d = undefined;
    switch (rewardtype) {
    case #"hash_6a0ecbbfe8b1c8a5":
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(var_c058970a10d37d8b.origin + (0, 0, 0.1), var_c058970a10d37d8b.angles);
        var_de19f33cb691869d = namespace_cb965d2f71fefddc::spawnpickup(rewardtype, var_cb4fad49263e20c4, 0, 1);
        break;
    default:
        /#
            assertmsg("Unknown reward type '" + rewardtype + "'");
        #/
        break;
    }
    if (isdefined(var_de19f33cb691869d)) {
        thread rewardobjectusewatch(var_de19f33cb691869d);
        thread rewardobjectcleanup(var_de19f33cb691869d);
    }
    return var_de19f33cb691869d;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f1
// Size: 0xf5
function rewardobjectlock(var_de19f33cb691869d, var_e5d6abff320cf8a, var_e40ac825a44e8757) {
    rewardobjectsetusable(var_de19f33cb691869d, var_e5d6abff320cf8a);
    lock = spawn("script_model", var_de19f33cb691869d.origin + (0, 0, 30));
    lock setmodel("tag_origin");
    lock makeusable();
    lock sethintstring("MP/DOOR_USE_LOCK");
    lock setuseholdduration("duration_long");
    lock setusefov(15);
    lock setcursorhint("HINT_BUTTON");
    foreach (player in var_e5d6abff320cf8a) {
        lock disableplayeruse(player);
    }
    thread rewardobjectcleanup(lock);
    thread rewardobjectlockthink(lock, var_de19f33cb691869d);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ed
// Size: 0x53
function rewardobjectlockthink(lock, var_de19f33cb691869d) {
    self endon("reward_cleanup");
    player = lock waittill("trigger");
    part = var_de19f33cb691869d.scriptablename;
    namespace_cb965d2f71fefddc::lootused(var_de19f33cb691869d, part, "visible", player);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2947
// Size: 0x24
function rewardobjectusewatch(var_de19f33cb691869d) {
    self endon("reward_cleanup");
    while (isdefined(var_de19f33cb691869d)) {
        waitframe();
    }
    self notify("reward_cleanup");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2972
// Size: 0x33
function rewardobjectcleanup(var_de19f33cb691869d) {
    self waittill("reward_cleanup");
    if (isdefined(var_de19f33cb691869d)) {
        if (var_de19f33cb691869d isscriptable()) {
            var_de19f33cb691869d freescriptable();
        } else {
            var_de19f33cb691869d delete();
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ac
// Size: 0x69
function rewardobjectsetusable(var_de19f33cb691869d, var_9509c12edf4f2c41) {
    disablescriptableplayeruseall(var_de19f33cb691869d);
    foreach (player in var_9509c12edf4f2c41) {
        var_de19f33cb691869d enablescriptableplayeruse(player);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1c
// Size: 0x92
function rewardicon(var_de19f33cb691869d, var_2eaf3f31852684fd, var_be4e32b47ad61c7d) {
    id = createrewardicon(var_de19f33cb691869d, var_2eaf3f31852684fd);
    if (id < 0) {
        return;
    }
    if (isdefined(var_be4e32b47ad61c7d)) {
        foreach (player in var_be4e32b47ad61c7d) {
            objective_addclienttomask(id, player);
        }
    }
    thread rewardiconcleanup(id);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab5
// Size: 0x8d
function createrewardicon(var_de19f33cb691869d, var_2eaf3f31852684fd) {
    id = namespace_5a22b6f3a56f7e9b::requestobjectiveid();
    if (id >= 0) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(id, "current", var_de19f33cb691869d.origin + (0, 0, 50), var_2eaf3f31852684fd, "icon_regular");
        objective_setshowoncompass(id, 1);
        objective_setplayintro(id, !istrue(self.norewardiconintro));
        objective_setlabel(id, "BR_AI_ENCOUNTERS/OBJ_LABEL_REWARD");
        objective_showtoplayersinmask(id);
        objective_removeallfrommask(id);
    }
    return id;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4a
// Size: 0x1c
function rewardiconcleanup(id) {
    self waittill("reward_cleanup");
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(id);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6d
// Size: 0xa1
function icon_update_visibility(objid) {
    self endon("encounter_end");
    objective_showtoplayersinmask(objid);
    while (1) {
        objective_removeallfrommask(objid);
        foreach (guid, lasttime in self.playersinnotifyradius) {
            player = self.guidtoplayer[guid];
            if (isdefined(player)) {
                objective_addclienttomask(objid, player);
            }
        }
        self waittill("notify_list_changed");
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c15
// Size: 0x1ae
function spawn_agent(var_6f35bf8f6b43224c) {
    /#
        assertex(self.usesai, "Attempt to spawn AI from encounter not set to use AI");
    #/
    agent = namespace_34f6a6adabfc542d::spawnnewagent(var_6f35bf8f6b43224c.aitype, var_6f35bf8f6b43224c.team, var_6f35bf8f6b43224c.origin, var_6f35bf8f6b43224c.angles);
    if (isdefined(agent)) {
        agent.recentkillcount = 0;
        agent.recentdefendcount = 0;
        agent.kills = 0;
        agent.deaths = 0;
        agent.pers["cur_kill_streak"] = 0;
        agent.pers["cur_death_streak"] = 0;
        agent.pers["cur_kill_streak_for_nuke"] = 0;
        agent.tookweaponfrom = [];
        agent.killedplayers = [];
        agent.guid = agent getuniqueid();
        agent.script_noteworthy = var_6f35bf8f6b43224c.script_noteworthy;
        agent.scripted_long_deaths = 0;
        agent.agentdamagefeedback = 1;
        self.agents[self.agents.size] = agent;
        thread watch_agent_death(agent);
    } else {
        /#
            function_ca0d43a35b898ad4();
        #/
        /#
            assertmsg("Failed to spawnNewAgent. Type=" + vartostring(var_6f35bf8f6b43224c.aitype) + " team= " + vartostring(var_6f35bf8f6b43224c.team) + " origin= " + vartostring(var_6f35bf8f6b43224c.origin));
        #/
    }
    return agent;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dcb
// Size: 0x3f
function watch_agent_death(agent) {
    agent waittill("death");
    self.agents = array_remove(self.agents, agent);
    self.agentskilled++;
    self notify("agent_killed");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e11
// Size: 0x95
function targetstart_spawntrigger(trigger) {
    while (1) {
        player = trigger waittill("trigger");
        if (isagent(player)) {
            continue;
        }
        break;
    }
    targets = trigger get_targets();
    foreach (target in targets) {
        targetstart_spawner(target);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ead
// Size: 0x30
function root_ecounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    thread root_inittargets();
    thread root_monitorplayers();
    thread root_failconditions();
    /#
        thread function_a7b476bcb852aa88();
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee4
// Size: 0x17
function root_getspawneraitype(spawner) {
    return spawner.name;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f03
// Size: 0x116
function root_inittargets() {
    self.iconlabel = "BR_AI_ENCOUNTERS/OBJ_LABEL_GENERIC";
    waittillframeend();
    targets = get_targets();
    foreach (target in targets) {
        type = target.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_da19fcc268ff194f":
            thread targetstart_spawner(target);
            break;
        case #"hash_34ff250b650cb23":
            thread targetstart_spawntrigger(target);
            break;
        case #"hash_502e6f4e764c2750":
            thread targetstart_icon(target);
            break;
        case #"hash_25cf64aa9fe8e63a":
            thread targetstart_reward(target);
            break;
        case #"hash_a5b2891a35ef9337":
            thread targetstart_reward_prespawn(target);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3020
// Size: 0x307
function root_monitorplayers() {
    self endon("encounter_end");
    self.notifyradius = 7500;
    self.engagedradius = 2000;
    self.playersinnotifyradius = [];
    self.playersinengagedradius = [];
    self.guidtoplayer = [];
    waittillframeend();
    /#
        assert(self.notifyradius > self.engagedradius);
    #/
    var_391b2531e976a730 = self.notifyradius * self.notifyradius;
    var_ecb629d51f9ee6ee = self.engagedradius * self.engagedradius;
    var_a2562e11884920f6 = 20;
    while (1) {
        currenttime = gettime();
        updatecount = 0;
        var_6856b42eacc64814 = 0;
        var_da211178dcf27fba = 0;
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (!isdefined(player)) {
                continue;
            }
            self.guidtoplayer[player.guid] = player;
            if (!isalive(player)) {
                if (isdefined(self.playersinnotifyradius[player.guid])) {
                    var_6856b42eacc64814 = 1;
                    self.playersinnotifyradius[player.guid] = undefined;
                }
                if (isdefined(self.playersinengagedradius[player.guid])) {
                    var_da211178dcf27fba = 1;
                    self.playersinengagedradius[player.guid] = undefined;
                }
            } else {
                var_f95436827e16d133 = distance2dsquared(player.origin, self.origin);
                if (var_f95436827e16d133 <= var_391b2531e976a730) {
                    if (!isdefined(self.playersinnotifyradius[player.guid])) {
                        var_6856b42eacc64814 = 1;
                    }
                    self.playersinnotifyradius[player.guid] = currenttime;
                } else {
                    lasttime = self.playersinnotifyradius[player.guid];
                    if (isdefined(lasttime) && currenttime - lasttime > 2000) {
                        var_6856b42eacc64814 = 1;
                        self.playersinnotifyradius[player.guid] = undefined;
                    }
                }
                if (var_f95436827e16d133 <= var_ecb629d51f9ee6ee) {
                    if (!isdefined(self.playersinengagedradius[player.guid])) {
                        var_da211178dcf27fba = 1;
                    }
                    self.playersinengagedradius[player.guid] = currenttime;
                } else {
                    lasttime = self.playersinengagedradius[player.guid];
                    if (isdefined(lasttime) && currenttime - lasttime > 2000) {
                        var_da211178dcf27fba = 1;
                        self.playersinengagedradius[player.guid] = undefined;
                    }
                }
                updatecount++;
                if (updatecount >= var_a2562e11884920f6) {
                    wait(0.05);
                    updatecount = 0;
                }
            }
        }
        if (var_6856b42eacc64814) {
            self notify("notify_list_changed");
        }
        if (var_da211178dcf27fba) {
            self notify("engaged_list_changed");
        }
        wait(0.05);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x332e
// Size: 0x28
function root_failconditions() {
    self.failconditionengagedradiustime = 90;
    waittillframeend();
    thread failcondition_noplayersinengagedradius(self.failconditionengagedradiustime);
    thread failcondition_outsidedangercircle();
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x335d
// Size: 0x30
function rootai_ecounterstart() {
    self.usesai = 1;
    self.func_getspawneraitype = &root_getspawneraitype;
    self.agentskilled = 0;
    self.agents = [];
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3394
// Size: 0x351
function bank_ecounterstart() {
    self endon("encounter_end");
    /#
        function_2f6185a84b023517();
    #/
    self.func_getspawneraitype = &bank_getspawneraitype;
    self.iconlabel = "BR_AI_ENCOUNTERS/OBJ_LABEL_BANK";
    thread alarm_sound_on();
    thread alarm_sound_off_encounter_end();
    thread vault_door_think();
    var_baf4ed84461b1570 = getent("bank_vol_01", "targetname");
    var_1f9b128600c9d94f = getent("bank_vol_01_upper", "targetname");
    level.wave1_enemies = [];
    var_f9b64c981aa4ead5 = getstructarray("enemy_wave_01", "targetname");
    foreach (struct in var_f9b64c981aa4ead5) {
        var_280ee35a5ecce148 = targetstart_spawner(struct);
        if (var_280ee35a5ecce148.script_noteworthy == "wave01_upper") {
            var_280ee35a5ecce148 setgoalvolumeauto(var_1f9b128600c9d94f);
            var_280ee35a5ecce148.goalheight = 256;
        } else if (var_280ee35a5ecce148.script_noteworthy == "wave01_lower") {
            var_280ee35a5ecce148 setgoalvolumeauto(var_baf4ed84461b1570);
        }
        level.wave1_enemies = array_add(level.wave1_enemies, var_280ee35a5ecce148);
    }
    var_4363cfb8b64df5f4 = getent("wave_01_overrun_trig", "targetname");
    waittill_trigger_or_dead(var_4363cfb8b64df5f4, level.wave1_enemies, level.wave1_enemies.size - 3);
    level notify("spawn_wave2");
    var_baf4f084461b1c09 = getent("bank_vol_02", "targetname");
    var_52d1d968632b4435 = [];
    var_861e23eae938b57f = getstructarray("enemy_wave_02", "targetname");
    foreach (guy in var_861e23eae938b57f) {
        var_280ee35a5ecce148 = targetstart_spawner(guy);
        var_280ee35a5ecce148 setgoalvolumeauto(var_baf4f084461b1c09);
        var_52d1d968632b4435 = array_add(var_52d1d968632b4435, var_280ee35a5ecce148);
    }
    foreach (enemy in level.wave1_enemies) {
        if (isdefined(enemy) && isalive(enemy)) {
            enemy setgoalvolumeauto(var_baf4f084461b1c09);
            var_52d1d968632b4435 = array_add(var_52d1d968632b4435, enemy);
        }
    }
    waittill_dead(var_52d1d968632b4435, var_52d1d968632b4435.size);
    wait(0.5);
    self notify("open_vault");
    var_baf4ef84461b19d6 = getent("bank_vol_03", "targetname");
    var_ae7126de41cfdc3e = [];
    var_293f0904152c71c1 = getstruct("enemy_wave_03_boss", "targetname");
    var_415021716f694843 = targetstart_spawner(var_293f0904152c71c1);
    var_415021716f694843 thread jug_behavior();
    var_ae7126de41cfdc3e = array_add(var_ae7126de41cfdc3e, var_415021716f694843);
    waittill_dead(var_ae7126de41cfdc3e, var_ae7126de41cfdc3e.size);
    encounter_end(1);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ec
// Size: 0x12
function vault_door_open_wait() {
    self endon("encounter_end");
    self waittill("open_vault");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3705
// Size: 0x7a
function vault_door_init(door) {
    if (istrue(door.init)) {
        door.angles = door.start_angles;
        return;
    }
    door_clip = getent("vault_door_clip", "targetname");
    door_clip linkto(door);
    door.start_angles = door.angles;
    door.init = 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3786
// Size: 0x4b
function vault_door_think() {
    door = getent("vault_door", "targetname");
    vault_door_init(door);
    vault_door_open_wait();
    door thread vault_door_sound();
    door rotateby((0, 180, 0), 5);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d8
// Size: 0x68
function jug_behavior() {
    players = sortbydistance(level.players, self.origin);
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isalive(player)) {
            self getenemyinfo(player);
            self setgoalentity(player);
            break;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3847
// Size: 0x6e
function alarm_sound_on() {
    var_1977d2ff9b8f08c3 = getentarray("bank_alarm_pos", "targetname");
    foreach (pos in var_1977d2ff9b8f08c3) {
        pos playloopsound("emt_alarm_bank_bell_lp");
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bc
// Size: 0x6e
function alarm_sound_off() {
    var_1977d2ff9b8f08c3 = getentarray("bank_alarm_pos", "targetname");
    foreach (pos in var_1977d2ff9b8f08c3) {
        pos stoploopsound("emt_alarm_bank_bell_lp");
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3931
// Size: 0x99
function vault_door_sound() {
    distsqr = 4000000;
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            if (distancesquared(player.origin, self.origin) <= distsqr) {
                player playsound("cp_bank_vault_open");
            }
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d1
// Size: 0x59
function waittill_trigger_or_dead(trigger, guys, num, timeoutlength) {
    struct = spawnstruct();
    struct endon("done");
    struct childthread _waittill_trigger(trigger);
    struct childthread _waittill_dead_notify_done(guys, num, timeoutlength);
    struct waittill("done");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a31
// Size: 0x2e
function _waittill_dead_notify_done(guys, num, timeoutlength) {
    waittill_dead(guys, num, timeoutlength);
    self notify("done");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a66
// Size: 0x3e
function _waittill_trigger(trigger) {
    while (1) {
        player = trigger waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        break;
    }
    self notify("done");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aab
// Size: 0x12
function alarm_sound_off_encounter_end() {
    self waittill("encounter_end");
    alarm_sound_off();
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac4
// Size: 0x54
function bank_getspawneraitype(spawner) {
    if (isdefined(spawner.script_noteworthy)) {
        switch (spawner.script_noteworthy) {
        case #"hash_9196025f8ae8e51e":
            return "actor_enemy_br_juggernaut";
        default:
            break;
        }
    }
    return "actor_enemy_br_base";
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b20
// Size: 0x25c
function airport_ecounterstart() {
    var_a4ccc78c8ba2c673 = getent("ai_encounter_crate", "targetname");
    var_a4ccc78c8ba2c673 movez(256, 0.05);
    wait(0.5);
    createnavobstaclebyent(var_a4ccc78c8ba2c673);
    trigger = getent("kickoff_airport_encounter", "targetname");
    player = trigger waittill("trigger");
    grenadeweapon = "smoke_grenade_mp";
    var_c8ad4a3d631db329 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos", "targetname").angles) * 400, 1);
    wait(0.1);
    var_c8ad473d631dac90 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos_02", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos_02", "targetname").angles) * 400, 1.3);
    var_c8ad483d631daec3 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos_03", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos_03", "targetname").angles) * 450, 2);
    var_baf4ed84461b1570 = getent("airport_vol_01", "targetname");
    wait(2);
    var_43e751ad559f1c24 = [];
    var_f9b64c981aa4ead5 = getstructarray("airport_enemy_wave_01", "targetname");
    foreach (struct in var_f9b64c981aa4ead5) {
        var_280ee35a5ecce148 = targetstart_spawner(struct);
        var_280ee35a5ecce148 setgoalvolumeauto(var_baf4ed84461b1570);
        var_280ee35a5ecce148 thread airport_enemy_setup();
        var_43e751ad559f1c24 = array_add(var_43e751ad559f1c24, var_280ee35a5ecce148);
    }
    var_4363cfb8b64df5f4 = getent("wave_01_overrun_trig", "targetname");
    waittill_dead(var_43e751ad559f1c24, var_43e751ad559f1c24.size);
    encounter_end(1);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d83
// Size: 0x30
function airport_enemy_setup() {
    self.ignore_all = 1;
    wait(randomfloatrange(1, 2));
    self.ignore_all = 0;
    self.accuracy = 0.01;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dba
// Size: 0x24d
function truck_encounterstart() {
    self endon("encounter_end");
    self.func_getspawneraitype = &truck_getspawneraitype;
    self.iconlabel = "BR_AI_ENCOUNTERS/OBJ_LABEL_TRUCK";
    thread failcondition_noplayersinengagedradius(90);
    start_trigger = undefined;
    var_8e440e8f6172b38f = undefined;
    var_f2ddd0aa0e17af6c = [];
    var_e885ac175bf944e4 = [];
    targets = get_targets();
    foreach (target in targets) {
        type = target.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_4bc6c12fcdff02dc":
            start_trigger = target;
            break;
        case #"hash_954e5090b3c7b185":
            var_f2ddd0aa0e17af6c[var_f2ddd0aa0e17af6c.size] = target;
            break;
        case #"hash_48f45fbed0b294f3":
            var_8e440e8f6172b38f = target;
            thread truck_roll_door_init(var_8e440e8f6172b38f);
            break;
        case #"hash_3a455fee27335f03":
            var_e885ac175bf944e4[var_e885ac175bf944e4.size] = target;
            break;
        default:
            break;
        }
    }
    /#
        thread function_90d5fe589f383968(var_8e440e8f6172b38f);
    #/
    /#
        self.var_2253a634b70fcd12["<unknown string>"] = "<unknown string>";
    #/
    while (1) {
        player = start_trigger waittill("trigger");
        if (isalive(player) && isplayer(player)) {
            break;
        }
    }
    /#
        self.var_2253a634b70fcd12["<unknown string>"] = undefined;
    #/
    destroynavobstacle(var_8e440e8f6172b38f getentitynumber());
    truck_roll_door_open(var_8e440e8f6172b38f);
    var_b71b94cd63885213 = [];
    foreach (guy in var_f2ddd0aa0e17af6c) {
        var_280ee35a5ecce148 = targetstart_spawner(guy);
        var_b71b94cd63885213 = array_add(var_b71b94cd63885213, var_280ee35a5ecce148);
    }
    waittill_dead(var_b71b94cd63885213, var_b71b94cd63885213.size);
    encounter_end(1);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400e
// Size: 0xed
function truck_roll_door_init(door) {
    self endon("encounter_end");
    if (!istrue(door.init)) {
        door.angle_ref = getstruct(door.target, "targetname");
        if (!isdefined(door.angle_ref.angles)) {
            door.angle_ref.angles = (0, 0, 0);
        }
        door.start_origin = door.origin;
        door.start_angles = door.angles;
        door.init = 1;
    } else {
        door.origin = door.start_origin;
        door.angles = door.start_angles;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4102
// Size: 0x27
function truck_roll_door_open(var_8e440e8f6172b38f) {
    var_8e440e8f6172b38f rotatepitch(-90, 1);
    truck_roll_door_sound(var_8e440e8f6172b38f);
    self notify("truck_roll_door_open");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4130
// Size: 0x35
function function_90d5fe589f383968(var_8e440e8f6172b38f) {
    /#
        self endon("<unknown string>");
        success = self waittill("<unknown string>");
        if (success) {
            truck_roll_door_open(var_8e440e8f6172b38f);
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416c
// Size: 0xa4
function truck_roll_door_sound(door) {
    distsqr = 1000000;
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player)) {
            if (distancesquared(player.origin, door.origin) <= distsqr) {
                player playsound("cp_bank_gate_fall");
            }
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4217
// Size: 0x11
function truck_getspawneraitype(spawner) {
    return "actor_enemy_br_base";
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4230
// Size: 0x22b
function crateguard_encounterstart() {
    self endon("encounter_end");
    self.func_getspawneraitype = &crateguard_getspawneraitype;
    self.iconlabel = "BR_AI_ENCOUNTERS/OBJ_LABEL_CRATE_GUARD";
    thread failcondition_noplayersinengagedradius(90);
    start_trigger = undefined;
    var_3a83f6349784bd99 = undefined;
    guard_spawners = [];
    targets = get_targets();
    foreach (target in targets) {
        type = target.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_7df245010bdec44e":
            guard_spawners[guard_spawners.size] = target;
            break;
        case #"hash_96595d749aadbe62":
            /#
                assert(!isdefined(var_3a83f6349784bd99));
            #/
            var_3a83f6349784bd99 = target;
            break;
        case #"hash_4bc6c12fcdff02dc":
            start_trigger = target;
            break;
        default:
            break;
        }
    }
    /#
        self.var_2253a634b70fcd12["<unknown string>"] = "<unknown string>";
    #/
    while (1) {
        player = start_trigger waittill("trigger");
        if (isalive(player) && isplayer(player)) {
            break;
        }
    }
    /#
        self.var_2253a634b70fcd12["<unknown string>"] = undefined;
    #/
    var_98aa513355e1a321 = [];
    foreach (struct in guard_spawners) {
        var_280ee35a5ecce148 = targetstart_spawner(struct);
        var_98aa513355e1a321[var_98aa513355e1a321.size] = var_280ee35a5ecce148;
    }
    boss = targetstart_spawner(var_3a83f6349784bd99);
    var_98aa513355e1a321[var_98aa513355e1a321.size] = boss;
    childthread crateguard_bosssetup(boss, var_98aa513355e1a321);
    waittill_dead(var_98aa513355e1a321, var_98aa513355e1a321.size);
    encounter_end(1);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4462
// Size: 0x5d
function crateguard_bosssetup(boss, var_896452c986f0513b) {
    boss.ignoreall = 1;
    everyone = var_896452c986f0513b;
    everyone[everyone.size] = boss;
    waittill_any_ents_array(everyone, "death", "damage", "enemy");
    if (isdefined(boss)) {
        boss.ignoreall = 0;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c6
// Size: 0x3b
function crateguard_getspawneraitype(spawner) {
    if (isdefined(spawner.script_noteworthy) && spawner.script_noteworthy == "guard_boss") {
        return "actor_enemy_br_boss";
    }
    return "actor_enemy_br_base";
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4509
// Size: 0x4d
function smoking() {
    setup_anim_guy();
    self.deathstate = "animscripted";
    self.deathalias = "smoking_death";
    thread smoking_idle("smoking_idle");
    thread smoking_react("smoking_react");
    thread smoking_death("smoking_death");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455d
// Size: 0x4f
function smoking_idle(animalias) {
    self endon("death");
    self endon("damage");
    thread ai_notetrack_loop("smoking");
    while (1) {
        smoking_idle_start("smoking_idle_start");
        namespace_aaebfc23308fe5e4::animscripted_single(animalias);
        smoking_idle_end("smoking_idle_end");
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b3
// Size: 0x22
function smoking_idle_start(animalias) {
    self endon("death");
    self endon("damage");
    namespace_aaebfc23308fe5e4::animscripted_single(animalias);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45dc
// Size: 0x22
function smoking_idle_end(animalias) {
    self endon("death");
    self endon("damage");
    namespace_aaebfc23308fe5e4::animscripted_single(animalias);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4605
// Size: 0x9b
function smoking_react(var_e25ca6f64fdb941f) {
    self endon("death");
    self waittill("damage");
    ai_smoking_cleanup();
    self.deathstate = undefined;
    self.deathalias = undefined;
    if (isdefined(self.idle_prop)) {
        self.idle_prop unlink();
        self.idle_prop physicslaunchserver(self.idle_prop.origin, (0, 0, -10));
        self.idle_prop = undefined;
    }
    namespace_aaebfc23308fe5e4::animscripted_single(var_e25ca6f64fdb941f);
    reset_guy(self);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a7
// Size: 0x22
function smoking_death(sanim) {
    self endon("damage");
    self waittill("death");
    ai_smoking_cleanup();
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d0
// Size: 0x121
function ai_notehandler_smoking(note) {
    switch (note) {
    case #"hash_2d1403e602f082a4":
        playfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
        break;
    case #"hash_d582c3286e5c390f":
        playfxontag(level.g_effect["cigarette_lit"], self, "tag_accessory_right");
        stopfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
        playfx(level.g_effect["lighter_glow"], self gettagorigin("tag_accessory_right"));
        thread ai_smoking_blowsmoke();
        break;
    case #"hash_682ec8b49fe7aa12":
        stopfxontag(level.g_effect["cigarette_lit"], self, "tag_accessory_right");
        stopfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
        playfx(level.g_effect["cigarette_lit_toss"], self gettagorigin("tag_accessory_right"), anglestoforward(self gettagangles("tag_accessory_right")));
        break;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f8
// Size: 0x7e
function ai_smoking_blowsmoke() {
    self endon("smoking_end");
    self endon("death");
    self notify("ai_notetrack_Loop");
    self endon("ai_notetrack_Loop");
    self endon("damage");
    while (1) {
        playfx(level.g_effect["cigarette_smoke"], self geteye() - (0, 0, 2), anglestoforward(self gettagangles("tag_eye")));
        waittime = randomintrange(5, 8);
        wait(waittime);
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487d
// Size: 0x5f
function ai_smoking_cleanup() {
    self notify("smoking_end");
    self endon("death");
    if (hastag(self.model, "tag_accessory_right")) {
        killfxontag(level.g_effect["cigarette_lit"], self, "tag_accessory_right");
        killfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48e3
// Size: 0x6f
function standing_cellphone(var_ff75b4157a7aa48a) {
    if (!isdefined(var_ff75b4157a7aa48a)) {
        var_ff75b4157a7aa48a = 0;
    }
    setup_anim_guy();
    self.deathstate = "animscripted";
    self.deathalias = "stand_cellphone_death";
    thread ai_notetrack_loop("standing_cellphone");
    standing_cellphone_anim("stand_cellphone_intro");
    if (var_ff75b4157a7aa48a > 0) {
        standing_cellphone_loop("stand_cellphone_loop", var_ff75b4157a7aa48a);
    }
    standing_cellphone_anim("stand_cellphone_exit");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4959
// Size: 0x22
function standing_cellphone_anim(animalias) {
    self endon("death");
    self endon("damage");
    namespace_aaebfc23308fe5e4::animscripted_single(animalias);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4982
// Size: 0x2b
function standing_cellphone_loop(animalias, loops) {
    self endon("death");
    self endon("damage");
    namespace_aaebfc23308fe5e4::animscripted_loop_n_times(animalias, loops);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b4
// Size: 0x83
function ai_notehandler_cellphone(note) {
    self endon("death");
    self endon("damage");
    switch (note) {
    case #"hash_2d1403e602f082a4":
        self.idle_prop = namespace_bc4a4b9456315863::anim_link_tag_model("equipment_personal_smartphone_01", "tag_accessory_right");
        wait(2);
        break;
    case #"hash_682ec8b49fe7aa12":
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
        break;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3e
// Size: 0xe
function setup_anim_guy() {
    self.playing_skit = 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a53
// Size: 0x96
function reset_guy(guy) {
    guy allowedstances("prone", "stand", "crouch");
    guy namespace_aaebfc23308fe5e4::animscripted_clear();
    guy setlookatentity();
    guy.headlook_enabled = 1;
    guy.disableautolookat = 0;
    guy.deathstate = undefined;
    guy.deathalias = undefined;
    guy.ignoreall = 0;
    guy.playing_skit = undefined;
    if (isdefined(self.anchor)) {
        self.anchor delete();
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af0
// Size: 0xf1
function ai_notetrack_loop(var_887d46b1410c42ca) {
    self endon("death");
    self notify("ai_notetrack_Loop");
    self endon("ai_notetrack_Loop");
    self endon("damage");
    while (1) {
        notes = self waittill("animscripted");
        if (!isdefined(notes)) {
            notes = [0:"undefined"];
        }
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        /#
            assert(isdefined(self.fnasm_handlenotetrack));
        #/
        var_fc9a12fe1f57542a = undefined;
        foreach (note in notes) {
            if (var_887d46b1410c42ca == "smoking") {
                ai_notehandler_smoking(note);
            } else if (var_887d46b1410c42ca == "standing_cellphone") {
                ai_notehandler_cellphone(note);
            }
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be8
// Size: 0xd
function test_ecounterstart() {
    /#
        function_2f6185a84b023517();
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bfc
// Size: 0xd
function rootnonai_ecounterstart() {
    self.usesai = 0;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c10
// Size: 0x21c
function dom_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    self.norewardiconintro = 1;
    self.engagedradius = 1500;
    domencounter_icons();
    trigger = undefined;
    targets = get_targets();
    foreach (target in targets) {
        type = target.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_1b79c5d9e0f9886a":
            /#
                assert(!isdefined(trigger));
            #/
            radius = 315;
            height = 120;
            trigger = spawn("trigger_radius", target.origin, 0, int(radius), int(height));
            trigger.script_label = "_a";
            break;
        default:
            break;
        }
    }
    if (!isdefined(trigger)) {
        return;
    }
    level.setdomscriptablepartstatefunc = &domencounter_setdomscriptablepartstate;
    domflag = namespace_98b55913d2326ac8::setupobjective(trigger);
    domflag.noscriptable = undefined;
    domflag.vfxnamemod = "_300";
    domflag.onuse = &domencounter_onuse;
    domflag.onuseupdate = &domencounter_onuseupdate;
    domflag.onenduse = &domencounter_onenduse;
    domflag namespace_19b4203b51d56488::setvisibleteam("any");
    domflag namespace_98b55913d2326ac8::domflag_setneutral();
    level.flagcapturetime = getdvarint(@"hash_ab50f58bb9979459", 30);
    domflag namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    domflag.encounterlocation = self;
    /#
        self.var_c9b1bec86850a01a = domflag;
    #/
    thread encounterdeletedomgameobjectonend(domflag);
    thread icon_update_visibility(domflag.objidnum);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e33
// Size: 0xed
function encounterdeletedomgameobjectonend(domflag) {
    domflag endon("deleted");
    self waittill("encounter_end");
    foreach (vis in domflag.visuals) {
        vis delete();
    }
    if (isdefined(domflag.flagmodel)) {
        domflag.flagmodel delete();
    }
    if (isdefined(domflag.scriptable)) {
        domflag.scriptable delete();
    }
    if (isdefined(domflag.trigger)) {
        domflag.trigger delete();
        domflag.trigger = undefined;
    }
    domflag thread gameobjectreleaseid_delayed();
    domflag notify("deleted");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f27
// Size: 0x10
function gameobjectreleaseid_delayed() {
    wait(0.1);
    namespace_19b4203b51d56488::releaseid();
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3e
// Size: 0x17c
function domencounter_icons() {
    level.iconneutral = "waypoint_captureneutral_br";
    level.iconcapture = "waypoint_capture_br";
    level.icondefend = "waypoint_defend_br";
    level.icondefending = "waypoint_defending_br";
    level.iconcontested = "waypoint_contested_br";
    level.icontaking = "waypoint_taking_br";
    level.iconlosing = "waypoint_losing_br";
    _setdomencountericoninfo("icon_waypoint_dom_br", "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", 0);
    _setdomencountericoninfo("waypoint_taking_br", "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", 1);
    _setdomencountericoninfo("waypoint_capture_br", "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", 0);
    _setdomencountericoninfo("waypoint_defend_br", "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", 0);
    _setdomencountericoninfo("waypoint_defending_br", "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", 0);
    _setdomencountericoninfo("waypoint_blocking_br", "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", 0);
    _setdomencountericoninfo("waypoint_blocked_br", "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", 0);
    _setdomencountericoninfo("waypoint_losing_br", "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", 1);
    _setdomencountericoninfo("waypoint_captureneutral_br", "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", 0);
    _setdomencountericoninfo("waypoint_contested_br", "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", 1);
    _setdomencountericoninfo("waypoint_dom_target_br", "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", 0);
    _setdomencountericoninfo("icon_waypoint_target_br", "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", 0);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c1
// Size: 0x69
function _setdomencountericoninfo(name, colors, string, var_b50e35d9c370899b) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 0;
    level.waypointstring[name] = string;
    level.waypointshader[name] = "icon_waypoint_dom_a";
    level.waypointpulses[name] = var_b50e35d9c370899b;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5131
// Size: 0x4b
function domencounter_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    if (progress > 0.05 && change && !self.didstatusnotify) {
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5183
// Size: 0x29
function domencounter_onuse(var_22282e7d48ca3400) {
    self.encounterlocation encounter_end(1, var_22282e7d48ca3400.team);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51b3
// Size: 0x26
function domencounter_onenduse(team, player, success) {
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e0
// Size: 0x9b
function domencounter_setdomscriptablepartstate(part, state, var_ba360e4ff7be8d96) {
    switch (state) {
    case #"hash_1c39674e5b0de0f3":
    case #"hash_3699ac6c262c25ea":
    case #"hash_86bf1a776a7c4cbe":
        return 0;
    default:
        state = "using";
        if (isdefined(var_ba360e4ff7be8d96)) {
            state = state + var_ba360e4ff7be8d96;
        }
        self.scriptable setscriptablepartstate(part, state);
        if (part == "pulse") {
            self.scriptable setscriptablepartstate("flag", state);
        }
        return 1;
        break;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5282
// Size: 0xd
function bombplant_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5296
// Size: 0xe0
function extraction_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    iprintlnbold("EXTRACTION START");
    /#
        print("<unknown string>");
    #/
    targets = get_targets();
    foreach (target in targets) {
        type = target.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_98ea57354948cbee":
            extraction_createescort(target);
            break;
        case #"hash_8d43150f19c69bd6":
            targetstart_extractiongoal(target);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537d
// Size: 0x67
function targetstart_extractiongoal(goalstruct) {
    if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        return;
    }
    goal = spawn("script_model", goalstruct.origin + (0, 0, 20));
    goal setmodel("ctf_game_flag_east");
    self.goal = goal;
    goal.encounter = self;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53eb
// Size: 0xe5
function extraction_createescort(target) {
    escort = spawn("script_model", target.origin + (0, 0, 20));
    escort setmodel("fullbody_usmc_ar");
    escort scriptmodelplayanim("sdr_cp_hostage_dropoff_ground_idle_pilot");
    escort scriptmodelpauseanim(1);
    escort makeusable();
    escort setcursorhint("HINT_NOICON");
    escort setuseholdduration("duration_medium");
    escort sethintrequiresholding(1);
    escort sethintdisplayfov(120);
    escort setusefov(120);
    escort setuserange(80);
    escort sethintstring("MP/BR_USE_PLUNDER_CACHE");
    escort setasgametypeobjective();
    escort show();
    escort.readytoextract = 0;
    escort thread extraction_escortthink();
    self.escort = escort;
    escort.encounter = self;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d7
// Size: 0x58
function extraction_escortthink() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        player = self waittill("trigger");
        if (!self.readytoextract) {
            player extraction_playerpickupbody(self, player.team);
        } else {
            thread extraction_attachfultonballoontoescort(player);
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5536
// Size: 0xec
function extraction_playerpickupbody(useent, team) {
    self endon("droppedBody");
    useent makeunusable();
    holdingbodyhud = namespace_52f6938dd902c7d0::createfontstring("default", 1.5);
    holdingbodyhud namespace_52f6938dd902c7d0::setpoint("CENTER", "CENTER", 0, 120);
    holdingbodyhud.label = "MP/BR_RESPAWN_BODY";
    self.holdingbodyhud = holdingbodyhud;
    useent scriptmodelplayanim("sdr_cp_hostage_walk_hostage");
    useent linkto(self, "j_clavicle_le", (0, 0, 0), (0, 0, 0));
    self allowads(0);
    self allowcrouch(0);
    self allowprone(0);
    self allowjump(0);
    namespace_4f9f94245708410d::playersetcarryteammates(1);
    while (!self stancebuttonpressed() || !self isonground()) {
        waitframe();
    }
    extraction_dropbody(useent, self, holdingbodyhud, team);
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5629
// Size: 0x13d
function extraction_dropbody(useent, var_11f6008c3b0c47bf, holdingbodyhud, team) {
    if (isdefined(var_11f6008c3b0c47bf)) {
        var_11f6008c3b0c47bf allowads(1);
        var_11f6008c3b0c47bf allowcrouch(1);
        var_11f6008c3b0c47bf allowprone(1);
        var_11f6008c3b0c47bf allowjump(1);
        namespace_4f9f94245708410d::playersetcarryteammates(0);
    }
    if (isdefined(holdingbodyhud)) {
        holdingbodyhud destroy();
    }
    if (useent islinked()) {
        useent unlink();
    }
    origin = undefined;
    if (isdefined(var_11f6008c3b0c47bf)) {
        useent.angles = var_11f6008c3b0c47bf.angles;
        origin = var_11f6008c3b0c47bf.origin;
        useent.origin = origin + (0, 0, 40);
    } else {
        origin = useent.origin;
        useent.origin = origin + (0, 0, 40);
    }
    useent scriptmodelplayanim("sdr_cp_hostage_dropoff_ground_idle_pilot");
    useent scriptmodelpauseanim(1);
    useent.origin = origin + (0, 0, 1);
    useent makeusable();
    if (useent extraction_checkescortradius()) {
        useent extraction_changeescortusefunction();
    }
    useent notify("droppedBody");
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x576d
// Size: 0x53
function extraction_checkescortradius(player) {
    /#
        println("<unknown string>");
    #/
    if (distance2d(self.origin, self.encounter.goal.origin) < 100) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c7
// Size: 0x42
function extraction_changeescortusefunction() {
    self makeusable();
    self setcursorhint("HINT_NOICON");
    self setuseholdduration("duration_long");
    self sethintrequiresholding(1);
    self sethintstring("MP/BR_USE_PLUNDER_CACHE");
    self.readytoextract = 1;
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5810
// Size: 0x4c
function extraction_attachfultonballoontoescort(player) {
    /#
        print("<unknown string>");
    #/
    self.encounter encounter_end(1);
    self.encounter.goal delete();
    self delete();
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5863
// Size: 0xc7
function destruction_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    scriptables = getscriptablearray(self.target, "targetname");
    var_23535f5a1af3f7f = [];
    foreach (scriptable in scriptables) {
        type = scriptable.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_145971eb70575f25":
            var_23535f5a1af3f7f[var_23535f5a1af3f7f.size] = scriptable;
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5931
// Size: 0x12
function function_674facc5e1cb84c() {
    /#
        function_8ff83bdd5420ae28("icon_regular");
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x594a
// Size: 0x12
function function_1535016662214ec5() {
    /#
        function_8ff83bdd5420ae28("brloot_killstreak_clusterstrike");
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5963
// Size: 0x12
function function_2f6185a84b023517() {
    /#
        function_8ff83bdd5420ae28("BR_AI_ENCOUNTERS/OBJ_LABEL_REWARD");
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x597c
// Size: 0x50
function function_8ff83bdd5420ae28(type) {
    /#
        var_62f1998d4ccbbd13 = self.debugtype;
        if (!isdefined(var_62f1998d4ccbbd13)) {
            var_62f1998d4ccbbd13 = "<unknown string>";
        }
        /#
            assertex(type == var_62f1998d4ccbbd13, "<unknown string>" + type + "<unknown string>" + var_62f1998d4ccbbd13 + "<unknown string>");
        #/
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59d3
// Size: 0x19
function function_5bb507603ca9de76(reason) {
    /#
        self.var_ba39558253c90b45 = reason;
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59f3
// Size: 0x4e
function function_172af363664b6357() {
    /#
        setdvarifuninitialized(@"hash_a163377bb1005bf5", 0);
        setdvarifuninitialized(@"hash_f14edbb0f6781ef7", 0);
        thread function_e0b65595a00c4889();
        thread function_ab390a4e188862f0();
        thread function_5ca1479bb38ceccd();
        thread function_ddbf9ba7459fe5c0();
        thread function_578d4816dbfe5bad();
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a48
// Size: 0xd1
function function_e0b65595a00c4889() {
    /#
        function_674facc5e1cb84c();
        /#
            assert(-2 != -1);
        #/
        while (1) {
            setdvar(@"hash_9c7e1cd61023c008", -2);
            while (getdvarint(@"hash_9c7e1cd61023c008", -2) == -2) {
                wait(0.2);
            }
            var_384446a35f40358c = getdvarint(@"hash_9c7e1cd61023c008", -2);
            if (var_384446a35f40358c == -1) {
                if (!self.alllocations.size) {
                    continue;
                }
                var_625ccc4d57f3a1a0 = namespace_9c840bb9f2ecbf00::quicksort(self.alllocations, &function_9fc9e7ca6864ff7);
                var_384446a35f40358c = var_625ccc4d57f3a1a0[0].var_2613246720524878;
            }
            var_342e3868ecfcaf7 = self.alllocations[var_384446a35f40358c];
            encounter_start(var_342e3868ecfcaf7);
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b20
// Size: 0xce
function function_20b9ab28a71f8361(dvarname, var_1c12350493547349, success) {
    /#
        function_674facc5e1cb84c();
        /#
            assert(var_1c12350493547349 != -1);
        #/
        while (1) {
            setdvar(dvarname, var_1c12350493547349);
            while (getdvarint(dvarname, var_1c12350493547349) == var_1c12350493547349) {
                wait(0.2);
            }
            var_384446a35f40358c = getdvarint(dvarname, var_1c12350493547349);
            if (var_384446a35f40358c == -1) {
                if (!self.activelocations.size) {
                    continue;
                }
                var_625ccc4d57f3a1a0 = namespace_9c840bb9f2ecbf00::quicksort(self.activelocations, &function_9fc9e7ca6864ff7);
                var_384446a35f40358c = var_625ccc4d57f3a1a0[0].var_2613246720524878;
            }
            var_342e3868ecfcaf7 = self.alllocations[var_384446a35f40358c];
            var_342e3868ecfcaf7 encounter_end(success);
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf5
// Size: 0x1b
function function_ab390a4e188862f0() {
    /#
        thread function_20b9ab28a71f8361(@"hash_e4a17f4ad4db68f9", -2, 1);
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c17
// Size: 0x1a
function function_5ca1479bb38ceccd() {
    /#
        thread function_20b9ab28a71f8361(@"hash_ce1c94bf929657cc", -2, 0);
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c38
// Size: 0xd4
function function_9fc9e7ca6864ff7(left, right) {
    /#
        var_4ad295dcda3f5afa = [0:0, 1:0, 2:0, 3:0];
        var_50a40377f43c29c4 = var_4ad295dcda3f5afa[left.state];
        var_56861913a2f7be85 = var_4ad295dcda3f5afa[right.state];
        if (var_50a40377f43c29c4 == var_56861913a2f7be85) {
            leftdist = distance2dsquared(level.player.origin, left.origin);
            var_9e28554870f49b4d = distance2dsquared(level.player.origin, right.origin);
            return (leftdist <= var_9e28554870f49b4d);
        } else {
            return (var_50a40377f43c29c4 <= var_56861913a2f7be85);
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d13
// Size: 0x49f
function function_ddbf9ba7459fe5c0() {
    /#
        setdvarifuninitialized(@"hash_6f44f0cbecc66ade", 0);
        setdvarifuninitialized(@"hash_42e40d8c0b9056bb", 10);
        while (!isdefined(level.player)) {
            waitframe();
        }
        x_pos = 10;
        y_pos = 170;
        while (1) {
            hudelems = [];
            while (!getdvarint(@"hash_6f44f0cbecc66ade", 0)) {
                waitframe();
            }
            var_41f97a94c30a7593 = function_ecd35236fb86f2d3();
            var_41f97a94c30a7593.x = x_pos;
            var_41f97a94c30a7593.y = y_pos;
            var_41f97a94c30a7593 setdevtext("<unknown string>");
            while (getdvarint(@"hash_6f44f0cbecc66ade", 0)) {
                var_9327e30c0d510a51 = getdvarint(@"hash_42e40d8c0b9056bb", 10);
                var_625ccc4d57f3a1a0 = namespace_9c840bb9f2ecbf00::quicksort(self.alllocations, &function_9fc9e7ca6864ff7);
                var_7bc749fccfc8e770 = [];
                for (i = 0; i < var_625ccc4d57f3a1a0.size && i < var_9327e30c0d510a51; i++) {
                    loc = var_625ccc4d57f3a1a0[i];
                    str = "<unknown string>" + loc.var_2613246720524878 + "<unknown string>" + loc.name + "<unknown string>" + function_5443af46fa933222(loc.state);
                    if (loc.state != 1) {
                        str = str + "<unknown string>" + function_6a540d657d267069(loc);
                    }
                    var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = str;
                    if (loc.state == 1) {
                        var_ba9a868834899928 = "<unknown string>";
                        str = var_ba9a868834899928 + "<unknown string>" + loc.engagedradius + "<unknown string>" + loc.playersinengagedradius.size;
                        var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = str;
                        str = var_ba9a868834899928 + "<unknown string>" + loc.notifyradius + "<unknown string>" + loc.playersinnotifyradius.size;
                        var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = str;
                        if (loc.usesai) {
                            str = var_ba9a868834899928 + "<unknown string>" + loc.agents.size + "<unknown string>" + loc.agentskilled;
                            var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = str;
                        }
                        foreach (debugstring in loc.var_2253a634b70fcd12) {
                            str = var_ba9a868834899928 + debugstring;
                            var_7bc749fccfc8e770[var_7bc749fccfc8e770.size] = str;
                        }
                    }
                    var_d9ef0d47f4ec8cb6 = (1, 0, 0);
                    if (loc.state == 1) {
                        var_d9ef0d47f4ec8cb6 = (0, 1, 0);
                    }
                    var_8b75d145fd3fd32b = "<unknown string>" + loc.var_2613246720524878;
                    if (!i) {
                        var_8b75d145fd3fd32b = var_8b75d145fd3fd32b + "<unknown string>";
                    }
                    print3d(loc.origin, var_8b75d145fd3fd32b, var_d9ef0d47f4ec8cb6);
                }
                count = 0;
                var_b9f7ac7066356a39 = 0;
                for (i = 0; i < var_7bc749fccfc8e770.size; i++) {
                    str = var_7bc749fccfc8e770[i];
                    if (!isdefined(hudelems[i])) {
                        hudelems[i] = function_ecd35236fb86f2d3();
                    }
                    if (!isdefined(hudelems[i])) {
                        break;
                    }
                    var_b9f7ac7066356a39 = var_b9f7ac7066356a39 || str != hudelems[i].var_e7ac8994c2b612d;
                    hudelems[i].x = x_pos;
                    hudelems[i].y = y_pos + 10 * (i + 1);
                    count++;
                }
                if (var_b9f7ac7066356a39) {
                    var_41f97a94c30a7593 clearalltextafterhudelem();
                    for (i = 0; i < count; i++) {
                        hudelems[i] setdevtext(var_7bc749fccfc8e770[i]);
                        hudelems[i].var_e7ac8994c2b612d = var_7bc749fccfc8e770[i];
                    }
                }
                if (count < hudelems.size) {
                    for (i = hudelems.size - 1; i >= count; i--) {
                        hudelems[i] destroy();
                        hudelems[i] = undefined;
                    }
                }
                waitframe();
            }
            foreach (hud in hudelems) {
                hud destroy();
            }
            var_41f97a94c30a7593 destroy();
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61b9
// Size: 0x53
function function_6a540d657d267069(location) {
    /#
        reason = function_67ab032b2db3d203(location.encounter);
        if (isdefined(reason)) {
            return reason;
        }
        if (isdefined(location.var_ba39558253c90b45)) {
            return location.var_ba39558253c90b45;
        }
        return "<unknown string>";
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6213
// Size: 0x4d
function function_67ab032b2db3d203(encounter) {
    /#
        if (isdefined(encounter.parentencounter)) {
            reason = function_67ab032b2db3d203(encounter.parentencounter);
            if (isdefined(reason)) {
                return reason;
            }
        }
        return encounter.var_ba39558253c90b45;
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6267
// Size: 0x138
function function_ecd35236fb86f2d3() {
    /#
        fontelem = newhudelem();
        if (isdefined(fontelem)) {
            fontelem.elemtype = "<unknown string>";
            fontelem.font = "<unknown string>";
            fontelem.fontscale = 1.2;
            fontelem.basefontscale = fontelem.fontscale;
            fontelem.x = 0;
            fontelem.y = 0;
            fontelem.width = 0;
            fontelem.height = int(level.fontheight * fontelem.fontscale);
            fontelem.xoffset = 0;
            fontelem.yoffset = 0;
            fontelem.children = [];
            fontelem namespace_52f6938dd902c7d0::setparent(level.uiparent);
            fontelem.hidden = 0;
            fontelem.aligny = "<unknown string>";
            fontelem.alignx = "<unknown string>";
            fontelem.var_e7ac8994c2b612d = "<unknown string>";
            fontelem setdevtext("<unknown string>");
        }
        return fontelem;
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63a6
// Size: 0x72
function function_5443af46fa933222(state) {
    /#
        switch (state) {
        case 0:
            return "<unknown string>";
        case 1:
            return "<unknown string>";
        case 2:
            return "<unknown string>";
        case 3:
            return "<unknown string>";
        default:
            return "<unknown string>";
            break;
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x641f
// Size: 0x19c
function function_578d4816dbfe5bad() {
    /#
        root = "<unknown string>";
        debughud = root + "<unknown string>";
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_6f44f0cbecc66ade") + "<unknown string>");
        thread function_2bb11cfc1551b19a(debughud + "<unknown string>" + function_f28fd66285fa2c9(@"hash_6f44f0cbecc66ade") + "<unknown string>");
        var_cb4fa93ed9a3db2a = root + "<unknown string>";
        thread function_2bb11cfc1551b19a(var_cb4fa93ed9a3db2a + "<unknown string>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<unknown string>");
        thread function_2bb11cfc1551b19a(var_cb4fa93ed9a3db2a + "<unknown string>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<unknown string>");
        thread function_2bb11cfc1551b19a(var_cb4fa93ed9a3db2a + "<unknown string>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<unknown string>");
        encounters = root + "<unknown string>";
        var_e4cf71c9d1c7cd5c = encounters + "<unknown string>";
        function_1c1013be314ae66a(var_e4cf71c9d1c7cd5c, -1);
        foreach (i, loc in self.alllocations) {
            var_e4cf71c9d1c7cd5c = encounters + loc.name + "<unknown string>" + i + "<unknown string>" + i + "<unknown string>";
            function_1c1013be314ae66a(var_e4cf71c9d1c7cd5c, i);
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65c2
// Size: 0x9b
function function_1c1013be314ae66a(var_e4cf71c9d1c7cd5c, index) {
    /#
        thread function_2bb11cfc1551b19a(var_e4cf71c9d1c7cd5c + "<unknown string>" + function_f28fd66285fa2c9(@"hash_9c7e1cd61023c008") + "<unknown string>" + index + "<unknown string>");
        thread function_2bb11cfc1551b19a(var_e4cf71c9d1c7cd5c + "<unknown string>" + function_f28fd66285fa2c9(@"hash_e4a17f4ad4db68f9") + "<unknown string>" + index + "<unknown string>");
        thread function_2bb11cfc1551b19a(var_e4cf71c9d1c7cd5c + "<unknown string>" + function_f28fd66285fa2c9(@"hash_ce1c94bf929657cc") + "<unknown string>" + index + "<unknown string>");
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6664
// Size: 0x8a
function function_2bb11cfc1551b19a(cmd) {
    /#
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (1) {
            if (!isdefined(level.var_ea8a728d3504fb9b) || level.var_ea8a728d3504fb9b < gettime()) {
                level.var_ea8a728d3504fb9b = gettime();
                level.var_28f915fb1d12fdb1 = 0;
            }
            if (level.var_28f915fb1d12fdb1 < 3) {
                break;
            }
            wait(0.05);
        }
        level.var_28f915fb1d12fdb1++;
        adddebugcommand(cmd);
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66f5
// Size: 0xa1
function function_a7b476bcb852aa88() {
    /#
        self endon("<unknown string>");
        waittillframeend();
        if (!self.usesai) {
            return;
        }
        while (1) {
            debug = getdvarint(@"hash_f14edbb0f6781ef7", 0);
            if (debug) {
                foreach (agent in self.agents) {
                    function_8ddc84f18c877946(agent, debug);
                }
                waitframe();
            } else {
                wait(0.2);
            }
        }
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x679d
// Size: 0x2ed
function function_8ddc84f18c877946(agent, debug) {
    /#
        enemy = agent.enemy;
        printorigin = agent.origin + (0, 0, 70);
        var_97cdb425ce49614a = (0, 0, -10);
        var_76704cee002e54f6 = 1;
        if (isdefined(level.player)) {
            playerdist = distance(level.player.origin, agent.origin);
            var_76704cee002e54f6 = math::remap(playerdist, 0, 2000, 0.5, 2);
            playerdir = anglestoforward(level.player.angles);
            var_b3bca3e7f11a1cce = vectornormalize(agent.origin - level.player.origin);
            var_b3d6a9e7f136530a = vectordot(playerdir, var_b3bca3e7f11a1cce);
            var_d31733668b7a6fed = 0.99;
            if (var_b3d6a9e7f136530a > var_d31733668b7a6fed) {
                var_49ca9d6264337976 = math::remap(var_b3d6a9e7f136530a, var_d31733668b7a6fed, 1, 1, 2);
                var_76704cee002e54f6 = var_76704cee002e54f6 * var_49ca9d6264337976;
            }
            var_97cdb425ce49614a = var_97cdb425ce49614a * var_76704cee002e54f6;
        }
        if (!isdefined(enemy)) {
            print3d(printorigin, "<unknown string>", (1, 0, 0), 1, var_76704cee002e54f6);
            printorigin = printorigin + var_97cdb425ce49614a;
        } else {
            var_538898ac87b1f4aa = agent lastknowntime(enemy);
            var_f4bc443f1eb18abc = gettime() - var_538898ac87b1f4aa;
            if (var_f4bc443f1eb18abc <= 50) {
                var_b7f1f39410e505b3 = (0, 1, 0);
            } else {
                var_b7f1f39410e505b3 = (1, 1, 0);
            }
            var_7412692cf84589ac = enemy.name;
            if (!isdefined(var_7412692cf84589ac)) {
                var_7412692cf84589ac = "<unknown string>" + enemy getentitynumber();
            }
            var_8e26a0bb63e5483b = int(var_f4bc443f1eb18abc / 100) / 10;
            print3d(printorigin, var_7412692cf84589ac + "<unknown string>" + var_8e26a0bb63e5483b + "<unknown string>", var_b7f1f39410e505b3, 1, var_76704cee002e54f6);
            printorigin = printorigin + var_97cdb425ce49614a;
            lastorigin = agent lastknownpos(enemy);
            sphere(lastorigin, 16, var_b7f1f39410e505b3);
            if (debug > 1) {
                line(agent.origin, lastorigin, var_b7f1f39410e505b3);
            }
        }
        print3d(printorigin, "<unknown string>" + agent.health + "<unknown string>" + agent.maxhealth, (1, 1, 1), 1, var_76704cee002e54f6);
        printorigin = printorigin + var_97cdb425ce49614a;
    #/
}

// Namespace namespace_dbfadc7694f6be4b/namespace_33ca1c63d4300adc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a91
// Size: 0xef
function function_ca0d43a35b898ad4() {
    /#
        time = gettime();
        foreach (agent in level.agentarray) {
            entnum = agent getentitynumber();
            agent_available_to_spawn_time = isdefined(level.agent_available_to_spawn_time) && isdefined(level.agent_available_to_spawn_time[entnum]) && time < level.agent_available_to_spawn_time[entnum];
            println(vartostring(agent) + "<unknown string>" + vartostring(agent.isactive) + "<unknown string>" + vartostring(agent.var_b9057e55d306b9a2) + "<unknown string>" + agent_available_to_spawn_time);
        }
    #/
}

