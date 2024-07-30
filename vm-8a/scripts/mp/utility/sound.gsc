#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace sound;

// Namespace sound / scripts\mp\utility\sound
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0x33
function exploder_sound() {
    if (isdefined(self.script_delay)) {
        wait self.script_delay;
    }
    self playsound(level.scr_sound[self.script_sound]);
}

// Namespace sound / scripts\mp\utility\sound
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d
// Size: 0x22f
function playsoundonplayers(sound, team, excludelist) {
    assert(isdefined(level.players));
    if (level.splitscreen) {
        if (isdefined(level.players[0])) {
            level.players[0] playlocalsound(sound);
        }
        return;
    }
    if (isdefined(team)) {
        if (isdefined(excludelist)) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                if (isdefined(player.pers["team"]) && player.pers["team"] == team && !array_contains(excludelist, player)) {
                    player playlocalsound(sound);
                }
            }
        } else {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
                    continue;
                }
                if (isdefined(player.pers["team"]) && player.pers["team"] == team) {
                    player playlocalsound(sound);
                }
            }
        }
        return;
    }
    if (isdefined(excludelist)) {
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i] issplitscreenplayer() && !level.players[i] issplitscreenplayerprimary()) {
                continue;
            }
            if (!array_contains(excludelist, level.players[i])) {
                level.players[i] playlocalsound(sound);
            }
        }
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] issplitscreenplayer() && !level.players[i] issplitscreenplayerprimary()) {
            continue;
        }
        level.players[i] playlocalsound(sound);
    }
}

// Namespace sound / scripts\mp\utility\sound
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d4
// Size: 0x1b
function play_sound_on_entity(alias, var_b426f32755673ba6) {
    play_sound_on_tag(alias);
}

// Namespace sound / scripts\mp\utility\sound
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f7
// Size: 0x39
function play_sound_on_tag(alias, tag) {
    if (isdefined(tag)) {
        playsoundatpos(self gettagorigin(tag), alias);
        return;
    }
    playsoundatpos(self.origin, alias);
}

// Namespace sound / scripts\mp\utility\sound
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x438
// Size: 0x13d
function playdeathsound(meansofdeath) {
    if (istrue(level.var_9d615a366ec2fb6f) || meansofdeath == "MOD_EXECUTION") {
        return;
    }
    rand = randomintrange(1, 8);
    type = "generic";
    if (isfemale()) {
        type = "female";
    }
    if (meansofdeath == "MOD_FALLING" || meansofdeath == "MOD_SUICIDE" && isplayer(self)) {
        if (self.team == "axis") {
            scripts\cp_mp\utility\player_utility::playplayerandnpcsounds(self, "plr_death_explosion", type + "_death_russian_" + rand);
        } else {
            scripts\cp_mp\utility\player_utility::playplayerandnpcsounds(self, "plr_death_explosion", type + "_death_american_" + rand);
        }
        return;
    }
    if (isplayer(self)) {
        if (self.team == "axis") {
            scripts\cp_mp\utility\player_utility::playplayerandnpcsounds(self, "plr_death_generic", type + "_death_russian_" + rand);
        } else {
            scripts\cp_mp\utility\player_utility::playplayerandnpcsounds(self, "plr_death_generic", type + "_death_american_" + rand);
        }
        return;
    }
    if (self.team == "axis") {
        self playsound(type + "_death_russian_" + rand);
        return;
    }
    self playsound(type + "_death_american_" + rand);
}

// Namespace sound / scripts\mp\utility\sound
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57d
// Size: 0x4e
function function_7cf31218d8d83aaf() {
    if (!isarray(level.var_30649350266f97c8)) {
        level.var_30649350266f97c8 = [];
    }
    if (!isent(level.var_6f72b465b2081001)) {
        level.var_6f72b465b2081001 = spawn("sound_transient_soundbanks", (0, 0, 0));
    }
}

// Namespace sound / scripts\mp\utility\sound
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d3
// Size: 0xaa
function function_39467625717d8d27(name) {
    function_7cf31218d8d83aaf();
    assert(isent(level.var_6f72b465b2081001));
    assert(isarray(level.var_30649350266f97c8));
    assertex(isstring(name), "TransientSoundBank requires a name argument");
    if (isdefined(level.var_30649350266f97c8[name])) {
        /#
            iprintlnbold("<dev string:x1c>" + name + "<dev string:x40>");
        #/
        return;
    }
    level.var_6f72b465b2081001 settransientsoundbank(name + ".all", 1);
    level.var_30649350266f97c8[name] = level.var_30649350266f97c8.size;
}

// Namespace sound / scripts\mp\utility\sound
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x685
// Size: 0x9e
function function_a6357559500ee9fe(name) {
    function_7cf31218d8d83aaf();
    assert(isent(level.var_6f72b465b2081001));
    assert(isarray(level.var_30649350266f97c8));
    assertex(isstring(name), "TransientSoundBank requires a name argument");
    if (isdefined(level.var_30649350266f97c8[name])) {
        level.var_6f72b465b2081001 settransientsoundbank(name + ".all", 0);
        level.var_30649350266f97c8[name] = undefined;
        return;
    }
    /#
        iprintlnbold("<dev string:x43>" + name + "<dev string:x58>");
    #/
}

