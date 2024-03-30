// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\notetrack.gsc;

#namespace namespace_ba19537f431c9855;

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95
// Size: 0x51
function create_animpack(anime) {
    pack = spawnstruct();
    pack.ents = [];
    pack.staticents = [];
    pack.anime = anime;
    pack.packs = [];
    return pack;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee
// Size: 0x16
function function_2d4c340dd3908b2d(fov) {
    self.fov = fov;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x5e
function function_b8f86028bcc64f84(fstop, focusdist, focusspeed, aperturespeed, var_c06551440b16249c) {
    self.fstop = fstop;
    self.focusdist = focusdist;
    self.focusspeed = focusspeed;
    self.aperturespeed = aperturespeed;
    self.var_c06551440b16249c = var_c06551440b16249c;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x170
// Size: 0x4b
function add_pack_modelanim(ent, animation) {
    level.scr_anim[ent.animname][self.anime] = animation;
    self.ents[self.ents.size] = ent;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2
// Size: 0x22
function function_a44bdab6357b7210(ent) {
    self.staticents[self.staticents.size] = ent;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x28
function add_pack_startfunc(paramarray, func) {
    self.startfunc = func;
    self.paramarray = paramarray;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21a
// Size: 0x28
function function_decf1e23d78d0944(paramarray, func) {
    self.endfunc = func;
    self.var_315361abd838fad4 = paramarray;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x3a
function add_pack_fx(fxid, origin, angles) {
    self.fx = fxid;
    self.fxorigin = origin;
    self.fxangles = angles;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0xe6
function function_d4561ab1ba4f5de9(ent, tag, animation, xcamasset) {
    /#
        assert(!isdefined(self.camerainfo));
    #/
    self.camerainfo = spawnstruct();
    self.camerainfo.ent = ent;
    self.camerainfo.tag = tag;
    if (isdefined(xcamasset)) {
        self.camerainfo.xcamasset = xcamasset;
        xcamlength = getxcamlength(xcamasset);
        xcamlength = xcamlength - 0.033;
        xcamlength = xcamlength - mod(xcamlength, 0.05);
        self.camerainfo.xcamlength = xcamlength;
        return;
    }
    self.camerainfo.animlength = getanimlength(animation);
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x377
// Size: 0x66
function private function_19ea8f6d547dc8bc(player) {
    /#
        assert(isdefined(self.camerainfo));
    #/
    cameraent = self.camerainfo.ent;
    cameratag = self.camerainfo.tag;
    return [cameraent, cameratag];
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e5
// Size: 0x2a
function private uses_xcam() {
    /#
        assert(isdefined(self.camerainfo));
    #/
    return isdefined(self.camerainfo.xcamasset);
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x417
// Size: 0xa9
function private function_bda88f27a0337eaa(animstruct, player, var_e45f1cd8436c9aa9) {
    var_57accdc40b2f50e = function_19ea8f6d547dc8bc(player);
    cameratag = var_57accdc40b2f50e[1];
    cameraent = var_57accdc40b2f50e[0];
    if (uses_xcam()) {
        if (!istrue(var_e45f1cd8436c9aa9)) {
            player cameraunlink();
            player playxcam(self.camerainfo.xcamasset, 0, animstruct.structorigin, animstruct.var_f7c301a9de8d90f4);
        }
        return;
    }
    player stopxcam();
    player cameralinkto(cameraent, cameratag, 1, 1);
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c7
// Size: 0x6b
function private function_78dfe475a5d4f843(player) {
    var_57acddc40b2f741 = function_19ea8f6d547dc8bc(player);
    cameratag = var_57acddc40b2f741[1];
    cameraent = var_57acddc40b2f741[0];
    cameraorigin = cameraent gettagorigin(cameratag);
    cameraangles = cameraent gettagangles(cameratag);
    return [cameraorigin, cameraangles];
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x53a
// Size: 0x4a
function private function_347d56feb29d7f74() {
    /#
        assert(isdefined(self.camerainfo));
    #/
    if (uses_xcam()) {
        return self.camerainfo.xcamlength;
    }
    return self.camerainfo.animlength;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x58b
// Size: 0x11b
function spawn_script_model(modelname, animname, extramodels) {
    model = spawn("script_model", self.structorigin);
    model setmodel(modelname);
    if (!isdefined(animname)) {
        animname = modelname;
    }
    model.animname = animname;
    if (isdefined(extramodels)) {
        model.linkedents = [];
        foreach (modeltag in extramodels) {
            extra = spawn("script_model", self.structorigin);
            extra setmodel(modeltag[0]);
            extra linkto(model, modeltag[1], (0, 0, 0), (0, 0, 0));
            model.linkedents[model.linkedents.size] = extra;
        }
    }
    return model;
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae
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

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae
// Size: 0x7c
function allplayers_setfov(fov) {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", fov);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    }
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x831
// Size: 0x76
function function_cf47ab3f9defe35b() {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", 65);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ae
// Size: 0x71
function allplayers_clearphysicaldof() {
    foreach (player in level.players) {
        if (isdefined(player.scriptedphysicaldofenabled)) {
            player.scriptedphysicaldofenabled = undefined;
            player disablephysicaldepthoffieldscripting();
        }
    }
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x926
// Size: 0x42
function function_2289677bd4ea8866(buildfunc) {
    /#
        wait(1);
        while (true) {
            host = scripts/mp/gamelogic::gethostplayer();
            if (isdefined(host)) {
                function_b2a63c397eb5ccdf(host, buildfunc);
            }
            wait(0.25);
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96f
// Size: 0x186
function function_b2a63c397eb5ccdf(player, buildfunc) {
    /#
        /#
            assert(isdefined(buildfunc));
        #/
        animstruct = spawnstruct();
        animstruct [[ buildfunc ]]();
        foreach (pack in animstruct.packs) {
            foreach (ent in pack.ents) {
                ent hide();
            }
        }
        while (true) {
            function_9384c9ed097bf7b9(player, "<unknown string>", "<unknown string>");
            startorigin = player.origin;
            startangles = player getplayerangles();
            level.var_ca629cf434263639 = 0;
            thread function_e00bf2a7852cbc6(player, animstruct);
            thread function_710d2b779609907d(player, animstruct);
            thread function_b51365f787d44355(player, animstruct);
            function_9384c9ed097bf7b9(player, "<unknown string>", "<unknown string>");
            endanimsequence(player, animstruct);
            player setorigin(startorigin);
            player setplayerangles(startangles);
            wait(0.5);
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xafc
// Size: 0x52
function function_9384c9ed097bf7b9(player, buttonstring, keystring) {
    /#
        while (player buttonpressed(buttonstring) || player buttonpressed(keystring)) {
            waitframe();
        }
        while (!player buttonpressed(buttonstring) && !player buttonpressed(keystring)) {
            waitframe();
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0x19a
function function_710d2b779609907d(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        while (true) {
            level.var_ca629cf434263639 = 0;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(animstruct.activepack)) {
                foreach (ent in animstruct.activepack.ents) {
                    ent scriptmodelpauseanim(1);
                }
                if (animstruct.activepack uses_xcam()) {
                    player pausexcam(1);
                }
            }
            level.var_ca629cf434263639 = 1;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(animstruct.activepack)) {
                foreach (ent in animstruct.activepack.ents) {
                    ent scriptmodelpauseanim(0);
                }
                if (animstruct.activepack uses_xcam()) {
                    player pausexcam(0);
                }
            }
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcf6
// Size: 0x1ca
function function_b51365f787d44355(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        startorigin = player getorigin();
        startangles = player getplayerangles();
        while (true) {
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            player playershow();
            player function_985b0973f29da4f8("<unknown string>");
            player cameraunlink();
            player disablephysicaldepthoffieldscripting();
            if (isdefined(animstruct.activepack)) {
                var_bffcba6249871e48 = animstruct.activepack function_78dfe475a5d4f843(player);
                cameraangles = var_bffcba6249871e48[1];
                cameraorigin = var_bffcba6249871e48[0];
                newplayerorg = cameraorigin + (0, 0, -60);
                var_a6fd7eae18e63f8 = cameraangles;
                player setorigin(newplayerorg);
                player setplayerangles(var_a6fd7eae18e63f8);
            }
            if (!player isufo()) {
                player ufo();
            }
            setdvar(@"hash_f94addedc8e87b69", 2);
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (player isufo()) {
                player ufo();
            }
            setdvar(@"hash_f94addedc8e87b69", 0);
            if (isdefined(animstruct.activepack)) {
                animstruct.activepack function_bda88f27a0337eaa(animstruct, player, 1);
            }
            player playerhide();
            player scripts/cp_mp/utility/player_utility::function_379bb555405c16bb("<unknown string>");
            player enablephysicaldepthoffieldscripting();
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec7
// Size: 0x37
function waitandpause(timesec) {
    /#
        while (timesec > 0) {
            waitframe();
            while (istrue(level.var_ca629cf434263639)) {
                waitframe();
            }
            timesec = timesec - level.framedurationseconds;
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf05
// Size: 0x351
function function_e00bf2a7852cbc6(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        foreach (pack in animstruct.packs) {
            animstruct.activepack = pack;
            if (isdefined(pack.startfunc)) {
                animstruct [[ pack.startfunc ]](pack.paramarray);
            }
            if (isdefined(pack.fov)) {
                allplayers_setfov(pack.fov);
            } else {
                function_cf47ab3f9defe35b();
            }
            if (isdefined(pack.fstop) && isdefined(pack.focusdist)) {
                allplayers_setphysicaldof(pack.fstop, pack.focusdist, pack.focusspeed, pack.aperturespeed, pack.var_c06551440b16249c);
            }
            if (isdefined(pack.fx)) {
                playfx(getfx(pack.fx), pack.fxorigin, anglestoforward(pack.fxangles), anglestoup(pack.fxangles));
            }
            foreach (ent in pack.ents) {
                ent show();
                ent dontinterpolate();
                ent scriptmodelplayanimdeltamotionfrompos(level.scr_anim[ent.animname][pack.anime], animstruct.structorigin, animstruct.var_f7c301a9de8d90f4, ent.animname);
                ent thread scripts/common/notetrack::start_notetrack_wait(ent, ent.animname, pack.anime, ent.animname, level.scr_anim[ent.animname][pack.anime]);
            }
            foreach (ent in pack.staticents) {
                ent show();
            }
            if (isdefined(player)) {
                if (isdefined(pack.playerfunc)) {
                    [[ pack.playerfunc ]](player, pack.var_5ab13b55d7ceff80);
                }
                player cameraunlink();
                player stopxcam();
                pack function_bda88f27a0337eaa(animstruct, player);
            }
            animlength = pack function_347d56feb29d7f74();
            waitandpause(animlength);
            waitframe();
            if (isdefined(pack.endfunc)) {
                animstruct [[ pack.endfunc ]](pack.var_315361abd838fad4);
            }
        }
    #/
}

// Namespace namespace_ba19537f431c9855 / namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125d
// Size: 0x18f
function endanimsequence(player, animstruct) {
    /#
        animstruct notify("<unknown string>");
        if (isdefined(animstruct.activepack) && isdefined(animstruct.activepack.endfunc)) {
            animstruct [[ animstruct.activepack.endfunc ]](animstruct.activepack.var_315361abd838fad4);
        }
        foreach (pack in animstruct.packs) {
            foreach (ent in pack.ents) {
                ent scriptmodelclearanim();
                ent hide();
            }
            foreach (ent in pack.staticents) {
                ent hide();
            }
        }
        player cameraunlink();
        player stopxcam();
        function_cf47ab3f9defe35b();
        allplayers_clearphysicaldof();
    #/
}

