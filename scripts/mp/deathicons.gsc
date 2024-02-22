// mwiii decomp prototype
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\utility\player.gsc;

#namespace deathicons;

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c3
// Size: 0xa8
function init() {
    level.deathicons = spawnstruct();
    level.deathicons.var_e973113c908f1b3e = getdvarint(@"hash_97e20befa2938a48", 10);
    level.deathicons.var_3c1ea16fb886db94 = getdvarint(@"hash_f00ea016dc7b1272", 4000);
    level.deathicons.var_be5e71251b2fdb9d = getdvarfloat(@"hash_8bbf501270a5bcf2", 10);
    level.deathicons.var_ec15e7c2b73e1708 = getdvarfloat(@"hash_d4e44eecf9bc8099", 0);
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272
// Size: 0x312
function adddeathicon(attacker, entity, dyingplayer, team, timeout) {
    dyingplayer endon("disconnect");
    if (istrue(dyingplayer.skipdeathicon)) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    if (getdvar(@"hash_fcc82bc32588efce") == "0") {
        return;
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        return;
    }
    if (istrue(dyingplayer namespace_d3d40f75bb4e4c32::isplayeringulag())) {
        return;
    }
    if (namespace_cd0b2d039510b38d::isteamreviveenabled()) {
        return;
    }
    if (attacker _hasperk("specialty_operative")) {
        return;
    }
    var_e005d4b70d6f2611 = namespace_36f464722d326bbe::isbrstylegametype();
    var_8f0d5dceeb1ec104 = namespace_cd0b2d039510b38d::getgametype() == "brtdm" || namespace_cd0b2d039510b38d::getgametype() == "brtdm_mgl";
    var_d9622d6cf6275394 = attacker _hasperk("specialty_silentkill");
    if (!var_e005d4b70d6f2611 && var_d9622d6cf6275394) {
        return;
    }
    iconorg = entity.origin;
    iconorg = iconorg + (0, 0, 40);
    dyingplayer notify("addDeathIcon()");
    dyingplayer endon("addDeathIcon()");
    /#
        assert(isgameplayteam(team));
    #/
    if (isdefined(dyingplayer.lastdeathheadicon)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(dyingplayer.lastdeathheadicon);
        dyingplayer.lastdeathheadicon = undefined;
    }
    dyingplayer notify("removed_death_icon");
    image = "hud_icon_death_spawn";
    showto = team;
    if (var_e005d4b70d6f2611) {
        var_43ebeb802e94dd92 = dyingplayer.var_3f78c6a0862f9e25;
        if (!isdefined(var_43ebeb802e94dd92) || var_43ebeb802e94dd92 < 0) {
            /#
                iprintln("<unknown string>" + dyingplayer.name + "<unknown string>");
            #/
            return;
        }
        image = "hud_icon_player_dead_" + dyingplayer.var_3f78c6a0862f9e25 + 1;
        if (var_d9622d6cf6275394) {
            showto = [0:dyingplayer];
        } else {
            showto = getteamdata(dyingplayer.team, "players");
        }
    } else if (var_8f0d5dceeb1ec104) {
        if (var_d9622d6cf6275394) {
            showto = [0:dyingplayer];
        } else {
            showto = getteamdata(dyingplayer.team, "players");
        }
    }
    var_7591ed99e87a77d3 = dyingplayer.origin;
    var_b3ea37733a1577e5 = var_e005d4b70d6f2611;
    showonminimap = var_e005d4b70d6f2611;
    dyingplayer.lastdeathheadicon = dyingplayer namespace_7bdde15c3500a23f::setheadicon_singleimage(showto, image, undefined, 1, 0, 0, undefined, undefined, var_b3ea37733a1577e5, var_7591ed99e87a77d3, showonminimap);
    if (var_e005d4b70d6f2611) {
        setheadiconteam(dyingplayer.lastdeathheadicon, dyingplayer.team);
        function_ea1ddef8aede7460(dyingplayer.lastdeathheadicon, dyingplayer.var_3f78c6a0862f9e25 + 1);
    }
    if (isdefined(dyingplayer.lastdeathheadicon)) {
        if (var_e005d4b70d6f2611 || var_8f0d5dceeb1ec104) {
            dyingplayer thread function_55bb1f7a41bf2fbd(var_d9622d6cf6275394);
        } else {
            dyingplayer thread destroyslowly(timeout);
        }
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b
// Size: 0x81
function function_55bb1f7a41bf2fbd(var_d9622d6cf6275394) {
    self endon("removed_death_icon");
    team = self.team;
    icon = self.lastdeathheadicon;
    var_a579d4d9ff82c7f3 = self.origin;
    if (!var_d9622d6cf6275394) {
        thread handlefriendlyvisibility(icon, team);
    }
    if (isdefined(self)) {
        function_b3ff47edf02118d1(var_a579d4d9ff82c7f3);
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
    if (isdefined(self)) {
        self.lastdeathheadicon = undefined;
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613
// Size: 0x1be
function handlefriendlyvisibility(icon, team) {
    wait(level.deathicons.var_be5e71251b2fdb9d);
    teammates = getfriendlyplayers(team);
    foreach (player in teammates) {
        if (!isdefined(player)) {
            continue;
        }
        if (level.deathicons.var_ec15e7c2b73e1708 > 0) {
            jumpiffalse(isdefined(self.var_ff97225579de16a) && isdefined(player.var_ff97225579de16a) && self.var_ff97225579de16a == player.var_ff97225579de16a) LOC_000000d7;
        } else {
        LOC_000000d7:
            if (isdefined(self) && player == self) {
                continue;
            }
            namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(icon, player);
        }
    }
    if (level.deathicons.var_ec15e7c2b73e1708 > 0) {
        wait(level.deathicons.var_ec15e7c2b73e1708);
        teammates = getfriendlyplayers(team);
        foreach (player in teammates) {
            if (!isdefined(player)) {
                continue;
            }
            if (isdefined(self.var_ff97225579de16a) && isdefined(player.var_ff97225579de16a) && self.var_ff97225579de16a != player.var_ff97225579de16a) {
                continue;
            }
            if (isdefined(self) && player == self) {
                continue;
            }
            namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(icon, player);
        }
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d8
// Size: 0x12c
function function_b3ff47edf02118d1(var_a579d4d9ff82c7f3) {
    player = self;
    player endon("disconnect");
    level endon("game_ended");
    var_fbf7a3d9a735ec16 = player namespace_a548bd428a566cf3::isplayerinorgoingtogulag() || player namespace_a548bd428a566cf3::function_8f0e6614368f64c2();
    if (!namespace_7e17181d03156026::isreallyalive(player) && !namespace_a548bd428a566cf3::isrespawningfromtoken(player) && !var_fbf7a3d9a735ec16) {
        return;
    }
    while (var_fbf7a3d9a735ec16) {
        wait(2);
        var_fbf7a3d9a735ec16 = player namespace_a548bd428a566cf3::isplayerinorgoingtogulag() || player namespace_a548bd428a566cf3::function_8f0e6614368f64c2();
    }
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(player.lastdeathheadicon, player);
    var_ed636cd9ad93833d = 0;
    while (!var_ed636cd9ad93833d) {
        wait(1);
        if (player isonladder() || player function_415fe9eeca7b2e2b() || player isonground() || player isswimming() || player function_6f55d55ccff20d14()) {
            var_ed636cd9ad93833d = 1;
        }
    }
    if (isdefined(player.lastdeathpos)) {
        if (distance2d(var_a579d4d9ff82c7f3, player.origin) < level.deathicons.var_3c1ea16fb886db94) {
            wait(max(level.deathicons.var_e973113c908f1b3e, 0));
        }
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90b
// Size: 0x4d
function destroyslowly(timeout) {
    self endon("removed_death_icon");
    owner = self;
    icon = self.lastdeathheadicon;
    wait(timeout);
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
    if (isdefined(owner)) {
        owner.lastdeathheadicon = undefined;
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95f
// Size: 0x36
function hidedeathicon(player) {
    if (!isdefined(player) || !isdefined(player.lastdeathheadicon)) {
        return;
    }
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(player.lastdeathheadicon, player);
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99c
// Size: 0x48
function removedeathicon(player) {
    if (!isdefined(player) || !isdefined(player.lastdeathheadicon)) {
        return;
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(player.lastdeathheadicon);
    player.lastdeathheadicon = undefined;
    player notify("removed_death_icon");
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9eb
// Size: 0x58
function removealldeathicons() {
    foreach (player in level.players) {
        removedeathicon(player);
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4a
// Size: 0x292
function addenemydeathicon(entity, dyingplayer, var_dd573edaa0c55862, var_5582b247a8570f9b, timeout, var_29693175f0940203) {
    dyingplayer endon("disconnect");
    if (!level.teambased) {
        return;
    }
    if (istrue(dyingplayer namespace_d3d40f75bb4e4c32::isplayeringulag())) {
        return;
    }
    iconorg = entity.origin;
    iconorg = iconorg + (0, 0, 40);
    dyingplayer notify("addDeathIcon()");
    dyingplayer endon("addDeathIcon()");
    /#
        assert(isarray(var_dd573edaa0c55862));
    #/
    if (!var_29693175f0940203) {
        if (getdvar(@"hash_fcc82bc32588efce") == "0") {
            return;
        }
        if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
            return;
        }
    }
    if (isdefined(dyingplayer.var_795ad0631cf24432)) {
        foreach (icon in dyingplayer.var_795ad0631cf24432) {
            namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
        }
        dyingplayer.var_795ad0631cf24432 = undefined;
    }
    dyingplayer notify("removed_enemy_death_icon");
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        image = "hud_realism_head_death";
        var_e0e11f3b4551be11 = 0;
        var_c5409ca7522182b3 = 768;
        var_30516b4afd1763de = 10;
        if (istrue(level.var_32fe21b3c5052471)) {
            image = "hud_icon_death_spawn";
        }
    } else {
        image = "hud_icon_death_hunter_spawn";
        var_e0e11f3b4551be11 = 1;
        var_c5409ca7522182b3 = 768;
        var_30516b4afd1763de = 0;
        if (istrue(level.var_32fe21b3c5052471)) {
            image = "hud_icon_death_spawn";
        }
    }
    var_7591ed99e87a77d3 = dyingplayer.origin;
    if (var_5582b247a8570f9b.size > 0) {
        var_5e156d8393667bcf = "esports_codcaster_waypoint_skull";
        head_icon = dyingplayer namespace_7bdde15c3500a23f::setheadicon_singleimage(var_5582b247a8570f9b, var_5e156d8393667bcf, undefined, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, undefined, undefined, undefined, var_7591ed99e87a77d3);
        setheadiconteam(head_icon, dyingplayer.team);
        dyingplayer.var_795ad0631cf24432 = namespace_3c37cb17ade254d::array_add_safe(dyingplayer.var_795ad0631cf24432, head_icon);
    }
    if (var_dd573edaa0c55862.size > 0) {
        head_icon = dyingplayer namespace_7bdde15c3500a23f::setheadicon_singleimage(var_dd573edaa0c55862, image, undefined, var_e0e11f3b4551be11, var_c5409ca7522182b3, var_30516b4afd1763de, undefined, undefined, undefined, var_7591ed99e87a77d3);
        dyingplayer.var_795ad0631cf24432 = namespace_3c37cb17ade254d::array_add_safe(dyingplayer.var_795ad0631cf24432, head_icon);
    }
    if (isdefined(dyingplayer.var_795ad0631cf24432)) {
        dyingplayer thread destroyenemyiconslowly(timeout);
    }
}

// Namespace deathicons/namespace_b984803e2ef247a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce3
// Size: 0x92
function destroyenemyiconslowly(timeout) {
    self endon("removed_enemy_death_icon");
    owner = self;
    icons = self.var_795ad0631cf24432;
    wait(timeout);
    foreach (icon in icons) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(icon);
    }
    if (isdefined(owner)) {
        owner.var_795ad0631cf24432 = undefined;
    }
}

