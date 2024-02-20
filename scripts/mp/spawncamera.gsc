// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawncamera.gsc;

#namespace namespace_dc51de4e8cbd07b;

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x973
// Size: 0x1b1
function init() {
    if (!isdefined(level.disablespawncamera)) {
        level.disablespawncamera = getdvarint(@"hash_5fc696f5bbb3ca62", 1) == 1;
    }
    level.snaptospawncamera = getdvarint(@"hash_1a2c3b67392b6657", 1) == 1;
    level.evaluatefrontline = getdvarint(@"hash_405e7e20d91344cc", 0) == 1;
    level.evaluatespawnforcameraselection = getdvarint(@"hash_c7c93411ff36195c", 1) == 1;
    level.usestaticspawnselectioncamera = getdvarint(@"hash_67329f458977df45", 0);
    level.var_45abec6de5366021 = getdvarvector(@"hash_ee64455059eaeef8", (0, 0, 0));
    if (length(level.var_45abec6de5366021) < 1) {
        level.var_45abec6de5366021 = undefined;
    }
    level.var_7b73a66e2d4ca32f = getdvarvector(@"hash_f1fe5a0456713312", (0, 0, 0));
    if (length(level.var_7b73a66e2d4ca32f) < 1) {
        level.var_7b73a66e2d4ca32f = undefined;
    }
    level.useunifiedspawnselectioncameraheight = getdvarint(@"hash_9d6d762163aa3df", 1);
    level.var_7dca174e7f878079 = getdvarint(@"hash_119957cbc3ce1a03", 0);
    if (!isdefined(level.var_1063c425ddab3330)) {
        level.var_1063c425ddab3330 = &createdefaultcameras;
    }
    if (!isdefined(level.updatedefaultcamera)) {
        level.updatedefaultcamera = &blank_func;
    }
    if (!isdefined(level.updategamemodecamera)) {
        level.updategamemodecamera = &blank_func;
    }
    if (!istrue(level.disablespawncamera)) {
        initcameras();
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2b
// Size: 0x3
function blank_func() {
    
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb35
// Size: 0x2e8
function initcameras() {
    level.spawncameras = [];
    level.currentcamera = [];
    foreach (entry in level.teamnamelist) {
        if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e() && level.mapname == "mp_don3_mobile") {
            level.currentcamera[entry] = namespace_36f464722d326bbe::getlocaleid();
        } else {
            level.currentcamera[entry] = "default";
        }
    }
    cameras = getstructarray("spawn_selection_camera", "targetname");
    if (cameras.size == 0 || level.mapname == "mp_aniyah_tac") {
        [[ level.var_1063c425ddab3330 ]]();
        level.var_1091b5d43ba7a905 = 1;
        return;
    }
    foreach (camera in cameras) {
        ref = camera.script_label;
        if (!isdefined(ref) || ref == "spawn_selection_camera") {
            ref = camera.script_noteworthy;
        }
        if (isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            locale = camera.script_noteworthy;
            jumpiffalse(!isdefined(locale) || isdefined(locale) && locale != level.localeid) LOC_000001be;
        } else {
        LOC_000001be:
            if (!isdefined(level.spawncameras[ref])) {
                level.spawncameras[ref] = [];
            }
            team = camera.script_team;
            if (team == "all") {
                foreach (entry in level.teamnamelist) {
                    level.spawncameras[ref][entry] = camera;
                }
            } else {
                if (istrue(level.usestaticspawnselectioncamera)) {
                    temp = namespace_8e28f8b325a83325::getstaticcameraposition(team);
                    camera.origin = temp.origin;
                    camera.angles = temp.angles;
                }
                level.spawncameras[ref][team] = camera;
                if (team == "axis") {
                    level.spawncameras[ref]["team_three"] = camera;
                    level.spawncameras[ref]["team_four"] = camera;
                }
            }
        }
    }
    [[ level.var_1063c425ddab3330 ]]();
    level.var_1091b5d43ba7a905 = 1;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe24
// Size: 0x596
function createdefaultcameras() {
    if (isdefined(level.spawncameras["default"])) {
        var_b4973dd709c9573c = 1;
        foreach (entry in level.teamnamelist) {
            if (!isdefined(level.spawncameras["default"][entry])) {
                var_b4973dd709c9573c = 0;
                break;
            }
        }
        if (var_b4973dd709c9573c) {
            return;
        }
    } else {
        level.spawncameras["default"] = [];
    }
    var_15b6110595408c7d = (0, 0, 0);
    if (isdefined(level.mapcorners) && isdefined(level.mapcorners[0]) && isdefined(level.mapcorners[1])) {
        level.mapcornervector = level.mapcorners[1].origin - level.mapcorners[0].origin;
        level.mapcornercenter = level.mapcorners[0].origin + level.mapcornervector * 0.5;
    }
    foreach (entry in level.teamnamelist) {
        if (isdefined(level.spawncameras["default"][entry])) {
            level.spawncameras["default"][entry].radiantplaced = 1;
        } else {
            camerastruct = spawnstruct();
            camerastruct.origin = (0, 0, 0);
            camerastruct.angles = (0, 0, 0);
            level.spawncameras["default"][entry] = camerastruct;
        }
    }
    level.spawncamerastartspawnallies = getstartspawnavg("allies");
    level.spawncamerastartspawnaxis = getstartspawnavg("axis");
    level.spawncamerastartspawnaxisang = ter_op(distancesquared(level.spawncamerastartspawnaxis, level.mapcorners[0].origin) < distancesquared(level.spawncamerastartspawnaxis, level.mapcorners[1].origin), level.mapcorners[0].angles, level.mapcorners[1].angles);
    spawnvector = level.spawncamerastartspawnaxis - level.spawncamerastartspawnallies;
    var_9005b92b370647a5 = level.spawncamerastartspawnallies + spawnvector * 0.5;
    if (distancesquared(level.spawncamerastartspawnallies, level.mapcorners[0].origin) < distancesquared(level.spawncamerastartspawnallies, level.mapcorners[1].origin)) {
        var_513b04c90cf2a835 = anglestoforward(level.mapcorners[0].angles);
        var_f073bd569ba4662e = anglestoright(level.mapcorners[0].angles);
        if (abs(vectordot(spawnvector, var_513b04c90cf2a835)) > abs(vectordot(spawnvector, var_f073bd569ba4662e))) {
            level.spawncamerastartspawnalliesvec = var_513b04c90cf2a835;
        } else {
            level.spawncamerastartspawnalliesvec = var_f073bd569ba4662e;
        }
    } else {
        var_513b04c90cf2a835 = anglestoforward(level.mapcorners[1].angles);
        var_f073bd569ba4662e = anglestoright(level.mapcorners[1].angles);
        if (abs(vectordot(spawnvector, var_513b04c90cf2a835)) > abs(vectordot(spawnvector, var_f073bd569ba4662e))) {
            level.spawncamerastartspawnalliesvec = var_513b04c90cf2a835;
        } else {
            level.spawncamerastartspawnalliesvec = var_f073bd569ba4662e;
        }
    }
    if (distancesquared(level.spawncamerastartspawnaxis, level.mapcorners[0].origin) < distancesquared(level.spawncamerastartspawnaxis, level.mapcorners[1].origin)) {
        var_513b04c90cf2a835 = anglestoforward(level.mapcorners[0].angles);
        var_f073bd569ba4662e = anglestoright(level.mapcorners[0].angles);
        if (abs(vectordot(spawnvector, var_513b04c90cf2a835)) > abs(vectordot(spawnvector, var_f073bd569ba4662e))) {
            level.spawncamerastartspawnaxisvec = var_513b04c90cf2a835;
        } else {
            level.spawncamerastartspawnaxisvec = var_f073bd569ba4662e;
        }
    } else {
        var_513b04c90cf2a835 = anglestoforward(level.mapcorners[1].angles);
        var_f073bd569ba4662e = anglestoright(level.mapcorners[1].angles);
        if (abs(vectordot(spawnvector, var_513b04c90cf2a835)) > abs(vectordot(spawnvector, var_f073bd569ba4662e))) {
            level.spawncamerastartspawnaxisvec = var_513b04c90cf2a835;
        } else {
            level.spawncamerastartspawnaxisvec = var_f073bd569ba4662e;
        }
    }
    spawndist = distance(level.spawncamerastartspawnallies, level.spawncamerastartspawnaxis);
    level.spawncameradistfactor = spawndist;
    orientdefaulttomapcenterusingmapcorners();
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c1
// Size: 0x151
function createspawncamera() {
    if (isdefined(level.updatedefaultcamera)) {
        [[ level.updatedefaultcamera ]]();
    }
    if (isdefined(level.updategamemodecamera)) {
        self [[ level.updategamemodecamera ]]();
    }
    var_20c95f6491f59d0c = self.origin + (0, 0, 60);
    var_6788dc28320974a = self.angles;
    if (isdefined(self.squadspectatepos)) {
        self.deathspectatepos = self.squadspectatepos;
        self.deathspectateangles = self.squadspectateang;
    } else {
        self.deathspectatepos = var_20c95f6491f59d0c;
        self.deathspectateangles = var_6788dc28320974a;
    }
    if (!isdefined(self.spawncameraent)) {
        cameraent = spawn("script_model", self.deathspectatepos);
        cameraent namespace_2a9588dfac284b77::registerspawncount(1);
        cameraent setmodel("tag_origin");
        cameraent.angles = self.deathspectateangles;
        self.spawncameraent = cameraent;
    } else {
        self.spawncameraent.origin = self.deathspectatepos;
        self.spawncameraent.angles = self.deathspectateangles;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1519
// Size: 0x1b3
function startspawncamera(var_ad4dd16f29e24b77, var_f61019386e1b1034, var_dfab0807d83a77fe) {
    self endon("disconnect");
    printspawnmessage("spawnCamera::startSpawnCamera() START");
    hideminimap(1);
    self cleardamageindicators();
    if (!(istrue(self.inspawncamera) && getdvarint(@"hash_7958073a99a0d67e", 1) == 1)) {
        createspawncamera();
    }
    if (!isdefined(self.spawncameraent)) {
        printspawnmessage("spawnCamera::startSpawnCamera() UNDEFINED SPAWNCAMERAENT!!!");
        thread playslamzoomflash(0, getspawncamerawaittime(), 0.5);
        return;
    }
    if (istrue(level.disablespawncamera) && !istrue(level.usespawnselection)) {
        return;
    }
    if (isai(self)) {
        return;
    }
    if (istrue(self.inspawncamera)) {
        return;
    }
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self.setspawnpoint) && !istrue(level.usespawnselection)) {
        return;
    }
    self.inspawncamera = 1;
    setdof_default();
    waitframe();
    namespace_5aeecefc462876::setdisabled();
    updatesessionstate("spectator");
    self setclientomnvar("ui_in_spawn_camera", 1);
    if (!isdefined(var_ad4dd16f29e24b77)) {
        var_ad4dd16f29e24b77 = 0;
    }
    if (!isdefined(var_f61019386e1b1034)) {
        var_f61019386e1b1034 = 0.25;
    }
    if (!isdefined(var_dfab0807d83a77fe)) {
        var_dfab0807d83a77fe = 0.25;
    }
    thread playslamzoomflash(var_ad4dd16f29e24b77, var_f61019386e1b1034, var_dfab0807d83a77fe);
    thread removecameraondisconnect(self.spawncameraent);
    waittill_any_timeout_no_endon_death_1(0.1, "force_spawn");
    self cameralinkto(self.spawncameraent, "tag_origin", 1, 1);
    printspawnmessage("spawnCamera::startSpawnCamera() CameraLinkTo()");
    self clearadditionalstreampos();
    thread snaptospawncamera();
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d3
// Size: 0x77
function getspawncamerawaittime() {
    if (isdefined(self.spawncameratime)) {
        return self.spawncameratime;
    } else if (istrue(self.squadspawnaborted) || !istrue(level.snaptospawncamera) && (istrue(self.skippedkillcam) || !isdefined(self.killcamwatchtime) || self.killcamwatchtime < 2)) {
        return 2.5;
    } else {
        return 1.5;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1751
// Size: 0x8
function getspawncamerablendtime() {
    return 1;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1761
// Size: 0x76d
function getspawncamera() {
    if (istrue(self.var_1305ad103fdd8962) && isdefined(self.var_d309f60efb44e349)) {
        return self.var_d309f60efb44e349;
    }
    var_dc51de4e8cbd07b = undefined;
    team = self.team;
    if (!isdefined(team)) {
        team = self.sessionteam;
    }
    if (!isgameplayteam(team)) {
        printspawnmessage("spawncamera::getSpawnCamera() - !isGameplayTeam() = " + team + "camera was undefined, forcing allies default");
        var_dc51de4e8cbd07b = level.spawncameras["default"]["allies"];
        return var_dc51de4e8cbd07b;
    }
    if (function_bf0e17930d534ab1()) {
        self.forcedspawncameraref = "default";
    }
    if (istrue(level.usestaticspawnselectioncamera)) {
        level.currentcamera[team] = "default";
        var_dc51de4e8cbd07b = level.spawncameras[level.currentcamera[team]][team];
        temp = namespace_8e28f8b325a83325::getstaticcameraposition(team);
        var_dc51de4e8cbd07b.origin = temp.origin;
        var_dc51de4e8cbd07b.angles = temp.angles;
    } else if (isdefined(self.forcedspawncameraref)) {
        if (isdefined(level.spawncameras[self.forcedspawncameraref])) {
            var_dc51de4e8cbd07b = level.spawncameras[self.forcedspawncameraref][team];
        } else if (issubstr(self.forcedspawncameraref, "squad")) {
            ref = self.forcedspawncameraref;
            if (ref == "squad_leader") {
                index = level.squaddata[team][self.var_ff97225579de16a].squadleader.var_3f78c6a0862f9e25;
            } else {
                index = int(getsubstr(ref, ref.size - 1, ref.size));
            }
            var_356a015aa1975023 = undefined;
            if (isdefined(level.squaddata[team]) && isdefined(level.squaddata[team][self.var_ff97225579de16a]) && isdefined(level.squaddata[team][self.var_ff97225579de16a].players[index])) {
                var_356a015aa1975023 = level.squaddata[team][self.var_ff97225579de16a].players[index];
            }
            if (isdefined(var_356a015aa1975023)) {
                forward = level.spawnselectionteamforward[team];
                heightoffset = 7000;
                if (istrue(level.useunifiedspawnselectioncameraheight)) {
                    heightoffset = namespace_8e28f8b325a83325::function_87bbbee0bbf27304();
                }
                goalposition = var_356a015aa1975023.origin + forward * -8500 + (0, 0, heightoffset);
                var_67794ff6e49c4961 = vectornormalize(var_356a015aa1975023.origin - goalposition);
                goalangles = vectortoanglessafe(var_67794ff6e49c4961, (0, 0, 1));
                goalposition = goalposition + namespace_b46034845796aac0::calculatecameraoffset(team, var_356a015aa1975023.origin);
                var_dc51de4e8cbd07b = spawnstruct();
                var_dc51de4e8cbd07b.origin = goalposition;
                var_dc51de4e8cbd07b.angles = goalangles;
            }
        } else if (issubstr(self.forcedspawncameraref, "vehicle")) {
            ref = self.forcedspawncameraref;
            var_a5d118f040f60db0 = undefined;
            if (isdefined(level.spawnselectionlocations[ref]) && isdefined(level.spawnselectionlocations[ref][team])) {
                var_a5d118f040f60db0 = level.spawnselectionlocations[ref][team].dynamicent;
            }
            forward = level.spawnselectionteamforward[team];
            if (isdefined(var_a5d118f040f60db0) && !istrue(var_a5d118f040f60db0.isdestroyed)) {
                goalposition = [];
                goalangles = [];
                heightoffset = 7000;
                if (istrue(level.useunifiedspawnselectioncameraheight)) {
                    heightoffset = namespace_8e28f8b325a83325::function_87bbbee0bbf27304();
                }
                goalposition = var_a5d118f040f60db0.origin + forward * -8500 + (0, 0, heightoffset);
                groundpos = level.spawnselectionlocations[ref][team].anchorentity.origin;
                camerapos = groundpos + forward * -8500 + (0, 0, heightoffset);
                var_6d399a908d913b0b = vectornormalize(groundpos - camerapos);
                goalangles = vectortoanglessafe(var_6d399a908d913b0b, (0, 0, 1));
                goalposition = goalposition + namespace_b46034845796aac0::calculatecameraoffset(team, groundpos);
                var_dc51de4e8cbd07b = spawnstruct();
                var_dc51de4e8cbd07b.origin = goalposition;
                var_dc51de4e8cbd07b.angles = goalangles;
            }
        }
    } else if (istrue(level.evaluatespawnforcameraselection) && isdefined(level.lastspawnpos) && isdefined(level.lastspawnpos[team])) {
        testpos = level.lastspawnpos[team];
        closestdistsq = undefined;
        var_efc4986f445eb28f = undefined;
        foreach (team, cam in level.spawncameras[level.currentcamera[team]]) {
            distsq = distancesquared(cam.origin, testpos);
            if (!isdefined(var_efc4986f445eb28f) || distsq < closestdistsq) {
                var_efc4986f445eb28f = cam;
                closestdistsq = distsq;
            }
        }
        var_dc51de4e8cbd07b = var_efc4986f445eb28f;
    } else if (istrue(level.evaluatefrontline)) {
        frontlineinfo = calulatefrontline();
        closestdistsq = undefined;
        var_efc4986f445eb28f = undefined;
        foreach (team, cam in level.spawncameras[level.currentcamera[team]]) {
            var_11a0b195b1442008 = distancesquared(cam.origin, frontlineinfo.teamavg[team]);
            var_3c61d0a28315e5a6 = distancesquared(cam.origin, frontlineinfo.origin);
            if (!isdefined(var_efc4986f445eb28f) || var_11a0b195b1442008 < var_3c61d0a28315e5a6) {
                var_efc4986f445eb28f = cam;
                closestdistsq = var_11a0b195b1442008;
            }
        }
        var_dc51de4e8cbd07b = var_efc4986f445eb28f;
    } else {
        if (istrue(level.usec130spawn)) {
            while (!isdefined(level.currentcamera[team])) {
                waitframe();
            }
        }
        if (!isstring(level.currentcamera[team])) {
            var_dc51de4e8cbd07b = spawnstruct();
            var_dc51de4e8cbd07b.origin = level.currentcamera[team].origin;
            var_dc51de4e8cbd07b.angles = level.currentcamera[team].angles;
            var_dc51de4e8cbd07b.usingintermissionpos = 1;
        } else {
            var_dc51de4e8cbd07b = level.spawncameras[level.currentcamera[team]][team];
        }
    }
    if (!isdefined(var_dc51de4e8cbd07b)) {
        printspawnmessage("spawncamera::getSpawnCamera() - self.forcedSpawnCameraRef = " + self.forcedspawncameraref + "camera was undefined, forcing default");
        var_dc51de4e8cbd07b = level.spawncameras["default"][team];
    }
    self.var_d309f60efb44e349 = var_dc51de4e8cbd07b;
    return var_dc51de4e8cbd07b;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed6
// Size: 0x240
function movetospawncamerainitial() {
    self endon("disconnect");
    self notify("newMoveToSpawnCameraInitiated");
    self endon("newMoveToSpawnCameraInitiated");
    self endon("tac_ops_spawn_focus_changed");
    self endon("slamZoomInitiated");
    var_dc51de4e8cbd07b = getspawncamera();
    var_62cde7b5d0d68c0b = var_dc51de4e8cbd07b.origin;
    var_3bfc32b66fe06445 = var_dc51de4e8cbd07b.angles;
    lookatpos = self.spawncameraent.origin;
    var_832ded18d6904999 = vectornormalize(lookatpos - var_dc51de4e8cbd07b.origin);
    var_318eea579595b65e = vectortoanglessafe(var_832ded18d6904999, (0, 0, 1));
    self.spawncameraent.angles = var_318eea579595b65e;
    dist = distance(lookatpos, var_62cde7b5d0d68c0b);
    time = dist / 3520;
    time = clamp(time, 1.5, 3);
    self.spawncameratargetpos = var_62cde7b5d0d68c0b;
    self.spawncameratargetang = var_3bfc32b66fe06445;
    self.spawncameratime = time;
    self.spawncameraendtime = gettime() + time * 1000;
    if (!istrue(var_dc51de4e8cbd07b.usingintermissionpos)) {
        self.spawncameraent moveto(var_62cde7b5d0d68c0b, time, time * 0.3, time * 0.4);
        self.spawncameraent rotateto(var_3bfc32b66fe06445, time, time * 0.3, time * 0.4);
        wait(1);
    } else {
        self.spawncameraent.origin = var_62cde7b5d0d68c0b;
        self.spawncameraent.angles = var_3bfc32b66fe06445;
        self.deathspectatepos = var_62cde7b5d0d68c0b;
    }
    applythermal();
    thread startoperatorsound();
    if (isdefined(self) && isdefined(self.spawncameraent) && !istrue(self.inspawnselection)) {
        var_ae753108f3dff053 = anglestoforward(var_3bfc32b66fe06445) * 300;
        var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
        self earthquakeforplayer(0.03, 15, var_62cde7b5d0d68c0b, 1000);
    }
    self notify("spawn_camera_idle");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0x1dc
function movetospawncamera(var_7c207c285f05dbb2) {
    self endon("disconnect");
    self notify("newMoveToSpawnCameraInitiated");
    self endon("newMoveToSpawnCameraInitiated");
    self endon("tac_ops_map_selection_valid");
    self endon("tac_ops_spawn_focus_changed");
    self endon("slamZoomInitiated");
    var_dc51de4e8cbd07b = getspawncamera();
    var_62cde7b5d0d68c0b = var_dc51de4e8cbd07b.origin;
    var_3bfc32b66fe06445 = var_dc51de4e8cbd07b.angles;
    if (isdefined(self.spawncameratargetpos) && isdefined(self.spawncameratargetang) && self.spawncameratargetpos == var_62cde7b5d0d68c0b && self.spawncameratargetang == var_3bfc32b66fe06445) {
        return;
    }
    lookatpos = self.spawncameraent.origin;
    var_832ded18d6904999 = vectornormalize(lookatpos - var_dc51de4e8cbd07b.origin);
    self.spawncameratargetpos = var_62cde7b5d0d68c0b;
    self.spawncameratargetang = var_3bfc32b66fe06445;
    self.spawncameraent moveto(var_62cde7b5d0d68c0b, 1, 0.25, 0.75);
    self.spawncameraent rotateto(var_3bfc32b66fe06445, 1, 0.25, 0.75);
    wait(1);
    if (isdefined(self) && isdefined(self.spawncameraent) && !istrue(self.inspawnselection)) {
        var_ae753108f3dff053 = anglestoforward(var_3bfc32b66fe06445) * 300;
        var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
        self.spawncameraent moveto(var_62cde7b5d0d68c0b + var_ae753108f3dff053, 15, 1, 1);
        self earthquakeforplayer(0.03, 15, var_62cde7b5d0d68c0b, 1000);
    }
    printspawnmessage("spawnCamera::moveToSpawnCamera() MoveTo(): " + var_62cde7b5d0d68c0b + ", + RotateTo(): " + var_3bfc32b66fe06445);
    self notify("spawn_camera_idle");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2300
// Size: 0x1b3
function snaptospawncamera() {
    self endon("disconnect");
    while (!istrue(self.cansnapcamera)) {
        waitframe();
    }
    var_dc51de4e8cbd07b = getspawncamera();
    self.spawncameraent dontinterpolate();
    self.spawncameraent.origin = var_dc51de4e8cbd07b.origin;
    self.spawncameraent.angles = var_dc51de4e8cbd07b.angles;
    if (isdefined(var_dc51de4e8cbd07b.var_6930961c8a8d33fc)) {
        thread namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_dc51de4e8cbd07b.var_6930961c8a8d33fc);
    }
    if (!istrue(level.nukeinfo.detonated)) {
        self visionsetnakedforplayer("", 0);
    }
    applythermal();
    thread startoperatorsound();
    if (isdefined(self) && isdefined(self.spawncameraent) && !istrue(self.inspawnselection)) {
        var_ae753108f3dff053 = anglestoforward(self.spawncameraent.angles) * 300;
        var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
        self.spawncameraent moveto(self.spawncameraent.origin + var_ae753108f3dff053, 15, 1, 1);
        self earthquakeforplayer(0.03, 15, self.spawncameraent.origin, 1000);
    }
    printspawnmessage("spawnCamera::snapToSpawnCamera() Origin: " + var_dc51de4e8cbd07b.origin + ", Angles: " + var_dc51de4e8cbd07b.angles);
    self notify("spawn_camera_idle");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24ba
// Size: 0xa0
function endspawncamera() {
    if (isdefined(self.operatorsfx)) {
        self clearsoundsubmix("iw8_mp_spawn_camera");
        self.operatorsfx stoploopsound(self.operatorsfxalias);
        self.operatorsfx delete();
        self.operatorsfx = undefined;
        self.operatorsfxalias = undefined;
    }
    if (!isdefined(self.spawncameraent)) {
        return;
    }
    if (istrue(level.gameended)) {
        return;
    }
    if (istrue(self.var_f9cd51a4708ec70f)) {
        deletespawncamera();
        return;
    }
    hideminimap(1);
    thread streamforslamzoomonspawn();
    runslamzoomonspawn();
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2561
// Size: 0x59
function deletespawncamera() {
    self cameraunlink();
    self.spawncameraent namespace_2a9588dfac284b77::deregisterspawn();
    self.spawncameraent delete();
    self.spawncameraent = undefined;
    self.isusingspawnmapcamera = undefined;
    self.inspawncamera = 0;
    self.var_d309f60efb44e349 = undefined;
    self notify("spawn_camera_deleted");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c1
// Size: 0x2f
function removecameraondisconnect(cameraent) {
    self endon("spawn_camera_deleted");
    self waittill("disconnect");
    if (isdefined(cameraent)) {
        cameraent namespace_2a9588dfac284b77::deregisterspawn();
        cameraent delete();
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f7
// Size: 0x66
function streamforslamzoomonspawn() {
    self endon("disconnect");
    self waittill("spawncamera_start");
    if (istrue(self.prestreaminglocation)) {
        self notify("playerPrestreamLocationWait");
        self.prestreaminglocation = undefined;
        self notify("playerPrestreamComplete");
    }
    self function_a304dc5184b0df29(0);
    self function_bc667001f9dd3808(self geteye());
    self waittill("spawn_camera_complete");
    self clearpredictedstreampos();
    self function_a304dc5184b0df29(1);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2664
// Size: 0x27a
function runslamzoomonspawn(var_595879a0845617f6) {
    self endon("disconnect");
    printspawnmessage("spawnCamera::runSlamZoomOnSpawn() START");
    self waittill("spawncamera_start");
    printspawnmessage("spawnCamera::runSlamZoomOnSpawn() spawncamera_start PASSED");
    self notify("slamZoomInitiated");
    _freezecontrols(1, undefined, "slamZoom");
    namespace_f8065cafc523dba5::function_a593971d75d82113();
    namespace_f8065cafc523dba5::function_379bb555405c16bb("spawncamera::runSlamZoomOnSpawn()");
    self useinvisibleplayerduringspawnselection(1);
    self.plotarmor = 1;
    val::set("slamZoom", "vehicle_use", 0);
    namespace_5aeecefc462876::setdisabled();
    updatesessionstate("spectator");
    self cameralinkto(self.spawncameraent, "tag_origin", 1);
    printspawnmessage("spawnCamera::runSlamZoomOnSpawn() CameraLinkTo()");
    handlemovetoblended();
    deletespawncamera();
    if (self.team == "spectator") {
        namespace_99ac021a7547cae3::removefromalivecount();
        self setclientomnvar("ui_in_spawn_camera", 0);
        if (!istrue(level.nukeinfo.detonated)) {
            self visionsetnakedforplayer("", 0.5);
        }
        _freezecontrols(0, undefined, "slamZoom");
        self useinvisibleplayerduringspawnselection(0);
        self.plotarmor = 0;
        thread namespace_5aeecefc462876::setspectatepermissions();
        return;
    }
    updatesessionstate("playing");
    if (istrue(self.shouldgetnewspawnpoint)) {
        spawnpoint = namespace_99ac021a7547cae3::getspawnpoint();
        self setorigin(spawnpoint.spawnorigin);
        self setplayerangles(spawnpoint.spawnangles);
        namespace_b2d5aa2baf2b5701::finalizespawnpointchoice(spawnpoint.spawnpoint);
        self.shouldgetnewspawnpoint = undefined;
        self.selectedspawnarea = undefined;
    }
    thread function_d28ef4117a443666();
    self setclientomnvar("ui_in_spawn_camera", 0);
    if (!istrue(level.nukeinfo.detonated)) {
        self visionsetnakedforplayer("", 0.5);
    }
    _freezecontrols(0, undefined, "slamZoom");
    namespace_f8065cafc523dba5::function_6fb380927695ee76();
    namespace_f8065cafc523dba5::function_985b0973f29da4f8("spawncamera::runSlamZoomOnSpawn()");
    self useinvisibleplayerduringspawnselection(0);
    self.plotarmor = 0;
    val::function_c9d0b43701bdba00("slamZoom");
    self notify("spawned_player");
    level notify("player_spawned", self);
    thread namespace_99ac021a7547cae3::setspawnnotifyomnvar();
    self.wasrevivespawn = undefined;
    self.delayedspawnedplayernotify = undefined;
    self.spawndata = undefined;
    printspawnmessage("spawnCamera::runSlamZoomOnSpawn() COMPLETE");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e5
// Size: 0x1e1
function function_d28ef4117a443666() {
    self endon("death_or_disconnect");
    if (isdefined(self.var_f109e15fae27ddc2) && isdefined(self.var_f109e15fae27ddc2.origin) && isdefined(self.var_f109e15fae27ddc2.angles) && isdefined(self.var_9066885bd8b59751)) {
        self setorigin(self.var_f109e15fae27ddc2.origin + rotatevector(self.var_9066885bd8b59751, self.var_f109e15fae27ddc2.angles));
    }
    waitframe();
    if (isdefined(self.var_f109e15fae27ddc2) && isdefined(self.var_f109e15fae27ddc2.origin) && isdefined(self.var_f109e15fae27ddc2.angles) && isdefined(self.var_9066885bd8b59751)) {
        printspawnmessage("spawnCamera::runSlamZoomOnSpawn() Set origin on moving platform
Platform vehicle type: " + function_53c4c53197386572(self.var_f109e15fae27ddc2.targetname, "undefined") + "
	Platform origin: " + self.var_f109e15fae27ddc2.origin + "
	Platform angles: " + self.var_f109e15fae27ddc2.angles + "
	Platform offset: " + self.var_9066885bd8b59751 + "
	Final position: " + self.var_f109e15fae27ddc2.origin + rotatevector(self.var_9066885bd8b59751, self.var_f109e15fae27ddc2.angles));
        self function_a055801da45d769(self.var_f109e15fae27ddc2.origin + rotatevector(self.var_9066885bd8b59751, self.var_f109e15fae27ddc2.angles), self.var_f109e15fae27ddc2);
    }
    self.var_f109e15fae27ddc2 = undefined;
    self.var_9066885bd8b59751 = undefined;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2acd
// Size: 0x18a
function handlemoveto(duration) {
    self endon("disconnect");
    targetpos = self geteye();
    targetangles = self.angles;
    var_4158f3e6af3fc2e7 = (targetpos[0], targetpos[1], self.spawncameraent.origin[2]);
    var_4158f3e6af3fc2e7 = var_4158f3e6af3fc2e7 + anglestoforward(targetangles) * -480;
    self.spawncameraent moveto(var_4158f3e6af3fc2e7, 0.75, 0.25, 0.25);
    var_f10bfd0a124a36dc = vectornormalize(targetpos - var_4158f3e6af3fc2e7);
    var_318eea579595b65e = vectortoanglessafe(var_f10bfd0a124a36dc, (0, 0, 1));
    self.spawncameraent rotateto(var_318eea579595b65e, 0.75, 0.25, 0.25);
    wait(0.75);
    self visionsetnakedforplayer("tac_ops_slamzoom", 0.2);
    var_ae819214d26d3bba = targetpos + anglestoforward(targetangles) * -60;
    self.spawncameraent moveto(var_ae819214d26d3bba, 0.5, 0.1, 0.4);
    self.spawncameraent rotateto(targetangles, 0.7, 0.45, 0.05);
    wait(0.5);
    thread playslamzoomflash();
    self.spawncameraent moveto(targetpos, 0.6, 0.1, 0.1);
    wait(0.2);
    self visionsetnakedforplayer("", 0);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5e
// Size: 0x35a
function handlemovetoblended(duration) {
    self endon("disconnect");
    self endon("kill_handle_move_to_blended");
    printspawnmessage("spawnCamera::handleMoveTo() START");
    if (isdefined(level.var_840e89b17ac632ee)) {
        self [[ level.var_840e89b17ac632ee ]]();
    }
    targetpos = self.spawndata.spawnorigin + (0, 0, 60);
    targetangles = self.spawndata.spawnangles;
    if (isdefined(self.forcespawncameraorg)) {
        targetpos = self.forcespawncameraorg;
        targetangles = self.forcespawncameraang;
        self.forcespawncameraorg = undefined;
        self.forcespawncameraang = undefined;
    }
    var_e3acce2d88cf3bf4 = angle_diff(self.spawncameraent.angles[1], targetangles[1]) < 45;
    var_d43d6364668556c7 = distance2dsquared(self.spawncameraent.origin, targetpos) > 1000000;
    thread fadeblackforgeo(targetpos);
    if (!var_e3acce2d88cf3bf4 || !var_d43d6364668556c7) {
        if (!istrue(level.nukeinfo.detonated)) {
            if (!namespace_36f464722d326bbe::isnightmap()) {
                removethermal();
                self visionsetnakedforplayer("", 0);
            } else {
                self visionsetnakedforplayer("respawn_camera_night", 0);
            }
        }
        wait(0.05);
        self.spawncameraent moveto(targetpos, 1, 0.1, 0.9);
        self.spawncameraent rotateto(targetangles, 1, 0.9, 0.1);
        printspawnmessage("spawnCamera::handleMoveTo() FULL Blend Set");
        if (!istrue(level.nukeinfo.detonated)) {
            if (!namespace_36f464722d326bbe::isnightmap()) {
                self visionsetnakedforplayer("tac_ops_slamzoom", 0.8);
            }
        }
        wait(0.8);
        wait(0.2);
    } else {
        var_f10bfd0a124a36dc = vectornormalize(targetpos - self.spawncameraent.origin);
        var_318eea579595b65e = vectortoanglessafe(var_f10bfd0a124a36dc, (0, 0, 1));
        self.spawncameraent rotateto(var_318eea579595b65e, 0.7, 0.2, 0.2);
        printspawnmessage("spawnCamera::handleMoveTo() FIRST HALF Blend Set");
        if (!istrue(level.nukeinfo.detonated)) {
            if (!namespace_36f464722d326bbe::isnightmap()) {
                removethermal();
                self visionsetnakedforplayer("", 0);
            } else {
                self visionsetnakedforplayer("respawn_camera_night", 0);
            }
        }
        wait(0.05);
        self.spawncameraent moveto(targetpos, 1, 0.1, 0.9);
        if (!istrue(level.nukeinfo.detonated)) {
            if (!namespace_36f464722d326bbe::isnightmap()) {
                self visionsetnakedforplayer("tac_ops_slamzoom", 0.8);
            }
        }
        wait(0.5);
        self.spawncameraent rotateto(targetangles, 0.5, 0.2, 0.1);
        printspawnmessage("spawnCamera::handleMoveTo() SECOND HALF Blend Set");
        wait(0.3);
        wait(0.2);
    }
    printspawnmessage("spawnCamera::handleMoveTo() COMPLETE");
    self notify("spawn_camera_complete");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x27b
function fadeblackforgeo(targetpos) {
    self endon("disconnect");
    content = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle", 3:"physicscontents_characterproxy", 4:"physicscontents_glass", 5:"physicscontents_itemclip"];
    contentoverride = physics_createcontents(content);
    var_19a552c4bce63400 = namespace_2a184fc4902783dc::ray_trace(self.spawncameraent.origin, targetpos, undefined, contentoverride);
    groundtrace = namespace_2a184fc4902783dc::ray_trace(targetpos, self.spawncameraent.origin, undefined, contentoverride);
    var_9759221a13e07f1b = var_19a552c4bce63400["fraction"];
    var_8bb2698c2acb0fc6 = groundtrace["fraction"];
    var_4727e885c8a34003 = 0.11;
    if (istrue(self.spawningintovehicle)) {
        if (isdefined(self.vehiclereserved) && isdefined(self.vehiclereserved.vehiclename) && self.vehiclereserved.vehiclename == "veh9_palfa") {
            if (isdefined(self.vehiclereserved.occupants) && self.vehiclereserved.occupants.size == 0) {
                self setsoundsubmix("iw8_mp_vehicle_spawn", 0.1);
                thread clear_plr_vehicle_submix();
            }
        } else {
            self setsoundsubmix("iw8_mp_vehicle_spawn", 0.1);
            thread clear_plr_vehicle_submix();
        }
    }
    if (istrue(self.spawningintovehicle) || namespace_36f464722d326bbe::isnightmap()) {
        self.spawningintovehicle = undefined;
        if (isdefined(self.vehiclespawninginto) && self.vehiclespawninginto == "light_tank") {
            var_9759221a13e07f1b = min(var_9759221a13e07f1b, 0.95);
            var_8bb2698c2acb0fc6 = 0;
            var_4727e885c8a34003 = 0.75;
        } else {
            var_9759221a13e07f1b = min(var_9759221a13e07f1b, 0.95);
            var_8bb2698c2acb0fc6 = 0;
        }
    }
    if (istrue(self.shouldgetnewspawnpoint)) {
        var_9759221a13e07f1b = min(var_9759221a13e07f1b, 0.5);
        var_8bb2698c2acb0fc6 = 0;
        thread waitandgetnewspawnpoint();
    }
    if (var_9759221a13e07f1b < 1) {
        if (var_9759221a13e07f1b - 0.22 > 0) {
            wait(var_9759221a13e07f1b - 0.22);
        }
        thread playslamzoomflash(0.1, 1 - var_9759221a13e07f1b - var_8bb2698c2acb0fc6 + var_4727e885c8a34003, 0.25);
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3241
// Size: 0x1a
function waitandgetnewspawnpoint() {
    self endon("disconnect");
    self waittill("fadeUp_start");
    self notify("kill_handle_move_to_blended");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3262
// Size: 0x1e
function clear_plr_vehicle_submix() {
    self endon("disconnect");
    wait(1.5);
    self clearsoundsubmix("iw8_mp_vehicle_spawn", 1);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3287
// Size: 0x16a
function playslamzoomflash(var_ad4dd16f29e24b77, var_f61019386e1b1034, var_dfab0807d83a77fe) {
    self endon("disconnect");
    self.cansnapcamera = 0;
    if (!isdefined(var_dfab0807d83a77fe)) {
        var_dfab0807d83a77fe = 0.5;
    }
    self notify("fadeDown_start");
    if (isdefined(var_ad4dd16f29e24b77) && var_ad4dd16f29e24b77 > 0) {
        var_c8d49bba66d8db34 = 0;
        framecount = var_ad4dd16f29e24b77 / level.framedurationseconds;
        var_11b42fd8a12916ad = 1 / framecount;
        var_4a1830f604c82b9f = 0;
        while (var_4a1830f604c82b9f < framecount) {
            var_4a1830f604c82b9f++;
            var_c8d49bba66d8db34 = var_c8d49bba66d8db34 + var_11b42fd8a12916ad;
            var_c8d49bba66d8db34 = clamp(var_c8d49bba66d8db34, 0, 1);
            self setclientomnvar("ui_world_fade", var_c8d49bba66d8db34);
            waitframe();
        }
        goto LOC_000000c6;
    }
LOC_000000c6:
    self notify("fadeDown_complete");
    self.cansnapcamera = 1;
    if (isdefined(var_f61019386e1b1034) && var_f61019386e1b1034 > 0) {
        wait(var_f61019386e1b1034);
    }
    self notify("fadeUp_start");
    if (isdefined(var_dfab0807d83a77fe) && var_dfab0807d83a77fe > 0) {
        var_c8d49bba66d8db34 = 1;
        framecount = var_dfab0807d83a77fe / level.framedurationseconds;
        var_11b42fd8a12916ad = 1 / framecount;
        var_4a1830f604c82b9f = 0;
        while (var_4a1830f604c82b9f < framecount) {
            var_4a1830f604c82b9f++;
            var_c8d49bba66d8db34 = var_c8d49bba66d8db34 - var_11b42fd8a12916ad;
            var_c8d49bba66d8db34 = clamp(var_c8d49bba66d8db34, 0, 1);
            self setclientomnvar("ui_world_fade", var_c8d49bba66d8db34);
            waitframe();
        }
    } else {
        self setclientomnvar("ui_world_fade", 0);
    }
    self notify("fadeUp_complete");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x33f8
// Size: 0x59
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    self rotateto(finalangles, 1, 0.5, 0.5);
    player thread startoperatorsound();
    wait(1.1);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3458
// Size: 0x66
function applythermal() {
    if (istrue(self.spawncameraskipthermalonce)) {
        self.spawncameraskipthermalonce = 0;
        return;
    }
    if (istrue(self.spawncameraskipthermal)) {
        return;
    }
    if (!istrue(level.nukeinfo.detonated)) {
        if (namespace_36f464722d326bbe::isnightmap()) {
            self visionsetnakedforplayer("respawn_camera_night", 0);
        } else {
            self visionsetnakedforplayer("respawn_camera", 0);
        }
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0x3
function removethermal() {
    
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34cf
// Size: 0xd7
function startoperatorsound() {
    self endon("disconnect");
    self endon("game_ended");
    if (isdefined(self.operatorsfx)) {
        return;
    }
    if (istrue(level.nukeinfo.incoming)) {
        return;
    }
    self.operatorsfx = spawn("script_origin", (0, 0, 0));
    self.operatorsfx showonlytoplayer(self);
    self setsoundsubmix("iw8_mp_spawn_camera");
    var_1d6df6a17cee3314 = getteamvoiceinfix(self.team);
    var_53787b74a16a9d5e = "dx_mpo_" + var_1d6df6a17cee3314 + "op_drone_deathchatter";
    if (!soundexists(var_53787b74a16a9d5e)) {
        var_53787b74a16a9d5e = "dx_mpo_ruop_drone_deathchatter";
    }
    self.operatorsfxalias = var_53787b74a16a9d5e;
    self.operatorsfx playloopsound(var_53787b74a16a9d5e);
    thread endoperatorsfxondisconnect();
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35ad
// Size: 0x4e
function endoperatorsfxondisconnect() {
    self endon("spawned_player");
    ent = self.operatorsfx;
    alias = self.operatorsfxalias;
    self waittill("disconnect");
    if (isdefined(ent)) {
        ent stoploopsound(alias);
        ent delete();
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3602
// Size: 0x34
function setgamemodecamera(team, cameraent) {
    level.spawncameras["gamemode"][team] = cameraent;
    setspawncamera(team, "gamemode");
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x363d
// Size: 0x21
function setspawncamera(team, ref) {
    level.currentcamera[team] = ref;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3665
// Size: 0x274
function orientdefaulttomapcenterusingmapcorners() {
    var_f3185b6ab68825a3 = (level.spawncamerastartspawnallies[2] + level.spawncamerastartspawnaxis[2]) * 0.5;
    var_8b608c6b5e96c8e4 = (level.mapcornercenter[0], level.mapcornercenter[1], var_f3185b6ab68825a3);
    if (!istrue(level.spawncameras["default"]["allies"].radiantplaced)) {
        heightoffset = function_9dd9773c51f39a12();
        if (heightoffset > 0) {
            var_74a2d868cfe3a64e = var_8b608c6b5e96c8e4 + level.spawncamerastartspawnalliesvec * level.spawncameradistfactor * -0.85 + (0, 0, heightoffset);
        } else {
            var_74a2d868cfe3a64e = var_8b608c6b5e96c8e4 + level.spawncamerastartspawnalliesvec * level.spawncameradistfactor * -0.85 + (0, 0, 1) * level.spawncameradistfactor * 0.45;
        }
        var_6841474d6fed394f = vectornormalize(var_8b608c6b5e96c8e4 - var_74a2d868cfe3a64e);
        var_9ae75568303e010c = vectortoanglessafe(var_6841474d6fed394f, (0, 0, 1));
        level.spawncameras["default"]["allies"].origin = var_74a2d868cfe3a64e;
        level.spawncameras["default"]["allies"].angles = var_9ae75568303e010c;
    }
    if (!istrue(level.spawncameras["default"]["axis"].radiantplaced)) {
        heightoffset = function_9dd9773c51f39a12();
        if (heightoffset > 0) {
            var_6a277d0d2e8d5df = var_8b608c6b5e96c8e4 + level.spawncamerastartspawnaxisvec * level.spawncameradistfactor * -0.85 + (0, 0, heightoffset);
        } else {
            var_6a277d0d2e8d5df = var_8b608c6b5e96c8e4 + level.spawncamerastartspawnaxisvec * level.spawncameradistfactor * -0.85 + (0, 0, 1) * level.spawncameradistfactor * 0.45;
        }
        var_6841474d6fed394f = vectornormalize(var_8b608c6b5e96c8e4 - var_6a277d0d2e8d5df);
        var_e05dfad1728e7b21 = vectortoanglessafe(var_6841474d6fed394f, (0, 0, 1));
        level.spawncameras["default"]["axis"].origin = var_6a277d0d2e8d5df;
        level.spawncameras["default"]["axis"].angles = var_e05dfad1728e7b21;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e0
// Size: 0x4a
function function_9dd9773c51f39a12() {
    if (level.var_7dca174e7f878079 > 0) {
        return level.var_7dca174e7f878079;
    }
    switch (level.mapname) {
    case #"hash_c860b74f2269590c":
        return 3000;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3931
// Size: 0x33e
function orientdefaulttofrontline() {
    alliesplayers = getfriendlyplayers("allies", 1);
    var_aac62807b84149b5 = level.spawncamerastartspawnallies;
    if (alliesplayers.size > 0) {
        var_aac62807b84149b5 = (0, 0, 0);
        foreach (player in alliesplayers) {
            var_aac62807b84149b5 = var_aac62807b84149b5 + player.origin;
        }
        var_aac62807b84149b5 = var_aac62807b84149b5 / alliesplayers.size;
    }
    axisplayers = getfriendlyplayers("axis", 1);
    var_e4c7b343246f2158 = level.spawncamerastartspawnaxis;
    if (axisplayers.size > 0) {
        var_e4c7b343246f2158 = (0, 0, 0);
        foreach (player in axisplayers) {
            var_e4c7b343246f2158 = var_e4c7b343246f2158 + player.origin;
        }
        var_e4c7b343246f2158 = var_e4c7b343246f2158 / axisplayers.size;
    }
    var_d711e0e99dd33b05 = var_e4c7b343246f2158 - var_aac62807b84149b5;
    var_447333acccb3f053 = vectornormalize(var_d711e0e99dd33b05);
    var_3c61d0a28315e5a6 = vectordot(var_d711e0e99dd33b05, var_d711e0e99dd33b05);
    if (var_3c61d0a28315e5a6 < 1048576) {
        return;
    }
    var_74a2d868cfe3a64e = level.mapcornercenter + var_447333acccb3f053 * level.spawncameradistfactor * -0.5 + (0, 0, 1) * level.spawncameradistfactor * 0.2;
    var_6841474d6fed394f = vectornormalize(level.mapcornercenter - var_74a2d868cfe3a64e);
    var_9ae75568303e010c = vectortoanglessafe(var_6841474d6fed394f, (0, 0, 1));
    level.spawncameras["default"]["allies"].origin = var_74a2d868cfe3a64e;
    level.spawncameras["default"]["allies"].angles = var_9ae75568303e010c;
    var_6a277d0d2e8d5df = level.mapcornercenter + var_447333acccb3f053 * level.spawncameradistfactor * 0.5 + (0, 0, 1) * level.spawncameradistfactor * 0.2;
    var_6841474d6fed394f = vectornormalize(level.mapcornercenter - var_6a277d0d2e8d5df);
    var_e05dfad1728e7b21 = vectortoanglessafe(var_6841474d6fed394f, (0, 0, 1));
    level.spawncameras["default"]["axis"].origin = var_6a277d0d2e8d5df;
    level.spawncameras["default"]["axis"].angles = var_e05dfad1728e7b21;
    thread drawline(var_74a2d868cfe3a64e, level.mapcornercenter, 60, (0, 0, 1));
    thread drawline(var_6a277d0d2e8d5df, level.mapcornercenter, 60, (1, 0, 0));
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c76
// Size: 0x1d8
function calulatefrontline() {
    alliesplayers = getfriendlyplayers("allies", 1);
    var_aac62807b84149b5 = getstartspawnavg("allies");
    if (alliesplayers.size > 0) {
        var_aac62807b84149b5 = (0, 0, 0);
        foreach (player in alliesplayers) {
            var_aac62807b84149b5 = var_aac62807b84149b5 + player.origin;
        }
        var_aac62807b84149b5 = var_aac62807b84149b5 / alliesplayers.size;
    }
    axisplayers = getfriendlyplayers("axis", 1);
    var_e4c7b343246f2158 = getstartspawnavg("axis");
    if (axisplayers.size > 0) {
        var_e4c7b343246f2158 = (0, 0, 0);
        foreach (player in axisplayers) {
            var_e4c7b343246f2158 = var_e4c7b343246f2158 + player.origin;
        }
        var_e4c7b343246f2158 = var_e4c7b343246f2158 / axisplayers.size;
    }
    var_d711e0e99dd33b05 = var_e4c7b343246f2158 - var_aac62807b84149b5;
    var_447333acccb3f053 = vectornormalize(var_d711e0e99dd33b05);
    frontlineinfo = spawnstruct();
    frontlineinfo.origin = (var_aac62807b84149b5 + var_e4c7b343246f2158) * 0.5;
    frontlineinfo.angles = vectorcross(var_447333acccb3f053, (0, 0, 1));
    frontlineinfo.teamavg = [];
    frontlineinfo.teamavg["allies"] = var_aac62807b84149b5;
    frontlineinfo.teamavg["axis"] = var_e4c7b343246f2158;
    return frontlineinfo;
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e56
// Size: 0x133
function getstartspawnavg(team, classname) {
    if (isdefined(level.startspawnavg) && isdefined(level.startspawnavg[team])) {
        return level.startspawnavg[team];
    }
    if (!isdefined(level.startspawnavg)) {
        level.startspawnavg = [];
    }
    level.startspawnavg[team] = (0, 0, 0);
    if (isdefined(classname)) {
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray(classname);
    } else {
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_" + team + "_start");
    }
    var_b71bf0010307a61c = (0, 0, 0);
    foreach (s in spawns) {
        var_b71bf0010307a61c = var_b71bf0010307a61c + s.origin;
    }
    if (spawns.size > 0) {
        var_b71bf0010307a61c = var_b71bf0010307a61c / spawns.size;
    }
    level.startspawnavg[team] = var_b71bf0010307a61c;
    return level.startspawnavg[team];
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0x27
function angle_diff(value1, value2) {
    return 180 - abs(abs(value1 - value2) - 180);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fc0
// Size: 0x19
function function_bf0e17930d534ab1() {
    return getgametype() == "risk" || isgroundwarcoremode();
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe1
// Size: 0x1dc
function function_71a2a6a6f52ab30b(var_204e074713eb37b5, team, forward, forwardoffset, heightoffset) {
    foreach (key in var_204e074713eb37b5) {
        if (istrue(level.useunifiedspawnselectioncameraheight)) {
            heightoffset = namespace_8e28f8b325a83325::function_87bbbee0bbf27304();
        }
        if (istrue(level.usespawnselection)) {
            groundpos = level.spawnselectionlocations[key][team].anchorentity.origin;
        } else if (isdefined(level.spawncameras[key][team])) {
            groundpos = level.spawncameras[key][team].origin;
        } else {
            return;
        }
        camerapos = groundpos + forward * forwardoffset + (0, 0, heightoffset);
        var_6d399a908d913b0b = vectornormalize(groundpos - camerapos);
        cameraang = vectortoanglessafe(var_6d399a908d913b0b, (0, 0, 1));
        camerapos = camerapos + calculatecameraoffset(team, groundpos);
        if (!isdefined(level.spawncameras[key])) {
            level.spawncameras[key] = [];
        }
        if (!isdefined(level.spawncameras[key][team])) {
            level.spawncameras[key][team] = spawn("script_origin", (0, 0, 0));
        }
        level.spawncameras[key][team].origin = camerapos;
        level.spawncameras[key][team].angles = cameraang;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c4
// Size: 0x255
function calculatecameraoffset(team, var_800054ca1a89dace) {
    switch (level.mapname) {
    case #"hash_7a28db3c5928c489":
        var_fc87d6fc10744d44 = 0.25;
        var_6e9b9701b439aeb7 = 0.35;
        break;
    case #"hash_863773b8960b3944":
        var_fc87d6fc10744d44 = 0.25;
        var_6e9b9701b439aeb7 = 0.8;
        break;
    case #"hash_a8b272dba33a4aed":
        var_fc87d6fc10744d44 = 0.5;
        var_6e9b9701b439aeb7 = 0.3;
        break;
    default:
        var_fc87d6fc10744d44 = 0;
        var_6e9b9701b439aeb7 = 0;
        break;
    }
    var_46f432042b3473d8 = distance(var_800054ca1a89dace, level.hqmidpoint);
    if (var_46f432042b3473d8 < 2048) {
        return (0, 0, 0);
    }
    if (team == "axis") {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, var_800054ca1a89dace);
        var_3b776694eeac2beb = level.hqvecttomid_axis;
    } else {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, var_800054ca1a89dace);
        var_3b776694eeac2beb = level.hqvecttomid_allies;
    }
    if (var_4881f7fe7fc2bae2 < 2048) {
        return (var_3b776694eeac2beb * var_fc87d6fc10744d44);
    }
    if (var_4881f7fe7fc2bae2 > level.hqdisttomid) {
        if (team == "axis") {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, var_800054ca1a89dace);
        } else {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, var_800054ca1a89dace);
        }
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = var_3b776694eeac2beb * var_6e9b9701b439aeb7 * -1 * percentage / 100;
        return offset;
    } else {
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = var_3b776694eeac2beb * var_fc87d6fc10744d44 * percentage / 100;
        return offset;
    }
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4420
// Size: 0x3a
function function_581a8fc6f76d525d() {
    return !istrue(level.disablespawncamera) && istrue(namespace_4b0406965e556711::gameflag("prematch_done")) && !istrue(self.skipspawncamera) && !istrue(level.usespawnselection);
}

// Namespace namespace_dc51de4e8cbd07b/namespace_d7fe36703a9572fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4462
// Size: 0x3b
function function_cdff2f0b5dcf3aa1() {
    self.var_1305ad103fdd8962 = 1;
    var_dc51de4e8cbd07b = namespace_d7fe36703a9572fe::getspawncamera();
    var_11f3b4465c8b637b = namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_dc51de4e8cbd07b.origin);
}

