// mwiii decomp prototype
#using script_7e4d332e911e1b90;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\ai.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\asm.gsc;

#namespace shared;

// Namespace shared/namespace_80c14191b262bb30
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a6
// Size: 0x70
function teleportthread(verticaloffset) {
    self endon("killanimscript");
    self notify("endTeleportThread");
    self endon("endTeleportThread");
    reps = 5;
    offset = (0, 0, verticaloffset / reps);
    for (i = 0; i < reps; i++) {
        self forceteleport(self.origin + offset);
        wait(0.05);
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x101
function teleportthreadex(verticaloffset, delay, frames, animrate) {
    self endon("killanimscript");
    self notify("endTeleportThread");
    self endon("endTeleportThread");
    if (verticaloffset == 0 || frames <= 0) {
        return;
    }
    if (delay > 0) {
        wait(delay);
    }
    offset = (0, 0, verticaloffset / frames);
    if (isdefined(animrate) && animrate < 1) {
        self setflaggedanimknoball("traverseAnim", self.traverseanim, self.traverseanimroot, 1, 0.2, animrate);
    }
    for (i = 0; i < frames; i++) {
        self forceteleport(self.origin + offset);
        wait(0.05);
    }
    if (isdefined(animrate) && animrate < 1) {
        self setflaggedanimknoball("traverseAnim", self.traverseanim, self.traverseanimroot, 1, 0.2, 1);
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x325
// Size: 0x1a
function dotraverse(var_aeb119a0ed15e45f) {
    /#
        assertmsg("if you are hitting this, you are doing something dreadfully wrong.");
    #/
}

// Namespace shared/namespace_80c14191b262bb30
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x346
// Size: 0x45
function handletraversenotetracks(note) {
    if (note == "traverse_death") {
        return handletraversedeathnotetrack();
    } else if (note == "traverse_align") {
        return handletraversealignment();
    } else if (note == "traverse_drop") {
        return handletraversedrop();
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x392
// Size: 0x48
function handletraversedeathnotetrack() {
    if (isdefined(self.traversedeathanim)) {
        var_d2565459c0e88749 = self.traversedeathanim[self.traversedeathindex];
        set_deathanim(var_d2565459c0e88749[randomint(var_d2565459c0e88749.size)]);
        self.traversedeathindex++;
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1
// Size: 0xa9
function handletraversealignment() {
    self animmode("noclip");
    var_256ca46d1effdd41 = undefined;
    if (self.var_32a34987ee1b3095 == "nodeless" || self.var_32a34987ee1b3095 == "linkless") {
        var_256ca46d1effdd41 = self.var_64b933af90edc53c.traverse_height;
    } else {
        var_256ca46d1effdd41 = self.traversestartnode.traverse_height;
    }
    if (isdefined(self.traverseheight) && isdefined(var_256ca46d1effdd41)) {
        var_c96a4bfb26396aa5 = var_256ca46d1effdd41 - self.traversestartz;
        thread teleportthread(var_c96a4bfb26396aa5 - self.traverseheight);
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x491
// Size: 0x1a5
function handletraversedrop() {
    startpos = self.origin + (0, 0, 32);
    endpos = physicstrace(startpos, self.origin + (0, 0, -512));
    dist = distance(startpos, endpos);
    var_e365c44cbf1472ab = dist - 32 - 0.5;
    var_9c41c6bce074794 = self getanimtime(self.traverseanim);
    var_472176e97aa175c8 = getmovedelta(self.traverseanim, var_9c41c6bce074794, 1);
    var_524af19a4f9d376a = getanimlength(self.traverseanim);
    var_fb6f770a5d1925e = 0 - var_472176e97aa175c8[2];
    /#
        assertex(var_fb6f770a5d1925e >= 0, var_fb6f770a5d1925e);
    #/
    dropoffset = var_fb6f770a5d1925e - var_e365c44cbf1472ab;
    /#
        if (getdvarint(@"hash_60bc1b675216e3d")) {
            thread namespace_f87a4b6569ce73b2::debugline(startpos, endpos, (1, 1, 1), 40);
            thread namespace_f87a4b6569ce73b2::drawstringtime("<unknown string>" + dropoffset, endpos, (1, 1, 1), 2);
        }
    #/
    if (var_fb6f770a5d1925e < var_e365c44cbf1472ab) {
        animrate = var_fb6f770a5d1925e / var_e365c44cbf1472ab;
    } else {
        animrate = 1;
    }
    var_5a9dadadd41366e = (var_524af19a4f9d376a - var_9c41c6bce074794) / 3;
    numframes = ceil(var_5a9dadadd41366e * 20);
    thread teleportthreadex(dropoffset, 0, numframes, animrate);
    thread finishtraversedrop(endpos[2]);
}

// Namespace shared/namespace_80c14191b262bb30
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63d
// Size: 0x4a
function finishtraversedrop(var_ba8d57c006ab035b) {
    self endon("killanimscript");
    var_ba8d57c006ab035b = var_ba8d57c006ab035b + 4;
    while (1) {
        if (self.origin[2] < var_ba8d57c006ab035b) {
            self animmode("gravity");
            break;
        }
        wait(0.05);
    }
}

// Namespace shared/namespace_80c14191b262bb30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e
// Size: 0x17
function donothingfunc() {
    self animmode("zonly_physics");
    self waittill("killanimscript");
}

// Namespace shared/namespace_80c14191b262bb30
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6ac
// Size: 0x32
function dog_jump_down(frames, rate, var_d0527d58bb610197, var_5a11f5d9304a0c83) {
    /#
        assertmsg("if this is being called, something dreadfully wrong is happening.");
    #/
}

// Namespace shared/namespace_80c14191b262bb30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e5
// Size: 0xb
function seeker_traversal() {
    self waittill("killanimscript");
}

