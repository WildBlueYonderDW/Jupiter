// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_75377e59f5becac8;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_e7bbffdd71331a9a;

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x452
// Size: 0x12d
function spawn_script_model(modelname, animname, var_31093158b2292193) {
    model = spawn("script_model", self.origin);
    model setmodel(modelname);
    model forcenetfieldhighlod(1);
    if (!isdefined(animname)) {
        animname = modelname;
    }
    model.animname = animname;
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

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x587
// Size: 0x5f
function function_c880edba9face762(var_e25d1d189177a7c) {
    var_5c3c95908409974f = "infil_" + var_e25d1d189177a7c + "_light_origin";
    var_ef5f42dc3bae2a88 = getstruct(var_5c3c95908409974f, "targetname");
    if (!isdefined(level.var_b71cf533392c0371)) {
        level.var_b71cf533392c0371 = [];
    }
    level.var_b71cf533392c0371[var_5c3c95908409974f] = var_ef5f42dc3bae2a88;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ed
// Size: 0x3e
function function_fce988291dbc4649(var_e25d1d189177a7c) {
    if (!isdefined(level.var_b71cf533392c0371)) {
        return undefined;
    }
    var_5c3c95908409974f = "infil_" + var_e25d1d189177a7c + "_light_origin";
    return level.var_b71cf533392c0371[var_5c3c95908409974f];
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x633
// Size: 0x347
function function_8c2d124dbef4fa60(var_e25d1d189177a7c, linkent) {
    rig = spawnstruct();
    var_5e0676140eecdf2d = "infil_" + var_e25d1d189177a7c + "_probe";
    var_4ae45078df12c7a7 = "infil_" + var_e25d1d189177a7c + "_light";
    probes = getentarray(var_5e0676140eecdf2d, "script_noteworthy");
    lights = getentarray(var_4ae45078df12c7a7, "targetname");
    var_ef5f42dc3bae2a88 = function_fce988291dbc4649(var_e25d1d189177a7c);
    if (!isdefined(probes)) {
        return undefined;
    }
    foreach (probe in probes) {
        if (!isdefined(probe)) {
            return undefined;
        }
    }
    if (!isdefined(lights)) {
        return undefined;
    }
    foreach (light in lights) {
        if (!isdefined(light)) {
            return undefined;
        }
    }
    if (!isdefined(var_ef5f42dc3bae2a88)) {
        return undefined;
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

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x982
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

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7c
// Size: 0x81
function create_animpack(anime, islooping) {
    pack = spawnstruct();
    pack.ents = [];
    pack.var_fb299adfd0f8bfc5 = [];
    pack.playerpositions = [];
    pack.var_3bd5282b118d27f8 = [];
    pack.var_5ba8db57a9811d96 = [];
    pack.anime = anime;
    pack.islooping = istrue(islooping);
    return pack;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb05
// Size: 0x16
function function_2d4c340dd3908b2d(fov) {
    self.fov = fov;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xb22
// Size: 0x5e
function function_b8f86028bcc64f84(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c) {
    self.fstop = fstop;
    self.var_ed8206fef1806fef = var_ed8206fef1806fef;
    self.focusspeed = focusspeed;
    self.aperturespeed = aperturespeed;
    self.var_c06551440b16249c = var_c06551440b16249c;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb87
// Size: 0x28
function add_pack_startfunc(paramarray, func) {
    self.startfunc = func;
    self.var_c65bb75cce61100f = paramarray;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb6
// Size: 0x28
function function_e718ba63d511fcde(paramarray, func) {
    self.var_eedb5fb15eb26bfa = func;
    self.var_5ab13b55d7ceff80 = paramarray;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe5
// Size: 0x73
function add_pack_modelanim(ent, animation) {
    /#
        assert(isdefined(ent.animname));
    #/
    /#
        assert(isdefined(self.anime));
    #/
    level.scr_anim[ent.animname][self.anime] = animation;
    self.ents[self.ents.size] = ent;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc5f
// Size: 0x22
function function_a44bdab6357b7210(ent) {
    self.var_fb299adfd0f8bfc5[self.var_fb299adfd0f8bfc5.size] = ent;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc88
// Size: 0x22
function function_707983b9fdb53c55(rig) {
    self.var_5ba8db57a9811d96[self.var_5ba8db57a9811d96.size] = rig;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb1
// Size: 0x9e
function function_ad0bcac98781e0ab(ent, animation, var_1ef3b90415513455) {
    index = self.playerpositions.size;
    newstruct = spawnstruct();
    newstruct.ent = ent;
    newstruct.animation = animation;
    newstruct.animname = getanimname(animation);
    if (isdefined(var_1ef3b90415513455)) {
        newstruct.var_68c4c5a108f84e4f = var_1ef3b90415513455;
        newstruct.var_1fc8efb020e9a71d = getanimname(var_1ef3b90415513455);
    }
    self.playerpositions[index] = newstruct;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd56
// Size: 0x73
function function_f7fc8b110c478968(ent, animation) {
    /#
        assert(isdefined(ent.animname));
    #/
    /#
        assert(isdefined(self.anime));
    #/
    level.scr_anim[ent.animname][self.anime] = animation;
    self.var_3bd5282b118d27f8[self.var_3bd5282b118d27f8.size] = ent;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd0
// Size: 0x11b
function function_d4561ab1ba4f5de9(ent, var_e6783d526b4a7212, animation, var_437b6bb41d98df26, var_75a7646007505356) {
    /#
        assert(!isdefined(self.var_2336099a20080602));
    #/
    self.var_2336099a20080602 = spawnstruct();
    self.var_2336099a20080602.ent = ent;
    self.var_2336099a20080602.var_e6783d526b4a7212 = var_e6783d526b4a7212;
    if (isdefined(var_437b6bb41d98df26)) {
        self.var_2336099a20080602.var_437b6bb41d98df26 = var_437b6bb41d98df26;
        self.var_2336099a20080602.var_75a7646007505356 = var_75a7646007505356;
        if (!self.islooping) {
            var_8355076d4ed3fc96 = function_4358b309fdcc6d44(var_437b6bb41d98df26);
            var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - 0.033;
            var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - mod(var_8355076d4ed3fc96, 0.05);
            self.var_2336099a20080602.var_8355076d4ed3fc96 = var_8355076d4ed3fc96;
        }
    } else if (!self.islooping) {
        self.var_2336099a20080602.animlength = getanimlength(animation);
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xef2
// Size: 0x3a
function add_pack_fx(fxid, origin, angles) {
    self.fx = fxid;
    self.fxorigin = origin;
    self.fxangles = angles;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf33
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
    animation = var_f8896cb359eab159;
    if (isdefined(var_b1e61449da6ba188)) {
        if (isdefined(player.operatorcustomization) && isdefined(player.operatorcustomization.gender) && player.operatorcustomization.gender == "female") {
            animation = var_b1e61449da6ba188;
        }
    }
    level.scr_anim[animname][self.anime] = animation;
    level.scr_eventanim[animname][self.anime] = getanimname(animation);
    self.players[self.players.size] = player;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1054
// Size: 0x4b
function function_ad12d29d41483e8a(statename, func) {
    /#
        assert(!isdefined(level.infilstruct.var_e7c7de60a5ea2f52[statename]));
    #/
    level.infilstruct.var_e7c7de60a5ea2f52[statename] = func;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a6
// Size: 0x59
function function_226e337633a44059(var_4f748fb021262dba, var_c242a4a69c2beed3) {
    level.infilstruct.var_6d575c4dfa5d6788 = var_4f748fb021262dba;
    if (isdefined(var_c242a4a69c2beed3)) {
        level.infilstruct.var_ad3c883fbff215b5 = var_c242a4a69c2beed3;
    } else {
        level.infilstruct.var_ad3c883fbff215b5 = undefined;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1106
// Size: 0xd6
function function_f18696ac7694ed9() {
    if (isdefined(level.infilstruct.var_ad3c883fbff215b5) && isdefined(self.var_db122a8941dfee14) && self.var_db122a8941dfee14 == 1) {
        return level.infilstruct.var_ad3c883fbff215b5;
    }
    if (isarray(level.infilstruct.var_6d575c4dfa5d6788)) {
        var_15314da30b44470 = 0;
        if (isdefined(self.infilanimindex)) {
            var_15314da30b44470 = self.infilanimindex - 1;
        }
        /#
            assert(var_15314da30b44470 < level.infilstruct.var_6d575c4dfa5d6788.size);
        #/
        return level.infilstruct.var_6d575c4dfa5d6788[var_15314da30b44470];
    }
    return level.infilstruct.var_6d575c4dfa5d6788;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e4
// Size: 0x8e
function allplayers_setfov(fov) {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setclientdvar(@"hash_df1dc712c4a91588", fov);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1279
// Size: 0x137
function function_cf47ab3f9defe35b() {
    if (istrue(level.infilstruct.var_12c912ee9672fa1)) {
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientdvar(@"hash_df1dc712c4a91588", 65);
            player setclientdvar(@"hash_86bf34d5f48fa435", 65);
        }
    } else {
        foreach (player in level.infilstruct.players) {
            if (!isdefined(player)) {
                continue;
            }
            player setclientdvar(@"hash_df1dc712c4a91588", 65);
            player setclientdvar(@"hash_86bf34d5f48fa435", 65);
            player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b7
// Size: 0x10b
function allplayers_setphysicaldof(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c) {
    if (!isdefined(focusspeed)) {
        focusspeed = 100;
    }
    if (!isdefined(aperturespeed)) {
        aperturespeed = 100;
    }
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(player.var_1f0a019572c9f8e2)) {
            player.var_1f0a019572c9f8e2 = 1;
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

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c9
// Size: 0x83
function allplayers_clearphysicaldof() {
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (isdefined(player.var_1f0a019572c9f8e2)) {
            player.var_1f0a019572c9f8e2 = undefined;
            player disablephysicaldepthoffieldscripting();
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1553
// Size: 0x121
function function_d328d1b2bd6822bd(var_cd1bd4a1058452da) {
    /#
        assert(!isdefined(level.infilblackoverlay));
    #/
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
    level.infilblackoverlay = overlay;
    if (isdefined(var_cd1bd4a1058452da) && var_cd1bd4a1058452da > 0) {
        level.infilblackoverlay.alpha = 0;
        level.infilblackoverlay fadeovertime(var_cd1bd4a1058452da);
        level.infilblackoverlay.alpha = 1;
    } else {
        level.infilblackoverlay.alpha = 1;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x167b
// Size: 0xf4
function function_32bc1d39bf81ce95(var_1bb7594c18d17443) {
    /#
        assert(isdefined(level.infilblackoverlay));
    #/
    if (isdefined(var_1bb7594c18d17443) && var_1bb7594c18d17443 > 0) {
        level.infilblackoverlay.alpha = 1;
        level.infilblackoverlay fadeovertime(var_1bb7594c18d17443);
        level.infilblackoverlay.alpha = 0;
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            player namespace_4887422e77f3514e::function_a2b4e6088394bade();
            player notify("deaths_door_exit");
            player clearsoundsubmix("mp_br_lobby_fade", 0);
        }
    } else {
        level.infilblackoverlay.alpha = 0;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1776
// Size: 0x2f
function function_743f088f49ccc99d() {
    /#
        assert(isdefined(level.infilblackoverlay));
    #/
    level.infilblackoverlay destroy();
    level.infilblackoverlay = undefined;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ac
// Size: 0x73
function function_ea856ec0b3c4cfc6(var_cd1bd4a1058452da, players, var_9031c2d2b6b6d7f4) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_10f93bb3f3966751(var_cd1bd4a1058452da, var_9031c2d2b6b6d7f4);
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1826
// Size: 0x84
function function_10f93bb3f3966751(var_cd1bd4a1058452da, var_9031c2d2b6b6d7f4) {
    function_a38b2e30e799e9b7(var_cd1bd4a1058452da, var_9031c2d2b6b6d7f4);
    var_721982228624d657 = namespace_a9c534dc7832aba4::function_6d5206bdba79e8c3();
    if (var_721982228624d657.size > 0) {
        foreach (var_ff3fe241243b175b in var_721982228624d657) {
            var_ff3fe241243b175b function_a38b2e30e799e9b7(var_cd1bd4a1058452da, var_9031c2d2b6b6d7f4);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b1
// Size: 0x14e
function function_a38b2e30e799e9b7(var_cd1bd4a1058452da, var_9031c2d2b6b6d7f4) {
    /#
        assert(isdefined(var_9031c2d2b6b6d7f4));
    #/
    if (!isdefined(self.var_cd09849e16631c71)) {
        self.var_cd09849e16631c71 = [];
    }
    /#
        assert(!isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4]));
    #/
    if (isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4])) {
        return;
    }
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader("black", 640, 480);
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.sort = -1;
    overlay.archived = 0;
    overlay setshowinrealism(1);
    if (isdefined(var_cd1bd4a1058452da) && var_cd1bd4a1058452da > 0) {
        overlay.alpha = 0;
        overlay fadeovertime(var_cd1bd4a1058452da);
        overlay.alpha = 1;
    } else {
        overlay.alpha = 1;
    }
    self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4] = overlay;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a06
// Size: 0x28
function function_7f3ad8fe6df1b8fe(var_1bb7594c18d17443, players, var_9031c2d2b6b6d7f4) {
    level thread function_6b9a694ac71b6342(var_1bb7594c18d17443, players, var_9031c2d2b6b6d7f4);
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a35
// Size: 0x194
function private function_6b9a694ac71b6342(var_1bb7594c18d17443, players, var_9031c2d2b6b6d7f4) {
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_1162dbfdb942d179(var_1bb7594c18d17443, var_9031c2d2b6b6d7f4);
        var_721982228624d657 = player namespace_a9c534dc7832aba4::function_6d5206bdba79e8c3();
        if (var_721982228624d657.size > 0) {
            foreach (var_ff3fe241243b175b in var_721982228624d657) {
                var_ff3fe241243b175b function_1162dbfdb942d179(var_1bb7594c18d17443, var_9031c2d2b6b6d7f4);
            }
        }
    }
    wait(var_1bb7594c18d17443);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        player function_46b5c06f8d7ac31(var_9031c2d2b6b6d7f4);
        var_721982228624d657 = player namespace_a9c534dc7832aba4::function_6d5206bdba79e8c3();
        if (var_721982228624d657.size > 0) {
            foreach (var_ff3fe241243b175b in var_721982228624d657) {
                var_ff3fe241243b175b function_46b5c06f8d7ac31(var_9031c2d2b6b6d7f4);
            }
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bd0
// Size: 0xe7
function function_1162dbfdb942d179(var_1bb7594c18d17443, var_9031c2d2b6b6d7f4) {
    /#
        assert(isdefined(var_9031c2d2b6b6d7f4));
    #/
    if (isbot(self) && (!isdefined(self.var_cd09849e16631c71) || !isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4]))) {
        return;
    }
    /#
        assert(isdefined(self.var_cd09849e16631c71));
    #/
    /#
        assert(isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4]));
    #/
    overlay = self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4];
    if (isdefined(var_1bb7594c18d17443) && var_1bb7594c18d17443 > 0) {
        if (isdefined(overlay)) {
            overlay.alpha = 1;
            overlay fadeovertime(var_1bb7594c18d17443);
            overlay.alpha = 0;
        }
        namespace_4887422e77f3514e::function_a2b4e6088394bade();
        self clearsoundsubmix("mp_br_lobby_fade", 0);
    } else if (isdefined(overlay)) {
        overlay.alpha = 0;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cbe
// Size: 0x92
function function_46b5c06f8d7ac31(var_9031c2d2b6b6d7f4) {
    if (isbot(self) && (!isdefined(self.var_cd09849e16631c71) || !isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4]))) {
        return;
    }
    /#
        assert(isdefined(self.var_cd09849e16631c71));
    #/
    /#
        assert(isdefined(self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4]));
    #/
    self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4] destroy();
    self.var_cd09849e16631c71[var_9031c2d2b6b6d7f4] = undefined;
    if (self.var_cd09849e16631c71.size == 0) {
        self.var_cd09849e16631c71 = undefined;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d57
// Size: 0x64
function endprematchskydiving() {
    var_98eaf83fc88a156e = 5;
    /#
        assertex(isplayer(self), "endPrematchSkydiving must be called on a player!");
    #/
    player = self;
    player skydive_setdeploymentstatus(0);
    player skydive_setbasejumpingstatus(0);
    if (isdefined(player.ffsm_state)) {
        player.ffsm_state = var_98eaf83fc88a156e;
    }
    player namespace_5078ee98abb32db9::parachutecleanup();
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc2
// Size: 0x183
function function_583f118c4064ca21(players) {
    var_1b99e9aa1b149e01 = 0;
    /#
        var_1b99e9aa1b149e01 = getdvarint(@"hash_484dde7ceb1b8065", 0) != 0;
    #/
    var_2c13b756b0aa6dcf = isdefined(players) && players.size != level.players.size;
    foreach (team in level.teamnamelist) {
        teamplayers = getteamdata(team, "players");
        foreach (player in teamplayers) {
            if (var_2c13b756b0aa6dcf && !array_contains(players, player)) {
                continue;
            }
            if (!namespace_56a3588493afc984::function_60597da56f99d304(player)) {
                continue;
            }
            player function_a593971d75d82113();
            player function_379bb555405c16bb("br_infils_util::refreshTeamVisibility()");
            if (!var_1b99e9aa1b149e01) {
                foreach (otherplayer in teamplayers) {
                    player showtoplayer(otherplayer);
                }
            }
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f4c
// Size: 0x101
function function_423115ed15f21e05(team) {
    var_1b99e9aa1b149e01 = 0;
    /#
        var_1b99e9aa1b149e01 = getdvarint(@"hash_484dde7ceb1b8065", 0) != 0;
    #/
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (!namespace_56a3588493afc984::function_60597da56f99d304(player)) {
            continue;
        }
        player function_a593971d75d82113();
        player function_379bb555405c16bb("br_infils_util::refreshTeamVisibilityForTeam()");
        if (!var_1b99e9aa1b149e01) {
            foreach (otherplayer in teamplayers) {
                player showtoplayer(otherplayer);
            }
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2054
// Size: 0x5a
function registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4) {
    if (!istrue(var_fc8439660d24b9c4.jumpcomandsregistered)) {
        var_fc8439660d24b9c4.jumpcomandsregistered = 1;
        var_fc8439660d24b9c4 namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("jumpMasterState", 2);
        var_fc8439660d24b9c4 notifyonplayercommand("halo_jump_c130", "+gostand");
        var_fc8439660d24b9c4 notifyonplayercommand("br_break_squad", "+breath_sprint");
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b5
// Size: 0x5d
function watchbrsquadleaderdisconnect(team) {
    waittill_any_2("death", "disconnect");
    teamplayers = getteamdata(team, "players");
    var_fc8439660d24b9c4 = setupbrsquadleader(teamplayers);
    if (isdefined(var_fc8439660d24b9c4)) {
        registerbrsquadleaderjumpcommands(var_fc8439660d24b9c4);
        var_fc8439660d24b9c4 thread watchbrsquadleaderdisconnect(team);
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2119
// Size: 0x263
function setupbrsquadleader(teamplayers) {
    if (teamplayers.size == 0) {
        return undefined;
    }
    var_fc8439660d24b9c4 = undefined;
    foreach (player in teamplayers) {
        if (isdefined(player) && player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            return player;
        }
    }
    foreach (player in teamplayers) {
        if (level.onlinegame && player isfireteamleader()) {
            var_fc8439660d24b9c4 = player;
            break;
        }
    }
    if (!isdefined(var_fc8439660d24b9c4)) {
        var_11a39090e204313a = 0;
        /#
            var_11a39090e204313a = getdvarint(@"hash_e65dc975d6fcfca0", 0) != 0;
        #/
        var_ab2cf4a4734bd50 = 0;
        foreach (player in teamplayers) {
            var_921910f60d54cfa6 = var_11a39090e204313a == isbot(player);
            if (var_921910f60d54cfa6) {
                var_ab2cf4a4734bd50++;
                var_54a63825d837afe3 = 1 / var_ab2cf4a4734bd50;
                if (randomfloat(1) < var_54a63825d837afe3) {
                    var_fc8439660d24b9c4 = player;
                }
            }
        }
    }
    if (!isdefined(var_fc8439660d24b9c4)) {
        foreach (player in teamplayers) {
            var_fc8439660d24b9c4 = player;
            break;
        }
    }
    if (!isdefined(var_fc8439660d24b9c4)) {
        return undefined;
    }
    var_fc8439660d24b9c4 namespace_d20f8ef223912e12::setplayerbrsquadleader(1);
    foreach (player in teamplayers) {
        if (player != var_fc8439660d24b9c4) {
            player namespace_d20f8ef223912e12::setplayerbrsquadleader(0);
        }
        var_d9cdb46dae44d57b = ter_op(player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader(), 2, 1);
        namespace_ad389306d44fc6b4::setteammateomnvarsforplayer(player, teamplayers, var_d9cdb46dae44d57b);
    }
    return var_fc8439660d24b9c4;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2384
// Size: 0x144
function function_6d8ac534ad288aa5(player) {
    var_384446a35f40358c = undefined;
    var_f5b09a636e6e3153 = [0:1, 1:2, 2:3, 3:4];
    teamplayers = getteamdata(player.team, "players");
    /#
        assert(teamplayers.size <= var_f5b09a636e6e3153.size);
    #/
    player.var_db122a8941dfee14 = teamplayers.size;
    foreach (var_736d8d9188ccbd45 in teamplayers) {
        if (var_736d8d9188ccbd45 == player) {
            continue;
        }
        if (isdefined(var_736d8d9188ccbd45.infilanimindex)) {
            var_f5b09a636e6e3153 = array_remove(var_f5b09a636e6e3153, var_736d8d9188ccbd45.infilanimindex);
        }
        if (var_736d8d9188ccbd45 namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            var_f5b09a636e6e3153 = array_remove(var_f5b09a636e6e3153, 1);
        }
    }
    if (var_f5b09a636e6e3153.size == 0) {
        var_f5b09a636e6e3153[0] = 1;
    }
    player.infilanimindex = var_f5b09a636e6e3153[0];
    /#
        var_384446a35f40358c = getdvarint(@"hash_441165c7b355dd1b", -1);
        if (var_384446a35f40358c > 0) {
            player.infilanimindex = var_384446a35f40358c;
        }
    #/
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24cf
// Size: 0x14
function getinfilspawnoffset() {
    return getdvarfloat(@"hash_f2babc025530c2a1", 11400);
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24eb
// Size: 0x18
function function_136f4218b1d719b9() {
    /#
        return getdvarint(@"hash_8545857262882e35", 0) != 0;
    #/
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x250a
// Size: 0x45
function function_2c3987dd5672427f(timesec) {
    /#
        if (function_136f4218b1d719b9()) {
            while (timesec > 0) {
                waitframe();
                while (istrue(level.var_ca629cf434263639)) {
                    waitframe();
                }
                timesec = timesec - level.framedurationseconds;
            }
            return 1;
        }
        return 0;
    #/
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2556
// Size: 0x2e
function function_8663da4077fa7e20() {
    var_b57aacaf2cc7095f = 1;
    /#
        if (function_136f4218b1d719b9()) {
            var_b57aacaf2cc7095f = getdvarint(@"hash_f6b3b7c2e066bf97", 0);
        }
    #/
    return var_b57aacaf2cc7095f;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x258c
// Size: 0x1c
function waitandpause(timesec) {
    /#
        if (function_2c3987dd5672427f(timesec)) {
            return;
        }
    #/
    wait(timesec);
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25af
// Size: 0x35
function function_6199c35f4cf4524c(func) {
    /#
        assert(isdefined(level.var_16da1e546dc92a4c));
    #/
    level.var_16da1e546dc92a4c[level.var_16da1e546dc92a4c.size] = func;
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25eb
// Size: 0x8f
function function_e66f664ad726f2e() {
    var_14bd067261dc7f99 = "";
    switch (level.script) {
    case #"hash_aeddd44c5b27b2d":
    case #"hash_bce1a7274538a78":
    case #"hash_73e90c896fdaebc3":
        var_14bd067261dc7f99 = "mp_infil_br_jup_wz2_intro_tr";
        break;
    case #"hash_3ebe34631513de1d":
        var_14bd067261dc7f99 = "mp_infil_br_jup_mech_intro_tr";
        break;
    case #"hash_da8f14763f037922":
        var_14bd067261dc7f99 = "mp_infil_br_jup_sm_island_2_wz2_intro_tr";
        break;
    }
    if (var_14bd067261dc7f99 != "") {
        unloadinfiltransient(var_14bd067261dc7f99);
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2681
// Size: 0x110
function function_d870904da7b1ff7d(lights, lightson) {
    if (lightson) {
        var_c59c1d18b26c886e = [];
        var_c59c1d18b26c886e["infil_light_01"] = 500 * 7.95545e-05;
        var_c59c1d18b26c886e["infil_light_02"] = 200 * 7.95545e-05;
        var_c59c1d18b26c886e["infil_light_03"] = 75 * 7.95545e-05;
        foreach (light in lights) {
            light setlightintensity(var_c59c1d18b26c886e[light.name]);
            light forcenetfieldhighlod(1);
        }
    } else {
        foreach (light in lights) {
            light setlightintensity(1 * 7.95545e-05);
            light forcenetfieldhighlod(0);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2798
// Size: 0xf0
function function_d8f828d3c82061b7(lights, lightson) {
    if (lightson) {
        var_c59c1d18b26c886e = [];
        var_c59c1d18b26c886e["exfil_light_01"] = 500 * 7.95545e-05;
        var_c59c1d18b26c886e["exfil_light_02"] = 1250 * 7.95545e-05;
        foreach (light in lights) {
            light setlightintensity(var_c59c1d18b26c886e[light.name]);
        }
    } else {
        foreach (light in lights) {
            light setlightintensity(1 * 7.95545e-05);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x288f
// Size: 0x123
function function_362cf2eeebce4c73(lights, lightson) {
    if (lightson) {
        var_c59c1d18b26c886e = [];
        var_c59c1d18b26c886e["cq_exfil_light_01"] = 1000 * 7.95545e-05;
        var_c59c1d18b26c886e["cq_exfil_light_02"] = 1000 * 7.95545e-05;
        var_c59c1d18b26c886e["cq_exfil_light_03"] = 1250 * 7.95545e-05;
        var_c59c1d18b26c886e["cq_exfil_light_04"] = 500 * 7.95545e-05;
        var_c59c1d18b26c886e["cq_exfil_light_05"] = 500 * 7.95545e-05;
        foreach (light in lights) {
            light setlightintensity(var_c59c1d18b26c886e[light.name]);
        }
    } else {
        foreach (light in lights) {
            light setlightintensity(1 * 7.95545e-05);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b9
// Size: 0x100
function function_4d5d7485513f045(lights, lightson) {
    if (lightson) {
        var_c59c1d18b26c886e = [];
        var_c59c1d18b26c886e["2ndry_light_01"] = 250 * 7.95545e-05;
        var_c59c1d18b26c886e["2ndry_light_02"] = 1000 * 7.95545e-05;
        var_c59c1d18b26c886e["2ndry_light_03"] = 500 * 7.95545e-05;
        foreach (light in lights) {
            light setlightintensity(var_c59c1d18b26c886e[light.name]);
        }
    } else {
        foreach (light in lights) {
            light setlightintensity(1 * 7.95545e-05);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac0
// Size: 0x101
function function_b281515d61bd0774(lights, lightson) {
    if (lightson) {
        var_c59c1d18b26c886e = [];
        var_c59c1d18b26c886e["accolade_light_01"] = 750 * 7.95545e-05;
        var_c59c1d18b26c886e["accolade_light_02"] = 1000 * 7.95545e-05;
        var_c59c1d18b26c886e["accolade_light_03"] = 1000 * 7.95545e-05;
        foreach (light in lights) {
            light setlightintensity(var_c59c1d18b26c886e[light.name]);
        }
    } else {
        foreach (light in lights) {
            light setlightintensity(1 * 7.95545e-05);
        }
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bc8
// Size: 0x1d7
function function_42f1462f1d4193af(lights) {
    var_2caec6947a5071d0 = getentarray("infil_light", "targetname");
    var_d2326d24cb1fd3a2 = getentarray("exfil_light", "targetname");
    var_3b31e0da499ed5ae = getentarray("cq_exfil_light", "targetname");
    var_65f8c709d2f9cf4 = getentarray("2ndry_light", "targetname");
    var_e45eb5dd4051778e = getentarray("accolade_light", "targetname");
    switch (lights) {
    case #"hash_cf4e05b68aeba31a":
        function_d870904da7b1ff7d(var_2caec6947a5071d0, 1);
        function_d8f828d3c82061b7(var_d2326d24cb1fd3a2, 0);
        function_362cf2eeebce4c73(var_3b31e0da499ed5ae, 0);
        function_4d5d7485513f045(var_65f8c709d2f9cf4, 0);
        function_b281515d61bd0774(var_e45eb5dd4051778e, 0);
        break;
    case #"hash_8dabe7b0b667b264":
        function_d870904da7b1ff7d(var_2caec6947a5071d0, 0);
        function_d8f828d3c82061b7(var_d2326d24cb1fd3a2, 1);
        function_362cf2eeebce4c73(var_3b31e0da499ed5ae, 0);
        function_4d5d7485513f045(var_65f8c709d2f9cf4, 0);
        function_b281515d61bd0774(var_e45eb5dd4051778e, 0);
        break;
    case #"hash_4856b940c7c5b675":
        function_d870904da7b1ff7d(var_2caec6947a5071d0, 0);
        function_d8f828d3c82061b7(var_d2326d24cb1fd3a2, 0);
        function_362cf2eeebce4c73(var_3b31e0da499ed5ae, 1);
        function_4d5d7485513f045(var_65f8c709d2f9cf4, 0);
        function_b281515d61bd0774(var_e45eb5dd4051778e, 0);
        break;
    case #"hash_f020299c866e4289":
        function_d870904da7b1ff7d(var_2caec6947a5071d0, 0);
        function_d8f828d3c82061b7(var_d2326d24cb1fd3a2, 0);
        function_362cf2eeebce4c73(var_3b31e0da499ed5ae, 0);
        function_4d5d7485513f045(var_65f8c709d2f9cf4, 1);
        function_b281515d61bd0774(var_e45eb5dd4051778e, 0);
        break;
    case #"hash_96702057c0bd388":
        function_d870904da7b1ff7d(var_2caec6947a5071d0, 0);
        function_d8f828d3c82061b7(var_d2326d24cb1fd3a2, 0);
        function_362cf2eeebce4c73(var_3b31e0da499ed5ae, 0);
        function_4d5d7485513f045(var_65f8c709d2f9cf4, 0);
        function_b281515d61bd0774(var_e45eb5dd4051778e, 1);
        break;
    default:
        break;
    }
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da6
// Size: 0x26
function function_2bbe7f3e487520c6() {
    var_2caec6947a5071d0 = getentarray("infil_light", "targetname");
    function_d870904da7b1ff7d(var_2caec6947a5071d0, 0);
}

// Namespace namespace_e7bbffdd71331a9a/namespace_81156089ff1fe819
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd3
// Size: 0x6a
function function_59e8b4ed75ca8b92() {
    return !namespace_36f464722d326bbe::isBRStyleGameType() || istrue(level.skipprematch) || !isdefined(level.infilstruct) || !isdefined(level.infilstruct.var_eb0cd5e47dbbfd6a) || istrue(level.infilstruct.var_1cf4fe3c9d7da8a2) || !getdvarint(@"hash_f49bd659b301fbb0", 1);
}

