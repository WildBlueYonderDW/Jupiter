// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;

#namespace bounty;

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x4c
function init() {
    level.bounty_index = [];
    level._effect["vfx_mo_money_cash_exp"] = loadfx("vfx/iw7/_requests/mp/vfx_mo_money_cash_exp.vfx");
    if (1) {
        thread onplayerconnect();
        namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
        namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onplayerjoinedteam);
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18f
// Size: 0x26
function onplayerconnect() {
    while (1) {
        player = level waittill("connected");
        player bountyinit();
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc
// Size: 0x25
function bountyinit() {
    if (!isdefined(self.bountypoints)) {
        playerregisterbountyindex();
        playerresetbountypoints();
        playerresetbountystreak();
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e8
// Size: 0x30
function onplayerdisconnect(player) {
    if (isdefined(player.bounty_index)) {
        level.bounty_index[player.bounty_index] = undefined;
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x30
function onplayerjoinedspectators(player) {
    if (1) {
        if (isdefined(player.bounty_index)) {
            player playerresetbountypoints();
            player playerresetbountystreak();
        }
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x256
// Size: 0x30
function onplayerjoinedteam(player) {
    if (1) {
        if (isdefined(player.bounty_index)) {
            player playerresetbountypoints();
            player playerresetbountystreak();
        }
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x3b
function playerregisterbountyindex() {
    for (index = 0; isdefined(level.bounty_index[index]); index++) {
    }
    level.bounty_index[index] = self;
    self.bounty_index = index;
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf
// Size: 0x24
function playergetbountypoints() {
    /#
        assertex(isdefined(self.bountypoints), "This entity does not have a bounty");
    #/
    return self.bountypoints;
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb
// Size: 0x50
function playersetbountypoints(bountypoints) {
    /#
        assertex(isdefined(self.bounty_index), "This entity does not have a bounty");
    #/
    self.bountypoints = bountypoints;
    level.bounty_index[self.bounty_index] setbountycount(self.bountypoints);
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352
// Size: 0x25
function playerresetbountypoints(wait_time) {
    if (0) {
        return;
    }
    if (isdefined(wait_time)) {
        wait(wait_time);
    }
    if (isdefined(self)) {
        playersetbountypoints(0);
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x27
function playerresetbountystreak(wait_time) {
    if (0) {
        return;
    }
    if (isdefined(wait_time)) {
        wait(wait_time);
    }
    if (isdefined(self)) {
        self.bountystreak = 0;
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x35
function bountyincreasestreak(amount) {
    if (0) {
        return;
    }
    if (!isdefined(amount)) {
        amount = 1;
    }
    self.bountystreak = self.bountystreak + amount;
    bountyconvert();
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e8
// Size: 0x50
function bountyconvert() {
    if (0) {
        return;
    }
    var_350b780c8443d4 = playergetbountypoints();
    var_fddc6d6d48703985 = int(floor(self.bountystreak / 3));
    if (var_fddc6d6d48703985 > var_350b780c8443d4 && var_fddc6d6d48703985 <= 5) {
        playersetbountypoints(var_fddc6d6d48703985);
    }
}

// Namespace bounty/namespace_7ff762d1c2a7da35
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43f
// Size: 0x8b
function bountycollect(var_d55dc1ee4d799341, var_11fbc6946af7e858) {
    if (0) {
        return;
    }
    if (_hasperk("specialty_bounty")) {
        if (var_d55dc1ee4d799341 > 0) {
            for (i = 0; i < var_d55dc1ee4d799341; i++) {
                thread doscoreevent(#"bounty");
                bountyincreasestreak();
                playfx(getfx("vfx_mo_money_cash_exp"), var_11fbc6946af7e858 + (0, 0, 45));
            }
            thread teamplayercardsplash("callout_bounty_collected", self);
        }
    }
}

