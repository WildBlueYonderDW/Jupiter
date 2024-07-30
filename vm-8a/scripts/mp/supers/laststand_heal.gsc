#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\supers.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\battlechatter_mp.gsc;

#namespace laststand_heal;

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x141
function laststandheal_onset() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("lastStandHeal_unset");
    waittillframeend();
    thread laststandheal_watchrespawn();
    self.laststandheal_hassuperweapon = 1;
    while (true) {
        if (self.laststandheal_hassuperweapon && (!istrue(self.inlaststand) || istrue(self.stuckinlaststand) || istrue(getbeingrevivedinternal()))) {
            superweapon = scripts\mp\supers::getcurrentsuper().staticdata.weapon;
            self clearoffhandspecial();
            if (isdefined(superweapon)) {
                scripts\cp_mp\utility\inventory_utility::_takeweapon(superweapon);
            }
            self.laststandheal_hassuperweapon = 0;
        } else if (!self.laststandheal_hassuperweapon && istrue(self.inlaststand) && !istrue(self.stuckinlaststand) && !istrue(getbeingrevivedinternal())) {
            superweapon = scripts\mp\supers::getcurrentsuper().staticdata.weapon;
            scripts\cp_mp\utility\inventory_utility::_giveweapon(superweapon);
            ammo = ter_op(scripts\mp\supers::issuperready(), 1, 0);
            self setweaponammoclip(superweapon, ammo);
            self assignweaponoffhandspecial(superweapon);
            self.laststandheal_hassuperweapon = 1;
        }
        wait 0.05;
    }
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0xa
function laststandheal_unset() {
    self notify("lastStandHeal_unset");
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f4
// Size: 0x2f
function laststandheal_watchrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("lastStandHeal_unset");
    while (true) {
        self waittill("spawned_player");
        waittillframeend();
        laststandheal_onrespawn();
    }
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b
// Size: 0x45
function laststandheal_onrespawn() {
    superweapon = scripts\mp\supers::getcurrentsuper().staticdata.weapon;
    self clearoffhandspecial();
    if (isdefined(superweapon)) {
        scripts\cp_mp\utility\inventory_utility::_takeweapon(superweapon);
    }
    self.laststandheal_hassuperweapon = 0;
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x14
function laststandheal_beginuse() {
    thread laststandheal_think();
    thread laststandheal_setinactivewhendone();
    return true;
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x395
// Size: 0xc8
function laststandheal_think() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("last_stand_finished");
    delaythread(0.05, &laststandheal_drainsupermeter);
    self.laststandhealisactive = 1;
    self notify("last_stand_heal_active");
    self notify("handle_revive_message");
    val::set("lastStandHeal", "allow_movement", 0);
    wait 0.45;
    self playlocalsound("laststand_heal_start");
    self notify("force_regeneration");
    while (self.health < self.maxhealth) {
        waitframe();
    }
    val::reset_all("lastStandHeal");
    scripts\mp\supers::superusefinished(undefined, undefined, undefined, 1);
    self playlocalsound("laststand_heal_done");
    self notify("last_stand_heal_success");
    level thread scripts\mp\battlechatter_mp::trysaylocalsound(self, #"hash_1f1f4fe800e03b33");
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x465
// Size: 0x4d
function laststandheal_drainsupermeter() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("last_stand_heal_success");
    while (true) {
        scripts\mp\supers::reducesuperusepercent(5, 0, 1);
        superinfo = scripts\mp\supers::getcurrentsuper();
        if (superinfo.usepercent <= 0) {
            return;
        }
    }
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ba
// Size: 0x2b
function laststandheal_setinactivewhendone() {
    level endon("game_ended");
    self endon("disconnect");
    waittill_any_return_no_endon_death_2("death", "last_stand_finished");
    self.laststandhealisactive = 0;
}

// Namespace laststand_heal / scripts\mp\supers\laststand_heal
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ed
// Size: 0x4
function laststandheal_gethealthperframe() {
    return 2;
}

