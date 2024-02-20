// mwiii decomp prototype
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_271864dbf821135c;

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b
// Size: 0xa
function applyarchetype() {
    equipextras();
}

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c
// Size: 0x3
function equipextras() {
    
}

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x3
function removearchetype() {
    
}

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160
// Size: 0xb5
function auraquickswap_run() {
    self endon("death_or_disconnect");
    self endon("removeArchetype");
    self setclientomnvar("ui_aura_quickswap", 0);
    while (1) {
        self waittill("got_a_kill");
        var_d54ea18dc801bdf8 = utility::playersincylinder(self.origin, 384);
        foreach (player in var_d54ea18dc801bdf8) {
            if (player.team != self.team) {
                continue;
            }
            player thread auraquickswap_bestowaura(self);
        }
    }
}

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x97
function auraquickswap_bestowaura(player) {
    self endon("death_or_disconnect");
    self endon("giveLoadout_start");
    level endon("game_ended");
    if (self != player) {
        player thread doScoreEvent(#"hash_aa59ced8c6dda32d");
    }
    self setclientomnvar("ui_aura_quickswap", 1);
    giveperk("specialty_fastreload");
    self playlocalsound("mp_overcharge_on");
    thread cleanupafterplayerdeath();
    wait(5);
    self playlocalsound("mp_overcharge_off");
    self notify("removeAuraQuickswap");
    removeperk("specialty_fastreload");
    self setclientomnvar("ui_aura_quickswap", 0);
}

// Namespace namespace_271864dbf821135c/namespace_c3864852d989b3e2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ba
// Size: 0x26
function cleanupafterplayerdeath() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    self setclientomnvar("ui_aura_quickswap", 0);
}

