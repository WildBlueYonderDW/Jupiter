// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using script_5d265b4fca61f070;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_f83311618817dbe7;

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189
// Size: 0x45
function main() {
    level.dialogue_playing = 0;
    level.current_dialogue = "";
    level.var_9a62261b5b534b06 = &function_7bdde7f2158ec720;
    level.var_c3d9ceba74248998 = &function_e174f6ae044c693e;
    level.var_1da0697a602f5a04 = &function_46d1642a9a982a8a;
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5
// Size: 0x66
function function_e174f6ae044c693e(origin, radius, var_beb392bbb338d308, var_41d8fabdcb0957bb) {
    if (isdefined(var_41d8fabdcb0957bb) && !isarray(var_41d8fabdcb0957bb)) {
        var_41d8fabdcb0957bb = [0:var_41d8fabdcb0957bb];
    }
    if (function_a794fcf9545f2062()) {
        return function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6([0:"etype_player"]), var_41d8fabdcb0957bb, var_beb392bbb338d308);
    }
    return namespace_7e17181d03156026::getplayersinradius(origin, radius, var_beb392bbb338d308, var_41d8fabdcb0957bb);
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243
// Size: 0x8c
function function_46d1642a9a982a8a(origin, radius, var_beb392bbb338d308, var_41d8fabdcb0957bb) {
    if (isdefined(var_41d8fabdcb0957bb) && !isarray(var_41d8fabdcb0957bb)) {
        var_41d8fabdcb0957bb = [0:var_41d8fabdcb0957bb];
    }
    if (function_a794fcf9545f2062()) {
        return function_b1eef70090b5b7b5(origin, radius, function_869ccb4e3451b8c6([0:"etype_ai"]), var_41d8fabdcb0957bb, var_beb392bbb338d308);
    }
    if (isdefined(var_41d8fabdcb0957bb) && var_41d8fabdcb0957bb.size) {
        return array_remove_array(getaiarrayinradius(origin, radius, var_beb392bbb338d308), var_41d8fabdcb0957bb);
    }
    if (isdefined(var_beb392bbb338d308)) {
        return getaiarrayinradius(origin, radius, var_beb392bbb338d308);
    }
    return getaiarrayinradius(origin, radius);
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d7
// Size: 0xf6
function function_7bdde7f2158ec720(alias, var_1626d989a1196f67) {
    speaker = self;
    if (isstruct(self) && isdefined(self.var_868e98cf48b92cfb)) {
        speaker = self.var_868e98cf48b92cfb;
    }
    self notify("stop_dialogue");
    context = ter_op(istrue(self.var_ed56b39b72558e56), "dx_radio_3d");
    speaker thread function_63a29fee1a93c0a8(alias, context, var_1626d989a1196f67);
    if (!istrue(self.var_54c1779b663e506a) && (isai(self) || istrue(self.fakeactor_face_anim))) {
        var_e20c77b75b2a3f10 = namespace_71a239de73c38174::function_6d4c7d2bd5969057(alias);
        if (isdefined(var_e20c77b75b2a3f10)) {
            thread anim_facialanim(self, alias, var_e20c77b75b2a3f10);
        } else {
            intensity = function_f7191829a1988da5(alias);
            thread anim_facialfiller("stop_facialFiller", undefined, 0, undefined, intensity);
        }
    }
    function_ea5c0accfc20ea48(alias);
    self notify("stop_facialFiller");
    return 1;
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d5
// Size: 0x31
function function_ea5c0accfc20ea48(alias) {
    self endon("death");
    self endon("stop_dialogue");
    duration = lookupsoundlength(alias) / 1000;
    wait(duration);
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40d
// Size: 0x6e
function function_f7191829a1988da5(alias) {
    if (isdefined(self.var_9af882a4ef5986c0)) {
        return self.var_9af882a4ef5986c0;
    }
    var_c59c1d18b26c886e = [0:"sm", 1:"sm", 2:"md", 3:"lg"];
    intensity = function_53c4c53197386572(function_d159656d2b07f8a5(alias), 0);
    return var_c59c1d18b26c886e[intensity];
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x483
// Size: 0xf9
function function_63a29fee1a93c0a8(alias, context, var_1626d989a1196f67) {
    self stopsounds(1);
    self stopsoundchannel("voice_bchatter_1_3d", 1);
    waitframe();
    if (!isdefined(self)) {
        return;
    }
    if (isplayer(var_1626d989a1196f67)) {
        self playsoundtoplayer(alias, var_1626d989a1196f67, self);
    } else if (isstring(var_1626d989a1196f67)) {
        if (isplayer(self)) {
            self playsoundtoteam(alias, var_1626d989a1196f67, self, self);
        } else {
            self playsoundtoteam(alias, var_1626d989a1196f67, undefined, self);
        }
    } else if (isarray(var_1626d989a1196f67)) {
        foreach (player_or_team in var_1626d989a1196f67) {
            thread function_63a29fee1a93c0a8(alias, player_or_team);
        }
    } else if (isdefined(context)) {
        self playcontextsound(alias, "dx_type", context);
    } else {
        self playsound(alias, undefined, self);
    }
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x583
// Size: 0x261
function anim_facialfiller(msg, looktarget, force, var_f5b8c1160179b1f8, intensity) {
    intensity = function_53c4c53197386572(intensity, "sm");
    self endon("death");
    self notify("newFacialAnim");
    if (!isdefined(var_f5b8c1160179b1f8)) {
        var_f5b8c1160179b1f8 = self;
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
    if (!istrue(force) && !namespace_34bf5965727c0922::isfacialstateallowed("filler")) {
        return;
    }
    if (isdefined(self.unittype) && (self.unittype == "c6" || self.unittype == "c8" || self.unittype == "c12")) {
        return;
    }
    var_e3f91b8c2c172248 = 0.05;
    self notify("newLookTarget");
    self endon("newLookTarget");
    waittillframeend();
    if (!isdefined(looktarget) && isdefined(self.bc_looktarget)) {
        looktarget = self.bc_looktarget;
    }
    archetype = namespace_34bf5965727c0922::function_2285421dfc79c4d5();
    var_6b7315aedc52f8e2 = self.defaulttalk;
    headknob = self.scriptedtalkingknob;
    /#
        assert(isalive(self));
    #/
    namespace_34bf5965727c0922::setfacialstate("filler");
    if (archetype != "") {
        if (isai(self)) {
            self setfacialindex("talk_" + intensity);
        } else if (istrue(self.var_5247d15da29e8539)) {
            namespace_34bf5965727c0922::function_ee3e5d584e317d35("talk_" + intensity);
        } else {
            namespace_34bf5965727c0922::setfacialindexfornonai("talk_" + intensity);
        }
    } else {
        self setanimknoblimitedrestart(var_6b7315aedc52f8e2, 1, 0, 1);
        self setanim(headknob, 5, 0.267);
    }
    var_f5b8c1160179b1f8 waittill(msg);
    if (archetype != "" && isai(self)) {
        self setfacialindex("none");
    } else if (istrue(self.var_5247d15da29e8539) && isdefined(self.var_7a140ee03cfc699e)) {
        namespace_34bf5965727c0922::function_ee3e5d584e317d35("none");
    }
    namespace_34bf5965727c0922::clearfacialstate("filler");
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb
// Size: 0xc1
function anim_facialanim(guy, anime, var_1945c9e13fcd068d) {
    guy endon("death");
    self endon(anime);
    var_e3f91b8c2c172248 = 0.05;
    guy notify("newLookTarget");
    guy notify("newFacialAnim");
    namespace_34bf5965727c0922::disabledefaultfacialanims();
    waittillframeend();
    if (!isdefined(self.scriptedtalkingknob)) {
        self.scriptedtalkingknob = namespace_bf5a1761a8d1bb07::asm_getxanim("knobs", namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias("knobs", "scripted_talking"));
    }
    var_5adb4aec861050b6 = "scripted_face_" + anime;
    guy setanim(self.scriptedtalkingknob, 1, 0.2);
    guy setflaggedanimknobrestart(var_5adb4aec861050b6, var_1945c9e13fcd068d, 1, 0, 1);
    thread clearfaceanimonanimdone(guy, var_5adb4aec861050b6, anime);
}

// Namespace namespace_f83311618817dbe7/namespace_e60d0883fe817ff2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b3
// Size: 0x6a
function clearfaceanimonanimdone(guy, var_5adb4aec861050b6, anime) {
    guy endon("death");
    guy endon("newFacialAnim");
    guy waittillmatch(var_5adb4aec861050b6, "end");
    guy notify("scripted_face_done");
    var_e3f91b8c2c172248 = 0.3;
    guy clearanim(self.scriptedtalkingknob, 0.2);
    namespace_34bf5965727c0922::disabledefaultfacialanims(0);
}

