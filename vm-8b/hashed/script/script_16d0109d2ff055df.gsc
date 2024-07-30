#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\anim.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace van_infil;

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8db
// Size: 0x9d
function van_init(subtype) {
    /#
        setdevdvarifuninitialized(@"hash_3dc902e1a71dd25d", 0);
    #/
    function_f1aed36ab4598ea("van_infil");
    thread function_e85c746a9eaa79f3();
    initanims(subtype);
    var_453e4fc2c649fea4 = [];
    var_453e4fc2c649fea4[0] = [0];
    var_453e4fc2c649fea4[1] = [1];
    var_453e4fc2c649fea4[2] = [2, 3, 4, 5];
    thread infil_add("infil_van", subtype, 6, 4, var_453e4fc2c649fea4, &function_11ab2a30c47f0b5e, &function_91f416a3ece2ef9a, &function_f67856e4fbb899a0);
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x980
// Size: 0x8a
function function_11ab2a30c47f0b5e(team, target, subtype, originalsubtype) {
    scene_node = getstruct(target, "targetname");
    infil = spawn("script_origin", scene_node.origin);
    infil.angles = scene_node.angles;
    infil.scene_node = scene_node;
    infil thread infilthink(team, subtype);
    return infil;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa13
// Size: 0x32
function function_91f416a3ece2ef9a(subtype) {
    animlength = getanimlength(level.scr_anim["slot_0"]["van_infil"]);
    return animlength;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa4e
// Size: 0x28d
function function_f67856e4fbb899a0(infil, spot_index) {
    self endon("player_free_spot");
    thread player_infil_end();
    if (isplayer(self)) {
        self setclienttriggeraudiozone("jup_preinfil_generic", 1);
    }
    thread infil_radio_idle(infil);
    spawnpos = infil.linktoent gettagorigin("tag_origin_animate");
    spawnang = infil.linktoent gettagangles("tag_origin_animate");
    thread infil_player_rig_updated("slot_" + spot_index, spawnpos, spawnang);
    self.player_rig linkto(infil.linktoent, "tag_origin_animate");
    self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe_van");
    self visionsetnakedforplayer("mp_core_infil_2", 0);
    self.player_rig.weapon_state_func = &handleweaponstatenotetrack;
    thread player_disconnect();
    level waittill("start_scene");
    self playlocalsound("amb_infil_van_lr");
    if (isplayer(self)) {
        self setclienttriggeraudiozone("jup_infil_generic");
    }
    thread scripts\mp\music_and_dialog::function_3aa69e0e6827ce5("jup_mp_infil");
    if (isdefined(self.animname) && !isai(self)) {
        thread function_acb0a5ef09f5f702();
    }
    self lerpfov(65, 0);
    self setcinematicmotionoverride("disabled");
    self lerpviewangleclamp(1, 0.25, 0.25, 15, 15, 30, 5);
    thread scripts\mp\infilexfil\infilexfil::function_d41cba513a03d958(0.5);
    self lerpfovscalefactor(0, 0);
    thread resetfov();
    infil.linktoent anim_player_solo(self, self.player_rig, "van_infil", "tag_origin_animate");
    thread scripts\mp\class::unblockclasschange();
    if (isdefined(level.scr_viewmodelanim[self.animname]) && isdefined(level.scr_viewmodelanim[self.animname]["van_infil" + "_" + infil.subtype + "_intro"])) {
        setdvar(@"hash_7eb1641737ab83b7", 0);
    }
    thread clear_infil_ambient_zone();
    if (isdefined(self.player_rig) && self.player_rig islinked()) {
        self.player_rig unlink();
    }
    self notify("infil_finished");
    self visionsetnakedforplayer("", 0.75);
    self setdemeanorviewmodel("normal");
    self clearcinematicmotionoverride();
    self disablephysicaldepthoffieldscripting();
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xce3
// Size: 0x2d
function resetfov() {
    level waittill("infil_countdown_show");
    wait 2;
    if (!isdefined(self)) {
        return;
    }
    self lerpfovbypreset("default_2seconds");
    self lerpfovscalefactor(1, 2);
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd18
// Size: 0x116
function function_acb0a5ef09f5f702() {
    soundalias = "scn_infil_van_plr1";
    waittime = 4.9;
    switch (self.animname) {
    case #"hash_9f02a28a98823bce": 
        soundalias = "scn_infil_van_plr1";
        waittime = 4.9;
        break;
    case #"hash_9f02a38a98823d61": 
        soundalias = "scn_infil_van_plr2";
        waittime = 2.1;
        break;
    case #"hash_9f02a08a988238a8": 
        soundalias = "scn_infil_van_plr3";
        waittime = 8.3;
        break;
    case #"hash_9f02a18a98823a3b": 
        soundalias = "scn_infil_van_plr4";
        waittime = 9.5;
        break;
    case #"hash_9f02a68a9882421a": 
        soundalias = "scn_infil_van_plr5";
        waittime = 9.5;
        break;
    case #"hash_9f02a78a988243ad": 
        soundalias = "scn_infil_van_plr6";
        waittime = 3;
        break;
    default: 
        soundalias = "scn_infil_van_plr1";
        waittime = 4.9;
        break;
    }
    wait waittime;
    if (soundexists(soundalias)) {
        if (isdefined(self)) {
            self playlocalsound(soundalias);
        }
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe36
// Size: 0x3c
function clear_infil_ambient_zone() {
    self endon("disconnect");
    level waittill("prematch_over");
    wait 1;
    if (isdefined(self.var_5b097bde4417d7ad)) {
        self clearsoundsubmix(self.var_5b097bde4417d7ad, 2);
    }
    self clearclienttriggeraudiozone(2);
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7a
// Size: 0x53
function player_infil_end() {
    self endon("disconnect");
    level waittill("prematch_over");
    self notify("remove_rig");
    self clearclienttriggeraudiozone(1);
    self lerpfovbypreset("default_2seconds");
    self lerpfovscalefactor(1, 2);
    scripts\mp\utility\player::setdof_default();
    setdvar(@"hash_7eb1641737ab83b7", 0);
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed5
// Size: 0x4c
function player_disconnect() {
    level endon("prematch_over");
    self waittill("disconnect");
    if (isdefined(self)) {
        self visionsetnakedforplayer("");
        self clearclienttriggeraudiozone(0);
        self lerpfovbypreset("default");
        self setviewmodeldepthoffield(0, 0, 18);
        scripts\mp\utility\player::setdof_default();
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf29
// Size: 0x18c
function actorthink(team, scene_node, scene_name, extra_crew) {
    thread spawnactors(team, scene_name, extra_crew);
    self.linktoent anim_first_frame(self.actors, "van_infil", "tag_origin_animate");
    gameflagwait("infil_started");
    self.linktoent thread anim_single(self.actors, "van_infil", "tag_origin_animate");
    self.actors[0].head scriptmodelplayanim(level.scr_anim[self.actors[0].animname]["van_infil"]);
    self.actors[1].head scriptmodelplayanim(level.scr_anim[self.actors[1].animname]["van_infil"]);
    duration = getanimlength(level.scr_anim["chief"]["van_infil"]);
    wait duration;
    foreach (actor in self.actors) {
        if (isdefined(actor)) {
            actor delete();
        }
    }
    self.actors = undefined;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10bd
// Size: 0x211
function spawnactors(team, scene_name, extra_crew) {
    if (!isdefined(self.actors)) {
        self.actors = [];
    }
    switch (team) {
    case #"hash_7c2d091e6337bf54": 
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("driver", "tag_origin_animate", "body_mp_milsim_east_iw9_1_1", "head_mp_milsim_east_iw9_1_1");
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("chief", "tag_origin_animate", "body_mp_milsim_east_iw9_1_1", "head_mp_milsim_east_iw9_1_1");
        break;
    case #"hash_5f54b9bf7583687f": 
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("driver", "tag_origin_animate", "body_mp_milsim_west_iw9_1_1", "head_mp_milsim_west_iw9_1_1");
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("chief", "tag_origin_animate", "body_mp_milsim_west_iw9_1_1", "head_mp_milsim_west_iw9_1_1");
        break;
    default: 
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("driver", "tag_origin_animate", "body_mp_milsim_east_iw9_1_1", "head_mp_milsim_east_iw9_1_1");
        self.actors[self.actors.size] = self.linktoent spawn_anim_model("chief", "tag_origin_animate", "body_mp_milsim_east_iw9_1_1", "head_mp_milsim_east_iw9_1_1");
        break;
    }
    foreach (actor in self.actors) {
        actor.infil = self;
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x12d6
// Size: 0x18f
function spawn_anim_model(animname, linkto_ent, body, head, weapon) {
    guy = spawn("script_model", (0, 0, 0));
    guy setmodel(body);
    if (isdefined(head)) {
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
    if (animname == "chief") {
        guy hidepart("j_sling_pivot");
    }
    return guy;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x146e
// Size: 0xed
function infilthink(team, scene_name) {
    foreach (ent in getentarray("infil_delete", "script_noteworthy")) {
        ent delete();
    }
    thread vehiclethink(team, self.scene_node, scene_name);
    thread actorthink(team, self.scene_node, scene_name);
    level waittill("infil_started");
    setdvar(@"hash_dc64fb89118cae31", 1);
    level notify("start_scene");
    level waittill("prematch_over");
    setdvar(@"hash_dc64fb89118cae31", 0);
    while (isdefined(self.actors)) {
        waitframe();
    }
    level.infilsactive--;
    self delete();
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1563
// Size: 0xd6
function vehiclethink(team, scene_node, scene_name, extra_crew) {
    van = spawnvan(scene_node, team, scene_name);
    self.var_addd3217bc59a7b8 = function_bbfdaed21b5cddbb(scene_name);
    if (!isdefined(self.path)) {
        anim_first_frame_solo(van, "van_infil");
    }
    van vehicle_turnengineoff();
    van thread function_e3e8566b27b746cb();
    level waittill("infil_started");
    self.linktoent function_ffa1124c73da1ab3(self.var_addd3217bc59a7b8);
    thread anim_single_solo(van, "van_infil");
    function_4dca5340dfd36c76(scene_node, van, getanimlength(level.scr_anim["chief"]["van_infil"]), "van", "van_infil");
    level waittill("prematch_over");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1641
// Size: 0x19
function function_e85c746a9eaa79f3() {
    level waittill("prematch_over");
    wait 51;
    function_f4e0ff5cb899686d("van_infil");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1662
// Size: 0xc4
function function_e3e8566b27b746cb() {
    var_86e566189d013726 = spawn("script_model", self.origin);
    var_2a4b36bf48cbb639 = spawn("script_model", self.origin);
    level waittill("infil_started");
    waitframe();
    var_86e566189d013726 linkto(self, "tag_origin", (100, 0, 50), (0, 0, 0));
    var_2a4b36bf48cbb639 linkto(self, "tag_origin", (-174, 0, 47), (0, 0, 0));
    waitframe();
    var_86e566189d013726 playsoundonmovingent("scn_infil_van_driving_front");
    var_2a4b36bf48cbb639 playsoundonmovingent("scn_infil_van_driving_rear");
    level waittill("prematch_over");
    var_86e566189d013726 delete();
    var_2a4b36bf48cbb639 delete();
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x172e
// Size: 0x378
function initanims(subtype) {
    function_487431cf3b99e0b8(subtype);
    function_7b7d0c2db72b128(subtype);
    addnotetrack_customfunction("slot_0", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_1", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_2", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_3", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_4", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_5", "fov_63_2", &player_fov_default_2);
    addnotetrack_customfunction("slot_0", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_1", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_2", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_3", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_4", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_5", "free_look", &player_free_look, "van_infil");
    addnotetrack_customfunction("slot_0", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_1", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_2", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_3", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_4", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_5", "shake_on", &rumble_low, "van_infil");
    addnotetrack_customfunction("slot_0", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("slot_1", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("slot_2", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("slot_3", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("slot_4", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("slot_5", "shake_running", &cam_shake_running, "van_infil");
    addnotetrack_customfunction("chief", "van_chief_sfx", &van_chief_sfx, "van_infil");
    addnotetrack_customfunction("chief", "van_door_sfx", &van_door_sfx, "van_infil");
    addnotetrack_customfunction("chief", "van_close_sfx", &van_close_sfx, "van_infil");
    addnotetrack_customfunction("slot_0", "scn_infil_van_npc1", &scn_infil_van_npc1, "van_infil");
    addnotetrack_customfunction("slot_1", "scn_infil_van_npc2", &scn_infil_van_npc2, "van_infil");
    addnotetrack_customfunction("slot_2", "scn_infil_van_npc3", &scn_infil_van_npc3, "van_infil");
    addnotetrack_customfunction("slot_3", "scn_infil_van_npc4", &scn_infil_van_npc4, "van_infil");
    addnotetrack_customfunction("slot_4", "scn_infil_van_npc5", &scn_infil_van_npc5, "van_infil");
    addnotetrack_customfunction("slot_5", "scn_infil_van_npc6", &scn_infil_van_npc6, "van_infil");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1aae
// Size: 0x2af
function script_model_anims(subtype) {
    switch (subtype) {
    case #"hash_1cc79b02710cab23":
    case #"hash_6829ee5abc10c38b": 
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["van_infil"] = script_model%iw9_mp_infil_van_seat_0;
        level.scr_eventanim["slot_0"]["van_infil"] = %"hash_8730024dcfd4da5";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["van_infil"] = script_model%iw9_mp_infil_van_seat_1;
        level.scr_eventanim["slot_1"]["van_infil"] = %"hash_872ff24dcfd4bf2";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["van_infil"] = script_model%iw9_mp_infil_van_seat_2;
        level.scr_eventanim["slot_2"]["van_infil"] = %"hash_872fe24dcfd4a3f";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["van_infil"] = script_model%iw9_mp_infil_van_seat_3;
        level.scr_eventanim["slot_3"]["van_infil"] = %"hash_872fd24dcfd488c";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["van_infil"] = script_model%iw9_mp_infil_van_seat_4;
        level.scr_eventanim["slot_4"]["van_infil"] = %"hash_872fc24dcfd46d9";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["van_infil"] = script_model%iw9_mp_infil_van_seat_5;
        level.scr_eventanim["slot_5"]["van_infil"] = %"hash_872fb24dcfd4526";
        level.scr_animtree["chief"] = %script_model;
        level.scr_anim["chief"]["van_infil"] = script_model%iw9_mp_infil_van_chief;
        level.scr_eventanim["chief"]["van_infil"] = %"hash_5fb11df58d5448a4";
        level.scr_animtree["driver"] = %script_model;
        level.scr_anim["driver"]["van_infil"] = script_model%iw9_mp_infil_van_driver;
        level.scr_eventanim["driver"]["van_infil"] = %"hash_c47aafddc99fc79";
        break;
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d65
// Size: 0x544
function function_487431cf3b99e0b8(subtype) {
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    switch (mapname) {
    case #"hash_c860b74f2269590c": 
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_0;
        level.scr_eventanim["slot_0"]["van_infil"] = %"hash_3e5f9ff2fa54c7ed";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_1;
        level.scr_eventanim["slot_1"]["van_infil"] = %"hash_3e5f9ef2fa54c63a";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_2;
        level.scr_eventanim["slot_2"]["van_infil"] = %"hash_3e5f9df2fa54c487";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_3;
        level.scr_eventanim["slot_3"]["van_infil"] = %"hash_3e5f9cf2fa54c2d4";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_4;
        level.scr_eventanim["slot_4"]["van_infil"] = %"hash_3e5f9bf2fa54c121";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["van_infil"] = script_model%iw9_mp_infil_van_fort_seat_5;
        level.scr_eventanim["slot_5"]["van_infil"] = %"hash_3e5f9af2fa54bf6e";
        level.scr_animtree["chief"] = %script_model;
        level.scr_anim["chief"]["van_infil"] = script_model%iw9_mp_infil_van_fort_chief;
        level.scr_eventanim["chief"]["van_infil"] = %"hash_4f886ccaeb485b4c";
        level.scr_animtree["driver"] = %script_model;
        level.scr_anim["driver"]["van_infil"] = script_model%iw9_mp_infil_van_driver;
        level.scr_eventanim["driver"]["van_infil"] = %"hash_c47aafddc99fc79";
        break;
    default: 
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["van_infil"] = script_model%iw9_mp_infil_van_seat_0;
        level.scr_eventanim["slot_0"]["van_infil"] = %"hash_8730024dcfd4da5";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["van_infil"] = script_model%iw9_mp_infil_van_seat_1;
        level.scr_eventanim["slot_1"]["van_infil"] = %"hash_872ff24dcfd4bf2";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["van_infil"] = script_model%iw9_mp_infil_van_seat_2;
        level.scr_eventanim["slot_2"]["van_infil"] = %"hash_872fe24dcfd4a3f";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["van_infil"] = script_model%iw9_mp_infil_van_seat_3;
        level.scr_eventanim["slot_3"]["van_infil"] = %"hash_872fd24dcfd488c";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["van_infil"] = script_model%iw9_mp_infil_van_seat_4;
        level.scr_eventanim["slot_4"]["van_infil"] = %"hash_872fc24dcfd46d9";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["van_infil"] = script_model%iw9_mp_infil_van_seat_5;
        level.scr_eventanim["slot_5"]["van_infil"] = %"hash_872fb24dcfd4526";
        level.scr_animtree["chief"] = %script_model;
        level.scr_anim["chief"]["van_infil"] = script_model%iw9_mp_infil_van_chief;
        level.scr_eventanim["chief"]["van_infil"] = %"hash_5fb11df58d5448a4";
        level.scr_animtree["driver"] = %script_model;
        level.scr_anim["driver"]["van_infil"] = script_model%iw9_mp_infil_van_driver;
        level.scr_eventanim["driver"]["van_infil"] = %"hash_c47aafddc99fc79";
        break;
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22b1
// Size: 0x17
function van_chief_sfx(guy) {
    guy playsoundonmovingent("scn_infil_van_chief");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22d0
// Size: 0x17
function van_door_sfx(guy) {
    guy playsoundonmovingent("scn_infil_van_door");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x22ef
// Size: 0x17
function van_close_sfx(guy) {
    guy playsoundonmovingent("scn_infil_van_door_close");
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x230e
// Size: 0x94
function function_68aab9f69431ce1(subtype) {
    switch (subtype) {
    case #"hash_6829ee5abc10c38b": 
        level.scr_animtree["van"] = %mp_vehicles_always_loaded;
        level.scr_anim["van"]["van_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_van_vehicule_grandprix;
        break;
    case #"hash_1cc79b02710cab23": 
        level.scr_animtree["van"] = %mp_vehicles_always_loaded;
        level.scr_anim["van"]["van_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_van_vehicule_grandprix;
        break;
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23aa
// Size: 0x82
function function_7b7d0c2db72b128(subtype) {
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    switch (mapname) {
    case #"hash_c860b74f2269590c": 
        level.scr_anim["van"]["van_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_van_vehicle_fort;
        break;
    default: 
        level.scr_anim["van"]["van_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_van_vehicule_grandprix;
        break;
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2434
// Size: 0xd2
function spawnvan(scene_node, team, scene_name) {
    spawnpos = scene_node.origin;
    spawnang = scene_node.angles;
    if (isdefined(self.path)) {
        spawnpos = self.path.origin;
        spawnang = self.path.angles;
    }
    vehicle = spawnvehicle("veh9_civ_lnd_van_cargo_windows_infil", scene_name, "veh9_civ_lnd_van_cargo_physics_mp", spawnpos, spawnang);
    vehicle setvehicleteam(team);
    vehicle vehphys_forcekeyframedmotion();
    vehicle.animname = "van";
    self.linktoent = vehicle;
    vehicle.infil = self;
    return vehicle;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x250f
// Size: 0xee
function function_bbfdaed21b5cddbb(subtype) {
    var_addd3217bc59a7b8 = spawnstruct();
    var_5e0676140eecdf2d = "van_" + subtype + "_probe";
    light_name = "van_" + subtype + "_light";
    probe = getent(var_5e0676140eecdf2d, "script_noteworthy");
    lights = getentarray(light_name, "targetname");
    if (!isdefined(probe)) {
        return undefined;
    }
    foreach (l in lights) {
        if (!isdefined(l)) {
            return undefined;
        }
    }
    var_addd3217bc59a7b8.probe = probe;
    var_addd3217bc59a7b8.lights = lights;
    function_89a2405953b84136(var_addd3217bc59a7b8, 1);
    return var_addd3217bc59a7b8;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2606
// Size: 0xca
function function_ffa1124c73da1ab3(var_addd3217bc59a7b8) {
    if (!isdefined(var_addd3217bc59a7b8)) {
        return;
    }
    var_addd3217bc59a7b8.probe show();
    var_addd3217bc59a7b8.probe linkto(self, "tag_origin", (0, 0, 0), (0, 0, 0));
    foreach (l in var_addd3217bc59a7b8.lights) {
        if (isdefined(l.original_intensity)) {
            l setlightintensity(l.original_intensity);
        }
        l linkto(self);
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x26d8
// Size: 0x9a
function function_89a2405953b84136(var_addd3217bc59a7b8, override_og) {
    if (!isdefined(var_addd3217bc59a7b8)) {
        return;
    }
    var_addd3217bc59a7b8.probe hide();
    foreach (l in var_addd3217bc59a7b8.lights) {
        if (override_og) {
            l.original_intensity = l getlightintensity();
        }
        l setlightintensity(0);
    }
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x277a
// Size: 0x34
function scn_infil_van_npc1(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc1");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27b6
// Size: 0x34
function scn_infil_van_npc2(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc2");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x27f2
// Size: 0x34
function scn_infil_van_npc3(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc3");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x282e
// Size: 0x34
function scn_infil_van_npc4(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc4");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x286a
// Size: 0x34
function scn_infil_van_npc5(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc5");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28a6
// Size: 0x34
function scn_infil_van_npc6(guy) {
    if (!isdefined(guy.var_8655d6f4c9340db1)) {
        guy playsoundonmovingent("scn_infil_van_npc6");
    }
    guy.var_8655d6f4c9340db1 = 1;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28e2
// Size: 0xd2
function infil_radio_idle(infil) {
    if (!flag("infil_started")) {
        if (isplayer(self)) {
            if (!isdefined(self)) {
                return;
            }
            radio_sfx = spawn("script_origin", (0, 0, 0));
            radio_sfx showonlytoplayer(self);
            var_9742aa030e46f6c0 = spawn("script_origin", (0, 0, 0));
            var_9742aa030e46f6c0 showonlytoplayer(self);
            radio_sfx playloopsound("dx_mpo_ukop_radio_chatter");
            var_9742aa030e46f6c0 playloopsound("amb_infil_van");
            function_7330aa81e1f66e19("infil_started", "death_or_disconnect");
            wait 1;
            radio_sfx stoploopsound("dx_mpo_ukop_radio_chatter");
            var_9742aa030e46f6c0 stoploopsound("amb_infil_van");
            radio_sfx delete();
            var_9742aa030e46f6c0 delete();
        }
        return;
    }
    return;
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29bc
// Size: 0x21
function function_6158ef142e9bd640() {
    level endon("game_ended");
    self endon("infil_finished");
    wait 26;
    self visionsetnakedforplayer("mp_core_infil_2", 3);
}

// Namespace van_infil / namespace_a12a94a2415e07ff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29e5
// Size: 0x2e
function function_7330aa81e1f66e19(var_8068764aee94f2f4, playerstring) {
    assert(isdefined(var_8068764aee94f2f4));
    if (isdefined(playerstring)) {
        self endon(playerstring);
    }
    gameflagwait(var_8068764aee94f2f4);
}

