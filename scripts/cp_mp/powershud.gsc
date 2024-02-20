// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace powershud;

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3
// Size: 0x1a6
function powershud_init() {
    power_hud_info = spawnstruct();
    level.power_hud_info = power_hud_info;
    power_hud_info.omnvarnames = [0:"primary", 1:"secondary"];
    power_hud_info.omnvarnames["primary"][0] = "ui_power_num_charges";
    power_hud_info.omnvarnames["primary"][1] = "ui_power_max_charges";
    power_hud_info.omnvarnames["primary"][2] = "ui_power_recharge";
    power_hud_info.omnvarnames["primary"][3] = "ui_power_id";
    power_hud_info.omnvarnames["primary"][4] = "ui_power_consume";
    power_hud_info.omnvarnames["primary"][5] = "ui_power_disabled";
    power_hud_info.omnvarnames["primary"][6] = "ui_power_state";
    power_hud_info.omnvarnames["secondary"][0] = "ui_power_secondary_num_charges";
    power_hud_info.omnvarnames["secondary"][1] = "ui_power_secondary_max_charges";
    power_hud_info.omnvarnames["secondary"][2] = "ui_power_secondary_recharge";
    power_hud_info.omnvarnames["secondary"][3] = "ui_power_id_secondary";
    power_hud_info.omnvarnames["secondary"][4] = "ui_power_secondary_consume";
    power_hud_info.omnvarnames["secondary"][5] = "ui_power_secondary_disabled";
    power_hud_info.omnvarnames["secondary"][6] = "ui_power_secondary_state";
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x390
// Size: 0x90
function powershud_assignpower(slot, var_7d87aec0310ca8ba, var_e6a275c0d8d523fe, charges) {
    if (slot == "scripted") {
        return;
    }
    self setclientomnvar(powershud_getslotomnvar(slot, 3), var_7d87aec0310ca8ba);
    var_cace223e2afc3c58 = ter_op(var_e6a275c0d8d523fe, 1000, 0);
    self setclientomnvar(powershud_getslotomnvar(slot, 2), var_cace223e2afc3c58);
    if (!isdefined(charges)) {
        charges = 0;
    }
    self setclientomnvar(powershud_getslotomnvar(slot, 0), charges);
    self setclientomnvar(powershud_getslotomnvar(slot, 4), 0);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x427
// Size: 0x5d
function powershud_clearpower(slot) {
    if (slot == "scripted") {
        return;
    }
    self setclientomnvar(powershud_getslotomnvar(slot, 3), -1);
    self setclientomnvar(powershud_getslotomnvar(slot, 2), -1);
    self setclientomnvar(powershud_getslotomnvar(slot, 0), 0);
    self setclientomnvar(powershud_getslotomnvar(slot, 4), -1);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48b
// Size: 0x29
function powershud_updatepowercharges(slot, charges) {
    self setclientomnvar(powershud_getslotomnvar(slot, 0), int(charges));
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb
// Size: 0x2a
function powershud_updatepowermaxcharges(slot, maxcharges) {
    self setclientomnvar(powershud_getslotomnvar(slot, 1), int(maxcharges));
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4ec
// Size: 0x25
function powershud_updatepowerdrain(slot, var_bc08c87c9773ae0) {
    self setclientomnvar(powershud_getslotomnvar(slot, 4), var_bc08c87c9773ae0);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x518
// Size: 0x2a
function powershud_updatepowermeter(slot, var_cace223e2afc3c58) {
    self setclientomnvar(powershud_getslotomnvar(slot, 2), int(var_cace223e2afc3c58));
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x549
// Size: 0x25
function powershud_updatepowerdisabled(slot, disabled) {
    self setclientomnvar(powershud_getslotomnvar(slot, 5), disabled);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x575
// Size: 0x3a
function powershud_updatepoweroffcooldown(slot, oncooldown) {
    var_cabc886d846dd979 = ter_op(oncooldown, 1, 0);
    self setclientomnvar(powershud_getslotomnvar(slot, 6), var_cabc886d846dd979);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b6
// Size: 0x25
function powershud_updatepowerstate(slot, state) {
    self setclientomnvar(powershud_getslotomnvar(slot, 6), state);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e2
// Size: 0x16
function powershud_beginpowerdrain(slot) {
    powershud_updatepowerdrain(slot, 1);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ff
// Size: 0x15
function powershud_endpowerdrain(slot) {
    powershud_updatepowerdrain(slot, 0);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x61b
// Size: 0x3b
function powershud_beginpowercooldown(slot, var_df05da7990d6888f) {
    powershud_updatepowermeter(slot, 0);
    if (isdefined(var_df05da7990d6888f) && var_df05da7990d6888f) {
        powershud_updatepowerdisabled(slot, 1);
    }
    powershud_updatepowerstate(slot, 1);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65d
// Size: 0x60
function powershud_finishpowercooldown(slot, var_df05da7990d6888f) {
    powershud_updatepowermeter(slot, 1000);
    if (isdefined(var_df05da7990d6888f) && var_df05da7990d6888f) {
        powershud_updatepowerdisabled(slot, 0);
    }
    if (slot == "primary") {
        self playlocalsound("iw8_new_objective_sfx");
    } else {
        self playlocalsound("iw8_new_objective_sfx");
    }
    powershud_updatepowerstate(slot, 0);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c4
// Size: 0x21
function powershud_updatepowercooldown(slot, percent) {
    powershud_updatepowermeter(slot, 1000 * percent);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ec
// Size: 0x21
function powershud_updatepowerdrainprogress(slot, percent) {
    powershud_updatepowermeter(slot, 1000 * percent);
}

// Namespace powershud/namespace_a527f6e97b2cb621
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x714
// Size: 0x85
function powershud_getslotomnvar(slot, var_b09f732395c5d400) {
    if (slot == "scripted") {
        return;
    }
    /#
        assert(isdefined(level.power_hud_info));
    #/
    /#
        assert(isdefined(level.power_hud_info.omnvarnames));
    #/
    /#
        assert(isdefined(level.power_hud_info.omnvarnames[slot]));
    #/
    return level.power_hud_info.omnvarnames[slot][var_b09f732395c5d400];
}

