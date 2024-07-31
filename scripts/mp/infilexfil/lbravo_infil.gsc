#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\infilexfil\infilexfil.gsc;
#using scripts\mp\anim.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\infilexfil.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\rank.gsc;

#namespace lbravo_infil;

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x186d
// Size: 0x87
function lbravo_init(subtype) {
    /#
        setdevdvarifuninitialized(@"hash_3dc902e1a71dd25d", 0);
    #/
    var_453e4fc2c649fea4 = [];
    var_453e4fc2c649fea4[0] = [0, 1];
    var_453e4fc2c649fea4[1] = [2, 3];
    var_453e4fc2c649fea4[2] = [4];
    var_453e4fc2c649fea4[3] = [5];
    thread infil_add("infil_lbravo", subtype, 6, 4, var_453e4fc2c649fea4, &lbravo_spawn, &lbravo_get_length, &player_lbravo_infil_think);
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18fc
// Size: 0x12d
function lbravo_spawn(team, target, subtype, originalsubtype) {
    initanims(subtype, team, originalsubtype);
    scene_node = getstruct(target, "targetname");
    postlaunchscenenodecorrection(scene_node, team, subtype, originalsubtype);
    infil = spawn("script_origin", scene_node.origin);
    if (!isdefined(scene_node.angles)) {
        scene_node.angles = (0, 0, 0);
    }
    infil.angles = scene_node.angles;
    infil.scene_node = scene_node;
    infil.subtype = subtype;
    infil.originalsubtype = originalsubtype;
    infil thread infilthink(team, subtype);
    if ((scripts\mp\utility\game::getgametype() == "arm" || scripts\mp\utility\game::getgametype() == "conflict") && isdefined(scene_node.target)) {
        level.teamdata[team]["captureLocation_Next"] = scene_node.target;
    }
    return infil;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a32
// Size: 0xb2
function printdata(infil, subtype, originalsubtype) {
    org = infil.scene_node.origin;
    ang = infil.scene_node.angles;
    while (true) {
        /#
            print3d(org, "<dev string:x1c>" + subtype + "<dev string:x27>" + originalsubtype + "<dev string:x2d>", (1, 1, 1), 1, 2);
        #/
        thread scripts\cp_mp\utility\debug_utility::drawangles(org, ang, level.framedurationseconds, 1);
        waitframe();
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1aec
// Size: 0x1fc
function postlaunchscenenodecorrection(scene_node, team, subtype, originalsubtype) {
    mapname = scripts\cp_mp\utility\game_utility::getmapname();
    switch (mapname) {
    case #"hash_7a28db3c5928c489": 
        switch (originalsubtype) {
        case #"hash_ac5f1d60e641c3b": 
            if (team == "allies") {
                scene_node.origin += anglestoforward(scene_node.angles) * 100;
            }
            break;
        case #"hash_5ae415d7f6f14bc3": 
            if (team == "allies") {
                scene_node.origin += anglestoforward(scene_node.angles) * -50;
                scene_node.origin += anglestoright(scene_node.angles) * -10;
            }
            break;
        }
        break;
    case #"hash_a8b272dba33a4aed": 
        if (team == "axis" && subtype == "bravo") {
            scene_node.origin = (8296.4, 786.17, 286);
            scene_node.angles = (0, 210, 0);
        }
        if (team == "allies") {
            switch (level.gametype) {
            case #"hash_6efb0f59a62300fb":
            case #"hash_dd5b900f435d3f36":
            case #"hash_eb5e5f470e0c1dc2":
            case #"hash_fa0ed2f6bd4f4395":
            case #"hash_fa34c5f6bd6d4432":
            case #"hash_fa50b0f6bd82e972":
            case #"hash_fa50baf6bd82f930": 
                scene_node.angles = (scene_node.angles[0], 344, scene_node.angles[2]);
                break;
            }
        }
        break;
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf0
// Size: 0x10b
function lbravo_get_length(subtype) {
    if (issubstr(subtype, "alpha")) {
        subtype = "alpha";
    }
    if (issubstr(subtype, "bravo")) {
        subtype = "bravo";
    }
    if (isdefined(self.path)) {
        duration = parsehelipathlength();
        duration += getanimlength(level.scr_anim["slot_0"]["lbravo_infil" + "_" + subtype + "_loop_exit"]);
        duration += getanimlength(level.scr_anim["slot_0"]["lbravo_infil" + "_" + subtype + "_exit"]);
        return duration;
    }
    animlength = getanimlength(level.scr_anim["slot_0"]["lbravo_infil" + "_" + subtype]);
    animlength += getanimlength(level.scr_anim["slot_0"]["lbravo_infil" + "_" + subtype + "_exit"]);
    return animlength;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e03
// Size: 0x20
function function_198048f0cd4924b3(infil) {
    return infil.scene_node.origin;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2c
// Size: 0x412
function player_lbravo_infil_think(infil, spot_index) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    if (isplayer(self)) {
        self setclienttriggeraudiozone("lbravo_infil_intro", 1);
    }
    thread lbravo_infil_radio_idle();
    thread player_infil_end(infil);
    spawnpos = infil.linktoent gettagorigin("origin_animate_jnt");
    spawnang = infil.linktoent gettagangles("origin_animate_jnt");
    thread infil_player_rig_updated("slot_" + spot_index, spawnpos, spawnang);
    self.player_rig linkto(infil.linktoent, "origin_animate_jnt", (0, 0, 0), (0, 0, 0));
    self function_670863fc4008c3d8(function_198048f0cd4924b3(infil));
    self lerpfovbypreset("80_instant");
    self lerpfovscalefactor(0, 0);
    self.manualoverridewindmaterial = 1;
    self setscriptablepartstate("wind", "100", 0);
    var_6059a26f4daaf0c6 = spot_index == 0 || spot_index == 1;
    if (istrue(level.interactiveinfil) && !isai(self) && var_6059a26f4daaf0c6) {
        giveinteractiveinfilweapon();
    } else {
        self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe_heli");
    }
    thread player_van_disconnect();
    thread cinematiccameratimeline(infil);
    gameflagwait("infil_started");
    if (scripts\cp_mp\utility\game_utility::isnightmap()) {
        self nightvisionviewon();
    }
    println("<dev string:x32>" + self.name + "<dev string:x6a>" + self.animname + "<dev string:x7a>" + isdefined(self.player_rig));
    thread scripts\mp\music_and_dialog::function_3aa69e0e6827ce5();
    if (isdefined(self.animname) && isplayer(self)) {
        soundalias = "scn_infil_lbravo_heli_plr1";
        if (isdefined(infil.subtype)) {
            if (infil.subtype == "alpha") {
                switch (self.animname) {
                case #"hash_9f02a28a98823bce": 
                    soundalias = "scn_infil_lbravo_heli_plr1";
                    break;
                case #"hash_9f02a38a98823d61": 
                    soundalias = "scn_infil_lbravo_heli_plr2";
                    break;
                case #"hash_9f02a08a988238a8": 
                    soundalias = "scn_infil_lbravo_heli_plr3";
                    break;
                case #"hash_9f02a18a98823a3b": 
                    soundalias = "scn_infil_lbravo_heli_plr4";
                    break;
                case #"hash_9f02a68a9882421a": 
                    soundalias = "scn_infil_lbravo_heli_plr5";
                    break;
                case #"hash_9f02a78a988243ad": 
                    soundalias = "scn_infil_lbravo_heli_plr6";
                    break;
                default: 
                    soundalias = "scn_infil_lbravo_heli_plr1";
                    break;
                }
            } else {
                switch (self.animname) {
                case #"hash_9f02a28a98823bce": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr1";
                    break;
                case #"hash_9f02a38a98823d61": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr2";
                    break;
                case #"hash_9f02a08a988238a8": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr3";
                    break;
                case #"hash_9f02a18a98823a3b": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr4";
                    break;
                case #"hash_9f02a68a9882421a": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr5";
                    break;
                case #"hash_9f02a78a988243ad": 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr6";
                    break;
                default: 
                    soundalias = "scn_infil_lbravo_bravo_heli_plr1";
                    break;
                }
            }
        }
        self setclienttriggeraudiozone("lbravo_infil", 2);
        self playlocalsound(soundalias);
    }
    self setcinematicmotionoverride("player_heli_ride");
    if (istrue(level.interactiveinfil) && !isai(self) && var_6059a26f4daaf0c6) {
        thread allowinteractivecombat();
    }
    if (isdefined(infil.path)) {
        thread playerthinkpath(infil, spot_index);
    } else {
        thread playerthinkanim(infil, spot_index);
    }
    level waittill("prematch_over");
    self setcinematicmotionoverride("iw9_playermotion");
    self setscriptablepartstate("wind", "0", 0);
    self.manualoverridewindmaterial = 0;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2246
// Size: 0x158
function playerthinkpath(infil, spot_index) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    if (spot_index == 0) {
        self lerpviewangleclamp(1, 0.25, 0.25, 10, 45, 45, 45);
    } else if (spot_index == 1) {
        self lerpviewangleclamp(1, 0.25, 0.25, 45, 10, 45, 45);
    } else {
        self lerpviewangleclamp(1, 0.25, 0.25, 45, 45, 45, 45);
    }
    rideloop(infil);
    self lerpviewangleclamp(1, 0.25, 0.25, 0, 0, 0, 0);
    self lerpfovbypreset("default_2seconds");
    self lerpfovscalefactor(1, 2);
    self stopanimscriptsceneevent();
    infil.linktoent anim_player_solo(self, self.player_rig, "lbravo_infil" + "_" + infil.subtype + "_loop_exit", "origin_animate_jnt");
    self setcinematicmotionoverride("iw9_playermotion");
    self.player_rig unlink();
    infil anim_player_solo(self, self.player_rig, "lbravo_infil" + "_" + infil.subtype + "_exit");
    self clearadditionalstreampos();
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a6
// Size: 0x77
function rideloop(infil) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    infil.linktoent endon("unload");
    while (true) {
        infil.linktoent anim_player_solo(self, self.player_rig, "lbravo_infil" + "_" + infil.subtype + "_loop", "origin_animate_jnt");
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2425
// Size: 0x254
function playerthinkanim(infil, spot_index) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    scene_name = infil.subtype;
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_downtown_gw") {
        if (self.team == "allies" && (infil.originalsubtype == "alpha1" || infil.originalsubtype == "alpha2")) {
            scene_name = "bravo";
        }
        if (self.team == "axis" && infil.originalsubtype == "bravo") {
            scene_name = "alpha";
        }
    }
    println("<dev string:x85>" + self.name + "<dev string:x6a>" + self.animname + "<dev string:x7a>" + isdefined(self.player_rig));
    if (spot_index == 0) {
        self lerpviewangleclamp(1, 0.25, 0.25, 10, 45, 45, 45);
    } else if (spot_index == 1) {
        self lerpviewangleclamp(1, 0.25, 0.25, 45, 10, 45, 45);
    } else {
        self lerpviewangleclamp(1, 0.25, 0.25, 45, 45, 45, 45);
    }
    infil.linktoent anim_player_solo(self, self.player_rig, "lbravo_infil" + "_intro", "origin_animate_jnt");
    println("<dev string:xc5>" + self.name + "<dev string:x6a>" + self.animname + "<dev string:x7a>" + isdefined(self.player_rig));
    if (self islinked()) {
        self lerpviewangleclamp(1, 0.25, 0.25, 0, 0, 0, 0);
    }
    self lerpfovscalefactor(1, 2);
    self.player_rig unlink();
    infil anim_player_solo(self, self.player_rig, "lbravo_infil" + "_exit");
    thread scriptswitchweaponhack();
    thread clear_infil_ambient_zone();
    self visionsetnakedforplayer("", 0.75);
    self setdemeanorviewmodel("normal");
    self clearadditionalstreampos();
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2681
// Size: 0xb
function scriptswitchweaponhack() {
    waitframe();
    self notify("complete_late_infil_allows");
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2694
// Size: 0x39
function clear_infil_ambient_zone() {
    self endon("death_or_disconnect");
    wait 1;
    if (isdefined(self)) {
        if (isdefined(self.var_5b097bde4417d7ad)) {
            self clearsoundsubmix(self.var_5b097bde4417d7ad, 2);
        }
        self clearclienttriggeraudiozone(2);
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26d5
// Size: 0x64
function lbravo_infil_radio_idle() {
    if (isplayer(self)) {
        radio_sfx = spawn("script_origin", (0, 0, 0));
        radio_sfx showonlytoplayer(self);
        radio_sfx playloopsound("dx_mpo_ukop_radio_chatter");
        gameflagwait("infil_started");
        wait 2;
        radio_sfx stoploopsound("dx_mpo_ukop_radio_chatter");
        radio_sfx delete();
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2741
// Size: 0x40
function player_infil_end(infil) {
    self endon("disconnect");
    waittill_any_ents(level, "prematch_over", infil, "prematch_over");
    self notify("remove_rig");
    self clearclienttriggeraudiozone(1);
    scripts\mp\utility\player::setdof_default();
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2789
// Size: 0x53
function player_van_disconnect() {
    level endon("prematch_over");
    self waittill("death_or_disconnect");
    if (isdefined(self)) {
        self visionsetnakedforplayer("");
        self clearclienttriggeraudiozone(0);
        self lerpfovbypreset("default");
        self setviewmodeldepthoffield(0, 0, 18);
        scripts\mp\utility\player::setdof_default();
        self clearadditionalstreampos();
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x27e4
// Size: 0x194
function infilthink(team, scene_name) {
    var_e026a614f7467557 = getdvarfloat(@"r_mbVelocityScale", 0.2);
    foreach (ent in getentarray("infil_delete", "script_noteworthy")) {
        ent delete();
    }
    if (issubstr(scene_name, "alpha")) {
        scene_name = "alpha";
    }
    if (issubstr(scene_name, "bravo")) {
        scene_name = "bravo";
    }
    thread vehiclethink(team, self.scene_node, scene_name);
    thread actorthink(team, self.scene_node, scene_name);
    gameflagwait("infil_started");
    setdvar(@"r_spotLightEntityShadows", 1);
    setdvar(@"r_mbVelocityScale", 1);
    level notify("start_scene");
    self notify("start_scene");
    if (istrue(level.interactiveinfil)) {
        level thread interactiveinfilthink(team);
    }
    waittill_any_ents(level, "prematch_over", self, "prematch_over");
    setdvar(@"r_spotLightEntityShadows", 0);
    setdvar(@"r_mbVelocityScale", var_e026a614f7467557);
    while (isdefined(self.linktoent) || isdefined(self.actors)) {
        waitframe();
    }
    level.infilsactive--;
    self delete();
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2980
// Size: 0x98
function vehiclethink(team, scene_node, scene_name, extra_crew) {
    self.linktoent = spawninfilvehicle(scene_node, team, scene_name);
    if (isdefined(self.path)) {
        thread vehiclethinkpath(team, scene_node, scene_name, extra_crew);
    } else {
        thread vehiclethinkanim(team, scene_node, scene_name, extra_crew);
    }
    thread heli_interior_sfx(scene_name);
    level waittill("prematch_over");
    wait 3;
    if (!isdefined(self) || !isdefined(self.linktoent)) {
        return;
    }
    self.linktoent solid();
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2a20
// Size: 0x169
function vehiclethinkanim(team, scene_node, scene_name, extra_crew) {
    if (self.originalsubtype != self.subtype && getdvar(@"hash_687fb8f9b7a23245") == "mp_downtown_gw") {
        scene_name = self.originalsubtype;
    }
    if (team == "allies" && (self.originalsubtype == "alpha" || self.originalsubtype == "alpha2") && getdvar(@"hash_f644e90eb9a008cf") == "mp_boneyard_gw") {
        scene_name = self.originalsubtype;
    }
    anim_first_frame_solo(self.linktoent, "lbravo_infil");
    gameflagwait("infil_started");
    self.linktoent setscriptablepartstate("engine", "on", 0);
    self.linktoent setscriptablepartstate("infil_lights", "on", 0);
    thread anim_single_solo(self.linktoent, "lbravo_infil");
    duration = getanimlength(level.scr_anim[self.linktoent.animname]["lbravo_infil"]);
    wait duration;
    self.linktoent delete();
    self.linktoent = undefined;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2b91
// Size: 0x156
function spawninfilvehicle(scene_node, team, scene_name) {
    spawnpos = scene_node.origin;
    spawnang = scene_node.angles;
    if (isdefined(self.path)) {
        spawnpos = self.path.origin;
        spawnang = self.path.angles;
    }
    if (team == "allies") {
        model = "veh8_mil_air_lbravo_personnel";
    } else {
        model = "veh8_mil_air_lbravo_personnel_east";
    }
    vehicle = spawnvehicle(model, scene_name, "lbravo_infil_mp", spawnpos, spawnang);
    vehicle setvehicleteam(team);
    vehicle.animname = "lbravo";
    vehicle setcandamage(0);
    vehicle notsolid();
    vehicle.infil = self;
    clip = getent("lbravo_clip", "targetname");
    if (isdefined(clip)) {
        var_5f83b6e30bb8ae0c = spawn("script_model", vehicle.origin);
        var_5f83b6e30bb8ae0c.angles = vehicle.angles;
        var_5f83b6e30bb8ae0c clonebrushmodeltoscriptmodel(clip);
        var_5f83b6e30bb8ae0c linkto(vehicle);
    }
    return vehicle;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf0
// Size: 0xbc
function actorthink(team, scene_node, scene_name, extra_crew) {
    self.actors = thread spawnactors(team, scene_name, extra_crew);
    self.actors[0].anim_playsound_func = &commander_play_sound_func;
    self.linktoent anim_first_frame(self.actors, "lbravo_infil" + "_" + scene_name, "origin_animate_jnt");
    hideactors();
    gameflagwait("infil_started");
    showactors();
    if (isdefined(self.path)) {
        actorthinkpath(team, scene_node, scene_name, extra_crew);
        return;
    }
    actorthinkanim(team, scene_node, scene_name, extra_crew);
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2db4
// Size: 0x4a
function actorthinkpath(team, scene_node, scene_name, extra_crew) {
    thread actorloopthink(self.actors[0]);
    thread actorloopthink(self.actors[1]);
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e06
// Size: 0x13
function actorloopthink(actor) {
    actorloop(actor);
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e21
// Size: 0x5a
function actorloop(actor) {
    actor endon("death");
    self.linktoent endon("reached_dynamic_path_end");
    while (true) {
        self.linktoent anim_single_solo(actor, "lbravo_infil" + "_" + self.subtype + "_loop", "origin_animate_jnt");
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2e83
// Size: 0xdf
function actorthinkanim(team, scene_node, scene_name, extra_crew) {
    self.linktoent thread anim_single(self.actors, "lbravo_infil" + "_" + scene_name, "origin_animate_jnt");
    duration = getanimlength(level.scr_anim["pilot"]["lbravo_infil" + "_" + scene_name]);
    wait duration;
    foreach (actor in self.actors) {
        if (isdefined(actor)) {
            actor delete();
        }
    }
    self.actors = undefined;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f6a
// Size: 0xc8
function spawnactors(team, scene_name, extra_crew) {
    actors = [];
    actors[actors.size] = self.linktoent spawn_anim_model("pilot", "origin_animate_jnt", "body_pilot_helicopter_british", "head_pilot_helicopter_british");
    actors[actors.size] = self.linktoent spawn_anim_model("copilot", "origin_animate_jnt", "body_pilot_helicopter_british", "head_mp_helicopter_crew");
    foreach (actor in actors) {
        actor.infil = self;
    }
    return actors;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x303b
// Size: 0x178
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
    return guy;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x31bc
// Size: 0x681
function initanims(subtype, team, originalsubtype) {
    script_model_alpha_anims(subtype);
    vehicles_alpha_anims(subtype, team, originalsubtype);
    addnotetrack_customfunction("slot_0", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_1", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_2", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_3", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_4", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_5", "free_look", &player_free_look, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_0", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_1", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_2", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_3", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_4", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_5", "free_look", &player_free_look, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_0", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_1", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_2", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_3", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_4", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_5", "80_instant", &player_fov_80_instant, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_0", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_1", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_2", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_3", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_4", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_5", "80_instant", &player_fov_80_instant, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_0", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_1", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_2", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_3", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_4", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_5", "fov_63_2", &player_fov_default_1, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_0", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_1", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_2", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_3", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_4", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_5", "fov_63_2", &player_fov_default_1, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_0", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_1", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_2", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_3", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_4", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_5", "shake_on", &rumble_low, "lbravo_infil_alpha");
    addnotetrack_customfunction("slot_0", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_1", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_2", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_3", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_4", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_5", "shake_on", &rumble_low, "lbravo_infil_bravo");
    addnotetrack_customfunction("slot_0", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_1", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_2", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_3", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_4", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_5", "shake_off", &customground, "lbravo_infil_alpha_exit");
    addnotetrack_customfunction("slot_0", "shake_off", &customground, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_1", "shake_off", &customground, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_2", "shake_off", &customground, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_3", "shake_off", &customground, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_4", "shake_off", &customground, "lbravo_infil_bravo_exit");
    addnotetrack_customfunction("slot_5", "shake_off", &customground, "lbravo_infil_bravo_exit");
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3845
// Size: 0x1a2f
function script_model_alpha_anims(subtype) {
    level.scr_animtree["slot_0"] = %script_model;
    level.scr_anim["slot_0"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_1_intro;
    level.scr_eventanim["slot_0"]["lbravo_infil" + "_intro"] = %"hash_520fc199d710ca88";
    level.scr_animtree["slot_0"] = %script_model;
    level.scr_anim["slot_0"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_1_exit;
    level.scr_eventanim["slot_0"]["lbravo_infil" + "_exit"] = %"hash_71949d7244fe512a";
    level.scr_animtree["slot_1"] = %script_model;
    level.scr_anim["slot_1"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_2_intro;
    level.scr_eventanim["slot_1"]["lbravo_infil" + "_intro"] = %"hash_520fc499d710cfa1";
    level.scr_animtree["slot_1"] = %script_model;
    level.scr_anim["slot_1"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_2_exit;
    level.scr_eventanim["slot_1"]["lbravo_infil" + "_exit"] = %"hash_71949c7244fe4f77";
    level.scr_animtree["slot_2"] = %script_model;
    level.scr_anim["slot_2"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_3_intro;
    level.scr_eventanim["slot_2"]["lbravo_infil" + "_intro"] = %"hash_520fc399d710cdee";
    level.scr_animtree["slot_2"] = %script_model;
    level.scr_anim["slot_2"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_3_exit;
    level.scr_eventanim["slot_2"]["lbravo_infil" + "_exit"] = %"hash_71949b7244fe4dc4";
    level.scr_animtree["slot_3"] = %script_model;
    level.scr_anim["slot_3"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_4_intro;
    level.scr_eventanim["slot_3"]["lbravo_infil" + "_intro"] = %"hash_520fc699d710d307";
    level.scr_animtree["slot_3"] = %script_model;
    level.scr_anim["slot_3"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_4_exit;
    level.scr_eventanim["slot_3"]["lbravo_infil" + "_exit"] = %"hash_71949a7244fe4c11";
    level.scr_animtree["slot_4"] = %script_model;
    level.scr_anim["slot_4"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_5_intro;
    level.scr_eventanim["slot_4"]["lbravo_infil" + "_intro"] = %"hash_520fc599d710d154";
    level.scr_animtree["slot_4"] = %script_model;
    level.scr_anim["slot_4"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_5_exit;
    level.scr_eventanim["slot_4"]["lbravo_infil" + "_exit"] = %"hash_7194997244fe4a5e";
    level.scr_animtree["slot_5"] = %script_model;
    level.scr_anim["slot_5"]["lbravo_infil" + "_intro"] = script_model%iw9_mp_infil_lbravo_seat_6_intro;
    level.scr_eventanim["slot_5"]["lbravo_infil" + "_intro"] = %"hash_520fc899d710d66d";
    level.scr_animtree["slot_5"] = %script_model;
    level.scr_anim["slot_5"]["lbravo_infil" + "_exit"] = script_model%iw9_mp_infil_lbravo_seat_6_exit;
    level.scr_eventanim["slot_5"]["lbravo_infil" + "_exit"] = %"hash_7194987244fe48ab";
    switch (subtype) {
    case #"hash_6829ee5abc10c38b": 
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_pilot;
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_pilot_loop;
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_pilot_loop_exit;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_copilot;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_copilot_loop;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_copilot_loop_exit;
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy1_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_alpha"] = %"hash_6aa54cc19a4558d9";
        level.scr_anim["slot_0"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy1_exit_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fcf417278c5ba";
        level.scr_anim["slot_0"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy1_loop_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795d98f5712c564";
        level.scr_anim["slot_0"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy1_loop_exit_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2b2b224293f55";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy2_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_alpha"] = %"hash_6aa549c19a4553c0";
        level.scr_anim["slot_1"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy2_exit_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fce417278c407";
        level.scr_anim["slot_1"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy2_loop_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795dc8f5712ca7d";
        level.scr_anim["slot_1"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy2_loop_exit_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2afb224293a3c";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy3_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_alpha"] = %"hash_6aa54ac19a455573";
        level.scr_anim["slot_2"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy3_exit_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fcd417278c254";
        level.scr_anim["slot_2"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy3_loop_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795db8f5712c8ca";
        level.scr_anim["slot_2"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy3_loop_exit_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2b0b224293bef";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy4_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_alpha"] = %"hash_6aa54fc19a455df2";
        level.scr_anim["slot_3"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy4_exit_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fcc417278c0a1";
        level.scr_anim["slot_3"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy4_loop_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795d68f5712c04b";
        level.scr_anim["slot_3"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy4_loop_exit_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2adb2242936d6";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy5_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_alpha"] = %"hash_6aa550c19a455fa5";
        level.scr_anim["slot_4"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy5_exit_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fcb417278beee";
        level.scr_anim["slot_4"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy5_loop_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795d58f5712be98";
        level.scr_anim["slot_4"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy5_loop_exit_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2aeb224293889";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["lbravo_infil" + "_alpha"] = script_model%mp_infil_lbravo_a_guy6_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_alpha"] = %"hash_6aa54dc19a455a8c";
        level.scr_anim["slot_5"]["lbravo_infil" + "_alpha_exit"] = script_model%mp_infil_lbravo_a_guy6_exit_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_alpha_exit"] = %"hash_441fca417278bd3b";
        level.scr_anim["slot_5"]["lbravo_infil" + "_alpha_loop"] = script_model%mp_infil_lbravo_a_guy6_loop_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_alpha_loop"] = %"hash_7795d88f5712c3b1";
        level.scr_anim["slot_5"]["lbravo_infil" + "_alpha_loop_exit"] = script_model%mp_infil_lbravo_a_guy6_loop_exit_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_alpha_loop_exit"] = %"hash_79b2abb224293370";
        break;
    case #"hash_1cc79b02710cab23": 
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_pilot;
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_pilot_loop;
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_pilot_loop_exit;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_copilot;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_copilot_loop;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_copilot_loop_exit;
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy1_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo"] = %"hash_5152e5c18c1dedd4";
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy1_exit_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b497ae89fd45";
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy1_loop_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795d98f5712c564";
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy1_loop_exit_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2b2b224293f55";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy2_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo"] = %"hash_5152e8c18c1df2ed";
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy2_exit_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b197ae89f82c";
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy2_loop_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795dc8f5712ca7d";
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy2_loop_exit_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2afb224293a3c";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy3_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo"] = %"hash_5152e7c18c1df13a";
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy3_exit_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b297ae89f9df";
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy3_loop_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795db8f5712c8ca";
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy3_loop_exit_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2b0b224293bef";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy4_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo"] = %"hash_5152e2c18c1de8bb";
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy4_exit_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo_exit"] = %"hash_639af97ae89f4c6";
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy4_loop_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795d68f5712c04b";
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy4_loop_exit_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2adb2242936d6";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy5_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo"] = %"hash_5152e1c18c1de708";
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy5_exit_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b097ae89f679";
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy5_loop_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795d58f5712be98";
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy5_loop_exit_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2aeb224293889";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy6_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo"] = %"hash_5152e4c18c1dec21";
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy6_exit_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo_exit"] = %"hash_639ad97ae89f160";
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo_loop"] = script_model%mp_infil_lbravo_a_guy6_loop_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo_loop"] = %"hash_7795d88f5712c3b1";
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo_loop_exit"] = script_model%mp_infil_lbravo_a_guy6_loop_exit_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo_loop_exit"] = %"hash_79b2abb224293370";
        break;
    default: 
        level.scr_animtree["pilot"] = %script_model;
        level.scr_anim["pilot"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_pilot;
        level.scr_animtree["copilot"] = %script_model;
        level.scr_anim["copilot"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_copilot;
        level.scr_animtree["slot_0"] = %script_model;
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy1_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo"] = %"hash_5152e5c18c1dedd4";
        level.scr_anim["slot_0"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy1_exit_wm;
        level.scr_eventanim["slot_0"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b497ae89fd45";
        level.scr_animtree["slot_1"] = %script_model;
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy2_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo"] = %"hash_5152e8c18c1df2ed";
        level.scr_anim["slot_1"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy2_exit_wm;
        level.scr_eventanim["slot_1"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b197ae89f82c";
        level.scr_animtree["slot_2"] = %script_model;
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy3_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo"] = %"hash_5152e7c18c1df13a";
        level.scr_anim["slot_2"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy3_exit_wm;
        level.scr_eventanim["slot_2"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b297ae89f9df";
        level.scr_animtree["slot_3"] = %script_model;
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy4_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo"] = %"hash_5152e2c18c1de8bb";
        level.scr_anim["slot_3"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy4_exit_wm;
        level.scr_eventanim["slot_3"]["lbravo_infil" + "_bravo_exit"] = %"hash_639af97ae89f4c6";
        level.scr_animtree["slot_4"] = %script_model;
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy5_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo"] = %"hash_5152e1c18c1de708";
        level.scr_anim["slot_4"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy5_exit_wm;
        level.scr_eventanim["slot_4"]["lbravo_infil" + "_bravo_exit"] = %"hash_639b097ae89f679";
        level.scr_animtree["slot_5"] = %script_model;
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo"] = script_model%mp_infil_lbravo_b_guy6_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo"] = %"hash_5152e4c18c1dec21";
        level.scr_anim["slot_5"]["lbravo_infil" + "_bravo_exit"] = script_model%mp_infil_lbravo_b_guy6_exit_wm;
        level.scr_eventanim["slot_5"]["lbravo_infil" + "_bravo_exit"] = %"hash_639ad97ae89f160";
        break;
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x527c
// Size: 0xcda
function vehicles_alpha_anims(subtype, team, originalsubtype) {
    level.scr_anim["lbravo"]["lbravo_infil"] = mp_vehicles_always_loaded%iw9_mp_infil_lbravo_heli;
    if (isdefined(originalsubtype) && subtype != originalsubtype && getdvar(@"hash_687fb8f9b7a23245") == "mp_downtown_gw") {
        switch (originalsubtype) {
        case #"hash_ac5f2d60e641dce": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b2_heli_downtown_west;
            }
            break;
        case #"hash_ac5f1d60e641c3b": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b1_heli_downtown_west;
            }
            break;
        case #"hash_5ae416d7f6f14d56": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b2_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b1_heli_downtown_west;
            }
            break;
        case #"hash_5ae415d7f6f14bc3": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b1_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b2_heli_downtown_west;
            }
            break;
        }
        return;
    }
    switch (subtype) {
    case #"hash_6829ee5abc10c38b": 
        level.scr_animtree["lbravo"] = %mp_vehicles_always_loaded;
        switch (getdvar(@"hash_687fb8f9b7a23245")) {
        case #"hash_50de71be6e7469ff": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_farm_gw_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_farm_gw_west;
            }
            break;
        case #"hash_32eaa112f8caa7e4": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_west;
            }
            break;
        case #"hash_7a28db3c5928c489": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_quarry_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_quarry_west;
            }
            break;
        case #"hash_62c07791a2eda185": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_gw_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_deadzone_west;
            }
            break;
        case #"hash_f09747c9feb47eb1": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_raid;
            break;
        case #"hash_1ab428ea9c0ee9e5": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_petrograd;
            break;
        case #"hash_d8bbcfc499e70e6f": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_piccadilly;
            break;
        case #"hash_a8b272dba33a4aed": 
            if (team == "axis") {
                switch (level.gametype) {
                case #"hash_6efb0f59a62300fb":
                case #"hash_dd5b900f435d3f36":
                case #"hash_eb5e5f470e0c1dc2":
                case #"hash_fa0ed2f6bd4f4395":
                case #"hash_fa34c5f6bd6d4432":
                case #"hash_fa50b0f6bd82e972":
                case #"hash_fa50baf6bd82f930": 
                    level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli;
                    break;
                default: 
                    level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_gw_east;
                    break;
                }
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_hq;
            }
            break;
        case #"hash_d39c51733bbe5712": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_tactical;
            break;
        case #"hash_faa0301a34c7c291": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_emporium_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_emporium_west;
            }
            break;
        case #"hash_81c63d549bea3339":
        case #"hash_a62df42a13dad323": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_backlot;
            break;
        case #"hash_924a3fbe9fbe15c6": 
            if (team == "allies" && originalsubtype == "alpha" || originalsubtype == "alpha2") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_petrograd;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli;
            }
            break;
        case #"hash_1bc93b88575e82eb": 
            if (team == "axis" && originalsubtype == "alpha") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_" + originalsubtype + "_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_tactical;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli;
            }
            break;
        case #"hash_4de7e97cab81c8f3": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_oilrig_coalition;
            break;
        case #"hash_21d3c8e213c09314": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_garden;
            break;
        case #"hash_cce4bca393df84eb": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_harbor;
            break;
        default: 
            level.scr_anim["lbravo"]["lbravo_infil" + "_alpha_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli;
            break;
        }
        break;
    case #"hash_1cc79b02710cab23": 
        level.scr_animtree["lbravo"] = %mp_vehicles_always_loaded;
        switch (getdvar(@"hash_687fb8f9b7a23245")) {
        case #"hash_50de71be6e7469ff": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_farm_gw_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_farm_gw_west;
            }
            break;
        case #"hash_32eaa112f8caa7e4": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_downtown_west;
            }
            break;
        case #"hash_7a28db3c5928c489": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_quarry_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_quarry_west;
            }
            break;
        case #"hash_62c07791a2eda185": 
            if (team == "axis") {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_aniyah_gw_east;
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_deadzone_west;
            }
            break;
        case #"hash_688334408379d4fb":
        case #"hash_d32ec8c7ac2ec13b": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_runner;
            break;
        case #"hash_f09747c9feb47eb1": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_raid;
            break;
        case #"hash_a8b272dba33a4aed": 
            if (team == "axis") {
                switch (level.gametype) {
                case #"hash_6efb0f59a62300fb":
                case #"hash_dd5b900f435d3f36":
                case #"hash_eb5e5f470e0c1dc2":
                case #"hash_fa0ed2f6bd4f4395":
                case #"hash_fa34c5f6bd6d4432":
                case #"hash_fa50b0f6bd82e972":
                case #"hash_fa50baf6bd82f930": 
                    level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli;
                    break;
                default: 
                    level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_aniyah_gw_east;
                    break;
                }
            } else {
                level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_aniyah_hq;
            }
            break;
        case #"hash_d39c51733bbe5712": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_a_heli_aniyah_tactical;
            break;
        case #"hash_4de7e97cab81c8f3": 
            level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli_oilrig_coalition;
            break;
        default: 
            level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli;
            break;
        }
        break;
    default: 
        level.scr_anim["lbravo"]["lbravo_infil" + "_bravo_" + team] = mp_vehicles_always_loaded%mp_infil_lbravo_b_heli;
        break;
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5f5e
// Size: 0x83
function commander_play_sound_func(alias, notification, var_9a0afe8ff3d2508f) {
    foreach (player in self.infil.players) {
        if (soundexists(alias)) {
            self playsoundtoplayer(alias, player);
        }
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe9
// Size: 0xcc
function vehiclethinkpath(team, scene_node, scene_name, extra_crew) {
    gameflagwait("infil_started");
    self.linktoent setscriptablepartstate("engine", "on", 0);
    self.linktoent.unload_hover_offset = 116;
    self.linktoent.unload_time = 3.5;
    self.linktoent thread vehicle_paths_helicopter(self.path);
    thread heli_path(self.linktoent);
    self.linktoent waittill("reached_dynamic_path_end");
    self.linktoent delete();
    self.linktoent = undefined;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60bd
// Size: 0x96
function heli_interior_sfx(scene_name) {
    gameflagwait("infil_started");
    if (scene_name == "alpha") {
        if (soundexists("scn_infil_lbravo_heli1_lr")) {
            self.linktoent playsoundonmovingent("scn_infil_lbravo_heli1_lr");
            self.linktoent playsoundonmovingent("scn_infil_lbravo_heli1_feet");
        }
    } else if (soundexists("scn_infil_lbravo_heli1_lr")) {
        self.linktoent playsoundonmovingent("scn_infil_lbravo_heli2_lr");
        self.linktoent playsoundonmovingent("scn_infil_lbravo_heli2_feet");
    }
    level waittill("prematch_over");
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x615b
// Size: 0xba
function giveinteractiveinfilweapon() {
    weapon = makeweapon("iw8_sn_alpha50_mp", ["rec_alpha50", "front_alpha50", "back_alpha50", "mag_alpha50", "acog_alpha50_light", "mod_infil_alpha50"]);
    _giveweapon(weapon, undefined, undefined, 1);
    val::reset_all("infil_weapon");
    success = domonitoredweaponswitch(weapon, 0);
    if (success) {
        self.infilweapon = weapon;
        val::set("infil_weapon", "weapon_switch", 0);
        setrecoilscale(0, 50);
    } else {
        _takeweapon(weapon);
        forcevalidweapon();
    }
    return success;
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x621e
// Size: 0xc9
function allowinteractivecombat(combatduration) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    thread interactivecombatmessaging();
    wait level.interactiveinfilstart;
    self.interactivecombat = 1;
    val::reset_all("interactive_combat");
    self setdemeanorviewmodel("normal");
    self lerpfovbypreset("default_2seconds");
    self.infil waittill("event_shootingWindow_closed");
    self.interactivecombat = 0;
    val::set("interactive_combat", "fire", 0);
    val::set("interactive_combat", "ads", 0);
    val::set("interactive_combat", "reload", 0);
    setrecoilscale();
    self setdemeanorviewmodel("safe", "iw8_ges_demeanor_safe_heli");
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62ef
// Size: 0x8a
function interactivecombatmessaging() {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    self.infil waittill("event_intro");
    /#
        self iprintlnbold("<dev string:x10d>");
    #/
    wait 3.25;
    line = getinteractiveinfilline(self.animname, level.mapname);
    /#
        self iprintlnbold(line);
    #/
    self.infil waittill("event_shootingWindow_open");
    /#
        self iprintlnbold("<dev string:x12c>");
    #/
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6381
// Size: 0xb2
function getinteractiveinfilline(slot, levelname) {
    switch (levelname) {
    case #"hash_62c07791a2eda185":
    case #"hash_f09747c9feb47eb1":
    case #"hash_fcab5810ee4c6dc2": 
        if (slot == "slot_0" || slot == "slot_1") {
            return "On the Rooftop! I'm swinging around for a shot!";
        }
    case #"hash_688334408379d4fb": 
        if (slot == "slot_0" || slot == "slot_1") {
            return "On the Rooftop! Dead Ahead!";
        }
        if (slot == "slot_3" || slot == "slot_5") {
            return "In the pit! On the right!";
        }
        break;
    }
    wait 1.25;
    /#
        self iprintlnbold("<dev string:x12c>");
    #/
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x643b
// Size: 0x15
function interactiveinfilthink(team) {
    level thread manageinteractivecombattargets(team);
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6458
// Size: 0x81
function manageinteractivecombattargets(team) {
    while (!isdefined(level.infiltargets)) {
        waitframe();
    }
    foreach (target in level.infiltargets["allies"]) {
        target thread targetdamagethink(team);
        target thread deleteoninfilcomplete();
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64e1
// Size: 0x13c
function targetdamagethink(team) {
    level endon("prematch_over");
    if (istrue(self.isbonus)) {
        self.health = 220;
    } else {
        self.health = 100;
    }
    wait level.interactiveinfilstart;
    outlineid = outlineenableforteam(self, team, ter_op(istrue(self.isbonus), "outline_depth_red", "outline_depth_orange"), "level_script");
    while (true) {
        damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, weapon = self waittill("damage");
        if (damage >= self.health) {
            outlinedisable(outlineid, self);
            if (istrue(self.isbonus)) {
                attacker thread scripts\mp\rank::giverankxp(#"hash_5b683ec651fddd19", 1000);
                attacker thread scripts\mp\rank::scoreeventpopup(#"hash_5b683ec651fddd19");
            }
            break;
        }
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6625
// Size: 0x4b
function deleteoninfilcomplete() {
    level waittill("prematch_over");
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.isbonus) && !isai(self)) {
        self setscriptablepartstate("base", "hide");
        return;
    }
    if (isalive(self)) {
        self suicide();
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6678
// Size: 0x92
function cinematiccameratimeline(infil) {
    self endon("death_or_disconnect");
    self endon("player_free_spot");
    self endon("joined_team");
    gameflagwait("infil_started");
    switch (level.mapname) {
    case #"hash_688334408379d4fb":
    case #"hash_d32ec8c7ac2ec13b": 
        wait 2.15;
        thread set_cinematicmotionomnvarovertime(0, 1, 0.75);
        wait 0.75;
        thread set_cinematicmotionomnvarovertime(1, 0, 0.75);
        break;
    }
}

// Namespace lbravo_infil / scripts\mp\infilexfil\lbravo_infil
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6712
// Size: 0x45
function customground(guy) {
    cam_shake_off(guy);
    if (!isdefined(guy)) {
        return;
    }
    if (isdefined(guy.player)) {
        player = guy.player;
        return;
    }
    player = guy;
}

