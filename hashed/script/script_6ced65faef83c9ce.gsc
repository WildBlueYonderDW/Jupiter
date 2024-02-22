// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\common\notetrack.gsc;

#namespace namespace_ba19537f431c9855;

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95
// Size: 0x51
function create_animpack(anime) {
    pack = spawnstruct();
    pack.ents = [];
    pack.var_fb299adfd0f8bfc5 = [];
    pack.anime = anime;
    pack.packs = [];
    return pack;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee
// Size: 0x16
function function_2d4c340dd3908b2d(fov) {
    self.fov = fov;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x10b
// Size: 0x5e
function function_b8f86028bcc64f84(fstop, var_ed8206fef1806fef, focusspeed, aperturespeed, var_c06551440b16249c) {
    self.fstop = fstop;
    self.var_ed8206fef1806fef = var_ed8206fef1806fef;
    self.focusspeed = focusspeed;
    self.aperturespeed = aperturespeed;
    self.var_c06551440b16249c = var_c06551440b16249c;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x170
// Size: 0x4b
function add_pack_modelanim(ent, animation) {
    level.scr_anim[ent.animname][self.anime] = animation;
    self.ents[self.ents.size] = ent;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c2
// Size: 0x22
function function_a44bdab6357b7210(ent) {
    self.var_fb299adfd0f8bfc5[self.var_fb299adfd0f8bfc5.size] = ent;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb
// Size: 0x28
function add_pack_startfunc(paramarray, func) {
    self.startfunc = func;
    self.paramarray = paramarray;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21a
// Size: 0x28
function function_decf1e23d78d0944(paramarray, func) {
    self.endfunc = func;
    self.var_315361abd838fad4 = paramarray;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x249
// Size: 0x3a
function add_pack_fx(fxid, origin, angles) {
    self.fx = fxid;
    self.fxorigin = origin;
    self.fxangles = angles;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x28a
// Size: 0xe6
function function_d4561ab1ba4f5de9(ent, tag, animation, var_437b6bb41d98df26) {
    /#
        assert(!isdefined(self.var_2336099a20080602));
    #/
    self.var_2336099a20080602 = spawnstruct();
    self.var_2336099a20080602.ent = ent;
    self.var_2336099a20080602.tag = tag;
    if (isdefined(var_437b6bb41d98df26)) {
        self.var_2336099a20080602.var_437b6bb41d98df26 = var_437b6bb41d98df26;
        var_8355076d4ed3fc96 = function_4358b309fdcc6d44(var_437b6bb41d98df26);
        var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - 0.033;
        var_8355076d4ed3fc96 = var_8355076d4ed3fc96 - mod(var_8355076d4ed3fc96, 0.05);
        self.var_2336099a20080602.var_8355076d4ed3fc96 = var_8355076d4ed3fc96;
    } else {
        self.var_2336099a20080602.animlength = getanimlength(animation);
    }
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x377
// Size: 0x66
function private function_19ea8f6d547dc8bc(player) {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    cameraent = self.var_2336099a20080602.ent;
    cameratag = self.var_2336099a20080602.tag;
    return [0:cameraent, 1:cameratag];
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3e5
// Size: 0x2a
function private function_ff03e352a5746185() {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    return isdefined(self.var_2336099a20080602.var_437b6bb41d98df26);
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x417
// Size: 0xa9
function private function_bda88f27a0337eaa(animstruct, player, var_e45f1cd8436c9aa9) {
    var_57accdc40b2f50e = function_19ea8f6d547dc8bc(player);
    cameratag = var_57accdc40b2f50e[1];
    cameraent = var_57accdc40b2f50e[0];
    if (function_ff03e352a5746185()) {
        if (!istrue(var_e45f1cd8436c9aa9)) {
            player cameraunlink();
            player playxcam(self.var_2336099a20080602.var_437b6bb41d98df26, 0, animstruct.var_11bfcab16008015e, animstruct.var_f7c301a9de8d90f4);
        }
    } else {
        player function_8ff8fd7841f6eba2();
        player cameralinkto(cameraent, cameratag, 1, 1);
    }
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c7
// Size: 0x6b
function private function_78dfe475a5d4f843(player) {
    var_57acddc40b2f741 = function_19ea8f6d547dc8bc(player);
    cameratag = var_57acddc40b2f741[1];
    cameraent = var_57acddc40b2f741[0];
    var_3df9d9a1027fb9bc = cameraent gettagorigin(cameratag);
    cameraangles = cameraent gettagangles(cameratag);
    return [0:var_3df9d9a1027fb9bc, 1:cameraangles];
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x53a
// Size: 0x4a
function private function_347d56feb29d7f74() {
    /#
        assert(isdefined(self.var_2336099a20080602));
    #/
    if (function_ff03e352a5746185()) {
        return self.var_2336099a20080602.var_8355076d4ed3fc96;
    } else {
        return self.var_2336099a20080602.animlength;
    }
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x58b
// Size: 0x11b
function spawn_script_model(modelname, animname, var_31093158b2292193) {
    model = spawn("script_model", self.var_11bfcab16008015e);
    model setmodel(modelname);
    if (!isdefined(animname)) {
        animname = modelname;
    }
    model.animname = animname;
    if (isdefined(var_31093158b2292193)) {
        model.linkedents = [];
        foreach (var_c30d717b67553796 in var_31093158b2292193) {
            extra = spawn("script_model", self.var_11bfcab16008015e);
            extra setmodel(var_c30d717b67553796[0]);
            extra linkto(model, var_c30d717b67553796[1], (0, 0, 0), (0, 0, 0));
            model.linkedents[model.linkedents.size] = extra;
        }
    }
    return model;
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae
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

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ae
// Size: 0x7c
function allplayers_setfov(fov) {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", fov);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 1);
    }
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x831
// Size: 0x76
function function_cf47ab3f9defe35b() {
    foreach (player in level.players) {
        player setclientdvar(@"hash_df1dc712c4a91588", 65);
        player setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
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

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x926
// Size: 0x42
function function_2289677bd4ea8866(var_b67f035457936ecd) {
    /#
        wait(1);
        while (1) {
            host = namespace_d576b6dc7cef9c62::gethostplayer();
            if (isdefined(host)) {
                function_b2a63c397eb5ccdf(host, var_b67f035457936ecd);
            }
            wait(0.25);
        }
    #/
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x96f
// Size: 0x186
function function_b2a63c397eb5ccdf(player, var_b67f035457936ecd) {
    /#
        /#
            assert(isdefined(var_b67f035457936ecd));
        #/
        animstruct = spawnstruct();
        animstruct [[ var_b67f035457936ecd ]]();
        foreach (pack in animstruct.packs) {
            foreach (ent in pack.ents) {
                ent hide();
            }
        }
        while (1) {
            function_9384c9ed097bf7b9(player, "<unknown string>", "<unknown string>");
            startorigin = player.origin;
            startangles = player getplayerangles();
            level.var_ca629cf434263639 = 0;
            thread function_e00bf2a7852cbc6(player, animstruct);
            thread function_710d2b779609907d(player, animstruct);
            thread function_b51365f787d44355(player, animstruct);
            function_9384c9ed097bf7b9(player, "<unknown string>", "<unknown string>");
            function_3c95f70d7b40e916(player, animstruct);
            player setorigin(startorigin);
            player setplayerangles(startangles);
            wait(0.5);
        }
    #/
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xafc
// Size: 0x52
function function_9384c9ed097bf7b9(player, var_1131de9c9b830e78, keystring) {
    /#
        while (player buttonpressed(var_1131de9c9b830e78) || player buttonpressed(keystring)) {
            waitframe();
        }
        while (!player buttonpressed(var_1131de9c9b830e78) && !player buttonpressed(keystring)) {
            waitframe();
        }
    #/
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb55
// Size: 0x19a
function function_710d2b779609907d(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        while (1) {
            level.var_ca629cf434263639 = 0;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(animstruct.var_2739b8c6b038ba5e)) {
                foreach (ent in animstruct.var_2739b8c6b038ba5e.ents) {
                    ent scriptmodelpauseanim(1);
                }
                if (animstruct.var_2739b8c6b038ba5e function_ff03e352a5746185()) {
                    player function_a37d805bcda4d0d2(1);
                }
            }
            level.var_ca629cf434263639 = 1;
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            if (isdefined(animstruct.var_2739b8c6b038ba5e)) {
                foreach (ent in animstruct.var_2739b8c6b038ba5e.ents) {
                    ent scriptmodelpauseanim(0);
                }
                if (animstruct.var_2739b8c6b038ba5e function_ff03e352a5746185()) {
                    player function_a37d805bcda4d0d2(0);
                }
            }
        }
    #/
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcf6
// Size: 0x1ca
function function_b51365f787d44355(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        startorigin = player getorigin();
        startangles = player getplayerangles();
        while (1) {
            while (!player buttonpressed("<unknown string>")) {
                waitframe();
            }
            player playershow();
            player function_985b0973f29da4f8("<unknown string>");
            player cameraunlink();
            player disablephysicaldepthoffieldscripting();
            if (isdefined(animstruct.var_2739b8c6b038ba5e)) {
                var_bffcba6249871e48 = animstruct.var_2739b8c6b038ba5e function_78dfe475a5d4f843(player);
                cameraangles = var_bffcba6249871e48[1];
                var_3df9d9a1027fb9bc = var_bffcba6249871e48[0];
                var_ec2e75eacaecc5a6 = var_3df9d9a1027fb9bc + (0, 0, -60);
                var_a6fd7eae18e63f8 = cameraangles;
                player setorigin(var_ec2e75eacaecc5a6);
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
            if (isdefined(animstruct.var_2739b8c6b038ba5e)) {
                animstruct.var_2739b8c6b038ba5e function_bda88f27a0337eaa(animstruct, player, 1);
            }
            player playerhide();
            player namespace_f8065cafc523dba5::function_379bb555405c16bb("<unknown string>");
            player enablephysicaldepthoffieldscripting();
            while (player buttonpressed("<unknown string>")) {
                waitframe();
            }
        }
    #/
}

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
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

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf05
// Size: 0x351
function function_e00bf2a7852cbc6(player, animstruct) {
    /#
        animstruct endon("<unknown string>");
        foreach (pack in animstruct.packs) {
            animstruct.var_2739b8c6b038ba5e = pack;
            if (isdefined(pack.startfunc)) {
                animstruct [[ pack.startfunc ]](pack.paramarray);
            }
            if (isdefined(pack.fov)) {
                allplayers_setfov(pack.fov);
            } else {
                function_cf47ab3f9defe35b();
            }
            if (isdefined(pack.fstop) && isdefined(pack.var_ed8206fef1806fef)) {
                allplayers_setphysicaldof(pack.fstop, pack.var_ed8206fef1806fef, pack.focusspeed, pack.aperturespeed, pack.var_c06551440b16249c);
            }
            if (isdefined(pack.fx)) {
                playfx(getfx(pack.fx), pack.fxorigin, anglestoforward(pack.fxangles), anglestoup(pack.fxangles));
            }
            foreach (ent in pack.ents) {
                ent show();
                ent dontinterpolate();
                ent scriptmodelplayanimdeltamotionfrompos(level.scr_anim[ent.animname][pack.anime], animstruct.var_11bfcab16008015e, animstruct.var_f7c301a9de8d90f4, ent.animname);
                ent thread namespace_b5a115f53b441ef5::start_notetrack_wait(ent, ent.animname, pack.anime, ent.animname, level.scr_anim[ent.animname][pack.anime]);
            }
            foreach (ent in pack.var_fb299adfd0f8bfc5) {
                ent show();
            }
            if (isdefined(player)) {
                if (isdefined(pack.var_eedb5fb15eb26bfa)) {
                    [[ pack.var_eedb5fb15eb26bfa ]](player, pack.var_5ab13b55d7ceff80);
                }
                player cameraunlink();
                player function_8ff8fd7841f6eba2();
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

// Namespace namespace_ba19537f431c9855/namespace_479b5e8883f7ad2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125d
// Size: 0x18f
function function_3c95f70d7b40e916(player, animstruct) {
    /#
        animstruct notify("<unknown string>");
        if (isdefined(animstruct.var_2739b8c6b038ba5e) && isdefined(animstruct.var_2739b8c6b038ba5e.endfunc)) {
            animstruct [[ animstruct.var_2739b8c6b038ba5e.endfunc ]](animstruct.var_2739b8c6b038ba5e.var_315361abd838fad4);
        }
        foreach (pack in animstruct.packs) {
            foreach (ent in pack.ents) {
                ent scriptmodelclearanim();
                ent hide();
            }
            foreach (ent in pack.var_fb299adfd0f8bfc5) {
                ent hide();
            }
        }
        player cameraunlink();
        player function_8ff8fd7841f6eba2();
        function_cf47ab3f9defe35b();
        allplayers_clearphysicaldof();
    #/
}

