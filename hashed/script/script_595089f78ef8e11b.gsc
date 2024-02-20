// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_23efd55d0c605229;

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa
// Size: 0x11
function function_afb445939fe4c1a4() {
    self.var_82420c8df7f30a5b = &function_e423d82a410af5dc;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112
// Size: 0x212
function function_d01c8da69fe6ad5(ai, var_c2aec59361d95878, alias, priority) {
    ai endon("death");
    /#
        if (getdvarint(@"hash_d01570d79c646246", 0) != 0) {
            return;
        }
    #/
    if (!isdefined(ai)) {
        return;
    }
    if (istrue(ai.var_c381a581e38c27e7)) {
        return;
    }
    if (isdefined(priority) && isdefined(self.var_32970d1295bb58af) && isdefined(ai.var_32970d1295bb58af[priority])) {
        if (gettime() < ai.var_32970d1295bb58af[priority]) {
            return;
        }
    }
    if (ai ent_flag("playing_vo") && isdefined(ai.var_7f11732708bb827d) && isdefined(priority)) {
        if (priority < ai.var_7f11732708bb827d || priority == 1) {
            return;
        }
        ai notify("ai_vo_override");
        if (ai isscriptable()) {
            ai setscriptablepartstate("sound_vo", "off");
        }
        if (priority > ai.var_7f11732708bb827d && !istrue(level.var_eb3b042962fb30a5)) {
            var_ed9360e85180f100 = ai function_fc041668d6654de8();
            ai stopsoundchannel(var_ed9360e85180f100);
            level.var_eb3b042962fb30a5 = 1;
            waitframe();
            level.var_eb3b042962fb30a5 = 0;
        }
        waitframe();
    }
    if (soundexists(alias)) {
        ai.var_7f11732708bb827d = priority;
        ai ent_flag_set("playing_vo");
        time = lookupsoundlength(alias, 1);
        if (isdefined(var_c2aec59361d95878)) {
            /#
                assert(ai isscriptable());
            #/
            ai utility::function_3677f2be30fdd581("sound_vo", var_c2aec59361d95878);
        } else {
            ai playsoundonmovingent(alias);
        }
        ai endon("ai_vo_override");
        ai ent_flag_clear_delayed("playing_vo", function_c89ed1840c8d0f0f(time));
        if (ai isscriptable()) {
            ai setscriptablepartstate("sound_vo", "off");
        }
        ai.var_7f11732708bb827d = 0;
    } else if (isdefined(var_c2aec59361d95878)) {
        ai utility::function_3677f2be30fdd581("sound_vo", var_c2aec59361d95878);
    } else {
        /#
            println("<unknown string>" + alias);
        #/
    }
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x46
function function_fc041668d6654de8() {
    if (self.aicategory == "special" || self.aicategory == "elite" || self.aicategory == "boss") {
        return "voice_zmb_elite_3d";
    }
    return "voice_zmb_1_3d";
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x379
// Size: 0x40
function function_5420e83b135ec96f(var_16fbc6a2229d1d81, priority) {
    self.var_32970d1295bb58af = function_53c4c53197386572(self.var_32970d1295bb58af, []);
    self.var_32970d1295bb58af[priority] = gettime() + var_16fbc6a2229d1d81;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0
// Size: 0x27
function function_4922184552eb149() {
    self.var_c381a581e38c27e7 = function_53c4c53197386572(self.var_c381a581e38c27e7, 0);
    self.var_c381a581e38c27e7 = 1;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ee
// Size: 0x26
function function_9c62fac1f9fdd26c() {
    self.var_c381a581e38c27e7 = function_53c4c53197386572(self.var_c381a581e38c27e7, 0);
    self.var_c381a581e38c27e7 = 0;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41b
// Size: 0xb9
function function_f11270bb42f7f080(notify_string, var_c2aec59361d95878, alias, priority) {
    level.var_a4adf98f94c5fd84 = function_53c4c53197386572(level.var_a4adf98f94c5fd84, []);
    level.var_a4adf98f94c5fd84[self.basearchetype] = function_53c4c53197386572(level.var_a4adf98f94c5fd84[self.basearchetype], []);
    state = spawnstruct();
    state.var_c2aec59361d95878 = var_c2aec59361d95878;
    state.priority = priority;
    state.alias = alias;
    level.var_a4adf98f94c5fd84[self.basearchetype][notify_string] = state;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db
// Size: 0xc3
function function_ea9336bca9113548(var_a8a2867722a244ed, notify_string, var_c2aec59361d95878, alias, priority) {
    level.var_a4adf98f94c5fd84 = function_53c4c53197386572(level.var_a4adf98f94c5fd84, []);
    level.var_a4adf98f94c5fd84[self.basearchetype] = function_53c4c53197386572(level.var_a4adf98f94c5fd84[self.basearchetype], []);
    state = spawnstruct();
    state.var_c2aec59361d95878 = var_c2aec59361d95878;
    state.priority = priority;
    state.alias = alias;
    level.var_a4adf98f94c5fd84[self.basearchetype][notify_string + var_a8a2867722a244ed] = state;
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a5
// Size: 0x14
function private function_e423d82a410af5dc(state) {
    function_f707c26d8f269f94(state);
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c0
// Size: 0x108
function function_f707c26d8f269f94(event) {
    if (!isdefined(self.basearchetype)) {
        return;
    }
    if (!isdefined(level.var_a4adf98f94c5fd84[self.basearchetype])) {
        return;
    }
    if (isdefined(self.subclass) && isdefined(level.var_a4adf98f94c5fd84[self.basearchetype][event + self.subclass])) {
        event = event + self.subclass;
    }
    var_42db284ef44b45b = level.var_a4adf98f94c5fd84[self.basearchetype][event];
    if (!isdefined(var_42db284ef44b45b)) {
        return;
    }
    var_c2aec59361d95878 = var_42db284ef44b45b.var_c2aec59361d95878;
    alias = var_42db284ef44b45b.alias;
    priority = var_42db284ef44b45b.priority;
    if (isdefined(self.var_74e2482f0c021e12)) {
        level thread [[ self.var_74e2482f0c021e12 ]](event, self, var_c2aec59361d95878, alias, priority);
    } else {
        level thread function_d01c8da69fe6ad5(self, var_c2aec59361d95878, alias, priority);
    }
}

// Namespace namespace_23efd55d0c605229/namespace_4962e6c1ee31d561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6cf
// Size: 0x16
function function_3b76e1d247d2f5a(var_74e2482f0c021e12) {
    self.var_74e2482f0c021e12 = var_74e2482f0c021e12;
}

