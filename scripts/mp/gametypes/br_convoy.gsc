// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\cp_mp\parachute.gsc;

#namespace br_convoy;

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x363
// Size: 0x16
function unimogtest(c130pathstruct) {
    level thread spawntestconvoy(c130pathstruct);
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x380
// Size: 0x16
function unimogsnatch(c130pathstruct) {
    level thread spawnspreadconvoy(c130pathstruct);
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x39d
// Size: 0x2ec
function spawntestconvoy(c130pathstruct) {
    level.br_convoytrucks = [];
    paths = getvehiclenodearray("br_convoy", "targetname");
    var_4d4d20d31099d146 = [];
    for (i = 0; i < paths.size; i++) {
        var_4d4d20d31099d146[i] = paths[i];
    }
    mapcenter = (level.br_level.br_mapbounds[0] + level.br_level.br_mapbounds[1]) * 0.5;
    var_252e739bc4f9bf6a = c130pathstruct.startpt - mapcenter;
    var_d2392c09df33a38f = vectortoangles(var_252e739bc4f9bf6a)[1];
    var_4a1a4bec206cbba2 = [];
    for (i = 0; i < paths.size; i++) {
        var_6c192636cdb64a8 = var_4d4d20d31099d146[i].origin - mapcenter;
        var_4a1a4bec206cbba2[i] = vectortoangles(var_6c192636cdb64a8)[1];
    }
    var_85ab47ef7f70892e = -1;
    var_76714bf77c396ac3 = -1;
    for (i = 0; i < paths.size; i++) {
        if (var_d2392c09df33a38f < var_4a1a4bec206cbba2[i]) {
            var_76714bf77c396ac3 = i;
        } else if (var_76714bf77c396ac3 != -1) {
            break;
        }
    }
    for (i = 0; i < paths.size; i++) {
        if (var_d2392c09df33a38f > var_4a1a4bec206cbba2[i]) {
            var_85ab47ef7f70892e = i;
        } else if (var_85ab47ef7f70892e != -1) {
            break;
        }
    }
    if (var_85ab47ef7f70892e == -1) {
        var_85ab47ef7f70892e = paths.size - 1;
    }
    if (var_76714bf77c396ac3 == -1) {
        var_76714bf77c396ac3 = 0;
    }
    /#
        println("halo_jump_c130" + var_85ab47ef7f70892e + "<unknown string>" + var_76714bf77c396ac3);
        println("<unknown string>" + var_4a1a4bec206cbba2[var_85ab47ef7f70892e] + "<unknown string>" + var_4a1a4bec206cbba2[var_76714bf77c396ac3]);
        for (i = 0; i < var_4a1a4bec206cbba2.size; i++) {
            println("<unknown string>" + i + "<unknown string>" + var_4a1a4bec206cbba2[i]);
        }
    #/
    var_3dd1974e56ef9f1c = 1;
    var_aa14662cae8d6def = [0:var_85ab47ef7f70892e, 1:var_76714bf77c396ac3];
    for (i = 0; i < var_3dd1974e56ef9f1c; i++) {
        if (var_85ab47ef7f70892e - 1 - i <= 0) {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = paths.size - 1 - i;
        } else {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = var_85ab47ef7f70892e - 1 - i;
        }
        if (var_76714bf77c396ac3 + 1 + i >= paths.size) {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = 0;
        } else {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = var_76714bf77c396ac3 + 1 + i;
        }
        /#
            println("<unknown string>" + var_aa14662cae8d6def[var_aa14662cae8d6def.size - 1] + "<unknown string>" + var_4a1a4bec206cbba2[var_aa14662cae8d6def[var_aa14662cae8d6def.size - 1]]);
        #/
    }
    /#
        for (i = 0; i < var_aa14662cae8d6def.size; i++) {
            println("<unknown string>" + i + "<unknown string>" + var_aa14662cae8d6def[i]);
        }
    #/
    for (i = 0; i < var_aa14662cae8d6def.size; i++) {
        thread spawnconvoyatpath(paths[var_aa14662cae8d6def[i]]);
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x690
// Size: 0x376
function spawnspreadconvoy(c130pathstruct) {
    level.br_convoytrucks = [];
    paths = getvehiclenodearray("br_convoy", "targetname");
    var_a71474bf830da0cd = [];
    foreach (var_36809cc9ad8ce6df in paths) {
        if (distancesquared(var_36809cc9ad8ce6df.origin, (19328, 2944, 512)) < 40000) {
            var_a71474bf830da0cd[var_a71474bf830da0cd.size] = var_36809cc9ad8ce6df;
        }
    }
    paths = array_remove_array(paths, var_a71474bf830da0cd);
    var_4d4d20d31099d146 = [];
    for (i = 0; i < paths.size; i++) {
        var_4d4d20d31099d146[i] = paths[i];
    }
    mapcenter = (level.br_level.br_mapbounds[0] + level.br_level.br_mapbounds[1]) * 0.5;
    var_252e739bc4f9bf6a = c130pathstruct.startpt - mapcenter;
    var_d2392c09df33a38f = vectortoangles(var_252e739bc4f9bf6a)[1];
    var_4a1a4bec206cbba2 = [];
    for (i = 0; i < paths.size; i++) {
        var_6c192636cdb64a8 = var_4d4d20d31099d146[i].origin - mapcenter;
        var_4a1a4bec206cbba2[i] = vectortoangles(var_6c192636cdb64a8)[1];
    }
    var_85ab47ef7f70892e = -1;
    var_76714bf77c396ac3 = -1;
    for (i = 0; i < paths.size; i++) {
        if (var_d2392c09df33a38f < var_4a1a4bec206cbba2[i]) {
            var_76714bf77c396ac3 = i;
        } else if (var_76714bf77c396ac3 != -1) {
            break;
        }
    }
    for (i = 0; i < paths.size; i++) {
        if (var_d2392c09df33a38f > var_4a1a4bec206cbba2[i]) {
            var_85ab47ef7f70892e = i;
        } else if (var_85ab47ef7f70892e != -1) {
            break;
        }
    }
    if (var_85ab47ef7f70892e == -1) {
        var_85ab47ef7f70892e = paths.size - 1;
    }
    if (var_76714bf77c396ac3 == -1) {
        var_76714bf77c396ac3 = 0;
    }
    /#
        println("halo_jump_c130" + var_85ab47ef7f70892e + "<unknown string>" + var_76714bf77c396ac3);
        println("<unknown string>" + var_4a1a4bec206cbba2[var_85ab47ef7f70892e] + "<unknown string>" + var_4a1a4bec206cbba2[var_76714bf77c396ac3]);
        for (i = 0; i < var_4a1a4bec206cbba2.size; i++) {
            println("<unknown string>" + i + "<unknown string>" + var_4a1a4bec206cbba2[i]);
        }
    #/
    var_3dd1974e56ef9f1c = 4;
    var_aa14662cae8d6def = [0:var_85ab47ef7f70892e, 1:var_76714bf77c396ac3];
    for (i = 0; i < var_3dd1974e56ef9f1c; i++) {
        if (var_85ab47ef7f70892e - 1 - i <= 0) {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = paths.size - 1 - i;
        } else {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = var_85ab47ef7f70892e - 1 - i;
        }
        if (var_76714bf77c396ac3 + 1 + i >= paths.size) {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = 0;
        } else {
            var_aa14662cae8d6def[var_aa14662cae8d6def.size] = var_76714bf77c396ac3 + 1 + i;
        }
        /#
            println("<unknown string>" + var_aa14662cae8d6def[var_aa14662cae8d6def.size - 1] + "<unknown string>" + var_4a1a4bec206cbba2[var_aa14662cae8d6def[var_aa14662cae8d6def.size - 1]]);
        #/
    }
    /#
        for (i = 0; i < var_aa14662cae8d6def.size; i++) {
            println("<unknown string>" + i + "<unknown string>" + var_aa14662cae8d6def[i]);
        }
    #/
    for (i = 0; i < var_aa14662cae8d6def.size; i++) {
        thread spawnhalfconvoyatpath(paths[var_aa14662cae8d6def[i]]);
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0d
// Size: 0x130
function spawnhalfconvoyatpath(path) {
    level endon("game_ended");
    var_3f04becc4e20bd5e = 0;
    if (isdefined(path.script_noteworthy)) {
        if (path.script_noteworthy == "left") {
            var_3f04becc4e20bd5e = 1;
        }
    }
    var_40d8f3ad63c5acfd = [];
    for (j = 0; j < 2; j++) {
        truck = spawntruck(path, path.angles, var_3f04becc4e20bd5e);
        var_40d8f3ad63c5acfd[var_40d8f3ad63c5acfd.size] = truck;
        wait(1.333);
    }
    if (level.mapname == "mp_torez") {
        var_565e98c561535a89 = 3;
        var_f72adad998be7b7 = 17;
    } else {
        var_565e98c561535a89 = 15;
        var_f72adad998be7b7 = 25;
    }
    for (j = 0; j < var_40d8f3ad63c5acfd.size; j++) {
        var_40d8f3ad63c5acfd[j] vehicle_setspeedimmediate(var_565e98c561535a89, 30, 30);
    }
    wait(10);
    for (j = 0; j < var_40d8f3ad63c5acfd.size; j++) {
        var_40d8f3ad63c5acfd[j] vehicle_setspeedimmediate(var_565e98c561535a89 * 2, 30, 30);
    }
    wait(4);
    for (j = 0; j < var_40d8f3ad63c5acfd.size; j++) {
        var_40d8f3ad63c5acfd[j] vehicle_setspeedimmediate(var_f72adad998be7b7, 30, 30);
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb44
// Size: 0xca
function spawnconvoyatpath(path) {
    level endon("game_ended");
    var_3f04becc4e20bd5e = 0;
    if (isdefined(path.script_noteworthy)) {
        if (path.script_noteworthy == "left") {
            var_3f04becc4e20bd5e = 1;
        }
    }
    var_40d8f3ad63c5acfd = [];
    for (j = 0; j < 4; j++) {
        var_40d8f3ad63c5acfd[var_40d8f3ad63c5acfd.size] = spawntruck(path, path.angles, var_3f04becc4e20bd5e);
        wait(1.333);
    }
    for (j = 0; j < var_40d8f3ad63c5acfd.size; j++) {
        var_40d8f3ad63c5acfd[j] vehicle_setspeedimmediate(15, 30, 30);
    }
    wait(12);
    for (j = 0; j < var_40d8f3ad63c5acfd.size; j++) {
        var_40d8f3ad63c5acfd[j] vehicle_setspeedimmediate(25, 30, 30);
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc15
// Size: 0xc2
function spawntruck(path, var_2626580098d08ae8, left) {
    vehicle = spawnvehicle("veh8_mil_lnd_umike", "umike", "umike", path.origin, var_2626580098d08ae8);
    vehicle.animname = "umikeVeh";
    vehicle vehicle_setspeedimmediate(25, 30, 30);
    vehicle thread vehiclefollowpath(path);
    vehicle setscriptablepartstate("dustFX", "normal");
    vehicle setscriptablepartstate("exhaustFX", "active");
    level.br_convoytrucks[level.br_convoytrucks.size] = vehicle;
    vehicle.playerslots = [];
    vehicle.br_leftspawn = left;
    return vehicle;
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcdf
// Size: 0x13d
function vehiclefollowpath(var_e40dfcd45cba504f) {
    self endon("death");
    self endon("stop_follow_path");
    self startpath(var_e40dfcd45cba504f);
    self playloopsound("iw8_mp_snatch_convoy_lp");
    next_node = getvehiclenode(var_e40dfcd45cba504f.target, "targetname");
    while (isdefined(next_node)) {
        next_node waittill("trigger");
        if (!isdefined(next_node.target)) {
            break;
        }
        next_node = getvehiclenode(next_node.target, "targetname");
    }
    self vehicle_setspeed(0, 30, 30);
    vel = self vehicle_getspeed();
    while (vel > 1) {
        wait(0.1);
        vel = self vehicle_getspeed();
    }
    self stoploopsound("iw8_mp_snatch_convoy_lp");
    self stoploopsound("veh_technical_temp_surface");
    level notify("infil_locked");
    thread kickanyremainingplayers();
    wait(3);
    staticmodel = spawn("script_model", self.origin);
    staticmodel setmodel("veh8_mil_lnd_umike_static_allied");
    staticmodel.angles = self.angles;
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objid);
    self delete();
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe23
// Size: 0x16b
function spawnplayertoconvoy() {
    if (isalive(self)) {
        if (!isdefined(self.didnotselectclassintime)) {
            if (!namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                return;
            }
        }
        if (level.teambased) {
            playerteam = getteamdata(self.team, "players");
        } else {
            playerteam = [0:self];
        }
        foreach (player in playerteam) {
            player notify("cancel_c130");
            player notify("cancel_heli");
            player unlink();
            if (!isdefined(player.br_truck)) {
                player.br_truck = getnexttruckwithroom(player.team);
                player.br_truck.playerslots[player.br_truck.playerslots.size] = player;
            }
            truck = player.br_truck;
            player.angles = truck.angles;
            if (!isdefined(truck.showonminimap)) {
                truck showicon();
                truck.showonminimap = 1;
            }
            player thread jumplistener(truck);
        }
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf95
// Size: 0x51
function jumplistener(truck) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_convoy");
    self endon("br_jump");
    self.br_infil_type = "convoy";
    thread orbitcam(truck);
    thread listenjump(truck);
    thread listenkick(truck);
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfed
// Size: 0x9a
function kickanyremainingplayers() {
    foreach (p in self.playerslots) {
        if (isdefined(p) && isdefined(p.br_infil_type) && p.br_infil_type == "convoy") {
            p cameradefault();
            p unlink();
            p thread jumpout(self);
            p notify("br_jump");
        }
    }
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x108e
// Size: 0x40
function listenkick(truck) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_c130");
    self endon("cancel_heli");
    self endon("br_jump");
    self waittill("halo_kick_c130");
    truck thread kickanyremainingplayers();
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d5
// Size: 0xfe
function listenjump(truck) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("cancel_convoy");
    self endon("br_jump");
    while (1) {
        self waittill("halo_jump_c130");
        if (!namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            continue;
        }
        if (namespace_ad389306d44fc6b4::ispointinbounds(truck.origin)) {
            if (namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                teammates = getteamdata(self.team, "players");
                foreach (p in teammates) {
                    if (p != self) {
                        p notify("halo_kick_c130");
                    }
                }
                break;
            }
        } else {
            self iprintlnbold("MP_BR_INGAME/NOT_PLAYABLE");
        }
        waitframe();
    }
    self cameradefault();
    thread jumpout(truck);
    self notify("br_jump");
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11da
// Size: 0x279
function jumpout(truck) {
    self setclientomnvar("ui_br_infiled", 1);
    /#
        println("<unknown string>");
    #/
    self.br_infil_type = undefined;
    lookangles = self getplayerangles();
    self unlink();
    if (istrue(truck.br_leftspawn)) {
        offset = anglestoleft(truck.angles) * 180;
    } else {
        offset = anglestoright(truck.angles) * 180;
    }
    fwd = anglestoforward(truck.angles);
    if (!isdefined(truck.offloaded)) {
        truck.offloaded = 0;
    } else {
        truck.offloaded++;
    }
    if (truck.offloaded == 0) {
        offset = offset + fwd * 36;
    } else if (truck.offloaded == 1) {
        offset = offset - fwd * 36;
    } else if (truck.offloaded == 2) {
        offset = offset + fwd * 72;
    } else {
        offset = offset - fwd * 72;
    }
    var_f9805aad354a150e = truck.origin + offset + (0, 0, 18000);
    contents = physics_createcontents([0:"physicscontents_glass", 1:"physicscontents_water", 2:"physicscontents_playerclip", 3:"physicscontents_vehicleclip"]);
    var_e021c2744cc7ed68 = physics_raycast(var_f9805aad354a150e, var_f9805aad354a150e + (0, 0, -1) * 20000, contents, undefined, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        castend = var_e021c2744cc7ed68[0]["position"];
        self setorigin(castend, 1, 1);
    } else {
        self setorigin(truck.origin + offset, 1, 1);
    }
    waitframe();
    var_81ef0ebaf8a76116 = game["music"]["snatch_spawn"].size;
    level.cur_infil_track = randomint(var_81ef0ebaf8a76116);
    self setplayermusicstate(game["music"]["snatch_spawn"][level.cur_infil_track]);
    function_6fb380927695ee76();
    function_985b0973f29da4f8("br_convoy::jumpOut()");
    self setplayerangles(lookangles);
    self notify("fallDone");
    namespace_5078ee98abb32db9::parachutecompletedefault();
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x145a
// Size: 0x59
function orbitcam(truck) {
    self.angles = truck.angles;
    self playerlinkto(truck, "tag_origin");
    function_a593971d75d82113();
    function_379bb555405c16bb("br_convoy::orbitCam()");
    _visionsetnaked("", 0);
    self cameraset("camera_custom_orbit_1");
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ba
// Size: 0x6a
function aretrucksvalid() {
    foreach (truck in level.br_convoytrucks) {
        if (!isdefined(truck) || !isdefined(truck.playerslots)) {
            return 0;
        }
    }
    return 1;
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x152c
// Size: 0x166
function getnexttruckwithroom(team) {
    if (level.teambased) {
        foreach (truck in level.br_convoytrucks) {
            if (isdefined(truck.spawnteam) && truck.spawnteam == team && !istruckfull(truck)) {
                return truck;
            }
        }
        foreach (truck in level.br_convoytrucks) {
            if (!isdefined(truck.spawnteam)) {
                truck.spawnteam = team;
                return truck;
            }
        }
    } else {
        var_eb444d46acfe7514 = array_sort_with_func(level.br_convoytrucks, &sorttrucksize);
        foreach (truck in var_eb444d46acfe7514) {
            if (!istruckfull(truck)) {
                return truck;
            }
        }
    }
    return undefined;
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169a
// Size: 0x1b
function istruckfull(truck) {
    return truck.playerslots.size == 8;
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16bd
// Size: 0x2d
function sorttrucksize(a, b) {
    return a.playerslots.size < b.playerslots.size;
}

// Namespace br_convoy/namespace_deb4c56af0a3ee11
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f2
// Size: 0x85
function showicon() {
    curobjid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(10);
    if (curobjid == -1) {
        return -1;
    }
    namespace_5a22b6f3a56f7e9b::objective_add_objective(curobjid, "invisible", (0, 0, 0));
    namespace_5a22b6f3a56f7e9b::update_objective_onentitywithrotation(curobjid, self);
    namespace_5a22b6f3a56f7e9b::update_objective_state(curobjid, "active");
    var_2eaf3f31852684fd = "icon_minimap_bradley";
    namespace_5a22b6f3a56f7e9b::update_objective_icon(curobjid, var_2eaf3f31852684fd);
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(curobjid, 1);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(curobjid);
    self.objid = curobjid;
}

