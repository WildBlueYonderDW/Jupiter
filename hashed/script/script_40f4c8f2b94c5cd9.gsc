// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using script_6775ad452d13858;
#using scripts\mp\teams.gsc;
#using script_2669878cf5a1b6bc;

#namespace namespace_c5853ef8c38ba76e;

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x274
// Size: 0x69
function create_animpack(anime) {
    pack = spawnstruct();
    pack.ents = [];
    pack.players = [];
    pack.cam = undefined;
    pack.var_5ba8db57a9811d96 = [];
    pack.anime = anime;
    pack.packs = [];
    return pack;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x21
function function_5c32248dfffac064() {
    if (!getdvarint(@"hash_88262f900b40e276", 0)) {
        return;
    }
    self.var_52738e0a99ed242b = 1;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30d
// Size: 0x16
function function_2d4c340dd3908b2d(fov) {
    self.fov = fov;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x5e
function function_b8f86028bcc64f84(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c) {
    self.fstop = fstop;
    self.var_ed8206fef1806fef = var_ed8206fef1806fef;
    self.focusspeed = focusspeed;
    self.aperturespeed = aperturespeed;
    self.var_c06551440b16249c = var_c06551440b16249c;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f
// Size: 0x4b
function add_pack_modelanim(ent, animation) {
    level.scr_anim[ent.animname][self.anime] = animation;
    self.ents[self.ents.size] = ent;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e1
// Size: 0x28
function add_pack_startfunc(paramarray, func) {
    self.startfunc = func;
    self.paramarray = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x410
// Size: 0x28
function function_decf1e23d78d0944(paramarray, func) {
    self.endfunc = func;
    self.var_315361abd838fad4 = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0x28
function function_e718ba63d511fcde(paramarray, func) {
    self.var_eedb5fb15eb26bfa = func;
    self.var_5ab13b55d7ceff80 = paramarray;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e
// Size: 0x16
function function_6098f3014cd4c598(var_56508e6f58221410) {
    self.var_56508e6f58221410 = var_56508e6f58221410;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b
// Size: 0x16
function function_6372afdc0e9ee2dd(var_9ab9fefe4d2846b1) {
    self.var_9ab9fefe4d2846b1 = var_9ab9fefe4d2846b1;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c9
// Size: 0x44
function add_pack_camanim(animation, var_437b6bb41d98df26) {
    self.cam = 1;
    level.scr_anim["endingCam"][self.anime] = animation;
    self.var_437b6bb41d98df26 = var_437b6bb41d98df26;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x614
// Size: 0x3a
function add_pack_fx(fxid, origin, angles) {
    self.fx = fxid;
    self.fxorigin = origin;
    self.fxangles = angles;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x655
// Size: 0x22
function function_707983b9fdb53c55(rig) {
    self.var_5ba8db57a9811d96[self.var_5ba8db57a9811d96.size] = rig;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67e
// Size: 0x136
function spawn_script_model(modelname, animname, var_31093158b2292193) {
    model = spawn("script_model", self.origin);
    model setmodel(modelname);
    model forcenetfieldhighlod(1);
    if (!isdefined(animname)) {
        animname = modelname;
    }
    model.animname = animname;
    model useanimtree(%script_model);
    if (isdefined(var_31093158b2292193)) {
        model.linkedents = [];
        foreach (var_c30d717b67553796 in var_31093158b2292193) {
            extra = spawn("script_model", self.origin);
            extra setmodel(var_c30d717b67553796[0]);
            extra forcenetfieldhighlod(1);
            extra linkto(model, var_c30d717b67553796[1], (0, 0, 0), (0, 0, 0));
            model.linkedents[model.linkedents.size] = extra;
        }
    }
    return model;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc
// Size: 0xad
function function_38c7f6bc1deef269(modelname, animname, vehicletype) {
    if (!isdefined(animname)) {
        animname = modelname;
    }
    vehicle = spawnvehicle(modelname, animname, vehicletype, self.origin, self.angles);
    vehicle.animname = animname;
    vehicle.var_90acdd32579dcb16 = 1;
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x871
// Size: 0x5f
function function_c880edba9face762(var_e25d1d189177a7c) {
    var_5c3c95908409974f = "exfil_" + var_e25d1d189177a7c + "_light_origin";
    var_ef5f42dc3bae2a88 = getstruct(var_5c3c95908409974f, "targetname");
    if (!isdefined(level.var_b71cf533392c0371)) {
        level.var_b71cf533392c0371 = [];
    }
    level.var_b71cf533392c0371[var_5c3c95908409974f] = var_ef5f42dc3bae2a88;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d7
// Size: 0x3e
function function_fce988291dbc4649(var_e25d1d189177a7c) {
    if (!isdefined(level.var_b71cf533392c0371)) {
        return undefined;
    }
    var_5c3c95908409974f = "exfil_" + var_e25d1d189177a7c + "_light_origin";
    return level.var_b71cf533392c0371[var_5c3c95908409974f];
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91d
// Size: 0x362
function function_8c2d124dbef4fa60(var_e25d1d189177a7c, linkent) {
    rig = spawnstruct();
    var_5e0676140eecdf2d = "exfil_" + var_e25d1d189177a7c + "_probe";
    var_4ae45078df12c7a7 = "exfil_" + var_e25d1d189177a7c + "_light";
    probes = getentarray(var_5e0676140eecdf2d, "script_noteworthy");
    lights = getentarray(var_4ae45078df12c7a7, "targetname");
    var_ef5f42dc3bae2a88 = function_fce988291dbc4649(var_e25d1d189177a7c);
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
    var_fab0539668dba4b7 = var_ef5f42dc3bae2a88.origin;
    var_3694a4e650566a39 = var_ef5f42dc3bae2a88.angles;
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
            probe.origin_offset = var_542e3e93b710380f - var_fab0539668dba4b7;
            probe.angles_offset = var_7434c0613f2501b1 - var_3694a4e650566a39;
        }
    }
    foreach (light in lights) {
        if (!isdefined(light.origin_offset) && !isdefined(light.angles_offset)) {
            var_24cd9408147d26c5 = light.origin;
            var_658dc910dd6c771b = light.angles;
            if (!isdefined(light.angles)) {
                var_658dc910dd6c771b = (0, 0, 0);
            }
            light.origin_offset = var_24cd9408147d26c5 - var_fab0539668dba4b7;
            light.angles_offset = var_658dc910dd6c771b - var_3694a4e650566a39;
        }
    }
    rig.probes = probes;
    rig.lights = lights;
    rig.linkent = linkent;
    function_89a2405953b84136(rig, 1);
    return rig;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc87
// Size: 0xf3
function private function_89a2405953b84136(rig, var_ac17789997e5b858) {
    if (!isdefined(rig)) {
        return;
    }
    foreach (probe in rig.probes) {
        probe hide();
    }
    foreach (light in rig.lights) {
        if (var_ac17789997e5b858 && !isdefined(light.original_intensity)) {
            light.original_intensity = light getlightintensity();
        }
        light setlightintensity(0);
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xd81
// Size: 0x1a5
function add_pack_characteranim(modelname, var_31093158b2292193, animation, var_f34379acba78a66b, var_a8542244fda27657) {
    model = spawn("script_model", self.origin);
    model setmodel(modelname);
    model forcenetfieldhighlod(1);
    model useanimtree(%script_model);
    if (isdefined(var_a8542244fda27657)) {
        animname = var_a8542244fda27657;
    } else {
        animname = modelname;
    }
    model.animname = animname;
    level.scr_anim[model.animname]["br_ending"] = animation;
    if (isdefined(var_f34379acba78a66b)) {
        if (isdefined(var_31093158b2292193)) {
            model.linkedents = [];
            foreach (var_c30d717b67553796 in var_31093158b2292193) {
                extra = spawn("script_model", self.origin);
                extra setmodel(var_c30d717b67553796[0]);
                extra forcenetfieldhighlod(1);
                extra linkto(model, var_c30d717b67553796[1], (0, 0, 0), (0, 0, 0));
                model.linkedents[model.linkedents.size] = extra;
            }
        }
    }
    self.pack.models[self.pack.models.size] = model;
    return model;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2e
// Size: 0xf9
function allplayers_setphysicaldof(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c) {
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
            player setphysicaldepthoffield(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c);
        } else if (isdefined(aperturespeed)) {
            player setphysicaldepthoffield(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed);
        } else if (isdefined(focusspeed)) {
            player setphysicaldepthoffield(fstop, var_ed8206fef1806fef, focusspeed);
        } else {
            player setphysicaldepthoffield(fstop, var_ed8206fef1806fef);
        }
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e
// Size: 0x7c
function allplayers_setfov(fov) {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", fov);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1223
// Size: 0x122
function create_disconnectplayer(animstruct) {
    var_382d2566050de89a = spawn("script_model", self.origin);
    var_382d2566050de89a setmodel("tag_origin");
    var_382d2566050de89a forcenetfieldhighlod(1);
    var_382d2566050de89a.isdisconnectplayer = 1;
    var_382d2566050de89a.brexfilanimname = "player0";
    var_382d2566050de89a.origin = animstruct.origin;
    var_382d2566050de89a.angles = animstruct.angles;
    var_382d2566050de89a create_player_rig(var_382d2566050de89a.brexfilanimname, "viewhands_base_iw8", animstruct);
    if (getdvarint(@"hash_bc95d8892007ebfd", 1)) {
        var_382d2566050de89a function_50962e9f971266e(var_382d2566050de89a.brexfilanimname, animstruct.origin);
    }
    var_382d2566050de89a linkto(var_382d2566050de89a.player_rig, "tag_player", (0, 0, 0), (0, 0, 0));
    level thread ending_player_disconnect_thread(var_382d2566050de89a, 1);
    animstruct.winners[0] = var_382d2566050de89a;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x134c
// Size: 0xb1
function ending_player_disconnect_thread(player, var_8d259c975723aedc) {
    rig = player.player_rig;
    var_a0b64bd11aa5b217 = isplayer(player);
    if (!isdefined(var_8d259c975723aedc)) {
        player waittill("disconnect");
    } else {
        wait(0.1);
    }
    if (!isdefined(rig)) {
        return;
    }
    if (getdvarint(@"hash_bc95d8892007ebfd", 1) && isdefined(rig.var_7d489a3282f9cce0)) {
        rig.var_7d489a3282f9cce0.var_f941525e6acdeac = undefined;
        rig notify("update_avatar_visibility");
    } else {
        playfxontag(getfx("player_disconnect"), rig, "tag_player");
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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
    self.player_rig.cinematic_motion_override = &namespace_7624a117b05021c5::handlecinematicmotionnotetrack;
    self.player_rig.dof_func = &namespace_7624a117b05021c5::handledofnotetrack;
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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
        var_bfbf0d4002dd345 = [0:"milsim_western_a", 1:"milsim_western_b", 2:"milsim_western_c", 3:"milsim_western_d", 4:"milsim_eastern_a", 5:"milsim_eastern_b", 6:"milsim_eastern_c", 7:"milsim_eastern_d"];
        var_5864ea4e21a60cd4 = function_7a2aaa4a09a4d250(var_bfbf0d4002dd345);
        bodymodelname = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_5864ea4e21a60cd4);
        headmodelname = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_5864ea4e21a60cd4);
        gender = namespace_6d8da2b47f878104::getoperatorgender(var_5864ea4e21a60cd4);
    }
    var_7d489a3282f9cce0 = spawn("script_model", origin);
    var_7d489a3282f9cce0 setmodel("fullbody_usmc_ar_br_infil");
    var_7d489a3282f9cce0 function_dd6d30b9ec87c1b3(bodymodelname, headmodelname, "iw9_avatar_scriptable_mp");
    var_7d489a3282f9cce0.operatorcustomization = spawnstruct();
    var_7d489a3282f9cce0.operatorcustomization.gender = gender;
    var_7d489a3282f9cce0 hide();
    var_7d489a3282f9cce0.animname = animname;
    var_7d489a3282f9cce0.winindex = self.winindex;
    var_7d489a3282f9cce0 forcenetfieldhighlod(1);
    weaponobj = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4", [], "none", "none");
    var_7bc1c35c0ab292c2 = spawn("script_weapon", origin, 0, 0, weaponobj);
    var_7bc1c35c0ab292c2 hide();
    var_7bc1c35c0ab292c2 forcenetfieldhighlod(1);
    var_7bc1c35c0ab292c2 linkto(var_7d489a3282f9cce0, "j_gun", (0, 0, 0), (0, 0, 0));
    var_7d489a3282f9cce0.var_7bc1c35c0ab292c2 = var_7bc1c35c0ab292c2;
    var_7d489a3282f9cce0.var_f941525e6acdeac = 1;
    var_7d489a3282f9cce0.forcehide = 0;
    self.player_rig.var_7d489a3282f9cce0 = var_7d489a3282f9cce0;
    self.player_rig thread function_2839481298d2e5f4();
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x191c
// Size: 0xf9
function function_2839481298d2e5f4() {
    var_7d489a3282f9cce0 = self.var_7d489a3282f9cce0;
    player = self.player;
    if (isplayer(player)) {
        var_7d489a3282f9cce0.var_f941525e6acdeac = 1;
    }
    var_7d489a3282f9cce0.forcehide = 0;
    self endon("death");
    while (1) {
        self waittill("update_avatar_visibility");
        if (!isdefined(var_7d489a3282f9cce0)) {
            return;
        }
        shouldshow = !istrue(var_7d489a3282f9cce0.var_f941525e6acdeac) && !istrue(var_7d489a3282f9cce0.forcehide);
        if (shouldshow) {
            var_7d489a3282f9cce0 show();
            if (isdefined(var_7d489a3282f9cce0.var_7bc1c35c0ab292c2) && !istrue(var_7d489a3282f9cce0.var_13a06fdf296dc555)) {
                var_7d489a3282f9cce0.var_7bc1c35c0ab292c2 show();
            }
        } else {
            var_7d489a3282f9cce0 hide();
            if (isdefined(var_7d489a3282f9cce0.var_7bc1c35c0ab292c2)) {
                var_7d489a3282f9cce0.var_7bc1c35c0ab292c2 hide();
            }
        }
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1c
// Size: 0x53
function function_e874fd3a9c016379(var_cbb44b27d7364405, var_cbaf46af6f07196) {
    if (isdefined(self.var_7d489a3282f9cce0)) {
        self.var_7d489a3282f9cce0.forcehide = var_cbb44b27d7364405;
        self.var_7d489a3282f9cce0.var_13a06fdf296dc555 = var_cbaf46af6f07196;
        self notify("update_avatar_visibility");
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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
        if (isdefined(self.player_rig.var_7d489a3282f9cce0)) {
            if (isdefined(self.player_rig.var_7d489a3282f9cce0.var_7bc1c35c0ab292c2)) {
                self.player_rig.var_7d489a3282f9cce0.var_7bc1c35c0ab292c2 delete();
            }
            self.player_rig.var_7d489a3282f9cce0 delete();
        }
        self.player_rig delete();
    }
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf8
// Size: 0xa4
function function_3f005b301ec7f15b(var_acd8faa0e7dde1b2, var_e26f44acad48ddd1, var_c447f0ac96c38753, originoffset, radius, height, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.var_e26f44acad48ddd1 = var_e26f44acad48ddd1;
    newstruct.var_c447f0ac96c38753 = var_c447f0ac96c38753;
    newstruct.originoffset = originoffset;
    newstruct.var_715d3504e80c76e9 = radius;
    newstruct.var_c580ce41c807e164 = height;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    var_acd8faa0e7dde1b2[var_acd8faa0e7dde1b2.size] = newstruct;
    return var_acd8faa0e7dde1b2;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca4
// Size: 0xa4
function function_f317a6f0ae25e3d4(var_acd8faa0e7dde1b2, modelname, var_e26f44acad48ddd1, var_c447f0ac96c38753, originoffset, radius, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.modelname = modelname;
    newstruct.var_e26f44acad48ddd1 = var_e26f44acad48ddd1;
    newstruct.var_c447f0ac96c38753 = var_c447f0ac96c38753;
    newstruct.originoffset = originoffset;
    newstruct.var_c77e7a25454430da = radius;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    var_acd8faa0e7dde1b2[var_acd8faa0e7dde1b2.size] = newstruct;
    return var_acd8faa0e7dde1b2;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d50
// Size: 0xa4
function function_19ae50e23fe0625a(var_acd8faa0e7dde1b2, modelname, var_e26f44acad48ddd1, originoffset, radius, numsegments, var_d4364a524e8a2bcd) {
    newstruct = spawnstruct();
    newstruct.modelname = modelname;
    newstruct.var_e26f44acad48ddd1 = var_e26f44acad48ddd1;
    newstruct.originoffset = originoffset;
    newstruct.var_c77e7a25454430da = radius;
    newstruct.numsegments = numsegments;
    newstruct.var_d4364a524e8a2bcd = var_d4364a524e8a2bcd;
    var_acd8faa0e7dde1b2[var_acd8faa0e7dde1b2.size] = newstruct;
    return var_acd8faa0e7dde1b2;
}

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dfc
// Size: 0x14b
function function_c300d34e34164b6d(var_cd1bd4a1058452da, var_95a318d022e623a7, var_1bb7594c18d17443) {
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
    if (isdefined(var_cd1bd4a1058452da) && var_cd1bd4a1058452da > 0) {
        overlay.alpha = 0;
        overlay fadeovertime(var_cd1bd4a1058452da);
        overlay.alpha = 1;
        wait(var_cd1bd4a1058452da);
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

// Namespace namespace_c5853ef8c38ba76e/namespace_66f3c297681603ad
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4e
// Size: 0x146
function function_3681a4700f5bb7c1(var_cd1bd4a1058452da, var_1bb7594c18d17443, var_b803dabf9e451915) {
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
    if (isdefined(var_cd1bd4a1058452da) && var_cd1bd4a1058452da > 0) {
        overlay.alpha = 0;
        overlay fadeovertime(var_cd1bd4a1058452da);
        overlay.alpha = 1;
        wait(var_cd1bd4a1058452da);
    } else {
        overlay.alpha = 1;
    }
    if (isdefined(var_b803dabf9e451915)) {
        level waittill(var_b803dabf9e451915);
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

