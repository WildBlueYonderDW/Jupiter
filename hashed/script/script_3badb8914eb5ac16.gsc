// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_3214e6fcdce468a7;
#using scripts\engine\utility.gsc;
#using script_429c2a03090c1ea1;
#using script_3b64eb40368c1450;
#using script_16ea1b94f0f381b3;
#using script_159f253f9bd2314e;
#using script_7edf952f8921aa6b;
#using script_686729055b66c6e4;
#using script_595089f78ef8e11b;
#using script_2ece06910a5c572;
#using script_38c251115537f16e;
#using script_a12e958c96b6c57;
#using scripts\aitypes\stealth.gsc;
#using scripts\common\ai.gsc;

#namespace namespace_be11b61c6eb3e656;

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x1da
// Size: 0x47
function private autoexec main() {
    callback::function_e7fddda1f0b46b5e("zombie") callback::add("shockStick_agentApplyHaywire", &function_c4e2f024dbf10aad);
    callback::function_e7fddda1f0b46b5e("zombie") callback::add("shockStick_agentClearHaywire", &function_4f386f6608ed39a8);
    /#
        level thread function_b7388b6432ebeb4e();
    #/
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228
// Size: 0x8a9
function function_7415ae9399ba8e75(var_f76baeb1c3556fab) {
    /#
        assert(isdefined(var_f76baeb1c3556fab));
    #/
    self.on_zombie_agent_killed_common = &on_ai_killed;
    if (!isdefined(level.var_6cd2f7cb729c844d) || !isdefined(level.var_6cd2f7cb729c844d[var_f76baeb1c3556fab])) {
        level.var_6cd2f7cb729c844d = function_53c4c53197386572(level.var_6cd2f7cb729c844d, []);
        level.var_6cd2f7cb729c844d[var_f76baeb1c3556fab] = getscriptbundle(function_2ef675c13ca1c4af(%"hash_4f17114f894920fb", var_f76baeb1c3556fab));
    }
    settings = level.var_6cd2f7cb729c844d[var_f76baeb1c3556fab];
    self.var_47399212b3052720 = settings;
    self.var_157e0150178595f2 = 1;
    self.var_9d5b50c4ecfbf11f = settings.var_9d5b50c4ecfbf11f;
    if (istrue(settings.var_bedaf921804abf60)) {
        namespace_dd3b3452f1580da6::function_dca79eb8ca59cd89(undefined, settings.var_482961f7ad1339d0);
        self.var_bedaf921804abf60 = 1;
    }
    if (istrue(settings.var_919affbe236da4f2)) {
        namespace_f025828c76741718::function_e700d8944532443d(settings.meleedamage, settings.meleerange, settings.var_a98faeef4a48e76, settings.var_f42bfa0e947d5b2b, settings.var_658057c64a5cf3f1, settings.var_b9d7534a5c901857, settings.var_a18e13a8f1d43f20);
        self.var_919affbe236da4f2 = 1;
        self._blackboard.var_6b125300f4941ee8 = settings.var_289be7ed6a138df8;
        self._blackboard.var_6b93b99c8b1c38c2 = int(settings.var_333751673b2281dc);
    }
    if (istrue(settings.var_ffe6545012b26f)) {
        self._blackboard.var_285a93cddadff26a = settings.var_23731ac359988186;
        self._blackboard.var_8d29cdf5f3f3dd2c = settings.var_8d29cdf5f3f3dd2c;
        self._blackboard.var_fbb461f12b47eaa3 = settings.var_fbb461f12b47eaa3;
    }
    if (istrue(settings.var_a558a0b6b24bd680)) {
        self._blackboard.var_c406031fea1f3214 = settings.var_3a54f74770e61046;
        self._blackboard.var_90c1960e1413e514 = settings.var_68efc88ffa0aa2c2;
        self._blackboard.var_3596895c47e7f375 = gettime();
        self._blackboard.var_675726a12915960f = settings.var_b9a7a1856c211959;
    }
    if (istrue(settings.var_e71dc301c2240f6)) {
        namespace_d30035ccbf6888e3::function_77162a69f1bd973e(settings.var_d1ded916cc30d50c, settings.var_4f4c7fe3debb81dd);
    }
    self.var_4cd89215083d17cd = istrue(settings.var_4cd89215083d17cd);
    if (istrue(self.var_4cd89215083d17cd)) {
        self.var_d0ede1e06e380f47 = function_53c4c53197386572(settings.var_d0ede1e06e380f47, 0);
        self.var_6fddf68ea9876757 = function_53c4c53197386572(settings.var_6fddf68ea9876757, 0);
    }
    function_f1810da227cb50f9();
    self.fnisinstealthidle = &function_eb16af28fcfa61a9;
    self.fnisinstealthinvestigate = &function_eb16af28fcfa61a9;
    self.fnisinstealthhunt = &function_eb16af28fcfa61a9;
    self.fnisinstealthcombat = &function_eb16af28fcfa61a9;
    self.var_79c2de8443d5f950 = 1;
    self.pathenemyfightdist = 0;
    self.var_6c18812ecbd3b6ae = 0;
    if (issharedfuncdefined("game", "roundNumberDifficulty")) {
        self.var_d10755c0244b1937 = namespace_53fc9ddbb516e6e1::function_560b2e700ce084a2(self.origin);
    } else {
        self.var_d10755c0244b1937 = 1;
    }
    self._blackboard.var_beab2c28ad939b9c = self.var_d10755c0244b1937;
    self.basehealth = self.health;
    self.maxhealth = self.health;
    if (isdefined(settings.var_27c2dce37c7b4774)) {
        var_2930009730df8ef3 = function_2611d163b331ae1d(settings.var_27c2dce37c7b4774, self.var_d10755c0244b1937);
        if (isdefined(var_2930009730df8ef3) && var_2930009730df8ef3 > 0) {
            self.maxhealth = var_2930009730df8ef3;
            if (is_equal(self.subclass, "zombie_base")) {
                level.var_a37eac8a0d4242d9 = var_2930009730df8ef3;
            }
        }
    }
    self.health = self.maxhealth;
    self.var_878a9f80b05effb = settings.var_878a9f80b05effb;
    if (istrue(settings.var_c1410214e7e4f2d3)) {
        self function_5847240c0f9900f2(0);
    }
    self.var_20ab3a006aa7fc64 = 1;
    self.var_21a8839dd03e31cd = [];
    self.aicategory = settings.aicategory;
    /#
        assert(self.type == "zombie");
    #/
    self function_9f82c74eb1b7caf9(0, "entity");
    self._blackboard.var_46621811c1024018 = self.origin;
    self._blackboard.var_2ad5368672cc47ba = function_53c4c53197386572(settings.var_106f0eccad94d9fa, 0);
    self._blackboard.var_2af8408672f2a570 = function_53c4c53197386572(settings.var_3630efe5619a6064, 0);
    self._blackboard.var_b1f4f9a5cac14e29 = istrue(settings.var_b3c36504c09848c7);
    self._blackboard.var_1766d5cccf9b5670 = function_53c4c53197386572(settings.var_bd8a64af1be5eeb2, 0);
    self._blackboard.var_563d0f6368b6e3f3 = 200;
    if (isdefined(level.var_1a2b600a06ec21f4)) {
        self._blackboard.var_563d0f6368b6e3f3 = level.var_1a2b600a06ec21f4.var_563d0f6368b6e3f3;
        if (!istrue(level.var_1a2b600a06ec21f4.var_5a9f2dd6fa225e4c)) {
            self._blackboard.var_1766d5cccf9b5670 = 0;
        }
    }
    if (self._blackboard.var_1766d5cccf9b5670 > 0) {
        thread function_f23a7666ab0620e5();
    }
    if (isdefined(settings.var_691b16f55274b1c5) && settings.var_691b16f55274b1c5.size > 0) {
        foreach (weakness in settings.var_691b16f55274b1c5) {
            self.var_691b16f55274b1c5[weakness.elementtype] = 1;
        }
    }
    if (isdefined(self.var_47399212b3052720.var_fef5d84db3c8e7f7)) {
        self.var_47399212b3052720.var_e58a65b7a8f5973c = getscriptbundle(self.var_47399212b3052720.var_fef5d84db3c8e7f7);
    }
    self.var_3d1bbef280ea37b4 = 2500;
    self.fnshouldplaypainanim = &function_c9fd82b2c8668e86;
    if (isdefined(self) && !isdefined(self.spawn_time)) {
        self.spawn_time = gettime();
    }
    if (isdefined(self.var_47399212b3052720.var_9bc8186f76d68603)) {
        function_fe9929b42e5a99e4(self.var_47399212b3052720.var_9bc8186f76d68603);
    }
    function_afb445939fe4c1a4();
    self.var_e4f619e19ea53346 = self.var_47399212b3052720.var_4e3307a692b95a11;
    self function_8bbcaeb23a1512ef("all", 0);
    namespace_f5226b7f82a415af::initstealthfunctions();
    self.var_f36134ba18a9ef26 = 1;
    self.var_19fc729841f5b170 = 0;
    self.var_7a35ca824ce166e3 = 1;
    if (!istrue(self.var_47399212b3052720.var_f6fe19952d45625e)) {
        self.var_274e0c05ec5c89c0 = 0;
    }
    if (!istrue(self.var_47399212b3052720.var_e39c9bda85ea5d4e)) {
        self.var_afaeba29498ad423 = 0;
    }
    thread function_676d50c0fec21555();
    self.var_3119604b74dfdbbd = 1;
    self.script_pushable = 1;
    self.nododgemove = 1;
    if (istrue(self.var_47399212b3052720.var_7410c30336739540)) {
        self.var_7e3144ab69fefa03 = 1;
        if (istrue(self.var_47399212b3052720.var_204e8fd8424a6542)) {
            self.var_46ff71d1aa27d2ed = 1;
        }
    }
    self._blackboard.var_a401770f34af5de3 = 1;
    self._blackboard.var_115c06f1deba1f35 = 256;
    thread function_3d6406924924fc14();
    self.var_274d3a7704e351ef = 1;
    /#
        thread function_fc40130ab04a7929();
    #/
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad8
// Size: 0xee
function function_a343ac31ca854535(var_76525769b6e49a6c) {
    /#
        assert(isdefined(self.asm));
    #/
    /#
        assert(isdefined(self.var_47399212b3052720));
    #/
    settings = self.var_47399212b3052720;
    self.animname = self.var_ae3ea15396b65c1f;
    function_f155779fe50a7b53(settings, var_76525769b6e49a6c);
    if (istrue(settings.var_919affbe236da4f2)) {
        foreach (var_cbf22c9edb76e72d in settings.var_96e932e5fc805af8) {
            if (!isdefined(var_cbf22c9edb76e72d.movetype)) {
                continue;
            }
            namespace_f025828c76741718::function_1fc0eb1eb90c8dd0(var_cbf22c9edb76e72d.movetype, var_cbf22c9edb76e72d.var_73e6922977cd2c06);
        }
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbcd
// Size: 0x5d
function private function_3d6406924924fc14() {
    self endon("death");
    ent_flag_wait_or_timeout("zombie_asm_init_finished", 1);
    /#
        /#
            assertex(istrue(ent_flag("<unknown string>")), "<unknown string>");
        #/
    #/
    callback::callback("on_" + self.subclass + "_spawned");
    callback::callback("on_zombie_ai_spawned");
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc31
// Size: 0xf3
function private function_f155779fe50a7b53(settings, var_76525769b6e49a6c) {
    archetype = self.var_ae3ea15396b65c1f;
    flag_name = archetype + "_init_asm";
    if (flag(flag_name)) {
        return;
    }
    flag_set(flag_name);
    if (isdefined(var_76525769b6e49a6c)) {
        self [[ var_76525769b6e49a6c ]]();
    }
    foreach (var_cbf22c9edb76e72d in settings.var_96e932e5fc805af8) {
        if (!isdefined(var_cbf22c9edb76e72d.movetype)) {
            continue;
        }
        /#
            assert(isstring(var_cbf22c9edb76e72d.movetype));
        #/
        setspeedthreshold(archetype, var_cbf22c9edb76e72d.movetype, int(var_cbf22c9edb76e72d.speedthreshold));
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd2b
// Size: 0x175
function private on_ai_killed(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons) {
    var_d785e68a23ba79c1 = spawnstruct();
    var_d785e68a23ba79c1.einflictor = einflictor;
    var_d785e68a23ba79c1.eattacker = eattacker;
    var_d785e68a23ba79c1.idamage = idamage;
    var_d785e68a23ba79c1.smeansofdeath = smeansofdeath;
    var_d785e68a23ba79c1.objweapon = objweapon;
    var_d785e68a23ba79c1.vdir = vdir;
    var_d785e68a23ba79c1.shitloc = shitloc;
    var_d785e68a23ba79c1.timeoffset = timeoffset;
    var_d785e68a23ba79c1.deathanimduration = deathanimduration;
    var_d785e68a23ba79c1.dropweapons = dropweapons;
    var_d785e68a23ba79c1.origin = self.origin;
    var_d785e68a23ba79c1.var_a9cfabe3e558f7fa = self.var_a9cfabe3e558f7fa;
    callback::callback("on_zombie_ai_killed", var_d785e68a23ba79c1);
    if (istrue(self._blackboard.var_10cd2abcd916837e)) {
        if (istrue(self.magic_bullet_shield)) {
            namespace_6205bc7c5e394598::stop_magic_bullet_shield();
        }
        self.var_7e4b076a06c6df27 = 1;
    }
    onHumanoidAgentKilledCommon_SharedFunc(einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, 0);
    deathcleanup();
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea7
// Size: 0x4
function private function_eb16af28fcfa61a9() {
    return 0;
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb3
// Size: 0x14
function private function_c9fd82b2c8668e86() {
    if (!istrue(self.allowpain)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xecf
// Size: 0x32
function private function_3977ea1fbdfbb591() {
    var_7689e7ce29ebbc55 = !self codemoverequested();
    if (!is_equal(self.doavoidanceblocking, var_7689e7ce29ebbc55)) {
        self.doavoidanceblocking = var_7689e7ce29ebbc55;
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf08
// Size: 0x64
function private function_676d50c0fec21555() {
    self endon("death");
    if (!isdefined(level.var_e03e96f937e81fce)) {
        level.var_e03e96f937e81fce = function_e4c99b0f178ffb98("pushable", 1, level.framedurationseconds);
    }
    var_970684f6072a6d63 = 200;
    while (1) {
        function_f632348cbb773537(level.var_e03e96f937e81fce, self);
        function_3977ea1fbdfbb591();
        waitframe();
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf73
// Size: 0x4e
function private function_c4e2f024dbf10aad(params) {
    if (istrue(params.var_dba6bbe47bd81571) || istrue(params.var_4e1c44370f1101bb)) {
        var_477d74c7a0d5a871 = randomfloat(0.4);
        wait(var_477d74c7a0d5a871);
        function_2e4d3c67e63f83ac(5);
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfc8
// Size: 0x13
function private function_4f386f6608ed39a8(params) {
    clear_stun();
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfe2
// Size: 0x88
function private function_f23a7666ab0620e5() {
    self endon("death");
    while (1) {
        self waittill("tether_start");
        var_9970ea6c689d6247 = self.var_47399212b3052720.var_96e932e5fc805af8[self.var_47399212b3052720.var_96e932e5fc805af8.size - 1].movetype;
        function_f1e5805da192a1ef(var_9970ea6c689d6247, "tether", 4);
        thread function_fb5595a36d5dc970();
        self waittill("tether_end");
        function_f1e5805da192a1ef(undefined, "tether", 4);
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1071
// Size: 0x9e
function private function_fb5595a36d5dc970() {
    self endon("death");
    self endon("tether_end");
    var_8552285ba07a269f = min(self.maxhealth, self.health + self.maxhealth * 0.25);
    var_3d5f8437bc8dcc9f = 0.07;
    while (1) {
        var_ecb9a1ffec52e528 = int(clamp(self.maxhealth * var_3d5f8437bc8dcc9f, 0, var_8552285ba07a269f - self.health));
        self.health = self.health + var_ecb9a1ffec52e528;
        wait(1);
    }
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1116
// Size: 0x97
function private function_fc40130ab04a7929() {
    /#
        setdvarifuninitialized(@"hash_d95010ddcdec6c36", 1);
        setdvarifuninitialized(@"hash_3e9837d038eef96f", 1);
        if (getdvarint(@"hash_d95010ddcdec6c36", 1) <= 0) {
            self._blackboard.var_2ad5368672cc47ba = -1;
            self._blackboard.var_46621811c1024018 = self.origin;
        }
        if (getdvarint(@"hash_3e9837d038eef96f", 1) <= 0) {
            val::set("<unknown string>", "<unknown string>", 0);
        }
    #/
}

// Namespace namespace_be11b61c6eb3e656/namespace_cc1ead856ef7d1ee
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x11b4
// Size: 0x85
function private function_b7388b6432ebeb4e() {
    /#
        waitframe();
        if (isdefined(level.agent_definition)) {
            foreach (type, def in level.agent_definition) {
                if (issubstr(type, "<unknown string>")) {
                    /#
                        assertmsg("<unknown string>" + type + "<unknown string>");
                    #/
                }
            }
        }
    #/
}

