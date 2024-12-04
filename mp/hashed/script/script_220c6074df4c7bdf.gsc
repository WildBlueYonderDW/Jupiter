#using script_25b55d37e1b51db1;
#using script_26ccbfe3954cacf4;
#using script_40e63dd222434655;
#using script_59ff79d681bb860c;
#using script_d74ae0b4aa21186;
#using scripts\engine\utility;
#using scripts\mp\bots\bots_gametype_br;
#using scripts\mp\gametypes\br_circle;

#namespace search_threat_plus;

// Namespace search_threat_plus / namespace_1580a10821910b9d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x169
// Size: 0xd
function function_eda57308516bfc5f() {
    return function_bffb5b682a4ef6a2(&evaluatescore);
}

// Namespace search_threat_plus / namespace_1580a10821910b9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17f
// Size: 0x4a5
function evaluatescore(bot) {
    /#
        if (getdvar(@"bot_notarget") == "<dev string:x1c>") {
            return 0;
        }
    #/
    var_7bf6ee12b10ec682 = gettime();
    targetevents = [];
    soundevents = bot namespace_3df563b7c04eb8eb::getevent();
    foreach (event in soundevents) {
        if (!isvalidplayer(event.owner)) {
            continue;
        }
        /#
            if (!isai(event.owner) && getdvar(@"bot_notarget") == "<dev string:x23>") {
                continue;
            }
        #/
        if (event.owner namespace_95d8d8ec67e3e074::isuibot()) {
            continue;
        }
        if (bot botcanseeentity(event.owner)) {
            continue;
        }
        targetnumber = event.owner getentitynumber();
        te = targetevents[targetnumber];
        if (!isdefined(te)) {
            te = spawnstruct();
            te.eventscount = 0;
            targetevents[targetnumber] = te;
        }
        te.eventscount++;
        eventscore = self.constants.eventtypevalues[event.type];
        dist = distance(event.pos, bot.origin);
        if (event.type == "footstep" || event.type == "footstep_walk" || event.type == "footstep_sprint") {
            eventscore += function_9d1ab012058221bb(dist, self.constants.var_1c1e326edfaee326, self.constants.var_b17cbf80b52df82f);
        } else {
            eventscore += function_9d1ab012058221bb(dist, self.constants.var_436444ebcb6bf7b3, self.constants.var_e8de868e20882c8a);
        }
        time = (var_7bf6ee12b10ec682 - event.time) / 1000;
        eventscore += function_9d1ab012058221bb(time, self.constants.var_50cf5a797d61ae47, self.constants.var_f65cad93a3671678);
        if (!isdefined(te.maxscore) || eventscore > te.maxscore) {
            te.maxscore = eventscore;
            te.event = event;
        }
    }
    finalscore = 0;
    finalevent = undefined;
    foreach (potentialtarget in targetevents) {
        if (potentialtarget.event.type == "can_see" || potentialtarget.event.type == "bullet_whizby" || potentialtarget.event.type == "projectile_impact" || potentialtarget.event.type == "radar") {
            score = potentialtarget.maxscore;
        } else {
            score = potentialtarget.maxscore + function_9d1ab012058221bb(potentialtarget.eventscount - 1, self.constants.var_931b4359890cef33, self.constants.var_188ae31c05e38b7c);
        }
        if (score <= 0) {
            continue;
        }
        if (score > finalscore) {
            finalscore = score;
            finalevent = potentialtarget;
        }
    }
    if (!isdefined(finalevent)) {
        return 0;
    }
    var_67cce4b1942e19e5 = finalevent.event.pos;
    var_e4b8c3d6e82a814b = finalevent.event.owner getentitynumber();
    self.var_df9d35d9b4bee654 = createactionbase("Search Threat Plus", var_67cce4b1942e19e5, "main", "$e" + var_e4b8c3d6e82a814b, &actionprocess, self);
    return finalscore;
}

// Namespace search_threat_plus / namespace_1580a10821910b9d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62d
// Size: 0xc8
function actionprocess(bot) {
    pos = self.argument;
    assert(isdefined(pos));
    targetpos = scripts\mp\gametypes\br_circle::getrandompointincircle(pos, 48, undefined, undefined, 0, 1);
    bot function_9e400058ef021b03(targetpos, 48);
    result = bot waittill_any_in_array_return(["bad_path", "goal"]);
    if (result == "goal") {
        return;
    }
    if (result == "bad_path") {
        println("<dev string:x34>" + self.decision.name + "<dev string:x4e>" + targetpos + "<dev string:x67>" + bot.origin);
        return result;
    }
}

