// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\engine\trace.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using script_608c50392df8c7d1;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_736dec95a49487a6;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\vehicles\vehicle_mines.gsc;

#namespace ims;

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4ea
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("ims"), &init);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50a
// Size: 0x118
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("ims", &function_81c2d38662659380);
    }
    scripts/engine/utility::registersharedfunc("ims", "tryUseKillstreak", &function_81c2d38662659380);
    scripts/engine/utility::registersharedfunc("ims", "ims_onHacked", &ims_onHacked);
    bundle = level.streakglobals.streakbundles["ims"];
    if (isdefined(bundle) && isdefined(bundle.var_b081bae2811785e4)) {
        function_a41e3a211a9e37a4("ims", bundle.deployweapon, #"hash_b76b2215370d2700");
        function_a41e3a211a9e37a4("ims", bundle.spawnweapon, #"hash_b76b2215370d2700");
        function_a41e3a211a9e37a4("ims", bundle.var_b081bae2811785e4, #"hash_b76b2215370d2700");
        function_a41e3a211a9e37a4("ims", bundle.var_d5103347b49b5137, #"large");
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x629
// Size: 0x16a
function function_81c2d38662659380(streakinfo) {
    if (!isdefined(streakinfo)) {
        streakinfo = createstreakinfo("ims", self);
    }
    bundle = level.streakglobals.streakbundles["ims"];
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    var_b21b330507802512 = function_656b1df2883cb84a(streakinfo, bundle);
    if (!isdefined(var_b21b330507802512)) {
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    level.mines[var_b21b330507802512 getentitynumber()] = var_b21b330507802512;
    var_b21b330507802512 function_5135b43ac04db778(streakinfo);
    var_b21b330507802512 thread killstreak_watchpickup(streakinfo, &function_d63b6e34009bc400);
    var_b21b330507802512 thread function_18649ada89b35500(streakinfo);
    var_b21b330507802512 namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_4eb4ab5799798bd);
    var_b21b330507802512 namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_fac556ff047c5d0c);
    var_b21b330507802512 scripts/cp_mp/emp_debuff::set_apply_emp_callback(&function_f48d50b96e53d41e);
    var_b21b330507802512 scripts/cp_mp/emp_debuff::set_clear_emp_callback(&function_5911b997c2c053cf);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        var_b21b330507802512 [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_f48d50b96e53d41e);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        var_b21b330507802512 [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_5911b997c2c053cf);
    }
    self notify("munitions_used", "ims");
    return true;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b
// Size: 0x85
function function_656b1df2883cb84a(streakinfo, bundle) {
    self endon("death");
    self endon("disconnect");
    deployweapon = makeweapon(bundle.deployweapon);
    deployresult = streakdeploy_doweaponswitchdeploy(streakinfo, deployweapon, 1, undefined, undefined, &function_ef9490796efaf574);
    if (!istrue(deployresult)) {
        return undefined;
    }
    function_971c6cea76ead114(1);
    placedgrenade = ims_place(streakinfo, bundle);
    function_971c6cea76ead114(0);
    return placedgrenade;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x828
// Size: 0x6c
function function_971c6cea76ead114(var_5c911c4e7ce59792) {
    if (_isalive()) {
        if (var_5c911c4e7ce59792) {
            val::set_array("lrad_placement", ["sprint", "weapon_switch", "offhand_weapons", "melee", "execution_attack", "ladder_placement"], 0);
            return;
        }
        val::reset_all("lrad_placement");
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89b
// Size: 0x95
function ims_place(streakinfo, bundle) {
    marker = function_6aa895b8483b9b10(streakinfo, bundle.deployweapon, 0, 1, 0.25, 0.8, &function_77e8d3375efabf15);
    placedgrenade = undefined;
    if (isdefined(marker)) {
        placedgrenade = function_e5d40d48c1ebae3e(marker, bundle);
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](placedgrenade.owner, "ims");
        }
    }
    return placedgrenade;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x938
// Size: 0x19a
function function_77e8d3375efabf15(markerinfo) {
    bundle = level.streakglobals.streakbundles["ims"];
    verticaloffset = getdvarfloat(@"hash_f4da9af39e4b013e", 30);
    markerpos = markerinfo.location + (0, 0, verticaloffset);
    maxheight = getdvarfloat(@"hash_c4ea2188934a7074", bundle.var_ddc0fa239714c263) - verticaloffset;
    minheight = getdvarfloat(@"hash_4f29060321502b96", bundle.var_6425d998181ae311) - verticaloffset;
    radius = getdvarfloat(@"hash_26d52d1f90cea54c", 15);
    ishit = 0;
    for (i = 0; i < 3; i++) {
        lerpval = (2 - i) / 2;
        height = math::lerp(minheight, maxheight, lerpval);
        ishit = physics_spherecast(markerpos, markerpos + (0, 0, height), radius, function_2c64943762efc5b3(), [self], "physicsquery_any");
        if (!ishit) {
            markerinfo.var_e91c2cea91022dd7 = markerpos[2] + height - getdvarfloat(@"hash_46238b5b95d2b806", 10);
            break;
        }
    }
    if (ishit && issharedfuncdefined("hud", "showErrorMessage")) {
        self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_PLACED_VERTICAL");
    }
    return ishit;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xada
// Size: 0x1a8
function function_e5d40d48c1ebae3e(marker, bundle, placedgrenade) {
    if (!isdefined(placedgrenade)) {
        placedgrenade = self launchgrenade(bundle.spawnweapon, marker.location + (0, 0, 5), (0, 0, 0));
    } else {
        placedgrenade.origin = marker.location + (0, 0, 5);
    }
    placedgrenade.angles = self.angles;
    placedgrenade.team = self.team;
    placedgrenade.owner = self;
    placedgrenade.bundle = bundle;
    placedgrenade.var_e91c2cea91022dd7 = marker.var_e91c2cea91022dd7;
    placedgrenade function_5226227bce83ebe9(3, placedgrenade.team);
    placedgrenade setscriptablepartstate("main", "active");
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        placedgrenade [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]]("ims", "Killstreak_Ground", self, 0, 1, 20, "picked_up");
    }
    placedgrenade function_36c90c54c1002132(self, "tag_fx", "KILLSTREAKS_HINTS/IMS_USE");
    if (issharedfuncdefined("game", "createObjective")) {
        placedgrenade.minimapid = placedgrenade [[ getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_sentry", placedgrenade.team, 1, 1, 1);
    }
    placedgrenade.var_7b74576b3641cd0e = 1;
    return placedgrenade;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8a
// Size: 0xf5
function function_d63b6e34009bc400(var_b21b330507802512, streakinfo) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_b21b330507802512 function_2eff4cd94c3243e8();
    var_b21b330507802512 setscriptablepartstate("main", "picked_up");
    var_b21b330507802512.var_7b74576b3641cd0e = 0;
    var_b21b330507802512 notify("picked_up");
    saveweaponstates();
    _giveweapon(var_b21b330507802512.bundle.deployweapon);
    _switchtoweapon(var_b21b330507802512.bundle.deployweapon);
    function_971c6cea76ead114(1);
    marker = function_6aa895b8483b9b10(streakinfo, var_b21b330507802512.bundle.deployweapon, 1, 1, 0.25, 0.8, &function_77e8d3375efabf15);
    function_971c6cea76ead114(0);
    if (!isdefined(marker)) {
        return 0;
    }
    function_e5d40d48c1ebae3e(marker, var_b21b330507802512.bundle, var_b21b330507802512);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd86
// Size: 0xb1
function function_5135b43ac04db778(streakinfo) {
    if (issharedfuncdefined("damage", "onKillstreakKilled")) {
        function_9469d528dd1ee44d("ims", "destroyed_ims", "destroyed_ims", "callout_destroyed_ims");
    }
    if (issharedfuncdefined("damage", "monitorDamage")) {
        maxhealth = getdvarfloat(@"hash_b222a9d8ac2c3cca", self.bundle.maxhealth);
        self thread [[ getsharedfunc("damage", "monitorDamage") ]](maxhealth, "hitequip", &function_66a7440055d386c3, &function_e8455a055dd3291e, 0);
    }
    function_63d1a11f8b22244(streakinfo, &function_1289945a339f4036, &ims_destroy);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3e
// Size: 0xb9
function function_e8455a055dd3291e(data) {
    if (isdefined(data.objweapon) && data.objweapon.basename == self.bundle.var_d5103347b49b5137) {
        return 0;
    }
    modifieddamage = function_7bdb3610d602438d(data);
    newhealth = self.health - modifieddamage;
    percentage = newhealth / self.maxhealth;
    if (percentage <= 0.5 && self getscriptablepartstate("damaged") == "not_damaged") {
        self setscriptablepartstate("damaged", "damaged");
    }
    return modifieddamage;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeff
// Size: 0x78
function function_1289945a339f4036(callbackparams) {
    meansofdeath = callbackparams.meansofdeath;
    if (isdefined(self.useownerobj)) {
        self.useownerobj function_dfb78b3e724ad620(0);
    }
    if (self.chargesleft == 0) {
        self setscriptablepartstate("explode", "regular");
    } else {
        self setscriptablepartstate("explode", "violent");
    }
    wait(0.2);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7e
// Size: 0x4b
function ims_destroy(delaytime) {
    if (isdefined(delaytime)) {
        wait(delaytime);
    }
    level.mines[self getentitynumber()] = undefined;
    if (isdefined(self.useownerobj)) {
        self.useownerobj delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfd0
// Size: 0x51
function private function_2c64943762efc5b3(var_872d2e62cee02ee4) {
    var_5877436cc451fa7d = ["physicscontents_missileclip", "physicscontents_clipshot", "physicscontents_glass"];
    if (isdefined(var_872d2e62cee02ee4) && var_872d2e62cee02ee4) {
        var_5877436cc451fa7d = array_add(var_5877436cc451fa7d, "physicscontents_characterproxy");
    }
    return physics_createcontents(var_5877436cc451fa7d);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1029
// Size: 0x2a0
function function_18649ada89b35500(streakinfo) {
    self endon("death");
    level endon("game_ended");
    var_80a4c3c82be14d8b = ["j_disc_01", "j_disc_02", "j_disc_03", "j_disc_04"];
    self.chargesleft = 4;
    self.var_d760c7b4630c623d = [];
    var_c2eff716d026f5b9 = 0;
    /#
        var_c2eff716d026f5b9 = getdvarint(@"hash_9fbc814198194d10", 0) == 1;
    #/
    while (self.chargesleft > 0 || var_c2eff716d026f5b9) {
        entarr = self waittill("trigger_grenade");
        if (!self.var_7b74576b3641cd0e) {
            continue;
        }
        /#
            assert(isdefined(entarr));
        #/
        foreach (ent in entarr) {
            entitynumber = ent getentitynumber();
            if (ent.classname == "script_vehicle") {
                if (ent function_7301c72ad9f3a95b(self)) {
                    continue;
                }
            }
            if ((isagent(ent) || isplayer(ent)) && !array_contains(self.var_d760c7b4630c623d, entitynumber)) {
                if (ent function_a139d7d429ed5794()) {
                    continue;
                }
                chargeindex = (4 - self.chargesleft) % 4;
                up = (0, 0, 1);
                chargestartpos = self gettagorigin(var_80a4c3c82be14d8b[chargeindex]) + up * 10;
                targetpos = ent.origin + (0, 0, getdvarfloat(@"hash_e08464464d929411", self.bundle.var_e331ff54ff2cd850));
                var_bcf224d10d5a475a = (chargestartpos[0], chargestartpos[1], self.var_e91c2cea91022dd7);
                castresults = physics_raycast(var_bcf224d10d5a475a, targetpos, function_2c64943762efc5b3(), [], 0, "physicsquery_closest", 1);
                if (isdefined(castresults) && castresults.size > 0) {
                    continue;
                }
                self.var_d760c7b4630c623d = array_add(self.var_d760c7b4630c623d, entitynumber);
                self.chargesleft--;
                thread function_bad0139fc2b1a50a(streakinfo, ent, 1, chargeindex, chargestartpos, var_bcf224d10d5a475a);
                if (self.chargesleft == 0 && !var_c2eff716d026f5b9) {
                    function_ed3cf13f3ab6b459();
                }
                break;
            }
        }
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d0
// Size: 0x3a
function function_ed3cf13f3ab6b459() {
    self.selfdestructing = 1;
    if (isdefined(self.useownerobj)) {
        self.useownerobj function_dfb78b3e724ad620(0);
    }
    wait(3);
    callback::callback("on_functional_death");
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1311
// Size: 0x28
function function_7301c72ad9f3a95b(grenade) {
    if (scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_isfriendlytomine(grenade)) {
        return true;
    }
    if (!scripts/cp_mp/vehicles/vehicle_mines::vehicle_mines_shouldvehicletriggermine(self, grenade)) {
        return true;
    }
    return false;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1341
// Size: 0x6a
function function_a139d7d429ed5794() {
    if (!isplayer(self) && !isagent(self)) {
        return true;
    }
    if (isdefined(self.vehicle)) {
        return true;
    }
    if (!isreallyalive(self)) {
        return true;
    }
    if (issharedfuncdefined("perk", "hasPerk") && self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_blindeye")) {
        return true;
    }
    return false;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b3
// Size: 0x226
function function_bad0139fc2b1a50a(streakinfo, target, targetisplayer, chargeindex, chargestartpos, var_bcf224d10d5a475a) {
    level endon("game_ended");
    bundle = self.bundle;
    owner = self.owner;
    targetstruct = target function_644649e9a1a7cbd5(bundle);
    if (isdefined(target) && targetisplayer && issharedfuncdefined("perk", "hasPerk") && target [[ getsharedfunc("perk", "hasPerk") ]]("specialty_delaymine")) {
        wait(level.delayminetime);
    }
    self setscriptablepartstate("charge_" + chargeindex, "used");
    /#
        assert(isdefined(bundle.var_b081bae2811785e4));
    #/
    var_8dbdaa141f4b9787 = getdvarfloat(@"hash_d2d758f71d991a51", bundle.var_da265e5e2b97837e);
    gravity = (0, 0, getdvarfloat(@"hash_a55083bd04392924", bundle.var_fb30ab192f5c9944));
    charge = owner launchgrenade(bundle.var_b081bae2811785e4, chargestartpos, (0, 0, 0), var_8dbdaa141f4b9787);
    charge.streakinfo = streakinfo;
    charge thread function_a7717005df7f9bfe(owner, chargestartpos, var_bcf224d10d5a475a, var_8dbdaa141f4b9787, gravity);
    explodepos = charge waittill("explode");
    timetotarget = getdvarfloat(@"hash_db9763666846c7b2", bundle.var_be7e2889fb89c2d);
    gravity = (0, 0, getdvarint(@"hash_b5d7d39d32720e78") * -1);
    velocity = trajectorycalculateinitialvelocity(explodepos, targetstruct function_cf9631cd88628853(), gravity, timetotarget);
    explosive = owner launchgrenade(bundle.var_d5103347b49b5137, explodepos, velocity, timetotarget);
    explosive thread function_ee6f840d2c3768a0(bundle, owner, targetstruct);
    explosive thread function_8c3c6c363d29a4d1(self, targetstruct, chargeindex);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e0
// Size: 0x14e
function function_a7717005df7f9bfe(owner, startpos, endpos, timetotarget, gravity) {
    level endon("game_ended");
    self endon("explode");
    velocity = trajectorycalculateinitialvelocity(startpos, endpos, gravity, timetotarget);
    newposition = startpos;
    previoustime = gettime();
    collisioncontents = function_2c64943762efc5b3(1);
    while (true) {
        throwngrenade = owner waittill("grenade_thrown");
        if (throwngrenade == self) {
            break;
        }
    }
    while (true) {
        deltatime = (gettime() - previoustime) / 1000;
        previoustime = gettime();
        velocity = velocity + gravity * deltatime;
        newposition = newposition + velocity * deltatime;
        self.origin = newposition;
        var_e3ab46d4e385e1a1 = getdvarfloat(@"hash_bbe98d05a761d42", 20);
        raycastend = newposition + var_e3ab46d4e385e1a1 * (0, 0, 1);
        ishit = physics_raycast(newposition, raycastend, collisioncontents, [], 0, "physicsquery_any");
        if (ishit) {
            self detonate();
            break;
        }
        waitframe();
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1735
// Size: 0x82
function function_644649e9a1a7cbd5(bundle) {
    targetstruct = spawnstruct();
    targetstruct.entity = self;
    targetstruct.originalpos = self.origin;
    targetstruct.entitynumber = self getentitynumber();
    targetstruct.targetverticaloffset = (0, 0, getdvarfloat(@"hash_e08464464d929411", bundle.var_e331ff54ff2cd850));
    targetstruct childthread function_fb4f0e1e2c6baa4d();
    return targetstruct;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17bf
// Size: 0x53
function function_fb4f0e1e2c6baa4d() {
    self endon("stop_watching");
    if (self.entity.classname == "script_vehicle") {
        self.entity waittill("death");
    } else {
        self.entity waittill("death_or_disconnect");
    }
    self.entity = undefined;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1819
// Size: 0x47
function function_cf9631cd88628853() {
    if (isdefined(self.entity)) {
        targetorigin = self.entity.origin;
    } else {
        targetorigin = self.originalpos;
    }
    return targetorigin + self.targetverticaloffset;
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1868
// Size: 0xbd
function function_ee6f840d2c3768a0(bundle, owner, targetstruct) {
    level endon("game_ended");
    self endon("explode");
    while (true) {
        throwngrenade = owner waittill("grenade_thrown");
        if (throwngrenade == self) {
            break;
        }
    }
    maxdistancesquared = squared(getdvarfloat(@"hash_ce278dab5476cc61", bundle.var_8fa13aa5f07d036b));
    while (true) {
        targetposition = targetstruct function_cf9631cd88628853();
        distancesquared = distancesquared(self.origin, targetposition);
        if (distancesquared <= maxdistancesquared) {
            break;
        }
        waitframe();
    }
    self detonate(owner);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x192c
// Size: 0x96
function function_8c3c6c363d29a4d1(var_b21b330507802512, targetstruct, chargeindex) {
    level endon("game_ended");
    org = self waittill("explode");
    if (isdefined(var_b21b330507802512)) {
        var_b21b330507802512.var_d760c7b4630c623d = array_remove(var_b21b330507802512.var_d760c7b4630c623d, targetstruct.entitynumber);
        targetstruct notify("stop_watching");
        /#
            if (getdvarint(@"hash_9fbc814198194d10", 0) == 1) {
                var_b21b330507802512 setscriptablepartstate("Killstreak_Ground" + chargeindex, "onKillstreakKilled");
            }
        #/
    }
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c9
// Size: 0x8d
function function_ee16e883a9e4d919(isactive, var_e817b0ad69ffec4c) {
    if (self.var_7b74576b3641cd0e == isactive) {
        return;
    }
    self.var_7b74576b3641cd0e = isactive;
    if (isactive) {
        scriptablestate = "active";
    } else {
        scriptablestate = "inactive";
        if (isdefined(var_e817b0ad69ffec4c) && scripts/engine/utility::issharedfuncdefined("player", "doScoreEvent")) {
            var_e817b0ad69ffec4c thread [[ scripts/engine/utility::getsharedfunc("player", "doScoreEvent") ]]("disabled_ims");
        }
    }
    self setscriptablepartstate("main", scriptablestate, 1);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5d
// Size: 0x1f
function function_4eb4ab5799798bd(data) {
    function_ee16e883a9e4d919(0, data.attacker);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a83
// Size: 0x15
function function_fac556ff047c5d0c(data) {
    function_ee16e883a9e4d919(1);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9f
// Size: 0x1f
function function_f48d50b96e53d41e(data) {
    function_ee16e883a9e4d919(0, data.attacker);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac5
// Size: 0x15
function function_5911b997c2c053cf(data) {
    function_ee16e883a9e4d919(1);
}

// Namespace ims / namespace_ff6ed0238d12364f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae1
// Size: 0x72
function ims_onHacked(newowner, oldowner) {
    function_36c90c54c1002132(newowner, "tag_fx", "KILLSTREAKS_HINTS/IMS_USE");
    function_2eff4cd94c3243e8();
    if (issharedfuncdefined("game", "createObjective")) {
        self.minimapid = self [[ getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_sentry", newowner.team, 1, 1, 1);
    }
}

