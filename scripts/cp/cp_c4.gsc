#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using script_74502a9e0ef1f19c;
#using script_7ef95bba57dc4b82;
#using script_1db8d0e02a99c5e2;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace namespace_3c94cb034daa5398;

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x202
// Size: 0x1f9
function c4_used(grenade) {
    self endon("disconnect");
    grenade endon("death");
    grenade thread c4_deleteonownerdisconnect(self);
    grenade.throwtime = gettime();
    grenade.deletefunc = &c4_delete;
    c4_addtoarray(grenade);
    thread c4_watchfordetonation();
    thread c4_watchforaltdetonation();
    grenade thread minedamagemonitor();
    grenade thread c4_explodeonnotify();
    stuckto, hitent, surfacetype, velocity, position, normal = grenade waittill("missile_stuck");
    onlethalequipmentplanted(grenade, "power_c4");
    thread monitordisownedequipment(self, grenade);
    level notify("c4_planted", stuckto, hitent);
    if (isdefined(grenade.owner) && !istrue(grenade.owner.var_95f9da0e6a58183b)) {
        var_997b28e32a97c75 = spawnstruct();
        var_997b28e32a97c75.scriptablename = "brloot_offhand_c4";
        var_997b28e32a97c75.equipname = level.br_pickups.br_equipname[var_997b28e32a97c75.scriptablename];
        var_997b28e32a97c75.maxcount = grenade.owner namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(var_997b28e32a97c75.equipname);
        var_997b28e32a97c75.count = 1;
        var_997b28e32a97c75.origin = grenade.origin;
        var_997b28e32a97c75.isstuck = 1;
        grenade thread namespace_47366e00aa4211f4::makeexplosiveusabletag("tag_use", 1, undefined, var_997b28e32a97c75);
    }
    grenade setscriptablepartstate("effects", "plant", 0);
    grenade.headiconid = grenade scripts\cp_mp\entityheadicons::setheadicon_factionimage(0, 0, undefined, undefined, undefined, 0.1, 1);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x403
// Size: 0x2f
function c4_detonate() {
    self endon("death");
    self.owner endon("disconnect");
    wait 0.1;
    thread c4_explode(self.owner);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x43a
// Size: 0x6a
function c4_explode(attacker) {
    thread c4_delete(5);
    name = "noname";
    if (isdefined(attacker.name)) {
        name = attacker.name;
    }
    level notify("grenade_exploded_during_stealth", self, "c4_mp", name);
    self setentityowner(attacker);
    self setscriptablepartstate("effects", "explode", 0);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac
// Size: 0x27
function c4_destroy(attacker) {
    thread c4_delete(2);
    self setscriptablepartstate("effects", "destroy", 0);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4db
// Size: 0xb7
function c4_delete(var_cbf7be4f62a0ddb2) {
    self notify("death");
    level.mines[self getentitynumber()] = undefined;
    namespace_a0628d6954815ef8::makeexplosiveunusuabletag();
    scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.headiconid);
    self.headiconid = undefined;
    self.exploding = 1;
    owner = self.owner;
    if (isdefined(self.owner) && isplayer(self.owner)) {
        owner.plantedlethalequip = array_remove(owner.plantedlethalequip, self);
        owner notify("c4_update", 0);
    }
    if (isdefined(var_cbf7be4f62a0ddb2)) {
        wait var_cbf7be4f62a0ddb2;
    }
    self delete();
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59a
// Size: 0x60
function c4_explodeonnotify() {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    owner = self.owner;
    attacker = self waittill("detonateExplosive");
    if (isdefined(attacker)) {
        thread c4_explode(attacker);
        return;
    }
    thread c4_explode(owner);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x62
function c4_destroyonemp() {
    self endon("death");
    self.owner endon("disconnect");
    attacker, duration = self waittill("emp_damage");
    if (isdefined(self.owner) && attacker != self.owner) {
        attacker notify("destroyed_equipment");
    }
    thread c4_destroy();
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66c
// Size: 0x32
function c4_candetonate(grenade) {
    return (gettime() - self.throwtime) / 1000 > 0.3 && !isdefined(self.detonationtime);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a7
// Size: 0xc4
function c4_watchfordetonation() {
    self endon("death_or_disconnect");
    self endon("c4_unset");
    level endon("game_ended");
    self notify("watchForDetonation");
    self endon("watchForDetonation");
    while (true) {
        self waittill("detonate");
        heldoffhand = self getheldoffhand();
        var_49e6ef3edadd524e = function_f581838ce4328f7a(heldoffhand);
        if (heldoffhand.basename == "c4_mp" || heldoffhand.basename == "c4_empty_mp" || heldoffhand.basename == "none" && isdefined(self.isusingcamera) && self.isusingcamera || var_49e6ef3edadd524e == "c4") {
            thread c4_detonateall();
        }
    }
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x773
// Size: 0xed
function c4_watchforaltdetonation() {
    self endon("death");
    self endon("disconnect");
    self endon("c4_unset");
    level endon("game_ended");
    if (!getdvarint(@"hash_78d40bc744ba9f00", 0)) {
        return;
    }
    self notify("watchForAltDetonation");
    self endon("watchForAltDetonation");
    buttontime = 0;
    while (true) {
        if (self usebuttonpressed()) {
            buttontime = 0;
            while (self usebuttonpressed()) {
                buttontime += 0.05;
                wait 0.05;
            }
            println("<dev string:x1c>" + buttontime);
            if (buttontime >= 0.5) {
                continue;
            }
            buttontime = 0;
            while (!self usebuttonpressed() && buttontime < 0.5) {
                buttontime += 0.05;
                wait 0.05;
            }
            println("<dev string:x29>" + buttontime);
            if (buttontime >= 0.5) {
                continue;
            }
            thread c4_animdetonate();
        }
        wait 0.05;
    }
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x868
// Size: 0x27
function c4_animdetonate() {
    objweapon = makeweapon("c4_empty_mp");
    self giveandfireoffhand(objweapon);
    thread c4_animdetonatecleanup();
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x897
// Size: 0x42
function c4_animdetonatecleanup() {
    self endon("death_or_disconnect");
    self notify("c4_animDetonateCleanup()");
    self endon("c4_animDetonateCleanup()");
    objweapon = makeweapon("c4_empty_mp");
    wait 1;
    if (self hasweapon(objweapon)) {
        self takeweapon(objweapon);
    }
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8e1
// Size: 0x6b
function c4_detonateall() {
    if (isdefined(self.c4s)) {
        foreach (c4 in self.c4s) {
            if (c4 c4_candetonate()) {
                c4 thread c4_detonate();
            }
        }
    }
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x954
// Size: 0x4e
function c4_addtoarray(grenade) {
    if (!isdefined(self.c4s)) {
        self.c4s = [];
    }
    self.c4s[grenade getentitynumber()] = grenade;
    self function_bcc86382f02470e6(1);
    level notify("c4_used");
    thread c4_removefromarrayondeath(grenade);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9aa
// Size: 0xa6
function c4_removefromarray(entnum) {
    if (!isdefined(self.c4s)) {
        return;
    }
    self.c4s[entnum] = undefined;
    owner = self.owner;
    if (isdefined(owner) && isdefined(owner.c4s)) {
        foreach (c4 in owner.c4s) {
            if (isdefined(c4)) {
                return;
            }
        }
        owner function_bcc86382f02470e6(0);
    }
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa58
// Size: 0x33
function c4_removefromarrayondeath(grenade) {
    self endon("disconnect");
    entnum = grenade getentitynumber();
    grenade waittill("death");
    c4_removefromarray(entnum);
}

// Namespace namespace_3c94cb034daa5398 / scripts\cp\cp_c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa93
// Size: 0x28
function c4_deleteonownerdisconnect(owner) {
    self endon("death");
    self endon("missile_stuck");
    owner waittill("disconnect");
    self delete();
}

