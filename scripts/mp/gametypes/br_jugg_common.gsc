// mwiii decomp prototype
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using script_6a5d3bf7a5b7064a;
#using scripts\mp\gametypes\br_gametypes.gsc;

#namespace br_jugg_common;

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff
// Size: 0x1d3
function init() {
    /#
        assert(isdefined(level.c130deliveriesinprogress));
    #/
    level.addjuggsettings = &setconfig;
    level.addjuggfunctionality = &addjuggfunctionality;
    level.clearbrinventory = &dropallunusableitems;
    registersharedfunc("br_juggernaut", "onCrateActivate", &oncrateactivate);
    registersharedfunc("br_juggernaut", "onCrateUse", &oncrateuse);
    registersharedfunc("br_juggernaut", "onCrateDestroy", &oncratedestroy);
    level thread scripts/mp/gametypes/br_c130airdrop::init();
    level.activejuggernauts = [];
    level.brjuggsettings = [];
    /#
        setdevdvarifuninitialized(@"hash_8e428a709dd8f019", 3);
        setdevdvarifuninitialized(@"hash_fca632f39743dfa8", 0);
        setdevdvarifuninitialized(@"hash_7ed2e5c3764afc91", 20000);
        setdevdvarifuninitialized(@"hash_4c96c13074cf77e5", 5);
        setdevdvarifuninitialized(@"hash_4b258e12bbf733e3", 300);
        setdevdvarifuninitialized(@"hash_14531681ab16f185", 30);
        setdevdvarifuninitialized(@"hash_656b5e056fdbf096", 0);
        setdevdvarifuninitialized(@"hash_3372053939d80fa4", 0);
        setdevdvarifuninitialized(@"hash_d4b2c13dead25aac", 0);
        setdevdvarifuninitialized(@"hash_5b4c172bb66d3381", 1);
        setdevdvarifuninitialized(@"hash_f2ddabb9926dca3b", 5);
        setdevdvarifuninitialized(@"hash_27f2654d9fc3696d", 0);
        setdevdvarifuninitialized(@"hash_90fb266842b5bc2a", 1);
        setdevdvarifuninitialized(@"hash_5da0d73409690e9c", 7);
        setdevdvarifuninitialized(@"hash_a9e8e75fb57047aa", 1.25);
        setdevdvarifuninitialized(@"hash_95386e0fedd3f69a", 2000);
        level thread function_59ed9e94de8f9c42();
        level thread function_fdcc5bb7ff13a7d1();
    #/
    thread initpostmain();
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d9
// Size: 0x15
function initpostmain() {
    waittillframeend();
    initdroplocations();
    level.numactivejuggdrops = 0;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f5
// Size: 0x117
function setconfig() {
    self.overheatlimit = 100;
    self.overheatcooldown = 3;
    self.overheatreductiontime = 1;
    self.overheatreductionrate = 0.5;
    self.overheatreductionamount = 5;
    self.infiniteammo = 0;
    self.maxhealth = getdvarint(@"hash_95386e0fedd3f69a", 2000);
    self.startinghealth = getdvarint(@"hash_95386e0fedd3f69a", 2000);
    self.vehiclecankillhealth = int(self.maxhealth / self.maxvehicledamagedivisor);
    useweaponpickups = getdvarint(@"hash_27f2654d9fc3696d", 0);
    self.useweaponpickups = useweaponpickups;
    usereload = getdvarint(@"hash_5b4c172bb66d3381", 1);
    if (usereload) {
        self.classstruct.loadoutprimary = "iw9_minigunksjugg_reload_mp";
        self.usereload = usereload;
    }
    self.allows["reload"] = undefined;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613
// Size: 0x3e
function modifybrgasdamage(originaldamage) {
    gasdamagescale = getdvarfloat(@"hash_5da0d73409690e9c", 7);
    modifieddamage = originaldamage * gasdamagescale;
    return int(modifieddamage);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x659
// Size: 0xff
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    if (isdefined(attacker) && isplayer(attacker) && attacker isjuggernaut()) {
        var_10824d931642fd85 = attacker.health;
        var_10ed24d9931af0ca = int(attacker.maxhealth / 6);
        newhealth = var_10824d931642fd85 + var_10ed24d9931af0ca;
        if (newhealth > attacker.maxhealth) {
            newhealth = attacker.maxhealth;
        }
        attacker.health = newhealth;
        attacker notify("jugg_health_regen");
    }
    if (isdefined(self) && isjuggernaut()) {
        self.ignoredeathsdoor = undefined;
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75f
// Size: 0x5a
function addjuggfunctionality() {
    juggconfig = self.juggcontext.juggconfig;
    useoverheat = getdvarint(@"hash_fca632f39743dfa8", 0);
    if (useoverheat) {
        thread watchoverheat(juggconfig);
        thread watchheatreduction(juggconfig);
    }
    thread mangagedeathsdoor(juggconfig);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c0
// Size: 0x5d
function dropallunusableitems() {
    dropstruct = scripts/mp/gametypes/br_pickups::function_7b9f3966a7a42003();
    scripts/mp/gametypes/br_pickups::dropbrammoboxes(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrprimaryweapons(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrequipment(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrhealthpack(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrkillstreak(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrsuper(dropstruct);
    thread scripts/mp/gametypes/br_pickups::dropbrgasmask(dropstruct);
    scripts/mp/gametypes/br_pickups::dropbrselfrevivetoken(dropstruct);
    scripts/mp/gametypes/br_pickups::dropspecialistbonus(dropstruct);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824
// Size: 0xfc
function initdroplocations() {
    if (!isdefined(level.calloutglobals.namelocations) || level.calloutglobals.namelocations.size == 0) {
        /#
            print("position");
        #/
        return;
    }
    level.juggdroplocations = [];
    foreach (index, loc in level.calloutglobals.namelocations) {
        newlocationstruct = spawnstruct();
        newlocationstruct.id = index;
        newlocationstruct.origin = loc.origin;
        newlocationstruct.occupied = 0;
        level.juggdroplocations[level.juggdroplocations.size] = newlocationstruct;
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x927
// Size: 0x1a8
function getdroplocationnearcurrentcircle(radiusbuffer) {
    location = undefined;
    if (isdefined(level.juggdroplocations) && level.juggdroplocations.size > 0) {
        foreach (locinfo in level.juggdroplocations) {
            if (!ispointnearcurrentsafecircle(locinfo, radiusbuffer)) {
                continue;
            }
            if (istrue(locinfo.occupied)) {
                continue;
            }
            if (isnearajuggdrop(locinfo.origin)) {
                continue;
            }
            if (isnearactivejugg(locinfo.origin)) {
                continue;
            }
            location = locinfo;
            locinfo.occupied = 1;
            break;
        }
        if (!isdefined(location)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            location = createjuggdroplocation();
        }
    } else {
        locationoverride = undefined;
        /#
            iprintlnbold("<unknown string>");
            if (level.mapname == "<unknown string>") {
                foreach (player in level.players) {
                    if (isdefined(player)) {
                        locationoverride = scripts/mp/gametypes/br_circle::getrandompointinboundscircle(player.origin, 1000);
                        break;
                    }
                }
            }
        #/
        location = createjuggdroplocation(locationoverride);
    }
    return location;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0xa2
function ispointnearcurrentsafecircle(locinfo, radiusbuffer) {
    if (level.br_circle_disabled || !isdefined(level.br_circle) || level.br_circle.circleindex < 0) {
        return true;
    }
    var_add4fd7502a75a8a = scripts/mp/gametypes/br_circle::getsafecircleorigin();
    safecircleradius = scripts/mp/gametypes/br_circle::getsafecircleradius();
    mindist = safecircleradius + radiusbuffer;
    mindistsq = mindist * mindist;
    if (distance2dsquared(locinfo.origin, var_add4fd7502a75a8a) <= mindistsq) {
        return true;
    }
    return false;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb81
// Size: 0xb7
function isnearajuggdrop(droplocation) {
    mindist = getdvarint(@"hash_7ed2e5c3764afc91", 20000);
    /#
        if (level.mapname == "<unknown string>") {
            mindist = 1000;
        }
    #/
    mindistsq = mindist * mindist;
    foreach (drop in level.c130successfulairdrops) {
        if (distance2dsquared(droplocation, drop.origin) < mindistsq) {
            return true;
        }
    }
    return false;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc40
// Size: 0xaf
function isnearactivejugg(droplocation) {
    var_f05a4ee85b3f1451 = scripts/mp/gametypes/br_circle::getsafecircleradius();
    mindistance = int(var_f05a4ee85b3f1451 - var_f05a4ee85b3f1451 / 3);
    mindistancesq = mindistance * mindistance;
    foreach (jugg in level.activejuggernauts) {
        if (isdefined(jugg) && distance2dsquared(droplocation, jugg.origin) < mindistancesq) {
            return true;
        }
    }
    return false;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf7
// Size: 0xcd
function createjuggdroplocation(locationoverride) {
    newlocation = spawnstruct();
    if (isdefined(locationoverride)) {
        newlocation.origin = locationoverride;
    } else {
        numtries = 10;
        while (!isdefined(newlocation.origin)) {
            potentiallocation = scripts/mp/gametypes/br_circle::getrandompointinboundssafecircle();
            if (isdefined(level.activejuggernauts) && level.activejuggernauts.size > 0) {
                if (!isnearactivejugg(potentiallocation)) {
                    newlocation.origin = potentiallocation;
                }
            } else {
                newlocation.origin = potentiallocation;
            }
            numtries--;
            if (numtries == 0 && !isdefined(newlocation.origin)) {
                newlocation.origin = potentiallocation;
            }
            waitframe();
        }
    }
    return newlocation;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdcc
// Size: 0xfc
function showdroplocations(var_fdfc755d4aa965c6, initialdrop) {
    level endon("game_ended");
    radiusbuffer = 50000;
    if (istrue(initialdrop)) {
        if (!istrue(level.br_circle_disabled)) {
            level waittill("br_circle_set");
        }
    } else {
        radiusbuffer = 0;
    }
    droplocations = [];
    for (i = 0; i < var_fdfc755d4aa965c6; i++) {
        dropcircle = scripts/mp/gametypes/br_jugg_common::getdroplocationnearcurrentcircle(radiusbuffer);
        dropcircle.beacon = spawn("script_model", dropcircle.origin);
        dropcircle.beacon setmodel("ks_airdrop_crate_br");
        dropcircle.beacon setscriptablepartstate("jugg_drop_beacon", "on", 0);
        dropcircle function_6b6b6273f8180522("Juggernaut_Br", dropcircle.origin, 5000);
        dropcircle function_6988310081de7b45();
        droplocations[droplocations.size] = dropcircle;
    }
    return droplocations;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed0
// Size: 0xad
function startdeliveries(droplocations, source) {
    level endon("game_ended");
    /#
        if (level.mapname == "<unknown string>") {
            setdvar(@"hash_d313f3ed75dbff0f", 100);
        }
    #/
    showsplashtoall("br_juggdrop_incoming");
    foreach (dropcircle in droplocations) {
        level thread dropdeliveryatpos(dropcircle, source);
        wait(randomfloatrange(5, 10));
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf84
// Size: 0x104
function dropdeliveryatpos(dropcircle, source) {
    level endon("game_ended");
    if (!isdefined(dropcircle.dropradius)) {
        dropcircle.dropradius = 5000;
    }
    droppoint = scripts/mp/gametypes/br_circle::getrandompointinboundscircle(dropcircle.origin, dropcircle.dropradius);
    pathstruct = scripts/mp/gametypes/br_c130airdrop::c130airdrop_createpath(undefined, droppoint, 1);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = scripts/mp/gametypes/br_c130::getc130speed();
    time = dist / travelspeed;
    c130airdrop = scripts/mp/gametypes/br_c130airdrop::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    c130airdrop.dropfunc = &dropfunc;
    c130airdrop.source = source;
    c130airdrop scripts/mp/gametypes/br_c130airdrop::c130airdrop_startdelivery(1, "battle_royale_juggernaut", "jugg_world", dropcircle);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108f
// Size: 0x167
function dropfunc(var_5ee94ae126526f2f, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle) {
    var_bd34ecac3ada85b = self.startpt;
    droppoint = self.centerpt;
    planespeed = self.speed;
    dropwaittime = distance2d(var_bd34ecac3ada85b, droppoint) / planespeed;
    numcrates = 0;
    var_71cac1d48ab1c488 = 0;
    level.numactivejuggdrops = level.numactivejuggdrops + var_5ee94ae126526f2f;
    while (numcrates < var_5ee94ae126526f2f) {
        wait(dropwaittime);
        droplocation = scripts/mp/gametypes/br_c130airdrop::c130airdrop_findvaliddroplocation(self.origin, 1);
        crate = scripts/cp_mp/killstreaks/airdrop::dropbrc130airdropcrate(droplocation + (0, 0, level.c130airdrop_heightoverride - 100), droplocation, self.angles, var_958bbdfed6f2e9ef, var_fe41be11a71dc1b4, dropcircle.nodropanim);
        numcrates++;
        crate.dropcircle = dropcircle;
        crate.source = self.source;
        level.c130successfulairdrops[level.c130successfulairdrops.size] = crate;
        triggerobject = scripts/cp_mp/killstreaks/airdrop::gettriggerobject(crate);
        triggerobject.usetimeoverride = getcrateusetime();
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11fd
// Size: 0xcd
function watchoverheat(juggconfig) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    heatlimit = juggconfig.overheatlimit;
    heatcooldown = juggconfig.overheatcooldown;
    juggconfig.heatcounter = 0;
    while (true) {
        self waittill("weapon_fired");
        juggconfig.heatcounter++;
        juggconfig.lastheatupdate = gettime();
        if (juggconfig.heatcounter >= heatlimit) {
            iprintlnbold("OVERHEAT");
            val::set("overheat_cooldown", "fire", 0);
            wait(heatcooldown);
            iprintlnbold("COOLDOWN");
            val::reset_all("overheat_cooldown");
        }
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0xcf
function watchheatreduction(juggconfig) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    var_259c36b6504ea39 = juggconfig.overheatreductiontime;
    var_bdce3f3a4859b442 = juggconfig.overheatreductionrate;
    var_d04ff08506ede63c = juggconfig.overheatreductionamount;
    while (true) {
        if (juggconfig.heatcounter > 0 && gettime() - juggconfig.lastheatupdate >= var_259c36b6504ea39 * 1000) {
            var_f8f916a03affa77b = juggconfig.heatcounter - var_bdce3f3a4859b442;
            if (var_f8f916a03affa77b < 0) {
                var_f8f916a03affa77b = 0;
            }
            juggconfig.heatcounter = int(var_f8f916a03affa77b);
        }
        wait(0.05);
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a7
// Size: 0xcc
function mangagedeathsdoor(juggconfig) {
    self endon("death_or_disconnect");
    self endon("juggernaut_end");
    level endon("game_ended");
    var_37329a37ef4dd878 = 5;
    while (true) {
        result = waittill_any_return_2("deaths_door_enter", "jugg_health_regen");
        healed = 1;
        if (result == "deaths_door_enter") {
            healed = 0;
            self.ignoredeathsdoor = 1;
            wait(var_37329a37ef4dd878);
        } else if (result == "jugg_health_regen") {
            healthratio = self.health / self.maxhealth;
            if (healthratio >= 0.75) {
                if (istrue(self.ignoredeathsdoor)) {
                    self.ignoredeathsdoor = undefined;
                }
            }
        }
        namespace_4887422e77f3514e::onexitdeathsdoor(healed);
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147a
// Size: 0x23
function droponplayerdeath(dropstruct) {
    scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onJuggDropOnDeath", dropstruct);
    level.numactivejuggdrops--;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14a4
// Size: 0x108
function dropjuggbox() {
    contentoverride = create_contents(0, 1, 1, 1, 0, 0, 1, 1, 1);
    groundtrace = ray_trace(self.origin + (0, 0, 40), self.origin - (0, 0, 10000), self, contentoverride);
    dropposition = self.origin;
    if (isdefined(groundtrace) && isdefined(groundtrace["hittype"]) && groundtrace["hittype"] != "hittype_none") {
        dropposition = groundtrace["position"];
    }
    crate = scripts/cp_mp/killstreaks/airdrop::dropbrc130airdropcrate(self.origin + (0, 0, 10), dropposition, self.angles, "battle_royale_juggernaut", "jugg_world");
    if (isdefined(crate)) {
        triggerobject = scripts/cp_mp/killstreaks/airdrop::gettriggerobject(crate);
        triggerobject.usetimeoverride = getcrateusetime();
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b3
// Size: 0x2e
function oncrateactivate(var_d9bc1b05d016a86f) {
    scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onJuggCrateActivate", var_d9bc1b05d016a86f);
    if (istrue(var_d9bc1b05d016a86f)) {
        thread watchcratetimeout();
        thread watchcrategastimeout();
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e8
// Size: 0x2f
function watchcratetimeout() {
    self endon("death");
    cratetimeout = getdvarint(@"hash_4b258e12bbf733e3", 300);
    wait(cratetimeout);
    scripts/cp_mp/killstreaks/airdrop::destroycrate();
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161e
// Size: 0xaf
function watchcrategastimeout() {
    self endon("death");
    if (istrue(level.br_circle_disabled)) {
        return;
    }
    var_798752cafeb221ec = getdvarint(@"hash_14531681ab16f185", 30);
    while (true) {
        wait(0.05);
        if (!isdefined(level.br_circle) || level.br_circle.circleindex < 0) {
            continue;
        }
        var_819edacdacb810e4 = scripts/mp/gametypes/br_circle::getdangercircleorigin();
        dangercircleradius = scripts/mp/gametypes/br_circle::getdangercircleradius();
        if (distance2dsquared(var_819edacdacb810e4, self.origin) > dangercircleradius * dangercircleradius) {
            break;
        }
    }
    wait(var_798752cafeb221ec);
    scripts/cp_mp/killstreaks/airdrop::destroycrate();
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d4
// Size: 0x3d
function oncrateuse(player) {
    player.jugg_source = self.source;
    scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onJuggCrateUse", player);
    notifycapturetoplayers(player);
    cratecleanup();
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1718
// Size: 0xd8
function notifycapturetoplayers(owner) {
    notifyorigin = self.origin;
    notifyrange = 5000;
    playersinrange = utility::playersincylinder(notifyorigin, notifyrange);
    foreach (player in playersinrange) {
        if (isdefined(player) && isreallyalive(player) && player != owner) {
            soundtoplay = "br_jugg_capture_positive";
            if (player.team != owner.team) {
                soundtoplay = "br_jugg_capture_negative";
            }
            player playlocalsound(soundtoplay);
        }
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f7
// Size: 0x2a
function oncratedestroy(immediate) {
    scripts/mp/gametypes/br_gametypes::runbrgametypefunc("onJuggCrateDestroy", immediate);
    level.numactivejuggdrops--;
    cratecleanup();
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1828
// Size: 0xae
function cratecleanup() {
    if (isdefined(self.dropcircle)) {
        self.dropcircle.occupied = 0;
        self.dropcircle function_af5604ce591768e1();
        if (isdefined(self.dropcircle.beacon)) {
            self.dropcircle.beacon setscriptablepartstate("jugg_drop_beacon", "off");
            self.dropcircle.beacon delete();
        }
    }
    if (isdefined(level.c130successfulairdrops)) {
        level.c130successfulairdrops = array_remove(level.c130successfulairdrops, self);
    }
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x18dd
// Size: 0x6b
function init_br_jugg_setting(name, value, source) {
    if (!isdefined(source)) {
        source = "default";
    }
    if (!isdefined(level.brjuggsettings[source])) {
        level.brjuggsettings[source] = [];
    }
    /#
        assert(!isdefined(level.brjuggsettings[source][name]));
    #/
    level.brjuggsettings[source][name] = value;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x194f
// Size: 0x67
function get_br_jugg_setting(name, source) {
    value = undefined;
    if (isdefined(source)) {
        if (isdefined(level.brjuggsettings[source])) {
            value = level.brjuggsettings[source][name];
        }
    }
    if (!isdefined(value)) {
        value = level.brjuggsettings["default"][name];
    }
    /#
        assert(isdefined(value));
    #/
    return value;
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19be
// Size: 0x13
function getcrateusetime() {
    return getdvarfloat(@"hash_4c96c13074cf77e5", 5);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d9
// Size: 0x13
function getnumdrops() {
    return getdvarint(@"hash_8e428a709dd8f019", 3);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f4
// Size: 0x16
function getjuggdamagescale() {
    return getdvarfloat(@"hash_90fb266842b5bc2a", 1);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a12
// Size: 0x16
function getminigundamagescale() {
    return getdvarfloat(@"hash_a9e8e75fb57047aa", 1.25);
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a30
// Size: 0xeb
function function_59ed9e94de8f9c42() {
    /#
        level endon("<unknown string>");
        while (true) {
            var_eccdd5494d666edf = getdvarint(@"hash_656b5e056fdbf096", 0);
            if (!var_eccdd5494d666edf) {
                waitframe();
                continue;
            }
            var_fdfc755d4aa965c6 = getnumdrops();
            if (level.mapname == "<unknown string>") {
                var_fdfc755d4aa965c6 = 1;
            }
            dropcircles = showdroplocations(var_fdfc755d4aa965c6);
            showsplashtoall("<unknown string>");
            foreach (drop in dropcircles) {
                level thread dropdeliveryatpos(drop);
                wait(randomfloatrange(5, 10));
            }
            setdvar(@"hash_656b5e056fdbf096", 0);
        }
    #/
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b22
// Size: 0x287
function function_fdcc5bb7ff13a7d1() {
    /#
        level endon("<unknown string>");
        while (true) {
            var_eccdd5494d666edf = getdvarint(@"hash_3372053939d80fa4", 0);
            if (!var_eccdd5494d666edf) {
                waitframe();
                continue;
            }
            firstplayer = undefined;
            foreach (player in level.players) {
                if (isreallyalive(player)) {
                    firstplayer = player;
                    break;
                }
            }
            dropcircle = undefined;
            starttrace = firstplayer.origin + (0, 0, 10000);
            endtrace = firstplayer.origin - (0, 0, 20000);
            contents = scripts/engine/trace::create_contents(0, 1, 1, 1, 0, 0, 1, 1, 1);
            trace = scripts/engine/trace::ray_trace(starttrace, endtrace, firstplayer, contents);
            if (isdefined(trace) && trace["<unknown string>"] != "<unknown string>") {
                dropcircle = scripts/mp/gametypes/br_jugg_common::createjuggdroplocation(trace["<unknown string>"]);
                dropcircle.beacon = spawn("<unknown string>", dropcircle.origin);
                dropcircle.beacon setmodel("<unknown string>");
                dropcircle.beacon setscriptablepartstate("<unknown string>", "<unknown string>", 0);
                dropcircle function_6b6b6273f8180522("<unknown string>", dropcircle.origin, 5000);
                dropcircle function_6988310081de7b45();
            }
            if (isdefined(dropcircle)) {
                crate = scripts/cp_mp/killstreaks/airdrop::dropbrc130airdropcrate(dropcircle.origin + (0, 0, 5000), dropcircle.origin, (0, 0, 0), "<unknown string>", "<unknown string>");
                if (isdefined(crate)) {
                    crate.dropcircle = dropcircle;
                    level.c130successfulairdrops[level.c130successfulairdrops.size] = crate;
                    triggerobject = scripts/cp_mp/killstreaks/airdrop::gettriggerobject(crate);
                    triggerobject.usetimeoverride = scripts/mp/gametypes/br_jugg_common::getcrateusetime();
                }
            } else {
                iprintlnbold("<unknown string>");
            }
            setdvar(@"hash_3372053939d80fa4", 0);
        }
    #/
}

// Namespace br_jugg_common / scripts/mp/gametypes/br_jugg_common
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1db0
// Size: 0x7b
function function_3f3aa9ee24737fd3(player) {
    /#
        level endon("<unknown string>");
        usingparachute = 0;
        while (true) {
            toggleparachute = getdvarint(@"hash_d4b2c13dead25aac", 0);
            if (!toggleparachute) {
                waitframe();
                continue;
            }
            if (!istrue(usingparachute)) {
                usingparachute = 1;
            } else {
                usingparachute = 0;
            }
            player skydive_setdeploymentstatus(usingparachute);
            player skydive_setbasejumpingstatus(usingparachute);
            setdvar(@"hash_d4b2c13dead25aac", 0);
        }
    #/
}

