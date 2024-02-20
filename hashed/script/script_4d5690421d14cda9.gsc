// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_38eb8f4be20d54f4;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_7edf952f8921aa6b;
#using script_38c517e34d7c3efb;
#using script_429c2a03090c1ea1;

#namespace namespace_c5b413a1b2176fe3;

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b
// Size: 0x96
function function_fcbab070c240a397(params) {
    settings = function_cb7771bf461049eb(params);
    if (isdefined(settings)) {
        add_fx("disciple_lifedrain_beam_fx", settings.var_c164f56da4c8b950);
        add_fx("disciple_weakpoint_hand_impact_fx", settings.var_735914b3360cf610);
        add_fx("disciple_weakpoint_hand_fx", settings.var_7e21c2fc64b1a2da);
        add_fx("disciple_lifedrain_screen_fx", settings.var_495b2246709c1ebd);
        add_fx("disciple_lifedrain_kill_fx", settings.var_64673f9cba520069);
    }
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8
// Size: 0x2d
function function_e763a1820edbfd28() {
    callback::function_e7fddda1f0b46b5e(self.var_ae3ea15396b65c1f) callback::add("on_zombie_ai_damaged", &function_4748556b6552da35);
    /#
        function_4aa1128bb0cf132();
    #/
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c
// Size: 0x96
function function_949f643edcd1aade() {
    self.var_1c5af6d8a6251895 = 0;
    self.var_e2b17292054656a1 = 0;
    self.var_f4d4e9f86be4cff7 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_1de95697972bd8c7;
    self.var_65ed14e9b65ad777 = self.var_47399212b3052720.var_e58a65b7a8f5973c.var_23c1773c98bbea52;
    self.var_2fad7b72c8bdb9c0 = squared(self.var_47399212b3052720.var_e58a65b7a8f5973c.var_b97a4f96e35d62fc);
    thread function_1f54174f18b9d00b();
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3c9
// Size: 0xdc
function private function_4748556b6552da35(params) {
    if (isdefined(self.var_a39609c30eeab15b)) {
        self.var_a39609c30eeab15b = self.var_a39609c30eeab15b + params.idamage;
    }
    if (function_c91fafcbd1b5bd9e(params)) {
        self.var_1c5af6d8a6251895 = self.var_1c5af6d8a6251895 + params.idamage;
        self.var_2ad6444a5135c6e7 = params.eattacker;
        playfxontag(getfx("disciple_weakpoint_hand_impact_fx"), self, "tag_fx_hand_ri_palm");
        if (!istrue(self.var_8eea1c7b28ac77b5) && self.var_1c5af6d8a6251895 > self.var_f4d4e9f86be4cff7 * self.maxhealth) {
            self function_3e89eb3d8e3f1811("life_drain_cooldown", 5000 + gettime());
            self function_3e89eb3d8e3f1811("in_life_drain_pain", 1);
        }
    }
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ac
// Size: 0x63
function private function_f1d567f9cfaf8638(params) {
    if (istrue(self.var_bc3dcc1a5359b3e5) && isdefined(params.body) && params.body tagexists("j_spine4")) {
        playfxontag(getfx("disciple_lifedrain_kill_fx"), params.body, "j_spine4");
    }
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x516
// Size: 0x4f
function private function_1f54174f18b9d00b() {
    self endon("death");
    while (1) {
        self waittill("life_drain_loop_start");
        ent_flag_set("playing_life_drain_anim");
        thread function_403d98066db9adbd();
        self waittill("life_drain_loop_end");
        ent_flag_clear("playing_life_drain_anim");
        self function_3e89eb3d8e3f1811("in_life_drain", 0);
    }
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56c
// Size: 0x52d
function private function_403d98066db9adbd() {
    level endon("game_ended");
    target_ent = self.enemy;
    if (!isdefined(target_ent) || istrue(target_ent.var_bc3dcc1a5359b3e5)) {
        self function_3e89eb3d8e3f1811("in_life_drain", 0);
        return;
    }
    target_ent.var_bc3dcc1a5359b3e5 = 1;
    self.var_a39609c30eeab15b = 0;
    self.var_1c5af6d8a6251895 = 0;
    namespace_6fb6f707cdc959d::function_7380ccd6f2c49392("hand", 1);
    playfxontag(getfx("disciple_weakpoint_hand_fx"), self, "tag_fx_hand_ri_palm");
    self setscriptablepartstate("drain_audio", "on");
    n_damage = 0;
    if (isplayer(target_ent)) {
        playfxontagforclients(getfx("disciple_lifedrain_screen_fx"), target_ent, "j_head", target_ent);
        n_damage = self.var_65ed14e9b65ad777;
    } else if (isdefined(target_ent.maxhealth)) {
        target_ent callback::add("killed_body_cloned", &function_f1d567f9cfaf8638);
        if (isdefined(target_ent.aicategory) && (target_ent.aicategory == "special" || target_ent.aicategory == "elite")) {
            n_damage = int(min(max(self.maxhealth * 0.05, target_ent.maxhealth * 0.05), self.maxhealth));
        } else {
            n_damage = int(min(max(self.maxhealth * 0.2, target_ent.maxhealth * 0.2), self.maxhealth));
        }
    }
    var_6198758dd896c717 = utility::spawn_model("tag_origin", self gettagorigin("tag_fx_hand_ri_palm"));
    var_6198758dd896c717 linkto(self, "tag_fx_hand_ri_palm");
    var_23ea96e3ee262480 = playfxontagsbetweenclients(getfx("disciple_lifedrain_beam_fx"), var_6198758dd896c717, "tag_origin", target_ent, "j_spine4");
    if (isdefined(var_23ea96e3ee262480)) {
        var_23ea96e3ee262480 function_cea710f9d017694a(1);
    }
    n_frames = 0;
    var_5fee5b46d1154ab4 = gettime() + 3000;
    while (isalive(self) && isalive(target_ent) && !istrue(target_ent.inlaststand)) {
        if (!isdefined(self.enemy) || self.enemy != target_ent) {
            break;
        }
        dist_sq = distancesquared(target_ent.origin, self.origin);
        if (dist_sq > self.var_2fad7b72c8bdb9c0 && gettime() > var_5fee5b46d1154ab4) {
            break;
        }
        if (dist_sq > self.var_2fad7b72c8bdb9c0 * 3) {
            break;
        }
        if (target_ent.team == self.team) {
            break;
        }
        if (!istrue(self function_11e2d4051ea44b35("in_life_drain"))) {
            break;
        }
        if (!ray_trace_passed(self getcentroid(), target_ent getcentroid(), undefined, create_default_contents(1))) {
            break;
        }
        n_frames++;
        if (n_frames == 10) {
            var_7278dfba2b654bff = 1 - self.health / self.maxhealth;
            var_bda5255252a8e4b6 = 0.0125 * self.maxhealth * (1 + var_7278dfba2b654bff * 2.5);
            var_bda5255252a8e4b6 = var_bda5255252a8e4b6 + self.var_a39609c30eeab15b * 0.9;
            self.var_a39609c30eeab15b = 0;
            var_be9e2150d4979f71 = function_1499a812ecd5f3b6(self);
            var_bda5255252a8e4b6 = int(min(var_bda5255252a8e4b6, max(var_be9e2150d4979f71 * self.maxhealth - self.health, 0)));
            self.health = self.health + var_bda5255252a8e4b6;
            self.var_e2b17292054656a1 = self.var_e2b17292054656a1 + var_bda5255252a8e4b6;
            if (isagent(target_ent) && n_damage >= target_ent.health) {
                target_ent.do_immediate_ragdoll = 1;
            }
            target_ent dodamage(n_damage, target_ent.origin, self, self, "MOD_FIRE", undefined, "torso_upper");
            n_frames = 0;
        }
        wait(0.05);
    }
    var_6198758dd896c717 delete();
    var_23ea96e3ee262480 delete();
    if (isalive(self) && isdefined(self.var_a39609c30eeab15b)) {
        self.var_1c5af6d8a6251895 = 0;
        self.var_a39609c30eeab15b = undefined;
        self function_3e89eb3d8e3f1811("in_life_drain", 0);
        if (!istrue(self function_11e2d4051ea44b35("in_life_drain_pain"))) {
            self function_3e89eb3d8e3f1811("life_drain_cooldown", 1000 + gettime());
        }
        stopfxontag(getfx("disciple_weakpoint_hand_fx"), self, "tag_fx_hand_ri_palm");
        self setscriptablepartstate("drain_audio", "stop");
        namespace_6fb6f707cdc959d::function_7380ccd6f2c49392("hand", 0);
    }
    if (isdefined(target_ent)) {
        target_ent.var_bc3dcc1a5359b3e5 = undefined;
        if (isplayer(target_ent)) {
            stopfxontag(getfx("disciple_lifedrain_screen_fx"), target_ent, "j_head");
        } else {
            target_ent callback::remove("killed_body_cloned", &function_f1d567f9cfaf8638);
        }
    }
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0x18
function function_860d329e4f5111ae(entity) {
    return istrue(entity function_11e2d4051ea44b35("in_life_drain"));
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac0
// Size: 0x2d
function function_c91fafcbd1b5bd9e(params) {
    return isdefined(params.var_2eb474020f9d509) && params.var_2eb474020f9d509 == "hand";
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xaf5
// Size: 0x45
function private function_4aa1128bb0cf132() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_2e23970d7f46208a);
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_dc591bebf0dce66d);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb41
// Size: 0x45
function private function_2e23970d7f46208a() {
    /#
        disciple = function_6d1fbda4b8524ef2(level.players[0].origin, undefined, "<unknown string>");
        if (isdefined(disciple)) {
            disciple function_3e89eb3d8e3f1811("<unknown string>", 1);
        }
    #/
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb8d
// Size: 0x1b
function private function_dc591bebf0dce66d() {
    /#
        function_2fb888667001fc39("<unknown string>", @"hash_5ea28fb57e748699");
    #/
}

// Namespace namespace_c5b413a1b2176fe3/namespace_9acf48fa6985d323
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xbaf
// Size: 0x64
function private function_ea2d00bafd61346e(text, pos) {
    /#
        if (getdvarint(@"hash_5ea28fb57e748699", 0)) {
            pos = function_53c4c53197386572(pos, self.origin + (0, 0, 70));
            print3d(pos, "<unknown string>" + text, (1, 0, 0));
        }
    #/
}

