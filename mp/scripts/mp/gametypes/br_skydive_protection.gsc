#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\damage.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_public.gsc;

#namespace br_skydive_protection;

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x177
// Size: 0x192
function init() {
    var_16e73b10a8080dd2 = isdefined(level.modifyplayerdamage) && level.modifyplayerdamage == &scripts\mp\gametypes\br::brmodifyplayerdamage;
    assertex(var_16e73b10a8080dd2, "<dev string:x1c>");
    if (var_16e73b10a8080dd2) {
        level.modifyplayerdamage = &function_b18f9e23b7bbbc7f;
        level.var_3ff7c73209fcf59d = getdvarint(@"hash_8dcdf86e1a8c0268", 1) == 1;
        level.var_c701c6304d25847b = getdvarint(@"hash_fe4e43d689d53652", 1);
        level.var_62b412340037b5f2 = getdvarfloat(@"hash_b8697b26628bf8f9", 2.5);
        level.var_762e79833c568872 = getdvarfloat(@"hash_9b573a0d1aa67773", 0.2);
        level.var_a616020822a64869 = getdvarfloat(@"hash_2d766a7032695e80", 0.1);
        level.var_f56012f3862e7747 = getdvarint(@"hash_75a6778b7afbe4ae", 2500);
        level.var_6c3525c5c767be2f = getdvarint(@"hash_135e4a643e2d5610", 750);
        level.var_99f79c82a10bb035 = getdvarfloat(@"hash_14eaf6cedd5cb4a", 0.25);
        level.var_94ce8b45176db281 = getdvarfloat(@"hash_7f2806a81cfae7bc", 0.25);
        level.var_d5af0d323eade962 = getdvarfloat(@"hash_eefed2a5ab0f62f7", 750);
        level.var_b1fa8d290ef1d796 = level.var_d5af0d323eade962 * level.var_d5af0d323eade962;
        /#
            level.var_218972ae124946da = getdvarint(@"hash_7701e71825a6380a", 0);
        #/
    }
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x311
// Size: 0x5b
function initprotection() {
    if (!istrue(level.var_3ff7c73209fcf59d)) {
        return;
    }
    thread function_211969a23699f797();
    thread function_54559c834e6c17aa();
    thread function_cf9f51cc2da4f3bd();
    thread function_21f0a8ee3f038d39();
    /#
        if (level.var_218972ae124946da) {
            thread function_d93fc50310a48215();
        }
    #/
    if (level.var_c701c6304d25847b) {
        thread function_6f97457196b089bd();
    }
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x374
// Size: 0x75
function function_54559c834e6c17aa() {
    self endon("death_or_disconnect");
    self endon("skydive_remove_spawn_protection");
    self.skydive_spawnprotection = 1;
    while (!function_f0f8107cb455be5c()) {
        if (self isonground() || self isswimming()) {
            break;
        }
        waitframe();
    }
    /#
        if (level.var_218972ae124946da) {
            self iprintln("<dev string:x9f>");
        }
    #/
    self.skydive_spawnprotection = undefined;
    self.var_762e79833c568872 = undefined;
    self notify("skydive_remove_spawn_protection");
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f1
// Size: 0x112
function function_f0f8107cb455be5c() {
    ignoreai = getdvarint(@"hash_b943d9f6a81cec77", 0);
    var_12ef154b846bacff = undefined;
    foreach (player in scripts\common\utility::playersnear(self.origin, level.var_d5af0d323eade962)) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        if (!isdefined(player.team) || player.team == self.team) {
            continue;
        }
        if (ignoreai && isai(player)) {
            continue;
        }
        if (!player isonground() && !player isswimming()) {
            continue;
        }
        if (distancesquared(self.origin, player.origin) < level.var_b1fa8d290ef1d796) {
            return true;
        }
    }
    return false;
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c
// Size: 0x67
function function_21f0a8ee3f038d39() {
    self endon("death_or_disconnect");
    self endon("skydive_remove_launcher_protection");
    self.var_ce34e72182b33556 = 1;
    while (true) {
        if (self isonground() || self isswimming()) {
            break;
        }
        waitframe();
    }
    /#
        if (level.var_218972ae124946da) {
            self iprintln("<dev string:xfc>");
        }
    #/
    self.var_ce34e72182b33556 = undefined;
    self notify("skydive_remove_launcher_protection");
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b
// Size: 0x5a
function function_211969a23699f797() {
    self endon("death_or_disconnect");
    self endon("skydive_remove_spawn_protection");
    self.skydive_spawnprotection = 1;
    self waittill("weapon_fired");
    /#
        if (level.var_218972ae124946da) {
            self iprintln("<dev string:x14e>");
        }
    #/
    self.skydive_spawnprotection = undefined;
    self.var_762e79833c568872 = undefined;
    self notify("skydive_remove_spawn_protection");
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dd
// Size: 0x41
function function_6f97457196b089bd() {
    self endon("death_or_disconnect");
    self endon("skydive_remove_spawn_protection");
    self.skydive_spawnprotection = 1;
    wait level.var_62b412340037b5f2;
    self.skydive_spawnprotection = undefined;
    self.var_762e79833c568872 = undefined;
    self notify("skydive_remove_spawn_protection");
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x626
// Size: 0xe3
function function_cf9f51cc2da4f3bd() {
    self endon("death_or_disconnect");
    self endon("skydive_remove_spawn_protection");
    self.var_762e79833c568872 = 1;
    while (true) {
        var_c14047c4299f9c74 = function_2ccadd23ce09858e();
        if (var_c14047c4299f9c74 < level.var_6c3525c5c767be2f) {
            break;
        }
        range = level.var_f56012f3862e7747 - level.var_6c3525c5c767be2f;
        heightscale = clamp(var_c14047c4299f9c74 / range, 0, 1);
        valuerange = level.var_99f79c82a10bb035 - level.var_94ce8b45176db281;
        self.var_762e79833c568872 = heightscale * valuerange + level.var_94ce8b45176db281;
        waitframe();
    }
    /#
        if (level.var_218972ae124946da) {
            self iprintln("<dev string:x197>");
        }
    #/
    self.skydive_spawnprotection = undefined;
    self.var_762e79833c568872 = undefined;
    self notify("skydive_remove_spawn_protection");
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x711
// Size: 0x22
function function_cfce6a9d8f6de32f(objweapon) {
    return isdefined(objweapon) && scripts\mp\damage::function_7b2f2a8a9aa41d44(objweapon.basename);
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x73c
// Size: 0x223
function function_b18f9e23b7bbbc7f(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (istrue(level.var_3ff7c73209fcf59d)) {
        if (!function_cfce6a9d8f6de32f(objweapon)) {
            if (istrue(victim.skydive_spawnprotection) && isdefined(victim.var_762e79833c568872)) {
                idamage *= victim.var_762e79833c568872;
            }
            if (isdefined(eattacker) && istrue(victim.var_ce34e72182b33556)) {
                switch (smeansofdeath) {
                case #"hash_3c20f39c73a1422b":
                case #"hash_66cb246f3e55fbe2":
                case #"hash_a911a1880d996edb":
                case #"hash_c22b13f81bed11f0":
                    idamage *= level.var_a616020822a64869;
                    break;
                }
            }
        }
    }
    var_2bb9843391a39639 = idamage;
    idamage = scripts\mp\gametypes\br::brmodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1);
    /#
        if (level.var_218972ae124946da) {
            if (!is_equal(objweapon.basename, "<dev string:x1f1>") && !function_cfce6a9d8f6de32f(objweapon)) {
                spawnprotection = istrue(victim.skydive_spawnprotection);
                spawnprotectionmodifier = ter_op(isdefined(victim.var_762e79833c568872), victim.var_762e79833c568872, 0);
                logstring("<dev string:x207>" + victim.name + "<dev string:x21f>" + var_2bb9843391a39639 + "<dev string:x234>" + idamage + "<dev string:x241>" + shitloc + "<dev string:x24e>" + var_be4285b26ed99ab1 + "<dev string:x263>" + objweapon.basename + "<dev string:x272>" + spawnprotection + "<dev string:x287>" + spawnprotectionmodifier + "<dev string:x2a4>" + victim.health + "<dev string:x2b0>" + victim.armorhealth);
            }
        }
    #/
    return idamage;
}

// Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x968
// Size: 0x60
function function_2ccadd23ce09858e() {
    contentsoverride = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1);
    ground = scripts\mp\gametypes\br_public::droptogroundmultitrace(self.origin, 0, -100000, contentsoverride);
    var_c14047c4299f9c74 = self.origin[2] - ground[2];
    return var_c14047c4299f9c74;
}

/#

    // Namespace br_skydive_protection / scripts\mp\gametypes\br_skydive_protection
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x9d1
    // Size: 0x13d
    function private function_d93fc50310a48215() {
        self endon("<dev string:x2c1>");
        self endon("<dev string:x2d8>");
        host = self ishost();
        while (true) {
            var_d727c4301f0ae7a5 = function_2ccadd23ce09858e();
            text = "<dev string:x2fe>";
            color = (1, 0, 0);
            if (istrue(self.skydive_spawnprotection) || istrue(self.var_ce34e72182b33556)) {
                color = (0, 1, 0);
                text = "<dev string:x30f>";
                if (istrue(self.skydive_spawnprotection) && isdefined(self.var_762e79833c568872)) {
                    text += "<dev string:x31f>" + self.var_762e79833c568872 + "<dev string:x326>";
                }
                if (istrue(self.var_ce34e72182b33556)) {
                    text += "<dev string:x32e>" + level.var_a616020822a64869 + "<dev string:x326>";
                }
                text += var_d727c4301f0ae7a5;
            }
            if (host) {
                printtoscreen2d(500, 500, text, color, 1, 1);
            } else {
                print3d(self.origin + (0, 0, 100), text, color, 1, 0.75, 1, 1);
            }
            waitframe();
        }
    }

#/
