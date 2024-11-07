#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\engine\trace.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\class.gsc;
#using scripts\common\vehicle_paths.gsc;

#namespace palfa_infil;

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3f
// Size: 0x113
function function_3ef5f926204cbd9e(subtype) {
    function_f1aed36ab4598ea("palfa_infil");
    thread function_393cbd8435fcb5c0();
    /#
        setdevdvarifuninitialized(@"hash_3dc902e1a71dd25d", 0);
    #/
    var_453e4fc2c649fea4 = [];
    var_453e4fc2c649fea4[0] = [0, 1];
    var_453e4fc2c649fea4[1] = [2, 3];
    var_453e4fc2c649fea4[2] = [4, 5];
    var_453e4fc2c649fea4[3] = [6, 7];
    var_453e4fc2c649fea4[4] = [8, 9];
    var_453e4fc2c649fea4[5] = [10, 11];
    var_453e4fc2c649fea4[6] = [12, 13];
    var_453e4fc2c649fea4[7] = [14, 15];
    var_453e4fc2c649fea4[8] = [16, 17];
    var_453e4fc2c649fea4[9] = [18, 19];
    thread infil_add("infil_palfa", subtype, 20, 4, var_453e4fc2c649fea4, &palfa_spawn, &function_97bbcb5e314a57d5, &function_8154362d8a73c991);
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x105a
// Size: 0x13c
function palfa_spawn(team, target, subtype, originalsubtype) {
    initanims(subtype, team, originalsubtype);
    scene_node = getstruct(target, "targetname");
    postlaunchscenenodecorrection(scene_node, team, subtype, originalsubtype);
    infil = spawn("script_origin", scene_node.origin);
    infil.angles = scene_node.angles;
    infil.scene_node = scene_node;
    if (isdefined(scene_node.target)) {
        var_8539adbf8f73e390 = 0;
        for (i = 0; i < 19; i++) {
            dur = getanimlength(level.scr_anim["slot_" + i]["palfa_infil_intro"]);
            if (dur > var_8539adbf8f73e390) {
                var_8539adbf8f73e390 = dur;
            }
        }
        infil.introdur = var_8539adbf8f73e390;
        infil.path = scene_node;
    }
    infil.subtype = subtype;
    infil.originalsubtype = originalsubtype;
    infil thread infilthink(team, subtype);
    return infil;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x119f
// Size: 0xb3
function postlaunchscenenodecorrection(scene_node, team, subtype, originalsubtype) {
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    switch (mapname) {
    case #"hash_3e552e81b4a21fff":
        if (team == "axis") {
            scene_node.origin -= (0, 0, 22.5);
        } else {
            scene_node.origin -= (0, 200, 22.5);
        }
        break;
    default:
        break;
    }
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x125a
// Size: 0x4d
function function_97bbcb5e314a57d5(subtype) {
    animlength = getanimlength(level.scr_anim["slot_0"]["palfa_infil_intro"]) + getanimlength(level.scr_anim["slot_0"]["palfa_infil_exit"]);
    return animlength;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x12b0
// Size: 0x236
function function_8154362d8a73c991(infil, spot_index) {
    self endon("player_free_spot");
    if (isplayer(self)) {
        self setclienttriggeraudiozone("jup_preinfil_generic", 1);
    }
    thread infil_radio_idle(infil);
    thread player_infil_end();
    spawnpos = infil.linktoent gettagorigin("tag_origin_animate");
    spawnang = infil.linktoent gettagangles("tag_origin_animate");
    thread infil_player_rig_updated("slot_" + spot_index, spawnpos, spawnang);
    self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe_heli");
    self lerpfovbypreset("80_instant");
    self lerpfovscalefactor(0, 0);
    self visionsetnakedforplayer("mp_core_infil_2", 0);
    thread player_disconnect();
    gameflagwait("infil_started");
    infil.linktoent anim_first_frame_solo(self.player_rig, "palfa_infil" + "_intro", "tag_origin_animate");
    self.player_rig linkto(infil.linktoent, "tag_origin_animate");
    if (isdefined(self.animname) && !isai(self)) {
        self setclienttriggeraudiozone("jup_infil_generic");
        self playlocalsound("jup_infil_palfa_lr");
    }
    thread scripts\mp\music_and_dialog::function_3aa69e0e6827ce5("jup_mp_infil");
    self setcinematicmotionoverride("disabled");
    self lerpviewangleclamp(1, 0.25, 0.25, 40, 40, 15, 5);
    thread clear_infil_ambient_zone();
    thread scripts\mp\infilexfil\infilexfil::function_d41cba513a03d958(4);
    infil.linktoent anim_player_solo(self, self.player_rig, "palfa_infil" + "_intro", "tag_origin_animate");
    self.player_rig unlink();
    thread scripts\mp\class::unblockclasschange();
    infil anim_player_solo(self, self.player_rig, "palfa_infil" + "_exit");
    self lerpfovscalefactor(1, 2);
    self visionsetnakedforplayer("", 0.75);
    self setdemeanorviewmodel("normal");
    self clearcinematicmotionoverride();
    self disablephysicaldepthoffieldscripting();
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ee
// Size: 0x3c
function clear_infil_ambient_zone() {
    self endon("disconnect");
    level waittill("prematch_over");
    wait 1;
    if (isdefined(self.var_5b097bde4417d7ad)) {
        self clearsoundsubmix(self.var_5b097bde4417d7ad, 5);
    }
    self clearclienttriggeraudiozone(2);
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1532
// Size: 0x38
function player_infil_end() {
    self endon("disconnect");
    level waittill("prematch_over");
    self notify("remove_rig");
    self clearclienttriggeraudiozone(1);
    self lerpfovbypreset("default_2seconds");
    scripts\mp\utility\player::setdof_default();
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1572
// Size: 0xd2
function infil_radio_idle(infil) {
    if (!flag("infil_started")) {
        if (isplayer(self)) {
            if (!isdefined(self)) {
                return;
            }
            var_9742aa030e46f6c0 = spawn("script_origin", (0, 0, 0));
            var_9742aa030e46f6c0 showonlytoplayer(self);
            radio_sfx = spawn("script_origin", (0, 0, 0));
            radio_sfx showonlytoplayer(self);
            var_9742aa030e46f6c0 playloopsound("jup_infil_palfa_pre");
            radio_sfx playloopsound("dx_mpo_ukop_radio_chatter");
            function_7330aa81e1f66e19("infil_started", "death_or_disconnect");
            wait 1;
            var_9742aa030e46f6c0 stoploopsound("jup_infil_palfa_pre");
            radio_sfx stoploopsound("dx_mpo_ukop_radio_chatter");
            var_9742aa030e46f6c0 delete();
            radio_sfx delete();
        }
        return;
    }
    return;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x164c
// Size: 0x2e
function function_7330aa81e1f66e19(var_8068764aee94f2f4, playerstring) {
    assert(isdefined(var_8068764aee94f2f4));
    if (isdefined(playerstring)) {
        self endon(playerstring);
    }
    gameflagwait(var_8068764aee94f2f4);
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1682
// Size: 0x4c
function player_disconnect() {
    level endon("prematch_over");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        self visionsetnakedforplayer("");
        self clearclienttriggeraudiozone(0);
        self lerpfovbypreset("default");
        self setviewmodeldepthoffield(0, 0, 18);
        scripts\mp\utility\player::setdof_default();
    }
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0x1ca
function spawnactors(team, scene_name, extra_crew) {
    if (!isdefined(self.actors)) {
        self.actors = [];
    }
    self.actors[self.actors.size] = self.linktoent spawn_anim_model("crew1", "tag_origin_animate", "fullbody_sp_ally_helicopter_crew_chief");
    self.actors[self.actors.size] = self.linktoent spawn_anim_model("crew2", "tag_origin_animate", "fullbody_sp_ally_helicopter_crew_chief");
    switch (team) {
    case #"hash_7c2d091e6337bf54":
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("crew3", "tag_origin_animate", "body_russian_helicopter_pilot", "head_russian_helicopter_pilot_opaque");
        break;
    case #"hash_5f54b9bf7583687f":
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("crew3", "tag_origin_animate", "body_pilot_helicopter_british", "head_pilot_helicopter_british");
        break;
    default:
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("crew3", "tag_origin_animate", "fullbody_sp_ally_helicopter_crew_chief");
        break;
    }
    foreach (actor in self.actors) {
        actor.infil = self;
    }
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a8
// Size: 0x140
function infilthink(team, scene_name) {
    var_e026a614f7467557 = getdvarfloat(@"hash_ea4c44a08cd23d5d", 0.2);
    foreach (ent in getentarray("infil_delete", "script_noteworthy")) {
        ent delete();
    }
    thread vehiclethink(team, self.scene_node, scene_name);
    thread actorthink(team, self.scene_node, scene_name);
    gameflagwait("infil_started");
    setdvar(@"r_spotlightentityshadows", 1);
    setdvar(@"hash_ea4c44a08cd23d5d", 1);
    level notify("start_scene");
    level waittill("prematch_over");
    setdvar(@"r_spotlightentityshadows", 0);
    setdvar(@"hash_ea4c44a08cd23d5d", var_e026a614f7467557);
    while (isdefined(self.linktoent) || isdefined(self.actors)) {
        waitframe();
    }
    level.infilsactive--;
    self delete();
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19f0
// Size: 0x308
function ropethink(scene_name) {
    self.linktoent.var_a6985b5b48b0a0e3 = self.linktoent spawn_anim_model("rope_fl", "tag_origin_animate", "equipment_fast_rope_wm_01_infil_heli_l");
    self.linktoent.var_a698595b48b09c7d = self.linktoent spawn_anim_model("rope_fr", "tag_origin_animate", "equipment_fast_rope_wm_01_infil_heli_l");
    self.linktoent.var_a6875b5b489e9687 = self.linktoent spawn_anim_model("rope_bl", "tag_origin_animate", "equipment_fast_rope_wm_01_infil_heli_l");
    self.linktoent.var_a687415b489e5d59 = self.linktoent spawn_anim_model("rope_br", "tag_origin_animate", "equipment_fast_rope_wm_01_infil_heli_l");
    self.linktoent.var_a6985b5b48b0a0e3 anim_first_frame_solo(self.linktoent.var_a6985b5b48b0a0e3, "palfa_infil");
    self.linktoent.var_a698595b48b09c7d anim_first_frame_solo(self.linktoent.var_a698595b48b09c7d, "palfa_infil");
    self.linktoent.var_a6875b5b489e9687 anim_first_frame_solo(self.linktoent.var_a6875b5b489e9687, "palfa_infil");
    self.linktoent.var_a687415b489e5d59 anim_first_frame_solo(self.linktoent.var_a687415b489e5d59, "palfa_infil");
    self.linktoent thread anim_single_solo(self.linktoent.var_a6985b5b48b0a0e3, "palfa_infil", "tag_origin_animate");
    self.linktoent thread anim_single_solo(self.linktoent.var_a698595b48b09c7d, "palfa_infil", "tag_origin_animate");
    self.linktoent thread anim_single_solo(self.linktoent.var_a6875b5b489e9687, "palfa_infil", "tag_origin_animate");
    self.linktoent thread anim_single_solo(self.linktoent.var_a687415b489e5d59, "palfa_infil", "tag_origin_animate");
    duration = getanimlength(level.scr_anim[self.linktoent.var_a6985b5b48b0a0e3.animname]["palfa_infil"]);
    wait duration;
    if (!isdefined(self.linktoent)) {
        /#
        #/
        return;
    }
    self.linktoent.var_a6985b5b48b0a0e3 unlink();
    self.linktoent.var_a698595b48b09c7d unlink();
    self.linktoent.var_a6875b5b489e9687 unlink();
    self.linktoent.var_a687415b489e5d59 unlink();
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1d00
// Size: 0x211
function vehiclethink(team, scene_node, scene_name, extra_crew) {
    self.linktoent = spawninfilvehicle(scene_node, team, scene_name);
    self.var_addd3217bc59a7b8 = function_7d7e095d01f0873c(scene_name);
    anim_first_frame_solo(self.linktoent, "palfa_infil");
    self.linktoent function_66a58c7e02607034(self.var_addd3217bc59a7b8);
    gameflagwait("infil_started");
    self.linktoent setscriptablepartstate("infil_lights", "on", 0);
    self.linktoent playsoundonmovingent("jup_infil_palfa_heli_ext_lr");
    thread ropethink(scene_name);
    thread anim_single_solo(self.linktoent, "palfa_infil");
    if (isdefined(self.path)) {
        animlength = getanimlength(level.scr_anim["palfa"]["palfa_infil"]);
        wait animlength;
        self.linktoent stopanimscripted();
        if (self.linktoent vehicle_isphysveh()) {
            self.linktoent vehphys_setdefaultmotion();
        }
        startstruct = spawnstruct();
        startstruct.origin = self.linktoent.origin;
        startstruct.angles = self.linktoent.angles;
        startstruct.radius = 500;
        startstruct.speed = 30;
        startstruct.target = self.path.target;
        self.linktoent scripts\common\vehicle_paths::vehicle_paths_helicopter(startstruct);
    } else {
        animlength = getanimlength(level.scr_anim["palfa"]["palfa_infil"]);
        wait animlength;
    }
    if (isdefined(self.linktoent)) {
        self.linktoent delete();
        self.linktoent = undefined;
    }
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1f19
// Size: 0x109
function actorthink(team, scene_node, scene_name, extra_crew) {
    thread spawnactors(team, scene_name, extra_crew);
    self.linktoent anim_first_frame(self.actors, "palfa_infil", "tag_origin_animate");
    gameflagwait("infil_started");
    self.linktoent anim_single(self.actors, "palfa_infil", "tag_origin_animate");
    duration = getanimlength(level.scr_anim["crew1"]["palfa_infil"]);
    wait duration;
    foreach (actor in self.actors) {
        if (isdefined(actor)) {
            actor delete();
        }
    }
    self.actors = undefined;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x202a
// Size: 0x245
function spawn_anim_model(animname, linkto_ent, body, head, weapon) {
    male = 1;
    if (cointoss()) {
        male = 0;
    }
    if (body == "random") {
        if (male) {
            index = randomint(3);
            if (index == 0) {
                body = "c_civ_pic_male_2_brown";
            } else if (index == 1) {
                body = "body_opforce_london_civ_1_1";
            } else if (index == 2) {
                body = "civ_london_male_2_5";
            }
        } else if (cointoss()) {
            body = "civ_london_female_1_4";
        } else {
            body = "c_civ_pic_female_5_6";
        }
    }
    guy = spawn("script_model", (0, 0, 0));
    guy setmodel(body);
    if (isdefined(head)) {
        if (head == "random") {
            if (male) {
                if (cointoss()) {
                    head = "head_bg_var_head_bg_male_09_head_sc_male_14";
                } else {
                    head = "head_bg_var_head_male_bc_01_head_hero_gator";
                }
            } else if (cointoss()) {
                head = "head_bg_var_head_female_bc_01_head_sc_female_10";
            } else {
                head = "head_bg_var_head_sc_female_04_head_female_bc_02";
            }
        }
        guy_head = spawn("script_model", (0, 0, 0));
        guy_head setmodel(head);
        guy_head linkto(guy, "j_spine4", (0, 0, 0), (0, 0, 0));
        guy.head = guy_head;
        guy thread delete_on_death(guy_head);
    }
    if (isdefined(weapon)) {
        guy_weapon = spawn("script_model", (0, 0, 0));
        guy_weapon setmodel(weapon);
        guy_weapon linkto(guy, "j_gun", (0, 0, 0), (0, 0, 0));
        guy thread delete_on_death(guy_weapon);
        guy.weapon = guy_weapon;
    }
    guy.animname = animname;
    guy setanimtree();
    if (isdefined(linkto_ent)) {
        thread delete_on_death(guy);
        guy linkto(self, linkto_ent, (0, 0, 0), (0, 0, 0));
    }
    return guy;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2278
// Size: 0x555
function initanims(subtype, team, originalsubtype) {
    script_model_alpha_anims(subtype);
    function_68aab9f69431ce1(subtype, team, originalsubtype);
    addnotetrack_customfunction("slot_0", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_1", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_2", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_3", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_4", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_5", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_6", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_7", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_8", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_9", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_10", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_11", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_12", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_13", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_14", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_15", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_16", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_17", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_18", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_19", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_0", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_1", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_2", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_3", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_4", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_5", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_6", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_7", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_8", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_9", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_10", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_11", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_12", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_13", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_14", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_15", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_16", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_17", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_18", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_19", "player_lock_look_1_second", &player_lock_look_1_second);
    addnotetrack_customfunction("slot_0", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_1", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_2", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_3", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_4", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_5", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_6", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_7", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_8", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_9", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_10", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_11", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_12", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_13", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_14", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_15", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_16", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_17", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_18", "free_look", &player_free_look);
    addnotetrack_customfunction("slot_19", "free_look", &player_free_look);
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27d5
// Size: 0xcd7
function script_model_alpha_anims(subtype) {
    level.scr_animtree["slot_0"] = %script_model;
    level.scr_anim["slot_0"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_0_intro;
    level.scr_eventanim["slot_0"]["palfa_infil_intro"] = %"hash_50676dd946ea901";
    level.scr_animtree["slot_1"] = %script_model;
    level.scr_anim["slot_1"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_1_intro;
    level.scr_eventanim["slot_1"]["palfa_infil_intro"] = %"hash_50675dd946ea74e";
    level.scr_animtree["slot_2"] = %script_model;
    level.scr_anim["slot_2"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_2_intro;
    level.scr_eventanim["slot_2"]["palfa_infil_intro"] = %"hash_50674dd946ea59b";
    level.scr_animtree["slot_3"] = %script_model;
    level.scr_anim["slot_3"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_3_intro;
    level.scr_eventanim["slot_3"]["palfa_infil_intro"] = %"hash_50673dd946ea3e8";
    level.scr_animtree["slot_4"] = %script_model;
    level.scr_anim["slot_4"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_4_intro;
    level.scr_eventanim["slot_4"]["palfa_infil_intro"] = %"hash_5067add946eafcd";
    level.scr_animtree["slot_5"] = %script_model;
    level.scr_anim["slot_5"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_5_intro;
    level.scr_eventanim["slot_5"]["palfa_infil_intro"] = %"hash_50679dd946eae1a";
    level.scr_animtree["slot_6"] = %script_model;
    level.scr_anim["slot_6"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_6_intro;
    level.scr_eventanim["slot_6"]["palfa_infil_intro"] = %"hash_50678dd946eac67";
    level.scr_animtree["slot_7"] = %script_model;
    level.scr_anim["slot_7"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_7_intro;
    level.scr_eventanim["slot_7"]["palfa_infil_intro"] = %"hash_50677dd946eaab4";
    level.scr_animtree["slot_8"] = %script_model;
    level.scr_anim["slot_8"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_8_intro;
    level.scr_eventanim["slot_8"]["palfa_infil_intro"] = %"hash_5066edd946e9b69";
    level.scr_animtree["slot_9"] = %script_model;
    level.scr_anim["slot_9"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_9_intro;
    level.scr_eventanim["slot_9"]["palfa_infil_intro"] = %"hash_5066ddd946e99b6";
    level.scr_animtree["slot_10"] = %script_model;
    level.scr_anim["slot_10"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_10_intro;
    level.scr_eventanim["slot_10"]["palfa_infil_intro"] = %"hash_78a1c58338069b1a";
    level.scr_animtree["slot_11"] = %script_model;
    level.scr_anim["slot_11"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_11_intro;
    level.scr_eventanim["slot_11"]["palfa_infil_intro"] = %"hash_78a1c68338069ccd";
    level.scr_animtree["slot_12"] = %script_model;
    level.scr_anim["slot_12"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_12_intro;
    level.scr_eventanim["slot_12"]["palfa_infil_intro"] = %"hash_78a1c383380697b4";
    level.scr_animtree["slot_13"] = %script_model;
    level.scr_anim["slot_13"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_13_intro;
    level.scr_eventanim["slot_13"]["palfa_infil_intro"] = %"hash_78a1c48338069967";
    level.scr_animtree["slot_14"] = %script_model;
    level.scr_anim["slot_14"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_14_intro;
    level.scr_eventanim["slot_14"]["palfa_infil_intro"] = %"hash_78a1c1833806944e";
    level.scr_animtree["slot_15"] = %script_model;
    level.scr_anim["slot_15"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_15_intro;
    level.scr_eventanim["slot_15"]["palfa_infil_intro"] = %"hash_78a1c28338069601";
    level.scr_animtree["slot_16"] = %script_model;
    level.scr_anim["slot_16"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_16_intro;
    level.scr_eventanim["slot_16"]["palfa_infil_intro"] = %"hash_78a1bf83380690e8";
    level.scr_animtree["slot_17"] = %script_model;
    level.scr_anim["slot_17"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_17_intro;
    level.scr_eventanim["slot_17"]["palfa_infil_intro"] = %"hash_78a1c0833806929b";
    level.scr_animtree["slot_18"] = %script_model;
    level.scr_anim["slot_18"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_18_intro;
    level.scr_eventanim["slot_18"]["palfa_infil_intro"] = %"hash_78a1bd8338068d82";
    level.scr_animtree["slot_19"] = %script_model;
    level.scr_anim["slot_19"]["palfa_infil_intro"] = script_model%iw9_mp_infil_palfa_seat_19_intro;
    level.scr_eventanim["slot_19"]["palfa_infil_intro"] = %"hash_78a1be8338068f35";
    level.scr_anim["slot_0"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_0_exit;
    level.scr_eventanim["slot_0"]["palfa_infil_exit"] = %"hash_6894041695d3b9f3";
    level.scr_anim["slot_1"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_1_exit;
    level.scr_eventanim["slot_1"]["palfa_infil_exit"] = %"hash_6894031695d3b840";
    level.scr_anim["slot_2"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_2_exit;
    level.scr_eventanim["slot_2"]["palfa_infil_exit"] = %"hash_6894061695d3bd59";
    level.scr_anim["slot_3"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_3_exit;
    level.scr_eventanim["slot_3"]["palfa_infil_exit"] = %"hash_6894051695d3bba6";
    level.scr_anim["slot_4"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_4_exit;
    level.scr_eventanim["slot_4"]["palfa_infil_exit"] = %"hash_6894081695d3c0bf";
    level.scr_anim["slot_5"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_5_exit;
    level.scr_eventanim["slot_5"]["palfa_infil_exit"] = %"hash_6894071695d3bf0c";
    level.scr_anim["slot_6"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_6_exit;
    level.scr_eventanim["slot_6"]["palfa_infil_exit"] = %"hash_68940a1695d3c425";
    level.scr_anim["slot_7"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_7_exit;
    level.scr_eventanim["slot_7"]["palfa_infil_exit"] = %"hash_6894091695d3c272";
    level.scr_anim["slot_8"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_8_exit;
    level.scr_eventanim["slot_8"]["palfa_infil_exit"] = %"hash_68940c1695d3c78b";
    level.scr_anim["slot_9"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_9_exit;
    level.scr_eventanim["slot_9"]["palfa_infil_exit"] = %"hash_68940b1695d3c5d8";
    level.scr_anim["slot_10"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_10_exit;
    level.scr_eventanim["slot_10"]["palfa_infil_exit"] = %"hash_739af6096c26650";
    level.scr_anim["slot_11"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_11_exit;
    level.scr_eventanim["slot_11"]["palfa_infil_exit"] = %"hash_739b06096c26803";
    level.scr_anim["slot_12"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_12_exit;
    level.scr_eventanim["slot_12"]["palfa_infil_exit"] = %"hash_739b16096c269b6";
    level.scr_anim["slot_13"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_13_exit;
    level.scr_eventanim["slot_13"]["palfa_infil_exit"] = %"hash_739b26096c26b69";
    level.scr_anim["slot_14"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_14_exit;
    level.scr_eventanim["slot_14"]["palfa_infil_exit"] = %"hash_739b36096c26d1c";
    level.scr_anim["slot_15"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_15_exit;
    level.scr_eventanim["slot_15"]["palfa_infil_exit"] = %"hash_739b46096c26ecf";
    level.scr_anim["slot_16"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_16_exit;
    level.scr_eventanim["slot_16"]["palfa_infil_exit"] = %"hash_739b56096c27082";
    level.scr_anim["slot_17"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_17_exit;
    level.scr_eventanim["slot_17"]["palfa_infil_exit"] = %"hash_739b66096c27235";
    level.scr_anim["slot_18"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_18_exit;
    level.scr_eventanim["slot_18"]["palfa_infil_exit"] = %"hash_739b76096c273e8";
    level.scr_anim["slot_19"]["palfa_infil_exit"] = script_model%iw9_mp_infil_palfa_seat_19_exit;
    level.scr_eventanim["slot_19"]["palfa_infil_exit"] = %"hash_739b86096c2759b";
    level.scr_animtree["crew1"] = %script_model;
    level.scr_anim["crew1"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_crew_1;
    level.scr_eventanim["crew1"]["palfa_infil"] = %"hash_3a64585d63ee398d";
    level.scr_animtree["crew2"] = %script_model;
    level.scr_anim["crew2"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_crew_2;
    level.scr_eventanim["crew2"]["palfa_infil"] = %"hash_3a64555d63ee3474";
    level.scr_animtree["crew3"] = %script_model;
    level.scr_anim["crew3"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_crew_3;
    level.scr_eventanim["crew3"]["palfa_infil"] = %"hash_3a64565d63ee3627";
    level.scr_animtree["rope_fl"] = %script_model;
    level.scr_anim["rope_fl"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_rope_fl;
    level.scr_animtree["rope_fr"] = %script_model;
    level.scr_anim["rope_fr"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_rope_fr;
    level.scr_animtree["rope_bl"] = %script_model;
    level.scr_anim["rope_bl"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_rope_bl;
    level.scr_animtree["rope_br"] = %script_model;
    level.scr_anim["rope_br"]["palfa_infil"] = script_model%iw9_mp_infil_palfa_rope_br;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34b4
// Size: 0x3a
function function_68aab9f69431ce1(subtype, team, originalsubtype) {
    level.scr_anim["palfa"]["palfa_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_palfa_vehicle;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34f6
// Size: 0x15f
function spawninfilvehicle(scene_node, team, scene_name) {
    spawnpos = scene_node.origin;
    spawnang = scene_node.angles;
    model = "veh9_mil_air_heli_palfa_doors_open_vehphys_mp";
    /#
        setdevdvarifuninitialized(@"hash_fbe93162f3c76561", 1);
    #/
    var_ab5cd311f5dc80a6 = "veh9_mil_air_heli_palfa_physics_mp";
    vehicle = spawnvehicle(model, scene_name, var_ab5cd311f5dc80a6, spawnpos, spawnang);
    vehicle setvehicleteam(team);
    vehicle.animname = "palfa";
    vehicle setcandamage(0);
    if (vehicle vehicle_isphysveh()) {
        vehicle function_247ad6a91f6a4ffe(1);
        vehicle vehphys_forcekeyframedmotion();
    } else {
        vehicle notsolid();
    }
    vehicle hidepart("tag_main_rotor_blade_01");
    vehicle hidepart("tag_main_rotor_blade_02");
    vehicle hidepart("tag_main_rotor_blade_03");
    vehicle hidepart("tag_main_rotor_blade_04");
    vehicle hidepart("tag_main_rotor_blade_05");
    vehicle hidepart("tag_main_rotor_blade_06");
    vehicle hidepart("tag_tail_rotor_blade_01");
    vehicle hidepart("tag_tail_rotor_blade_02");
    vehicle hidepart("tag_tail_rotor_blade_03");
    vehicle hidepart("tag_tail_rotor_blade_04");
    vehicle.infil = self;
    vehicle vehicle_turnengineoff();
    return vehicle;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x365e
// Size: 0xe4
function function_7d7e095d01f0873c(subtype) {
    var_addd3217bc59a7b8 = spawnstruct();
    var_5e0676140eecdf2d = "palfa_" + subtype + "_probe";
    probes = getentarray(var_5e0676140eecdf2d, "script_noteworthy");
    probe = undefined;
    foreach (ent in probes) {
        if (!isdefined(ent) || istrue(ent.claimed)) {
            continue;
        }
        probe = ent;
        break;
    }
    if (!isdefined(probe)) {
        return undefined;
    }
    probe.claimed = 1;
    var_addd3217bc59a7b8.probe = probe;
    function_89a2405953b84136(var_addd3217bc59a7b8, 1);
    return var_addd3217bc59a7b8;
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x374b
// Size: 0x53
function function_66a58c7e02607034(var_addd3217bc59a7b8) {
    if (!isdefined(var_addd3217bc59a7b8)) {
        return;
    }
    var_addd3217bc59a7b8.probe show();
    var_addd3217bc59a7b8.probe linkto(self, "tag_origin", (-51, 0, -164), (0, 0, 0));
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x37a6
// Size: 0x2a
function function_89a2405953b84136(var_addd3217bc59a7b8, override_og) {
    if (!isdefined(var_addd3217bc59a7b8)) {
        return;
    }
    var_addd3217bc59a7b8.probe hide();
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37d8
// Size: 0x19
function function_393cbd8435fcb5c0() {
    level waittill("prematch_over");
    wait 61;
    function_f4e0ff5cb899686d("palfa_infil");
}

// Namespace palfa_infil / namespace_debf90849fd14e9a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37f9
// Size: 0x13
function function_6158ef142e9bd640() {
    wait 27;
    self visionsetnakedforplayer("mp_core_infil_2", 3);
}

