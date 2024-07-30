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

#namespace br_ai_encounters;

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd8
// Size: 0x93
function init() {
    setdvarifuninitialized(@"hash_66a4f62fefc77efd", 0);
    if (!getdvarint(@"hash_66a4f62fefc77efd", 0)) {
        return;
    }
    setdvarifuninitialized(@"hash_ab50f58bb9979459", 30);
    var_29f57a3bc4e1ec72 = spawnstruct();
    /#
        var_29f57a3bc4e1ec72.debugtype = "<dev string:x1c>";
    #/
    var_29f57a3bc4e1ec72 init_encounters();
    var_29f57a3bc4e1ec72 init_locations();
    var_29f57a3bc4e1ec72 thread encounter_manager();
    level.disableinitplayergameobjects = 0;
    /#
        level.var_1f7714c919e8f106 = var_29f57a3bc4e1ec72;
        var_29f57a3bc4e1ec72 thread init_debug();
    #/
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd73
// Size: 0x21
function add_encounter_start_condition(func, params) {
    add_condition("encounter", func, params);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9c
// Size: 0x21
function add_location_start_condition(func, params) {
    add_condition("location", func, params);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc5
// Size: 0x87
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x33
function add_encounter_start_function(func) {
    /#
        function_1535016662214ec5();
    #/
    assert(!isdefined(self.func_encounterstart));
    self.func_encounterstart = func;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8f
// Size: 0x324
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb
// Size: 0xee
function init_encounter(name, parent) {
    encounter = spawnstruct();
    encounter.name = name;
    encounter.info = self;
    encounter.parentencounter = parent;
    encounter.encounters = [];
    encounter.startconditions = [];
    encounter.locations = [];
    /#
        encounter.debugtype = "<dev string:x21>";
    #/
    assertex(!isdefined(self.allencounters[name]), "Encounter type " + name + " already exists");
    self.allencounters[name] = encounter;
    if (isdefined(parent)) {
        parent.encounters[parent.encounters.size] = encounter;
    } else {
        self.encounters[self.encounters.size] = encounter;
    }
    return encounter;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b2
// Size: 0x88
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1342
// Size: 0x116
function init_location(location) {
    /#
        function_674facc5e1cb84c();
    #/
    location.name = location.script_noteworthy;
    /#
        location.debugtype = "<dev string:x2b>";
    #/
    assertex(isdefined(location.name), "AI Location must have a script_noteworthy defined");
    assertex(isdefined(self.allencounters[location.name]), "Unknown encounter type for location '" + location.name + "'");
    encounter = self.allencounters[location.name];
    encounter.locations[encounter.locations.size] = location;
    location.encounter = encounter;
    location.state = 0;
    locationcount = self.alllocations.size;
    /#
        location.debugindex = locationcount;
    #/
    self.alllocations[locationcount] = location;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1460
// Size: 0x63
function encounter_manager() {
    /#
        function_674facc5e1cb84c();
    #/
    while (true) {
        self.validlocations = [];
        update_conditions(self.encounters);
        if (self.validlocations.size) {
            location = random(self.validlocations);
            encounter_start(location);
        }
        wait 0.05;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14cb
// Size: 0xe2
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b5
// Size: 0x19
function check_encounter_start_conditions() {
    /#
        function_1535016662214ec5();
    #/
    return check_start_conditions(self, "encounter", 0);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d7
// Size: 0x22
function check_location_start_conditions() {
    /#
        function_2f6185a84b023517();
    #/
    return check_start_conditions(self.encounter, "location", 1);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1602
// Size: 0xf7
function check_start_conditions(encounter, conditiontype, var_dd61ff0f315b80ed) {
    if (var_dd61ff0f315b80ed && isdefined(encounter.parentencounter)) {
        if (!check_start_conditions(encounter.parentencounter, conditiontype, var_dd61ff0f315b80ed)) {
            return false;
        }
    }
    if (!isdefined(encounter.startconditions[conditiontype])) {
        return true;
    }
    for (i = 0; i < encounter.startconditions[conditiontype].size; i++) {
        condition = encounter.startconditions[conditiontype][i];
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
            return false;
        }
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1702
// Size: 0x58
function encounter_start(location) {
    location.state = 1;
    self.activelocations[self.activelocations.size] = location;
    location.starttime = gettime();
    /#
        location.activedebuginfo = [];
    #/
    encounter_location_start_functions(location);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1762
// Size: 0x1e
function encounter_location_start_functions(location) {
    location encounter_start_functions(location.encounter);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1788
// Size: 0x54
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e4
// Size: 0x123
function encounter_end(success, successteam) {
    if (success) {
        self.state = 2;
    } else {
        self.state = 3;
    }
    self.endtime = gettime();
    self.duration = self.endtime - self.starttime;
    /#
        self.activedebuginfo = undefined;
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
    self notify("encounter_end", success, successteam);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190f
// Size: 0x25
function condition_disabled(encounter) {
    /#
        function_1535016662214ec5();
    #/
    /#
        function_5bb507603ca9de76("<dev string:x34>");
    #/
    return false;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193d
// Size: 0x54
function condition_stateis(state) {
    /#
        function_2f6185a84b023517();
    #/
    if (self.state != state) {
        /#
            function_5bb507603ca9de76("<dev string:x3d>" + function_5443af46fa933222(self.state) + "<dev string:x44>" + function_5443af46fa933222(state));
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199a
// Size: 0xc3
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
        dist2dsqr = distance2dsquared(player.origin, self.origin);
        if (dist2dsqr < radiussqr) {
            return true;
        }
        break;
    }
    /#
        function_5bb507603ca9de76("<dev string:x4f>" + radius + "<dev string:x65>");
    #/
    return false;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a66
// Size: 0xd5
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
        dist2dsqr = distance2dsquared(player.origin, self.origin);
        if (dist2dsqr < radiussqr) {
            /#
                function_5bb507603ca9de76("<dev string:x67>" + player.name + "<dev string:x6f>" + radius + "<dev string:x65>");
            #/
            return false;
        }
        break;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b44
// Size: 0xaa
function condition_insafecircle() {
    /#
        function_2f6185a84b023517();
    #/
    if (istrue(level.br_circle_disabled)) {
        return true;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.safecircleent)) {
        /#
            function_5bb507603ca9de76("<dev string:x7c>");
        #/
        return false;
    }
    circleorigin = scripts\mp\gametypes\br_circle::getsafecircleorigin();
    circleradius = scripts\mp\gametypes\br_circle::getsafecircleradius();
    locationdistsqr = distance2dsquared(self.origin, circleorigin);
    if (locationdistsqr > circleradius * circleradius) {
        /#
            function_5bb507603ca9de76("<dev string:x90>");
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf7
// Size: 0x94
function condition_circlecount(mincircles) {
    /#
        function_1535016662214ec5();
    #/
    if (istrue(level.br_circle_disabled)) {
        return true;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.safecircleent)) {
        /#
            function_5bb507603ca9de76("<dev string:x7c>");
        #/
        return false;
    }
    circlenum = getomnvar("ui_br_circle_num");
    if (circlenum < mincircles) {
        /#
            function_5bb507603ca9de76("<dev string:xb0>" + circlenum + "<dev string:xc0>" + mincircles);
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c94
// Size: 0xc0
function condition_circlesremaining(mincircles) {
    /#
        function_1535016662214ec5();
    #/
    if (istrue(level.br_circle_disabled)) {
        return true;
    }
    if (!isdefined(level.br_circle) || !isdefined(level.br_circle.circleindex)) {
        /#
            function_5bb507603ca9de76("<dev string:xc5>" + mincircles);
        #/
        return false;
    }
    totalcircles = level.br_level.br_circledelaytimes.size;
    circlesremaining = totalcircles - level.br_circle.circleindex;
    if (circlesremaining < mincircles) {
        /#
            function_5bb507603ca9de76("<dev string:xe6>" + circlesremaining + "<dev string:xc0>" + mincircles);
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5d
// Size: 0xc0
function condition_maxaliveplayers(var_a488b9199457e184) {
    /#
        function_1535016662214ec5();
    #/
    if (!isdefined(level.teamdata)) {
        /#
            function_5bb507603ca9de76("<dev string:xfa>");
        #/
        return false;
    }
    count = 0;
    foreach (teaminfo in level.teamdata) {
        count += teaminfo["aliveCount"];
    }
    if (count > var_a488b9199457e184) {
        /#
            function_5bb507603ca9de76("<dev string:x119>" + count + "<dev string:x130>" + var_a488b9199457e184 + "<dev string:x65>");
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e26
// Size: 0x49
function condition_maxactivelocations(maxactive) {
    /#
        function_1535016662214ec5();
    #/
    if (self.info.activelocations.size >= maxactive) {
        /#
            function_5bb507603ca9de76("<dev string:x139>" + maxactive + "<dev string:x13e>");
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e78
// Size: 0x4e
function condition_mintimepassed(timesec) {
    /#
        function_1535016662214ec5();
    #/
    passedtime = scripts\mp\utility\game::getsecondspassed();
    if (passedtime < timesec) {
        /#
            function_5bb507603ca9de76("<dev string:x152>" + floor(passedtime) + "<dev string:x170>" + timesec);
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ecf
// Size: 0x8a
function condition_lastencounterstarttime(timesec) {
    /#
        function_1535016662214ec5();
    #/
    info = self.info;
    if (isdefined(info.lastencounter)) {
        timesincelastencounter = (gettime() - info.lastencounter.endtime) / 1000;
        if (timesincelastencounter < timesec) {
            /#
                function_5bb507603ca9de76("<dev string:x172>" + floor(timesincelastencounter) + "<dev string:x170>" + timesec);
            #/
            return false;
        }
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f62
// Size: 0x4f
function condition_prematchdone() {
    /#
        function_1535016662214ec5();
    #/
    if (!isdefined(game["flags"]["prematch_done"])) {
        /#
            function_5bb507603ca9de76("<dev string:x191>");
        #/
        return false;
    }
    if (scripts\mp\flags::gameflag("prematch_done")) {
        return true;
    }
    /#
        function_5bb507603ca9de76("<dev string:x1a6>");
    #/
    return false;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fba
// Size: 0x35
function condition_debugpaused() {
    /#
        function_1535016662214ec5();
    #/
    if (getdvarint(@"hash_a163377bb1005bf5", 0)) {
        /#
            function_5bb507603ca9de76(@"hash_a163377bb1005bf5");
        #/
        return false;
    }
    return true;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff8
// Size: 0x39
function successcondition_enemykills(numkills) {
    self endon("encounter_end");
    while (true) {
        self waittill("agent_killed");
        if (self.agentskilled >= numkills) {
            encounter_end(1);
        }
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2039
// Size: 0x81
function failcondition_noplayersinengagedradius(timesec) {
    self endon("encounter_end");
    /#
        function_2f6185a84b023517();
    #/
    timesec = int(timesec);
    timesecmax = timesec;
    while (true) {
        wait 1;
        if (self.playersinengagedradius.size > 0) {
            timesec = timesecmax;
        } else {
            timesec--;
            if (timesec <= 0) {
                encounter_end(0);
            }
        }
        /#
            self.activedebuginfo["<dev string:x1b8>"] = "<dev string:x1df>" + timesec + "<dev string:x1ef>";
        #/
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c2
// Size: 0xe1
function failcondition_outsidedangercircle() {
    self endon("encounter_end");
    /#
        function_2f6185a84b023517();
    #/
    while (true) {
        wait 1;
        if (!isdefined(level.br_circle) || !isdefined(level.br_circle.dangercircleent)) {
            continue;
        }
        circleorigin = scripts\mp\gametypes\br_circle::getdangercircleorigin();
        circleradius = scripts\mp\gametypes\br_circle::getdangercircleradius();
        locationdistsqr = distance2dsquared(self.origin, circleorigin);
        if (locationdistsqr > circleradius * circleradius) {
            if (self.playersinengagedradius.size > 0) {
                /#
                    self.activedebuginfo["<dev string:x1f1>"] = "<dev string:x213>";
                #/
            } else {
                encounter_end(0);
            }
            continue;
        }
        /#
            self.activedebuginfo["<dev string:x1f1>"] = "<dev string:x243>" + circleradius - sqrt(locationdistsqr);
        #/
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ab
// Size: 0xaa
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x225e
// Size: 0x117
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237d
// Size: 0x49
function targetstart_spawner_node(spawner, node) {
    if (!isdefined(spawner.goalnodes)) {
        spawner.goalnodes = [];
    }
    spawner.goalnodes[spawner.goalnodes.size] = node;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ce
// Size: 0x5e
function targetstart_spawner_volume(spawner, volume, auto) {
    if (!isdefined(spawner.goalvolumes)) {
        spawner.goalvolumes = [];
    }
    volume.auto = auto;
    spawner.goalvolumes[spawner.goalvolumes.size] = volume;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2434
// Size: 0x81
function targetstart_icon(iconstruct) {
    id = scripts\mp\objidpoolmanager::requestobjectiveid(0);
    scripts\mp\objidpoolmanager::objective_add_objective(id, "current", iconstruct.origin, "icon_waypoint_objective_general", "icon_regular");
    objective_setshowoncompass(id, 1);
    objective_setplayintro(id, 1);
    objective_setlabel(id, self.iconlabel);
    thread icon_update_visibility(id);
    self waittill("encounter_end");
    scripts\mp\objidpoolmanager::returnobjectiveid(id);
    objective_delete(id);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24bd
// Size: 0x1a2
function targetstart_reward(rewardstruct) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    success, successteam = self waittill("encounter_end");
    if (!success) {
        return;
    }
    rewardobject = rewardspawn(rewardstruct);
    if (!isdefined(rewardobject)) {
        return;
    }
    if (isdefined(successteam)) {
        successplayers = [];
        otherplayers = [];
        foreach (guid, lasttime in self.playersinnotifyradius) {
            player = self.guidtoplayer[guid];
            if (!isdefined(player)) {
                continue;
            }
            if (player.team == successteam) {
                successplayers[successplayers.size] = player;
                continue;
            }
            otherplayers[otherplayers.size] = player;
        }
        thread rewardicon(rewardobject, "icon_waypoint_unlocked", successplayers);
        thread rewardicon(rewardobject, "icon_waypoint_locked", otherplayers);
        rewardobjectlock(rewardobject, successplayers, otherplayers);
        return;
    }
    showtoplayers = [];
    foreach (guid, lasttime in self.playersinnotifyradius) {
        player = self.guidtoplayer[guid];
        if (!isdefined(player)) {
            continue;
        }
        showtoplayers[showtoplayers.size] = player;
    }
    thread rewardicon(rewardobject, "icon_waypoint_unlocked", showtoplayers);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2667
// Size: 0xa4
function targetstart_reward_prespawn(rewardstruct) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    rewardobject = rewardspawn(rewardstruct);
    disablescriptableplayeruseall(rewardobject);
    navobstacleid = createnavobstaclebybounds(rewardobject.origin, (30, 15, 10), rewardobject.angles);
    success = self waittill("encounter_end");
    destroynavobstacle(navobstacleid);
    if (isdefined(rewardobject)) {
        if (success) {
            enablescriptableplayeruseall(rewardobject);
            rewardicon(rewardobject, "icon_waypoint_unlocked");
            return;
        }
        rewardobject freescriptable();
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2713
// Size: 0xd5
function rewardspawn(rewardstruct, modifier) {
    rewardtype = rewardstruct.script_parameters;
    if (!isdefined(rewardtype)) {
        rewardtype = "brloot_killstreak_clusterstrike";
    }
    rewardobject = undefined;
    switch (rewardtype) {
    case #"hash_6a0ecbbfe8b1c8a5": 
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(rewardstruct.origin + (0, 0, 0.1), rewardstruct.angles);
        rewardobject = scripts\mp\gametypes\br_pickups::spawnpickup(rewardtype, dropinfo, 0, 1);
        break;
    default: 
        assertmsg("Unknown reward type '" + rewardtype + "'");
        break;
    }
    if (isdefined(rewardobject)) {
        thread rewardobjectusewatch(rewardobject);
        thread rewardobjectcleanup(rewardobject);
    }
    return rewardobject;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f1
// Size: 0xf4
function rewardobjectlock(rewardobject, unlockedplayers, lockedplayers) {
    rewardobjectsetusable(rewardobject, unlockedplayers);
    lock = spawn("script_model", rewardobject.origin + (0, 0, 30));
    lock setmodel("tag_origin");
    lock makeusable();
    lock sethintstring("MP/DOOR_USE_LOCK");
    lock setuseholdduration("duration_long");
    lock setusefov(15);
    lock setcursorhint("HINT_BUTTON");
    foreach (player in unlockedplayers) {
        lock disableplayeruse(player);
    }
    thread rewardobjectcleanup(lock);
    thread rewardobjectlockthink(lock, rewardobject);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ed
// Size: 0x52
function rewardobjectlockthink(lock, rewardobject) {
    self endon("reward_cleanup");
    player = lock waittill("trigger");
    part = rewardobject.scriptablename;
    scripts\mp\gametypes\br_pickups::lootused(rewardobject, part, "visible", player);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2947
// Size: 0x23
function rewardobjectusewatch(rewardobject) {
    self endon("reward_cleanup");
    while (isdefined(rewardobject)) {
        waitframe();
    }
    self notify("reward_cleanup");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2972
// Size: 0x32
function rewardobjectcleanup(rewardobject) {
    self waittill("reward_cleanup");
    if (isdefined(rewardobject)) {
        if (rewardobject isscriptable()) {
            rewardobject freescriptable();
            return;
        }
        rewardobject delete();
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ac
// Size: 0x68
function rewardobjectsetusable(rewardobject, var_9509c12edf4f2c41) {
    disablescriptableplayeruseall(rewardobject);
    foreach (player in var_9509c12edf4f2c41) {
        rewardobject enablescriptableplayeruse(player);
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1c
// Size: 0x91
function rewardicon(rewardobject, iconshader, showtoplayers) {
    id = createrewardicon(rewardobject, iconshader);
    if (id < 0) {
        return;
    }
    if (isdefined(showtoplayers)) {
        foreach (player in showtoplayers) {
            objective_addclienttomask(id, player);
        }
    }
    thread rewardiconcleanup(id);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab5
// Size: 0x8c
function createrewardicon(rewardobject, iconshader) {
    id = scripts\mp\objidpoolmanager::requestobjectiveid();
    if (id >= 0) {
        scripts\mp\objidpoolmanager::objective_add_objective(id, "current", rewardobject.origin + (0, 0, 50), iconshader, "icon_regular");
        objective_setshowoncompass(id, 1);
        objective_setplayintro(id, !istrue(self.norewardiconintro));
        objective_setlabel(id, "BR_AI_ENCOUNTERS/OBJ_LABEL_REWARD");
        objective_showtoplayersinmask(id);
        objective_removeallfrommask(id);
    }
    return id;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4a
// Size: 0x1b
function rewardiconcleanup(id) {
    self waittill("reward_cleanup");
    scripts\mp\objidpoolmanager::returnobjectiveid(id);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b6d
// Size: 0xa0
function icon_update_visibility(objid) {
    self endon("encounter_end");
    objective_showtoplayersinmask(objid);
    while (true) {
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c15
// Size: 0x1ad
function spawn_agent(infostruct) {
    assertex(self.usesai, "Attempt to spawn AI from encounter not set to use AI");
    agent = scripts\mp\mp_agent::spawnnewagent(infostruct.aitype, infostruct.team, infostruct.origin, infostruct.angles);
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
        agent.script_noteworthy = infostruct.script_noteworthy;
        agent.scripted_long_deaths = 0;
        agent.agentdamagefeedback = 1;
        self.agents[self.agents.size] = agent;
        thread watch_agent_death(agent);
    } else {
        /#
            function_ca0d43a35b898ad4();
        #/
        assertmsg("Failed to spawnNewAgent. Type=" + vartostring(infostruct.aitype) + " team= " + vartostring(infostruct.team) + " origin= " + vartostring(infostruct.origin));
    }
    return agent;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dcb
// Size: 0x3e
function watch_agent_death(agent) {
    agent waittill("death");
    self.agents = array_remove(self.agents, agent);
    self.agentskilled++;
    self notify("agent_killed");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e11
// Size: 0x94
function targetstart_spawntrigger(trigger) {
    while (true) {
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ead
// Size: 0x2f
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee4
// Size: 0x16
function root_getspawneraitype(spawner) {
    return spawner.name;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f03
// Size: 0x115
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3020
// Size: 0x306
function root_monitorplayers() {
    self endon("encounter_end");
    self.notifyradius = 7500;
    self.engagedradius = 2000;
    self.playersinnotifyradius = [];
    self.playersinengagedradius = [];
    self.guidtoplayer = [];
    waittillframeend();
    assert(self.notifyradius > self.engagedradius);
    notifyradiussqr = self.notifyradius * self.notifyradius;
    engagedradiussqr = self.engagedradius * self.engagedradius;
    var_a2562e11884920f6 = 20;
    while (true) {
        currenttime = gettime();
        updatecount = 0;
        notifylistchanged = 0;
        engagedlistchanged = 0;
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (!isdefined(player)) {
                continue;
            }
            self.guidtoplayer[player.guid] = player;
            if (!isalive(player)) {
                if (isdefined(self.playersinnotifyradius[player.guid])) {
                    notifylistchanged = 1;
                    self.playersinnotifyradius[player.guid] = undefined;
                }
                if (isdefined(self.playersinengagedradius[player.guid])) {
                    engagedlistchanged = 1;
                    self.playersinengagedradius[player.guid] = undefined;
                }
                continue;
            }
            dist2dsqr = distance2dsquared(player.origin, self.origin);
            if (dist2dsqr <= notifyradiussqr) {
                if (!isdefined(self.playersinnotifyradius[player.guid])) {
                    notifylistchanged = 1;
                }
                self.playersinnotifyradius[player.guid] = currenttime;
            } else {
                lasttime = self.playersinnotifyradius[player.guid];
                if (isdefined(lasttime) && currenttime - lasttime > 2000) {
                    notifylistchanged = 1;
                    self.playersinnotifyradius[player.guid] = undefined;
                }
            }
            if (dist2dsqr <= engagedradiussqr) {
                if (!isdefined(self.playersinengagedradius[player.guid])) {
                    engagedlistchanged = 1;
                }
                self.playersinengagedradius[player.guid] = currenttime;
            } else {
                lasttime = self.playersinengagedradius[player.guid];
                if (isdefined(lasttime) && currenttime - lasttime > 2000) {
                    engagedlistchanged = 1;
                    self.playersinengagedradius[player.guid] = undefined;
                }
            }
            updatecount++;
            if (updatecount >= var_a2562e11884920f6) {
                wait 0.05;
                updatecount = 0;
            }
        }
        if (notifylistchanged) {
            self notify("notify_list_changed");
        }
        if (engagedlistchanged) {
            self notify("engaged_list_changed");
        }
        wait 0.05;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x332e
// Size: 0x27
function root_failconditions() {
    self.failconditionengagedradiustime = 90;
    waittillframeend();
    thread failcondition_noplayersinengagedradius(self.failconditionengagedradiustime);
    thread failcondition_outsidedangercircle();
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x335d
// Size: 0x2f
function rootai_ecounterstart() {
    self.usesai = 1;
    self.func_getspawneraitype = &root_getspawneraitype;
    self.agentskilled = 0;
    self.agents = [];
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3394
// Size: 0x350
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
    vol_01 = getent("bank_vol_01", "targetname");
    var_1f9b128600c9d94f = getent("bank_vol_01_upper", "targetname");
    level.wave1_enemies = [];
    var_f9b64c981aa4ead5 = getstructarray("enemy_wave_01", "targetname");
    foreach (struct in var_f9b64c981aa4ead5) {
        newguy = targetstart_spawner(struct);
        if (newguy.script_noteworthy == "wave01_upper") {
            newguy setgoalvolumeauto(var_1f9b128600c9d94f);
            newguy.goalheight = 256;
        } else if (newguy.script_noteworthy == "wave01_lower") {
            newguy setgoalvolumeauto(vol_01);
        }
        level.wave1_enemies = array_add(level.wave1_enemies, newguy);
    }
    overrun = getent("wave_01_overrun_trig", "targetname");
    waittill_trigger_or_dead(overrun, level.wave1_enemies, level.wave1_enemies.size - 3);
    level notify("spawn_wave2");
    vol_02 = getent("bank_vol_02", "targetname");
    wave2_enemies = [];
    wave2_guys = getstructarray("enemy_wave_02", "targetname");
    foreach (guy in wave2_guys) {
        newguy = targetstart_spawner(guy);
        newguy setgoalvolumeauto(vol_02);
        wave2_enemies = array_add(wave2_enemies, newguy);
    }
    foreach (enemy in level.wave1_enemies) {
        if (isdefined(enemy) && isalive(enemy)) {
            enemy setgoalvolumeauto(vol_02);
            wave2_enemies = array_add(wave2_enemies, enemy);
        }
    }
    waittill_dead(wave2_enemies, wave2_enemies.size);
    wait 0.5;
    self notify("open_vault");
    vol_03 = getent("bank_vol_03", "targetname");
    var_ae7126de41cfdc3e = [];
    jug = getstruct("enemy_wave_03_boss", "targetname");
    var_415021716f694843 = targetstart_spawner(jug);
    var_415021716f694843 thread jug_behavior();
    var_ae7126de41cfdc3e = array_add(var_ae7126de41cfdc3e, var_415021716f694843);
    waittill_dead(var_ae7126de41cfdc3e, var_ae7126de41cfdc3e.size);
    encounter_end(1);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ec
// Size: 0x11
function vault_door_open_wait() {
    self endon("encounter_end");
    self waittill("open_vault");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3705
// Size: 0x79
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3786
// Size: 0x4a
function vault_door_think() {
    door = getent("vault_door", "targetname");
    vault_door_init(door);
    vault_door_open_wait();
    door thread vault_door_sound();
    door rotateby((0, 180, 0), 5);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37d8
// Size: 0x67
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3847
// Size: 0x6d
function alarm_sound_on() {
    alarm_pos = getentarray("bank_alarm_pos", "targetname");
    foreach (pos in alarm_pos) {
        pos playloopsound("emt_alarm_bank_bell_lp");
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bc
// Size: 0x6d
function alarm_sound_off() {
    alarm_pos = getentarray("bank_alarm_pos", "targetname");
    foreach (pos in alarm_pos) {
        pos stoploopsound("emt_alarm_bank_bell_lp");
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3931
// Size: 0x98
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d1
// Size: 0x58
function waittill_trigger_or_dead(trigger, guys, num, timeoutlength) {
    struct = spawnstruct();
    struct endon("done");
    struct childthread _waittill_trigger(trigger);
    struct childthread _waittill_dead_notify_done(guys, num, timeoutlength);
    struct waittill("done");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a31
// Size: 0x2d
function _waittill_dead_notify_done(guys, num, timeoutlength) {
    waittill_dead(guys, num, timeoutlength);
    self notify("done");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a66
// Size: 0x3d
function _waittill_trigger(trigger) {
    while (true) {
        player = trigger waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        break;
    }
    self notify("done");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aab
// Size: 0x11
function alarm_sound_off_encounter_end() {
    self waittill("encounter_end");
    alarm_sound_off();
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac4
// Size: 0x53
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b20
// Size: 0x25b
function airport_ecounterstart() {
    cargo_spawn = getent("ai_encounter_crate", "targetname");
    cargo_spawn movez(256, 0.05);
    wait 0.5;
    createnavobstaclebyent(cargo_spawn);
    trigger = getent("kickoff_airport_encounter", "targetname");
    player = trigger waittill("trigger");
    grenadeweapon = "smoke_grenade_mp";
    grenade_1 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos", "targetname").angles) * 400, 1);
    wait 0.1;
    grenade_2 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos_02", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos_02", "targetname").angles) * 400, 1.3);
    grenade_3 = magicgrenademanual(grenadeweapon, getstruct("airport_smoke_toss_pos_03", "targetname").origin, anglestoforward(getstruct("airport_smoke_toss_pos_03", "targetname").angles) * 450, 2);
    vol_01 = getent("airport_vol_01", "targetname");
    wait 2;
    var_43e751ad559f1c24 = [];
    var_f9b64c981aa4ead5 = getstructarray("airport_enemy_wave_01", "targetname");
    foreach (struct in var_f9b64c981aa4ead5) {
        newguy = targetstart_spawner(struct);
        newguy setgoalvolumeauto(vol_01);
        newguy thread airport_enemy_setup();
        var_43e751ad559f1c24 = array_add(var_43e751ad559f1c24, newguy);
    }
    overrun = getent("wave_01_overrun_trig", "targetname");
    waittill_dead(var_43e751ad559f1c24, var_43e751ad559f1c24.size);
    encounter_end(1);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d83
// Size: 0x2f
function airport_enemy_setup() {
    self.ignore_all = 1;
    wait randomfloatrange(1, 2);
    self.ignore_all = 0;
    self.accuracy = 0.01;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dba
// Size: 0x24c
function truck_encounterstart() {
    self endon("encounter_end");
    self.func_getspawneraitype = &truck_getspawneraitype;
    self.iconlabel = "BR_AI_ENCOUNTERS/OBJ_LABEL_TRUCK";
    thread failcondition_noplayersinengagedradius(90);
    start_trigger = undefined;
    roll_door = undefined;
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
            roll_door = target;
            thread truck_roll_door_init(roll_door);
            break;
        case #"hash_3a455fee27335f03": 
            var_e885ac175bf944e4[var_e885ac175bf944e4.size] = target;
            break;
        default: 
            break;
        }
    }
    /#
        thread function_90d5fe589f383968(roll_door);
    #/
    /#
        self.activedebuginfo["<dev string:x254>"] = "<dev string:x275>";
    #/
    while (true) {
        player = start_trigger waittill("trigger");
        if (isalive(player) && isplayer(player)) {
            break;
        }
    }
    /#
        self.activedebuginfo["<dev string:x254>"] = undefined;
    #/
    destroynavobstacle(roll_door getentitynumber());
    truck_roll_door_open(roll_door);
    var_b71b94cd63885213 = [];
    foreach (guy in var_f2ddd0aa0e17af6c) {
        newguy = targetstart_spawner(guy);
        var_b71b94cd63885213 = array_add(var_b71b94cd63885213, newguy);
    }
    waittill_dead(var_b71b94cd63885213, var_b71b94cd63885213.size);
    encounter_end(1);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400e
// Size: 0xec
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
        return;
    }
    door.origin = door.start_origin;
    door.angles = door.start_angles;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4102
// Size: 0x26
function truck_roll_door_open(roll_door) {
    roll_door rotatepitch(-90, 1);
    truck_roll_door_sound(roll_door);
    self notify("truck_roll_door_open");
}

/#

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4130
    // Size: 0x34
    function function_90d5fe589f383968(roll_door) {
        self endon("<dev string:x28f>");
        success = self waittill("<dev string:x2a4>");
        if (success) {
            truck_roll_door_open(roll_door);
        }
    }

#/

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416c
// Size: 0xa3
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4217
// Size: 0x10
function truck_getspawneraitype(spawner) {
    return "actor_enemy_br_base";
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4230
// Size: 0x22a
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
            assert(!isdefined(var_3a83f6349784bd99));
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
        self.activedebuginfo["<dev string:x2b2>"] = "<dev string:x2d8>";
    #/
    while (true) {
        player = start_trigger waittill("trigger");
        if (isalive(player) && isplayer(player)) {
            break;
        }
    }
    /#
        self.activedebuginfo["<dev string:x2b2>"] = undefined;
    #/
    var_98aa513355e1a321 = [];
    foreach (struct in guard_spawners) {
        newguy = targetstart_spawner(struct);
        var_98aa513355e1a321[var_98aa513355e1a321.size] = newguy;
    }
    boss = targetstart_spawner(var_3a83f6349784bd99);
    var_98aa513355e1a321[var_98aa513355e1a321.size] = boss;
    childthread crateguard_bosssetup(boss, var_98aa513355e1a321);
    waittill_dead(var_98aa513355e1a321, var_98aa513355e1a321.size);
    encounter_end(1);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4462
// Size: 0x5c
function crateguard_bosssetup(boss, guards) {
    boss.ignoreall = 1;
    everyone = guards;
    everyone[everyone.size] = boss;
    waittill_any_ents_array(everyone, "death", "damage", "enemy");
    if (isdefined(boss)) {
        boss.ignoreall = 0;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44c6
// Size: 0x3a
function crateguard_getspawneraitype(spawner) {
    if (isdefined(spawner.script_noteworthy) && spawner.script_noteworthy == "guard_boss") {
        return "actor_enemy_br_boss";
    }
    return "actor_enemy_br_base";
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4509
// Size: 0x4c
function smoking() {
    setup_anim_guy();
    self.deathstate = "animscripted";
    self.deathalias = "smoking_death";
    thread smoking_idle("smoking_idle");
    thread smoking_react("smoking_react");
    thread smoking_death("smoking_death");
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x455d
// Size: 0x4e
function smoking_idle(animalias) {
    self endon("death");
    self endon("damage");
    thread ai_notetrack_loop("smoking");
    while (true) {
        smoking_idle_start("smoking_idle_start");
        scripts\asm\shared\mp\utility::animscripted_single(animalias);
        smoking_idle_end("smoking_idle_end");
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45b3
// Size: 0x21
function smoking_idle_start(animalias) {
    self endon("death");
    self endon("damage");
    scripts\asm\shared\mp\utility::animscripted_single(animalias);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45dc
// Size: 0x21
function smoking_idle_end(animalias) {
    self endon("death");
    self endon("damage");
    scripts\asm\shared\mp\utility::animscripted_single(animalias);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4605
// Size: 0x9a
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
    scripts\asm\shared\mp\utility::animscripted_single(var_e25ca6f64fdb941f);
    reset_guy(self);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46a7
// Size: 0x21
function smoking_death(sanim) {
    self endon("damage");
    self waittill("death");
    ai_smoking_cleanup();
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d0
// Size: 0x120
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47f8
// Size: 0x7d
function ai_smoking_blowsmoke() {
    self endon("smoking_end");
    self endon("death");
    self notify("ai_notetrack_Loop");
    self endon("ai_notetrack_Loop");
    self endon("damage");
    while (true) {
        playfx(level.g_effect["cigarette_smoke"], self geteye() - (0, 0, 2), anglestoforward(self gettagangles("tag_eye")));
        waittime = randomintrange(5, 8);
        wait waittime;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x487d
// Size: 0x5e
function ai_smoking_cleanup() {
    self notify("smoking_end");
    self endon("death");
    if (hastag(self.model, "tag_accessory_right")) {
        killfxontag(level.g_effect["cigarette_lit"], self, "tag_accessory_right");
        killfxontag(level.g_effect["cigarette_unlit"], self, "tag_accessory_right");
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48e3
// Size: 0x6e
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4959
// Size: 0x21
function standing_cellphone_anim(animalias) {
    self endon("death");
    self endon("damage");
    scripts\asm\shared\mp\utility::animscripted_single(animalias);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4982
// Size: 0x2a
function standing_cellphone_loop(animalias, loops) {
    self endon("death");
    self endon("damage");
    scripts\asm\shared\mp\utility::animscripted_loop_n_times(animalias, loops);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49b4
// Size: 0x82
function ai_notehandler_cellphone(note) {
    self endon("death");
    self endon("damage");
    switch (note) {
    case #"hash_2d1403e602f082a4": 
        self.idle_prop = scripts\common\anim::anim_link_tag_model("equipment_personal_smartphone_01", "tag_accessory_right");
        wait 2;
        break;
    case #"hash_682ec8b49fe7aa12": 
        if (isdefined(self.idle_prop)) {
            self.idle_prop delete();
            self.idle_prop = undefined;
        }
        break;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3e
// Size: 0xd
function setup_anim_guy() {
    self.playing_skit = 1;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a53
// Size: 0x95
function reset_guy(guy) {
    guy allowedstances("prone", "stand", "crouch");
    guy scripts\asm\shared\mp\utility::animscripted_clear();
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af0
// Size: 0xf0
function ai_notetrack_loop(skit) {
    self endon("death");
    self notify("ai_notetrack_Loop");
    self endon("ai_notetrack_Loop");
    self endon("damage");
    while (true) {
        notes = self waittill("animscripted");
        if (!isdefined(notes)) {
            notes = ["undefined"];
        }
        if (!isarray(notes)) {
            notes = [notes];
        }
        assert(isdefined(self.fnasm_handlenotetrack));
        defined_val = undefined;
        foreach (note in notes) {
            if (skit == "smoking") {
                ai_notehandler_smoking(note);
                continue;
            }
            if (skit == "standing_cellphone") {
                ai_notehandler_cellphone(note);
            }
        }
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be8
// Size: 0xc
function test_ecounterstart() {
    /#
        function_2f6185a84b023517();
    #/
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bfc
// Size: 0xc
function rootnonai_ecounterstart() {
    self.usesai = 0;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c10
// Size: 0x21b
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
            assert(!isdefined(trigger));
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
    domflag = scripts\mp\gametypes\obj_dom::setupobjective(trigger);
    domflag.noscriptable = undefined;
    domflag.vfxnamemod = "_300";
    domflag.onuse = &domencounter_onuse;
    domflag.onuseupdate = &domencounter_onuseupdate;
    domflag.onenduse = &domencounter_onenduse;
    domflag scripts\mp\gameobjects::setvisibleteam("any");
    domflag scripts\mp\gametypes\obj_dom::domflag_setneutral();
    level.flagcapturetime = getdvarint(@"hash_ab50f58bb9979459", 30);
    domflag scripts\mp\gameobjects::setusetime(level.flagcapturetime);
    domflag.encounterlocation = self;
    /#
        self.debugdomflag = domflag;
    #/
    thread encounterdeletedomgameobjectonend(domflag);
    thread icon_update_visibility(domflag.objidnum);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e33
// Size: 0xec
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f27
// Size: 0xf
function gameobjectreleaseid_delayed() {
    wait 0.1;
    scripts\mp\gameobjects::releaseid();
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f3e
// Size: 0x17b
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c1
// Size: 0x68
function _setdomencountericoninfo(name, colors, string, pulses) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = 0;
    level.waypointstring[name] = string;
    level.waypointshader[name] = "icon_waypoint_dom_a";
    level.waypointpulses[name] = pulses;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5131
// Size: 0x4a
function domencounter_onuseupdate(team, progress, change, capplayer) {
    if (progress > 0.05 && change && !self.didstatusnotify) {
        self.didstatusnotify = 1;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5183
// Size: 0x28
function domencounter_onuse(credit_player) {
    self.encounterlocation encounter_end(1, credit_player.team);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51b3
// Size: 0x25
function domencounter_onenduse(team, player, success) {
    scripts\mp\gametypes\obj_dom::dompoint_onuseend(team, player, success);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e0
// Size: 0x9a
function domencounter_setdomscriptablepartstate(part, state, statemod) {
    switch (state) {
    case #"hash_1c39674e5b0de0f3":
    case #"hash_3699ac6c262c25ea":
    case #"hash_86bf1a776a7c4cbe": 
        return 0;
    default: 
        state = "using";
        if (isdefined(statemod)) {
            state += statemod;
        }
        self.scriptable setscriptablepartstate(part, state);
        if (part == "pulse") {
            self.scriptable setscriptablepartstate("flag", state);
        }
        return 1;
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5282
// Size: 0xc
function bombplant_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5296
// Size: 0xdf
function extraction_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    iprintlnbold("EXTRACTION START");
    /#
        print("<dev string:x2f2>");
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x537d
// Size: 0x66
function targetstart_extractiongoal(goalstruct) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    goal = spawn("script_model", goalstruct.origin + (0, 0, 20));
    goal setmodel("ctf_game_flag_east");
    self.goal = goal;
    goal.encounter = self;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x53eb
// Size: 0xe4
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
    escort sethintstring(%MP/BR_USE_PLUNDER_CACHE);
    escort setasgametypeobjective();
    escort show();
    escort.readytoextract = 0;
    escort thread extraction_escortthink();
    self.escort = escort;
    escort.encounter = self;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d7
// Size: 0x57
function extraction_escortthink() {
    level endon("game_ended");
    self endon("death");
    while (true) {
        player = self waittill("trigger");
        if (!self.readytoextract) {
            player extraction_playerpickupbody(self, player.team);
            continue;
        }
        thread extraction_attachfultonballoontoescort(player);
    }
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5536
// Size: 0xeb
function extraction_playerpickupbody(useent, team) {
    self endon("droppedBody");
    useent makeunusable();
    holdingbodyhud = scripts\mp\hud_util::createfontstring("default", 1.5);
    holdingbodyhud scripts\mp\hud_util::setpoint("CENTER", "CENTER", 0, 120);
    holdingbodyhud.label = %MP/BR_RESPAWN_BODY;
    self.holdingbodyhud = holdingbodyhud;
    useent scriptmodelplayanim("sdr_cp_hostage_walk_hostage");
    useent linkto(self, "j_clavicle_le", (0, 0, 0), (0, 0, 0));
    self allowads(0);
    self allowcrouch(0);
    self allowprone(0);
    self allowjump(0);
    scripts\mp\gametypes\br_respawn::playersetcarryteammates(1);
    while (!self stancebuttonpressed() || !self isonground()) {
        waitframe();
    }
    extraction_dropbody(useent, self, holdingbodyhud, team);
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5629
// Size: 0x13c
function extraction_dropbody(useent, playerholding, holdingbodyhud, team) {
    if (isdefined(playerholding)) {
        playerholding allowads(1);
        playerholding allowcrouch(1);
        playerholding allowprone(1);
        playerholding allowjump(1);
        scripts\mp\gametypes\br_respawn::playersetcarryteammates(0);
    }
    if (isdefined(holdingbodyhud)) {
        holdingbodyhud destroy();
    }
    if (useent islinked()) {
        useent unlink();
    }
    origin = undefined;
    if (isdefined(playerholding)) {
        useent.angles = playerholding.angles;
        origin = playerholding.origin;
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

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x576d
// Size: 0x52
function extraction_checkescortradius(player) {
    println("<dev string:x303>");
    if (distance2d(self.origin, self.encounter.goal.origin) < 100) {
        return 1;
    }
    return 0;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57c7
// Size: 0x41
function extraction_changeescortusefunction() {
    self makeusable();
    self setcursorhint("HINT_NOICON");
    self setuseholdduration("duration_long");
    self sethintrequiresholding(1);
    self sethintstring(%MP/BR_USE_PLUNDER_CACHE);
    self.readytoextract = 1;
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5810
// Size: 0x4b
function extraction_attachfultonballoontoescort(player) {
    /#
        print("<dev string:x312>");
    #/
    self.encounter encounter_end(1);
    self.encounter.goal delete();
    self delete();
}

// Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5863
// Size: 0xc6
function destruction_encounterstart() {
    /#
        function_2f6185a84b023517();
    #/
    scriptables = getscriptablearray(self.target, "targetname");
    destroyobjects = [];
    foreach (scriptable in scriptables) {
        type = scriptable.script_noteworthy;
        if (!isdefined(type)) {
            continue;
        }
        switch (type) {
        case #"hash_145971eb70575f25": 
            destroyobjects[destroyobjects.size] = scriptable;
            break;
        default: 
            break;
        }
    }
}

/#

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5931
    // Size: 0x11
    function function_674facc5e1cb84c() {
        function_8ff83bdd5420ae28("<dev string:x1c>");
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x594a
    // Size: 0x11
    function function_1535016662214ec5() {
        function_8ff83bdd5420ae28("<dev string:x21>");
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5963
    // Size: 0x11
    function function_2f6185a84b023517() {
        function_8ff83bdd5420ae28("<dev string:x2b>");
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x597c
    // Size: 0x4f
    function function_8ff83bdd5420ae28(type) {
        selftype = self.debugtype;
        if (!isdefined(selftype)) {
            selftype = "<dev string:x322>";
        }
        assertex(type == selftype, "<dev string:x32e>" + type + "<dev string:x33e>" + selftype + "<dev string:x34f>");
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x59d3
    // Size: 0x18
    function function_5bb507603ca9de76(reason) {
        self.failreason = reason;
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x59f3
    // Size: 0x4d
    function init_debug() {
        setdvarifuninitialized(@"hash_a163377bb1005bf5", 0);
        setdvarifuninitialized(@"hash_f14edbb0f6781ef7", 0);
        thread function_e0b65595a00c4889();
        thread function_ab390a4e188862f0();
        thread function_5ca1479bb38ceccd();
        thread encounter_hud();
        thread encounter_devgui();
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5a48
    // Size: 0xd0
    function function_e0b65595a00c4889() {
        function_674facc5e1cb84c();
        assert(-2 != -1);
        while (true) {
            setdvar(@"hash_9c7e1cd61023c008", -2);
            while (getdvarint(@"hash_9c7e1cd61023c008", -2) == -2) {
                wait 0.2;
            }
            forceindex = getdvarint(@"hash_9c7e1cd61023c008", -2);
            if (forceindex == -1) {
                if (!self.alllocations.size) {
                    continue;
                }
                sortedlocations = scripts\mp\utility\script::quicksort(self.alllocations, &compare_locations);
                forceindex = sortedlocations[0].debugindex;
            }
            forcelocation = self.alllocations[forceindex];
            encounter_start(forcelocation);
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x5b20
    // Size: 0xcd
    function function_20b9ab28a71f8361(dvarname, dvardefault, success) {
        function_674facc5e1cb84c();
        assert(dvardefault != -1);
        while (true) {
            setdvar(dvarname, dvardefault);
            while (getdvarint(dvarname, dvardefault) == dvardefault) {
                wait 0.2;
            }
            forceindex = getdvarint(dvarname, dvardefault);
            if (forceindex == -1) {
                if (!self.activelocations.size) {
                    continue;
                }
                sortedlocations = scripts\mp\utility\script::quicksort(self.activelocations, &compare_locations);
                forceindex = sortedlocations[0].debugindex;
            }
            forcelocation = self.alllocations[forceindex];
            forcelocation encounter_end(success);
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5bf5
    // Size: 0x1a
    function function_ab390a4e188862f0() {
        thread function_20b9ab28a71f8361(@"hash_e4a17f4ad4db68f9", -2, 1);
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c17
    // Size: 0x19
    function function_5ca1479bb38ceccd() {
        thread function_20b9ab28a71f8361(@"hash_ce1c94bf929657cc", -2, 0);
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x5c38
    // Size: 0xd3
    function compare_locations(left, right) {
        var_4ad295dcda3f5afa = [0, 0, 0, 0];
        leftpriority = var_4ad295dcda3f5afa[left.state];
        var_56861913a2f7be85 = var_4ad295dcda3f5afa[right.state];
        if (leftpriority == var_56861913a2f7be85) {
            leftdist = distance2dsquared(level.player.origin, left.origin);
            rightdist = distance2dsquared(level.player.origin, right.origin);
            return (leftdist <= rightdist);
        }
        return leftpriority <= var_56861913a2f7be85;
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5d13
    // Size: 0x49e
    function encounter_hud() {
        setdvarifuninitialized(@"hash_6f44f0cbecc66ade", 0);
        setdvarifuninitialized(@"hash_42e40d8c0b9056bb", 10);
        while (!isdefined(level.player)) {
            waitframe();
        }
        x_pos = 10;
        y_pos = 170;
        while (true) {
            hudelems = [];
            while (!getdvarint(@"hash_6f44f0cbecc66ade", 0)) {
                waitframe();
            }
            hudheader = function_ecd35236fb86f2d3();
            hudheader.x = x_pos;
            hudheader.y = y_pos;
            hudheader setdevtext("<dev string:x352>");
            while (getdvarint(@"hash_6f44f0cbecc66ade", 0)) {
                maxprints = getdvarint(@"hash_42e40d8c0b9056bb", 10);
                sortedlocations = scripts\mp\utility\script::quicksort(self.alllocations, &compare_locations);
                hudstrings = [];
                for (i = 0; i < sortedlocations.size && i < maxprints; i++) {
                    loc = sortedlocations[i];
                    str = "<dev string:x362>" + loc.debugindex + "<dev string:x363>" + loc.name + "<dev string:x366>" + function_5443af46fa933222(loc.state);
                    if (loc.state != 1) {
                        str += "<dev string:x366>" + function_6a540d657d267069(loc);
                    }
                    hudstrings[hudstrings.size] = str;
                    if (loc.state == 1) {
                        strprefix = "<dev string:x36a>";
                        str = strprefix + "<dev string:x371>" + loc.engagedradius + "<dev string:x381>" + loc.playersinengagedradius.size;
                        hudstrings[hudstrings.size] = str;
                        str = strprefix + "<dev string:x38e>" + loc.notifyradius + "<dev string:x381>" + loc.playersinnotifyradius.size;
                        hudstrings[hudstrings.size] = str;
                        if (loc.usesai) {
                            str = strprefix + "<dev string:x39d>" + loc.agents.size + "<dev string:x3ac>" + loc.agentskilled;
                            hudstrings[hudstrings.size] = str;
                        }
                        foreach (debugstring in loc.activedebuginfo) {
                            str = strprefix + debugstring;
                            hudstrings[hudstrings.size] = str;
                        }
                    }
                    worldcolor = (1, 0, 0);
                    if (loc.state == 1) {
                        worldcolor = (0, 1, 0);
                    }
                    var_8b75d145fd3fd32b = "<dev string:x362>" + loc.debugindex;
                    if (!i) {
                        var_8b75d145fd3fd32b += "<dev string:x3b7>";
                    }
                    print3d(loc.origin, var_8b75d145fd3fd32b, worldcolor);
                }
                count = 0;
                anychange = 0;
                for (i = 0; i < hudstrings.size; i++) {
                    str = hudstrings[i];
                    if (!isdefined(hudelems[i])) {
                        hudelems[i] = function_ecd35236fb86f2d3();
                    }
                    if (!isdefined(hudelems[i])) {
                        break;
                    }
                    anychange = anychange || str != hudelems[i].currenttext;
                    hudelems[i].x = x_pos;
                    hudelems[i].y = y_pos + 10 * (i + 1);
                    count++;
                }
                if (anychange) {
                    hudheader clearalltextafterhudelem();
                    for (i = 0; i < count; i++) {
                        hudelems[i] setdevtext(hudstrings[i]);
                        hudelems[i].currenttext = hudstrings[i];
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
            hudheader destroy();
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x61b9
    // Size: 0x52
    function function_6a540d657d267069(location) {
        reason = function_67ab032b2db3d203(location.encounter);
        if (isdefined(reason)) {
            return reason;
        }
        if (isdefined(location.failreason)) {
            return location.failreason;
        }
        return "<dev string:x3b9>";
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6213
    // Size: 0x4c
    function function_67ab032b2db3d203(encounter) {
        if (isdefined(encounter.parentencounter)) {
            reason = function_67ab032b2db3d203(encounter.parentencounter);
            if (isdefined(reason)) {
                return reason;
            }
        }
        return encounter.failreason;
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6267
    // Size: 0x137
    function function_ecd35236fb86f2d3() {
        fontelem = newhudelem();
        if (isdefined(fontelem)) {
            fontelem.elemtype = "<dev string:x3c8>";
            fontelem.font = "<dev string:x3cd>";
            fontelem.fontscale = 1.2;
            fontelem.basefontscale = fontelem.fontscale;
            fontelem.x = 0;
            fontelem.y = 0;
            fontelem.width = 0;
            fontelem.height = int(level.fontheight * fontelem.fontscale);
            fontelem.xoffset = 0;
            fontelem.yoffset = 0;
            fontelem.children = [];
            fontelem scripts\mp\hud_util::setparent(level.uiparent);
            fontelem.hidden = 0;
            fontelem.aligny = "<dev string:x3d5>";
            fontelem.alignx = "<dev string:x3d9>";
            fontelem.currenttext = "<dev string:x3de>";
            fontelem setdevtext("<dev string:x3de>");
        }
        return fontelem;
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x63a6
    // Size: 0x71
    function function_5443af46fa933222(state) {
        switch (state) {
        case 0: 
            return "<dev string:x3e4>";
        case 1: 
            return "<dev string:x3ef>";
        case 2: 
            return "<dev string:x3fa>";
        case 3: 
            return "<dev string:x40f>";
        default: 
            return "<dev string:x423>";
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x641f
    // Size: 0x19b
    function encounter_devgui() {
        root = "<dev string:x42b>";
        debughud = root + "<dev string:x449>";
        thread adddebugcommanddelayed(debughud + "<dev string:x456>" + function_f28fd66285fa2c9(@"hash_6f44f0cbecc66ade") + "<dev string:x462>");
        thread adddebugcommanddelayed(debughud + "<dev string:x467>" + function_f28fd66285fa2c9(@"hash_6f44f0cbecc66ade") + "<dev string:x474>");
        debugai = root + "<dev string:x479>";
        thread adddebugcommanddelayed(debugai + "<dev string:x456>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<dev string:x462>");
        thread adddebugcommanddelayed(debugai + "<dev string:x485>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<dev string:x496>");
        thread adddebugcommanddelayed(debugai + "<dev string:x49b>" + function_f28fd66285fa2c9(@"hash_f14edbb0f6781ef7") + "<dev string:x474>");
        encounters = root + "<dev string:x4a8>";
        encountersname = encounters + "<dev string:x4b6>";
        function_1c1013be314ae66a(encountersname, -1);
        foreach (i, loc in self.alllocations) {
            encountersname = encounters + loc.name + "<dev string:x4c2>" + i + "<dev string:x4c4>" + i + "<dev string:x4c7>";
            function_1c1013be314ae66a(encountersname, i);
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x65c2
    // Size: 0x9a
    function function_1c1013be314ae66a(encountersname, index) {
        thread adddebugcommanddelayed(encountersname + "<dev string:x4c9>" + function_f28fd66285fa2c9(@"hash_9c7e1cd61023c008") + "<dev string:x4d8>" + index + "<dev string:x4da>");
        thread adddebugcommanddelayed(encountersname + "<dev string:x4dd>" + function_f28fd66285fa2c9(@"hash_e4a17f4ad4db68f9") + "<dev string:x4d8>" + index + "<dev string:x4da>");
        thread adddebugcommanddelayed(encountersname + "<dev string:x4f4>" + function_f28fd66285fa2c9(@"hash_ce1c94bf929657cc") + "<dev string:x4d8>" + index + "<dev string:x4da>");
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x6664
    // Size: 0x89
    function adddebugcommanddelayed(cmd) {
        while (!isdefined(level.player)) {
            waitframe();
        }
        while (true) {
            if (!isdefined(level.var_ea8a728d3504fb9b) || level.var_ea8a728d3504fb9b < gettime()) {
                level.var_ea8a728d3504fb9b = gettime();
                level.var_28f915fb1d12fdb1 = 0;
            }
            if (level.var_28f915fb1d12fdb1 < 3) {
                break;
            }
            wait 0.05;
        }
        level.var_28f915fb1d12fdb1++;
        adddebugcommand(cmd);
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x66f5
    // Size: 0xa0
    function function_a7b476bcb852aa88() {
        self endon("<dev string:x2a4>");
        waittillframeend();
        if (!self.usesai) {
            return;
        }
        while (true) {
            debug = getdvarint(@"hash_f14edbb0f6781ef7", 0);
            if (debug) {
                foreach (agent in self.agents) {
                    function_8ddc84f18c877946(agent, debug);
                }
                waitframe();
                continue;
            }
            wait 0.2;
        }
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x679d
    // Size: 0x2ec
    function function_8ddc84f18c877946(agent, debug) {
        enemy = agent.enemy;
        printorigin = agent.origin + (0, 0, 70);
        printdelta = (0, 0, -10);
        printscale = 1;
        if (isdefined(level.player)) {
            playerdist = distance(level.player.origin, agent.origin);
            printscale = math::remap(playerdist, 0, 2000, 0.5, 2);
            playerdir = anglestoforward(level.player.angles);
            enemydir = vectornormalize(agent.origin - level.player.origin);
            enemydot = vectordot(playerdir, enemydir);
            zoomdot = 0.99;
            if (enemydot > zoomdot) {
                dotscale = math::remap(enemydot, zoomdot, 1, 1, 2);
                printscale *= dotscale;
            }
            printdelta *= printscale;
        }
        if (!isdefined(enemy)) {
            print3d(printorigin, "<dev string:x508>", (1, 0, 0), 1, printscale);
            printorigin += printdelta;
        } else {
            lastseen = agent lastknowntime(enemy);
            var_f4bc443f1eb18abc = gettime() - lastseen;
            if (var_f4bc443f1eb18abc <= 50) {
                var_b7f1f39410e505b3 = (0, 1, 0);
            } else {
                var_b7f1f39410e505b3 = (1, 1, 0);
            }
            enemyname = enemy.name;
            if (!isdefined(enemyname)) {
                enemyname = "<dev string:x50d>" + enemy getentitynumber();
            }
            var_8e26a0bb63e5483b = int(var_f4bc443f1eb18abc / 100) / 10;
            print3d(printorigin, enemyname + "<dev string:x513>" + var_8e26a0bb63e5483b + "<dev string:x516>", var_b7f1f39410e505b3, 1, printscale);
            printorigin += printdelta;
            lastorigin = agent lastknownpos(enemy);
            sphere(lastorigin, 16, var_b7f1f39410e505b3);
            if (debug > 1) {
                line(agent.origin, lastorigin, var_b7f1f39410e505b3);
            }
        }
        print3d(printorigin, "<dev string:x519>" + agent.health + "<dev string:x4c7>" + agent.maxhealth, (1, 1, 1), 1, printscale);
        printorigin += printdelta;
    }

    // Namespace br_ai_encounters / scripts\mp\gametypes\br_ai_encounters
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6a91
    // Size: 0xee
    function function_ca0d43a35b898ad4() {
        time = gettime();
        foreach (agent in level.agentarray) {
            entnum = agent getentitynumber();
            agent_available_to_spawn_time = isdefined(level.agent_available_to_spawn_time) && isdefined(level.agent_available_to_spawn_time[entnum]) && time < level.agent_available_to_spawn_time[entnum];
            println(vartostring(agent) + "<dev string:x51c>" + vartostring(agent.isactive) + "<dev string:x528>" + vartostring(agent.var_b9057e55d306b9a2) + "<dev string:x544>" + agent_available_to_spawn_time);
        }
    }

#/
