#using script_6617e2f2bb62b52b;
#using script_3ab210ea917601e7;

#namespace activity_scoring;

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x77
function function_4d4bdc081df1c06b(player, varianttag) {
    if (!isdefined(player.activities.highscores)) {
        player.activities.highscores = [];
    }
    if (!isdefined(player.activities.highscores[varianttag])) {
        player.activities.highscores[varianttag] = 0;
    }
}

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf7
// Size: 0x4a
function updatescore(scorechange) {
    self.score += scorechange;
    /#
        broadcast = function_ab07dddb2e50773b("<dev string:x1c>" + self.score);
        function_2e44f2eaf470e806(broadcast);
    #/
}

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x149
// Size: 0x62
function function_580d48267e3509af(player) {
    var_f3df5cfd2b12a463 = getscore();
    activityhighscore = getplayerhighscore(player, self.varianttag);
    if (var_f3df5cfd2b12a463 > activityhighscore) {
        player.activities.highscores[self.varianttag] = var_f3df5cfd2b12a463;
        return true;
    }
    return false;
}

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0xc
function resetscore() {
    self.score = 0;
}

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8
// Size: 0xb
function getscore() {
    return self.score;
}

// Namespace activity_scoring / namespace_6a4776a9657ff96b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dc
// Size: 0x2a
function getplayerhighscore(player, varianttag) {
    return player.activities.highscores[varianttag];
}

/#

    // Namespace activity_scoring / namespace_6a4776a9657ff96b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x20f
    // Size: 0x18
    function setscore(score) {
        self.score = score;
    }

    // Namespace activity_scoring / namespace_6a4776a9657ff96b
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x22f
    // Size: 0x23
    function broadcastscore(varianttag) {
        iprintln("<dev string:x1c>" + self.score);
    }

#/
