// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;

#namespace xmike109;

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x365
// Size: 0x54
function initusage(weapon) {
    if (!isdefined(level.xmike109projectiles)) {
        level.xmike109projectiles = [];
    }
    if (!isdefined(self.xmike109)) {
        self.xmike109 = spawnstruct();
    }
    self.xmike109.active = 1;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0
// Size: 0x5b
function usageloop(weapon) {
    self endon("death_or_disconnect");
    self endon("faux_spawn");
    self endon("end_launcher");
    ammotype = getxmike109ammotype(weapon);
    if (ammotype == "mag_xmike109") {
        return;
    }
    var_6f14bbb852dacaf9 = getxmike109impactfunc(ammotype);
    thread impactwatcher(weapon, ammotype, var_6f14bbb852dacaf9);
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x422
// Size: 0x16
function cleanupafterweaponswitch() {
    self waittill("end_launcher");
    wait(6);
    self notify("cleanupXMike109ImpactWatcher");
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0xd8
function impactwatcher(var_551411054e80b44b, ammotype, var_2c27f44e59e5e0eb) {
    self notify("cleanupXMike109ImpactWatcher");
    self endon("disconnect");
    self endon("cleanupXMike109ImpactWatcher");
    childthread cleanupafterweaponswitch();
    if (ammotype == "default") {
        return;
    }
    while (1) {
        hitloc = impactpos = var_f07322c0d6ca069c = weapon = surfacetype = surfacenormal = var_b3fcd958f4d7876e = hitent = var_9d7ca6252f103a3b = self waittill("bullet_first_impact");
        if (var_551411054e80b44b != weapon) {
            continue;
        }
        handleimpact(hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype, weapon, var_f07322c0d6ca069c, impactpos, var_2c27f44e59e5e0eb, ammotype);
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51e
// Size: 0xc9
function handleimpact(hitent, var_b3fcd958f4d7876e, hitloc, surfacenormal, surfacetype, weapon, var_f07322c0d6ca069c, impactpos, var_2c27f44e59e5e0eb, ammotype) {
    var_87442b30a6159847 = shouldreflect(surfacetype, ammotype, hitent, var_b3fcd958f4d7876e, surfacenormal, var_f07322c0d6ca069c);
    projectile = spawnprojectile(impactpos, var_f07322c0d6ca069c, ammotype, weapon, var_87442b30a6159847, surfacenormal);
    if (shoulddeleteimmediately(hitent)) {
        projectile delete();
        return;
    } else if (shouldlink(hitent, var_87442b30a6159847)) {
        linktoent(projectile, hitent, var_b3fcd958f4d7876e);
    }
    if (isdefined(var_2c27f44e59e5e0eb)) {
        [[ var_2c27f44e59e5e0eb ]](projectile, hitent, var_b3fcd958f4d7876e, hitloc, surfacetype, var_87442b30a6159847);
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ee
// Size: 0xb8
function impactfunc_explo(projectile, hitent, var_b3fcd958f4d7876e, hitloc, surfacetype, var_87442b30a6159847) {
    fusetime = 0.1;
    projectile.grenade = magicgrenademanual("semtex_xmike109_mp", projectile.origin, (0, 0, 0), fusetime);
    projectile.grenade.angles = projectile.angles;
    projectile.grenade linkto(projectile, "tag_origin");
    thread projectileimpactexplode(projectile, fusetime, hitloc);
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ad
// Size: 0x41
function impactfunc_fire(projectile, hitent, var_b3fcd958f4d7876e, hitloc, surfacetype, var_87442b30a6159847) {
    thread projectileimpactthermite(projectile, hitent, var_b3fcd958f4d7876e, hitloc, var_87442b30a6159847);
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f5
// Size: 0x34
function impactfunc_null(projectile, hitent, var_b3fcd958f4d7876e, hitloc, surfacetype, var_87442b30a6159847) {
    
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x730
// Size: 0x164
function projectileimpactexplode(projectile, fusetime, hitloc) {
    self endon("disconnect");
    projectile endon("entitydeleted");
    projectile.grenade waittill_any_timeout_no_endon_death_1(fusetime, "explode");
    projectile setscriptablepartstate("effects", "explode");
    var_f6f7da32d9dcdd7f = makeweapon("semtex_xmike109_mp");
    var_fc2162402fee9cea = makeweapon("semtex_xmike109_splash_mp");
    function_49967318fbd12317(var_f6f7da32d9dcdd7f, projectile.weapon);
    function_49967318fbd12317(var_fc2162402fee9cea, projectile.weapon);
    glassradiusdamage(projectile.origin, 150, 50, 1);
    if (isdefined(projectile.stuckenemyentity) && isalive(projectile.stuckenemyentity)) {
        projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamage();
        projectile.stuckenemyentity dodamage(140, projectile.origin, self, self, "MOD_EXPLOSIVE", var_f6f7da32d9dcdd7f, hitloc);
        projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamageclear();
    }
    radiusdamagestepped(projectile.origin, 9, 35, 15, 25, 60, 14, self, "MOD_EXPLOSIVE", var_fc2162402fee9cea);
    wait(0.4);
    if (!projectile validateprojectileent()) {
        return;
    }
    projectile delete();
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x80
function projectileimpactthermite(projectile, hitent, var_b3fcd958f4d7876e, hitloc, var_87442b30a6159847) {
    if (istrue(projectile.isgrenade)) {
        projectile setscriptablepartstate("effects", "reflectThermite");
        waitforstuck(projectile);
    }
    projectile setscriptablepartstate("effects", "burn");
    thread thermitestuckto(projectile);
    thread thermiteradiusdamage(projectile);
    thread thermiteburnout(projectile);
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x922
// Size: 0x57
function waitforstuck(projectile) {
    projectile endon("stuckWaitTimeout");
    projectile thread projectilewaittilstucktimeout();
    var_16a48d7056e5c472 = stuckto = projectile waittill("missile_stuck");
    if (isdefined(stuckto)) {
        linktoent(projectile, stuckto, var_16a48d7056e5c472);
        projectile.bounceshot = 1;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x980
// Size: 0x13
function projectilewaittilstucktimeout() {
    wait(3);
    if (isdefined(self)) {
        self notify("stuckWaitTimeout");
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99a
// Size: 0x19a
function thermitestuckto(projectile) {
    self endon("disconnect");
    projectile endon("entitydeleted");
    var_f6f7da32d9dcdd7f = makeweapon("thermite_xmike109_mp");
    function_49967318fbd12317(var_f6f7da32d9dcdd7f, projectile.weapon);
    if (isdefined(projectile.stuckenemyentity) && isalive(projectile.stuckenemyentity)) {
        if (projectile.stuckenemyentity namespace_1f188a13f7e79610::isvehicle() || isdefined(projectile.stuckenemyentity.classname) && projectile.stuckenemyentity.classname == "misc_turret") {
            damage_interval = 0.95;
        } else {
            damage_interval = 0.25;
        }
        if (istrue(projectile.bounceshot)) {
            projectile.stuckenemyentity dodamage(80, projectile.origin, self, projectile, "MOD_FIRE", var_f6f7da32d9dcdd7f);
        }
        ticks = int(3 / damage_interval);
        while (isdefined(projectile) && isdefined(projectile.stuckenemyentity) && isalive(projectile.stuckenemyentity) && ticks >= 0) {
            projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamage();
            projectile.stuckenemyentity dodamage(3, projectile.origin, self, projectile, "MOD_FIRE", var_f6f7da32d9dcdd7f);
            projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::forcestuckdamageclear();
            ticks--;
            wait(damage_interval);
        }
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3b
// Size: 0x11b
function thermiteradiusdamage(projectile) {
    self endon("disconnect");
    projectile endon("entitydeleted");
    ticks = int(12);
    var_fa52c6d10ef1f00f = makeweapon("thermite_xmike109_radius_mp");
    function_49967318fbd12317(var_fa52c6d10ef1f00f, projectile.weapon);
    projectile.thermiteradiusweaponref = var_fa52c6d10ef1f00f.basename;
    while (ticks > 0) {
        if (isdefined(projectile.stuckenemyentity) && isalive(projectile.stuckenemyentity)) {
            projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::adddamagemodifier("thermite25mmStuck", 0, 0, &thermite_damagemodifierignorefunc);
        }
        projectile radiusdamage(projectile.origin, 50, 2, 2, self, "MOD_FIRE", var_fa52c6d10ef1f00f);
        if (isdefined(projectile.stuckenemyentity) && isalive(projectile.stuckenemyentity)) {
            projectile.stuckenemyentity namespace_169cd7a8fbc76ee5::removedamagemodifier("thermite25mmStuck", 0);
        }
        ticks--;
        wait(0.25);
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5d
// Size: 0x92
function thermite_damagemodifierignorefunc(inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc) {
    if (!isdefined(inflictor)) {
        return 1;
    }
    if (!isdefined(inflictor.thermiteradiusweaponref) || inflictor.thermiteradiusweaponref != "thermite_xmike109_radius_mp") {
        return 1;
    }
    if (!isdefined(inflictor.stuckenemyentity) || inflictor.stuckenemyentity != victim) {
        return 1;
    }
    return 0;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf7
// Size: 0x72
function thermiteburnout(projectile) {
    projectile endon("entitydeleted");
    wait(3);
    if (!projectile validateprojectileent()) {
        return;
    }
    projectile setscriptablepartstate("effects", "burnout");
    projectile setscriptablepartstate("visibility", "hide");
    wait(randomfloatrange(0.3, 2));
    if (!projectile validateprojectileent()) {
        return;
    }
    wait(randomfloatrange(2, 3));
    projectile delete();
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd70
// Size: 0x155
function spawnprojectile(impactpos, var_f07322c0d6ca069c, ammotype, weapon, var_87442b30a6159847, surfacenormal) {
    if (var_87442b30a6159847 && ammotype == "thermal") {
        vel = reflectprojectile(surfacenormal, var_f07322c0d6ca069c, impactpos, 1);
        org = impactpos + surfacenormal * 10;
        projectile = magicgrenademanual("xmike109_grenade", org, vel, 10);
        projectile.isgrenade = 1;
        playfx(getfx("xmike109ThermiteBounce"), impactpos, surfacenormal);
    } else {
        projectile = spawn("script_model", impactpos);
        projectile setmodel("weapon_wm_sn_xmike109_projectile");
        projectile.origin = impactpos;
        if (var_87442b30a6159847) {
            vel = reflectprojectile(surfacenormal, var_f07322c0d6ca069c, impactpos, 0);
            projectile physicslaunchserver(impactpos, vel);
        }
    }
    projectile.angles = vectortoangles(var_f07322c0d6ca069c);
    projectile setdeleteable(ammotype);
    projectile.owner = self;
    projectile.ammotype = ammotype;
    projectile.weapon = weapon;
    projectile.isxmike109projectile = 1;
    projectile thread projectiledeletethread();
    manageworldspawnedprojectiles(projectile);
    return projectile;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xecd
// Size: 0x6b
function setdeleteable(ammotype) {
    switch (ammotype) {
    case #"hash_fd8321f2ca4fc7a0":
        thread setdeleteabletimer(3.5);
        self.deleteable = 0;
        break;
    case #"hash_1cb749d9b456c694":
        self.deleteable = 0;
        break;
    default:
        self.deleteable = 1;
        break;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3f
// Size: 0x27
function setdeleteabletimer(time) {
    self endon("entitydeleted");
    wait(time);
    self.deleteable = 1;
    manageworldspawnedprojectiles();
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6d
// Size: 0xb3
function manageworldspawnedprojectiles(newstruct) {
    if (isdefined(newstruct)) {
        var_5c397c9cf7a06802 = [0:newstruct];
    } else {
        var_5c397c9cf7a06802 = [];
    }
    foreach (projectiles in level.xmike109projectiles) {
        if (!isdefined(projectiles)) {
            continue;
        }
        if (isdefined(projectiles)) {
            if (var_5c397c9cf7a06802.size >= 4 && projectiles.deleteable) {
                projectiles delete();
            } else {
                var_5c397c9cf7a06802[var_5c397c9cf7a06802.size] = projectiles;
            }
        }
    }
    level.xmike109projectiles = var_5c397c9cf7a06802;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1027
// Size: 0xbe
function getxmike109ammotype(weapon) {
    var_60424bd85d92d34e = "";
    foreach (attachment in weapon.attachments) {
        if (issubstr(attachment, "calcust")) {
            var_60424bd85d92d34e = attachment;
            break;
        }
    }
    switch (var_60424bd85d92d34e) {
    case #"hash_3de5ca2916f09a8d":
        return "thermal";
    case #"hash_aac8d0e29b407c16":
        return "explosive";
    default:
        return "default";
        break;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10ec
// Size: 0x4b
function getxmike109impactfunc(ammotype) {
    switch (ammotype) {
    case #"hash_fd8321f2ca4fc7a0":
        return &impactfunc_fire;
    case #"hash_1cb749d9b456c694":
        return &impactfunc_explo;
    default:
        return &impactfunc_null;
        break;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113e
// Size: 0x136
function shouldreflect(surfacetype, ammotype, hitent, var_b3fcd958f4d7876e, surfacenormal, var_f07322c0d6ca069c) {
    if (!isdefined(surfacetype)) {
        surfacetype = "";
    }
    if (surfacetype == "riotshield") {
        return 1;
    }
    if (ammotype != "thermal") {
        return 0;
    }
    if (!isdefined(hitent) && isdefined(var_b3fcd958f4d7876e)) {
        return 1;
    }
    if (issameteamplayer(hitent) || issameteamagent(hitent)) {
        return 1;
    }
    if (isenemyteamplayer(hitent) || isenemyteamagent(hitent)) {
        return 0;
    }
    if (isdefined(hitent)) {
        if (hitent namespace_1f188a13f7e79610::isvehicle()) {
            return 0;
        }
        if (isdefined(hitent.equipmentref) && hitent.equipmentref == "equip_tac_cover") {
            return 0;
        }
    }
    switch (surfacetype) {
    case #"hash_321a9678047d0a4e":
    case #"hash_886109ae17c9aa73":
    case #"hash_8c9d4c67dcde81f2":
        return 1;
    default:
        dot = abs(vectordot(var_f07322c0d6ca069c, surfacenormal));
        if (dot < 0.2) {
            return 1;
        } else {
            return 0;
        }
        break;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127b
// Size: 0xf2
function reflectprojectile(surfacenormal, var_f07322c0d6ca069c, impactpos, isgrenade) {
    if (isgrenade) {
        var_88545910d2fbd70a = 1500;
        var_88774d10d322045e = 500;
        var_88774310d321ee60 = 150;
    } else {
        var_88545910d2fbd70a = 500;
        var_88774d10d322045e = 500;
        var_88774310d321ee60 = 500;
    }
    vec = math::vector_reflect(var_f07322c0d6ca069c, surfacenormal);
    vec = vectorlerp(vec, surfacenormal, 0.2);
    dot = abs(vectordot(var_f07322c0d6ca069c, surfacenormal));
    if (dot < 0.2) {
        dot = math::normalize_value(0, 0.2, dot);
        var_91f849dfa0f2014c = math::factor_value(var_88545910d2fbd70a, var_88774d10d322045e, dot);
    } else {
        dot = math::normalize_value(0.2, 1, dot);
        var_91f849dfa0f2014c = math::factor_value(var_88774d10d322045e, var_88774310d321ee60, dot);
    }
    vec = vec * var_91f849dfa0f2014c;
    return vec;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1375
// Size: 0x40
function shoulddeleteimmediately(hitent) {
    if (!isdefined(hitent)) {
        return 0;
    }
    if (isagent(hitent) && hitent is_suicidebomber() && !isalive(hitent) && !isdefined(hitent getcorpseentity())) {
        return 1;
    }
    return 0;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13bd
// Size: 0x22
function shouldlink(hitent, var_87442b30a6159847) {
    if (var_87442b30a6159847 || !isdefined(hitent)) {
        return 0;
    }
    return 1;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e7
// Size: 0x21
function is_suicidebomber() {
    return istrue(isdefined(self.unittype) && self.unittype == "suicidebomber");
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1410
// Size: 0xea
function linktoent(projectile, hitent, var_b3fcd958f4d7876e) {
    if ((isplayer(hitent) || isagent(hitent)) && !isalive(hitent)) {
        corpse = hitent getcorpseentity();
        if (isdefined(corpse)) {
            hitent = corpse;
        }
    }
    if (isplayer(hitent)) {
        projectile hidefromplayer(hitent);
    }
    if (isdefined(var_b3fcd958f4d7876e)) {
        projectile linkto(hitent, var_b3fcd958f4d7876e);
    } else {
        projectile linkto(hitent);
    }
    if (cansticktoent(hitent)) {
        projectile.stuckenemyentity = hitent;
        projectile thread removestuckenemyondeathordisconnect(hitent);
    }
    if (!istrue(projectile.isgrenade)) {
        projectile notsolid();
    }
    projectile thread projectileunlinkonnote(hitent);
    projectile thread projectiledeleteonnote(hitent, "vehicle_deleted");
    projectile thread projectiledeleteonnote(hitent, "detonated");
    projectile thread projectiledeleteonnote(hitent, "beginC130");
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1501
// Size: 0x2a
function validateprojectileent() {
    if (isdefined(self) && istrue(self.isxmike109projectile)) {
        return 1;
    } else {
        /#
            assertmsg("Ent expects to be a XMike109 bolt, but no longer is.");
        #/
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1532
// Size: 0x5a
function removestuckenemyondeathordisconnect(hitent) {
    self endon("entitydeleted");
    hitent waittill_any_3("entitydeleted", "death", "disconnect");
    if (!validateprojectileent()) {
        return;
    }
    self.stuckenemyentity = undefined;
    if (isdefined(hitent) && isdefined(hitent.nocorpse)) {
        self delete();
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1593
// Size: 0x4a
function projectileunlinkonnote(hitent) {
    self endon("entitydeleted");
    if (isagent(hitent)) {
        hitent waittill("entitydeleted");
    } else {
        hitent waittill_any_2("entitydeleted", "disconnect");
    }
    if (!validateprojectileent()) {
        return;
    }
    projectileunlink();
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e4
// Size: 0x55
function projectileunlink(var_5be247f60b965650) {
    if (!isdefined(var_5be247f60b965650)) {
        var_5be247f60b965650 = (0, 0, 100);
    }
    if (self islinked()) {
        self unlink();
    }
    if (!istrue(self.isgrenade)) {
        self solid();
    }
    self physicslaunchserver(self.origin, var_5be247f60b965650);
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1640
// Size: 0x30
function projectiledeleteonnote(hitent, note) {
    self endon("entitydeleted");
    hitent waittill(note);
    if (!validateprojectileent()) {
        return;
    }
    self delete();
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1677
// Size: 0x27
function projectiledeletethread() {
    self waittill("entitydeleted");
    if (isdefined(self.grenade)) {
        self.grenade delete();
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a5
// Size: 0x29
function issameteamplayer(hitent) {
    if (!isplayer(hitent)) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::isenemy(hitent)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d5
// Size: 0x29
function isenemyteamplayer(hitent) {
    if (!isplayer(hitent)) {
        return 0;
    }
    if (namespace_f8065cafc523dba5::isenemy(hitent)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1705
// Size: 0x43
function issameteamagent(hitent) {
    if (!isagent(hitent)) {
        return 0;
    }
    if (isdefined(hitent.agentteam) && self.team == hitent.agentteam) {
        return 1;
    }
    return 0;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1750
// Size: 0x43
function isenemyteamagent(hitent) {
    if (!isagent(hitent)) {
        return 0;
    }
    if (isdefined(hitent.agentteam) && self.team == hitent.agentteam) {
        return 0;
    }
    return 1;
}

// Namespace xmike109/namespace_e78acea1c1a70fc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179b
// Size: 0xf1
function cansticktoent(hitent) {
    var_eb5a204e520cc8a3 = 0;
    if (isplayer(hitent) || isagent(hitent)) {
        var_eb5a204e520cc8a3 = 1;
    }
    if (hitent namespace_1f188a13f7e79610::isvehicle()) {
        var_eb5a204e520cc8a3 = 1;
    }
    if (isdefined(hitent.classname)) {
        if (hitent.classname == "misc_turret") {
            var_eb5a204e520cc8a3 = 1;
        }
        if (hitent.classname == "script_model") {
            if (isdefined(hitent.streakinfo) && (hitent.streakinfo.streakname == "uav" || hitent.streakinfo.streakname == "gunship")) {
                var_eb5a204e520cc8a3 = 1;
            }
        }
    }
    if (isdefined(hitent.equipmentref)) {
        if (hitent.equipmentref == "equip_tac_cover") {
            var_eb5a204e520cc8a3 = 1;
        }
    }
    return var_eb5a204e520cc8a3;
}

