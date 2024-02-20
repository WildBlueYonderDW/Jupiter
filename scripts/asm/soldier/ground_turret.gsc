// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\asm\soldier\death.gsc;
#using scripts\common\ai.gsc;
#using scripts\engine\utility.gsc;
#using scripts\asm\soldier\pain.gsc;

#namespace namespace_c5c7c5b47448b0d1;

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb5
// Size: 0x56
function aigroundturret_shouldcompletedismount(asmname, statename, var_f2b19b25d457c2a6, params) {
    turret = self._blackboard.aigroundturretref;
    /#
        assert(isdefined(turret));
    #/
    turret cleartargetentity();
    return 1;
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x113
// Size: 0x58
function private function_9808f5689a4a7b1a() {
    turret = self._blackboard.aigroundturretref;
    /#
        assert(isdefined(turret));
    #/
    turret.inuse = 0;
    turret setturretteam("neutral");
    turret setmode("manual");
    self stopuseturret();
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x172
// Size: 0x56
function playanim_mountturret(asmname, statename, params) {
    turret = self._blackboard.aigroundturretref;
    /#
        assert(isdefined(turret));
    #/
    aigroundturret_mountcompleted();
    asm_playanimstate(asmname, statename, params);
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf
// Size: 0xf8
function playanim_aioperateturret(asmname, statename, params) {
    turret = self._blackboard.aigroundturretref;
    /#
        assert(isdefined(turret));
    #/
    origin = turret gettagorigin("tag_gunner");
    angles = turret gettagangles("tag_gunner");
    if (self islinked()) {
        self unlink();
    }
    turret.inuse = 1;
    turret setturretteam(self.team);
    if (isdefined(turret.var_b81564300a56532b)) {
        turret setmode(turret.var_b81564300a56532b);
    } else {
        turret setmode("auto_nonai");
    }
    self forceteleport(origin, angles);
    self linktoblendtotag(turret, "tag_gunner", 0);
    self useturret(turret);
    asm_playanimstate(asmname, statename, params);
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce
// Size: 0x2d
function playanim_aibegindismountturret(asmname, statename, params) {
    function_9808f5689a4a7b1a();
    asm_playanimstate(asmname, statename, params);
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x302
// Size: 0x3d
function playanim_aidismountturret(asmname, statename, params) {
    if (self islinked()) {
        self unlink();
    }
    aigroundturret_dismountcompleted();
    asm_playanimstate(asmname, statename, params);
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x346
// Size: 0x6e
function playdeathanim_groundturret(asmname, statename, params) {
    turret = self._blackboard.aigroundturretref;
    if (isdefined(turret)) {
        turret.inuse = 0;
        turret setturretteam("neutral");
        turret setmode("manual");
    }
    playdeathanim(asmname, statename, params);
}

// Namespace namespace_c5c7c5b47448b0d1/namespace_8ae1cb9ef321cd37
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb
// Size: 0x2d
function function_e41fea1df987324a(asmname, statename, params) {
    function_9808f5689a4a7b1a();
    namespace_7eac13b458714f13::playpainanim(asmname, statename, params);
}

