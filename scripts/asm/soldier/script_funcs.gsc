// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using script_3433ee6b63c7e243;
#using scripts\asm\soldier\death.gsc;
#using scripts\asm\soldier\melee.gsc;
#using script_13d1c402f1421c35;
#using scripts\common\gameskill.gsc;
#using scripts\anim\notetracks.gsc;

#namespace namespace_16e2a34e24c32e5e;

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x875
// Size: 0x21b
function soldier_init(asmname, statename, params) {
    /#
        assert(isdefined(self.asm));
    #/
    self.asm.footsteps = spawnstruct();
    self.asm.footsteps.foot = "invalid";
    self.asm.footsteps.time = 0;
    self.asm.customdata = spawnstruct();
    self.asm.gestures = spawnstruct();
    self.defaultturnthreshold = 59;
    self.anglelerprate = 100;
    if (!isdefined(self.var_98add129a7ecb962)) {
        self.var_98add129a7ecb962 = 1;
    }
    if (isdefined(self.fnasm_initfingerposes)) {
        self thread [[ self.fnasm_initfingerposes ]]();
    }
    self.fnhelmetpop = &namespace_f0a0c13f724da4b::helmetpop;
    initaimlimits(asmname);
    if (self.var_ae3ea15396b65c1f == "ai_animation_sequencer" || self.var_ae3ea15396b65c1f == "ai_animation_sequencer_combat_loop" || self.var_ae3ea15396b65c1f == "ai_animation_sequencer_additive_poses") {
        goto LOC_0000017d;
    }
    initanimspeedthresholds_soldier(self.basearchetype);
    initanimspeedthresholds_soldier(self.var_ae3ea15396b65c1f);
LOC_0000017d:
    if (self findoverridearchetype("default") == "rebel") {
        self.var_ed5ff3bcb60f394 = 1;
    }
    self.var_54b40088c45bf08d = 1;
    if (self isscriptable()) {
        thread initscriptable();
    }
    self function_62004d7561fd321e();
    weapclass = weaponclass(self.weapon);
    if (weapclass == "mg") {
        self.combatmode = "cover_lmg";
    }
    if (!isdefined(self findoverridearchetype("weapon"))) {
        updateweaponarchetype(weapclass);
    }
    if (!isdefined(self.var_9087e842f157d27c)) {
        self.var_9087e842f157d27c = &namespace_98502514a7e5f809::function_6cde2d3ae248271d;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa97
// Size: 0x28
function initscriptable() {
    self endon("death");
    namespace_3c37cb17ade254d::flag_wait("scriptables_ready");
    self setscriptablepartstate("notetrack_handler", "active", 0);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac6
// Size: 0x4bf
function initaimlimits(asmname) {
    if (!isdefined(level.combataimlimits)) {
        level.combataimlimits = [];
        level.franticaimlimits = [];
        level.aimlimitstatemappings = [];
    }
    if (!isdefined(level.combataimlimits[asmname])) {
        combataimlimits = [];
        franticaimlimits = [];
        var_4c3baabe5686a741 = [];
        combataimlimits["exposed_idle"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        franticaimlimits["exposed_idle"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["down"] = 15;
        combataimlimits["cover_crouch_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["down"] = 15;
        franticaimlimits["cover_crouch_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        franticaimlimits["cover_crouch_aim"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["right"] = -15;
        combataimlimits["cover_left_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["right"] = -15;
        franticaimlimits["cover_left_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["right"] = -15;
        combataimlimits["cover_left_crouch_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["right"] = -15;
        franticaimlimits["cover_left_crouch_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["left"] = 15;
        combataimlimits["cover_right_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["down"] = 37;
        var_4c3baabe5686a741["left"] = 24;
        franticaimlimits["cover_right_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["left"] = 25;
        combataimlimits["cover_right_crouch_lean"] = var_4c3baabe5686a741;
        var_4c3baabe5686a741 = [];
        var_4c3baabe5686a741["left"] = 15;
        franticaimlimits["cover_right_crouch_lean"] = var_4c3baabe5686a741;
        level.combataimlimits[asmname] = combataimlimits;
        level.franticaimlimits[asmname] = franticaimlimits;
    }
    if (!isdefined(level.aimlimitstatemappings[asmname])) {
        var_26893ce84a67261 = [];
        var_26893ce84a67261["cover_stand_exposed"] = "cover_stand_exposed";
        var_26893ce84a67261["cover_stand_hide_to_exposed"] = "cover_stand_exposed";
        var_26893ce84a67261["cover_stand_full_exposed"] = "exposed_idle";
        var_26893ce84a67261["cover_stand_hide_to_full_exposed"] = "exposed_idle";
        var_26893ce84a67261["cover_stand_to_exposed_idle"] = "exposed_idle";
        var_26893ce84a67261["wall_run_exit"] = "exposed_idle";
        var_26893ce84a67261["wall_run_continue"] = "exposed_idle";
        var_26893ce84a67261["wall_run_left_shoot"] = "exposed_idle";
        var_26893ce84a67261["wall_run_right_shoot"] = "exposed_idle";
        var_26893ce84a67261["wall_run_attach_left_shoot"] = "exposed_idle";
        var_26893ce84a67261["wall_run_attach_right_shoot"] = "exposed_idle";
        var_26893ce84a67261["cover_crouch_hide_to_stand"] = "exposed_idle";
        var_26893ce84a67261["cover_crouch_hide_to_aim"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_hide_to_right"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_hide_to_left"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_hide_to_lean"] = "cover_crouch_lean";
        var_26893ce84a67261["cover_crouch_aim"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_lean"] = "cover_crouch_lean";
        var_26893ce84a67261["cover_crouch_exposed_left"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_exposed_right"] = "cover_crouch_aim";
        var_26893ce84a67261["cover_crouch_stand"] = "exposed_idle";
        var_26893ce84a67261["cover_crouch_to_exposed_idle"] = "exposed_idle";
        var_26893ce84a67261["cover_right_exposed_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_hide_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_exposed_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_hide_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_a_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_b_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_exposed_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_exposed_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_hide_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_hide_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_a_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_right_crouch_b_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_right_lean"] = "cover_right_lean";
        var_26893ce84a67261["cover_right_hide_to_lean"] = "cover_right_lean";
        var_26893ce84a67261["cover_right_crouch_hide_to_lean"] = "cover_right_crouch_lean";
        var_26893ce84a67261["cover_right_crouch_lean"] = "cover_right_crouch_lean";
        var_26893ce84a67261["cover_right_to_exposed_idle"] = "exposed_idle";
        var_26893ce84a67261["cover_left_exposed_a"] = "exposed_idle";
        var_26893ce84a67261["cover_left_exposed_b"] = "exposed_idle";
        var_26893ce84a67261["cover_left_hide_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_left_hide_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_left_a_to_b"] = "exposed_idle";
        var_26893ce84a67261["cover_left_b_to_a"] = "exposed_idle";
        var_26893ce84a67261["cover_left_hide_to_lean"] = "cover_left_lean";
        var_26893ce84a67261["cover_left_lean"] = "cover_left_lean";
        var_26893ce84a67261["cover_left_crouch_hide_to_lean"] = "cover_left_crouch_lean";
        var_26893ce84a67261["cover_left_crouch_lean"] = "cover_left_crouch_lean";
        var_26893ce84a67261["cover_left_to_exposed_idle"] = "exposed_idle";
        var_26893ce84a67261["cqb_idle"] = "exposed_idle";
        var_26893ce84a67261["cqb_stand_loop"] = "exposed_idle";
        var_26893ce84a67261["cqb_stand_strafe_loop"] = "exposed_idle";
        var_26893ce84a67261["stand_run_strafe_loop"] = "exposed_idle";
        var_26893ce84a67261["exposed_reload"] = "exposed_idle";
        var_26893ce84a67261["exposed_weaponswitch"] = "exposed_idle";
        var_26893ce84a67261["exposed_stand_turn"] = "exposed_idle";
        var_26893ce84a67261["exposed_idle"] = "exposed_idle";
        var_26893ce84a67261["exposed_prone"] = "exposed_idle";
        var_26893ce84a67261["exposed_stand_infantry_reaction"] = "exposed_idle";
        level.aimlimitstatemappings[asmname] = var_26893ce84a67261;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8c
// Size: 0xd4
function initanimspeedthresholds_soldier(var_ae3ea15396b65c1f) {
    if (istrue(anim.var_432836e99816347c[var_ae3ea15396b65c1f])) {
        return;
    }
    if (animspeedthresholdsexist(var_ae3ea15396b65c1f)) {
        return;
    }
    if (var_ae3ea15396b65c1f == "boss" || var_ae3ea15396b65c1f == "boss2") {
        setspeedthreshold(var_ae3ea15396b65c1f, "shuffle", 30);
    } else {
        setspeedthreshold(var_ae3ea15396b65c1f, "shuffle", 23);
    }
    if (var_ae3ea15396b65c1f == "guard_01" || var_ae3ea15396b65c1f == "guard_02") {
        setspeedthreshold(var_ae3ea15396b65c1f, "walk", 36);
    } else {
        setspeedthreshold(var_ae3ea15396b65c1f, "walk", 65);
    }
    setspeedthreshold(var_ae3ea15396b65c1f, "fast", 104);
    setspeedthreshold(var_ae3ea15396b65c1f, "jog", 178);
    setspeedthreshold(var_ae3ea15396b65c1f, "run", 210);
    setspeedthreshold(var_ae3ea15396b65c1f, "sprint", 250);
    anim.var_432836e99816347c[var_ae3ea15396b65c1f] = 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1067
// Size: 0x90
function needtoturn3d(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (istrue(self.matchexposednodeorientation) && isdefined(self.node)) {
        return 0;
    }
    yaw = getturndesiredyaw3d();
    if (abs(yaw) > self.turnthreshold) {
        return 1;
    }
    pitch = getturndesiredpitch3d();
    if (abs(pitch) > self.pitchturnthreshold) {
        return 1;
    }
    return 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ff
// Size: 0x16e
function getturndesiredyaw() {
    if (isdefined(self.desiredturnyaw)) {
        return self.desiredturnyaw;
    }
    predicttime = 0.25;
    shootent = undefined;
    shootpos = undefined;
    if (self bb_shootparamsvalid()) {
        if (isdefined(self._blackboard.shootparams_pos)) {
            shootpos = self._blackboard.shootparams_pos;
        } else if (isdefined(self._blackboard.shootparams_ent)) {
            shootent = self._blackboard.shootparams_ent;
        }
    } else if (isdefined(self.smartfacingpos)) {
        shootpos = self.smartfacingpos;
    }
    if (!isdefined(shootpos) && isdefined(self.node) && self.node.type == "Exposed" && distancesquared(self.node.origin, self.origin) < 36) {
        return angleclamp180(self.node.angles[1] - self.angles[1]);
    }
    if (isdefined(shootent) && !issentient(shootent)) {
        predicttime = 1.5;
    }
    desiredyaw = getpredictedaimyawtoshootentorpos(predicttime, shootent, shootpos);
    return desiredyaw;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1275
// Size: 0xd5
function getturndesiredyaw3d() {
    predicttime = 0.25;
    shootent = undefined;
    shootpos = undefined;
    if (self bb_shootparamsvalid()) {
        if (isdefined(self._blackboard.shootparams_ent)) {
            shootent = self._blackboard.shootparams_ent;
        } else if (isdefined(self._blackboard.shootparams_pos)) {
            shootpos = self._blackboard.shootparams_pos;
        }
    } else if (isdefined(self.enemy)) {
        shootent = self.enemy;
    }
    if (isdefined(shootent) && !issentient(shootent)) {
        predicttime = 1.5;
    }
    desiredyaw = getpredictedaimyawtoshootentorpos3d(predicttime, shootent, shootpos);
    return desiredyaw;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1352
// Size: 0xd5
function getturndesiredpitch3d() {
    predicttime = 0.25;
    shootent = undefined;
    shootpos = undefined;
    if (self bb_shootparamsvalid()) {
        if (isdefined(self._blackboard.shootparams_ent)) {
            shootent = self._blackboard.shootparams_ent;
        } else if (isdefined(self._blackboard.shootparams_pos)) {
            shootpos = self._blackboard.shootparams_pos;
        }
    } else if (isdefined(self.enemy)) {
        shootent = self.enemy;
    }
    if (isdefined(shootent) && !issentient(shootent)) {
        predicttime = 1.5;
    }
    var_98afbd56092f6f05 = getpredictedaimpitchtoshootentorpos3d(predicttime, shootent, shootpos);
    return var_98afbd56092f6f05;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x142f
// Size: 0x16b
function chooseturnanim3d(asmname, statename, params) {
    desiredyaw = getturndesiredyaw3d();
    var_98afbd56092f6f05 = getturndesiredpitch3d();
    if (abs(desiredyaw) > self.turnthreshold && abs(desiredyaw) > abs(var_98afbd56092f6f05)) {
        if (desiredyaw < 0) {
            direction = "right";
        } else {
            direction = "left";
        }
        desiredyaw = abs(desiredyaw);
        angle = 0;
        if (desiredyaw > 157.5) {
            angle = 180;
        } else if (desiredyaw > 112.5) {
            angle = 135;
        } else if (desiredyaw > 67.5) {
            angle = 90;
        } else {
            angle = 45;
        }
        animalias = direction + "_" + angle;
        turnanim = asm_lookupanimfromalias(statename, animalias);
        return turnanim;
    } else {
        if (var_98afbd56092f6f05 < 0) {
            direction = "up";
        } else {
            direction = "down";
        }
        var_98afbd56092f6f05 = abs(var_98afbd56092f6f05);
        angle = 0;
        if (var_98afbd56092f6f05 > 157.5) {
            angle = 180;
        } else if (var_98afbd56092f6f05 > 112.5) {
            angle = 135;
        } else if (var_98afbd56092f6f05 > 67.5) {
            angle = 90;
        } else {
            angle = 45;
        }
        animalias = direction + "_" + angle;
        turnanim = asm_lookupanimfromalias(statename, animalias);
        return turnanim;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x15a1
// Size: 0x83
function choosecrouchturnanim(asmname, statename, params) {
    desiredyaw = getturndesiredyaw();
    if (desiredyaw < -135) {
        alias = "2r";
    } else if (desiredyaw > 135) {
        alias = "2l";
    } else if (desiredyaw < 0) {
        alias = "6";
    } else {
        alias = "4";
    }
    turnanim = asm_lookupanimfromalias(statename, alias);
    return turnanim;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162c
// Size: 0x1be
function reload_cleanup(asmname, statename, params) {
    nullweapon = nullweapon();
    weap = self.var_1e61bb39def2d99d;
    self.var_1e61bb39def2d99d = nullweapon;
    if (!isdefined(self.weaponinfo)) {
        return;
    }
    var_78e527f9f68f891e = weap != nullweapon && isdefined(self.weapon) && weap == self.weapon;
    if (weap == nullweapon) {
        weap = self.weapon;
    }
    weaponname = getcompleteweaponname(weap);
    if (!isdefined(self.weaponinfo[weaponname])) {
        return;
    }
    if (!asm_eventfired(asmname, "drop clip")) {
        return;
    }
    if (self.weaponinfo[weaponname].useclip) {
        clipmodel = getweaponclipmodel(weap);
        if (isdefined(clipmodel)) {
            var_5a578a2482e72059 = asm_eventfired(asmname, "attach clip left") || asm_eventfired(asmname, "attach clip right");
            var_7cb5a062f767fb6f = asm_eventfired(asmname, "detach clip left") || asm_eventfired(asmname, "detach clip right") || asm_eventfired(asmname, "detach clip nohand");
            if (!var_5a578a2482e72059) {
                self notify("abort_reload");
            } else if (var_5a578a2482e72059 && !var_7cb5a062f767fb6f) {
                if (asm_eventfired(asmname, "attach clip left")) {
                    tagname = "tag_accessory_left";
                } else {
                    tagname = "tag_accessory_right";
                }
                self detach(clipmodel, tagname);
                self notify("clip_detached");
                if (var_78e527f9f68f891e) {
                    showweaponmagattachment(weaponname);
                }
            }
        }
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x17f1
// Size: 0x27
function terminateexposedprone(asmname, statename, params) {
    self.pushable = 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x181f
// Size: 0x26
function terminateexposedidleaimdown(asmname, statename, params) {
    self.aimingdown = 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x184c
// Size: 0x26
function terminateexposedcrouchaimdown(asmname, statename, params) {
    self.aimingdown = 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1879
// Size: 0x41
function shouldfaceenemyinexposed() {
    if (isdefined(self.pathgoalpos)) {
        return 0;
    }
    return isdefined(self.enemy) && isplayer(self.enemy) && self cansee(self.enemy);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18c2
// Size: 0x95
function playanim_weaponswitch(asmname, statename, params) {
    self endon(statename + "_finished");
    weapclass = bb_getrequestedweapon();
    animname = asm_getanim(asmname, statename);
    animrate = namespace_ba1fcf33692e2fad::fasteranimspeed();
    self aisetanim(statename, animname, animrate);
    asm_playfacialanim(asmname, statename, asm_getxanim(statename, animname));
    asm_donotetracks(asmname, statename, asm_getnotehandler(asmname, statename));
    self notify("switched_to_sidearm");
    namespace_2f36c2cc5a44d845::didsomethingotherthanshooting();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x195e
// Size: 0x3d
function terminate_weaponswitch(asmname, statename, params) {
    weapclass = weaponclass(self.weapon);
    updateweaponarchetype(weapclass);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a2
// Size: 0x183
function playturnanim_turnanimanglefixup(var_19b744b1cdee4bcb, statename) {
    self endon("death");
    self endon(statename + "_finished");
    enemy = self.enemy;
    enemy endon("death");
    animlength = getanimlength(var_19b744b1cdee4bcb);
    if (animhasnotetrack(var_19b744b1cdee4bcb, "start_aim")) {
        var_6aa303aab36ea0ea = getnotetracktimes(var_19b744b1cdee4bcb, "start_aim");
        animlength = animlength * var_6aa303aab36ea0ea[0];
    } else if (animhasnotetrack(var_19b744b1cdee4bcb, "finish")) {
        var_6aa303aab36ea0ea = getnotetracktimes(var_19b744b1cdee4bcb, "finish");
        animlength = animlength * var_6aa303aab36ea0ea[0];
    }
    numframes = int(animlength * 20);
    var_c3ddcd0c37a60c5 = numframes;
    while (var_c3ddcd0c37a60c5 > 0) {
        var_6bdb8335862f56ee = 1 / var_c3ddcd0c37a60c5;
        yawtoenemy = getyawtospot(enemy.origin);
        self.stepoutyaw = angleclamp180(self.angles[1] + yawtoenemy);
        currentanimtime = self aigetanimtime(var_19b744b1cdee4bcb);
        var_993a8f9635e274cf = getangledelta(var_19b744b1cdee4bcb, currentanimtime, 1);
        var_b1cbdf386b2c0dea = angleclamp180(yawtoenemy - var_993a8f9635e274cf);
        self orientmode("face angle", angleclamp(self.angles[1] + var_b1cbdf386b2c0dea * var_6bdb8335862f56ee));
        var_c3ddcd0c37a60c5--;
        wait(0.05);
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2c
// Size: 0x8f
function shouldsnaptocover_checktype(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (bb_moverequested()) {
        return 0;
    }
    if (!isatcovernode()) {
        return 0;
    }
    if (!isdefined(self.node)) {
        return 0;
    }
    if (isdefined(self.primaryweapon) && namespace_7843e1029b5c80e::isusingsidearm() && weaponclass(self.primaryweapon) != "mg") {
        return 0;
    }
    /#
        assert(isdefined(params));
    #/
    return isarrivaltype(asmname, statename, var_f2b19b25d457c2a6, params);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc3
// Size: 0x15
function reloadnotehandler(note) {
    namespace_a4081f3d58d76916::notetrack_prefix_handler(note);
    return undefined;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1be0
// Size: 0x31
function function_6ddc94e521201a49(asmname, statename, params) {
    self._blackboard.var_74f8f2b8eff7c7f = 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1c18
// Size: 0x4a
function function_9d9a4c83d3a8b338(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (!isdefined(self.var_dc73f89fdcffb56f)) {
        return 1;
    }
    if (gettime() < self.var_dc73f89fdcffb56f) {
        return 0;
    }
    return 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c6a
// Size: 0x86
function facegoalthread_newenemyreaction(statename, var_1402d870c92df1af) {
    self notify("FaceGoalThread");
    self endon("FaceGoalThread");
    self endon("death");
    self endon(statename + "_finished");
    while (1) {
        multiplier = 0.25;
        var_fd4e44b47427d5c6 = angleclamp180(var_1402d870c92df1af - self.angles[1]);
        self orientmode("face angle", self.angles[1] + var_fd4e44b47427d5c6 * multiplier);
        waitframe();
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cf7
// Size: 0x66
function handlefacegoalnotetrack_newenemyreaction(statename, note, var_4fc502b1a10006cc) {
    /#
        assert(isdefined(var_4fc502b1a10006cc));
    #/
    if (note == "face_goal") {
        var_63cc85541246c7b4 = var_4fc502b1a10006cc - self.origin;
        var_1402d870c92df1af = vectortoyaw(var_63cc85541246c7b4);
        thread facegoalthread_newenemyreaction(statename, var_1402d870c92df1af);
        return 1;
    }
    return 0;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d65
// Size: 0xcb
function playanim_newenemyreaction(asmname, statename, params) {
    self endon(statename + "_finished");
    pushdisabledgunpose();
    var_93a2c35bc9547955 = self asmgetanim(asmname, statename);
    /#
        assert(isdefined(var_93a2c35bc9547955));
    #/
    var_9319232e93b989ed = asm_getxanim(statename, var_93a2c35bc9547955);
    self aisetanim(statename, var_93a2c35bc9547955);
    var_4fc502b1a10006cc = self lastknownpos(self.enemy);
    thread playturnanim_turnanimanglefixup(var_9319232e93b989ed, statename);
    asm_donotetrackswithinterceptor(asmname, statename, &handlefacegoalnotetrack_newenemyreaction, var_4fc502b1a10006cc);
    if (isdefined(self.enemy) && self cansee(self.enemy)) {
        self.remainexposedendtime = gettime() + 2000;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e37
// Size: 0xb4
function chooseanim_playerpushed(asmname, statename, params) {
    movedir = asm_getephemeraleventdata("player_pushed", "player_pushed");
    var_d5be0521e83df112 = vectornormalize(movedir);
    targetangles = vectortoangles(var_d5be0521e83df112);
    targetyaw = angleclamp180(targetangles[1] - self.angles[1]);
    angleindex = namespace_bf5a1761a8d1bb07::yawdiffto2468(targetyaw);
    aliasname = "pushed_" + angleindex;
    turnanim = asm_lookupanimfromalias(statename, aliasname);
    return turnanim;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef3
// Size: 0x74
function terminate_casualkiller(asmname, statename, params) {
    self setbasearchetype(self findoverridearchetype("default"));
    self clearoverridearchetype("demeanor", 0, 1);
    self.newenemyreaction = 0;
    self.forcenewenemyreaction = 0;
    self notify("leaveCasualKiller");
    self.leavecasualkiller = 0;
    self.casualkiller = 0;
    self setdefaultaimlimits();
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6e
// Size: 0x30
function pushdisabledgunpose() {
    if (isdefined(self.gunposeoverride)) {
        self.stashedgunposeoverride = self.gunposeoverride;
    }
    self.gunposeoverride = "disable";
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa5
// Size: 0x39
function popdisabledgunpose() {
    if (isdefined(self.stashedgunposeoverride)) {
        self.gunposeoverride = self.stashedgunposeoverride;
        self.stashedgunposeoverride = undefined;
    } else {
        self.gunposeoverride = undefined;
    }
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe5
// Size: 0x3f
function function_e9cdfb92cc489acb(asmname, statename, params) {
    self function_f662e31df8183bf8(self.origin, self.angles);
    loopanim(asmname, statename, params);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x202b
// Size: 0x5a
function function_33294352d1956570(asmname, statename, var_f2b19b25d457c2a6, params) {
    if (istrue(self.var_9dc04ef5e55f3574)) {
        self function_1c339daaba3f71db(1);
        utility::lookatentity(self.var_c7cd5e7e287a7df8);
    }
    return asm_lookupanimfromalias(statename, self.var_97ba98a2aca4a96d);
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x208d
// Size: 0x41
function function_78fcdbc229ec648c(asmname, statename, var_f2b19b25d457c2a6, params) {
    self function_1c339daaba3f71db(0);
    self.var_be159be38e485344 = 0;
    self.var_1f391695bca4a279 = 1;
}

// Namespace namespace_16e2a34e24c32e5e/namespace_1a7cea57c200f504
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x20d5
// Size: 0x4d
function forwardpushevent(asmname, statename, var_f2b19b25d457c2a6, params) {
    movedir = asm_geteventdata(asmname, "player_pushed");
    asm_fireephemeralevent("player_pushed", "player_pushed", movedir);
}

