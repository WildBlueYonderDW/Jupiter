// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace callouts;

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6
// Size: 0x2a9
function init() {
    level.calloutglobals = spawnstruct();
    var_9a187ca43f4254c1 = getdvarint(@"hash_7e7742c1722382ad", 1);
    if (var_9a187ca43f4254c1) {
        var_24d0a40e728d8e62 = function_10007861f7386ad8();
        var_50ce8fef23b3faa8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + ".csv";
        var_71813f0216c57db8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + "_" + var_24d0a40e728d8e62 + ".csv";
        function_ce75c09cff4c1efb(var_71813f0216c57db8, var_50ce8fef23b3faa8, 1);
    }
    level.calloutglobals.var_41e0068712e63739 = var_9a187ca43f4254c1 && function_afcbc7a4eac55f9e(1);
    if (!level.calloutglobals.var_41e0068712e63739) {
        if (getdvarint(@"hash_aa26c2e5021f3cfc") && getdvarint(@"hash_aa26c2e5021f3cfc")) {
            var_aba6558851409d7d = function_79404c2fcca1c184();
            if (isdefined(var_aba6558851409d7d)) {
                level.calloutglobals.var_a01735389a5d70d7 = [];
                for (idx = 0; idx < var_aba6558851409d7d.var_a01735389a5d70d7.size; idx++) {
                    level.calloutglobals.var_a01735389a5d70d7 = array_add(level.calloutglobals.var_a01735389a5d70d7, var_aba6558851409d7d.var_a01735389a5d70d7[idx].var_cf0d4d8cc5ac99a4);
                }
            } else {
                /#
                    println("<unknown string>");
                #/
            }
        } else if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_4cf37c2e28b33e1f)) {
            level.calloutglobals.callouttable = level.var_1a2b600a06ec21f4.var_4cf37c2e28b33e1f + level.mapname + "_callouts.csv";
        } else {
            level.calloutglobals.callouttable = "mp/map_callouts/" + level.mapname + "_callouts.csv";
        }
    }
    function_2249b7a6c9367c61();
    if (!level.calloutglobals.var_41e0068712e63739 && !isdefined(level.calloutglobals.var_a01735389a5d70d7) && !isdefined(level.calloutglobals.callouttable)) {
        return;
    }
    function_953aac55917212f6();
    if (namespace_36f464722d326bbe::isBRStyleGameType() && getdvarint(@"hash_e4187d1543c7477e", 0) == 0) {
        return;
    }
    function_46502299a0d096ef();
    thread monitorplayers();
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a6
// Size: 0x45
function private function_2249b7a6c9367c61() {
    var_584994fab4a8712b = level.calloutglobals;
    var_584994fab4a8712b.var_715bd89e6082150f = [];
    var_584994fab4a8712b.areaidmap = [];
    var_584994fab4a8712b.areaidmap["none"] = -1;
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f2
// Size: 0x2f1
function private function_953aac55917212f6() {
    var_584994fab4a8712b = level.calloutglobals;
    if (var_584994fab4a8712b.var_41e0068712e63739) {
        var_96e38bcf1337d181 = function_c3d63e6778e39f83(1);
        for (var_303ce5a5cea462cd = 0; var_303ce5a5cea462cd < var_96e38bcf1337d181; var_303ce5a5cea462cd++) {
            site = function_d0ed84c86e823a7c(1, var_303ce5a5cea462cd);
            region = function_7fdd7f9d54666e5f(1, site.region);
            ref = region.name + " site_" + var_303ce5a5cea462cd;
            /#
                assertex(!isdefined(var_584994fab4a8712b.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice for map " + level.mapname);
            #/
            var_584994fab4a8712b.areaidmap[ref] = site.region;
            var_584994fab4a8712b.var_715bd89e6082150f[var_303ce5a5cea462cd] = ref;
        }
    } else if (isdefined(level.calloutglobals.var_a01735389a5d70d7)) {
        for (idx = 0; idx < level.calloutglobals.var_a01735389a5d70d7.size; idx++) {
            type = level.calloutglobals.var_a01735389a5d70d7[idx].type;
            if (type != "area") {
                continue;
            }
            ref = level.calloutglobals.var_a01735389a5d70d7[idx].var_e90349c02adfb3a0;
            /#
                assertex(!isdefined(var_584994fab4a8712b.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice for map " + level.mapname);
            #/
            var_584994fab4a8712b.areaidmap[ref] = idx;
        }
    } else if (isdefined(level.calloutglobals.callouttable) && tableexists(level.calloutglobals.callouttable)) {
        for (row = 0; 1; row++) {
            id = tablelookupbyrow(level.calloutglobals.callouttable, row, 0);
            if (!isdefined(id) || id == "") {
                break;
            }
            id = int(id);
            type = tablelookupbyrow(level.calloutglobals.callouttable, row, 3);
            if (type != "area") {
                continue;
            }
            ref = tablelookupbyrow(level.calloutglobals.callouttable, row, 1);
            /#
                assertex(!isdefined(var_584994fab4a8712b.areaidmap[ref]), "Callout Ref "" + ref + "" exists twice in " + level.calloutglobals.callouttable);
            #/
            var_584994fab4a8712b.areaidmap[ref] = id;
        }
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ea
// Size: 0x9c
function private function_46502299a0d096ef() {
    if (!level.calloutglobals.var_41e0068712e63739) {
        level.calloutglobals.areatriggers = getentarray("callout_area", "targetname");
        foreach (var_c1e5e178d5d956e4 in level.calloutglobals.areatriggers) {
            var_c1e5e178d5d956e4 thread function_b9da575102b3cd82();
        }
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88d
// Size: 0x7e
function private monitorplayers() {
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        player thread clearcalloutareaondeath();
        player setplayercalloutarea("none");
        if (level.gametype == "zm_rb") {
            player callback::add("zone_changed", &function_f9b1f6b7aa093270);
        }
        if (level.calloutglobals.var_41e0068712e63739) {
            player thread function_fe13722061e1576d();
        }
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x912
// Size: 0x73
function private function_b9da575102b3cd82() {
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        if (isdefined(player.owner) && isplayer(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player setplayercalloutarea(self.script_noteworthy, self);
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x98c
// Size: 0x120
function private function_fe13722061e1576d() {
    /#
        assert(level.calloutglobals.var_41e0068712e63739);
    #/
    level endon("game_ended");
    self endon("death_or_disconnect");
    player = self;
    var_584994fab4a8712b = level.calloutglobals;
    clientnum = player getentitynumber();
    while (gettime() / level.frameduration % 5 != clientnum % 5) {
        waitframe();
    }
    while (1) {
        var_303ce5a5cea462cd = function_3db4b97c31efed0b(1, player.origin);
        ref = "none";
        if (isdefined(var_303ce5a5cea462cd)) {
            ref = var_584994fab4a8712b.var_715bd89e6082150f[var_303ce5a5cea462cd];
        }
        var_49996ebebbbbf375 = var_584994fab4a8712b.areaidmap[ref];
        if (!isdefined(player.calloutarea) || var_49996ebebbbbf375 != var_584994fab4a8712b.areaidmap[player.calloutarea]) {
            player setplayercalloutarea(ref);
        }
        wait(level.framedurationseconds * 5);
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab3
// Size: 0x1c7
function setplayercalloutarea(var_e90349c02adfb3a0, trigger) {
    if (!isdefined(var_e90349c02adfb3a0)) {
        return;
    }
    if (isdefined(self.calloutarea) && self.calloutarea == var_e90349c02adfb3a0) {
        return;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (isdefined(self.calloutarea) && var_e90349c02adfb3a0 != "none" && self.calloutarea != "none") {
            return;
        }
    }
    self.calloutarea = var_e90349c02adfb3a0;
    if (isdefined(trigger)) {
        thread watchplayerleavingcalloutarea(trigger, trigger.script_noteworthy);
    }
    var_49996ebebbbbf375 = level.calloutglobals.areaidmap[var_e90349c02adfb3a0];
    if (isdefined(var_49996ebebbbbf375)) {
        self setclientomnvar("ui_callout_area_id", var_49996ebebbbbf375);
        if (istrue(level.codcasterenabled)) {
            var_721982228624d657 = get_players_watching(1, 0);
            foreach (spectator in var_721982228624d657) {
                if (spectator iscodcaster()) {
                    spectator setclientomnvar("ui_callout_area_id", var_49996ebebbbbf375);
                }
            }
        }
    } else if (var_e90349c02adfb3a0 != "none") {
        if (level.calloutglobals.var_41e0068712e63739 || getdvarint(@"hash_aa26c2e5021f3cfc")) {
            /#
                assertmsg("Callout Area "" + var_e90349c02adfb3a0 + "" has no entry in for map " + level.mapname);
            #/
        } else {
            /#
                assertmsg("Callout Area "" + var_e90349c02adfb3a0 + "" has no entry in " + level.calloutglobals.callouttable);
            #/
        }
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc81
// Size: 0x4f
function private watchplayerleavingcalloutarea(var_c1e5e178d5d956e4, var_e90349c02adfb3a0) {
    self endon("death_or_disconnect");
    while (1) {
        if (self.calloutarea != var_e90349c02adfb3a0) {
            return;
        }
        if (!self istouching(var_c1e5e178d5d956e4)) {
            setplayercalloutarea("none");
            return;
        }
        wait(0.5);
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcd7
// Size: 0x26
function private clearcalloutareaondeath() {
    self endon("disconnect");
    while (1) {
        self waittill("death");
        setplayercalloutarea("none");
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd04
// Size: 0x5d
function function_f9b1f6b7aa093270(params) {
    if (isdefined(params.var_5bfc552f3ce3c73d) && isdefined(params.var_5bfc552f3ce3c73d.display_name)) {
        setplayercalloutarea("none");
        setplayercalloutarea(params.var_5bfc552f3ce3c73d.display_name);
    }
}

// Namespace callouts/namespace_8554064ba5e7d07
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68
// Size: 0x11d
function function_45d5ee5f369ad604(object) {
    /#
        assert(isdefined(object.origin));
    #/
    var_584994fab4a8712b = level.calloutglobals;
    ref = "none";
    if (var_584994fab4a8712b.var_41e0068712e63739) {
        var_303ce5a5cea462cd = function_3db4b97c31efed0b(1, object.origin);
        if (isdefined(var_303ce5a5cea462cd)) {
            ref = var_584994fab4a8712b.var_715bd89e6082150f[var_303ce5a5cea462cd];
        }
    } else if (isdefined(level.calloutglobals.areatriggers)) {
        foreach (var_c1e5e178d5d956e4 in level.calloutglobals.areatriggers) {
            if (object istouching(var_c1e5e178d5d956e4)) {
                ref = var_c1e5e178d5d956e4.script_noteworthy;
                break;
            }
        }
    }
    return var_584994fab4a8712b.areaidmap[ref];
}

