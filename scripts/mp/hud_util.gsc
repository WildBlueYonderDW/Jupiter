// mwiii decomp prototype
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\game.gsc;

#namespace namespace_26a75045c9dd4bcb;

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c
// Size: 0xa9
function setparent(element) {
    if (isdefined(self.parent) && self.parent == element) {
        return;
    }
    if (isdefined(self.parent)) {
        self.parent removechild(self);
    }
    self.parent = element;
    self.parent addchild(self);
    if (isdefined(self.point)) {
        setpoint(self.point, self.relativepoint, self.xoffset, self.yoffset);
    } else {
        setpoint("TOPLEFT");
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c
// Size: 0xc
function getparent() {
    return self.parent;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330
// Size: 0xb1
function removedestroyedchildren() {
    if (isdefined(self.childchecktime) && self.childchecktime == gettime()) {
        return;
    }
    self.childchecktime = gettime();
    var_3ddcdb8c8d35246a = [];
    foreach (child in self.children) {
        if (!isdefined(child)) {
            continue;
        }
        child.index = var_3ddcdb8c8d35246a.size;
        var_3ddcdb8c8d35246a[var_3ddcdb8c8d35246a.size] = child;
    }
    self.children = var_3ddcdb8c8d35246a;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x3f
function addchild(element) {
    element.index = self.children.size;
    self.children[self.children.size] = element;
    removedestroyedchildren();
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e
// Size: 0xad
function removechild(element) {
    element.parent = undefined;
    if (self.children[self.children.size - 1] != element) {
        self.children[element.index] = self.children[self.children.size - 1];
        self.children[element.index].index = element.index;
    }
    self.children[self.children.size - 1] = undefined;
    element.index = undefined;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e2
// Size: 0x402
function setpoint(point, relativepoint, xoffset, yoffset, movetime) {
    if (!isdefined(movetime)) {
        movetime = 0;
    }
    element = getparent();
    if (movetime) {
        self moveovertime(movetime);
    }
    if (!isdefined(xoffset)) {
        xoffset = 0;
    }
    self.xoffset = xoffset;
    if (!isdefined(yoffset)) {
        yoffset = 0;
    }
    self.yoffset = yoffset;
    self.point = point;
    self.alignx = "center";
    self.aligny = "middle";
    if (issubstr(point, "TOP")) {
        self.aligny = "top";
    }
    if (issubstr(point, "BOTTOM")) {
        self.aligny = "bottom";
    }
    if (issubstr(point, "LEFT")) {
        self.alignx = "left";
    }
    if (issubstr(point, "RIGHT")) {
        self.alignx = "right";
    }
    if (!isdefined(relativepoint)) {
        relativepoint = point;
    }
    self.relativepoint = relativepoint;
    relativex = "center_adjustable";
    relativey = "middle";
    if (issubstr(relativepoint, "TOP")) {
        relativey = "top_adjustable";
    }
    if (issubstr(relativepoint, "BOTTOM")) {
        relativey = "bottom_adjustable";
    }
    if (issubstr(relativepoint, "LEFT")) {
        relativex = "left_adjustable";
    }
    if (issubstr(relativepoint, "RIGHT")) {
        relativex = "right_adjustable";
    }
    if (element == level.uiparent) {
        self.horzalign = relativex;
        self.vertalign = relativey;
    } else {
        self.horzalign = element.horzalign;
        self.vertalign = element.vertalign;
    }
    if (strip_suffix(relativex, "_adjustable") == element.alignx) {
        offsetx = 0;
        xfactor = 0;
    } else if (relativex == "center" || element.alignx == "center") {
        offsetx = int(element.width / 2);
        if (relativex == "left_adjustable" || element.alignx == "right") {
            xfactor = -1;
        } else {
            xfactor = 1;
        }
    } else {
        offsetx = element.width;
        if (relativex == "left_adjustable") {
            xfactor = -1;
        } else {
            xfactor = 1;
        }
    }
    self.x = element.x + offsetx * xfactor;
    if (strip_suffix(relativey, "_adjustable") == element.aligny) {
        offsety = 0;
        yfactor = 0;
    } else if (relativey == "middle" || element.aligny == "middle") {
        offsety = int(element.height / 2);
        if (relativey == "top_adjustable" || element.aligny == "bottom") {
            yfactor = -1;
        } else {
            yfactor = 1;
        }
    } else {
        offsety = element.height;
        if (relativey == "top_adjustable") {
            yfactor = -1;
        } else {
            yfactor = 1;
        }
    }
    self.y = element.y + offsety * yfactor;
    self.x = self.x + self.xoffset;
    self.y = self.y + self.yoffset;
    switch (self.elemtype) {
    case #"hash_2125856c1b2381fa":
        setpointbar(point, relativepoint, xoffset, yoffset);
        break;
    }
    updatechildren();
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x1c9
function setpointbar(point, relativepoint, xoffset, yoffset) {
    self.bar.horzalign = self.horzalign;
    self.bar.vertalign = self.vertalign;
    self.bar.alignx = "left";
    self.bar.aligny = self.aligny;
    self.bar.y = self.y;
    if (self.alignx == "left") {
        self.bar.x = self.x;
    } else if (self.alignx == "right") {
        self.bar.x = self.x - self.width;
    } else {
        self.bar.x = self.x - int(self.width / 2);
    }
    if (self.aligny == "top") {
        self.bar.y = self.y;
    } else if (self.aligny == "bottom") {
        self.bar.y = self.y;
    }
    updatebar(self.bar.frac);
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabb
// Size: 0x2f
function updatebar(barfrac, rateofchange) {
    if (self.elemtype == "bar") {
        updatebarscale(barfrac, rateofchange);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf1
// Size: 0x189
function updatebarscale(barfrac, rateofchange) {
    barwidth = int(self.width * barfrac + 0.5);
    if (!barwidth) {
        barwidth = 1;
    }
    self.bar.frac = barfrac;
    self.bar setshader(self.bar.shader, barwidth, self.height);
    /#
        assertex(barwidth <= self.width, "barWidth <= self.width: " + barwidth + " <= " + self.width + " - barFrac was " + barfrac);
    #/
    if (isdefined(rateofchange) && barwidth < self.width) {
        if (rateofchange > 0) {
            /#
                assertex((1 - barfrac) / rateofchange > 0, "barFrac: " + barfrac + "rateOfChange: " + rateofchange);
            #/
            self.bar scaleovertime((1 - barfrac) / rateofchange, self.width, self.height);
        } else if (rateofchange < 0) {
            /#
                assertex(barfrac / -1 * rateofchange > 0, "barFrac: " + barfrac + "rateOfChange: " + rateofchange);
            #/
            self.bar scaleovertime(barfrac / -1 * rateofchange, 1, self.height);
        }
    }
    self.bar.rateofchange = rateofchange;
    self.bar.lastupdatetime = gettime();
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc81
// Size: 0x1a7
function createhudelem(label, value, point, relativepoint, xoffset, yoffset, color, team, fontscale, player) {
    if (!isdefined(fontscale)) {
        fontscale = 1.5;
    }
    if (isdefined(team)) {
        fontelem = newteamhudelem(team);
    } else if (isdefined(player)) {
        fontelem = newclienthudelem(player);
    } else {
        fontelem = newhudelem();
    }
    fontelem.elemtype = "font";
    fontelem.font = "default";
    fontelem.fontscale = fontscale;
    fontelem.basefontscale = fontscale;
    fontelem.x = 0;
    fontelem.y = 0;
    fontelem.width = 0;
    fontelem.height = int(level.fontheight * fontscale);
    fontelem.xoffset = 0;
    fontelem.yoffset = 0;
    fontelem.children = [];
    fontelem setparent(level.uiparent);
    fontelem.hidden = 0;
    fontelem.alpha = 0;
    fontelem setpoint(point, relativepoint, xoffset, yoffset);
    if (isdefined(label)) {
        fontelem.label = label;
    }
    if (isdefined(value)) {
        fontelem setvalue(value);
    }
    if (isdefined(color)) {
        fontelem.color = color;
    }
    return fontelem;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe30
// Size: 0xe6
function createfontstring(font, fontscale) {
    fontelem = newclienthudelem(self);
    fontelem.elemtype = "font";
    fontelem.font = font;
    fontelem.fontscale = fontscale;
    fontelem.basefontscale = fontscale;
    fontelem.x = 0;
    fontelem.y = 0;
    fontelem.width = 0;
    fontelem.height = int(level.fontheight * fontscale);
    fontelem.xoffset = 0;
    fontelem.yoffset = 0;
    fontelem.children = [];
    fontelem setparent(level.uiparent);
    fontelem.hidden = 0;
    return fontelem;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1e
// Size: 0xfd
function createservertimer(font, fontscale, team) {
    if (isdefined(team)) {
        var_4908ca330bdc48d1 = newteamhudelem(team);
    } else {
        var_4908ca330bdc48d1 = newhudelem();
    }
    var_4908ca330bdc48d1.elemtype = "timer";
    var_4908ca330bdc48d1.font = font;
    var_4908ca330bdc48d1.fontscale = fontscale;
    var_4908ca330bdc48d1.basefontscale = fontscale;
    var_4908ca330bdc48d1.x = 0;
    var_4908ca330bdc48d1.y = 0;
    var_4908ca330bdc48d1.width = 0;
    var_4908ca330bdc48d1.height = int(level.fontheight * fontscale);
    var_4908ca330bdc48d1.xoffset = 0;
    var_4908ca330bdc48d1.yoffset = 0;
    var_4908ca330bdc48d1.children = [];
    var_4908ca330bdc48d1 setparent(level.uiparent);
    var_4908ca330bdc48d1.hidden = 0;
    return var_4908ca330bdc48d1;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1023
// Size: 0xe6
function createtimer(font, fontscale) {
    var_4908ca330bdc48d1 = newclienthudelem(self);
    var_4908ca330bdc48d1.elemtype = "timer";
    var_4908ca330bdc48d1.font = font;
    var_4908ca330bdc48d1.fontscale = fontscale;
    var_4908ca330bdc48d1.basefontscale = fontscale;
    var_4908ca330bdc48d1.x = 0;
    var_4908ca330bdc48d1.y = 0;
    var_4908ca330bdc48d1.width = 0;
    var_4908ca330bdc48d1.height = int(level.fontheight * fontscale);
    var_4908ca330bdc48d1.xoffset = 0;
    var_4908ca330bdc48d1.yoffset = 0;
    var_4908ca330bdc48d1.children = [];
    var_4908ca330bdc48d1 setparent(level.uiparent);
    var_4908ca330bdc48d1.hidden = 0;
    return var_4908ca330bdc48d1;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1111
// Size: 0x102
function createicon(shader, width, height) {
    var_5b6a2597d526bd27 = newclienthudelem(self);
    var_5b6a2597d526bd27.elemtype = "icon";
    var_5b6a2597d526bd27.x = 0;
    var_5b6a2597d526bd27.y = 0;
    var_5b6a2597d526bd27.width = width;
    var_5b6a2597d526bd27.height = height;
    var_5b6a2597d526bd27.basewidth = var_5b6a2597d526bd27.width;
    var_5b6a2597d526bd27.baseheight = var_5b6a2597d526bd27.height;
    var_5b6a2597d526bd27.xoffset = 0;
    var_5b6a2597d526bd27.yoffset = 0;
    var_5b6a2597d526bd27.children = [];
    var_5b6a2597d526bd27 setparent(level.uiparent);
    var_5b6a2597d526bd27.hidden = 0;
    if (isdefined(shader)) {
        var_5b6a2597d526bd27 setshader(shader, width, height);
        var_5b6a2597d526bd27.shader = shader;
    }
    return var_5b6a2597d526bd27;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121b
// Size: 0x190
function createbar(color, width, height, flashfrac) {
    barelem = newclienthudelem(self);
    barelem.x = 0;
    barelem.y = 0;
    barelem.frac = 0;
    barelem.color = color;
    barelem.sort = -2;
    barelem.shader = "progress_bar_fill";
    barelem setshader("progress_bar_fill", width, height);
    barelem.hidden = 0;
    if (isdefined(flashfrac)) {
        barelem.flashfrac = flashfrac;
    }
    barelembg = newclienthudelem(self);
    barelembg.elemtype = "bar";
    barelembg.width = width;
    barelembg.height = height;
    barelembg.xoffset = 0;
    barelembg.yoffset = 0;
    barelembg.bar = barelem;
    barelembg.children = [];
    barelembg.sort = -3;
    barelembg.color = (0, 0, 0);
    barelembg.alpha = 0.5;
    barelembg setparent(level.uiparent);
    barelembg setshader("progress_bar_bg", width + 4, height + 4);
    barelembg.hidden = 0;
    return barelembg;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b3
// Size: 0x7e
function getcurrentfraction() {
    frac = self.bar.frac;
    if (isdefined(self.bar.rateofchange)) {
        frac = frac + (gettime() - self.bar.lastupdatetime) * self.bar.rateofchange;
        if (frac > 1) {
            frac = 1;
        }
        if (frac < 0) {
            frac = 0;
        }
    }
    return frac;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1439
// Size: 0x94
function createprimaryprogressbar(xoffset, yoffset) {
    if (isagent(self)) {
        return undefined;
    }
    if (!isdefined(xoffset)) {
        xoffset = 0;
    }
    if (!isdefined(yoffset)) {
        yoffset = -25;
    }
    if (self issplitscreenplayer()) {
        yoffset = yoffset + 20;
    }
    bar = createbar((1, 1, 1), level.primaryprogressbarwidth, level.primaryprogressbarheight);
    bar setpoint("CENTER", undefined, level.primaryprogressbarx + xoffset, level.primaryprogressbary + yoffset);
    return bar;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14d5
// Size: 0x94
function function_c6071a6e72a4f025(xoffset, yoffset, var_43e267f4c4a6df1, var_60eda195b9af04c0) {
    if (isagent(self)) {
        return undefined;
    }
    if (!isdefined(xoffset)) {
        xoffset = 0;
    }
    if (!isdefined(yoffset)) {
        yoffset = -25;
    }
    if (self issplitscreenplayer()) {
        yoffset = yoffset + 20;
    }
    bar = createbar((1, 1, 1), var_43e267f4c4a6df1, var_60eda195b9af04c0);
    bar setpoint("CENTER", undefined, level.primaryprogressbarx + xoffset, level.primaryprogressbary + yoffset);
    return bar;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1571
// Size: 0xcb
function createprimaryprogressbartext(xoffset, yoffset, var_780737a0c9ec4ab5, var_76ac8a084f06ea85) {
    if (isagent(self)) {
        return undefined;
    }
    if (!isdefined(xoffset)) {
        xoffset = 0;
    }
    if (!isdefined(yoffset)) {
        yoffset = -25;
    }
    if (self issplitscreenplayer()) {
        yoffset = yoffset + 20;
    }
    var_f0778934c2c7e788 = level.primaryprogressbarfontsize;
    font = "default";
    if (isdefined(var_780737a0c9ec4ab5)) {
        var_f0778934c2c7e788 = var_780737a0c9ec4ab5;
    }
    if (isdefined(var_76ac8a084f06ea85)) {
        font = var_76ac8a084f06ea85;
    }
    text = createfontstring(font, var_f0778934c2c7e788);
    text setpoint("CENTER", undefined, level.primaryprogressbartextx + xoffset, level.primaryprogressbartexty + yoffset);
    text.sort = -1;
    return text;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1644
// Size: 0x21
function setflashfrac(flashfrac) {
    self.bar.flashfrac = flashfrac;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x166c
// Size: 0xc0
function hideelem() {
    if (!isdefined(self.hidden)) {
        self.hidden = 0;
    }
    if (self.hidden) {
        return;
    }
    self.hidden = 1;
    if (self.alpha != 0) {
        self.alpha = 0;
    }
    if (isdefined(self.elemtype) && (self.elemtype == "bar" || self.elemtype == "bar_shader")) {
        self.bar.hidden = 1;
        if (self.bar.alpha != 0) {
            self.bar.alpha = 0;
        }
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1733
// Size: 0xce
function showelem() {
    if (!self.hidden) {
        return;
    }
    self.hidden = 0;
    if (isdefined(self.elemtype) && (self.elemtype == "bar" || self.elemtype == "bar_shader")) {
        if (self.alpha != 0.5) {
            self.alpha = 0.5;
        }
        self.bar.hidden = 0;
        if (self.bar.alpha != 1) {
            self.bar.alpha = 1;
        }
    } else if (self.alpha != 1) {
        self.alpha = 1;
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1808
// Size: 0xb9
function flashthread() {
    self endon("death");
    if (!self.hidden) {
        self.alpha = 1;
    }
    while (1) {
        if (self.frac >= self.flashfrac) {
            if (!self.hidden) {
                self fadeovertime(0.3);
                self.alpha = 0.2;
                wait(0.35);
                self fadeovertime(0.3);
                self.alpha = 1;
            }
            wait(0.7);
        } else {
            if (!self.hidden && self.alpha != 1) {
                self.alpha = 1;
            }
            wait(0.05);
        }
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c8
// Size: 0xaa
function destroyelem() {
    tempchildren = [];
    for (index = 0; index < self.children.size; index++) {
        if (isdefined(self.children[index])) {
            tempchildren[tempchildren.size] = self.children[index];
        }
    }
    for (index = 0; index < tempchildren.size; index++) {
        tempchildren[index] setparent(getparent());
    }
    if (self.elemtype == "bar" || self.elemtype == "bar_shader") {
        self.bar destroy();
    }
    self destroy();
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1979
// Size: 0x30
function seticonshader(shader) {
    self setshader(shader, self.width, self.height);
    self.shader = shader;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19b0
// Size: 0x15
function geticonshader(shader) {
    return self.shader;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19cd
// Size: 0x39
function seticonsize(width, height) {
    /#
        assert(isdefined(self.shader));
    #/
    self setshader(self.shader, width, height);
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0d
// Size: 0x16
function setwidth(width) {
    self.width = width;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a2a
// Size: 0x16
function setheight(height) {
    self.height = height;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a47
// Size: 0x28
function setsize(width, height) {
    self.width = width;
    self.height = height;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a76
// Size: 0x6e
function updatechildren() {
    for (index = 0; index < self.children.size; index++) {
        child = self.children[index];
        child setpoint(child.point, child.relativepoint, child.xoffset, child.yoffset);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aeb
// Size: 0x9a
function transitionreset() {
    self.x = self.xoffset;
    self.y = self.yoffset;
    if (self.elemtype == "font") {
        self.fontscale = self.basefontscale;
        self.label = "";
    } else if (self.elemtype == "icon") {
        self setshader(self.shader, self.width, self.height);
    }
    self.alpha = 0;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8c
// Size: 0xb1
function transitionzoomin(duration) {
    switch (self.elemtype) {
    case #"hash_7d97db7c4e68ac02":
    case #"hash_fb98191526a6d8f0":
        self.fontscale = 6.3;
        self changefontscaleovertime(duration);
        self.fontscale = self.basefontscale;
        break;
    case #"hash_502e6f4e764c2750":
        self setshader(self.shader, self.width * 6, self.height * 6);
        self scaleovertime(duration, self.width, self.height);
        break;
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c44
// Size: 0x8b
function transitionpulsefxin(var_187ef7fae5a4f6f3, duration) {
    transtime = int(var_187ef7fae5a4f6f3) * 1000;
    showtime = int(duration) * 1000;
    switch (self.elemtype) {
    case #"hash_7d97db7c4e68ac02":
    case #"hash_fb98191526a6d8f0":
        self setpulsefx(transtime + 250, showtime + transtime, transtime + 250);
        break;
    default:
        break;
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd6
// Size: 0xe9
function transitionslidein(duration, direction) {
    if (!isdefined(direction)) {
        direction = "left";
    }
    switch (direction) {
    case #"hash_c9b3133a17a3b2d0":
        self.x = self.x + 1000;
        break;
    case #"hash_96815ce4f2a3dbc5":
        self.x = self.x - 1000;
        break;
    case #"hash_fa3db8f6bd73eb80":
        self.y = self.y - 1000;
        break;
    case #"hash_f91b350a054b6175":
        self.y = self.y + 1000;
        break;
    }
    self moveovertime(duration);
    self.x = self.xoffset;
    self.y = self.yoffset;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc6
// Size: 0xd0
function transitionslideout(duration, direction) {
    if (!isdefined(direction)) {
        direction = "left";
    }
    var_dc7e30144bc463ce = self.xoffset;
    var_dc7e31144bc46601 = self.yoffset;
    switch (direction) {
    case #"hash_c9b3133a17a3b2d0":
        var_dc7e30144bc463ce = var_dc7e30144bc463ce + 1000;
        break;
    case #"hash_96815ce4f2a3dbc5":
        var_dc7e30144bc463ce = var_dc7e30144bc463ce - 1000;
        break;
    case #"hash_fa3db8f6bd73eb80":
        var_dc7e31144bc46601 = var_dc7e31144bc46601 - 1000;
        break;
    case #"hash_f91b350a054b6175":
        var_dc7e31144bc46601 = var_dc7e31144bc46601 + 1000;
        break;
    }
    self.alpha = 1;
    self moveovertime(duration);
    self.x = var_dc7e30144bc463ce;
    self.y = var_dc7e31144bc46601;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9d
// Size: 0x7a
function transitionzoomout(duration) {
    switch (self.elemtype) {
    case #"hash_7d97db7c4e68ac02":
    case #"hash_fb98191526a6d8f0":
        self changefontscaleovertime(duration);
        self.fontscale = 6.3;
    case #"hash_502e6f4e764c2750":
        self scaleovertime(duration, self.width * 6, self.height * 6);
        break;
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1e
// Size: 0x41
function transitionfadein(duration) {
    self fadeovertime(duration);
    if (isdefined(self.maxalpha)) {
        self.alpha = self.maxalpha;
    } else {
        self.alpha = 1;
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f66
// Size: 0x22
function transitionfadeout(duration) {
    self fadeovertime(0.15);
    self.alpha = 0;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f8f
// Size: 0x1d2
function teamplayercardsplash(splash, owner, team, optionalnumber, var_b7abc0284e13ca7a) {
    if (!canshowsplash(splash)) {
        return;
    }
    var_b7abc0284e13ca7a = istrue(var_b7abc0284e13ca7a);
    if (namespace_36f464722d326bbe::islargebrmap()) {
        friendlyplayers = namespace_54d20dd0dd79277f::getteamdata(owner.team, "players");
        if (isdefined(friendlyplayers)) {
            foreach (player in friendlyplayers) {
                if (!isdefined(player) || !namespace_7e17181d03156026::isreallyalive(player) || player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                    continue;
                }
                if (var_b7abc0284e13ca7a && isplayer(owner) && player == owner) {
                    continue;
                }
                player thread namespace_44abc05161e2e2cb::showsplash(splash, optionalnumber, owner);
            }
        }
    } else {
        foreach (player in level.players) {
            if (player iscodcaster()) {
                var_13c5603d4beea2fc = player getspectatingplayer();
                if (isdefined(var_13c5603d4beea2fc) && isdefined(team) && var_13c5603d4beea2fc.team != team) {
                    continue;
                }
            } else {
                if (!isplayer(player)) {
                    continue;
                }
                if (isdefined(team) && player.team != team) {
                    continue;
                }
                if (var_b7abc0284e13ca7a && isplayer(owner) && player == owner) {
                    continue;
                }
            }
            player thread namespace_44abc05161e2e2cb::showsplash(splash, optionalnumber, owner);
        }
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2168
// Size: 0x85
function function_7b2653a588f28e29(owner, var_34c19b030fb21cc7, var_274d4f09b844d959, var_b94346d9018fe098, var_b7abc0284e13ca7a, var_f5c11d099500e94e, var_6acc43fa4db03a7f, var_6ad135fa4db6448c) {
    if (canshowsplash(var_34c19b030fb21cc7) && !istrue(var_b7abc0284e13ca7a)) {
        owner thread namespace_44abc05161e2e2cb::showsplash(var_34c19b030fb21cc7, var_f5c11d099500e94e, owner);
    }
    level thread namespace_44abc05161e2e2cb::notifyteam(var_274d4f09b844d959, var_b94346d9018fe098, owner.team, [0:owner], var_6acc43fa4db03a7f, var_6ad135fa4db6448c, owner);
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f4
// Size: 0xd6
function iskillstreakcalloutsplash(splash) {
    var_ef41235a89500ad8 = 0;
    if (issubstr(splash, "used_")) {
        var_475639ea36ea224b = strtok(splash, "_");
        killstreakref = undefined;
        foreach (tok in var_475639ea36ea224b) {
            if (tok == "used") {
                continue;
            }
            if (!isdefined(killstreakref)) {
                killstreakref = tok;
            } else {
                killstreakref = killstreakref + "_" + tok;
            }
        }
        if (isdefined(killstreakref) && isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac[killstreakref])) {
            var_ef41235a89500ad8 = 1;
        }
    }
    return var_ef41235a89500ad8;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d2
// Size: 0x17
function iseventcalloutsplash(splash) {
    return issubstr(splash, "callout_");
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f1
// Size: 0x97
function getbaseeventcalloutsplash(splash) {
    var_4544740304048f3 = undefined;
    var_64e9e0e7c5b091ab = strtok(splash, "_");
    foreach (tok in var_64e9e0e7c5b091ab) {
        if (tok == "callout") {
            continue;
        }
        if (!isdefined(var_4544740304048f3)) {
            var_4544740304048f3 = tok;
        } else {
            var_4544740304048f3 = var_4544740304048f3 + "_" + tok;
        }
    }
    return var_4544740304048f3;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2390
// Size: 0x1bc
function canshowsplash(splash) {
    if (istrue(level.var_e028ca551ecc95a3) || namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return 0;
    }
    if (!isdefined(splash) || splash == "") {
        return 0;
    }
    var_2b6edac9af839814 = 1;
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        if (iseventcalloutsplash(splash)) {
            var_4544740304048f3 = getbaseeventcalloutsplash(splash);
            switch (var_4544740304048f3) {
            case #"hash_37c71ce8ac0e2195":
            case #"hash_44f3835e85deb518":
            case #"hash_55016d1c29bc8e41":
            case #"hash_734f5ecda7227872":
            case #"hash_7e105520842ac343":
            case #"hash_912fa2cd3f4a5914":
            case #"hash_cf771f343d6b37bb":
            case #"hash_dfba1b37885d879e":
                var_2b6edac9af839814 = 0;
                break;
            }
        }
    } else {
        switch (namespace_cd0b2d039510b38d::getgametype()) {
        case #"hash_ca6516c10db2c95":
        case #"hash_5e78ea9021845d4a":
        case #"hash_7f9c384a34cc392f":
        case #"hash_8f01ce022684fbc8":
        case #"hash_bc5ad0664c3cc103":
            if (iskillstreakcalloutsplash(splash)) {
                var_2b6edac9af839814 = 0;
            } else if (iseventcalloutsplash(splash)) {
                var_4544740304048f3 = getbaseeventcalloutsplash(splash);
                switch (var_4544740304048f3) {
                case #"hash_37c71ce8ac0e2195":
                case #"hash_44f3835e85deb518":
                case #"hash_55016d1c29bc8e41":
                case #"hash_734f5ecda7227872":
                case #"hash_7e105520842ac343":
                case #"hash_912fa2cd3f4a5914":
                case #"hash_cf771f343d6b37bb":
                case #"hash_dfba1b37885d879e":
                    var_2b6edac9af839814 = 0;
                    break;
                }
            }
            break;
        }
    }
    return var_2b6edac9af839814;
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2554
// Size: 0x92
function showsplashtoall(splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6) {
    foreach (player in level.players) {
        player namespace_44abc05161e2e2cb::showsplash(splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ed
// Size: 0xa3
function showsplashtoteam(team, splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6) {
    foreach (player in level.teamdata[team]["players"]) {
        player namespace_44abc05161e2e2cb::showsplash(splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6);
    }
}

// Namespace namespace_26a75045c9dd4bcb/namespace_52f6938dd902c7d0
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2697
// Size: 0xb1
function showsplashtoallexceptteam(team, splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6) {
    foreach (player in level.players) {
        if (isdefined(player) && player.team != team) {
            player namespace_44abc05161e2e2cb::showsplash(splashname, optionalnumber, playerforplayercard, altdisplayindex, var_ef4849b4cb3ac7e2, var_42b1e877ab187c6);
        }
    }
}

