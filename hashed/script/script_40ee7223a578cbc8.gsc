// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_7ff3a914e6c698c5;
#using script_4c770a9a4ad7659c;
#using scripts\engine\math.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_ce6c437f7a6dedb6;

// Namespace namespace_ce6c437f7a6dedb6/namespace_e8d5850900a5d8dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x7b
function function_306feec3952fc2ef() {
    /#
        assert(isdefined(self.grenadeweapon), "Ranged attack need to set grenade weapon");
    #/
    if (isplayer(self.var_c24f43a7d0d8d195)) {
        if (self.var_c24f43a7d0d8d195 function_4c108309dc0d7fd2() > self._blackboard.var_4a850e88a81da5f9) {
            self._blackboard.var_6b0939cf3fd5d7a1 = 0;
            return;
        }
    }
    function_ac90fa5cc0a80298("ranged_attack_in");
    thread function_198bfdd7fc72700a();
}

// Namespace namespace_ce6c437f7a6dedb6/namespace_e8d5850900a5d8dc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x163
function private function_198bfdd7fc72700a() {
    self endon("death");
    self notify("terminate_ranged_attack");
    self endon("terminate_ranged_attack");
    thread function_c2de30ecd5f08178();
    self waittill("gutgrab");
    /#
        assertex(istrue(self._blackboard.var_285a93cddadff26a), "Arms Used is not set to true within zombieaisettings");
    #/
    self.var_35bcbbe0ba774121 = ter_op(self._blackboard.var_d15d23565f5a60a1 == 0, "tag_accessory_left", "tag_accessory_right");
    if (isdefined(self.var_47399212b3052720.var_e2b91916dda5f27f) && self.var_47399212b3052720.var_e2b91916dda5f27f.size > 0) {
        self.var_94b992c2411178e0 = random(self.var_47399212b3052720.var_e2b91916dda5f27f).modelname;
        self attach(self.var_94b992c2411178e0, self.var_35bcbbe0ba774121);
    }
    self waittill("gutgo");
    target = self.var_c24f43a7d0d8d195;
    if (isent(target)) {
        goto LOC_00000136;
    }
    projectile_velocity = self function_66847aa1462af647(undefined, target, 1, self._blackboard.var_d15d23565f5a60a1);
    projectile_velocity = function_53c4c53197386572(projectile_velocity, self._blackboard.var_acff9536dc447bac);
    function_7ed594e1ada9063e(projectile_velocity);
}

// Namespace namespace_ce6c437f7a6dedb6/namespace_e8d5850900a5d8dc
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33e
// Size: 0xc2
function private function_7ed594e1ada9063e(projectile_velocity) {
    projectile_timeout = 8;
    var_94b992c2411178e0 = self.var_94b992c2411178e0;
    if (isdefined(self.var_94b992c2411178e0)) {
        self detach(self.var_94b992c2411178e0, self.var_35bcbbe0ba774121);
        self.var_94b992c2411178e0 = undefined;
    }
    if (!isdefined(projectile_velocity)) {
        return;
    }
    start_pos = self gettagorigin(self.var_35bcbbe0ba774121);
    grenade = magicgrenademanual(self.grenadeweapon, start_pos, projectile_velocity, projectile_timeout, self);
    grenade.angles = self gettagangles(self.var_35bcbbe0ba774121);
    if (isdefined(var_94b992c2411178e0)) {
        grenade setmodel(var_94b992c2411178e0);
    }
}

// Namespace namespace_ce6c437f7a6dedb6/namespace_e8d5850900a5d8dc
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x407
// Size: 0x9a
function private function_c2de30ecd5f08178() {
    var_41f4445da3ba6566 = self.var_c24f43a7d0d8d195;
    if (isplayer(var_41f4445da3ba6566)) {
        var_41f4445da3ba6566 function_e89f2bdb307f137e();
    }
    waittill_any_2("terminate_ranged_attack", "death");
    if (isdefined(self)) {
        if (isdefined(self.var_94b992c2411178e0)) {
            self detach(self.var_94b992c2411178e0, self.var_35bcbbe0ba774121);
        } else if (!isalive(self)) {
            self detachall();
        }
        self.var_94b992c2411178e0 = undefined;
        self.var_35bcbbe0ba774121 = undefined;
    }
    if (isplayer(var_41f4445da3ba6566)) {
        var_41f4445da3ba6566 function_a33073d6fd58e58e();
    }
}

