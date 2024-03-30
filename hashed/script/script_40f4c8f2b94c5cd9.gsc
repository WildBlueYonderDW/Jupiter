// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using script_6775ad452d13858;
#using scripts\mp\teams.gsc;
#using script_2669878cf5a1b6bc;

#namespace namespace_c5853ef8c38ba76e;

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x69
function create_animpack(anime) {
    pack = spawnstruct();
    pack.ents = [];
    pack.players = [];
    pack.cam = undefined;
    pack.lightingrigs = [];
    pack.anime = anime;
    pack.packs = [];
    return pack;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x21
function function_5c32248dfffac064() {
    if (!getdvarint(@"hash_88262f900b40e276", 0)) {
        return;
    }
    self.var_52738e0a99ed242b = 1;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x16
function function_2d4c340dd3908b2d(fov) {
    self.fov = fov;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x5e
function function_b8f86028bcc64f84(fstop, focusdist, focusspeed, aperturespeed, var_c06551440b16249c) {
    self.fstop = fstop;
    self.focusdist = focusdist;
    self.focusspeed = focusspeed;
    self.aperturespeed = aperturespeed;
    self.var_c06551440b16249c = var_c06551440b16249c;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f
// Size: 0x4b
function add_pack_modelanim(ent, animation) {
    level.scr_anim[ent.animname][self.anime] = animation;
    self.ents[self.ents.size] = ent;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e1
// Size: 0x28
function add_pack_startfunc(paramarray, func) {
    self.startfunc = func;
    self.paramarray = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410
// Size: 0x28
function function_decf1e23d78d0944(paramarray, func) {
    self.endfunc = func;
    self.var_315361abd838fad4 = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0x28
function function_e718ba63d511fcde(paramarray, func) {
    self.playerfunc = func;
    self.var_5ab13b55d7ceff80 = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e
// Size: 0x16
function function_6098f3014cd4c598(fadeinlength) {
    self.fadeinlength = fadeinlength;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b
// Size: 0x16
function function_6372afdc0e9ee2dd(fadeoutlength) {
    self.fadeoutlength = fadeoutlength;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a8
// Size: 0x11a
function add_pack_playeranim(player, var_f8896cb359eab159, var_b1e61449da6ba188) {
    if (!isdefined(player)) {
        return;
    }
    animname = undefined;
    if (!isdefined(player.brexfilanimname)) {
        animname = "player" + player getentitynumber();
        player.animname = animname;
        player.brexfilanimname = animname;
    } else {
        animname = player.brexfilanimname;
    }
    self.players[self.players.size] = player;
    animation = var_f8896cb359eab159;
    if (isdefined(var_b1e61449da6ba188)) {
        if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.gender) && player.operatorcustomization.gender == "female") {
            animation = var_b1e61449da6ba188;
        }
    }
    level.scr_anim[animname][self.anime] = animation;
    level.scr_eventanim[animname][self.anime] = getanimname(animation);
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9
// Size: 0x44
function add_pack_camanim(animation, xcamasset) {
    self.cam = 1;
    level.scr_anim["endingCam"][self.anime] = animation;
    self.xcamasset = xcamasset;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x614
// Size: 0x3a
function add_pack_fx(fxid, origin, angles) {
    self.fx = fxid;
    self.fxorigin = origin;
    self.fxangles = angles;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0x22
function function_707983b9fdb53c55(rig) {
    self.lightingrigs[self.lightingrigs.size] = rig;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e
// Size: 0x136
function spawn_script_model(modelname, animname, extramodels) {
    model = spawn("script_model", self.origin);
    model setmodel(modelname);
    model forcenetfieldhighlod(1);
    if (!isdefined(animname)) {
        animname = modelname;
    }
    model.animname = animname;
    model useanimtree(%script_model);
    if (isdefined(extramodels)) {
        model.linkedents = [];
        foreach (modeltag in extramodels) {
            extra = spawn("script_model", self.origin);
            extra setmodel(modeltag[0]);
            extra forcenetfieldhighlod(1);
            extra linkto(model, modeltag[1], (0, 0, 0), (0, 0, 0));
            model.linkedents[model.linkedents.size] = extra;
        }
    }
    return model;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc
// Size: 0xad
function function_38c7f6bc1deef269(modelname, animname, vehicletype) {
    if (!isdefined(animname)) {
        animname = modelname;
    }
    vehicle = spawnvehicle(modelname, animname, vehicletype, self.origin, self.angles);
    vehicle.animname = animname;
    vehicle.endingvehicle = 1;
    vehicle.vehiclename = vehicletype;
    vehicle setcandamage(0);
    if (vehicle vehicle_isphysveh()) {
        vehicle function_247ad6a91f6a4ffe(1);
        vehicle vehphys_forcekeyframedmotion();
    } else {
        vehicle notsolid();
    }
    vehicle vehicle_turnengineoff();
    vehicle function_97e11a84480635bc(1);
    return vehicle;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0x5f
function function_c880edba9face762(scenename) {
    origin_name = "exfil_" + scenename + "_light_origin";
    orgstruct = getstruct(origin_name, "targetname");
    if (!isdefined(level.lighting_rigs)) {
        level.lighting_rigs = [];
    }
    level.lighting_rigs[origin_name] = orgstruct;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7
// Size: 0x3e
function function_fce988291dbc4649(scenename) {
    if (!isdefined(level.lighting_rigs)) {
        return undefined;
    }
    origin_name = "exfil_" + scenename + "_light_origin";
    return level.lighting_rigs[origin_name];
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x362
function function_8c2d124dbef4fa60(scenename, linkent) {
    rig = spawnstruct();
    var_5e0676140eecdf2d = "exfil_" + scenename + "_probe";
    light_name = "exfil_" + scenename + "_light";
    probes = getentarray(var_5e0676140eecdf2d, "script_noteworthy");
    lights = getentarray(light_name, "targetname");
    orgstruct = function_fce988291dbc4649(scenename);
    if (!isdefined(probes) || !probes.size) {
        return undefined;
    }
    foreach (p in probes) {
        if (!isdefined(p)) {
            return undefined;
        }
    }
    if (!isdefined(lights) || !lights.size) {
        return undefined;
    }
    foreach (l in lights) {
        if (!isdefined(l)) {
            return undefined;
        }
    }
    orgorigin = orgstruct.origin;
    var_3694a4e650566a39 = orgstruct.angles;
    if (!isdefined(var_3694a4e650566a39)) {
        var_3694a4e650566a39 = (0, 0, 0);
    }
    foreach (probe in probes) {
        if (!isdefined(probe.origin_offset) && !isdefined(probe.angles_offset)) {
            var_542e3e93b710380f = probe.origin;
            var_7434c0613f2501b1 = probe.angles;
            if (!isdefined(var_7434c0613f2501b1)) {
                var_7434c0613f2501b1 = (0, 0, 0);
            }
            probe.origin_offset = var_542e3e93b710380f - orgorigin;
            probe.angles_offset = var_7434c0613f2501b1 - var_3694a4e650566a39;
        }
    }
    foreach (light in lights) {
        if (!isdefined(light.origin_offset) && !isdefined(light.angles_offset)) {
            lightorigin = light.origin;
            var_658dc910dd6c771b = light.angles;
            if (!isdefined(light.angles)) {
                var_658dc910dd6c771b = (0, 0, 0);
            }
            light.origin_offset = lightorigin - orgorigin;
            light.angles_offset = var_658dc910dd6c771b - var_3694a4e650566a39;
        }
    }
    rig.probes = probes;
    rig.lights = lights;
    rig.linkent = linkent;
    function_89a2405953b84136(rig, 1);
    return rig;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc87
// Size: 0xf3
function private function_89a2405953b84136(rig, override_og) {
    if (!isdefined(rig)) {
        return;
    }
    foreach (probe in rig.probes) {
        probe hide();
    }
    foreach (light in rig.lights) {
        if (override_og && !isdefined(light.original_intensity)) {
            light.original_intensity = light getlightintensity();
        }
        light setlightintensity(0);
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xd81
// Size: 0x1a5
function add_pack_characteranim(modelname, extramodels, animation, animstr, animnameoverride) {
    model = spawn("script_model", self.origin);
    model setmodel(modelname);
    model forcenetfieldhighlod(1);
    model useanimtree(%script_model);
    if (isdefined(animnameoverride)) {
        animname = animnameoverride;
    } else {
        animname = modelname;
    }
    model.animname = animname;
    level.scr_anim[model.animname]["br_ending"] = animation;
    if (isdefined(animstr)) {
        if (isdefined(extramodels)) {
            model.linkedents = [];
            foreach (modeltag in extramodels) {
                extra = spawn("script_model", self.origin);
                extra setmodel(modeltag[0]);
                extra forcenetfieldhighlod(1);
                extra linkto(model, modeltag[1], (0, 0, 0), (0, 0, 0));
                model.linkedents[model.linkedents.size] = extra;
            }
        }
    }
    self.pack.models[self.pack.models.size] = model;
    return model;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2e
// Size: 0xf9
function allplayers_setphysicaldof(fstop, focusdist, focusspeed, aperturespeed, var_c06551440b16249c) {
    if (!isdefined(focusspeed)) {
        focusspeed = 100;
    }
    if (!isdefined(aperturespeed)) {
        aperturespeed = 100;
    }
    foreach (player in level.players) {
        if (!isdefined(player.scriptedphysicaldofenabled)) {
            player.scriptedphysicaldofenabled = 1;
            player enablephysicaldepthoffieldscripting();
        }
        if (isdefined(var_c06551440b16249c)) {
            player setphysicaldepthoffield(fstop, focusdist, focusspeed, aperturespeed, var_c06551440b16249c);
            continue;
        }
        if (isdefined(aperturespeed)) {
            player setphysicaldepthoffield(fstop, focusdist, focusspeed, aperturespeed);
            continue;
        }
        if (isdefined(focusspeed)) {
            player setphysicaldepthoffield(fstop, focusdist, focusspeed);
            continue;
        }
        player setphysicaldepthoffield(fstop, focusdist);
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e
// Size: 0x7c
function allplayers_setfov(fov) {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", fov);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10b1
// Size: 0x8b
function function_cf47ab3f9defe35b() {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", 65);
        player setclientdvar(@"hash_86bf34d5f48fa435", 65);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1143
// Size: 0x71
function allplayers_clearphysicaldof() {
    foreach (player in level.players) {
        if (isdefined(player.scriptedphysicaldofenabled)) {
            player.scriptedphysicaldofenabled = undefined;
            player disablephysicaldepthoffieldscripting();
        }
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11bb
// Size: 0x61
function chopperexfil_set_brcircle() {
    if (!isdefined(level.br_circle)) {
        return;
    }
    if (!isdefined(level.br_circle.dangercircleent)) {
        return;
    }
    level.br_circle.dangercircleent brcirclemoveto(self.origin[0], self.origin[1], 9000, 0.05);
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1223
// Size: 0x122
function create_disconnectplayer(animstruct) {
    tempplayer = spawn("script_model", self.origin);
    tempplayer setmodel("tag_origin");
    tempplayer forcenetfieldhighlod(1);
    tempplayer.isdisconnectplayer = 1;
    tempplayer.brexfilanimname = "player0";
    tempplayer.origin = animstruct.origin;
    tempplayer.angles = animstruct.angles;
    tempplayer create_player_rig(tempplayer.brexfilanimname, "viewhands_base_iw8", animstruct);
    if (getdvarint(@"hash_bc95d8892007ebfd", 1)) {
        tempplayer function_50962e9f971266e(tempplayer.brexfilanimname, animstruct.origin);
    }
    tempplayer linkto(tempplayer.player_rig, "tag_player", (0, 0, 0), (0, 0, 0));
    level thread ending_player_disconnect_thread(tempplayer, 1);
    animstruct.winners[0] = tempplayer;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134c
// Size: 0xb1
function ending_player_disconnect_thread(player, skipwaittill) {
    rig = player.player_rig;
    wasplayer = isplayer(player);
    if (!isdefined(skipwaittill)) {
        player waittill("disconnect");
    } else {
        wait(0.1);
    }
    if (!isdefined(rig)) {
        return;
    }
    if (getdvarint(@"hash_bc95d8892007ebfd", 1) && isdefined(rig.avatar)) {
        rig.avatar.playerexists = undefined;
        rig notify("update_avatar_visibility");
        return;
    }
    playfxontag(getfx("player_disconnect"), rig, "tag_player");
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1404
// Size: 0x51
function create_cam() {
    model = spawn("script_model", self.origin);
    model setmodel("tag_origin");
    model forcenetfieldhighlod(1);
    model useanimtree(%script_model);
    model.animname = "endingCam";
    return model;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145d
// Size: 0x232
function create_player_rig(animname, var_486db5fa512a3b6b, animstruct, var_40a4287d8d2e7ef9) {
    self.animname = animname;
    origin = animstruct.origin;
    if (!isdefined(origin)) {
        origin = (0, 0, 0);
    }
    player_rig = spawn("script_model", origin);
    player_rig.player = self;
    self.player_rig = player_rig;
    self.player_rig setmodel(var_486db5fa512a3b6b);
    self.player_rig hide();
    self.player_rig.animname = animname;
    self.player_rig useanimtree(%script_model);
    self.player_rig.winindex = self.winindex;
    self.player_rig forcenetfieldhighlod(1);
    self.player_rig.cinematic_motion_override = &scripts/mp/utility/infilexfil::handlecinematicmotionnotetrack;
    self.player_rig.dof_func = &scripts/mp/utility/infilexfil::handledofnotetrack;
    if (!isdefined(animstruct.player_rigs)) {
        animstruct.player_rigs = [];
    }
    if (isplayer(self)) {
        self playerlinktodelta(self.player_rig, "tag_player", 1, 0, 0, 0, 0, 1);
        /#
            println("milsim_eastern_d" + self.name + "<unknown string>" + animname + "<unknown string>" + isdefined(self.player_rig));
        #/
        animstruct.player_rigs[animstruct.player_rigs.size] = self.player_rig;
        self.player_rig.playernum = self getentitynumber();
    } else {
        /#
            println("<unknown string>" + animname + "<unknown string>" + isdefined(self.player_rig));
        #/
        self.player_rig.winindex = 0;
        self.player_rig.playernum = 0;
    }
    self notify("rig_created");
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1696
// Size: 0x27f
function function_50962e9f971266e(animname, origin) {
    /#
        assert(isdefined(self.player_rig));
    #/
    bodymodelname = "";
    headmodelname = "";
    gender = "";
    if (isplayer(self) && isdefined(self.operatorcustomization)) {
        bodymodelname = self.operatorcustomization.body;
        headmodelname = self.operatorcustomization.head;
        gender = self.operatorcustomization.gender;
    } else {
        operatorskins = ["milsim_western_a", "milsim_western_b", "milsim_western_c", "milsim_western_d", "milsim_eastern_a", "milsim_eastern_b", "milsim_eastern_c", "milsim_eastern_d"];
        operatorskin = array_random(operatorskins);
        bodymodelname = namespace_465d40bb08a5337a::function_8eba78e65f4be793(operatorskin);
        headmodelname = namespace_465d40bb08a5337a::function_223061772e2a61b9(operatorskin);
        gender = scripts/mp/teams::getoperatorgender(operatorskin);
    }
    avatar = spawn("script_model", origin);
    avatar setmodel("fullbody_usmc_ar_br_infil");
    avatar function_dd6d30b9ec87c1b3(bodymodelname, headmodelname, "iw9_avatar_scriptable_mp");
    avatar.operatorcustomization = spawnstruct();
    avatar.operatorcustomization.gender = gender;
    avatar hide();
    avatar.animname = animname;
    avatar.winindex = self.winindex;
    avatar forcenetfieldhighlod(1);
    weaponobj = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4", [], "none", "none");
    weaponent = spawn("script_weapon", origin, 0, 0, weaponobj);
    weaponent hide();
    weaponent forcenetfieldhighlod(1);
    weaponent linkto(avatar, "j_gun", (0, 0, 0), (0, 0, 0));
    avatar.weaponent = weaponent;
    avatar.playerexists = 1;
    avatar.forcehide = 0;
    self.player_rig.avatar = avatar;
    self.player_rig thread function_2839481298d2e5f4();
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191c
// Size: 0xf9
function function_2839481298d2e5f4() {
    avatar = self.avatar;
    player = self.player;
    if (isplayer(player)) {
        avatar.playerexists = 1;
    }
    avatar.forcehide = 0;
    self endon("death");
    while (true) {
        self waittill("update_avatar_visibility");
        if (!isdefined(avatar)) {
            return;
        }
        shouldshow = !istrue(avatar.playerexists) && !istrue(avatar.forcehide);
        if (shouldshow) {
            avatar show();
            if (isdefined(avatar.weaponent) && !istrue(avatar.forcehideweapons)) {
                avatar.weaponent show();
            }
            continue;
        }
        avatar hide();
        if (isdefined(avatar.weaponent)) {
            avatar.weaponent hide();
        }
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x53
function function_e874fd3a9c016379(shouldforcehide, var_cbaf46af6f07196) {
    if (isdefined(self.avatar)) {
        self.avatar.forcehide = shouldforcehide;
        self.avatar.forcehideweapons = var_cbaf46af6f07196;
        self notify("update_avatar_visibility");
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a76
// Size: 0xd8
function remove_player_rig() {
    if (isdefined(self)) {
        /#
            println("<unknown string>" + self.name + "<unknown string>" + self.animname + "<unknown string>" + isdefined(self.player_rig));
        #/
        self unlink();
    }
    if (isdefined(self.player_rig)) {
        if (isdefined(self.player_rig.avatar)) {
            if (isdefined(self.player_rig.avatar.weaponent)) {
                self.player_rig.avatar.weaponent delete();
            }
            self.player_rig.avatar delete();
        }
        self.player_rig delete();
    }
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b55
// Size: 0x9b
function get_center_of_array(array) {
    center = (0, 0, 0);
    for (i = 0; i < array.size; i++) {
        center = (center[0] + array[i].origin[0], center[1] + array[i].origin[1], center[2] + array[i].origin[2]);
    }
    if (array.size != 0) {
        return (center[0] / array.size, center[1] / array.size, center[2] / array.size);
    }
    return undefined;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf8
// Size: 0xa4
function function_3f005b301ec7f15b(testarray, animref, animpct, originoffset, radius, height, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.animref = animref;
    newstruct.animpct = animpct;
    newstruct.originoffset = originoffset;
    newstruct.cylinderradius = radius;
    newstruct.cylinderheight = height;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    testarray[testarray.size] = newstruct;
    return testarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca4
// Size: 0xa4
function function_f317a6f0ae25e3d4(testarray, modelname, animref, animpct, originoffset, radius, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.modelname = modelname;
    newstruct.animref = animref;
    newstruct.animpct = animpct;
    newstruct.originoffset = originoffset;
    newstruct.sphereradius = radius;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    testarray[testarray.size] = newstruct;
    return testarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d50
// Size: 0xa4
function function_19ae50e23fe0625a(testarray, modelname, animref, originoffset, radius, numsegments, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.modelname = modelname;
    newstruct.animref = animref;
    newstruct.originoffset = originoffset;
    newstruct.sphereradius = radius;
    newstruct.numsegments = numsegments;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    testarray[testarray.size] = newstruct;
    return testarray;
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfc
// Size: 0x14b
function function_c300d34e34164b6d(fadedowntime, var_95a318d022e623a7, var_1bb7594c18d17443) {
    overlay = newhudelem();
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader("black", 640, 480);
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.sort = -1;
    overlay setshowinrealism(1);
    if (isdefined(fadedowntime) && fadedowntime > 0) {
        overlay.alpha = 0;
        overlay fadeovertime(fadedowntime);
        overlay.alpha = 1;
        wait(fadedowntime);
    } else {
        overlay.alpha = 1;
    }
    if (isdefined(var_95a318d022e623a7) && var_95a318d022e623a7 > 0) {
        wait(var_95a318d022e623a7);
    }
    if (isdefined(var_1bb7594c18d17443) && var_1bb7594c18d17443 > 0) {
        overlay.alpha = 1;
        overlay fadeovertime(var_1bb7594c18d17443);
        overlay.alpha = 0;
        wait(var_1bb7594c18d17443);
    } else {
        overlay.alpha = 0;
    }
    overlay destroy();
}

// Namespace namespace_c5853ef8c38ba76e / namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4e
// Size: 0x146
function function_3681a4700f5bb7c1(fadedowntime, var_1bb7594c18d17443, holdnotify) {
    overlay = newhudelem();
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader("black", 640, 480);
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.sort = -1;
    overlay setshowinrealism(1);
    if (isdefined(fadedowntime) && fadedowntime > 0) {
        overlay.alpha = 0;
        overlay fadeovertime(fadedowntime);
        overlay.alpha = 1;
        wait(fadedowntime);
    } else {
        overlay.alpha = 1;
    }
    if (isdefined(holdnotify)) {
        level waittill(holdnotify);
    }
    if (isdefined(var_1bb7594c18d17443) && var_1bb7594c18d17443 > 0) {
        overlay.alpha = 1;
        overlay fadeovertime(var_1bb7594c18d17443);
        overlay.alpha = 0;
        wait(var_1bb7594c18d17443);
    } else {
        overlay.alpha = 0;
    }
    overlay destroy();
}

