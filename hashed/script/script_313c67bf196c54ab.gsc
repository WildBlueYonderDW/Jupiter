#using script_7e4d332e911e1b90;
#using script_13d1c402f1421c35;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\anim\notetracks.gsc;
#using scripts\anim\face.gsc;

#namespace flashed;

// Namespace flashed / namespace_d9934ce501ceb545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111
// Size: 0x2
function init_animset_flashed() {
    
}

// Namespace flashed / namespace_d9934ce501ceb545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b
// Size: 0x12c
function getnextflashanim() {
    archetype = "soldier";
    assert(isdefined(anim.flashanimindex));
    if (isdefined(self.animarchetype) && isdefined(anim.flashanimindex[self.animarchetype])) {
        archetype = self.animarchetype;
    }
    anim.flashanimindex[archetype]++;
    assert(isdefined(anim.archetypes[archetype]["flashed"]["flashed"]) && anim.archetypes[archetype]["flashed"]["flashed"].size > 0);
    if (anim.flashanimindex[archetype] >= anim.archetypes[archetype]["flashed"]["flashed"].size) {
        anim.flashanimindex[archetype] = 0;
        anim.archetypes[archetype]["flashed"]["flashed"] = array_randomize(anim.archetypes[archetype]["flashed"]["flashed"]);
    }
    return anim.archetypes[archetype]["flashed"]["flashed"][anim.flashanimindex[archetype]];
}

// Namespace flashed / namespace_d9934ce501ceb545
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x250
// Size: 0x48
function flashbanganim(animation) {
    self endon("killanimscript");
    self setflaggedanimknoball("flashed_anim", animation, generic_human%body, 0.2, randomfloatrange(0.9, 1.1));
    scripts\anim\notetracks::donotetracks("flashed_anim");
}

// Namespace flashed / namespace_d9934ce501ceb545
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0
// Size: 0x75
function main() {
    self endon("death");
    self endon("killanimscript");
    namespace_f87a4b6569ce73b2::initialize("flashed");
    var_a0c6a76ddd33b815 = flashbanggettimeleftsec();
    if (var_a0c6a76ddd33b815 <= 0) {
        return;
    }
    scripts\anim\face::saygenericdialogue("flashbang");
    if (isdefined(self.specialflashedfunc)) {
        self [[ self.specialflashedfunc ]]();
        return;
    }
    animation = getnextflashanim();
    flashbangedloop(animation, var_a0c6a76ddd33b815);
}

// Namespace flashed / namespace_d9934ce501ceb545
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x31d
// Size: 0x94
function flashbangedloop(animation, duration) {
    self endon("death");
    self endon("killanimscript");
    assert(isdefined(animation));
    assert(isdefined(duration));
    assert(duration > 0);
    if (self.currentpose == "prone") {
        exitpronewrapper(1);
    }
    self.currentpose = "stand";
    self.allowdeath = 1;
    thread flashbanganim(animation);
    wait duration;
    self notify("stop_flashbang_effect");
    self.flashed = 0;
}

