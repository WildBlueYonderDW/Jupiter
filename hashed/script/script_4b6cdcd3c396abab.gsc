// mwiii decomp prototype
#using scripts\mp\utility\script.gsc;
#using scripts\common\ai.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\engine\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using script_74b851b7aa1ef32d;

#namespace smoke_grenade;

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x243
// Size: 0x14f
function smokegrenadeused(isgl) {
    thread notifyafterframeend("death", "end_explode");
    self endon("end_explode");
    thread function_e4f6e856495dbafb(self.bundle);
    if (istrue(isgl)) {
        stuckto, hitent, surfacetype, velocity, position, normal = self waittill("missile_stuck");
        thread smokeglvfx(position);
        if (getdvarint(@"hash_abe45e35ef030a56") == 0) {
            thread scripts/mp/bots/bots::create_smoke_occluder(position);
        }
    } else {
        position = self waittill("explode");
    }
    bundle = self.bundle;
    /#
        /#
            assert(isdefined(bundle), "<unknown string>");
        #/
    #/
    thread smokegrenadeexplode(position, self.owner, bundle);
    thread sfx_smoke_grenade_smoke(position, bundle);
    if (isdefined(self) && isdefined(self.owner)) {
        self.owner thread monitorsmokeactive(bundle);
    }
    scripts/cp_mp/challenges::function_b0f754c8a379154e("equip_smoke", self.owner, undefined, function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399
// Size: 0x96
function sfx_smoke_grenade_smoke(position, bundle) {
    wait(0.2);
    soundorg = spawn("script_origin", position);
    soundorg playloopsound("smoke_grenade_smoke_lp");
    soundorg scripts/cp_mp/ent_manager::registerspawncount(1);
    waittime = bundle.smokeduration - 4;
    if (waittime > 0) {
        wait(waittime);
    }
    thread play_sound_in_space("smoke_grenade_smoke_tail", position);
    wait(0.3);
    if (isdefined(soundorg)) {
        soundorg stoploopsound();
    }
    soundorg scripts/cp_mp/ent_manager::deregisterspawn();
    soundorg delete();
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x436
// Size: 0x3e
function private function_e4f6e856495dbafb(bundle) {
    self endon("explode");
    self endon("death");
    impactdata = self waittill("missile_water_impact");
    self notify("end_explode");
    thread function_9e58baa59719d027(bundle);
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x47b
// Size: 0x83
function private function_9e58baa59719d027(bundle) {
    self endon("explode");
    self endon("death");
    stuckdata = self waittill("missile_stuck");
    position = self.origin;
    thread smokegrenadeexplode(position, undefined, bundle);
    thread sfx_smoke_grenade_smoke(position, bundle);
    if (isdefined(self) && isdefined(self.owner)) {
        self.owner thread monitorsmokeactive(self.bundle);
    }
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x505
// Size: 0x1c4
function smokegrenadeexplode(position, owner, bundle) {
    level endon("game_ended");
    smokedelay = isdefined(bundle) && isdefined(bundle.smokedelay) ? self.bundle.smokedelay : 1;
    smokeduration = isdefined(bundle) && isdefined(bundle.smokeduration) ? bundle.smokeduration : 9.25;
    smokeradius = isdefined(bundle) && isdefined(bundle.smokeradius) ? bundle.smokeradius : 330;
    wait(smokedelay);
    thread smokegrenadegiveblindeye(position, owner, bundle);
    if (isdefined(bundle) && isdefined(bundle.smokeduration) && isdefined(bundle.smokedelay)) {
        params = spawnstruct();
        params.position = position;
        params.smokeradius = bundle.smokeradius;
        params.endtime = gettime() + (bundle.smokeduration - bundle.smokedelay) * 1000;
        level callback::callback("smoke_grenade_explode", params);
    }
    if (getdvarint(@"hash_abe45e35ef030a56") == 1) {
        if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
            thread scripts/common/ai::function_f8903387ea945165(position, 1);
        } else {
            function_8a09c0e5fa78a48c(position, smokeduration, undefined, smokeradius);
        }
    }
    id = addoutlineoccluder(position, smokeradius);
    wait(smokeduration - smokedelay);
    removeoutlineoccluder(id);
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d0
// Size: 0x38
function smokeglvfx(position, normal) {
    playfx(getfx("glsmoke"), position, anglestoup((0, 90, 0)));
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70f
// Size: 0xd5
function smokegrenadegiveblindeye(position, owner, bundle) {
    level endon("game_ended");
    struct = spawnstruct();
    struct.blindeyerecipients = [];
    smokegrenademonitorblindeyerecipients(struct, position, owner, bundle);
    foreach (recipient in struct.blindeyerecipients) {
        if (isdefined(recipient) && isreallyalive(recipient) && recipient _hasperk("specialty_blindeye")) {
            recipient removeperk("specialty_blindeye");
            recipient callback::callback("smokeGrenade_playerRemoveBlindeye");
        }
    }
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eb
// Size: 0x2a1
function smokegrenademonitorblindeyerecipients(struct, position, owner, bundle) {
    level endon("game_ended");
    endtime = gettime() + (bundle.smokeduration - bundle.smokedelay) * 1000;
    if (!isdefined(endtime)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    scoregiven = 0;
    players = [];
    while (gettime() < endtime) {
        players = getplayersinradius(position, bundle.smokeradius);
        if (!scoregiven) {
            if (isdefined(players) && players.size > 0) {
                if (isdefined(owner) && !array_contains(players, owner)) {
                    owner namespace_a850435086c88de3::doonactionscoreevent(0, "smokeGrenadeBlinded");
                    scoregiven = 1;
                }
            }
        }
        foreach (var_6758a6f2fd1b6491, recipient in struct.blindeyerecipients) {
            if (!isdefined(recipient)) {
                struct.blindeyerecipients[var_6758a6f2fd1b6491] = undefined;
                continue;
            }
            playersid = array_find(players, recipient);
            if ((!isdefined(playersid) || !isreallyalive(recipient)) && recipient _hasperk("specialty_blindeye")) {
                recipient removeperk("specialty_blindeye");
                recipient callback::callback("smokeGrenade_playerRemoveBlindeye");
                struct.blindeyerecipients[var_6758a6f2fd1b6491] = undefined;
            }
            if (isdefined(playersid)) {
                players[playersid] = undefined;
            }
        }
        time_left = (endtime - gettime()) * 0.001;
        foreach (player in players) {
            if (!isdefined(player) || !isplayer(player)) {
                continue;
            }
            player.lastinsmoketime = gettime();
            if (isdefined(struct.blindeyerecipients[player getentitynumber()])) {
                continue;
            }
            if (!isreallyalive(player)) {
                continue;
            }
            player giveperk("specialty_blindeye");
            params = {time_left:time_left};
            player callback::callback("smokeGrenade_playerGiveBlindeye", params);
            struct.blindeyerecipients[player getentitynumber()] = player;
        }
        waitframe();
    }
}

// Namespace smoke_grenade / namespace_14181962862cf569
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa93
// Size: 0x79
function monitorsmokeactive(bundle) {
    self endon("disconnect");
    level endon("game_ended");
    self notify("monitorSmokeActive()");
    self endon("monitorSmokeActive()");
    printgameaction("smoke grenade activated", self);
    self.hasactivesmokegrenade = 1;
    result = waittill_any_timeout_1(bundle.smokeduration, "death");
    self.hasactivesmokegrenade = 0;
    printgameaction("smoke grenade deactivated", self);
}

