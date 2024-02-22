// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_35de402efc5acfb3;
#using script_433d8f78f7e5fb;
#using scripts\asm\asm.gsc;
#using script_50eeb9595c6d6e1b;

#namespace namespace_201420652286908f;

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c
// Size: 0x144
function addtosystem() {
    if (!isdefined(level.battlechatter)) {
        return;
    }
    self endon("death");
    /#
        assert(isdefined(self.squad));
    #/
    if (!isdefined(self.battlechatterallowed)) {
        self.battlechatterallowed = 1;
    }
    self.battlechatter.friendlyfire_force = 1;
    if (isplayer(self)) {
        self.battlechatterallowed = 0;
        self.type = "human";
        return;
    }
    if (self.unittype == "dog" || self.unittype == "juggernaut" || self.team == "neutral") {
        self.battlechatterallowed = 0;
        return;
    }
    self.headknob = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "head"));
    self.scriptedtalkingknob = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "scripted_talking"));
    self.defaulttalk = asm_getxanim("knobs", asm_lookupanimfromalias("knobs", "default_talking"));
    function_f9e1b676055cf38b();
    thread aithreadwaiter();
    self.chatinitialized = 1;
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7
// Size: 0x94
function function_848612e5b224425b(var_c6910a7018189965, var_4189af81d34b8804, var_10e927a072c477b) {
    var_e530e91be23a6bc9 = tolower(function_53c4c53197386572(var_c6910a7018189965, self.script_friendname));
    self.battlechatter.countryid = var_e530e91be23a6bc9;
    self.battlechatter.npcid = undefined;
    self.battlechatter.var_732df8db084ab0c5 = 1;
    anim.var_6d557183af1d1db5[var_e530e91be23a6bc9] = var_4189af81d34b8804;
    anim.var_7f532a5dc6603698[var_e530e91be23a6bc9] = var_10e927a072c477b;
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x362
// Size: 0x21
function function_ffd2cfb5b8a113ac(text, duration) {
    /#
        thread function_c3cc4c3fb0ac344c(text, duration);
    #/
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x38a
// Size: 0x63
function private function_c3cc4c3fb0ac344c(text, duration) {
    /#
        self endon("<unknown string>");
        if (!isdefined(self.var_446bf46cbf43cf30)) {
            return;
        }
        self.var_446bf46cbf43cf30[self.var_446bf46cbf43cf30.size] = text;
        if (!isdefined(duration)) {
            return;
        }
        wait(duration);
        self.var_446bf46cbf43cf30 = function_57091b2d67654a14(self.var_446bf46cbf43cf30, text);
    #/
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3f4
// Size: 0xaa
function private function_c911f04ca7e627e8() {
    /#
        self endon("<unknown string>");
        self.var_446bf46cbf43cf30 = [];
        for (;;) {
            height = 30;
            foreach (debugln in self.var_446bf46cbf43cf30) {
                print3d(self gettagorigin("<unknown string>") + (0, 0, height), debugln, (1, 1, 1), 1, 0.5, 1, 1);
                height = height + 10;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a5
// Size: 0xc3
function function_763f1e33a5d6bb68() {
    if (isdefined(self.battlechatter.npcid) && isdefined(self.voice)) {
        foreach (var_cf9dfca32af33b39 in anim.usedids[self.voice]) {
            if (var_cf9dfca32af33b39.npcid == self.battlechatter.npcid) {
                var_cf9dfca32af33b39.count--;
                break;
            }
        }
    }
    self.battlechatter.npcid = undefined;
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f
// Size: 0x9b
function function_f9e1b676055cf38b(voice) {
    if (isdefined(voice)) {
        self.voice = voice;
    }
    if (!isdefined(self.voice)) {
        return;
    }
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.npcid)) {
        function_763f1e33a5d6bb68();
    }
    self.battlechatter.countryid = anim.countryids[self.voice];
    if (!isdefined(self.battlechatter.countryid)) {
        return;
    }
    assign_npcid();
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x611
// Size: 0x11
function function_da324cd732971e8c() {
    function_763f1e33a5d6bb68();
    assign_npcid();
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x629
// Size: 0x186
function removefromsystem(squad) {
    if (!isdefined(level.battlechatter) || !isdefined(self)) {
        return;
    }
    if (!isalive(self) && isdefined(self.attacker) && !is_equal(squad.team, self.attacker.team) && squad.team != "neutral") {
        self.attacker thread function_453b3867c6ec0ceb(self, self.attacker.team);
        thread function_f649c4ef3acdec1d(squad.team);
    }
    if (isdefined(self.battlechatter) && isdefined(self.battlechatter.npcid) && isdefined(self.voice)) {
        function_763f1e33a5d6bb68();
        if (isdefined(level.stealth) && isdefined(level.var_621af16ef0684a11)) {
            thread function_bd6944098e09347f(squad.team, self.battlechatter.countryid, self.battlechatter.npcid, self.battlechatter.name);
        }
    } else if (isdefined(self.var_4413114d1d17278b)) {
        self.var_4413114d1d17278b notify("death");
        self.var_4413114d1d17278b delete();
    }
    self notify("removed from battleChatter");
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6
// Size: 0x19c
function function_bd6944098e09347f(team, countryid, npcid, name) {
    if (istrue(level.var_ecafb96516684c19)) {
        return;
    }
    origin = self.origin;
    voice = self.voice;
    if (!issp()) {
        function_3e6d99e336341602();
        return;
    }
    entnum = self getentitynumber();
    corpse = undefined;
    while (!isdefined(corpse)) {
        array = [[ level.var_621af16ef0684a11 ]](level.var_798aa343368f724e);
        foreach (var_969f28bbb67e845e in array) {
            if (var_969f28bbb67e845e getentitynumber() == entnum) {
                corpse = var_969f28bbb67e845e;
            }
        }
        waitframe();
    }
    corpse.team = team;
    corpse.voice = voice;
    corpse.battlechatter = spawnstruct();
    corpse.battlechatter.countryid = countryid;
    corpse.battlechatter.npcid = npcid;
    corpse.battlechatter.name = name;
    corpse.battlechatterallowed = 1;
    if (isdefined(level.stealth)) {
        corpse thread function_bd0f092dbcdea227();
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x959
// Size: 0x3
function function_3e6d99e336341602() {
    
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x963
// Size: 0x3
function function_bd0f092dbcdea227() {
    
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96d
// Size: 0xeb
function setnpcid() {
    /#
        assert(!isdefined(self.battlechatter.npcid));
    #/
    usedids = anim.usedids[self.voice];
    var_cb9c74d28d191f3 = usedids.size;
    startindex = randomint(var_cb9c74d28d191f3);
    var_59dc09a0fea10022 = startindex;
    for (index = 0; index <= var_cb9c74d28d191f3; index++) {
        if (usedids[(startindex + index) % var_cb9c74d28d191f3].count < usedids[var_59dc09a0fea10022].count) {
            var_59dc09a0fea10022 = (startindex + index) % var_cb9c74d28d191f3;
        }
    }
    anim.usedids[self.voice][var_59dc09a0fea10022].count++;
    self.battlechatter.npcid = usedids[var_59dc09a0fea10022].npcid;
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5f
// Size: 0x14
function evaluateattackevent(weapon) {
    function_656c8ba582163660(weapon);
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7a
// Size: 0x48
function aithreadwaiter() {
    self endon("death");
    self endon("removed from battleChatter");
    self notify("aiThreadWaiter");
    self endon("aiThreadWaiter");
    childthread waittill_missile_fire();
    childthread waittill_grenade_fire();
    childthread function_ad344a5a58977b39();
    childthread function_55345680b30657a1();
    childthread function_69110de99255d852();
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac9
// Size: 0x4e
function waittill_missile_fire() {
    while (1) {
        objweapon = missile = self waittill("missile_fire");
        var_fc3f189c0832aec2 = function_c666e714b2411844(objweapon);
        if (isdefined(var_fc3f189c0832aec2)) {
            function_216c67ab6749137a(self, undefined, "use", var_fc3f189c0832aec2);
        }
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1e
// Size: 0x67
function waittill_grenade_fire() {
    while (1) {
        grenade = self waittill("grenade_fire");
        if (isdefined(grenade) && isdefined(grenade.weapon_object)) {
            var_fc3f189c0832aec2 = function_c666e714b2411844(grenade.weapon_object);
            if (function_8f8de1d6f307f960(var_fc3f189c0832aec2)) {
                function_216c67ab6749137a(self, grenade, "grenade_danger", var_fc3f189c0832aec2);
            }
        }
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8c
// Size: 0x20
function function_ad344a5a58977b39() {
    while (1) {
        self waittill("weapon_fired");
        function_216c67ab6749137a(self, undefined, "attack");
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb3
// Size: 0x3e
function function_55345680b30657a1() {
    while (1) {
        self waittill("goal_changed");
        if (distance2dsquared(self.origin, self.goalpos) > 10000) {
            function_216c67ab6749137a(self, undefined, "move");
        }
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf8
// Size: 0x37
function function_69110de99255d852() {
    var_5fedaa69e3ddfd3 = 0;
    while (1) {
        if (var_5fedaa69e3ddfd3 != function_3f51c5f6398bff45()) {
            var_5fedaa69e3ddfd3 = !var_5fedaa69e3ddfd3;
            if (var_5fedaa69e3ddfd3) {
                function_216c67ab6749137a(self, undefined, "red_alert");
            }
        }
        waitframe();
    }
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc36
// Size: 0x3
function aivehiclekillwaiter() {
    
}

// Namespace namespace_201420652286908f/namespace_2fdc8e343bfb2334
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xc40
// Size: 0x41
function custom_battlechatter_internal(var_69857f6e03b5e3dc, sequence, priority, timeout, cooldown, endons) {
    function_d54e84a9513b0e45(var_69857f6e03b5e3dc, var_69857f6e03b5e3dc, priority, timeout, cooldown, endons);
}

