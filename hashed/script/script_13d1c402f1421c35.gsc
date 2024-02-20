// mwiii decomp prototype
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\asm.gsc;

#namespace namespace_badb3f1a7decb7fa;

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136
// Size: 0x3
function shootuntilshootbehaviorchange() {
    
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x3
function initgrenadethrowanims() {
    
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a
// Size: 0xc1
function throwgrenadeatplayerasap_combat_utility() {
    /#
        assert(self isbadguy());
    #/
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] function_4c108309dc0d7fd2() == 0) {
            function_b4ebe6632d7e8efe(level.players[i], "lethal", 0);
        }
    }
    function_98deae9464f6c005(1);
    /#
        enemies = getaiarray("<unknown string>");
        if (enemies.size == 0) {
            return;
        }
        var_20d57e479df6089c = 0;
        for (i = 0; i < enemies.size; i++) {
            if (enemies[i].grenadeammo > 0) {
                return;
            }
        }
        println("<unknown string>");
    #/
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0xa1
function function_96d556dea441d1dc(var_17cb9777b3d10c36) {
    /#
        if (var_17cb9777b3d10c36.isplayertimer) {
            for (i = 0; i < level.players.size; i++) {
                if (level.players[i] == var_17cb9777b3d10c36.player) {
                    break;
                }
            }
            return ("<unknown string>" + i + 1 + "<unknown string>" + var_17cb9777b3d10c36.weapon.basename);
        } else {
            return ("<unknown string>" + var_17cb9777b3d10c36.weapon.basename);
        }
    #/
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x3c
function trygrenadethrow(var_a15426692301f3f0, destination, var_4ed24c46c4f57095, var_b1c462b90341e70e, fastthrow, withbounce, var_973c51e9fd66d178) {
    
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fd
// Size: 0x9c
function getgrenadedropvelocity() {
    yaw = randomfloat(360);
    pitch = randomfloatrange(30, 75);
    var_f8f00f4adf868a35 = sin(pitch);
    var_d62bec0fa0b05a5e = cos(pitch);
    var_f8f00d4adf8685cf = cos(yaw) * var_d62bec0fa0b05a5e;
    var_f8f00c4adf86839c = sin(yaw) * var_d62bec0fa0b05a5e;
    speed = randomfloatrange(100, 200);
    velocity = (var_f8f00d4adf8685cf, var_f8f00c4adf86839c, var_f8f00f4adf868a35) * speed;
    return velocity;
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1
// Size: 0x43
function dropgrenade() {
    if (isdefined(self.nodropgrenade)) {
        return;
    }
    var_f3e5ec9ecaaf8e1b = self gettagorigin("tag_accessory_right");
    velocity = getgrenadedropvelocity();
    self magicgrenademanual(var_f3e5ec9ecaaf8e1b, velocity, 3);
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb
// Size: 0x47
function getpitchtoshootspot(spot) {
    if (!isdefined(spot)) {
        return 0;
    }
    vectortoenemy = spot - self getshootatpos();
    vectortoenemy = vectornormalize(vectortoenemy);
    pitchdelta = vectortoangles(vectortoenemy)[0];
    return angleclamp180(pitchdelta);
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0x5f
function watchreloading() {
    self.isreloading = 0;
    self.lastreloadstarttime = -1;
    while (1) {
        self waittill("reload_start");
        self.isreloading = 1;
        self.lastreloadstarttime = gettime();
        function_216c67ab6749137a(self, undefined, "reload");
        waittillreloadfinished();
        self.isreloading = 0;
    }
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a0
// Size: 0x68
function waittillreloadfinished() {
    thread timednotify(4, "reloadtimeout");
    self endon("reloadtimeout");
    self endon("weapon_taken");
    while (1) {
        self waittill("reload");
        weap = self getcurrentweapon();
        if (isnullweapon(weap)) {
            break;
        }
        if (self getcurrentweaponclipammo() >= weaponclipsize(weap)) {
            break;
        }
    }
    self notify("reloadtimeout");
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f
// Size: 0x1d
function timednotify(time, msg) {
    self endon(msg);
    wait(time);
    self notify(msg);
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x533
// Size: 0x17e
function monitorflash() {
    self endon("death");
    if (!isdefined(level.neverstopmonitoringflash)) {
        self endon("stop_monitoring_flash");
    }
    while (1) {
        var_b1225349b792ffad = undefined;
        origin = undefined;
        var_dda6d54c623139bd = undefined;
        attacker = undefined;
        attackerteam = undefined;
        duration = attackerteam = attacker = var_dda6d54c623139bd = var_b1225349b792ffad = origin = self waittill("flashbang");
        if (isdefined(self.flashbangimmunity) && self.flashbangimmunity) {
            continue;
        }
        if (isdefined(self.script_immunetoflash) && self.script_immunetoflash != 0) {
            continue;
        }
        if (isdefined(self.team) && isdefined(attackerteam) && self.team == attackerteam) {
            var_b1225349b792ffad = 3 * (var_b1225349b792ffad - 0.75);
            if (var_b1225349b792ffad < 0) {
                continue;
            }
            if (isdefined(self.teamflashbangimmunity)) {
                continue;
            }
        }
        if (namespace_448ccf1ca136fbbe::function_ec40425fb125f6cf("flashbang", attackerteam)) {
            continue;
        }
        var_fbc487faa5bf1ff = 0.2;
        if (var_b1225349b792ffad > 1 - var_fbc487faa5bf1ff) {
            var_b1225349b792ffad = 1;
        } else {
            var_b1225349b792ffad = var_b1225349b792ffad / (1 - var_fbc487faa5bf1ff);
        }
        if (!isdefined(duration)) {
            duration = 4.5;
        }
        duration = duration * var_b1225349b792ffad;
        if (duration < 0.25) {
            continue;
        }
        self.flashingteam = attackerteam;
        flashbangstart(duration);
        self notify("doFlashBanged", origin);
    }
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0xed
function flashbangstart(duration) {
    /#
        assert(isdefined(self));
    #/
    /#
        assert(isdefined(duration));
    #/
    if (isdefined(self.flashbangimmunity) && self.flashbangimmunity) {
        return;
    }
    if (isdefined(self.syncedmeleetarget)) {
        return;
    }
    if (self isinscriptedstate() || namespace_28edc79fcf2fe234::bb_isanimscripted()) {
        return;
    }
    if (!self.allowpain || !self.allowpain_internal) {
        return;
    }
    var_cedd6db7d7daa84f = gettime() + int(duration * 1000);
    if (isdefined(self.flashendtime)) {
        self.flashendtime = int(max(self.flashendtime, var_cedd6db7d7daa84f));
    } else {
        self.flashendtime = var_cedd6db7d7daa84f;
        if (isdefined(self.asm)) {
            namespace_bf5a1761a8d1bb07::asm_setstate("pain_flashed_transition");
        }
    }
    self notify("flashed");
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ac
// Size: 0x8
function fasteranimspeed() {
    return 1.5;
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bc
// Size: 0x193
function function_9439f01a442797ec() {
    /#
        setdvarifuninitialized(@"hash_b4fd9ea4f6486d24", "<unknown string>");
        huds = undefined;
        var_1b46ab29049f50ea = undefined;
        while (1) {
            if (getdvarint(@"hash_b4fd9ea4f6486d24") == 0) {
                function_c0d677eae75ed3ea(huds);
                function_c0d677eae75ed3ea(var_1b46ab29049f50ea);
                huds = undefined;
                var_1b46ab29049f50ea = undefined;
                wait(0.2);
                continue;
            }
            if (!isdefined(huds)) {
                var_57accdc40b2f50e = function_96de23075e92ba2();
                var_1b46ab29049f50ea = var_57accdc40b2f50e[1];
                huds = var_57accdc40b2f50e[0];
            }
            foreach (key, hud in huds) {
                hud.value = anim.meleechargetimers[key] - gettime();
                if (hud.value < 0) {
                    continue;
                }
                hud setvalue(hud.value);
            }
            foreach (key, hud in var_1b46ab29049f50ea) {
                hud.value = anim.meleechargeplayertimers[key] - gettime();
                if (hud.value < 0) {
                    continue;
                }
                hud setvalue(hud.value);
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x956
// Size: 0x189
function function_96de23075e92ba2() {
    /#
        huds = [];
        count = 0;
        foreach (key, item in anim.meleechargetimers) {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<unknown string>" + key + "<unknown string>";
            hud setvalue(0);
            hud.value = 0;
            huds[key] = hud;
            count++;
        }
        count++;
        var_1b46ab29049f50ea = [];
        foreach (key, item in anim.meleechargeplayertimers) {
            hud = newhudelem();
            hud.x = 80;
            hud.y = 20 + count * 15;
            hud.label = "<unknown string>" + key + "<unknown string>";
            hud setvalue(0);
            hud.value = 0;
            var_1b46ab29049f50ea[key] = hud;
            count++;
        }
        return [0:huds, 1:var_1b46ab29049f50ea];
    #/
}

// Namespace namespace_badb3f1a7decb7fa/namespace_ba1fcf33692e2fad
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae6
// Size: 0x61
function function_c0d677eae75ed3ea(huds) {
    /#
        if (!isdefined(huds)) {
            return;
        }
        foreach (hud in huds) {
            hud destroy();
        }
    #/
}

