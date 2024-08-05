#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\molotov.gsc;

#namespace namespace_8c5f5b6ade93c1ff;

// Namespace namespace_8c5f5b6ade93c1ff / scripts\sp\equipment\incendiarylauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xed
// Size: 0x13
function init() {
    level.player thread firemanager();
}

// Namespace namespace_8c5f5b6ade93c1ff / scripts\sp\equipment\incendiarylauncher
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x108
// Size: 0x113
function firemanager() {
    self.offhands = spawnstruct();
    self.offhands.lastusedoffhandweapon = undefined;
    self.offhands.lastusedoffhandtime = 0;
    while (true) {
        has_gl = 0;
        missile, weapon = self waittill("missile_fire");
        attachmentnames = getweaponattachments(weapon);
        if (isdefined(attachmentnames) && attachmentnames.size > 0) {
            foreach (attachment in attachmentnames) {
                if (issubstr(attachment, "gl")) {
                    has_gl = 1;
                }
            }
        }
        if (weapon.basename == "iw8_la_mike32_incendiary") {
            missile thread watchforimpact("explode");
            continue;
        }
        if (has_gl) {
            missile thread watchforimpact("missile_stuck");
        }
    }
}

// Namespace namespace_8c5f5b6ade93c1ff / scripts\sp\equipment\incendiarylauncher
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0xcd
function watchforimpact(msg) {
    self endon("entitydeleted");
    owner = getmissileowner(self);
    if (msg == "missile_stuck") {
        stuckto, hitentpart, surfacetype, velocity, origin, normal = self waittill("missile_stuck");
        if (distance2d(owner.origin, origin) > 200) {
            scripts\sp\equipment\molotov::molotovexplode(origin, normal, velocity, stuckto, owner);
        } else {
            self delete();
        }
        return;
    }
    origin, normal, velocity, entity = self waittill(msg);
    scripts\sp\equipment\molotov::molotovexplode(origin, normal, velocity, entity, owner);
}

