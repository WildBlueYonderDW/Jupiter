// mwiii decomp prototype
#using script_7e4d332e911e1b90;
#using scripts\anim\utility_common.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\notetrack.gsc;
#using script_3433ee6b63c7e243;
#using script_13d1c402f1421c35;
#using scripts\anim\weaponlist.gsc;
#using scripts\common\gameskill.gsc;
#using scripts\common\ai.gsc;
#using scripts\asm\asm_bb.gsc;
#using script_7d535542e36d66f9;
#using scripts\anim\animselector.gsc;

#namespace shared;

// Namespace shared/namespace_223959d3e5206cfb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d
// Size: 0x1cb
function placeweaponon(weapon, position, activeweapon) {
    /#
        assert(isdefined(weapon));
    #/
    var_9843089f949dca89 = undefined;
    var_9c4df3d7151c3fcf = undefined;
    if (isweapon(weapon)) {
        var_9843089f949dca89 = weapon;
        var_9c4df3d7151c3fcf = getcompleteweaponname(weapon);
    } else {
        var_9843089f949dca89 = makeweaponfromstring(weapon);
        var_9c4df3d7151c3fcf = weapon;
    }
    /#
        assert(aihasweapon(var_9843089f949dca89));
    #/
    self notify("weapon_position_change");
    curposition = self.weaponinfo[var_9c4df3d7151c3fcf].position;
    /#
        assert(curposition == "none" || isdefined(self.a.weaponpos[curposition]) && self.a.weaponpos[curposition] == var_9843089f949dca89);
    #/
    if (position != "none" && isdefined(self.a.weaponpos[position]) && self.a.weaponpos[position] == var_9843089f949dca89) {
        return;
    }
    detachallweaponmodels();
    if (curposition != "none") {
        detachweapon(var_9843089f949dca89);
    }
    if (position == "none") {
        updateattachedweaponmodels();
        return;
    }
    if (!isundefinedweapon(self.a.weaponpos[position])) {
        detachweapon(self.a.weaponpos[position]);
    }
    if (!isdefined(activeweapon)) {
        activeweapon = 1;
    }
    if (activeweapon && (position == "left" || position == "right")) {
        attachweapon(var_9843089f949dca89, position);
        self.weapon = var_9843089f949dca89;
    } else {
        attachweapon(var_9843089f949dca89, position);
    }
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91f
// Size: 0x70
function detachweapon(objweapon) {
    /#
        assert(isweapon(objweapon));
    #/
    weaponname = getcompleteweaponname(objweapon);
    self.a.weaponpos[self.weaponinfo[weaponname].position] = undefined;
    self.weaponinfo[weaponname].position = "none";
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x996
// Size: 0x9e
function attachweapon(objweapon, position) {
    /#
        assert(isweapon(objweapon));
    #/
    weaponname = getcompleteweaponname(objweapon);
    self.weaponinfo[weaponname].position = position;
    self.a.weaponpos[position] = objweapon;
    if (!isundefinedweapon(self.a.weaponposdropping[position])) {
        self notify("end_weapon_drop_" + position);
        self.a.weaponposdropping[position] = undefined;
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3b
// Size: 0x97
function getweaponforpos(position) {
    if (!isdefined(self.a)) {
        return undefined;
    }
    if (!isdefined(self.a.weaponpos)) {
        return undefined;
    }
    weapon = self.a.weaponpos[position];
    if (isundefinedweapon(weapon)) {
        return self.a.weaponposdropping[position];
    }
    /#
        assert(isundefinedweapon(self.a.weaponposdropping[position]));
    #/
    return weapon;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada
// Size: 0x114
function detachallweaponmodels() {
    positions = [];
    positions[positions.size] = "right";
    positions[positions.size] = "left";
    positions[positions.size] = "chest";
    positions[positions.size] = "back";
    positions[positions.size] = "thigh";
    positions[positions.size] = "inhand";
    self laseroff();
    foreach (position in positions) {
        weapon = getweaponforpos(position);
        if (isundefinedweapon(weapon)) {
            continue;
        }
        if (weapontype(weapon) == "riotshield" && isdefined(self.shieldmodelvariant)) {
            if (isdefined(self.shieldbroken) && self.shieldbroken) {
                playfxontag(getfx("riot_shield_dmg"), self, "TAG_BRASS");
                self.shieldbroken = undefined;
            }
        }
    }
    self updateentitywithweapons();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf5
// Size: 0x1e8
function updateattachedweaponmodels() {
    positions = [];
    weapons = [];
    tags = [];
    positions[positions.size] = "right";
    positions[positions.size] = "left";
    positions[positions.size] = "chest";
    positions[positions.size] = "back";
    positions[positions.size] = "thigh";
    positions[positions.size] = "inhand";
    if (!isdefined(self.a)) {
        return;
    }
    if (!isdefined(self.a.weaponpos)) {
        return;
    }
    foreach (position in positions) {
        var_65b529aec2728ddc = weapons.size;
        weapon = getweaponforpos(position);
        if (!isundefinedweapon(weapon) && !isnullweapon(weapon)) {
            weaponname = getcompleteweaponname(weapon);
            if (self.weaponinfo[weaponname].useclip && !self.weaponinfo[weaponname].hasclip) {
                /#
                    assert(isdefined(weapon.magazine));
                #/
                weapon = weapon withoutattachment(weapon.magazine);
            }
        }
        if (isdefined(weapon)) {
            var_21ba9b0d87884688 = gettagforpos(position);
            if (self tagexists(var_21ba9b0d87884688)) {
                weapons[var_65b529aec2728ddc] = weapon;
                tags[tags.size] = var_21ba9b0d87884688;
            }
        }
    }
    /#
        if (weapons.size > 4) {
            /#
                assertmsg("loot");
            #/
        }
    #/
    self updateentitywithweapons(weapons[0], tags[0], weapons[1], tags[1], weapons[2], tags[2], weapons[3], tags[3]);
    self updatelaserstatus();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde4
// Size: 0xb2
function gettagforpos(position) {
    switch (position) {
    case #"hash_fc2fdaa21f480e36":
        return "tag_stowed_chest";
    case #"hash_5163a22eb8c03302":
        return "tag_stowed_back";
    case #"hash_c9b3133a17a3b2d0":
        return "tag_weapon_left";
    case #"hash_96815ce4f2a3dbc5":
        return "tag_weapon_right";
    case #"hash_cc8437548a4a4480":
        return "tag_accessory_right";
    case #"hash_c274ab81bf2a0f8f":
        return "tag_stowed_thigh";
    case #"hash_40f6fb4e52241d83":
        return "tag_inhand";
    default:
        /#
            assertmsg("unknown weapon placement position: " + position);
        #/
        break;
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9d
// Size: 0x13c
function dropaiweaponinternal(weapon) {
    if (function_335d7d001eb868f()) {
        if (weapon hasattachment(self.var_e0675e48962c6d55)) {
            namespace_223959d3e5206cfb::detachweapon(weapon);
            weapon = weapon withoutattachment(self.var_e0675e48962c6d55);
            namespace_223959d3e5206cfb::forceuseweapon(weapon, self.var_b5ce31099294cf74);
        }
    }
    weaponname = getcompleteweaponname(weapon);
    position = self.weaponinfo[weaponname].position;
    if (self.dropweapon && position != "none") {
        thread dropweaponwrapper(weapon, position);
    }
    detachweapon(weapon);
    if (weapon == self.weapon) {
        self.weapon = nullweapon();
    }
    if (weapon == self.primaryweapon) {
        self.primaryweapon = nullweapon();
    }
    if (weapon == self.secondaryweapon) {
        self.secondaryweapon = nullweapon();
    }
    if (weapon == self.sidearm) {
        if (!isnullweapon(self.primaryweapon)) {
            dropaiweaponinternal(self.primaryweapon);
        }
        self.sidearm = nullweapon();
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe0
// Size: 0xfd
function dropaiweapon(weapon) {
    if (!isdefined(weapon)) {
        weapon = self.weapon;
    }
    /#
        assert(isweapon(weapon));
    #/
    if (isnullweapon(weapon)) {
        return;
    }
    if (isdefined(self.nodrop)) {
        return;
    }
    detachallweaponmodels();
    dropaiweaponinternal(weapon);
    if (isnullweapon(self.primaryweapon)) {
        if (!isnullweapon(self.weapon)) {
            self.primaryweapon = self.weapon;
        } else if (!isnullweapon(self.secondaryweapon)) {
            self.primaryweapon = self.secondaryweapon;
        } else if (!isnullweapon(self.sidearm)) {
            self.primaryweapon = self.sidearm;
        }
        if (self.primaryweapon == self.secondaryweapon) {
            self.secondaryweapon = nullweapon();
        }
    }
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10e4
// Size: 0x195
function dropallaiweapons() {
    if (isdefined(self.nodrop)) {
        return "none";
    }
    if (!isdefined(self.a) || !isdefined(self.a.weaponpos)) {
        return;
    }
    positions = [];
    positions[positions.size] = "left";
    positions[positions.size] = "right";
    positions[positions.size] = "chest";
    positions[positions.size] = "back";
    positions[positions.size] = "thigh";
    positions[positions.size] = "inhand";
    detachallweaponmodels();
    foreach (position in positions) {
        weapon = self.a.weaponpos[position];
        if (isundefinedweapon(weapon)) {
            continue;
        }
        weaponname = getcompleteweaponname(weapon);
        self.weaponinfo[weaponname].position = "none";
        self.a.weaponpos[position] = undefined;
        if (function_335d7d001eb868f()) {
            if (weapon hasattachment(self.var_e0675e48962c6d55)) {
                weapon = weapon withoutattachment(self.var_e0675e48962c6d55);
            }
        }
        if (self.dropweapon) {
            thread dropweaponwrapper(weapon, position);
        }
    }
    self.weapon = nullweapon();
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1280
// Size: 0x390
function dropweaponwrapper(weapon, position) {
    if (self isragdoll()) {
        return "none";
    }
    /#
        assert(isundefinedweapon(self.a.weaponposdropping[position]));
    #/
    self.a.weaponposdropping[position] = weapon;
    var_cd9abe0e758cbdf7 = weapon;
    var_92fce7b1696254e3 = weapon.basename;
    if (issubstr(tolower(var_92fce7b1696254e3), "_ai")) {
        var_92fce7b1696254e3 = getsubstr(var_92fce7b1696254e3, 0, var_92fce7b1696254e3.size - 3);
        var_cd9abe0e758cbdf7 = makeweapon(var_92fce7b1696254e3, weapon.attachments);
        /#
            assertex(var_cd9abe0e758cbdf7.basename != "none", "Dropped weapon is null. Is " + weapon.basename + " an _AI weapon and the non _AI version isn't loaded?");
        #/
    }
    thread setdroppedweaponammo(var_cd9abe0e758cbdf7);
    if (isagent(self)) {
        if (isdefined(level.dropped_weapon_func)) {
            self thread [[ level.dropped_weapon_func ]](var_cd9abe0e758cbdf7, position);
        } else {
            self dropweaponnovelocity(var_cd9abe0e758cbdf7, position);
        }
        if (isalive(self)) {
            waitframe();
        }
    } else if (canaiflingweapon(self)) {
        if (position == "back" || position == "thigh") {
            tagname = "tag_stowed_" + position;
        } else {
            tagname = "tag_weapon_" + position;
        }
        if (!hastag(self.model, tagname)) {
            self dropweapon(var_cd9abe0e758cbdf7, position, 0);
            self endon("end_weapon_drop_" + position);
            waitframe();
            return;
        }
        var_ab0dc1928066d386 = self gettagorigin(tagname);
        self endon("end_weapon_drop_" + position);
        waitframe();
        if (!isdefined(self)) {
            return;
        }
        tagorigin = self gettagorigin(tagname);
        tagangles = self gettagangles(tagname);
        var_93cd9b84a4e18201 = getcompleteweaponname(var_cd9abe0e758cbdf7);
        var_ac9bc7d09525b92a = spawn("weapon_" + var_93cd9b84a4e18201, tagorigin);
        var_ac9bc7d09525b92a.angles = tagangles;
        var_f10bc4073a536d2f = tagorigin - var_ab0dc1928066d386;
        var_f437bc51b4d819fa = vectornormalize(var_f10bc4073a536d2f);
        var_c0f18187ba0798ec = 20;
        var_6a8655e4b569b964 = 50;
        var_737df2e9aaf94a3e = min(length(var_f10bc4073a536d2f) * var_c0f18187ba0798ec, var_6a8655e4b569b964);
        var_309c91ce1ee4f500 = var_f437bc51b4d819fa * var_737df2e9aaf94a3e;
        var_4e12423804db75ad = (0, 0, 950);
        launchvelocity = var_309c91ce1ee4f500 + var_4e12423804db75ad;
        var_ac9bc7d09525b92a physicslaunchserveritem(tagorigin, launchvelocity);
        if (weaponclass(var_cd9abe0e758cbdf7) == "pistol") {
            var_3d437f1697570e9a = 0.2;
            var_212a44a5393c3b34 = var_ac9bc7d09525b92a physics_getbodyid(0);
            var_b3a3ff9a9e7e3eaa = physics_getbodyangvel(var_212a44a5393c3b34) * var_3d437f1697570e9a;
            physics_setbodyangvel(var_212a44a5393c3b34, var_b3a3ff9a9e7e3eaa[0], var_b3a3ff9a9e7e3eaa[1], var_b3a3ff9a9e7e3eaa[2]);
        }
        function_f3bb4f4911a1beb2("loot", "dropWeapon", var_ac9bc7d09525b92a);
        self notify("weapon_dropped", var_ac9bc7d09525b92a);
    } else {
        self dropweapon(var_cd9abe0e758cbdf7, position, 0);
        self endon("end_weapon_drop_" + position);
        waitframe();
    }
    if (!isdefined(self)) {
        return;
    }
    if (isagent(self) && !isalive(self)) {
        return;
    }
    detachallweaponmodels();
    self.a.weaponposdropping[position] = undefined;
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1617
// Size: 0x14
function function_335d7d001eb868f() {
    if (isdefined(self.var_e0675e48962c6d55)) {
        return 1;
    }
    return 0;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1633
// Size: 0x55
function canaiflingweapon(ai) {
    if (!issp()) {
        return 0;
    }
    if (!isdefined(ai.lastattacker)) {
        return 0;
    }
    if (!isplayer(ai.lastattacker)) {
        return 0;
    }
    if (isexplosivedamagemod(ai.damagemod)) {
        return 1;
    }
    return 1;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1690
// Size: 0x7f
function setdroppedweaponammo(var_cd9abe0e758cbdf7) {
    droppedweapon = self waittill("weapon_dropped");
    droppedweapon endon("death");
    if (isdefined(var_cd9abe0e758cbdf7) && isvaliddroppedweapon(var_cd9abe0e758cbdf7)) {
        if (isdefined(droppedweapon)) {
            droppedweapon physics_registerforcollisioncallback();
            droppedweapon thread weapondrop_physics_callback_monitor(var_cd9abe0e758cbdf7);
            weaponname = getsubstr(droppedweapon.classname, 7, droppedweapon.classname.size);
            droppedweapon setscriptammo(weaponname, self);
        }
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1716
// Size: 0x1e
function isvaliddroppedweapon(weapon) {
    if (weapon.ismelee) {
        return 0;
    }
    return 1;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173c
// Size: 0xdd
function weapondrop_physics_callback_monitor(var_47dcfbc98e2103ee) {
    self endon("death");
    self endon("timeout");
    thread weapondrop_physics_timeout(2);
    ent = impulse = normal = position = flag1 = flag0 = body1 = body0 = self waittill("collision");
    surface = physics_getsurfacetypefromflags(flag1);
    surfacetype = getsubstr(surface["name"], 9);
    if (surfacetype == "user_terrain1") {
        surfacetype = "user_terrain_1";
    }
    if (isdefined(var_47dcfbc98e2103ee.classname) && isdefined(self)) {
        self function_7d738013c1cfbc9d(surfacetype);
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1820
// Size: 0x16
function weapondrop_physics_timeout(time) {
    wait(time);
    self notify("timeout");
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x183d
// Size: 0x43
function getaimyawtoshootentorpos() {
    if (!isdefined(self.shootent)) {
        if (!isdefined(self.shootpos)) {
            return 0;
        }
        return getaimyawtopoint(self.shootpos);
    }
    return getaimyawtopoint(self.shootent getshootatpos());
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1888
// Size: 0x69
function getaimpitchtoshootentorpos() {
    pitch = getpitchtoshootentorpos();
    if (self.script == "cover_crouch" && isdefined(self.a.covermode) && self.a.covermode == "lean") {
        pitch = pitch - anim.covercrouchleanpitch;
    }
    return pitch;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f9
// Size: 0x43
function getpitchtoshootentorpos() {
    if (!isdefined(self.shootent)) {
        if (!isdefined(self.shootpos)) {
            return 0;
        }
        return namespace_ba1fcf33692e2fad::getpitchtoshootspot(self.shootpos);
    }
    return namespace_ba1fcf33692e2fad::getpitchtoshootspot(self.shootent getshootatpos());
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1944
// Size: 0x1b
function ramboaim(baseyaw) {
    self endon("killanimscript");
    ramboaiminternal(baseyaw);
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1966
// Size: 0xc
function ramboaiminternal(baseyaw) {
    
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1979
// Size: 0xe5
function decidenumshotsforburst() {
    numshots = 0;
    var_8ba699667e1a6d48 = weaponburstcount(self.weapon);
    if (var_8ba699667e1a6d48) {
        numshots = var_8ba699667e1a6d48;
    } else if (namespace_192c166ad8ed6432::usingsemiautoweapon()) {
        numshots = anim.semifirenumshots[randomint(anim.semifirenumshots.size)];
    } else if (self.fastburst) {
        numshots = anim.fastburstfirenumshots[randomint(anim.fastburstfirenumshots.size)];
    } else {
        numshots = anim.burstfirenumshots[randomint(anim.burstfirenumshots.size)];
    }
    if (numshots <= self.bulletsinclip) {
        return numshots;
    }
    /#
        assertex(self.bulletsinclip >= 0, self.bulletsinclip);
    #/
    if (self.bulletsinclip <= 0) {
        return 1;
    }
    return self.bulletsinclip;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a66
// Size: 0x76
function decidenumshotsforfull() {
    numshots = self.bulletsinclip;
    if (weaponclass(self.weapon) == "mg") {
        choice = randomfloat(10);
        if (choice < 3) {
            numshots = randomintrange(2, 6);
        } else if (choice < 8) {
            numshots = randomintrange(6, 12);
        } else {
            numshots = randomintrange(12, 20);
        }
    }
    return numshots;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae4
// Size: 0x2a
function hideweaponmagattachment(weaponname) {
    self.weaponinfo[weaponname].hasclip = 0;
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b15
// Size: 0x2b
function showweaponmagattachment(weaponname) {
    self.weaponinfo[weaponname].hasclip = 1;
    updateattachedweaponmodels();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b47
// Size: 0x2f6
function handledropclip(flagname) {
    self endon("abort_reload");
    self endon(flagname + "_finished");
    /#
        self.var_2615bb1fb16a4696 = gettime();
    #/
    var_3b19fe4716beb04f = self.weapon;
    var_e73086718813698c = getcompleteweaponname(var_3b19fe4716beb04f);
    clipmodel = undefined;
    if (self.weaponinfo[var_e73086718813698c].useclip) {
        clipmodel = getweaponclipmodel(self.weapon);
    }
    /#
        if (isdefined(clipmodel)) {
            thread function_f50e9da2dab043f5(4, flagname, clipmodel);
        }
    #/
    if (self.weaponinfo[var_e73086718813698c].hasclip) {
        if (isusingsidearm()) {
            self playsound("weap_reload_pistol_clipout_npc");
        } else {
            self playsound("weap_reload_smg_clipout_npc");
        }
        if (isdefined(clipmodel)) {
            hideweaponmagattachment(var_e73086718813698c);
            thread dropclipmodel(clipmodel, "tag_clip");
        }
    }
    var_3cba51f785093d95 = 0;
    while (!var_3cba51f785093d95) {
        notes = self waittill(flagname);
        if (!isarray(notes)) {
            notes = [0:notes];
        }
        foreach (notetrack in notes) {
            switch (notetrack) {
            case #"hash_5b5aa4b849bd2c6b":
                if (isdefined(clipmodel)) {
                    self attach(clipmodel, "tag_accessory_left");
                }
                break;
            case #"hash_ae1cecd9e4889cf4":
                if (isdefined(clipmodel)) {
                    self attach(clipmodel, "tag_accessory_right");
                }
                break;
            case #"hash_cd781db409868556":
                if (isdefined(clipmodel)) {
                    self detach(clipmodel, "tag_accessory_right");
                }
                break;
            case #"hash_d4a17c4550fa75c2":
                if (isdefined(clipmodel)) {
                    self detach(clipmodel, "tag_accessory_right");
                    if (var_3b19fe4716beb04f == self.weapon) {
                        showweaponmagattachment(var_e73086718813698c);
                    } else {
                        self.weaponinfo[getcompleteweaponname(self.weapon)].hasclip = 1;
                        self.weaponinfo[var_e73086718813698c].hasclip = 1;
                    }
                    self notify("clip_detached");
                }
                namespace_192c166ad8ed6432::refillclip();
                var_3cba51f785093d95 = 1;
                break;
            case #"hash_5d086fcae9cf9da1":
                if (isdefined(clipmodel)) {
                    self detach(clipmodel, "tag_accessory_left");
                    if (var_3b19fe4716beb04f == self.weapon) {
                        showweaponmagattachment(var_e73086718813698c);
                    } else {
                        self.weaponinfo[getcompleteweaponname(self.weapon)].hasclip = 1;
                        self.weaponinfo[var_e73086718813698c].hasclip = 1;
                    }
                    self notify("clip_detached");
                }
                namespace_192c166ad8ed6432::refillclip();
                var_3cba51f785093d95 = 1;
                break;
            }
        }
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e44
// Size: 0x14
function dropclipmodel(clipmodel, tagname) {
    
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5f
// Size: 0xd9
function function_f50e9da2dab043f5(waittime, statename, clipmodel) {
    /#
        self endon("beckon");
        self endon("load_finished");
        self endon("<unknown string>");
        wait(waittime);
        msg1 = "<unknown string>" + self getentitynumber() + "<unknown string>" + waittime + "<unknown string>";
        msg2 = "<unknown string>" + statename + "<unknown string>" + clipmodel + "<unknown string>" + self.weapon.basename + "<unknown string>";
        var_fbf2c40df6d0d1ef = "<unknown string>";
        var_fbf2c10df6d0cb56 = "<unknown string>";
        /#
            assertmsg(msg1 + "<unknown string>" + msg2 + "<unknown string>" + var_fbf2c40df6d0d1ef + "<unknown string>" + var_fbf2c10df6d0cb56);
        #/
    #/
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3f
// Size: 0x152
function movetonodeovertime(node, time) {
    self endon("killanimscript");
    var_49c14b71e6a5db4b = node.origin;
    distsq = distancesquared(self.origin, var_49c14b71e6a5db4b);
    if (distsq < 1) {
        self safeteleport(var_49c14b71e6a5db4b);
        return;
    }
    if (distsq > 256 && !self maymovetopoint(var_49c14b71e6a5db4b, !actor_is3d())) {
        /#
            println("<unknown string>" + var_49c14b71e6a5db4b + "<unknown string>");
        #/
        return;
    }
    self.keepclaimednodeifvalid = 1;
    startdist = distance(self.origin, var_49c14b71e6a5db4b);
    frames = int(time * 20);
    for (i = 0; i < frames; i++) {
        var_49c14b71e6a5db4b = node.origin;
        var_e907009ead5acaf2 = self.origin - var_49c14b71e6a5db4b;
        var_e907009ead5acaf2 = vectornormalize(var_e907009ead5acaf2);
        var_8bfd5d34319579a5 = var_49c14b71e6a5db4b + var_e907009ead5acaf2 * startdist;
        var_d3d9736a622b6f4e = var_8bfd5d34319579a5 + (var_49c14b71e6a5db4b - var_8bfd5d34319579a5) * (i + 1) / frames;
        self safeteleport(var_d3d9736a622b6f4e);
        wait(0.05);
    }
    self.keepclaimednodeifvalid = 0;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2098
// Size: 0x5
function returntrue() {
    return 1;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20a5
// Size: 0x94
function playlookanimation(var_7694f8c1890d15e3, var_cb58849338c969fb, var_3eda4dd47f961142) {
    if (!isdefined(var_3eda4dd47f961142)) {
        var_3eda4dd47f961142 = &returntrue;
    }
    for (i = 0; i < var_cb58849338c969fb * 10; i++) {
        if (isalive(self.enemy)) {
            if (canseeenemy() && [[ var_3eda4dd47f961142 ]]()) {
                return;
            }
        }
        if (issuppressedwrapper() && [[ var_3eda4dd47f961142 ]]()) {
            return;
        }
        self setanimknoball(var_7694f8c1890d15e3, generic_human%body, 1, 0.1);
        wait(0.1);
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2140
// Size: 0x2f
function throwdownweapon(var_f449515cc6577bbb) {
    self endon("killanimscript");
    namespace_223959d3e5206cfb::placeweaponon(self.secondaryweapon, "right");
    namespace_2f36c2cc5a44d845::didsomethingotherthanshooting();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2176
// Size: 0x6f
function rpgplayerrepulsor() {
    var_8705205deb31416a = rpgplayerrepulsor_getnummisses();
    if (var_8705205deb31416a == 0) {
        return;
    }
    self endon("death");
    for (;;) {
        self waittill("shooting");
        if (isdefined(level.var_28b2c05eb31d987)) {
            self [[ level.var_28b2c05eb31d987 ]]();
        } else if (function_a560b5ed33bedc96()) {
            level thread rpgplayerrepulsor_create(self.enemy);
            var_8705205deb31416a--;
            if (var_8705205deb31416a <= 0) {
                return;
            }
        }
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ec
// Size: 0x42
function function_a560b5ed33bedc96() {
    if (isdefined(level.createrpgrepulsors) && !level.createrpgrepulsors) {
        return 0;
    }
    if (isdefined(self.enemy) && isplayer(self.enemy)) {
        return 1;
    }
    return 0;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2236
// Size: 0x6f
function rpgplayerrepulsor_getnummisses() {
    skill = utility::getdifficulty();
    switch (skill) {
    case #"hash_22ce4003c1e5227b":
    case #"hash_ba826b0f31b00b60":
        return 2;
    case #"hash_420f6837f7efa409":
    case #"hash_c71b112fe04823d6":
    case #"hash_cc9157548a55043c":
        return 1;
    case #"hash_fa14cdf6bd53b8e4":
        return 0;
        break;
    }
    return 2;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ad
// Size: 0x79
function rpgplayerrepulsor_create(ent) {
    ent notify("stop_prev_repulsor");
    ent endon("stop_prev_repulsor");
    if (!isdefined(ent.var_f7cd0afed33249f)) {
        ent.var_f7cd0afed33249f = missile_createrepulsorent(ent, 5000, 800);
    }
    repulsor = ent.var_f7cd0afed33249f;
    ent waittill_notify_or_timeout("death", 4);
    missile_deleteattractor(repulsor);
    ent.var_f7cd0afed33249f = undefined;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232d
// Size: 0xf6
function pickandsetforceweapon() {
    if (isdefined(self.weaponoverride) && self.weaponoverride) {
        return;
    }
    if (namespace_3c37cb17ade254d::within_fov(level.player.origin, level.player getplayerangles(), self.origin, 0.173648)) {
        return;
    }
    objweapon = undefined;
    if (distancesquared(self.origin, self.enemy.origin) < self.closeweaponmaxdist * self.closeweaponmaxdist) {
        objweapon = self.forcedweaponclose;
    } else {
        objweapon = self.forcedweaponfar;
    }
    if (objweapon != self.weapon) {
        forceuseweapon(objweapon, "primary");
        self.weapon_stow setmodel(getweaponmodel(self.forcedweapon));
        self.forcedweapon = objweapon;
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242a
// Size: 0x22d
function forceuseweapon(newweapon, var_cacea726b31f0198) {
    /#
        assert(isdefined(newweapon));
    #/
    /#
        assert(isdefined(var_cacea726b31f0198));
    #/
    /#
        assertex(var_cacea726b31f0198 == "primary" || var_cacea726b31f0198 == "secondary" || var_cacea726b31f0198 == "sidearm", "Target slot is either primary, secondary or sidearm.");
    #/
    var_66b3db972ac1531e = undefined;
    if (isweapon(newweapon)) {
        /#
            assert(!isnullweapon(newweapon));
        #/
        var_66b3db972ac1531e = newweapon;
    } else {
        /#
            assert(newweapon != "none");
        #/
        var_66b3db972ac1531e = [[ level.fnbuildweapon ]](newweapon);
    }
    if (istrue(self.script_fakeactor) || istrue(self.script_drone)) {
        namespace_6205bc7c5e394598::gun_remove();
        namespace_6205bc7c5e394598::gun_create_fake(getweaponattachmentworldmodels(var_66b3db972ac1531e));
        return;
    }
    if (!utility::isweaponinitialized(var_66b3db972ac1531e)) {
        utility::initweapon(var_66b3db972ac1531e);
    }
    hasweapon = !isnullweapon(self.weapon);
    var_26066068c8c080dd = namespace_7843e1029b5c80e::isusingsidearm();
    var_8b0c7b8b1b21ddb8 = var_cacea726b31f0198 == "sidearm";
    var_12f0e03ede4bbd79 = var_cacea726b31f0198 == "secondary";
    if (hasweapon && var_26066068c8c080dd != var_8b0c7b8b1b21ddb8) {
        /#
            assert(self.weapon != var_66b3db972ac1531e);
        #/
        if (var_26066068c8c080dd) {
            var_86d39f2fc4d668d5 = "none";
        } else if (var_12f0e03ede4bbd79) {
            var_86d39f2fc4d668d5 = "back";
        } else {
            var_86d39f2fc4d668d5 = "chest";
        }
        placeweaponon(self.weapon, var_86d39f2fc4d668d5);
        self.lastweapon = self.weapon;
    } else {
        self.lastweapon = var_66b3db972ac1531e;
    }
    namespace_223959d3e5206cfb::placeweaponon(var_66b3db972ac1531e, "right");
    if (var_8b0c7b8b1b21ddb8) {
        self.sidearm = var_66b3db972ac1531e;
    } else if (var_12f0e03ede4bbd79) {
        self.secondaryweapon = var_66b3db972ac1531e;
    } else {
        self.primaryweapon = var_66b3db972ac1531e;
    }
    self.weapon = var_66b3db972ac1531e;
    self.bulletsinclip = weaponclipsize(self.weapon);
    self notify("weapon_switch_done");
    updateweaponarchetype(weaponclass(self.weapon));
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265e
// Size: 0x148
function updateweaponarchetype(weapclass) {
    if (!isdefined(self._blackboard) || namespace_28edc79fcf2fe234::bb_isanimscripted() || !isdefined(self.asm) || !isdefined(self.var_ae3ea15396b65c1f)) {
        return;
    }
    if (self function_18cb2157393fbf5b()) {
        return;
    }
    var_b363904de331d30 = self getbasearchetype();
    if (weapclass == "pistol" && archetypeassetloaded(self.var_ae3ea15396b65c1f + "_pistol")) {
        self setoverridearchetype("weapon", self.var_ae3ea15396b65c1f + "_pistol");
    } else if (weapclass == "pistol" && archetypeassetloaded(var_b363904de331d30 + "_pistol")) {
        self setoverridearchetype("weapon", var_b363904de331d30 + "_pistol");
    } else if (weapclass == "mg" && archetypeassetloaded(self.var_ae3ea15396b65c1f + "_lmg")) {
        self setoverridearchetype("weapon", self.var_ae3ea15396b65c1f + "_lmg");
    } else if (weapclass == "mg" && archetypeassetloaded(var_b363904de331d30 + "_lmg")) {
        self setoverridearchetype("weapon", var_b363904de331d30 + "_lmg");
    } else {
        self clearoverridearchetype("weapon");
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27ad
// Size: 0x33
function everusessecondaryweapon() {
    if (isshotgun(self.secondaryweapon)) {
        return 1;
    }
    if (weaponclass(self.primaryweapon) == "rocketlauncher") {
        return 1;
    }
    return 0;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27e8
// Size: 0x3aa
function default_weaponsetup(var_4fa6c3f27e072cb6) {
    if (!isdefined(self.stowsidearmposition)) {
        if (istrue(self.bhasthighholster)) {
            self.stowsidearmposition = "thigh";
        } else {
            self.stowsidearmposition = anim.stowsidearmpositiondefault;
        }
    }
    if (istrue(self.scriptedweaponfailed)) {
        if (isdefined(level.fnscriptedweaponassignment)) {
            if (isdefined(self.scriptedweaponfailed_primaryarray)) {
                self.primaryweapon = [[ level.fnscriptedweaponassignment ]](self.scriptedweaponfailed_primaryarray);
                self.scriptedweaponfailed_primaryarray = undefined;
            }
            if (isdefined(self.scriptedweaponfailed_sidearmarray)) {
                self.sidearm = [[ level.fnscriptedweaponassignment ]](self.scriptedweaponfailed_sidearmarray, "sidearm");
                self.scriptedweaponfailed_sidearmarray = undefined;
            }
            if (isdefined(self.scriptedweaponfailed_secondaryarray)) {
                self.secondaryweapon = [[ level.fnscriptedweaponassignment ]](self.scriptedweaponfailed_secondaryarray);
                self.scriptedweaponfailed_secondaryarray = undefined;
            }
        }
    } else if (!istrue(self.usescriptedweapon) && !isdefined(self.agent_type)) {
        if (!issp()) {
            if (!isweapon(self.primaryweapon)) {
                self.primaryweapon = [[ level.fnbuildweapon ]](self.primaryweapon, [], "none", "none");
            }
            if (!isweapon(self.secondaryweapon)) {
                self.secondaryweapon = [[ level.fnbuildweapon ]](self.secondaryweapon, [], "none", "none");
            }
            if (!isweapon(self.sidearm)) {
                self.sidearm = [[ level.fnbuildweapon ]](self.sidearm, [], "none", "none");
            }
        } else {
            self.primaryweapon = [[ level.fnbuildweapon ]](self.primaryweapon, []);
            self.secondaryweapon = [[ level.fnbuildweapon ]](self.secondaryweapon, []);
            self.sidearm = [[ level.fnbuildweapon ]](self.sidearm, []);
        }
    }
    utility::initweapon(nullweapon());
    if (!isnullweapon(self.primaryweapon)) {
        utility::initweapon(self.primaryweapon);
    }
    if (!isnullweapon(self.secondaryweapon)) {
        utility::initweapon(self.secondaryweapon);
    }
    if (!isnullweapon(self.sidearm)) {
        utility::initweapon(self.sidearm);
    }
    function_c7c0f2b1ff4110ce();
    self setdefaultaimlimits();
    self.a.weaponpos = [];
    self.a.weaponposdropping = [];
    self.lastweapon = self.weapon;
    if (usingrocketlauncher()) {
        thread namespace_223959d3e5206cfb::rpgplayerrepulsor();
    }
    self.rocketammo = 100;
    if (!isnullweapon(self.primaryweapon)) {
        namespace_223959d3e5206cfb::placeweaponon(self.primaryweapon, "right");
    }
    if (isshotgun(self.secondaryweapon)) {
        namespace_223959d3e5206cfb::placeweaponon(self.secondaryweapon, "back");
    }
    if (!isnullweapon(self.sidearm) && isdefined(self.stowsidearmposition)) {
        namespace_223959d3e5206cfb::placeweaponon(self.sidearm, self.stowsidearmposition);
    }
    if (self isbadguy()) {
        self.has_no_ir = 1;
    }
    namespace_192c166ad8ed6432::refillclip();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b99
// Size: 0x158
function function_c7c0f2b1ff4110ce() {
    /#
        if (self.primaryweapon == self.sidearm && !isnullweapon(self.primaryweapon)) {
            var_a482a135ed0fe92 = ter_op(isdefined(self.export), self.export, "<unknown string>");
            var_939053bd4990289 = ter_op(isagent(self), self.agent_type, self.classname);
            /#
                assertmsg("<unknown string>" + var_939053bd4990289 + "<unknown string>" + var_a482a135ed0fe92 + "<unknown string>" + getcompleteweaponname(self.primaryweapon) + "<unknown string>");
            #/
        }
        if (self.secondaryweapon == self.sidearm && !isnullweapon(self.secondaryweapon) && everusessecondaryweapon()) {
            var_a482a135ed0fe92 = ter_op(isdefined(self.export), self.export, "<unknown string>");
            var_939053bd4990289 = ter_op(isagent(self), self.agent_type, self.classname);
            /#
                assertmsg("<unknown string>" + var_939053bd4990289 + "<unknown string>" + var_a482a135ed0fe92 + "<unknown string>" + getcompleteweaponname(self.primaryweapon) + "<unknown string>");
            #/
        }
    #/
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf8
// Size: 0x9e
function initmeleecharges() {
    anim.meleechargetimers["c6"] = 0;
    anim.meleechargeintervals["c6"] = 9000;
    anim.meleechargeplayertimers["c6"] = 0;
    anim.meleechargeplayerintervals["c6"] = 15000;
    anim.meleechargetimers["seeker"] = 0;
    anim.meleechargeintervals["seeker"] = 9000;
    anim.meleechargeplayertimers["seeker"] = 0;
    anim.meleechargeplayerintervals["seeker"] = 15000;
    /#
        thread namespace_ba1fcf33692e2fad::function_9439f01a442797ec();
    #/
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d9d
// Size: 0x5b
function init_squadmanager() {
    if (isdefined(anim.squadinitialized) && anim.squadinitialized) {
        return;
    }
    anim.squadcreatefuncs = [];
    anim.squadcreatestrings = [];
    anim.squads = [];
    anim.squadindex = [];
    anim.squadrand = 0;
    anim.squadinitialized = 1;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dff
// Size: 0x276
function initanimvars() {
    anim.animflagnameindex = 0;
    anim.combatmemorytimeconst = 10000;
    anim.combatmemorytimerand = 6000;
    anim.weaponsetupfuncs = [];
    anim.weaponsetupfuncs["c12"] = &c12_weaponsetup;
    anim.dismemberheavyfx = [];
    anim.weaponstowfunction = &namespace_223959d3e5206cfb::pickandsetforceweapon;
    if (!isdefined(anim.optionalstepeffects)) {
        anim.optionalstepeffects = [];
    }
    if (!isdefined(anim.optionalstepeffectssmall)) {
        anim.optionalstepeffectssmall = [];
    }
    if (!isdefined(anim.optionalfootprinteffects)) {
        anim.optionalfootprinteffects = [];
    }
    if (!isdefined(anim.shootenemywrapper_func)) {
        anim.shootenemywrapper_func = &shootenemywrapper_shootnotify;
    }
    if (!isdefined(anim.shootposwrapper_func)) {
        anim.shootposwrapper_func = &shootposwrapper;
    }
    setglobalaimsettings();
    anim.fire_notetrack_functions = [];
    anim.lastcarexplosiontime = -100000;
    anim.burstfirenumshots = [0:1, 1:2, 2:2, 3:2, 4:3, 5:3, 6:3, 7:3, 8:4, 9:4, 10:5];
    anim.fastburstfirenumshots = [0:2, 1:3, 2:3, 3:3, 4:4, 5:4, 6:4, 7:5, 8:5];
    anim.semifirenumshots = [0:1, 1:2, 2:2, 3:3, 4:3, 5:4, 6:4, 7:4, 8:4, 9:5, 10:5, 11:5];
    anim.badplaces = [];
    anim.badplaceint = 0;
    anim.nodeyaws = [];
    anim.grenadethrowanims = [];
    anim.grenadethrowoffsets = [];
    anim.var_432836e99816347c = [];
    if (!isdefined(anim.var_91bc951178da9f3b)) {
        anim.var_91bc951178da9f3b = &namespace_17a0e830dd8fa113::function_6fbea72303085c6f;
        anim.var_8122f7efa052c448 = &namespace_17a0e830dd8fa113::function_1e1767fdc6980106;
    }
    if (!isdefined(anim.var_c65f21298ce83c9c)) {
        anim.var_c65f21298ce83c9c = &detachallweaponmodels;
        anim.var_f240ef0c84eac2b2 = &updateattachedweaponmodels;
    }
    initgestures();
    initmaxspeedforpathlengthtable();
    namespace_814214ba854030e6::init();
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x307c
// Size: 0xa5
function initgestures() {
    gestures = [];
    gestures[gestures.size] = "point_casual";
    gestures[gestures.size] = "point_military";
    gestures[gestures.size] = "yes";
    gestures[gestures.size] = "no";
    gestures[gestures.size] = "hold";
    gestures[gestures.size] = "talk";
    gestures[gestures.size] = "shrug";
    gestures[gestures.size] = "getdown";
    gestures[gestures.size] = "nvg_on";
    gestures[gestures.size] = "nvg_off";
    gestures[gestures.size] = "beckon";
    gestures[gestures.size] = "lookback_right";
    gestures[gestures.size] = "wrist_com_lower";
    gestures[gestures.size] = "wrist_com_raise";
    anim.gestures = gestures;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3128
// Size: 0x8b
function setglobalaimsettings() {
    anim.covercrouchleanpitch = 55;
    anim.aimyawdifffartolerance = 10;
    anim.aimyawdiffclosedistsq = 4096;
    anim.aimyawdiffclosetolerance = 45;
    anim.aimpitchdifftolerance = 20;
    anim.painyawdifffartolerance = 25;
    anim.painyawdiffclosedistsq = anim.aimyawdiffclosedistsq;
    anim.painyawdiffclosetolerance = anim.aimyawdiffclosetolerance;
    anim.painpitchdifftolerance = 30;
    anim.maxanglecheckyawdelta = 65;
    anim.maxanglecheckpitchdelta = 65;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ba
// Size: 0x25
function c12_getweapontypeforweapon() {
    if (namespace_7843e1029b5c80e::usingrocketlauncher()) {
        return "rocket";
    } else if (namespace_7843e1029b5c80e::usingriflelikeweapon()) {
        return "minigun";
    }
    return undefined;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31e7
// Size: 0x98
function c12_weaponsetup() {
    self.weapons = [];
    if (!isnullweapon(self.primaryweapon)) {
        self.weapon = self.primaryweapon;
        self.weapons["right"] = c12_getweapontypeforweapon();
    }
    if (!isnullweapon(self.secondaryweapon)) {
        self.weapon = self.secondaryweapon;
        self.weapons["left"] = c12_getweapontypeforweapon();
    }
    self.weapon = nullweapon();
    self.bulletsinclip = 1;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3286
// Size: 0xda
function initwindowtraverse() {
    level.window_down_height[0] = -36.8552;
    level.window_down_height[1] = -27.0095;
    level.window_down_height[2] = -15.5981;
    level.window_down_height[3] = -4.37769;
    level.window_down_height[4] = 17.7776;
    level.window_down_height[5] = 59.8499;
    level.window_down_height[6] = 104.808;
    level.window_down_height[7] = 152.325;
    level.window_down_height[8] = 201.052;
    level.window_down_height[9] = 250.244;
    level.window_down_height[10] = 298.971;
    level.window_down_height[11] = 330.681;
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3367
// Size: 0xaf
function setuprandomtable() {
    anim.randominttablesize = 60;
    anim.randominttable = [];
    for (i = 0; i < anim.randominttablesize; i++) {
        anim.randominttable[i] = i;
    }
    for (i = 0; i < anim.randominttablesize; i++) {
        switchwith = randomint(anim.randominttablesize);
        temp = anim.randominttable[i];
        anim.randominttable[i] = anim.randominttable[switchwith];
        anim.randominttable[switchwith] = temp;
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x341d
// Size: 0x5c
function setupweapons() {
    self endon("death");
    flag_wait("load_finished");
    if (isdefined(anim.weaponsetupfuncs) && isdefined(anim.weaponsetupfuncs[self.unittype])) {
        self [[ anim.weaponsetupfuncs[self.unittype] ]]();
    } else {
        default_weaponsetup();
    }
}

// Namespace shared/namespace_223959d3e5206cfb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3480
// Size: 0x20b
function setscriptammo(weaponname, var_daa4b1537e4b3981, var_294f7847d19dcbdb) {
    if (isdefined(var_daa4b1537e4b3981.script_ammo_clip)) {
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_clip), "Need to set a value for script_ammo_clip");
        #/
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_extra), "Must also set, 'script_ammo_extra' when setting script_ammo_clip.");
        #/
        self itemweaponsetammo(var_daa4b1537e4b3981.script_ammo_clip, var_daa4b1537e4b3981.script_ammo_extra);
    } else if (isdefined(var_daa4b1537e4b3981.script_ammo_extra)) {
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_extra), "Need to set a value for script_ammo_extra");
        #/
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_clip), "Must also set, 'script_ammo_clip' when setting script_ammo_extra.");
        #/
        self itemweaponsetammo(var_daa4b1537e4b3981.script_ammo_clip, var_daa4b1537e4b3981.script_ammo_extra);
    }
    if (isdefined(var_daa4b1537e4b3981.script_ammo_alt_clip)) {
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_alt_clip), "Need to set a value for script_ammo_alt_clip");
        #/
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_extra), "Must also set, 'script_ammo_extra' when setting script_ammo_alt_clip.");
        #/
        self itemweaponsetammo(var_daa4b1537e4b3981.script_ammo_alt_clip, var_daa4b1537e4b3981.script_ammo_alt_extra, undefined, 1);
    } else if (isdefined(var_daa4b1537e4b3981.script_ammo_alt_extra)) {
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_alt_extra), "Need to set a value for script_ammo_alt_extra");
        #/
        /#
            assertex(isdefined(var_daa4b1537e4b3981.script_ammo_clip), "Must also set, 'script_ammo_clip' when setting script_ammo_alt_extra.");
        #/
        self itemweaponsetammo(var_daa4b1537e4b3981.script_ammo_alt_clip, var_daa4b1537e4b3981.script_ammo_alt_extra, undefined, 1);
    }
    if (isdefined(var_daa4b1537e4b3981.script_ammo_max)) {
        self itemweaponsetammo(weaponclipsize(self), weaponmaxammo(self));
    }
    if (istrue(var_294f7847d19dcbdb)) {
        self itemweaponsetammo(1, 6, 0, 1);
    } else if (issubstr(weaponname, "ub_golf25_sp") || issubstr(weaponname, "ub_mike203_sp")) {
        self itemweaponsetammo(1, 1, 0, 1);
    }
}

