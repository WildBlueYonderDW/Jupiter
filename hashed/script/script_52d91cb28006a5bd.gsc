// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\engine\math.gsc;

#namespace throwstar;

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x377
// Size: 0xbe
function function_12d7ca3ff609caba() {
    level.var_a96456706e7c0324 = getdvarfloat(@"hash_378f4895fd171e8", 12);
    level.var_474a06de6db75b6a = getdvarfloat(@"hash_85766dcc125edac", 20);
    level._effect["thorwstar_impact_stick"] = loadfx("vfx/iw9/core/equipment/throwstar/vfx_throwstar_impact_stick.vfx");
    level._effect["thorwstar_impact_reflect"] = loadfx("vfx/iw9/core/equipment/throwstar/vfx_throwstar_impact_reflect.vfx");
    level._effect["thorwstar_impact_flesh"] = loadfx("vfx/iw9/core/equipment/throwstar/vfx_throwstar_impact_flesh.vfx");
    level._effect["thorwstar_impact_water"] = loadfx("vfx/iw9/core/equipment/throwstar/vfx_throwstar_impact_water.vfx");
    setdvarifuninitialized(@"hash_e34dbb045ad712e7", 0);
    function_f3bb4f4911a1beb2("throwstar", "init");
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c
// Size: 0x2d
function function_e7715ffb329c1b40(equipmentref, equipmentslot, variantid) {
    function_f3bb4f4911a1beb2("throwstar", "onGive");
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x470
// Size: 0x25
function function_92e126d1a5d3fb2(equipmentref, equipmentslot) {
    function_f3bb4f4911a1beb2("throwstar", "onTake");
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49c
// Size: 0xe9
function function_709581d70ebb07cd(grenade) {
    grenade endon("death");
    grenade.bwasunderwater = isswimmingunderwater();
    grenade thread function_a4294dfcd472070b();
    grenade makeunusable();
    var_88c9497e3683f50d = grenade.angles;
    grenade endon("throwstar_cancel_stuck_wait");
    stuckto, stuckpart, surfacetype, hitvelocity, position, hitnormal = grenade waittill("missile_stuck");
    if (getdvarint(@"hash_e34dbb045ad712e7")) {
        grenade setscriptablepartstate("showLocation", "active", 0);
        grenade function_1f6c16ac84ef5c16();
        return;
    }
    thread function_f206558a684b471a(stuckto, stuckpart, var_88c9497e3683f50d, surfacetype, hitvelocity, position, hitnormal);
    grenade delete();
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0xff
function function_1f6c16ac84ef5c16() {
    self makeunusable();
    trigger = spawn("trigger_radius", self.origin, 0, 64, 64);
    trigger enablelinkto();
    trigger linkto(self);
    self.var_6f09a59aee157204 = trigger;
    if (!isdefined(level.var_1e54d8b3480e52fc)) {
        level.var_1e54d8b3480e52fc = [];
    }
    temparr = [self];
    foreach (throwstar in level.var_1e54d8b3480e52fc) {
        if (temparr.size >= level.var_a96456706e7c0324) {
            if (isdefined(throwstar)) {
                throwstar function_8485894af3536c3b();
            }
            continue;
        }
        if (isdefined(throwstar)) {
            temparr[temparr.size] = throwstar;
        }
    }
    level.var_1e54d8b3480e52fc = temparr;
    thread function_f54c5164b830fffb();
    thread function_ff1f6e7881a17ea6();
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x692
// Size: 0xce
function private function_f54c5164b830fffb() {
    self endon("death");
    isbackpackinventoryenabled = 0;
    if (scripts/engine/utility::issharedfuncdefined("inventory", "isBackpackInventoryEnabled")) {
        isbackpackinventoryenabled = [[ getsharedfunc("inventory", "isBackpackInventoryEnabled") ]]();
    }
    while (true) {
        player = self.var_6f09a59aee157204 waittill("trigger");
        if (!isplayer(player)) {
            continue;
        }
        if (!player _isalive()) {
            continue;
        }
        if (isdefined(self.owner) && self.owner != player) {
            continue;
        }
        if (!player hasweapon(self.weapon_object) && !isbackpackinventoryenabled) {
            continue;
        }
        if (player function_10769923b31f128c(self.equipmentref)) {
            thread function_8485894af3536c3b();
        }
    }
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x767
// Size: 0x52
function private function_10769923b31f128c(equipmentref) {
    if (scripts/engine/utility::issharedfuncdefined("throwstar", "tryToPickup")) {
        pickupsuccessful = self [[ getsharedfunc("throwstar", "tryToPickup") ]](equipmentref);
        /#
            assertex(isdefined(pickupsuccessful), "shared func throwstar tryToPickup must return a bool.");
        #/
        return pickupsuccessful;
    }
    return 1;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7c1
// Size: 0x26
function private function_8485894af3536c3b() {
    if (isdefined(self.var_6f09a59aee157204)) {
        self.var_6f09a59aee157204 delete();
    }
    self delete();
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7ee
// Size: 0x1c
function private function_ff1f6e7881a17ea6() {
    self endon("death");
    wait(level.var_474a06de6db75b6a);
    thread function_8485894af3536c3b();
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x811
// Size: 0x4d
function private function_a4294dfcd472070b() {
    self endon("explode");
    self endon("death");
    self endon("missile_stuck");
    if (istrue(self.inert)) {
        return 0;
    }
    impactdata = self waittill("missile_water_impact");
    self.bwasunderwater = 1;
    thread function_c759de2f9501126();
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x865
// Size: 0x105
function private function_c759de2f9501126() {
    level endon("game_end");
    self endon("missile_stuck");
    owner = self.owner;
    newspawnpos = self.origin;
    var_f59b0d71ab63af6 = self.weapon_object;
    var_88c9497e3683f50d = self.angles;
    inertweapon = "throwstar_mp_inert";
    dudpos = self waittill("missile_change_to_dud");
    owner notify("throwstar_cancel_stuck_wait");
    if (getdvarint(@"hash_e34dbb045ad712e7")) {
        if (isdefined(dudpos)) {
            newspawnpos = dudpos;
            replacementstar = owner launchgrenade(inertweapon, newspawnpos, (0, 0, 0), undefined, undefined);
            replacementstar.inert = 1;
            replacementstar.var_f59b0d71ab63af6 = var_f59b0d71ab63af6;
            replacementstar.angles = var_88c9497e3683f50d;
        }
        return;
    }
    if (isdefined(dudpos)) {
        newspawnpos = dudpos;
        function_54e5d17bda41f63a(newspawnpos, var_88c9497e3683f50d);
    }
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x971
// Size: 0xb3
function function_db4bbcfe23f19148(einflictor, victim, idamage, partname) {
    if (scripts/cp_mp/utility/damage_utility::function_b656251147d7d40b(partname)) {
        idamage = 250;
        if (isdefined(victim)) {
            victim.var_f83c15acb64c91b7 = 1;
        }
    } else if (isdefined(victim)) {
        victim.var_f83c15acb64c91b7 = undefined;
    }
    if (isdefined(einflictor.bwasunderwater) && istrue(einflictor.bwasunderwater)) {
        idamage = function_ce1d250379db9655(victim);
    }
    if (isdefined(victim) && isdefined(victim.inlaststand) && istrue(victim.inlaststand)) {
        idamage = victim.health;
    }
    return idamage;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2c
// Size: 0x5
function function_fc924820627e1c55() {
    return 130;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa39
// Size: 0x55
function function_ce1d250379db9655(victim) {
    outdmg = 45;
    var_451f4dc5070c2a = victim.health - 45 <= 0;
    if (var_451f4dc5070c2a) {
        outdmg = int(max(victim.health - 1, 1));
    }
    return outdmg;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa96
// Size: 0x8f
function function_f206558a684b471a(stuckto, stuckpart, var_5bf254e86be4a055, surfacetype, hitvelocity, position, hitnormal) {
    if (function_81814781949469b5(stuckto)) {
        function_24b586e36bf90639(var_5bf254e86be4a055, position, hitnormal);
        return;
    }
    if (function_9453e7a6466c7e47(stuckto, stuckpart, surfacetype)) {
        function_d621dbdc62927db7(var_5bf254e86be4a055, hitvelocity, position);
        return;
    }
    if (function_100e72ca4ff67c80(position)) {
        function_54e5d17bda41f63a(position, var_5bf254e86be4a055);
        return;
    }
    function_83388fba79e562c(var_5bf254e86be4a055, hitvelocity, position, hitnormal);
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb2c
// Size: 0x37
function private function_81814781949469b5(stuckto) {
    if (isdefined(stuckto) && (isplayer(stuckto) || isbot(stuckto) || isagent(stuckto))) {
        return 1;
    }
    return 0;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb6a
// Size: 0xce
function private function_9453e7a6466c7e47(stuckto, stuckpart, surfacetype) {
    if (isdefined(stuckto) || isdefined(stuckpart)) {
        return 0;
    }
    if (!isdefined(surfacetype)) {
        return 0;
    }
    switch (surfacetype) {
    case #"hash_41e04530b0d1a782":
    case #"hash_51929a2eb8e4f743":
    case #"hash_590687995d01030e":
    case #"hash_60c926590a0f6396":
    case #"hash_87a0a54672bcf62d":
    case #"hash_8dede5336d28890d":
    case #"hash_94fae4c6dd8b1184":
    case #"hash_a13dd2b8b51545eb":
    case #"hash_a195e7e44c7eb519":
    case #"hash_c05d848a0e130e97":
    case #"hash_d7db938a07617552":
        return 1;
    default:
        return 0;
    }
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc3f
// Size: 0x1a
function private function_100e72ca4ff67c80(position) {
    if (scripts/engine/utility::function_6c71c72547bb931(position)) {
        return true;
    }
    return false;
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc61
// Size: 0x39
function private function_24b586e36bf90639(var_5bf254e86be4a055, position, hitnormal) {
    playfx(level._effect["thorwstar_impact_flesh"], position, hitnormal, anglestoup(var_5bf254e86be4a055));
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xca1
// Size: 0x4a
function private function_d621dbdc62927db7(var_5bf254e86be4a055, hitvelocity, position) {
    forward = vectornormalize(hitvelocity);
    playfx(level._effect["thorwstar_impact_stick"], position, forward, anglestoup(var_5bf254e86be4a055));
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcf2
// Size: 0x36
function private function_54e5d17bda41f63a(position, var_5bf254e86be4a055) {
    playfx(level._effect["thorwstar_impact_water"], position, anglestoforward(var_5bf254e86be4a055), anglestoup(var_5bf254e86be4a055));
}

// Namespace throwstar / namespace_9cff5695f11e1c45
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd2f
// Size: 0x54
function private function_83388fba79e562c(var_5bf254e86be4a055, hitvelocity, position, hitnormal) {
    reflectvec = scripts/engine/math::vector_reflect(hitvelocity, hitnormal);
    playfx(level._effect["thorwstar_impact_reflect"], position, reflectvec, anglestoup(var_5bf254e86be4a055));
}

