// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;

#namespace tripwire;

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9f
// Size: 0x1f7
function init() {
    tripwiremodelprecache();
    spawntripwirelevelstruct();
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("trap_device", &function_6cae226462403bcc);
    if (!isdefined(level.var_cbe618f35b332990)) {
        level.var_cbe618f35b332990 = spawn("script_origin", (0, 0, 0));
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "init")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "init") ]]();
    }
    level.var_e9a6fc11b0aa7eb2 = &function_186d7ac95077704b;
    level.var_d9d80893720b39df = &function_56fd20503d89eed8;
    level.var_f1bff73a86c35c52 = &function_391d956c772fb03f;
    setdvarifuninitialized(@"hash_7c66efa464d04274", 0);
    var_7992e35c1abecadd = getstructarray("tripwire_start", "script_noteworthy");
    foreach (startstruct in var_7992e35c1abecadd) {
        if (!isdefined(startstruct.target)) {
            /#
                assertmsg("script_struct_tripwire_start at location " + startstruct.origin + " has no target.  Target a script_struct_tripwire_end where you want the tripwire to end");
            #/
        }
        if (isdefined(startstruct.var_c9f2956dd819de38)) {
            continue;
        }
        startstruct.var_c9f2956dd819de38 = 1;
        var_36743e75fe4a30 = getstructarray(startstruct.target, "targetname");
        if (var_36743e75fe4a30.size < 1) {
            /#
                assertmsg("script_struct_tripwire_start at location " + startstruct.origin + " has no target struct.  Target a script_struct_tripwire_end where you want the tripwire to end");
            #/
        }
        foreach (var_d0697af2eca83d63 in var_36743e75fe4a30) {
            buildtripwire(startstruct, var_d0697af2eca83d63);
        }
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d
// Size: 0x92
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd36
// Size: 0x5d
function spawntripwirelevelstruct() {
    if (!isdefined(level.tripwires)) {
        level.tripwires = spawnstruct();
        level.tripwires.traptypes = [];
        level.tripwires.tripwires = [];
        level.tripwires.traps = [];
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd9a
// Size: 0x14
function precache(type, model) {
    
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb5
// Size: 0xff
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebb
// Size: 0xe7
function buildtripwire(startstruct, var_d0697af2eca83d63, var_aa6923872cf5d7bb) {
    if (!isdefined(var_d0697af2eca83d63.script_animname)) {
        var_d0697af2eca83d63.script_animname = "wall";
    }
    tripwire = spawntripwire(startstruct, var_d0697af2eca83d63);
    tripwire inittripwireanims(var_d0697af2eca83d63.script_animname);
    tripwire inittripwirestaticmodel(var_d0697af2eca83d63.script_animname);
    tripwire thread tripwirethink();
    tripwire thread triggertripwirefuncthink(&triggerfunctripwire);
    if (isdefined(var_aa6923872cf5d7bb)) {
        tripwire.targets = array_add(tripwire.targets, var_aa6923872cf5d7bb);
    }
    tripwire processtripwiretarget(var_d0697af2eca83d63);
    level.tripwires.tripwires = array_add(level.tripwires.tripwires, tripwire);
    return tripwire;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfaa
// Size: 0x158
function processtripwiretarget(var_d0697af2eca83d63) {
    msg = "script_struct_tripwire_end at location " + var_d0697af2eca83d63.origin + " has no target.  Target the ent you want the tripwire to trigger, or another script_struct_tripwire_end to continue the tripwire chain";
    if (!isdefined(var_d0697af2eca83d63.target)) {
        return;
    }
    targetstructs = getstructarray(var_d0697af2eca83d63.target, "targetname");
    var_fd5ef62c4bde358e = getentarray(var_d0697af2eca83d63.target, "targetname");
    targets = array_combine(targetstructs, var_fd5ef62c4bde358e);
    if (targets.size == 0) {
        /#
            assertmsg(msg);
        #/
    }
    if (var_d0697af2eca83d63 shouldfindnavmodifier()) {
        self.navmodifier = createnavmodifier(var_d0697af2eca83d63.target, "targetname");
    }
    foreach (target in targets) {
        if (target istripwirestruct()) {
            target = buildtripwire(var_d0697af2eca83d63, target, self);
        } else if (target istripwiretrapstruct()) {
            target = buildtripwiretrap(target, self);
        }
        self.targets = array_add(self.targets, target);
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109
// Size: 0x28
function shouldfindnavmodifier() {
    if (isdefined(self.spawnflags) && self.spawnflags & 1) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1138
// Size: 0x35
function istripwirestruct() {
    if (isstruct(self) && isdefined(self.script_noteworthy) && self.script_noteworthy == "tripwire_end") {
        return 1;
    } else {
        return 0;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1174
// Size: 0x39
function istripwiretrapstruct() {
    if (isstruct(self) && isdefined(self.script_noteworthy) && issubstr(self.script_noteworthy, "tripwire_trap_")) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11b4
// Size: 0x82
function hastripwirechild() {
    foreach (target in self.targets) {
        if (isdefined(target.istripwire) && target.istripwire && !isdefined(target.triggered)) {
            return 1;
        }
    }
    return 0;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123e
// Size: 0x2c9
function spawntripwire(startstruct, var_d0697af2eca83d63) {
    vec = startstruct.origin - var_d0697af2eca83d63.origin;
    tripwire = spawn("script_model", var_d0697af2eca83d63.origin);
    tripwire.angles = vectortoangles(vec);
    tripwire setmodel(gettripwiremodel(var_d0697af2eca83d63.script_animname));
    tripwire useanimtree(%script_model);
    if (isdefined(var_d0697af2eca83d63.angles)) {
        f = anglestoforward(var_d0697af2eca83d63.angles);
        r = anglestoright(tripwire.angles);
        u = anglestoup(tripwire.angles);
        tripwire.finalangles = axistoangles(f, r, u);
    }
    tripwire.targets = [];
    tripwire.endpoint = startstruct.origin;
    tripwire.length = length(vec);
    var_d5b2a103934621f3 = 30;
    var_c0ee4d060004600b = tripwire.origin + anglestoforward(tripwire.angles) * 0.5 * tripwire.length;
    tripwire.trigger = spawn("trigger_rotatable_radius", tripwire.origin, 0, var_d5b2a103934621f3, tripwire.length + 10);
    var_b1a278451f610d5a = -1 * anglestoup(tripwire.angles);
    var_b1a264451f60e15e = anglestoright(tripwire.angles);
    var_b1a267451f60e7f7 = anglestoforward(tripwire.angles);
    tripwire.trigger.angles = axistoangles(var_b1a278451f610d5a, var_b1a264451f60e15e, var_b1a267451f60e7f7);
    tripwire.istripwire = 1;
    tripwire.triggered = 0;
    if (isdefined(startstruct.script_delay)) {
        tripwire.delay = startstruct.script_delay;
    } else {
        tripwire.delay = math::factor_value(0.1, 0.35, tripwire getnormtripwirelength());
    }
    /#
        if (getdvarint(@"hash_7c66efa464d04274", 0) != 0) {
            thread namespace_f2ffc0540883e1ad::drawline(tripwire.origin, var_c0ee4d060004600b, 99999, (1, 0, 0));
        }
    #/
    return tripwire;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150f
// Size: 0xf1
function inittripwireanims(animname) {
    if (!isdefined(animname)) {
        /#
            assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
        #/
    }
    self.triggeranim = gettripwiretriggeranim(animname);
    self.stretchanim = gettripwirestretchanim(animname);
    self setanim(self.triggeranim, 1, 0, 0);
    self setanim(self.stretchanim, 1, 0, 0);
    if (self.length < 10 || self.length > 300) {
        /#
            assertmsg("tripwire at location " + self.origin + " must be between " + 10 + " and " + 300 + " units apart.");
        #/
    }
    if (getdvarint(@"hash_492741ff5b4afd4a", 0)) {
        thread function_3aebddc8d6a5a470(getnormtripwirelength());
    } else {
        self setanimtime(self.stretchanim, getnormtripwirelength());
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1607
// Size: 0x2f
function inittripwirestaticmodel(animname) {
    if (!isdefined(animname)) {
        /#
            assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
        #/
    }
    self.staticmodel = gettripwirestaticmodel(animname);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163d
// Size: 0x31
function gettripwiretriggersound(var_d70a4921808926e2) {
    if (var_d70a4921808926e2) {
        return "tripwire_pop_first";
    } else if (hastripwirechild()) {
        return "tripwire_pop";
    } else {
        return "tripwire_pop_last";
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1675
// Size: 0x72
function tripwirethink() {
    self endon("tripwire_trigger");
    self endon("death");
    self.trigger endon("death");
    while (1) {
        who = self.trigger waittill("trigger");
        var_d447527401b9b4a9 = 1;
        var_d70a4921808926e2 = 1;
        if (tripwireshouldtrigger(who)) {
            self notify("trigger", who);
        }
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ee
// Size: 0xb2
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
    var_c3fbb6661b91750f = create_contents(1, 0, 0, 0, 1, 1, 0, 0, 1);
    trace = ray_trace_ents(self.origin, self.endpoint, who, var_c3fbb6661b91750f);
    if (!isdefined(trace["fraction"])) {
        return 0;
    }
    if (trace["fraction"] < 1) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a7
// Size: 0x2b0
function buildtripwiretrap(struct, var_aa6923872cf5d7bb) {
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
    struct.trap.parenttripwires = array_add(struct.trap.parenttripwires, var_aa6923872cf5d7bb);
    return struct.trap;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5f
// Size: 0x36a
function function_3aebddc8d6a5a470(var_cdcac684a1dbc685) {
    var_b93fbb948fda0f7c = 0.2;
    var_95206942f9c28aa5 = 0.4;
    var_f868a88235cac998 = 0.6;
    var_177ccdb7ce1114fd = 0.8;
    var_87744ff4b9f7472e = [];
    var_87744ff4b9f7472e[var_87744ff4b9f7472e.size] = function_8f1b1ef7b8a59eb7();
    if (var_cdcac684a1dbc685 > var_b93fbb948fda0f7c) {
        var_87744ff4b9f7472e[var_87744ff4b9f7472e.size] = function_8f1b1ef7b8a59eb7();
    }
    if (var_cdcac684a1dbc685 > var_95206942f9c28aa5) {
        var_87744ff4b9f7472e[var_87744ff4b9f7472e.size] = function_8f1b1ef7b8a59eb7();
    }
    if (var_cdcac684a1dbc685 > var_f868a88235cac998) {
        var_87744ff4b9f7472e[var_87744ff4b9f7472e.size] = function_8f1b1ef7b8a59eb7();
    }
    self hide();
    var_b1dba2ee7ffd4131 = var_cdcac684a1dbc685 * 2.23;
    waittime = math::factor_value(1, 300, var_b1dba2ee7ffd4131);
    waittime = waittime * 0.05;
    var_75a5138b4feac645 = "tripwireStretchAnimTime";
    var_6b86dc130a1fa946 = anglestoforward(self.angles);
    var_63a301303b3b2934 = anglestoup(self.angles);
    var_c8292d490a70d031 = vectorcross(var_6b86dc130a1fa946, var_63a301303b3b2934);
    var_3c86ad8a86338503 = self.origin + var_c8292d490a70d031 * 100 - self.origin;
    var_d1389d74dfdce48e = self.origin + var_63a301303b3b2934 * 100 - self.origin;
    vec1 = vectornormalize(var_d1389d74dfdce48e);
    vec2 = vectornormalize((0, 0, 1));
    var_c5f68cdf7b9421d9 = math::anglebetweenvectors(vec1, vec2);
    var_c5f68cdf7b9421d9 = anglebetweenvectorssigned(vec1, vec2, vectornormalize(var_3c86ad8a86338503));
    var_64d53bb94497f357 = var_3c86ad8a86338503[0] + 90 > 0;
    foreach (part in var_87744ff4b9f7472e) {
        part scriptmodelplayanim(script_model%tripwire_trigger_standard_stretch, var_75a5138b4feac645, 0, 0.01);
    }
    function_83ecc93f05088653(waittime);
    foreach (part in var_87744ff4b9f7472e) {
        part scriptmodelpauseanim(1);
        part rotateto(vectortoangles(var_c8292d490a70d031), 0.1, 0.05, 0.05);
    }
    function_83ecc93f05088653(0.15);
    foreach (part in var_87744ff4b9f7472e) {
        part rotateroll(var_c5f68cdf7b9421d9 * -1, 3, 1, 1);
    }
    waittill_any_2("tripwire_trigger", "tripwire_defused");
    foreach (part in var_87744ff4b9f7472e) {
        part delete();
    }
    self show();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dd0
// Size: 0x47
function function_8f1b1ef7b8a59eb7() {
    var_b107426ca7117029 = spawn("script_model", self.origin);
    var_b107426ca7117029.angles = self.angles;
    var_b107426ca7117029 setmodel(self.model);
    return var_b107426ca7117029;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e1f
// Size: 0x17
function getnormtripwirelength() {
    return math::normalize_value(10, 300, self.length);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e3e
// Size: 0x36
function function_83ecc93f05088653(durationseconds) {
    level endon("game_ended");
    var_48974a7856f3cbaa = 0;
    while (var_48974a7856f3cbaa < durationseconds) {
        var_48974a7856f3cbaa = var_48974a7856f3cbaa + level.framedurationseconds;
        waitframe();
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7b
// Size: 0x73
function tripwirehastraps() {
    foreach (target in self.targets) {
        if (isdefined(target.istrap) && !isdefined(target.triggered)) {
            return 1;
        }
    }
    return 0;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef6
// Size: 0x84
function triggertripwirefuncthink(triggerfunc) {
    while (1) {
        var_d70a4921808926e2 = var_4482194ac72a29c0 = who = self waittill("trigger");
        if (var_4482194ac72a29c0) {
            break;
        } else if (!tripwirehastraps()) {
            break;
        }
    }
    if (isdefined(who)) {
        who.lasttriptime = gettime();
    }
    self notify("tripwire_trigger");
    self.triggered = 1;
    self [[ triggerfunc ]](who, var_4482194ac72a29c0, var_d70a4921808926e2);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f81
// Size: 0xb7
function triggertrapfuncthink(triggerfunc) {
    while (1) {
        var_4482194ac72a29c0 = who = self waittill("trigger");
        if (var_4482194ac72a29c0) {
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203f
// Size: 0x6d
function gettriggerfunc(type) {
    switch (type) {
    case #"hash_32670e2a61b99a3b":
        return &triggerfuncc4;
    case #"hash_4beeaacc1db7b8cc":
        return &triggerfuncsemtex;
    case #"hash_496a20490fb91698":
        return &triggerfuncfrag;
    default:
        /#
            assertmsg("Add a triggerFunc for trigger trap " + type + " to scriptsspequipment	ripwire::getTriggerFunc");
        #/
        break;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b3
// Size: 0xfc
function gettripwiretriggeranim(animname) {
    switch (animname) {
    case #"hash_28b4e95012259360":
        return random([0:script_model%tripwire_trigger_standard_ceiling]);
    case #"hash_3e7681464ca7b9fd":
        return random([0:script_model%tripwire_trigger_standard_floor]);
    case #"hash_bdea657441323e75":
        if (shouldusewallsize1()) {
            return random([0:script_model%tripwire_trigger_standard_wall_01]);
        } else if (shouldusewallsize2()) {
            return random([0:script_model%tripwire_trigger_standard_wall_02]);
        } else if (shouldusewallsize3()) {
            return random([0:script_model%tripwire_trigger_standard_wall_03]);
        } else if (shouldusewallsize4()) {
            return random([0:script_model%tripwire_trigger_standard_wall_04]);
        } else {
            return random([0:script_model%tripwire_trigger_standard_wall]);
        }
        break;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b6
// Size: 0x93
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2250
// Size: 0x57
function gettripwirestretchanim(animname) {
    switch (animname) {
    case #"hash_28b4e95012259360":
        return script_model%tripwire_trigger_standard_stretch;
    case #"hash_3e7681464ca7b9fd":
        return script_model%tripwire_trigger_standard_stretch;
    case #"hash_bdea657441323e75":
        return script_model%tripwire_trigger_standard_stretch;
        break;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ae
// Size: 0x76
function gettripwiremodel(animname) {
    if (!isdefined(animname)) {
        /#
            assertmsg("tripwire struct found with missing script_animname KVP.  Reopen your map, save, and compile only ents to fix");
        #/
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
        break;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232b
// Size: 0x1f
function shouldusewallsize1() {
    return self.length >= 51 && self.length < 69;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2352
// Size: 0x1f
function shouldusewallsize2() {
    return self.length >= 69 && self.length < 100;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2379
// Size: 0x1f
function shouldusewallsize3() {
    return self.length > 10 && self.length < 37;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a0
// Size: 0x1f
function shouldusewallsize4() {
    return self.length >= 37 && self.length < 51;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c7
// Size: 0x173
function triggerfunctripwire(who, var_d447527401b9b4a9, var_d70a4921808926e2) {
    if (isdefined(self.trigger) && isent(self.trigger)) {
        self.trigger delete();
    }
    self setanimrate(self.triggeranim, 1);
    self setanim(script_model%tripwire_stretch_overlay, 0, 0.2, 1);
    thread swaptostaticmodel();
    self playsound("tripwire_pop");
    var_ffbad4b01f6fc4ce = gettripwiretriggersound(var_d70a4921808926e2);
    if (isdefined(self.finalangles)) {
        thread rotatetofinalangles();
    }
    if (isplayer(who)) {
        who playrumbleonentity("damage_light");
        earthquake(0.1, 0.2, who.origin, 2000);
    }
    wait(self.delay);
    if (isdefined(self.navmodifier)) {
        destroynavobstacle(self.navmodifier);
    }
    var_d70a4921808926e2 = 0;
    if (isdefined(self.targets)) {
        foreach (target in self.targets) {
            target notify("trigger", who);
        }
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2541
// Size: 0x25
function rotatetofinalangles() {
    self endon("death");
    wait(0.25);
    self rotateto(self.finalangles, 0.25);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256d
// Size: 0x35
function swaptostaticmodel() {
    self endon("death");
    animtime = getanimlength(self.triggeranim);
    wait(animtime);
    self setmodel(self.staticmodel);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a9
// Size: 0x6d
function delete_trapfunc() {
    var_109c02356ef49223 = 1;
    foreach (var_aa6923872cf5d7bb in self.parenttripwires) {
        var_aa6923872cf5d7bb thread triggerfunctripwire(undefined, 1, var_109c02356ef49223);
        var_109c02356ef49223 = 0;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261d
// Size: 0x10b
function triggerfuncsemtex(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadeType = self.grenadeweaponoverride;
    } else {
        grenadeType = "semtex_tripwire";
    }
    semtex = magicgrenademanual(grenadeType, self.origin, (0, 0, 0), 0.25);
    semtex.angles = self.angles;
    semtex.origin = self.origin;
    semtex linkto(self);
    self hide();
    semtex waittill("explode");
    radiusdamage(self.origin, 384, 256, 40, undefined, "MOD_EXPLOSIVE", "semtex_mp");
    playrumbleonposition("grenade_rumble", self.origin);
    earthquake(0.45, 0.7, self.origin, 800);
    wait(0.1);
    self notify("cancel_death_hint");
    self delete();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272f
// Size: 0x144
function triggerfuncfrag(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadeType = self.grenadeweaponoverride;
    } else {
        grenadeType = "frag_tripwire";
    }
    frag = magicgrenademanual(grenadeType, self.origin, (0, 0, 0), 0.25);
    frag.angles = self.angles;
    frag.origin = self.origin;
    frag linkto(self);
    self hide();
    frag waittill("explode");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "damageFunc")) {
        var_ee6983a991436671 = namespace_3c37cb17ade254d::getsharedfunc("tripwire", "damageFunc");
        level thread [[ var_ee6983a991436671 ]](self, who);
    } else {
        radiusdamage(self.origin, 384, 256, 40, undefined, "MOD_EXPLOSIVE", "frag_grenade_mp");
        playrumbleonposition("grenade_rumble", self.origin);
        earthquake(0.45, 0.7, self.origin, 800);
    }
    wait(0.1);
    self notify("cancel_death_hint");
    self delete();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x287a
// Size: 0x16d
function triggerfuncc4(who) {
    if (isdefined(self.grenadeweaponoverride)) {
        grenadeType = self.grenadeweaponoverride;
    } else {
        grenadeType = "c4_mp";
    }
    c4 = magicgrenademanual(grenadeType, self.origin, (0, 0, 0), 0.25);
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ee
// Size: 0x258
function damagetrapfuncthink(damageFunc, struct) {
    self endon("trap_trigger");
    self setcandamage(1);
    self.health = 99999;
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = type = point = direction_vec = attacker = damage = self waittill("damage");
        if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "blowTripWire")) {
            self thread [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "blowTripWire") ]](attacker, type);
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "canTripTrap")) {
            var_ee6983a991436671 = namespace_3c37cb17ade254d::getsharedfunc("tripwire", "canTripTrap");
            if (self [[ var_ee6983a991436671 ]](attacker, objweapon, type, damage, point)) {
                break;
            }
        } else if (cantriptrap(attacker, type, damage)) {
            break;
        }
        self.health = self.health + damage;
    }
    self.triggered = 1;
    if (isdefined(self.defusehintstruct) && !isdefined(self.defusehintstruct.defused)) {
        if (isent(self.defusehintstruct)) {
            self.defusehintstruct makeunusable();
            self.defusehintstruct delete();
        }
    }
    var_d447527401b9b4a9 = 0;
    var_d70a4921808926e2 = 1;
    self makeunusable();
    foreach (var_aa6923872cf5d7bb in self.parenttripwires) {
        var_aa6923872cf5d7bb notify("trigger", attacker);
    }
    self notify("trigger", attacker);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4d
// Size: 0x4e
function cantriptrap(attacker, type, damage) {
    if (!isdefined(attacker)) {
        return 0;
    }
    if (isplayer(attacker) && (type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH") && damage > 150) {
        return 1;
    }
    return 0;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ca3
// Size: 0x1d8
function disarmfuncthink(disarmfunc, struct) {
    self endon("trap_trigger");
    if (isdefined(struct.radius)) {
        var_7c46ca1bdcc9e980 = struct.radius;
    } else {
        var_7c46ca1bdcc9e980 = 128;
    }
    var_10653a9b07ee3ece = (0, 0, 0);
    self.defusehintstruct = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "createHintObject")) {
        var_ee6983a991436671 = namespace_3c37cb17ade254d::getsharedfunc("tripwire", "createHintObject");
        self.defusehintstruct = [[ var_ee6983a991436671 ]](struct.origin, undefined, undefined, undefined, undefined, "duration_medium", "hide", 128, 35, 84, 35);
    } else {
        self.defusehintstruct = struct spawn_script_origin();
    }
    self.deletefunc = &delete_trapfunc;
    who = self.defusehintstruct waittill("trigger");
    level.lasttripwiredefusedtime = gettime();
    self.defusehintstruct.defused = 1;
    self.triggered = 1;
    var_d447527401b9b4a9 = 0;
    var_d70a4921808926e2 = 1;
    if (isent(self.defusehintstruct)) {
        self.defusehintstruct makeunusable();
        self.defusehintstruct delete();
    }
    foreach (var_aa6923872cf5d7bb in self.parenttripwires) {
        var_aa6923872cf5d7bb notify("trigger", who);
    }
    self [[ disarmfunc ]](who);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e82
// Size: 0x5b
function getdisarmfunc(type) {
    switch (type) {
    case #"hash_4beeaacc1db7b8cc":
        return &disarmfuncsemtex;
    case #"hash_496a20490fb91698":
        return &disarmfuncfrag;
    default:
        /#
            assertmsg("Add a disarm func for trigger trap " + type + " to scriptscp_mp	ripwire::getDisarmFunc");
        #/
        break;
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee4
// Size: 0x37
function disarmfuncsemtex(who) {
    who disarmgiveweapon("semtex", "semtex", self.origin, self.angles);
    self delete();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f22
// Size: 0x37
function disarmfuncfrag(who) {
    who disarmgiveweapon("frag", "frag", self.origin, self.angles);
    self delete();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f60
// Size: 0x5c
function disarmgiveweapon(weapon, var_a1093166de09e6b8, grenade_origin, var_40559a644f5cc3e6) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "disarmGiveWeapon")) {
        var_ee6983a991436671 = namespace_3c37cb17ade254d::getsharedfunc("tripwire", "disarmGiveWeapon");
        thread [[ var_ee6983a991436671 ]](weapon, var_a1093166de09e6b8, self, grenade_origin, var_40559a644f5cc3e6);
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc3
// Size: 0x98
function function_391d956c772fb03f() {
    precachetrap("tripwire_trap_frag", "offhand_2h_wm_grenade_frag_v0", 1);
    precachetrap("tripwire_trap_semtex", "offhand_2h_wm_grenade_semtex_v0", 1);
    precachetrap("tripwire_trap_c4", "offhand_2h_wm_c4_v0", 0);
    if (!isdefined(level.var_46f13cac76d49010)) {
        level.var_46f13cac76d49010 = "frag_grenade_mp";
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "sort")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "sort") ]]();
    }
    /#
        setdvar(@"hash_c6241d315c0f6bcf", 0);
        level thread function_b96a88fafd4943c5();
    #/
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3062
// Size: 0xe4
function function_41e381609b6ab0(var_ffcaa31c31962d79) {
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("trap_device", &function_6cae226462403bcc);
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

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314d
// Size: 0x67
function function_186d7ac95077704b(tripwire, ownerteam, var_d869b554ad530397) {
    tripwire function_e532c2521845ce4a(ownerteam, var_d869b554ad530397);
    tripwire thread function_4d63a162b2fb4275();
    tripwire.enabled = 1;
    level.tripwires.tripwires[level.tripwires.tripwires.size] = tripwire;
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31bb
// Size: 0x12e
function function_56fd20503d89eed8(tripwire) {
    tripwire.enabled = 0;
    /#
        assertex(isdefined(tripwire.targetarray), "Tripwire has an invalid target array");
    #/
    foreach (item in tripwire.targetarray) {
        if (item getscriptablehaspart("trap_device")) {
            item setscriptablepartstate("trap_device", "off");
        } else if (item.classname == "scriptable_dmz_tripwire" || item.classname == "scriptable_ob_tripwire") {
            item setscriptablepartstate("wire", "off");
        } else if (item getscriptablehaspart("wall_pin")) {
            item setscriptablepartstate("wall_pin", "invisible");
        } else {
            /#
                assertmsg("Error, unsupported tripwire Scriptable detected " + tripwire.origin);
            #/
        }
    }
    tripwire setscriptablepartstate("wire", "off");
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f0
// Size: 0x4cc
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
    tripwire.var_fa02bb233fa52688 = undefined;
    scriptablename = undefined;
    var_303f68b800b31d41 = [];
    foreach (item in tripwire.targetarray) {
        if (item getscriptablehaspart("trap_device")) {
            tripwire.var_fa02bb233fa52688 = item;
            tripwire.var_fa02bb233fa52688.tripwire = tripwire;
            scriptablename = getsubstr(tripwire.var_fa02bb233fa52688.classname, 11);
        } else if (item.classname == "scriptable_dmz_tripwire" || item.classname == "scriptable_ob_tripwire") {
            item setscriptablepartstate("wire", "wire_taut");
            tripwire.var_1fe6421c9bcd4d80 = item;
            var_c2306c15ef050dfc = 15;
        } else if (item getscriptablehaspart("wall_pin")) {
            item setscriptablepartstate("wall_pin", "visible", 1);
            var_303f68b800b31d41[var_303f68b800b31d41.size] = item.origin;
        } else {
            /#
                assertmsg("Error, unsupported tripwire Scriptable detected " + tripwire.origin);
            #/
        }
    }
    tripwire.var_fa02bb233fa52688 setscriptablepartstate("trap_device", "active");
    var_302b1852ac0137d4 = var_303f68b800b31d41.size == 2;
    var_d5b2a103934621f3 = 5;
    var_b1a278451f610d5a = -1 * anglestoup(tripwire.angles);
    var_b1a264451f60e15e = anglestoright(tripwire.angles);
    var_b1a267451f60e7f7 = anglestoforward(tripwire.angles);
    var_7852b784ec732557 = tripwire.length + var_c2306c15ef050dfc;
    var_cd57a8054e93d237 = tripwire.origin - var_c2306c15ef050dfc * var_b1a267451f60e7f7;
    if (var_302b1852ac0137d4) {
        var_802d90d64037ba83 = var_303f68b800b31d41[0] - var_303f68b800b31d41[1];
        tripwire.length = length(var_802d90d64037ba83);
        var_7852b784ec732557 = tripwire.length;
        var_cd57a8054e93d237 = tripwire.origin;
    }
    tripwire.trigger = spawn("trigger_rotatable_radius", var_cd57a8054e93d237, 0, var_d5b2a103934621f3, var_7852b784ec732557);
    tripwire.trigger.angles = axistoangles(var_b1a278451f610d5a, var_b1a264451f60e15e, var_b1a267451f60e7f7);
    var_4a2359165feb7717 = tripwire.origin + var_b1a267451f60e7f7 * 32;
    var_248f2537e91d1766 = (40, 30, 64 + var_c2306c15ef050dfc);
    if (var_302b1852ac0137d4) {
        var_4a2359165feb7717 = tripwire.origin + var_b1a267451f60e7f7 * tripwire.length * 0.5;
        var_d3e09f5f7bbb6484 = getdvarint(@"hash_b20f014ff8301b42", 4);
        var_437c30771383edb0 = getdvarint(@"hash_b64fa5855f75fdb5", 7);
        var_dc33914a50fc9820 = getdvarint(@"hash_9950ea4c303f6053", 10);
        var_35e885a65f4c35f = tripwire.length * 0.5;
        var_248f2537e91d1766 = (var_35e885a65f4c35f + var_d3e09f5f7bbb6484, var_437c30771383edb0, var_dc33914a50fc9820);
    }
    /#
        if (getdvarint(@"hash_7c66efa464d04274", 0) != 0) {
            thread namespace_f2ffc0540883e1ad::drawsphere(var_4a2359165feb7717, 10, 600, (0, 1, 0));
        }
    #/
    if (isdefined(var_8eca5bdf48ccf8e6)) {
        tripwire.navobstacleid = createnavbadplacebybounds(var_4a2359165feb7717, var_248f2537e91d1766, tripwire.angles, var_8eca5bdf48ccf8e6);
    } else {
        tripwire.navobstacleid = createnavobstaclebybounds(var_4a2359165feb7717, var_248f2537e91d1766, tripwire.angles);
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "onTripwireCreate")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "onTripwireCreate") ]](tripwire);
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c3
// Size: 0x3c
function function_4d63a162b2fb4275() {
    tripwire = self;
    tripwire endon("tripwire_defused");
    var_2d9552508615d396 = tripwire.trigger waittill("trigger");
    function_fb4b4fa0cee578bd(var_2d9552508615d396, tripwire);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3806
// Size: 0x206
function function_fb4b4fa0cee578bd(var_2d9552508615d396, tripwire) {
    if (istrue(tripwire.triggered)) {
        return;
    }
    tripwire.triggered = 1;
    if (isdefined(tripwire.var_1fe6421c9bcd4d80)) {
        tripwire.var_1fe6421c9bcd4d80 setscriptablepartstate("wire", "wire_snap");
        tripwire setscriptablepartstate("wire", "off");
    } else {
        tripwire setscriptablepartstate("wire", "wire_snap");
    }
    tripwire.var_fa02bb233fa52688 setscriptablepartstate("trap_device", "off");
    var_15e599da51a42fc2 = "frag_tripwire";
    if (isdefined(tripwire.script_parameters)) {
        var_15e599da51a42fc2 = tripwire.script_parameters;
    } else if (isdefined(tripwire.var_70587812595fd991) && tripwire.var_70587812595fd991 != "") {
        var_15e599da51a42fc2 = tripwire.var_70587812595fd991;
    }
    frag = magicgrenademanual(var_15e599da51a42fc2, tripwire.var_fa02bb233fa52688.origin, (0, 0, 0), 0.25);
    frag waittill("explode");
    if (isdefined(tripwire.script_parameters) && namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", tripwire.script_parameters)) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", tripwire.script_parameters) ]](var_2d9552508615d396, tripwire);
    } else if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "tripwire_override")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "tripwire_override") ]](var_2d9552508615d396, tripwire);
    } else {
        function_5edfa6cc73a7922d(tripwire);
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "onTripwireTriggered")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "onTripwireTriggered") ]](var_2d9552508615d396, tripwire);
    }
    wait(0.1);
    destroynavobstacle(tripwire.navobstacleid);
    tripwire.trigger delete();
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a13
// Size: 0x96
function function_5edfa6cc73a7922d(tripwire) {
    level.var_cbe618f35b332990 radiusdamage(tripwire.var_fa02bb233fa52688.origin, 384, 200, 40, level.var_cbe618f35b332990, "MOD_GRENADE", level.var_46f13cac76d49010);
    playrumbleonposition("grenade_rumble", tripwire.var_fa02bb233fa52688.origin);
    earthquake(0.45, 0.7, tripwire.var_fa02bb233fa52688.origin, 800);
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ab0
// Size: 0x228
function function_6cae226462403bcc(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (part == "trap_device") {
        instance setscriptablepartstate("trap_device", "off");
        if (isdefined(instance.tripwire.var_1fe6421c9bcd4d80)) {
            instance.tripwire.var_1fe6421c9bcd4d80 setscriptablepartstate("wire", "wire_snap");
            instance.tripwire setscriptablepartstate("wire", "off");
        } else {
            instance.tripwire setscriptablepartstate("wire", "wire_snap");
        }
        instance.tripwire notify("tripwire_defused");
        if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "onTripwireDefused")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "onTripwireDefused") ]](player, instance.tripwire);
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
        if (namespace_3c37cb17ade254d::issharedfuncdefined("tripwire", "createLootDropInfo", 0)) {
            var_cb4fad49263e20c4 = [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "createLootDropInfo") ]](instance.origin, instance.angles, undefined, 0, 0, undefined, 1);
            [[ namespace_3c37cb17ade254d::getsharedfunc("tripwire", "spawnPickup") ]](var_259b17a170041609, var_cb4fad49263e20c4, 1, 1);
        }
    }
}

// Namespace tripwire/namespace_5a43e3b1b17bfdcc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cdf
// Size: 0x2db
function function_b96a88fafd4943c5() {
    /#
        level endon("trigger_rotatable_radius");
        tripwires = getentitylessscriptablearray("trigger", "detonateExplosive");
        var_49a4b116c64a17ed = (0, 1, 0);
        var_1bd5dd27c8cbfc94 = (1, 0, 0);
        var_7b32db7c7f51bac5 = (0, 0, 1);
        while (1) {
            if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 1) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.enabled)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_49a4b116c64a17ed);
                    }
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 2) {
                foreach (tripwire in tripwires) {
                    if (!istrue(tripwire.enabled)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_1bd5dd27c8cbfc94);
                    }
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 3) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.triggered) || istrue(tripwire.var_71dd48e6c8570392)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_7b32db7c7f51bac5);
                    } else if (istrue(tripwire.enabled)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_49a4b116c64a17ed);
                    } else {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_1bd5dd27c8cbfc94);
                    }
                }
            } else if (getdvarint(@"hash_c6241d315c0f6bcf", 0) == 4) {
                foreach (tripwire in tripwires) {
                    if (istrue(tripwire.triggered) || istrue(tripwire.var_71dd48e6c8570392)) {
                        thread namespace_f2ffc0540883e1ad::drawsphere(tripwire.origin, 32, 1, var_7b32db7c7f51bac5);
                    }
                }
            }
            wait(1);
        }
    #/
}

