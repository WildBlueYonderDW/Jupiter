// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\heavyarmor.gsc;

#namespace lightarmor;

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102
// Size: 0x15
function haslightarmor(player) {
    return getlightarmorvalue(player) > 0;
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f
// Size: 0x28
function getlightarmorvalue(player) {
    if (isdefined(player.lightarmorhp)) {
        return player.lightarmorhp;
    }
    return 0;
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f
// Size: 0xdc
function setlightarmorvalue(player, value, overridegreater, playvfx) {
    if (!isdefined(overridegreater)) {
        overridegreater = 1;
    }
    if (!isdefined(playvfx)) {
        playvfx = 1;
    }
    if (lightarmor_lightarmor_disabled(player)) {
        value = 0;
        overridegreater = 1;
    }
    oldvalue = getlightarmorvalue(player);
    if (!overridegreater && oldvalue > value) {
        value = oldvalue;
    }
    if (oldvalue <= 0 && value > 0) {
        lightarmor_set(player, value, playvfx);
        return;
    }
    if (oldvalue > 0 && value <= 0) {
        lightarmor_unset(player);
        return;
    }
    player.lightarmorhp = value;
    if (isplayer(player) && oldvalue <= value && value > 0 && playvfx == 1) {
        thread lightarmor_setfx(player);
    }
    if (isplayer(player)) {
        lightarmor_updatehud(player);
    }
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x3
function init() {
    
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x6c
function lightarmor_set(player, value, playvfx) {
    /#
        assertex(isdefined(value), "lightArmor_set() param value is undefined");
    #/
    player notify("lightArmor_set");
    player.lightarmorhp = value;
    lightarmor_updatehud(player);
    thread lightarmor_monitordeath(player);
    if (isplayer(player) && playvfx == 1) {
        thread lightarmor_setfx(player);
    }
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2af
// Size: 0x38
function lightarmor_unset(player) {
    player notify("lightArmor_unset");
    player.lightarmorhp = undefined;
    lightarmor_updatehud(player);
    if (isplayer(player)) {
    }
    player notify("remove_light_armor");
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ee
// Size: 0x18b
function lightarmor_modifydamage(victim, attacker, damage, damageadd, smeansofdeath, sweapon, impactpoint, impactdir, shitloc, inflictor, query) {
    var_eb9b8cdc328659b0 = 0;
    damageblocked = 0;
    lightarmorhpmodified = victim.lightarmorhp;
    if (!isdefined(query)) {
        query = 1;
    }
    if (!var_eb9b8cdc328659b0) {
        if (smeansofdeath == "MOD_FALLING") {
            var_eb9b8cdc328659b0 = 1;
        }
    }
    if (!var_eb9b8cdc328659b0) {
        if (isexplosivedamagemod(smeansofdeath)) {
            if (isdefined(inflictor) && isdefined(inflictor.stuckenemyentity) && inflictor.stuckenemyentity == victim) {
                var_eb9b8cdc328659b0 = 1;
            }
        }
    }
    if (!var_eb9b8cdc328659b0) {
        if (scripts/mp/utility/weapon::issuperdamagesource(sweapon)) {
            var_eb9b8cdc328659b0 = 1;
        }
    }
    if (!var_eb9b8cdc328659b0) {
        damageblocked = min(damage + damageadd, victim.lightarmorhp);
        lightarmorhpmodified = lightarmorhpmodified - damage + damageadd;
        if (!query) {
            victim.lightarmorhp = victim.lightarmorhp - damage + damageadd;
        }
        damage = 0;
        damageadd = 0;
        if (lightarmorhpmodified <= 0) {
            damage = abs(lightarmorhpmodified);
            damageadd = 0;
            if (!query) {
                lightarmor_unset(victim);
            }
        }
    }
    if (!query) {
        lightarmor_updatehud(self);
    }
    if (damageblocked > 0 && damage == 0) {
        damage = 1;
    }
    return [damageblocked, damage, damageadd];
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x481
// Size: 0x1a
function lightarmor_lightarmor_disabled(player) {
    if (player scripts/mp/heavyarmor::hasheavyarmor()) {
        return true;
    }
    return false;
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3
// Size: 0x32
function lightarmor_monitordeath(player) {
    player endon("disconnect");
    player endon("lightArmor_set");
    player endon("lightArmor_unset");
    player waittill("death");
    thread lightarmor_unset(player);
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dc
// Size: 0x16
function lightarmor_updatehud(player) {
    if (!isplayer(player)) {
        return;
    }
}

// Namespace lightarmor / scripts/mp/lightarmor
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f9
// Size: 0xc
function lightarmor_setfx(player) {
    
}

