#using script_166b4f052da169a7;
#using script_5d265b4fca61f070;
#using scripts\asm\asm;
#using scripts\asm\shared\utility;
#using scripts\common\utility;
#using scripts\cp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_f8a56e8949145a55;

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6
// Size: 0x44
function main() {
    level.dialogue_playing = 0;
    level.current_dialogue = "";
    level.var_9a62261b5b534b06 = &function_7c1afbf215d163de;
    level.var_c3d9ceba74248998 = &function_e136e2ae04079980;
    level.var_1da0697a602f5a04 = &function_46b7602a9a7bf8b4;
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x108
function function_e136e2ae04079980(origin, radius, desiredteam, excludeents) {
    if (isdefined(excludeents) && !isarray(excludeents)) {
        excludeents = [excludeents];
    }
    if (function_a794fcf9545f2062()) {
        return function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6(["etype_player"]), excludeents, desiredteam);
    }
    var_7f25e2c1d613b4d0 = [];
    foreach (player in level.players) {
        if (isdefined(desiredteam)) {
            if (player.team != desiredteam) {
                continue;
            }
        }
        if (distancesquared(origin, player.origin) < squared(radius)) {
            var_7f25e2c1d613b4d0[var_7f25e2c1d613b4d0.size] = player;
        }
    }
    if (isdefined(excludeents) && excludeents.size && var_7f25e2c1d613b4d0.size) {
        array_remove_array(var_7f25e2c1d613b4d0, excludeents);
    }
    return var_7f25e2c1d613b4d0;
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x343
// Size: 0x8b
function function_46b7602a9a7bf8b4(origin, radius, desiredteam, excludeents) {
    if (isdefined(excludeents) && !isarray(excludeents)) {
        excludeents = [excludeents];
    }
    if (function_a794fcf9545f2062()) {
        return function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6(["etype_ai"]), excludeents, desiredteam);
    }
    if (isdefined(excludeents) && excludeents.size) {
        return array_remove_array(getaiarrayinradius(origin, radius, desiredteam), excludeents);
    }
    if (isdefined(desiredteam)) {
        return getaiarrayinradius(origin, radius, desiredteam);
    }
    return getaiarrayinradius(origin, radius);
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d7
// Size: 0x141
function play_vo_to_all(alias, optional_delay) {
    if (isdefined(optional_delay)) {
        wait optional_delay;
    }
    if (istrue(level.dialogue_playing)) {
        /#
            iprintln("<dev string:x1c>" + level.current_dialogue + "<dev string:x20>");
        #/
        return;
    }
    level.dialogue_playing = 1;
    level.announcer_vo_playing = 1;
    level.current_dialogue = alias;
    foreach (player in level.players) {
        player.battlechatterallowed = 0;
        thread play_vo_to_player(player, alias);
    }
    wait get_sound_length(alias);
    foreach (player in level.players) {
        player.battlechatterallowed = 1;
    }
    level.dialogue_playing = 0;
    level.announcer_vo_playing = 0;
    level.current_dialogue = "";
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x520
// Size: 0xbd
function play_vo_to_player(player, alias) {
    level endon("game_ended");
    player endon("death");
    player endon("disconnect");
    if (istrue(player.dialogue_playing)) {
        /#
            player iprintln("<dev string:x1c>" + player.current_dialogue + "<dev string:x53>");
        #/
        return;
    }
    player.dialogue_playing = 1;
    player.current_dialogue = alias;
    if (isarray(alias)) {
        alias = random(alias);
    }
    if (soundexists(alias)) {
        player playlocalsound(alias);
        wait get_sound_length(alias);
    }
    player.dialogue_playing = 0;
    player.current_dialogue = "";
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e5
// Size: 0x81
function stop_current_dialogue() {
    if (istrue(level.dialogue_playing)) {
        foreach (player in level.players) {
            player stoplocalsound(player.current_dialogue);
            player.dialogue_playing = 0;
        }
        level.dialogue_playing = 0;
    }
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66e
// Size: 0xf5
function function_7c1afbf215d163de(alias, audience) {
    speaker = self;
    if (isstruct(self) && isdefined(self.vo_parent)) {
        speaker = self.vo_parent;
    }
    self notify("stop_dialogue");
    speaker thread function_6b4248f9a3f02e2(alias, audience);
    if (!istrue(self.skip_face)) {
        if (isplayer(self)) {
            intensity = get_intensity(alias);
            thread function_1a57cd89e2331bbe("stop_facialFiller", intensity);
        } else if (isai(self) || istrue(self.fakeactor_face_anim)) {
            face_anim = namespace_71a239de73c38174::function_6d4c7d2bd5969057(alias);
            if (isdefined(face_anim)) {
                thread anim_facialanim(self, alias, face_anim);
            } else {
                intensity = get_intensity(alias);
                thread anim_facialfiller("stop_facialFiller", undefined, 0, undefined, intensity);
            }
        }
    }
    function_ea5c0accfc20ea48(alias);
    self notify("stop_facialFiller");
    return true;
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x76c
// Size: 0x30
function function_ea5c0accfc20ea48(alias) {
    self endon("death");
    self endon("stop_dialogue");
    duration = lookupsoundlength(alias) / 1000;
    wait duration;
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a4
// Size: 0x6d
function get_intensity(alias) {
    if (isdefined(self.var_9af882a4ef5986c0)) {
        return self.var_9af882a4ef5986c0;
    }
    var_c59c1d18b26c886e = ["sm", "sm", "md", "lg"];
    intensity = default_to(function_d159656d2b07f8a5(alias), 0);
    return var_c59c1d18b26c886e[intensity];
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x81a
// Size: 0x1bd
function function_6b4248f9a3f02e2(alias, audience) {
    if (isent(self)) {
        self stopsoundchannel("voice_bchatter_1_3d", 1);
    }
    if (isplayer(self)) {
        emitter = self;
        foreach (player in level.players) {
            if (!isdefined(player) || !player scripts\cp\utility::is_valid_player(1, 1)) {
                continue;
            }
            if (player == self) {
                emitter function_480deaf73792ccf1(alias, "dx_type", "dx_player", player);
                continue;
            }
            context = function_315ce8400f242845(alias, player, emitter);
            emitter function_480deaf73792ccf1(alias, "dx_type", context, player);
        }
        return;
    }
    if (isplayer(audience)) {
        self playsoundtoplayer(alias, audience, self);
        return;
    }
    if (isstring(audience)) {
        if (isplayer(self)) {
            self playsoundtoteam(alias, audience, self, self);
        } else {
            self playsoundtoteam(alias, audience, undefined, self);
        }
        return;
    }
    if (isarray(audience)) {
        foreach (player_or_team in audience) {
            function_6b4248f9a3f02e2(alias, player_or_team);
        }
        return;
    }
    if (istrue(self.var_ed56b39b72558e56)) {
        self function_6a508e111b3f7a46(alias, "dx_type", "dx_radio_3d");
        return;
    }
    self playsoundatviewheight(alias);
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9df
// Size: 0x167
function function_315ce8400f242845(alias, player, emitter) {
    if (isdefined(player.var_edab10ce7bdb9c99)) {
        return player.var_edab10ce7bdb9c99;
    }
    if (player isswimunderwater()) {
        return "dx_radio_2d";
    }
    if (istrue(level.var_d017b9c13ec2bb69) || getdvarint(@"hash_89f9be00d776a8a9", 0)) {
        origin = emitter.origin;
        if (isplayer(emitter)) {
            origin += (0, 0, 60);
        }
        contents = scripts\engine\trace::create_contents(0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0);
        result = scripts\engine\trace::ray_trace(player.origin + (0, 0, 60), origin, undefined, contents, 0, 1, 0);
        if (result["hittype"] != "hittype_none") {
            return "dx_radio_2d";
        }
    }
    radio_dist = function_2fd08032adb24c07(alias);
    if (!isdefined(radio_dist)) {
        return "dx_radio_2d";
    }
    player_distsq = distancesquared(player.origin + (0, 0, 60), emitter.origin);
    return ter_op(player_distsq < squared(radio_dist), "dx_open_air", "dx_radio_2d");
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb4f
// Size: 0x53
function function_2fd08032adb24c07(alias) {
    if (isdefined(level.var_cb329546ed01d21a) && isdefined(level.var_cb329546ed01d21a[alias])) {
        return level.var_cb329546ed01d21a[alias];
    }
    var_465e9be55e97aee6 = function_405ca75fc1a4ec12(alias);
    if (!isdefined(var_465e9be55e97aee6)) {
        return undefined;
    }
    return var_465e9be55e97aee6 * 0.33;
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbab
// Size: 0x72
function function_1a57cd89e2331bbe(msg, intensity) {
    switch (intensity) {
    case #"hash_fa27bff6bd62ad64":
        intensity = 1;
        break;
    case #"hash_fa24dcf6bd609c74":
        intensity = 2;
        break;
    case #"hash_fa50b9f6bd82f79d":
    default:
        intensity = 3;
        break;
    }
    self function_ddb86da3e575e652(intensity);
    self waittill(msg);
    self function_ddb86da3e575e652(0);
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc25
// Size: 0x260
function anim_facialfiller(msg, looktarget, force, msg_ent, intensity) {
    intensity = default_to(intensity, "sm");
    self endon("death");
    self notify("newFacialAnim");
    if (!isdefined(msg_ent)) {
        msg_ent = self;
    }
    if (isai(self) && !isalive(self)) {
        return;
    }
    if (!isai(self)) {
        if (!isdefined(self.fakeactor_face_anim)) {
            return;
        } else if (!self.fakeactor_face_anim || !isalive(self)) {
            return;
        }
    }
    if (istrue(self.nofacialfiller)) {
        return;
    }
    if (!istrue(force) && !scripts\asm\shared\utility::isfacialstateallowed("filler")) {
        return;
    }
    if (isdefined(self.unittype) && (self.unittype == "c6" || self.unittype == "c8" || self.unittype == "c12")) {
        return;
    }
    changetime = 0.05;
    self notify("newLookTarget");
    self endon("newLookTarget");
    waittillframeend();
    if (!isdefined(looktarget) && isdefined(self.bc_looktarget)) {
        looktarget = self.bc_looktarget;
    }
    archetype = scripts\asm\shared\utility::function_2285421dfc79c4d5();
    var_6b7315aedc52f8e2 = self.defaulttalk;
    headknob = self.scriptedtalkingknob;
    assert(isalive(self));
    scripts\asm\shared\utility::setfacialstate("filler");
    if (archetype != "") {
        if (isai(self)) {
            self setfacialindex("talk_" + intensity);
        } else if (istrue(self.var_5247d15da29e8539)) {
            scripts\asm\shared\utility::function_ee3e5d584e317d35("talk_" + intensity);
        } else {
            scripts\asm\shared\utility::setfacialindexfornonai("talk_" + intensity);
        }
    } else {
        self setanimknoblimitedrestart(var_6b7315aedc52f8e2, 1, 0, 1);
        self setanim(headknob, 5, 0.267);
    }
    msg_ent waittill(msg);
    if (archetype != "" && isai(self)) {
        self setfacialindex("none");
    } else if (istrue(self.var_5247d15da29e8539) && isdefined(self.var_7a140ee03cfc699e)) {
        scripts\asm\shared\utility::function_ee3e5d584e317d35("none");
    }
    scripts\asm\shared\utility::clearfacialstate("filler");
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d
// Size: 0xc0
function anim_facialanim(guy, anime, faceanim) {
    guy endon("death");
    self endon(anime);
    changetime = 0.05;
    guy notify("newLookTarget");
    guy notify("newFacialAnim");
    scripts\asm\shared\utility::disabledefaultfacialanims();
    waittillframeend();
    if (!isdefined(self.scriptedtalkingknob)) {
        self.scriptedtalkingknob = scripts\asm\asm::asm_getxanim("knobs", scripts\asm\asm::asm_lookupanimfromalias("knobs", "scripted_talking"));
    }
    animflag = "scripted_face_" + anime;
    guy setanim(self.scriptedtalkingknob, 1, 0.2);
    guy setflaggedanimknobrestart(animflag, faceanim, 1, 0, 1);
    thread clearfaceanimonanimdone(guy, animflag, anime);
}

// Namespace namespace_f8a56e8949145a55 / scripts\cp\cp_dialogue
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf55
// Size: 0x69
function clearfaceanimonanimdone(guy, animflag, anime) {
    guy endon("death");
    guy endon("newFacialAnim");
    guy waittillmatch(animflag, "end");
    guy notify("scripted_face_done");
    changetime = 0.3;
    guy clearanim(self.scriptedtalkingknob, 0.2);
    scripts\asm\shared\utility::disabledefaultfacialanims(0);
}

