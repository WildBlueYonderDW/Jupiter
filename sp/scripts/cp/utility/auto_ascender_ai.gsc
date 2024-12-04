#using script_2669878cf5a1b6bc;
#using scripts\asm\asm;
#using scripts\asm\asm_mp;
#using scripts\asm\shared\mp\utility;
#using scripts\engine\utility;

#namespace namespace_65193b393806247d;

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a4
// Size: 0x136
function ai_ascender_use(dir, var_e329e466286dfc92) {
    self endon("death");
    ai_goto_ascender_and_wait(var_e329e466286dfc92);
    var_478bfac22ea8f9e = "ascender_" + dir + "_in";
    var_16eece1d377a2b4b = "ascender_" + dir + "_loop";
    var_a2aa0d90b41a955f = "ascender_" + dir + "_out";
    var_cfb273d832b1732e = "wm_eq_ascender_" + dir + "_get_on_ascender";
    var_ffe0bd8231cc883b = "wm_eq_ascender_" + dir + "_loop_ascender";
    var_5d4eba776abdcecf = "wm_eq_ascender_" + dir + "_get_off_ascender";
    thread release_ascendstruct_ondeath(var_e329e466286dfc92);
    var_b02a4b4bfc64aa4e = ai_ascender_getstartpos(var_478bfac22ea8f9e, var_e329e466286dfc92);
    var_b02a4b4bfc64aa4e.end_node = getstruct(var_e329e466286dfc92.target, "targetname");
    toggle_ai_settings(1, var_b02a4b4bfc64aa4e);
    thread ai_ascender_doanims(var_478bfac22ea8f9e, var_a2aa0d90b41a955f, var_16eece1d377a2b4b, var_cfb273d832b1732e, var_5d4eba776abdcecf, var_ffe0bd8231cc883b, var_b02a4b4bfc64aa4e, var_e329e466286dfc92, dir);
    var_e329e466286dfc92.inuse = 0;
    waittill_any_2("ascended", "death");
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2
// Size: 0x5f
function ai_goto_ascender_and_wait(var_e329e466286dfc92) {
    self.ignoreall = 1;
    self.goalradius = 96;
    self setgoalpos(self getclosestreachablepointonnavmesh(var_e329e466286dfc92.origin));
    while (istrue(var_e329e466286dfc92.inuse)) {
        wait 0.1;
    }
    var_e329e466286dfc92.inuse = 1;
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x349
// Size: 0x27
function release_ascendstruct_ondeath(var_e329e466286dfc92) {
    self endon("ascended");
    self waittill("death");
    var_e329e466286dfc92.inuse = 0;
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x378
// Size: 0x1c1
function ai_ascender_doanims(var_478bfac22ea8f9e, var_a2aa0d90b41a955f, var_16eece1d377a2b4b, var_cfb273d832b1732e, var_5d4eba776abdcecf, var_ffe0bd8231cc883b, var_b02a4b4bfc64aa4e, animnode, dir) {
    self endon("death");
    var_d242fefc078b21d9 = scripts\asm\asm::asm_lookupanimfromalias("animscripted2", var_478bfac22ea8f9e);
    in_xanim = scripts\asm\asm::asm_getxanim("animscripted2", var_d242fefc078b21d9);
    var_bc638c476608c29e = scripts\asm\asm::asm_lookupanimfromalias("animscripted2", var_a2aa0d90b41a955f);
    out_xanim = scripts\asm\asm::asm_getxanim("animscripted2", var_bc638c476608c29e);
    var_9ac8d3c06231f652 = scripts\asm\asm::asm_lookupanimfromalias("animscripted2", var_16eece1d377a2b4b);
    loop_xanim = scripts\asm\asm::asm_getxanim("animscripted2", var_9ac8d3c06231f652);
    self setplayerangles(var_b02a4b4bfc64aa4e.angles);
    if (dir == "up") {
        self forceteleport(var_b02a4b4bfc64aa4e.origin + anglestoleft(var_b02a4b4bfc64aa4e.angles) * -4 + anglestoforward(var_b02a4b4bfc64aa4e.angles) * 10, var_b02a4b4bfc64aa4e.angles);
    } else {
        self forceteleport(var_b02a4b4bfc64aa4e.origin + anglestoleft(var_b02a4b4bfc64aa4e.angles) * 4, var_b02a4b4bfc64aa4e.angles);
    }
    ai_ascender_giveascender(animnode);
    thread ascender_deathwatcher();
    ai_ascender_animin(var_cfb273d832b1732e, animnode, var_d242fefc078b21d9, var_b02a4b4bfc64aa4e, in_xanim);
    ai_ascender_animloop(loop_xanim, var_b02a4b4bfc64aa4e);
    ai_ascender_animout(var_5d4eba776abdcecf, var_bc638c476608c29e, out_xanim);
    ai_ascender_takeascender();
    toggle_ai_settings(0);
    self notify("ascended");
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x541
// Size: 0x9b
function ai_ascender_animin(var_cfb273d832b1732e, struct, var_d242fefc078b21d9, animnode, in_xanim) {
    self.ascender scriptmodelplayanimdeltamotionfrompos(var_cfb273d832b1732e, struct.origin, struct.angles);
    self animmode("noclip");
    self aisetanim("animscripted2", var_d242fefc078b21d9);
    self orientmode("face angle", animnode.angles[1]);
    waitframe();
    self.ascender show();
    wait getanimlength(in_xanim);
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5e4
// Size: 0xbd
function ai_ascender_animloop(loop_xanim, animnode) {
    self.anchor = spawn("script_origin", self.origin);
    self.anchor.angles = self.angles;
    self linkto(self.anchor);
    self.ascender linkto(self.anchor);
    var_675510f88d731497 = getanimlength(loop_xanim);
    self.anchor moveto(animnode.end_node.origin, var_675510f88d731497 * 3);
    self.anchor waittill("movedone");
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9
// Size: 0x99
function ai_ascender_animout(var_5d4eba776abdcecf, var_bc638c476608c29e, out_xanim) {
    self unlink();
    self.ascender scriptmodelclearanim();
    self.ascender scriptmodelplayanimdeltamotionfrompos(var_5d4eba776abdcecf, self.ascender.origin, self.ascender.angles);
    self aisetanim("animscripted2", var_bc638c476608c29e);
    wait getanimlength(out_xanim);
    self.anchor delete();
    self.ascender delete();
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74a
// Size: 0xca
function ai_ascender_getstartpos(animalias, animnode) {
    anim_index = scripts\asm\asm::asm_lookupanimfromalias("animscripted2", animalias);
    xanim = scripts\asm\asm::asm_getxanim("animscripted2", anim_index);
    start_node = spawnstruct();
    if (!isdefined(animnode.angles)) {
        animnode.angles = (0, 0, 0);
    }
    start_node.origin = getstartorigin(animnode.origin, animnode.angles, xanim);
    start_node.angles = getstartangles(animnode.origin, animnode.angles, xanim);
    return start_node;
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x81d
// Size: 0xce
function ai_ascender_giveascender(struct) {
    self.old_weapon = self.weapon;
    self.ascender_weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_me_fists_mp", [], "none", "none", -1);
    self giveweapon(self.ascender_weapon);
    self takeweapon(self.old_weapon);
    self setspawnweapon(self.ascender_weapon);
    self.ascender = spawn("script_model", struct.origin);
    self.ascender.angles = struct.angles;
    self.ascender setmodel("misc_wm_ascender");
    self.ascender hide();
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f3
// Size: 0x32
function ai_ascender_takeascender() {
    self giveweapon(self.old_weapon);
    self takeweapon(self.ascender_weapon);
    self setspawnweapon(self.old_weapon);
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x92d
// Size: 0x3a
function ai_ascender_getclosestascender(pos) {
    ascenders = getstructarray("ascend_begin", "script_noteworthy");
    sorted = getclosest(pos, ascenders);
    return sorted;
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0x3a
function ai_ascender_getclosestdescender(pos) {
    ascenders = getstructarray("descend_begin", "script_noteworthy");
    sorted = getclosest(pos, ascenders);
    return sorted;
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9b3
// Size: 0x37
function ascender_deathwatcher() {
    self endon("ascended");
    ascender = self.ascender;
    self.do_immediate_ragdoll = 1;
    self waittill("death");
    ascender delete();
}

// Namespace namespace_65193b393806247d / scripts\cp\utility\auto_ascender_ai
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f2
// Size: 0x91
function toggle_ai_settings(usingascender, goalnode) {
    if (usingascender) {
        self.ignoreall = 1;
        if (isdefined(goalnode)) {
            self.goalradius = 8;
            self setgoalpos(self getclosestreachablepointonnavmesh(goalnode.origin));
            self waittill("goal");
            wait 1;
        }
        scripts\asm\asm_mp::asm_setanimscripted();
        self.playing_skit = 1;
        return;
    }
    self.goalradius = 4096;
    self.ignoreall = 0;
    scripts\asm\shared\mp\utility::animscripted_clear();
    self.playing_skit = undefined;
}

