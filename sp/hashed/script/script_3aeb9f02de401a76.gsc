#using script_13d1c402f1421c35;
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common;
#using scripts\common\utility;
#using scripts\engine\sp\utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\sp\utility;

#namespace death;

// Namespace death / namespace_d7b8d979dba24484
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x184
// Size: 0x13
function init_deathfx() {
    add_fx("deathfx_bloodpool_generic", "vfx/iw8/char/blood/vfx_deathfx_bloodpool_01.vfx");
}

// Namespace death / namespace_d7b8d979dba24484
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0x11
function main() {
    self endon("killanimscript");
    self waittill("hellfreezesover");
}

/#

    // Namespace death / namespace_d7b8d979dba24484
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b8
    // Size: 0x10
    function doimmediateragdolldeath() {
        assertmsg("use the new one in asm/shared/death.gsc");
    }

#/

// Namespace death / namespace_d7b8d979dba24484
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0x10b
function play_blood_pool(note, flagname) {
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(self.skipbloodpool)) {
        assertex(self.skipbloodpool, "Setting must be either true or undefined");
        return;
    }
    tagpos = self gettagorigin("j_SpineUpper");
    tagangles = self gettagangles("j_SpineUpper");
    forward = anglestoforward(tagangles);
    up = anglestoup(tagangles);
    right = anglestoright(tagangles);
    tagpos = tagpos + forward * -8.5 + up * 5 + right * 0;
    trace = scripts\engine\trace::_bullet_trace(tagpos + (0, 0, 30), tagpos - (0, 0, 100), 0, undefined);
    if (trace["normal"][2] > 0.9) {
        playfx(level._effect["deathfx_bloodpool_generic"], tagpos);
    }
}

