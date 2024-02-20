// mwiii decomp prototype
#namespace usability;

// Namespace usability/namespace_f3adc1a051236823
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd
// Size: 0x79
function setselfusable(caller) {
    self makeusable();
    foreach (player in level.players) {
        if (player != caller) {
            self disableplayeruse(player);
        } else {
            self enableplayeruse(player);
        }
    }
}

// Namespace usability/namespace_f3adc1a051236823
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0x58
function setallunusable() {
    foreach (player in level.players) {
        self disableplayeruse(player);
    }
}

// Namespace usability/namespace_f3adc1a051236823
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x1c
function maketeamusable(team) {
    self makeusable();
    thread _updateteamusable(team);
}

// Namespace usability/namespace_f3adc1a051236823
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ff
// Size: 0x8e
function _updateteamusable(team) {
    self endon("death");
    for (;;) {
        foreach (player in level.players) {
            if (player.team == team) {
                self enableplayeruse(player);
            } else {
                self disableplayeruse(player);
            }
        }
        level waittill("joined_team");
    }
}

// Namespace usability/namespace_f3adc1a051236823
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x294
// Size: 0x25
function makeenemyusable(owner, var_418a5c9b9391dfc7) {
    self makeusable();
    thread _updateenemyusable(owner, var_418a5c9b9391dfc7);
}

// Namespace usability/namespace_f3adc1a051236823
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c0
// Size: 0x15e
function _updateenemyusable(owner, var_418a5c9b9391dfc7) {
    self endon("death");
    team = owner.team;
    for (;;) {
        for (;;) {
            if (level.teambased) {
                foreach (player in level.players) {
                    if (istrue(var_418a5c9b9391dfc7)) {
                        if (player.team != team || player == owner) {
                            self enableplayeruse(player);
                        } else {
                            self disableplayeruse(player);
                        }
                    } else if (player.team != team) {
                        self enableplayeruse(player);
                    } else {
                        self disableplayeruse(player);
                    }
                }
            } else {
                foreach (player in level.players) {
                    if (istrue(var_418a5c9b9391dfc7)) {
                        self enableplayeruse(player);
                    } else if (player != owner) {
                        self enableplayeruse(player);
                    } else {
                        self disableplayeruse(player);
                    }
                }
            }
        }
    }
}

// Namespace usability/namespace_f3adc1a051236823
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x425
// Size: 0x6c
function notusableforjoiningplayers(owner) {
    self notify("notusablejoiningplayers");
    self endon("death");
    level endon("game_ended");
    owner endon("death_or_disconnect");
    self endon("notusablejoiningplayers");
    self endon("makeExplosiveUnusable");
    while (1) {
        player = level waittill("player_spawned");
        if (isdefined(self) && isdefined(player) && player != owner) {
            self disableplayeruse(player);
        }
    }
}

// Namespace usability/namespace_f3adc1a051236823
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498
// Size: 0x57
function notusableafterownerchange(owner, equipment) {
    self notify("notusableafterownerchange");
    self endon("death");
    level endon("game_ended");
    owner endon("death_or_disconnect");
    self endon("notusableafterownerchange");
    self endon("makeExplosiveUnusable");
    while (1) {
        equipment waittill("ownerChanged");
        self disableplayeruse(owner);
    }
}

