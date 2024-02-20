// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_41387eecc35b88bf;
#using script_185660037b9236c1;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_2047cdbf5176ba0;
#using script_64351208cb856df9;
#using script_7e41e37180e554f;
#using script_3691c0b107a6701c;
#using script_838faaae00b43c;
#using script_617646b8ffe3042c;
#using script_5f2d8c30a1a0e928;
#using script_2d7c98a7d021a0a8;
#using script_252bd483a6677ac;
#using script_3d06753b3fc22d30;
#using script_18a1a0633babca10;
#using script_791b30ce26ece56c;
#using script_4fa7e9e11630166c;
#using script_3ab210ea917601e7;
#using script_4fdefae8b7bcdf73;
#using scripts\mp\utility\perk.gsc;
#using script_2590b7a7de3dfc79;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_39d11000e476a42a;

#namespace namespace_f1502c404076e9bf;

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x353
// Size: 0x154
function function_b1568160c3017867(params) {
    if (function_b4aab17620ddfba8("a")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_78f835bfd4a00278::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("b")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_18438c24222e0aa8::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("c")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_24aadd73c1e4a3fc::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("d")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_24bdc55631dc5a5c::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("f")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_d0532c68ea00a668::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("g")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_b90be98f4e4b8234::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("h")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_90cb51074653cfd4::function_fd69cf02ba4d90a2);
    }
    if (function_b4aab17620ddfba8("i")) {
        function_447c6ab4bea16b52("contract", "REV_OB_TEAM_HUNT", &namespace_325330503813833a::function_f0c8a91c808c17dc, &namespace_d687ce4fe57c14a8::function_fd69cf02ba4d90a2);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ae
// Size: 0x2b1
function function_f0c8a91c808c17dc() {
    level.var_28c3893738c043fe = spawnstruct();
    level.var_28c3893738c043fe.var_c9ba50820f3986f6 = getdvarint(@"hash_8139abd8166ca4c1", 3000);
    level.var_28c3893738c043fe.var_55d86774a0bcc0ca = level.var_28c3893738c043fe.var_c9ba50820f3986f6 * level.var_28c3893738c043fe.var_c9ba50820f3986f6;
    level.var_28c3893738c043fe.var_feb83d3eed59be1c = getdvarint(@"hash_3bc96df279c751e9", 1000);
    level.var_28c3893738c043fe.var_e3aa1de9d96e0086 = getdvarint(@"hash_35f7a59b2616eb7d", 500);
    level.var_28c3893738c043fe.var_58ef8eb47442fbe2 = getdvarint(@"hash_e273b91103c40db4", 20);
    level.var_28c3893738c043fe.var_6eff6b94778545a = getdvarint(@"hash_b597c2eb9ed43e1b", 5);
    level.var_28c3893738c043fe.timelimit = getdvarint(@"hash_bdcd789b52a3bbbe", 300);
    level.var_28c3893738c043fe.var_ae4083584090e161 = getdvarfloat(@"hash_19a1f2ba34185227", 80000);
    level.var_28c3893738c043fe.var_55a75ba6640b59f4 = getdvarint(@"hash_b3f653e48ce2a8cf", 3000);
    level.var_28c3893738c043fe.var_9fe72f3581fc4d1 = getdvarint(@"hash_1d81a630b92605b8", 8000);
    level.var_28c3893738c043fe.var_886276b7b80850b0 = getdvarfloat(@"hash_6640686452114bc4", 240);
    level.var_28c3893738c043fe.var_5572778d2cffe0fd = getdvarfloat(@"hash_3725fbb1feb2dc52", 40);
    level.var_28c3893738c043fe.var_69873adaf95b11a = getdvarfloat(@"hash_fb411f33cb8f4d02", 2.5);
    level.var_28c3893738c043fe.var_e8fa4e2bd0433d43 = getdvarfloat(@"hash_85f530defa2a7c6f", 60);
    level.var_28c3893738c043fe.var_15b2bbc2239d50e1 = getdvarfloat(@"hash_51bb4f27c725f721", 0.05);
    function_89384091f7a2dbd("REV_OB_TEAM_HUNT", 0, &function_e2c5ba0b5938975a);
    function_89384091f7a2dbd("REV_OB_TEAM_HUNT", 1, &function_f7a3d129963fe612);
    function_89384091f7a2dbd("REV_OB_TEAM_HUNT", 2, &function_129d15912921cc99);
    function_89384091f7a2dbd("REV_OB_TEAM_HUNT", 3, &function_28ae17cdb2e61f0f);
    function_89384091f7a2dbd("REV_OB_TEAM_HUNT", 5, &function_6ba7cb17933b089d);
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766
// Size: 0x19
function function_e2c5ba0b5938975a() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x786
// Size: 0x139
function function_f7a3d129963fe612() {
    self.targetplayer = function_20f0caea2a03d942();
    if (!isdefined(self.targetplayer)) {
        function_e3c6eb5885dbbcbb(0, "noTarget");
        return;
    }
    self.hunterteam = self.var_6c29f2fdb0054bbe[0].team;
    self.targetteam = self.targetplayer.team;
    level.var_aab4fba7a041b281 = array_combine(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
    function_c78fcbb8d5b8311c();
    function_32c382f03fecb524(1);
    function_67b14d51b7c11374();
    namespace_262d6474998a2356::function_61cd287166c3f695("REV_OB_TEAM_HUNT");
    namespace_262d6474998a2356::function_474722293c221d5c(level.var_28c3893738c043fe.timelimit);
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_begin");
    thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_target_begin", getteamdata(self.targetteam, "players"));
    thread function_2c18821cd28921aa();
    thread function_312c17a5b62d29e4();
    thread function_fea5ccc47ca0515e();
    thread function_4933e17301571873();
    thread function_e8101a9498b9e3c4(level.var_28c3893738c043fe.timelimit);
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6
// Size: 0xb7
function function_c78fcbb8d5b8311c() {
    self.objectiveiconid = namespace_5ab9942d4e45708d::function_36a95c9de2ace25a("jup_ob_objectivemarker_teamhunt", 1, 1);
    namespace_36f464722d326bbe::function_6b6b6273f8180522("Hostage_Dmz", self.origin, level.var_28c3893738c043fe.var_c9ba50820f3986f6 + level.var_28c3893738c043fe.var_e3aa1de9d96e0086);
    foreach (player in getteamdata(self.hunterteam, "players")) {
        function_cfd53c8f6878014f(player);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x984
// Size: 0x156
function function_20f0caea2a03d942() {
    origin = self.var_6c29f2fdb0054bbe[0].origin;
    hunterteam = self.var_6c29f2fdb0054bbe[0].team;
    targetplayer = undefined;
    maxscore = -1;
    foreach (player in level.players) {
        if (player.team != hunterteam && isreallyalive(player) && !function_4c9b6c46c1d875b0(player.team)) {
            scores = function_49df6ae49b0cbe54(player, origin);
            var_75d4749aee656536 = 0;
            foreach (score in scores) {
                var_75d4749aee656536 = var_75d4749aee656536 + score;
            }
            if (var_75d4749aee656536 > maxscore) {
                maxscore = var_75d4749aee656536;
                targetplayer = player;
            }
        }
    }
    return targetplayer;
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xae2
// Size: 0x1d8
function function_49df6ae49b0cbe54(player, origin) {
    scores = [];
    dist = distance(origin, player.origin);
    maxdist = level.var_28c3893738c043fe.var_ae4083584090e161;
    var_7a73315d7ca78155 = max(level.var_28c3893738c043fe.var_886276b7b80850b0 * (1 - dist / maxdist), 0);
    teamplayers = getteamdata(player.team, "players");
    var_6d038a7052e9467c = 0;
    foreach (player in teamplayers) {
        if (player namespace_82dcd1d5ae30ff7::_hasperk("specialty_ghost")) {
            var_6d038a7052e9467c++;
        }
    }
    var_4aa32c116c698ff6 = level.var_28c3893738c043fe.var_5572778d2cffe0fd * (teamplayers.size - var_6d038a7052e9467c);
    scores["generic"] = var_7a73315d7ca78155 + var_4aa32c116c698ff6;
    scores["agents"] = level.var_28c3893738c043fe.var_69873adaf95b11a * ter_op(isdefined(player.agentKills), player.agentKills, 0);
    scores["operators"] = level.var_28c3893738c043fe.var_e8fa4e2bd0433d43 * ter_op(isdefined(player.pers["kills"]), player.pers["kills"], 0);
    scores["valuables"] = level.var_28c3893738c043fe.var_15b2bbc2239d50e1 * player namespace_301533d2f1378cb9::function_b86115649d705017();
    return scores;
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc2
// Size: 0x6d
function function_4c9b6c46c1d875b0(team) {
    foreach (player in level.var_aab4fba7a041b281) {
        if (player.team == team) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd37
// Size: 0xc2
function function_198b93e2019051cf(visible) {
    if (istrue(visible) && isdefined(self.threat_level)) {
        entitynumber = self.targetplayer getentitynumber();
        entitynumber = entitynumber + 1;
        value = self.threat_level << 8 | entitynumber;
    } else {
        value = 0;
    }
    foreach (player in getteamdata(self.targetteam, "players")) {
        player setclientomnvar("ui_br_assassination_target", value);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe00
// Size: 0xec
function function_fea5ccc47ca0515e() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (isdefined(self.targetplayer)) {
        closestplayer = getclosest(self.targetplayer.origin, getteamdata(self.hunterteam, "players"));
        dist = distance(closestplayer.origin, self.targetplayer.origin);
        if (dist > level.var_28c3893738c043fe.var_9fe72f3581fc4d1) {
            self.threat_level = 0;
        } else if (dist > level.var_28c3893738c043fe.var_55a75ba6640b59f4) {
            self.threat_level = 1;
        } else {
            self.threat_level = 2;
        }
        function_198b93e2019051cf(1);
        wait(1);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef3
// Size: 0x8a
function function_88f9e05f8b30fafb(var_c17ac30865717c64, reason) {
    if (var_c17ac30865717c64) {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_target_eliminated", getteamdata(self.targetteam, "players"));
    } else if (isdefined(reason) && reason == "noTarget") {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_warning");
    } else {
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_failure");
        thread namespace_277c27ef297ef569::function_1281c7fff9456e18("contract_teamhunt_target_survive", getteamdata(self.targetteam, "players"));
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x26
function function_e3c6eb5885dbbcbb(var_c17ac30865717c64, reason) {
    function_88f9e05f8b30fafb(var_c17ac30865717c64, reason);
    function_612d18fdbc979c0b(self, var_c17ac30865717c64);
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb1
// Size: 0x192
function function_312c17a5b62d29e4() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.lastposition = self.targetplayer.origin;
    var_c7111e2f9f477bec = -999999;
    while (isdefined(self.targetplayer)) {
        var_f17269c0d177f1eb = -1;
        invehicle = self.targetplayer namespace_f8065cafc523dba5::isinvehicle(0);
        if (invehicle) {
            var_f17269c0d177f1eb = level.var_28c3893738c043fe.var_6eff6b94778545a;
        } else {
            var_f17269c0d177f1eb = level.var_28c3893738c043fe.var_58ef8eb47442fbe2;
        }
        currenttime = gettime();
        if (currenttime - var_c7111e2f9f477bec > var_f17269c0d177f1eb * 1000) {
            radius = ter_op(invehicle, level.var_28c3893738c043fe.var_feb83d3eed59be1c, level.var_28c3893738c043fe.var_c9ba50820f3986f6);
            circleorigin = function_f23330cab6d69794(self.lastposition, radius);
            circleorigin = (circleorigin[0], circleorigin[1], level.var_28c3893738c043fe.var_c9ba50820f3986f6 + level.var_28c3893738c043fe.var_e3aa1de9d96e0086);
            self.mapcircle moveto(circleorigin, 1, 0.25, 0.25);
            thread function_aa76ed91575c776b();
            self.lastposition = self.targetplayer.origin;
            var_c7111e2f9f477bec = currenttime;
        }
        wait(1);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114a
// Size: 0x108
function function_2c18821cd28921aa() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    wait(3);
    while (1) {
        if (!isdefined(self.mapcircle) || !isdefined(self.objectiveiconid)) {
            return;
        }
        foreach (player in getteamdata(self.hunterteam, "players")) {
            distsq = distance2dsquared(player.origin, self.mapcircle.origin);
            showicon = distsq > self.mapcircle.origin[2] * self.mapcircle.origin[2];
            function_6a20e14667024546(player, showicon);
        }
        wait(1);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1259
// Size: 0x4a
function function_6a20e14667024546(player, visible) {
    if (isdefined(self.objectiveiconid)) {
        if (visible) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(self.objectiveiconid, player);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(self.objectiveiconid, player);
        }
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12aa
// Size: 0x73
function function_aa76ed91575c776b() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    endtime = gettime() + 1200;
    while (gettime() < endtime && isdefined(self.mapcircle) && isdefined(self.mapcircle.origin)) {
        function_365b2c400644893a(self.mapcircle.origin);
        waitframe();
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1324
// Size: 0x29
function function_365b2c400644893a(location) {
    if (isdefined(self.objectiveiconid)) {
        objective_position(self.objectiveiconid, location);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1354
// Size: 0x1e
function function_f23330cab6d69794(origin, radius) {
    return origin + function_d553466cf817a4da() * radius;
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137a
// Size: 0x64
function function_67b14d51b7c11374() {
    foreach (player in getteamdata(self.targetteam, "players")) {
        thread function_d8807a8a68c195d(player);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e5
// Size: 0xc3
function function_23cc8341ebe869a6() {
    teammates = [];
    foreach (teammate in getteamdata(self.targetteam, "players")) {
        if (isreallyalive(teammate) && !istrue(teammate.var_5c39f1e22f4693ee) && distancesquared(teammate.origin, self.targetplayer.origin) < level.var_28c3893738c043fe.var_55d86774a0bcc0ca) {
            teammates[teammates.size] = teammate;
        }
    }
    return teammates;
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b0
// Size: 0x86
function function_d8807a8a68c195d(player) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        player waittill_any_3("death_or_disconnect", "enter_live_ragdoll", "exfil_fully_completed");
        player.var_5c39f1e22f4693ee = 1;
        if (player == self.targetplayer) {
            teammates = function_23cc8341ebe869a6();
            if (teammates.size == 0) {
                function_e3c6eb5885dbbcbb(1);
                return;
            } else {
                self.targetplayer = teammates[0];
            }
        }
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153d
// Size: 0xa2
function function_32c382f03fecb524(visible) {
    value = ter_op(istrue(visible), gettime() + level.var_28c3893738c043fe.timelimit * 1000, 0);
    foreach (player in getteamdata(self.targetteam, "players")) {
        player setclientomnvar("ui_br_assassination_target_timer", value);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e6
// Size: 0x24
function function_e8101a9498b9e3c4(time) {
    self endon("activity_ended");
    self endon("instance_destroyed");
    wait(time);
    function_e3c6eb5885dbbcbb(0);
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1611
// Size: 0x66
function function_9f716ccd2287c814() {
    foreach (teammate in getteamdata(self.targetteam, "players")) {
        teammate.var_5c39f1e22f4693ee = undefined;
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167e
// Size: 0x92
function function_129d15912921cc99() {
    self endon("instance_destroyed");
    if (function_acaa75ca8754452e()) {
        function_af5604ce591768e1();
    }
    if (isdefined(self.targetteam)) {
        level.var_aab4fba7a041b281 = array_remove_array(level.var_aab4fba7a041b281, getteamdata(self.targetteam, "players"));
        function_198b93e2019051cf(0);
        function_32c382f03fecb524(0);
        function_9f716ccd2287c814();
        self.targetplayer = undefined;
        self.hunterteam = undefined;
        self.targetteam = undefined;
        self.objectiveiconid = undefined;
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1717
// Size: 0xa
function function_28ae17cdb2e61f0f() {
    function_129d15912921cc99();
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1728
// Size: 0xbf
function function_4933e17301571873() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    while (1) {
        var_189592790ba8be47 = 1;
        foreach (teammate in getteamdata(self.hunterteam, "players")) {
            if (isreallyalive(teammate) || isdefined(level.var_fd15b9ad0f909a26) && !teammate [[ level.var_fd15b9ad0f909a26 ]]()) {
                var_189592790ba8be47 = 0;
                break;
            }
        }
        if (var_189592790ba8be47) {
            function_e3c6eb5885dbbcbb(0);
            return;
        }
        wait(1);
    }
}

// Namespace namespace_f1502c404076e9bf/namespace_325330503813833a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ee
// Size: 0x3f
function function_6ba7cb17933b089d() {
    self endon("instance_destroyed");
    var_6c1956fd6ce84917 = 1;
    var_cc7aa96a854fd8ee = namespace_71ca15b739deab72::function_3ae7f99339b96499(self.var_6c29f2fdb0054bbe[0].origin, var_6c1956fd6ce84917);
    return var_cc7aa96a854fd8ee;
}

