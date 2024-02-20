// mwiii decomp prototype
#using scripts\aitypes\bt_util.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\aitypes\combat.gsc;

#namespace weapon;

// Namespace weapon/namespace_38032b73dae709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6
// Size: 0x9a
function initweaponarray() {
    self.weapons = [];
    if (!isnullweapon(self.primaryweapon)) {
        self.weapons[self.weapons.size] = self.primaryweapon;
    }
    if (!isnullweapon(self.secondaryweapon)) {
        self.weapons[self.weapons.size] = self.secondaryweapon;
    }
    if (!isnullweapon(self.sidearm)) {
        self.weapons[self.weapons.size] = self.sidearm;
    }
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x157
// Size: 0xca
function choosebestweapon() {
    if (istrue(self.forcesidearm)) {
        return "pistol";
    }
    if (istrue(self._blackboard.droppedlmg)) {
        return "pistol";
    }
    bestscore = 0;
    var_21c4c58489d139f5 = undefined;
    foreach (weapon in self.weapons) {
        weapclass = weaponclass(weapon);
        score = evalweaponscore(weapclass, weapon);
        if (score > bestscore) {
            bestscore = score;
            var_21c4c58489d139f5 = weapclass;
        }
    }
    return var_21c4c58489d139f5;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x48
function getsidearmdist() {
    var_8465f7779f8a19a = isusingsidearm();
    var_448c66ddc99a9acc = 409;
    var_ee026fc5e0f3f95a = self function_e8ca4080d02a0bb4(0);
    if (var_ee026fc5e0f3f95a) {
        var_448c66ddc99a9acc = 512;
    }
    if (var_8465f7779f8a19a) {
        var_448c66ddc99a9acc = var_448c66ddc99a9acc + 36;
    }
    return var_448c66ddc99a9acc;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x82
function withinswitchtopistoldist() {
    if (isdefined(self.enemy) && isdefined(self.sidearm) && !isnullweapon(self.sidearm) && !istrue(self.disablepistol)) {
        var_448c66ddc99a9acc = getsidearmdist();
        disttoenemysq = distancesquared(self.origin, self.enemy.origin);
        return (disttoenemysq < var_448c66ddc99a9acc * var_448c66ddc99a9acc);
    }
    return 0;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x303
// Size: 0x170
function evalweaponscore(weapclass, weapon) {
    if (weapclass == "pistol") {
        if (weaponclass(self.weapon) == "rocketlauncher" && self.rocketammo <= 0) {
            return 1000;
        }
        if (canswitchtosidearm(undefined) != anim.success) {
            return 0;
        }
        covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
        if (usingmg() && isdefined(covernode) && !self iscovervalidagainstenemy(covernode)) {
            return 1000;
        }
        if (checkcoverforsidearm(undefined) != anim.success) {
            return 0;
        }
        var_c6e04dc8d8240b82 = withinswitchtopistoldist();
        var_ee026fc5e0f3f95a = self function_e8ca4080d02a0bb4(0);
        if (var_c6e04dc8d8240b82) {
            /#
                assert(isdefined(self.enemy));
            #/
            disttoenemysq = distancesquared(self.origin, self.enemy.origin);
            if (var_ee026fc5e0f3f95a) {
                return 1000;
            }
            if (usingmg() && disttoenemysq < 16384) {
                return 1000;
            }
            if (isusingprimary() && namespace_17c3bf83be64b180::hasatleastammo(0.1)) {
                return 10;
            }
            return 1000;
        }
        return 0;
    } else if (weapclass == "rocketlauncher") {
        if (self.rocketammo <= 0) {
            return 0;
        }
        return 100;
    } else {
        return 100;
    }
    return 100;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47b
// Size: 0x28
function issniper(task) {
    if (self function_e8ca4080d02a0bb4()) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab
// Size: 0x47
function usingsidearm(task) {
    if (self.weapon == self.sidearm && !isnullweapon(self.weapon)) {
        return anim.success;
    }
    return anim.failure;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4fa
// Size: 0x86
function shouldswitchtosidearm(task) {
    if (usingsidearm(task) == anim.success) {
        return anim.failure;
    }
    if (istrue(self.forcesidearm)) {
        return anim.success;
    }
    if (canswitchtosidearm(task) != anim.success) {
        return anim.failure;
    }
    if (checkcoverforsidearm(task) != anim.success) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x588
// Size: 0x78
function canswitchtosidearm(task) {
    if (istrue(self.disablepistol)) {
        return anim.failure;
    }
    if (bb_moverequested() && isdefined(self.pathgoalpos) && length2dsquared(self.velocity) > 1) {
        return anim.failure;
    }
    if (self.var_a97ac004f00c5df9) {
        return anim.failure;
    }
    return anim.success;
}

// Namespace weapon/namespace_38032b73dae709e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x608
// Size: 0x55
function checkcoverforsidearm(task) {
    covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
    if (isdefined(covernode) && distance(self.origin, covernode.origin) < 16) {
        return anim.failure;
    }
    return anim.success;
}

