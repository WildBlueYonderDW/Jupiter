// mwiii decomp prototype
#namespace hud;

// Namespace hud/namespace_95fef46456ed271b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd
// Size: 0x1c2
function init() {
    level.uiparent = spawnstruct();
    level.uiparent.horzalign = "left";
    level.uiparent.vertalign = "top";
    level.uiparent.alignx = "left";
    level.uiparent.aligny = "top";
    level.uiparent.x = 0;
    level.uiparent.y = 0;
    level.uiparent.width = 0;
    level.uiparent.height = 0;
    level.uiparent.children = [];
    level.fontheight = 12;
    level.hud["allies"] = spawnstruct();
    level.hud["axis"] = spawnstruct();
    level.primaryprogressbary = -61;
    level.primaryprogressbarx = 0;
    level.primaryprogressbarheight = 9;
    level.primaryprogressbarwidth = 120;
    level.primaryprogressbartexty = -75;
    level.primaryprogressbartextx = 0;
    level.primaryprogressbarfontsize = 1.2;
    level.teamprogressbary = 32;
    level.teamprogressbarheight = 14;
    level.teamprogressbarwidth = 192;
    level.teamprogressbartexty = 8;
    level.teamprogressbarfontsize = 1.65;
    level.lowertextyalign = "BOTTOM";
    level.lowertexty = -155;
    level.lowertextfontsize = 1.6;
}

// Namespace hud/namespace_95fef46456ed271b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286
// Size: 0x6f
function fontpulseinit(maxfontscale) {
    self.basefontscale = self.fontscale;
    if (isdefined(maxfontscale)) {
        self.maxfontscale = min(maxfontscale, 6.3);
    } else {
        self.maxfontscale = min(self.fontscale * 2, 6.3);
    }
    self.inframes = 2;
    self.outframes = 4;
}

// Namespace hud/namespace_95fef46456ed271b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc
// Size: 0x97
function fontpulse(player) {
    self notify("fontPulse");
    self endon("fontPulse");
    self endon("death");
    player endon("disconnect");
    player endon("joined_team");
    player endon("joined_spectators");
    self changefontscaleovertime(self.inframes * 0.05);
    self.fontscale = self.maxfontscale;
    wait(self.inframes * 0.05);
    self changefontscaleovertime(self.outframes * 0.05);
    self.fontscale = self.basefontscale;
}

