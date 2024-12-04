#using scripts\asm\asm;
#using scripts\common\notetrack;
#using scripts\sp\anim;

#namespace animmode;

// Namespace animmode / namespace_435a398e8d989a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0x3fe
function main() {
    self endon("death");
    self endon("stop_animmode");
    self notify("killanimscript");
    self._tag_entity endon(self._anime);
    if (isdefined(self._custom_anim_thread)) {
        self thread [[ self._custom_anim_thread ]]();
        self._custom_anim_thread = undefined;
    }
    loop = isdefined(self._custom_anim_loop) && self._custom_anim_loop;
    if (loop) {
        self endon("stop_loop");
        self._custom_anim_loop = undefined;
    } else {
        thread notify_on_end(self._anime);
    }
    anime = self._anime;
    self._anime = undefined;
    arraysize = 0;
    if (loop) {
        arraysize = level.scr_anim[self._animname][anime].size;
        animationname = level.scr_anim[self._animname][anime][randomint(arraysize)];
    } else {
        animationname = level.scr_anim[self._animname][anime];
    }
    origin = getstartorigin(self._tag_entity.origin, self._tag_entity.angles, animationname);
    angles = getstartangles(self._tag_entity.origin, self._tag_entity.angles, animationname);
    neworigin = self getdroptofloorposition(origin);
    if (isdefined(neworigin)) {
        origin = neworigin;
    } else {
        println("<dev string:x1c>" + self getentitynumber() + "<dev string:x52>");
    }
    if (!isdefined(self.noteleport)) {
        self teleport(origin, angles);
    }
    self.pushable = 0;
    clear_time = 0.3;
    blend_time = 0.2;
    if (isdefined(self.anim_blend_time_override)) {
        clear_time = self.anim_blend_time_override;
        blend_time = self.anim_blend_time_override;
    }
    self animmode(self._animmode);
    self clearanim(asm_getroot(), 0.3);
    facialknob = asm_getfacialknob();
    if (isdefined(facialknob)) {
        self setanim(facialknob, 1, 0.3, 1);
    }
    self orientmode("face angle", angles[1]);
    self animmode("zonly_physics", 1);
    anim_string = "custom_animmode";
    self setflaggedanimrestart(anim_string, animationname, 1, blend_time, 1);
    self._tag_entity thread scripts\common\notetrack::start_notetrack_wait(self, anim_string, anime, self._animname, animationname);
    self._tag_entity thread scripts\sp\anim::animscriptdonotetracksthread(self, anim_string, anime);
    tag_entity = self._tag_entity;
    self._tag_entity = undefined;
    self._animmode = undefined;
    self endon("killanimscript");
    var_53706a74886acebc = "end";
    if (!loop) {
        if (animhasnotetrack(animationname, "finish")) {
            var_53706a74886acebc = "finish";
        } else if (animhasnotetrack(animationname, "stop anim")) {
            var_53706a74886acebc = "stop anim";
        }
    }
    while (true) {
        self waittillmatch(anim_string, var_53706a74886acebc);
        if (loop) {
            animationname = level.scr_anim[self._animname][anime][randomint(arraysize)];
            self setflaggedanimknoblimitedrestart(anim_string, animationname, 1, 0.2, 1);
            if (isdefined(tag_entity)) {
                tag_entity thread scripts\common\notetrack::start_notetrack_wait(self, anim_string, anime, self._animname, animationname);
                tag_entity thread scripts\sp\anim::animscriptdonotetracksthread(self, anim_string, anime);
            }
            continue;
        }
        break;
    }
    if (var_53706a74886acebc != "end") {
        self orientmode("face motion");
    }
    self notify("finished_custom_animmode" + anime);
}

// Namespace animmode / namespace_435a398e8d989a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x516
// Size: 0x2d
function notify_on_end(msg) {
    self endon("death");
    self endon("finished_custom_animmode" + msg);
    self waittill("killanimscript");
    self notify("finished_custom_animmode" + msg);
}

