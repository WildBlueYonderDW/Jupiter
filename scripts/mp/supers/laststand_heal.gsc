// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\battlechatter_mp.gsc;

#namespace namespace_709a088860419b9e;

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x142
function laststandheal_onset() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("lastStandHeal_unset");
    waittillframeend();
    thread laststandheal_watchrespawn();
    self.laststandheal_hassuperweapon = 1;
    while (1) {
        if (self.laststandheal_hassuperweapon && (!istrue(self.inlaststand) || istrue(self.stuckinlaststand) || istrue(getbeingrevivedinternal()))) {
            var_641083e829d5514c = namespace_85d036cb78063c4a::getcurrentsuper().staticdata.weapon;
            self clearoffhandspecial();
            if (isdefined(var_641083e829d5514c)) {
                namespace_df5cfdbe6e2d3812::_takeweapon(var_641083e829d5514c);
            }
            self.laststandheal_hassuperweapon = 0;
        } else if (!self.laststandheal_hassuperweapon && istrue(self.inlaststand) && !istrue(self.stuckinlaststand) && !istrue(getbeingrevivedinternal())) {
            var_641083e829d5514c = namespace_85d036cb78063c4a::getcurrentsuper().staticdata.weapon;
            namespace_df5cfdbe6e2d3812::_giveweapon(var_641083e829d5514c);
            ammo = ter_op(namespace_85d036cb78063c4a::issuperready(), 1, 0);
            self setweaponammoclip(var_641083e829d5514c, ammo);
            self assignweaponoffhandspecial(var_641083e829d5514c);
            self.laststandheal_hassuperweapon = 1;
        }
        wait(0.05);
    }
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0xb
function laststandheal_unset() {
    self notify("lastStandHeal_unset");
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x30
function laststandheal_watchrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("lastStandHeal_unset");
    while (1) {
        self waittill("spawned_player");
        waittillframeend();
        laststandheal_onrespawn();
    }
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x46
function laststandheal_onrespawn() {
    var_641083e829d5514c = namespace_85d036cb78063c4a::getcurrentsuper().staticdata.weapon;
    self clearoffhandspecial();
    if (isdefined(var_641083e829d5514c)) {
        namespace_df5cfdbe6e2d3812::_takeweapon(var_641083e829d5514c);
    }
    self.laststandheal_hassuperweapon = 0;
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x15
function laststandheal_beginuse() {
    thread laststandheal_think();
    thread laststandheal_setinactivewhendone();
    return 1;
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395
// Size: 0xc9
function laststandheal_think() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("last_stand_finished");
    delaythread(0.05, &laststandheal_drainsupermeter);
    self.laststandhealisactive = 1;
    self notify("last_stand_heal_active");
    self notify("handle_revive_message");
    val::set("lastStandHeal", "allow_movement", 0);
    wait(0.45);
    self playlocalsound("laststand_heal_start");
    self notify("force_regeneration");
    while (self.health < self.maxhealth) {
        waitframe();
    }
    val::function_c9d0b43701bdba00("lastStandHeal");
    namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    self playlocalsound("laststand_heal_done");
    self notify("last_stand_heal_success");
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_1f1f4fe800e03b33");
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0x4e
function laststandheal_drainsupermeter() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("last_stand_heal_success");
    while (1) {
        namespace_85d036cb78063c4a::reducesuperusepercent(5, 0, 1);
        var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
        if (var_19163e14365d9264.usepercent <= 0) {
            return;
        }
    }
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x2c
function laststandheal_setinactivewhendone() {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_return_no_endon_death_2("death", "last_stand_finished");
    self.laststandhealisactive = 0;
}

// Namespace namespace_709a088860419b9e/namespace_d9b268ea32202144
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed
// Size: 0x5
function laststandheal_gethealthperframe() {
    return 2;
}

