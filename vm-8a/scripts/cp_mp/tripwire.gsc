#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace tripwire;

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9f
// Size: 0x1f6
function init() {
    tripwiremodelprecache();
    spawntripwirelevelstruct();
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("trap_device", &function_6cae226462403bcc);
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "init")) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", "init") ]]();
    }
    level.var_e9a6fc11b0aa7eb2 = &tripwire_enable;
    level.var_d9d80893720b39df = &tripwire_disable;
    level.var_f1bff73a86c35c52 = &function_391d956c772fb03f;
    setdvarifuninitialized(@"hash_7c66efa464d04274", 0);
    var_7992e35c1abecadd = getstructarray("tripwire_start", "script_noteworthy");
    foreach (startstruct in var_7992e35c1abecadd) {
        if (!isdefined(startstruct.target)) {
            assertmsg("script_struct_tripwire_start at location " + startstruct.origin + " has no target.  Target a script_struct_tripwire_end where you want the tripwire to end");
        }
        if (isdefined(startstruct.initted)) {
            continue;
        }
        startstruct.initted = 1;
        endstructs = getstructarray(startstruct.target, "targetname");
        if (endstructs.size < 1) {
            assertmsg("script_struct_tripwire_start at location " + startstruct.origin + " has no target struct.  Target a script_struct_tripwire_end where you want the tripwire to end");
        }
        foreach (endstruct in endstructs) {
            buildtripwire(startstruct, endstruct);
        }
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d
// Size: 0x91
function tripwiremodelprecache() {
    precachemodel("equipment_wm_tripwire_standard_cp");
    precachemodel("equipment_wm_tripwire_standard_cp");
    precachemodel("equipment_wm_tripwire_standard_cp");
    precachemodel("equipment_wm_tripwire_wall_after");
    precachemodel("equipment_wm_tripwire_wall_after_01");
    precachemodel("equipment_wm_tripwire_wall_after_02");
    precachemodel("equipment_wm_tripwire_wall_after_03");
    precachemodel("equipment_wm_tripwire_wall_after_04");
    precachemodel("equipment_wm_tripwire_ceiling_after");
    precachemodel("equipment_wm_tripwire_floor_after");
    precachemodel("offhand_2h_wm_grenade_frag_v0");
    precachemodel("offhand_2h_wm_grenade_semtex_v0");
    precachemodel("offhand_2h_wm_c4_v0");
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd36
// Size: 0x5c
function spawntripwirelevelstruct() {
    if (!isdefined(level.tripwires)) {
        level.tripwires = spawnstruct();
        level.tripwires.traptypes = [];
        level.tripwires.tripwires = [];
        level.tripwires.traps = [];
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x13
function precache(type, model) {
    
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb5
// Size: 0xfe
function precachetrap(type, model, candisarm) {
    if (!isdefined(level.tripwires)) {
        spawntripwirelevelstruct();
    }
    if (!isdefined(level.tripwires.traptypes[type])) {
        level.tripwires.traptypes[type] = spawnstruct();
        level.tripwires.traptypes[type].model = model;
        level.tripwires.traptypes[type].triggerfunc = gettriggerfunc(type);
        level.tripwires.traptypes[type].candisarm = candisarm;
        if (candisarm) {
            level.tripwires.traptypes[type].disarmfunc = getdisarmfunc(type);
        }
    }
    precachemodel(model);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebb
// Size: 0xe6
function buildtripwire(startstruct, endstruct, parenttripwire) {
    if (!isdefined(endstruct.script_animname)) {
        endstruct.script_animname = "wall";
    }
    tripwire = spawntripwire(startstruct, endstruct);
    tripwire inittripwireanims(endstruct.script_animname);
    tripwire inittripwirestaticmodel(endstruct.script_animname);
    tripwire thread tripwirethink();
    tripwire thread triggertripwirefuncthink(&triggerfunctripwire);
    if (isdefined(parenttripwire)) {
        tripwire.targets = array_add(tripwire.targets, parenttripwire);
    }
    tripwire processtripwiretarget(endstruct);
    level.tripwires.tripwires = array_add(level.tripwires.tripwires, tripwire);
    return tripwire;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaa
// Size: 0x157
function processtripwiretarget(endstruct) {
    msg = "script_struct_tripwire_end at location " + endstruct.origin + " has no target.  Target the ent you want the tripwire to trigger, or another script_struct_tripwire_end to continue the tripwire chain";
    if (!isdefined(endstruct.target)) {
        return;
    }
    targetstructs = getstructarray(endstruct.target, "targetname");
    targetents = getentarray(endstruct.target, "targetname");
    targets = array_combine(targetstructs, targetents);
    if (targets.size == 0) {
        assertmsg(msg);
    }
    if (endstruct shouldfindnavmodifier()) {
        self.navmodifier = createnavmodifier(endstruct.target, "targetname");
    }
    foreach (target in targets) {
        if (target istripwirestruct()) {
            target = buildtripwire(endstruct, target, self);
        } else if (target istripwiretrapstruct()) {
            target = buildtripwiretrap(target, self);
        }
        self.targets = array_add(self.targets, target);
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0x27
function shouldfindnavmodifier() {
    if (isdefined(self.spawnflags) && self.spawnflags & 1) {
        return 1;
    }
    return 0;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1138
// Size: 0x34
function istripwirestruct() {
    if (isstruct(self) && isdefined(self.script_noteworthy) && self.script_noteworthy == "tripwire_end") {
        return 1;
    }
    return 0;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x38
function istripwiretrapstruct() {
    if (isstruct(self) && isdefined(self.script_noteworthy) && issubstr(self.script_noteworthy, "tripwire_trap_")) {
        return 1;
    }
    return 0;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b4
// Size: 0x81
function hastripwirechild() {
    foreach (target in self.targets) {
        if (isdefined(target.istripwire) && target.istripwire && !isdefined(target.triggered)) {
            return true;
        }
    }
    return false;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123e
// Size: 0x2c8
function spawntripwire(startstruct, endstruct) {
    vec = startstruct.origin - endstruct.origin;
    tripwire = spawn("script_model", endstruct.origin);
    tripwire.angles = vectortoangles(vec);
    tripwire setmodel(gettripwiremodel(endstruct.script_animname));
    tripwire useanimtree(%script_model);
    if (isdefined(endstruct.angles)) {
        f = anglestoforward(endstruct.angles);
        r = anglestoright(tripwire.angles);
        u = anglestoup(tripwire.angles);
        tripwire.finalangles = axistoangles(f, r, u);
    }
    tripwire.targets = [];
    tripwire.endpoint = startstruct.origin;
    tripwire.length = length(vec);
    tripwiretriggerradius = 30;
    triggerorg = tripwire.origin + anglestoforward(tripwire.angles) * 0.5 * tripwire.length;
    tripwire.trigger = spawn("trigger_rotatable_radius", tripwire.origin, 0, tripwiretriggerradius, tripwire.length + 10);
    trigger_f = -1 * anglestoup(tripwire.angles);
    trigger_r = anglestoright(tripwire.angles);
    trigger_u = anglestoforward(tripwire.angles);
    tripwire.trigger.angles = axistoangles(trigger_f, trigger_r, trigger_u);
    tripwire.istripwire = 1;
    tripwire.triggered = 0;
    if (isdefined(startstruct.script_delay)) {
        tripwire.delay = startstruct.script_delay;
    } else {
        tripwire.delay = math::factor_value(0.1, 0.35, tripwire getnormtripwirelength());
    }
    /#
        if (getdvarint(@"hash_7c66efa464d04274", 0) != 0) {
            thread scripts\cp_mp\utility\debug_utility::drawline(tripwire.origin, triggerorg, 99999, (1, 0, 0));
        }
    #/
    return tripwire;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150f
// Size: 0xf0
function inittripwireanims(animname) {
    if (!isdefined(animname)) {
        assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
    }
    self.triggeranim = gettripwiretriggeranim(animname);
    self.stretchanim = gettripwirestretchanim(animname);
    self setanim(self.triggeranim, 1, 0, 0);
    self setanim(self.stretchanim, 1, 0, 0);
    if (self.length < 10 || self.length > 300) {
        assertmsg("tripwire at location " + self.origin + " must be between " + 10 + " and " + 300 + " units apart.");
    }
    if (getdvarint(@"hash_492741ff5b4afd4a", 0)) {
        thread function_3aebddc8d6a5a470(getnormtripwirelength());
        return;
    }
    self setanimtime(self.stretchanim, getnormtripwirelength());
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1607
// Size: 0x2e
function inittripwirestaticmodel(animname) {
    if (!isdefined(animname)) {
        assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
    }
    self.staticmodel = gettripwirestaticmodel(animname);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163d
// Size: 0x30
function gettripwiretriggersound(firsttriggered) {
    if (firsttriggered) {
        return "tripwire_pop_first";
    }
    if (hastripwirechild()) {
        return "tripwire_pop";
    }
    return "tripwire_pop_last";
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1675
// Size: 0x71
function tripwirethink() {
    self endon("tripwire_trigger");
    self endon("death");
    self.trigger endon("death");
    while (true) {
        who = self.trigger waittill("trigger");
        triggertraps = 1;
        firsttriggered = 1;
        if (tripwireshouldtrigger(who)) {
            self notify("trigger", who, triggertraps, firsttriggered);
        }
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ee
// Size: 0xb1
function tripwireshouldtrigger(who) {
    if (!isdefined(self) || !isdefined(self.origin) || !isdefined(self.endpoint)) {
        return 0;
    }
    if (!isdefined(who) || who isragdoll()) {
        return 0;
    }
    if (!isalive(who)) {
        return 0;
    }
    contentsoverride = create_contents(1, 0, 0, 0, 1, 1, 0, 0, 1);
    trace = ray_trace_ents(self.origin, self.endpoint, who, contentsoverride);
    if (!isdefined(trace["fraction"])) {
        return 0;
    }
    if (trace["fraction"] < 1) {
        return 1;
    }
    return 0;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a7
// Size: 0x2af
function buildtripwiretrap(struct, parenttripwire) {
    if (!isdefined(struct.trap)) {
        if (!isdefined(struct.angles)) {
            angles = (0, 0, 0);
        } else {
            angles = struct.angles;
        }
        struct.trap = spawn("script_model", struct.origin);
        struct.trap.angles = angles;
        struct.trap setmodel(level.tripwires.traptypes[struct.script_noteworthy].model);
        struct.trap thread triggertrapfuncthink(level.tripwires.traptypes[struct.script_noteworthy].triggerfunc);
        struct.trap thread damagetrapfuncthink();
        struct.trap.candisarm = level.tripwires.traptypes[struct.script_noteworthy].candisarm;
        struct.trap.istrap = 1;
        if (isdefined(level.tripwires.traptypes[struct.script_noteworthy].disarmfunc)) {
            struct.trap thread disarmfuncthink(level.tripwires.traptypes[struct.script_noteworthy].disarmfunc, struct);
        }
        if (isdefined(struct.script_parameters)) {
            var_af462e92beac4f4e = strtok(struct.script_parameters, " ");
            struct.trap.grenadeweaponoverride = var_af462e92beac4f4e[0];
        }
        struct.trap.parenttripwires = [];
        level.tripwires.traps = array_add(level.tripwires.traps, struct.trap);
    }
    struct.trap.parenttripwires = array_add(struct.trap.parenttripwires, parenttripwire);
    return struct.trap;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x369
function function_3aebddc8d6a5a470(length_factor) {
    var_b93fbb948fda0f7c = 0.2;
    var_95206942f9c28aa5 = 0.4;
    var_f868a88235cac998 = 0.6;
    var_177ccdb7ce1114fd = 0.8;
    tripwire_parts = [];
    tripwire_parts[tripwire_parts.size] = function_8f1b1ef7b8a59eb7();
    if (length_factor > var_b93fbb948fda0f7c) {
        tripwire_parts[tripwire_parts.size] = function_8f1b1ef7b8a59eb7();
    }
    if (length_factor > var_95206942f9c28aa5) {
        tripwire_parts[tripwire_parts.size] = function_8f1b1ef7b8a59eb7();
    }
    if (length_factor > var_f868a88235cac998) {
        tripwire_parts[tripwire_parts.size] = function_8f1b1ef7b8a59eb7();
    }
    self hide();
    stretchfactor = length_factor * 2.23;
    waittime = math::factor_value(1, 300, stretchfactor);
    waittime *= 0.05;
    animnotify = "tripwireStretchAnimTime";
    var_6b86dc130a1fa946 = anglestoforward(self.angles);
    var_63a301303b3b2934 = anglestoup(self.angles);
    tomatch = vectorcross(var_6b86dc130a1fa946, var_63a301303b3b2934);
    var_3c86ad8a86338503 = self.origin + tomatch * 100 - self.origin;
    var_d1389d74dfdce48e = self.origin + var_63a301303b3b2934 * 100 - self.origin;
    vec1 = vectornormalize(var_d1389d74dfdce48e);
    vec2 = vectornormalize((0, 0, 1));
    angbetween = math::anglebetweenvectors(vec1, vec2);
    angbetween = anglebetweenvectorssigned(vec1, vec2, vectornormalize(var_3c86ad8a86338503));
    var_64d53bb94497f357 = var_3c86ad8a86338503[0] + 90 > 0;
    foreach (part in tripwire_parts) {
        part scriptmodelplayanim(script_model%tripwire_trigger_standard_stretch, animnotify, 0, 0.01);
    }
    function_83ecc93f05088653(waittime);
    foreach (part in tripwire_parts) {
        part scriptmodelpauseanim(1);
        part rotateto(vectortoangles(tomatch), 0.1, 0.05, 0.05);
    }
    function_83ecc93f05088653(0.15);
    foreach (part in tripwire_parts) {
        part rotateroll(angbetween * -1, 3, 1, 1);
    }
    waittill_any_2("tripwire_trigger", "tripwire_defused");
    foreach (part in tripwire_parts) {
        part delete();
    }
    self show();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd0
// Size: 0x46
function function_8f1b1ef7b8a59eb7() {
    tripwire_stretch = spawn("script_model", self.origin);
    tripwire_stretch.angles = self.angles;
    tripwire_stretch setmodel(self.model);
    return tripwire_stretch;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1f
// Size: 0x16
function getnormtripwirelength() {
    return math::normalize_value(10, 300, self.length);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3e
// Size: 0x35
function function_83ecc93f05088653(durationseconds) {
    level endon("game_ended");
    durationprogress = 0;
    while (durationprogress < durationseconds) {
        durationprogress += level.framedurationseconds;
        waitframe();
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7b
// Size: 0x72
function tripwirehastraps() {
    foreach (target in self.targets) {
        if (isdefined(target.istrap) && !isdefined(target.triggered)) {
            return true;
        }
    }
    return false;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef6
// Size: 0x83
function triggertripwirefuncthink(triggerfunc) {
    while (true) {
        who, triggertrap, firsttriggered = self waittill("trigger");
        if (triggertrap) {
            break;
        }
        if (!tripwirehastraps()) {
            break;
        }
    }
    if (isdefined(who)) {
        who.lasttriptime = gettime();
    }
    self notify("tripwire_trigger");
    self.triggered = 1;
    self [[ triggerfunc ]](who, triggertrap, firsttriggered);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f81
// Size: 0xb6
function triggertrapfuncthink(triggerfunc) {
    while (true) {
        who, triggertrap = self waittill("trigger");
        if (triggertrap) {
            break;
        }
    }
    self notify("trap_trigger");
    self.triggered = 1;
    if (isdefined(self.defusehintstruct) && !isdefined(self.defusehintstruct.defused)) {
        if (isent(self.defusehintstruct)) {
            self.defusehintstruct makeunusable();
            self.defusehintstruct delete();
        }
    }
    self [[ triggerfunc ]](who);
    level notify("tripwire_detonated", self.origin);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203f
// Size: 0x6c
function gettriggerfunc(type) {
    switch (type) {
    case #"hash_32670e2a61b99a3b": 
        return &triggerfuncc4;
    case #"hash_4beeaacc1db7b8cc": 
        return &triggerfuncsemtex;
    case #"hash_496a20490fb91698": 
        return &triggerfuncfrag;
    default: 
        assertmsg("Add a triggerFunc for trigger trap " + type + " to scriptsspequipment\tripwire::getTriggerFunc");
        break;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b3
// Size: 0xfb
function gettripwiretriggeranim(animname) {
    switch (animname) {
    case #"hash_28b4e95012259360": 
        return random([script_model%tripwire_trigger_standard_ceiling]);
    case #"hash_3e7681464ca7b9fd": 
        return random([script_model%tripwire_trigger_standard_floor]);
    case #"hash_bdea657441323e75": 
        if (shouldusewallsize1()) {
            return random([script_model%tripwire_trigger_standard_wall_01]);
        } else if (shouldusewallsize2()) {
            return random([script_model%tripwire_trigger_standard_wall_02]);
        } else if (shouldusewallsize3()) {
            return random([script_model%tripwire_trigger_standard_wall_03]);
        } else if (shouldusewallsize4()) {
            return random([script_model%tripwire_trigger_standard_wall_04]);
        } else {
            return random([script_model%tripwire_trigger_standard_wall]);
        }
        break;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b6
// Size: 0x92
function gettripwirestaticmodel(animname) {
    switch (animname) {
    case #"hash_28b4e95012259360": 
        return "equipment_wm_tripwire_ceiling_after";
    case #"hash_3e7681464ca7b9fd": 
        return "equipment_wm_tripwire_floor_after";
    case #"hash_bdea657441323e75": 
        if (shouldusewallsize1()) {
            return "equipment_wm_tripwire_wall_after_01";
        } else if (shouldusewallsize2()) {
            return "equipment_wm_tripwire_wall_after_02";
        } else if (shouldusewallsize3()) {
            return "equipment_wm_tripwire_wall_after_03";
        } else if (shouldusewallsize4()) {
            return "equipment_wm_tripwire_wall_after_04";
        } else {
            return "equipment_wm_tripwire_wall_after";
        }
        break;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2250
// Size: 0x56
function gettripwirestretchanim(animname) {
    switch (animname) {
    case #"hash_28b4e95012259360": 
        return script_model%tripwire_trigger_standard_stretch;
    case #"hash_3e7681464ca7b9fd": 
        return script_model%tripwire_trigger_standard_stretch;
    case #"hash_bdea657441323e75": 
        return script_model%tripwire_trigger_standard_stretch;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ae
// Size: 0x75
function gettripwiremodel(animname) {
    if (!isdefined(animname)) {
        assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
    }
    if (level.script == "cp_raid1_boss1") {
        return "equipment_wm_tripwire_standard_raid1_boss1";
    }
    switch (animname) {
    case #"hash_28b4e95012259360": 
        return "equipment_wm_tripwire_standard_cp";
    case #"hash_3e7681464ca7b9fd": 
        return "equipment_wm_tripwire_standard_cp";
    case #"hash_bdea657441323e75": 
        return "equipment_wm_tripwire_standard_cp";
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232b
// Size: 0x1e
function shouldusewallsize1() {
    return self.length >= 51 && self.length < 69;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2352
// Size: 0x1e
function shouldusewallsize2() {
    return self.length >= 69 && self.length < 100;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2379
// Size: 0x1e
function shouldusewallsize3() {
    return self.length > 10 && self.length < 37;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a0
// Size: 0x1e
function shouldusewallsize4() {
    return self.length >= 37 && self.length < 51;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c7
// Size: 0x172
function triggerfunctripwire(who, triggertraps, firsttriggered) {
    if (isdefined(self.trigger) && isent(self.trigger)) {
        self.trigger delete();
    }
    self setanimrate(self.triggeranim, 1);
    self setanim(script_model%tripwire_stretch_overlay, 0, 0.2, 1);
    thread swaptostaticmodel();
    self playsound("tripwire_pop");
    triggersound = gettripwiretriggersound(firsttriggered);
    if (isdefined(self.finalangles)) {
        thread rotatetofinalangles();
    }
    if (isplayer(who)) {
        who playrumbleonentity("damage_light");
        earthquake(0.1, 0.2, who.origin, 2000);
    }
    wait self.delay;
    if (isdefined(self.navmodifier)) {
        destroynavobstacle(self.navmodifier);
    }
    firsttriggered = 0;
    if (isdefined(self.targets)) {
        foreach (target in self.targets) {
            target notify("trigger", who, triggertraps, firsttriggered);
        }
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x24
function rotatetofinalangles() {
    self endon("death");
    wait 0.25;
    self rotateto(self.finalangles, 0.25);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256d
// Size: 0x34
function swaptostaticmodel() {
    self endon("death");
    animtime = getanimlength(self.triggeranim);
    wait animtime;
    self setmodel(self.staticmodel);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a9
// Size: 0x6c
function delete_trapfunc() {
    firsttrigger = 1;
    foreach (parenttripwire in self.parenttripwires) {
        parenttripwire thread triggerfunctripwire(undefined, 1, firsttrigger);
        firsttrigger = 0;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261d
// Size: 0x10a
function triggerfuncsemtex(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadetype = self.grenadeweaponoverride;
    } else {
        grenadetype = "semtex_tripwire";
    }
    semtex = magicgrenademanual(grenadetype, self.origin, (0, 0, 0), 0.25);
    semtex.angles = self.angles;
    semtex.origin = self.origin;
    semtex linkto(self);
    self hide();
    semtex waittill("explode");
    radiusdamage(self.origin, 384, 256, 40, undefined, "MOD_EXPLOSIVE", "semtex_mp");
    playrumbleonposition("grenade_rumble", self.origin);
    earthquake(0.45, 0.7, self.origin, 800);
    wait 0.1;
    self notify("cancel_death_hint");
    self delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272f
// Size: 0x143
function triggerfuncfrag(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadetype = self.grenadeweaponoverride;
    } else {
        grenadetype = "frag_tripwire";
    }
    frag = magicgrenademanual(grenadetype, self.origin, (0, 0, 0), 0.25);
    frag.angles = self.angles;
    frag.origin = self.origin;
    frag linkto(self);
    self hide();
    frag waittill("explode");
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "damageFunc")) {
        var_ee6983a991436671 = scripts\engine\utility::getsharedfunc("tripwire", "damageFunc");
        level thread [[ var_ee6983a991436671 ]](self, who);
    } else {
        radiusdamage(self.origin, 384, 256, 40, undefined, "MOD_EXPLOSIVE", "frag_grenade_mp");
        playrumbleonposition("grenade_rumble", self.origin);
        earthquake(0.45, 0.7, self.origin, 800);
    }
    wait 0.1;
    self notify("cancel_death_hint");
    self delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287a
// Size: 0x16c
function triggerfuncc4(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadetype = self.grenadeweaponoverride;
    } else {
        grenadetype = "c4_mp";
    }
    c4 = magicgrenademanual(grenadetype, self.origin, (0, 0, 0), 0.25);
    c4.angles = self.angles;
    c4.origin = self.origin;
    c4 linkto(self);
    self hide();
    c4 setscriptablepartstate("effects", "explode", 0);
    c4 notify("detonateExplosive");
    radiusdamage(self.origin, 384, 256, 40, undefined, "MOD_EXPLOSIVE", "c4_mp");
    self playsound("iw9_frag_grenade_expl_trans");
    if (istrue(level.var_d744dab15887349d)) {
        if (isdefined(who) && isplayer(who)) {
            who.shouldskipdeathsshield = 1;
            who dodamage(self.health + 100, self.origin, who, who, "MOD_SUICIDE", "c4_mp");
        }
    }
    playrumbleonposition("grenade_rumble", self.origin);
    earthquake(0.45, 0.7, self.origin, 800);
    self delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ee
// Size: 0x257
function damagetrapfuncthink(damageFunc, struct) {
    self endon("trap_trigger");
    self setcandamage(1);
    self.health = 99999;
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        if (scripts\engine\utility::issharedfuncdefined("tripwire", "blowTripWire")) {
            self thread [[ scripts\engine\utility::getsharedfunc("tripwire", "blowTripWire") ]](attacker, type);
        }
        if (scripts\engine\utility::issharedfuncdefined("tripwire", "canTripTrap")) {
            var_ee6983a991436671 = scripts\engine\utility::getsharedfunc("tripwire", "canTripTrap");
            if (self [[ var_ee6983a991436671 ]](attacker, objweapon, type, damage, point)) {
                break;
            }
        } else if (cantriptrap(attacker, type, damage)) {
            break;
        }
        self.health += damage;
    }
    self.triggered = 1;
    if (isdefined(self.defusehintstruct) && !isdefined(self.defusehintstruct.defused)) {
        if (isent(self.defusehintstruct)) {
            self.defusehintstruct makeunusable();
            self.defusehintstruct delete();
        }
    }
    triggertraps = 0;
    firsttriggered = 1;
    self makeunusable();
    foreach (parenttripwire in self.parenttripwires) {
        parenttripwire notify("trigger", attacker, triggertraps, firsttriggered);
    }
    self notify("trigger", attacker, 1);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4d
// Size: 0x4d
function cantriptrap(attacker, type, damage) {
    if (!isdefined(attacker)) {
        return false;
    }
    if (isplayer(attacker) && (type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH") && damage > 150) {
        return true;
    }
    return false;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca3
// Size: 0x1d7
function disarmfuncthink(disarmfunc, struct) {
    self endon("trap_trigger");
    if (isdefined(struct.radius)) {
        var_7c46ca1bdcc9e980 = struct.radius;
    } else {
        var_7c46ca1bdcc9e980 = 128;
    }
    hint_offset = (0, 0, 0);
    self.defusehintstruct = undefined;
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "createHintObject")) {
        var_ee6983a991436671 = scripts\engine\utility::getsharedfunc("tripwire", "createHintObject");
        self.defusehintstruct = [[ var_ee6983a991436671 ]](struct.origin, undefined, undefined, undefined, undefined, "duration_medium", "hide", 128, 35, 84, 35);
    } else {
        self.defusehintstruct = struct spawn_script_origin();
    }
    self.deletefunc = &delete_trapfunc;
    who = self.defusehintstruct waittill("trigger");
    level.lasttripwiredefusedtime = gettime();
    self.defusehintstruct.defused = 1;
    self.triggered = 1;
    triggertraps = 0;
    firsttriggered = 1;
    if (isent(self.defusehintstruct)) {
        self.defusehintstruct makeunusable();
        self.defusehintstruct delete();
    }
    foreach (parenttripwire in self.parenttripwires) {
        parenttripwire notify("trigger", who, triggertraps, firsttriggered);
    }
    self [[ disarmfunc ]](who);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e82
// Size: 0x5a
function getdisarmfunc(type) {
    switch (type) {
    case #"hash_4beeaacc1db7b8cc": 
        return &disarmfuncsemtex;
    case #"hash_496a20490fb91698": 
        return &disarmfuncfrag;
    default: 
        assertmsg("Add a disarm func for trigger trap " + type + " to scriptscp_mp\tripwire::getDisarmFunc");
        break;
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee4
// Size: 0x36
function disarmfuncsemtex(who) {
    who disarmgiveweapon("semtex", "semtex", self.origin, self.angles);
    self delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f22
// Size: 0x36
function disarmfuncfrag(who) {
    who disarmgiveweapon("frag", "frag", self.origin, self.angles);
    self delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f60
// Size: 0x5b
function disarmgiveweapon(weapon, lootname, grenade_origin, var_40559a644f5cc3e6) {
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "disarmGiveWeapon")) {
        var_ee6983a991436671 = scripts\engine\utility::getsharedfunc("tripwire", "disarmGiveWeapon");
        thread [[ var_ee6983a991436671 ]](weapon, lootname, self, grenade_origin, var_40559a644f5cc3e6);
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc3
// Size: 0x97
function function_391d956c772fb03f() {
    precachetrap("tripwire_trap_frag", "offhand_2h_wm_grenade_frag_v0", 1);
    precachetrap("tripwire_trap_semtex", "offhand_2h_wm_grenade_semtex_v0", 1);
    precachetrap("tripwire_trap_c4", "offhand_2h_wm_c4_v0", 0);
    if (!isdefined(level.tripwireweaponname)) {
        level.tripwireweaponname = "frag_grenade_mp";
    }
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "sort")) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", "sort") ]]();
    }
    /#
        setdvar(@"hash_c6241d315c0f6bcf", 0);
        level thread function_b96a88fafd4943c5();
    #/
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3062
// Size: 0xe3
function function_41e381609b6ab0(var_ffcaa31c31962d79) {
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("trap_device", &function_6cae226462403bcc);
    tripwires = getentitylessscriptablearray(var_ffcaa31c31962d79, "classname");
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    foreach (tripwire in tripwires) {
        tripwire function_e532c2521845ce4a();
        tripwire thread function_4d63a162b2fb4275();
    }
    level.tripwires.tripwires = array_combine(level.tripwires.tripwires, tripwires);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314d
// Size: 0x66
function tripwire_enable(tripwire, ownerteam, tripwiretargets) {
    tripwire function_e532c2521845ce4a(ownerteam, tripwiretargets);
    tripwire thread function_4d63a162b2fb4275();
    tripwire.enabled = 1;
    level.tripwires.tripwires[level.tripwires.tripwires.size] = tripwire;
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bb
// Size: 0x12d
function tripwire_disable(tripwire) {
    tripwire.enabled = 0;
    assertex(isdefined(tripwire.targetarray), "Tripwire has an invalid target array");
    foreach (item in tripwire.targetarray) {
        if (item getscriptablehaspart("trap_device")) {
            item setscriptablepartstate("trap_device", "off");
            continue;
        }
        if (item.classname == "scriptable_dmz_tripwire" || item.classname == "scriptable_ob_tripwire") {
            item setscriptablepartstate("wire", "off");
            continue;
        }
        if (item getscriptablehaspart("wall_pin")) {
            item setscriptablepartstate("wall_pin", "invisible");
            continue;
        }
        assertmsg("Error, unsupported tripwire Scriptable detected " + tripwire.origin);
    }
    tripwire setscriptablepartstate("wire", "off");
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f0
// Size: 0x4cb
function function_e532c2521845ce4a(var_8eca5bdf48ccf8e6, targets) {
    tripwire = self;
    tripwire setscriptablepartstate("wire", "wire_taut");
    tripwire.targets = [];
    tripwire.length = 64;
    tripwire.istripwire = 1;
    tripwire.triggered = 0;
    tripwire.delay = 0.35;
    var_c2306c15ef050dfc = 0;
    if (!isdefined(targets)) {
        targets = getentitylessscriptablearray(tripwire.target, "targetname");
    }
    tripwire.targetarray = targets;
    tripwire.trapdevice = undefined;
    scriptablename = undefined;
    var_303f68b800b31d41 = [];
    foreach (item in tripwire.targetarray) {
        if (item getscriptablehaspart("trap_device")) {
            tripwire.trapdevice = item;
            tripwire.trapdevice.tripwire = tripwire;
            scriptablename = getsubstr(tripwire.trapdevice.classname, 11);
            continue;
        }
        if (item.classname == "scriptable_dmz_tripwire" || item.classname == "scriptable_ob_tripwire") {
            item setscriptablepartstate("wire", "wire_taut");
            tripwire.extrawire = item;
            var_c2306c15ef050dfc = 15;
            continue;
        }
        if (item getscriptablehaspart("wall_pin")) {
            item setscriptablepartstate("wall_pin", "visible", 1);
            var_303f68b800b31d41[var_303f68b800b31d41.size] = item.origin;
            continue;
        }
        assertmsg("Error, unsupported tripwire Scriptable detected " + tripwire.origin);
    }
    tripwire.trapdevice setscriptablepartstate("trap_device", "active");
    var_302b1852ac0137d4 = var_303f68b800b31d41.size == 2;
    tripwiretriggerradius = 5;
    trigger_f = -1 * anglestoup(tripwire.angles);
    trigger_r = anglestoright(tripwire.angles);
    trigger_u = anglestoforward(tripwire.angles);
    triggerlength = tripwire.length + var_c2306c15ef050dfc;
    triggerpos = tripwire.origin - var_c2306c15ef050dfc * trigger_u;
    if (var_302b1852ac0137d4) {
        var_802d90d64037ba83 = var_303f68b800b31d41[0] - var_303f68b800b31d41[1];
        tripwire.length = length(var_802d90d64037ba83);
        triggerlength = tripwire.length;
        triggerpos = tripwire.origin;
    }
    tripwire.trigger = spawn("trigger_rotatable_radius", triggerpos, 0, tripwiretriggerradius, triggerlength);
    tripwire.trigger.angles = axistoangles(trigger_f, trigger_r, trigger_u);
    var_4a2359165feb7717 = tripwire.origin + trigger_u * 32;
    var_248f2537e91d1766 = (40, 30, 64 + var_c2306c15ef050dfc);
    if (var_302b1852ac0137d4) {
        var_4a2359165feb7717 = tripwire.origin + trigger_u * tripwire.length * 0.5;
        var_d3e09f5f7bbb6484 = getdvarint(@"hash_b20f014ff8301b42", 4);
        var_437c30771383edb0 = getdvarint(@"hash_b64fa5855f75fdb5", 7);
        var_dc33914a50fc9820 = getdvarint(@"hash_9950ea4c303f6053", 10);
        var_35e885a65f4c35f = tripwire.length * 0.5;
        var_248f2537e91d1766 = (var_35e885a65f4c35f + var_d3e09f5f7bbb6484, var_437c30771383edb0, var_dc33914a50fc9820);
    }
    /#
        if (getdvarint(@"hash_7c66efa464d04274", 0) != 0) {
            thread scripts\cp_mp\utility\debug_utility::drawsphere(var_4a2359165feb7717, 10, 600, (0, 1, 0));
        }
    #/
    if (isdefined(var_8eca5bdf48ccf8e6)) {
        tripwire.navobstacleid = createnavbadplacebybounds(var_4a2359165feb7717, var_248f2537e91d1766, tripwire.angles, var_8eca5bdf48ccf8e6);
    } else {
        tripwire.navobstacleid = createnavobstaclebybounds(var_4a2359165feb7717, var_248f2537e91d1766, tripwire.angles);
    }
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "onTripwireCreate")) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", "onTripwireCreate") ]](tripwire);
    }
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c3
// Size: 0x3b
function function_4d63a162b2fb4275() {
    tripwire = self;
    tripwire endon("tripwire_defused");
    var_2d9552508615d396 = tripwire.trigger waittill("trigger");
    function_fb4b4fa0cee578bd(var_2d9552508615d396, tripwire);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3806
// Size: 0x205
function function_fb4b4fa0cee578bd(var_2d9552508615d396, tripwire) {
    if (istrue(tripwire.triggered)) {
        return;
    }
    tripwire.triggered = 1;
    if (isdefined(tripwire.extrawire)) {
        tripwire.extrawire setscriptablepartstate("wire", "wire_snap");
        tripwire setscriptablepartstate("wire", "off");
    } else {
        tripwire setscriptablepartstate("wire", "wire_snap");
    }
    tripwire.trapdevice setscriptablepartstate("trap_device", "off");
    grenadename = "frag_tripwire";
    if (isdefined(tripwire.script_parameters)) {
        grenadename = tripwire.script_parameters;
    } else if (isdefined(tripwire.var_70587812595fd991) && tripwire.var_70587812595fd991 != "") {
        grenadename = tripwire.var_70587812595fd991;
    }
    frag = magicgrenademanual(grenadename, tripwire.trapdevice.origin, (0, 0, 0), 0.25);
    frag waittill("explode");
    if (isdefined(tripwire.script_parameters) && scripts\engine\utility::issharedfuncdefined("tripwire", tripwire.script_parameters)) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", tripwire.script_parameters) ]](var_2d9552508615d396, tripwire);
    } else if (scripts\engine\utility::issharedfuncdefined("tripwire", "tripwire_override")) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", "tripwire_override") ]](var_2d9552508615d396, tripwire);
    } else {
        function_5edfa6cc73a7922d(tripwire);
    }
    if (scripts\engine\utility::issharedfuncdefined("tripwire", "onTripwireTriggered")) {
        [[ scripts\engine\utility::getsharedfunc("tripwire", "onTripwireTriggered") ]](var_2d9552508615d396, tripwire);
    }
    wait 0.1;
    destroynavobstacle(tripwire.navobstacleid);
    tripwire.trigger delete();
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a13
// Size: 0x95
function function_5edfa6cc73a7922d(tripwire) {
    level.var_cbe618f35b332990 radiusdamage(tripwire.trapdevice.origin, 384, 200, 40, level.var_cbe618f35b332990, "MOD_GRENADE", level.tripwireweaponname);
    playrumbleonposition("grenade_rumble", tripwire.trapdevice.origin);
    earthquake(0.45, 0.7, tripwire.trapdevice.origin, 800);
}

// Namespace tripwire / scripts\cp_mp\tripwire
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab0
// Size: 0x227
function function_6cae226462403bcc(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (part == "trap_device") {
        instance setscriptablepartstate("trap_device", "off");
        if (isdefined(instance.tripwire.extrawire)) {
            instance.tripwire.extrawire setscriptablepartstate("wire", "wire_snap");
            instance.tripwire setscriptablepartstate("wire", "off");
        } else {
            instance.tripwire setscriptablepartstate("wire", "wire_snap");
        }
        instance.tripwire notify("tripwire_defused");
        if (scripts\engine\utility::issharedfuncdefined("tripwire", "onTripwireDefused")) {
            [[ scripts\engine\utility::getsharedfunc("tripwire", "onTripwireDefused") ]](player, instance.tripwire);
        }
        destroynavobstacle(instance.tripwire.navobstacleid);
        if (isent(instance.tripwire.trigger)) {
            instance.tripwire.trigger delete();
        }
        var_259b17a170041609 = undefined;
        instance.tripwire.disabled = 1;
        switch (instance.classname) {
        case #"hash_fa19f0086a89d0b2": 
            var_259b17a170041609 = "brloot_offhand_frag";
            break;
        default: 
            var_259b17a170041609 = "brloot_offhand_frag";
            break;
        }
        if (scripts\engine\utility::issharedfuncdefined("tripwire", "createLootDropInfo", 0)) {
            dropinfo = [[ scripts\engine\utility::getsharedfunc("tripwire", "createLootDropInfo") ]](instance.origin, instance.angles, undefined, 0, 0, undefined, 1);
            [[ scripts\engine\utility::getsharedfunc("tripwire", "spawnPickup") ]](var_259b17a170041609, dropinfo, 1, 1);
        }
    }
}

/#

    // Namespace tripwire / scripts\cp_mp\tripwire
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3cdf
    // Size: 0x2da
    function function_b96a88fafd4943c5() {
        level endon("<dev string:x1c>");
        tripwires = getentitylessscriptablearray("<dev string:x27>", "<dev string:x3f>");
        enabledcolor = (0, 1, 0);
        disabledcolor = (1, 0, 0);
        var_7b32db7c7f51bac5 = (0, 0, 1);
        while (true) {
            if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 1) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.enabled)) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, enabledcolor);
                    }
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 2) {
                foreach (tripwire in tripwires) {
                    if (!istrue(tripwire.enabled)) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, disabledcolor);
                    }
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 3) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.triggered) || istrue(tripwire.disarmed)) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, var_7b32db7c7f51bac5);
                        continue;
                    }
                    if (istrue(tripwire.enabled)) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, enabledcolor);
                        continue;
                    }
                    thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, disabledcolor);
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 4) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.triggered) || istrue(tripwire.disarmed)) {
                        thread scripts\cp_mp\utility\debug_utility::drawsphere(tripwire.origin, 32, 1, var_7b32db7c7f51bac5);
                    }
                }
            }
            wait 1;
        }
    }

#/
